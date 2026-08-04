Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8744C5518F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 10:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vTXDHsnwFlbf3g77LNyPYkdxcBB8Zd+YWsg2JPpDVpU=; b=iRSOg7fP2zHwktvg4GkggGdCD6
	I6odMnfJZyjCQheSeoJ9YXDoxUieGOhbIiAS9CwtbHM5pmYsUKIq/shawneSIhRESVIf4SrTql2xd
	nlb2tTR3dTdVs30BKGqxUf5djwdnNbjBUXaobcUuytJiX+1Ab93S0G7FN21jTA2WgFvJY2fmFQHWm
	4I4GezQ1K73JukIBhqiB/NTemPmlL/5HlTvQLwSgY6vX2ByNjnw1wIOy93cEXAlA3wLu7ZUXZR5Rc
	1v2UQaCwqsTF1oT5C9OcGmsoY8604MmurlvB0J85LVUiRnYS8KWvBtzwncJb40P7/i6Q01un6sWjf
	m13l+dEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrCT0-00000001YBq-2yqF;
	Tue, 04 Aug 2026 10:33:50 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrCSx-00000001YAq-1Shm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 10:33:48 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2caced6038eso10598365ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 03:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785839626; x=1786444426; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vTXDHsnwFlbf3g77LNyPYkdxcBB8Zd+YWsg2JPpDVpU=;
        b=Dv5NAu/03960KvQjdn0CHJoGMGJWVv7EQiVbrKM2/icUsEGJRUKfzSpTtNehsoNpIM
         likB77ltDQ54Vg9EMihee/+M+7jbuZV9x/UhByX7TRuaZtmww2DC7Q6XlbFAZHEEf5RQ
         nkSGdYsbXtYdYom1M8cduxF6nD5WXailpz4GGX/TBudaS6XvxFEw1pjjOk6m5sYWh+Gq
         A1Aw2zoMYfgkLZ7uVWjTntMlnNZFha1dZWELgYE0td3dhAmRcZQARn0Vlm0/Cqf9cVJS
         Po3Ziq7cVNiLz4sLkT9xQ9mxARoDY7G6ArO2jSb3ZFiAuH01FiAKjLfBdSg7GZFJZdTZ
         QKiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785839626; x=1786444426;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vTXDHsnwFlbf3g77LNyPYkdxcBB8Zd+YWsg2JPpDVpU=;
        b=JOabzYF1vZPzUKuE9flVDRnOyYPnnJd8WbZNKrlP+kde0QPw2Bt42E9hVxrwCfEJPc
         EWA0Uqz8DtnemfGOp17PViEWjPXqNNNrjyizwBWsPvnS7MfT8olorc5uUwKgSPMOxwK5
         1ZhDpa8Xb9CbHLeL0NwyJR24Zl/fzi6QCQkQoWvkEa+B9Vd/lNBkci7bqDCPJjC/ZS7X
         DW6Nh0WWqKubUhWthYb9+KRvWE2+9noEdNYCl4LxNUnQJ+AlKJhKuLJMqIwSKH+GkXAE
         GHE9qjYNAJSPqhPJ+CJ7xgDsxnKqKi13598NA/wvv2EBpaNOTdjdieGgdC3gBbaw8Y8M
         orFA==
X-Forwarded-Encrypted: i=1; AHgh+RoTMA2QNFQL3d+5AB1U1WSJGezpvEntATfvJor8v97TSxzrGk9FtB5OO48EmFK2IA6Ud03hslWBwKAmpeWr1+o0@lists.infradead.org
X-Gm-Message-State: AOJu0YztzJtzD5VXEzAqgTd2H0fhiubdSKAqrFiysqLRzlmsW877uDeP
	ML9Qo/DXj92dOL8Ue0azS4EEXkBleJVJrefj5vNvZ2p2wMlIoIx8y5gh
X-Gm-Gg: AR+sD13qzo/WPw3HQQsXLlLFUzfh4yZbekKtWLSWVO3+2jWXJHXh6/luIxL5wwQS8OE
	/NVAWafY+LEMSE5VK+V2hw37u6aW0EfUFRhQ7V7h9UK44pyQPlomygp2Q73BNWkkSOxENM/j377
	BGKhj7LbHT5UnY+wVdrxhi3dEklzbpysBzKtMA07C0XbFkPrUU00rhJkbZx3c5guSiK5zO3u9L8
	RAvtMyaYVVjiQmF9hSkgBo28+kKkQr1fKxKAA0Rd9s36+lND8cINbEkgL3IVM2Yfg5k6gFLMSdM
	WuAKcYaB0zLnGEAp28BcxXhKSd2slYwyKPcNaSVsvFZK5WW5PkCoN21MnK5wikYrsxEDxD6Cp/U
	GfnY1ydmR37zGNZsoP11JzOiEh1bRWhS7wewCW35Apk8PmUgaavzM3HHb+QDLji5M7fvkr1Ard+
	sdlY1TUcsff5n8/TM4JGXktcaBsCx04Un51StZ8U0CIg+kAvctKfdNKZG178rZptAHHPA/
