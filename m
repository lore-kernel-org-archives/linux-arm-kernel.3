Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C3EBC61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 19:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Xh9vFlYN2cjb4AoCZuPQ/5e61RjLZcwUz2fDo2ivjU=; b=D87kPuyO7VgbE5ocV9QVUqYKPc
	c1wEiMTFrUaDXbXJZnF7k4HvmfBNl7xQtf3B6ZdoqfV6+Aw3ZaoTx35CU4BLZrFpXqi81aSIx+RwZ
	ieRgjBFJJYop4qj4s2YOWmErIaYRI+zCUOgdWq7c90m1N3RuJd9ACcyeRopv2bkOtkgTE3Vdh/qFA
	/p6b3SPJtswrWWDsiB+pJoXYRFvG/v0+UO5GZNCV6rqH4fTAquEzQLJrq2CYXgt+YbQcvXqK0EFia
	c5AxJq8Zcn9c1oU9ail6PLVwMkzpzYcRpH6hwdVNrR7YlXR0WEwuzUg+14fljgnsf5UQn7Bf5jhqg
	NYxKz28w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPnn7-0000000EDyE-3ven;
	Thu, 12 Jun 2025 19:40:49 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPhmA-0000000DLhU-1vQl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 13:15:27 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3a36748920cso876207f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Jun 2025 06:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749734125; x=1750338925; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Xh9vFlYN2cjb4AoCZuPQ/5e61RjLZcwUz2fDo2ivjU=;
        b=gy0vCOhWWveWM9kvjsJ9N+0w/R7mT1F7MX8FJvMDjN8ww6YtL3AA+8+X1hIU1Jjsn/
         VuCLmOi5mpqhNiOm2azZdqVXQxQX6cvk33TnfQM6EYOv4zQ+odremGSGcEGsHg/EfAvd
         su4H6vLuVNNQTzty6mh2xNcpo/O7lIWuvcxIO7Eta2C+7raMgZlYoVNxHxx9ktTJgc0p
         bvnwGCYFAZ6Rz6cWTyWFjQFg8gk5Yn/i5gwX0ndqzSxhUmphav8LxTnjGsZYJGA8eP8K
         zJ8qoK33GQQ0WLsiWwDczUMkxW0mHPWHphhGFqUK7JQjxtrTE4cepQbycIIqVo8iy6Sn
         SH+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749734125; x=1750338925;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Xh9vFlYN2cjb4AoCZuPQ/5e61RjLZcwUz2fDo2ivjU=;
        b=d5EGdTWcbJNEOK4kILTUQHfJdZNwJ2gnEoMULlpEIVBX2MM58PmAUojfu9ijqZI7dZ
         FvBCu8yriRTjTp2NhKSeyn0YI1EDPXpcIEZ0JxvNzIi37zUG6aq16a4pAgA8oF9/X9OZ
         QHv2TIbmCntQWAE54wnOwcE8sAaVmxR7Lvhtsm8iYvVfgImmA6wlXjVV3jCB7rKGbJqj
         0QZnPnmE6Kvh2LwUxPc4w4HYGtHOB1NUIoG7rmcxRBoD98H9RAeCZnAdHcioSXJvOTYW
         /el6xZzWRg+oUE4TrqmDgxdlVO5VRREGyD3BIMfPC/IZx7gHRTE6hVcKTnchXvaACScS
         gKBg==
X-Gm-Message-State: AOJu0YyOnz0R0bCiJrW0TUT1caeHbm+LdXUysC7WimabP0MHyYuVV+Kp
	XQs9GnK0XkhObK4VWyyJQcBV/BUiNEs432uogJsZr+KKu7XmeHxgcaSTUetl7x3SP5Y=
X-Gm-Gg: ASbGncul9v5tuiBI0NgvOEFT130xOuF36heiFpmU8SGO0w7KqoGG5Cza2DVrdHsjeCk
	HlULkb9ybOtlMv7cVjK2TQ3bjSU2kOZmMhTTyYTPif3Oqvl9fqh1g7B23GEzSkj06ZXqFARfapK
	AJ7TSCT+0/SJasGpwc0W/hE2j5fGRgVeF5eVOL/80BxKQC8P6qMJmalHZV2Lt7ZeAIp541+rIW6
	UkJEqzITeNyFfRQfkf41WA9lN67Roc5mFFDMZ+1x9ZKaxss/dGwmWc5sc5FHHPwTwVE7gUOWiNA
	7r/zwDDZWd4Wp4DS3WjGfgmiOd+5tyJlVgOanytY612t5MYNMBXYlW89GCj0zbXtSg==
