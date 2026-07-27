Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EB7BC54F53
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 16:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dMqp6PhYXi/p9o05v9d3CibfeY92Sjja5zKLLK5iUYM=; b=QcWPQ6kxBBPL98e+AMvUVC5v3L
	LfMFLh//LsgaNaJRQdYxs5wuX1TPlbWY+8AUmWog75gJD7+fOFN/joA8Gr1dvx2gfqpUOD5IE2EBk
	x/dTYIDE/h4bdubPQpplyiWirMkm/BIiziaLZjLq/SvucMgUrygLMsDxNZ50zW/HkF+i1if25NxQ7
	qYwO+DkXko6Cu5vQ0cQR99uJuBFV9Y2fErkZxLZuOPZm2YTJK+RpzYC3RvjpMvbj36cvE4RtqCCdV
	GeZFTIRi4jA7ZkGS040eWOiL6qhuBxq9QqniccONG6R8zbVBNkQFh6QM24UGIt1uN911sNnoOTsEF
	4HFeo28A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woOKp-00000003OM9-0g31;
	Mon, 27 Jul 2026 16:37:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woOJ6-00000003N2l-2FMI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 16:36:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F2D781682;
	Mon, 27 Jul 2026 09:35:55 -0700 (PDT)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 289463F86F;
	Mon, 27 Jul 2026 09:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785170160; bh=19yb51hsl+1D2HYVuGUyMrNOyUfZqLAk8r0z4d5I9pg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bAE//NVXKajt6nHSfJSMtfMCZyFrT18nnEW3HkTfhGcdIudjrHug9495H0qNtmon4
	 WHWHgiTRpEe33WPfE9i6XqHsF0rwXEpmxi8xIL3cn9N9ZKjQ4zg3A6c8yPb/he5+xk
	 WQ3HYug9zMhlM9pLKB3xYHBF64sn651iGw7ZAkjs=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com,
	maz@kernel.org,
	will@kernel.org,
	catalin.marinas@arm.com,
	ruanjinjie@huawei.com,
	liaochang1@huawei.com
Subject: [RFC PATCH v2 32/45] arm64: nmi: Manage masking for superpriority interrupts
Date: Mon, 27 Jul 2026 17:34:40 +0100
Message-Id: <20260727163453.7969-33-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20260727163453.7969-1-vladimir.murzin@arm.com>
References: <20260727163453.7969-1-vladimir.murzin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_093600_715848_A688E9E5 
X-CRM114-Status: GOOD (  18.88  )
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

Extend logic to handle and debug exception context/state with knowlage
of FEAT_NMI.

Take care to order writes to ALLINT relative to DAIF, as clearing
ALLINT before DAIF could result in taking an NMI while DAIF is fully
masked, as could setting it after DAIF.

Since superpriority interrupts are not masked through DAIF like pseduo
NMIs are, we also need to modify the assembler macros for managing
DAIF to ensure that the masking is done in the assembly code.

Note that save_and_disable_irq/restore_irq and
save_and_disable_daif/restore_irq pairs are used in distinct
contextes:

- former is used in context of SW PAN to quickly disable/enable
  preemption

- latter is used to completely mask all exceptions.

For that reason split save_and_disable_daif/restore_irq into more
generic exception save restore pair and plumb with FEAT_NMI logic.

Co-developed-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>

Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
---
 arch/arm64/include/asm/assembler.h            | 20 +++++++++--
 .../include/asm/interrupts/common_flags.h     | 35 +++++++++++++++++++
 arch/arm64/include/asm/interrupts/entry.h     | 18 ++++++----
 arch/arm64/include/asm/interrupts/masking.h   |  3 +-
 arch/arm64/include/asm/irqflags.h             |  3 +-
 arch/arm64/kernel/entry.S                     | 12 +++----
 6 files changed, 75 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/include/asm/assembler.h b/arch/arm64/include/asm/assembler.h
index 0b58b550e8dc..bcdbc308afba 100644
--- a/arch/arm64/include/asm/assembler.h
+++ b/arch/arm64/include/asm/assembler.h
@@ -37,11 +37,27 @@
 /*
  * Save/restore interrupts.
  */
-	.macro save_and_disable_daif, flags
-	mrs	\flags, daif
+	.macro save_and_disable_exceptions, flags, tmp
+	mrs     \flags, daif		// updates flags[9:6] with DAIF
+#ifdef CONFIG_ARM64_NMI
+alternative_if ARM64_NMI
+	mrs_s	\tmp, SYS_ALLINT	// updates tmp[13] with AllInt
+	msr_s	SYS_ALLINT_SET, xzr
+	orr	\flags, \flags, \tmp	// now flags[13,9:6] carry pair of AllInt,DAIF
+alternative_else_nop_endif
+#endif
 	msr	daifset, #0xf
 	.endm
 
