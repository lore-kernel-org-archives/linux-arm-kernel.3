Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A85B3C71136
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 12:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rBA3kzrSkCDXqL/qmFtpqMrbH8iiG3hu1F80uNaFdYQ=; b=sqq1t3NWtT5bvISTUE1pmzeqRU
	bL3N7RzU0jTcGysCBOahADq0BHL/+yZeIDFX7kyN9tHSWqsmBByvj86iayz3Dac4aSqdbsRgVq8iG
	55l96nm6CX3X5oIMF8QdZrQvSzm4FniQeF6rZGGlI7oxlm9WYeKDoRL96cPB5T4c802MFik8c9rri
	caHb91uoqXSLwmkO4u6TT8vctjwjP4T/f72zYbDIXXUsxckAVDKoehuFCw88ktpb8WoG6J38Szntq
	1AR0JLx+xDIQIUhcWnp9uk1QQeAI9uVVKgX3Ipz9wLafbzd5Fqykq41BdHo+3fJn1ZFlQGJh/KEVu
	dq9a1PDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRVuD-00000007G5N-42nh;
	Tue, 17 Jun 2025 12:59:13 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRVMv-00000007Azm-30dq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 12:24:50 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4533bf4d817so18280345e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Jun 2025 05:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750163088; x=1750767888; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rBA3kzrSkCDXqL/qmFtpqMrbH8iiG3hu1F80uNaFdYQ=;
        b=n2GV1WJPjKFqpG6PZTbbReiPF3jnG6f0XoysjN7ZhF44/Fkm1GhuPODEb7xFhmq177
         ETi8Ot9/EeBR2do9W+TVWJCBdqq11a422OH11XpzhiGDT7kb2UDUsExQfZb/ahROOsYE
         ensHfGS4ybfHwC7rl+RYYiO22EYDgq8PyhMqUkZ8GYWNKVgBXdmSDPxw9dHxM+tJFo7O
         eNXrlxOtiksznug+SpvscvWXKLqTVzSKUZHFD7QxNq6HUz1nUaqfVBfVyOOc6gq+mYP7
         CyCgXExadCy2a3XxSP7KcioscahuX13WW8Y95Ul27Ih4BiQu3EuClw3hzdzhvB1VRzTr
         3PSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750163088; x=1750767888;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rBA3kzrSkCDXqL/qmFtpqMrbH8iiG3hu1F80uNaFdYQ=;
        b=MLDTgCEmiZWTjBok03B+apvuv6OOECGiLpbRA5ti5DiuJ6gqhrxI8Pj+HA5cvJj29M
         z+6EWCQHxBKPSBSzKbiMloHXFpSUarvw9Ot0vkUDm+uTindLLsHoNwSF6I7rHZOZDNQ+
         fy8DqxnVWuw8ti7bBeQy/Ih8FH2fwjc+aKNq4zsOc9o5vw7UA2COTBJzLA2vxUdfQFaf
         Qyrcqvij0pTNnquYne+sE6LtFdOeC2Q3InziTbQNYqCaR8mhZ7bocFYWRi9X30LXzmaf
         36oJJVGJwlu20GPuVoY9/ySFEz/MmxGA3DBVQUXshyed6Q50is050d8logI13q0plkz3
         /i3A==
X-Forwarded-Encrypted: i=1; AJvYcCWgj4hFGKbdeYCB3O9jTakDmNQN/EfgwmDIP5EdJc0d0igW2uj2rmuLnapMvpUH++ZHJ34T8eosJ/ka9IMti7Hb@lists.infradead.org
X-Gm-Message-State: AOJu0Yyp5VcKZRED7flDZtZijVuJhO+W0C15MnSMxluyEIfnAcUxCqkE
	/jWFYJKN/Nm58F44b510azdZRBOIbiadhTD9Mh9gwjtVOVE8vy3Bb8ieDEPJ8y6IOHU=
X-Gm-Gg: ASbGncutzvSk8Xnr6JcGz5uAY6YToZNYNSkJTIZThRyICSwqTyCPLF9L8/Hdj4xNTuR
	y7+iBs/aJQtlw1U+1z4RW59lLzOLMUAeJU7GiMvj8N5ipQiGc3+bDq1D/u9+WM0YvHClI6aZ3EX
	6eq9jCVTFiQ3GhUwePYuRlH18KkcwaWze0ahecCVC5NDLc5s3alZt8zSPL0zIYLfnfSEU34kZuE
	EElGoDvcn3wfyXs0jrkm11/wdjVCafxTiAtGuN/DDNMpDUu/ZSlhzC0WValdHyifXqNGWdsjJLa
	RiVq71F75YzRozNpdeWKnyfhXuN0uy5RiEPsg3E2tgCaBuV/6nf0uh67
