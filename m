Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14762C7115C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 21:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lJzQbKTE4t4pdVSzTnss/7Jpg7m/t7iamPVKQDvk6S4=; b=O81DyGvJBCtloM
	rRzsCLPV0q5Ltzo4zmGY6+iaERu64Pe8rQSi6ckYatWMtQueiR4GukhuOjpoXC+AqOt+xKCmcawa9
	JMhrFYhhAsVfdR4sk4bWS/1aaNprAHcK7cYWrbfw+IfA8pr8MY9UduUYiftMwccMY5dKgzltnEDkX
	emV6KV/N5Csrdx/WFUpAWxMauQZZdRbWjcuZQPk8IvwsFlXUh6K+E7ETeqspFIzDIZNaWF/mW2+iq
	FVwi6X2vmb32aNYXb4uvscrzJwqB2ZSMNHVS9pK3jNZE92follxgumv5MCXqi85K7w9rMfoQoeDqJ
	lBjbHyu9ZpMgivBh0oAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSjOG-0000000Gcsn-2ecJ;
	Fri, 20 Jun 2025 21:35:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSj2M-0000000Gb0p-1A4k
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 21:12:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4A53D169C;
	Fri, 20 Jun 2025 14:12:18 -0700 (PDT)
Received: from e137867.arm.com (unknown [10.57.50.192])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 45A363F673;
	Fri, 20 Jun 2025 14:12:36 -0700 (PDT)
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 09/13] arm64: debug: split single stepping exception entry
Date: Fri, 20 Jun 2025 22:12:03 +0100
Message-ID: <20250620211207.773980-10-ada.coupriediaz@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250620211207.773980-1-ada.coupriediaz@arm.com>
References: <20250620211207.773980-1-ada.coupriediaz@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_141238_399623_B3CBB3D6 
X-CRM114-Status: GOOD (  29.16  )
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

The single stepping exception has the most constraints : it can be
exploited to train branch predictors and it needs special handling at EL1
for the Cortex-A76 erratum #1463225. We need to conserve all those
mitigations.
However, it does not write an address at FAR_EL1, as only hardware
watchpoints do so.

The single-step handler does its own signaling if it needs to and only
returns 0, so we can call it directly from `entry-common.c`.

Split the single stepping exception entry, adjust the function signature,
keep the security mitigation and erratum handling.
Further, as the EL0 and EL1 code paths are cleanly separated, we can split
`do_softstep()` into `do_el0_softstep()` and `do_el1_softstep()` and
call them directly from the relevant entry paths.
We can also remove `NOKPROBE_SYMBOL` for the EL0 path, as it cannot
lead to a kprobe recursion.

Move the call to `arm64_apply_bp_hardening()` to `entry-common.c` so that
we can do it as early as possible, and only for the exceptions coming
from EL0, where it is needed.
This is safe to do as it is `noinstr`, as are all the functions it
may call. `el0_ia()` and `el0_pc()` already call it this way.

When taking a soft-step exception from EL0, most of the single stepping
handling is safely preemptible : the only possible handler is
`uprobe_single_step_handler()`. It only operates on task-local data and
properly checks its validity, then raises a Thread Information Flag,
processed before returning to userspace in `do_notify_resume()`, which
is already preemptible.
However, the soft-step handler first calls `reinstall_suspended_bps()`
to check if there is any hardware breakpoint or watchpoint pending
or already stepped through.
This cannot be preempted as it manipulates the hardware breakpoint and
watchpoint registers.

Move the call to `try_step_suspended_breakpoints()` to `entry-common.c`
and adjust the relevant comments.
We can now safely unmask interrupts before handling the step itself,
fixing a PREEMPT_RT issue where the handler could call a sleeping function
with preemption disabled.

Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Closes: https://lore.kernel.org/linux-arm-kernel/Z6YW_Kx4S2tmj2BP@uudg.org/
Tested-by: Luis Claudio R. Goncalves <lgoncalv@redhat.com>
---
 arch/arm64/include/asm/exception.h |  2 +
 arch/arm64/kernel/debug-monitors.c | 77 +++++++++++-------------------
 arch/arm64/kernel/entry-common.c   | 43 +++++++++++++++++
 arch/arm64/kernel/hw_breakpoint.c  |  2 +-
 4 files changed, 75 insertions(+), 49 deletions(-)

diff --git a/arch/arm64/include/asm/exception.h b/arch/arm64/include/asm/exception.h
index 926bad7b6704..59294e556a5d 100644
--- a/arch/arm64/include/asm/exception.h
+++ b/arch/arm64/include/asm/exception.h
@@ -62,6 +62,8 @@ void do_el1_gcs(struct pt_regs *regs, unsigned long esr);
 void do_debug_exception(unsigned long addr_if_watchpoint, unsigned long esr,
 			struct pt_regs *regs);
 void do_breakpoint(unsigned long esr, struct pt_regs *regs);
