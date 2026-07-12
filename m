Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A949C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 03:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RtYcoZBXkE+h9uNyvUP8OwkMXsP5YIQmdPT0+QpRd2Q=; b=Bos0gIR6JYAljOLQy31AFq29Dg
	X7r75++xMwHSiRV5aFGonq9JQBMURSIL1uab3IBi7jWNufAwJcOdSDuFAHlSb8Tcq8vlPDcqhiPG4
	NoWkz0MMy0ZFVlXrbAofZQp29MFvaX1yPVpqNRQAOQOSpZ+f7oFw1EQprEZTvzYuf8QN1khQHaEO8
	7mH1gsM+wu0NtaWynbvvLmS/UZq/MPmN7tnQKiUamNpwX8WLYlE/rDCLVqc9JRQx/Vb9aCn9r0pvp
	Cm1tKl8H0nWLMcvuCllEpfXE1e6jhnHxOlL2k6OONrjWsiYiSel8k9J1LCXokFLwBY5SFzUJJ1Eqz
	krbKAInQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wijgv-00000007077-3SSh;
	Sun, 12 Jul 2026 02:13:13 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wijgs-0000000705P-0nj6
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jul 2026 02:13:11 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2cc73e322dbso21847055ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Jul 2026 19:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783822389; x=1784427189; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RtYcoZBXkE+h9uNyvUP8OwkMXsP5YIQmdPT0+QpRd2Q=;
        b=V+NGXn1OG48CWjaZs6ageVn/6KScF+zUYskt9Mp5rsuSjuQYXAtXH8YN8yvlEpIl0A
         MZPxqgNO78ImpDnSpFV7QFlDmivDLTgY971stgE4fAyCJV/bp6fUwMgVKkxPpZmTeIDV
         GCMYRnKol+KAxlHDv+VtzA82jATIbK3brHgPIYro4Vtl4SpnQujOWHzZBTm/U5Qu6kAZ
         tO4GzhDXJ7nQdduFTY4414WtifPtMNE2bAIMbYDvH96ha0/kS0tQwrHqT6kWsUvYLCsn
         7UVrxMd/iUZZSBSgCH1Bb28Gu2Ezpx5opr78fyWQPhMKgrkUqP3HCxPyGOJwKI718OJm
         wE4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783822389; x=1784427189;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RtYcoZBXkE+h9uNyvUP8OwkMXsP5YIQmdPT0+QpRd2Q=;
        b=PsGyKToP6lUnmtJpLMYyANhXCOkm4ocpMYFA/XSbEQEPaOV00hUneBvBj3nYreC6yP
         A8wn3AtsEgeAj4GVFCjolBG/HrkpUtbsyUV65sPIVt2VEp/SUKorT3j2eEQ6FL4xBTHs
         irwWfgxX4o44DY1XZNtEzaVKFF7pHBwrHazKesJM8loR/E6+pMuW3bmLTSECI5b3N9DK
         PY+xIHrqAEAHkS6ZPNgjQaA7ETIssB/Z2TwiYkCOs3vCgG6KEeLi8igoV1xaNydlPa4g
         FhOLGnksEobUjoHW7O7M+c7JZhVayNsoSxBzKfiA+cCA+u41ijfIzjWlao8BD2z5cNJ1
         yJgA==
X-Forwarded-Encrypted: i=1; AHgh+Ro+7JZxe4sqgeOBKFL36t3W8R2kx7BcVASdEcFQEjvpNzAzIT2WvCAVEvukf2/YYImNzzKMTvvZkD+QHFH+IdxG@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7nG8kbvODzA1Oqc92K779VHfCD4bIp2vJmCnWIDegL0bydn4S
	Y54BF+adcWybF/dMBWGqjd5krK13x0ztBlwgwtVFtV7TzxYxpgaembsA
