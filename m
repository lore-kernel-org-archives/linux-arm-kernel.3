Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABB3AC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 14:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=42qfBZRks5CGXOIurF+J5eyvnPR1JOmltRDytTpDnik=; b=eFywdjJ4d9Z8Ge9mMJDq12VVRw
	DgrGthyCGOLING5sLXUpsdWCNZj7KUGlkHmYOMTlJQs+xrvIvkMkghpQMW13MYwz9158oWnvkwG/E
	c4qTDBGeFCEz2SENrfhTEe4ARVrx+D2unxE8sa0KfmGYH5D3EkkgrwO9L2FdxMgGiTJ3bHdIAjUhc
	HyywK34stmJkBPWxtFT3knH4k53aI8BZa9UmvFsFzL++/WvVQYCsf6Bqx0nZyq3kKTeBPTD5Vq6Ul
	ocT1JAfMWIip9t2ewJ6U7ydbyW258w2bhoupRN5w9hBQC+ALt0sFQkO4aQIi6BL5LMLfHtWH4I/BS
	ea9Q4q7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU4In-00000005pge-00VE;
	Tue, 24 Jun 2025 14:07:09 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU3go-00000005i9b-43fX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 13:27:56 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3a589d99963so5212758f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 06:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750771673; x=1751376473; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=42qfBZRks5CGXOIurF+J5eyvnPR1JOmltRDytTpDnik=;
        b=KteyGkb95m2EaZNRjHy6st+kIcOOxBZjpFkhA0LemVRaiRR2y0/0r33SznXuHX6Y1Q
         U+REIVT6XueEHDcJVYf7YeN3ijCacealS++bUpFIDnQ70EaMOkqcloE4F0KiE528oIsI
         A2JSa7bdHgzn+Wi3tkY42PCO07AOHV9NKmujrOZPKYhOmqvmUo2zO9zJs5JhiKMYa8Pu
         VxfQT8MDE+aHDUIaq+PnFJi5mXV8g060ZRF/ocBRoTbUfVekMzxEOOUD5mFxhBO4lu0o
         y4H3neNZkECY97quUKfMvvMc7lLLwtdyF7COhct4C64x/8kP1+NIM4+aUXRLAEauqS9a
         i8Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750771673; x=1751376473;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=42qfBZRks5CGXOIurF+J5eyvnPR1JOmltRDytTpDnik=;
        b=wU/5LYnEWcFwX5/SiHh7ZyXxaIJqYWHAGheW77gQv8bWTJP+yrP8W+tYob5iVtq3k+
         03mXlfVhVTENkaExfcm91LBOQETMB6sthgID9+I1dIZrPx2+oFbGGdc5do4clu0hvULk
         QyHeCt0BmJYrSRBDBAk8fVw12RdIW03dHq7gM5nF77zEv0e1V7MEGO9s1jhWMu2Dfghl
         r+qipcmWsHqtPYuoByZrkZhXc5eJXySZDL9mnfKfkRJoy7MeCIUqqUFcFm4hJ+3IybG8
         uoP/3yWw4rEMs/tkVcV4gzaO8RqsIHJ6ltFwockLJtovFm+0WTmFwC/JJNjn16FlBdYw
         AFJA==
X-Forwarded-Encrypted: i=1; AJvYcCVmP25EZ17FCPyf3IHCeRY5y4MF0Sho1P82Hzm5zwcKo3XmLUNFBZ/xa83mzotRjHj9XMbQjQuZv29gsba7bIok@lists.infradead.org
X-Gm-Message-State: AOJu0YyBbwQvxPiwjMhspD0UJVaStRP+W5yZpOmsrWnoSDzahSp32PmK
	gEj0KaD0ZDclmlbzeu0B4py87y4JKOtR2aSvnTg9aiQt4i1KmTCwPzbwKpsvRpcEx2Y=
