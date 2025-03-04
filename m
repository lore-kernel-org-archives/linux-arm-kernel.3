Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3F0CC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 18:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jDySvxIgslRZrTqVd7bcfGaor7CHMjwsKayUWf5uR70=; b=iSQEYCX2jbE7A2OoUeblq1/icF
	kGPDTGnFGlWICasC0ejJGEWLwPBZjA6JPJi3z3U+NE5b7izkGJ9Xyvfy4xx6iTr7kdy2st7UjKF4I
	v2scxOFe/B0O1UQM9lTzWzV6HkVun7JxpVDXwGlYe4BMjskcn1hM0hVrN7zRCbydolV4PsrQbZqFx
	qY7gdf3FpLG1iTeudYQsL0oK5nMBqfExj1kJYM4nTbYsoXpyYgGbiw9EduvkcPazVDA6kt1aT/+z7
	6pwV0i8tKOFg2nkIkitfQEAVwzbSeRs/782iB3Vt5Kv1eoq3mF5CJs0056gOqRVQL9QeQ77griZLG
	YwSIR4AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpXOC-00000005up2-0HcE;
	Tue, 04 Mar 2025 18:53:12 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpViL-00000005YI3-3kAw
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 04 Mar 2025 17:05:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=jDySvxIgslRZrTqVd7bcfGaor7CHMjwsKayUWf5uR70=; b=MTQBdKZXbR0HVBdKhmKeVdWH2g
	35FpDic58Uqo4DTVKm318uIYAnhK8rs3EeyOKC5zfmivqILHp7gZ1EiK0NMxFxjDwr6ofdJfYCDQE
	Cwih5kBJ3obuHf09L+fDD3YDyEwn9bizsd84/quGGYJESJ/9DQnKxU1vXigTm03ksO8r/ST++r40b
	FUIQSBgWwaVy0DzSgZTxkB/EOhLOYjyHHX86JIFe0e7B7OZt/IDA8/geEbZwvB0qGsl7qcphH9m0b
	gfofbRIo02/c2ljiev63OzwcXLEG1G1xERZkB0/VUzgCQB1XaJkqSDOMbnvAdWhLEk5R6LqnZTNWG
	rLyifI1w==;
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpViD-00000002D1j-1g5O
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 17:05:52 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5e539ea490dso3607383a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 09:05:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741107941; x=1741712741; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jDySvxIgslRZrTqVd7bcfGaor7CHMjwsKayUWf5uR70=;
        b=fIVFRFcTOlTcsXQITbuSZPKycKETPy6etpRNYPmYcYMdPGyVD/iQn5MbbfQiay1UPZ
         FFu2z2tEk1YJHlVtAMi82nvxmkCJ0TJz/e4wsHkgzt+IFzxsZqM1eYSa/Mx1Azaiu7Og
         zLDMsPnfKH7vbvX9HfuljultEvLmZrvQiwrSkm7Pn5mCyWwUKKoCkzeRdhZRTVAKqVwe
         gW7FtEcB+0gEEUeEJESG7WWiiZYcKYxRCFRMFCZJtwO+1N10troJgKaG7BrMY/4LJ0mq
         FKAXFgZizKTVzQRlCzb+aB6pmzPlBak8HNgH8HHJFMjNxRfgGhyAluIERb8gSir9vWeD
         43VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741107941; x=1741712741;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jDySvxIgslRZrTqVd7bcfGaor7CHMjwsKayUWf5uR70=;
        b=AD7GDVnpEcz4L+XwDECbqLRLHcePYg7yMJQQwAqnNLFM4XWPIyF+eN0VRicc6SsAGp
         0Zl4Kp3MkvGHJ3/WTnY6DTT84cP0or+aMTC8hBp9lydHiiBPoWwdpU0KdUq4oo2yXNfR
         AopbmouAhn0cSQvSYXJI26XRfhNf5YGkX49gzFnVGlVC8WHH/8LHmBhFSHwM69YUH5nD
         dZeRcpRAyFCLmW9ERXXBHbrj68j2naeoVp00/4E9Tu4Q3LNoh0Ehdti+WjoodlPMktKf
         NorA5ljB/zek+VVwxhj5TbXg0M34PqVq2sG+nrEJYhaFk/83JWMCTSpqVGJ6HG0Gf7Wf
         dYSw==
X-Forwarded-Encrypted: i=1; AJvYcCV4DKtp1DSSWKo5EOpqTrAEvJZA7vZNVs6TUlMrCPTcOvSiFyWFB5ewvOu54PSU422ElmlxV+mer/W3sgxzCcmW@lists.infradead.org
X-Gm-Message-State: AOJu0YxzbdO+PwJbbnIcfhN0Le9ssmZj5mn4CBZ5EwLaaLLh9sgNE9JU
	kPEx0YFehphbDv/ue2uDnpyzhmSspcm+qnHYB+PkkqYDqh28c9085NEcsZhEGfA=
X-Gm-Gg: ASbGnctr4KL/oUeQmMkmDnuX5UWD1DfHgpU7nJJ1o50JBFBv5UnfZq7WjPW5+w3hbv7
	Xdo8h4NjdcLgn04AmEuhPntv1pB7FsOaHP2PS5emuc2XLNA/JXQsfKdIffARZyGFQWPQDJKenSR
	a7O21dmkYPXJAP/QKhmdFPQir6FATd6wMvjmG+4H3Ovj24916xNId8Qsoqn13RWI+zZ0xTLEqr1
	erI63d3p6w+rpwtn8WLfB9XJZkNKlq0uMhyIOdkPqX+93DmPZhokC/N9yvIF5VH+n5ww+65ftfi
	6n2qwKkUBWjIO6XWzkFPbuwBgp6VP1c1NHhKNac4UwPD1O80YDDQNg4V5+S/IRmG94nXbLM4LLT
	QAExFdKbsS6x7PSDctXxb3f761xv/
