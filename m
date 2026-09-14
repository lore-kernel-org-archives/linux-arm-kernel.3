Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC629C88E65
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 10:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=quBpgx1vgIFWVazNQnegBcCWyJ4hssTuvexIeujAuEU=; b=1AmnRxpidvjgvhVMyMq2qNf2JN
	x/2yh7tfF4YH69bMrimxpQrl1F8nbRxVNLhk7vmTBtVz9b6IvxbOyWQxUS2PNhRV6JRv350odM/Ki
	8vVdOiM6YzrLQ1WZmArqNn+ZpB4lLDeielRY9+XjLq7Z0faK9oqu5ka5BROiJYAfidYIGQ+hhT/AX
	e5MZVJLPzz/ThlkNwlq2sWwx58fqyEywVJv9YRBqCdQHzPRG54IrR8UBprxxD+LwHTEcL7ADuZde+
	mEUcRb8zvOwqBO7yQuZZ25x2WBZxZPZhw4G3TdEIwF27F8Vyx1dkgdbx+NO7m89HWEdmlTtU/XAhR
	6LIkz46g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x63qp-000000037jr-2LNe;
	Mon, 14 Sep 2026 10:23:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x63pH-000000035p8-26U9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 10:22:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7F83F1C2B;
	Mon, 14 Sep 2026 03:22:11 -0700 (PDT)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0C4753F7B4;
	Mon, 14 Sep 2026 03:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789381335; bh=Xt5uYLjNpvMaijGMJb8gZ0rfoOe9m2DGagPHM2Znjug=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=A8BiHNUlQlyvI852FWlNbSeGekSBtA4sS0YsICppUO4noIbuHn2sWoXDMzRHYDdSr
	 48v3FIg7SHNhPCJEeENTaLIT3wamSFrzLIhI/XNrUSs1kdEGiqplPNa7h/2hQ5l03c
	 /IIJT1GkB4oiWdmjaj/m7HUauyiRNKIsH2lDhUrA=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	maz@kernel.org,
	lpieralisi@kernel.org,
	ruanjinjie@huawei.com,
	liaochang1@huawei.com
Subject: [PATCH 33/38] irqchip/gic-v3: Rename nmi to pseudo_nmi
Date: Mon, 14 Sep 2026 11:20:57 +0100
Message-Id: <20260914102102.68597-34-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20260914102102.68597-1-vladimir.murzin@arm.com>
References: <20260914102102.68597-1-vladimir.murzin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_032215_639965_D6B2D4D3 
X-CRM114-Status: GOOD (  15.19  )
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

From: Lorenzo Pieralisi <lpieralisi@kernel.org>

Currently, the terms "NMI" and "pseudo-NMI" are used
interchangeably. That creates confusion with upcoming FEAT_GICv3_NMI
support. Rename helper functions and variables related to pseudo-NMI
to make the code paths clearer and more explicit.

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/irqchip/irq-gic-v3.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
index 6e1fa5b247fc..6a807c226425 100644
--- a/drivers/irqchip/irq-gic-v3.c
+++ b/drivers/irqchip/irq-gic-v3.c
@@ -87,7 +87,7 @@ static DEFINE_STATIC_KEY_TRUE(supports_deactivate_key);
 #define GIC_LINE_NR	min(GICD_TYPER_SPIS(gic_data.rdists.gicd_typer), 1020U)
 #define GIC_ESPI_NR	GICD_TYPER_ESPIS(gic_data.rdists.gicd_typer)
 
-static bool nmi_support_forbidden;
+static bool pseudo_nmi_support_forbidden;
 
 /*
  * There are 16 SGIs, though we only actually use 8 in Linux. The other 8 SGIs
@@ -117,7 +117,7 @@ static bool nmi_support_forbidden;
  * - Figure 4-7 Secure read of the priority field for a Non-secure Group 1
  *   interrupt.
  */
-static DEFINE_STATIC_KEY_FALSE(supports_pseudo_nmis);
+static DEFINE_STATIC_KEY_FALSE(supports_pseudo_nmi);
 
 static u32 gic_get_pribits(void)
 {
@@ -185,7 +185,7 @@ static void __init gic_prio_init(void)
 				pr_warn("Broken GIC integration, security disabled\n");
 		} else {
 			pr_warn("Broken GIC integration, pNMI forbidden\n");
-			nmi_support_forbidden = true;
+			pseudo_nmi_support_forbidden = true;
 		}
 	}
 
