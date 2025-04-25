Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5C4BC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 10:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aG92M+ThGG8rcCnZb6WUafkA585r/LuxT+alwijT/5c=; b=TCjhCME+HQ4qVErNdK4SKy8fQH
	uNI5zruAHTppjX+cE9CAdXphxgf5kccpW4WXvGKN9nsd0vIRLvZb9cRO92cgov2uT5tHqKEFfkBMl
	kG0bpeHG7JDXv+GyqfLtoLNRguGDUkueWKZb0CVofuMJwkrhafurwPwaepFYdNLyZ6UXwcE6ysvU/
	NS6OTJXhqZUNPRCqpdVNLYJPQdrZUgi0zBGPxoFQ9sF4jLOjd8ylAF8P1UgtsCiZsWr34yls2x7xu
	9XVOYkIJ3Q7hcuzLN4q+FjCVx+fcJxrWt0qkNLPiKBj3y4+R5/yFdpqDezjfWpKPB3r7wMlJ8Hqsb
	p39RIccA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8FsK-0000000Ge9j-25ab;
	Fri, 25 Apr 2025 10:01:40 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Evl-0000000GSXM-0wEW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 09:01:11 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3a064a3e143so956088f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 02:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745571668; x=1746176468; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aG92M+ThGG8rcCnZb6WUafkA585r/LuxT+alwijT/5c=;
        b=x+URsEzHLz+NfTlCvcyCIOVap9OvCaB087T/Y51B8iIdjrSc1qk6ZDVq3+lLTTcFkG
         qyDScyyq0at6iNsq2bXEom8BA65cQ4cpvO9SCISPkZSZCcKlQU0As9KhBa/ffo4L/HnJ
         OG37LS5UBFFEhq21UZhpAMuG8T9JPMOYWYv144kerm5vGNi8QWPeFbCNSIZrKVDTwS+H
         qgl6Ru4jAxjagC5QQreFZswat3aeaSBzRJmUAKPqFjUwV10y0aTDcw+ZcEpRKO/VKK/g
         n1CotrNyfqA5Ouf6jEurd4NVzw4X9elyWsUHdsdyMtEfPwXwUu6wov4RApGP4iD5PMya
         qaRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745571668; x=1746176468;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aG92M+ThGG8rcCnZb6WUafkA585r/LuxT+alwijT/5c=;
        b=ax5lohVfXSzUiEr6CXjcGApSNcIpxhXs8nCWZZ97YQimEQYYjbIMImfSJ9piUq9pMq
         O1A9TUMA8Q9/+yIxV8xJA/LAHb+z1V1DjG+BF6+EcHlxNIvYa24JpYVaSe+TZDWaIWRZ
         us3T1lxWXFzh3AR/0DCB6CHfBTSrgzUxUg/l9pa2KAq0DxcR7U0sQQxmtX5YziNjxd0N
         WIjuRx/YohLBiyQIp4PrXGxrpWw+dLYW+ykQLbo+5zGYH1gzOdZL+Bgq5NVKa7BGqms9
         +F6Vi80GSXWnF2WJGbwdveUV+1E/ZA5GpGd5Rxi9dhki+1YOVrNhDZwlwnEzbfA5z4QV
         uxbA==
X-Forwarded-Encrypted: i=1; AJvYcCWQ1t3+iEl1qNdaHNIOViTTVL+cQL5CEX1JVAZ3f6T/xb9fy2nTS5rc42Tvv5cKk7phPm5kqGlroWgfphVKe11F@lists.infradead.org
X-Gm-Message-State: AOJu0Yzmg9254KG3fcL0uQGjvlfWmyxzeVRv+hZjIKhp0jGxXn0KqUye
	+4ltAIS86+dtIlyx1kQCOqLqHoXiS7aM2scvYwzw/ONYDFykTC+pLacqoQZGb8k=
X-Gm-Gg: ASbGncse8dI4eOxzJcV+nzZsgMdTSKf91ga8dfGVdln1GZLqmhsF2+0SSus4sWR5pD2
	tenguUVusP1LFnMg4rSnWdQ2ZVzgqIc9HTeqPmzKFLq25NJyX3jL8y0fmqY/A9ueslulw4gugIH
	8KbsEjOS/m7AOn2HNxZMtzmfrcLH8/wy3hfmlSQ1L3eEug4hvy/xqVm4EujfBg3lr7LlgAgn1Kt
	hXIlJJM9tGiFmbsDJCBYx/FkN77eiHCEIlU7/5iyyeZx5JV6cL8jYeQEvZ1tiOVn0FCqtrGSs/5
	D7jIWDvqKy05cxWVQuqOHBkwmkAe5U/tPw==
X-Google-Smtp-Source: AGHT+IFW7oHQT2iQkXG5/oplsgKCVuoYvLPqlkf0fWIPHa0BO2c6LkQgBuCA2L7Ixcx9kcJza03b8Q==
X-Received: by 2002:a05:6000:1ac6:b0:38f:483f:8319 with SMTP id ffacd0b85a97d-3a074f4853cmr1080551f8f.51.1745571667902;
        Fri, 25 Apr 2025 02:01:07 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3f35:2b31:c543:726d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073c8c95dsm1696571f8f.3.2025.04.25.02.01.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 02:01:07 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 25 Apr 2025 11:00:58 +0200
