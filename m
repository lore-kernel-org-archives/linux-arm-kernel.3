Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C4AED0D144
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 17:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vgrEnHqzzfakQhmmHFp1B1QvY5RJkQVdELnl1PwxAIY=; b=NT/NCnGei8IiKnYF5/OtGWx/ls
	/R5HF5lSGpe5upEXIr7GI7enxf+2OJUNt52+h4hsKGxKuo9DiFhzKUtBMfVL4sYTCm2/VyR7gtvHr
	lJV9vDD12PSgYjljct+NWkla7DFkxMM3YD3tNHzmWdIBnp5ifWfrN9CTQ38a5DcRVzu3HI0XB8o0L
	PrqsNsITOug4Q9RM4wJxeBxmTPC/tfh7oYa5TXbbw4rsbjKI8FXx92UhbUcER0EtsRqlem1MOaNUf
	jxMayVdeGUT/r3Tr/ltJ+hKLcYBpvYtfnD3MYaE/BuF9QjqBEQiL3u1yKpeGHQs0FTv8kadIUTy5x
	XOwkKJZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdWuj-0000000FLbV-2qu1;
	Wed, 07 Jan 2026 17:01:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdWuh-0000000FLbM-0TIf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 17:01:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AA6B360052;
	Wed,  7 Jan 2026 17:01:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A560AC4CEF1;
	Wed,  7 Jan 2026 17:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767805297;
	bh=vuaqU2+UQa4l4XhYPSEtsdBqZ8uggdOI/bePQ2STgaY=;
	h=From:To:Cc:Subject:Date:From;
	b=Iw6UZ1+AlwPE2wJXj+So//chZoABFSb5yRd/9WbZVA/sRFCFoQMD2M19860rAYM7H
	 hMjQHTYiqYGSjlrfUzvgIABY6IrRC+5qIOKkNL54rRoXVOnwg/g7XpyESJKL5auk5F
	 OajAbL5Qgg0/xhzH3/wmCo74J5BVsE04ycVT7Ek3EA8OlBr0xK6lugLRblKdoGCji/
	 eNfQeOYHNfWBHw3EsTeiBO41ME5AOnucvNX4C6IwCcgWFiY5OlVRvU5SqBRDTBTP1I
	 9P9xZWVpTOK3fCCcJXkZO3sVZ2eBEINu2umEIFnkMRbLnQ9VwOk5TXXdcolxVGc1pr
	 uWVEKZPIEtsOQ==
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
To: Qiang Zhao <qiang.zhao@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] soc: fsl: qe: Add an interrupt controller for QUICC Engine Ports
Date: Wed,  7 Jan 2026 17:59:09 +0100
Message-ID: <63f19db21a91729d91b3df336a56a7eb4206e561.1767804922.git.chleroy@kernel.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4650; i=chleroy@kernel.org; h=from:subject:message-id; bh=vuaqU2+UQa4l4XhYPSEtsdBqZ8uggdOI/bePQ2STgaY=; b=kA0DAAoW3ZBwJryrz1MByyZiAGlekN2hmvl0ztk5l6yfmzkQAIaMYnQXJOHvwuN12GB/flln2 Ih1BAAWCgAdFiEEx/8LupiK9GVvlbov3ZBwJryrz1MFAmlekN0ACgkQ3ZBwJryrz1N/CgEAgAcp PTV+B0XR6jcVncX1fS3p7ZnbCrVLnZT+QwsvN8oA/itwjwkP30YCZ6zOjJZRVUhs73PAiNQ556g UMG3TJboC
X-Developer-Key: i=chleroy@kernel.org; a=openpgp; fpr=10FFE6F8B390DE17ACC2632368A92FEB01B8DD78
Content-Transfer-Encoding: 8bit
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

The QUICC Engine provides interrupts for a few I/O ports. This is
handled via a separate interrupt ID and managed via a triplet of
dedicated registers hosted by the SoC.

Implement an interrupt driver for it so that those IRQs can then
be linked to the related GPIOs.

Signed-off-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
---
 drivers/soc/fsl/qe/Makefile      |   2 +-
 drivers/soc/fsl/qe/qe_ports_ic.c | 142 +++++++++++++++++++++++++++++++
 2 files changed, 143 insertions(+), 1 deletion(-)
 create mode 100644 drivers/soc/fsl/qe/qe_ports_ic.c

diff --git a/drivers/soc/fsl/qe/Makefile b/drivers/soc/fsl/qe/Makefile
index ec8506e131136..901a9c40d5eb7 100644
--- a/drivers/soc/fsl/qe/Makefile
+++ b/drivers/soc/fsl/qe/Makefile
@@ -11,4 +11,4 @@ obj-$(CONFIG_UCC_SLOW)	+= ucc_slow.o
 obj-$(CONFIG_UCC_FAST)	+= ucc_fast.o
 obj-$(CONFIG_QE_TDM)	+= qe_tdm.o
 obj-$(CONFIG_QE_USB)	+= usb.o
