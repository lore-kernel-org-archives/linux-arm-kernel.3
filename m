Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A962FC7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 09:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ad7oUQvI6PDZjS2O6AwRif7/SXK6hLx/gAToo+NgacI=; b=vaQ7eGtEQeLw/OIzbCro3VxcWb
	znKvVUYhqecdL7ht/opiXP/NCEXdPUYJ24u+GObmVu7BE2Wmog+RGqCELXK+fAIZjSDXpF/O1FUJM
	Wwqa4pUZRmk/1TPoM83dsom7e0agUeEmbgEIQH+7OgFuzF9aptjGXN312z8ai6O3m2lSWADo/0dSR
	RsqT9qKbr4aEoCoRTpUy8lO5wVqor2ct6Qzjrk2SzEoonqeHgJ4EA9v9YgdugbNdK3U0lwOnMIRXx
	K1YIgamQ3KlwtB5WhFxVOHE9EywrBEn6oSjU2ADgTiAOEwko++JYSJ6PVFaTelL9DeXnkgjaxLDKk
	S2fCdwhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWuBU-00000007rQb-2Lyj;
	Wed, 02 Jul 2025 09:55:20 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWtfb-00000007keC-3GMp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 09:22:25 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-453398e90e9so34174245e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Jul 2025 02:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751448142; x=1752052942; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ad7oUQvI6PDZjS2O6AwRif7/SXK6hLx/gAToo+NgacI=;
        b=sqey03/FzrqqraRun7oJYTpS5iv+5aPDuO+HlF7+i3kDLMXyItysdbbwHRPZvlOOsq
         wmBOa7l0aVVEGkJj6RhiUBcPFKfTxbWiu8oTLx5bntcSf2Sl3FkaDpYlQaW2auZ7kij9
         gaRf6Wmv7StWit7KYIRzAumPKV3/KRvIJS8bdOl8ii0RfxKoseLCWLJSfdnyVXjeP4x5
         NIJ310XR71nx0a8j3/ohP//0TeFSNBI9/Y/cjWGdjGa+LGHYAPITm4MwRlZ97VCgZ8qs
         P1qN/IY0C/VEyW6WlqGyMVMaVKWY187rgJ9b8+W1sitRB8ld5v3RrnzEmLs15hZbGwRB
         32OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751448142; x=1752052942;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ad7oUQvI6PDZjS2O6AwRif7/SXK6hLx/gAToo+NgacI=;
        b=Z/ZnToVAy2F1/ibLShbbb4zvmwxj4dHvgJTl0Wati3sAAXVFaiRE/smb0DMWbvxW87
         LZDVOvqRoqXB41MHv/GfiYObDV2M5F+8+PCWRdtN0+anppj7Om5hjZUMkXeRcbWdgyZ8
         C9YjBYQ7GO/dZyXv/irec2tgY1MDkJNEVq5X0axfBytGOp7epz3onpuoDU/IXRkeAUWu
         9m9Mng/TYxDTPr+WT/szY9zw3WkKm09cqVXcpSN9GSmpMdNMRrMcJInTEiZqElw+VAyb
         bj6sOCFnjfJ8wUUagl1RDTDKHLP0MvLxTOrwd0MKxOuixPB4xuzW+nlO3k84cFkIRZ0/
         SlRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtYaRlF3e8fkYC7ntY61wPAX4+sMWk9icB/ZUgMTFmoyLYGG2zLfGzl6T2SxHPoXtOkrdy5pcjrgKkMTSDPQJJ@lists.infradead.org
X-Gm-Message-State: AOJu0YwlCUF999xtgQW32G/+0xsLLffTBw35LebF2S0oQBxOItAW0Qe/
	/Mi+pMx+Jtn3moXd3RD1RpP1rt3fJqgErVDAWWHw4ZCWBVTqXtY5aXAj2UkQ37paXNs=
