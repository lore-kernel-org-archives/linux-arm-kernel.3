Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7371C83F09
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 07:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FP1ZIJv1PeVV2n8Zz7UzEHnFrb/L/XYOOnuWBlLFluA=; b=cqqEnQJuI+FwqiIMKc4orw+UEE
	ZHF2ywXx8+7M0K5xDO2H3YZhhD36YQNWf0K6twtaJloA1VR9RP/8sLhM7jhLWEIYMk+6kvU57nzx7
	mPQbRmEjhbjUFFhHFKUPQ37J4QhMpsyGCpxezajrkLhmBXhFeIQ6zGgIPMu7KeXxchWWWGuHlb5b8
	XrP8aIgW1s+lMXgatjmjgnFV1PjFLYK4E7kspGZ6eaKwjRQC+SZZT9ufOgNy04cGSOOso78ct9u0l
	MEO36wa3dNwiojObmZ/3QPPlxO/P9h1Al5HMTGA4U453/XdhJNfdU/2tdp+ak2xDhhfFGoC16ZHA7
	WWpFy5bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZOzT-00000007mSO-2rho;
	Wed, 09 Jul 2025 07:13:15 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZOVe-00000007h9h-2ocr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 06:42:27 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4537fdec33bso32364235e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Jul 2025 23:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752043345; x=1752648145; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FP1ZIJv1PeVV2n8Zz7UzEHnFrb/L/XYOOnuWBlLFluA=;
        b=Z/ioYKSGSj2RwenN8P9Mu3wQDtUEFp2qjpIhaF+bZl7GPwTMTf3gxPruLWGjiNWOaF
         UHu4oLnYNDIlBOQFneUKamGVObr4kHtS6o6LC9ymts0Z+qfkoih74+WqYHdIuUkhn7Wu
         lx8QNsMDwqMt/eANuq7x/EsvSNZ1Stdz1EUdneC+PRaJ0EmDj7xVa3ee6qwWK/teStBd
         9HV5xOtOwWjtaHW7pbnk7xYlcTsx8cfZIuHrVuKPfcFcaNDA7+ExDWGEm5EKQvb41BQ+
         wBkHgySklbdV4Xo5Th/P2iKwwtu4r1gKis6wsOWmE1L1gFEuKgCWH4sxJS4g+iSDimKa
         micA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752043345; x=1752648145;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FP1ZIJv1PeVV2n8Zz7UzEHnFrb/L/XYOOnuWBlLFluA=;
        b=LYGIlZaGH11CytILDHuPfPdsureGRtNtPQhBvllQq+DY0Kkm8wlm2sL3HQHyrgwpOM
         T7o5UYQAbGUr3Zudc5KW0YA3ZVeCicKH82wAfA8n1ZNkiAwW9kxdETnUpHfFps2dQjLc
         5mOG+LaxrU/WpBGlLrP+l/FaAKQ5uWsnn+5FySy3mvx4PmHuPuX/YOUfiJEVdwXzwBmk
         61nGnJOpIea59XGOl4V5ttoub8XPRagKMq2Bhx2fVIEhSNUTyeHZuxDVLHmBAiEYSHI7
         pzBSKBx8gX4sUjXwjMZjytnGn7rtSwpSiBaw06yqepOdxip7bkokIDVuZzcvpEUlM4eR
         ZqJg==
X-Forwarded-Encrypted: i=1; AJvYcCVQfgH9rIDPYdk04QgW9SQ1DvzIjnz87TEFi94syaHZNEytTAxEasNe6DnYEgb9EF2TnyWBIQgH1ol+05qyBRGi@lists.infradead.org
X-Gm-Message-State: AOJu0YxjnxQCpO0KevTVJ3CbBn9mkTfhoFIjTeuyDzVtkE0DDo+jV/ru
	Rt8nMDP5vuYW6thpYaAxMgfbHKPziA8izp4ZOs0Ajmq9wkDijsTgXgG8GXSxFL35DVc=
X-Gm-Gg: ASbGnctuiRoPlZWj/mJNIQ18jmU52ifFKssLr/Yfj+q5maH4gTuTT646gurxjeK5Ui9
	OtKWl6yVb8nOE8u15Xz1cDwofPjVweBLinlP0wkzbQ6q6bq6BRsY9J0nIQXBGwYCBQY2J6Bo4Rz
	tnVWgnPBNp93NVRbNo1wyZ9Y3cb1+zmXr8Ikkk8w4K24jNNtiT16LXlZiysVbxfFvMH/8Vy0cYR
	KfXZyyy5+r5IGeoqwwJfPn2oiP7dowPsDrVoIg11h73m7r/MJlM1m7yeSCUAd/RYGAMtTsMnDO+
	lsr0qzDrWSreWVDbrjLrAiCHTOuisU2NvbHu3CG2V95usih/B7DwwIh+
