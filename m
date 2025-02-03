Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75BB4C02190
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 05:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rf/ShRyvxTN8+33G5lApFqsieby0UFmnabOeDI9FQLs=; b=Av4yJW5w/IJ+IpJzuKmq8xLaOb
	+BQv/r9wfQFT1PQxF35ROK5R0/oyddWmUtXHcW71+pxvq8hBpDKZrwNk/vts8l20AVGc0U9WVh2ul
	kTKzAUIFMTtuaAKSJOSMmP1Kw3CiyxOpu0V9RAtyb/VxXz2nPvRm0nI4asvmgO9bDV1e+qbvp87VK
	LRuFZBvA6X6GHZYo988o4mnPEv3MBHkAcE2PO00dleVW8a09A2vYD7vO2F7SYrhe2s87wBETOWc8X
	+danyGNno3PL9Cvar1UvqwMnDzxopSTpBeaJh9yj7KCdFmRI6UO+W+zo0pK9p/gce7PddOsGecU92
	L0PUa5jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tepKf-0000000Ebub-3s8o;
	Mon, 03 Feb 2025 05:49:17 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tepFV-0000000EbC9-2Cga
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 05:43:58 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-216395e151bso46601595ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Feb 2025 21:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738561436; x=1739166236; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rf/ShRyvxTN8+33G5lApFqsieby0UFmnabOeDI9FQLs=;
        b=bxbQlOnmc2jqxBtwtRIgYwQO4By0L+NWsatDK9dZOEy2uM7AEIAkCR7pYWHP7pWTXG
         teSKkfYNWmNTu+G9tN7hXf/ZQL8+jkSZ3onJIRNxmCWaGhR+kuY3Qy/jlzJLOIWC0Qwp
         HI3Zc+v6O87D05W9BdyW1oC7sIY8ZiIExZD9hmDcLsKCo6shcsNBrgno3oUIA/vlAqWr
         8df6yWEpJ3o4XRJniokn22VV6WHyD7LQN96rvkID5ZFfjlRAsGEr7ibhEL2GHc+79Bou
         LAV27VxV6bFo1TUKY6Zr5cANTpGFI8vcQHvjnOXhdXnQwSNEO1hB2SeKudfiAi+TLbkg
         QJLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738561436; x=1739166236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rf/ShRyvxTN8+33G5lApFqsieby0UFmnabOeDI9FQLs=;
        b=etlydp3747J4Vd8U442y9WVSkYinueksQ9UvFvEBlSEwi75D+cb+B74NVIJEoIeTJ2
         d+dK6gYO/H7TvW22Urnj7KKuuhSnPyVbzhSCClUjDyGQ26zL6V8gjbumrq3grwInzjsw
         mx183cgnwZFDLoTLAfuujKol649me5R9+I/2JLEoZzpGI/Ao9kq/9YhkwBNKWL4XIHnD
         x80OHsW4AX0UgHjylUbt/fXfhDKY1UrS7nQcKxC557T5U6U88+JsI8BGJ7CvebrowotX
         esLbNizaJFTQtkEpu2orTwJAWwsGDBHpmj6Af8ywmByNWtJfIqWX/BCnKOibRrSJK7sy
         X5vw==
X-Forwarded-Encrypted: i=1; AJvYcCW0N77oIl8lekiAOw8ClZb+6G6zHuMkkUxjAnCsOKGkrutQU0K9N7F3ItIlJ5fz/ySkFxWgCmxJ73Nq5TDTju7i@lists.infradead.org
X-Gm-Message-State: AOJu0YwyGYVdyplaqTbpBJRbpXkwLgEFAczkJlDh81G1dIHrWMlhTliy
	0e9YRsXS6V1uF3dNercxBw60JrH3EtvDbJ1MPMwu+Ml8LLmx790l
X-Gm-Gg: ASbGncu76+xS5Gl0eWpATTnr9xoeonoD01WdLETX4BrnGbmX9RvMYj1EYK2yVrn+X/3
	C+nuHmHycSniJyk8BL9FE5HwvLe9HzmSLXBFQCAszGfk/uAbxAWTsK7KzftQwPtWOboXQXziY2B
	JgQQs9BWQjJGJ4NAZUaKLX4mykTprOBmSHb+whfiE2Aq+i2/6ij6k7Kuol/7j/Owh3DRB85ImXN
	Bd6gktPBZXS4WfBqiytoFOu8UmHO8HWWWWMLHyRjFGW9HF+b5bKPB2vj/4EHIIOv5tU4/EwZ7Pu
	MHNWlFu70DDcPBqDO7JANZtuL0Q3kRXQYLJuEuO2yAL6PynHPTDoAptp
