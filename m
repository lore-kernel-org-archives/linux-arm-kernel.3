Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E99606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 12:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oaUyL60o
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZwuBZPzr/d7UakNagbyIhvgD3/DszpJHEC07fn4iPnQ=; b=oaUyL60o7ZRUcM6t70zK5CDWZ+
	rWQwQGgUpBCBhE/P4UzHAo5XUd48k2TPDDcHsLAzGnfUZ6yIRpFlFYh2zqeIVny4EO+ItqNO3Sfcg
	YAxqEiQvf8INDprOnTaS98PtAll+3m9z2Jyf/PdfTVYlY3oX1kGuykczhSYqER/muEi6s20FCDPGD
	VZz9ZdoDFCewo3E2o58N6dA1O1MDbCsPOx4wJZlRjbeCDM+3qiHdQmjJZ7XLRiYKv5fxslhv2cg6W
	i5K0rIwlZia3X/kYL9sFdEB22uob1V9IrStNQsja6i4l7cbZfs7w/KmksUvcrfSQsJBrPuqPPW1Hd
	BR25qAQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ8Vk-00000009cTI-3hTa;
	Tue, 20 Oct 2026 12:00:08 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=twmbx01.aspeedtech.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ8Vf-00000009cPE-3lUw;
	Tue, 20 Oct 2026 12:00:05 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 20 Oct
 2026 19:59:50 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 20 Oct 2026 19:59:50 +0800
From: Jacky Chou <jacky_chou@aspeedtech.com>
Date: Tue, 20 Oct 2026 19:59:50 +0800
Subject: [PATCH v10 2/3] phy: aspeed: Add ASPEED PCIe PHY driver
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261020-upstream_pcie_rc-v10-2-fba209af8656@aspeedtech.com>
References: <20261020-upstream_pcie_rc-v10-0-fba209af8656@aspeedtech.com>
In-Reply-To: <20261020-upstream_pcie_rc-v10-0-fba209af8656@aspeedtech.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
	Ryan Chen <ryan_chen@aspeedtech.com>, Billy Tsai <billy_tsai@aspeedtech.com>
CC: <linux-aspeed@lists.ozlabs.org>, <linux-phy@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Jacky Chou <jacky_chou@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792497590; l=8221;
 i=jacky_chou@aspeedtech.com; s=20251031; h=from:subject:message-id;
 bh=NZKk6v8Pk+q4284AonRT0NvxfyO5VH+gAn3/T/0vAHc=;
 b=z/2X7aVu0+9vLtmTttI1FaBSCI6MWZA2i/wdTIbBJd4hxaqN2tq29tiXY4scijc9PXDEoYXTQ
 zwv4JesNwqnBvex9u4lkjBLUin440dUGmrVeO4Moc6YFfkS0L6zHDQr
X-Developer-Key: i=jacky_chou@aspeedtech.com; a=ed25519;
 pk=8XBx7KFM1drEsfCXTH9QC2lbMlGU4XwJTA6Jt9Mabdo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_050003_948985_FD912A6D 
