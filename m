Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEDB3C43602
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 10:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PebJc2ke4pYHFsZpPm71QD5ECG+JVGmpQAxgLNjBuQk=; b=PZspCMjWtpDbuvIsFJUUjNrM2W
	csFfEOqJ3CljTs2ziChe/rcZpUXgA0NUlB4VMyOQEPY0Mx/0D/UWs0gSDD9AAHDWI4qpUfW+8tpQ4
	1WuWInDQ8sU0M/Lj6ocQZNN25PtiFEDHIxEMi5lm6Tdm9AJjjXyUr9ubYQuY99qAxwthCXENtq70N
	Q8cOeDFhyi7EZQ15XfQ5kTurq/ZNw2QGjwxyVgyarV/k9H/XaWcwKVAeqxrpvvjyWo5EvAGOUSLDB
	uPd/LTDK/hVdCe3AfztvvpzZtIRiDuVmi8j7bFeATWzQcOgVpCvYlHe4QKq694f+BEBpfoO0qEVDu
	22Zau2aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whPRj-0000000Gt6Y-3c0y;
	Wed, 08 Jul 2026 10:24:03 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whPRc-0000000GsyO-0riS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 10:24:00 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-493b61b52b6so4660485e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 03:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783506234; x=1784111034; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PebJc2ke4pYHFsZpPm71QD5ECG+JVGmpQAxgLNjBuQk=;
        b=RO8si7qXxcw3SlkPiy2laFUw+MLNBKo5VcToiFqb8EAKskH9kTkDlaGmdSncq0PNUP
         KmQKEzIWqHLYXLJeBmFG6z3OICDbxfEH6DvqJN3DOcYbY61D/ZK+PexAB2Mxey2CKika
         oqhftDpuKjj8LiF5m66OJy+ErW1Hh3NrZermYtUcLGOZdgF92WyFBw574RQBVuI/1UHR
         bW1eii+VHBeOV9yYw5cw2grM3EfO+MJ3Fv2EoCU7e1d6f9fiwaphEhVoBXchQBCP5q54
         y51yR13btzeV/u0gukyP2s/R1M5E34/BkgJeB28TxKJH2x9oxkhX0eQx5DY97BUqEiBy
         FEgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783506234; x=1784111034;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=PebJc2ke4pYHFsZpPm71QD5ECG+JVGmpQAxgLNjBuQk=;
        b=MHp5Gvxj1SaxaUZ7mgBMSNCyRVLbK+/WdGx6SdWt0FGjWIrk9fhOfHsufFMr7gM0MB
         3nS+u+vD4HxA5qKxWZ8BIpDDCFma3gCWP9SY7Y7W2UPfrGO7Cl5xdYB2eZGdle6V2LJW
         vJNhRAffGGvYe3WxnH0TK+D8ykGluLL5fNESgbPOeM7uXxF41PWANu4r4aSgy6v2rwMk
         M2loIN/2geqayp8NhZWLhUMkObckKeP4aU3yAMeswU9xcVeAAym5A1/VSrwKusHTIA8q
         9WOw6+fMVHPgcNhRgWQTkyavoxqgDb1Vd5CEkFdKydaNaAJ/01BURs/mkYx+NA0+kkwv
         xy/A==
X-Forwarded-Encrypted: i=1; AHgh+RojE25A6Z1Fi+y9X4MQ+mjaCTAU8S/AHGqNkUN8ObzPygHVF31CnMbAQUYR0PNfsDSUZMsjW+SXwmDlC69A21Fy@lists.infradead.org
X-Gm-Message-State: AOJu0YyJe64P15a26i7c9UsmE8G843SL4IGI8ZoV5Mf3z0+LVGbZDtmL
	ZQpN619XBJ7ntqk3QEZYb58SATnJqIgJGQZOBsg6TNol3JTNp5kLPM5x