-obj-$(CONFIG_QE_GPIO)	+= gpio.o
+obj-$(CONFIG_QE_GPIO)	+= gpio.o qe_ports_ic.o
diff --git a/drivers/soc/fsl/qe/qe_ports_ic.c b/drivers/soc/fsl/qe/qe_ports_ic.c
new file mode 100644
index 0000000000000..61dd09fec6f6e
--- /dev/null
+++ b/drivers/soc/fsl/qe/qe_ports_ic.c
@@ -0,0 +1,142 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * QUICC ENGINE I/O Ports Interrupt Controller
+ *
+ * Copyright (c) 2025 Christophe Leroy CS GROUP France (christophe.leroy@csgroup.eu)
+ */
+
+#include <linux/irq.h>
+#include <linux/irqdomain.h>
+#include <linux/platform_device.h>
+
+/* QE IC registers offset */
+#define CEPIER		0x0c
+#define CEPIMR		0x10
+#define CEPICR		0x14
+
+struct qepic_data {
+	void __iomem *reg;
+	struct irq_domain *host;
+};
+
+static void qepic_mask(struct irq_data *d)
+{
+	struct qepic_data *data = irq_data_get_irq_chip_data(d);
+
+	clrbits32(data->reg + CEPIMR, 1 << (31 - irqd_to_hwirq(d)));
+}
+
+static void qepic_unmask(struct irq_data *d)
+{
+	struct qepic_data *data = irq_data_get_irq_chip_data(d);
+
+	setbits32(data->reg + CEPIMR, 1 << (31 - irqd_to_hwirq(d)));
+}
+
+static void qepic_end(struct irq_data *d)
+{
+	struct qepic_data *data = irq_data_get_irq_chip_data(d);
+
+	out_be32(data->reg + CEPIER, 1 << (31 - irqd_to_hwirq(d)));
+}
+
+static int qepic_set_type(struct irq_data *d, unsigned int flow_type)
+{
+	struct qepic_data *data = irq_data_get_irq_chip_data(d);
+	unsigned int vec = (unsigned int)irqd_to_hwirq(d);
+
+	switch (flow_type & IRQ_TYPE_SENSE_MASK) {
+	case IRQ_TYPE_EDGE_FALLING:
+		setbits32(data->reg + CEPICR, 1 << (31 - vec));
+		return 0;
+	case IRQ_TYPE_EDGE_BOTH:
+	case IRQ_TYPE_NONE:
+		clrbits32(data->reg + CEPICR, 1 << (31 - vec));
+		return 0;
+	}
+	return -EINVAL;
+}
+
+static struct irq_chip qepic = {
+	.name = "QEPIC",
+	.irq_mask = qepic_mask,
+	.irq_unmask = qepic_unmask,
+	.irq_eoi = qepic_end,
+	.irq_set_type = qepic_set_type,
+};
+
+static int qepic_get_irq(struct irq_desc *desc)
+{
+	struct qepic_data *data = irq_desc_get_handler_data(desc);
+	u32 event = in_be32(data->reg + CEPIER);
+
+	if (!event)
+		return -1;
+
+	return irq_find_mapping(data->host, 32 - ffs(event));
+}
+
+static void qepic_cascade(struct irq_desc *desc)
+{
+	generic_handle_irq(qepic_get_irq(desc));
+}
+
+static int qepic_host_map(struct irq_domain *h, unsigned int virq, irq_hw_number_t hw)
+{
+	irq_set_chip_data(virq, h->host_data);
+	irq_set_chip_and_handler(virq, &qepic, handle_fasteoi_irq);
+	return 0;
+}
+
+static const struct irq_domain_ops qepic_host_ops = {
+	.map = qepic_host_map,
+};
+
+static int qepic_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct qepic_data *data;
+	int irq;
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->reg = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(data->reg))
+		return PTR_ERR(data->reg);
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
+
+	data->host = irq_domain_add_linear(dev->of_node, 32, &qepic_host_ops, data);
+	if (!data->host)
+		return -ENODEV;
+
+	irq_set_handler_data(irq, data);
+	irq_set_chained_handler(irq, qepic_cascade);
+
+	return 0;
+}
+
+static const struct of_device_id qepic_match[] = {
+	{
+		.compatible = "fsl,mpc8323-qe-ports-ic",
+	},
+	{},
+};
+
+static struct platform_driver qepic_driver = {
+	.driver	= {
+		.name		= "qe_ports_ic",
+		.of_match_table	= qepic_match,
+	},
+	.probe	= qepic_probe,
+};
+
+static int __init qepic_init(void)
+{
+	return platform_driver_register(&qepic_driver);
+}
+arch_initcall(qepic_init);
-- 
2.49.0


