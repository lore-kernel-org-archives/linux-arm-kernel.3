Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DCBBC5B552
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 13:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rKbs3ygxvSdMhEMPUeqpo77fDElOIDrrqF0rfeM3cmM=; b=LOUUaPy1/geeNnaqEEdWF0/SIl
	NtWNG8eR5X8XLoSmLmlo1zGyK7DganczT+/j21ovQlzc21UIqkaGEA54sSitKBXIjAXF7ykX2QvL4
	ySZugw/oVO2hYRwAy11/fYPmJpcKN7YSekm1ofr4QbiALcZTeSiw+BtSgRbGhzecOxBeNIjBLIpJ6
	RN8joqn39lDXvUFSM/n9YkU7wlR4qEyyutmow3UJ/UEXOwNPUU1CVxjPqW3BmoNon8uTtG65zswxZ
	2MjBQOApriGq4bVvrN3cE2fs8vTGlbxuM3awhNRmCtwlpRyMGJczJeeJmVF1rDNHChHcMlZBd/soT
	jfBJJdWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOzFi-0000000711z-00iM;
	Tue, 10 Jun 2025 13:42:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOyAV-00000006mMc-00yP
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 10 Jun 2025 12:33:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=rKbs3ygxvSdMhEMPUeqpo77fDElOIDrrqF0rfeM3cmM=; b=EKmrAzndar7b1+8daOAWynC2zf
	ZaKfBXnfkw1NRBlYYE6UF4mKuiVa9zg2q0nG/tlESnAB+wSY91bRbWxXB1IcKbdOSzY/gFU/HrQQY
	EXRkzx6L6NDCe+KxZ9S/v61BuCV3+eCGt8E9/8kzhdG+n2j8O3xC2oEXBHZV2h5+mmc0joDweKDXe
	HYYy7GyDNUgYELONp09TtwcfA43Kov/ytGB6trODN67vZeN6GEzkaUp5DktlVvZa3J7QJOX9rfqBf
	NsUfEvurWftM+hBsqX/KQrO0ZiG7is1jnkP/fX2hSsmL3SILGzSu2kNt4iONiL0LiIQKIaV8qdWnS
	1lMAksVQ==;
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOyAR-00000001oUm-2qNf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 12:33:30 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3a3798794d3so4623142f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Jun 2025 05:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749558806; x=1750163606; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rKbs3ygxvSdMhEMPUeqpo77fDElOIDrrqF0rfeM3cmM=;
        b=qZa6YjJReEM80ui7gYRF/v5/hz19tbNSftAmL2go/89Ws/Qj+L7ZKAa4/fIkItm4n7
         KGigaVgeYlYQ+kXz+rAElSHy6nbojOdLEhaOwZs4FhaZuU/9trwAS/p7hhW9OqM6AL5n
         VjwTBW6Dw7y+DuIivYDfPUA6poNEKuUBZRvCXGAKmKByJyTL+IhjxHBEuE1TOsSvC7gO
         +fCG7/NArwcyxevejPjkhal1bDCY1N8YRhqA8H+64Q2dwmyqoe19mOx5e56hfhYfOHFA
         H+jEz92HUQlNtZP+HgJN0dlBs2ZOShal1+aTLcWpju8lwdPH+1h6SOdCsU8O22TQDyZg
         55tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749558806; x=1750163606;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rKbs3ygxvSdMhEMPUeqpo77fDElOIDrrqF0rfeM3cmM=;
        b=qBPBwNulsL1fgZnCpU8qyvfUhLqs4FFzEY4tcBpp+SE1ip+G5pv8GMxJNuxI6NlO/r
         VBgmnx4DFxhmXuTwmjgfi7m5YBvQ4HG8HWjqD+nbq1gon4UC13COMpnRCFQDZBr6gOop
         IHgU9NFW5PotkPX8vcCxKN8qJg12uF1Ph/vIT2+bMbHi2mIdO2hVjswTfZS9TiNBlAOk
         0VH0cJ1rUFaXcb4uJI8vf+/LdiwnQcgdp/3K9L/6tPNlNT7pcuGAD1YUUfz852FMttSg
         Yg6DiVeS5jic1Nll/VYLRNC1Y0+UCLPP8siIOuOt1i9AdVS5++s2/I8G6l5qwooccCnt
         M5uA==
