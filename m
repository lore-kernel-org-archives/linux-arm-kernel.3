Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35701C44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 12:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WZTpBRbB9rxEI9uOVbwEEDKigL5oieb+Ft9N0NZZyhQ=; b=2S+0ddQtrMT+6v
	fGhGAcvmEbV/OmtDagdnQ5PyXN/yWZLoafwbYu/YuKlX7aIOPKYQJkLO8Av9GItopCFupl3K2DDOX
	zIhyeyGoWmlVbwgMXUNlXB/g3d6ofpMFZiZ75YdgdWZsi40lWlUU3PRnzsGCmYcaxSvaK0r0xyQn3
	zLZZgaZ7EqIf8GC9MfImOHdXC6ucvLLtyfEHJLc4DspAAhCN2g8/sM5fUI/D/QJWA/n+3RW9O/qKY
	CJ80yNT+uvLwi3gNbU6mvnTlrdfzwsfAbGoovj9R9UQY0FW5w2Sagm6O38oTOHlXr4gr0akaS0sNp
	QdzHsSY8X+EjmKBMz3fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whneS-00000002LXS-2Bwu;
	Thu, 09 Jul 2026 12:14:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whneH-00000002L6S-1fek
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 12:14:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3DFFB1476;
	Thu,  9 Jul 2026 05:14:32 -0700 (PDT)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4C47B3F66F;
	Thu,  9 Jul 2026 05:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783599276; bh=UXi6KGt3ihZ1S6XOTRgIMvo7DDQHKsocyrHaM0bxntE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mi7UP1Tun+AUM8gqaHd9kud/CqCXskG5PGuBfOsQFfCAkMDOSgyA2orhPBINBZrxY
	 sbibBATrCRXlaua83T2tgkA988HvDyt5wZN+4E15kBOozz/AoZemQgep7NJyK8XNFQ
	 EEVl1bD8KW3CAE+QzKnrh5+lREdkI3U9+a6U8d+A=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [RFC PATCH 29/36] arm64: nmi: Manage masking for superpriority interrupts
Date: Thu,  9 Jul 2026 13:13:26 +0100
Message-Id: <20260709121333.23507-30-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20260709121333.23507-1-vladimir.murzin@arm.com>
References: <20260709121333.23507-1-vladimir.murzin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_051437_529313_C41E8B24 
X-CRM114-Status: GOOD (  19.26  )
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
Cc: mark.rutland@arm.com, maz@kernel.org, ruanjinjie@huawei.com, Mark Brown <broonie@kernel.org>, catalin.marinas@arm.com, will@kernel.org
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
---
 arch/arm64/include/asm/assembler.h            | 20 ++++++++-
 .../include/asm/interrupts/common_flags.h     | 41 +++++++++++++++++--
 arch/arm64/include/asm/interrupts/entry.h     | 18 +++++---
 arch/arm64/include/asm/interrupts/masking.h   | 25 ++++++-----
 arch/arm64/include/asm/irqflags.h             |  1 +
 arch/arm64/kernel/entry.S                     | 12 +++---
 6 files changed, 89 insertions(+), 28 deletions(-)

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
index 72ed6e75d146..315aaec3ea34 100644
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
@@ -165,7 +189,7 @@ void arm64_debug_exc_context(arm64_exc_context_t context)
 }
 
 static __always_inline