X-Gm-Gg: AfdE7cmpmZqxhe5aspZ+bfcer2VBOQTfg5X4rhrk7vJ21cwJniPMSNv+5FcEY3hBGjf
	oE8SewW5h7HGgfG6x4So0TjVys2xj7Q1Ez6z1UMmXnhkRmDsPzYAcw9VOGDCCJF1FF9tfZZR2en
	7rV0NOIh1od2Vq84NhTGK24t+vHhw2swj88Eb2yf1hAV5H5RjoLl6t4CfbA67kHEj4vNJM4Fr6A
	hSD22scLt+GvVnwgMZJ3VFqRKpZO3UgPyPMUv77atbCmns9rqtzf2jaJ6ltTIX7WZ9oetyl1Zv4
	dOCpZJ3zyNjR3t4im8GYalv9KbbGN+OIffZi4mK8EKGpv/rV5oUQP0vtljVsrNGxmvLHsbHEbC1
	fHyetyFx5gRDIinS/zBWZjTBKGy+Lkr2D5MZjnV71+LRzo0HrbkFeIhRsa6FlAMxeNdhUvpj/cU
	zNHj2ewbC5VVHkXBiuRaNYAasy3oYmZrDsD3R00OCbDsFiXhoyIquQkqZbf31soOCopT9RTj3+Q
	LGqntbqJNdvC38UGpw=
X-Received: by 2002:a05:600c:c4a7:b0:493:c845:bc20 with SMTP id 5b1f17b1804b1-493e688c7c9mr18708135e9.4.1783506234285;
        Wed, 08 Jul 2026 03:23:54 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-95-248-227-210.retail.telecomitalia.it. [95.248.227.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47aa0f2186bsm40660248f8f.36.2026.07.08.03.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 03:23:53 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net-next 3/5] net: phy: mediatek: split Airoha code to dedicated source
Date: Wed,  8 Jul 2026 12:23:29 +0200
Message-ID: <20260708102341.53919-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260708102341.53919-1-ansuelsmth@gmail.com>
References: <20260708102341.53919-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_032356_498740_9EAD4283 
X-CRM114-Status: GOOD (  27.91  )
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

In preparation for Airoha PHYs software calibration support, split the
Airoha code to dedicated source following Mediatek naming pattern of
"ge-soc".

This is to tidy things up and not overload the mediatek driver of specific
Airoha code and ship a bigger PHY kernel module with dead code.

Move the shared LEDs function to mtk-phy-lib to permit the split instead of
duplicating the code.

Also add myself as MAINTAINER of the now new airoha-ge-soc driver.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 MAINTAINERS                              |   8 ++
 drivers/net/phy/mediatek/Kconfig         |  16 ++-
 drivers/net/phy/mediatek/Makefile        |   1 +
 drivers/net/phy/mediatek/airoha-ge-soc.c | 102 ++++++++++++++++
 drivers/net/phy/mediatek/mtk-ge-soc.c    | 146 -----------------------
 drivers/net/phy/mediatek/mtk-ge-soc.h    |   4 +-
 drivers/net/phy/mediatek/mtk-phy-lib.c   |  72 +++++++++++
 drivers/net/phy/mediatek/mtk.h           |  12 ++
 8 files changed, 211 insertions(+), 150 deletions(-)
 create mode 100644 drivers/net/phy/mediatek/airoha-ge-soc.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 16e47aea84c3..e914bccf5cbb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -760,6 +760,14 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
 F:	drivers/net/ethernet/airoha/
 
+AIROHA ETHERNET PHY DRIVER
+M:	Christian Marangi <ansuelsmth@gmail.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
+L:	netdev@vger.kernel.org
+S:	Maintained
+F:	drivers/net/phy/mediatek/airoha-ge-soc.c
+
 AIROHA PCIE PHY DRIVER
 M:	Lorenzo Bianconi <lorenzo@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
diff --git a/drivers/net/phy/mediatek/Kconfig b/drivers/net/phy/mediatek/Kconfig
index bb7dc876271e..fe51f4616c54 100644
--- a/drivers/net/phy/mediatek/Kconfig
+++ b/drivers/net/phy/mediatek/Kconfig
@@ -1,4 +1,17 @@
 # SPDX-License-Identifier: GPL-2.0-only
