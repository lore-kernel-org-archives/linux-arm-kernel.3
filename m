Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5AB4C677C4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 15:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=id7GRWD8vfNBwx1dRBT13zBpoC0G7MyQ35NGW3O+ncM=; b=11prrSvUG/SNDc2+3PW/Yu6oc1
	y28bylcDTEFDM34Xly/1yz73HnFmtOSlr1GQZBRCDGvD2K90oidxfOWFXatvJqkKYHkkx535U4l5p
	Wt1dhpzv0c6JGzVjVHuLaqVn4Le5k+DjgSJzFQyFqr5oSid8ZbdOvDVkgcBAj3TyxEv1hUglWv2q3
	wE4Uuxrks4cmhs4Bv2LHCDjygY8n7FhUYOsY/DhT1+o/YTVtSJQJuVyf+Ww1KLKfbDrNgn6vMQviD
	UGjZJWB2Ilc82mow2yrv3QuwRlFSRUdvldscPt9fBbcQmQjJMZ2+O/7pBk68swaxJwYF2gA02yB2l
	+N524DGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPNmL-0000000ATNS-2Mf0;
	Wed, 11 Jun 2025 15:54:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPIwL-00000009e30-2omS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 10:44:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 43B815C56EA;
	Wed, 11 Jun 2025 10:42:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAA93C4CEEE;
	Wed, 11 Jun 2025 10:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749638656;
	bh=Val6gvNLmwc93YXiRLAyyfulj6tIKO76zAealvKQvYg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SZ+t+3NEBw9nCqlnTSklRNo11YQsU6g3oJrKcf7NaVbF0/9Bvb7+qZ8TQtvsnRiRg
	 UAv7HO4pMGsP9DnsXyP9OUG0SAb6azvHEd24CqEUMWwNKSnXgmQavGbPC3aDYuHMfw
	 mIO4QCWHiQZuEyJa6xupGtK2xWAEz3qr2PP9gH5z9G9CRGI40FYahHibI0zfc9iYFU
	 VcwM/rjfmW8cfbebKCU2VAo3SqAk+ybbHw9xPH8E1czaTvZ9X7XIKtWGFsStzl4rjk
	 BrFLwQYcJBQ+F5Tai1Js9B4CAKMTy57T6m00qamMSXJ/KoOw9c9MStEGR8xPkspTNt
	 w0MKlaVmGbNNw==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: tglx@linutronix.de,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Nishanth Menon <nm@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH] irqchip: Use dev_fwnode()
Date: Wed, 11 Jun 2025 12:43:38 +0200
Message-ID: <20250611104348.192092-10-jirislaby@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250611104348.192092-1-jirislaby@kernel.org>
References: <20250611104348.192092-1-jirislaby@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_034417_795722_06E52AA2 
X-CRM114-Status: GOOD (  16.42  )
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

irq_domain_create_simple() takes fwnode as the first argument. It can be
extracted from the struct device using dev_fwnode() helper instead of
using of_node with of_fwnode_handle().

So use the dev_fwnode() helper.

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>

---
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>
Cc: Gregory Clement <gregory.clement@bootlin.com>
Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Nishanth Menon <nm@ti.com>
Cc: Tero Kristo <kristo@kernel.org>
Cc: Santosh Shilimkar <ssantosh@kernel.org>
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-stm32@st-md-mailman.stormreply.com
---
 drivers/irqchip/irq-imgpdc.c              | 2 +-
 drivers/irqchip/irq-imx-irqsteer.c        | 2 +-
 drivers/irqchip/irq-keystone.c            | 4 ++--
 drivers/irqchip/irq-mvebu-pic.c           | 2 +-
 drivers/irqchip/irq-pruss-intc.c          | 2 +-
 drivers/irqchip/irq-renesas-intc-irqpin.c | 6 ++----
 drivers/irqchip/irq-renesas-irqc.c        | 2 +-
 drivers/irqchip/irq-renesas-rza1.c        | 5 ++---
 drivers/irqchip/irq-renesas-rzg2l.c       | 5 ++---
 drivers/irqchip/irq-renesas-rzv2h.c       | 2 +-
 drivers/irqchip/irq-stm32mp-exti.c        | 4 +---
 drivers/irqchip/irq-ti-sci-inta.c         | 3 +--
 drivers/irqchip/irq-ti-sci-intr.c         | 3 +--
 drivers/irqchip/irq-ts4800.c              | 2 +-
 14 files changed, 18 insertions(+), 26 deletions(-)

