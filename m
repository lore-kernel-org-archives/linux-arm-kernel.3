Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B152DC61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 19:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FGd7O7RJgzjlyUpFCIZm7IjvSNeTuQm8vQSf35z9Lmo=; b=iiEIVnjkmSt+8H
	2W+ywQxlkozm6oj998OJZAGlwylSM2OZolup2iNTJEhyihNC7fQNhTahcjI0OzLD6NouvSNJ/m81k
	frLdCI9EgGga5pceA3Eu/tUY398UYZuJ21w42OCMEJLUebjM/yKSPgMGrGeQCwlJszYxCVOTXpW0F
	FW86HLi4HxpDRKmz4iSVgROh27KbfCrnr3QL+vVikbyOYzwAt9aDq+XTFKCYB26cA6Xu3i21xc+ve
	voP6psG1+H8B0jNt4k9ZhUpNCMzORAUJ2AqbHYcZNgKyXDvVfM77f+I9eqzZk9cXiai8chiYgYzAb
	+eGimwUpofYsJkV6fEmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOi0m-000000050J7-35z3;
	Mon, 09 Jun 2025 19:18:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOgPA-00000004owj-2V90
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 17:35:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 53A09150C;
	Mon,  9 Jun 2025 10:35:09 -0700 (PDT)
Received: from e137867.cambridge.arm.com (e137867.arm.com [10.1.32.173])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 29E873F66E;
	Mon,  9 Jun 2025 10:35:27 -0700 (PDT)
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 11/13] arm64: debug: split brk64 exception entry
Date: Mon,  9 Jun 2025 18:34:11 +0100
Message-ID: <20250609173413.132168-12-ada.coupriediaz@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250609173413.132168-1-ada.coupriediaz@arm.com>
References: <20250609173413.132168-1-ada.coupriediaz@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_103528_716613_02143C98 
X-CRM114-Status: GOOD (  17.47  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Currently all debug exceptions share common entry code and are routed
to `do_debug_exception()`, which calls dynamically-registered
handlers for each specific debug exception. This is unfortunate as
different debug exceptions have different entry handling requirements,
and it would be better to handle these distinct requirements earlier.

The BRK64 instruction can only be triggered by a BRK instruction. Thus,
we know that the PC is a legitimate address and isn't being used to train
a branch predictor with a bogus address : we don't need to call
`arm64_apply_bp_hardening()`.

We do not need to handle the Cortex-A76 erratum #1463225 either, as it
only relevant for single stepping at EL1.
BRK64 does not write FAR_EL1 either, as only hardware watchpoints do so.

Split the BRK64 exception entry, adjust the function signature, and its
behaviour to match the lack of needed mitigations.

When taking a BRK64 exception from EL0, the exception handling is safely
preemptible : the only possible handler is `uprobe_brk_handler()`.
It only operates on task-local data and properly checks its validity,
then raises a Thread Information Flag, processed before returning
to userspace in `do_notify_resume()`, which is already preemptible.
Thus we can safely unmask interrupts and enable preemption before
handling the break itself, fixing a PREEMPT_RT issue where the handler
could call a sleeping function with preemption disabled.

Given that the break hook registration is handled statically in
`call_break_hook` since
(arm64: debug: call software break handlers statically)
and that we now bypass the exception handler registration, this change
renders `early_brk64` redundant : its functionality is now handled through
the post-init path.

This also removes the last usage of `el1_dbg()`.

Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
---
 arch/arm64/include/asm/exception.h |  1 +
 arch/arm64/kernel/debug-monitors.c | 16 ++++++++++------
 arch/arm64/kernel/entry-common.c   | 19 ++++++++++++++-----
 3 files changed, 25 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/include/asm/exception.h b/arch/arm64/include/asm/exception.h
index 4c9779bdd05b..6500c378d2d3 100644
--- a/arch/arm64/include/asm/exception.h
+++ b/arch/arm64/include/asm/exception.h
@@ -65,6 +65,7 @@ void do_breakpoint(unsigned long esr, struct pt_regs *regs);
 void do_softstep(unsigned long esr, struct pt_regs *regs);
 void do_watchpoint(unsigned long addr, unsigned long esr,
 			struct pt_regs *regs);
+void do_brk64(unsigned long esr, struct pt_regs *regs);
 void do_fpsimd_acc(unsigned long esr, struct pt_regs *regs);
 void do_sve_acc(unsigned long esr, struct pt_regs *regs);
 void do_sme_acc(unsigned long esr, struct pt_regs *regs);
diff --git a/arch/arm64/kernel/debug-monitors.c b/arch/arm64/kernel/debug-monitors.c
index 3f5503d61aee..10f6a8a15954 100644
--- a/arch/arm64/kernel/debug-monitors.c
+++ b/arch/arm64/kernel/debug-monitors.c
@@ -262,8 +262,7 @@ static int call_break_hook(struct pt_regs *regs, unsigned long esr)
 }
 NOKPROBE_SYMBOL(call_break_hook);
 