Subject: [PATCH 2/5] pinctrl: mediatek: paris: don't double-check the GPIO
 number
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-gpiochip-set-rv-pinctrl-mediatek-v1-2-93e6a01855e7@linaro.org>
References: <20250425-gpiochip-set-rv-pinctrl-mediatek-v1-0-93e6a01855e7@linaro.org>
In-Reply-To: <20250425-gpiochip-set-rv-pinctrl-mediatek-v1-0-93e6a01855e7@linaro.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2274;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=nUKaoN4taOpveP3nc3OVuJSxVohaZIGpFohuQJLAScE=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoC09P1im4kKMb6U7RG39p9G/VrnbdkYWFGjboY
 3bmo1dLQC6JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAtPTwAKCRARpy6gFHHX
 crgtD/9is3Kf21qiXzq1VSscbgtqKAJ8hb/XCsd0cS2PtTKxYDWP1SnTIL4KX7ofzZY6+UNXOZp
 dy+D4aO7WNZsFR0/IHIeqWBWEk3rmMlSGkbfrIVDhpWvtIo6opyCQxql8Q5LViq0LRe6JEPRdoC
 Lor1QT7DRjA92oRtQppJ2/eJZFWLujiVsYYPLfXICUinmpUOHk2wHZ7Juzozwht7N/RM8hDQi5w
 Tq5I9jApIX7HuFwuRuILD7KrOPs3yAIkxg5EIl9t/8uEheTZAUl8gjFrt2oXh1d8QjiG6UIsnQ0
 FCxUF6W7Qt3yoXvJB7BVE+lfhs5yJuhuQiBz7jSQOmUCnEpPC+rnlE6PEgqlrlB4S3UfQMyfxXu
 TkZGAWz6/V/ricSCTfoPbWxtHT/fmyIr/PoIil6NMgsEtw2lsTQZclPoBCEjv8FSHBZaLlZp21M
 QjWftw1cUSxo+sR0S6FDFFCo3EdAN3zIgltKS6I3KlaRXzygoM+OsakxjcXFba51INkzT5w7nD9
 EsU0E0Z17ILt6kloAzswTHoIJKQM1NeKw/qUNa1zMq4sLMkRIadcAf8J8lFYGsqLQt+KrRyjmQN
 85NWWLYzuxDF0gYe0/Ci8Zos6oglGyM6ff6HvFfXZwh0zf1/igURjsYJ8qyXym9CZlTm2F6YJGx
 sWnd0wD08yn563g==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_020109_277004_F3C8F27A 
X-CRM114-Status: GOOD (  10.73  )
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

GPIO core already makes sure we don't pass invalid GPIO numbers down to
the driver callbacks. Remove needless checks from the driver.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/mediatek/pinctrl-paris.c | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
index 87e958d827bf..852ce0ac7ff9 100644
--- a/drivers/pinctrl/mediatek/pinctrl-paris.c
+++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
@@ -840,9 +840,6 @@ static int mtk_gpio_get_direction(struct gpio_chip *chip, unsigned int gpio)
 	const struct mtk_pin_desc *desc;
 	int value, err;
 
-	if (gpio >= hw->soc->npins)
-		return -EINVAL;
-
 	/*
 	 * "Virtual" GPIOs are always and only used for interrupts
 	 * Since they are only used for interrupts, they are always inputs
@@ -868,9 +865,6 @@ static int mtk_gpio_get(struct gpio_chip *chip, unsigned int gpio)
 	const struct mtk_pin_desc *desc;
 	int value, err;
 
-	if (gpio >= hw->soc->npins)
-		return -EINVAL;
-
 	desc = (const struct mtk_pin_desc *)&hw->soc->pins[gpio];
 
 	err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_DI, &value);
@@ -885,9 +879,6 @@ static void mtk_gpio_set(struct gpio_chip *chip, unsigned int gpio, int value)
 	struct mtk_pinctrl *hw = gpiochip_get_data(chip);
 	const struct mtk_pin_desc *desc;
 
-	if (gpio >= hw->soc->npins)
-		return;
-
 	desc = (const struct mtk_pin_desc *)&hw->soc->pins[gpio];
 
 	mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DO, !!value);
@@ -895,22 +886,12 @@ static void mtk_gpio_set(struct gpio_chip *chip, unsigned int gpio, int value)
 
 static int mtk_gpio_direction_input(struct gpio_chip *chip, unsigned int gpio)
 {
-	struct mtk_pinctrl *hw = gpiochip_get_data(chip);
-
-	if (gpio >= hw->soc->npins)
-		return -EINVAL;
-
 	return pinctrl_gpio_direction_input(chip, gpio);
 }
 
 static int mtk_gpio_direction_output(struct gpio_chip *chip, unsigned int gpio,
 				     int value)
 {
-	struct mtk_pinctrl *hw = gpiochip_get_data(chip);
-
-	if (gpio >= hw->soc->npins)
-		return -EINVAL;
-
 	mtk_gpio_set(chip, gpio, value);
 
 	return pinctrl_gpio_direction_output(chip, gpio);

-- 
2.45.2


