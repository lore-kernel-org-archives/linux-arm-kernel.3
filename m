Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 809A8CD5BB5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 15:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xW4ciKbbQRnX/OjD6z0+5b7UCtG5NvYvPMF/2Ve0g6c=; b=JC/LnSNLkMKn++goBiHEcU9lUt
	d4h4ULD6/4j+mF6MaQ2doTLuOAycAaIZJMuGbHMlB2RAVOail355cUI81G1voHuNbHZBqoM84SBpu
	tjiRJYTWQp8E92g/hBabvRmFNYtc4UeFc+lIqxnEH5BzoY+fF31DSHJrnaZtyF6u+ZP1l6NVHY4px
	BPnGIT5bE6Rjm/Zm+yr1O/jSrpYwzkW0HyK79UB+JYBQnElqOZQsjJw+rnZ2DOj/XjNIzvKo1jFEZ
	to0XX5Z2uX88r7hcmowfiQMSv2BOph+a/TtLcZoNpYnrU80saxcf2hmn+ALeqc/vXhqGALRzpsLIt
	steN+W1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ5SX-00000008LPJ-2uWi;
	Thu, 21 May 2026 15:37:17 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ5SI-00000008LFA-1YJ6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 15:37:03 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4903997fcb5so8641865e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 08:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779377820; x=1779982620; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xW4ciKbbQRnX/OjD6z0+5b7UCtG5NvYvPMF/2Ve0g6c=;
        b=GGY+qItc19kd+VSwVnaPdvwqTqhzGjv3EniPEAxFulQMKLnTayi4i4gNyG97GKt8VZ
         xbIL83daMwebMIbPngJuE9Cd1Arxsxe1mnHqfj5vbuiAmXJFX4QPuOuFJU5voCe/nZW1
         mjBTZhaFPhlYctLJXJ6w+F0dvuq1JWzDDvFkPhLgUzEVzwjBMl12Or7Ic1OqTv832CsF
         WoQv7Ci/tUKG/nKP8B+7yzf5N4C4lN90b9jER0jS3TWJlTVIAqgHEBYZUkWEwoduuag4
         MS5fDdCAbn18RgIacIlApJwOm/sDkwHELyBCBK87fwcTk42kqmXCdUMfkAWMG0yGm3dO
         ettQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779377820; x=1779982620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xW4ciKbbQRnX/OjD6z0+5b7UCtG5NvYvPMF/2Ve0g6c=;
        b=BB4meRX8ewoT1ZSQzvOW+WiZuIrIlobquqyzf14eWJ3r/pQeiDd6jcfosE5C6AYWF4
         pV6tmREXIdnMD3LVrkMDHBLmjtgJWxEUR8dy1Ee5ydzt5OEtFg51c29Tjv+oLpKhotlh
         cSZRByawAZbPzYX/1lpWU2GO7x8/jt5Qb53k2lNZ/uANKks8ROeYyDWIIdxshtz2Pdtx
         xeuI8ZgBs8CsGO2+0KT7DXG0x/N6NE4t8WeXCMnKrhbIJyE4avhqPnjqb1jLkjP3aOus
         Um1YXPnMKibU9/aLLV0KZ00T8jinv7cB/ugg3CUBBRLnq1MbmkbfmwQhy87/QbBGMwFx
         SFgA==
X-Forwarded-Encrypted: i=1; AFNElJ9fpICz4ErkojkSdxU5JPmJ65aUdQjG+u/JeW7Ula9zzSxsq3ZsgcUAnje+qMkOTOFEZu7e4D5ThGtSwrlJeE1G@lists.infradead.org
X-Gm-Message-State: AOJu0YyF7jS1VwipqYhZf+FeU9mg7yI+1tcMyXjOSz3/yUtvxWSLsO/k
	BgqFJmZQZF+Hdo4ISHhmwtmplqbq0Ujd/z1KuJPU9VVpyDTG7xnUNh5G
