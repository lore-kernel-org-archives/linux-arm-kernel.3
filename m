Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65EB1C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 19:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V0pl96GUvGS6UkBoNY6wc8/w9DC//hC/uoqz8CLxwdg=; b=MhXS9BvfUEhAwp
	3nhYdlLIfK7ecgsDN9Q5iLqbxhFBouReOWmIlD2hQ8TLGbUV2UboT67x8Usn41s6n5+/5TaUZaJnA
	jEGq2GibFQLe9cFG3LHIWJgQAR9yCbYVHzN2NxYGi6gGzD7K8kEBzVDjuZIcR4oExW++eJ5/F8WYi
	owXJnZ3g91PxSTvz2CFQ8HtsgOHLHfF7V4hrA7ADh5f41fOgkf5e0iN2vymoky9cUyIcSRAX0JNEy
	EPM3fEL1ZWETW9+xQBoPfUnUFTWjFpV6GzXeZ7sX1X3/LriGLKHMMftQ1bFj9LABEkjRfsbg2T1VS
	jznG1Q1lVX8ej1WOHBkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVENA-0000000FYPm-3lae;
	Fri, 27 Jun 2025 19:04:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVClD-0000000FObD-0tIQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 17:21:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A5F271007;
	Fri, 27 Jun 2025 10:20:53 -0700 (PDT)
Received: from e137867.arm.com (unknown [10.57.30.218])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3DC2C3F66E;
	Fri, 27 Jun 2025 10:21:08 -0700 (PDT)
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 10/13] arm64: debug: split hardware watchpoint exception entry
Date: Fri, 27 Jun 2025 18:20:35 +0100
Message-ID: <20250627172038.633423-11-ada.coupriediaz@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250627172038.633423-1-ada.coupriediaz@arm.com>
References: <20250627172038.633423-1-ada.coupriediaz@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_102111_329369_D2E07679 
X-CRM114-Status: GOOD (  16.96  )
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
---
 arch/arm64/include/asm/exception.h |  4 ++++
 arch/arm64/kernel/entry-common.c   | 31 +++++++++++++++++++++++++++++-
 arch/arm64/kernel/hw_breakpoint.c  | 17 +++++-----------
 3 files changed, 39 insertions(+), 13 deletions(-)

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
index 7265bef96672..c2ea1653dbb8 100644
--- a/arch/arm64/kernel/entry-common.c
+++ b/arch/arm64/kernel/entry-common.c
@@ -553,10 +553,20 @@ static void noinstr el1_softstp(struct pt_regs *regs, unsigned long esr)
 	arm64_exit_el1_dbg(regs);
 }
 
-static void noinstr el1_dbg(struct pt_regs *regs, unsigned long esr)
+static void noinstr el1_watchpt(struct pt_regs *regs, unsigned long esr)
 {
+	/* Watchpoints are the only debug exception to write FAR_EL1 */
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
@@ -608,6 +618,8 @@ asmlinkage void noinstr el1h_64_sync_handler(struct pt_regs *regs)
 		el1_softstp(regs, esr);
 		break;
 	case ESR_ELx_EC_WATCHPT_CUR:
+		el1_watchpt(regs, esr);
+		break;
 	case ESR_ELx_EC_BRK64:
 		el1_dbg(regs, esr);
 		break;
@@ -832,6 +844,19 @@ static void noinstr el0_softstp(struct pt_regs *regs, unsigned long esr)
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
@@ -917,6 +942,8 @@ asmlinkage void noinstr el0t_64_sync_handler(struct pt_regs *regs)
 		el0_softstp(regs, esr);
 		break;
 	case ESR_ELx_EC_WATCHPT_LOW:
+		el0_watchpt(regs, esr);
+		break;
 	case ESR_ELx_EC_BRK64:
 		el0_dbg(regs, esr);
 		break;
@@ -1041,6 +1068,8 @@ asmlinkage void noinstr el0t_32_sync_handler(struct pt_regs *regs)
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


