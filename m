Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A4BFC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 12:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fSHPYDeUbGcPpczzTTD/gMsTdi8kUY4i9SDktRFG6FE=; b=qeMDdc/s4CMovB
	xmQ159bKGsLwjg3XL/ont9kOZiHs4uIi8/FRzu3J3D3QsgqtNSB+Q+IdAXbOqPYmfLcGJwKfsG0P7
	QhC2SltPkY2HgmFJZsqqRuOSIIxOmCxDp2XbxZZlFanUOxMTOCFyATax5Bu1PC1NTSm5F+UmgBq+Y
	8VjQPDlzShU512AmGcFoust44J9lZ0J3TMIPQd+S/CvuGj7a9F9N3DfF1+Nnneh8FO+sreE290bjv
	JwvGc2pYIP+n3TPz1J/eBB5v+fsB6rzfSpOBuuNsFyDGIMoipK+Mz3QrFbFPOOU6QnVK5zQqpC1Lr
	+jB6RXZuS6x6Nyc/gvbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whndx-00000002Kf2-1jQG;
	Thu, 09 Jul 2026 12:14:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whndp-00000002KOh-2ISD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 12:14:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 87CC13594;
	Thu,  9 Jul 2026 05:14:04 -0700 (PDT)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B836C3F66F;
	Thu,  9 Jul 2026 05:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783599248; bh=h3lXAPv/VteuO0oogwUFkjioHpw3Kv84Hjp9VZOZJTc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=agx7lA1B6kI1nI/gV6uDDohsZ9r1AzNVA+2DlLjhsg5ZFcLf/EtsWmzj8DQ/bO6Ch
	 XXYIB+DSdMU8VLoBAiPlGBt0nBaE9YMLDYHUs/v1eJ8OJXGZikaZNzDnCHtNAMIGDr
	 YxbHYdn+9UicYnaSfCq881ceR1qERy2DK0qzOpGA=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [RFC PATCH 10/36] arm64: irqflags: save and use both DAIF and PMR
Date: Thu,  9 Jul 2026 13:13:07 +0100
Message-Id: <20260709121333.23507-11-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20260709121333.23507-1-vladimir.murzin@arm.com>
References: <20260709121333.23507-1-vladimir.murzin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_051409_666945_F85C0B28 
X-CRM114-Status: GOOD (  19.47  )
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
Cc: mark.rutland@arm.com, maz@kernel.org, ruanjinjie@huawei.com, catalin.marinas@arm.com, will@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Ada Couprie Diaz <ada.coupriediaz@arm.com>

With pseudo-NMIs enabled, both DAIF and the PMR affect interrupt masking.
Now that we have a type which can track both of them at the same time,
update our irqflags implementation to use it.

Save DAIF flags in all cases, as they can be manipulated directly by other
code, and the PMR if it is in use.

When checking if IRQs are disabled, now that we always save DAIF we can
check that the I flag is set and bypass checking the PMR if it is.
We can also properly check if PMR masks interrupts (PMR < GIC_PRIO_IRQON),
now that we don't need to rely on the GIC_PRIO_PSR_I_SET bit being set in
the PMR to know if DAIF is already masking interrupts.
Update `irqs_priority_unmasked()` to align with this change.

This allows us to remove the `__daif_...` and `__pmr_...` versions
of the save and check functions, as they are now unified.

We can reasonably merge the two `__{daif,pmr}_irq_restore()` functions
in the main one, as the DAIF and PMR values are properly split now.

Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
---
 arch/arm64/include/asm/irqflags.h | 110 ++++++------------------------
 arch/arm64/include/asm/ptrace.h   |   2 +-
 2 files changed, 23 insertions(+), 89 deletions(-)

diff --git a/arch/arm64/include/asm/irqflags.h b/arch/arm64/include/asm/irqflags.h
index 7775904ba6a9..62f047702493 100644
--- a/arch/arm64/include/asm/irqflags.h
+++ b/arch/arm64/include/asm/irqflags.h
@@ -95,117 +95,48 @@ static __always_inline void arch_local_irq_disable(void)
 	}
 }
 
-static __always_inline arm64_exc_hwstate_t __daif_local_save_flags(void)
-{
-	return (arm64_exc_hwstate_t){ .daif = read_sysreg(daif) };
-}
-
-static __always_inline arm64_exc_hwstate_t __pmr_local_save_flags(void)
-{
-	return (arm64_exc_hwstate_t){ .pmr = read_sysreg_s(SYS_ICC_PMR_EL1) };
-}
-
 /*
  * Save the current interrupt enable state.
  */
 static __always_inline unsigned long arch_local_save_flags(void)
 {
-	if (system_uses_irq_prio_masking()) {
-		return __pmr_local_save_flags().flags;
-	} else {
-		return __daif_local_save_flags().flags;
-	}
-}
+	arm64_exc_hwstate_t hwstate = { .daif = read_sysreg(daif) };
 
