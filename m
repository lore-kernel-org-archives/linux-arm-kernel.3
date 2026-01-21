Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D18ED262B2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 07:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q5QOmoL1No8TYm8M5X91IziuCiWq9EqJU0I5uGvwg5k=; b=d0/+7zu25AZjCoXiHXwdyQ/ptd
	R4aVpOKoKNyCDnMK4nwx8QaYifa4cyEh0+ZdIPP9sKEkqH/esv8yy8WhUbccOwqzKy4RszUXSb1dz
	1A5iJUoYv0udnQvberGduby0baO4C+Txm7yC38yMjslOhQwPWZBn0Ru2YiwAGnawouHtk/Zq3hAy1
	N3pqz2Z6eXkG4Ez+3EFhgESA2v+DfwxaFR+l7dinpzlXN9GQZ1pRikWZFLnegrEBNEtxuSgvGHp2B
	hNf5bnW3pFhdAGX9K3asjFTnPsEzZiywRWfOWunv1/ZIsHj9lGb4RgY92pEfWU+l91othvaqLOX1p
	0FXSVo8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viSPP-00000004zqM-3Xka;
	Wed, 21 Jan 2026 07:13:43 +0000
Received: from mail-dl1-x1229.google.com ([2607:f8b0:4864:20::1229])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viSPN-00000004zpK-2h1C
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 07:13:43 +0000
Received: by mail-dl1-x1229.google.com with SMTP id a92af1059eb24-12331482b8fso47691c88.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Jan 2026 23:13:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768979620; x=1769584420; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q5QOmoL1No8TYm8M5X91IziuCiWq9EqJU0I5uGvwg5k=;
        b=TdcX6UtJ6/yMFJtGFPYjX2VVH/15FiCUkCZ9Xr5YpPqxBEVwvb7t7NjXzZnjYpPNDV
         xJ9FE1PzrnSb9v7AQfDLjVQaQl6SpTd83sbwu7w7Ti1KfdHwEtEZozAerYER+ZK5N0hU
         +eEkhDvn86Je1RGf3nG40ffbIlPmIzaLV16BttiqjcfeVlVELRxX8aX703Cxy8G1igVA
         Cv3mrLXmBlAmNAb6t5BsEz8D+QhC2bQWf71lEMajedUM2HEhqkO2gCnhLQP9VqpDDAak
         KeyEzyobv4JkucheVpUmSyas5N6wnZXTf3OqOcCGmRcE8yATrByqtUfvcVjtwrkHd7XI
         aOMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768979620; x=1769584420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=q5QOmoL1No8TYm8M5X91IziuCiWq9EqJU0I5uGvwg5k=;
        b=R+tI8B9WfJQQ4zZjVnCZboqgbl3AKKEtrHZfjnpO8RTaJdvqBFukcHQWPujh8oPe80
         PPzZMSkp9RglNjTPGWIaKjzvqfNWY7Otb9gZteci794VOsG5TUQIP0sFXt08dMqXYJu7
         8yWCsO3qDieYJEmxBGzqyGGvK6BdoAFPvCoqZrFuKXTE4LMTM4A0SwawEzNTBp/0hBfJ
         LM+8LolN3hM2FV3Wr81wdu5BaJO/G8XDFHkWE24+JYtvv1VRgE8t2FO90Ps/27PvP1y8
         lUJohKD+cN2SfmAPuUE54nbIfj9Rt7fWZggghX+ijkGZ47sGOsFoXyKyUM9WIHRTKA6T
         ZRGw==
X-Forwarded-Encrypted: i=1; AJvYcCXFLgfNQYmOOWSmo2o6y2IJZtfVi6bBnOPoyzHoopdPhLtI0NZJ+BxEZz93r0jcbTi8iirw3qYZb/hYY5+W1rWZ@lists.infradead.org
X-Gm-Message-State: AOJu0YxP5KM59727FUerRV3ziWj+Oem0/Awfe2rV5RWHB1kVHYFYQPZf
	f7Vuhhc2SLImrFC6JGN7AIbEd6Vox8eizAAUCf+Vo+HCAjUIqjDDSIAn
X-Gm-Gg: AZuq6aJ+9R190KshU/T0XMQNdk3vnmi+jBP3UADgrL0ZtIA2Lu28ukG7TpP7uWEsiJm
	DGmht7IOaw8hf1gqxU0WbdCYvT5H5Envlg2fuJCmujdSgFGhm1p88UwG23bWs8fmzPyWbSuIIJF
	ifhGvEFAMb2HF0dTxU8vt8b4ExGcObJV5roeIb5pf6ojq5wQGxn+KGTmX+7QEGbTWQUpX+rM+yI
	AdHg7EVQ8oJKHk/zuh2FOey8McrCrR1pY8jLFoEs5HWzlwnX5o4s6MDRUNt1NlgkZEUBJGvzNZk
	hqcwdWC6WUY0Fh0oykJ7tsbO7aUXxmBxV2NDnjBe6IAkl2tjVwMGNlTtYex5EDBOmj75MjC8F71
	aSbM+KvvZ5J8d9ihkd5UFLAFxMyHWgCvLcrR/uLByPuNbX6FakZ+NnV1AtldKrDN//yQlGIOC+h
	9TWJ4iWPsUcQ==
X-Received: by 2002:a05:7022:6b86:b0:11a:fe6f:806a with SMTP id a92af1059eb24-1244a769e0emr11872529c88.31.1768979620027;
        Tue, 20 Jan 2026 23:13:40 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244aefa7c5sm25240654c88.10.2026.01.20.23.13.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 23:13:39 -0800 (PST)
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
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Choong Yong Liang <yong.liang.choong@linux.intel.com>,
	Shangjuan Wei <weishangjuan@eswincomputing.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Boon Khai Ng <boon.khai.ng@altera.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
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
Subject: [PATCH net-next v2 3/3] net: stmmac: Add glue layer for Spacemit K3 SoC
Date: Wed, 21 Jan 2026 15:13:11 +0800
Message-ID: <20260121071315.940130-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260121071315.940130-1-inochiama@gmail.com>
References: <20260121071315.940130-1-inochiama@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_231341_700002_9C39757A 
X-CRM114-Status: GOOD (  30.15  )
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
 .../ethernet/stmicro/stmmac/dwmac-spacemit.c  | 221 ++++++++++++++++++
 3 files changed, 234 insertions(+)
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
index 000000000000..ca600c068aaa
--- /dev/null
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c
@@ -0,0 +1,221 @@
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
+	mask = RGMII_RX_DLINE_STEP | RGMII_TX_DLINE_CODE | RGMII_TX_DLINE_EN |
+	       RGMII_TX_DLINE_STEP | RGMII_RX_DLINE_CODE | RGMII_RX_DLINE_EN;
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
+	bool mac_rxid = rx_delay != 0;
+	bool mac_txid = tx_delay != 0;
+	unsigned int rx_config = 0;
+	unsigned int tx_config = 0;
+	int rx_code;
+	int tx_code;
+
+	plat_dat->phy_interface = phy_fix_phy_mode_for_mac_delays(plat_dat->phy_interface,
+								  mac_txid,
+								  mac_rxid);
+
+	if (plat_dat->phy_interface == PHY_INTERFACE_MODE_NA)
+		return -EINVAL;
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
+	plat_dat->clk_tx_i = devm_clk_get_enabled(&pdev->dev, "tx");
+	if (IS_ERR(plat_dat->clk_tx_i))
+		return dev_err_probe(&pdev->dev, PTR_ERR(plat_dat->clk_tx_i),
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