X-Google-Smtp-Source: AGHT+IGw6DMujSSlMe4X/Gi0vjiilArq9AgwOJMWr49ZazH2bLzcdxFw+AmPTscolQ+3wmW3ZQIPiA==
X-Received: by 2002:a05:6402:50d4:b0:5e5:9543:fc0d with SMTP id 4fb4d7f45d1cf-5e59543fd82mr4097180a12.31.1741107940802;
        Tue, 04 Mar 2025 09:05:40 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf795ba15esm367589066b.131.2025.03.04.09.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 09:05:40 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 04 Mar 2025 17:05:42 +0000
Subject: [PATCH v2 14/16] rtc: sd3078: drop needless struct sd3078
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250304-rtc-cleanups-v2-14-d4689a71668c@linaro.org>
References: <20250304-rtc-cleanups-v2-0-d4689a71668c@linaro.org>
In-Reply-To: <20250304-rtc-cleanups-v2-0-d4689a71668c@linaro.org>
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
 Dianlong Li <long17.cool@163.com>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-amlogic@lists.infradead.org, 
 llvm@lists.linux.dev, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_170546_655489_DF0F37B2 
X-CRM114-Status: GOOD (  19.99  )
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

The memory pointed to by the ::rtc member is managed via devres, and
no code in this driver uses it past _probe().

We can drop it from the structure and just use a local temporary
variable, reducing runtime memory consumption by a few bytes.

Since this now means that the structure has just one member only left,
there  is no need anymore to allocate data for it and pass that around
via the various callbacks, just to extract that one member.

Instead, we can just pass that one member and avoid the extra memory
allocation for the containing struct, reducing runtime memory
consumption.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/rtc/rtc-sd3078.c | 71 +++++++++++++++++++-----------------------------
 1 file changed, 28 insertions(+), 43 deletions(-)

diff --git a/drivers/rtc/rtc-sd3078.c b/drivers/rtc/rtc-sd3078.c
index fe27b54beaad1c06b70bf7f22e44c3f6da087267..10cc1dcfc7748144f51ef674939506feee1fb471 100644
--- a/drivers/rtc/rtc-sd3078.c
+++ b/drivers/rtc/rtc-sd3078.c
@@ -36,11 +36,6 @@
  */
 #define WRITE_PROTECT_EN	0
 
-struct sd3078 {
-	struct rtc_device	*rtc;
-	struct regmap		*regmap;
-};
-
 /*
  * In order to prevent arbitrary modification of the time register,
  * when modification of the register,
@@ -49,14 +44,11 @@ struct sd3078 {
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
@@ -69,14 +61,11 @@ static void sd3078_enable_reg_write(struct sd3078 *sd3078)
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
 
@@ -85,11 +74,10 @@ static int sd3078_rtc_read_time(struct device *dev, struct rtc_time *tm)
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
@@ -123,7 +111,7 @@ static int sd3078_rtc_set_time(struct device *dev, struct rtc_time *tm)
 {
 	unsigned char rtc_data[NUM_TIME_REGS];
 	struct i2c_client *client = to_i2c_client(dev);
-	struct sd3078 *sd3078 = i2c_get_clientdata(client);
+	struct regmap *regmap = i2c_get_clientdata(client);
 	int ret;
 
 	rtc_data[SD3078_REG_SC] = bin2bcd(tm->tm_sec);
@@ -135,10 +123,10 @@ static int sd3078_rtc_set_time(struct device *dev, struct rtc_time *tm)
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
@@ -146,7 +134,7 @@ static int sd3078_rtc_set_time(struct device *dev, struct rtc_time *tm)
 	}
 
 #if WRITE_PROTECT_EN
-	sd3078_disable_reg_write(sd3078);
+	sd3078_disable_reg_write(regmap);
 #endif
 
 	return 0;
@@ -166,36 +154,33 @@ static const struct regmap_config regmap_config = {
 static int sd3078_probe(struct i2c_client *client)
 {
 	int ret;
-	struct sd3078 *sd3078;
+	struct regmap *regmap;
+	struct rtc_device *rtc;
 
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
 
-	sd3078->rtc = devm_rtc_allocate_device(&client->dev);
-	if (IS_ERR(sd3078->rtc))
-		return PTR_ERR(sd3078->rtc);
+	rtc = devm_rtc_allocate_device(&client->dev);
+	if (IS_ERR(rtc))
+		return PTR_ERR(rtc);
 
-	sd3078->rtc->ops = &sd3078_rtc_ops;
-	sd3078->rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
-	sd3078->rtc->range_max = RTC_TIMESTAMP_END_2099;
+	rtc->ops = &sd3078_rtc_ops;
+	rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
+	rtc->range_max = RTC_TIMESTAMP_END_2099;
 
-	ret = devm_rtc_register_device(sd3078->rtc);
+	ret = devm_rtc_register_device(rtc);
 	if (ret)
 		return ret;
 
-	sd3078_enable_reg_write(sd3078);
+	sd3078_enable_reg_write(regmap);
 
 	return 0;
 }

-- 
2.48.1.711.g2feabab25a-goog


