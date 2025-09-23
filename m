Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE145CAC5AE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 14:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pJAMVv7W7je+QcOTN7+S5zgkonX+uyKKdvqGOYX4tEk=; b=Kqo4OGCqRCPZwX/Imv7OHKQJ0P
	pvaMse2TYFCSMtO8aOgYiQPN/TK4uOOiDw/G5hBR29T2fmnizg1fT9305yBfFAJe9G8X3k/OhDBg1
	YaJvyKThx3igOLAPfmbs0VfZkboMkXdyBH6yfID4rWO6DhB7qTaa/jzITYRISouUiLZMjplQKrAGW
	5EzsNCkApARWRdM7/TtGsStNP738R9im9CY+DI/uu0p6a60jcnqgKm4EuVZUmW66JSOiPwSlfZY36
	6mXpsaAmDH0MLPnObTHmvb2inM3QxCaMvc2XU1sWS/pnR3gY1EWEVUnD7tUAPr6SevN88qyW5nluN
	JPiWbm/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v13be-0000000DdeF-2i87;
	Tue, 23 Sep 2025 14:02:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v13bX-0000000DdaY-2zYo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 14:02:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E96DC44D3B;
	Tue, 23 Sep 2025 14:02:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CF50C116C6;
	Tue, 23 Sep 2025 14:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758636170;
	bh=SkL6UBVzYGksJa9vg1F2/54SqGDMb6/MuMtQg2Dw1jM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=o1S/Hv1x5ZjXvwWhz8GcVdYWfyAkp/ARJlnftbTgIIOF57ChqI879smQCDyiiW+pR
	 z8tl4fSbvyosOT7J4Uy8fpvdKWuUBBoC8hh1hJ6akbvPFnqPiXHhws1/64D8p6FXlB
	 O0YH2Uy6rQN7XebkykQdmG+XUhFrIlGM0dBvLXYWgZHLixqpYjlVV1PNcJ9dgO4DP2
	 j85WWyhdGhSADau6hUP7MjgHcZ1W1A/ODDCvso3oif7aenqNCgvTUxkgPx0qnS6x9K
	 h8uq0o/fo6wtp77TNwEJB1DLSBIPa6q7d3ghMXQdnWcEz6mFr0JWPPpa9/5pkO2MLf
	 UTduNP1R2W97Q==
Received: by wens.tw (Postfix, from userid 1000)
	id 173A45FDDE; Tue, 23 Sep 2025 22:02:48 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH net-next v7 2/6] net: stmmac: Add support for Allwinner A523 GMAC200
Date: Tue, 23 Sep 2025 22:02:42 +0800
Message-ID: <20250923140247.2622602-3-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250923140247.2622602-1-wens@kernel.org>
References: <20250923140247.2622602-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_070251_797017_D20D2920 
X-CRM114-Status: GOOD (  30.86  )
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

From: Chen-Yu Tsai <wens@csie.org>

The Allwinner A523 SoC family has a second Ethernet controller, called
the GMAC200 in the BSP and T527 datasheet, and referred to as GMAC1 for
numbering. This controller, according to BSP sources, is fully
compatible with a slightly newer version of the Synopsys DWMAC core.
The glue layer around the controller is the same as found around older
DWMAC cores on Allwinner SoCs. The only slight difference is that since
this is the second controller on the SoC, the register for the clock
delay controls is at a different offset. Last, the integration includes
a dedicated clock gate for the memory bus and the whole thing is put in
a separately controllable power domain.

Add a new driver for this hardware supporting the integration layer.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
Changes since v5:
- Use plat->phy_interface instead of plat->mac_interface (Russell)

Changes since v3:
- Fixed printf format specifier warning

Changes since v2 (all suggested by Russell King):
- Include "ps" unit in "... must be multiple of ..." error message
- Use FIELD_FIT to check if delay value is in range and FIELD_MAX to get
  the maximum value
- Reword error message for delay value exceeding maximum
- Drop MASK_TO_VAL

Changes since v1:
- Switch to generic (tx|rx)-internal-delay-ps properties
- Change dev_err() + return to dev_err_probe()
- Check return value from syscon regmap write
- Change driver name to match file name
---
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 ++
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-sun55i.c    | 159 ++++++++++++++++++
 3 files changed, 172 insertions(+)
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-sun55i.c

diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
index 91d9a14362bf..9507131875b2 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
+++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
@@ -265,6 +265,18 @@ config DWMAC_SUN8I
 	  stmmac device driver. This driver is used for H3/A83T/A64
 	  EMAC ethernet controller.
 
+config DWMAC_SUN55I
+	tristate "Allwinner sun55i GMAC200 support"
+	default ARCH_SUNXI
+	depends on OF && (ARCH_SUNXI || COMPILE_TEST)
+	select MDIO_BUS_MUX
+	help
+	  Support for Allwinner A523/T527 GMAC200 ethernet controllers.
+
+	  This selects Allwinner SoC glue layer support for the
+	  stmmac device driver. This driver is used for A523/T527
+	  GMAC200 ethernet controller.
+
 config DWMAC_THEAD
 	tristate "T-HEAD dwmac support"
 	depends on OF && (ARCH_THEAD || COMPILE_TEST)
diff --git a/drivers/net/ethernet/stmicro/stmmac/Makefile b/drivers/net/ethernet/stmicro/stmmac/Makefile
index b591d93f8503..51e068e26ce4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Makefile
+++ b/drivers/net/ethernet/stmicro/stmmac/Makefile
@@ -31,6 +31,7 @@ obj-$(CONFIG_DWMAC_STI)		+= dwmac-sti.o
 obj-$(CONFIG_DWMAC_STM32)	+= dwmac-stm32.o
 obj-$(CONFIG_DWMAC_SUNXI)	+= dwmac-sunxi.o
 obj-$(CONFIG_DWMAC_SUN8I)	+= dwmac-sun8i.o