X-Forwarded-Encrypted: i=1; AJvYcCW2X4JGfsjbjYiv7YauPCcyHRgOSAOz+v+7WSXbASpxC5PiL3VK1Qf0HM3CWt/4HiMOuRgoSDrY0cUD416VelY7@lists.infradead.org
X-Gm-Message-State: AOJu0YwG/tlSchbm7qsz+4ZP2+g19uQzo2eOHrR2GteOk7bvE4+pACJy
	DL5I7hCvsGp8/IIJyYTp62i56I+8p5fAXnvapK3+D30Dxt+qNamKeXXBT2+8va9nv9E=
X-Gm-Gg: ASbGnctssWuTX+1Fyos/vXLbpAMxhayPqJz1aWq7/06qgtn0fc08LkgjZ86lFeTyf2O
	ukE87yyZRdbBQ34WVHD0jYdz017RXU3GFa5kFRa1XECsXwb1BXclolq8CidKK7vegUx94c7/uy6
	tUlFpHzePDP996gsw8dh2cFhK8A1YWSF/UrCa7maqVPpHerGSVP9UQ0mOChuK/j93xWJyQT8w54
	XLGqfYqM+hUjBaeng1oekf+iG5mo8NamQU+VuVMiiIz/G10wKGCssfs8dFe55BpEvNHHFYF31WQ
	dtt1JbuijQLDvL+KCH5zqnGm9M9LJPOF1B0sb7qUtzJRlN359xQyRw==
X-Google-Smtp-Source: AGHT+IG10zG//yZ1b7GgucOGjVy/SV3P0HD9SPfMOme6APoyX0obpAM9Jiyhiw0LZzEqu8UJWmYDxg==
X-Received: by 2002:a05:6000:220d:b0:3a4:ef70:e0e1 with SMTP id ffacd0b85a97d-3a531ce74b9mr14483221f8f.55.1749558805718;
        Tue, 10 Jun 2025 05:33:25 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53243661csm12290668f8f.53.2025.06.10.05.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 05:33:25 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Jun 2025 14:33:13 +0200
Subject: [PATCH 03/12] gpio: moxtet: use new GPIO line value setter
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-gpiochip-set-rv-gpio-v1-3-3a9a3c1472ff@linaro.org>
References: <20250610-gpiochip-set-rv-gpio-v1-0-3a9a3c1472ff@linaro.org>
In-Reply-To: <20250610-gpiochip-set-rv-gpio-v1-0-3a9a3c1472ff@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 =?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>, 
 Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 Grygorii Strashko <grygorii.strashko@ti.com>, 
 Santosh Shilimkar <ssantosh@kernel.org>, Kevin Hilman <khilman@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 openbmc@lists.ozlabs.org, linux-omap@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2337;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=cJsz4ZGd9pC00Thnt+wIQZLp3beAzLcJOBBw0b6Px/s=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSCYO3xnpUc/3u6ssQztvReVrCU8Qq6iiPbgtP
 Z3BmL+TVB2JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEgmDgAKCRARpy6gFHHX
 cgezEADSssm46y31itfRn2QsV4tDRq/1Gvqk5nge7CWtX/usrhs/bK6sOyunBzV2g22yTs/iS3R
 /jcDfbiyCX0hofwExZyBaO6DbsNNGjbsHC8Y9E/WgfQoP808ECbR5jwqWJrOxoDZVIyJNzc6hK5
 olsmhMMw3rIUyfj9aKq5yv4XPuDmSk4ej/ZU1QrqEW0HqEcusEtYAVPi8b/f20VqWqhPsmxv/M+
 ybJk5xp+Q7PkxVKqrK8HwGRzVWlK7cAJUdGO3sRoN+BRPxG3x7XlfUMQHTdddkZGn4OfJf3Nihp
 x9FXOs4fh7m2+AbBNMRNtpLvNa3OuwWuqb8yx1m1ccM7OMpKokqDQiVap9+6bI9y8/CCg5MXOaF
 zf9VR/ogGqpBWtbCiRcOMHo+tMymgF2DsMNHobIwyukBOTY/dg9mok5PIBarL7DrEjmYtSuSMmi
 cR8DEjx8jynKaZuxFTxBQ3ta0s2sUk/h8dmx4KcaVMFAJLzGhm1E0sWKtS/Nos6JjmmjP0KMR1y
 Bbej6eKROTskkW5Fg2F4qL6qf5JfU5C+hpwYN3OEnSgAf54LKIBW0uTweVwGYju5nUEh4Tf8Yiz
 et0rvViK6DvnwoqFOtj5/Fg8i2xE3EpT6OYe9eBqxrkMe/ynuQyCXUbnFLXn45a8ZsWshT4g4FP
 1RApJSs+DO1jHdA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_133327_844838_F3233512 