-static int brk_handler(unsigned long unused, unsigned long esr,
-		       struct pt_regs *regs)
+static int brk_handler(unsigned long esr, struct pt_regs *regs)
 {
 	if (call_break_hook(regs, esr) == DBG_HOOK_HANDLED)
 		return 0;
@@ -279,6 +278,14 @@ static int brk_handler(unsigned long unused, unsigned long esr,
 }
 NOKPROBE_SYMBOL(brk_handler);
 
+void do_brk64(unsigned long esr, struct pt_regs *regs)
+{
+	if (brk_handler(esr, regs))
+		arm64_notify_die("BRK handler", regs, SIGTRAP, TRAP_BRKPT, regs->pc,
+			esr);
+}
+NOKPROBE_SYMBOL(do_brk64);
+
 bool try_handle_aarch32_break(struct pt_regs *regs)
 {
 	u32 arm_instr;
@@ -319,10 +326,7 @@ bool try_handle_aarch32_break(struct pt_regs *regs)
 NOKPROBE_SYMBOL(try_handle_aarch32_break);
 
 void __init debug_traps_init(void)
-{
-	hook_debug_fault_code(DBG_ESR_EVT_BRK, brk_handler, SIGTRAP,
-			      TRAP_BRKPT, "BRK handler");
-}
+{}
 
 /* Re-enable single step for syscall restarting. */
 void user_rewind_single_step(struct task_struct *task)
diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
index f302a235d8db..c0dcca825383 100644
--- a/arch/arm64/kernel/entry-common.c
+++ b/arch/arm64/kernel/entry-common.c
@@ -565,11 +565,12 @@ static void noinstr el1_watchpt(struct pt_regs *regs, unsigned long esr)
 	arm64_exit_el1_dbg(regs);
 }
 
-static void noinstr el1_dbg(struct pt_regs *regs, unsigned long esr)
+static void noinstr el1_brk64(struct pt_regs *regs, unsigned long esr)
 {
 	arm64_enter_el1_dbg(regs);
-	if (!cortex_a76_erratum_1463225_debug_handler(regs))
-		do_debug_exception(far, esr, regs);
+	debug_exception_enter(regs);
+	do_brk64(esr, regs);
+	debug_exception_exit(regs);
 	arm64_exit_el1_dbg(regs);
 }
 
@@ -621,7 +622,7 @@ asmlinkage void noinstr el1h_64_sync_handler(struct pt_regs *regs)
 		el1_watchpt(regs, esr);
 		break;
 	case ESR_ELx_EC_BRK64:
-		el1_dbg(regs, esr);
+		el1_brk64(regs, esr);
 		break;
 	case ESR_ELx_EC_FPAC:
 		el1_fpac(regs, esr);
@@ -857,6 +858,14 @@ static void noinstr el0_watchpt(struct pt_regs *regs, unsigned long esr)
 	exit_to_user_mode(regs);
 }
 
+static void noinstr el0_brk64(struct pt_regs *regs, unsigned long esr)
+{
+	enter_from_user_mode(regs);
+	local_daif_restore(DAIF_PROCCTX);
+	do_brk64(esr, regs);
+	exit_to_user_mode(regs);
+}
+
 static void noinstr el0_dbg(struct pt_regs *regs, unsigned long esr)
 {
 	/* Only watchpoints write FAR_EL1, otherwise its UNKNOWN */
@@ -945,7 +954,7 @@ asmlinkage void noinstr el0t_64_sync_handler(struct pt_regs *regs)
 		el0_watchpt(regs, esr);
 		break;
 	case ESR_ELx_EC_BRK64:
-		el0_dbg(regs, esr);
+		el0_brk64(regs, esr);
 		break;
 	case ESR_ELx_EC_FPAC:
 		el0_fpac(regs, esr);
-- 
2.43.0


