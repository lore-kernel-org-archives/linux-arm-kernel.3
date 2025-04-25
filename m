Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 264BDC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 10:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vZCsMbe0k2wJLLxto/ZgvqQ6R0v/kHbZTO0AQGYG2lM=; b=g7rTmJ/NNe8DeiVNjn/LdcYuS8
	sXu8KRVmXqMX5yxkQT1dOeTC4lY0bUQDvj25bVvWoGWaSrD3ICtMvapMNSTfNV/rFckLdZ0O1wMat
	FeJAa07fHP7SvyW27tESgvDonbwTjUizyYc0kFypECYQwvMG13CzXeUr96DO84wlghDs2qaREY5SA
	GTh5TZRerA3fHoM/aVnGISXYsVo+ex7aHQAVQwmeSW01k8k/aEpLh9VnA9+Xd6BTRUn1413chC8Z3
	RWtG7jn9AxTTFMoVAq/YeFH8ofhr7P3vQ6qLgcVskm6YzNbZ/ekTz+UISEy5wF8VY/3hEeLrG9+o/
	XgT+8YOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Fvx-0000000Gek0-4AwO;
	Fri, 25 Apr 2025 10:05:25 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Evo-0000000GSYw-1TJ9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 09:01:13 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-39ee5ac4321so2023766f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 02:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745571671; x=1746176471; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vZCsMbe0k2wJLLxto/ZgvqQ6R0v/kHbZTO0AQGYG2lM=;
        b=qPTXZR0L1UOir/iIh7Xloyl56is2ArKEKxGK3sJ/QnafFDI1QAN6Xdk10F9Qh53y1n
         YRKvVHHTDOJHLli7nQCkrYSIN/wIJATnAsvHHKbM0sD/PZpKG9l2Fg2gLbN2MsGTnRg8
         YSrD+IjIBsRo5Gs88KJqyJvHytfkc4ICyRfHpe9n6mXpju2yHyFhtrzGAJ/zSPTKd35L
         B2IPhM5U9JRGA1moyoDeGf4mXfhpAZNeyJOyFpDeYKDzWFZvExN4KqDn4ygWalv4vuYK
         nKY3f4M72XX3/6FshJojHn/AcR4kEyT8d6uATeUgCr897ym2JE8NDtcZHRklvaaO9gUd
         3vpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745571671; x=1746176471;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vZCsMbe0k2wJLLxto/ZgvqQ6R0v/kHbZTO0AQGYG2lM=;
        b=FOowBmN+60z9ei75UV1ll4TozDma2E0Jz+c+oIwygCJLbbAlXVL7K86ZVaPo0wj6MJ
         RiKYQHyvDXtymD3Zl0Eanqp6kQ/0Q496G7zzZM54dssDhcTZU71z4UVjB6gfIo/7S4ya
         Pgq/krVUzgPQzL3nkUbcPCxJokKXLC9Lt/hBC57R/16QWQMMmWhOVRGlmK3Ku8ByAuoL
         nVXIUMf9wCqyZwkXek5AA1xL/Lnh2D7PEeYTfbx5IQQe6WR1bqaWDpX4e4Bl/J1lfKYJ
         XIAZnZZgQko2Mb3i0gXeJlPv39GC4RnC2xzGUc1jTjU/Cyy6Xv3xbgX+h5xCr6Drx23i
         OJGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmK0Ebag8k34+gTaXQ9E7UdyPo21ZpkG1O27aVNsYP5ggXnV3GDgjPSBtrpqHlUrBYbTr/EtR3W9L0yzQjYMXP@lists.infradead.org
X-Gm-Message-State: AOJu0YwwVhMyU2FlFdGUzA0NDO1F9T808+7XFQVqAfpFj3bZizZeCISP
	v6Yrn3BMtYBgDis3Snm3QI5TWPpoq5Kn1O1cL8BJK7ZGeJijhAjcRgJiYZn0jfaHhakFeQpPrW+
	ZCi0=
X-Gm-Gg: ASbGncsVZiYl1vGQ6iqwIM0HyRXrRf5QYaW70l2oiV2/AMoJxK464PxDMs0BDtQz8Mc
	xTNBedZ1dqrJ5R80gaIFbYysl7GnEGiErE6/E0wz7SNebGLZ5JHQVqAkq+OoFsTYg5JUR35tiPk
	mlke+XIve+fXL+NvzFwtBxb4/VVS8Lb/9fh2ir6nQGFUxaNuvb+rruTl+H9f/lHAPSCnsIsmkWY
	8jOw2YGgsCwXATOY3IcmFYOpU/8LEntuhIAiuIAhLVoC7p3ZAVi/XTN90CAjuk1HRPhVvtIbttP
	GiLUbURS21t/X3ZORdYHlEA3MsmkiwfhNw==