+	.macro  restore_exceptions, flags
+	msr     daif, \flags		// bits other than flags[9:6] are ignored
+#ifdef CONFIG_ARM64_NMI
+alternative_if ARM64_NMI
+	msr_s	SYS_ALLINT, \flags	// bits other than flags[13] are ignored
+alternative_else_nop_endif
+#endif
+	.endm
+
 	.macro	save_and_disable_irq, flags
 	mrs	\flags, daif
 	msr	daifset, #3
diff --git a/arch/arm64/include/asm/interrupts/common_flags.h b/arch/arm64/include/asm/interrupts/common_flags.h
index c077af313d0d..d3e1b41ca9a2 100644
--- a/arch/arm64/include/asm/interrupts/common_flags.h
+++ b/arch/arm64/include/asm/interrupts/common_flags.h
@@ -20,6 +20,14 @@
 /*
  * Exception context mapping
  *
+ * FEAT_NMI
+ *
+ * CRITICAL -> DAIF + AllInt (corresponds to the state on exception entry)
+ * ERROR    ->  AIF + AllInt
+ * NONMI    ->   IF + AllInt
+ * NOIRQ    ->   IF
+ * PROCESS  ->    0
+ *
  * pseudo-NMI
  *
  * CRITICAL -> DAIF + IRQON  (corresponds to the state on exception entry)
@@ -76,6 +84,7 @@ arm64_exc_hwstate_t __arm64_exc_hwstate_of_noirq_context(void)
 		return (arm64_exc_hwstate_t){.daif=DAIF_PROCCTX, .pmr=GIC_PRIO_IRQOFF};
 
 	return (arm64_exc_hwstate_t){.daif=DAIF_PROCCTX_NOIRQ};
+
 }
 
 static __always_inline
@@ -84,6 +93,9 @@ arm64_exc_hwstate_t __arm64_exc_hwstate_of_nonmi_context(void)
 	if (system_uses_irq_prio_masking())
 		return (arm64_exc_hwstate_t){.daif=DAIF_PROCCTX_NOIRQ, .pmr=GIC_PRIO_IRQON};
 
+	if (system_uses_nmi())
+               return (arm64_exc_hwstate_t){.daif=DAIF_PROCCTX_NOIRQ, .allint=ALLINT_ALLINT};
+
 	return (arm64_exc_hwstate_t){.daif=DAIF_PROCCTX_NOIRQ};
 }
 
@@ -93,6 +105,9 @@ arm64_exc_hwstate_t __arm64_exc_hwstate_of_error_context(void)
 	if (system_uses_irq_prio_masking())
 		return (arm64_exc_hwstate_t){.daif=DAIF_ERRCTX, .pmr=GIC_PRIO_IRQON};
 
+	if (system_uses_nmi())
+		return (arm64_exc_hwstate_t){.daif=DAIF_ERRCTX, .allint=ALLINT_ALLINT};
+
 	return (arm64_exc_hwstate_t){.daif=DAIF_ERRCTX};
 }
 
@@ -102,6 +117,9 @@ arm64_exc_hwstate_t __arm64_exc_hwstate_of_critical_context(void)
 	if (system_uses_irq_prio_masking())
 		return (arm64_exc_hwstate_t){.daif=DAIF_MASK, .pmr=GIC_PRIO_IRQON};
 
+	if (system_uses_nmi())
+		return (arm64_exc_hwstate_t){.daif=DAIF_MASK, .allint=ALLINT_ALLINT};
+
 	return (arm64_exc_hwstate_t){.daif=DAIF_MASK};
 }
 
@@ -131,6 +149,9 @@ arm64_exc_hwstate_t arm64_inherit_exc_hwstate(struct pt_regs *regs)
 	if (system_uses_irq_prio_masking())
 		state.pmr = regs->pmr;
 
+	if (system_uses_nmi())
+		state.allint = regs->pstate & PSR_ALLINT_BIT;
+
 	return state;
 }
 
@@ -150,6 +171,9 @@ void arm64_debug_exc_hwstate(arm64_exc_hwstate_t expected)
 	if (system_uses_irq_prio_masking()) {
 		WARN_ONCE(1, "Unexpected DAIF+PMR: 0x%x + 0x%x (expected 0x%x + 0x%x)\n",
 			  actual.daif, actual.pmr, expected.daif, expected.pmr);
+	} else if (system_uses_nmi()) {
+		WARN_ONCE(1, "Unexpected DAIF+ALLINT: 0x%x + 0x%x (expected 0x%x + 0x%x)\n",
+			  actual.daif, actual.allint, expected.daif, expected.allint);
 	} else {
 		WARN_ONCE(1, "Unexpected DAIF: 0x%x (expected 0x%x)\n",
 			  actual.daif, expected.daif);
@@ -194,10 +218,21 @@ void __arm64_update_exc_hwstate(arm64_exc_hwstate_t hwstate, bool force)
 		write_sysreg_s(hwstate.pmr, SYS_ICC_PMR_EL1);
 	}
 
+	/*
+	 * Try to order ALLINT writes to be consistent with the DAIF state :
+	 * we don't want to take an NMI with DAIF masked or when it should
+	 * be masked but isn't yet.
+	 */
+	if (system_uses_nmi() && hwstate.allint && force)
+		_allint_set();
+
 	barrier();
 	write_sysreg(hwstate.daif, daif);
 	barrier();
 