+config AIROHA_GE_SOC_PHY
+	tristate "Airoha SoC Ethernet PHYs"
+	depends on ARM64 || COMPILE_TEST
+	depends on ARCH_AIROHA || COMPILE_TEST
+	select MTK_NET_PHYLIB
+	select PHY_PACKAGE
+	help
+	  Supports Airoha SoC built-in Gigabit Ethernet PHYs.
+
+	  Include support for built-in Ethernet PHYs which are present in
+	  the AN7581 and AN7583 SoCs. These PHYs d will dynamically
+	  calibrate during startup.
+
 config MEDIATEK_2P5GE_PHY
 	tristate "MediaTek 2.5Gb Ethernet PHYs"
 	depends on (ARM64 && ARCH_MEDIATEK) || COMPILE_TEST
@@ -24,8 +37,7 @@ config MEDIATEK_GE_PHY
 config MEDIATEK_GE_SOC_PHY
 	tristate "MediaTek SoC Ethernet PHYs"
 	depends on ARM64 || COMPILE_TEST
-	depends on ARCH_AIROHA || (ARCH_MEDIATEK && NVMEM_MTK_EFUSE) || \
-		   COMPILE_TEST
+	depends on (ARCH_MEDIATEK && NVMEM_MTK_EFUSE) || COMPILE_TEST
 	select MTK_NET_PHYLIB
 	select PHY_PACKAGE
 	help
diff --git a/drivers/net/phy/mediatek/Makefile b/drivers/net/phy/mediatek/Makefile
index ac57ecc799fc..eb430f008169 100644
--- a/drivers/net/phy/mediatek/Makefile
+++ b/drivers/net/phy/mediatek/Makefile
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
+obj-$(CONFIG_AIROHA_GE_SOC_PHY)		+= airoha-ge-soc.o
 obj-$(CONFIG_MEDIATEK_2P5GE_PHY)	+= mtk-2p5ge.o
 obj-$(CONFIG_MEDIATEK_GE_PHY)		+= mtk-ge.o
 obj-$(CONFIG_MEDIATEK_GE_SOC_PHY)	+= mtk-ge-soc.o
