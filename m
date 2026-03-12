Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C449103E2FC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 01:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dVQImvwVuFgLGaPSNZZSO2BUtPLh4LHelsGPP31DnmM=; b=NuGD0INbj/XBTqMaAd/tMtJHyC
	SHjZndy4JGd83ZM68/XSH0skaeKlKRwUXEdooOYEFZRLJ5DkkE9acTobQPNB5q8J9JcBtmyFiH388
	/B1RKdA0FrBNK+bsS/okgp6gg26Ria3Jmr+kiZvli+P1H9mHYNcR0PA5N+Eia87wqL0nGSjim+nIu
	a5vxbz/OYBNO9Og1Zd6OEOgQTM4NQRIXK89aAWLD6xaw6tArPG87X13G72IlW3voXP1jtsuwIKgUB
	gt5bdmwPkIltFzKCwEfwAqvFUwMiPKakAvy8IZIxDS5u7WHmP1UIsPgKxc8cagj/7u5A90AbzR+VX
	YhLlkWMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Uly-0000000CzvQ-3Qc5;
	Thu, 12 Mar 2026 01:23:34 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Ulv-0000000Czs3-3ybu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 01:23:33 +0000
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-509101189edso4540111cf.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 18:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773278610; x=1773883410; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dVQImvwVuFgLGaPSNZZSO2BUtPLh4LHelsGPP31DnmM=;
        b=Zc4SBI/MNcfrYXAWQJQW0T77zfd6wadQ92jE3d3heOxljZs9x9/hDApMAwgZvn8l+l
         USZ0sVsHOczvB1pls5t4gC7CBDSv0lM6lY6Qmgb4XU5bcJu+c1ehjhoCKUIFJi+QIzOS
         cRi+znrIRzJXtjEyNGCm47B8g2AOI6KLVLcrZbmYu/VyC+H6VeWZyhHDi4sukGwmipvH
         xCBy+4GgP6WOx+vNFdomHp1qcMiTWvpjgTzOvYUtShxCV1a5OIaCJBKOIbPuY3vjZMa8
         vmIvp7u0Qccyt2QNTyt6UICuWD+YS9zjEzjm3menZ8pwBKWmM8oSe3tS2ouW5ztYoHgD
         GhUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773278610; x=1773883410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dVQImvwVuFgLGaPSNZZSO2BUtPLh4LHelsGPP31DnmM=;
        b=lTUtNl74fC4+hI9XNzZeRmG9AFZcwgNHOQCvZZFSDyrf3lYp4E+3n7FxizeX6l2X+m
         TFi9JPnTQW4s9CMJcTyHhM5E6Rrt4vwBP0gImnaHhAvq8XhdIuT59tsk0q1ifyUtsmyL
         0crLaYXLQ9aATAMny1E5RW8fWoRjN6CXBLtrepg60eaeklKaV3QNU61yaQDlV1bqfJIe
         WE5PPVj8BBfEw1TIuLLe9AnjqRoCZ8uZ9HVa8nWLeSS+hdXogMEnlr+JBFHuB2dQIBA8
         ljGdfRH02rSmk07mAmuBxfn0ibHfTrt+Wn9Xu8MVJmT5OtaELZfD3jBQ+Mz0UU8wgrAj
         WVgg==
X-Forwarded-Encrypted: i=1; AJvYcCUSKZUHD0GecWxrrspCrOaCtjrinRyiYTiPvBzO1MJy26TNIcIgTJtaYDdQUUboeRGEKsmRShTxFS5IO9VR5lCI@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8nMn6ygKKHvWvRDq4eDkj2O4HqbppL0c00l7L41BALkU31bk4
	JYhQ+uZZvK79ed4rXvAbPrAslvgvqLFcewMXZj3oqy4fxUdFM2ye8kJZ
