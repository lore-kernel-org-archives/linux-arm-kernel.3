Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4D1AC282C1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 14:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XNaBzsv98dZxOnoY4pQ3hhfyEv1+PH+c26jk5v5UbcU=; b=v3opXAZq0d73GaGw7cn68txmd7
	bM/joKTG79O0VIUkUlV1xH6cULmJoNi4OtF9BB+qhBXcCo6psKORvl8n0Ng0pMO0iG66A9xsaD73K
	JFnkBnD6dmjQOk7nfrXV8aLItUr92DSFjEdRLLPuYffPBDW/pVNoChXdJ7iakZuqSiRhDNjpR7dPg
	u9OO7noPDH0CGQdHukFhbP+V+95gUt+rDiu6QQYngvMs4Pii941OLXRGsztSaOF06A9Nb/Vkl3TDC
	yAEcaruWk9qpJUV9pvoLerdfxvbADnoJcf5Di96hvax9Kz4NjkEdyKPSdizISZz8HF/hVEDf7OgkM
	a4TUjSQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to1QF-0000000BHKl-0SfU;
	Fri, 28 Feb 2025 14:33:03 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to11X-0000000BBCB-3DyM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 14:07:33 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5e04cb346eeso3602149a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Feb 2025 06:07:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740751650; x=1741356450; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XNaBzsv98dZxOnoY4pQ3hhfyEv1+PH+c26jk5v5UbcU=;
        b=ZgS6e0GKv+m/lKIV93gmZPpi2slR7/n0yAnTzu31RvGbvRU5xV8/Crs7J64JipvQrA
         CmhAEmzItp+D0dQlIo1AACX2836YoYhWLnkx/rWd++ch+Ipl9mhSdXwPuqzs8AOZpRLZ
         11+T82kuh9KwO3AVUQW/1A17rEKms9GcixvtPt3f3ORTNpZ8Ri6isW6X5G33SUyJhi5P
         TEiGeuiC82Im3Tm8O9oloGb7sy1Z9mL+ExSDGFEYcnWeR80O+LZCJ8cByv0eWfnMOLRi
         GiS2bYB8Ymu2FoKj7pqp8PC4bU1D2rzFHBOrYh+esuL5xcSs0EFJ9PODNryrODambezR
         6WcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740751650; x=1741356450;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XNaBzsv98dZxOnoY4pQ3hhfyEv1+PH+c26jk5v5UbcU=;
        b=omxZI/QjvvjAmtgltYWCu3VUGRk6pKmN3/ToNb1D53OaJs4WLCDZdOWEIKWHZqSiHY
         BJs4BQgVFDzg3k2zReDffSO9XCzjlQ6QFCaHog3zSoz6yIK0VNJ6scnr5fMfGmrV/Dqa
         o4JWdwCNGT0wULKZXNB4zLq7WeH8DCIlPQXEm9IW7hqI9RazTocpjv20VmfD+l7EwBzN
         +NtZhfP8ysLdSK0mJA3ZLGek7HuAN2ZDo2w0P1ma02Dv9NsdlTri6ehFBCNe/i8tB4QJ
         Ss1+vegaVYYKsx8mF8OhDA5PFtoAt4cELRL9FMkUVq1Bj+S3PHADoUhMgjOmGXeVyHs2
         SYfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUjw8RxXmBBi3e/9rfe1GYbc0XpxvPcjhSCs+in4PklMAbRNTmVtW6uw88/7DItE7WKeXR4/5pUmi65QF5mIGU@lists.infradead.org
X-Gm-Message-State: AOJu0YyP4W35RN6r1vCAqwS8rODjACO5fm8R3PMhlY8nP21Mhx1oxkEP
	VMsoj762CVurWR/3fYz5+Pa3Lpa2lYwRxtiyskpap8vaYMxrNnHpFqYuIGphsPQ=
X-Gm-Gg: ASbGncvKWRmFccppKc5KUw8Me6E/H/0642fdOIN/Yv35PJvdzIEreThj5QsTMInJQjE
	RDNBuV0Vcs4ft205h7Yve25Scvp8fCWWXEb3RvRjPG2NyKjNQE9g01hhqTTxlrrAtEjWVT8A0/r
	Cq5DsZ3aWvYhHXdovzwYHfZIowsv/MWOn06Irk0idD3ov40VkLmWw2ApNC5MpVQNod78urAMfbP
	KF5T5biKGDA0w89hIaDFKOvTipimNfBsY+JcBwUuvf9/bq9V6voOLXuHUIo/sEjDEXA3GEpLaLF
	5SZtQ8+eR0Olnc5QJAFCSfnV/hGd/FRU2rBrpOPDnv4jen4hNI2rPYBocWH4eNBtEP9ARkLyEjo
	cQ30Q4wzPHA==
