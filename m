Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9F1EC19776
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 14:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/r1ypkbSjtebcdcKcBz70+d9/hPyy6PTiaBKA6Wiwh8=; b=EwWeIpGQUrDg87yG+AX7gllSIO
	0nbBIB4FWgsENsXIs0QL0sgU/90zH1bnex5yu28dr/SPdUXd17M+H0lRV68Fzz4RJHpiy7jBkexvr
	DGVyvyLjx/eF87Xp7Bb84dfPB9Av/MdbjDDvatA995Q+tHQiIirscLiM1lSrIM3l02KL/h+iJ2Q8a
	TidtxpCuxEbaC2orHE61/ctY9NnKNst/psc9sniXPIKGGHLLRNXaZOi217b08bhZdEjdyYVubY+Pz
	W/waQjoFTbSTNfjCH4hyHxvL/ZJI8dQ08cUyzOHmrfzwmq5bgLHBCrEVga1xzFElBhQxB23Xajt+C
	ZNByILFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to1Rn-0000000BHhA-0UH0;
	Fri, 28 Feb 2025 14:34:39 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to11Z-0000000BBDf-0ATc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 14:07:34 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5dedae49c63so3851921a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Feb 2025 06:07:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740751652; x=1741356452; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/r1ypkbSjtebcdcKcBz70+d9/hPyy6PTiaBKA6Wiwh8=;
        b=POfb3kHTjaP0qetIzzS2SKTbQakW3Hidsm0f//c0Qr9nINCTKcS88z2BOGJ0DzliIL
         4GKr/6Xvo5XsM8YtdpgckgmfRr84vuUlg0qdUUewyMe19k5HHeSGrpPYd8Vi6bRSTdXk
         fItNQliWE+akw06JYAUNw8Of8ihQf4kHhcXNTNYcYgMEFCgfw/RU695N0Qmz7lNkSYF7
         kWQjmQHVCD3f5hUK8WlJKJRrkjLpQwvGxeSiVYkZ1CahXAmHlfP1HXEU4TeaxNgeTbj8
         lCeEudYSDT0yxYyo8b7YK19UnEP9DEB/oyaX9Ge0bRE83GmYUnV5Z1BJquZQHwldw4o6
         7wMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740751652; x=1741356452;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/r1ypkbSjtebcdcKcBz70+d9/hPyy6PTiaBKA6Wiwh8=;
        b=TOykdqG085zQeK0teFREuFedLYQN4Pg1AuSc15d3feBxmXAeYmv7vpP9c4ilpgqY0S
         GNsENiAP+tcjX417q8ofJ9F/Q8KU0nHpYro87SA+LNwyav4DCPXDH14dhsnESHQv1TMg
         zyJXAWKA7eCklyFsOHtUgInAiUk/ZeWyir8upyyyvhtyMSwUy9AixsdXGnTugD2sPNOG
         fDh4H7Hd00jz2yOzMtEdXiIazRsjIv0Xp9PRkN9npNrtFJKcCxsreKy4WRp8XURhPpk+
         wPKAoNXmUNPjhbwQfoUC0xpIDXQj1hv9Do0kK6dgbIrKlLWjIAORq/x9hx1tH2f82C5m
         9+zw==
X-Forwarded-Encrypted: i=1; AJvYcCVFKJsjgC/pAtJLuJlXwoDw4Cz6SrgOLMOwd+xNGnaceAimSqAuirsCVPOTDW+n29P5XIhv0An3FdxHkEGZsF9h@lists.infradead.org
X-Gm-Message-State: AOJu0YxLKM/xqOc5utdjUTyiCrxp8uz3OL1wFoIm5b44RdK0g9mtADz1
	j7hinI5Wx2FT4ldVukEwambTWkFlueBpBmb9k8KAt7vcElJRZ/nW+tEbQBnzBTA=
X-Gm-Gg: ASbGncsPSXoHGe9TTjOiySB2ryUXdOKnY3FmCG7jp4ayBkf1+jsPgfHJ0llyw2M6Sqc
	vgLZCOeV6g/SyJf7naz5AFjsbpZcvpvvOX//hYZCpBxpu1PiPVtlhbdD6tvwQ3sKug2Sig1oCpX
	R9UlUq9Lzoxi0/vsoORmDuWl8PNvs6+HkbkejjNGgJLhf7YAJy60NywmJPVx4NcQSJgRneLUZR7
	CSWyj8C0Bi0lA/ipqlPEXHeGPRiQW2EFRc9lJyvC5UstnNaEp51sLwBvqnDvdfUpp4OV1X9GmLu
	csjxHCxJXZ7n71g8zh7OLTKRgYRjXhH9Af5+FEMfjIC4+x0XDJfounge3sYPsKrX3R8Rz9CL1OE
	3troK9qB/mQ==
