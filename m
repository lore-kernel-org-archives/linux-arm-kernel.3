Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9F35C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 10:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qadg2bKcBCZki//uobbEy5MLY0VFB6w3J0kBGnJdHgY=; b=R6ER5EmQbOHmIhtf2AdbQ9Cmfi
	RexGcZRTl+AJDoEBFGdsGQK/JbflA7ch2v5Xr6hG9UqhrdWVwnqcolz3qH+lWeEGwuEcwWegdS48L
	1IJI+eV/BrkKBl4cehex3mcT1hmLo+7z/gV8To0bb6UkTpqQol0bQZVfLjdKcwdq2z5IzW4Mkgpdp
	gG6c5UNnbpjXm8vZTPYNJUqlMyuOIYM3p5K5MkKW8YUeqiC/eFxAROAKCBK5UoQPdZpdcDoGjo+pR
	SYjhoPKDaR1tisGzPXE854R5f/pIm8G2ejFXJqhqFoKW9Wln9KH3GddHLG3IF95ND8R+xvre+2381
	PmjrYlRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whPKE-0000000GqZA-1Jl9;
	Wed, 08 Jul 2026 10:16:18 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whPK5-0000000GqL5-2Fnk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 10:16:13 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 9B2D8C8F448;
	Wed,  8 Jul 2026 10:16:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B719160337;
	Wed,  8 Jul 2026 10:16:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2E39F11BC3441;
	Wed,  8 Jul 2026 12:16:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783505766; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Qadg2bKcBCZki//uobbEy5MLY0VFB6w3J0kBGnJdHgY=;
	b=LLEBkXRzNYn0Bk7u5ijbpYCGog03MdICeT52N+u9/QVGAA2EdTr75iO5F6KoSVflK9W92v
	G5kJ4SzIiBA+klFpg2Ix/NRD+cDPmsAUZGEdlfhEoX8hyDYLAoLiFjQyvYEkQfMp4SNzjh
	6AWB8uUVe6MtCo2B3mt6gsg63QzgPc/YgDLU7+6jRmeLH5uphv9GePaGXdrh1fBbwZFYnF
	wn6JwewOURipCkgpHNZAf/Es1fIutSJJHq7AUlNPgHdhYRN7eUyAluy93skTjddAJ4MCBN
	0vulpIL26Pohw06Sg9Ovn/g+upnptfaRZvTAoC/dgKaXvsoNKcanbsORpTANYg==
From: Paul Louvel <paul.louvel@bootlin.com>
Date: Wed, 08 Jul 2026 12:15:21 +0200
Subject: [PATCH v2 08/10] soc: fsl: qe: Convert to generic IRQ chip
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-qe-pic-gpios-v2-8-1972044cfbd1@bootlin.com>
References: <20260708-qe-pic-gpios-v2-0-1972044cfbd1@bootlin.com>
In-Reply-To: <20260708-qe-pic-gpios-v2-0-1972044cfbd1@bootlin.com>
To: Qiang Zhao <qiang.zhao@nxp.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Paul Louvel <paul.louvel@bootlin.com>, 
 Herve Codina <herve.codina@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783505738; l=6809;
 i=paul.louvel@bootlin.com; s=20260313; h=from:subject:message-id;
 bh=2fU5qgzI067+YKsW5U6XhpL6PROn/SmAkPi2/0Y1X4E=;
 b=Sogx0Kfqnx0YsIBHXourwPbb83lbMeVKM7SwyB95fn0masdYi5WdafxfWg3vMq7aDRYxYN+Ts
 siKndxjXUCLDjFNvbYcABkEJvsre2fhsuTXSrarHEMnpYQnarU8t93K
X-Developer-Key: i=paul.louvel@bootlin.com; a=ed25519;
 pk=eLW50NT18UAvUT5cAcYf88zNbBCZDLFXuptpyLVhVIU=
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_031609_923007_52EFE887 
X-CRM114-Status: GOOD (  19.30  )
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

The generic IRQ chip framework is available to handle IRQ chips. Using
this framework for the QE interrupt controller allows to simplify the
driver. Indeed, the framework internally handles operations coded
directly in the driver.

