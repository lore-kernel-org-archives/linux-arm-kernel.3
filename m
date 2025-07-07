Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD476C83F07
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 12:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lospIOFWi+bPEeUnB67hQAq3bupmhykAiiCVZpfcCGw=; b=QkUOg0ySGDxTc6
	W1o4wISSxoekFPzJn0I20+2ePH/stdJnUH4/AxgN9ao8D5O54vi7SlpDg+hU9hZJ1OGp2hwCEY//k
	dhK0Gui+T3G5Ulkb9DJQbKK2oM9B5N6hVjXuXtMdzuWl2P2VT6MWcmb6v7K2YIIk2Euk9RqpAQn+j
	h6kg7mWNm4aiCJsxMpQjDkCSZtaF3YfoKfj9xo3RuLbSqYfYR1Lfi15U6TzEQiDhQBqrH/P7ed1TR
	djBRvBZI+TYWmH2zKBtRl2zN4BlBQTR4a6MP29BiQrrOszTzuEU9h+xB/xSz4eHcBeB8KWGvSCtDV
	RBCbRz5kQUUkuhTa0yIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYl3p-00000002QxX-2AZz;
	Mon, 07 Jul 2025 12:35:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYkEN-00000002JBy-1I1j
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 07 Jul 2025 11:41:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=lospIOFWi+bPEeUnB67hQAq3bupmhykAiiCVZpfcCGw=; b=d6cBzzNkOseHhEsKvgZNJWX6Ty
	8bltPg1bPQzwuJaOl98ayIHAF4F09+r1k+3o8GDauzVDVcPYlPxYte1I0Z91EcVsfqns7Q2ZK045i
	ksBN/mRW2jeiJw7cZim3hM/23rZRyKCmFrLE3fPoEbY8dNGbT0Hoi43ITc6h1hNS+AdfPCA9lZRtU
	xe2P4X+4Tn6tZu/sSQUJcwwFzTusWPZqBKGnGjoWoLDHErvZXguAuiPnTpQWXKJMBceTYWYpbjvlc
	UnlVp7NPP6UqGCc5hsaRjF+nv8yiMsr44aHA6CxzJzXlN9rizltZPbPpt8Q9b5FHfuMH05eQy7vyU
	efRDiVCA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYkEJ-00000008Tuw-43mS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 11:41:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BCA221762;
	Mon,  7 Jul 2025 04:41:38 -0700 (PDT)
Received: from e137867.cambridge.arm.com (e137867.arm.com [10.1.31.174])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E91C43F694;
	Mon,  7 Jul 2025 04:41:49 -0700 (PDT)
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 11/13] arm64: debug: split brk64 exception entry
Date: Mon,  7 Jul 2025 12:41:07 +0100
Message-ID: <20250707114109.35672-12-ada.coupriediaz@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250707114109.35672-1-ada.coupriediaz@arm.com>
References: <20250707114109.35672-1-ada.coupriediaz@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_124152_477949_9A9514B3 
X-CRM114-Status: GOOD (  21.49  )
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

The BRK64 instruction can only be triggered by a BRK instruction. Thus,
we know that the PC is a legitimate address and isn't being used to train
a branch predictor with a bogus address : we don't need to call
`arm64_apply_bp_hardening()`.

We do not need to handle the Cortex-A76 erratum #1463225 either, as it
only relevant for single stepping at EL1.
BRK64 does not write FAR_EL1 either, as only hardware watchpoints do so.

Split the BRK64 exception entry, adjust the function signature, and its
behaviour to match the lack of needed mitigations.
Further, as the EL0 and EL1 code paths are cleanly separated, we can split
`do_brk64()` into `do_el0_brk64()` and `do_el1_brk64()`, and call them
directly from the relevant entry paths.
Use `die()` directly for the EL1 error path, as in `do_el1_bti()` and
`do_el1_undef()`.
We can also remove `NOKRPOBE_SYMBOL` for the EL0 path, as it cannot
lead to a kprobe recursion.

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

This also removes the last usage of `el0_dbg()` without `CONFIG_COMPAT`.
Mark it `__maybe_unused`, to prevent a warning when building this patch
without `CONFIG_COMPAT`, as the following patch removes `el0_dbg()`.

Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Tested-by: Luis Claudio R. Goncalves <lgoncalv@redhat.com>
Reviewed-by: Will Deacon <will@kernel.org>
Acked-by: Mark Rutland <mark.rutland@arm.com>
---
 arch/arm64/include/asm/exception.h |  2 ++
 arch/arm64/kernel/debug-monitors.c | 48 ++++++++++++++----------------
 arch/arm64/kernel/entry-common.c   | 24 ++++++++++-----
 3 files changed, 40 insertions(+), 34 deletions(-)

diff --git a/arch/arm64/include/asm/exception.h b/arch/arm64/include/asm/exception.h
index 0362fecc5f69..ca556583b128 100644
--- a/arch/arm64/include/asm/exception.h
+++ b/arch/arm64/include/asm/exception.h
@@ -72,6 +72,8 @@ static inline void do_watchpoint(unsigned long addr, unsigned long esr,
 #endif /* CONFIG_HAVE_HW_BREAKPOINT */
 void do_el0_softstep(unsigned long esr, struct pt_regs *regs);
 void do_el1_softstep(unsigned long esr, struct pt_regs *regs);
+void do_el0_brk64(unsigned long esr, struct pt_regs *regs);
+void do_el1_brk64(unsigned long esr, struct pt_regs *regs);
 void do_fpsimd_acc(unsigned long esr, struct pt_regs *regs);
 void do_sve_acc(unsigned long esr, struct pt_regs *regs);
 void do_sme_acc(unsigned long esr, struct pt_regs *regs);
diff --git a/arch/arm64/kernel/debug-monitors.c b/arch/arm64/kernel/debug-monitors.c
index cb50d1f59798..7c1c89bb9ad1 100644
--- a/arch/arm64/kernel/debug-monitors.c
+++ b/arch/arm64/kernel/debug-monitors.c
@@ -207,15 +207,8 @@ void do_el1_softstep(unsigned long esr, struct pt_regs *regs)
 }
 NOKPROBE_SYMBOL(do_el1_softstep);
 
