Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A914CA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 06:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pdfL/EfThtqQe1nHdb6JHX0jIJe81dC0aKtfyjsvruE=; b=VZeLshHv81gSklL6fbf5ThCfay
	hBuEvzsz91g/x5ZuNogaVd7iNai82a9mm8MxaWk7WRy4XuabGCoJm0HkXIzsrRzZOuaGZOk5T+LkT
	1H5VoYSJ9oY7ujb2qwIwTzDdTp2s2hOrKYwUzKzfgZzE149rFUQScPrj4DEVJtR5+fZG/CBDurwr5
	3zEN1BUGbiv/Ge9HN9ILTddZMR6DJtESZP3UT5eLyVf7DPXa1+wLykFwLiWKZe4cfDPEG7UeKpyX1
	wSrQAKoh357ys+jd+Yk5jdc5wRCFUg9AtvGTx7ZbuRuf5RGgWLonmqjo+UMc6uqbcqOZHtrYc7KIf
	22PJCusg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usy8D-0000000BLK4-48N3;
	Mon, 01 Sep 2025 06:35:09 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usxZq-0000000BGBM-0E3K;
	Mon, 01 Sep 2025 05:59:39 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 1 Sep
 2025 13:59:23 +0800
Received: from mail.aspeedtech.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Mon, 1 Sep 2025 13:59:23 +0800
From: Jacky Chou <jacky_chou@aspeedtech.com>
To: <linux-pci@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <bhelgaas@google.com>,
	<lpieralisi@kernel.org>, <kwilczynski@kernel.org>, <mani@kernel.org>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<joel@jms.id.au>, <andrew@codeconstruct.com.au>, <vkoul@kernel.org>,
	<kishon@kernel.org>, <linus.walleij@linaro.org>, <p.zabel@pengutronix.de>,
	<linux-aspeed@lists.ozlabs.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-phy@lists.infradead.org>, <openbmc@lists.ozlabs.org>,
	<linux-gpio@vger.kernel.org>
CC: <jacky_chou@aspeedtech.com>
Subject: [PATCH v3 07/10] PHY: aspeed: Add ASPEED PCIe PHY driver
Date: Mon, 1 Sep 2025 13:59:19 +0800
Message-ID: <20250901055922.1553550-8-jacky_chou@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250901055922.1553550-1-jacky_chou@aspeedtech.com>
References: <20250901055922.1553550-1-jacky_chou@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250831_225938_107112_2188C8CD 
X-CRM114-Status: GOOD (  20.17  )
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

Introduce support for Aspeed PCIe PHY controller available in
AST2600/2700.

Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
---
 drivers/phy/Kconfig                  |   1 +
 drivers/phy/Makefile                 |   1 +
 drivers/phy/aspeed/Kconfig           |  15 ++
 drivers/phy/aspeed/Makefile          |   2 +
 drivers/phy/aspeed/phy-aspeed-pcie.c | 209 +++++++++++++++++++++++++++
 5 files changed, 228 insertions(+)
 create mode 100644 drivers/phy/aspeed/Kconfig
 create mode 100644 drivers/phy/aspeed/Makefile
 create mode 100644 drivers/phy/aspeed/phy-aspeed-pcie.c

diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
index 58c911e1b2d2..ac4bf46f24e2 100644
--- a/drivers/phy/Kconfig
+++ b/drivers/phy/Kconfig
@@ -103,6 +103,7 @@ config PHY_NXP_PTN3222
 
 source "drivers/phy/allwinner/Kconfig"
 source "drivers/phy/amlogic/Kconfig"
+source "drivers/phy/aspeed/Kconfig"
 source "drivers/phy/broadcom/Kconfig"
 source "drivers/phy/cadence/Kconfig"
 source "drivers/phy/freescale/Kconfig"
diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
index c670a8dac468..12fd50e5ea9b 100644
--- a/drivers/phy/Makefile
+++ b/drivers/phy/Makefile
@@ -15,6 +15,7 @@ obj-$(CONFIG_PHY_AIROHA_PCIE)		+= phy-airoha-pcie.o
 obj-$(CONFIG_PHY_NXP_PTN3222)		+= phy-nxp-ptn3222.o
 obj-y					+= allwinner/	\
 					   amlogic/	\
+					   aspeed/	\
 					   broadcom/	\
 					   cadence/	\
 					   freescale/	\