diff --git a/drivers/net/phy/mediatek/airoha-ge-soc.c b/drivers/net/phy/mediatek/airoha-ge-soc.c
new file mode 100644
index 000000000000..429594f27792
--- /dev/null
+++ b/drivers/net/phy/mediatek/airoha-ge-soc.c
@@ -0,0 +1,102 @@
+// SPDX-License-Identifier: GPL-2.0+
+#include <linux/pinctrl/consumer.h>
+#include <linux/phy.h>
+
+#include "mtk.h"
+#include "mtk-ge-soc.h"
+
+#define AIROHA_PHY_MAX_LEDS			2
+
+static int an7581_phy_probe(struct phy_device *phydev)
+{
+	struct mtk_socphy_priv *priv;
+	struct pinctrl *pinctrl;
+
+	/* Toggle pinctrl to enable PHY LED */
+	pinctrl = devm_pinctrl_get_select(&phydev->mdio.dev, "gbe-led");
+	if (IS_ERR(pinctrl))
+		dev_err(&phydev->mdio.bus->dev,
+			"Failed to setup PHY LED pinctrl\n");
+
+	priv = devm_kzalloc(&phydev->mdio.dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	phydev->priv = priv;
+
+	return 0;
+}
+
+static int an7581_phy_led_polarity_set(struct phy_device *phydev, int index,
+				       unsigned long modes)
+{
+	u16 val = 0;
+	u32 mode;
+
+	if (index >= AIROHA_PHY_MAX_LEDS)
+		return -EINVAL;
+
+	for_each_set_bit(mode, &modes, __PHY_LED_MODES_NUM) {
+		switch (mode) {
+		case PHY_LED_ACTIVE_LOW:
+			val = MTK_PHY_LED_ON_POLARITY;
+			break;
+		case PHY_LED_ACTIVE_HIGH:
+			break;
+		default:
+			return -EINVAL;
+		}
+	}
+
+	return phy_modify_mmd(phydev, MDIO_MMD_VEND2, index ?
+			      MTK_PHY_LED1_ON_CTRL : MTK_PHY_LED0_ON_CTRL,
+			      MTK_PHY_LED_ON_POLARITY, val);
+}
+
+static int an7583_phy_config_init(struct phy_device *phydev)
+{
+	/* BMCR_PDOWN is enabled by default */
+	return phy_clear_bits(phydev, MII_BMCR, BMCR_PDOWN);
+}
+
+static struct phy_driver mtk_socphy_driver[] = {
+	{
+		PHY_ID_MATCH_EXACT(AIROHA_GPHY_ID_AN7581),
+		.name		= "Airoha AN7581 PHY",
+		.config_intr	= genphy_no_config_intr,
+		.handle_interrupt = genphy_handle_interrupt_no_ack,
+		.probe		= an7581_phy_probe,
+		.led_blink_set	= mt798x_phy_led_blink_set,
+		.led_brightness_set = mt798x_phy_led_brightness_set,
+		.led_hw_is_supported = mt798x_phy_led_hw_is_supported,
+		.led_hw_control_set = mt798x_phy_led_hw_control_set,
+		.led_hw_control_get = mt798x_phy_led_hw_control_get,
+		.led_polarity_set = an7581_phy_led_polarity_set,
+	},
+	{
+		PHY_ID_MATCH_EXACT(AIROHA_GPHY_ID_AN7583),
+		.name		= "Airoha AN7583 PHY",
+		.config_init	= an7583_phy_config_init,
+		.probe		= an7581_phy_probe,
+		.led_blink_set	= mt798x_phy_led_blink_set,
+		.led_brightness_set = mt798x_phy_led_brightness_set,
+		.led_hw_is_supported = mt798x_phy_led_hw_is_supported,
+		.led_hw_control_set = mt798x_phy_led_hw_control_set,
+		.led_hw_control_get = mt798x_phy_led_hw_control_get,
+		.led_polarity_set = an7581_phy_led_polarity_set,
+	},
+};
+
+module_phy_driver(mtk_socphy_driver);
+
+static const struct mdio_device_id __maybe_unused airoha_socphy_tbl[] = {
+	{ PHY_ID_MATCH_EXACT(AIROHA_GPHY_ID_AN7581) },
+	{ PHY_ID_MATCH_EXACT(AIROHA_GPHY_ID_AN7583) },
+	{ }
+};
+
+MODULE_DESCRIPTION("Airoha SoC Gigabit Ethernet PHY driver");
+MODULE_AUTHOR("Christian Marangi <ansuelsmth@gmail.com>");
+MODULE_LICENSE("GPL");
+
+MODULE_DEVICE_TABLE(mdio, airoha_socphy_tbl);
diff --git a/drivers/net/phy/mediatek/mtk-ge-soc.c b/drivers/net/phy/mediatek/mtk-ge-soc.c
index 46bae11ad740..868ae089013d 100644
--- a/drivers/net/phy/mediatek/mtk-ge-soc.c
+++ b/drivers/net/phy/mediatek/mtk-ge-soc.c
@@ -886,73 +886,6 @@ static int mt798x_phy_config_init(struct phy_device *phydev)
 	return mt798x_phy_calibration(phydev);
 }
 
