Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C763DEA3F04
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 05:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wzFwESZOkwxx17CXvSjDYHHBJkKja6bTAjzp0iWKbyI=; b=sjoG1IcZ/MCAE3/kQARyvIUyS7
	8pMSEaakENQRB7MMlRifZHnxL9fsTz9gOoSVS/RCmatg6Xv7PcDZFWNJuGQwS8MdRozj1apLLU9Hs
	rh9VASpEceZ3tUekcrKldY3lp/PCVGrX9sx0QQcegSc+muqEnDmUHCGo7LF9M/sy+pSLnVsuH7W9X
	zPwlLm3f7qJUGDikSNzuOyAVx10klegrOsl+QLqFkwIy6FIZl9XAim52mOl5+trtyPTj1AQ+C0DVX
	iQN5aE0NJ1p2ooC9EroZVTEuDxYH0zQ/EOO3+eOElSpblAj7S81bCMxMWY36Z9OF/pJl8RJhVCv0R
	Lm0/iz1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpgD7-0000000GSvh-0F1d;
	Tue, 10 Feb 2026 05:22:53 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpgD4-0000000GSuV-3NJ6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Feb 2026 05:22:51 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-c551edc745eso189033a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Feb 2026 21:22:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770700970; x=1771305770; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wzFwESZOkwxx17CXvSjDYHHBJkKja6bTAjzp0iWKbyI=;
        b=R2Xc6nQh6TvxoXFqsBnYXHObW0n0Ed3Ht762SU51+AdHC6nt96+je01kozurcj4wNZ
         fZz8tFLZ2dTizDZv8znqqPf1itCd7MiPpMR0B4sAE3SA+htBPrprxuPazeDIfMh4xMFT
         hEvtSzo1a9GFYDQVl8+bmo6BdpiLfN60MPKl3v1tqYjtR5fZ7LSHmJGcL+mJVgNsXhAe
         4R7TZ6DaTrH5HR/7egxzdx/dMb094m6qAbYRlOjyfPQV/CQeZHA11tRTJY9egtIJQmH0
         O7X3PlzQTyY2hD+pjvz+CpZX0QUZ41KSaTqYbsq+aAt8qCAzoMy1IgAgPdf3Kxvsxb4A
         42aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770700970; x=1771305770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wzFwESZOkwxx17CXvSjDYHHBJkKja6bTAjzp0iWKbyI=;
        b=l7ow2BIsdC3M/3nIS0kTQfkemkSSqYc2U3sGp1kauT85BCNqbcypwDLbe5QNfEmiqE
         IIjOCanUeOwUxmd+YqQu5H8KUyTTzWFMgxHORpxUNvaU5mnlEe6MiDyScwiT4ZPF9lVM
         qL5qR0alfTqW47tyDXHK7bg3mE/Gy8TdexJPYCVHmFX3H1UVE6lpqnI/Ad4cH20AUADL
         tIgpWdhvPiydN0NGhx9RoZPeaNJe2L0Y1+utfaaas9tewpnlWHSHZ4NkZ5Sl9p4JdTeK
         s+lvDPxGV/vwq9sXTgudtP66w/9NKPJ+yYj/2q3SizKYg/XUCnXzyjtxoU3UOAnHOQfW
         LyVg==
X-Forwarded-Encrypted: i=1; AJvYcCVprOXO1Dggg7mThyQrZEVk4OWKtNlULt+yQQSxiM/ANzCtmIXriXOLFKMo6AyIszc9OvK08l3I7CHuuapv7Q9m@lists.infradead.org
X-Gm-Message-State: AOJu0YxsbyfQw89UWB60r64CGHuNMS19QAgBVUmJ4wv3jwLeFQ8fEM9N
	8XBHaviSOjjz4ZFFUXYiiqWIW0E7xKTplbh9Dbk0StzE++FvEnrIJQ2C
X-Gm-Gg: AZuq6aJqMrDqzL099aQFk9cuPlfeQkuUnJT1MCx6bBFpsTyvojiICvpYkM0WZrbChaP
	HDFE9xdaOBtJYTimZHY7XOE18ybJu3o+x+wXDOItHtu5OFXloFpx9vVdY6O+/lJBC0ORL5t8yo2
	HeWUt/IOGdW/12qJQy6972P+jRXh4t1kNIBQIsBsgKT+Q4S2mvY69RK/zZIwPY6SacMLDNyOE5l
	qosW0l/b0dVo8GwoPw8Xcx+BEiFaIZy/g77Skmavu4Ik0XslxYM7ai51ecuEK8irAt1/r65BQJ+
	1S9yGBPS/m7FULwVz0TMr1RSKTwYauY9ac46mGTjjr3ZAH2KkBEyhjAl+5+s2GIwrtDl7F3RhaC
	l918zKBASnJUc8Div6LYIG4t2cm/pK5diHwNo3W03JFC/LhqXleWRE9HUoq6G4tPnkaARPdtLRu
	dDaB/bIlLEvxpG3fC+eF4XhVWj5RSczFo39zTNJEJCwq8cXTVB/nttKzcfn9T7EqnOlEF6tdwp1
	8CoptjmIBuk
