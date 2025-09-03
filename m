Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A79FCA100C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 09:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jRYNdQy943R+RbklVUnqdkNQm9znH10Kv6CwsOXt8JY=; b=oEf/7xpJ2iuGWDgScpMDfiHcRj
	Ik0ZfsT9nMry+ZHi2cVzSNJWiaKQntRmgPwINLSJwggwzFbZ46nuN5lxi+XO089d1M2kqy7HArWkt
	g8/qwWEizHfG4hisDPc1BSTRmMFbZbNEqZF7JLUWBPBvRLC2z4zgCQ7AArt8cFgB5v6rIbbONX5L1
	2R5bnatcecTnpEPp75Jn/78ZusKa+6tac2DDaY9GOP5wYE9UxGGW/JC8JmR7eZ8N29MjbjdDen93r
	IaXSsLY/fPqPGh06WHdZhfXpV6xxNa7gC8lTmB3M96gDE4da5g36UBxG19qAlCQgN6+lh3ldtTsYp
	3A0eRYoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utjii-00000005vAX-4Bdy;
	Wed, 03 Sep 2025 09:24:01 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utiPv-00000005Lo5-0wGZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 08:00:32 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-45cb5e5e71eso1840365e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Sep 2025 01:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756886430; x=1757491230; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jRYNdQy943R+RbklVUnqdkNQm9znH10Kv6CwsOXt8JY=;
        b=rPY4dQw/aWfsel6l8xe5yexEp56nEZcGHr6JnvwQ0+uxvPSoBQizW4BWpERhcoNUuJ
         SDpif7/HCrDCE3uDxvCSLh7BTyxvZSaK+Lteh7rDDuuTaqgROH2zQBJS7b+2inoFWoNx
         rxmw43YfMyh7DG5QDFyVO+8zRfMqQYQ9lo6RP+NNMPXBH/rt/hiiIJ7Rmz9qMKnzO1l+
         dlfLj1kRR+deFVWaZxtKKWFRaKTvIF8ngRymHduyNOd1eGLf1uf+svTVuwXsgvoo6jDd
         WRF+mGRvVFc+CK7+ddeEWo+ORLzMQEJbHMTbTMU0xbJDqTXmOI64kluRoQnEBYvbO0G2
         aYzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756886430; x=1757491230;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jRYNdQy943R+RbklVUnqdkNQm9znH10Kv6CwsOXt8JY=;
        b=pVJAJTK64dDLnAptBWY8D4EMpivxxLSWXxn1xjFZdkrMAVJ3QT3wrwEnIy9l6O6BLw
         +vEe2HZ7arzNCdYh1R78He5OMtAH7aaeVi6ydJGQzbEXcNrCwWxwYHLJ4fkboiUcVnA4
         biF07htloZyDObpGLE8cGhC87UZCCK7d37TOtCig92KXUD4cQsYrbLSRf5v/X2/Mr35H
         R0lLBwMr1XrjCHTzLpE1POxYGM6S57r5ak298Kblu67r3JHWKVVjNzQCnRD4DiPpgOTI
         YBG6tVvXo0Wi3wfSNfl/Ed9WpDWGBKnbsyA6F4W4GtDhzBaBbVuWoouVz/+uNSeAARFq
         3veg==
X-Forwarded-Encrypted: i=1; AJvYcCUPikmJAG/Da47cS1VTWw+8BaAZ54pSFZmxaE0tK4mN1nNxCq5Xolo8sjIJ1YgF+VDphrkWLZrVNvhusYCIomEZ@lists.infradead.org
X-Gm-Message-State: AOJu0YxvEg3UW+dG2unvrBI7ocZnRV2hgEx+0tu9HP+4py61XeT1Sm5O
	Mr5VtfrwtF6mI8NUE4qXLd2rmGfU81M1OQUoPJbkVT6NHgtuxsgleUAxVzCBSPNGaVY=
X-Gm-Gg: ASbGnctoUBTonnzPN8mfT6m3TMpvDuAEg+V8CHmeckmoZGCQ56LjS1rFEANwd6VsBkv
	ChMXbCLRJDPr0pA07W6cRHMYtHA69j1k31hpgNS8ezANYeRNW0iGKQ9QJv8OzL+AznJYxk6fnAt
	73TbQei0jm5zSFAR0IMDS9+MCvuadc1yKa/Y9QnGHwNyg5GwWpQWRkN31AfXRbE7xjQridX+M6B
	ajyffIh71cYE7ebETesLSLZpIxZy7BwGc22mVyrzHWynP5nph407agiUKPzdnSTGj7q9ivIlB0c
	4sN7fUItyJsVBTFpyfkzQszAzGkDi8euqEj6fpvxevUSQYTlAAgkeq5OBodug0+wSNCzuKRzWLp
	Ot2s7lZFH78SiDjjG
X-Google-Smtp-Source: AGHT+IH5L6p5lvpQSzwb9hjpzehXqLyw7I5cuurgC7EW14rbfoWtVicCMxuvWIH2n3XlzV9uLU93gw==
X-Received: by 2002:a05:600c:3f0a:b0:45b:8703:741b with SMTP id 5b1f17b1804b1-45b870374demr111370805e9.32.1756886429754;
        Wed, 03 Sep 2025 01:00:29 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2f8b:4799:6bd6:35df])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b83e954b7sm113331635e9.1.2025.09.03.01.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 01:00:28 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 03 Sep 2025 10:00:12 +0200