-static int call_break_hook(struct pt_regs *regs, unsigned long esr)
+static int call_el1_break_hook(struct pt_regs *regs, unsigned long esr)
 {
-	if (user_mode(regs)) {
-		if (IS_ENABLED(CONFIG_UPROBES) &&
-			esr_brk_comment(esr) == UPROBES_BRK_IMM)
-			return uprobe_brk_handler(regs, esr);
-		return DBG_HOOK_ERROR;
-	}
-
 	if (esr_brk_comment(esr) == BUG_BRK_IMM)
 		return bug_brk_handler(regs, esr);
 
@@ -252,24 +245,30 @@ static int call_break_hook(struct pt_regs *regs, unsigned long esr)
 
 	return DBG_HOOK_ERROR;
 }
-NOKPROBE_SYMBOL(call_break_hook);
+NOKPROBE_SYMBOL(call_el1_break_hook);
 
-static int brk_handler(unsigned long unused, unsigned long esr,
-		       struct pt_regs *regs)
+/*
+ * We have already unmasked interrupts and enabled preemption
+ * when calling do_el0_brk64() from entry-common.c.
+ */
+void do_el0_brk64(unsigned long esr, struct pt_regs *regs)
 {
-	if (call_break_hook(regs, esr) == DBG_HOOK_HANDLED)
-		return 0;
+	if (IS_ENABLED(CONFIG_UPROBES) &&
+		esr_brk_comment(esr) == UPROBES_BRK_IMM &&
+		uprobe_brk_handler(regs, esr) == DBG_HOOK_HANDLED)
+		return;
 
-	if (user_mode(regs)) {
-		send_user_sigtrap(TRAP_BRKPT);
-	} else {
-		pr_warn("Unexpected kernel BRK exception at EL1\n");
-		return -EFAULT;
-	}
-
-	return 0;
+	send_user_sigtrap(TRAP_BRKPT);
 }
-NOKPROBE_SYMBOL(brk_handler);
+
+void do_el1_brk64(unsigned long esr, struct pt_regs *regs)
+{
+	if (call_el1_break_hook(regs, esr) == DBG_HOOK_HANDLED)
+		return;
+
+	die("Oops - BRK", regs, esr);
+}
+NOKPROBE_SYMBOL(do_el1_brk64);
 
 bool try_handle_aarch32_break(struct pt_regs *regs)
 {
@@ -311,10 +310,7 @@ bool try_handle_aarch32_break(struct pt_regs *regs)
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
index 8a6d951c14cc..b2415c7b0743 100644
--- a/arch/arm64/kernel/entry-common.c
+++ b/arch/arm64/kernel/entry-common.c
@@ -565,13 +565,12 @@ static void noinstr el1_watchpt(struct pt_regs *regs, unsigned long esr)
 	arm64_exit_el1_dbg(regs);
 }
 
-static void noinstr el1_dbg(struct pt_regs *regs, unsigned long esr)
+static void noinstr el1_brk64(struct pt_regs *regs, unsigned long esr)
 {
-	unsigned long far = read_sysreg(far_el1);
-
 	arm64_enter_el1_dbg(regs);
-	if (!cortex_a76_erratum_1463225_debug_handler(regs))
-		do_debug_exception(far, esr, regs);
+	debug_exception_enter(regs);
+	do_el1_brk64(esr, regs);
+	debug_exception_exit(regs);
 	arm64_exit_el1_dbg(regs);
 }
 
@@ -623,7 +622,7 @@ asmlinkage void noinstr el1h_64_sync_handler(struct pt_regs *regs)
 		el1_watchpt(regs, esr);
 		break;
 	case ESR_ELx_EC_BRK64:
-		el1_dbg(regs, esr);
+		el1_brk64(regs, esr);
 		break;
 	case ESR_ELx_EC_FPAC:
 		el1_fpac(regs, esr);
@@ -859,7 +858,16 @@ static void noinstr el0_watchpt(struct pt_regs *regs, unsigned long esr)
 	exit_to_user_mode(regs);
 }
 
-static void noinstr el0_dbg(struct pt_regs *regs, unsigned long esr)
+static void noinstr el0_brk64(struct pt_regs *regs, unsigned long esr)
+{
+	enter_from_user_mode(regs);
+	local_daif_restore(DAIF_PROCCTX);
+	do_el0_brk64(esr, regs);
+	exit_to_user_mode(regs);
+}
+
+static void noinstr __maybe_unused
+el0_dbg(struct pt_regs *regs, unsigned long esr)
 {
 	/* Only watchpoints write FAR_EL1, otherwise its UNKNOWN */
 	unsigned long far = read_sysreg(far_el1);
@@ -947,7 +955,7 @@ asmlinkage void noinstr el0t_64_sync_handler(struct pt_regs *regs)
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