diff --git a/drivers/phy/aspeed/Kconfig b/drivers/phy/aspeed/Kconfig
new file mode 100644
index 000000000000..6aeeca84091f
--- /dev/null
+++ b/drivers/phy/aspeed/Kconfig
@@ -0,0 +1,15 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Phy drivers for Aspeed platforms
+#
+config PHY_ASPEED_PCIE
+	tristate "ASPEED PCIe PHY driver"
+	select GENERIC_PHY
+	depends on ARCH_ASPEED
+	default y
+	help
+	  This option enables support for the ASPEED PCIe PHY driver.
+	  The driver provides the necessary interface to control and
+	  configure the PCIe PHY hardware found on ASPEED SoCs.
+	  It is required for proper operation of PCIe devices on
+	  platforms using ASPEED chips.
\ No newline at end of file
diff --git a/drivers/phy/aspeed/Makefile b/drivers/phy/aspeed/Makefile
new file mode 100644
index 000000000000..7203152f44bf
--- /dev/null
+++ b/drivers/phy/aspeed/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+obj-$(CONFIG_PHY_ASPEED_PCIE)		+= phy-aspeed-pcie.o
\ No newline at end of file
diff --git a/drivers/phy/aspeed/phy-aspeed-pcie.c b/drivers/phy/aspeed/phy-aspeed-pcie.c
new file mode 100644
index 000000000000..4b78ceeb5a5e
--- /dev/null
+++ b/drivers/phy/aspeed/phy-aspeed-pcie.c
@@ -0,0 +1,209 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2025 Aspeed Technology Inc.
+ */
+
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/kernel.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/phy/pcie.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
+#include <linux/reset.h>
+#include <linux/slab.h>
+
+/* AST2600 PCIe Host Controller Registers */
+#define PEHR_GLOBAL		0x30
+#define  AST2600_PORT_TYPE_MASK		GENMASK(5, 4)
+#define  AST2600_PORT_TYPE(x)		FIELD_PREP(AST2600_PORT_TYPE_MASK, x)
+#define PEHR_LOCK		0x7c
+#define  PCIE_UNLOCK			0xa8
+
+/* AST2700 PEHR */
+#define PEHR_MISC_58		0x58
+#define  LOCAL_SCALE_SUP		BIT(0)
+#define PEHR_MISC_5C		0x5c
+#define  CONFIG_RC_DEVICE		BIT(30)
+#define PEHR_MISC_60		0x60
+#define  AST2700_PORT_TYPE_MASK		GENMASK(7, 4)
+#define  PORT_TYPE_ROOT			BIT(6)
+#define PEHR_MISC_70		0x70
+#define  POSTED_DATA_CREDITS(x)		FIELD_PREP(GENMASK(15, 0), x)
+#define  POSTED_HEADER_CREDITS(x)	FIELD_PREP(GENMASK(27, 16), x)
+#define PEHR_MISC_78		0x78
+#define  COMPLETION_DATA_CREDITS(x)	FIELD_PREP(GENMASK(15, 0), x)
+#define  COMPLETION_HEADER_CREDITS(x)	FIELD_PREP(GENMASK(27, 16), x)
+
+/**
+ * struct aspeed_pcie_phy - PCIe PHY information
+ * @dev: pointer to device structure
+ * @reg: PCIe host register base address
+ * @phy: pointer to PHY structure
+ * @platform: platform specific information
+ */
+struct aspeed_pcie_phy {
+	struct device *dev;
+	void __iomem *reg;
+	struct phy *phy;
+	const struct aspeed_pcie_phy_platform *platform;
+};
+
+/**
+ * struct aspeed_pcie_phy_platform - Platform information
+ * @phy_ops: phy operations
+ */
+struct aspeed_pcie_phy_platform {
+	const struct phy_ops *phy_ops;
+};
+
+static int ast2600_phy_init(struct phy *phy)
+{
+	struct aspeed_pcie_phy *pcie_phy = phy_get_drvdata(phy);
+
+	writel(PCIE_UNLOCK, pcie_phy->reg + PEHR_LOCK);
+
+	return 0;
+}
+
+static int ast2600_phy_set_mode(struct phy *phy, enum phy_mode mode,
+				int submode)
+{
+	struct aspeed_pcie_phy *pcie_phy = phy_get_drvdata(phy);
+
+	switch (submode) {
+	case PHY_MODE_PCIE_RC:
+		writel(AST2600_PORT_TYPE(0x3), pcie_phy->reg + PEHR_GLOBAL);
+		break;
+	default:
+		dev_err(&phy->dev, "Unsupported submode %d\n", submode);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static const struct phy_ops ast2600_phy_ops = {
+	.init		= ast2600_phy_init,
+	.set_mode	= ast2600_phy_set_mode,
+	.owner		= THIS_MODULE,
+};
+
+static int ast2700_phy_init(struct phy *phy)
+{
+	struct aspeed_pcie_phy *pcie_phy = phy_get_drvdata(phy);
+
+	writel(POSTED_DATA_CREDITS(0xc0) | POSTED_HEADER_CREDITS(0xa),
+	       pcie_phy->reg + PEHR_MISC_70);
+	writel(COMPLETION_DATA_CREDITS(0x30) | COMPLETION_HEADER_CREDITS(0x8),
+	       pcie_phy->reg + PEHR_MISC_78);
+	writel(LOCAL_SCALE_SUP, pcie_phy->reg + PEHR_MISC_58);
+
+	return 0;
+}
+
+static int ast2700_phy_set_mode(struct phy *phy, enum phy_mode mode,
+				int submode)
+{
+	struct aspeed_pcie_phy *pcie_phy = phy_get_drvdata(phy);
+	u32 cfg_val;
+
+	switch (submode) {
+	case PHY_MODE_PCIE_RC:
+		writel(CONFIG_RC_DEVICE, pcie_phy->reg + PEHR_MISC_5C);
+		cfg_val = readl(pcie_phy->reg + PEHR_MISC_60);
+		cfg_val &= ~AST2700_PORT_TYPE_MASK;
+		cfg_val |= PORT_TYPE_ROOT;
+		writel(cfg_val, pcie_phy->reg + PEHR_MISC_60);
+		break;
+	default:
+		dev_err(&phy->dev, "Unsupported submode %d\n", submode);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static const struct phy_ops ast2700_phy_ops = {
+	.init		= ast2700_phy_init,
+	.set_mode	= ast2700_phy_set_mode,
+	.owner		= THIS_MODULE,
+};
+
+const struct aspeed_pcie_phy_platform pcie_phy_ast2600 = {
+	.phy_ops = &ast2600_phy_ops,
+};
+
+const struct aspeed_pcie_phy_platform pcie_phy_ast2700 = {
+	.phy_ops = &ast2700_phy_ops,
+};
+
+static int aspeed_pcie_phy_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct phy_provider *phy_provider;
+	struct aspeed_pcie_phy *pcie_phy;
+	const struct aspeed_pcie_phy_platform *md;
+
+	md = of_device_get_match_data(dev);
+	if (!md)
+		return -ENODEV;
+
+	pcie_phy = devm_kzalloc(dev, sizeof(*pcie_phy), GFP_KERNEL);
+	if (!pcie_phy)
+		return -ENOMEM;
+
+	pcie_phy->reg = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(pcie_phy->reg))
+		return PTR_ERR(pcie_phy->reg);
+
+	pcie_phy->dev = dev;
+	pcie_phy->platform = md;
+
+	pcie_phy->phy = devm_phy_create(dev, dev->of_node,
+					pcie_phy->platform->phy_ops);
+	if (IS_ERR(pcie_phy->phy))
+		return dev_err_probe(dev, PTR_ERR(pcie_phy->phy),
+				     "failed to create PHY\n");
+
+	phy_set_drvdata(pcie_phy->phy, pcie_phy);
+	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
+
+	return PTR_ERR_OR_ZERO(phy_provider);
+}
+
+static const struct of_device_id aspeed_pcie_phy_of_match_table[] = {
+	{
+		.compatible = "aspeed,ast2600-pcie-phy",
+		.data = &pcie_phy_ast2600,
+	},
+	{
+		.compatible = "aspeed,ast2700-pcie-phy",
+		.data = &pcie_phy_ast2700,
+	},
+	{ },
+};
+MODULE_DEVICE_TABLE(of, aspeed_pcie_of_match_table);
+
+static struct platform_driver aspeed_pcie_driver = {
+	.probe		= aspeed_pcie_phy_probe,
+	.driver = {
+		.name	= "aspeed-pcie-phy",
+		.of_match_table = aspeed_pcie_phy_of_match_table,
+	},
+};
+
+module_platform_driver(aspeed_pcie_driver);
+
+MODULE_AUTHOR("Jacky Chou <jacky_chou@aspeedtech.com>");
+MODULE_DESCRIPTION("ASPEED PCIe PHY");
+MODULE_LICENSE("GPL");
-- 
2.43.0


