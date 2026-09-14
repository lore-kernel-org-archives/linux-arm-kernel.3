Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 448EFC88E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 10:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9NJC84D6HrWKocB42GlQqHidgAwqMKgucFqBV41P32c=; b=N2DrkmYOwZvVUGi/6SZZYQiVks
	7MeORGgp7JL/CYFsvQimbvgckXmHR7l4X2nVjKCFyT93T4drBCkjd5f6dD/MMoBy+usecFFN5Q3JX
	djmk42rFvxV0k+Hntj/Cu/B+2P4LuLomDROC2zO5hvZ6LYIzMGlIyjG1jCrP6KJfwgMW2S7GaBtbU
	7CK90Q5zn+c+CuNRszp5SzqVLupVMfnoHec1FJxIx4WXpcQjoZ4vY8+oaofuNUCUUsrbssKPOx1IS
	YvXF+cE8RCR/cK8OcEZ/ab4ldH2sghPsBy2yrEe6FrcQikEhHEszg633/ljH/dOHM9OKEs2e9jcz/
	eDwvljeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x63oe-000000035Ho-12PW;
	Mon, 14 Sep 2026 10:21:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x63oa-000000035Fw-0mVi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 10:21:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 101E71C2B;
	Mon, 14 Sep 2026 03:21:27 -0700 (PDT)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9112A3F7B4;
	Mon, 14 Sep 2026 03:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789381290; bh=54p12eNpg4ytJxGDn81O26e3zwES4lX5OWhnxS/lmwU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lfWQXQB9YMjWoeoZmKcFaeHKb20ygbIxfwFeZDuSDWKg1pbmQkctsULRM6Sk0Fm+o
	 wycpFfPuHENcmNAigkQ+onjXa0AB5AAm1OM6JhXnsvSBJ9EH4Cmmr3OybfySellQ+1
	 a/lCRX/IeH9qt7jO91grY0gFdO2A2X/o4rwHYrhU=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	maz@kernel.org,
	lpieralisi@kernel.org,
	ruanjinjie@huawei.com,
	liaochang1@huawei.com
Subject: [PATCH 02/38] arm64: irqflags: save and use both DAIF and PMR
Date: Mon, 14 Sep 2026 11:20:26 +0100
Message-Id: <20260914102102.68597-3-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20260914102102.68597-1-vladimir.murzin@arm.com>
References: <20260914102102.68597-1-vladimir.murzin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_032132_304549_157F946F 
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

With pseudo-NMIs enabled, both DAIF and the PMR affect interrupt masking.
Now that we have a type which can track both of them at the same time,
update our irqflags implementation to use it.

Save DAIF flags in all cases, as they can be manipulated directly by other
code, and the PMR if it is in use.

When checking if IRQs are disabled, now that we always save DAIF we
can check that the I flag is set and bypass checking the PMR if it is.
We can also properly check if PMR masks interrupts, now that we don't
need to rely on the GIC_PRIO_PSR_I_SET bit being set in the PMR to
know if DAIF is already masking interrupts.  Update
`irqs_priority_unmasked()` to align with this change.

This allows us to remove the `__daif_...` and `__pmr_...` versions
of the save and check functions, as they are now unified.

We can reasonably merge the two `__{daif,pmr}_irq_restore()` functions
in the main one, as the DAIF and PMR values are properly split now.

Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/include/asm/irqflags.h | 118 +++++++-----------------------
 arch/arm64/include/asm/ptrace.h   |  18 +++--
 2 files changed, 38 insertions(+), 98 deletions(-)

diff --git a/arch/arm64/include/asm/irqflags.h b/arch/arm64/include/asm/irqflags.h
index 5c17e26727f9..9f5c774cbe68 100644
--- a/arch/arm64/include/asm/irqflags.h
+++ b/arch/arm64/include/asm/irqflags.h
@@ -97,135 +97,69 @@ static __always_inline void arch_local_irq_disable(void)
 	}
 }
 
-static __always_inline unsigned long __daif_local_save_flags(void)
-{
-	arm64_exc_hwstate_t hwstate = { .daif = read_sysreg(daif) };
-
-	return hwstate.flags;
-}
-
-static __always_inline unsigned long __pmr_local_save_flags(void)
-{
-	arm64_exc_hwstate_t hwstate = { .pmr = read_sysreg_s(SYS_ICC_PMR_EL1) };
-
-	return hwstate.flags;
-}
-
 /*
  * Save the current interrupt enable state.
  */
 static __always_inline unsigned long arch_local_save_flags(void)
 {
-	if (system_uses_irq_prio_masking()) {
-		return __pmr_local_save_flags();
-	} else {
-		return __daif_local_save_flags();
-	}
-}
+	arm64_exc_hwstate_t hwstate = { .daif = read_sysreg(daif) };
 
-static __always_inline bool __daif_irqs_disabled_flags(unsigned long flags)
-{
-	arm64_exc_hwstate_t hwstate = { .flags = flags };
+	if (system_uses_irq_prio_masking())
+		hwstate.pmr = read_sysreg_s(SYS_ICC_PMR_EL1);
 
-	return hwstate.daif & PSR_I_BIT;
+	return hwstate.flags;
 }
 
