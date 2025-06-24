Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94E4FC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 14:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+kQaxyBIjK8VEwym/mLAJe8Z7aaiwFK7Iag2ch85G3A=; b=Is1+XzE/mucaNg8YRjRFhtsZmj
	vuDbsTDIn3/fco5TdbSBHxcjMokCY7xXFTQ+Ue52pp4Ks3KRvCYNGWKgkhvJx317SKXAOx+9Jw2gh
	oMIdUmqN5GJpGCaJpdA7QPjGn8O6acxRrBorjsepLzzMWkVVbSkk9hJXYHbsmG26/AoU2BgJD2chX
	KmTej89biHMN/5IvlXJ5eo6Cyflve6/sy7XBdT40Xz1AoSAtp2VV45+1UxrgTjuAYg5GJeQ4vbw/5
	2KmBwcM8QTcfZRHMTi6sUE8ACiYSc8ejd3gGOAcJNDfCDDn7RExWW+q+CxF1dNrne8UjYDSOD/FG1
	Ectn+HJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU4GU-00000005pJa-1Coh;
	Tue, 24 Jun 2025 14:04:46 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU3gn-00000005i8w-1e4O
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 13:27:54 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-453398e90e9so36405295e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 06:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750771672; x=1751376472; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+kQaxyBIjK8VEwym/mLAJe8Z7aaiwFK7Iag2ch85G3A=;
        b=Ve0kZfPexfO2lQZE4On2kiWvIDka/yAlTV7EjlaX9baBIGbbJIjlvbk4xWDww1ypWN
         xanEpucdCp5TFODv7p5kBN8kkXJHxPSjRwJMVyK1LZSpRiesAQiD1iFpmtBg/dewXR7g
         vjmLrAV823YO+gCHn9pbmZAjjPaFu5S17xlVneerNhrClpJo+6v7qa1YjVMVzl6NPvXr
         N61Khq+TcWbxZGX3Tim/p9qy0JOUqebANDMAhv1mTLomxTE/lONl0/EHQ6lOP5IKoC4y
         1I7nItzjQzkyMnUuiBI3J1A7EEV9+hmrE36MWBjuX3M/tFTGx6Sd+F537USqyg2OAllB
         y/Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750771672; x=1751376472;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+kQaxyBIjK8VEwym/mLAJe8Z7aaiwFK7Iag2ch85G3A=;
        b=Jg8AEt5uuIVX2Et9Vc1vtZ6jU5AWJtFfeUK8C4EfMG82pyaaKMt/AHyLKJX4uM2za0
         wBYBSTJNEgeeH9RO+QFh6ZnfgrIoq8E2XD8jFWmc5Ljb7CMluitGVJLhZvFZYDYgb3AI
         5uHPD6UhVIoK8VMcttuzZexxZztF4yyyzFGVt3pqkR58HLmv4KeP8m2Ar8/5OYF5QhJU
         Y4vwh/0xKZ5uxMvj2CG6mUm2JI7fuFSd911T98WiMiI+gyqNxm+yjXHv/0OSgrgJCoQz
         ycIDtUfJPAm/erewY7OMAwl7IJHvKyEqUE7LCzY8tOa56u1lh80tlfpAcTcT/zxSQhP3
         BRBg==
X-Forwarded-Encrypted: i=1; AJvYcCU21tb8W47vbhxJjm7CnNDCkSKDqgVDX2DHBa21Uwx5VgZUfVI/tjsiU3Z4ed6eaDcqmZLTmi9AfmxBuaiqLQzC@lists.infradead.org
X-Gm-Message-State: AOJu0YxMmIikXHd4VPT3MY/EN4z0SafjErwLIyj8hgbPF+wqe9qxFiWQ
	cmbAfIR8N+GCb0DoZZuepP9hdMVb5s7/oasdUFCBrpu1SYTymQL9xdN7Vb7ekwbCgPw=
X-Gm-Gg: ASbGncuKEsg86bhw+8QO6QUMje6HSRW8kjPcQpcNGSf22MPADGM25QgwfowFF8BoxL1
	5rRat1qN+M5LV7yRLSFsweJT89eQO49kGVSPLhBsxR/9yD6IfAFUDEMqMykgUrkOlgpJxKi+waH
	UhOVeSf10EtyacbSvXZ74ed0rTe9brz5RTQcPD8+/KZwRrQ0miTCdckiNbU0jC0ffnlhbOHPcDt
	vv2q9aeLRwnUddXYc4ZU6BYuGN2fOHxam0DgQFzzKL2KbYuNQLl3/YxYqu7OrFO5itKrhs3Tpag
	dEVA6OsFUla9yOHhrMIVSlidVv/I5E0F1iFch0PUZwlwT6mRHqMxtqs=
X-Google-Smtp-Source: AGHT+IEPTDzwLXIM3Xph9atHSvAHfYbq+2JUrc/xQh3stYwnvBg1/yvk8jivlT9igvBuM/YtgbIgpg==
X-Received: by 2002:a05:600c:6211:b0:453:5a04:b60e with SMTP id 5b1f17b1804b1-453659f5828mr132853075e9.26.1750771671769;
        Tue, 24 Jun 2025 06:27:51 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:34d2:109c:3293:19e9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453632312a3sm152588485e9.1.2025.06.24.06.27.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 06:27:50 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 24 Jun 2025 15:27:39 +0200