+obj-$(CONFIG_DWMAC_SUN55I)	+= dwmac-sun55i.o
 obj-$(CONFIG_DWMAC_THEAD)	+= dwmac-thead.o
 obj-$(CONFIG_DWMAC_DWC_QOS_ETH)	+= dwmac-dwc-qos-eth.o
 obj-$(CONFIG_DWMAC_INTEL_PLAT)	+= dwmac-intel-plat.o
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun55i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun55i.c
new file mode 100644
index 000000000000..862df173d963
--- /dev/null
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun55i.c
@@ -0,0 +1,159 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * dwmac-sun55i.c - Allwinner sun55i GMAC200 specific glue layer
+ *
+ * Copyright (C) 2025 Chen-Yu Tsai <wens@csie.org>
+ *
+ * syscon parts taken from dwmac-sun8i.c, which is
+ *
+ * Copyright (C) 2017 Corentin Labbe <clabbe.montjoie@gmail.com>
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/phy.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
+#include <linux/stmmac.h>
+
+#include "stmmac.h"
+#include "stmmac_platform.h"
+
+#define SYSCON_REG		0x34
+
+/* RMII specific bits */
+#define SYSCON_RMII_EN		BIT(13) /* 1: enable RMII (overrides EPIT) */
+/* Generic system control EMAC_CLK bits */
+#define SYSCON_ETXDC_MASK		GENMASK(12, 10)
+#define SYSCON_ERXDC_MASK		GENMASK(9, 5)
+/* EMAC PHY Interface Type */
+#define SYSCON_EPIT			BIT(2) /* 1: RGMII, 0: MII */
+#define SYSCON_ETCS_MASK		GENMASK(1, 0)
+#define SYSCON_ETCS_MII		0x0
+#define SYSCON_ETCS_EXT_GMII	0x1
+#define SYSCON_ETCS_INT_GMII	0x2
+
+static int sun55i_gmac200_set_syscon(struct device *dev,
+				     struct plat_stmmacenet_data *plat)
+{
+	struct device_node *node = dev->of_node;
+	struct regmap *regmap;
+	u32 val, reg = 0;
+	int ret;
+
+	regmap = syscon_regmap_lookup_by_phandle(node, "syscon");
+	if (IS_ERR(regmap))
+		return dev_err_probe(dev, PTR_ERR(regmap), "Unable to map syscon\n");
+
+	if (!of_property_read_u32(node, "tx-internal-delay-ps", &val)) {
+		if (val % 100)
+			return dev_err_probe(dev, -EINVAL,
+					     "tx-delay must be a multiple of 100ps\n");
+		val /= 100;
+		dev_dbg(dev, "set tx-delay to %x\n", val);
+		if (!FIELD_FIT(SYSCON_ETXDC_MASK, val))
+			return dev_err_probe(dev, -EINVAL,
+					     "TX clock delay exceeds maximum (%u00ps > %lu00ps)\n",
+					     val, FIELD_MAX(SYSCON_ETXDC_MASK));
+
+		reg |= FIELD_PREP(SYSCON_ETXDC_MASK, val);
+	}
+
+	if (!of_property_read_u32(node, "rx-internal-delay-ps", &val)) {
+		if (val % 100)
+			return dev_err_probe(dev, -EINVAL,
+					     "rx-delay must be a multiple of 100ps\n");
+		val /= 100;
+		dev_dbg(dev, "set rx-delay to %x\n", val);
+		if (!FIELD_FIT(SYSCON_ERXDC_MASK, val))
+			return dev_err_probe(dev, -EINVAL,
+					     "RX clock delay exceeds maximum (%u00ps > %lu00ps)\n",
+					     val, FIELD_MAX(SYSCON_ERXDC_MASK));
+
+		reg |= FIELD_PREP(SYSCON_ERXDC_MASK, val);
+	}
+
+	switch (plat->phy_interface) {
+	case PHY_INTERFACE_MODE_MII:
+		/* default */
+		break;
+	case PHY_INTERFACE_MODE_RGMII:
+	case PHY_INTERFACE_MODE_RGMII_ID:
+	case PHY_INTERFACE_MODE_RGMII_RXID:
+	case PHY_INTERFACE_MODE_RGMII_TXID:
+		reg |= SYSCON_EPIT | SYSCON_ETCS_INT_GMII;
+		break;
+	case PHY_INTERFACE_MODE_RMII:
+		reg |= SYSCON_RMII_EN;
+		break;
+	default:
+		return dev_err_probe(dev, -EINVAL, "Unsupported interface mode: %s",
+				     phy_modes(plat->phy_interface));
+	}
+
+	ret = regmap_write(regmap, SYSCON_REG, reg);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Failed to write to syscon\n");
+
+	return 0;
+}
+
+static int sun55i_gmac200_probe(struct platform_device *pdev)
+{
+	struct plat_stmmacenet_data *plat_dat;
+	struct stmmac_resources stmmac_res;
+	struct device *dev = &pdev->dev;
+	struct clk *clk;
+	int ret;
+
+	ret = stmmac_get_platform_resources(pdev, &stmmac_res);
+	if (ret)
+		return ret;
+
+	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
+	if (IS_ERR(plat_dat))
+		return PTR_ERR(plat_dat);
+
+	/* BSP disables it */
+	plat_dat->flags |= STMMAC_FLAG_SPH_DISABLE;
+	plat_dat->host_dma_width = 32;
+
+	ret = sun55i_gmac200_set_syscon(dev, plat_dat);
+	if (ret)
+		return ret;
+
+	clk = devm_clk_get_enabled(dev, "mbus");
+	if (IS_ERR(clk))
+		return dev_err_probe(dev, PTR_ERR(clk),
+				     "Failed to get or enable MBUS clock\n");
+
+	ret = devm_regulator_get_enable_optional(dev, "phy");
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get or enable PHY supply\n");
+
+	return devm_stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
+}
+
+static const struct of_device_id sun55i_gmac200_match[] = {
+	{ .compatible = "allwinner,sun55i-a523-gmac200" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, sun55i_gmac200_match);
+
+static struct platform_driver sun55i_gmac200_driver = {
+	.probe  = sun55i_gmac200_probe,
+	.driver = {
+		.name           = "dwmac-sun55i",
+		.pm		= &stmmac_pltfr_pm_ops,
+		.of_match_table = sun55i_gmac200_match,
+	},
+};
+module_platform_driver(sun55i_gmac200_driver);
+
+MODULE_AUTHOR("Chen-Yu Tsai <wens@csie.org>");
+MODULE_DESCRIPTION("Allwinner sun55i GMAC200 specific glue layer");
+MODULE_LICENSE("GPL");
-- 
2.47.3