X-CRM114-Status: GOOD (  19.52  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Introduce support for Aspeed PCIe PHY controller available in
AST2600/2700.

Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
---
 drivers/phy/aspeed/Kconfig           |  12 +-
 drivers/phy/aspeed/Makefile          |   1 +
 drivers/phy/aspeed/phy-aspeed-pcie.c | 230 +++++++++++++++++++++++++++++++++++
 3 files changed, 242 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/aspeed/Kconfig b/drivers/phy/aspeed/Kconfig
index 7b5f48db2be8..b5903cf06268 100644
--- a/drivers/phy/aspeed/Kconfig
+++ b/drivers/phy/aspeed/Kconfig
@@ -1,9 +1,19 @@
 # SPDX-License-Identifier: GPL-2.0-only
-
 #
 # PHY drivers for ASPEED
 #
 
+config PHY_ASPEED_PCIE
+	tristate "ASPEED PCIe PHY driver"
+	select GENERIC_PHY
+	depends on (ARCH_ASPEED || COMPILE_TEST)
+	help
+	  This option enables support for the ASPEED PCIe PHY driver.
+	  The driver provides the necessary interface to control and
+	  configure the PCIe PHY hardware found on ASPEED SoCs.
+	  It is required for proper operation of PCIe devices on
+	  platforms using ASPEED chips.
+
 config PHY_ASPEED_USB3
 	tristate "ASPEED USB3 PHY driver"
 	select GENERIC_PHY
diff --git a/drivers/phy/aspeed/Makefile b/drivers/phy/aspeed/Makefile
index d96d9d73a009..9d43790fdda8 100644
--- a/drivers/phy/aspeed/Makefile
+++ b/drivers/phy/aspeed/Makefile
@@ -1,2 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0
+obj-$(CONFIG_PHY_ASPEED_PCIE)		+= phy-aspeed-pcie.o
 obj-$(CONFIG_PHY_ASPEED_USB3)		+= phy-aspeed-usb3.o
diff --git a/drivers/phy/aspeed/phy-aspeed-pcie.c b/drivers/phy/aspeed/phy-aspeed-pcie.c
new file mode 100644
index 000000000000..0a18c0eb35cf
--- /dev/null
+++ b/drivers/phy/aspeed/phy-aspeed-pcie.c
@@ -0,0 +1,230 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2025 Aspeed Technology Inc.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/phy/pcie.h>
+#include <linux/phy/phy.h>
+
+/* AST2600 PCIe Host Controller Registers */
+#define PEHR_GLOBAL		0x30
+#define  AST2600_PORT_TYPE_MASK		GENMASK(5, 4)
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
+#define  PORT_TYPE_ROOT			0x4
+#define PEHR_MISC_70		0x70
+#define  POSTED_DATA_CREDITS(x)		FIELD_PREP(GENMASK(15, 0), x)
+#define  POSTED_HEADER_CREDITS(x)	FIELD_PREP(GENMASK(27, 16), x)
+#define PEHR_MISC_78		0x78
+#define  COMPLETION_DATA_CREDITS(x)	FIELD_PREP(GENMASK(15, 0), x)
+#define  COMPLETION_HEADER_CREDITS(x)	FIELD_PREP(GENMASK(27, 16), x)
+#define PEHR_MISC_278		0x278
+#define  SET_TO_DOWNSTREAM		BIT(22)
+#define  ASSERT_INTERNAL_RESET		BIT(31)
+#define PEHR_MISC_280		0x280
+#define  SEL_INTERNAL_RESET		BIT(0)
+
+/**
+ * struct aspeed_pcie_phy - PCIe PHY information
+ * @reg: PCIe host register base address
+ * @clk: PCIe reference clock
+ * @phy: pointer to PHY structure
+ * @platform: platform specific information
+ */
+struct aspeed_pcie_phy {
+	void __iomem *reg;
+	struct clk *clk;
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
+	int ret;
+
+	ret = clk_prepare_enable(pcie_phy->clk);
+	if (ret)
+		return ret;
+
+	writel(PCIE_UNLOCK, pcie_phy->reg + PEHR_LOCK);
+
+	return 0;
+}
+
+static int aspeed_pcie_phy_exit(struct phy *phy)
+{
+	struct aspeed_pcie_phy *pcie_phy = phy_get_drvdata(phy);
+
+	clk_disable_unprepare(pcie_phy->clk);
+
+	return 0;
+}
+
+static int ast2600_phy_set_mode(struct phy *phy, enum phy_mode mode,
+				int submode)
+{
+	struct aspeed_pcie_phy *pcie_phy = phy_get_drvdata(phy);
+	u32 cfg_val;
+
+	switch (submode) {
+	case PHY_MODE_PCIE_RC:
+		cfg_val = readl(pcie_phy->reg + PEHR_GLOBAL);
+		FIELD_MODIFY(AST2600_PORT_TYPE_MASK, &cfg_val, 0x3);
+		writel(cfg_val, pcie_phy->reg + PEHR_GLOBAL);
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
+	.exit		= aspeed_pcie_phy_exit,
+	.set_mode	= ast2600_phy_set_mode,
+	.owner		= THIS_MODULE,
+};
+
+static int ast2700_phy_init(struct phy *phy)
+{
+	struct aspeed_pcie_phy *pcie_phy = phy_get_drvdata(phy);
+
+	return clk_prepare_enable(pcie_phy->clk);
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
+		writel(0, pcie_phy->reg + PEHR_MISC_278);
+		writel(SEL_INTERNAL_RESET, pcie_phy->reg + PEHR_MISC_280);
+		writel(POSTED_DATA_CREDITS(0xc0) | POSTED_HEADER_CREDITS(0xa),
+		       pcie_phy->reg + PEHR_MISC_70);
+		writel(COMPLETION_DATA_CREDITS(0x30) | COMPLETION_HEADER_CREDITS(0x8),
+		       pcie_phy->reg + PEHR_MISC_78);
+		writel(LOCAL_SCALE_SUP, pcie_phy->reg + PEHR_MISC_58);
+		writel(CONFIG_RC_DEVICE, pcie_phy->reg + PEHR_MISC_5C);
+		cfg_val = readl(pcie_phy->reg + PEHR_MISC_60);
+		FIELD_MODIFY(AST2700_PORT_TYPE_MASK, &cfg_val,
+			     PORT_TYPE_ROOT);
+		writel(cfg_val, pcie_phy->reg + PEHR_MISC_60);
+		writel(ASSERT_INTERNAL_RESET | SET_TO_DOWNSTREAM,
+		       pcie_phy->reg + PEHR_MISC_278);
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
+	.exit		= aspeed_pcie_phy_exit,
+	.set_mode	= ast2700_phy_set_mode,
+	.owner		= THIS_MODULE,
+};
+
+static const struct aspeed_pcie_phy_platform pcie_phy_ast2600 = {
+	.phy_ops = &ast2600_phy_ops,
+};
+
+static const struct aspeed_pcie_phy_platform pcie_phy_ast2700 = {
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
+	pcie_phy->clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(pcie_phy->clk))
+		return dev_err_probe(dev, PTR_ERR(pcie_phy->clk),
+				     "failed to get clock\n");
+
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
+MODULE_DEVICE_TABLE(of, aspeed_pcie_phy_of_match_table);
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
2.34.1