X-Gm-Gg: Acq92OGN/oNNPlEqJtlz35CdENxgFyxSTdtQUyBBogcpPSOmSNAuoQTxgWXhYXb9Mj7
	/s3COk+TlttjbAKwYmbWAKYOmhNnf3fzflQZzUJpkPa9FcikY3wR+MRVyOlqTSQemf1+3pd8DfP
	Ga65sDvvBj0Uqi7BS3BCP9AUTrr8SuqVwOXbXH1bbfv7mEPGsJ4tpbSCY4BaJ8IBFrHV+FGzJi1
	NJHK4w9nvKOCWY6ZgM2PeDcthIf+XEYKRsVbDe/eGqpzONyXJ5mjYSIlCLY9LenWt0de1fRh7Fo
	9hYA4hNhWHAW6axNLzp6dW/EpxK0P83M1myBlMIZDLpCaoGpMo+bdFHTZXluGVd8bd2q2N5gTFa
	eWdVpmOhg065m5jZqA5oXQJnqMZv7lYj28KV1ct2jCEc1fwLCH/VjLznkK206o4V25nzKfH0enK
	P8KNwa7Xtrrqh+l8f3FAMrUqnYfmdYQe4Mgl66vcyQpxczq7hSG0RzlpJZfMMU9qs=
X-Received: by 2002:a05:600c:49a2:b0:48f:d5b8:5b07 with SMTP id 5b1f17b1804b1-4903608937bmr31486225e9.20.1779377820234;
        Thu, 21 May 2026 08:37:00 -0700 (PDT)
Received: from Ansuel-XPS24 (host-79-22-5-99.retail.telecomitalia.it. [79.22.5.99])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49033d9edcbsm79159825e9.13.2026.05.21.08.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 08:36:58 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org
Subject: [PATCH v9 3/5] clk: en7523: Add support for selecting the Serdes port in SCU
Date: Thu, 21 May 2026 17:35:54 +0200
Message-ID: <20260521153645.7028-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260521153645.7028-1-ansuelsmth@gmail.com>
References: <20260521153645.7028-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_083702_463966_A3EF738D 
X-CRM114-Status: GOOD (  26.35  )
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

In the SCU register for clock and reset, there are also some register to
select the Serdes port mode. The Airoha AN7581 SoC have 4 different Serdes
that can switch between PCIe, USB or Ethernet mode.

Add a simple PHY provider that expose the .set_mode OP to toggle the
requested mode for the Serdes port.

Reviewed-by: Brian Masney <bmasney@redhat.com>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/clk/Kconfig      |   1 +
 drivers/clk/clk-en7523.c | 218 ++++++++++++++++++++++++++++++++++++++-
 2 files changed, 216 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index b2efbe9f6acb..e60a824b5117 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -221,6 +221,7 @@ config COMMON_CLK_EN7523
 	bool "Clock driver for Airoha/EcoNet SoC system clocks"
 	depends on OF
 	depends on ARCH_AIROHA || ECONET || COMPILE_TEST
+	select GENERIC_PHY
 	default ARCH_AIROHA
 	help
 	  This driver provides the fixed clocks and gates present on Airoha
diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index 1ab0e2eca5d3..183cf7fe4bda 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -6,14 +6,18 @@
 #include <linux/io.h>
 #include <linux/mfd/syscon.h>
 #include <linux/platform_device.h>
+#include <linux/phy.h>
+#include <linux/phy/phy.h>
 #include <linux/property.h>
 #include <linux/regmap.h>
 #include <linux/reset-controller.h>
+#include <linux/spinlock.h>
 #include <dt-bindings/clock/en7523-clk.h>
 #include <dt-bindings/reset/airoha,en7523-reset.h>
 #include <dt-bindings/reset/airoha,en7581-reset.h>
 #include <dt-bindings/clock/econet,en751221-scu.h>
 #include <dt-bindings/reset/econet,en751221-scu.h>
+#include <dt-bindings/soc/airoha,scu-ssr.h>
 
 #define RST_NR_PER_BANK			32
 
