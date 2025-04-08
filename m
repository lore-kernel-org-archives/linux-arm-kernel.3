Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D218C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 16:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ekOcUtRr3A4IOGCZAyUQefTbVJ5awYg2QZ9PR3IRAM0=; b=Fg19oIU9+hR8iWUq04qUGfUT97
	/jFPk5CJ2FKKCy0VXNbpHz/H4WiqfJgeN/uIRpLwCd8h66X5KJw3wqedKFkO7CWnQyRZs7YZPyh+q
	++lgaBQ7zzo1b+Ki8O9wEM5WWKraRz2LnRX+lt3YENW1cH4ty7E4vF93OelZlhgU1PJBdAV9gg5VU
	+/pbEadEKdKT6r0rW+pJQ4+om2mbaV02TBnmwjWKIXYcAGTstwZzeekpeyPeWdl0ji0Kz7kpoNeNE
	ZlQWTI51vnVRUrn89CKXwkR9YPz+p6tkdBtRfQHC3aUw6efGKVpbvb41W/uf+DvxZlefIhCjJPAYm
	h56vhfTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2BPT-00000004jcl-3jwi;
	Tue, 08 Apr 2025 16:02:47 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2BGy-00000004hke-0MFi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 15:54:01 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-43cf05f0c3eso37599765e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Apr 2025 08:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744127638; x=1744732438; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ekOcUtRr3A4IOGCZAyUQefTbVJ5awYg2QZ9PR3IRAM0=;
        b=nVkU5PVeKdhuJrXRSl4AfqbA9rhAY55ID50znnIyss/FmqL7TLQPLxmvVwqRDCQCPR
         ElgguOkTSsZot2HNp1XF9wh2A3t8Zt4L3svw1Z4lls8y7Yg466hYY88jLFEP7pSGQF/5
         FeBTcGNevveAn59M6YNBjUGKo42g3l51mycrj2scP+JG/XOXvUJaWZr5ZVkXtWErjba5
         y2tqEitbO/t49+V/qG/W4vY7RrMo2ZIW/1+RmOh/Jq3oYuLbP93mJ+o+pHkcTBgmETmH
         1BpNoZYqVmc5eGjt3X+2FowXYaBWQwdxa1rrcPm/gaM7aXoGPeosenLt3Kcm5FVAaRem
         QRig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744127638; x=1744732438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ekOcUtRr3A4IOGCZAyUQefTbVJ5awYg2QZ9PR3IRAM0=;
        b=M6qnohlgQJ7ID22qYYcE2y7fGxsdcrXebvoR36L0nMrLqgaKRn/5X1WAEXl/IQzO7n
         WrYtFb4J5B9Pj0VQKOevfrzYk4vWALa6V61d1rQpN7uC3Lhqrvi/vQzvI6LyxPl8ZoyL
         7PKUOtU2qNoQBpEvorWBbU9XjOwwEQZQfd5Vz1Buz2troOPiJfu3FmjA6IAJqz+ee7ho
         /1Rot97obBOOx6Us3finwIFPLxO8nNagRzuiMPrUhdz5cItXXNhL74kpZ1GDLAjpW6Sf
         UikvmEo1cSkHkCsgqBWVOhLsx7Loq3U/LfvmavJLslBTPy93LEkZi1OumnX9c8yKD5QG
         SPCg==
X-Forwarded-Encrypted: i=1; AJvYcCXfMjshrQ/694Wbr3Atk/UyLg2wgmrvmAZcof+ol0QJI3wxrDTYKJTg0fglO8y6TQVBYFv1JTNVM6wx/IAmbnyE@lists.infradead.org
X-Gm-Message-State: AOJu0YyLs/jG8vn/VMCUBh33wm3EBUaaLdoNiz9ShogIUozmKBqN083C
	cdtXgZRiSFHCh5YBbucw75QqTmKoaeD/Kv6PfX9QT6Ob4HUMisBq
X-Gm-Gg: ASbGncvLRxQO8urelhwpnNTXEIEeBwErpshT4m9xexgL9HwIuQKsMpYbOfQbhg8Bhz2
	DOBsIYY4wjn0zQDXGUCKA0udblkVb8tXsICBvU7bqwIH2XRPrnnDZ/k7Z8fJtuB/90reBCEoNsr
	YCnrj45ey/7uYgkHpELwUwV4J5oiTUNUM4mvrg8j39pXFHMNEcOO0yAgcloUlIl5iKSc01rUfKQ
	oVZD78Z8CqYz9aLJr08F60YOQHHKKJzXmUwRqSj/E4rDoUneqmhxvKTpUgP0m3gjbxyyoHd29x4
	w7Q3Vr6F/HkjQlZlMJZsUuIdv+JbLTgd86CEoL+kFMZX0pivXsnd9/xQaOr61kqLscm667DsGz6
	3QeJiMzgJISNnHw==
X-Google-Smtp-Source: AGHT+IEcvb61vad+7cTWO+SjMN3izWfOVzCUXI71ezIzb4gGUHEDx9bOWlC53mcqXmTAlTQO2RLqzw==
X-Received: by 2002:a05:600c:3484:b0:43e:afca:808f with SMTP id 5b1f17b1804b1-43ed0db4006mr180860035e9.31.1744127637770;
        Tue, 08 Apr 2025 08:53:57 -0700 (PDT)
