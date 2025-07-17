Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F88FC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 14:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hkmEdAi1mYXLj0GumaAbmFTj8/Vf6pdxJ9LxWbK4qIA=; b=qt/3OdfWFlrpxcA1/FhKxfANUg
	+4fhbhkqQ1N6jih9ZQ4yruKCkRUqB0rZ1eY+YxN76nJHZOhZdPxyOslAT3jXiFkokhm+6OtVkGvuk
	OQSoetBw99PkDc+2jdNCOIiSEB+M/2YPE53VeEdJc12J87PCkHD61J+qHWcB2W9jiwRrm/C20RJxB
	4qm5wAy2Rnd3w/0Xj8VX6fl45zbSID51pW+w1pkoulzrfqw9lyhvnnOrTDaSJj6adXgdkE2JwZMZT
	Hwh1jFAse31bGVDSOW0KdwWyQ30nhjKoy5c7sQ9YJlIC+W14c5QY2UwxeRIsAkDG4rnmWBoN1aA79
	hgid+qzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucPBZ-0000000AJp8-10d2;
	Thu, 17 Jul 2025 14:02:09 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucOBX-0000000ABPO-0pGb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 12:58:04 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3a531fcaa05so405244f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Jul 2025 05:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752757081; x=1753361881; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hkmEdAi1mYXLj0GumaAbmFTj8/Vf6pdxJ9LxWbK4qIA=;
        b=g1mvmW6R3PAYVbrGgaCfUSJ4NLh6ijFWyGRFTVtTwIw7Gs9O1wRRe1PsKUOLTgfe5o
         xwlPJfhJzQJ7yzK3CaaJPujbRPkN+JHZp5cNSIJP9p77JlHTJWHr2VKCZ5YDFniV9Zat
         scdqfBTLiBamb/Lhjx1HEZtIKsilbNBTzwFGmvIhUPOICeOeB188ANCsRAwejCe6hTMj
         OeKDInJDBIrIav2PLi013e+UBpBTFtCMxwr9XB+6589JDpsceFYXjecDBJfY6sDjoHUx
         46DicSPLkHDC3acAvGJA3SjI1I5n2619otDCftqQLzYaBppVb7UEU1qzdHW8ojcmGmmW
         ZJgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752757081; x=1753361881;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hkmEdAi1mYXLj0GumaAbmFTj8/Vf6pdxJ9LxWbK4qIA=;
        b=jNMJCiGfH5qLdpgy7ERWDeq+ynZQoAcJvAGX9FqsfE0aYlwQGWNX44s/4O6Lk8aDru
         Zm4IvN9Tx5bZ4KSHW+9rnAAPGT2LnrvNLt+io8ZcL7i+/omimK/Qzt0KWtTYwz8CXbM3
         tgBS/r47om7c5dnzfQjgLbp1VZkYZuNwA8O5xnwk/42zWhIkyTfRYS/ROYoumb6ckHjo
         /Cr/rB/ZvVgzrWoPnppM6JsZQhF55WvmHy9Okad2JTzYDmKM/zsp9JzUKZOfgm0LJV5C
         o1kvCU4fv/nSVzcv/4nClLPUM4qTbSw7KyXIiW60XXfhR7r5tGnNGa57ck+zyqC+/R0j
         yHdg==
X-Gm-Message-State: AOJu0YwtCJ053ELYQIa/5yY9MoJeBpcs9pl9twTwGSSOhE6JHMAkVOX8
	H/95I8rdbk94swvlPhzRCmhekryWl51tV7yQAxXjzlO96QsVyM/D9dkMsfkzfPDujJA=
X-Gm-Gg: ASbGnctilglVM24RlnJ/ynXbFUdh32U24piDjEm+9ztKjZ/1IhRu/LoW7SUa+pUmeRz
	pDuqecQtYAABYTP5sZLeomnjFoBefsZQ0A6Sx3JJGB52I35MU/XeKd0gJswghj61UcY3rMOqt8J
	AH7lpzkS86SqWpnLsNhu65zeSEfHSQQFMSCucCaE3FGDR+VuNpDBS0++cG1fs7rv2PRwtSPtW4Z
	UsnkiFQD5BmXY3biU3ADhFS26yc+r4w+Rd/V73AYflLy7e+KUWMBj84yEDKgxnjSL31+B2HnroL
	jFon8jSec86U7tD5+LVR6muftjs+PuZoRxmAYrkm182zr9LYJbxMIvpP7pBbIgE+9bP8D48IrcA
	ASfkGLO+qGFIgObAStxjTW9adobtNUhIO4g==
X-Google-Smtp-Source: AGHT+IEUUPM2Bn3BQQTqraXEIB2Jm5m5lpH7CokHPg/MliMMzl3/KP587ZU4bPNjNv333+jZ1/DKow==
X-Received: by 2002:a05:6000:290f:b0:3a3:6a9a:5ebf with SMTP id ffacd0b85a97d-3b60e4d0841mr6039464f8f.20.1752757080738;
        Thu, 17 Jul 2025 05:58:00 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:9e61:4694:c621:5693])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4562e89c308sm50080735e9.30.2025.07.17.05.57.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 05:58:00 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH] pinctrl: ma35: use new GPIO line value setter callbacks
Date: Thu, 17 Jul 2025 14:57:58 +0200
Message-ID: <20250717125758.53141-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_055803_477421_4D291B4B 
X-CRM114-Status: GOOD (  11.60  )
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
I realized one of the pinctrl drivers was missed during the conversion.

 drivers/pinctrl/nuvoton/pinctrl-ma35.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-ma35.c b/drivers/pinctrl/nuvoton/pinctrl-ma35.c
index b51704bafd81..da5220da5149 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-ma35.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-ma35.c
@@ -361,7 +361,7 @@ static int ma35_gpio_core_get(struct gpio_chip *gc, unsigned int gpio)
 	return !!(readl(reg_pin) & BIT(gpio));
 }
 
-static void ma35_gpio_core_set(struct gpio_chip *gc, unsigned int gpio, int val)
+static int ma35_gpio_core_set(struct gpio_chip *gc, unsigned int gpio, int val)
 {
 	struct ma35_pin_bank *bank = gpiochip_get_data(gc);
 	void __iomem *reg_dout = bank->reg_base + MA35_GP_REG_DOUT;
@@ -373,6 +373,8 @@ static void ma35_gpio_core_set(struct gpio_chip *gc, unsigned int gpio, int val)
 		regval = readl(reg_dout) & ~BIT(gpio);
 
 	writel(regval, reg_dout);
+
+	return 0;
 }
 
 static int ma35_gpio_core_to_request(struct gpio_chip *gc, unsigned int gpio)
@@ -524,7 +526,7 @@ static int ma35_gpiolib_register(struct platform_device *pdev, struct ma35_pinct
 		bank->chip.direction_input = ma35_gpio_core_direction_in;
 		bank->chip.direction_output = ma35_gpio_core_direction_out;
 		bank->chip.get = ma35_gpio_core_get;
-		bank->chip.set = ma35_gpio_core_set;
+		bank->chip.set_rv = ma35_gpio_core_set;
 		bank->chip.base = -1;
 		bank->chip.ngpio = bank->nr_pins;
 		bank->chip.can_sleep = false;
-- 
2.48.1