X-Gm-Gg: ATEYQzwWYnCdmvM5UFYJSwdCW7vkdxKQOvxNfIijf2QU82tGLHOWHnck9U+a5w3NwIu
	9njBe17UvnR0i+gFwB5MWA1D41Gg+VyWTZevMD6OkKT+n0keR/9Dz4OL+Q8NwJr4mznYbXhkIrY
	VbxquCwk+Xz3BuS8ugF19vGa0KlV4A10dMgIBP2iKWMx3EpsVcLX9eSNiDDB4Q7oPOtNYo9Fzvs
	GeBr3zbUTmwuVQJ4NHaS7t4+zBW89P289HZGJh941ZZLRVeBWnL4dDufxDM6BSjQ8jJ+aWP/ZmN
	R2ybjdRpZttKyw0xYHkdTZpbCsN8l/c1AjjsNef5eKQJdFs9gR8Jl3j5jD7Eqz82TLAedrPnA0v
	6967VaXeUPLrJC7uSPG57CuUmCl/pJzQte3ncoB7ZLORbfWhQzaswEoXU6jDXOsQtgCkyqtxQ7F
	+jFWS9a5ntRIxJGx1vo/Qlas0=
X-Received: by 2002:a05:622a:18a0:b0:509:13a9:552f with SMTP id d75a77b69052e-50939fa7629mr54202091cf.18.1773278610340;
        Wed, 11 Mar 2026 18:23:30 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50939ec56d0sm25212731cf.11.2026.03.11.18.23.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 18:23:29 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Yixun Lan <dlan@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Yao Zi <me@ziyao.cc>,
	Yanteng Si <siyanteng@cqsoftware.com.cn>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Shangjuan Wei <weishangjuan@eswincomputing.com>,
	Boon Khai Ng <boon.khai.ng@altera.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH net-next v9 3/4] net: stmmac: Add glue layer for Spacemit K3 SoC
Date: Thu, 12 Mar 2026 09:22:25 +0800
Message-ID: <20260312012232.373713-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260312012232.373713-1-inochiama@gmail.com>
References: <20260312012232.373713-1-inochiama@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_182332_017458_8EA8F320 
X-CRM114-Status: GOOD (  29.43  )
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

The ethernet controller on Spacemit K3 SoC is Synopsys DesignWare
MAC (version 5.40a), with the following special points:
1. The rate of the tx clock line is auto changed when the mac speed
   rate is changed, and no need for changing the input tx clock.
2. This controller require a extra syscon device to configure the
   interface type, enable wake up interrupt and delay configuration
   if needed.

Add Spacemit dwmac driver support on the Spacemit K3 SoC.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 +
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-spacemit.c  | 227 ++++++++++++++++++
 3 files changed, 240 insertions(+)
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c

diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
index 07088d03dbab..d3a6ab7383fc 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
+++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
@@ -216,6 +216,18 @@ config DWMAC_SOPHGO
 	  for the stmmac device driver. This driver is used for the
 	  ethernet controllers on various Sophgo SoCs.
 
+config DWMAC_SPACEMIT
+	tristate "Spacemit dwmac support"
+	depends on OF && (ARCH_SPACEMIT || COMPILE_TEST)
+	select MFD_SYSCON
+	default m if ARCH_SPACEMIT
+	help
+	  Support for ethernet controllers on Spacemit RISC-V SoCs
+
+	  This selects the Spacemit platform specific glue layer support
+	  for the stmmac device driver. This driver is used for the
+	  Spacemit K3 ethernet controllers.
+
 config DWMAC_STARFIVE
 	tristate "StarFive dwmac support"
 	depends on OF && (ARCH_STARFIVE || COMPILE_TEST)
diff --git a/drivers/net/ethernet/stmicro/stmmac/Makefile b/drivers/net/ethernet/stmicro/stmmac/Makefile
index c9263987ef8d..945c5354eced 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Makefile
+++ b/drivers/net/ethernet/stmicro/stmmac/Makefile
@@ -27,6 +27,7 @@ obj-$(CONFIG_DWMAC_RZN1)	+= dwmac-rzn1.o
 obj-$(CONFIG_DWMAC_S32)		+= dwmac-s32.o
 obj-$(CONFIG_DWMAC_SOCFPGA)	+= dwmac-altr-socfpga.o
 obj-$(CONFIG_DWMAC_SOPHGO)	+= dwmac-sophgo.o