X-Google-Smtp-Source: AGHT+IEmNzc9psOsG8S5U8hQjyEGUEZtM5fJSHlUXxz0d+LoEipOpq1K+57NoVXqKGgpzCnWIQsf3g==
X-Received: by 2002:a05:6402:2711:b0:5de:dfd0:9d22 with SMTP id 4fb4d7f45d1cf-5e4d6b6ebf3mr3156214a12.22.1740751650904;
        Fri, 28 Feb 2025 06:07:30 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c3fb51f9sm2550839a12.55.2025.02.28.06.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 06:07:30 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Feb 2025 14:07:29 +0000
Subject: [PATCH 16/18] rtc: sd3078: drop needless struct sd3078
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250228-rtc-cleanups-v1-16-b44cec078481@linaro.org>
References: <20250228-rtc-cleanups-v1-0-b44cec078481@linaro.org>
In-Reply-To: <20250228-rtc-cleanups-v1-0-b44cec078481@linaro.org>
To: Chanwoo Choi <cw00.choi@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 =?utf-8?q?T=C3=B3th_J=C3=A1nos?= <gomba007@gmail.com>, 
 Dianlong Li <long17.cool@163.com>
Cc: linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-amlogic@lists.infradead.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_060733_079495_0BC666ED 
X-CRM114-Status: GOOD (  17.54  )
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

This private data struct has one member only, there is no need to
allocate data for it and pass that around via the various callbacks,
just to extract that one member.

Instead, we can just pass that one member and avoid the extra memory
allocation, reducing runtime memory consumption.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/rtc/rtc-sd3078.c | 55 ++++++++++++++++++------------------------------
 1 file changed, 20 insertions(+), 35 deletions(-)

diff --git a/drivers/rtc/rtc-sd3078.c b/drivers/rtc/rtc-sd3078.c
index ebb4d45ce2409982880affbc7a85d5e7410c8f42..10cc1dcfc7748144f51ef674939506feee1fb471 100644
--- a/drivers/rtc/rtc-sd3078.c
+++ b/drivers/rtc/rtc-sd3078.c
@@ -36,10 +36,6 @@
  */
 #define WRITE_PROTECT_EN	0
 
-struct sd3078 {
-	struct regmap		*regmap;
-};
-
 /*
  * In order to prevent arbitrary modification of the time register,
  * when modification of the register,
@@ -48,14 +44,11 @@ struct sd3078 {
  * 2. set WRITE2 bit
  * 3. set WRITE3 bit
  */
-static void sd3078_enable_reg_write(struct sd3078 *sd3078)
+static void sd3078_enable_reg_write(struct regmap *regmap)
 {
-	regmap_update_bits(sd3078->regmap, SD3078_REG_CTRL2,
-			   KEY_WRITE1, KEY_WRITE1);
-	regmap_update_bits(sd3078->regmap, SD3078_REG_CTRL1,
-			   KEY_WRITE2, KEY_WRITE2);
-	regmap_update_bits(sd3078->regmap, SD3078_REG_CTRL1,
-			   KEY_WRITE3, KEY_WRITE3);
+	regmap_update_bits(regmap, SD3078_REG_CTRL2, KEY_WRITE1, KEY_WRITE1);
+	regmap_update_bits(regmap, SD3078_REG_CTRL1, KEY_WRITE2, KEY_WRITE2);
+	regmap_update_bits(regmap, SD3078_REG_CTRL1, KEY_WRITE3, KEY_WRITE3);
 }
 
 #if WRITE_PROTECT_EN
@@ -68,14 +61,11 @@ static void sd3078_enable_reg_write(struct sd3078 *sd3078)
  * 2. clear WRITE3 bit
  * 3. clear WRITE1 bit
  */