X-Google-Smtp-Source: AGHT+IEFZ/36yBGHunOCtMy0HzmagZccJHEJhSVPNJSjo1bf8v5C2SzsrkRY+0DkSsg96GNkpYmziQ==
X-Received: by 2002:a17:902:c40e:b0:216:6ef9:60d with SMTP id d9443c01a7336-21edd86e506mr222878405ad.23.1738561436434;
        Sun, 02 Feb 2025 21:43:56 -0800 (PST)
Received: from yclu-ubuntu.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de32ea5fesm66894555ad.132.2025.02.02.21.43.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 21:43:56 -0800 (PST)
From: Joey Lu <a0987203069@gmail.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mcoquelin.stm32@gmail.com,
	richardcochran@gmail.com
Cc: alexandre.torgue@foss.st.com,
	joabreu@synopsys.com,
	ychuang3@nuvoton.com,
	schung@nuvoton.com,
	yclu4@nuvoton.com,
	peppe.cavallaro@st.com,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Joey Lu <a0987203069@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH net-next v8 3/3] net: stmmac: dwmac-nuvoton: Add dwmac glue for Nuvoton MA35 family
Date: Mon,  3 Feb 2025 13:42:00 +0800
Message-Id: <20250203054200.21977-4-a0987203069@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250203054200.21977-1-a0987203069@gmail.com>
References: <20250203054200.21977-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250202_214357_566409_3B63CBA7 
X-CRM114-Status: GOOD (  26.67  )
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

Add support for Gigabit Ethernet on Nuvoton MA35 series using dwmac driver.

The driver has been tested on the NuMaker-HMI-MA35D1-S1 development board,
and the log is attached below. For more information about the SoCs,
please refer to the MA35D1 series datasheet.

[    0.000000] Machine model: Nuvoton MA35D1-SOM
...
[    1.836386] nuvoton-dwmac 40120000.ethernet: IRQ eth_wake_irq not found
[    1.843039] nuvoton-dwmac 40120000.ethernet: IRQ eth_lpi not found
[    1.849304] nuvoton-dwmac 40120000.ethernet: IRQ sfty not found
[    1.856331] nuvoton-dwmac 40120000.ethernet: User ID: 0x10, Synopsys ID: 0x37
[    1.863532] nuvoton-dwmac 40120000.ethernet:         DWMAC1000
[    1.868750] nuvoton-dwmac 40120000.ethernet: DMA HW capability register supported
[    1.876190] nuvoton-dwmac 40120000.ethernet: RX Checksum Offload Engine supported
[    1.883696] nuvoton-dwmac 40120000.ethernet: COE Type 2
[    1.888903] nuvoton-dwmac 40120000.ethernet: TX Checksum insertion supported
[    1.895912] nuvoton-dwmac 40120000.ethernet: Enhanced/Alternate descriptors
[    1.902846] nuvoton-dwmac 40120000.ethernet: Enabled extended descriptors
[    1.909598] nuvoton-dwmac 40120000.ethernet: Ring mode enabled
[    1.915406] nuvoton-dwmac 40120000.ethernet: Enable RX Mitigation via HW Watchdog Timer
[    2.540881] nuvoton-dwmac 40130000.ethernet: IRQ eth_wake_irq not found
[    2.547463] nuvoton-dwmac 40130000.ethernet: IRQ eth_lpi not found
[    2.553626] nuvoton-dwmac 40130000.ethernet: IRQ sfty not found
[    2.560015] nuvoton-dwmac 40130000.ethernet: User ID: 0x10, Synopsys ID: 0x37
[    2.567116] nuvoton-dwmac 40130000.ethernet:         DWMAC1000
[    2.572300] nuvoton-dwmac 40130000.ethernet: DMA HW capability register supported
[    2.579747] nuvoton-dwmac 40130000.ethernet: RX Checksum Offload Engine supported
[    2.587198] nuvoton-dwmac 40130000.ethernet: COE Type 2
[    2.592395] nuvoton-dwmac 40130000.ethernet: TX Checksum insertion supported
[    2.599418] nuvoton-dwmac 40130000.ethernet: Enhanced/Alternate descriptors
[    2.606351] nuvoton-dwmac 40130000.ethernet: Enabled extended descriptors
[    2.613109] nuvoton-dwmac 40130000.ethernet: Ring mode enabled
[    2.618918] nuvoton-dwmac 40130000.ethernet: Enable RX Mitigation via HW Watchdog Timer

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 ++
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-nuvoton.c   | 182 ++++++++++++++++++
 3 files changed, 195 insertions(+)
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c

diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
index 4cc85a36a1ab..f083a0e97b75 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
+++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
@@ -121,6 +121,18 @@ config DWMAC_MESON
 	  the stmmac device driver. This driver is used for Meson6,
 	  Meson8, Meson8b and GXBB SoCs.
 
+config DWMAC_NUVOTON
+	tristate "Nuvoton MA35 dwmac support"
+	default ARCH_MA35
+	depends on OF && (ARCH_MA35 || COMPILE_TEST)
+	select MFD_SYSCON
+	help
+	  Support for Ethernet controller on Nuvoton MA35 series SoC.
+
+	  This selects the Nuvoton MA35 series SoC glue layer support
+	  for the stmmac device driver. The nuvoton-dwmac driver is
+	  used for MA35 series SoCs.
+
 config DWMAC_QCOM_ETHQOS
 	tristate "Qualcomm ETHQOS support"
 	default ARCH_QCOM
diff --git a/drivers/net/ethernet/stmicro/stmmac/Makefile b/drivers/net/ethernet/stmicro/stmmac/Makefile
index b26f0e79c2b3..48e25b85ea06 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Makefile
+++ b/drivers/net/ethernet/stmicro/stmmac/Makefile
@@ -19,6 +19,7 @@ obj-$(CONFIG_DWMAC_IPQ806X)	+= dwmac-ipq806x.o
 obj-$(CONFIG_DWMAC_LPC18XX)	+= dwmac-lpc18xx.o
 obj-$(CONFIG_DWMAC_MEDIATEK)	+= dwmac-mediatek.o
 obj-$(CONFIG_DWMAC_MESON)	+= dwmac-meson.o dwmac-meson8b.o
