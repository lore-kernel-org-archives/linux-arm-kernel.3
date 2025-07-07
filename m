Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8C54C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 12:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y3VLBRI5P6tcu04eOGt3pYaHZrprDZlw7RrMZgIMYi8=; b=jKkp278gUJNZyA
	3I3dYKwfIApxr647VQdAoPULN2EDzGskPfo59v0YcZMAmbSvXRD9n+dT3he4cLj2p4KqsSkkF32GB
	eIYa36VRDFCBf8GGmp9ru+BjrHsLYzzHE/4GlFOsfZ9Azbc048CjqDejW1m5xkuf0DoYywvrWo970
	f/98xgbbOqbqHUT7Loc5KqSEvwnxF9gMcekFxbzsY3fe6KAl8zljJJdbJGT7mW75+o4wTvbvCZZQL
	W8lKY50ZF1f2nYShwNjEXoSp6wLG6FJJKsC2dsq4LtNDl5Nf8R6ZXNHld2BHNYGiJPhrLFJFP98oR
	lYH6MFlpmM7ak4RFf2CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYkzF-00000002QIo-0F9q;
	Mon, 07 Jul 2025 12:30:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYkEI-00000002JB6-1kkP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 11:41:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 02926168F;
	Mon,  7 Jul 2025 04:41:37 -0700 (PDT)
Received: from e137867.cambridge.arm.com (e137867.arm.com [10.1.31.174])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 02DFC3F694;
	Mon,  7 Jul 2025 04:41:47 -0700 (PDT)
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 10/13] arm64: debug: split hardware watchpoint exception entry
Date: Mon,  7 Jul 2025 12:41:06 +0100
Message-ID: <20250707114109.35672-11-ada.coupriediaz@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250707114109.35672-1-ada.coupriediaz@arm.com>
References: <20250707114109.35672-1-ada.coupriediaz@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_044150_545739_10786B41 
X-CRM114-Status: GOOD (  17.86  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Anshuman Khandual <anshuman.khandual@arm.com>, "Luis Claudio R . Goncalves" <lgoncalv@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
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

As the hardware watchpoint handler only returns 0 and never triggers
the call to `arm64_notify_die()`, we can call it directly from
`entry-common.c`.
Split the hardware watchpoint exception entry and adjust the behaviour
to match the lack of needed mitigations.

Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Tested-by: Luis Claudio R. Goncalves <lgoncalv@redhat.com>
Reviewed-by: Will Deacon <will@kernel.org>
Acked-by: Mark Rutland <mark.rutland@arm.com>
---
 arch/arm64/include/asm/exception.h |  4 ++++
 arch/arm64/kernel/entry-common.c   | 31 ++++++++++++++++++++++++++++++
 arch/arm64/kernel/hw_breakpoint.c  | 17 +++++-----------
 3 files changed, 40 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/include/asm/exception.h b/arch/arm64/include/asm/exception.h
index c8e7c61b8ac4..0362fecc5f69 100644
--- a/arch/arm64/include/asm/exception.h
+++ b/arch/arm64/include/asm/exception.h
@@ -63,8 +63,12 @@ void do_debug_exception(unsigned long addr_if_watchpoint, unsigned long esr,
 			struct pt_regs *regs);
 #ifdef CONFIG_HAVE_HW_BREAKPOINT
 void do_breakpoint(unsigned long esr, struct pt_regs *regs);
+void do_watchpoint(unsigned long addr, unsigned long esr,
+			struct pt_regs *regs);
 #else
 static inline void do_breakpoint(unsigned long esr, struct pt_regs *regs) {}
+static inline void do_watchpoint(unsigned long addr, unsigned long esr,
+			struct pt_regs *regs) {}
 #endif /* CONFIG_HAVE_HW_BREAKPOINT */
 void do_el0_softstep(unsigned long esr, struct pt_regs *regs);
 void do_el1_softstep(unsigned long esr, struct pt_regs *regs);
diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
index 7265bef96672..8a6d951c14cc 100644
--- a/arch/arm64/kernel/entry-common.c
+++ b/arch/arm64/kernel/entry-common.c
@@ -553,6 +553,18 @@ static void noinstr el1_softstp(struct pt_regs *regs, unsigned long esr)
 	arm64_exit_el1_dbg(regs);
 }
 