X-Gm-Gg: ASbGncteX9C8H624vzAH8a29pI0QD18UKE3rtnav8LrTq6nFX6rtKxiU4aKbnkgzUKS
	RwonzIuxd/wfkS04U4UdEMtDYHxupsF+AbifRIa2E36XRgn3y5hlVpggt+A0NA4zBRSC4Ivn/SQ
	aDQ/uBG2LJf08yVdS7In1ZgCJo4IeDHEvchoA2lJRLwirqvSb6BHyxTRlFtmniZcjviae3YVkwf
	O1oaP9YBsGD9+7u0mstmOsRjClzrUqFCewIFGft4tkO1sjWxFafEbCF+evMM8FTwpTyh3Gh5UBw
	mUuKnPLAOTklfa2M6W32n/kicQX3tk7xt2cmrCcXPwu12xRA7vS2gic=
X-Google-Smtp-Source: AGHT+IFDRcE0YvqSWvzHsw8Wjp0saBNngEo6sSuauX4WB6eVnw9c+hFTvCibFA5/V90NuJg61q4Heg==
X-Received: by 2002:a05:6000:2289:b0:3a4:ed2f:e80c with SMTP id ffacd0b85a97d-3a6d12de8f2mr12964118f8f.31.1750771673236;
        Tue, 24 Jun 2025 06:27:53 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:34d2:109c:3293:19e9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453632312a3sm152588485e9.1.2025.06.24.06.27.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 06:27:52 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 24 Jun 2025 15:27:40 +0200
Subject: [PATCH 8/8] gpio: en7523: use new generic GPIO chip API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-gpio-mmio-rework-v1-8-aea12209d258@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3776;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=AkIiGyeUQx2GXJPFGzxHW+/s0um0+Eyc9TO0+IVjWog=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoWqfNCGRfJkuzmVlo7UHdKOCMgJbG51c0tv17w
 mTEfmkCEeOJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFqnzQAKCRARpy6gFHHX
 cqKUEAC5HbCZgPEeSVMPAxNIYtukMgkpkvILoOnfoZLy8Pl6S+b+XsBUpG7X54Z5vx8BIdse5eR
 WuppKaqqv+DuFJsXPrA50NZq1NCPdiQra22q9AjNGL3BTp0MXZ37jmEwtT6EJ2HacV5eQvfb7Nb
 rZxBQ361MUGhBAH2Msvr6t/W39ttDaJ0RKpFzj6uLBHQZOxNqGotiVliYPKlnyQGXWmrv4FBzS9
 kpg1YJUct/gOoO/PXlqnTBlGFxkzo4g6pHxwrbR0OtABwZ0z797oeG8RJ60QWR6s3pvDYzF2oFz
 BKQh9SMvemblHJk55DfIKwx/8kXdYX+pTfW5/3q7RedjqXrGE33DR0eheSFN+hAx5em6CvDGGkD
 HJMRagpzEjPa3tXwKXUimxbJkSFlKOXCdEDCcYreD+SET0Y8tiK9HxQmy35v1ROrbwfXr7mWhnZ
 SNW2P8YD9YU08TELbFHP2feCHm4vw+7ftG+2l/3CnHlV2OG76GPcpWgVUAOBdsp+okHA1R4bLFb
 q3V0ydqrnvAJqV5DveHTqalUW5R3EqB0P1nMOq9vWQo1pymffGyoH9IcWVNu7vMkhkuBuEbAFcY
 9ZC1JZakPmq8qio0JnQ7bk+XCS1COTJ5Q6L0+54Uipo0vwctNVHV8uCjD+1yCSQ0NpLm0MVRrBY
 jH77CQ/Ax7J+MaA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_062755_013439_49F4834C 
X-CRM114-Status: GOOD (  16.13  )
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
 drivers/gpio/gpio-en7523.c | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/gpio/gpio-en7523.c b/drivers/gpio/gpio-en7523.c
index c08069d0d1045e9df4a76cad4600bf25d4e3a7c5..cf47afc578a9cea1fb1adb97f51b143b13c66ab1 100644
--- a/drivers/gpio/gpio-en7523.c
+++ b/drivers/gpio/gpio-en7523.c
@@ -4,6 +4,7 @@
 #include <linux/io.h>
 #include <linux/bits.h>
 #include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