@@ -40,9 +44,22 @@
 #define   REG_HIR_MASK			GENMASK(31, 16)
 /* EN7581 */
 #define REG_NP_SCU_PCIC			0x88
+#define REG_NP_SCU_SSR3			0x94
+#define REG_SSUSB_HSGMII_SEL_MASK	BIT(29)
+#define REG_SSUSB_HSGMII_SEL_HSGMII	FIELD_PREP_CONST(REG_SSUSB_HSGMII_SEL_MASK, 0x0)
+#define REG_SSUSB_HSGMII_SEL_USB	FIELD_PREP_CONST(REG_SSUSB_HSGMII_SEL_MASK, 0x1)
 #define REG_NP_SCU_SSTR			0x9c
 #define REG_PCIE_XSI0_SEL_MASK		GENMASK(14, 13)
+#define REG_PCIE_XSI0_SEL_PCIE		FIELD_PREP_CONST(REG_PCIE_XSI0_SEL_MASK, 0x0)
+#define REG_PCIE_XSI0_SEL_XFI		FIELD_PREP_CONST(REG_PCIE_XSI0_SEL_MASK, 0x1)
+#define REG_PCIE_XSI0_SEL_HSGMII	FIELD_PREP_CONST(REG_PCIE_XSI0_SEL_MASK, 0x2)
 #define REG_PCIE_XSI1_SEL_MASK		GENMASK(12, 11)
+#define REG_PCIE_XSI1_SEL_PCIE		FIELD_PREP_CONST(REG_PCIE_XSI1_SEL_MASK, 0x0)
+#define REG_PCIE_XSI1_SEL_XFI		FIELD_PREP_CONST(REG_PCIE_XSI1_SEL_MASK, 0x1)
+#define REG_PCIE_XSI1_SEL_HSGMII	FIELD_PREP_CONST(REG_PCIE_XSI1_SEL_MASK, 0x2)
+#define REG_USB_PCIE_SEL_MASK		BIT(3)
+#define REG_USB_PCIE_SEL_PCIE		FIELD_PREP_CONST(REG_USB_PCIE_SEL_MASK, 0x0)
+#define REG_USB_PCIE_SEL_USB		FIELD_PREP_CONST(REG_USB_PCIE_SEL_MASK, 0x1)
 #define REG_CRYPTO_CLKSRC2		0x20c
 /* EN751221 */
 #define EN751221_REG_SPI_DIV		0x0cc
@@ -81,6 +98,8 @@ enum en_hir {
 	HIR_MAX		= 14,
 };
 