X-Gm-Gg: AfdE7cm9YLidYDg/0MVdFAWzP3yZbsWb6S9nLg2lhdh4kkPHAbLTT5LoEVb/NDxo4SU
	qmdS8NNCwitET7IuaR+jWdbQMw8yMcOSA4bfck7jW0kmOQr7wL3MSV07G09NPgJNkig/HioRryc
	jPsYK1oAUokDkrK/QXjyBKsgo2rhQTFPL0jBiD02T8pAdenccCaZWMz0r6qxF6SYmJsIwVNxO7x
	Y4qO1gHUSeAErDqAUCUGHR0OgU0Hq+765Iv21C44YvzpdGqBKhyVdsKN6qZ2xe/yZleZ2lntMZs
	Ffj2FAQ5jgDjtwTQfSQYNUeEt+xyHDNsVnq6genpCCi1OcJ6XGQOs/wCGl7kHihSQEqSwEX08PX
	lOTW7CQ9PrJlDkvEkqN+WU64IteTJV8gliZnUwdnSyjf6eVCaSO3/e3mC0nYb+sJ04wvEHj6KX7
	DZ42NILWTg+7JXS5YiafTy9LCaK/05HkO0su2lI2E6iMzag1xwLZBsssCtStyHOr2vSgll4wLIM
	Yg=
X-Received: by 2002:a05:6a21:9d48:b0:3bf:5ff5:2b0f with SMTP id adf61e73a8af0-3c11062f658mr4861795637.12.1783822389307;
        Sat, 11 Jul 2026 19:13:09 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:c63e:9756:a95c:c75])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3117d847e17sm54796692eec.18.2026.07.11.19.13.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 19:13:08 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sat, 11 Jul 2026 19:12:46 -0700
Subject: [PATCH v3 05/10] Input: samsung-keypad - remove support for
 platform data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260711-samsung-kp-v3-5-b2fcaba77aff@gmail.com>
References: <20260711-samsung-kp-v3-0-b2fcaba77aff@gmail.com>
In-Reply-To: <20260711-samsung-kp-v3-0-b2fcaba77aff@gmail.com>
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
 patches@opensource.cirrus.com, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-b242f
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260711_191310_246029_2257081D 
X-CRM114-Status: GOOD (  30.09  )
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

Because there are no more users of samsung_keypad_platdata left in
the kernel remove support for it from the driver.

The driver supports generic device properties so all configuration
should be done using them instead of a custom platform data.

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/keyboard/samsung-keypad.c | 184 +++++++++++++-------------------
 include/linux/input/samsung-keypad.h    |  39 -------
 2 files changed, 72 insertions(+), 151 deletions(-)

diff --git a/drivers/input/keyboard/samsung-keypad.c b/drivers/input/keyboard/samsung-keypad.c
index cc34f0146161..e54b3b9f2cf2 100644
--- a/drivers/input/keyboard/samsung-keypad.c
+++ b/drivers/input/keyboard/samsung-keypad.c
@@ -12,6 +12,7 @@
 #include <linux/delay.h>
 #include <linux/err.h>
 #include <linux/input.h>
+#include <linux/input/matrix_keypad.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/module.h>
@@ -21,7 +22,9 @@
 #include <linux/slab.h>
 #include <linux/of.h>
 #include <linux/sched.h>
-#include <linux/input/samsung-keypad.h>
+
+#define SAMSUNG_MAX_ROWS			8
+#define SAMSUNG_MAX_COLS			8
 
 #define SAMSUNG_KEYIFCON			0x00
 #define SAMSUNG_KEYIFSTSCLR			0x04
@@ -231,26 +234,22 @@ static void samsung_keypad_close(struct input_dev *input_dev)
 	samsung_keypad_stop(keypad);
 }
 