X-Google-Smtp-Source: AGHT+IGoJ69ezNTOtmmhAiNL+5pDkJp8ZCkFur0QRkzgVB9fB4r3QAFrgHAALDoXBvTb2fqHyMWaTg==
X-Received: by 2002:a05:600c:83c4:b0:43d:ac5:11e8 with SMTP id 5b1f17b1804b1-454d538f8b0mr7399745e9.21.1752043344951;
        Tue, 08 Jul 2025 23:42:24 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:b04e:cfc4:3bd9:6180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47030c443sm15115341f8f.11.2025.07.08.23.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 23:42:23 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 09 Jul 2025 08:41:46 +0200
Subject: [PATCH 09/19] gpio: xgene: use new GPIO line value setter
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-gpiochip-set-rv-gpio-remaining-v1-9-b8950f69618d@linaro.org>
References: <20250709-gpiochip-set-rv-gpio-remaining-v1-0-b8950f69618d@linaro.org>
In-Reply-To: <20250709-gpiochip-set-rv-gpio-remaining-v1-0-b8950f69618d@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, 
 Srinivas Neeli <srinivas.neeli@amd.com>, 
 Michal Simek <michal.simek@amd.com>, Nandor Han <nandor.han@ge.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com, linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1655;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=Osm+ULbHr1nM6uy+4Eu6nmXEimCDO9FqH7az0zHp9wE=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBobg9CfTttEp2sdK3tnvuV3eWY86ZQPneyybyso
 AJNq7R+x76JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaG4PQgAKCRARpy6gFHHX
 cmqfD/9PGgPW84uUengf1aZQBpsaDyUggIrJmREh1u2hZWuPJFXBaN+3WznK670S5teqOMS6omm
 3EhWkN5cICq4H9li8m3HHy7140h28isSYmzw6f0veoLdVX7P+4Bx0v7nEAeTj+coGtZsJXhUGX4
 ozcpHJy++C273DjQAGU+Sujyngy91hNZ6B4RHs5K55y6BWWIFbuHO/ES2FICBgVIowFPMDE86ub
 ATXYUAHHFp7Dsnnm4jpNIKki4RxHWQEqSyXFKyg7s5+mtrHeHnt7cxxrMMA7yaRFozCYagvAmep
 ZqJ5+ACll/c3Li85S+WwnWwB4Bd2YTEtZqZajNzkgV9iEVw5NEzHW6tIBFmuJfI23zxcg/9AOhK
 utgtgT+iJ3Z2NPBnvfWhfT0WTeNYVJlWnpECn5vCOZTjesBW8rJ1QeNAnVjGfbBMY8EzrKNYGXP
 s1/KRIIjVzH60FYXKjNHlXa8DFQRDhhI7zvlCZyhd6TZy0glMOFrehdgeinqWkIlCaazSKtOTRK
 4XxwvTBmSoGrii9pDpmkH2RAS/33u7hvAVrYPQQWyQ2zPa7aQqL4t71l7jGLzheRYw5skZtotkq
 Oz3olGmhC+VRmgFL2YHC6kgdYWvLOZqxNFGRwPgV38bTL3GscQQrVFfg3+0xBzOaKlq367GFopF
 4n6tYRdQwj79h5w==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_234226_722304_25CD7839 
X-CRM114-Status: GOOD (  13.48  )
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

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-xgene.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-xgene.c b/drivers/gpio/gpio-xgene.c
index fb4b0c67aeef46a3810178a3a1b6870d04c8ecdf..28f794e5eb26c06088a205ac7294a226fe63843b 100644
--- a/drivers/gpio/gpio-xgene.c
+++ b/drivers/gpio/gpio-xgene.c
@@ -62,7 +62,7 @@ static void __xgene_gpio_set(struct gpio_chip *gc, unsigned int offset, int val)
 	iowrite32(setval, chip->base + bank_offset);
 }
 
-static void xgene_gpio_set(struct gpio_chip *gc, unsigned int offset, int val)
+static int xgene_gpio_set(struct gpio_chip *gc, unsigned int offset, int val)
 {
 	struct xgene_gpio *chip = gpiochip_get_data(gc);
 	unsigned long flags;
@@ -70,6 +70,8 @@ static void xgene_gpio_set(struct gpio_chip *gc, unsigned int offset, int val)
 	spin_lock_irqsave(&chip->lock, flags);
 	__xgene_gpio_set(gc, offset, val);
 	spin_unlock_irqrestore(&chip->lock, flags);
+
+	return 0;
 }
 
 static int xgene_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
@@ -176,7 +178,7 @@ static int xgene_gpio_probe(struct platform_device *pdev)
 	gpio->chip.direction_input = xgene_gpio_dir_in;
 	gpio->chip.direction_output = xgene_gpio_dir_out;
 	gpio->chip.get = xgene_gpio_get;
-	gpio->chip.set = xgene_gpio_set;
+	gpio->chip.set_rv = xgene_gpio_set;
 	gpio->chip.label = dev_name(&pdev->dev);
 	gpio->chip.base = -1;
 

-- 
2.48.1