+#define EN_SERDES_PHY_NUM		4
+
 struct en_clk_desc {
 	int id;
 	const char *name;
@@ -113,6 +132,18 @@ struct en_rst_data {
 	struct reset_controller_dev rcdev;
 };
 
+struct en_serdes_phy_instance {
+	struct phy *phy;
+	unsigned int serdes_port;
+};
+
+struct en_clk_priv {
+	void __iomem *base;
+	/* protect SCU register */
+	spinlock_t lock;
+	struct en_serdes_phy_instance *serdes_phys[EN_SERDES_PHY_NUM];
+};
+
 struct en_clk_soc_data {
 	u32 num_clocks;
 	const struct clk_ops pcie_ops;
@@ -830,12 +861,179 @@ static int en7581_reset_register(struct device *dev, void __iomem *base,
 	return devm_reset_controller_register(dev, &rst_data->rcdev);
 }
 
+static int en7581_serdes_phy_set_mode(struct phy *phy, enum phy_mode mode,
+				      int submode)
+{
+	struct en_serdes_phy_instance *instance = phy_get_drvdata(phy);
+	struct en_clk_priv *priv = dev_get_drvdata(phy->dev.parent);
+	u32 reg, mask, sel, val;
+	unsigned long flags;
+
+	switch (instance->serdes_port) {
+	case AIROHA_SCU_SERDES_PCIE1:
+		reg = REG_NP_SCU_SSTR;
+		mask = REG_PCIE_XSI0_SEL_MASK;
+
+		if (mode != PHY_MODE_ETHERNET && mode != PHY_MODE_PCIE)
+			return -EINVAL;
+
+		if (mode == PHY_MODE_ETHERNET) {
+			switch (submode) {
+			case PHY_INTERFACE_MODE_USXGMII:
+			case PHY_INTERFACE_MODE_10GBASER:
+				sel = REG_PCIE_XSI0_SEL_XFI;
+				break;
+			case PHY_INTERFACE_MODE_SGMII:
+			case PHY_INTERFACE_MODE_1000BASEX:
+			case PHY_INTERFACE_MODE_2500BASEX:
+				sel = REG_PCIE_XSI0_SEL_HSGMII;
+				break;
+			default:
+				return -EINVAL;
+			}
+		} else {
+			sel = REG_PCIE_XSI0_SEL_PCIE;
+		}
+
+		break;
+	case AIROHA_SCU_SERDES_PCIE2:
+		reg = REG_NP_SCU_SSTR;
+		mask = REG_PCIE_XSI1_SEL_MASK;
+
+		if (mode != PHY_MODE_ETHERNET && mode != PHY_MODE_PCIE)
+			return -EINVAL;
+
+		if (mode == PHY_MODE_ETHERNET) {
+			switch (submode) {
+			case PHY_INTERFACE_MODE_USXGMII:
+			case PHY_INTERFACE_MODE_10GBASER:
+				sel = REG_PCIE_XSI1_SEL_XFI;
+				break;
+			case PHY_INTERFACE_MODE_SGMII:
+			case PHY_INTERFACE_MODE_1000BASEX:
+			case PHY_INTERFACE_MODE_2500BASEX:
+				sel = REG_PCIE_XSI1_SEL_HSGMII;
+				break;
+			default:
+				return -EINVAL;
+			}
+		} else {
+			sel = REG_PCIE_XSI1_SEL_PCIE;
+		}
+
+		break;
+	case AIROHA_SCU_SERDES_USB1:
+		reg = REG_NP_SCU_SSR3;
+		mask = REG_SSUSB_HSGMII_SEL_MASK;
+
+		if (mode != PHY_MODE_ETHERNET && mode != PHY_MODE_USB_DEVICE &&
+		    mode != PHY_MODE_USB_DEVICE_SS)
+			return -EINVAL;
+
+		if (mode == PHY_MODE_ETHERNET)
+			sel = REG_SSUSB_HSGMII_SEL_HSGMII;
+		else
+			sel = REG_SSUSB_HSGMII_SEL_USB;
+
+		break;
+	case AIROHA_SCU_SERDES_USB2:
+		reg = REG_NP_SCU_SSTR;
+		mask = REG_USB_PCIE_SEL_MASK;
+
+		if (mode != PHY_MODE_PCIE && mode != PHY_MODE_USB_DEVICE &&
+		    mode != PHY_MODE_USB_DEVICE_SS)
+			return -EINVAL;
+
+		if (mode == PHY_MODE_PCIE)
+			sel = REG_USB_PCIE_SEL_PCIE;
+		else
+			sel = REG_USB_PCIE_SEL_USB;
+
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	spin_lock_irqsave(&priv->lock, flags);
+	val = readl(priv->base + reg);
+	val &= ~mask;
+	val |= sel;
+	writel(val, priv->base + reg);
+	spin_unlock_irqrestore(&priv->lock, flags);
+
+	return 0;
+}
+
+static const struct phy_ops en7581_serdes_phy_ops = {
+	.set_mode	= en7581_serdes_phy_set_mode,
+	.owner		= THIS_MODULE,
+};
+
+static struct phy *en7581_serdes_phy_xlate(struct device *dev,
+					   const struct of_phandle_args *args)
+{
+	struct en_clk_priv *priv = dev_get_drvdata(dev);
+	struct en_serdes_phy_instance *instance;
+	unsigned int serdes_port;
+
+	if (args->args_count != 1) {
+		dev_err(dev, "invalid number of cells in 'phy' property\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	serdes_port = args->args[0];
+	if (serdes_port >= EN_SERDES_PHY_NUM) {
+		dev_err(dev, "invalid serdes port: %d\n", serdes_port);
+		return ERR_PTR(-EINVAL);
+	}
+
+	instance = priv->serdes_phys[serdes_port];
+	if (!instance) {
+		dev_err(dev, "failed to find appropriate serdes phy\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	return instance->phy;
+}
+
+static int en7581_serdes_phy_register(struct device *dev)
+{
+	struct en_clk_priv *priv = dev_get_drvdata(dev);
+	struct phy_provider *phy_provider;
+	int i;
+
+	for (i = 0; i < EN_SERDES_PHY_NUM; i++) {
+		struct en_serdes_phy_instance *instance;
+
+		instance = devm_kzalloc(dev, sizeof(*instance),
+					GFP_KERNEL);
+		if (!instance)
+			return -ENOMEM;
+
+		instance->phy = devm_phy_create(dev, NULL,
+						&en7581_serdes_phy_ops);
+		if (IS_ERR(instance->phy))
+			return dev_err_probe(dev, PTR_ERR(instance->phy), "failed to create phy\n");
+
+		instance->serdes_port = i;
+		priv->serdes_phys[i] = instance;
+
+		phy_set_drvdata(instance->phy, instance);
+	}
+
+	phy_provider = devm_of_phy_provider_register(dev, en7581_serdes_phy_xlate);
+
+	return PTR_ERR_OR_ZERO(phy_provider);
+}
+
 static int en7581_clk_hw_init(struct platform_device *pdev,
 			      struct clk_hw_onecell_data *clk_data)
 {
+	struct en_clk_priv *priv = platform_get_drvdata(pdev);
 	struct regmap *map;
 	void __iomem *base;
 	u32 val;
+	int ret;
 
 	map = syscon_regmap_lookup_by_compatible("airoha,en7581-chip-scu");
 	if (IS_ERR(map))
@@ -845,6 +1043,8 @@ static int en7581_clk_hw_init(struct platform_device *pdev,
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
+	priv->base = base;
+
 	en7581_register_clocks(&pdev->dev, clk_data, map, base);
 
 	val = readl(base + REG_NP_SCU_SSTR);
@@ -853,9 +1053,12 @@ static int en7581_clk_hw_init(struct platform_device *pdev,
 	val = readl(base + REG_NP_SCU_PCIC);
 	writel(val | 3, base + REG_NP_SCU_PCIC);
 
-	return en7581_reset_register(&pdev->dev, base, en7581_rst_map,
-				     ARRAY_SIZE(en7581_rst_map),
-				     en7581_rst_ofs);
+	ret = en7581_reset_register(&pdev->dev, base, en7581_rst_map,
+				    ARRAY_SIZE(en7581_rst_map), en7581_rst_ofs);
+	if (ret)
+		return ret;
+
+	return en7581_serdes_phy_register(&pdev->dev);
 }
 
 static enum en_hir get_hw_id(void __iomem *np_base)
@@ -962,16 +1165,25 @@ static int en7523_clk_probe(struct platform_device *pdev)
 	struct device_node *node = pdev->dev.of_node;
 	const struct en_clk_soc_data *soc_data;
 	struct clk_hw_onecell_data *clk_data;
+	struct en_clk_priv *priv;
 	int r;
 
 	soc_data = device_get_match_data(&pdev->dev);
 
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	spin_lock_init(&priv->lock);
+
 	clk_data = devm_kzalloc(&pdev->dev,
 				struct_size(clk_data, hws, soc_data->num_clocks),
 				GFP_KERNEL);
 	if (!clk_data)
 		return -ENOMEM;
 
+	platform_set_drvdata(pdev, priv);
+
 	clk_data->num = soc_data->num_clocks;
 	r = soc_data->hw_init(pdev, clk_data);
 	if (r)
-- 
2.53.0