Signed-off-by: Paul Louvel <paul.louvel@bootlin.com>
---
 drivers/soc/fsl/qe/Kconfig       |   1 +
 drivers/soc/fsl/qe/qe_ports_ic.c | 116 +++++++++++++++++++++++++--------------
 2 files changed, 76 insertions(+), 41 deletions(-)

diff --git a/drivers/soc/fsl/qe/Kconfig b/drivers/soc/fsl/qe/Kconfig
index b35a8fd30ebf..87cd1662e168 100644
--- a/drivers/soc/fsl/qe/Kconfig
+++ b/drivers/soc/fsl/qe/Kconfig
@@ -71,6 +71,7 @@ config QE_USB
 config QE_GPIO
 	bool "QE GPIO support"
 	depends on QUICC_ENGINE
+	select GENERIC_IRQ_CHIP
 	select GPIOLIB
 	help
 	  Say Y here if you're going to use hardware that connects to the
diff --git a/drivers/soc/fsl/qe/qe_ports_ic.c b/drivers/soc/fsl/qe/qe_ports_ic.c
index 29f4334db5a0..4f6b75439f9f 100644
--- a/drivers/soc/fsl/qe/qe_ports_ic.c
+++ b/drivers/soc/fsl/qe/qe_ports_ic.c
@@ -18,107 +18,144 @@
 
 struct qepic_data {
 	void __iomem *reg;
-	struct irq_domain *host;
 	int irq;
 };
 
 static void qepic_mask(struct irq_data *d)
 {
-	struct qepic_data *data = irq_data_get_irq_chip_data(d);
-	u32 val = ioread32be(data->reg + CEPIMR);
+	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
+	u32 val;
 
-	iowrite32be(val & ~(1 << (31 - irqd_to_hwirq(d))), data->reg + CEPIMR);
+	guard(raw_spinlock)(&gc->lock);
+
+	val = ioread32be(gc->reg_base + CEPIMR);
+	iowrite32be(val & ~d->mask, gc->reg_base + CEPIMR);
 }
 
 static void qepic_unmask(struct irq_data *d)
 {
-	struct qepic_data *data = irq_data_get_irq_chip_data(d);
-	u32 val = ioread32be(data->reg + CEPIMR);
+	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
+	u32 val;
+
+	guard(raw_spinlock)(&gc->lock);
 
-	iowrite32be(val | 1 << (31 - irqd_to_hwirq(d)), data->reg + CEPIMR);
+	val = ioread32be(gc->reg_base + CEPIMR);
+	iowrite32be(val | d->mask, gc->reg_base + CEPIMR);
 }
 
 static void qepic_end(struct irq_data *d)
 {
-	struct qepic_data *data = irq_data_get_irq_chip_data(d);
+	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
 
-	iowrite32be(1 << (31 - irqd_to_hwirq(d)), data->reg + CEPIER);
+	iowrite32be(d->mask, gc->reg_base + CEPIER);
+}
+
+static void qepic_calc_mask(struct irq_data *d)
+{
+	d->mask = 1 << (31 - irqd_to_hwirq(d));
 }
 
 static int qepic_set_type(struct irq_data *d, unsigned int flow_type)
 {
-	struct qepic_data *data = irq_data_get_irq_chip_data(d);
-	unsigned int vec = (unsigned int)irqd_to_hwirq(d);
-	u32 val = ioread32be(data->reg + CEPICR);
+	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
+	u32 val;
 
+	guard(raw_spinlock)(&gc->lock);
+
+	val = ioread32be(gc->reg_base + CEPICR);
 	switch (flow_type & IRQ_TYPE_SENSE_MASK) {
 	case IRQ_TYPE_EDGE_FALLING:
-		iowrite32be(val | 1 << (31 - vec), data->reg + CEPICR);
+		iowrite32be(val | d->mask, gc->reg_base + CEPICR);
 		return 0;
 	case IRQ_TYPE_EDGE_BOTH:
 	case IRQ_TYPE_NONE:
-		iowrite32be(val & ~(1 << (31 - vec)), data->reg + CEPICR);
+		iowrite32be(val & ~d->mask, gc->reg_base + CEPICR);
 		return 0;
 	}
 	return -EINVAL;
 }
 