X-CRM114-Status: GOOD (  13.09  )
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
 drivers/gpio/gpio-moxtet.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpio-moxtet.c b/drivers/gpio/gpio-moxtet.c
index 61f9efd6c64fb4babef5551fb2541659bf5a542b..27dd9c3e7b7717d43cad3d4c6de019c9401d05c7 100644
--- a/drivers/gpio/gpio-moxtet.c
+++ b/drivers/gpio/gpio-moxtet.c
@@ -52,15 +52,15 @@ static int moxtet_gpio_get_value(struct gpio_chip *gc, unsigned int offset)
 	return !!(ret & BIT(offset));
 }
 
-static void moxtet_gpio_set_value(struct gpio_chip *gc, unsigned int offset,
-				  int val)
+static int moxtet_gpio_set_value(struct gpio_chip *gc, unsigned int offset,
+				 int val)
 {
 	struct moxtet_gpio_chip *chip = gpiochip_get_data(gc);
 	int state;
 
 	state = moxtet_device_written(chip->dev);
 	if (state < 0)
-		return;
+		return state;
 
 	offset -= MOXTET_GPIO_INPUTS;
 
@@ -69,7 +69,7 @@ static void moxtet_gpio_set_value(struct gpio_chip *gc, unsigned int offset,
 	else
 		state &= ~BIT(offset);
 
-	moxtet_device_write(chip->dev, state);
+	return moxtet_device_write(chip->dev, state);
 }
 
 static int moxtet_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
@@ -104,13 +104,11 @@ static int moxtet_gpio_direction_output(struct gpio_chip *gc,
 	struct moxtet_gpio_chip *chip = gpiochip_get_data(gc);
 
 	if (chip->desc->out_mask & BIT(offset))
-		moxtet_gpio_set_value(gc, offset, val);
+		return moxtet_gpio_set_value(gc, offset, val);
 	else if (chip->desc->in_mask & BIT(offset))
 		return -ENOTSUPP;
-	else
-		return -EINVAL;
 
-	return 0;
+	return -EINVAL;
 }
 
 static int moxtet_gpio_probe(struct device *dev)
@@ -142,7 +140,7 @@ static int moxtet_gpio_probe(struct device *dev)
 	chip->gpio_chip.direction_input = moxtet_gpio_direction_input;
 	chip->gpio_chip.direction_output = moxtet_gpio_direction_output;
 	chip->gpio_chip.get = moxtet_gpio_get_value;
-	chip->gpio_chip.set = moxtet_gpio_set_value;
+	chip->gpio_chip.set_rv = moxtet_gpio_set_value;
 	chip->gpio_chip.base = -1;
 
 	chip->gpio_chip.ngpio = MOXTET_GPIO_NGPIOS;

-- 
2.48.1