+obj-$(CONFIG_DWMAC_SPACEMIT)	+= dwmac-spacemit.o
 obj-$(CONFIG_DWMAC_STARFIVE)	+= dwmac-starfive.o
 obj-$(CONFIG_DWMAC_STI)		+= dwmac-sti.o
 obj-$(CONFIG_DWMAC_STM32)	+= dwmac-stm32.o
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c
new file mode 100644
index 000000000000..c47f26385831
--- /dev/null
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c
@@ -0,0 +1,227 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Spacemit DWMAC platform driver
+ *
+ * Copyright (C) 2026 Inochi Amaoto <inochiama@gmail.com>
+ */
+
+#include <linux/clk.h>
+#include <linux/math.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/mfd/syscon.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/regmap.h>
+
+#include "stmmac_platform.h"
+
+/* ctrl register bits */
+#define CTRL_PHY_INTF_RGMII		BIT(3)
+#define CTRL_PHY_INTF_MII		BIT(4)
+#define CTRL_WAKE_IRQ_EN		BIT(9)
+#define CTRL_PHY_IRQ_EN			BIT(12)
+
+/* dline register bits */
+#define RGMII_RX_DLINE_EN		BIT(0)
+#define RGMII_RX_DLINE_STEP		GENMASK(5, 4)
+#define RGMII_RX_DLINE_CODE		GENMASK(15, 8)
+#define RGMII_TX_DLINE_EN		BIT(16)
+#define RGMII_TX_DLINE_STEP		GENMASK(21, 20)
+#define RGMII_TX_DLINE_CODE		GENMASK(31, 24)
+
+#define MAX_DLINE_DELAY_CODE		0xff
+#define MAX_WORKED_DELAY		2800
+/* Note: the delay step value is at 0.1ps */
+#define K3_DELAY_STEP			367
+
+struct spacmit_dwmac {
+	struct regmap *apmu;
+	unsigned int ctrl_offset;
+	unsigned int dline_offset;
+};
+
+static int spacemit_dwmac_set_delay(struct spacmit_dwmac *dwmac,
+				    unsigned int tx_code, unsigned int rx_code)
+{
+	unsigned int mask, val;
+
+	mask = RGMII_TX_DLINE_STEP | RGMII_TX_DLINE_CODE | RGMII_TX_DLINE_EN |
+	       RGMII_RX_DLINE_STEP | RGMII_RX_DLINE_CODE | RGMII_RX_DLINE_EN;
+
+	/*
+	 * Since the delay step provided by config 0 is small enough, and
+	 * it can cover the range of the valid delay, so there is no needed
+	 * to use other step config.
+	 */
+	val = FIELD_PREP(RGMII_TX_DLINE_STEP, 0) |
+	      FIELD_PREP(RGMII_TX_DLINE_CODE, tx_code) | RGMII_TX_DLINE_EN |
+	      FIELD_PREP(RGMII_RX_DLINE_STEP, 0) |
+	      FIELD_PREP(RGMII_RX_DLINE_CODE, rx_code) | RGMII_RX_DLINE_EN;
+
+	return regmap_update_bits(dwmac->apmu, dwmac->dline_offset,
+				  mask, val);
+}
+
+static int spacemit_dwmac_detected_delay_value(unsigned int delay)
+{
+	if (delay == 0)
+		return 0;
+
+	if (delay > MAX_WORKED_DELAY)
+		return -EINVAL;
+
+	/*
+	 * Note K3 require a specific factor for calculate
+	 * the delay, in this scenario it is 0.9. So the
+	 * formula is code * step / 10 * 0.9
+	 */
+	return DIV_ROUND_CLOSEST(delay * 10 * 10, K3_DELAY_STEP * 9);
+}
+
+static int spacemit_dwmac_fix_delay(struct spacmit_dwmac *dwmac,
+				    unsigned int tx_delay,
+				    unsigned int rx_delay)
+{
+	int rx_code;
+	int tx_code;
+
+	rx_code = spacemit_dwmac_detected_delay_value(rx_delay);
+	if (rx_code < 0)
+		return rx_code;
+
+	tx_code = spacemit_dwmac_detected_delay_value(tx_delay);
+	if (tx_code < 0)
+		return tx_code;
+
+	return spacemit_dwmac_set_delay(dwmac, tx_code, rx_code);
+}
+
+static int spacemit_dwmac_update_irq_config(struct spacmit_dwmac *dwmac,
+					    struct stmmac_resources *stmmac_res)
+{
+	unsigned int val = stmmac_res->wol_irq >= 0 ? CTRL_WAKE_IRQ_EN : 0;
+	unsigned int mask = CTRL_WAKE_IRQ_EN;
+
+	return regmap_update_bits(dwmac->apmu, dwmac->ctrl_offset,
+				  mask, val);
+}
+
+static void spacemit_get_interfaces(struct stmmac_priv *priv, void *bsp_priv,
+				    unsigned long *interfaces)
+{
+	__set_bit(PHY_INTERFACE_MODE_MII, interfaces);
+	__set_bit(PHY_INTERFACE_MODE_RMII, interfaces);
+	phy_interface_set_rgmii(interfaces);
+}
+
+static int spacemit_set_phy_intf_sel(void *bsp_priv, u8 phy_intf_sel)
+{
+	unsigned int mask = CTRL_PHY_INTF_MII | CTRL_PHY_INTF_RGMII;
+	struct spacmit_dwmac *dwmac = bsp_priv;
+	unsigned int val = 0;
+
+	switch (phy_intf_sel) {
+	case PHY_INTF_SEL_GMII_MII:
+		val = CTRL_PHY_INTF_MII;
+		break;
+
+	case PHY_INTF_SEL_RMII:
+		break;
+
+	case PHY_INTF_SEL_RGMII:
+		val = CTRL_PHY_INTF_RGMII;
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	return regmap_update_bits(dwmac->apmu, dwmac->ctrl_offset,
+				  mask, val);
+}
+
+static int spacemit_dwmac_probe(struct platform_device *pdev)
+{
+	struct plat_stmmacenet_data *plat_dat;
+	struct stmmac_resources stmmac_res;
+	struct device *dev = &pdev->dev;
+	struct spacmit_dwmac *dwmac;
+	unsigned int offset[2];
+	struct regmap *apmu;
+	struct clk *clk_tx;
+	u32 rx_delay = 0;
+	u32 tx_delay = 0;
+	int ret;
+
+	ret = stmmac_get_platform_resources(pdev, &stmmac_res);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to get platform resources\n");
+
+	dwmac = devm_kzalloc(&pdev->dev, sizeof(*dwmac), GFP_KERNEL);
+	if (!dwmac)
+		return -ENOMEM;
+
+	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
+	if (IS_ERR(plat_dat))
+		return dev_err_probe(dev, PTR_ERR(plat_dat),
+				     "failed to parse DT parameters\n");
+
+	clk_tx = devm_clk_get_enabled(&pdev->dev, "tx");
+	if (IS_ERR(clk_tx))
+		return dev_err_probe(&pdev->dev, PTR_ERR(clk_tx),
+				     "failed to get tx clock\n");
+
+	apmu = syscon_regmap_lookup_by_phandle_args(pdev->dev.of_node,
+						    "spacemit,apmu", 2,
+						    offset);
+	if (IS_ERR(apmu))
+		return dev_err_probe(dev, PTR_ERR(apmu),
+				"Failed to get apmu regmap\n");
+
+	dwmac->apmu = apmu;
+	dwmac->ctrl_offset = offset[0];
+	dwmac->dline_offset = offset[1];
+
+	ret = spacemit_dwmac_update_irq_config(dwmac, &stmmac_res);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to configure irq config\n");
+
+	of_property_read_u32(pdev->dev.of_node, "tx-internal-delay-ps",
+			     &tx_delay);
+	of_property_read_u32(pdev->dev.of_node, "rx-internal-delay-ps",
+			     &rx_delay);
+
+	plat_dat->get_interfaces = spacemit_get_interfaces;
+	plat_dat->set_phy_intf_sel = spacemit_set_phy_intf_sel;
+	plat_dat->bsp_priv = dwmac;
+
+	ret = spacemit_dwmac_fix_delay(dwmac, tx_delay, rx_delay);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to configure delay\n");
+
+	return stmmac_dvr_probe(dev, plat_dat, &stmmac_res);
+}
+
+static const struct of_device_id spacemit_dwmac_match[] = {
+	{ .compatible = "spacemit,k3-dwmac" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, spacemit_dwmac_match);
+
+static struct platform_driver spacemit_dwmac_driver = {
+	.probe  = spacemit_dwmac_probe,
+	.remove = stmmac_pltfr_remove,
+	.driver = {
+		.name = "spacemit-dwmac",
+		.pm = &stmmac_pltfr_pm_ops,
+		.of_match_table = spacemit_dwmac_match,
+	},
+};
+module_platform_driver(spacemit_dwmac_driver);
+
+MODULE_AUTHOR("Inochi Amaoto <inochiama@gmail.com>");
+MODULE_DESCRIPTION("Spacemit DWMAC platform driver");
+MODULE_LICENSE("GPL");
-- 
2.53.0


