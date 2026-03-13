Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 425F0105F78C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 10:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=clm801FsqQj5XYTkDkIE7QqmcGXJ7vyK1yLePKoIbvg=; b=4XUXbh/hWlK327jrucOpOrs5Vv
	MKhlIA7tV7f+vDPmYlsCDCTuhkwtWYxWTQJSBMpIvMZ7qr/PrPk3vEwA0pLy20H8xEOrx3jMhnO8i
	Ew8PSwkDobvSeQLE/7drQGhJPbVf/vNbCJImXerrIx0LTOpYrFSmZtlqDTOIk9YwmJfm33enhiVZU
	slXToNqROKnqnsC5+gf6U4SkTecErLO2rBVA9vLoG+pZbjpWoYBKiD35jtnHl3LW8kPGY9jNQb4RA
	rSO2DmUQjLTGX3t8BhkJlBnTrLnBmUrhvIDNa8DBYukTEuEcEDdUjNWYZ6jzwaLB55Y1EnFkWe7Pw
	dBLzc5MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0zRQ-0000000HTen-0yPE;
	Fri, 13 Mar 2026 10:08:24 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0zRL-0000000HTbv-1NA6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 10:08:20 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 13 Mar
 2026 18:08:12 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 13 Mar 2026 18:08:12 +0800
From: aspeedyh <yh_chung@aspeedtech.com>
Date: Fri, 13 Mar 2026 18:07:37 +0800
Subject: [PATCH 2/7] soc: aspeed: Introduce core eSPI controller support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260313-upstream_espi-v1-2-9504428e1f43@aspeedtech.com>
References: <20260313-upstream_espi-v1-0-9504428e1f43@aspeedtech.com>
In-Reply-To: <20260313-upstream_espi-v1-0-9504428e1f43@aspeedtech.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, "Andrew
 Jeffery" <andrew@codeconstruct.com.au>, Ryan Chen <ryan_chen@aspeedtech.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<openbmc@lists.ozlabs.org>, <maciej.lawniczak@intel.com>, aspeedyh
	<yh_chung@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773396491; l=6557;
 i=yh_chung@aspeedtech.com; s=20260313; h=from:subject:message-id;
 bh=/rOqnxX9j6h03fyAsdgGIl0qi1TFF1cLQusaF8+cqak=;
 b=5SvpJyitqQ/Sx4PNe6gIxvhFpoq9dxYazoMvAYRv+z8OBP3B9Zc8w/Sqvr7TWuG9zU+vo/kOk
 QG8th6cPJrqD8/Qv/n8WgOgvejoRO9ZTD/PsY7YToonQZebIY04/ypY
X-Developer-Key: i=yh_chung@aspeedtech.com; a=ed25519;
 pk=o71dz0J8lpN+v0f3Mk4gT9PfVngADPC1Pex4aK6VigM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_030819_371593_F5A98EC9 
X-CRM114-Status: GOOD (  19.75  )
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

Add core eSPI controller support and common code for ASPEED SoCs. The
eSPI engine is a slave device in BMC to communicate with the Host over
the eSPI interface.

The initial support includes basic eSPI driver probe/remove operations,
and provides operators for ASPEED SoCs to implement their own eSPI slave
device drivers that are different among SoC models.

Signed-off-by: aspeedyh <yh_chung@aspeedtech.com>
---
 drivers/soc/aspeed/Kconfig            |   7 ++
 drivers/soc/aspeed/Makefile           |   1 +
 drivers/soc/aspeed/espi/Makefile      |   1 +
 drivers/soc/aspeed/espi/aspeed-espi.c | 143 ++++++++++++++++++++++++++++++++++
 drivers/soc/aspeed/espi/aspeed-espi.h |  27 +++++++
 5 files changed, 179 insertions(+)

diff --git a/drivers/soc/aspeed/Kconfig b/drivers/soc/aspeed/Kconfig
index f579ee0b5afa..677812fab11a 100644
--- a/drivers/soc/aspeed/Kconfig
+++ b/drivers/soc/aspeed/Kconfig
@@ -52,6 +52,13 @@ config ASPEED_SOCINFO
 	help
 	  Say yes to support decoding of ASPEED BMC information.
 
+config ASPEED_ESPI
+	tristate "ASPEED eSPI slave driver"
+	help
+	  Enable driver support for Aspeed eSPI controller. The eSPI controller
+	  plays as a slave device in BMC to communicate with the Host over the
+	  eSPI interface using peripheral, virtual wire, out of band, and flash
+	  channels.
 endmenu
 
 endif
diff --git a/drivers/soc/aspeed/Makefile b/drivers/soc/aspeed/Makefile
index b35d74592964..79d794de428a 100644
--- a/drivers/soc/aspeed/Makefile
+++ b/drivers/soc/aspeed/Makefile
@@ -4,3 +4,4 @@ obj-$(CONFIG_ASPEED_LPC_SNOOP)		+= aspeed-lpc-snoop.o
 obj-$(CONFIG_ASPEED_UART_ROUTING)	+= aspeed-uart-routing.o
 obj-$(CONFIG_ASPEED_P2A_CTRL)		+= aspeed-p2a-ctrl.o
 obj-$(CONFIG_ASPEED_SOCINFO)		+= aspeed-socinfo.o
