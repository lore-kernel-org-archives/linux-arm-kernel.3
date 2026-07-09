Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 505F8C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 04:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K26mBfWTEhCgyKuaP+D1jacUWyTXVy3FDjUtVm+Ftzw=; b=Q21C5rcW+rEkHvY5cs6gDKm9K9
	6DX3FZAY1gIiM7WmuuJwvZtDeTOjFyurMSvVcXXT2WDhjV2RwL4Z+L6346Gb7ejeHqnzjIDsi/Vp9
	JC5ZiukbYPca98BQMXqZzPUDg36mBwyPicMNVchyUgwS/5Lin8qRjnxAs4ZBY4Iv8/BLAEeUg8oY6
	UhonFANk/sNc+2dDyaFpBADZR8hJFJ3uBRCNwL8wY6ckwP7cTLKKjo5KOdWSgKXoR+YAGWNyWfmAx
	wzYOGjckZ4W97scGd8NMc5e7H/FVPNMRiSDSHbKkYTB7xIjJccjnu+zVHHUwb3oWqG5szaW69U94Y
	5vFLxh3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whgl7-000000010Yd-0qzm;
	Thu, 09 Jul 2026 04:53:13 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whgl3-000000010WV-2zNi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 04:53:11 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-381018b9375so1569777a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 21:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783572789; x=1784177589; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K26mBfWTEhCgyKuaP+D1jacUWyTXVy3FDjUtVm+Ftzw=;
        b=i6AgQRYUBWYU6Nxu+5iU28deFcopJ0kQJn4Z38jQk2y5Gh1h0gc74KQTeNmHtnetro
         fI4vXbXWnquA+hSEGLwmAIysOulDDNA7k2SwUMq6t9SOjNjIQdHhDGKuPLEzZczoWLV4
         ahpf+upP8QOaEQIDashpiYtweFLR85AC3qmh3SaSddPvrZxcarQnzA1DWM7evvvVitri
         Use9ou4w4rQqYtEkTkKZA+7zEG0NZTdWTfj91NQb9dypK8n5+9faAc2IzlLRPWd+LqMi
         jKfGmDOi1YYPimvx0d/sPdPxrEPSTCMeQkWB1cBtvQeI+chTiR4dl1hvsWwqtTY9SX2O
         R76A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783572789; x=1784177589;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K26mBfWTEhCgyKuaP+D1jacUWyTXVy3FDjUtVm+Ftzw=;
        b=Pdu//rGqI/bS/sWxQXJpLKUeHGlAyoGyVnmPwcLzBR+orrLKSXsujWP5zlj5s46gql
         +00RQVy7J4Pi7FU6U94PS58hiJYhZegkDxCZpuDtm90MegshKKFrOCvukOcs31WvpUAd
         cnlqtaFot4xOSqNWQVC9ZbIe9UlqSfg6B1ExAX5EQ9j5wYTQD+dyHuvaBqR5sfvx9QuI
         HIHzO7p3Bd9prBGYCCqpevbW/Pqr8obqulvO5FRhiL/9eKASqa1ukq4btQCoBehaYYu1
         Xxal5Xy8n59gQcezl4KmCFZ1rpBh5bZp5fBh/X4j6B4zclcVJn+UR8stP22x0E+4XdlJ
         9gLg==
X-Forwarded-Encrypted: i=1; AHgh+RpORVZqpADbi3CZWjuNz9prsvDz+whqfD7+uo0afMx6E6dwaCSLh6z0incnBFvNwrTQCYewC3XIHk+7QPxX190b@lists.infradead.org
X-Gm-Message-State: AOJu0YzAHqoae9IgWQsEsjRtbD0btL+zEyvWHt3RtsQN5cl4RPSgG9zg
	fqP0PftHo00JcXPekCbkDp5QUVXY3yXcW2qELCuIoN2wZv1LHic8Y8Bz
X-Gm-Gg: AfdE7cku6PLMRHkS+nPcgOei8v36Skdv+OFqxDRAekTC9Cz6eO8I0hXnRYt/Sw67qQ8
	6nVZb76sj2ZfoojWmu4QnSgDKWLLgAaMiDPwnMm6vYTBvZLwzWMsa96SWUSWvplQdRfoqpzEYJz
	TVxcmm7mxUXCwtE8NmnQD1RoDcjChStMxBesJGy3YWF+7M8awID7Tm8Dce8vY+jAZExBKc6j2+D
	vxB9+LpoPdLz+96/ks5v423UTV2dnHUBVfsiFWjeDW4e4uayuiSQYl8OlkltbRDBKZPhsnxa8br
	j1QWVk/wKxx9AaFzCO9oc00mlBMoY8rmBD6KRy8coJnA2LooLgy8tHSrBZNm4LToFdfvSdBoBs+
	RGk50qczzGWoL2orF4V9XZGEbrzjt8yO26Ou6AyPvwIDJWZhdmOJ+AWHU4Wk17fxig1tPMCxs84
	n+Vx4ADtDwsrZ7s3sbngtAVX/ghSWeVcuTPqI+Xn155bQqHToCsoJYK0ZPikd1eKlbo66lpL63O
	qT+