X-Gm-Gg: ASbGncsWT+YZsl/N0pH7omwX1Jb3nbokGorLlu29/zzrHHbWrrqSkkkCwNVl7UUbWpl
	z1WKiK7E4cZbx60Ku0oxoKHABQwFJo1GZ3993WO22zZ2rPWPyyAZG4DITuymrcvmV0jH+QAZbQ2
	kmBGFxnKNDzDhl7S9bBvxpK0GpYR5AQu1BpJ0vApNRej/AUZG13D0gOkGeVL4szw1i3kvNR9OFw
	1woXDo3NANEWyN4v/wERqOBXH0C8d+5F6wuhNsgnH8F9PVP632jclxMhcT/2DxLud4/rX81GWm8
	18jCFvbM5I52qdX511bCLRn8tGV6TIKAraFQsAfEEwTF4HSeOWyVmg==
X-Google-Smtp-Source: AGHT+IHQETB8lTm9+hLI/dbMN3Wi3OJ6TYb3T/RQNRaI++EeI7AdPVaW+bjvnU39OB/wmNc6zsXphw==
X-Received: by 2002:a05:600c:c110:b0:453:6f1:bdba with SMTP id 5b1f17b1804b1-454a37a0c5fmr13465465e9.20.1751448142277;
        Wed, 02 Jul 2025 02:22:22 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8827:d0e:25e:834a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a406489sm195844165e9.27.2025.07.02.02.22.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 02:22:21 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 02 Jul 2025 11:22:14 +0200
Subject: [PATCH v2 7/8] gpio: 74xx-mmio: use new generic GPIO chip API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-gpio-mmio-rework-v2-7-6b77aab684d8@linaro.org>
References: <20250702-gpio-mmio-rework-v2-0-6b77aab684d8@linaro.org>
In-Reply-To: <20250702-gpio-mmio-rework-v2-0-6b77aab684d8@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2887;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=NelkNx3yrqHzmKm2P1uPmiOUgHjfGOUZnOiW3Ed2H8Y=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoZPpFMFRjgdJp4gN49lAUNyNScZLj8unAUrqxA
 TlGQdopYPWJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaGT6RQAKCRARpy6gFHHX
 chISD/0d2nxJ4jqvObUkaYOTAp6yEzU4nhTwpX7uYqr64Dq+PtpZ0mZAFVY/NilwEGkXXfz1CWi
 TUw2BGeG7k10VEtCpBotWOdH6w5cWVIPfvQjh+kQMWL96vEyrzUEcoN4+6iErIQM0Q1L3M4rzVi
 C+jlKTMK80v7u4BJKaP+kuKGsiBH8cvzsER0antU/WZ6WuUXL6keXDYvALIXKhxBqehKtfB0deA
 v0OexUV7IPxSBg98BRmwBjVEWlxD+HvgSEvy9ZBnu1X9u/WAA+aTSjaHLAsi+6k4YdYLjl2gKal
 6612WKkBYi2/cJ22XtHAjknibKyq9wrS7xuQD8V56mLNA7w0iOHcnV93Vs3W9ZMiUL0AoNPKwE9
 m/fR1k3A7kWphQ5Q3VMgqi+aV8zCUXZmMLwfKFv6f32koHxxWKX39CA5LpDyL5IvwOxzm195H+o
 RuW6C10tv+gz0f2TByzxFwk3nn6N45lFQZOhqfQAL8nKCQXLunrRx9Sh/0yWnqPfbIoyywtSZZv
 eI6/gvoqMjywrdrDAlp408zqK35N3ErsruQZXDtdqJzAi9H8Exi9S7kMZ+/g3e1eB24NE59zBfJ
 b7idsPFZpkR7NjLvnhJ1Bed3Gffj4o1ZpAlaOy9bpk1U1l28+laiFglLyJIi3rY1TjUpfHGPeB9
 YGUMmuT8qWsmIOw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_022223_836703_CD47EE8D 
X-CRM114-Status: GOOD (  17.95  )
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

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
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


