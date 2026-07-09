Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94262C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 04:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U+M3rTQ3CjpVF9vvR8XU5vj2lKkvONQlP0xZS2BToiE=; b=nkLIbvXsx3XQ5sQfoOMNI1ALhL
	vx+rR4/K6h952daaVY59VOtvhwoGwS6Rrd64rZR4anuvQlOOUkytJdhVl1tZrIlJ0TfCWnEfChs+G
	MnURW1RJXkhiBQE1JGZf3IIFj/HK61ty7J9Rv2P0z97S5ZOBFWgV6fz3nZhNyUezPkyjVGObJdQBm
	M+v3a2e7MMcExTiqkUKUjjNyFd38a4XJ5KrFMv47iX3PKFCeWeTMwWYZ8bd00OUXzpWY3NzLiJkEb
	aJB9mWlNGhzivH4dgXveHmN99gzc+3A6wHfkAmLpEPuyPvlFLvvWIZ1MU6RLUAeleFALgbwKwzD1d
	UE2dODsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whglH-000000010e2-2geJ;
	Thu, 09 Jul 2026 04:53:23 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whgl9-000000010ZU-3sYr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 04:53:18 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-c9b373d5af0so1050832a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 21:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783572795; x=1784177595; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U+M3rTQ3CjpVF9vvR8XU5vj2lKkvONQlP0xZS2BToiE=;
        b=cmJy2LemGEy5QJRPaA6hNQbwiH1NEpiaJCY2CQSP1XU+t1sxOILZJgTenWSnK72HyV
         Y7VNNb3XuNBkTw25x+X04H/SgFnVRKee+g3PS5kMTSc2f3kgoc3Y07OiAIcYGJ9BBvpX
         OP/gvEdDVBhDMYGfrIhAIlSMTqQ6aad/faRcMprvn2VlQQ+WbfuBj4UbA/nXIUnIHHeR
         VpmRMHYqTA1NSFxNfuZse233KxVFTwkabaz6dpC2Bl68LYkdZWBL6yiCcLXL/w3Fj8KI
         TTxEmvBl50xJTbnS7t2HxcswONXXMpEu3qldmhnUAZJFI1mg864sZzxMpGUSWNjOLvAz
         e1uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783572795; x=1784177595;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U+M3rTQ3CjpVF9vvR8XU5vj2lKkvONQlP0xZS2BToiE=;
        b=j3dzDOq+bK3pTHytbEdadVcA+D2Lbqf0R8Aovl4UaUU5H+cAhhIUZIvmcMoZBKEoiu
         P8a/lHVTUnHjtB3amnZmi/I4uTQwUmpBA3KmzGQwP8u/lIw5W5zaPWOKSrxpa3hNwiSd
         IUgj2KSXBX3jxqdAN4vNihE96k9nzFhmdT/CJ2diuIkzadUCRDyVci47/JHz+JbpnRdc
         bXwNnWO4tw4z7hbu5g4U+/cTroi2XUaMGAl+PyKy3qxALHf/mSBXwaA+EoEKoJDPAje5
         BGsGlrojSSxZUBJQzvzGWXeeWmeKB/aW2+k3+gb3g0d4NnzqkTPkhs+oRHrhYMqPxj1M
         FqmA==
X-Forwarded-Encrypted: i=1; AHgh+Ro79bNqp9qRfMepZDWNCoWoP9jLe5we/YEpxHHPBfhpXlZ5c8P/K6G/wu3HvkDJhUPcsrOmeP0hjhvwum/GfhaS@lists.infradead.org
X-Gm-Message-State: AOJu0Ywg9LrHzMm/7+ZeEvz8DQp8WgnKKsdPNS3BxxIEM3Ii3z1IflIU
	nZ7+AKTd6Uxo55CBlofYiWol1k5LXf1MlhsOPxR8HtQc/7/Pq9Ykq3EZ
X-Gm-Gg: AfdE7cmpRImr3L2fP4dqLw0JYkCb50OQb80cFuVAy6KuLMBokKPiAzJu2O/ZhZZOWne
	w+yYAqu+lHqlNS56ux5wV04atJn31Y9sSsXAowKWCwzNy1kOqWJt+8ubSXyhEsAIBn9EPdM5xsR
	Ga5sPerHK6BakY0/UMYvykx5oeaAI72j/p0Cwh9IJhD0uEAwBpy8ITwSjbBjkQTbMg0FSST9X+5
	ju5t5OS3dtZZaf50nK2XYzXjHk+sm38S0SXV/OrH5WHtpMIx+Tnm+TKJz/O/wxRWGa8QBYKzoUV
	EJ0meeOrUwyNZXS7i/BKVm06lpGnJ4fFshvQAPc/9mntOnWEo/DaeXmxgbO8/aYQX7LcWRG6Gs5
	skf60ENmHBdSf5awBtq4LhVLwqs5UsDS+GQtq6mbyPV7IcqrXVPIkpu0tGU6Lqc62LJSaQV9/VW
	qvCAL4at9RG6vMAB3MpPnFX9XJ++a+HFvnfYHG/hqD9b5u93T3N5synPWGbkWR5gXER1mlao82Y
	Hc8
X-Received: by 2002:a05:6a21:1bc3:b0:3bf:5ff5:2b15 with SMTP id adf61e73a8af0-3c0bc96019dmr6232053637.16.1783572794887;
        Wed, 08 Jul 2026 21:53:14 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:e229:88c8:fd09:9a39])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b658a99afsm26559252c88.0.2026.07.08.21.53.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 21:53:13 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Wed, 08 Jul 2026 21:53:03 -0700
