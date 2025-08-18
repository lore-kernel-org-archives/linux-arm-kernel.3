Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E22DCA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 13:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uJhfmfXcnKwpyEJLFGJ9UiWptkJCc7SXnCjqoGSdTCU=; b=KBDDvXnnNUKjECTryO8swsmo7Y
	k1EOqQK7teJJFaguOMRahDeCL0qqbjuqYFQ8HB7vc7LXYRF/cgQT81nTRQkXa+sXM5H44ywQABmq0
	AdSKOgAtQqysmlu19UyhI0fwSKoV4Rq+w9GGx8uS6ZySUuCPwWOXIo5QyjC62IOGh1Hi/tkqr+/K/
	zL9xGMxVqqQ+DS9lI3riafJcyfn5Ery5nsLrIs9wj09Fe9vnObdicmMKJoDcfCHB623vC7d2NvMS0
	/VaLT377WJKn5CLFPjBx6Twxn3g04IDNL+j6W+2w62E9gC+6te2qOFwPVwvLQ6/+6mjik2hDChnPS
	mC2w2i2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo063-00000007YfD-2WN1;
	Mon, 18 Aug 2025 13:40:23 +0000
Received: from pegase2.c-s.fr ([93.17.235.10])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unw2h-000000072Pd-1zE4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 09:20:40 +0000
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4c55sZ1CVfz9sWq;
	Mon, 18 Aug 2025 10:46:10 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 82XmJ-8e-6-P; Mon, 18 Aug 2025 10:46:10 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4c55sY5Dydz9sWh;
	Mon, 18 Aug 2025 10:46:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id A0D0E8B765;
	Mon, 18 Aug 2025 10:46:09 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id UF1PVajMXdU5; Mon, 18 Aug 2025 10:46:09 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [10.25.207.160])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 6D9C48B764;
	Mon, 18 Aug 2025 10:46:09 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Qiang Zhao <qiang.zhao@nxp.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 1/5] soc: fsl: qe: Add an interrupt controller for QUICC Engine Ports
Date: Mon, 18 Aug 2025 10:45:54 +0200
Message-ID: <9a0405e10f70f747e75840967ea55193e6c75bb3.1755506608.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1755506608.git.christophe.leroy@csgroup.eu>
References: <cover.1755506608.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755506759; l=5277; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=ES8U2Yx+S0pmkhw2rCUU5KQ7Jju8hSUnIJwJ46d0Jxo=; b=yEn3iA7/GSe11JG0mGudkpVm3yiX7e0kIL8k113EotyPIHQjRCrs3JWRP8eldWsHfmenSsIgQ APCpXYy8KMUByRkn1u3bff9krR1OsJVKzqonAyQ4+b8dibYLnBMW5Sa
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_022039_676630_94B49B62 
X-CRM114-Status: GOOD (  22.71  )
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

Implement an interrupt driver for it for that those IRQs can then
be linked to the related GPIOs.

The number of ports for which interrupts are supported depends on
the microcontroller:
- mpc8323 has 10 interrupts
- mpc8360 has 28 interrupts
- mpc8568 has 18 interrupts
So add this information as data of the compatible.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v2: Properly cast (void *) to long instead of int to enable warning-free build on PPC64
---
 drivers/soc/fsl/qe/Makefile      |   2 +-
 drivers/soc/fsl/qe/qe_ports_ic.c | 156 +++++++++++++++++++++++++++++++
 2 files changed, 157 insertions(+), 1 deletion(-)
 create mode 100644 drivers/soc/fsl/qe/qe_ports_ic.c

diff --git a/drivers/soc/fsl/qe/Makefile b/drivers/soc/fsl/qe/Makefile
index ec8506e13113..901a9c40d5eb 100644
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
index 000000000000..9715643d36a6
--- /dev/null
+++ b/drivers/soc/fsl/qe/qe_ports_ic.c
@@ -0,0 +1,156 @@
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
+	unsigned long nb;
+	int irq;
+
+	nb = (unsigned long)of_device_get_match_data(dev);
+	if (nb < 1 || nb > 32)
+		return -EINVAL;
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
+	data->host = irq_domain_add_linear(dev->of_node, nb, &qepic_host_ops, data);
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
+		.data = (void *)10,
+	},
+	{
+		.compatible = "fsl,mpc8360-qe-ports-ic",
+		.data = (void *)28,
+	},
+	{
+		.compatible = "fsl,mpc8568-qe-ports-ic",
+		.data = (void *)18,
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