+static void noinstr el1_watchpt(struct pt_regs *regs, unsigned long esr)
+{
+	/* Watchpoints are the only debug exception to write FAR_EL1 */
+	unsigned long far = read_sysreg(far_el1);
+
+	arm64_enter_el1_dbg(regs);
+	debug_exception_enter(regs);
+	do_watchpoint(far, esr, regs);
+	debug_exception_exit(regs);
+	arm64_exit_el1_dbg(regs);
+}
+
 static void noinstr el1_dbg(struct pt_regs *regs, unsigned long esr)
 {
 	unsigned long far = read_sysreg(far_el1);
@@ -608,6 +620,8 @@ asmlinkage void noinstr el1h_64_sync_handler(struct pt_regs *regs)
 		el1_softstp(regs, esr);
 		break;
 	case ESR_ELx_EC_WATCHPT_CUR:
+		el1_watchpt(regs, esr);
+		break;
 	case ESR_ELx_EC_BRK64:
 		el1_dbg(regs, esr);
 		break;
@@ -832,6 +846,19 @@ static void noinstr el0_softstp(struct pt_regs *regs, unsigned long esr)
 	exit_to_user_mode(regs);
 }
 
+static void noinstr el0_watchpt(struct pt_regs *regs, unsigned long esr)
+{
+	/* Watchpoints are the only debug exception to write FAR_EL1 */
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
@@ -917,6 +944,8 @@ asmlinkage void noinstr el0t_64_sync_handler(struct pt_regs *regs)
 		el0_softstp(regs, esr);
 		break;
 	case ESR_ELx_EC_WATCHPT_LOW:
+		el0_watchpt(regs, esr);
+		break;
 	case ESR_ELx_EC_BRK64:
 		el0_dbg(regs, esr);
 		break;
@@ -1041,6 +1070,8 @@ asmlinkage void noinstr el0t_32_sync_handler(struct pt_regs *regs)
 		el0_softstp(regs, esr);
 		break;
 	case ESR_ELx_EC_WATCHPT_LOW:
+		el0_watchpt(regs, esr);
+		break;
 	case ESR_ELx_EC_BKPT32:
 		el0_dbg(regs, esr);
 		break;
diff --git a/arch/arm64/kernel/hw_breakpoint.c b/arch/arm64/kernel/hw_breakpoint.c
index 8a80e13347c8..ab76b36dce82 100644
--- a/arch/arm64/kernel/hw_breakpoint.c
+++ b/arch/arm64/kernel/hw_breakpoint.c
@@ -750,8 +750,7 @@ static int watchpoint_report(struct perf_event *wp, unsigned long addr,
 	return step;
 }
 
-static int watchpoint_handler(unsigned long addr, unsigned long esr,
-			      struct pt_regs *regs)
+void do_watchpoint(unsigned long addr, unsigned long esr, struct pt_regs *regs)
 {
 	int i, step = 0, *kernel_step, access, closest_match = 0;
 	u64 min_dist = -1, dist;
@@ -806,7 +805,7 @@ static int watchpoint_handler(unsigned long addr, unsigned long esr,
 	rcu_read_unlock();
 
 	if (!step)
-		return 0;
+		return;
 
 	/*
 	 * We always disable EL0 watchpoints because the kernel can
@@ -819,7 +818,7 @@ static int watchpoint_handler(unsigned long addr, unsigned long esr,
 
 		/* If we're already stepping a breakpoint, just return. */
 		if (debug_info->bps_disabled)
-			return 0;
+			return;
 
 		if (test_thread_flag(TIF_SINGLESTEP))
 			debug_info->suspended_step = 1;
@@ -830,7 +829,7 @@ static int watchpoint_handler(unsigned long addr, unsigned long esr,
 		kernel_step = this_cpu_ptr(&stepping_kernel_bp);
 
 		if (*kernel_step != ARM_KERNEL_STEP_NONE)
-			return 0;
+			return;
 
 		if (kernel_active_single_step()) {
 			*kernel_step = ARM_KERNEL_STEP_SUSPEND;
@@ -839,10 +838,8 @@ static int watchpoint_handler(unsigned long addr, unsigned long esr,
 			kernel_enable_single_step(regs);
 		}
 	}
-
-	return 0;
 }
-NOKPROBE_SYMBOL(watchpoint_handler);
+NOKPROBE_SYMBOL(do_watchpoint);
 
 /*
  * Handle single-step exception.
@@ -984,10 +981,6 @@ static int __init arch_hw_breakpoint_init(void)
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