+obj-$(CONFIG_DWMAC_NUVOTON)	+= dwmac-nuvoton.o
 obj-$(CONFIG_DWMAC_QCOM_ETHQOS)	+= dwmac-qcom-ethqos.o
 obj-$(CONFIG_DWMAC_ROCKCHIP)	+= dwmac-rk.o
 obj-$(CONFIG_DWMAC_RZN1)	+= dwmac-rzn1.o
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c
new file mode 100644
index 000000000000..588e2f234c5b
--- /dev/null
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c
@@ -0,0 +1,182 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Nuvoton DWMAC specific glue layer
+ *
+ * Copyright (C) 2025 Nuvoton Technology Corp.
+ *
+ * Author: Joey Lu <a0987203069@gmail.com>
+ */
+
+#include <linux/mfd/syscon.h>
+#include <linux/of_device.h>
+#include <linux/of_net.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/stmmac.h>
+
+#include "stmmac.h"
+#include "stmmac_platform.h"
+
+#define NVT_REG_SYS_GMAC0MISCR  0x108
+#define NVT_REG_SYS_GMAC1MISCR  0x10C
+
+#define NVT_MISCR_RMII          BIT(0)
+
+/* Two thousand picoseconds are evenly mapped to a 4-bit field,
+ * resulting in each step being 2000/15 picoseconds.
+ */
+#define NVT_PATH_DELAY_STEP     134
+#define NVT_TX_DELAY_MASK       GENMASK(19, 16)
+#define NVT_RX_DELAY_MASK       GENMASK(23, 20)
+
+struct nvt_priv_data {
+	struct platform_device *pdev;
+	struct regmap *regmap;
+};
+
+static struct nvt_priv_data *
+nvt_gmac_setup(struct platform_device *pdev, struct plat_stmmacenet_data *plat)
+{
+	struct device *dev = &pdev->dev;
+	struct nvt_priv_data *bsp_priv;
+	phy_interface_t phy_mode;
+	u32 macid, arg, reg;
+	u32 tx_delay_step;
+	u32 rx_delay_step;
+	u32 miscr;
+
+	bsp_priv = devm_kzalloc(dev, sizeof(*bsp_priv), GFP_KERNEL);
+	if (!bsp_priv)
+		return ERR_PTR(-ENOMEM);
+
+	bsp_priv->regmap =
+		syscon_regmap_lookup_by_phandle_args(dev->of_node, "nuvoton,sys", 1, &macid);
+	if (IS_ERR(bsp_priv->regmap)) {
+		dev_err_probe(dev, PTR_ERR(bsp_priv->regmap), "Failed to get sys register\n");
+		return ERR_PTR(-ENODEV);
+	}
+	if (macid > 1) {
+		dev_err_probe(dev, -EINVAL, "Invalid sys arguments\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	if (of_property_read_u32(dev->of_node, "tx-internal-delay-ps", &arg)) {
+		tx_delay_step = 0;
+	} else {
+		if (arg <= 2000) {
+			tx_delay_step = (arg == 2000) ? 0xf : (arg / NVT_PATH_DELAY_STEP);
+			dev_dbg(dev, "Set Tx path delay to 0x%x\n", tx_delay_step);
+		} else {
+			dev_err(dev, "Invalid Tx path delay argument.\n");
+			return ERR_PTR(-EINVAL);
+		}
+	}
+	if (of_property_read_u32(dev->of_node, "rx-internal-delay-ps", &arg)) {
+		rx_delay_step = 0;
+	} else {
+		if (arg <= 2000) {
+			rx_delay_step = (arg == 2000) ? 0xf : (arg / NVT_PATH_DELAY_STEP);
+			dev_dbg(dev, "Set Rx path delay to 0x%x\n", rx_delay_step);
+		} else {
+			dev_err(dev, "Invalid Rx path delay argument.\n");
+			return ERR_PTR(-EINVAL);
+		}
+	}
+
+	miscr = (macid == 0) ? NVT_REG_SYS_GMAC0MISCR : NVT_REG_SYS_GMAC1MISCR;
+	regmap_read(bsp_priv->regmap, miscr, &reg);
+	reg &= ~(NVT_TX_DELAY_MASK | NVT_RX_DELAY_MASK);
+
+	if (of_get_phy_mode(pdev->dev.of_node, &phy_mode)) {
+		dev_err(dev, "missing phy mode property\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	switch (phy_mode) {
+	case PHY_INTERFACE_MODE_RGMII:
+	case PHY_INTERFACE_MODE_RGMII_ID:
+	case PHY_INTERFACE_MODE_RGMII_RXID:
+	case PHY_INTERFACE_MODE_RGMII_TXID:
+		reg &= ~NVT_MISCR_RMII;
+		break;
+	case PHY_INTERFACE_MODE_RMII:
+		reg |= NVT_MISCR_RMII;
+		break;
+	default:
+		dev_err(dev, "Unsupported phy-mode (%d)\n", phy_mode);
+		return ERR_PTR(-EINVAL);
+	}
+
+	if (!(reg & NVT_MISCR_RMII)) {
+		reg |= FIELD_PREP(NVT_TX_DELAY_MASK, tx_delay_step);
+		reg |= FIELD_PREP(NVT_RX_DELAY_MASK, rx_delay_step);
+	}
+
+	regmap_write(bsp_priv->regmap, miscr, reg);
+
+	bsp_priv->pdev = pdev;
+
+	return bsp_priv;
+}
+
+static int nvt_gmac_probe(struct platform_device *pdev)
+{
+	struct plat_stmmacenet_data *plat_dat;
+	struct stmmac_resources stmmac_res;
+	struct nvt_priv_data *priv_data;
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
+	/* Nuvoton DWMAC configs */
+	plat_dat->has_gmac = 1;
+	plat_dat->tx_fifo_size = 2048;
+	plat_dat->rx_fifo_size = 4096;
+	plat_dat->multicast_filter_bins = 0;
+	plat_dat->unicast_filter_entries = 8;
+	plat_dat->flags &= ~STMMAC_FLAG_USE_PHY_WOL;
+
+	priv_data = nvt_gmac_setup(pdev, plat_dat);
+	if (IS_ERR(priv_data))
+		return PTR_ERR(priv_data);
+
+	ret = stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
+	if (ret)
+		return ret;
+
+	/* The PMT flag is determined by the RWK property.
+	 * However, our hardware is configured to support only MGK.
+	 * This is an override on PMT to enable WoL capability.
+	 */
+	plat_dat->pmt = 1;
+	device_set_wakeup_capable(&pdev->dev, 1);
+
+	return 0;
+}
+
+static const struct of_device_id nvt_dwmac_match[] = {
+	{ .compatible = "nuvoton,ma35d1-dwmac"},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, nvt_dwmac_match);
+
+static struct platform_driver nvt_dwmac_driver = {
+	.probe  = nvt_gmac_probe,
+	.remove = stmmac_pltfr_remove,
+	.driver = {
+		.name           = "nuvoton-dwmac",
+		.pm		= &stmmac_pltfr_pm_ops,
+		.of_match_table = nvt_dwmac_match,
+	},
+};
+module_platform_driver(nvt_dwmac_driver);
+
+MODULE_AUTHOR("Joey Lu <a0987203069@gmail.com>");
+MODULE_DESCRIPTION("Nuvoton DWMAC specific glue layer");
+MODULE_LICENSE("GPL");
-- 
2.34.1


