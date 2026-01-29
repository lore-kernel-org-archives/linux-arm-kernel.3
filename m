Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82EE7D3F09E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 05:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1XOYF4LJtaY0GNeYihqg/urqke/kwdCC/ItxM5XGfQw=; b=kgxWW0rYk93cOGT3QP473Rr+DT
	bOM9M4HI28z5FilZf+Fq41X8RLklG2PI8xfrvuscR/b7ZbSDpAjakU0Kw1bipMQLHXOikqwraU7h7
	UohiUtSF8BJF2EQDG1B94aBUUgpnCzuMAg7ws3SF/7uq3oAzjAd5crBvkMXft0bayEKxwGK0R9f7z
	0ZE2ctRP1B4HdSJPHnYdSwNV1d6mSZdzrCaL8HaegaC21IjJs332NOqyWg4x079OCCKqaN/zURE+I
	ieP8A/bxK15YNmUKD26SW5wgsNn3DJ2sOcGOU6+PAA/LVBBEZt8z5Ir9CzEM2/EHc7bVpHBxF3iGT
	cg4KCNRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlKq4-0000000HI6z-0NWB;
	Thu, 29 Jan 2026 05:45:08 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlKq0-0000000HI5a-4858
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 05:45:07 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-81dab89f286so294108b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 21:45:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769665504; x=1770270304; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1XOYF4LJtaY0GNeYihqg/urqke/kwdCC/ItxM5XGfQw=;
        b=nKrdo5BOGsRVvgboxpjWaS89IG1vUY+tywiLMJJWO/6Ha6d47O/efNIK2powohrCRQ
         Sbh9jfbmCYrVlTVTuWIi2UhMx/O7Q+LEMV+sDAZdttRCmvP62XMaxPaVu+D2j8EoVk7+
         BQ08dj/S7iKnGEPxC3mW9DMtSPg+QCWGlNf9/1VAIBhth4iLF+FMnegLoFyC8VGQpco+
         aCGH+x3TshWOyzDF6nuVpuxLD2U2+6QJADQBrSV1XxXDOzoTpByV83mTIs6nnqsczCG+
         0NVtJlb/iX88NpyYEb2DkBJyP3t41PLNm2TDnWKEtijtuUEmggt3agNKGyvQrEvaw4Co
         7Brw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769665504; x=1770270304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1XOYF4LJtaY0GNeYihqg/urqke/kwdCC/ItxM5XGfQw=;
        b=UyppT/aNCbzTXwsmAbLen39urDJOsBD9AQbLQuLjACaRxvaq6Op0fFE4NiULfHugNh
         tLX7kGeGA7c/LVkakzfJ1xCY8klJyJ4n2F/cZuBSOfER+l8cgk7P+/vcZ4MhK4jOS/Po
         ErT8+DPYTpxH40OEZ3m7Ab6G3aYGZ1TAtNDXZ+yGa9WzM2sn5EAj8FYTGuFVLkVLFrSD
         dHs51go2EcokIbNPO4tUt1wp3/6dZNoq4juhiorK4BkRmp+nZ5ZPwCmFqFnasbMbOQla
         +dGyIUVrjNNRw3RsRCzJK100rAK8kbEiPFMtUmaSAj4abM1xHe1M6zn0UAEGA3yYORob
         m5Hg==
X-Forwarded-Encrypted: i=1; AJvYcCWRoU9KrjwWu57HtGljoEHlLrQiTzuSfA+UjMCuzMDil21TWxwpjrzm0VNSIIE4lkTaEHaBtuhFIpC79EqYis02@lists.infradead.org
X-Gm-Message-State: AOJu0Yyto9B7UIS6xDuynPMM89u636M4aBywx2rvvvdpn9bKkAmu86Qf
	ybxxck3/bLMPmPPs+BPrAEyjIjS6ruIpucPx1nDuVOm6P25yD8evh9sd
