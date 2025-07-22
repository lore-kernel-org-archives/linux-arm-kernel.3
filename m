Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E0AAC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 13:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vtMnJ3uUwodflHJFFlKGk/JI5u3JqoUCRBSvwdaFAwM=; b=xTbakoP9KyoAVu1jiHl/T7Mc9Q
	3+yZskHPPYPSkysArnxqjE2bsiXkDLRIb5iED/Gv2xPgVH5exwYLIVtkyOty8SXzZr2wo/Rn7sAOo
	Bl2yeQJ9iq4FS1kozHgoBk1KPNfKhlnsvuP3wbNU7QDL0k6myTTrrokrAoB+eBXke6BMlVh2yl6WT
	ZUhxPQOeHiZoZcBcQlcSnB+XSD6m8kTlqe5TYO9s3zwS9+cCvGuqOBSCXt2YG5BPG7Z81+G8pDMEB
	tp/E60y3udlMuMO7XjY83FWzcYNo4D82ghgDk+Xzk1K6gYT8tPYFjjpEPeimOEjRe8ObmQzzJv8qR
	9lyS53wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueDKj-00000002aaT-1nKu;
	Tue, 22 Jul 2025 13:47:05 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueCHC-00000002SLq-3loP;
	Tue, 22 Jul 2025 12:39:24 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4563a57f947so14820005e9.1;
        Tue, 22 Jul 2025 05:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753187961; x=1753792761; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vtMnJ3uUwodflHJFFlKGk/JI5u3JqoUCRBSvwdaFAwM=;
        b=fmwv5z6N6XW57TL+4Fn3RF9K6T+qUmg3FBMP9juMhisOs9nTgRcztwThDOKcTsmNIG
         aMumWu9/e5kih5bReW8JYj921BgbM3DiE345PXe7/cvqcJaKocG//Yiuhmsplug8WfSH
         cR7ETwZEG7mcD/nTZy3z7DIE3jt5jwLCs4HRhcBWob8eIL+8FXLlt9ejmBAYTiHI44Ag
         VNXqbKB4cw6F+H8Kwik0gCey4LwJf/AWFxcAuWRi2fGDzKQ8IyOSHJexoBunqXCzkyn/
         WJFEjh36vcqfNDZ0GiuQ0xTfUzp5rHxXT6qp/ctta/VjVeAXp2Ig9NK58HAMYdrn2cZj
         VWdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753187961; x=1753792761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vtMnJ3uUwodflHJFFlKGk/JI5u3JqoUCRBSvwdaFAwM=;
        b=LHa/atCprUsYm3cJACswFvtLeASJTW5b5HPmzOLM+JtLNceo5SaCqVGcZEn0wVxhT4
         DSsuKVWSQS170PfUhCXtQGyFT9rE/+XeJl/G64BYPijJScGlFBAokIVPmSGbkDQRPLt0
         5sRM+nAQF71f80kmFqP5UOmFO4fmoBONTYHeC2yPMp8mIp2uWsJZsdyW4Kjtp/Zm9GEW
         8ZTbelGbhmCrv4XDPko/X36lkjq1asBzqG/VY/3zdISfooIRUElr582FfyU0WORq3YP4
         KWqJOV95DipHoFAyM1lFZT4pnlvbtUEmeV6v0VQthnF7dsdnL6caFWI0rMTHwjTAvz8l
         dBEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkAFuuTSzwMzj2JTdafNbj2r2Is4JGOacRMtKJBgyRNwvaNJIQ+8ppSHLzpK3xan1Ufa2iEvK8aHRgZmv6nNFp@lists.infradead.org
X-Gm-Message-State: AOJu0YwvggQeMxkEJN5X+LerxXARgeWYz57/eubS5CbYdLxeHSPnSO4E
	KPwWfcyeFhxOeKfezJSTZAXn6up6Q9iwhfqlcb3DWyWoWnQ5iFiN4GlE+q72ZfijeoaThg==
X-Gm-Gg: ASbGncseDLiQRKCnRxfptGVGEurKqeHz9w8ZcQzA9/1S+/lry+ZB1RlyaqYczxAnBz4
	1cx3WCSAqfcnv24sFH6lH+MquTSpvSsqDwD6lSci3bXOl/9Kvs35b++SBOuRtShCxutAquWLHH7
	wwACs3wJdjgv8NW8VlZ4vpVquQXRqX6QKTCAPlBLb934yDl1LLNi0birUPHPHT1s24mROxL6auY
	sAaTJ6YmnbMBbnMToF3Gd6NZbVFjOurSf1BIspP0VqLtgowYJX2OWgTR/tT/KE8vyiPnfhZXGFX
	7ZUfYUZwBL8/hCCWn9n9VGSvsdDDo9NNg9/K+fVk0cdvghqdhgff7HQDcgkKtL9syWVKtbdNiGU
	gys1zbUOHeO5d2UabOx0M5rpMeNM=
