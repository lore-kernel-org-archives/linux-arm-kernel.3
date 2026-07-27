Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F399C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 16:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=npsQWY55v6PyE+Pq/N787liCYwQdoyTTaG/cv/vziBA=; b=kvcKrmk2zpjknUFuqKZyRCSBPy
	fXGcXkm0WRDMRmKGHc6WdvZ+E56cudeawCqwGX96Laa4+8H6qAx6Ff/UefCzO1L5W2mitRKIdRY1f
	HHptYDFmEkc1yPtZobcxvwjbQRWjIGmH696r9+rtH2qquhk8+AzXJpNRlJvO2ky7/sQrnvUg8s281
	yrz3pFEq4JLjY5VgqjdUiUXAkEVIaIdHLF5eKIbp9cllup0qFqx1ftM0FS4uaCyF0uVXFK/hGtxBj
	IIaVpm25h1ihOlgW6wb+lBY4rqXXxCtwdL8Wv6R808vhYgTjanYAeje8FcWJPnNTsrZuHfPJe9QI2
	yhLAEnBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woOIz-00000003MtV-49Wa;
	Mon, 27 Jul 2026 16:35:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woOIn-00000003MSR-09m4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 16:35:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2D2E61713;
	Mon, 27 Jul 2026 09:35:35 -0700 (PDT)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3889A3F86F;
	Mon, 27 Jul 2026 09:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785170139; bh=wl91SFjyzxSkLz6jbLkeHUGJJyEATS1O5V6c62JBTdQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lg3pvrONDcbUewjuBuXLJ/3GRgCXsU5/Z70w9dQ5ArGqxnUwt4BlLVY7cJAo0m28T
	 BIVKmP3ox2SJRv78AKVkc6EvEBJwLpMO4gX/uW+dCUreB8THAPq71rh25AyhG8h7jK
	 SpY+TuxtJ6OYLVZrSsXu61daqS2oNdUWwy7GsXwk=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com,
	maz@kernel.org,
	will@kernel.org,
	catalin.marinas@arm.com,
	ruanjinjie@huawei.com,
	liaochang1@huawei.com
Subject: [RFC PATCH v2 15/45] arm64: entry: replace DAIF helpers with entry helpers
Date: Mon, 27 Jul 2026 17:34:23 +0100
Message-Id: <20260727163453.7969-16-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20260727163453.7969-1-vladimir.murzin@arm.com>
References: <20260727163453.7969-1-vladimir.murzin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_093541_177709_BB11B0F3 
X-CRM114-Status: GOOD (  17.19  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Ada Couprie Diaz <ada.coupriediaz@arm.com>

Replace all uses of the `local_daif_...` helpers in `entry-common.c`
with the new entry-specific exception masking helpers.

Also replace `local_irq_disable()` with a switch to NOIRQ context
using the new helpers. This provides:

- consistency checks for hardware state
- a unified style for managing exception context

Now that both the irqflags API and entry code handle DAIF and PMR
correctly, remove `GIC_PRIO_PSR_I_SET` from the PMR value set by
`kernel_entry` in `entry.S` and by `init_gic_priority_masking()` in
`kernel/smp.c`.

The `local_daif_...` helpers and other specialized code still use
`GIC_PRIO_PSR_I_SET` for now; this commit does not change their
behavior.

Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
---
 arch/arm64/kernel/entry-common.c | 258 ++++++++++++++++++++-----------
 arch/arm64/kernel/entry.S        |   2 +-
 arch/arm64/kernel/smp.c          |   2 +-
 3 files changed, 173 insertions(+), 89 deletions(-)

diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
index 72c03ccea59f..a409cd6159a4 100644
--- a/arch/arm64/kernel/entry-common.c
+++ b/arch/arm64/kernel/entry-common.c
@@ -18,11 +18,11 @@
 #include <linux/thread_info.h>
 
 #include <asm/cpufeature.h>
-#include <asm/daifflags.h>
 #include <asm/esr.h>
 #include <asm/exception.h>
 #include <asm/fpsimd.h>
 #include <asm/irq_regs.h>
+#include <asm/interrupts/entry.h>
 #include <asm/kprobes.h>
 #include <asm/mmu.h>
 #include <asm/processor.h>
@@ -53,9 +53,10 @@ static noinstr irqentry_state_t arm64_enter_from_kernel_mode(struct pt_regs *reg
  * instrumentable code, or any code which may trigger an exception.
  */
 static void noinstr __arm64_exit_to_kernel_mode(struct pt_regs *regs,
-						irqentry_state_t state)
+						irqentry_state_t state,
+						arm64_exc_hwstate_t hwstate)
 {
-	local_daif_mask();
+	arm64_mask_exc_context(hwstate);
 	mte_check_tfsr_exit();
 	irqentry_exit_to_kernel_mode_after_preempt(regs, state);
 }
@@ -64,22 +65,24 @@ static void noinstr __arm64_exit_to_kernel_mode(struct pt_regs *regs,
  * We are returning from the context which allows involuntary kernel preemption
  */
 static void noinstr arm64_exit_to_kernel_mode_preempt(struct pt_regs *regs,
-						      irqentry_state_t state)
+						      irqentry_state_t state,
+						      arm64_exc_hwstate_t hwstate)
 {
 	irqentry_exit_to_kernel_mode_preempt(regs, state);
-	__arm64_exit_to_kernel_mode(regs, state);
+	__arm64_exit_to_kernel_mode(regs, state, hwstate);
 }
 
 static void noinstr arm64_exit_to_kernel_mode(struct pt_regs *regs,
-					      irqentry_state_t state)
+					      irqentry_state_t state,
+					      arm64_exc_hwstate_t hwstate)
 {
 	if (!regs_irqs_disabled(regs)) {
-		local_irq_disable();
-		arm64_exit_to_kernel_mode_preempt(regs, state);
+		hwstate = arm64_lift_exc_context(hwstate, NOIRQ_CONTEXT);
+		arm64_exit_to_kernel_mode_preempt(regs, state, hwstate);
 		return;
 	}
 
-	__arm64_exit_to_kernel_mode(regs, state);
+	__arm64_exit_to_kernel_mode(regs, state, hwstate);
 }
 
 static __always_inline void arm64_syscall_enter_from_user_mode(struct pt_regs *regs)