Subject: [PATCH 7/8] gpio: 74xx-mmio: use new generic GPIO chip API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-gpio-mmio-rework-v1-7-aea12209d258@linaro.org>
References: <20250624-gpio-mmio-rework-v1-0-aea12209d258@linaro.org>
In-Reply-To: <20250624-gpio-mmio-rework-v1-0-aea12209d258@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2832;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=dUd8T2o5opExyjr3ESy2M3JllSvSI7yIu15ScqE/S2A=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoWqfN8G55LTaf9eBZt1P84/TXiIGPUQWZadRM0
 uyhNgVY3DuJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFqnzQAKCRARpy6gFHHX
 cmSAD/9YkjgnB3SuE3z5/gI6W0O1DNNnL31sikzurphtycOsPnuH0nx+xhHn7lENI7Lf5aKAkvS
 auPZhFMyAdNnnsBfZlP5FCFdp889Uxrgwl/QyQUn4doBf67v0gI8dv32BYDGw7ZcGe+4tJVjQ+5
 YStPY2QLQJwGmsm08MSU0i09S2O6b0exvICbSSNBe84p4aF6mmtBZU76dXKjsp3k8CfhnUTcQw8
 IqAS4TZ9P18ky4kxYrUcmuqskngqV/ugdcGRFhULphctmF38OTU2UNW61zWI+tq5i2xtHPYNNvx
 xwcHvDJzw7Uy9qH1V/EhKNOwbbR3xBv39S4QSZMiid5r7o+MQXsCypqr7uXNmOERi30Hltv9ucB
 WEfHQNK8YynKQR5NmyDUtO17ndT3MELJyjduRo4AZGHt0/NNy+L5J/G/MFTDbpTpdD7iyU9G4YM
 7nWwyz4dhN8TSnc1qHEXO6fT/E2TtOEnhoQU/vOt9Wpm5IoAElYIOrEPOQpunRaOQ3JN5l3ezDp
 iiODbsrAFEnZ9fNsBZ4nMCfdCAd+SWTHR0S/aMT39+fDkELXA0ICxBZz5RPkwNWvaAEeQlqfE2A
 l5zctvRNx0NhhJE7mzVrVSrmVk2TqNVNvcppwFKy6YXlDdGdGf4wOCbUT5MM3/TxNw7nNDxESjL
 nWWorj9IzX1A5Ig==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_062753_441199_68D036F2 
X-CRM114-Status: GOOD (  16.80  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Convert the driver to using the new generic GPIO chip interfaces from
linux/gpio/generic.h.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-74xx-mmio.c | 32 +++++++++++++++++---------------
 1 file changed, 17 insertions(+), 15 deletions(-)

diff --git a/drivers/gpio/gpio-74xx-mmio.c b/drivers/gpio/gpio-74xx-mmio.c
index 3ba21add3a1c669171578ceaf9cc1728c060d401..bd2cc5f4f851650a499382b050a556506f4c5031 100644
--- a/drivers/gpio/gpio-74xx-mmio.c
+++ b/drivers/gpio/gpio-74xx-mmio.c
@@ -8,6 +8,7 @@
 #include <linux/bits.h>
 #include <linux/err.h>
 #include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
@@ -18,8 +19,8 @@
 #define MMIO_74XX_BIT_CNT(x)	((x) & GENMASK(7, 0))
 
 struct mmio_74xx_gpio_priv {
-	struct gpio_chip	gc;
-	unsigned		flags;
+	struct gpio_generic_chip gen_gc;
+	unsigned int flags;
 };
 
 static const struct of_device_id mmio_74xx_gpio_ids[] = {
@@ -99,16 +100,15 @@ static int mmio_74xx_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
 {
 	struct mmio_74xx_gpio_priv *priv = gpiochip_get_data(gc);
 
-	if (priv->flags & MMIO_74XX_DIR_OUT) {
-		gc->set_rv(gc, gpio, val);
-		return 0;
-	}
+	if (priv->flags & MMIO_74XX_DIR_OUT)
+		return gpio_generic_chip_set(&priv->gen_gc, gpio, val);
 
 	return -ENOTSUPP;
 }
 
 static int mmio_74xx_gpio_probe(struct platform_device *pdev)
 {
+	struct gpio_generic_chip_config config = { };
 	struct mmio_74xx_gpio_priv *priv;
 	void __iomem *dat;
 	int err;
@@ -123,19 +123,21 @@ static int mmio_74xx_gpio_probe(struct platform_device *pdev)
 	if (IS_ERR(dat))
 		return PTR_ERR(dat);
 
-	err = bgpio_init(&priv->gc, &pdev->dev,
-			 DIV_ROUND_UP(MMIO_74XX_BIT_CNT(priv->flags), 8),
-			 dat, NULL, NULL, NULL, NULL, 0);
+	config.dev = &pdev->dev;
+	config.sz = DIV_ROUND_UP(MMIO_74XX_BIT_CNT(priv->flags), 8);
+	config.dat = dat;
+
+	err = gpio_generic_chip_init(&priv->gen_gc, &config);
 	if (err)
 		return err;
 
-	priv->gc.direction_input = mmio_74xx_dir_in;
-	priv->gc.direction_output = mmio_74xx_dir_out;
-	priv->gc.get_direction = mmio_74xx_get_direction;
-	priv->gc.ngpio = MMIO_74XX_BIT_CNT(priv->flags);
-	priv->gc.owner = THIS_MODULE;
+	priv->gen_gc.gc.direction_input = mmio_74xx_dir_in;
+	priv->gen_gc.gc.direction_output = mmio_74xx_dir_out;
+	priv->gen_gc.gc.get_direction = mmio_74xx_get_direction;
+	priv->gen_gc.gc.ngpio = MMIO_74XX_BIT_CNT(priv->flags);
+	priv->gen_gc.gc.owner = THIS_MODULE;
 
-	return devm_gpiochip_add_data(&pdev->dev, &priv->gc, priv);
+	return devm_gpiochip_add_data(&pdev->dev, &priv->gen_gc.gc, priv);
 }
 
 static struct platform_driver mmio_74xx_gpio_driver = {

-- 
2.48.1