-static const struct matrix_keymap_data *
-samsung_parse_verbose_keymap(struct device *dev)
+static int samsung_parse_verbose_keymap(struct samsung_keypad *keypad)
 {
-	struct matrix_keymap_data *keymap_data;
+	struct matrix_keymap_data keymap_data = { 0 };
+	struct device *dev = &keypad->pdev->dev;
 	struct fwnode_handle *child;
-	u32 *keymap;
-	unsigned int key_count;
-
-	keymap_data = devm_kzalloc(dev, sizeof(*keymap_data), GFP_KERNEL);
-	if (!keymap_data)
-		return ERR_PTR(-ENOMEM);
+	unsigned int key_count = device_get_child_node_count(dev);
+	unsigned int i;
 
-	key_count = device_get_child_node_count(dev);
-	keymap = devm_kcalloc(dev, key_count, sizeof(*keymap), GFP_KERNEL);
+	u32 *keymap __free(kfree) = kcalloc(key_count, sizeof(*keymap), GFP_KERNEL);
 	if (!keymap)
-		return ERR_PTR(-ENOMEM);
+		return -ENOMEM;
 
-	keymap_data->keymap_size = key_count;
-	keymap_data->keymap = keymap;
+	keymap_data.keymap_size = key_count;
+	keymap_data.keymap = keymap;
 
+	i = 0;
 	device_for_each_child_node(dev, child) {
 		u32 row, col, key_code;
 
@@ -258,123 +257,69 @@ samsung_parse_verbose_keymap(struct device *dev)
 		fwnode_property_read_u32(child, "keypad,column", &col);
 		fwnode_property_read_u32(child, "linux,code", &key_code);
 
-		*keymap++ = KEY(row, col, key_code);
+		keymap[i++] = KEY(row, col, key_code);
 	}
 
-	return keymap_data;
+	return matrix_keypad_build_keymap(&keymap_data, NULL,
+					  keypad->rows, keypad->cols,
+					  keypad->keycodes,
+					  keypad->input_dev);
 }
 
