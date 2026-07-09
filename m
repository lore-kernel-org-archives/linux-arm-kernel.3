Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2FF3C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 12:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kEljFHsuJuISnuULmv2RmQ8iXEh/7hR5zgTn8PDcgTw=; b=LQ+YP3MUBEeT5U
	FXhRPFt2YG03B1jZSG21jDfdzE+TS4kN+oqEVznf2+vO9jtT/oRg74rktLNw4Ujh/kDc8i/v3Skmd
	KmElML+cBwMpvssp6bhRZrBfeNxOo5qsCAfxeE35S5HZ1crO6/+xTfCmGbnlf6ELRIJlk7W1TuD0z
	fFF/07L8d6FLMow9lQl9k2s9JG55knUjKtdFlzU+gWXyrID+DgZJ4BjbEiizUXhrCG1NwSozGRHls
	ouZIT7jxauPIFyH6GM9+wfZALcg3f04APOx4KxjkFL6yzo3SfN7BRNeGI+XehV3ZUW+U+i9TmylvT
	0BWKnzXLdBYG7orfYQ8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whneU-00000002Lb6-05JI;
	Thu, 09 Jul 2026 12:14:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whneI-00000002LDA-4Be4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 12:14:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D8391339;
	Thu,  9 Jul 2026 05:14:33 -0700 (PDT)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E21FB3F66F;
	Thu,  9 Jul 2026 05:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783599278; bh=67WicmVx1P8Z4kJpZqODhmevJy2Mk4CfMR5Bf0K/2G8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UZ4FncR/8jRIf3RLBOXYD/ZelzPrra2NAM7E47kSL93dKjvJgyqWU44HMSomtYLFi
	 qiivkPj+rNSLWSU2+Xb7PWxS8hV/TbmJH1V7aDlGlGdMlEx7GUfHFVgcfzobNoHSX7
	 YUY3gxtPaZRBDGmTS3PoMYu1MlvNe6SWXibVUMxg=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [RFC PATCH 30/36] arm64: irq: Report FEAT_NMI masking local IRQs
Date: Thu,  9 Jul 2026 13:13:27 +0100
Message-Id: <20260709121333.23507-31-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20260709121333.23507-1-vladimir.murzin@arm.com>
References: <20260709121333.23507-1-vladimir.murzin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_051439_126147_8294B4F6 
X-CRM114-Status: GOOD (  18.30  )
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

As we clear SCTLR_EL1.SPINTMASK when enabling FEAT_NMI, ALLINT masks
IRQs and FIQs regardless of superpriority.
Update irqflags.h and `regs_irqs_disabled()` to take it into account,
so we properly keep track of

We have documentation at the top of irqflags.h which explains the DAIF
masking. Since the additional masking with NMIs is related and also
covers the IF in DAIF, extend the comment to note what's going on
with NMIs.

Co-developed-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
---
 arch/arm64/include/asm/irqflags.h | 17 +++++++++++++++++
 arch/arm64/include/asm/ptrace.h   |  9 ++++++++-
 2 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/irqflags.h b/arch/arm64/include/asm/irqflags.h
index b571d34bf11d..a291a231d644 100644
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
@@ -103,6 +113,9 @@ static __always_inline unsigned long arch_local_save_flags(void)
 {
 	arm64_exc_hwstate_t hwstate = { .daif = read_sysreg(daif) };
 
+	if (system_uses_nmi())
+		hwstate.allint = read_sysreg_s(SYS_ALLINT);
+
 	if (system_uses_irq_prio_masking())
 		hwstate.pmr = read_sysreg_s(SYS_ICC_PMR_EL1);
 
@@ -117,6 +130,10 @@ static __always_inline bool arch_irqs_disabled_flags(unsigned long flags)
 	if (hwstate.daif & PSR_I_BIT)
 		return true;
 
+	/* SCTLR_EL1.SPINTMASK is clear, so ALLINT masks *all* IRQs/FIQs. */
+	if (system_uses_nmi() && hwstate.allint > 0)
+		return true;
+
 	if (system_uses_irq_prio_masking() && hwstate.pmr < GIC_PRIO_IRQON)
 		return true;
 
diff --git a/arch/arm64/include/asm/ptrace.h b/arch/arm64/include/asm/ptrace.h
index c630165882e8..096d85d75bd7 100644
--- a/arch/arm64/include/asm/ptrace.h
+++ b/arch/arm64/include/asm/ptrace.h
@@ -206,9 +206,16 @@ static inline void forget_syscall(struct pt_regs *regs)
 		(regs)->pmr >= GIC_PRIO_IRQON :				\
 		true)
 
+#define irqs_allint_clear(regs)				\
+	(system_uses_nmi() ?				\
+		((regs)->pstate & PSR_ALLINT_BIT) == 0:	\
+		true)
+
 static __always_inline bool regs_irqs_disabled(const struct pt_regs *regs)
 {
-	return (regs->pstate & PSR_I_BIT) || !irqs_priority_unmasked(regs);
+	return (regs->pstate & PSR_I_BIT) ||
+		!irqs_priority_unmasked(regs) ||
+		!irqs_allint_clear(regs);
 }
 
 #define interrupts_enabled(regs)	(!regs_irqs_disabled(regs))
-- 
2.34.1