Subject: [PATCH 08/12] gpio: mlxbf: use new generic GPIO chip API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-gpio-mmio-gpio-conv-part3-v1-8-ff346509f408@linaro.org>
References: <20250903-gpio-mmio-gpio-conv-part3-v1-0-ff346509f408@linaro.org>
In-Reply-To: <20250903-gpio-mmio-gpio-conv-part3-v1-0-ff346509f408@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij <linusw@kernel.org>, 
 Imre Kaloz <kaloz@openwrt.org>, James Cowgill <james.cowgill@blaize.com>, 
 Matt Redfearn <matt.redfearn@blaize.com>, 
 Neil Jones <neil.jones@blaize.com>, 
 Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2146;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=66g+H3iGl27thfIix2l/34o5dDtfV0hzZHx7E1sHzqQ=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBot/WS4EuSeP3PwfBxTOs72QjuheD/aV/Ni6ymV
 0R85woPrZqJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaLf1kgAKCRARpy6gFHHX
 cu99EACjetDxjcdWuhQTiim9N6kLVVSx7Bg1OPnDIbnP2BjHXSd9Ipf/oD0zErLFA2hokK203dl
 2yu5aYgWG3HNeh+U+pcwQ2yc7SQR39jvjJ37VMdfAcPjm9gnW3SJLwNVLTYe6dxNh4aBJ91QVBN
 mtJ2XewpBUW4VuAJEKIkZkJYCtIFVkmQXHzYGIhOxbNljjSvcSWpxkk0joyMI0rETRkAcGqiufn
 GFx44a7XzxlpRJhBw5Py4BT7XCmwQ9baqnSe6fgbAYEqo2v/kn56xhwiBzxQc/YKTskAwnjN+6T
 8xobT+KF1HFXRCO9DR8gIXeaDNJK6sZbkjxMmXnT9Z0WgQxB15TNmVRrpDFzrcGGuo1Qq2pSnxq
 FaA/+P954JOguDE9aUgs9YJIcrWEGAn0O0qHGVBDPX0h1w4w0uS82lSepCfAa/toae3I+KatPyU
 COeO+QOJDMtrpjZVerEvf8e3CwzACwu8jAHcIq4xZFCZzoRGRrN1VqPD28gPGNuNIbBK1C47Lto
 O+aIbE4cvJwnWMb8EaeMBIm1tWoXDnOgTE0+z4snPgCOZNYbacxIUhKFbn1FcSB4+qJBf1X5iNe
 ERWDsjlC7YldDGwz1/3kAXitm7JMIppy3uh8mO7gcxSKpPIuWQ0HellutijrPGYY4L1hc9r2k9X
 8Rig4aSbT6TG4rA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_010031_279307_3333F490 
X-CRM114-Status: GOOD (  16.59  )
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
 drivers/gpio/gpio-mlxbf.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/gpio/gpio-mlxbf.c b/drivers/gpio/gpio-mlxbf.c
index 1fa9973f55b96a4b517b5864ffb92fbbf8626053..843f40496be7b723c300b3ea2f19fc698a56abba 100644
--- a/drivers/gpio/gpio-mlxbf.c
+++ b/drivers/gpio/gpio-mlxbf.c
@@ -4,6 +4,7 @@
 #include <linux/bitops.h>
 #include <linux/device.h>
 #include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
@@ -37,7 +38,7 @@ struct mlxbf_gpio_context_save_regs {
 
 /* Device state structure. */
 struct mlxbf_gpio_state {
-	struct gpio_chip gc;
+	struct gpio_generic_chip chip;
 
 	/* Memory Address */
 	void __iomem *base;
@@ -49,6 +50,7 @@ struct mlxbf_gpio_state {
 
 static int mlxbf_gpio_probe(struct platform_device *pdev)
 {
+	struct gpio_generic_chip_config config;
 	struct mlxbf_gpio_state *gs;
 	struct device *dev = &pdev->dev;
 	struct gpio_chip *gc;
@@ -62,21 +64,24 @@ static int mlxbf_gpio_probe(struct platform_device *pdev)
 	if (IS_ERR(gs->base))
 		return PTR_ERR(gs->base);
 
-	gc = &gs->gc;
-	ret = bgpio_init(gc, dev, 8,
-			 gs->base + MLXBF_GPIO_PIN_STATE,
-			 NULL,
-			 NULL,
-			 gs->base + MLXBF_GPIO_PIN_DIR_O,
-			 gs->base + MLXBF_GPIO_PIN_DIR_I,
-			 0);
+	gc = &gs->chip.gc;
+
+	config = (typeof(config)){
+		.dev = dev,
+		.sz = 8,
+		.dat = gs->base + MLXBF_GPIO_PIN_STATE,
+		.dirout = gs->base + MLXBF_GPIO_PIN_DIR_O,
+		.dirin =  gs->base + MLXBF_GPIO_PIN_DIR_I,
+	};
+
+	ret = gpio_generic_chip_init(&gs->chip, &config);
 	if (ret)
 		return -ENODEV;
 
 	gc->owner = THIS_MODULE;
 	gc->ngpio = MLXBF_GPIO_NR;
 
-	ret = devm_gpiochip_add_data(dev, &gs->gc, gs);
+	ret = devm_gpiochip_add_data(dev, &gs->chip.gc, gs);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed adding memory mapped gpiochip\n");
 		return ret;

-- 
2.48.1