-static const struct samsung_keypad_platdata *
-samsung_keypad_parse_properties(struct device *dev)
+static int samsung_keypad_parse_keymap(struct samsung_keypad *keypad)
 {
-	const struct matrix_keymap_data *keymap_data;
-	struct samsung_keypad_platdata *pdata;
-	u32 num_rows = 0, num_cols = 0;
-	int error;
-
-	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
-	if (!pdata)
-		return ERR_PTR(-ENOMEM);
-
-	if (device_property_present(dev, "linux,keymap")) {
-		error = matrix_keypad_parse_properties(dev, &num_rows, &num_cols);
-		if (error)
-			return ERR_PTR(error);
-	} else {
-		device_property_read_u32(dev, "samsung,keypad-num-rows", &num_rows);
-		device_property_read_u32(dev, "samsung,keypad-num-columns", &num_cols);
-		if (!num_rows || !num_cols) {
-			dev_err(dev, "number of keypad rows/columns not specified\n");
-			return ERR_PTR(-EINVAL);
-		}
-	}
-
-	pdata->rows = num_rows;
-	pdata->cols = num_cols;
-
-	if (!device_property_present(dev, "linux,keymap")) {
-		keymap_data = samsung_parse_verbose_keymap(dev);
-		if (IS_ERR(keymap_data))
-			return ERR_CAST(keymap_data);
-
-		pdata->keymap_data = keymap_data;
-	}
-
-
-	pdata->no_autorepeat =
-		device_property_read_bool(dev, "linux,input-no-autorepeat");
+	struct device *dev = &keypad->pdev->dev;
 
-	pdata->wakeup = device_property_read_bool(dev, "wakeup-source") ||
-			/* legacy name */
-			device_property_read_bool(dev, "linux,input-wakeup");
+	if (device_property_present(dev, "linux,keymap"))
+		return matrix_keypad_build_keymap(NULL, NULL,
+						  keypad->rows, keypad->cols,
+						  keypad->keycodes,
+						  keypad->input_dev);
 
-	return pdata;
+	return samsung_parse_verbose_keymap(keypad);
 }
 
 static int samsung_keypad_probe(struct platform_device *pdev)
 {
-	const struct samsung_keypad_platdata *pdata;
 	const struct platform_device_id *id;
+	struct device *dev = &pdev->dev;
 	struct samsung_keypad *keypad;
 	struct resource *res;
 	struct input_dev *input_dev;
 	unsigned int row_shift;
+	u32 num_rows = 0, num_cols = 0;
+	bool wakeup;
 	int error;
 
-	pdata = dev_get_platdata(&pdev->dev);
-	if (pdata) {
-		if (!pdata->keymap_data) {
-			dev_err(&pdev->dev, "no keymap data defined\n");
+	if (device_property_present(dev, "linux,keymap")) {
+		error = matrix_keypad_parse_properties(dev, &num_rows, &num_cols);
+		if (error)
+			return error;
+	} else {
+		device_property_read_u32(dev, "samsung,keypad-num-rows", &num_rows);
+		device_property_read_u32(dev, "samsung,keypad-num-columns", &num_cols);
+		if (!num_rows || !num_cols) {
+			dev_err(dev, "number of keypad rows/columns not specified\n");
 			return -EINVAL;
 		}
-	} else {
-		pdata = samsung_keypad_parse_properties(&pdev->dev);
-		if (IS_ERR(pdata))
-			return PTR_ERR(pdata);
 	}
 
-	if (!pdata->rows || pdata->rows > SAMSUNG_MAX_ROWS)
-		return -EINVAL;
-
-	if (!pdata->cols || pdata->cols > SAMSUNG_MAX_COLS)
+	if (num_rows > SAMSUNG_MAX_ROWS || num_cols > SAMSUNG_MAX_COLS)
 		return -EINVAL;
 
-	/* initialize the gpio */
-	if (pdata->cfg_gpio)
-		pdata->cfg_gpio(pdata->rows, pdata->cols);
-
-	row_shift = get_count_order(pdata->cols);
+	row_shift = get_count_order(num_cols);
 
 	keypad = devm_kzalloc(&pdev->dev,
 			      struct_size(keypad, keycodes,
-					  pdata->rows << row_shift),
+					  num_rows << row_shift),
 			      GFP_KERNEL);
 	if (!keypad)
 		return -ENOMEM;
 
-	input_dev = devm_input_allocate_device(&pdev->dev);
-	if (!input_dev)
-		return -ENOMEM;
-
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res)
-		return -ENODEV;
-
-	keypad->base = devm_ioremap(&pdev->dev, res->start, resource_size(res));
-	if (!keypad->base)
-		return -EBUSY;
-
-	keypad->clk = devm_clk_get_prepared(&pdev->dev, "keypad");
-	if (IS_ERR(keypad->clk)) {
-		dev_err(&pdev->dev, "failed to get keypad clk\n");
-		return PTR_ERR(keypad->clk);
-	}
-
-	keypad->input_dev = input_dev;
 	keypad->pdev = pdev;
 	keypad->row_shift = row_shift;
-	keypad->rows = pdata->rows;
-	keypad->cols = pdata->cols;
+	keypad->rows = num_rows;
+	keypad->cols = num_cols;
 	keypad->stopped = true;
 	init_waitqueue_head(&keypad->wait);
 
@@ -390,26 +335,45 @@ static int samsung_keypad_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
+	input_dev = devm_input_allocate_device(&pdev->dev);
+	if (!input_dev)
+		return -ENOMEM;
+
+	keypad->input_dev = input_dev;
+
 	input_dev->name = pdev->name;
 	input_dev->id.bustype = BUS_HOST;
 
 	input_dev->open = samsung_keypad_open;
 	input_dev->close = samsung_keypad_close;
 
-	error = matrix_keypad_build_keymap(pdata->keymap_data, NULL,
-					   pdata->rows, pdata->cols,
-					   keypad->keycodes, input_dev);
+	error = samsung_keypad_parse_keymap(keypad);
 	if (error) {
 		dev_err(&pdev->dev, "failed to build keymap\n");
 		return error;
 	}
 
 	input_set_capability(input_dev, EV_MSC, MSC_SCAN);
-	if (!pdata->no_autorepeat)
+
+	if (!device_property_read_bool(&pdev->dev, "linux,input-no-autorepeat"))
 		__set_bit(EV_REP, input_dev->evbit);
 
 	input_set_drvdata(input_dev, keypad);
 
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res)
+		return -ENODEV;
+
+	keypad->base = devm_ioremap(&pdev->dev, res->start, resource_size(res));
+	if (!keypad->base)
+		return -EBUSY;
+
+	keypad->clk = devm_clk_get_prepared(&pdev->dev, "keypad");
+	if (IS_ERR(keypad->clk)) {
+		dev_err(&pdev->dev, "failed to get keypad clk\n");
+		return PTR_ERR(keypad->clk);
+	}
+
 	keypad->irq = platform_get_irq(pdev, 0);
 	if (keypad->irq < 0) {
 		error = keypad->irq;
@@ -424,7 +388,11 @@ static int samsung_keypad_probe(struct platform_device *pdev)
 		return error;
 	}
 