-static int mt798x_phy_led_blink_set(struct phy_device *phydev, u8 index,
-				    unsigned long *delay_on,
-				    unsigned long *delay_off)
-{
-	bool blinking = false;
-	int err;
-
-	err = mtk_phy_led_num_dly_cfg(index, delay_on, delay_off, &blinking);
-	if (err < 0)
-		return err;
-
-	err = mtk_phy_hw_led_blink_set(phydev, index, blinking);
-	if (err)
-		return err;
-
-	return mtk_phy_hw_led_on_set(phydev, index, MTK_GPHY_LED_ON_MASK,
-				     false);
-}
-
-static int mt798x_phy_led_brightness_set(struct phy_device *phydev,
-					 u8 index, enum led_brightness value)
-{
-	int err;
-
-	err = mtk_phy_hw_led_blink_set(phydev, index, false);
-	if (err)
-		return err;
-
-	return mtk_phy_hw_led_on_set(phydev, index, MTK_GPHY_LED_ON_MASK,
-				     (value != LED_OFF));
-}
-
-static const unsigned long supported_triggers =
-	BIT(TRIGGER_NETDEV_FULL_DUPLEX) |
-	BIT(TRIGGER_NETDEV_HALF_DUPLEX) |
-	BIT(TRIGGER_NETDEV_LINK)        |
-	BIT(TRIGGER_NETDEV_LINK_10)     |
-	BIT(TRIGGER_NETDEV_LINK_100)    |
-	BIT(TRIGGER_NETDEV_LINK_1000)   |
-	BIT(TRIGGER_NETDEV_RX)          |
-	BIT(TRIGGER_NETDEV_TX);
-
-static int mt798x_phy_led_hw_is_supported(struct phy_device *phydev, u8 index,
-					  unsigned long rules)
-{
-	return mtk_phy_led_hw_is_supported(phydev, index, rules,
-					   supported_triggers);
-}
-
-static int mt798x_phy_led_hw_control_get(struct phy_device *phydev, u8 index,
-					 unsigned long *rules)
-{
-	return mtk_phy_led_hw_ctrl_get(phydev, index, rules,
-				       MTK_GPHY_LED_ON_SET,
-				       MTK_GPHY_LED_RX_BLINK_SET,
-				       MTK_GPHY_LED_TX_BLINK_SET);
-};
-
-static int mt798x_phy_led_hw_control_set(struct phy_device *phydev, u8 index,
-					 unsigned long rules)
-{
-	return mtk_phy_led_hw_ctrl_set(phydev, index, rules,
-				       MTK_GPHY_LED_ON_SET,
-				       MTK_GPHY_LED_RX_BLINK_SET,
-				       MTK_GPHY_LED_TX_BLINK_SET);
-};
-
 static bool mt7988_phy_led_get_polarity(struct phy_device *phydev, int led_num)
 {
 	struct mtk_socphy_shared *priv = phy_package_get_priv(phydev);
@@ -1089,58 +1022,6 @@ static int mt7981_phy_probe(struct phy_device *phydev)
 	return mt798x_phy_calibration(phydev);
 }
 