@@ -102,11 +105,12 @@ static __always_inline void arm64_enter_from_user_mode(struct pt_regs *regs)
 	sme_enter_from_user_mode();
 }
 
-static __always_inline void arm64_syscall_exit_to_user_mode(struct pt_regs *regs)
+static __always_inline void arm64_syscall_exit_to_user_mode(struct pt_regs *regs,
+							    arm64_exc_hwstate_t hwstate)
 {
-	local_irq_disable();
+	hwstate = arm64_lift_exc_context(hwstate, NOIRQ_CONTEXT);
 	syscall_exit_to_user_mode_prepare(regs);
-	local_daif_mask();
+	arm64_mask_exc_context(hwstate);
 	sme_exit_to_user_mode();
 	mte_check_tfsr_exit();
 	exit_to_user_mode();
@@ -117,11 +121,12 @@ static __always_inline void arm64_syscall_exit_to_user_mode(struct pt_regs *regs
  * After this function returns it is not safe to call regular kernel code,
  * instrumentable code, or any code which may trigger an exception.
  */
-static __always_inline void arm64_exit_to_user_mode(struct pt_regs *regs)
+static __always_inline void arm64_exit_to_user_mode(struct pt_regs *regs,
+						    arm64_exc_hwstate_t hwstate)
 {
-	local_irq_disable();
+	hwstate = arm64_lift_exc_context(hwstate, NOIRQ_CONTEXT);
 	irqentry_exit_to_user_mode_prepare(regs);
-	local_daif_mask();
+	arm64_mask_exc_context(hwstate);
 	sme_exit_to_user_mode();
 	mte_check_tfsr_exit();
 	exit_to_user_mode();
@@ -129,7 +134,10 @@ static __always_inline void arm64_exit_to_user_mode(struct pt_regs *regs)
 
 asmlinkage void noinstr asm_exit_to_user_mode(struct pt_regs *regs)
 {
-	arm64_syscall_exit_to_user_mode(regs);
+	arm64_exc_hwstate_t hwstate = arm64_exc_hwstate_of_context(PROCESS_CONTEXT);
+
+	arm64_syscall_exit_to_user_mode(regs, hwstate);
+	arm64_debug_exc_context(CRITICAL_CONTEXT);
 }
 
 /*
@@ -335,63 +343,69 @@ UNHANDLED(el1t, 64, error)
 static void noinstr el1_abort(struct pt_regs *regs, unsigned long esr)
 {
 	unsigned long far = read_sysreg(far_el1);
+	arm64_exc_hwstate_t hwstate;
 	irqentry_state_t state;
 
 	state = arm64_enter_from_kernel_mode(regs);
-	local_daif_inherit(regs);
+	hwstate = arm64_inherit_exc_context(regs);
 	do_mem_abort(far, esr, regs);
-	arm64_exit_to_kernel_mode(regs, state);
+	arm64_exit_to_kernel_mode(regs, state, hwstate);
 }
 
 static void noinstr el1_pc(struct pt_regs *regs, unsigned long esr)
 {
 	unsigned long far = read_sysreg(far_el1);
+	arm64_exc_hwstate_t hwstate;
 	irqentry_state_t state;
 
 	state = arm64_enter_from_kernel_mode(regs);
-	local_daif_inherit(regs);
+	hwstate = arm64_inherit_exc_context(regs);
 	do_sp_pc_abort(far, esr, regs);
-	arm64_exit_to_kernel_mode(regs, state);
+	arm64_exit_to_kernel_mode(regs, state, hwstate);
 }
 
 static void noinstr el1_undef(struct pt_regs *regs, unsigned long esr)
 {
+	arm64_exc_hwstate_t hwstate;
 	irqentry_state_t state;
 
 	state = arm64_enter_from_kernel_mode(regs);
-	local_daif_inherit(regs);
+	hwstate = arm64_inherit_exc_context(regs);
 	do_el1_undef(regs, esr);
-	arm64_exit_to_kernel_mode(regs, state);
+	arm64_exit_to_kernel_mode(regs, state, hwstate);
 }
 
 static void noinstr el1_bti(struct pt_regs *regs, unsigned long esr)
 {
+	arm64_exc_hwstate_t hwstate;
 	irqentry_state_t state;
 
 	state = arm64_enter_from_kernel_mode(regs);
-	local_daif_inherit(regs);
+	hwstate = arm64_inherit_exc_context(regs);
 	do_el1_bti(regs, esr);
-	arm64_exit_to_kernel_mode(regs, state);
+	arm64_exit_to_kernel_mode(regs, state, hwstate);
 }
 
 static void noinstr el1_gcs(struct pt_regs *regs, unsigned long esr)
 {
+	arm64_exc_hwstate_t hwstate;
 	irqentry_state_t state;
 
 	state = arm64_enter_from_kernel_mode(regs);
-	local_daif_inherit(regs);
+	hwstate = arm64_inherit_exc_context(regs);
 	do_el1_gcs(regs, esr);
-	arm64_exit_to_kernel_mode(regs, state);
+	arm64_exit_to_kernel_mode(regs, state, hwstate);
 }
 
 static void noinstr el1_mops(struct pt_regs *regs, unsigned long esr)
 {
+	arm64_exc_hwstate_t hwstate;
 	irqentry_state_t state;
 
 	state = arm64_enter_from_kernel_mode(regs);
-	local_daif_inherit(regs);
+	hwstate = arm64_inherit_exc_context(regs);
 	do_el1_mops(regs, esr);
-	arm64_exit_to_kernel_mode(regs, state);
+	arm64_exit_to_kernel_mode(regs, state, hwstate);
 }
 
 static void noinstr el1_breakpt(struct pt_regs *regs, unsigned long esr)
@@ -451,12 +465,13 @@ static void noinstr el1_brk64(struct pt_regs *regs, unsigned long esr)
 
 static void noinstr el1_fpac(struct pt_regs *regs, unsigned long esr)
 {
+	arm64_exc_hwstate_t hwstate;
 	irqentry_state_t state;
 
 	state = arm64_enter_from_kernel_mode(regs);
-	local_daif_inherit(regs);
+	hwstate = arm64_inherit_exc_context(regs);
 	do_el1_fpac(regs, esr);
-	arm64_exit_to_kernel_mode(regs, state);
+	arm64_exit_to_kernel_mode(regs, state, hwstate);
 }
 
 asmlinkage void noinstr el1h_64_sync_handler(struct pt_regs *regs)
@@ -506,16 +521,20 @@ asmlinkage void noinstr el1h_64_sync_handler(struct pt_regs *regs)
 	default:
 		__panic_unhandled(regs, "64-bit el1h sync", esr);
 	}
+
+	arm64_debug_exc_context(CRITICAL_CONTEXT);
 }
 
 static __always_inline void __el1_pnmi(struct pt_regs *regs,
 				       void (*handler)(struct pt_regs *))
 {
+	arm64_exc_hwstate_t hwstate;
 	irqentry_state_t state;
 
 	state = irqentry_nmi_enter(regs);
+	hwstate = arm64_unmask_exc_context(NONMI_CONTEXT);
 	do_interrupt_handler(regs, handler);
-	local_daif_mask();
+	arm64_mask_exc_context(hwstate);
 	irqentry_nmi_exit(regs, state);
 }
 
@@ -526,21 +545,32 @@ static __always_inline void __el1_irq(struct pt_regs *regs,
 
 	state = arm64_enter_from_kernel_mode(regs);
 
+	arm64_unmask_exc_context(NONMI_CONTEXT);
+
 	irq_enter_rcu();
 	do_interrupt_handler(regs, handler);
 	irq_exit_rcu();
 
-	arm64_exit_to_kernel_mode_preempt(regs, state);
+	/*
+	 * If pseudo-NMIs are enabled and the interrupted context had
+	 * IRQs unmasked, the interrupt handler will have cleared DAIF
+	 * and switched to PMR masking in order to handle
+	 * NMIs. Otherwise it would keep IF.  In both cases on return
+	 * we effectivly have NOIRQ_CONTEXT - keep track of it
+	 */
+	arm64_debug_exc_context(NOIRQ_CONTEXT);
+	arm64_exit_to_kernel_mode(regs, state, arm64_exc_hwstate_of_context(NOIRQ_CONTEXT));
 }
+
 static void noinstr el1_interrupt(struct pt_regs *regs,
 				  void (*handler)(struct pt_regs *))
 {
-	write_sysreg(DAIF_PROCCTX_NOIRQ, daif);
-
 	if (IS_ENABLED(CONFIG_ARM64_PSEUDO_NMI) && regs_irqs_disabled(regs))
 		__el1_pnmi(regs, handler);
 	else
 		__el1_irq(regs, handler);
+
+	arm64_debug_exc_context(CRITICAL_CONTEXT);
 }
 
 asmlinkage void noinstr el1h_64_irq_handler(struct pt_regs *regs)
@@ -556,28 +586,31 @@ asmlinkage void noinstr el1h_64_fiq_handler(struct pt_regs *regs)
 asmlinkage void noinstr el1h_64_error_handler(struct pt_regs *regs)
 {
 	unsigned long esr = read_sysreg(esr_el1);
+	arm64_exc_hwstate_t hwstate;
 	irqentry_state_t state;
 
-	local_daif_restore(DAIF_ERRCTX);
 	state = irqentry_nmi_enter(regs);
+	hwstate = arm64_unmask_exc_context(ERROR_CONTEXT);
 	do_serror(regs, esr);
-	local_daif_mask();
+	arm64_mask_exc_context(hwstate);
 	irqentry_nmi_exit(regs, state);
 }
 
 static void noinstr el0_da(struct pt_regs *regs, unsigned long esr)
 {
 	unsigned long far = read_sysreg(far_el1);
+	arm64_exc_hwstate_t hwstate;
 
 	arm64_enter_from_user_mode(regs);
-	local_daif_restore(DAIF_PROCCTX);
+	hwstate = arm64_unmask_exc_context(PROCESS_CONTEXT);
 	do_mem_abort(far, esr, regs);
-	arm64_exit_to_user_mode(regs);
+	arm64_exit_to_user_mode(regs, hwstate);
 }
 
 static void noinstr el0_ia(struct pt_regs *regs, unsigned long esr)
 {
 	unsigned long far = read_sysreg(far_el1);
+	arm64_exc_hwstate_t hwstate;
 
 	/*
 	 * We've taken an instruction abort from userspace and not yet
@@ -588,114 +621,139 @@ static void noinstr el0_ia(struct pt_regs *regs, unsigned long esr)
 		arm64_apply_bp_hardening();
 
 	arm64_enter_from_user_mode(regs);
-	local_daif_restore(DAIF_PROCCTX);
+	hwstate = arm64_unmask_exc_context(PROCESS_CONTEXT);
 	do_mem_abort(far, esr, regs);
-	arm64_exit_to_user_mode(regs);
+	arm64_exit_to_user_mode(regs, hwstate);
 }
 
 static void noinstr el0_fpsimd_acc(struct pt_regs *regs, unsigned long esr)
 {
+	arm64_exc_hwstate_t hwstate;
+
 	arm64_enter_from_user_mode(regs);
-	local_daif_restore(DAIF_PROCCTX);
+	hwstate = arm64_unmask_exc_context(PROCESS_CONTEXT);
 	do_fpsimd_acc(esr, regs);
-	arm64_exit_to_user_mode(regs);
+	arm64_exit_to_user_mode(regs, hwstate);
 }
 
 static void noinstr el0_sve_acc(struct pt_regs *regs, unsigned long esr)
 {
+	arm64_exc_hwstate_t hwstate;
+
 	arm64_enter_from_user_mode(regs);
-	local_daif_restore(DAIF_PROCCTX);
+	hwstate = arm64_unmask_exc_context(PROCESS_CONTEXT);
 	do_sve_acc(esr, regs);
-	arm64_exit_to_user_mode(regs);
+	arm64_exit_to_user_mode(regs, hwstate);
 }
 
 static void noinstr el0_sme_acc(struct pt_regs *regs, unsigned long esr)
 {
+	arm64_exc_hwstate_t hwstate;
+
 	arm64_enter_from_user_mode(regs);
-	local_daif_restore(DAIF_PROCCTX);
+	hwstate = arm64_unmask_exc_context(PROCESS_CONTEXT);
 	do_sme_acc(esr, regs);
-	arm64_exit_to_user_mode(regs);
+	arm64_exit_to_user_mode(regs, hwstate);
 }
 
 static void noinstr el0_fpsimd_exc(struct pt_regs *regs, unsigned long esr)
 {
+	arm64_exc_hwstate_t hwstate;
+
 	arm64_enter_from_user_mode(regs);
-	local_daif_restore(DAIF_PROCCTX);
+	hwstate = arm64_unmask_exc_context(PROCESS_CONTEXT);
 	do_fpsimd_exc(esr, regs);
-	arm64_exit_to_user_mode(regs);
+	arm64_exit_to_user_mode(regs, hwstate);
 }
 
 static void noinstr el0_sys(struct pt_regs *regs, unsigned long esr)
 {
+	arm64_exc_hwstate_t hwstate;
+
 	arm64_enter_from_user_mode(regs);
-	local_daif_restore(DAIF_PROCCTX);
+	hwstate = arm64_unmask_exc_context(PROCESS_CONTEXT);
 	do_el0_sys(esr, regs);
-	arm64_exit_to_user_mode(regs);
+	arm64_exit_to_user_mode(regs, hwstate);
 }
 
 static void noinstr el0_pc(struct pt_regs *regs, unsigned long esr)
 {
 	unsigned long far = read_sysreg(far_el1);
+	arm64_exc_hwstate_t hwstate;
 
 	if (!is_ttbr0_addr(instruction_pointer(regs)))
 		arm64_apply_bp_hardening();
 
 	arm64_enter_from_user_mode(regs);
-	local_daif_restore(DAIF_PROCCTX);
+	hwstate = arm64_unmask_exc_context(PROCESS_CONTEXT);
 	do_sp_pc_abort(far, esr, regs);
-	arm64_exit_to_user_mode(regs);
+	arm64_exit_to_user_mode(regs, hwstate);
 }
 
 static void noinstr el0_sp(struct pt_regs *regs, unsigned long esr)
 {
+	arm64_exc_hwstate_t hwstate;
+
 	arm64_enter_from_user_mode(regs);
-	local_daif_restore(DAIF_PROCCTX);
+	hwstate = arm64_unmask_exc_context(PROCESS_CONTEXT);
 	do_sp_pc_abort(regs->sp, esr, regs);
-	arm64_exit_to_user_mode(regs);
+	arm64_exit_to_user_mode(regs, hwstate);
 }
 
 static void noinstr el0_undef(struct pt_regs *regs, unsigned long esr)
 {
+	arm64_exc_hwstate_t hwstate;
+
 	arm64_enter_from_user_mode(regs);
-	local_daif_restore(DAIF_PROCCTX);
+	hwstate = arm64_unmask_exc_context(PROCESS_CONTEXT);
 	do_el0_undef(regs, esr);
-	arm64_exit_to_user_mode(regs);
+	arm64_exit_to_user_mode(regs, hwstate);
 }
 
 static void noinstr el0_bti(struct pt_regs *regs)
 {
+	arm64_exc_hwstate_t hwstate;
+
 	arm64_enter_from_user_mode(regs);
-	local_daif_restore(DAIF_PROCCTX);
+	hwstate = arm64_unmask_exc_context(PROCESS_CONTEXT);
 	do_el0_bti(regs);
-	arm64_exit_to_user_mode(regs);
+	arm64_exit_to_user_mode(regs, hwstate);
 }
 
 static void noinstr el0_mops(struct pt_regs *regs, unsigned long esr)
 {
+	arm64_exc_hwstate_t hwstate;
+
 	arm64_enter_from_user_mode(regs);
-	local_daif_restore(DAIF_PROCCTX);
+	hwstate = arm64_unmask_exc_context(PROCESS_CONTEXT);
 	do_el0_mops(regs, esr);
-	arm64_exit_to_user_mode(regs);
+	arm64_exit_to_user_mode(regs, hwstate);
 }
 
 static void noinstr el0_gcs(struct pt_regs *regs, unsigned long esr)
 {
+	arm64_exc_hwstate_t hwstate;
+
 	arm64_enter_from_user_mode(regs);
-	local_daif_restore(DAIF_PROCCTX);
+	hwstate = arm64_unmask_exc_context(PROCESS_CONTEXT);
 	do_el0_gcs(regs, esr);
-	arm64_exit_to_user_mode(regs);
+	arm64_exit_to_user_mode(regs, hwstate);
 }
 
 static void noinstr el0_inv(struct pt_regs *regs, unsigned long esr)
 {
+	arm64_exc_hwstate_t hwstate;
+
 	arm64_enter_from_user_mode(regs);
-	local_daif_restore(DAIF_PROCCTX);
+	hwstate = arm64_unmask_exc_context(PROCESS_CONTEXT);
 	bad_el0_sync(regs, 0, esr);
-	arm64_exit_to_user_mode(regs);
+	arm64_exit_to_user_mode(regs, hwstate);
 }
 
 static void noinstr el0_breakpt(struct pt_regs *regs, unsigned long esr)
 {
+	arm64_exc_hwstate_t hwstate;
+
 	if (!is_ttbr0_addr(regs->pc))
 		arm64_apply_bp_hardening();
 
@@ -703,12 +761,13 @@ static void noinstr el0_breakpt(struct pt_regs *regs, unsigned long esr)
 	debug_exception_enter(regs);
 	do_breakpoint(esr, regs);
 	debug_exception_exit(regs);
-	local_daif_restore(DAIF_PROCCTX);
-	arm64_exit_to_user_mode(regs);
+	hwstate = arm64_unmask_exc_context(PROCESS_CONTEXT);
+	arm64_exit_to_user_mode(regs, hwstate);
 }
 
 static void noinstr el0_softstp(struct pt_regs *regs, unsigned long esr)
 {
+	arm64_exc_hwstate_t hwstate;
 	bool step_done;
 
 	if (!is_ttbr0_addr(regs->pc))
@@ -722,50 +781,56 @@ static void noinstr el0_softstp(struct pt_regs *regs, unsigned long esr)
 	 * the single-step is complete.
 	 */
 	step_done = try_step_suspended_breakpoints(regs);
-	local_daif_restore(DAIF_PROCCTX);
+	hwstate = arm64_unmask_exc_context(PROCESS_CONTEXT);
 	if (!step_done)
 		do_el0_softstep(esr, regs);
-	arm64_exit_to_user_mode(regs);
+	arm64_exit_to_user_mode(regs, hwstate);
 }
 
 static void noinstr el0_watchpt(struct pt_regs *regs, unsigned long esr)
 {
 	/* Watchpoints are the only debug exception to write FAR_EL1 */
 	unsigned long far = read_sysreg(far_el1);
+	arm64_exc_hwstate_t hwstate;
 
 	arm64_enter_from_user_mode(regs);
 	debug_exception_enter(regs);
 	do_watchpoint(far, esr, regs);
 	debug_exception_exit(regs);
-	local_daif_restore(DAIF_PROCCTX);
-	arm64_exit_to_user_mode(regs);
+	hwstate = arm64_unmask_exc_context(PROCESS_CONTEXT);
+	arm64_exit_to_user_mode(regs, hwstate);
 }
 
 static void noinstr el0_brk64(struct pt_regs *regs, unsigned long esr)
 {
+	arm64_exc_hwstate_t hwstate;
+
 	arm64_enter_from_user_mode(regs);
-	local_daif_restore(DAIF_PROCCTX);
+	hwstate = arm64_unmask_exc_context(PROCESS_CONTEXT);
 	do_el0_brk64(esr, regs);
-	arm64_exit_to_user_mode(regs);
+	arm64_exit_to_user_mode(regs, hwstate);
 }
 
 static void noinstr el0_svc(struct pt_regs *regs)
 {
+	arm64_exc_hwstate_t hwstate;
 	arm64_syscall_enter_from_user_mode(regs);
 	cortex_a76_erratum_1463225_svc_handler();
 	fpsimd_syscall_enter();
-	local_daif_restore(DAIF_PROCCTX);
+	hwstate = arm64_unmask_exc_context(PROCESS_CONTEXT);
 	do_el0_svc(regs);
-	arm64_syscall_exit_to_user_mode(regs);
+	arm64_syscall_exit_to_user_mode(regs, hwstate);
 	fpsimd_syscall_exit();
 }
 
 static void noinstr el0_fpac(struct pt_regs *regs, unsigned long esr)
 {
+	arm64_exc_hwstate_t hwstate;
+
 	arm64_enter_from_user_mode(regs);
-	local_daif_restore(DAIF_PROCCTX);
+	hwstate = arm64_unmask_exc_context(PROCESS_CONTEXT);
 	do_el0_fpac(regs, esr);
-	arm64_exit_to_user_mode(regs);
+	arm64_exit_to_user_mode(regs, hwstate);
 }
 
 asmlinkage void noinstr el0t_64_sync_handler(struct pt_regs *regs)
@@ -834,6 +899,8 @@ asmlinkage void noinstr el0t_64_sync_handler(struct pt_regs *regs)
 	default:
 		el0_inv(regs, esr);
 	}
+
+	arm64_debug_exc_context(CRITICAL_CONTEXT);
 }
 
 static void noinstr el0_interrupt(struct pt_regs *regs,
@@ -841,7 +908,7 @@ static void noinstr el0_interrupt(struct pt_regs *regs,
 {
 	arm64_enter_from_user_mode(regs);
 
-	write_sysreg(DAIF_PROCCTX_NOIRQ, daif);
+	arm64_unmask_exc_context(NONMI_CONTEXT);
 
 	if (regs->pc & BIT(55))
 		arm64_apply_bp_hardening();
@@ -850,7 +917,14 @@ static void noinstr el0_interrupt(struct pt_regs *regs,
 	do_interrupt_handler(regs, handler);
 	irq_exit_rcu();
 
-	arm64_exit_to_user_mode(regs);
+	/*
+	 * For the same reason as in el1_irq() we effectivly
+	 * have NOIRQ_CONTEXT on return from handler - keep
+	 * track of it
+	 */
+	arm64_debug_exc_context(NOIRQ_CONTEXT);
+	arm64_exit_to_user_mode(regs, arm64_exc_hwstate_of_context(NOIRQ_CONTEXT));
+	arm64_debug_exc_context(CRITICAL_CONTEXT);
 }
 
 static void noinstr __el0_irq_handler_common(struct pt_regs *regs)
@@ -876,15 +950,17 @@ asmlinkage void noinstr el0t_64_fiq_handler(struct pt_regs *regs)
 static void noinstr __el0_error_handler_common(struct pt_regs *regs)
 {
 	unsigned long esr = read_sysreg(esr_el1);
+	arm64_exc_hwstate_t hwstate;
 	irqentry_state_t state;
 
 	arm64_enter_from_user_mode(regs);
-	local_daif_restore(DAIF_ERRCTX);
+	hwstate = arm64_unmask_exc_context(ERROR_CONTEXT);
 	state = irqentry_nmi_enter(regs);
 	do_serror(regs, esr);
 	irqentry_nmi_exit(regs, state);
-	local_daif_restore(DAIF_PROCCTX);
-	arm64_exit_to_user_mode(regs);
+	hwstate = arm64_drop_exc_context(hwstate, PROCESS_CONTEXT);
+	arm64_exit_to_user_mode(regs, hwstate);
+	arm64_debug_exc_context(CRITICAL_CONTEXT);
 }
 
 asmlinkage void noinstr el0t_64_error_handler(struct pt_regs *regs)
@@ -895,27 +971,33 @@ asmlinkage void noinstr el0t_64_error_handler(struct pt_regs *regs)
 #ifdef CONFIG_COMPAT
 static void noinstr el0_cp15(struct pt_regs *regs, unsigned long esr)
 {
+	arm64_exc_hwstate_t hwstate;
+
 	arm64_enter_from_user_mode(regs);
-	local_daif_restore(DAIF_PROCCTX);
+	hwstate = arm64_unmask_exc_context(PROCESS_CONTEXT);
 	do_el0_cp15(esr, regs);
-	arm64_exit_to_user_mode(regs);
+	arm64_exit_to_user_mode(regs, hwstate);
 }
 
 static void noinstr el0_svc_compat(struct pt_regs *regs)
 {
+	arm64_exc_hwstate_t hwstate;
+
 	arm64_syscall_enter_from_user_mode(regs);
 	cortex_a76_erratum_1463225_svc_handler();
-	local_daif_restore(DAIF_PROCCTX);
+	hwstate = arm64_unmask_exc_context(PROCESS_CONTEXT);
 	do_el0_svc_compat(regs);
-	arm64_syscall_exit_to_user_mode(regs);
+	arm64_syscall_exit_to_user_mode(regs, hwstate);
 }
 
 static void noinstr el0_bkpt32(struct pt_regs *regs, unsigned long esr)
 {
+	arm64_exc_hwstate_t hwstate;
+
 	arm64_enter_from_user_mode(regs);
-	local_daif_restore(DAIF_PROCCTX);
+	hwstate = arm64_unmask_exc_context(PROCESS_CONTEXT);
 	do_bkpt32(esr, regs);
-	arm64_exit_to_user_mode(regs);
+	arm64_exit_to_user_mode(regs, hwstate);
 }
 
 asmlinkage void noinstr el0t_32_sync_handler(struct pt_regs *regs)
@@ -966,6 +1048,8 @@ asmlinkage void noinstr el0t_32_sync_handler(struct pt_regs *regs)
 	default:
 		el0_inv(regs, esr);
 	}
+
+	arm64_debug_exc_context(CRITICAL_CONTEXT);
 }
 
 asmlinkage void noinstr el0t_32_irq_handler(struct pt_regs *regs)
diff --git a/arch/arm64/kernel/entry.S b/arch/arm64/kernel/entry.S
index f63049ac32dc..cb3be770f2d0 100644
--- a/arch/arm64/kernel/entry.S
+++ b/arch/arm64/kernel/entry.S
@@ -316,7 +316,7 @@ alternative_else_nop_endif
 
 	mrs_s	x20, SYS_ICC_PMR_EL1
 	str	w20, [sp, #S_PMR]
-	mov	x20, #GIC_PRIO_IRQON | GIC_PRIO_PSR_I_SET
+	mov	x20, #GIC_PRIO_IRQON
 	msr_s	SYS_ICC_PMR_EL1, x20
 
 .Lskip_pmr_save\@:
diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index cdcdd160e5b6..1e08537df67b 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -185,7 +185,7 @@ static void init_gic_priority_masking(void)
 	WARN_ON(!(cpuflags & PSR_I_BIT));
 	WARN_ON(!(cpuflags & PSR_F_BIT));
 
-	gic_write_pmr(GIC_PRIO_IRQON | GIC_PRIO_PSR_I_SET);
+	gic_write_pmr(GIC_PRIO_IRQON);
 }
 
 /*
-- 
2.34.1


