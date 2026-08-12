Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2570C5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 09:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mEfxlBtxrbaLrgUXYDELE17F7DruhVXebdfJf8wUCzg=; b=qFsBKE211BO+Z0xYgABtOb55CF
	tN2ezGR+m8ILwCAOo9AfQC5uzJ7ddRlyp/NFUzU1S5eE20xqRLqr3tJqkI+M6AUOAeL+5/7eR/ht8
	vlgG5jcVjp20hOi5mXBsilqjuKmk+n50T+JcRTXEiW/8rRS0xqbBsTcokz/c/8qm2hLLjPdxCsdnv
	xekAYX4Fo2vt3IMYH3F1GJgORBp1Q59rPW74Mm9mjwx1tj0rW/+FJrB4R/bzJI37Vw4KAY4HTbQFM
	sW3w62a2wVCwI933/dVFVIl2fK8qoMkmaUkxp6WO10I8TAHdAbIrbsVf4ZAdKtejDSZSCxkacwpt3
	g+pqgP0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu4zh-0000000Fhgr-1dvI;
	Wed, 12 Aug 2026 09:11:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu4zU-0000000FhZQ-2HOM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 09:11:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 03B786187E;
	Wed, 12 Aug 2026 09:11:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 749161F000E9;
	Wed, 12 Aug 2026 09:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786525875;
	bh=mEfxlBtxrbaLrgUXYDELE17F7DruhVXebdfJf8wUCzg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=KBBexxHgL85faEuuhGNfw6RFVKkk8XhVW4qKW3pzmXauhlU8zfeVMPK3A9t5LUwNe
	 qeknXexw2aVWHulQyOyQxOrtq04wYDhpcohRvgQpZW4c2jpJl6UFsr2qU3AB10XZPK
	 nRDbQfyPkYtmEVoNdNRwVtDUEOy327JQsPV3BvTCeBIBQ1cAI6ghJ8NKlTdrO1yck2
	 VsM2MfvKFYnNmDpYkjUCfzSrLOD4OwjAQ29gdLyVz7l9HiQFtzExCoNVcyXX/L+aS2
	 Gsez98bpwXxVcu8o4F8GwdAT+FyTcM0f24RPduLLXgZDXZCxdWZCW6xQk77p7HIQOn
	 g6O1bf97MJCNg==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Wed, 12 Aug 2026 11:10:35 +0200
Subject: [PATCH 7/7] irqchip/gic-v5: Defer default SPI and LPI IAFFID
 programming
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260812-gicv5-7-2-fixes-v1-7-3743e82c69a4@kernel.org>
References: <20260812-gicv5-7-2-fixes-v1-0-3743e82c69a4@kernel.org>
In-Reply-To: <20260812-gicv5-7-2-fixes-v1-0-3743e82c69a4@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Jonathan Cameron <jic23@kernel.org>, 
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
 Sascha Bischoff <sascha.bischoff@arm.com>, 
 Timothy Hayes <timothy.hayes@arm.com>
Cc: Sascha Bischoff <Sascha.Bischoff@arm.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>
X-Mailer: b4 0.15.2
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

SPI and LPI interrupts do not have an architected default value for their
IAFFID (interrupt affinity ID) - the property that determines an IRQ
affinity.

Current code awkwardly tries to set a default IAFFID value corresponding
to the logical cpu executing the gicv5_hwirq_init() function at SPI/LPI
allocation time.

There are two issues with this approach:

- gicv5_hwirq_init() is called in preemptible context and current code
  uses smp_processor_id() to check the logical cpu executing the function.
  Whilst that's harmless, it can spit a splat on DEBUG_PREEMPT kernels
- Setting the default SPI/LPI IAFFID to the one belonging to the cpu
  executing the IRQ allocation is a completely arbitrary choice

It is saner to remove the SPI/LPI IAFFID set-up in the SPI/LPI domain IRQ
allocation code and flag SPI/LPI irqchips as IRQCHIP_AFFINITY_PRE_STARTUP
so that the SPI/LPI affinity is initialized by IRQ core to a sane value
before an IRQ is started up using the respective irq_chip
irq_set_affinity() callback.

Fixes: 5cb1b6dab2de ("irqchip/gic-v5: Add GICv5 IRS/SPI support")
Fixes: 0f0101325876 ("irqchip/gic-v5: Add GICv5 LPI/IPI support")
Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>
---
 drivers/irqchip/irq-gic-v5.c | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v5.c b/drivers/irqchip/irq-gic-v5.c
index 4f5d1eebb4fa..d6f1c0c8b747 100644
--- a/drivers/irqchip/irq-gic-v5.c
+++ b/drivers/irqchip/irq-gic-v5.c
@@ -87,25 +87,13 @@ static void gicv5_ppi_priority_init(void)
 
 static void gicv5_hwirq_init(irq_hw_number_t hwirq, u8 priority, u8 hwirq_type)
 {
-	u64 cdpri, cdaff;
-	u16 iaffid;
-	int ret;
+	u64 cdpri;
 
 	if (hwirq_type == GICV5_HWIRQ_TYPE_LPI || hwirq_type == GICV5_HWIRQ_TYPE_SPI) {
 		cdpri = FIELD_PREP(GICV5_GIC_CDPRI_PRIORITY_MASK, priority)	|
 			FIELD_PREP(GICV5_GIC_CDPRI_TYPE_MASK, hwirq_type)	|
 			FIELD_PREP(GICV5_GIC_CDPRI_ID_MASK, hwirq);
 		gic_insn(cdpri, CDPRI);
-
-		ret = gicv5_irs_cpu_to_iaffid(smp_processor_id(), &iaffid);
-
-		if (WARN_ON_ONCE(ret))
-			return;
-
-		cdaff = FIELD_PREP(GICV5_GIC_CDAFF_IAFFID_MASK, iaffid)		|
-			FIELD_PREP(GICV5_GIC_CDAFF_TYPE_MASK, hwirq_type)	|
-			FIELD_PREP(GICV5_GIC_CDAFF_ID_MASK, hwirq);
-		gic_insn(cdaff, CDAFF);
 	}
 }
 
@@ -548,6 +536,7 @@ static const struct irq_chip gicv5_spi_irq_chip = {
 	.irq_get_irqchip_state	= gicv5_spi_irq_get_irqchip_state,
 	.irq_set_irqchip_state	= gicv5_spi_irq_set_irqchip_state,
 	.flags			= IRQCHIP_SET_TYPE_MASKED |
+				  IRQCHIP_AFFINITY_PRE_STARTUP |
 				  IRQCHIP_SKIP_SET_WAKE	  |
 				  IRQCHIP_MASK_ON_SUSPEND,
 };
@@ -561,7 +550,8 @@ static const struct irq_chip gicv5_lpi_irq_chip = {
 	.irq_retrigger		= gicv5_lpi_irq_retrigger,
 	.irq_get_irqchip_state	= gicv5_lpi_irq_get_irqchip_state,
 	.irq_set_irqchip_state	= gicv5_lpi_irq_set_irqchip_state,
-	.flags			= IRQCHIP_SKIP_SET_WAKE	  |
+	.flags			= IRQCHIP_AFFINITY_PRE_STARTUP |
+				  IRQCHIP_SKIP_SET_WAKE	  |
 				  IRQCHIP_MASK_ON_SUSPEND,
 };
 

-- 
2.53.0