-static int an7581_phy_probe(struct phy_device *phydev)
-{
-	struct mtk_socphy_priv *priv;
-	struct pinctrl *pinctrl;
-
-	/* Toggle pinctrl to enable PHY LED */
-	pinctrl = devm_pinctrl_get_select(&phydev->mdio.dev, "gbe-led");
-	if (IS_ERR(pinctrl))
-		dev_err(&phydev->mdio.bus->dev,
-			"Failed to setup PHY LED pinctrl\n");
-
-	priv = devm_kzalloc(&phydev->mdio.dev, sizeof(*priv), GFP_KERNEL);
-	if (!priv)
-		return -ENOMEM;
-
-	phydev->priv = priv;
-
-	return 0;
-}
-
-static int an7581_phy_led_polarity_set(struct phy_device *phydev, int index,
-				       unsigned long modes)
-{
-	u16 val = 0;
-	u32 mode;
-
-	if (index >= MTK_PHY_MAX_LEDS)
-		return -EINVAL;
-
-	for_each_set_bit(mode, &modes, __PHY_LED_MODES_NUM) {
-		switch (mode) {
-		case PHY_LED_ACTIVE_LOW:
-			val = MTK_PHY_LED_ON_POLARITY;
-			break;
-		case PHY_LED_ACTIVE_HIGH:
-			break;
-		default:
-			return -EINVAL;
-		}
-	}
-
-	return phy_modify_mmd(phydev, MDIO_MMD_VEND2, index ?
-			      MTK_PHY_LED1_ON_CTRL : MTK_PHY_LED0_ON_CTRL,
-			      MTK_PHY_LED_ON_POLARITY, val);
-}
-
-static int an7583_phy_config_init(struct phy_device *phydev)
-{
-	/* BMCR_PDOWN is enabled by default */
-	return phy_clear_bits(phydev, MII_BMCR, BMCR_PDOWN);
-}
-
 static struct phy_driver mtk_socphy_driver[] = {
 	{
 		PHY_ID_MATCH_EXACT(MTK_GPHY_ID_MT7981),
@@ -1176,31 +1057,6 @@ static struct phy_driver mtk_socphy_driver[] = {
 		.led_hw_control_set = mt798x_phy_led_hw_control_set,
 		.led_hw_control_get = mt798x_phy_led_hw_control_get,
 	},
-	{
-		PHY_ID_MATCH_EXACT(MTK_GPHY_ID_AN7581),
-		.name		= "Airoha AN7581 PHY",
-		.config_intr	= genphy_no_config_intr,
-		.handle_interrupt = genphy_handle_interrupt_no_ack,
-		.probe		= an7581_phy_probe,
-		.led_blink_set	= mt798x_phy_led_blink_set,
-		.led_brightness_set = mt798x_phy_led_brightness_set,
-		.led_hw_is_supported = mt798x_phy_led_hw_is_supported,
-		.led_hw_control_set = mt798x_phy_led_hw_control_set,
-		.led_hw_control_get = mt798x_phy_led_hw_control_get,
-		.led_polarity_set = an7581_phy_led_polarity_set,
-	},
-	{
-		PHY_ID_MATCH_EXACT(MTK_GPHY_ID_AN7583),
-		.name		= "Airoha AN7583 PHY",
-		.config_init	= an7583_phy_config_init,
-		.probe		= an7581_phy_probe,
-		.led_blink_set	= mt798x_phy_led_blink_set,
-		.led_brightness_set = mt798x_phy_led_brightness_set,
-		.led_hw_is_supported = mt798x_phy_led_hw_is_supported,
-		.led_hw_control_set = mt798x_phy_led_hw_control_set,
-		.led_hw_control_get = mt798x_phy_led_hw_control_get,
-		.led_polarity_set = an7581_phy_led_polarity_set,
-	},
 };
 
 module_phy_driver(mtk_socphy_driver);
@@ -1208,8 +1064,6 @@ module_phy_driver(mtk_socphy_driver);
 static const struct mdio_device_id __maybe_unused mtk_socphy_tbl[] = {
 	{ PHY_ID_MATCH_EXACT(MTK_GPHY_ID_MT7981) },
 	{ PHY_ID_MATCH_EXACT(MTK_GPHY_ID_MT7988) },
-	{ PHY_ID_MATCH_EXACT(MTK_GPHY_ID_AN7581) },
-	{ PHY_ID_MATCH_EXACT(MTK_GPHY_ID_AN7583) },
 	{ }
 };
 
diff --git a/drivers/net/phy/mediatek/mtk-ge-soc.h b/drivers/net/phy/mediatek/mtk-ge-soc.h
index 9aaa7e3caa41..507e68343576 100644
--- a/drivers/net/phy/mediatek/mtk-ge-soc.h
+++ b/drivers/net/phy/mediatek/mtk-ge-soc.h
@@ -7,8 +7,8 @@
 
 #define MTK_GPHY_ID_MT7981			0x03a29461
 #define MTK_GPHY_ID_MT7988			0x03a29481
-#define MTK_GPHY_ID_AN7581			0x03a294c1
-#define MTK_GPHY_ID_AN7583			0xc0ff0420
+#define AIROHA_GPHY_ID_AN7581			0x03a294c1
+#define AIROHA_GPHY_ID_AN7583			0xc0ff0420
 
 #define MTK_EXT_PAGE_ACCESS			0x1f
 #define MTK_PHY_PAGE_STANDARD			0x0000
diff --git a/drivers/net/phy/mediatek/mtk-phy-lib.c b/drivers/net/phy/mediatek/mtk-phy-lib.c
index 78b998af5238..8c2b26f9b840 100644
--- a/drivers/net/phy/mediatek/mtk-phy-lib.c
+++ b/drivers/net/phy/mediatek/mtk-phy-lib.c
@@ -342,6 +342,78 @@ void mtk_phy_leds_state_init(struct phy_device *phydev)
 }
 EXPORT_SYMBOL_GPL(mtk_phy_leds_state_init);
 
