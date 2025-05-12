Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BA25C3ABDA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 18:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bQlf1tDhoD0lEv7ac448Vchk9e2NFNJVNqEyXL7MXuw=; b=yRnjOpePKZ1o3u
	Rfah6ecx3Dmv5OqWMS9lldFfv0u/DLNdV/3n654yQ9pKv4hVqpcJ4OfN8tpYnQ92N0tiQJcQoaItt
	THaH3LsyWE7mZIfiinqMEMq4rkPXYrrmvvWvztYQi6ZdF85UfXPqaA/z1NmaUSzB43SdT1YI2Sjz5
	ieGYe9+IelEhfFR8FX6fcnrKg18sYmOy1NN5zSJalhL+7/8UK4NgunP165c2L3Z6pIDYAhVRW4mem
	vylR/h++C8FHyGKGe4Oe5LtMdF1kZ4fRk7P4YcrrKD1Ha0j54qHTsopAY/zHlf6sQkBrI4eRn7gDA
	iolJSruZMqFkOE0uzB0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEXZw-0000000AICD-0BmE;
	Mon, 12 May 2025 18:08:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEXC6-0000000AFCT-22qw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 17:44:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1616928C7;
	Mon, 12 May 2025 10:43:51 -0700 (PDT)
Received: from e137867.cambridge.arm.com (e137867.arm.com [10.1.32.174])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AD9763F673;
	Mon, 12 May 2025 10:44:00 -0700 (PDT)
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 08/11] arm64: debug: split hardware watchpoint exception entry
Date: Mon, 12 May 2025 18:43:23 +0100
Message-ID: <20250512174326.133905-9-ada.coupriediaz@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250512174326.133905-1-ada.coupriediaz@arm.com>
References: <20250512174326.133905-1-ada.coupriediaz@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_104402_615438_BF0A82EA 
X-CRM114-Status: GOOD (  14.64  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Will Deacon <will@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Currently all debug exceptions share common entry code and are routed
to `do_debug_exception()`, which calls dynamically-registered
handlers for each specific debug exception. This is unfortunate as
different debug exceptions have different entry handling requirements,
and it would be better to handle these distinct requirements earlier.

Hardware watchpoints are the only debug exceptions that will write
FAR_EL1, so we need to preserve it and pass it down.
However, they cannot be used to maliciously train branch predictors, so
we can omit calling `arm64_bp_hardening()`, nor do they need to handle
the Cortex-A76 erratum #1463225, as it only applies to single stepping
exceptions.

Split the hardware watchpoint exception entry and adjust the behaviour
to match the lack of needed mitigations.

Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
---
 arch/arm64/include/asm/exception.h |  2 ++
 arch/arm64/kernel/entry-common.c   | 31 +++++++++++++++++++++++++++++-
 arch/arm64/kernel/hw_breakpoint.c  | 14 ++++++++++----
 3 files changed, 42 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/include/asm/exception.h b/arch/arm64/include/asm/exception.h
index cbcd832bf58e..eb465c375d34 100644
--- a/arch/arm64/include/asm/exception.h
+++ b/arch/arm64/include/asm/exception.h
@@ -63,6 +63,8 @@ void do_debug_exception(unsigned long addr_if_watchpoint, unsigned long esr,
 			struct pt_regs *regs);
 void do_breakpoint(unsigned long esr, struct pt_regs *regs);
 void do_softstep(unsigned long esr, struct pt_regs *regs);
+void do_watchpoint(unsigned long addr, unsigned long esr,
+			struct pt_regs *regs);
 void do_fpsimd_acc(unsigned long esr, struct pt_regs *regs);
 void do_sve_acc(unsigned long esr, struct pt_regs *regs);
 void do_sme_acc(unsigned long esr, struct pt_regs *regs);
diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
index 8814ad24e707..6e70130d2741 100644
--- a/arch/arm64/kernel/entry-common.c
+++ b/arch/arm64/kernel/entry-common.c
@@ -530,10 +530,20 @@ static void noinstr el1_softstp(struct pt_regs *regs, unsigned long esr)
 	arm64_exit_el1_dbg(regs);
 }
 
