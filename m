Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8F62C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 10:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4wwIOAOOyVnWeHiDBo83494yeq62aHiee71uo21xGNk=; b=Ll8+Hcj7shoWluGAsLpiZu2eN8
	C3me8CSocLNN8MSG7TD2SXSh/3Emyf/GZMAbchxyd444KcMfe/obUJ3SJJBJULC0ft1feA2VLSA1u
	AWG4qLKks31+9TMjvPyMvs+RcN2UqSfyKOuTepf3evXKIb7RLVJ9Q/lRQHgBhhwEh+aUhj4zAJG9g
	NFkaPP621gwJYMzy0JjqzXZAG1eSIZykbJ+zYikDCa+i71EzAOPMBP/uNR4DgwFwn7H9ec7SHlWJ4
	2O4gthipz5QUlUjHJabSQHCyLsFYJHVafFEDavnLTsIb/LiKcsJ2+alW+lrCdlkvq0s4LYKKSsNqs
	YOn74QPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x63pW-000000036Ew-3314;
	Mon, 14 Sep 2026 10:22:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x63p6-000000035lY-0sWS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 10:22:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 19F681570;
	Mon, 14 Sep 2026 03:22:00 -0700 (PDT)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 973393F7B4;
	Mon, 14 Sep 2026 03:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789381323; bh=StmBRWPLaIe0zyCfj+YoiUyBa2WWEYVkWP6jvVOqhSE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WC6x2mijcd9pQy3GxUndWNTN5T3fHpW+vGGw3vQA3D3EfRXTI3/TqHWhdveItEqXR
	 bQmwePlXI0HvinVaXOqtWl8AolwSKYJIyFxFEUHTPY4MlsTSt33nE9JeKgipfc4yV7
	 ip0oUsKG12JVpOOJzNXKnuH8zZ7lPnR8A1Aj6R9M=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	maz@kernel.org,
	lpieralisi@kernel.org,
	ruanjinjie@huawei.com,
	liaochang1@huawei.com
Subject: [PATCH 25/38] arm64: irq: Report FEAT_NMI masking local IRQs
Date: Mon, 14 Sep 2026 11:20:49 +0100
Message-Id: <20260914102102.68597-26-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20260914102102.68597-1-vladimir.murzin@arm.com>
References: <20260914102102.68597-1-vladimir.murzin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_032204_333437_B13E5BF4 
X-CRM114-Status: GOOD (  17.01  )
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

As we clear SCTLR_EL1.SPINTMASK when enabling FEAT_NMI, ALLINT masks
IRQs and FIQs regardless of superpriority.
Update irqflags.h and `regs_irqs_disabled()` to take it into account,
so we properly keep track of the local IRQ masking state.

We have documentation at the top of irqflags.h which explains the DAIF
masking. Since the additional masking with NMIs is related and also
covers the IF in DAIF, extend the comment to note what's going on
with NMIs.

Co-developed-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/include/asm/irqflags.h | 17 +++++++++++++++++
 arch/arm64/include/asm/ptrace.h   |  3 +++
 2 files changed, 20 insertions(+)

diff --git a/arch/arm64/include/asm/irqflags.h b/arch/arm64/include/asm/irqflags.h
index 31b8f4e99532..d64d89a8f31a 100644
--- a/arch/arm64/include/asm/irqflags.h
+++ b/arch/arm64/include/asm/irqflags.h
@@ -20,6 +20,16 @@
  * always masked and unmasked together, and have no side effects for other
  * flags. Keeping to this order makes it easier for entry.S to know which
  * exceptions should be unmasked.
+ *
+ * With the addition of the FEAT_NMI extension we gain an additional
+ * class of superpriority IRQ/FIQ which is separately masked with a
+ * choice of modes controlled by SCTLR_ELn.{SPINTMASK,NMI}.
+ * Linux sets SPINTMASK to 0 and NMI to 1 which results in ALLINT.ALLINT
+ * masking both superpriority interrupts and IRQ/FIQ regardless of the
+ * I and F settings. Since these superpriority interrupts are being
+ * used as NMIs we do not include them in the interrupt masking here,
+ * anything that requires that NMIs be masked needs to explicitly do so,
+ * but we do check for ALLINT masking IRQs/FIQs.
  */
 
  /*
@@ -105,6 +115,9 @@ static __always_inline unsigned long arch_local_save_flags(void)
 {
 	arm64_exc_hwstate_t hwstate = { .daif = read_sysreg(daif) };
 
+	if (system_uses_nmi())
+		hwstate.allint = read_sysreg_s(SYS_ALLINT);
+
 	if (system_uses_irq_prio_masking())
 		hwstate.pmr = read_sysreg_s(SYS_ICC_PMR_EL1);
 
@@ -118,6 +131,10 @@ static __always_inline bool arch_irqs_disabled_flags(unsigned long flags)
 	if (hwstate.daif & PSR_I_BIT)
 		return true;
 
+	/* SCTLR_EL1.SPINTMASK is clear, so ALLINT masks *all* IRQs/FIQs. */
+	if (system_uses_nmi())
+		return !!(hwstate.allint & ALLINT_ALLINT);
+
 	if (system_uses_irq_prio_masking()) {
 		WARN_ON_ONCE(IS_ENABLED(CONFIG_DEBUG_IRQFLAGS) &&
 			     hwstate.pmr != GIC_PRIO_IRQOFF &&
diff --git a/arch/arm64/include/asm/ptrace.h b/arch/arm64/include/asm/ptrace.h
index cf7e51b8ef0b..16ba164b890e 100644
--- a/arch/arm64/include/asm/ptrace.h
+++ b/arch/arm64/include/asm/ptrace.h
@@ -206,6 +206,9 @@ static __always_inline bool regs_irqs_disabled(const struct pt_regs *regs)
 	if (regs->pstate & PSR_I_BIT)
 		return true;
 
+	if (system_uses_nmi())
+		return !!(regs->pstate & PSR_ALLINT_BIT);
+
 	if (system_uses_irq_prio_masking()) {
 		WARN_ON_ONCE(IS_ENABLED(CONFIG_DEBUG_IRQFLAGS) &&
 			     regs->pmr != GIC_PRIO_IRQOFF &&
-- 
2.34.1