X-Received: by 2002:a17:903:98f:b0:2cf:461a:3863 with SMTP id d9443c01a7336-2d08ab8bec3mr29565945ad.22.1785839625772;
        Tue, 04 Aug 2026 03:33:45 -0700 (PDT)
Received: from DESKTOP-TIT0J8O.dm.ae ([49.47.198.15])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3158676f579sm2955011eec.20.2026.08.04.03.33.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 03:33:45 -0700 (PDT)
From: Ahmed Naseef <naseefkm@gmail.com>
To: netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
	Andrew Lunn <andrew@lunn.ch>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Eric Dumazet <edumazet@google.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Qingfang Deng <dqfext@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Ahmed Naseef <naseefkm@gmail.com>
Subject: [PATCH net-next] net: phy: mediatek: add EcoNet EN7528 PHY support
Date: Tue,  4 Aug 2026 14:33:21 +0400
Message-Id: <20260804103321.3331802-1-naseefkm@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_033347_425566_DEE907EE 
X-CRM114-Status: GOOD (  23.01  )
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

The EcoNet EN7528 MIPS SoC embeds four Gigabit Ethernet PHYs (PHY ID
0x03a29491) behind its built-in MT7530 switch. They use the same LED
register layout as the other SoC PHYs handled by this driver, but their
LED controller powers up with its external control disabled, so the LED
pins stay dark regardless of what is programmed into the LED control
registers.

Add a phy_driver entry for it, modelled on the Airoha AN7583 one. Its
config_init callback enables the LED controller through the LED basic
control register, which this driver does not program for its other
PHYs, but which the air_en8811h driver already handles as
AIR_PHY_LED_BCR. LED behaviour is then controlled through the phylib
LED operations shared with the other PHYs of this driver.

The LED block is shared by the four PHYs of the EN7528: the LED
configuration programmed through any one of them applies to all four,
while each PHY still drives its own LED pin from its own link state.

The EN7528 PHYs need no efuse calibration data, so relax the
MEDIATEK_GE_SOC_PHY dependencies to allow building the driver on the
ECONET platform.

Signed-off-by: Ahmed Naseef <naseefkm@gmail.com>
---
 drivers/net/phy/mediatek/Kconfig      |  8 ++++--
 drivers/net/phy/mediatek/mtk-ge-soc.c | 35 +++++++++++++++++++++++++++
 2 files changed, 41 insertions(+), 2 deletions(-)

diff --git a/drivers/net/phy/mediatek/Kconfig b/drivers/net/phy/mediatek/Kconfig
index bb7dc876271e..b6d41bbbbc27 100644
--- a/drivers/net/phy/mediatek/Kconfig
+++ b/drivers/net/phy/mediatek/Kconfig
@@ -23,9 +23,9 @@ config MEDIATEK_GE_PHY
 
 config MEDIATEK_GE_SOC_PHY
 	tristate "MediaTek SoC Ethernet PHYs"
-	depends on ARM64 || COMPILE_TEST
+	depends on ARM64 || ECONET || COMPILE_TEST
 	depends on ARCH_AIROHA || (ARCH_MEDIATEK && NVMEM_MTK_EFUSE) || \
-		   COMPILE_TEST
+		   ECONET || COMPILE_TEST
 	select MTK_NET_PHYLIB
 	select PHY_PACKAGE
 	help
@@ -36,5 +36,9 @@ config MEDIATEK_GE_SOC_PHY
 	  present in the SoCs efuse and will dynamically calibrate VCM
 	  (common-mode voltage) during startup.
 
+	  Also include support for the built-in Gigabit Ethernet PHYs of
+	  the Airoha AN7581 and AN7583 SoCs and of the EcoNet EN7528 SoC,
+	  which need no efuse calibration data.
+
 config MTK_NET_PHYLIB
 	tristate