-static void noinstr el1_dbg(struct pt_regs *regs, unsigned long esr)
+static void noinstr el1_watchpt(struct pt_regs *regs, unsigned long esr)
 {
+	/* Only watchpoints write FAR_EL1 */
 	unsigned long far = read_sysreg(far_el1);
 
+	arm64_enter_el1_dbg(regs);
+	debug_exception_enter(regs);
+	do_watchpoint(far, esr, regs);
+	debug_exception_exit(regs);
+	arm64_exit_el1_dbg(regs);
+}
+
+static void noinstr el1_dbg(struct pt_regs *regs, unsigned long esr)
+{
 	arm64_enter_el1_dbg(regs);
 	if (!cortex_a76_erratum_1463225_debug_handler(regs))
 		do_debug_exception(far, esr, regs);
@@ -585,6 +595,8 @@ asmlinkage void noinstr el1h_64_sync_handler(struct pt_regs *regs)
 		el1_softstp(regs, esr);
 		break;
 	case ESR_ELx_EC_WATCHPT_CUR:
+		el1_watchpt(regs, esr);
+		break;
 	case ESR_ELx_EC_BRK64:
 		el1_dbg(regs, esr);
 		break;
@@ -809,6 +821,19 @@ static void noinstr el0_softstp(struct pt_regs *regs, unsigned long esr)
 	exit_to_user_mode(regs);
 }
 
+static void noinstr el0_watchpt(struct pt_regs *regs, unsigned long esr)
+{
+	/* Only watchpoints write FAR_EL1 */
+	unsigned long far = read_sysreg(far_el1);
+
+	enter_from_user_mode(regs);
+	debug_exception_enter(regs);
+	do_watchpoint(far, esr, regs);
+	debug_exception_exit(regs);
+	local_daif_restore(DAIF_PROCCTX);
+	exit_to_user_mode(regs);
+}
+
 static void noinstr el0_dbg(struct pt_regs *regs, unsigned long esr)
 {
 	/* Only watchpoints write FAR_EL1, otherwise its UNKNOWN */
@@ -893,6 +918,8 @@ asmlinkage void noinstr el0t_64_sync_handler(struct pt_regs *regs)
 		el0_softstp(regs, esr);
 		break;
 	case ESR_ELx_EC_WATCHPT_LOW:
+		el0_watchpt(regs, esr);
+		break;
 	case ESR_ELx_EC_BRK64:
 		el0_dbg(regs, esr);
 		break;
@@ -1017,6 +1044,8 @@ asmlinkage void noinstr el0t_32_sync_handler(struct pt_regs *regs)
 		el0_softstp(regs, esr);
 		break;
 	case ESR_ELx_EC_WATCHPT_LOW:
+		el0_watchpt(regs, esr);
+		break;
 	case ESR_ELx_EC_BKPT32:
 		el0_dbg(regs, esr);
 		break;
diff --git a/arch/arm64/kernel/hw_breakpoint.c b/arch/arm64/kernel/hw_breakpoint.c
index 1ab37d6561cb..f329ef0363e0 100644
--- a/arch/arm64/kernel/hw_breakpoint.c
+++ b/arch/arm64/kernel/hw_breakpoint.c
@@ -855,6 +855,16 @@ static int watchpoint_handler(unsigned long addr, unsigned long esr,
 }
 NOKPROBE_SYMBOL(watchpoint_handler);
 
+void do_watchpoint(unsigned long addr, unsigned long esr,
+	struct pt_regs *regs)
+{
+	if (watchpoint_handler(addr, esr, regs)) {
+		arm64_notify_die("hw-watchpoint handler", regs, SIGTRAP, TRAP_HWBKPT,
+					regs->pc, esr);
+	}
+}
+NOKPROBE_SYMBOL(do_watchpoint);
+
 /*
  * Handle single-step exception.
  */
@@ -996,10 +1006,6 @@ static int __init arch_hw_breakpoint_init(void)
 	pr_info("found %d breakpoint and %d watchpoint registers.\n",
 		core_num_brps, core_num_wrps);
 
-	/* Register debug fault handlers. */
-	hook_debug_fault_code(DBG_ESR_EVT_HWWP, watchpoint_handler, SIGTRAP,
-			      TRAP_HWBKPT, "hw-watchpoint handler");
-
 	/*
 	 * Reset the breakpoint resources. We assume that a halting
 	 * debugger will leave the world in a nice state for us.
-- 
2.43.0