@@ -512,10 +512,10 @@ static void gic_unmask_irq(struct irq_data *d)
 	gic_poke_irq(d, GICD_ISENABLER);
 }
 
-static inline bool gic_supports_nmi(void)
+static inline bool gic_supports_pseudo_nmi(void)
 {
 	return IS_ENABLED(CONFIG_ARM64_PSEUDO_NMI) &&
-	       static_branch_likely(&supports_pseudo_nmis);
+	       static_branch_likely(&supports_pseudo_nmi);
 }
 
 static int gic_irq_set_irqchip_state(struct irq_data *d,
@@ -598,7 +598,7 @@ static int gic_irq_nmi_setup(struct irq_data *d)
 {
 	struct irq_desc *desc = irq_to_desc(d->irq);
 
-	if (!gic_supports_nmi())
+	if (!gic_supports_pseudo_nmi())
 		return -EINVAL;
 
 	if (gic_peek_irq(d, GICD_ISENABLER)) {
@@ -626,7 +626,7 @@ static void gic_irq_nmi_teardown(struct irq_data *d)
 {
 	struct irq_desc *desc = irq_to_desc(d->irq);
 
-	if (WARN_ON(!gic_supports_nmi()))
+	if (WARN_ON(!gic_supports_pseudo_nmi()))
 		return;
 
 	if (gic_peek_irq(d, GICD_ISENABLER)) {
@@ -804,7 +804,7 @@ static inline void gic_complete_ack(u32 irqnr)
 
 static bool gic_rpr_is_nmi_prio(void)
 {
-	if (!gic_supports_nmi())
+	if (!gic_supports_pseudo_nmi())
 		return false;
 
 	return unlikely(gic_read_rpr() == GICV3_PRIO_NMI);
@@ -911,7 +911,7 @@ static void __gic_handle_irq_from_irqsoff(struct pt_regs *regs)
 
 static void __exception_irq_entry gic_handle_irq(struct pt_regs *regs)
 {
-	if (unlikely(gic_supports_nmi() && !interrupts_enabled(regs)))
+	if (unlikely(gic_supports_pseudo_nmi() && !interrupts_enabled(regs)))
 		__gic_handle_irq_from_irqsoff(regs);
 	else
 		__gic_handle_irq_from_irqson(regs);
@@ -1162,7 +1162,7 @@ static void gic_cpu_sys_reg_init(void)
 	/* Set priority mask register */
 	if (!gic_prio_masking_enabled()) {
 		write_gicreg(DEFAULT_PMR_VALUE, ICC_PMR_EL1);
-	} else if (gic_supports_nmi()) {
+	} else if (gic_supports_pseudo_nmi()) {
 		/*
 		 * Check that all CPUs use the same priority space.
 		 *
@@ -1955,15 +1955,15 @@ static const struct gic_quirk gic_quirks[] = {
 	}
 };
 
-static void gic_enable_nmi_support(void)
+static void gic_enable_pseudo_nmi(void)
 {
-	if (!gic_prio_masking_enabled() || nmi_support_forbidden)
+	if (!gic_prio_masking_enabled() || pseudo_nmi_support_forbidden)
 		return;
 
 	pr_info("Pseudo-NMIs enabled using %s ICC_PMR_EL1 synchronisation\n",
 		gic_has_relaxed_pmr_sync() ? "relaxed" : "forced");
 
-	static_branch_enable(&supports_pseudo_nmis);
+	static_branch_enable(&supports_pseudo_nmi);
 
 	if (static_branch_likely(&supports_deactivate_key))
 		gic_eoimode1_chip.flags |= IRQCHIP_SUPPORTS_NMI;
@@ -2047,7 +2047,7 @@ static int __init gic_init_bases(phys_addr_t dist_phys_base,
 	gic_prio_init();
 	gic_dist_init();
 	gic_cpu_init();
-	gic_enable_nmi_support();
+	gic_enable_pseudo_nmi();
 	gic_smp_init();
 	gic_cpu_pm_init();
 
-- 
2.34.1


