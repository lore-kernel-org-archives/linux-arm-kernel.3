Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDF0EC71149
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 19:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i5mo28r4bSLhtRxKleEgwjFwDjbfBKbh8TaaOWlq67M=; b=ISPcwvCofHEhEnnFwQpNPoKIHO
	LUqVe18GZGUpJJeKwzcpScHGOfPYHFQa+G0bqdaalqG7wCQ0Ah/4EJCDtOjzQ0C1AOj+Xju2Ta11z
	Jf+j3jfrjCcslw3O0OQH4HsEEHpmu+RYpjBv3VZz1v6t0n2a8ECDaF2TM+4igO4keh4FSXPxbahDA
	U94zUpaNzqC5LeRlx4zt/WieplT2cyAuGBbeauIN7z+Yn34ntaFo9kLAkqOkcnXbfSHXry5o5hagj
	iv2zHIXfnlnJNP0UXw8FWwYDGmPdkZnYU9WTADgINsHvLRxA5bfpqPf/QwCfwZCaV1WR2OFRZjSn+
	fnhu9tOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPnnD-0000000EE8O-2Sr2;
	Thu, 12 Jun 2025 19:40:55 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPhmL-0000000DLlP-2c6A
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 13:15:38 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3a4fd1ba177so620515f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Jun 2025 06:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749734136; x=1750338936; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i5mo28r4bSLhtRxKleEgwjFwDjbfBKbh8TaaOWlq67M=;
        b=JBl1s77gndszFVpjjgEPQF7WcmRW6ALwj0meN0i/BQFqJaM5fV2dQQkcDwkswNpGF5
         hKxuZz9e+a8Fm79KTG24vLpzD38iDlg9skBqU5vUgaSnDzwbBN2msl5q6v0iNhAvlFxH
         vmQOsNvGZegIKmtOiQ6MG1u2xH3KoBGATHmzDD3X4hcRasRvlwMopeMSyX6S6phu3ghE
         Y9qNDPkzv7VqH9AAdiVJAl0I/UWyin5WxwfJC80acJCgXPA3dnOfTXfbPYgiolrerJya
         xWriFKQmaI1GqCK7qU/1VpGy40yVeSYsSim0VFSqir2NPNVfOuuvos0+jY2NFDftHlGs
         d8eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749734136; x=1750338936;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i5mo28r4bSLhtRxKleEgwjFwDjbfBKbh8TaaOWlq67M=;
        b=ZJmt0t+FT29b7M4Ipzzs9N3CbsWA0hqILqaxJEHiW+UGx6pZpKWFeZNLIQN4Yqrajf
         DqCpJVJz2eX4p7s6/n60Ecp9K4gnDTn4hMFsTARTFyGFM/y7GpeA4mW6K6GyuYr2d64z
         wvVbn2KXTpg6gFUfO0MsO7EI+8lAgbpAdKzFwkTwaDreA51vf4CJSXuwdsW9shNdebp1
         gb9mNB9rdh4vhO2KKbTxkj3iqDbDDmqR3q3HcVlvm8fh3gk2HLRJ/w/WRW73fsEabYFf
         8DOvSDpgxVsk+5FiSMIvXJRXXi424mx1ZeBLcbtyS4Djd0hmHkAF/k4c+moZoLOMQU6B
         Axaw==
X-Gm-Message-State: AOJu0YwVJZQSKA/z4XYb5CDdul4dWSH58IHVM5NVD0PRXp41fp4n8pf5
	CMpCQfEmAhN+4EbcutoskuEv1LSoJMhxWXFzpzZi0L2suzbJD7p8F+9TMEtiT4o2SUg=
X-Gm-Gg: ASbGncsFW7Thitx8yTELuMUcKo/bcUssMSQIxRGqFBiYCb+5i6Kdi/fmPqI5ZsOI5rW
	wb/O/qZkPLVceZX7Ca4lDHe+THUa/KlI+ANeunHeckFNw533YU9fy3OAMKaXV66bSPHFnsQGUzd
	o1CJNmReXgdf2hlfy55ZMufVgy2OKw7/kdB6of4+AY7avtURxpX/S34qMCwqEMS+uZW4vl2UTMR
	x/l/GHL3uPaHNpKdyTsqbJYKyv/i5+lwbH/2AgJIXIK4L85Q0wArNijFVDYOmIuhoygCJ8U4MDN
	FeCfsf2RHc8joAeOgOMWuJyzSLJfLBv62xn4wOifyAe3xRnwQ5o01nc=
X-Google-Smtp-Source: AGHT+IGBzR2mvuzoTZVHlKLwIjCRQmPWg1494+jjoGTBRb95NjkbBovSMnn1G3/kvKyntrJFTjslYw==
X-Received: by 2002:a05:6000:1acc:b0:3a4:eb7a:2ccb with SMTP id ffacd0b85a97d-3a5607fa6a9mr2706309f8f.16.1749734131666;
        Thu, 12 Jun 2025 06:15:31 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8b99:9926:3892:5310])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532dea17d7sm20619795e9.10.2025.06.12.06.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 06:15:31 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 12 Jun 2025 15:15:18 +0200