X-Google-Smtp-Source: AGHT+IGjMuaC5BmBdOAnNw7BlPBWn5JH7qcxJo02GNuwlEcPgWwbqMJDn55V+Su/wdq4y957SwZGFg==
X-Received: by 2002:a05:6000:4282:b0:39c:1efb:ee8a with SMTP id ffacd0b85a97d-3a074f39870mr1172764f8f.38.1745571670663;
        Fri, 25 Apr 2025 02:01:10 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3f35:2b31:c543:726d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073c8c95dsm1696571f8f.3.2025.04.25.02.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 02:01:09 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 25 Apr 2025 11:01:00 +0200
Subject: [PATCH 4/5] pinctrl: mediatek: moore: use new GPIO line value
 setter callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-gpiochip-set-rv-pinctrl-mediatek-v1-4-93e6a01855e7@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1973;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=K7gLMO3ecqvlBUfWOX7ZuqqYALbBQMdAQOJ0o+WSEZA=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoC09Qz3rBKY7vXoDHlL6r3flVEWoOZY6T/FJWf
 h5JONq15geJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAtPUAAKCRARpy6gFHHX
 cisXD/9P57W0/UnC7KoUOw8VjozyNtjJ1rN06vVzNxprMdmp9PDpNlGb0vTLsahD+4NFVA3Q1BL
 p1W7I+viQtlMMu9GaPYfJgGOurfA8HdjHskblOFIVaifefVYzwy2jSyIPjndcW+rdrur5zeAwkl
 2zepHYZVYpZK45EtIf+V/938Oo0Sfmprv9Jio66HVvXGnuznGrUD4gS7j1tXl1/KdBqqIks4J7K
 IZwYIGhxQCVmj55ubdey7G1qgtAqasXlnOmq9xRmLGU3IIqENBgY9EV9KwrH+voXt3ICY6gqxy5
 ecCqIeMwR2gTvsucRyqxVP3ZfLDYlzvJG77PA5K+BBEorzi/oTKKRomwKzJl/s/iWZb4zX97gER
 t2Zzm2q4K5EzXkWxGUzYdSPep/j22uNtt+kTIzw6PK0XYmS5NPOcvVC8rmjW1NGTOGndaoMkDHY
 6MGmD/rpGacA17KSYUf+2PPtddEV5m0SDFIR41604HfByN99tInJvAKoH7Kn9s39Mc0stpq/RdX
 tCJiiYx/RWCcSM5ECjAiBzfR0o3lAyuS7+JcM7IAzc+W1rRG7ZJM6VQyOw95oe3Iupn4SLvv6yR
 Yw2WuWfIJnLiAzyPLUNqqXVE3CeyFs8pJuou+r91bJDnhIWJo7Ukqz9HMV6keK0XO6MUEid9Dec
 y24dE/UdR6r4niw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_020112_385510_AD24F4AC 
X-CRM114-Status: GOOD (  12.51  )
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
 drivers/pinctrl/mediatek/pinctrl-moore.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-moore.c b/drivers/pinctrl/mediatek/pinctrl-moore.c
index aad4891223d3..827d0f191031 100644
--- a/drivers/pinctrl/mediatek/pinctrl-moore.c
+++ b/drivers/pinctrl/mediatek/pinctrl-moore.c
@@ -496,24 +496,26 @@ static int mtk_gpio_get(struct gpio_chip *chip, unsigned int gpio)
 	return !!value;
 }
 
-static void mtk_gpio_set(struct gpio_chip *chip, unsigned int gpio, int value)
+static int mtk_gpio_set(struct gpio_chip *chip, unsigned int gpio, int value)
 {
 	struct mtk_pinctrl *hw = gpiochip_get_data(chip);
 	const struct mtk_pin_desc *desc;
 
 	desc = (const struct mtk_pin_desc *)&hw->soc->pins[gpio];
-	if (!desc->name) {
-		dev_err(hw->dev, "Failed to set gpio %d\n", gpio);
-		return;
-	}
+	if (!desc->name)
+		return -ENOTSUPP;
 
-	mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DO, !!value);
+	return mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DO, !!value);
 }
 
 static int mtk_gpio_direction_output(struct gpio_chip *chip, unsigned int gpio,
 				     int value)
 {
-	mtk_gpio_set(chip, gpio, value);
+	int ret;
+
+	ret = mtk_gpio_set(chip, gpio, value);
+	if (ret)
+		return ret;
 
 	return pinctrl_gpio_direction_output(chip, gpio);
 }
@@ -567,7 +569,7 @@ static int mtk_build_gpiochip(struct mtk_pinctrl *hw)
 	chip->direction_input	= pinctrl_gpio_direction_input;
 	chip->direction_output	= mtk_gpio_direction_output;
 	chip->get		= mtk_gpio_get;
-	chip->set		= mtk_gpio_set;
+	chip->set_rv		= mtk_gpio_set;
 	chip->to_irq		= mtk_gpio_to_irq;
 	chip->set_config	= mtk_gpio_set_config;
 	chip->base		= -1;

-- 
2.45.2