X-Google-Smtp-Source: AGHT+IHJgHIb94bIAN1OxpmT/CmpG5hxROPCgFLfrUaKlqlLkHckO5CTYjuy4Kdl9gpiKvePvUPO6w==
X-Received: by 2002:a05:6402:35d3:b0:5e0:9959:83cd with SMTP id 4fb4d7f45d1cf-5e4d6b70ef7mr2396243a12.21.1740751650375;
        Fri, 28 Feb 2025 06:07:30 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c3fb51f9sm2550839a12.55.2025.02.28.06.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 06:07:30 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Feb 2025 14:07:28 +0000
Subject: [PATCH 15/18] rtc: rx8581: drop needless struct rx8581
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250228-rtc-cleanups-v1-15-b44cec078481@linaro.org>
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
X-CRM114-CacheID: sfid-20250228_060731_827887_DC5E3FA2 
X-CRM114-Status: GOOD (  22.27  )
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
 drivers/rtc/rtc-rx8581.c | 63 +++++++++++++++++++-----------------------------
 1 file changed, 25 insertions(+), 38 deletions(-)

diff --git a/drivers/rtc/rtc-rx8581.c b/drivers/rtc/rtc-rx8581.c
index 785ebaca07ac971eee34559f8d1e0a8a872cbba9..20c2dff01bae833ae4e100cc38cd5f030017be75 100644
--- a/drivers/rtc/rtc-rx8581.c
+++ b/drivers/rtc/rtc-rx8581.c
@@ -52,10 +52,6 @@
 #define RX8571_USER_RAM		0x10
 #define RX8571_NVRAM_SIZE	0x10
 