X-Gm-Gg: AZuq6aLROrXLWty4E0pieTnCWPsa31WlihNDJ6KDV1Ah/rVbyLpAxYyWfI2xRcf9ZWs
	lio+ylvZKQIZPZFdNWZV1vJhCPZxAJ3oUCiZhHidxXCMlwbyZH0QOMDFqOg+FU9rHnXrTxW6l2R
	Z3zNz7+GrIBvXt8wlk1JobyOnxhf6YJoiK0Kx/8c65fao2zEQ3FCveUNj5rq0SgFKiZlEQjF579
	EHOgf07bPHEja5NG/Xr9f8BOuRa278UBrcJzhYgQgqkwgzIAeYnROr4Jg1fKoESIndOKUSwPv3w
	hRrjK1WyfvS+zgjCIwxaKigiA5WnwKNwh/NQDa0sTODP6J2hE3ETQVWR9M+di0HpE/XywsgCDvi
	SQfPprLilylIeua85RMT20gTfTFQSQtqsUO/bTPhPADCCJPVSfiL0zobaMxrq+aQO37Tl5KLzZC
	Tp2LHs2wcSlZet4tXP8exJMVGYnGeXuetCFwS7irAeQ070xiORSaljwDwDB5iD5qN/6/bXKl1M
X-Received: by 2002:a05:6a00:390e:b0:81e:dcb2:52cb with SMTP id d2e1a72fcca58-8236913e0admr6377072b3a.2.1769665503957;
        Wed, 28 Jan 2026 21:45:03 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379c227c2sm4108364b3a.53.2026.01.28.21.45.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 21:45:03 -0800 (PST)
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
Subject: [PATCH net-next v10 3/3] net: stmmac: dwmac-nuvoton: Add dwmac glue for Nuvoton MA35 family
Date: Thu, 29 Jan 2026 13:44:45 +0800
Message-ID: <20260129054445.416242-4-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260129054445.416242-1-a0987203069@gmail.com>
References: <20260129054445.416242-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_214505_030689_D0CED0D1 
X-CRM114-Status: GOOD (  23.63  )
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

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 ++
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-nuvoton.c   | 174 ++++++++++++++++++
 3 files changed, 187 insertions(+)
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c

diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
index 07088d03dbab..861f1c6c14f1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
+++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
@@ -132,6 +132,18 @@ config DWMAC_MESON
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
index c9263987ef8d..4ade030b634f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Makefile
+++ b/drivers/net/ethernet/stmicro/stmmac/Makefile
@@ -20,6 +20,7 @@ obj-$(CONFIG_DWMAC_IPQ806X)	+= dwmac-ipq806x.o
 obj-$(CONFIG_DWMAC_LPC18XX)	+= dwmac-lpc18xx.o
 obj-$(CONFIG_DWMAC_MEDIATEK)	+= dwmac-mediatek.o
 obj-$(CONFIG_DWMAC_MESON)	+= dwmac-meson.o dwmac-meson8b.o
+obj-$(CONFIG_DWMAC_NUVOTON)	+= dwmac-nuvoton.o
 obj-$(CONFIG_DWMAC_QCOM_ETHQOS)	+= dwmac-qcom-ethqos.o
 obj-$(CONFIG_DWMAC_RENESAS_GBETH) += dwmac-renesas-gbeth.o
 obj-$(CONFIG_DWMAC_ROCKCHIP)	+= dwmac-rk.o
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c
new file mode 100644
index 000000000000..728f5f453515
--- /dev/null
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c
@@ -0,0 +1,174 @@
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
+	plat_dat->core_type = DWMAC_CORE_GMAC;
+	plat_dat->tx_fifo_size = 2048;
+	plat_dat->rx_fifo_size = 4096;
+	plat_dat->multicast_filter_bins = 0;
+	plat_dat->unicast_filter_entries = 8;
+
+	priv_data = nvt_gmac_setup(pdev, plat_dat);
+	if (IS_ERR(priv_data))
+		return PTR_ERR(priv_data);
+
+	ret = stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
+	if (ret)
+		return ret;
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
2.43.0