diff --git a/drivers/net/phy/mediatek/mtk-ge-soc.c b/drivers/net/phy/mediatek/mtk-ge-soc.c
index 9a54949644d5..0041300d4f10 100644
--- a/drivers/net/phy/mediatek/mtk-ge-soc.c
+++ b/drivers/net/phy/mediatek/mtk-ge-soc.c
@@ -16,6 +16,7 @@
 
 #define MTK_GPHY_ID_MT7981			0x03a29461
 #define MTK_GPHY_ID_MT7988			0x03a29481
+#define MTK_GPHY_ID_EN7528			0x03a29491
 #define MTK_GPHY_ID_AN7581			0x03a294c1
 #define MTK_GPHY_ID_AN7583			0xc0ff0420
 
@@ -320,6 +321,14 @@
 /* Registers on MDIO_MMD_VEND2 */
 #define MTK_PHY_LED1_DEFAULT_POLARITIES		BIT(1)
 
+/* LED basic control register, part of the same LED block as the LED0/LED1
+ * control registers above. The air_en8811h driver describes the same
+ * register as AIR_PHY_LED_BCR.
+ */
+#define MTK_PHY_LED_BCR				0x21
+#define   MTK_PHY_LED_BCR_CLK_EN		BIT(3)
+#define   MTK_PHY_LED_BCR_EXT_CTRL		BIT(15)
+
 #define MTK_PHY_RG_BG_RASEL			0x115
 #define   MTK_PHY_RG_BG_RASEL_MASK		GENMASK(2, 0)
 
@@ -1470,6 +1479,19 @@ static int an7583_phy_config_init(struct phy_device *phydev)
 	return phy_clear_bits(phydev, MII_BMCR, BMCR_PDOWN);
 }
 
+static int en7528_phy_config_init(struct phy_device *phydev)
+{
+	/* The LED controller of the EN7528 powers up with its external
+	 * control disabled, leaving the LED pins dark regardless of what is
+	 * programmed into the LED control registers. Hand the pins over to
+	 * the LED control registers the same way the air_en8811h driver
+	 * does; the mode field of this register is already set out of reset.
+	 */
+	return phy_set_bits_mmd(phydev, MDIO_MMD_VEND2, MTK_PHY_LED_BCR,
+				MTK_PHY_LED_BCR_CLK_EN |
+				MTK_PHY_LED_BCR_EXT_CTRL);
+}
+
 static struct phy_driver mtk_socphy_driver[] = {
 	{
 		PHY_ID_MATCH_EXACT(MTK_GPHY_ID_MT7981),
@@ -1505,6 +1527,18 @@ static struct phy_driver mtk_socphy_driver[] = {
 		.led_hw_control_set = mt798x_phy_led_hw_control_set,
 		.led_hw_control_get = mt798x_phy_led_hw_control_get,
 	},
+	{
+		PHY_ID_MATCH_EXACT(MTK_GPHY_ID_EN7528),
+		.name		= "EcoNet EN7528 PHY",
+		.config_init	= en7528_phy_config_init,
+		.probe		= an7581_phy_probe,
+		.led_blink_set	= mt798x_phy_led_blink_set,
+		.led_brightness_set = mt798x_phy_led_brightness_set,
+		.led_hw_is_supported = mt798x_phy_led_hw_is_supported,
+		.led_hw_control_set = mt798x_phy_led_hw_control_set,
+		.led_hw_control_get = mt798x_phy_led_hw_control_get,
+		.led_polarity_set = an7581_phy_led_polarity_set,
+	},
 	{
 		PHY_ID_MATCH_EXACT(MTK_GPHY_ID_AN7581),
 		.name		= "Airoha AN7581 PHY",
@@ -1537,6 +1571,7 @@ module_phy_driver(mtk_socphy_driver);
 static const struct mdio_device_id __maybe_unused mtk_socphy_tbl[] = {
 	{ PHY_ID_MATCH_EXACT(MTK_GPHY_ID_MT7981) },
 	{ PHY_ID_MATCH_EXACT(MTK_GPHY_ID_MT7988) },
+	{ PHY_ID_MATCH_EXACT(MTK_GPHY_ID_EN7528) },
 	{ PHY_ID_MATCH_EXACT(MTK_GPHY_ID_AN7581) },
 	{ PHY_ID_MATCH_EXACT(MTK_GPHY_ID_AN7583) },
 	{ }

base-commit: 5b4f243f78a533abf414bfd96325aa2c96e711a3
-- 
2.34.1