-struct rx8581 {
-	struct regmap		*regmap;
-};
-
 struct rx85x1_config {
 	struct regmap_config regmap;
 	unsigned int num_nvram;
@@ -71,14 +67,14 @@ static int rx8581_rtc_read_time(struct device *dev, struct rtc_time *tm)
 	unsigned char date[7];
 	unsigned int data;
 	int err;
-	struct rx8581 *rx8581 = i2c_get_clientdata(client);
+	struct regmap *regmap = i2c_get_clientdata(client);
 
 	/* First we ensure that the "update flag" is not set, we read the
 	 * time and date then re-read the "update flag". If the update flag
 	 * has been set, we know that the time has changed during the read so
 	 * we repeat the whole process again.
 	 */
-	err = regmap_read(rx8581->regmap, RX8581_REG_FLAG, &data);
+	err = regmap_read(regmap, RX8581_REG_FLAG, &data);
 	if (err < 0)
 		return err;
 
@@ -91,20 +87,20 @@ static int rx8581_rtc_read_time(struct device *dev, struct rtc_time *tm)
 	do {
 		/* If update flag set, clear it */
 		if (data & RX8581_FLAG_UF) {
-			err = regmap_write(rx8581->regmap, RX8581_REG_FLAG,
-					  data & ~RX8581_FLAG_UF);
+			err = regmap_write(regmap, RX8581_REG_FLAG,
+					   data & ~RX8581_FLAG_UF);
 			if (err < 0)
 				return err;
 		}
 
 		/* Now read time and date */
-		err = regmap_bulk_read(rx8581->regmap, RX8581_REG_SC, date,
+		err = regmap_bulk_read(regmap, RX8581_REG_SC, date,
 				       sizeof(date));
 		if (err < 0)
 			return err;
 
 		/* Check flag register */
-		err = regmap_read(rx8581->regmap, RX8581_REG_FLAG, &data);
+		err = regmap_read(regmap, RX8581_REG_FLAG, &data);
 		if (err < 0)
 			return err;
 	} while (data & RX8581_FLAG_UF);
@@ -136,7 +132,7 @@ static int rx8581_rtc_set_time(struct device *dev, struct rtc_time *tm)
 	struct i2c_client *client = to_i2c_client(dev);
 	int err;
 	unsigned char buf[7];
-	struct rx8581 *rx8581 = i2c_get_clientdata(client);
+	struct regmap *regmap = i2c_get_clientdata(client);
 
 	dev_dbg(dev, "%s: secs=%d, mins=%d, hours=%d, "
 		"mday=%d, mon=%d, year=%d, wday=%d\n",
@@ -159,25 +155,23 @@ static int rx8581_rtc_set_time(struct device *dev, struct rtc_time *tm)
 	buf[RX8581_REG_DW] = (0x1 << tm->tm_wday);
 
 	/* Stop the clock */
-	err = regmap_update_bits(rx8581->regmap, RX8581_REG_CTRL,
+	err = regmap_update_bits(regmap, RX8581_REG_CTRL,
 				 RX8581_CTRL_STOP, RX8581_CTRL_STOP);
 	if (err < 0)
 		return err;
 
 	/* write register's data */
-	err = regmap_bulk_write(rx8581->regmap, RX8581_REG_SC,
-				buf, sizeof(buf));
+	err = regmap_bulk_write(regmap, RX8581_REG_SC, buf, sizeof(buf));
 	if (err < 0)
 		return err;
 
 	/* get VLF and clear it */
-	err = regmap_update_bits(rx8581->regmap, RX8581_REG_FLAG,
-				 RX8581_FLAG_VLF, 0);
+	err = regmap_update_bits(regmap, RX8581_REG_FLAG, RX8581_FLAG_VLF, 0);
 	if (err < 0)
 		return err;
 
 	/* Restart the clock */
-	return regmap_update_bits(rx8581->regmap, RX8581_REG_CTRL,
+	return regmap_update_bits(regmap, RX8581_REG_CTRL,
 				 RX8581_CTRL_STOP, 0);
 }
 
@@ -189,29 +183,27 @@ static const struct rtc_class_ops rx8581_rtc_ops = {
 static int rx8571_nvram_read(void *priv, unsigned int offset, void *val,
 			     size_t bytes)
 {
-	struct rx8581 *rx8581 = priv;
+	struct regmap *regmap = priv;
 
-	return regmap_bulk_read(rx8581->regmap, RX8571_USER_RAM + offset,
-				val, bytes);
+	return regmap_bulk_read(regmap, RX8571_USER_RAM + offset, val, bytes);
 }
 
 static int rx8571_nvram_write(void *priv, unsigned int offset, void *val,
 			      size_t bytes)
 {
-	struct rx8581 *rx8581 = priv;
+	struct regmap *regmap = priv;
 
-	return regmap_bulk_write(rx8581->regmap, RX8571_USER_RAM + offset,
-				 val, bytes);
+	return regmap_bulk_write(regmap, RX8571_USER_RAM + offset, val, bytes);
 }
 
 static int rx85x1_nvram_read(void *priv, unsigned int offset, void *val,
 			     size_t bytes)
 {
-	struct rx8581 *rx8581 = priv;
+	struct regmap *regmap = priv;
 	unsigned int tmp_val;
 	int ret;
 
-	ret = regmap_read(rx8581->regmap, RX8581_REG_RAM, &tmp_val);
+	ret = regmap_read(regmap, RX8581_REG_RAM, &tmp_val);
 	(*(unsigned char *)val) = (unsigned char) tmp_val;
 
 	return ret;
@@ -220,12 +212,11 @@ static int rx85x1_nvram_read(void *priv, unsigned int offset, void *val,
 static int rx85x1_nvram_write(void *priv, unsigned int offset, void *val,
 			      size_t bytes)
 {
-	struct rx8581 *rx8581 = priv;
+	struct regmap *regmap = priv;
 	unsigned char tmp_val;
 
 	tmp_val = *((unsigned char *)val);
-	return regmap_write(rx8581->regmap, RX8581_REG_RAM,
-				(unsigned int)tmp_val);
+	return regmap_write(regmap, RX8581_REG_RAM, (unsigned int)tmp_val);
 }
 
 static const struct rx85x1_config rx8581_config = {
@@ -248,7 +239,7 @@ static const struct rx85x1_config rx8571_config = {
 
 static int rx8581_probe(struct i2c_client *client)
 {
-	struct rx8581 *rx8581;
+	struct regmap *regmap;
 	const struct rx85x1_config *config = &rx8581_config;
 	const void *data = of_device_get_match_data(&client->dev);
 	struct rtc_device *rtc;
@@ -276,15 +267,11 @@ static int rx8581_probe(struct i2c_client *client)
 	if (data)
 		config = data;
 
-	rx8581 = devm_kzalloc(&client->dev, sizeof(struct rx8581), GFP_KERNEL);
-	if (!rx8581)
-		return -ENOMEM;
-
-	i2c_set_clientdata(client, rx8581);
+	regmap = devm_regmap_init_i2c(client, &config->regmap);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
 
-	rx8581->regmap = devm_regmap_init_i2c(client, &config->regmap);
-	if (IS_ERR(rx8581->regmap))
-		return PTR_ERR(rx8581->regmap);
+	i2c_set_clientdata(client, regmap);
 
 	rtc = devm_rtc_allocate_device(&client->dev);
 	if (IS_ERR(rtc))
@@ -299,7 +286,7 @@ static int rx8581_probe(struct i2c_client *client)
 	ret = devm_rtc_register_device(rtc);
 
 	for (i = 0; i < config->num_nvram; i++) {
-		nvmem_cfg[i].priv = rx8581;
+		nvmem_cfg[i].priv = regmap;
 		devm_rtc_nvmem_register(rtc, &nvmem_cfg[i]);
 	}
 

-- 
2.48.1.711.g2feabab25a-goog