Subject: [PATCH v2 05/11] Input: samsung-keypad - remove support for
 platform data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-samsung-kp-v2-5-3c6ed4c9b3b6@gmail.com>
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
X-CRM114-CacheID: sfid-20260708_215316_004266_A6A24F59 
X-CRM114-Status: GOOD (  29.18  )
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

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/keyboard/samsung-keypad.c | 184 ++++++++++++--------------------
 include/linux/input/samsung-keypad.h    |  39 -------
 2 files changed, 68 insertions(+), 155 deletions(-)

diff --git a/drivers/input/keyboard/samsung-keypad.c b/drivers/input/keyboard/samsung-keypad.c
index b9d4ea5f202a..6f1d766a4134 100644
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
@@ -231,144 +234,77 @@ static void samsung_keypad_close(struct input_dev *input_dev)
 	samsung_keypad_stop(keypad);
 }
 
-static const struct matrix_keymap_data *
-samsung_parse_verbose_keymap(struct device *dev)
+static int samsung_keypad_parse_keymap(struct samsung_keypad *keypad)
 {
-	struct matrix_keymap_data *keymap_data;
+	struct matrix_keymap_data keymap_data = { 0 };
+	struct device *dev = &keypad->pdev->dev;
 	struct fwnode_handle *child;
 	u32 *keymap;
 	unsigned int key_count;
-
-	keymap_data = devm_kzalloc(dev, sizeof(*keymap_data), GFP_KERNEL);
-	if (!keymap_data)
-		return ERR_PTR(-ENOMEM);
+	int retval;
 
 	key_count = device_get_child_node_count(dev);
-	keymap = devm_kcalloc(dev, key_count, sizeof(*keymap), GFP_KERNEL);
-	if (!keymap)
-		return ERR_PTR(-ENOMEM);
+	if (key_count) {
+		keymap = kcalloc(key_count, sizeof(*keymap), GFP_KERNEL);
+		if (!keymap)
+			return -ENOMEM;
 
-	keymap_data->keymap_size = key_count;
-	keymap_data->keymap = keymap;
+		keymap_data.keymap = keymap;
+		keymap_data.keymap_size = key_count;
 
-	device_for_each_child_node(dev, child) {
-		u32 row, col, key_code;
+		device_for_each_child_node(dev, child) {
+			u32 row, col, key_code;
 
-		fwnode_property_read_u32(child, "keypad,row", &row);
-		fwnode_property_read_u32(child, "keypad,column", &col);
-		fwnode_property_read_u32(child, "linux,code", &key_code);
+			fwnode_property_read_u32(child, "keypad,row", &row);
+			fwnode_property_read_u32(child, "keypad,column", &col);
+			fwnode_property_read_u32(child, "linux,code", &key_code);
 
-		*keymap++ = KEY(row, col, key_code);
+			*keymap++ = KEY(row, col, key_code);
+		}
 	}
 
-	return keymap_data;
-}
-
-static const struct samsung_keypad_platdata *
-samsung_keypad_parse_properties(struct device *dev)
-{
-	const struct matrix_keymap_data *keymap_data;
-	struct samsung_keypad_platdata *pdata;
-	u32 num_rows = 0, num_cols = 0;
-	int error;
-
-	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
-	if (!pdata)
-		return ERR_PTR(-ENOMEM);
-
-	device_property_read_u32(dev, "samsung,keypad-num-rows", &num_rows);
-	device_property_read_u32(dev, "samsung,keypad-num-columns", &num_cols);
-
-	error = matrix_keypad_parse_properties(dev, &num_rows, &num_cols);
-	if (error)
-		return ERR_PTR(error);
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
-
-	pdata->wakeup = device_property_read_bool(dev, "wakeup-source") ||
-			/* legacy name */
-			device_property_read_bool(dev, "linux,input-wakeup");
-
-	return pdata;
+	retval = matrix_keypad_build_keymap(key_count ? &keymap_data : NULL,
+					    NULL, keypad->rows, keypad->cols,
+					    keypad->keycodes,
+					    keypad->input_dev);
+	kfree(keymap_data.keymap);
+	return retval;
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
+	device_property_read_u32(dev, "samsung,keypad-num-rows", &num_rows);
+	device_property_read_u32(dev, "samsung,keypad-num-columns", &num_cols);
 
-	pdata = dev_get_platdata(&pdev->dev);
-	if (pdata) {
-		if (!pdata->keymap_data) {
-			dev_err(&pdev->dev, "no keymap data defined\n");
-			return -EINVAL;
-		}
-	} else {
-		pdata = samsung_keypad_parse_properties(&pdev->dev);
-		if (IS_ERR(pdata))
-			return PTR_ERR(pdata);
-	}
-
-	if (!pdata->rows || pdata->rows > SAMSUNG_MAX_ROWS)
-		return -EINVAL;
+	error = matrix_keypad_parse_properties(dev, &num_rows, &num_cols);
+	if (error)
+		return error;
 
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
 
@@ -384,26 +320,45 @@ static int samsung_keypad_probe(struct platform_device *pdev)
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
@@ -418,7 +373,11 @@ static int samsung_keypad_probe(struct platform_device *pdev)
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
@@ -429,13 +388,6 @@ static int samsung_keypad_probe(struct platform_device *pdev)
 	if (error)
 		return error;
 
-	if (!dev_get_platdata(&pdev->dev)) {
-		if (pdata->keymap_data) {
-			devm_kfree(&pdev->dev, (void *)pdata->keymap_data->keymap);
-			devm_kfree(&pdev->dev, (void *)pdata->keymap_data);
-		}
-		devm_kfree(&pdev->dev, (void *)pdata);
-	}
 
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