X-Received: by 2002:a05:6a21:670b:b0:3c0:9c19:65b5 with SMTP id adf61e73a8af0-3c0bcc3ae41mr7443493637.61.1783572788693;
        Wed, 08 Jul 2026 21:53:08 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:e229:88c8:fd09:9a39])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b658a99afsm26559252c88.0.2026.07.08.21.53.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 21:53:07 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Wed, 08 Jul 2026 21:53:00 -0700
Subject: [PATCH v2 02/11] Input: samsung-keypad - handle compact binding
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-samsung-kp-v2-2-3c6ed4c9b3b6@gmail.com>
References: <20260708-samsung-kp-v2-0-3c6ed4c9b3b6@gmail.com>
In-Reply-To: <20260708-samsung-kp-v2-0-3c6ed4c9b3b6@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>, 
 Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-input@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 patches@opensource.cirrus.com
X-Mailer: b4 0.16-dev-b242f
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_215309_766839_FADD99F9 
X-CRM114-Status: GOOD (  20.42  )
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

Add support for standard matrix keymap binding (in addition to the
existing verbose binding with a sub-node for each key). This will
allow easier conversions from platform data to device properties when
using static device properties.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/keyboard/samsung-keypad.c | 130 ++++++++++++++++----------------
 1 file changed, 66 insertions(+), 64 deletions(-)

diff --git a/drivers/input/keyboard/samsung-keypad.c b/drivers/input/keyboard/samsung-keypad.c
index 17127269e3f0..b9d4ea5f202a 100644
--- a/drivers/input/keyboard/samsung-keypad.c
+++ b/drivers/input/keyboard/samsung-keypad.c
@@ -231,83 +231,83 @@ static void samsung_keypad_close(struct input_dev *input_dev)
 	samsung_keypad_stop(keypad);
 }
 
