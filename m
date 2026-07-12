Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CA12C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 03:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JKukckWpY+orPNsziCIsLI7E7zxitxT1NiWuLx/R2I4=; b=o8tum1yuUYlR4GYeOBfDhyb5RA
	vGrcUTxAW1j1YLvwcUqzgv2PVyr/ED8ICH1wSaO/SBikVvvxHOJETENcdkU+qxazhtVpDkO75N0gx
	5bTBQ3v34xuvJ+BECOuywd6/eNanzTMLG5W2tVu3Cgww9Dc6y1O2+zgd4Ht6ep0p7/yqhG+z08+iI
	DX3I8Fefw/lmhqCMRPCqtF+ELC6adrw+KM8Ikfh9SDhCZYLxsP+KZ0xsXaBUF9mx9B8y/tK4LVCQS
	6zs4MtK2bss6vuevoEOmw0AbLf9s0diZyhj/vF9/Qmc/c+n8F7zK667pgpaEYYwedwqh+Z3ufaG9B
	T2+1DNfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wijgo-0000000704P-2sj4;
	Sun, 12 Jul 2026 02:13:06 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wijgl-0000000702z-3Ixd
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jul 2026 02:13:04 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-37df72c9984so3671349a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Jul 2026 19:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783822383; x=1784427183; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JKukckWpY+orPNsziCIsLI7E7zxitxT1NiWuLx/R2I4=;
        b=VPQAQcFc/69+6W3yQ0LPgqWVGNWldpMaPBK3oYaE4fJjcfGkDyBndSY+owxjE3ofov
         Qk3kL4ynCbRa8Z4g8nwUoXTtqJStNPmI9BqfUl6AN1foGc/VN9Qxgws62YjsD1BP7Fix
         Yv4VErdL8GHYN7lCqZ/DLa1JtH4+qtwOL/ZgY/9HvpZo/UnhthXA78qWMAPLg17+vRM8
         WCAdRjaufqV7hd2y1zzK8OwAJETiimzYwo4520BjFEI2Wx2lhR3yLtxnk7Ke/cUkyL3A
         IBxEpebxHmD1wL4wBiySyEMZVkqmdIhV7r4YBhPeuAEnTMit33LzgA1JMczp2ROn5PtM
         wt6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783822383; x=1784427183;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JKukckWpY+orPNsziCIsLI7E7zxitxT1NiWuLx/R2I4=;
        b=EUFKQtDN6Wbvbug1ts3+E1sUDvHo9u5sSrVLEFJPfAsjMhwSd8XpbDUGRbboRADZu5
         HOlgxqTY61C6clqDvXnk7iSRsipdOTTZ0hh0zga/lukwaUmUaNQKQort8WnVph2JRLMh
         imnx52lEQIPQ593NUqJqggbCYNkBq6C8p+7t4HMhx0kNEP5pgnpgTFr43XW51zTEuEMe
         YI5wWORswogQKJZuQxSlQBxnlQdi3CjIpZx639xxWPl80+OTsr0S5Lzr8Vf/5qHDm6be
         2+xwTSWQCOVIS69KS71x+HH/Tt/fgQKKJ9oWK2aWlQTxyYKHZLKA3tZXm9A6juia2Hqu
         baQA==
X-Forwarded-Encrypted: i=1; AHgh+Rr08gDP/PVgVWjQ0GfPdUhKoM5njpwGOllQE9T9BgLvAEDortKP3OtJr8hL6f8LBQ5QK33shBeI3ockAlgodgl/@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6r47TE6KZU/HkTEnke1kSK1Vi8FydXqceKbyB8j6NvOV+VxtJ
	iDqbTOVeirqxRZSO7BUM3ZrG5I5mHSd3oZwqedljSaNBwk7MZ0MzpAQ2
X-Gm-Gg: AfdE7clDIrsiVL4JEifxjT5c6SC+Z+kURF7TA7f8HvWUbfIImVCaNNSS3z15zbNXGnh
	XXOQRdUkpQHdQZohIgWWI7wrpU4Kw5TxjsElXk/zNuV2rND2ADXunV5WAFJiXk/DcVRhFqb1Gvo
	c5iu3/TFeHLZDMIEp1U9qlmcCrNXVk2b86cgU/YK9jPvLBkNttDbNYU6Q7nBFiKjs5K9XPG/P7l
	37LVvmYYHVGHXH1qmDbUk5IudoYDHMJpwxEvf8ziVOmd3+4tvii1htHCTooab64sLglaIl05vmV
	QU6gW3wMEf93F0skLS0+0cNO8ws5lAKx/2M238Eji0O+UnTfbGzz133KcBTrFhvkGU2it0W1Wgk
	nbh9/T9K1C8DinaXpzrG1chlzRD+akUEt1tUwCLhLKeoaIGeXaciCHl0BBQgMhbb2+gKszH59up
	bd9kiKnqv89SHQZUkHX7PazRTiQLE/9WHr8SaaH46A9SV6Y5wP/0j2y54KStk5DyPOrFWpkZf8n
	l8=
X-Received: by 2002:a17:90a:e7c9:b0:387:e0cb:7f7 with SMTP id 98e67ed59e1d1-38dc784ae88mr4308970a91.43.1783822382978;
        Sat, 11 Jul 2026 19:13:02 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:c63e:9756:a95c:c75])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3117d847e17sm54796692eec.18.2026.07.11.19.13.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 19:13:01 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sat, 11 Jul 2026 19:12:43 -0700
Subject: [PATCH v3 02/10] Input: samsung-keypad - handle compact binding
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260711-samsung-kp-v3-2-b2fcaba77aff@gmail.com>
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
X-CRM114-CacheID: sfid-20260711_191303_863219_50B41216 
X-CRM114-Status: GOOD (  20.61  )
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

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/keyboard/samsung-keypad.c | 134 +++++++++++++++++---------------
 1 file changed, 71 insertions(+), 63 deletions(-)

diff --git a/drivers/input/keyboard/samsung-keypad.c b/drivers/input/keyboard/samsung-keypad.c
index 17127269e3f0..cc34f0146161 100644
--- a/drivers/input/keyboard/samsung-keypad.c
+++ b/drivers/input/keyboard/samsung-keypad.c
@@ -231,83 +231,89 @@ static void samsung_keypad_close(struct input_dev *input_dev)
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
+	if (device_property_present(dev, "linux,keymap")) {
+		error = matrix_keypad_parse_properties(dev, &num_rows, &num_cols);
+		if (error)
+			return ERR_PTR(error);
+	} else {
+		device_property_read_u32(dev, "samsung,keypad-num-rows", &num_rows);
+		device_property_read_u32(dev, "samsung,keypad-num-columns", &num_cols);
+		if (!num_rows || !num_cols) {
+			dev_err(dev, "number of keypad rows/columns not specified\n");
+			return ERR_PTR(-EINVAL);
+		}
 	}
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
@@ -316,18 +322,17 @@ static int samsung_keypad_probe(struct platform_device *pdev)
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
 
@@ -391,7 +396,7 @@ static int samsung_keypad_probe(struct platform_device *pdev)
 	input_dev->open = samsung_keypad_open;
 	input_dev->close = samsung_keypad_close;
 
-	error = matrix_keypad_build_keymap(keymap_data, NULL,
+	error = matrix_keypad_build_keymap(pdata->keymap_data, NULL,
 					   pdata->rows, pdata->cols,
 					   keypad->keycodes, input_dev);
 	if (error) {
@@ -430,11 +435,14 @@ static int samsung_keypad_probe(struct platform_device *pdev)
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