+void do_el0_softstep(unsigned long esr, struct pt_regs *regs);
+void do_el1_softstep(unsigned long esr, struct pt_regs *regs);
 void do_fpsimd_acc(unsigned long esr, struct pt_regs *regs);
 void do_sve_acc(unsigned long esr, struct pt_regs *regs);
 void do_sme_acc(unsigned long esr, struct pt_regs *regs);
diff --git a/arch/arm64/kernel/debug-monitors.c b/arch/arm64/kernel/debug-monitors.c
index 89264d1a9d65..cb50d1f59798 100644
--- a/arch/arm64/kernel/debug-monitors.c
+++ b/arch/arm64/kernel/debug-monitors.c
@@ -21,6 +21,7 @@
 #include <asm/cputype.h>
 #include <asm/daifflags.h>
 #include <asm/debug-monitors.h>
+#include <asm/exception.h>
 #include <asm/kgdb.h>
 #include <asm/kprobes.h>
 #include <asm/system_misc.h>
@@ -159,21 +160,6 @@ NOKPROBE_SYMBOL(clear_user_regs_spsr_ss);
 #define set_regs_spsr_ss(r)	set_user_regs_spsr_ss(&(r)->user_regs)
 #define clear_regs_spsr_ss(r)	clear_user_regs_spsr_ss(&(r)->user_regs)
 
-/*
- * Call single step handlers
- * There is no Syndrome info to check for determining the handler.
- * However, there is only one possible handler for user and kernel modes, so
- * check and call the appropriate one.
- */
-static int call_step_hook(struct pt_regs *regs, unsigned long esr)
-{
-	if (user_mode(regs))
-		return uprobe_single_step_handler(regs, esr);
-
-	return kgdb_single_step_handler(regs, esr);
-}
-NOKPROBE_SYMBOL(call_step_hook);
-
 static void send_user_sigtrap(int si_code)
 {
 	struct pt_regs *regs = current_pt_regs();
@@ -188,41 +174,38 @@ static void send_user_sigtrap(int si_code)
 			      "User debug trap");
 }
 
-static int single_step_handler(unsigned long unused, unsigned long esr,
-			       struct pt_regs *regs)
+/*
+ * We have already unmasked interrupts and enabled preemption
+ * when calling do_el0_softstep() from entry-common.c.
+ */
+void do_el0_softstep(unsigned long esr, struct pt_regs *regs)
 {
+	if (uprobe_single_step_handler(regs, esr) == DBG_HOOK_HANDLED)
+		return;
+
+	send_user_sigtrap(TRAP_TRACE);
 	/*
-	 * If we are stepping a pending breakpoint, call the hw_breakpoint
-	 * handler first.
+	 * ptrace will disable single step unless explicitly
+	 * asked to re-enable it. For other clients, it makes
+	 * sense to leave it enabled (i.e. rewind the controls
+	 * to the active-not-pending state).
 	 */
-	if (try_step_suspended_breakpoints(regs))
-		return 0;
-
-	if (call_step_hook(regs, esr) == DBG_HOOK_HANDLED)
-		return 0;
-
-	if (user_mode(regs)) {
-		send_user_sigtrap(TRAP_TRACE);
-
-		/*
-		 * ptrace will disable single step unless explicitly
-		 * asked to re-enable it. For other clients, it makes
-		 * sense to leave it enabled (i.e. rewind the controls
-		 * to the active-not-pending state).
-		 */
-		user_rewind_single_step(current);
-	} else {
-		pr_warn("Unexpected kernel single-step exception at EL1\n");
-		/*
-		 * Re-enable stepping since we know that we will be
-		 * returning to regs.
-		 */
-		set_regs_spsr_ss(regs);
-	}
-
-	return 0;
+	user_rewind_single_step(current);
 }
-NOKPROBE_SYMBOL(single_step_handler);
+
+void do_el1_softstep(unsigned long esr, struct pt_regs *regs)
+{
+	if (kgdb_single_step_handler(regs, esr) == DBG_HOOK_HANDLED)
+		return;
+
+	pr_warn("Unexpected kernel single-step exception at EL1\n");
+	/*
+	 * Re-enable stepping since we know that we will be
+	 * returning to regs.
+	 */
+	set_regs_spsr_ss(regs);
+}
+NOKPROBE_SYMBOL(do_el1_softstep);
 
 static int call_break_hook(struct pt_regs *regs, unsigned long esr)
 {
@@ -329,8 +312,6 @@ NOKPROBE_SYMBOL(try_handle_aarch32_break);
 
 void __init debug_traps_init(void)
 {
-	hook_debug_fault_code(DBG_ESR_EVT_HWSS, single_step_handler, SIGTRAP,
-			      TRAP_TRACE, "single-step handler");
 	hook_debug_fault_code(DBG_ESR_EVT_BRK, brk_handler, SIGTRAP,
 			      TRAP_BRKPT, "BRK handler");
 }
diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
index be2add6b4ae3..7265bef96672 100644
--- a/arch/arm64/kernel/entry-common.c
+++ b/arch/arm64/kernel/entry-common.c
@@ -535,6 +535,24 @@ static void noinstr el1_breakpt(struct pt_regs *regs, unsigned long esr)
 	arm64_exit_el1_dbg(regs);
 }
 
