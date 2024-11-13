Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD40BD41C19
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 09:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ld7yDh/rdIKbceKp3UE/TIwrk3Cz4ygz3PEsoFCVyOQ=; b=aCNbwAezm41j5bz7oTum+HDzqY
	9qusNUbWi89MgEX/LPBhsYGUlRYfDI8fc79XxzjtrRAD+NGAUaoqD4cFj/+aCn8apqcfDwh5K7cJr
	igDNZOpZ4sefgAbqoq2aqKAJU1NGuqdnLey3s8V0DSgF4DzTxsxmv7UjSPP6r0wvPAy3r8lmcY4dR
	PIkuJtFaw1F0KeqA/uz+cqdwYCFmX3xzx/KoB16jCD8180hTfjwawbnrJ+gDR/2AhRsB/FXmW3ULv
	mv1ym2eqfRQky5pimy0sPkhCRKq5lxWv5iX5IpcL1JvHurSwiOKKc7CmfSRcTAw09FMiqcg3qd43z
	23JaREBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tB9JR-00000006BN2-1wqw;
	Wed, 13 Nov 2024 09:05:21 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tB992-000000069tl-2heX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Nov 2024 08:54:38 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-7eab7622b61so4482858a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Nov 2024 00:54:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nigauri-org.20230601.gappssmtp.com; s=20230601; t=1731488075; x=1732092875; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ld7yDh/rdIKbceKp3UE/TIwrk3Cz4ygz3PEsoFCVyOQ=;
        b=efD3W1g2OeChX7qEY4BFFHq1azVyFELI2ftA2WuubJ2pUJmOC0AKRv/JGgKIcwyE/V
         rdYkOdvtiUqxhVnyfykTg2ZaSpmTmGfqYVbnWEunAHIsswamBAbM36LRtpZhvZ73YWXk
         MXRKdGEfN3BqunwL7uwHLx07F4VoJ4IoSiJq7s9uzsIpjqw0J0oc15YrKsglvu2lzmlb
         1e1MIZcw3B1cORxtAMdDHWrJsbhowThV+eFMMvuT/Ky7WCBRVyzEkdxRGJtCQdgTmM7a
         RqmyQZvNwsIKMBaAYvaY49GwsO18Flg6O5tIP2t82SstLEavj2RXwIsO++na3DsXngqi
         RAhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731488075; x=1732092875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ld7yDh/rdIKbceKp3UE/TIwrk3Cz4ygz3PEsoFCVyOQ=;
        b=fMGeudrGoDaDBeO8YAoNCW28yadEZkn+OJBb2aS+oq6TcDoPac9HgujUVAHAnJhp0Q
         w08ZVe2hnKCMgOTM3RT+e10qD6kSr2+3N4Zp5Ml6Xh1l3/vfb+AOhA7r1RZ0GGlKNSHJ
         TXJljHj71jb03Nn306vm46bnWGJPvl6ci7TYujtMnQ65pENRLZGmGWEjvNstQgzJiGUL
         7/RqEVoP7HJEthvDJf8NxKg5YOXscAI/O8mOMpy3V2CafqPnRfEiZJvn18byyJzIT/0k
         8Fq1vsKienF6M16qshEEofEBVEdWkV02sS6uQYWG+4oNu9F0Hr/IGhKe/1AbArmv3X6M
         Nmqw==
X-Forwarded-Encrypted: i=1; AJvYcCXTNvcW5/yBL+k/DvVE+XV+qUES18MJ3kmfwX9/PoZEAazWKfnVLJNnsJAgzE2y0gNmBNpFVC0tFNIxJikDJ16J@lists.infradead.org
X-Gm-Message-State: AOJu0Yytcb+KLQqFL39piYVrhy+6OEfkG3eJhFGOckQtEfKyNTuWp3vV
	seVZO4cRglwwe4UFYGFV5zI9+To0t3pRpKxvpzLMVzHN2jsNdMc+dTwCjTZ5