-static void sd3078_disable_reg_write(struct sd3078 *sd3078)
+static void sd3078_disable_reg_write(struct regmap *regmap)
 {
-	regmap_update_bits(sd3078->regmap, SD3078_REG_CTRL1,
-			   KEY_WRITE2, 0);
-	regmap_update_bits(sd3078->regmap, SD3078_REG_CTRL1,
-			   KEY_WRITE3, 0);
-	regmap_update_bits(sd3078->regmap, SD3078_REG_CTRL2,
-			   KEY_WRITE1, 0);
+	regmap_update_bits(regmap, SD3078_REG_CTRL1, KEY_WRITE2, 0);
+	regmap_update_bits(regmap, SD3078_REG_CTRL1, KEY_WRITE3, 0);
+	regmap_update_bits(regmap, SD3078_REG_CTRL2, KEY_WRITE1, 0);
 }
 #endif
 
@@ -84,11 +74,10 @@ static int sd3078_rtc_read_time(struct device *dev, struct rtc_time *tm)
 	unsigned char hour;
 	unsigned char rtc_data[NUM_TIME_REGS] = {0};
 	struct i2c_client *client = to_i2c_client(dev);
-	struct sd3078 *sd3078 = i2c_get_clientdata(client);
+	struct regmap *regmap = i2c_get_clientdata(client);
 	int ret;
 
-	ret = regmap_bulk_read(sd3078->regmap, SD3078_REG_SC, rtc_data,
-			       NUM_TIME_REGS);
+	ret = regmap_bulk_read(regmap, SD3078_REG_SC, rtc_data, NUM_TIME_REGS);
 	if (ret < 0) {
 		dev_err(dev, "reading from RTC failed with err:%d\n", ret);
 		return ret;
@@ -122,7 +111,7 @@ static int sd3078_rtc_set_time(struct device *dev, struct rtc_time *tm)
 {
 	unsigned char rtc_data[NUM_TIME_REGS];
 	struct i2c_client *client = to_i2c_client(dev);
-	struct sd3078 *sd3078 = i2c_get_clientdata(client);
+	struct regmap *regmap = i2c_get_clientdata(client);
 	int ret;
 
 	rtc_data[SD3078_REG_SC] = bin2bcd(tm->tm_sec);
@@ -134,10 +123,10 @@ static int sd3078_rtc_set_time(struct device *dev, struct rtc_time *tm)
 	rtc_data[SD3078_REG_YR] = bin2bcd(tm->tm_year - 100);
 
 #if WRITE_PROTECT_EN
-	sd3078_enable_reg_write(sd3078);
+	sd3078_enable_reg_write(regmap);
 #endif
 
-	ret = regmap_bulk_write(sd3078->regmap, SD3078_REG_SC, rtc_data,
+	ret = regmap_bulk_write(regmap, SD3078_REG_SC, rtc_data,
 				NUM_TIME_REGS);
 	if (ret < 0) {
 		dev_err(dev, "writing to RTC failed with err:%d\n", ret);
@@ -145,7 +134,7 @@ static int sd3078_rtc_set_time(struct device *dev, struct rtc_time *tm)
 	}
 
 #if WRITE_PROTECT_EN
-	sd3078_disable_reg_write(sd3078);
+	sd3078_disable_reg_write(regmap);
 #endif
 
 	return 0;
@@ -165,23 +154,19 @@ static const struct regmap_config regmap_config = {
 static int sd3078_probe(struct i2c_client *client)
 {
 	int ret;
-	struct sd3078 *sd3078;
+	struct regmap *regmap;
 	struct rtc_device *rtc;
 
 	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
 		return -ENODEV;
 
-	sd3078 = devm_kzalloc(&client->dev, sizeof(*sd3078), GFP_KERNEL);
-	if (!sd3078)
-		return -ENOMEM;
-
-	sd3078->regmap = devm_regmap_init_i2c(client, &regmap_config);
-	if (IS_ERR(sd3078->regmap)) {
+	regmap = devm_regmap_init_i2c(client, &regmap_config);
+	if (IS_ERR(regmap)) {
 		dev_err(&client->dev, "regmap allocation failed\n");
-		return PTR_ERR(sd3078->regmap);
+		return PTR_ERR(regmap);
 	}
 
-	i2c_set_clientdata(client, sd3078);
+	i2c_set_clientdata(client, regmap);
 
 	rtc = devm_rtc_allocate_device(&client->dev);
 	if (IS_ERR(rtc))
@@ -195,7 +180,7 @@ static int sd3078_probe(struct i2c_client *client)
 	if (ret)
 		return ret;
 
-	sd3078_enable_reg_write(sd3078);
+	sd3078_enable_reg_write(regmap);
 
 	return 0;
 }

-- 
2.48.1.711.g2feabab25a-goog