+obj-$(CONFIG_ASPEED_ESPI)		+= espi/
diff --git a/drivers/soc/aspeed/espi/Makefile b/drivers/soc/aspeed/espi/Makefile
new file mode 100644
index 000000000000..d96dc030e23b
--- /dev/null
+++ b/drivers/soc/aspeed/espi/Makefile
@@ -0,0 +1 @@
+obj-y += aspeed-espi.o
diff --git a/drivers/soc/aspeed/espi/aspeed-espi.c b/drivers/soc/aspeed/espi/aspeed-espi.c
new file mode 100644
index 000000000000..15d58b38bbe4
--- /dev/null
+++ b/drivers/soc/aspeed/espi/aspeed-espi.c
@@ -0,0 +1,143 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Unified Aspeed eSPI driver framework for different generation SoCs
+ */
+
+#include <linux/clk.h>
+#include <linux/dma-mapping.h>
+#include <linux/interrupt.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/reset.h>
+
+#include "aspeed-espi.h"
+
+struct aspeed_espi_ops {
+	void (*espi_pre_init)(struct aspeed_espi *espi);
+	void (*espi_post_init)(struct aspeed_espi *espi);
+	void (*espi_deinit)(struct aspeed_espi *espi);
+	irqreturn_t (*espi_isr)(int irq, void *espi);
+};
+
+static const struct of_device_id aspeed_espi_of_matches[] = {
+	{ }
+};
+MODULE_DEVICE_TABLE(of, aspeed_espi_of_matches);
+
+static int aspeed_espi_probe(struct platform_device *pdev)
+{
+	const struct of_device_id *match;
+	struct aspeed_espi *espi;
+	struct resource *res;
+	struct device *dev;
+	int rc;
+
+	dev = &pdev->dev;
+	espi = devm_kzalloc(dev, sizeof(*espi), GFP_KERNEL);
+	if (!espi)
+		return -ENOMEM;
+
+	espi->dev = dev;
+	match = of_match_device(aspeed_espi_of_matches, dev);
+	if (!match)
+		return -ENODEV;
+
+	espi->pdev = pdev;
+	espi->ops = match->data;
+	if (!espi->ops || !espi->ops->espi_isr)
+		return -EINVAL;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res) {
+		dev_err(dev, "cannot get resource\n");
+		return -ENODEV;
+	}
+
+	espi->regs = devm_ioremap_resource(dev, res);
+	if (IS_ERR(espi->regs)) {
+		dev_err(dev, "cannot map registers\n");
+		return PTR_ERR(espi->regs);
+	}
+
+	espi->irq = platform_get_irq(pdev, 0);
+	if (espi->irq < 0) {
+		dev_err(dev, "cannot get IRQ number\n");
+		return espi->irq;
+	}
+
+	espi->rst = devm_reset_control_get_optional(dev, NULL);
+	if (IS_ERR(espi->rst)) {
+		dev_err(dev, "cannot get reset control\n");
+		return PTR_ERR(espi->rst);
+	}
+
+	espi->clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(espi->clk)) {
+		dev_err(dev, "cannot get clock control\n");
+		return PTR_ERR(espi->clk);
+	}
+
+	rc = clk_prepare_enable(espi->clk);
+	if (rc) {
+		dev_err(dev, "cannot enable clocks\n");
+		return rc;
+	}
+
+	if (espi->ops->espi_pre_init)
+		espi->ops->espi_pre_init(espi);
+
+	rc = devm_request_irq(dev, espi->irq, espi->ops->espi_isr, 0,
+			      dev_name(dev), espi);
+	if (rc) {
+		dev_err(dev, "cannot request IRQ\n");
+		goto err_deinit;
+	}
+
+	if (espi->ops->espi_post_init)
+		espi->ops->espi_post_init(espi);
+
+	platform_set_drvdata(pdev, espi);
+
+	dev_info(dev, "module loaded\n");
+
+	return 0;
+
+err_deinit:
+	if (espi->ops->espi_deinit)
+		espi->ops->espi_deinit(espi);
+	clk_disable_unprepare(espi->clk);
+
+	return rc;
+}
+
+static void aspeed_espi_remove(struct platform_device *pdev)
+{
+	struct aspeed_espi *espi;
+
+	espi = platform_get_drvdata(pdev);
+
+	if (!espi)
+		return;
+
+	if (espi->ops->espi_deinit)
+		espi->ops->espi_deinit(espi);
+
+	clk_disable_unprepare(espi->clk);
+}
+
+static struct platform_driver aspeed_espi_driver = {
+	.driver = {
+		.name = "aspeed-espi",
+		.of_match_table = aspeed_espi_of_matches,
+	},
+	.probe = aspeed_espi_probe,
+	.remove = aspeed_espi_remove,
+};
+
+module_platform_driver(aspeed_espi_driver);
+
+MODULE_AUTHOR("Aspeed Technology Inc.");
+MODULE_DESCRIPTION("Aspeed eSPI controller");
+MODULE_LICENSE("GPL");
diff --git a/drivers/soc/aspeed/espi/aspeed-espi.h b/drivers/soc/aspeed/espi/aspeed-espi.h
new file mode 100644
index 000000000000..f4ad7f61fef6
--- /dev/null
+++ b/drivers/soc/aspeed/espi/aspeed-espi.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Unified eSPI driver header file and data structures
+ * Copyright 2026 Aspeed Technology Inc.
+ */
+#ifndef ASPEED_ESPI_H
+#define ASPEED_ESPI_H
+
+#include <linux/irqreturn.h>
+#include <linux/miscdevice.h>
+#include <linux/platform_device.h>
+#include <linux/types.h>
+
+#define DEVICE_NAME		"aspeed-espi"
+
+struct aspeed_espi {
+	struct platform_device *pdev;
+	struct device *dev;
+	void __iomem *regs;
+	struct reset_control *rst;
+	struct clk *clk;
+	int dev_id;
+	int irq;
+	const struct aspeed_espi_ops *ops;
+};
+
+#endif

-- 
2.34.1