X-Google-Smtp-Source: AGHT+IEWh+6hi6eoqQxQEdQASLkni2BgGzn3U61O+GlCzEH64eUMCo6fHSgXH8x3OBdiPpmftG/ikA==
X-Received: by 2002:a05:6a20:6a26:b0:1dc:30b:324c with SMTP id adf61e73a8af0-1dc22893561mr30257221637.7.1731488075527;
        Wed, 13 Nov 2024 00:54:35 -0800 (PST)
Received: from localhost ([2405:6581:5360:1800:a83:68dd:5f1c:4ed9])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7f41f48abbdsm11998250a12.10.2024.11.13.00.54.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 00:54:34 -0800 (PST)
From: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
To: linux-rtc@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>
Cc: linux-amlogic@lists.infradead.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-kernel@vger.kernel.org,
	Heiko Stuebner <heiko@sntech.de>,
	Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Subject: [PATCH 4/5] rtc: Remove HYM8563 RTC driver
Date: Wed, 13 Nov 2024 17:53:54 +0900
Message-ID: <20241113085355.1972607-5-iwamatsu@nigauri.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241113085355.1972607-1-iwamatsu@nigauri.org>
References: <20241113085355.1972607-1-iwamatsu@nigauri.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_005436_737006_DEA98ED3 
X-CRM114-Status: GOOD (  24.39  )
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

The HYM8563 RTC device can work with pcf8563 driver.
This removes and updates files related to RTC HYM8563.

Signed-off-by: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
---
 arch/arm/configs/multi_v7_defconfig |   1 -
 arch/arm64/configs/defconfig        |   1 -
 drivers/rtc/Kconfig                 |  11 -
 drivers/rtc/Makefile                |   1 -
 drivers/rtc/rtc-hym8563.c           | 587 ----------------------------
 5 files changed, 601 deletions(-)
 delete mode 100644 drivers/rtc/rtc-hym8563.c

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 139b1c6fa656fa..1758f33d5582e8 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -988,7 +988,6 @@ CONFIG_RTC_CLASS=y
 CONFIG_RTC_DRV_AC100=y
 CONFIG_RTC_DRV_AS3722=y
 CONFIG_RTC_DRV_DS1307=y
-CONFIG_RTC_DRV_HYM8563=m
 CONFIG_RTC_DRV_MAX8907=y
 CONFIG_RTC_DRV_MAX8998=m
 CONFIG_RTC_DRV_MAX8997=m
diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 5fdbfea7a5b295..0c1eb5d064a7dc 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1190,7 +1190,6 @@ CONFIG_EDAC_GHES=y
 CONFIG_EDAC_LAYERSCAPE=m
 CONFIG_RTC_CLASS=y
 CONFIG_RTC_DRV_DS1307=m
-CONFIG_RTC_DRV_HYM8563=m
 CONFIG_RTC_DRV_MAX77686=y
 CONFIG_RTC_DRV_RK808=m
 CONFIG_RTC_DRV_ISL1208=m
diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index a60bcc791a4803..13701b4c3572ae 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -316,17 +316,6 @@ config RTC_DRV_DS1672
 	  This driver can also be built as a module. If so, the module
 	  will be called rtc-ds1672.
 
-config RTC_DRV_HYM8563
-	tristate "Haoyu Microelectronics HYM8563"
-	depends on OF
-	help
-	  Say Y to enable support for the HYM8563 I2C RTC chip. Apart
-	  from the usual rtc functions it provides a clock output of
-	  up to 32kHz.
-
-	  This driver can also be built as a module. If so, the module
-	  will be called rtc-hym8563.
-
 config RTC_DRV_LP8788
 	tristate "TI LP8788 RTC driver"
 	depends on MFD_LP8788
diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
index 489b4ab07068c7..91e8244072a66b 100644
--- a/drivers/rtc/Makefile
+++ b/drivers/rtc/Makefile
@@ -73,7 +73,6 @@ obj-$(CONFIG_RTC_DRV_FTRTC010)	+= rtc-ftrtc010.o
 obj-$(CONFIG_RTC_DRV_GENERIC)	+= rtc-generic.o
 obj-$(CONFIG_RTC_DRV_GOLDFISH)	+= rtc-goldfish.o
 obj-$(CONFIG_RTC_DRV_HID_SENSOR_TIME) += rtc-hid-sensor-time.o
-obj-$(CONFIG_RTC_DRV_HYM8563)	+= rtc-hym8563.o
 obj-$(CONFIG_RTC_DRV_IMXDI)	+= rtc-imxdi.o
 obj-$(CONFIG_RTC_DRV_IMX_SC)	+= rtc-imx-sc.o
 obj-$(CONFIG_RTC_DRV_IMX_BBM_SCMI)	+= rtc-imx-sm-bbm.o
diff --git a/drivers/rtc/rtc-hym8563.c b/drivers/rtc/rtc-hym8563.c
deleted file mode 100644
index 63f11ea3589d64..00000000000000
--- a/drivers/rtc/rtc-hym8563.c
+++ /dev/null
@@ -1,587 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Haoyu HYM8563 RTC driver
- *
- * Copyright (C) 2013 MundoReader S.L.
- * Author: Heiko Stuebner <heiko@sntech.de>
- *
- * based on rtc-HYM8563
- * Copyright (C) 2010 ROCKCHIP, Inc.
- */
-
-#include <linux/module.h>
-#include <linux/clk-provider.h>
-#include <linux/i2c.h>
-#include <linux/bcd.h>
-#include <linux/rtc.h>
-
-#define HYM8563_CTL1		0x00
-#define HYM8563_CTL1_TEST	BIT(7)
-#define HYM8563_CTL1_STOP	BIT(5)
-#define HYM8563_CTL1_TESTC	BIT(3)
-
-#define HYM8563_CTL2		0x01
-#define HYM8563_CTL2_TI_TP	BIT(4)
-#define HYM8563_CTL2_AF		BIT(3)
-#define HYM8563_CTL2_TF		BIT(2)
-#define HYM8563_CTL2_AIE	BIT(1)
-#define HYM8563_CTL2_TIE	BIT(0)
-
-#define HYM8563_SEC		0x02
-#define HYM8563_SEC_VL		BIT(7)
-#define HYM8563_SEC_MASK	0x7f
-
-#define HYM8563_MIN		0x03
-#define HYM8563_MIN_MASK	0x7f
-
-#define HYM8563_HOUR		0x04
-#define HYM8563_HOUR_MASK	0x3f
-
-#define HYM8563_DAY		0x05
-#define HYM8563_DAY_MASK	0x3f
-
-#define HYM8563_WEEKDAY		0x06
-#define HYM8563_WEEKDAY_MASK	0x07
-
-#define HYM8563_MONTH		0x07
-#define HYM8563_MONTH_CENTURY	BIT(7)
-#define HYM8563_MONTH_MASK	0x1f
-
-#define HYM8563_YEAR		0x08
-
-#define HYM8563_ALM_MIN		0x09
-#define HYM8563_ALM_HOUR	0x0a
-#define HYM8563_ALM_DAY		0x0b
-#define HYM8563_ALM_WEEK	0x0c
-
-/* Each alarm check can be disabled by setting this bit in the register */
-#define HYM8563_ALM_BIT_DISABLE	BIT(7)
-
-#define HYM8563_CLKOUT		0x0d
-#define HYM8563_CLKOUT_ENABLE	BIT(7)
-#define HYM8563_CLKOUT_32768	0
-#define HYM8563_CLKOUT_1024	1
-#define HYM8563_CLKOUT_32	2
-#define HYM8563_CLKOUT_1	3
-#define HYM8563_CLKOUT_MASK	3
-
-#define HYM8563_TMR_CTL		0x0e
-#define HYM8563_TMR_CTL_ENABLE	BIT(7)
-#define HYM8563_TMR_CTL_4096	0
-#define HYM8563_TMR_CTL_64	1
-#define HYM8563_TMR_CTL_1	2
-#define HYM8563_TMR_CTL_1_60	3
-#define HYM8563_TMR_CTL_MASK	3
-
-#define HYM8563_TMR_CNT		0x0f
-
-struct hym8563 {
-	struct i2c_client	*client;
-	struct rtc_device	*rtc;
-#ifdef CONFIG_COMMON_CLK
-	struct clk_hw		clkout_hw;
-#endif
-};
-
-/*
- * RTC handling
- */
-
-static int hym8563_rtc_read_time(struct device *dev, struct rtc_time *tm)
-{
-	struct i2c_client *client = to_i2c_client(dev);
-	u8 buf[7];
-	int ret;
-
-	ret = i2c_smbus_read_i2c_block_data(client, HYM8563_SEC, 7, buf);
-	if (ret < 0)
-		return ret;
-
-	if (buf[0] & HYM8563_SEC_VL) {
-		dev_warn(&client->dev,
-			 "no valid clock/calendar values available\n");
-		return -EINVAL;
-	}
-
-	tm->tm_sec = bcd2bin(buf[0] & HYM8563_SEC_MASK);
-	tm->tm_min = bcd2bin(buf[1] & HYM8563_MIN_MASK);
-	tm->tm_hour = bcd2bin(buf[2] & HYM8563_HOUR_MASK);
-	tm->tm_mday = bcd2bin(buf[3] & HYM8563_DAY_MASK);
-	tm->tm_wday = bcd2bin(buf[4] & HYM8563_WEEKDAY_MASK); /* 0 = Sun */
-	tm->tm_mon = bcd2bin(buf[5] & HYM8563_MONTH_MASK) - 1; /* 0 = Jan */
-	tm->tm_year = bcd2bin(buf[6]) + 100;
-
-	return 0;
-}
-
-static int hym8563_rtc_set_time(struct device *dev, struct rtc_time *tm)
-{
-	struct i2c_client *client = to_i2c_client(dev);
-	u8 buf[7];
-	int ret;
-
-	/* Years >= 2100 are to far in the future, 19XX is to early */
-	if (tm->tm_year < 100 || tm->tm_year >= 200)
-		return -EINVAL;
-
-	buf[0] = bin2bcd(tm->tm_sec);
-	buf[1] = bin2bcd(tm->tm_min);
-	buf[2] = bin2bcd(tm->tm_hour);
-	buf[3] = bin2bcd(tm->tm_mday);
-	buf[4] = bin2bcd(tm->tm_wday);
-	buf[5] = bin2bcd(tm->tm_mon + 1);
-
-	/*
-	 * While the HYM8563 has a century flag in the month register,
-	 * it does not seem to carry it over a subsequent write/read.
-	 * So we'll limit ourself to 100 years, starting at 2000 for now.
-	 */
-	buf[6] = bin2bcd(tm->tm_year - 100);
-
-	/*
-	 * CTL1 only contains TEST-mode bits apart from stop,
-	 * so no need to read the value first
-	 */
-	ret = i2c_smbus_write_byte_data(client, HYM8563_CTL1,
-						HYM8563_CTL1_STOP);
-	if (ret < 0)
-		return ret;
-
-	ret = i2c_smbus_write_i2c_block_data(client, HYM8563_SEC, 7, buf);
-	if (ret < 0)
-		return ret;
-
-	ret = i2c_smbus_write_byte_data(client, HYM8563_CTL1, 0);
-	if (ret < 0)
-		return ret;
-
-	return 0;
-}
-
-static int hym8563_rtc_alarm_irq_enable(struct device *dev,
-					unsigned int enabled)
-{
-	struct i2c_client *client = to_i2c_client(dev);
-	int data;
-
-	data = i2c_smbus_read_byte_data(client, HYM8563_CTL2);
-	if (data < 0)
-		return data;
-
-	if (enabled)
-		data |= HYM8563_CTL2_AIE;
-	else
-		data &= ~HYM8563_CTL2_AIE;
-
-	return i2c_smbus_write_byte_data(client, HYM8563_CTL2, data);
-};
-
-static int hym8563_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alm)
-{
-	struct i2c_client *client = to_i2c_client(dev);
-	struct rtc_time *alm_tm = &alm->time;
-	u8 buf[4];
-	int ret;
-
-	ret = i2c_smbus_read_i2c_block_data(client, HYM8563_ALM_MIN, 4, buf);
-	if (ret < 0)
-		return ret;
-
-	/* The alarm only has a minute accuracy */
-	alm_tm->tm_sec = 0;
-
-	alm_tm->tm_min = (buf[0] & HYM8563_ALM_BIT_DISABLE) ?
-					-1 :
-					bcd2bin(buf[0] & HYM8563_MIN_MASK);
-	alm_tm->tm_hour = (buf[1] & HYM8563_ALM_BIT_DISABLE) ?
-					-1 :
-					bcd2bin(buf[1] & HYM8563_HOUR_MASK);
-	alm_tm->tm_mday = (buf[2] & HYM8563_ALM_BIT_DISABLE) ?
-					-1 :
-					bcd2bin(buf[2] & HYM8563_DAY_MASK);
-	alm_tm->tm_wday = (buf[3] & HYM8563_ALM_BIT_DISABLE) ?
-					-1 :
-					bcd2bin(buf[3] & HYM8563_WEEKDAY_MASK);
-
-	ret = i2c_smbus_read_byte_data(client, HYM8563_CTL2);
-	if (ret < 0)
-		return ret;
-
-	if (ret & HYM8563_CTL2_AIE)
-		alm->enabled = 1;
-
-	return 0;
-}
-
-static int hym8563_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alm)
-{
-	struct i2c_client *client = to_i2c_client(dev);
-	struct rtc_time *alm_tm = &alm->time;
-	u8 buf[4];
-	int ret;
-
-	ret = i2c_smbus_read_byte_data(client, HYM8563_CTL2);
-	if (ret < 0)
-		return ret;
-
-	ret &= ~HYM8563_CTL2_AIE;
-
-	ret = i2c_smbus_write_byte_data(client, HYM8563_CTL2, ret);
-	if (ret < 0)
-		return ret;
-
-	buf[0] = (alm_tm->tm_min < 60 && alm_tm->tm_min >= 0) ?
-			bin2bcd(alm_tm->tm_min) : HYM8563_ALM_BIT_DISABLE;
-
-	buf[1] = (alm_tm->tm_hour < 24 && alm_tm->tm_hour >= 0) ?
-			bin2bcd(alm_tm->tm_hour) : HYM8563_ALM_BIT_DISABLE;
-
-	buf[2] = (alm_tm->tm_mday <= 31 && alm_tm->tm_mday >= 1) ?
-			bin2bcd(alm_tm->tm_mday) : HYM8563_ALM_BIT_DISABLE;
-
-	buf[3] = (alm_tm->tm_wday < 7 && alm_tm->tm_wday >= 0) ?
-			bin2bcd(alm_tm->tm_wday) : HYM8563_ALM_BIT_DISABLE;
-
-	ret = i2c_smbus_write_i2c_block_data(client, HYM8563_ALM_MIN, 4, buf);
-	if (ret < 0)
-		return ret;
-
-	return hym8563_rtc_alarm_irq_enable(dev, alm->enabled);
-}
-
-static const struct rtc_class_ops hym8563_rtc_ops = {
-	.read_time		= hym8563_rtc_read_time,
-	.set_time		= hym8563_rtc_set_time,
-	.alarm_irq_enable	= hym8563_rtc_alarm_irq_enable,
-	.read_alarm		= hym8563_rtc_read_alarm,
-	.set_alarm		= hym8563_rtc_set_alarm,
-};
-
-/*
- * Handling of the clkout
- */
-
-#ifdef CONFIG_COMMON_CLK
-#define clkout_hw_to_hym8563(_hw) container_of(_hw, struct hym8563, clkout_hw)
-
-static int clkout_rates[] = {
-	32768,
-	1024,
-	32,
-	1,
-};
-
-static unsigned long hym8563_clkout_recalc_rate(struct clk_hw *hw,
-						unsigned long parent_rate)
-{
-	struct hym8563 *hym8563 = clkout_hw_to_hym8563(hw);
-	struct i2c_client *client = hym8563->client;
-	int ret = i2c_smbus_read_byte_data(client, HYM8563_CLKOUT);
-
-	if (ret < 0)
-		return 0;
-
-	ret &= HYM8563_CLKOUT_MASK;
-	return clkout_rates[ret];
-}
-
-static long hym8563_clkout_round_rate(struct clk_hw *hw, unsigned long rate,
-				      unsigned long *prate)
-{
-	int i;
-
-	for (i = 0; i < ARRAY_SIZE(clkout_rates); i++)
-		if (clkout_rates[i] <= rate)
-			return clkout_rates[i];
-
-	return 0;
-}
-
-static int hym8563_clkout_set_rate(struct clk_hw *hw, unsigned long rate,
-				   unsigned long parent_rate)
-{
-	struct hym8563 *hym8563 = clkout_hw_to_hym8563(hw);
-	struct i2c_client *client = hym8563->client;
-	int ret = i2c_smbus_read_byte_data(client, HYM8563_CLKOUT);
-	int i;
-
-	if (ret < 0)
-		return ret;
-
-	for (i = 0; i < ARRAY_SIZE(clkout_rates); i++)
-		if (clkout_rates[i] == rate) {
-			ret &= ~HYM8563_CLKOUT_MASK;
-			ret |= i;
-			return i2c_smbus_write_byte_data(client,
-							 HYM8563_CLKOUT, ret);
-		}
-
-	return -EINVAL;
-}
-
-static int hym8563_clkout_control(struct clk_hw *hw, bool enable)
-{
-	struct hym8563 *hym8563 = clkout_hw_to_hym8563(hw);
-	struct i2c_client *client = hym8563->client;
-	int ret = i2c_smbus_read_byte_data(client, HYM8563_CLKOUT);
-
-	if (ret < 0)
-		return ret;
-
-	if (enable)
-		ret |= HYM8563_CLKOUT_ENABLE;
-	else
-		ret &= ~HYM8563_CLKOUT_ENABLE;
-
-	return i2c_smbus_write_byte_data(client, HYM8563_CLKOUT, ret);
-}
-
-static int hym8563_clkout_prepare(struct clk_hw *hw)
-{
-	return hym8563_clkout_control(hw, 1);
-}
-
-static void hym8563_clkout_unprepare(struct clk_hw *hw)
-{
-	hym8563_clkout_control(hw, 0);
-}
-
-static int hym8563_clkout_is_prepared(struct clk_hw *hw)
-{
-	struct hym8563 *hym8563 = clkout_hw_to_hym8563(hw);
-	struct i2c_client *client = hym8563->client;
-	int ret = i2c_smbus_read_byte_data(client, HYM8563_CLKOUT);
-
-	if (ret < 0)
-		return ret;
-
-	return !!(ret & HYM8563_CLKOUT_ENABLE);
-}
-
-static const struct clk_ops hym8563_clkout_ops = {
-	.prepare = hym8563_clkout_prepare,
-	.unprepare = hym8563_clkout_unprepare,
-	.is_prepared = hym8563_clkout_is_prepared,
-	.recalc_rate = hym8563_clkout_recalc_rate,
-	.round_rate = hym8563_clkout_round_rate,
-	.set_rate = hym8563_clkout_set_rate,
-};
-
-static struct clk *hym8563_clkout_register_clk(struct hym8563 *hym8563)
-{
-	struct i2c_client *client = hym8563->client;
-	struct device_node *node = client->dev.of_node;
-	struct clk *clk;
-	struct clk_init_data init;
-	int ret;
-
-	ret = i2c_smbus_write_byte_data(client, HYM8563_CLKOUT,
-						0);
-	if (ret < 0)
-		return ERR_PTR(ret);
-
-	init.name = "hym8563-clkout";
-	init.ops = &hym8563_clkout_ops;
-	init.flags = 0;
-	init.parent_names = NULL;
-	init.num_parents = 0;
-	hym8563->clkout_hw.init = &init;
-
-	/* optional override of the clockname */
-	of_property_read_string(node, "clock-output-names", &init.name);
-
-	/* register the clock */
-	clk = clk_register(&client->dev, &hym8563->clkout_hw);
-
-	if (!IS_ERR(clk))
-		of_clk_add_provider(node, of_clk_src_simple_get, clk);
-
-	return clk;
-}
-#endif
-
-/*
- * The alarm interrupt is implemented as a level-low interrupt in the
- * hym8563, while the timer interrupt uses a falling edge.
- * We don't use the timer at all, so the interrupt is requested to
- * use the level-low trigger.
- */
-static irqreturn_t hym8563_irq(int irq, void *dev_id)
-{
-	struct hym8563 *hym8563 = (struct hym8563 *)dev_id;
-	struct i2c_client *client = hym8563->client;
-	int data, ret;
-
-	rtc_lock(hym8563->rtc);
-
-	/* Clear the alarm flag */
-
-	data = i2c_smbus_read_byte_data(client, HYM8563_CTL2);
-	if (data < 0) {
-		dev_err(&client->dev, "%s: error reading i2c data %d\n",
-			__func__, data);
-		goto out;
-	}
-
-	data &= ~HYM8563_CTL2_AF;
-
-	ret = i2c_smbus_write_byte_data(client, HYM8563_CTL2, data);
-	if (ret < 0) {
-		dev_err(&client->dev, "%s: error writing i2c data %d\n",
-			__func__, ret);
-	}
-
-out:
-	rtc_unlock(hym8563->rtc);
-	return IRQ_HANDLED;
-}
-
-static int hym8563_init_device(struct i2c_client *client)
-{
-	int ret;
-
-	/* Clear stop flag if present */
-	ret = i2c_smbus_write_byte_data(client, HYM8563_CTL1, 0);
-	if (ret < 0)
-		return ret;
-
-	ret = i2c_smbus_read_byte_data(client, HYM8563_CTL2);
-	if (ret < 0)
-		return ret;
-
-	/* Disable alarm and timer interrupts */
-	ret &= ~HYM8563_CTL2_AIE;
-	ret &= ~HYM8563_CTL2_TIE;
-
-	/* Clear any pending alarm and timer flags */
-	if (ret & HYM8563_CTL2_AF)
-		ret &= ~HYM8563_CTL2_AF;
-
-	if (ret & HYM8563_CTL2_TF)
-		ret &= ~HYM8563_CTL2_TF;
-
-	ret &= ~HYM8563_CTL2_TI_TP;
-
-	return i2c_smbus_write_byte_data(client, HYM8563_CTL2, ret);
-}
-
-#ifdef CONFIG_PM_SLEEP
-static int hym8563_suspend(struct device *dev)
-{
-	struct i2c_client *client = to_i2c_client(dev);
-	int ret;
-
-	if (device_may_wakeup(dev)) {
-		ret = enable_irq_wake(client->irq);
-		if (ret) {
-			dev_err(dev, "enable_irq_wake failed, %d\n", ret);
-			return ret;
-		}
-	}
-
-	return 0;
-}
-
-static int hym8563_resume(struct device *dev)
-{
-	struct i2c_client *client = to_i2c_client(dev);
-
-	if (device_may_wakeup(dev))
-		disable_irq_wake(client->irq);
-
-	return 0;
-}
-#endif
-
-static SIMPLE_DEV_PM_OPS(hym8563_pm_ops, hym8563_suspend, hym8563_resume);
-
-static int hym8563_probe(struct i2c_client *client)
-{
-	struct hym8563 *hym8563;
-	int ret;
-
-	hym8563 = devm_kzalloc(&client->dev, sizeof(*hym8563), GFP_KERNEL);
-	if (!hym8563)
-		return -ENOMEM;
-
-	hym8563->rtc = devm_rtc_allocate_device(&client->dev);
-	if (IS_ERR(hym8563->rtc))
-		return PTR_ERR(hym8563->rtc);
-
-	hym8563->client = client;
-	i2c_set_clientdata(client, hym8563);
-
-	ret = hym8563_init_device(client);
-	if (ret) {
-		dev_err(&client->dev, "could not init device, %d\n", ret);
-		return ret;
-	}
-
-	if (client->irq > 0) {
-		unsigned long irqflags = IRQF_TRIGGER_LOW;
-
-		if (dev_fwnode(&client->dev))
-			irqflags = 0;
-
-		ret = devm_request_threaded_irq(&client->dev, client->irq,
-						NULL, hym8563_irq,
-						irqflags | IRQF_ONESHOT,
-						client->name, hym8563);
-		if (ret < 0) {
-			dev_err(&client->dev, "irq %d request failed, %d\n",
-				client->irq, ret);
-			return ret;
-		}
-	}
-
-	if (client->irq > 0 ||
-	    device_property_read_bool(&client->dev, "wakeup-source")) {
-		device_init_wakeup(&client->dev, true);
-	}
-
-	/* check state of calendar information */
-	ret = i2c_smbus_read_byte_data(client, HYM8563_SEC);
-	if (ret < 0)
-		return ret;
-
-	dev_dbg(&client->dev, "rtc information is %s\n",
-		(ret & HYM8563_SEC_VL) ? "invalid" : "valid");
-
-	hym8563->rtc->ops = &hym8563_rtc_ops;
-	set_bit(RTC_FEATURE_ALARM_RES_MINUTE, hym8563->rtc->features);
-	clear_bit(RTC_FEATURE_UPDATE_INTERRUPT, hym8563->rtc->features);
-
-#ifdef CONFIG_COMMON_CLK
-	hym8563_clkout_register_clk(hym8563);
-#endif
-
-	return devm_rtc_register_device(hym8563->rtc);
-}
-
-static const struct i2c_device_id hym8563_id[] = {
-	{ "hym8563" },
-	{}
-};
-MODULE_DEVICE_TABLE(i2c, hym8563_id);
-
-static const struct of_device_id hym8563_dt_idtable[] = {
-	{ .compatible = "haoyu,hym8563" },
-	{},
-};
-MODULE_DEVICE_TABLE(of, hym8563_dt_idtable);
-
-static struct i2c_driver hym8563_driver = {
-	.driver		= {
-		.name	= "rtc-hym8563",
-		.pm	= &hym8563_pm_ops,
-		.of_match_table	= hym8563_dt_idtable,
-	},
-	.probe		= hym8563_probe,
-	.id_table	= hym8563_id,
-};
-
-module_i2c_driver(hym8563_driver);
-
-MODULE_AUTHOR("Heiko Stuebner <heiko@sntech.de>");
-MODULE_DESCRIPTION("HYM8563 RTC driver");
-MODULE_LICENSE("GPL");
-- 
2.45.2