X-Google-Smtp-Source: AGHT+IFM4CB6egWygK88t1cCzbwx8tBuCLfY0nKXhXb0rSxlnrlGoYbjnFIM6NMIfDKL54dPCw7nOA==
X-Received: by 2002:a05:600c:6989:b0:442:e147:bea6 with SMTP id 5b1f17b1804b1-4533ca54d9bmr129406995e9.11.1750163088388;
        Tue, 17 Jun 2025 05:24:48 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:90df:ded7:9cbf:4074])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45320562afbsm173816135e9.1.2025.06.17.05.24.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 05:24:47 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 17 Jun 2025 14:24:28 +0200
Subject: [PATCH 06/12] gpio: pxa: use new GPIO line value setter callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250617-gpiochip-set-rv-gpio-v1-6-903703881fa2@linaro.org>
References: <20250617-gpiochip-set-rv-gpio-v1-0-903703881fa2@linaro.org>
In-Reply-To: <20250617-gpiochip-set-rv-gpio-v1-0-903703881fa2@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Robert Jarzmik <robert.jarzmik@free.fr>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1502;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=B+Qz2OspKJ91xFNTEdAqgmxdOA/mnHzp8sm3HNk30eo=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoUV6H5nCXll2tmzt32qwVJ5b3oXA1BlRJjKdG9
 qyMmbsQkzKJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFFehwAKCRARpy6gFHHX
 crYrEACAJfGgkYJZ/u6TIzjXF0YEJwOtUfXB3u9+xQg83jnj0Sz1G2H/QIRldbaqCd8kUmXDI65
 U0eFZ619I553u6CBkPVrChl3ZZpXtUKtGWeB6ManlL30/0d31D70RtVTKbKWHN4SkTFXOUwr61V
 us0hdDZcVXONIlywiB7f9yUPaJb+SEygs3L2h2URtZ9XF7mwRvxRQVJ9HKe1sSnkEGczZDCQ+82
 Zi+gBEJnqqEK6cyMQmdBTYAPcSLi+GT5y6AHFGh50EKfqzjR9wEvwZ5E5GrfQM+SNxZVEXYL64v
 SbJH6gq+aHB9TwUiVoFRA6GI5ex4dq0Dx+R6b/k+ObpgcBKB0fCm5OCACmniQ4J0nHwpFNe69/Q
 0/MXLF/xPeNfTqpMFjRSoYsHf5OJTFyidc9WUKOkPWLakCilxZVYLXovCTdgyaGpr2u5H01mNFO
 gaTuYuqpVkMmeGw2KEwr4qaQaQeb+yBpGBcKNt6ntqnpsRfMz1sIgF4/s9yJZddJ9NOA8xWR/VN
 OXZ2p/rlEhoTCRH1kmNm6TqTFs72FvtA7UXobCt3Ya+NAIr6F7X9iLX0CEaY0w78ZnJWqkUxlBJ
 EQQaPvVZWslahNf+l5I7HxiDZ3oB5l6gkBTIG66RkME6zNBACqjO0X8zT1wS4UiXp+ChfLA8HBF
 /Ooc4sXgrvhot6g==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_052449_759112_4D9D3DFF 
X-CRM114-Status: GOOD (  11.98  )
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
 drivers/gpio/gpio-pxa.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-pxa.c b/drivers/gpio/gpio-pxa.c
index 131ab79ebce7555313fd93b3ebd80582d1b9327d..13f7da2a9486428bb8d1d44d2caf9f21f82cbca5 100644
--- a/drivers/gpio/gpio-pxa.c
+++ b/drivers/gpio/gpio-pxa.c
@@ -315,12 +315,14 @@ static int pxa_gpio_get(struct gpio_chip *chip, unsigned offset)
 	return !!(gplr & GPIO_bit(offset));
 }
 
-static void pxa_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
+static int pxa_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	void __iomem *base = gpio_bank_base(chip, offset);
 
 	writel_relaxed(GPIO_bit(offset),
 		       base + (value ? GPSR_OFFSET : GPCR_OFFSET));
+
+	return 0;
 }
 
 #ifdef CONFIG_OF_GPIO
@@ -353,7 +355,7 @@ static int pxa_init_gpio_chip(struct pxa_gpio_chip *pchip, int ngpio, void __iom
 	pchip->chip.direction_input  = pxa_gpio_direction_input;
 	pchip->chip.direction_output = pxa_gpio_direction_output;
 	pchip->chip.get = pxa_gpio_get;
-	pchip->chip.set = pxa_gpio_set;
+	pchip->chip.set_rv = pxa_gpio_set;
 	pchip->chip.to_irq = pxa_gpio_to_irq;
 	pchip->chip.ngpio = ngpio;
 	pchip->chip.request = gpiochip_generic_request;

-- 
2.48.1


