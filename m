Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35281D35687
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 07:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fUAlcjlhE29H5H5PUKfg3wkA3zq9RKgoay7Cyo7WuV8=; b=48KgQY8vo3zhUHdY9NJ4xTCfs2
	8gGBptFeArVAgnE5HFKAlePgWQAvr9908RSNF0tv5B0TKU11T1UFOyGHw70MwoRJyzign6TubxoOV
	zAeULrlxpxKqihdjNWNt204Xpf1cBCYtLlssmyFjL8sCV3jSohJ7Cl51Lg0hZ5HQDfFLvfAYwcfbi
	lnE4vJnGvdWpfMxF2DgTF+DCcqHEXNEd4dYAAEHGwkHjoUAVceFpFJ2Uc6LHUXLOr5UOFw8WGqXNg
	V3ynJ6SG8kYrVNFLcBfgz4T+++9/9DXgjRZrnED7b0AzNQEQKZmYBOkeMQ3Trz8VjlvbJksRi1PbK
	2tpaEBCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl009-0000000FaAZ-2JlY;
	Wed, 28 Jan 2026 07:30:09 +0000
Received: from mail-dl1-x1235.google.com ([2607:f8b0:4864:20::1235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl004-0000000Fa8t-27R6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 07:30:05 +0000
Received: by mail-dl1-x1235.google.com with SMTP id a92af1059eb24-12331482b8fso225295c88.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 23:30:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769585403; x=1770190203; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fUAlcjlhE29H5H5PUKfg3wkA3zq9RKgoay7Cyo7WuV8=;
        b=dRov+lYCR0T8yKBuB05xJlBSBFgM5gGDT13cLJpOcvsaqUo2coI7299zcxYGVcwRcs
         6xSrGlWiv28cGL5CaldVJmuBGCVCR5iudByzEMdRstJSwsjUD35wIyqYJS4b5tXjXSyI
         1oxEERnW4dwjMiYZ+cL4CGE/l/k3EYvz0IfOQ5msi8uVXPIJGsy+AbmXJWAfzX+YLv8d
         EJhCX/gK28YgRlK79lI8+CE9uiPKTky0E9wTyrbvPNU+LDobatHSoWVXoajRMhUz5Lki
         dM4uYRN0Pi9ENvkadqnQydDFuk02cjS0GkJfZzjOBOf2mPykDqT4ygHKWG7Tpq8BZdBI
         vK9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769585403; x=1770190203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fUAlcjlhE29H5H5PUKfg3wkA3zq9RKgoay7Cyo7WuV8=;
        b=ib75F0akIQzBBU4UbXOMVrdMQ3ap9sVPOb5fFNiYtJHcNglJhd0Ysv0ZiHkwhTVMaT
         /98PWvM+xn4ZNtYDHv6t8hGr+QaiPhLjeFVkptX50qtrmtEvD/KzXO+EjXWZCBacehLd
         htOaRR65Vqszgo/B4eDFgVRSiG2N6xaJzO+XEBaYvDBxPBa8zHtCidKZUbNwa5XUVfAE
         bNjjkGQE/83y2NUJjwKl6P4dOod7RaqjoodG146E1KtxbV/X+cSZ6xpq/o+O5GDWOn85
         N880hf2j1p6ump07L7TdGiy9U0xMnjeJyyjQSYEPAYPhI3UmLU4BIHN7qGhavYMN0BLP
         iD/A==
X-Forwarded-Encrypted: i=1; AJvYcCUbHPSOioD4jvxrAHaLmeboaJeEOJ9jUt20IlDJGSZTSlLJZ37Fd80b55coxVSbtEGbz2/vWXNQlTdJ+dCx3xEh@lists.infradead.org
X-Gm-Message-State: AOJu0YyT2/PJ6nlo+pZ3XE9qV/M6q7IMd0fdwoGT1U57q/8sfS0KI8V7
	owqT71SY9wqpSaOjy0zbkeiJYblX4rHc0rc8nm7jr5Ql7M8atmCWafR2
X-Gm-Gg: AZuq6aJ2H712sYQGPb3N/A10yuctCFz0KL3EaMIN6jbOVJxmX80ybDy/mIkQ5wL1sOJ
	3EKN3EnXHR0B2aimtGMhcuMYgfgvQ5hdLhC7tf6DaKd7BuQe0219VNgSXd+cOaLoCzme6biyhjX
	OBBt+t6JZIkmyfGZIW0BHHta+ekTu1hs1Zdr2BBoBm13rTBVrseH1KYojbzzlr685F7xoTzPjTT
	C3E8Ur5i/kqHbKWvC6Z8I3ILlWRyKXkQwTvAlBiXedKdtnnYe8CG87etfthQLj3hGGrRjEcUgMx
	pF4TXGM56MW48pXScFRSulFI2wFyUvAzA/gwyDtL7fW7WBqODBUcP80rkOi/kvAL0evZKACUA9Y
	72hv35Y5Oe2pRvTQtz5VmYEbKy4NKLAKADu9hR+1vIHoxpQRD+1gnJC18gmdVZJn6PbJEirCe/w
	zWULBV/Y/fOQ==
X-Received: by 2002:a05:693c:4087:b0:2b7:2bbd:95a2 with SMTP id 5a478bee46e88-2b78da4a12fmr2343465eec.40.1769585403387;
        Tue, 27 Jan 2026 23:30:03 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a16cfc73sm1552992eec.6.2026.01.27.23.30.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 23:30:03 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Yao Zi <ziyao@disroot.org>,
	Yanteng Si <siyanteng@cqsoftware.com.cn>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Choong Yong Liang <yong.liang.choong@linux.intel.com>,
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
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH net-next v3 3/3] net: stmmac: Add glue layer for Spacemit K3 SoC
Date: Wed, 28 Jan 2026 15:29:29 +0800
Message-ID: <20260128072931.875041-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260128072931.875041-1-inochiama@gmail.com>
References: <20260128072931.875041-1-inochiama@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_233004_560214_85508DD2 
X-CRM114-Status: GOOD (  29.63  )
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

The etherenet controller on Spacemit K3 SoC is Synopsys DesignWare
MAC (version 5.40a), with the following special point:
1. The rate of the tx clock line is auto changed when the mac speed
   rate is changed, and no need for changing the input tx clock.
2. This controller require a extra syscon device to configure the
   interface type, enable wake up interrupt and delay configuration
   if needed.

Add Spacemit dwmac driver support on the Spacemit K3 SoC.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 +
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-spacemit.c  | 218 ++++++++++++++++++
 3 files changed, 231 insertions(+)
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c

diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
index 907fe2e927f0..583a4692f5da 100644
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
index 7bf528731034..9e32045631d8 100644
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
index 000000000000..d5cb91182963
--- /dev/null
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c
@@ -0,0 +1,218 @@
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
+#define PHY_INTF_RGMII			BIT(3)
+#define PHY_INTF_MII			BIT(4)
+
+#define WAKE_IRQ_EN			BIT(9)
+#define PHY_IRQ_EN			BIT(12)
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
+
+/* Note: the delay step value is at 0.1ps */
+static const unsigned int k3_delay_step_10x[4] = {
+	367, 493, 559, 685
+};
+
+static int spacemit_dwmac_set_delay(struct regmap *apmu,
+				    unsigned int dline_offset,
+				    unsigned int tx_code, unsigned int tx_config,
+				    unsigned int rx_code, unsigned int rx_config)
+{
+	unsigned int mask, val;
+
+	mask = RGMII_TX_DLINE_STEP | RGMII_TX_DLINE_CODE | RGMII_TX_DLINE_EN |
+	       RGMII_RX_DLINE_STEP | RGMII_RX_DLINE_CODE | RGMII_RX_DLINE_EN;
+	val = FIELD_PREP(RGMII_TX_DLINE_STEP, tx_config) |
+	      FIELD_PREP(RGMII_TX_DLINE_CODE, tx_code) | RGMII_TX_DLINE_EN |
+	      FIELD_PREP(RGMII_RX_DLINE_STEP, rx_config) |
+	      FIELD_PREP(RGMII_RX_DLINE_CODE, rx_code) | RGMII_RX_DLINE_EN;
+
+	return regmap_update_bits(apmu, dline_offset, mask, val);
+}
+
+static int spacemit_dwmac_detected_delay_value(unsigned int delay,
+					       unsigned int *config)
+{
+	unsigned int best_delay = 0;
+	unsigned int best_config = 0;
+	int best_code = 0;
+	int i;
+
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
+	for (i = 0; i < ARRAY_SIZE(k3_delay_step_10x); i++) {
+		unsigned int step = k3_delay_step_10x[i];
+		int code = DIV_ROUND_CLOSEST(delay * 10 * 10, step * 9);
+		unsigned int tmp = code * step * 9 / 10 / 10;
+
+		if (abs(tmp - delay) < abs(best_delay - delay)) {
+			best_code = code;
+			best_delay = tmp;
+			best_config = i;
+		}
+	}
+
+	*config = best_config;
+
+	return best_code;
+}
+
+static int spacemit_dwmac_fix_delay(struct plat_stmmacenet_data *plat_dat,
+				    struct regmap *apmu,
+				    unsigned int dline_offset,
+				    unsigned int tx_delay, unsigned int rx_delay)
+{
+	unsigned int rx_config = 0;
+	unsigned int tx_config = 0;
+	int rx_code;
+	int tx_code;
+
+	rx_code = spacemit_dwmac_detected_delay_value(rx_delay, &rx_config);
+	if (rx_code < 0)
+		return rx_code;
+
+	tx_code = spacemit_dwmac_detected_delay_value(tx_delay, &tx_config);
+	if (tx_code < 0)
+		return tx_code;
+
+	return spacemit_dwmac_set_delay(apmu, dline_offset,
+					tx_code, tx_config,
+					rx_code, rx_config);
+}
+
+static int spacemit_dwmac_update_ifconfig(struct plat_stmmacenet_data *plat_dat,
+					  struct stmmac_resources *stmmac_res,
+					  struct regmap *apmu,
+					  unsigned int ctrl_offset)
+{
+	unsigned int mask = PHY_INTF_MII | PHY_INTF_RGMII | WAKE_IRQ_EN;
+	unsigned int val = 0;
+
+	switch (plat_dat->phy_interface) {
+	case PHY_INTERFACE_MODE_MII:
+		val = PHY_INTF_MII;
+		break;
+
+	case PHY_INTERFACE_MODE_RMII:
+		break;
+
+	case PHY_INTERFACE_MODE_RGMII:
+	case PHY_INTERFACE_MODE_RGMII_ID:
+	case PHY_INTERFACE_MODE_RGMII_RXID:
+	case PHY_INTERFACE_MODE_RGMII_TXID:
+		val = PHY_INTF_RGMII;
+		break;
+
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	if (stmmac_res->wol_irq >= 0)
+		val |= WAKE_IRQ_EN;
+
+	return regmap_update_bits(apmu, ctrl_offset, mask, val);
+}
+
+static int spacemit_dwmac_probe(struct platform_device *pdev)
+{
+	struct plat_stmmacenet_data *plat_dat;
+	struct stmmac_resources stmmac_res;
+	struct device *dev = &pdev->dev;
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
+	apmu = syscon_regmap_lookup_by_phandle_args(pdev->dev.of_node, "spacemit,apmu", 2, offset);
+	if (IS_ERR(apmu))
+		return dev_err_probe(dev, PTR_ERR(apmu),
+				"Failed to get apmu regmap\n");
+
+	ret = spacemit_dwmac_update_ifconfig(plat_dat, &stmmac_res,
+					     apmu, offset[0]);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to configure ifconfig\n");
+
+	of_property_read_u32(pdev->dev.of_node, "tx-internal-delay-ps", &tx_delay);
+	of_property_read_u32(pdev->dev.of_node, "rx-internal-delay-ps", &rx_delay);
+
+	ret = spacemit_dwmac_fix_delay(plat_dat, apmu, offset[1], tx_delay, rx_delay);
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
2.52.0