+static void noinstr el1_softstp(struct pt_regs *regs, unsigned long esr)
+{
+	arm64_enter_el1_dbg(regs);
+	if (!cortex_a76_erratum_1463225_debug_handler(regs)) {
+		debug_exception_enter(regs);
+		/*
+		 * After handling a breakpoint, we suspend the breakpoint
+		 * and use single-step to move to the next instruction.
+		 * If we are stepping a suspended breakpoint there's nothing more to do:
+		 * the single-step is complete.
+		 */
+		if (!try_step_suspended_breakpoints(regs))
+			do_el1_softstep(esr, regs);
+		debug_exception_exit(regs);
+	}
+	arm64_exit_el1_dbg(regs);
+}
+
 static void noinstr el1_dbg(struct pt_regs *regs, unsigned long esr)
 {
 	unsigned long far = read_sysreg(far_el1);
@@ -587,6 +605,8 @@ asmlinkage void noinstr el1h_64_sync_handler(struct pt_regs *regs)
 		el1_breakpt(regs, esr);
 		break;
 	case ESR_ELx_EC_SOFTSTP_CUR:
+		el1_softstp(regs, esr);
+		break;
 	case ESR_ELx_EC_WATCHPT_CUR:
 	case ESR_ELx_EC_BRK64:
 		el1_dbg(regs, esr);
@@ -793,6 +813,25 @@ static void noinstr el0_breakpt(struct pt_regs *regs, unsigned long esr)
 	exit_to_user_mode(regs);
 }
 
+static void noinstr el0_softstp(struct pt_regs *regs, unsigned long esr)
+{
+	if (!is_ttbr0_addr(regs->pc))
+		arm64_apply_bp_hardening();
+
+	enter_from_user_mode(regs);
+	/*
+	 * After handling a breakpoint, we suspend the breakpoint
+	 * and use single-step to move to the next instruction.
+	 * If we are stepping a suspended breakpoint there's nothing more to do:
+	 * the single-step is complete.
+	 */
+	if (!try_step_suspended_breakpoints(regs)) {
+		local_daif_restore(DAIF_PROCCTX);
+		do_el0_softstep(esr, regs);
+	}
+	exit_to_user_mode(regs);
+}
+
 static void noinstr el0_dbg(struct pt_regs *regs, unsigned long esr)
 {
 	/* Only watchpoints write FAR_EL1, otherwise its UNKNOWN */
@@ -875,6 +914,8 @@ asmlinkage void noinstr el0t_64_sync_handler(struct pt_regs *regs)
 		el0_breakpt(regs, esr);
 		break;
 	case ESR_ELx_EC_SOFTSTP_LOW:
+		el0_softstp(regs, esr);
+		break;
 	case ESR_ELx_EC_WATCHPT_LOW:
 	case ESR_ELx_EC_BRK64:
 		el0_dbg(regs, esr);
@@ -997,6 +1038,8 @@ asmlinkage void noinstr el0t_32_sync_handler(struct pt_regs *regs)
 		el0_breakpt(regs, esr);
 		break;
 	case ESR_ELx_EC_SOFTSTP_LOW:
+		el0_softstp(regs, esr);
+		break;
 	case ESR_ELx_EC_WATCHPT_LOW:
 	case ESR_ELx_EC_BKPT32:
 		el0_dbg(regs, esr);
diff --git a/arch/arm64/kernel/hw_breakpoint.c b/arch/arm64/kernel/hw_breakpoint.c
index 309ae24d4548..8a80e13347c8 100644
--- a/arch/arm64/kernel/hw_breakpoint.c
+++ b/arch/arm64/kernel/hw_breakpoint.c
@@ -854,7 +854,7 @@ bool try_step_suspended_breakpoints(struct pt_regs *regs)
 	bool handled_exception = false;
 
 	/*
-	 * Called from single-step exception handler.
+	 * Called from single-step exception entry.
 	 * Return true if we stepped a breakpoint and can resume execution,
 	 * false if we need to handle a single-step.
 	 */
-- 
2.43.0