X-Google-Smtp-Source: AGHT+IEv2D/7ec/rTGWt3jjQROaUegwhzESJSw8dm1OmMUKlQciWDCuJo8K61wEszR6lzLKX8vPrNA==
X-Received: by 2002:a5d:5d83:0:b0:3a3:6478:e08 with SMTP id ffacd0b85a97d-3b7634c8312mr2569325f8f.23.1753187960828;
        Tue, 22 Jul 2025 05:39:20 -0700 (PDT)
Received: from tearch ([46.104.48.188])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca48c40sm13525197f8f.58.2025.07.22.05.39.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 05:39:19 -0700 (PDT)
From: muhammed.efecetin.67@gmail.com
X-Google-Original-From: muhammed.efecetin67@gmail.com
To: linux-rockchip@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	heiko@sntech.de,
	neil.armstrong@linaro.org,
	lee@kernel.org,
	rafael@kernel.org,
	efectn@protonmail.com,
	daniel.lezcano@linaro.org
Subject: [PATCH v2 3/5] mfd: add Khadas Edge 2 registers to khadas-mcu.
Date: Tue, 22 Jul 2025 15:38:13 +0300
Message-ID: <41993cb8130fc206ee6820866154baef7db804e8.1753179491.git.efectn@protonmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1753179491.git.efectn@protonmail.com>
References: <cover.1753179491.git.efectn@protonmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_053922_944135_BF671A06 
X-CRM114-Status: GOOD (  16.32  )
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

From: Muhammed Efe Cetin <efectn@protonmail.com>

Add Khadas Edge 2 MCU registers to khadas-mcu.h with KHADAS_MCU_V2 register.
New "khadas,mcu-v2" compatible added as it is quite different compared to older MCU variants
and there are no way to distinguish them using any register.

Signed-off-by: Muhammed Efe Cetin <efectn@protonmail.com>
---
 drivers/mfd/khadas-mcu.c       | 45 ++++++++++++++++++++++++++++++++--
 include/linux/mfd/khadas-mcu.h | 32 ++++++++++++++++++++++++
 2 files changed, 75 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/khadas-mcu.c b/drivers/mfd/khadas-mcu.c
index ca4bd6cf5..bc94de51d 100644
--- a/drivers/mfd/khadas-mcu.c
+++ b/drivers/mfd/khadas-mcu.c
@@ -32,6 +32,20 @@ static bool khadas_mcu_reg_volatile(struct device *dev, unsigned int reg)
 	}
 }
 
+static bool khadas_mcu_reg_volatile_v2(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case KHADAS_MCU_V2_SLEEP_EN_REG:
+	case KHADAS_MCU_V2_LED_ON_RAM_REG:
+	case KHADAS_MCU_V2_FAN_CTRL_REG:
+	case KHADAS_MCU_V2_WDT_EN_REG:
+	case KHADAS_MCU_V2_SYS_RST_REG:
+		return true;
+	default:
+		return false;
+	}
+}
+
 static bool khadas_mcu_reg_writeable(struct device *dev, unsigned int reg)
 {
 	switch (reg) {
@@ -65,6 +79,17 @@ static bool khadas_mcu_reg_writeable(struct device *dev, unsigned int reg)
 	}
 }
 
