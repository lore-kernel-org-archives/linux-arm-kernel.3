Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 845D2C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 11:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CdUAxzWtLeB6HjxCg5m7G0qo3TL8BAYNXQpF7s4o0Vo=; b=yGCgamLNIp06X80BMfD/zmHWAN
	pdkoq0yZw2SmGZTwM2YfLF0X0vnen4nDygO0DSuMmEW00/+u6oM8GxsAHmHgwLRSamr4/rQVMymQe
	VusKpOR/sKFZYbAX7dxsuLcMYpAFdP3aeh0Iqg4S1PjwWFKtKzrtCSANCcXZEj5lm6GvoFpB+B6oA
	oxFlkSuRIVx83OnCT2i5pOo5y6ZuZXxakDK0UrIceqn9Mvn1F8d4p9yyRhzSmnat9d31pmuxKHUnm
	zA+N5OcovHwCEcOaXo0PJtn8NEPe5gt9W4nM7ageFSFKagjlPxAvRAOEGa4H8agM98mG3WK8oKp2U
	JBwHsdlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2pvZ-0000000AFYA-28mX;
	Thu, 10 Apr 2025 11:18:37 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2om1-0000000A28I-0mX6;
	Thu, 10 Apr 2025 10:04:42 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-43cebe06e9eso4610185e9.3;
        Thu, 10 Apr 2025 03:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744279480; x=1744884280; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CdUAxzWtLeB6HjxCg5m7G0qo3TL8BAYNXQpF7s4o0Vo=;
        b=UEBKXnRCc35MWvVAjh8/ZuR8Y7NOv5uGQeeyWxdwLR/goHYhbO0PIMqqjIpaljE6LW
         ut/oaP9yV8DMyFjSCxSdTrdK6Oq2kIY2mrT8QZkoNLsc/mNF0WJ15D+RFsjrBbw7HcVV
         V/nWvCl/x5wCF17UFgB6EvcguD/dgkBOfljJICqz9kogMoQu3Sk/3tQIXh3Kv5kxuR/y
         nuSxEwsOb4SaTyT3s7+68JgKMwQRmkrbuZEMKZoCNvJOGEQd7I6dEpGpfKG/pT9e8B/7
         +kcse/BUrcJu6iEoiVp7MIKi674tGGWx3fhuR4irrYO9gHB2uCUZZowIyNBzqqec33cx
         xpPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744279480; x=1744884280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CdUAxzWtLeB6HjxCg5m7G0qo3TL8BAYNXQpF7s4o0Vo=;
        b=t1iDLeyN+nbrHCy5fiTfwz9iuo0BC1Q4ytzh8OAf451fcCmcuvuUICIHrQ8aZgSAa9
         BZLteKoO/l7wWcOxVGu7lpb6/hgpurO7E+CS+qgzUVXL7sec8dRmcOF37NyIhKNrV+4P
         nnDkfZAmLF1SwAxb/hVZodl55H6DXKY8G8y3K8zHCeE/i7XKiXkd1rDSwVU5+CzVaT/T
         tDfo2yBVQ+y1dBITKTiCY3c7jkoWbq1JOMSxwnQYWh3ol3Mmquc5osFdaSSscO5XGpK/
         yOI1+0Cb71OUm92W9rtBl6B/OL+mFS2wimYY3Rxs1jDR8uMHBZOPMwFnh6bnu4JOP2eS
         l+0w==
X-Forwarded-Encrypted: i=1; AJvYcCUGPGIAwHRUkKZq/Pkg7ba3NjqzPO2lOS/ivuqGxTBNJhxc5GWkBm+nti/QdTl5UB1VB+uOdKDU+p4Fz+ydDevf@lists.infradead.org, AJvYcCXe+e3mNESMpbYVqxoRgyRlDigfNqZVufAqsaQXeXTOMyYmbhKSQJtjAwh61hlKxZk9B1nCE3q3wVdNmFALFTc=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9pD5D47soR1B98/dIDej0fGITGgUp7PkRupTZAFklpYBcMfbV
	V/ZaR1hW3DVfdm1exJ7GKUaTmovofsbM523aBRQozNCor3W09A6Z
X-Gm-Gg: ASbGncsBkQ4ykI53ubGsEiQF9iQvp5KTjeTqSfuV4MLhvbYQsyc3GYPYEHqpO0gKeKX
	+hvY6xc+QH6TE16gZXVxurWHkWF8H1Brzc61i/O9r7ADiMus4Be8Oz0pKnhwp9rQRCOfW7fq+Vf
	HwE3X6QjlwqdIETJGCznXSmTaoyvS7AY93lDoXeXnFgPGsk7a+tcH/82gvsPx4knVVhnniTQ0r5
	cHXXdGJrFrAG8vjlJ5l7+2Dsms5EZaSA1+iNYK1aRPcSBQm4xBBELbsPGKnp7HqPbPolcCXdwy5
	hd+0DpzUmzBjOi2J6EVgmu5fqEMZDyznxYsaPxfFJDr3FgTZrQwORGfQEDBPRxePf4rkAI5fK3A
	j9byZtDf+DQ==
X-Google-Smtp-Source: AGHT+IGYoTyBBqFICuMkH3mR4Fg8hmdezzL5DfQ1KcqV7+Ty4VNQeL8aQBID3P+joTDw2WBxubY1eQ==
X-Received: by 2002:a05:600c:4f4e:b0:43c:fae1:5151 with SMTP id 5b1f17b1804b1-43f2d9599efmr19305005e9.25.1744279479484;
        Thu, 10 Apr 2025 03:04:39 -0700 (PDT)
Received: from localhost.localdomain (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43f2066d109sm50193065e9.20.2025.04.10.03.04.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 03:04:39 -0700 (PDT)
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
	linux-mediatek@lists.infradead.org
Subject: [net-next PATCH v2 2/2] net: phy: mediatek: add Airoha PHY ID to SoC driver
Date: Thu, 10 Apr 2025 12:04:04 +0200
Message-ID: <20250410100410.348-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250410100410.348-1-ansuelsmth@gmail.com>
References: <20250410100410.348-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_030441_223671_19079257 
X-CRM114-Status: GOOD (  20.98  )
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

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
Changes v2:
- Add Reviewed-by tag
- Address suggested dependency from Russell

 drivers/net/phy/mediatek/Kconfig      |  4 +-
 drivers/net/phy/mediatek/mtk-ge-soc.c | 62 +++++++++++++++++++++++++++
 2 files changed, 65 insertions(+), 1 deletion(-)

diff --git a/drivers/net/phy/mediatek/Kconfig b/drivers/net/phy/mediatek/Kconfig
index 6a4c2b328c41..4308002bb82c 100644
--- a/drivers/net/phy/mediatek/Kconfig
+++ b/drivers/net/phy/mediatek/Kconfig
@@ -15,7 +15,9 @@ config MEDIATEK_GE_PHY
 
 config MEDIATEK_GE_SOC_PHY
 	tristate "MediaTek SoC Ethernet PHYs"
-	depends on (ARM64 && ARCH_MEDIATEK && NVMEM_MTK_EFUSE) || COMPILE_TEST
+	depends on ARM64 || COMPILE_TEST
+	depends on ARCH_AIROHA || (ARCH_MEDIATEK && NVMEM_MTK_EFUSE) || \
+		   COMPILE_TEST
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