+int mt798x_phy_led_blink_set(struct phy_device *phydev, u8 index,
+			     unsigned long *delay_on,
+			     unsigned long *delay_off)
+{
+	bool blinking = false;
+	int err;
+
+	err = mtk_phy_led_num_dly_cfg(index, delay_on, delay_off, &blinking);
+	if (err < 0)
+		return err;
+
+	err = mtk_phy_hw_led_blink_set(phydev, index, blinking);
+	if (err)
+		return err;
+
+	return mtk_phy_hw_led_on_set(phydev, index, MTK_GPHY_LED_ON_MASK,
+				     false);
+}
+EXPORT_SYMBOL_GPL(mt798x_phy_led_blink_set);
+
+int mt798x_phy_led_brightness_set(struct phy_device *phydev,
+				  u8 index, enum led_brightness value)
+{
+	int err;
+
+	err = mtk_phy_hw_led_blink_set(phydev, index, false);
+	if (err)
+		return err;
+
+	return mtk_phy_hw_led_on_set(phydev, index, MTK_GPHY_LED_ON_MASK,
+				     (value != LED_OFF));
+}
+EXPORT_SYMBOL_GPL(mt798x_phy_led_brightness_set);
+
+static const unsigned long supported_triggers =
+	BIT(TRIGGER_NETDEV_FULL_DUPLEX) |
+	BIT(TRIGGER_NETDEV_HALF_DUPLEX) |
+	BIT(TRIGGER_NETDEV_LINK)        |
+	BIT(TRIGGER_NETDEV_LINK_10)     |
+	BIT(TRIGGER_NETDEV_LINK_100)    |
+	BIT(TRIGGER_NETDEV_LINK_1000)   |
+	BIT(TRIGGER_NETDEV_RX)          |
+	BIT(TRIGGER_NETDEV_TX);
+
+int mt798x_phy_led_hw_is_supported(struct phy_device *phydev, u8 index,
+				   unsigned long rules)
+{
+	return mtk_phy_led_hw_is_supported(phydev, index, rules,
+					   supported_triggers);
+}
+EXPORT_SYMBOL_GPL(mt798x_phy_led_hw_is_supported);
+
+int mt798x_phy_led_hw_control_get(struct phy_device *phydev, u8 index,
+				  unsigned long *rules)
+{
+	return mtk_phy_led_hw_ctrl_get(phydev, index, rules,
+				       MTK_GPHY_LED_ON_SET,
+				       MTK_GPHY_LED_RX_BLINK_SET,
+				       MTK_GPHY_LED_TX_BLINK_SET);
+};
+EXPORT_SYMBOL_GPL(mt798x_phy_led_hw_control_get);
+
+int mt798x_phy_led_hw_control_set(struct phy_device *phydev, u8 index,
+				  unsigned long rules)
+{
+	return mtk_phy_led_hw_ctrl_set(phydev, index, rules,
+				       MTK_GPHY_LED_ON_SET,
+				       MTK_GPHY_LED_RX_BLINK_SET,
+				       MTK_GPHY_LED_TX_BLINK_SET);
+};
+EXPORT_SYMBOL_GPL(mt798x_phy_led_hw_control_set);
+
 MODULE_DESCRIPTION("MediaTek Ethernet PHY driver common");
 MODULE_AUTHOR("Sky Huang <SkyLake.Huang@mediatek.com>");
 MODULE_AUTHOR("Daniel Golle <daniel@makrotopia.org>");
diff --git a/drivers/net/phy/mediatek/mtk.h b/drivers/net/phy/mediatek/mtk.h
index f172f7d671c9..c690aaf38124 100644
--- a/drivers/net/phy/mediatek/mtk.h
+++ b/drivers/net/phy/mediatek/mtk.h
@@ -103,4 +103,16 @@ int mtk_phy_hw_led_blink_set(struct phy_device *phydev, u8 index,
 			     bool blinking);
 void mtk_phy_leds_state_init(struct phy_device *phydev);
 
+int mt798x_phy_led_blink_set(struct phy_device *phydev, u8 index,
+			     unsigned long *delay_on,
+			     unsigned long *delay_off);
+int mt798x_phy_led_brightness_set(struct phy_device *phydev,
+				  u8 index, enum led_brightness value);
+int mt798x_phy_led_hw_is_supported(struct phy_device *phydev, u8 index,
+				   unsigned long rules);
+int mt798x_phy_led_hw_control_get(struct phy_device *phydev, u8 index,
+				  unsigned long *rules);
+int mt798x_phy_led_hw_control_set(struct phy_device *phydev, u8 index,
+				  unsigned long rules);
+
 #endif /* _MTK_EPHY_H_ */
-- 
2.53.0