+static bool khadas_mcu_reg_writeable_v2(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case KHADAS_MCU_V2_VERSION1_REG:
+	case KHADAS_MCU_V2_VERSION2_REG:
+		return false;
+	default:
+		return true;
+	}
+}
+
 static const struct regmap_config khadas_mcu_regmap_config = {
 	.reg_bits	= 8,
 	.reg_stride	= 1,
@@ -75,8 +100,18 @@ static const struct regmap_config khadas_mcu_regmap_config = {
 	.cache_type	= REGCACHE_MAPLE,
 };
 
+static const struct regmap_config khadas_mcu_regmap_config_v2 = {
+	.reg_bits	= 8,
+	.reg_stride	= 1,
+	.val_bits	= 8,
+	.max_register	= KHADAS_MCU_V2_SYS_RST_REG,
+	.volatile_reg	= khadas_mcu_reg_volatile_v2,
+	.writeable_reg	= khadas_mcu_reg_writeable_v2,
+	.cache_type	= REGCACHE_MAPLE,
+};
+
 static struct mfd_cell khadas_mcu_fan_cells[] = {
-	/* VIM1/2 Rev13+ and VIM3 only */
+	/* VIM1/2 Rev13+, VIM3 and Edge2 only */
 	{ .name = "khadas-mcu-fan-ctrl", },
 };
 
@@ -84,6 +119,7 @@ static int khadas_mcu_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
 	struct khadas_mcu *ddata;
+	const struct regmap_config *regmap_config;
 	int ret;
 
 	ddata = devm_kzalloc(dev, sizeof(*ddata), GFP_KERNEL);
@@ -94,7 +130,11 @@ static int khadas_mcu_probe(struct i2c_client *client)
 
 	ddata->dev = dev;
 
-	ddata->regmap = devm_regmap_init_i2c(client, &khadas_mcu_regmap_config);
+	if (of_device_is_compatible(dev->of_node, "khadas,mcu-v2"))
+		regmap_config = &khadas_mcu_regmap_config_v2;
+	else
+		regmap_config = &khadas_mcu_regmap_config;
+	ddata->regmap = devm_regmap_init_i2c(client, regmap_config);
 	if (IS_ERR(ddata->regmap)) {
 		ret = PTR_ERR(ddata->regmap);
 		dev_err(dev, "Failed to allocate register map: %d\n", ret);
@@ -113,6 +153,7 @@ static int khadas_mcu_probe(struct i2c_client *client)
 #ifdef CONFIG_OF
 static const struct of_device_id khadas_mcu_of_match[] = {
 	{ .compatible = "khadas,mcu", },
+	{ .compatible = "khadas,mcu-v2", },
 	{},
 };
 MODULE_DEVICE_TABLE(of, khadas_mcu_of_match);
diff --git a/include/linux/mfd/khadas-mcu.h b/include/linux/mfd/khadas-mcu.h
index a99ba2ed0..077f18b52 100644
--- a/include/linux/mfd/khadas-mcu.h
+++ b/include/linux/mfd/khadas-mcu.h
@@ -10,6 +10,7 @@
 #ifndef MFD_KHADAS_MCU_H
 #define MFD_KHADAS_MCU_H
 
+/* Registers used by Khadas VIM2 rev14 and VIM3 */
 #define KHADAS_MCU_PASSWD_VEN_0_REG		0x00 /* RO */
 #define KHADAS_MCU_PASSWD_VEN_1_REG		0x01 /* RO */
 #define KHADAS_MCU_PASSWD_VEN_2_REG		0x02 /* RO */
@@ -70,12 +71,43 @@
 #define KHADAS_MCU_WOL_INIT_START_REG		0x87 /* WO */
 #define KHADAS_MCU_CMD_FAN_STATUS_CTRL_REG	0x88 /* WO */
 
+/* Registers used by Khadas Edge 2 */
+#define KHADAS_MCU_V2_VERSION1_REG             0x12  /* RO */
+#define KHADAS_MCU_V2_VERSION2_REG             0x13  /* RO */
+#define KHADAS_MCU_V2_BOOT_MODE_REG            0x20  /* RW */
+#define KHADAS_MCU_V2_BOOT_EN_DCIN_REG         0x21  /* RW */
+#define KHADAS_MCU_V2_BOOT_EN_RTC_REG          0x22  /* RW */
+#define KHADAS_MCU_V2_LED_MODE_ON_REG          0x23  /* RW */
+#define KHADAS_MCU_V2_LED_MODE_OFF_REG         0x24  /* RW */
+#define KHADAS_MCU_V2_RGB_ON_R_REG             0x25  /* RW */
+#define KHADAS_MCU_V2_RGB_ON_G_REG             0x26  /* RW */
+#define KHADAS_MCU_V2_RGB_ON_B_REG             0x27  /* RW */
+#define KHADAS_MCU_V2_RGB_OFF_R_REG            0x28  /* RW */
+#define KHADAS_MCU_V2_RGB_OFF_G_REG            0x29  /* RW */
+#define KHADAS_MCU_V2_RGB_OFF_B_REG            0x2A  /* RW */
+#define KHADAS_MCU_V2_REST_CONF_REG            0x2C  /* WO */
+#define KHADAS_MCU_V2_SLEEP_EN_REG             0x2E  /* RW */
+#define KHADAS_MCU_V2_BOOT_EN_IR_REG           0x2F  /* RW */
+#define KHADAS_MCU_V2_IR1_CUST1_REG            0x30  /* RW */
+#define KHADAS_MCU_V2_IR1_CUST2_REG            0x31  /* RW */
+#define KHADAS_MCU_V2_IR1_ORDER1_REG           0x32  /* RW */
+#define KHADAS_MCU_V2_IR1_ORDER2_REG           0x33  /* RW */
+#define KHADAS_MCU_V2_IR2_CUST1_REG            0x34  /* RW */
+#define KHADAS_MCU_V2_IR2_CUST2_REG            0x35  /* RW */
+#define KHADAS_MCU_V2_IR2_ORDER1_REG           0x36  /* RW */
+#define KHADAS_MCU_V2_IR2_ORDER2_REG           0x37  /* RW */
+#define KHADAS_MCU_V2_LED_ON_RAM_REG           0x89  /* WO */
+#define KHADAS_MCU_V2_FAN_CTRL_REG             0x8A  /* WO */
+#define KHADAS_MCU_V2_WDT_EN_REG               0x8B  /* WO */
+#define KHADAS_MCU_V2_SYS_RST_REG              0x91  /* WO */
+
 enum {
 	KHADAS_BOARD_VIM1 = 0x1,
 	KHADAS_BOARD_VIM2,
 	KHADAS_BOARD_VIM3,
 	KHADAS_BOARD_EDGE = 0x11,
 	KHADAS_BOARD_EDGE_V,
+	KHADAS_BOARD_EDGE2,
 };
 
 /**
-- 
2.50.1