Subject: [PATCH 09/16] pinctrl: digicolor: use new GPIO line value setter
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-9-556b0a530cd4@linaro.org>
References: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-0-556b0a530cd4@linaro.org>
In-Reply-To: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-0-556b0a530cd4@linaro.org>
To: Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Support Opensource <support.opensource@diasemi.com>, 
 Baruch Siach <baruch@tkos.co.il>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Viresh Kumar <vireshk@kernel.org>, 
 Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev, soc@lists.linux.dev, 
 linux-sunxi@lists.linux.dev, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2000;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=OQugchdrkWqDPvdem4KQYa6SyzhpAo4iCK+GSkQ42zM=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoStLm65xc3XhSAXLjOYJrRx8iTF6Z3NPsxp5s+
 otU7k+QhaWJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaErS5gAKCRARpy6gFHHX
 cpxgD/4qN100OY/e/Uz3KaPovCgsqpm2wpUtbSiYEFHBmHRBGLuf3ySBpaIk66jUCp2HK6IC/Cu
 2rqLmWG+B1iFpS4BnVMqobo6XmQjO/ARjPAV5Mt5CaDoOoTOhpLoNchztmEN9Q2JKULHtTgCqhX
 lQHrPhbY/9i/5W0RbV5etGdJItUlMoySsE119JLcLNM/on+dOLWMt+O3R6OFQVbA2Ax1wh27sWY
 400r6LQeOyu7NOnJX3zbqfwN/N+J2L065B6bTivK6wSYzswkHHRl1mWBdJI08KlqfsH6XPgQFQw
 JX9YVFecSDqkoVn+ypM6aD02FboP/q3cvaaUBgxUNeZX30SJzwt52lsSpg1n+Tx4J77UuEZyss+
 GFY852aRZcZxAim54v/DC23tAfXW37EDYmRMBWXAr+q34Gz7l0YcsBZVHY59CfR/16FxKPEggg/
 3iQYJRkgoOkddEdzxoZ8j7F7myunohSmcOCpD5Tu7Ycpzt2nb9gQzdsAwZZixXN2jBJxs11uOSl
 KaDj1iHD+UyHxRyF4uxpTztdkNsHGKodkqbgajWh9wCY7oxvodduH64VwV96QA8h2NgxXxorrg6
 X3fbAgBNYIXJF2fF+V2DAOgvtIyTF7nNrlcaKu7z3fq0cycKeH7OGmyuh2ikwHlpBgY8Zj4s2kM
 q0e5Q8QmLCBxxSg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_061537_668428_7D7101ED 
X-CRM114-Status: GOOD (  12.41  )
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
 drivers/pinctrl/pinctrl-digicolor.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-digicolor.c b/drivers/pinctrl/pinctrl-digicolor.c
index a0423172bdd6d8600fcb56a542ef498e14308968..1676cb3cc4c98755d287d3d87ba682ffc61192a1 100644
--- a/drivers/pinctrl/pinctrl-digicolor.c
+++ b/drivers/pinctrl/pinctrl-digicolor.c
@@ -182,7 +182,7 @@ static int dc_gpio_direction_input(struct gpio_chip *chip, unsigned gpio)
 	return 0;
 }
 
-static void dc_gpio_set(struct gpio_chip *chip, unsigned gpio, int value);
+static int dc_gpio_set(struct gpio_chip *chip, unsigned int gpio, int value);
 
 static int dc_gpio_direction_output(struct gpio_chip *chip, unsigned gpio,
 				    int value)
@@ -216,7 +216,7 @@ static int dc_gpio_get(struct gpio_chip *chip, unsigned gpio)
 	return !!(input & BIT(bit_off));
 }
 
-static void dc_gpio_set(struct gpio_chip *chip, unsigned gpio, int value)
+static int dc_gpio_set(struct gpio_chip *chip, unsigned int gpio, int value)
 {
 	struct dc_pinmap *pmap = gpiochip_get_data(chip);
 	int reg_off = GP_OUTPUT0(gpio/PINS_PER_COLLECTION);
@@ -232,6 +232,8 @@ static void dc_gpio_set(struct gpio_chip *chip, unsigned gpio, int value)
 		output &= ~BIT(bit_off);
 	writeb_relaxed(output, pmap->regs + reg_off);
 	spin_unlock_irqrestore(&pmap->lock, flags);
+
+	return 0;
 }
 
 static int dc_gpiochip_add(struct dc_pinmap *pmap)
@@ -246,7 +248,7 @@ static int dc_gpiochip_add(struct dc_pinmap *pmap)
 	chip->direction_input	= dc_gpio_direction_input;
 	chip->direction_output	= dc_gpio_direction_output;
 	chip->get		= dc_gpio_get;
-	chip->set		= dc_gpio_set;
+	chip->set_rv		= dc_gpio_set;
 	chip->base		= -1;
 	chip->ngpio		= PINS_COUNT;
 

-- 
2.48.1