X-Google-Smtp-Source: AGHT+IHQX+Ej9HN4lelzlLvXYSgEkOOUk0QijevexRqGIQJCq4lgjLqOhwOf+he5IAKWkE6Gfii7JA==
X-Received: by 2002:a05:6000:40cb:b0:399:6dd9:9f40 with SMTP id ffacd0b85a97d-3a56074913bmr2816635f8f.9.1749734124811;
        Thu, 12 Jun 2025 06:15:24 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8b99:9926:3892:5310])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532dea17d7sm20619795e9.10.2025.06.12.06.15.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 06:15:24 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 12 Jun 2025 15:15:12 +0200
Subject: [PATCH 03/16] pinctrl: da9062: use new GPIO line value setter
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-3-556b0a530cd4@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2018;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=gwxSylPIbPGKwi/smPHfzBU9AQqt6xWeX1IRJSlXXtw=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoStLklRnjxne2O9+BScgNIbdaQOQ8KBJv22AEy
 OvQ1Poa4/yJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaErS5AAKCRARpy6gFHHX
 ciqcEADP8OlzO6NOQIzIT/qqVAp3TDw0XWzO3xI33euUn/a7LW3bOC5krWIHRmgqL2O3X9ROPwy
 8pz4JQq0eNG//IFcZicNDy4OI/1UXmVX7q6CTYBRrYTSHn9MSK7xj7ewNxtxNs7ICz64+F6S4z6
 /Se7jc0CQ3+r1opnL11YOXKKagRki+iK+jyb9M1JOxbj0Tgo4adZrx19lS3VMhZOI+iDMiNO5DH
 p/BDCDHQz7LVzxYAaSRH4gKrjFW2Lu4YdlRvFpVQUh0MPPte0b3fJZWWM/2W2rWSJZXC7VQihcM
 sYjsZf8F9PccsfTurbyxNG4+uf2Jkp5qZLGr8jxajXwhCzCb+dIbiEkG8b+tQRkAsEddqLTWMXu
 pHbF0u9YUFROoTwzyjewSEVDLm0ef5KMRrMR919B5eD0+Gvv51hg2ISZQl/Ul/ifkNOkubjn1cj
 eOrF8/vsmxM/hUgNHcaXZLKXrg29O5KiZTlsW/oC9FKdRjVXCgRZCZCt1eDKD70aS1vurl57yZ8
 qqz3aHv0xXNXD4dOXrILpcZnJM9wsqnWEHpOVEhlEJlMuCs+JjOQsuOJ5agwuTE5BzgxJGpDjVy
 f7SN3HIJfkiYibBq4+uvAchWPc9l3G4GtUTbeTyVX7EvbSLzHv069LGspheGTOvXTiJ7OvFJuj9
 eNUbMRFae+k53Ug==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_061526_506553_1E6951CB 
X-CRM114-Status: GOOD (  12.44  )
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
 drivers/pinctrl/pinctrl-da9062.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-da9062.c b/drivers/pinctrl/pinctrl-da9062.c
index 6f44a13b90ce56dbb00fdbedc28b0377a42d3b0c..3295b09dfc3daf8feb6de0082d95952e1cf25d26 100644
--- a/drivers/pinctrl/pinctrl-da9062.c
+++ b/drivers/pinctrl/pinctrl-da9062.c
@@ -102,14 +102,14 @@ static int da9062_gpio_get(struct gpio_chip *gc, unsigned int offset)
 	return !!(val & BIT(offset));
 }
 
-static void da9062_gpio_set(struct gpio_chip *gc, unsigned int offset,
-			    int value)
+static int da9062_gpio_set(struct gpio_chip *gc, unsigned int offset,
+			   int value)
 {
 	struct da9062_pctl *pctl = gpiochip_get_data(gc);
 	struct regmap *regmap = pctl->da9062->regmap;
 
-	regmap_update_bits(regmap, DA9062AA_GPIO_MODE0_4, BIT(offset),
-			   value << offset);
+	return regmap_update_bits(regmap, DA9062AA_GPIO_MODE0_4, BIT(offset),
+				  value << offset);
 }
 
 static int da9062_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
@@ -172,9 +172,7 @@ static int da9062_gpio_direction_output(struct gpio_chip *gc,
 	if (ret)
 		return ret;
 
-	da9062_gpio_set(gc, offset, value);
-
-	return 0;
+	return da9062_gpio_set(gc, offset, value);
 }
 
 static int da9062_gpio_set_config(struct gpio_chip *gc, unsigned int offset,
@@ -235,7 +233,7 @@ static int da9062_gpio_to_irq(struct gpio_chip *gc, unsigned int offset)
 static const struct gpio_chip reference_gc = {
 	.owner = THIS_MODULE,
 	.get = da9062_gpio_get,
-	.set = da9062_gpio_set,
+	.set_rv = da9062_gpio_set,
 	.get_direction = da9062_gpio_get_direction,
 	.direction_input = da9062_gpio_direction_input,
 	.direction_output = da9062_gpio_direction_output,

-- 
2.48.1