-void arm64_update_exc_hwstate(arm64_exc_hwstate_t hwstate, bool update_pmr)
+void arm64_update_exc_hwstate(arm64_exc_hwstate_t hwstate, bool update_pmr, bool update_allint)
 {
 	if (system_uses_irq_prio_masking() &&
 	    update_pmr &&
@@ -193,8 +217,19 @@ void arm64_update_exc_hwstate(arm64_exc_hwstate_t hwstate, bool update_pmr)
 		pmr_sync();
 	}
 
+	/*
+	 * Try to order ALLINT writes to be consistent with the DAIF state :
+	 * we don't want to take an NMI with DAIF masked or when it should
+	 * be masked but isn't yet.
+	 */
+	if (system_uses_nmi() && update_allint && hwstate.allint)
+		_allint_set();
+
 	write_sysreg(hwstate.daif, daif);
 
+	if (system_uses_nmi() && update_allint && !hwstate.allint)
+		_allint_clear();
+
 	if (system_uses_irq_prio_masking() &&
 	    update_pmr &&
 	    hwstate.pmr == GIC_PRIO_IRQON) {
@@ -204,10 +239,10 @@ void arm64_update_exc_hwstate(arm64_exc_hwstate_t hwstate, bool update_pmr)
 }
 
 static __always_inline
-void arm64_update_exc_context(arm64_exc_context_t context, bool update_pmr)
+void arm64_update_exc_context(arm64_exc_context_t context, bool update_pmr,  bool update_allint)
 {
 	arm64_exc_hwstate_t hwstate = arm64_exc_hwstate_of_context(context);
 
-	arm64_update_exc_hwstate(hwstate, update_pmr);
+	arm64_update_exc_hwstate(hwstate, update_pmr, update_allint);
 }
 #endif /* __ASM_INTERRUPTS_COMMON_FLAGS_H */
diff --git a/arch/arm64/include/asm/interrupts/entry.h b/arch/arm64/include/asm/interrupts/entry.h
index 3034c490ed66..986536ecd058 100644
--- a/arch/arm64/include/asm/interrupts/entry.h
+++ b/arch/arm64/include/asm/interrupts/entry.h
@@ -10,12 +10,12 @@
 #include <asm/cpufeature.h>
 #include <asm/interrupts/common_flags.h>
 
-
 static __always_inline
 arm64_exc_hwstate_t __arm64_switch_exc_hwstate_to(arm64_exc_hwstate_t prev,
 						  arm64_exc_hwstate_t next)
 {
 	bool update_pmr = system_uses_irq_prio_masking() && prev.pmr != next.pmr;
+	bool update_allint = system_uses_nmi() && prev.allint != next.allint;
 
 	arm64_debug_exc_hwstate(prev);
 
@@ -25,7 +25,7 @@ arm64_exc_hwstate_t __arm64_switch_exc_hwstate_to(arm64_exc_hwstate_t prev,
 	if (!arch_irqs_disabled_flags(next.flags))
 		trace_hardirqs_on();
 
-	arm64_update_exc_hwstate(next, update_pmr);
+	arm64_update_exc_hwstate(next, update_pmr, update_allint);
 
 	if (arch_irqs_disabled_flags(next.flags))
 		trace_hardirqs_off();
@@ -49,15 +49,18 @@ arm64_exc_hwstate_t arm64_drop_exc_context(arm64_exc_hwstate_t prev, arm64_exc_c
 
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
@@ -74,6 +77,7 @@ arm64_exc_hwstate_t arm64_lift_exc_context(arm64_exc_hwstate_t prev, arm64_exc_c
 
 	if (IS_ENABLED(CONFIG_DEBUG_IRQFLAGS)) {
 		bool pnmi = system_uses_irq_prio_masking();
+		bool nmi = system_uses_nmi();
 
 		WARN_ON_ONCE(context < CRITICAL_CONTEXT &&
 			     prev.daif == DAIF_MASK);
@@ -82,11 +86,13 @@ arm64_exc_hwstate_t arm64_lift_exc_context(arm64_exc_hwstate_t prev, arm64_exc_c
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
index 9dc37a571094..178e915f43b9 100644
--- a/arch/arm64/include/asm/interrupts/masking.h
+++ b/arch/arm64/include/asm/interrupts/masking.h
@@ -30,6 +30,7 @@ arm64_exc_hwstates_t local_all_irqs_save_mask(arm64_exc_context_t new)
 
 	if (IS_ENABLED(CONFIG_DEBUG_IRQFLAGS)) {
 		bool pnmi = system_uses_irq_prio_masking();
+		bool nmi = system_uses_nmi();
 
 		WARN_ON_ONCE(new < CRITICAL_CONTEXT &&
 			     actual.daif == DAIF_MASK);
@@ -38,14 +39,16 @@ arm64_exc_hwstates_t local_all_irqs_save_mask(arm64_exc_context_t new)
 			     actual.daif == DAIF_ERRCTX);
 
 		WARN_ON_ONCE(new < NONMI_CONTEXT &&
-			     pnmi && actual.daif == DAIF_PROCCTX_NOIRQ);
+			     ((pnmi && actual.daif == DAIF_PROCCTX_NOIRQ) ||
+			      (nmi &&  actual.daif == DAIF_PROCCTX_NOIRQ && actual.allint == ALLINT_ALLINT)));
 
 		WARN_ON_ONCE(new < NOIRQ_CONTEXT &&
 			     ((pnmi && actual.pmr == GIC_PRIO_IRQOFF) ||
-			      (!pnmi && actual.daif == DAIF_PROCCTX_NOIRQ)));
+			      (nmi && actual.daif == DAIF_PROCCTX_NOIRQ && actual.allint != ALLINT_ALLINT) ||
+			      (!pnmi && !nmi && actual.daif == DAIF_PROCCTX_NOIRQ)));
 	}
 
-	arm64_update_exc_hwstate(state, actual.pmr != state.pmr);
+	arm64_update_exc_hwstate(state, actual.pmr != state.pmr, actual.allint != state.allint);
 
 	if (!arch_irqs_disabled_flags(actual.flags))
 		trace_hardirqs_off();
@@ -60,7 +63,7 @@ static inline void local_all_irqs_restore(arm64_exc_hwstates_t states)
 	if (!arch_irqs_disabled_flags(states.saved.flags))
 		trace_hardirqs_on();
 
-	arm64_update_exc_hwstate(states.saved, true);
+	arm64_update_exc_hwstate(states.saved, true, true);
 }
 
 #ifdef CONFIG_DEBUG_IRQFLAGS
@@ -70,7 +73,7 @@ void local_all_irqs_cpu_init_mask(arm64_exc_context_t context)
 	WARN_ON(__this_cpu_read(irqs_masks_cpu_init_done));
 	if (context == PROCESS_CONTEXT)
 		trace_hardirqs_on();
-	arm64_update_exc_context(context, true);
+	arm64_update_exc_context(context, true, true);
 	__this_cpu_write(irqs_masks_cpu_init_done, true);
 	__this_cpu_write(irqs_masks_cpu_final_done, false);
 }
@@ -78,7 +81,7 @@ void local_all_irqs_cpu_init_mask(arm64_exc_context_t context)
 static inline void local_all_irqs_final_mask(void)
 {
 	WARN_ON(__this_cpu_read(irqs_masks_cpu_final_done));
-	arm64_update_exc_context(CRITICAL_CONTEXT, true);
+	arm64_update_exc_context(CRITICAL_CONTEXT, true, true);
 	trace_hardirqs_off();
 	__this_cpu_write(irqs_masks_cpu_final_done, true);
 	__this_cpu_write(irqs_masks_cpu_init_done, false);
@@ -89,12 +92,12 @@ void local_all_irqs_cpu_init_mask(arm64_exc_context_t context)
 {
 	if (context == PROCESS_CONTEXT)
 		trace_hardirqs_on();
-	arm64_update_exc_context(context, true);
+	arm64_update_exc_context(context, true, true);
 }
 
 static inline void local_all_irqs_final_mask(void)
 {
-	arm64_update_exc_context(CRITICAL_CONTEXT, true);
+	arm64_update_exc_context(CRITICAL_CONTEXT, true, true);
 	trace_hardirqs_off();
 }
 #endif /* CONFIG_DEBUG_IRQFLAGS */
@@ -130,7 +133,7 @@ static inline arm64_exc_hwstates_t local_all_irqs_force_daif_save(void)
 		states.expected.daif = states.saved.daif | DAIF_PROCCTX_NOIRQ;
 		states.expected.pmr = GIC_PRIO_IRQON;
 
-		arm64_update_exc_hwstate(states.expected, true);
+		arm64_update_exc_hwstate(states.expected, true, false);
 	}
 
 	return states;
@@ -153,7 +156,7 @@ void local_all_irqs_force_daif_restore(arm64_exc_hwstates_t states)
 
 	if (system_uses_irq_prio_masking()) {
 		arm64_debug_exc_hwstate(states.expected);
-		arm64_update_exc_hwstate(states.saved, true);
+		arm64_update_exc_hwstate(states.saved, true, false);
 	}
 }
 
@@ -167,7 +170,7 @@ static inline void local_interrupt_priority_init(void)
 	WARN_ON(read_sysreg(daif) & PSR_A_BIT);
 	lockdep_assert_irqs_disabled();
 
-	arm64_update_exc_context(NOIRQ_CONTEXT, true);
+	arm64_update_exc_context(NOIRQ_CONTEXT, true, true);
 }
 
 #endif /* __ASM_INTERRUPTS_MASKING_H */
diff --git a/arch/arm64/include/asm/irqflags.h b/arch/arm64/include/asm/irqflags.h
index 585d3ce15d80..b571d34bf11d 100644
--- a/arch/arm64/include/asm/irqflags.h
+++ b/arch/arm64/include/asm/irqflags.h
@@ -31,6 +31,7 @@
 typedef union arm64_exc_hwstate {
 	struct {
 		u16 daif;
+		u16 allint;
 		u8 pmr;
 	};
 	unsigned long flags;
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