X-Received: by 2002:a17:902:d509:b0:2aa:f798:8c7f with SMTP id d9443c01a7336-2aaf798af92mr52504575ad.54.1770700969732;
        Mon, 09 Feb 2026 21:22:49 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a951ca59f4sm122114275ad.43.2026.02.09.21.22.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 21:22:49 -0800 (PST)
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
Subject: [PATCH net-next v12 3/3] net: stmmac: dwmac-nuvoton: Add dwmac glue for Nuvoton MA35 family
Date: Tue, 10 Feb 2026 13:22:26 +0800
Message-ID: <20260210052226.3005666-4-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260210052226.3005666-1-a0987203069@gmail.com>
References: <20260210052226.3005666-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_212250_850332_9F2A7C37 
X-CRM114-Status: GOOD (  23.49  )
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
 .../ethernet/stmicro/stmmac/dwmac-nuvoton.c   | 139 ++++++++++++++++++
 3 files changed, 152 insertions(+)
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
index 000000000000..29d15f41b244
--- /dev/null
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c
@@ -0,0 +1,139 @@
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
+static int nvt_gmac_get_delay(struct device *dev, const char *property)
+{
+	u32 arg;
+
+	if (of_property_read_u32(dev->of_node, property, &arg))
+		return 0;
+
+	if (arg > 2000) {
+		dev_err(dev, "Invalid %s argument.\n", property);
+		return -EINVAL;
+	}
+
+	if (arg == 2000)
+		return 15;
+
+	return arg / NVT_PATH_DELAY_STEP;
+}
+
+static int nvt_gmac_setup(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	phy_interface_t phy_mode;
+	struct regmap *regmap;
+	u32 macid, miscr, reg;
+	int ret;
+
+	regmap = syscon_regmap_lookup_by_phandle_args(dev->of_node, "nuvoton,sys", 1, &macid);
+	if (IS_ERR(regmap))
+		ret = dev_err_probe(dev, PTR_ERR(regmap), "Failed to get sys register\n");
+
+	if (macid > 1)
+		ret = dev_err_probe(dev, -EINVAL, "Invalid sys arguments\n");
+
+	if (of_get_phy_mode(pdev->dev.of_node, &phy_mode))
+		ret = dev_err_probe(dev, -EINVAL, "Missing phy mode property\n");
+
+	miscr = (macid == 0) ? NVT_REG_SYS_GMAC0MISCR : NVT_REG_SYS_GMAC1MISCR;
+
+	switch (phy_mode) {
+	case PHY_INTERFACE_MODE_RGMII:
+	case PHY_INTERFACE_MODE_RGMII_ID:
+	case PHY_INTERFACE_MODE_RGMII_RXID:
+	case PHY_INTERFACE_MODE_RGMII_TXID:
+		ret = nvt_gmac_get_delay(dev, "rx-internal-delay-ps");
+		if (ret < 0)
+			return ret;
+		reg = FIELD_PREP(NVT_RX_DELAY_MASK, ret);
+
+		ret = nvt_gmac_get_delay(dev, "tx-internal-delay-ps");
+		if (ret < 0)
+			return ret;
+		reg |= FIELD_PREP(NVT_TX_DELAY_MASK, ret);
+		break;
+	case PHY_INTERFACE_MODE_RMII:
+		reg = NVT_MISCR_RMII;
+			break;
+	default:
+		return dev_err_probe(dev, -EINVAL, "Unsupported phy-mode (%d)\n", phy_mode);
+	}
+
+	regmap_update_bits(regmap, miscr,
+			   NVT_RX_DELAY_MASK | NVT_TX_DELAY_MASK | NVT_MISCR_RMII, reg);
+
+	return 0;
+}
+
+static int nvt_gmac_probe(struct platform_device *pdev)
+{
+	struct plat_stmmacenet_data *plat_dat;
+	struct stmmac_resources stmmac_res;
+	struct device *dev = &pdev->dev;
+	int ret;
+
+	ret = stmmac_get_platform_resources(pdev, &stmmac_res);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get platform resources\n");
+
+	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
+	if (IS_ERR(plat_dat))
+		return dev_err_probe(dev, PTR_ERR(plat_dat), "Failed to get platform data\n");
+
+	ret = nvt_gmac_setup(pdev);
+	if (ret)
+		return ret;
+
+	return stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
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