-static __always_inline
-bool __daif_irqs_disabled_flags(arm64_exc_hwstate_t hwstate)
-{
-	return hwstate.daif & PSR_I_BIT;
-}
+	if (system_uses_irq_prio_masking())
+		hwstate.pmr = read_sysreg_s(SYS_ICC_PMR_EL1);
 
-static __always_inline
-bool __pmr_irqs_disabled_flags(arm64_exc_hwstate_t hwstate)
-{
-	return hwstate.pmr != GIC_PRIO_IRQON;
+	return hwstate.flags;
 }
 
 static __always_inline bool arch_irqs_disabled_flags(unsigned long flags)
 {
 	arm64_exc_hwstate_t hwstate = { .flags = flags };
 
-	if (system_uses_irq_prio_masking()) {
-		return __pmr_irqs_disabled_flags(hwstate);
-	} else {
-		return __daif_irqs_disabled_flags(hwstate);
-	}
-}
+	/* If I is set, the PMR doesn't matter: interrupts will not be taken. */
+	if (hwstate.daif & PSR_I_BIT)
+		return true;
 
-static __always_inline bool __daif_irqs_disabled(void)
-{
-	return __daif_irqs_disabled_flags(__daif_local_save_flags());
-}
+	if (system_uses_irq_prio_masking() && hwstate.pmr < GIC_PRIO_IRQON)
+		return true;
 
-static __always_inline bool __pmr_irqs_disabled(void)
-{
-	return __pmr_irqs_disabled_flags(__pmr_local_save_flags());
+	return false;
 }
 
 static __always_inline bool arch_irqs_disabled(void)
 {
-	if (system_uses_irq_prio_masking()) {
-		return __pmr_irqs_disabled();
-	} else {
-		return __daif_irqs_disabled();
-	}
-}
-
-static __always_inline arm64_exc_hwstate_t __daif_local_irq_save(void)
-{
-	arm64_exc_hwstate_t hwstate = __daif_local_save_flags();
-
-	__daif_local_irq_disable();
-
-	return hwstate;
-}
-
-static __always_inline arm64_exc_hwstate_t __pmr_local_irq_save(void)
-{
-	arm64_exc_hwstate_t hwstate = __pmr_local_save_flags();
-
-	/*
-	 * There are too many states with IRQs disabled, just keep the current
-	 * state if interrupts are already disabled/masked.
-	 */
-	if (!__pmr_irqs_disabled_flags(hwstate))
-		__pmr_local_irq_disable();
-
-	return hwstate;
+	return arch_irqs_disabled_flags(arch_local_save_flags());
 }
 
 static __always_inline unsigned long arch_local_irq_save(void)
 {
-	if (system_uses_irq_prio_masking()) {
-		return __pmr_local_irq_save().flags;
-	} else {
-		return __daif_local_irq_save().flags;
-	}
-}
+	unsigned long flags = arch_local_save_flags();
 
-static __always_inline
-void __daif_local_irq_restore(arm64_exc_hwstate_t hwstate)
-{
-	barrier();
-	write_sysreg(hwstate.daif, daif);
-	barrier();
-}
+	if (system_uses_irq_prio_masking())
+		__pmr_local_irq_disable();
+	else
+		__daif_local_irq_disable();
 
-static __always_inline
-void __pmr_local_irq_restore(arm64_exc_hwstate_t hwstate)
-{
-	barrier();
-	write_sysreg_s(hwstate.pmr, SYS_ICC_PMR_EL1);
-	pmr_sync();
-	barrier();
+	return flags;
 }
 
 /*
@@ -215,11 +146,14 @@ static __always_inline void arch_local_irq_restore(unsigned long flags)
 {
 	arm64_exc_hwstate_t hwstate = { .flags = flags };
 
+	barrier();
 	if (system_uses_irq_prio_masking()) {
-		__pmr_local_irq_restore(hwstate);
+		write_sysreg_s(hwstate.pmr, SYS_ICC_PMR_EL1);
+		pmr_sync();
 	} else {
-		__daif_local_irq_restore(hwstate);
+		write_sysreg(hwstate.daif, daif);
 	}
+	barrier();
 }
 
 #endif /* __ASM_IRQFLAGS_H */
diff --git a/arch/arm64/include/asm/ptrace.h b/arch/arm64/include/asm/ptrace.h
index f7dc5fb9427d..192eb97cd50b 100644
--- a/arch/arm64/include/asm/ptrace.h
+++ b/arch/arm64/include/asm/ptrace.h
@@ -205,7 +205,7 @@ static inline void forget_syscall(struct pt_regs *regs)
 
 #define irqs_priority_unmasked(regs)					\
 	(system_uses_irq_prio_masking() ?				\
-		(regs)->pmr == GIC_PRIO_IRQON :				\
+		(regs)->pmr >= GIC_PRIO_IRQON :				\
 		true)
 
 static __always_inline bool regs_irqs_disabled(const struct pt_regs *regs)
-- 
2.34.1