-static struct irq_chip qepic = {
-	.name = "QEPIC",
-	.irq_mask = qepic_mask,
-	.irq_unmask = qepic_unmask,
-	.irq_eoi = qepic_end,
-	.irq_set_type = qepic_set_type,
-};
-
 static void qepic_cascade(struct irq_desc *desc)
 {
-	struct qepic_data *data = irq_desc_get_handler_data(desc);
+	struct irq_domain *domain = irq_desc_get_handler_data(desc);
+	struct irq_chip_generic *gc = irq_get_domain_generic_chip(domain, 0);
 	struct irq_chip *chip = irq_desc_get_chip(desc);
 	unsigned long event, bit;
 
 	chained_irq_enter(chip, desc);
 
-	event = ioread32be(data->reg + CEPIER);
+	event = ioread32be(gc->reg_base + CEPIER);
 	if (!event) {
 		handle_bad_irq(desc);
 		goto out;
 	}
 
 	for_each_set_bit(bit, &event, 32)
-		generic_handle_domain_irq(data->host, 31 - bit);
+		generic_handle_domain_irq(domain, 31 - bit);
 
 out:
 	chained_irq_exit(chip, desc);
 }
 
-static int qepic_host_map(struct irq_domain *h, unsigned int virq, irq_hw_number_t hw)
+static int qepic_chip_init(struct irq_chip_generic *gc)
 {
-	irq_set_chip_data(virq, h->host_data);
-	irq_set_chip_and_handler(virq, &qepic, handle_fasteoi_irq);
+	struct qepic_data *data = gc->domain->host_data;
+	struct irq_chip_type *ct = gc->chip_types;
+
+	gc->reg_base = data->reg;
+
+	ct->chip.irq_mask = qepic_mask;
+	ct->chip.irq_unmask = qepic_unmask;
+	ct->chip.irq_eoi = qepic_end;
+	ct->chip.irq_set_type = qepic_set_type;
+	ct->chip.irq_calc_mask = qepic_calc_mask;
+
 	return 0;
 }
 
-static const struct irq_domain_ops qepic_host_ops = {
-	.map = qepic_host_map,
-};
+static int qepic_domain_init(struct irq_domain *d)
+{
+	struct qepic_data *data = d->host_data;
+
+	irq_set_chained_handler_and_data(data->irq, qepic_cascade, d);
+
+	return 0;
+}
 
-static void qepic_remove(void *res)
+static void qepic_domain_exit(struct irq_domain *d)
 {
-	struct qepic_data *data = res;
+	struct qepic_data *data = d->host_data;
 
 	irq_set_chained_handler_and_data(data->irq, NULL, NULL);
-	irq_domain_remove(data->host);
 }
 
 static int qepic_probe(struct platform_device *pdev)
 {
+	struct irq_domain_chip_generic_info dgc_info = {
+		.name = "QEPIC",
+		.handler = handle_fasteoi_irq,
+		.irqs_per_chip = 32,
+		.num_ct = 1,
+		.init = qepic_chip_init,
+	};
+	struct irq_domain_info d_info = {
+		.fwnode = of_fwnode_handle(pdev->dev.of_node),
+		.domain_flags = IRQ_DOMAIN_FLAG_DESTROY_GC,
+		.size = 32,
+		.hwirq_max = 32,
+		.ops = &irq_generic_chip_ops,
+		.dgc_info = &dgc_info,
+		.init = qepic_domain_init,
+		.exit = qepic_domain_exit,
+	};
 	struct device *dev = &pdev->dev;
+	struct irq_domain *domain;
 	struct qepic_data *data;
 
 	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
+	d_info.host_data = data;
 
 	data->reg = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(data->reg))
@@ -128,14 +165,11 @@ static int qepic_probe(struct platform_device *pdev)
 	if (data->irq < 0)
 		return data->irq;
 
-	data->host = irq_domain_create_linear(dev_fwnode(dev), 32, &qepic_host_ops, data);
-	if (!data->host)
-		return -ENODEV;
-
-	irq_set_chained_handler_and_data(data->irq, qepic_cascade, data);
-
-	return devm_add_action_or_reset(dev, qepic_remove, data);
+	domain = devm_irq_domain_instantiate(dev, &d_info);
+	if (IS_ERR(domain))
+		return PTR_ERR(domain);
 
+	return 0;
 }
 
 static const struct of_device_id qepic_match[] = {

-- 
2.55.0