-	device_init_wakeup(&pdev->dev, pdata->wakeup);
+	wakeup = device_property_read_bool(dev, "wakeup-source") ||
+		 /* legacy name */
+		 device_property_read_bool(dev, "linux,input-wakeup");
+	device_init_wakeup(&pdev->dev, wakeup);
+
 	platform_set_drvdata(pdev, keypad);
 
 	error = devm_pm_runtime_enable(&pdev->dev);
@@ -435,14 +403,6 @@ static int samsung_keypad_probe(struct platform_device *pdev)
 	if (error)
 		return error;
 
-	if (!dev_get_platdata(&pdev->dev)) {
-		if (pdata->keymap_data) {
-			devm_kfree(&pdev->dev, (void *)pdata->keymap_data->keymap);
-			devm_kfree(&pdev->dev, (void *)pdata->keymap_data);
-		}
-		devm_kfree(&pdev->dev, (void *)pdata);
-	}
-
 	return 0;
 }
 
diff --git a/include/linux/input/samsung-keypad.h b/include/linux/input/samsung-keypad.h
deleted file mode 100644
index ab6b97114c08..000000000000
--- a/include/linux/input/samsung-keypad.h
+++ /dev/null
@@ -1,39 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
- * Samsung Keypad platform data definitions
- *
- * Copyright (C) 2010 Samsung Electronics Co.Ltd
- * Author: Joonyoung Shim <jy0922.shim@samsung.com>
- */
-
-#ifndef __SAMSUNG_KEYPAD_H
-#define __SAMSUNG_KEYPAD_H
-
-#include <linux/input/matrix_keypad.h>
-
-#define SAMSUNG_MAX_ROWS	8
-#define SAMSUNG_MAX_COLS	8
-
-/**
- * struct samsung_keypad_platdata - Platform device data for Samsung Keypad.
- * @keymap_data: pointer to &matrix_keymap_data.
- * @rows: number of keypad row supported.
- * @cols: number of keypad col supported.
- * @no_autorepeat: disable key autorepeat.
- * @wakeup: controls whether the device should be set up as wakeup source.
- * @cfg_gpio: configure the GPIO.
- *
- * Initialisation data specific to either the machine or the platform
- * for the device driver to use or call-back when configuring gpio.
- */
-struct samsung_keypad_platdata {
-	const struct matrix_keymap_data	*keymap_data;
-	unsigned int rows;
-	unsigned int cols;
-	bool no_autorepeat;
-	bool wakeup;
-
-	void (*cfg_gpio)(unsigned int rows, unsigned int cols);
-};
-
-#endif /* __SAMSUNG_KEYPAD_H */

-- 
2.55.0.795.g602f6c329a-goog