diff --git a/drivers/irqchip/irq-imgpdc.c b/drivers/irqchip/irq-imgpdc.c
index f0410d5d7315..484a089e7f6d 100644
--- a/drivers/irqchip/irq-imgpdc.c
+++ b/drivers/irqchip/irq-imgpdc.c
@@ -372,7 +372,7 @@ static int pdc_intc_probe(struct platform_device *pdev)
 	priv->syswake_irq = irq;
 
 	/* Set up an IRQ domain */
-	priv->domain = irq_domain_create_linear(of_fwnode_handle(node), 16, &irq_generic_chip_ops,
+	priv->domain = irq_domain_create_linear(dev_fwnode(&pdev->dev), 16, &irq_generic_chip_ops,
 					     priv);
 	if (unlikely(!priv->domain)) {
 		dev_err(&pdev->dev, "cannot add IRQ domain\n");
diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx-irqsteer.c
index 6dc9ac48fee5..bb2b09f528fd 100644
--- a/drivers/irqchip/irq-imx-irqsteer.c
+++ b/drivers/irqchip/irq-imx-irqsteer.c
@@ -212,7 +212,7 @@ static int imx_irqsteer_probe(struct platform_device *pdev)
 	/* steer all IRQs into configured channel */
 	writel_relaxed(BIT(data->channel), data->regs + CHANCTRL);
 
-	data->domain = irq_domain_create_linear(of_fwnode_handle(np), data->reg_num * 32,
+	data->domain = irq_domain_create_linear(dev_fwnode(&pdev->dev), data->reg_num * 32,
 					     &imx_irqsteer_domain_ops, data);
 	if (!data->domain) {
 		dev_err(&pdev->dev, "failed to create IRQ domain\n");
diff --git a/drivers/irqchip/irq-keystone.c b/drivers/irqchip/irq-keystone.c
index c9e902b7bf48..922fff09354f 100644
--- a/drivers/irqchip/irq-keystone.c
+++ b/drivers/irqchip/irq-keystone.c
@@ -157,8 +157,8 @@ static int keystone_irq_probe(struct platform_device *pdev)
 	kirq->chip.irq_mask	= keystone_irq_setmask;
 	kirq->chip.irq_unmask	= keystone_irq_unmask;
 
-	kirq->irqd = irq_domain_create_linear(of_fwnode_handle(np), KEYSTONE_N_IRQ,
-					      &keystone_irq_ops, kirq);
+	kirq->irqd = irq_domain_create_linear(dev_fwnode(dev), KEYSTONE_N_IRQ, &keystone_irq_ops,
+					      kirq);
 	if (!kirq->irqd) {
 		dev_err(dev, "IRQ domain registration failed\n");
 		return -ENODEV;
diff --git a/drivers/irqchip/irq-mvebu-pic.c b/drivers/irqchip/irq-mvebu-pic.c
index 8db638aa21d2..cd8b73482b9f 100644
--- a/drivers/irqchip/irq-mvebu-pic.c
+++ b/drivers/irqchip/irq-mvebu-pic.c
@@ -150,7 +150,7 @@ static int mvebu_pic_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	pic->domain = irq_domain_create_linear(of_fwnode_handle(node), PIC_MAX_IRQS,
+	pic->domain = irq_domain_create_linear(dev_fwnode(&pdev->dev), PIC_MAX_IRQS,
 					       &mvebu_pic_domain_ops, pic);
 	if (!pic->domain) {
 		dev_err(&pdev->dev, "Failed to allocate irq domain\n");
diff --git a/drivers/irqchip/irq-pruss-intc.c b/drivers/irqchip/irq-pruss-intc.c
index 87a5813fd835..81078d56f38d 100644
--- a/drivers/irqchip/irq-pruss-intc.c
+++ b/drivers/irqchip/irq-pruss-intc.c
@@ -555,7 +555,7 @@ static int pruss_intc_probe(struct platform_device *pdev)
 
 	mutex_init(&intc->lock);
 
-	intc->domain = irq_domain_create_linear(of_fwnode_handle(dev->of_node), max_system_events,
+	intc->domain = irq_domain_create_linear(dev_fwnode(dev), max_system_events,
 						&pruss_intc_irq_domain_ops, intc);
 	if (!intc->domain)
 		return -ENOMEM;
diff --git a/drivers/irqchip/irq-renesas-intc-irqpin.c b/drivers/irqchip/irq-renesas-intc-irqpin.c
index 0959ed43b1a9..117b74b635ea 100644
--- a/drivers/irqchip/irq-renesas-intc-irqpin.c
+++ b/drivers/irqchip/irq-renesas-intc-irqpin.c
@@ -513,10 +513,8 @@ static int intc_irqpin_probe(struct platform_device *pdev)
 	irq_chip->irq_set_wake = intc_irqpin_irq_set_wake;
 	irq_chip->flags	= IRQCHIP_MASK_ON_SUSPEND;
 
-	p->irq_domain = irq_domain_create_simple(of_fwnode_handle(dev->of_node),
-						 nirqs, 0,
-						 &intc_irqpin_irq_domain_ops,
-						 p);
+	p->irq_domain = irq_domain_create_simple(dev_fwnode(dev), nirqs, 0,
+						 &intc_irqpin_irq_domain_ops, p);
 	if (!p->irq_domain) {
 		ret = -ENXIO;
 		dev_err(dev, "cannot initialize irq domain\n");
diff --git a/drivers/irqchip/irq-renesas-irqc.c b/drivers/irqchip/irq-renesas-irqc.c
index 5c3196e5a437..b46bbb66c264 100644
--- a/drivers/irqchip/irq-renesas-irqc.c
+++ b/drivers/irqchip/irq-renesas-irqc.c
@@ -168,7 +168,7 @@ static int irqc_probe(struct platform_device *pdev)
 
 	p->cpu_int_base = p->iomem + IRQC_INT_CPU_BASE(0); /* SYS-SPI */
 
-	p->irq_domain = irq_domain_create_linear(of_fwnode_handle(dev->of_node), p->number_of_irqs,
+	p->irq_domain = irq_domain_create_linear(dev_fwnode(dev), p->number_of_irqs,
 						 &irq_generic_chip_ops, p);
 	if (!p->irq_domain) {
 		ret = -ENXIO;
diff --git a/drivers/irqchip/irq-renesas-rza1.c b/drivers/irqchip/irq-renesas-rza1.c
index 0a9640ba0adb..a697eb55ac90 100644
--- a/drivers/irqchip/irq-renesas-rza1.c
+++ b/drivers/irqchip/irq-renesas-rza1.c
@@ -231,9 +231,8 @@ static int rza1_irqc_probe(struct platform_device *pdev)
 	priv->chip.irq_set_type = rza1_irqc_set_type;
 	priv->chip.flags = IRQCHIP_MASK_ON_SUSPEND | IRQCHIP_SKIP_SET_WAKE;
 
-	priv->irq_domain = irq_domain_create_hierarchy(parent, 0, IRQC_NUM_IRQ,
-						       of_fwnode_handle(np), &rza1_irqc_domain_ops,
-						       priv);
+	priv->irq_domain = irq_domain_create_hierarchy(parent, 0, IRQC_NUM_IRQ, dev_fwnode(dev),
+						       &rza1_irqc_domain_ops, priv);
 	if (!priv->irq_domain) {
 		dev_err(dev, "cannot initialize irq domain\n");
 		ret = -ENOMEM;
diff --git a/drivers/irqchip/irq-renesas-rzg2l.c b/drivers/irqchip/irq-renesas-rzg2l.c
index 1e861bd64f97..360d88687e4f 100644
--- a/drivers/irqchip/irq-renesas-rzg2l.c
+++ b/drivers/irqchip/irq-renesas-rzg2l.c
@@ -574,9 +574,8 @@ static int rzg2l_irqc_common_init(struct device_node *node, struct device_node *
 
 	raw_spin_lock_init(&rzg2l_irqc_data->lock);
 
-	irq_domain = irq_domain_create_hierarchy(parent_domain, 0, IRQC_NUM_IRQ,
-						 of_fwnode_handle(node), &rzg2l_irqc_domain_ops,
-						 rzg2l_irqc_data);
+	irq_domain = irq_domain_create_hierarchy(parent_domain, 0, IRQC_NUM_IRQ, dev_fwnode(dev),
+						 &rzg2l_irqc_domain_ops, rzg2l_irqc_data);
 	if (!irq_domain) {
 		pm_runtime_put(dev);
 		return dev_err_probe(dev, -ENOMEM, "failed to add irq domain\n");
diff --git a/drivers/irqchip/irq-renesas-rzv2h.c b/drivers/irqchip/irq-renesas-rzv2h.c
index 69b32c19e8ff..57c5a3c008c9 100644
--- a/drivers/irqchip/irq-renesas-rzv2h.c
+++ b/drivers/irqchip/irq-renesas-rzv2h.c
@@ -558,7 +558,7 @@ static int rzv2h_icu_init_common(struct device_node *node, struct device_node *p
 	raw_spin_lock_init(&rzv2h_icu_data->lock);
 
 	irq_domain = irq_domain_create_hierarchy(parent_domain, 0, ICU_NUM_IRQ,
-						 of_fwnode_handle(node), &rzv2h_icu_domain_ops,
+						 dev_fwnode(&pdev->dev), &rzv2h_icu_domain_ops,
 						 rzv2h_icu_data);
 	if (!irq_domain) {
 		dev_err(&pdev->dev, "failed to add irq domain\n");
diff --git a/drivers/irqchip/irq-stm32mp-exti.c b/drivers/irqchip/irq-stm32mp-exti.c
index c6b4407d05f9..a24f4f1a4f8f 100644
--- a/drivers/irqchip/irq-stm32mp-exti.c
+++ b/drivers/irqchip/irq-stm32mp-exti.c
@@ -683,9 +683,7 @@ static int stm32mp_exti_probe(struct platform_device *pdev)
 	}
 
 	domain = irq_domain_create_hierarchy(parent_domain, 0, drv_data->bank_nr * IRQS_PER_BANK,
-					     of_fwnode_handle(np), &stm32mp_exti_domain_ops,
-					     host_data);
-
+					     dev_fwnode(dev), &stm32mp_exti_domain_ops, host_data);
 	if (!domain) {
 		dev_err(dev, "Could not register exti domain\n");
 		return -ENOMEM;
diff --git a/drivers/irqchip/irq-ti-sci-inta.c b/drivers/irqchip/irq-ti-sci-inta.c
index 7de59238e6b0..01963d36cfaf 100644
--- a/drivers/irqchip/irq-ti-sci-inta.c
+++ b/drivers/irqchip/irq-ti-sci-inta.c
@@ -701,8 +701,7 @@ static int ti_sci_inta_irq_domain_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	domain = irq_domain_create_linear(of_fwnode_handle(dev_of_node(dev)),
-					  ti_sci_get_num_resources(inta->vint),
+	domain = irq_domain_create_linear(dev_fwnode(dev), ti_sci_get_num_resources(inta->vint),
 					  &ti_sci_inta_irq_domain_ops, inta);
 	if (!domain) {
 		dev_err(dev, "Failed to allocate IRQ domain\n");
diff --git a/drivers/irqchip/irq-ti-sci-intr.c b/drivers/irqchip/irq-ti-sci-intr.c
index 07fff5ae5ce0..354613e74ad0 100644
--- a/drivers/irqchip/irq-ti-sci-intr.c
+++ b/drivers/irqchip/irq-ti-sci-intr.c
@@ -274,8 +274,7 @@ static int ti_sci_intr_irq_domain_probe(struct platform_device *pdev)
 		return PTR_ERR(intr->out_irqs);
 	}
 
-	domain = irq_domain_create_hierarchy(parent_domain, 0, 0,
-					     of_fwnode_handle(dev_of_node(dev)),
+	domain = irq_domain_create_hierarchy(parent_domain, 0, 0, dev_fwnode(dev),
 					     &ti_sci_intr_irq_domain_ops, intr);
 	if (!domain) {
 		dev_err(dev, "Failed to allocate IRQ domain\n");
diff --git a/drivers/irqchip/irq-ts4800.c b/drivers/irqchip/irq-ts4800.c
index e625f4fb2bb8..1e236d5b7516 100644
--- a/drivers/irqchip/irq-ts4800.c
+++ b/drivers/irqchip/irq-ts4800.c
@@ -125,7 +125,7 @@ static int ts4800_ic_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	data->domain = irq_domain_create_linear(of_fwnode_handle(node), 8, &ts4800_ic_ops, data);
+	data->domain = irq_domain_create_linear(dev_fwnode(&pdev->dev), 8, &ts4800_ic_ops, data);
 	if (!data->domain) {
 		dev_err(&pdev->dev, "cannot add IRQ domain\n");
 		return -ENOMEM;
-- 
2.49.0