-static __always_inline bool __pmr_irqs_disabled_flags(unsigned long flags)
+static __always_inline bool arch_irqs_disabled_flags(unsigned long flags)
 {
 	arm64_exc_hwstate_t hwstate = { .flags = flags };
 
-	return hwstate.pmr != GIC_PRIO_IRQON;
-}
+	if (hwstate.daif & PSR_I_BIT)
+		return true;
 
-static __always_inline bool arch_irqs_disabled_flags(unsigned long flags)
-{
 	if (system_uses_irq_prio_masking()) {
-		return __pmr_irqs_disabled_flags(flags);
-	} else {
-		return __daif_irqs_disabled_flags(flags);
-	}
-}
+		WARN_ON_ONCE(IS_ENABLED(CONFIG_DEBUG_IRQFLAGS) &&
+			     hwstate.pmr != GIC_PRIO_IRQOFF &&
+			     hwstate.pmr != GIC_PRIO_IRQON);
 
-static __always_inline bool __daif_irqs_disabled(void)
-{
-	return __daif_irqs_disabled_flags(__daif_local_save_flags());
-}
+		return hwstate.pmr != GIC_PRIO_IRQON;
+	}
 
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
+	return arch_irqs_disabled_flags(arch_local_save_flags());
 }
 
-static __always_inline unsigned long __daif_local_irq_save(void)
-{
-	unsigned long flags = __daif_local_save_flags();
-
-	__daif_local_irq_disable();
-
-	return flags;
-}
-
-static __always_inline unsigned long __pmr_local_irq_save(void)
+static __always_inline unsigned long arch_local_irq_save(void)
 {
-	unsigned long flags = __pmr_local_save_flags();
+	unsigned long flags = arch_local_save_flags();
 
-	/*
-	 * There are too many states with IRQs disabled, just keep the current
-	 * state if interrupts are already disabled/masked.
-	 */
-	if (!__pmr_irqs_disabled_flags(flags))
+	if (system_uses_irq_prio_masking())
 		__pmr_local_irq_disable();
+	else
+		__daif_local_irq_disable();
 
 	return flags;
 }
 
-static __always_inline unsigned long arch_local_irq_save(void)
-{
-	if (system_uses_irq_prio_masking()) {
-		return __pmr_local_irq_save();
-	} else {
-		return __daif_local_irq_save();
-	}
-}
-
-static __always_inline void __daif_local_irq_restore(unsigned long flags)
-{
-	arm64_exc_hwstate_t hwstate = { .flags = flags };
-
-	barrier();
-	write_sysreg(hwstate.daif, daif);
-	barrier();
-}
-
-static __always_inline void __pmr_local_irq_restore(unsigned long flags)
-{
-	arm64_exc_hwstate_t hwstate = { .flags = flags };
-
-	barrier();
-	write_sysreg_s(hwstate.pmr, SYS_ICC_PMR_EL1);
-	pmr_sync();
-	barrier();
-}
-
 /*
  * restore saved IRQ state
  */
 static __always_inline void arch_local_irq_restore(unsigned long flags)
 {
+	arm64_exc_hwstate_t hwstate = { .flags = flags };
+
+	barrier();
 	if (system_uses_irq_prio_masking()) {
-		__pmr_local_irq_restore(flags);
+		write_sysreg_s(hwstate.pmr, SYS_ICC_PMR_EL1);
+		pmr_sync();
 	} else {
-		__daif_local_irq_restore(flags);
+		write_sysreg(hwstate.daif, daif);
 	}
+	barrier();
 }
 
 #endif /* __ASM_IRQFLAGS_H */
diff --git a/arch/arm64/include/asm/ptrace.h b/arch/arm64/include/asm/ptrace.h
index f7dc5fb9427d..e4c7e6bafa3d 100644
--- a/arch/arm64/include/asm/ptrace.h
+++ b/arch/arm64/include/asm/ptrace.h
@@ -203,14 +203,20 @@ static inline void forget_syscall(struct pt_regs *regs)
 #define processor_mode(regs) \
 	((regs)->pstate & PSR_MODE_MASK)
 
-#define irqs_priority_unmasked(regs)					\
-	(system_uses_irq_prio_masking() ?				\
-		(regs)->pmr == GIC_PRIO_IRQON :				\
-		true)
-
 static __always_inline bool regs_irqs_disabled(const struct pt_regs *regs)
 {
-	return (regs->pstate & PSR_I_BIT) || !irqs_priority_unmasked(regs);
+	if (regs->pstate & PSR_I_BIT)
+		return true;
+
+	if (system_uses_irq_prio_masking()) {
+		WARN_ON_ONCE(IS_ENABLED(CONFIG_DEBUG_IRQFLAGS) &&
+			     regs->pmr != GIC_PRIO_IRQOFF &&
+			     regs->pmr != GIC_PRIO_IRQON);
+
+		return regs->pmr != GIC_PRIO_IRQON;
+	}
+
+	return false;
 }
 
 #define interrupts_enabled(regs)	(!regs_irqs_disabled(regs))
-- 
2.34.1