@@ -13,28 +14,23 @@
 
 /**
  * struct airoha_gpio_ctrl - Airoha GPIO driver data
- * @gc: Associated gpio_chip instance.
+ * @gen_gc: Associated gpio_generic_chip instance.
  * @data: The data register.
  * @dir: [0] The direction register for the lower 16 pins.
  * [1]: The direction register for the higher 16 pins.
  * @output: The output enable register.
  */
 struct airoha_gpio_ctrl {
-	struct gpio_chip gc;
+	struct gpio_generic_chip gen_gc;
 	void __iomem *data;
 	void __iomem *dir[2];
 	void __iomem *output;
 };
 
-static struct airoha_gpio_ctrl *gc_to_ctrl(struct gpio_chip *gc)
-{
-	return container_of(gc, struct airoha_gpio_ctrl, gc);
-}
-
 static int airoha_dir_set(struct gpio_chip *gc, unsigned int gpio,
 			  int val, int out)
 {
-	struct airoha_gpio_ctrl *ctrl = gc_to_ctrl(gc);
+	struct airoha_gpio_ctrl *ctrl = gpiochip_get_data(gc);
 	u32 dir = ioread32(ctrl->dir[gpio / 16]);
 	u32 output = ioread32(ctrl->output);
 	u32 mask = BIT((gpio % 16) * 2);
@@ -50,7 +46,7 @@ static int airoha_dir_set(struct gpio_chip *gc, unsigned int gpio,
 	iowrite32(dir, ctrl->dir[gpio / 16]);
 
 	if (out)
-		gc->set_rv(gc, gpio, val);
+		gpio_generic_chip_set(&ctrl->gen_gc, gpio, val);
 
 	iowrite32(output, ctrl->output);
 
@@ -70,7 +66,7 @@ static int airoha_dir_in(struct gpio_chip *gc, unsigned int gpio)
 
 static int airoha_get_dir(struct gpio_chip *gc, unsigned int gpio)
 {
-	struct airoha_gpio_ctrl *ctrl = gc_to_ctrl(gc);
+	struct airoha_gpio_ctrl *ctrl = gpiochip_get_data(gc);
 	u32 dir = ioread32(ctrl->dir[gpio / 16]);
 	u32 mask = BIT((gpio % 16) * 2);
 
@@ -79,6 +75,7 @@ static int airoha_get_dir(struct gpio_chip *gc, unsigned int gpio)
 
 static int airoha_gpio_probe(struct platform_device *pdev)
 {
+	struct gpio_generic_chip_config config = { };
 	struct device *dev = &pdev->dev;
 	struct airoha_gpio_ctrl *ctrl;
 	int err;
@@ -103,18 +100,21 @@ static int airoha_gpio_probe(struct platform_device *pdev)
 	if (IS_ERR(ctrl->output))
 		return PTR_ERR(ctrl->output);
 
-	err = bgpio_init(&ctrl->gc, dev, 4, ctrl->data, NULL,
-			 NULL, NULL, NULL, 0);
+	config.dev = dev;
+	config.sz = 4;
+	config.dat = ctrl->data;
+
+	err = gpio_generic_chip_init(&ctrl->gen_gc, &config);
 	if (err)
 		return dev_err_probe(dev, err, "unable to init generic GPIO");
 
-	ctrl->gc.ngpio = AIROHA_GPIO_MAX;
-	ctrl->gc.owner = THIS_MODULE;
-	ctrl->gc.direction_output = airoha_dir_out;
-	ctrl->gc.direction_input = airoha_dir_in;
-	ctrl->gc.get_direction = airoha_get_dir;
+	ctrl->gen_gc.gc.ngpio = AIROHA_GPIO_MAX;
+	ctrl->gen_gc.gc.owner = THIS_MODULE;
+	ctrl->gen_gc.gc.direction_output = airoha_dir_out;
+	ctrl->gen_gc.gc.direction_input = airoha_dir_in;
+	ctrl->gen_gc.gc.get_direction = airoha_get_dir;
 
-	return devm_gpiochip_add_data(dev, &ctrl->gc, ctrl);
+	return devm_gpiochip_add_data(dev, &ctrl->gen_gc.gc, ctrl);
 }
 
 static const struct of_device_id airoha_gpio_of_match[] = {

-- 
2.48.1