Received: from localhost.localdomain (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-39c30226ee4sm15716615f8f.93.2025.04.08.08.53.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 08:53:57 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Simon Horman <horms@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.or
Subject: [net-next PATCH 2/2] net: phy: mediatek: add Airoha PHY ID to SoC driver
Date: Tue,  8 Apr 2025 17:53:14 +0200
Message-ID: <20250408155321.613868-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250408155321.613868-1-ansuelsmth@gmail.com>
References: <20250408155321.613868-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_085400_133665_038956AC 
X-CRM114-Status: GOOD (  21.59  )
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

Airoha AN7581 SoC ship with a Switch based on the MT753x Switch embedded
in other SoC like the MT7581 and the MT7988. Similar to these they
require configuring some pin to enable LED PHYs.

Add support for the PHY ID for the Airoha embedded Switch and define a
simple probe function to toggle these pins. Also fill the LED functions
and add dedicated function to define LED polarity.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/mediatek/Kconfig      |  4 +-
 drivers/net/phy/mediatek/mtk-ge-soc.c | 62 +++++++++++++++++++++++++++
 2 files changed, 64 insertions(+), 2 deletions(-)

diff --git a/drivers/net/phy/mediatek/Kconfig b/drivers/net/phy/mediatek/Kconfig
index c80b4c5b7b66..0fb496757e04 100644
--- a/drivers/net/phy/mediatek/Kconfig
+++ b/drivers/net/phy/mediatek/Kconfig
@@ -15,8 +15,8 @@ config MEDIATEK_GE_PHY
 
 config MEDIATEK_GE_SOC_PHY
 	tristate "MediaTek SoC Ethernet PHYs"
-	depends on (ARM64 && ARCH_MEDIATEK) || COMPILE_TEST
-	depends on NVMEM_MTK_EFUSE || COMPILE_TEST
+	depends on (ARM64 && (ARCH_MEDIATEK || ARCH_AIROHA)) || COMPILE_TEST
+	depends on (ARCH_MEDIATEK && NVMEM_MTK_EFUSE) || ARCH_AIROHA || COMPILE_TEST
 	select MTK_NET_PHYLIB
 	help
 	  Supports MediaTek SoC built-in Gigabit Ethernet PHYs.
diff --git a/drivers/net/phy/mediatek/mtk-ge-soc.c b/drivers/net/phy/mediatek/mtk-ge-soc.c
index 175cf5239bba..fd0e447ffce7 100644
--- a/drivers/net/phy/mediatek/mtk-ge-soc.c
+++ b/drivers/net/phy/mediatek/mtk-ge-soc.c
@@ -11,8 +11,11 @@
 #include "../phylib.h"
 #include "mtk.h"
 
+#define MTK_PHY_MAX_LEDS			2
+
 #define MTK_GPHY_ID_MT7981			0x03a29461
 #define MTK_GPHY_ID_MT7988			0x03a29481
+#define MTK_GPHY_ID_AN7581			0x03a294c1
 
 #define MTK_EXT_PAGE_ACCESS			0x1f
 #define MTK_PHY_PAGE_STANDARD			0x0000
@@ -1406,6 +1409,53 @@ static int mt7981_phy_probe(struct phy_device *phydev)
 	return mt798x_phy_calibration(phydev);
 }
 
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
+	u32 mode;
+	u16 val;
+
+	if (index >= MTK_PHY_MAX_LEDS)
+		return -EINVAL;
+
+	for_each_set_bit(mode, &modes, __PHY_LED_MODES_NUM) {
+		switch (mode) {
+		case PHY_LED_ACTIVE_LOW:
+			val = MTK_PHY_LED_ON_POLARITY;
+			break;
+		case PHY_LED_ACTIVE_HIGH:
+			val = 0;
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
 static struct phy_driver mtk_socphy_driver[] = {
 	{
 		PHY_ID_MATCH_EXACT(MTK_GPHY_ID_MT7981),
@@ -1441,6 +1491,17 @@ static struct phy_driver mtk_socphy_driver[] = {
 		.led_hw_control_set = mt798x_phy_led_hw_control_set,
 		.led_hw_control_get = mt798x_phy_led_hw_control_get,
 	},
+	{
+		PHY_ID_MATCH_EXACT(MTK_GPHY_ID_AN7581),
+		.name		= "Airoha AN7581 PHY",
+		.probe		= an7581_phy_probe,
+		.led_blink_set	= mt798x_phy_led_blink_set,
+		.led_brightness_set = mt798x_phy_led_brightness_set,
+		.led_hw_is_supported = mt798x_phy_led_hw_is_supported,
+		.led_hw_control_set = mt798x_phy_led_hw_control_set,
+		.led_hw_control_get = mt798x_phy_led_hw_control_get,
+		.led_polarity_set = an7581_phy_led_polarity_set,
+	},
 };
 
 module_phy_driver(mtk_socphy_driver);
@@ -1448,6 +1509,7 @@ module_phy_driver(mtk_socphy_driver);
 static const struct mdio_device_id __maybe_unused mtk_socphy_tbl[] = {
 	{ PHY_ID_MATCH_EXACT(MTK_GPHY_ID_MT7981) },
 	{ PHY_ID_MATCH_EXACT(MTK_GPHY_ID_MT7988) },
+	{ PHY_ID_MATCH_EXACT(MTK_GPHY_ID_AN7581) },
 	{ }
 };
 
-- 
2.48.1