+	if (system_uses_nmi() && !hwstate.allint && force)
+		_allint_clear();
+
 	if (system_uses_irq_prio_masking() &&
 	    hwstate.pmr == GIC_PRIO_IRQON &&
 	    force) {
diff --git a/arch/arm64/include/asm/interrupts/entry.h b/arch/arm64/include/asm/interrupts/entry.h
index d66eb5d633f0..59e1a94babcb 100644
--- a/arch/arm64/include/asm/interrupts/entry.h
+++ b/arch/arm64/include/asm/interrupts/entry.h
@@ -10,7 +10,6 @@
 #include <asm/cpufeature.h>
 #include <asm/interrupts/common_flags.h>
 
-
 static __always_inline
 arm64_exc_hwstate_t __arm64_switch_exc_hwstate_to(arm64_exc_hwstate_t prev,
 						  arm64_exc_hwstate_t next)
@@ -26,7 +25,8 @@ arm64_exc_hwstate_t __arm64_switch_exc_hwstate_to(arm64_exc_hwstate_t prev,
 	if (!irqs_disabled)
 		trace_hardirqs_on();
 
-	force = system_uses_irq_prio_masking() && prev.pmr != next.pmr;
+	force = (system_uses_irq_prio_masking() && prev.pmr != next.pmr) ||
+		(system_uses_nmi() && prev.allint != next.allint);
 
 	__arm64_update_exc_hwstate(next, force);
 
@@ -52,15 +52,18 @@ arm64_exc_hwstate_t arm64_drop_exc_context(arm64_exc_hwstate_t prev, arm64_exc_c
 
 	if (IS_ENABLED(CONFIG_DEBUG_IRQFLAGS)) {
 		bool pnmi = system_uses_irq_prio_masking();
+		bool nmi = system_uses_nmi();
 
 		WARN_ON_ONCE(context > ERROR_CONTEXT &&
 			     prev.daif == DAIF_ERRCTX);
 
 		WARN_ON_ONCE(context > NONMI_CONTEXT &&
-			     prev.daif == DAIF_PROCCTX_NOIRQ);
+			     ((nmi && prev.daif == DAIF_PROCCTX_NOIRQ && prev.allint == ALLINT_ALLINT) ||
+			      (!nmi && prev.daif == DAIF_PROCCTX_NOIRQ)));
 
 		WARN_ON_ONCE(context > NOIRQ_CONTEXT &&
-			     pnmi && prev.pmr == GIC_PRIO_IRQOFF);
+			     ((pnmi && prev.pmr == GIC_PRIO_IRQOFF) ||
+			      (nmi && prev.daif == DAIF_PROCCTX_NOIRQ && prev.allint != ALLINT_ALLINT)));
 
 		WARN_ON_ONCE(context > PROCESS_CONTEXT &&
 			     ((pnmi && prev.daif == DAIF_PROCCTX && prev.pmr == GIC_PRIO_IRQON) ||
@@ -77,6 +80,7 @@ arm64_exc_hwstate_t arm64_lift_exc_context(arm64_exc_hwstate_t prev, arm64_exc_c
 
 	if (IS_ENABLED(CONFIG_DEBUG_IRQFLAGS)) {
 		bool pnmi = system_uses_irq_prio_masking();
+		bool nmi = system_uses_nmi();
 
 		WARN_ON_ONCE(context < CRITICAL_CONTEXT &&
 			     prev.daif == DAIF_MASK);
@@ -85,11 +89,13 @@ arm64_exc_hwstate_t arm64_lift_exc_context(arm64_exc_hwstate_t prev, arm64_exc_c
 			     prev.daif == DAIF_ERRCTX);
 
 		WARN_ON_ONCE(context < NONMI_CONTEXT &&
-			     pnmi && prev.daif == DAIF_PROCCTX_NOIRQ);
+			     ((pnmi && prev.daif == DAIF_PROCCTX_NOIRQ) ||
+			      (nmi &&  prev.daif == DAIF_PROCCTX_NOIRQ && prev.allint == ALLINT_ALLINT)));
 
 		WARN_ON_ONCE(context < NOIRQ_CONTEXT &&
 			     ((pnmi && prev.pmr == GIC_PRIO_IRQOFF) ||
-			      (!pnmi && prev.daif == DAIF_PROCCTX_NOIRQ)));
+			      (nmi && prev.daif == DAIF_PROCCTX_NOIRQ && prev.allint != ALLINT_ALLINT) ||
+			      (!pnmi && !nmi && prev.daif == DAIF_PROCCTX_NOIRQ)));
 	}
 
 	return __arm64_switch_exc_hwstate_to(prev, next);
diff --git a/arch/arm64/include/asm/interrupts/masking.h b/arch/arm64/include/asm/interrupts/masking.h
index e13852442062..1f754fdf4517 100644
--- a/arch/arm64/include/asm/interrupts/masking.h
+++ b/arch/arm64/include/asm/interrupts/masking.h
@@ -30,7 +30,8 @@ arm64_exc_hwstates_t local_exceptions_save_mask(arm64_exc_context_t new)
 	 * We've just got actual HW state so we can rely on that to
 	 * optimize some unnecessary updates.
 	 */
-	force = system_uses_irq_prio_masking() && actual.pmr != state.pmr;
+	force = (system_uses_irq_prio_masking() && actual.pmr != state.pmr) ||
+		(system_uses_nmi() && actual.allint != state.allint);
 
 	if (!irqs_disabled)
 		trace_hardirqs_on();
diff --git a/arch/arm64/include/asm/irqflags.h b/arch/arm64/include/asm/irqflags.h
index 03cfcd915e62..c719b7e2912e 100644
--- a/arch/arm64/include/asm/irqflags.h
+++ b/arch/arm64/include/asm/irqflags.h
@@ -31,8 +31,9 @@
 typedef union arm64_exc_hwstate {
 	struct {
 		u16 daif;
+		u16 allint;
 		u8 pmr;
-		u8 __padding[5];
+		u8 __padding[3];
 	};
 	unsigned long flags;
 } arm64_exc_hwstate_t;
diff --git a/arch/arm64/kernel/entry.S b/arch/arm64/kernel/entry.S
index cb3be770f2d0..39ea3fdeb03a 100644
--- a/arch/arm64/kernel/entry.S
+++ b/arch/arm64/kernel/entry.S
@@ -815,7 +815,7 @@ SYM_CODE_END(__bp_harden_el1_vectors)
  *
  */
 SYM_FUNC_START(cpu_switch_to)
-	save_and_disable_daif x11
+	save_and_disable_exceptions x11, x12
 	mov	x10, #THREAD_CPU_CONTEXT
 	add	x8, x0, x10
 	mov	x9, sp
@@ -839,7 +839,7 @@ SYM_FUNC_START(cpu_switch_to)
 	ptrauth_keys_install_kernel x1, x8, x9, x10
 	scs_save x0
 	scs_load_current
-	restore_irq x11
+	restore_exceptions x11
 	ret
 SYM_FUNC_END(cpu_switch_to)
 NOKPROBE(cpu_switch_to)
@@ -866,7 +866,7 @@ NOKPROBE(ret_from_fork)
  * Calls func(regs) using this CPU's irq stack and shadow irq stack.
  */
 SYM_FUNC_START(call_on_irq_stack)
-	save_and_disable_daif x9
+	save_and_disable_exceptions x9, x10
 #ifdef CONFIG_SHADOW_CALL_STACK
 	get_current_task x16
 	scs_save x16
@@ -881,10 +881,10 @@ SYM_FUNC_START(call_on_irq_stack)
 
 	/* Move to the new stack and call the function there */
 	add	sp, x16, #IRQ_STACK_SIZE
-	restore_irq x9
+	restore_exceptions x9
 	blr	x1
 
-	save_and_disable_daif x9
+	save_and_disable_exceptions x9, x10
 	/*
 	 * Restore the SP from the FP, and restore the FP and LR from the frame
 	 * record.
@@ -892,7 +892,7 @@ SYM_FUNC_START(call_on_irq_stack)
 	mov	sp, x29
 	ldp	x29, x30, [sp], #16
 	scs_load_current
-	restore_irq x9
+	restore_exceptions x9
 	ret
 SYM_FUNC_END(call_on_irq_stack)
 NOKPROBE(call_on_irq_stack)
-- 
2.34.1