-#ifdef CONFIG_OF
-static struct samsung_keypad_platdata *
-samsung_keypad_parse_dt(struct device *dev)
+static const struct matrix_keymap_data *
+samsung_parse_verbose_keymap(struct device *dev)
 {
-	struct samsung_keypad_platdata *pdata;
 	struct matrix_keymap_data *keymap_data;
-	uint32_t *keymap, num_rows = 0, num_cols = 0;
-	struct device_node *np = dev->of_node, *key_np;
+	struct fwnode_handle *child;
+	u32 *keymap;
 	unsigned int key_count;
 
-	if (!np) {
-		dev_err(dev, "missing device tree data\n");
-		return ERR_PTR(-EINVAL);
+	keymap_data = devm_kzalloc(dev, sizeof(*keymap_data), GFP_KERNEL);
+	if (!keymap_data)
+		return ERR_PTR(-ENOMEM);
+
+	key_count = device_get_child_node_count(dev);
+	keymap = devm_kcalloc(dev, key_count, sizeof(*keymap), GFP_KERNEL);
+	if (!keymap)
+		return ERR_PTR(-ENOMEM);
+
+	keymap_data->keymap_size = key_count;
+	keymap_data->keymap = keymap;
+
+	device_for_each_child_node(dev, child) {
+		u32 row, col, key_code;
+
+		fwnode_property_read_u32(child, "keypad,row", &row);
+		fwnode_property_read_u32(child, "keypad,column", &col);
+		fwnode_property_read_u32(child, "linux,code", &key_code);
+
+		*keymap++ = KEY(row, col, key_code);
 	}
 
+	return keymap_data;
+}
+
+static const struct samsung_keypad_platdata *
+samsung_keypad_parse_properties(struct device *dev)
+{
+	const struct matrix_keymap_data *keymap_data;
+	struct samsung_keypad_platdata *pdata;
+	u32 num_rows = 0, num_cols = 0;
+	int error;
+
 	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
-	if (!pdata) {
-		dev_err(dev, "could not allocate memory for platform data\n");
+	if (!pdata)
 		return ERR_PTR(-ENOMEM);
-	}
 
-	of_property_read_u32(np, "samsung,keypad-num-rows", &num_rows);
-	of_property_read_u32(np, "samsung,keypad-num-columns", &num_cols);
-	if (!num_rows || !num_cols) {
-		dev_err(dev, "number of keypad rows/columns not specified\n");
-		return ERR_PTR(-EINVAL);
-	}
+	device_property_read_u32(dev, "samsung,keypad-num-rows", &num_rows);
+	device_property_read_u32(dev, "samsung,keypad-num-columns", &num_cols);
+
+	error = matrix_keypad_parse_properties(dev, &num_rows, &num_cols);
+	if (error)
+		return ERR_PTR(error);
+
 	pdata->rows = num_rows;
 	pdata->cols = num_cols;
 
-	keymap_data = devm_kzalloc(dev, sizeof(*keymap_data), GFP_KERNEL);
-	if (!keymap_data) {
-		dev_err(dev, "could not allocate memory for keymap data\n");
-		return ERR_PTR(-ENOMEM);
-	}
-	pdata->keymap_data = keymap_data;
+	if (!device_property_present(dev, "linux,keymap")) {
+		keymap_data = samsung_parse_verbose_keymap(dev);
+		if (IS_ERR(keymap_data))
+			return ERR_CAST(keymap_data);
 
-	key_count = of_get_child_count(np);
-	keymap_data->keymap_size = key_count;
-	keymap = devm_kcalloc(dev, key_count, sizeof(uint32_t), GFP_KERNEL);
-	if (!keymap) {
-		dev_err(dev, "could not allocate memory for keymap\n");
-		return ERR_PTR(-ENOMEM);
+		pdata->keymap_data = keymap_data;
 	}
-	keymap_data->keymap = keymap;
 
-	for_each_child_of_node(np, key_np) {
-		u32 row, col, key_code;
-		of_property_read_u32(key_np, "keypad,row", &row);
-		of_property_read_u32(key_np, "keypad,column", &col);
-		of_property_read_u32(key_np, "linux,code", &key_code);
-		*keymap++ = KEY(row, col, key_code);
-	}
 
-	pdata->no_autorepeat = of_property_read_bool(np, "linux,input-no-autorepeat");
+	pdata->no_autorepeat =
+		device_property_read_bool(dev, "linux,input-no-autorepeat");
 
-	pdata->wakeup = of_property_read_bool(np, "wakeup-source") ||
+	pdata->wakeup = device_property_read_bool(dev, "wakeup-source") ||
 			/* legacy name */
-			of_property_read_bool(np, "linux,input-wakeup");
-
+			device_property_read_bool(dev, "linux,input-wakeup");
 
 	return pdata;
 }
-#else
-static struct samsung_keypad_platdata *
-samsung_keypad_parse_dt(struct device *dev)
-{
-	dev_err(dev, "no platform data defined\n");
-
-	return ERR_PTR(-EINVAL);
-}
-#endif
 
 static int samsung_keypad_probe(struct platform_device *pdev)
 {
 	const struct samsung_keypad_platdata *pdata;
-	const struct matrix_keymap_data *keymap_data;
 	const struct platform_device_id *id;
 	struct samsung_keypad *keypad;
 	struct resource *res;
@@ -316,18 +316,17 @@ static int samsung_keypad_probe(struct platform_device *pdev)
 	int error;
 
 	pdata = dev_get_platdata(&pdev->dev);
-	if (!pdata) {
-		pdata = samsung_keypad_parse_dt(&pdev->dev);
+	if (pdata) {
+		if (!pdata->keymap_data) {
+			dev_err(&pdev->dev, "no keymap data defined\n");
+			return -EINVAL;
+		}
+	} else {
+		pdata = samsung_keypad_parse_properties(&pdev->dev);
 		if (IS_ERR(pdata))
 			return PTR_ERR(pdata);
 	}
 
-	keymap_data = pdata->keymap_data;
-	if (!keymap_data) {
-		dev_err(&pdev->dev, "no keymap data defined\n");
-		return -EINVAL;
-	}
-
 	if (!pdata->rows || pdata->rows > SAMSUNG_MAX_ROWS)
 		return -EINVAL;
 
@@ -391,7 +390,7 @@ static int samsung_keypad_probe(struct platform_device *pdev)
 	input_dev->open = samsung_keypad_open;
 	input_dev->close = samsung_keypad_close;
 
-	error = matrix_keypad_build_keymap(keymap_data, NULL,
+	error = matrix_keypad_build_keymap(pdata->keymap_data, NULL,
 					   pdata->rows, pdata->cols,
 					   keypad->keycodes, input_dev);
 	if (error) {
@@ -430,11 +429,14 @@ static int samsung_keypad_probe(struct platform_device *pdev)
 	if (error)
 		return error;
 
-	if (pdev->dev.of_node) {
-		devm_kfree(&pdev->dev, (void *)pdata->keymap_data->keymap);
-		devm_kfree(&pdev->dev, (void *)pdata->keymap_data);
+	if (!dev_get_platdata(&pdev->dev)) {
+		if (pdata->keymap_data) {
+			devm_kfree(&pdev->dev, (void *)pdata->keymap_data->keymap);
+			devm_kfree(&pdev->dev, (void *)pdata->keymap_data);
+		}
 		devm_kfree(&pdev->dev, (void *)pdata);
 	}
+
 	return 0;
 }
 

-- 
2.55.0.795.g602f6c329a-goog


