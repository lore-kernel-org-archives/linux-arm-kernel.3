Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7D87C3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 09:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XRbwfcPISTocHOhXVUtVqcS/MjhgKVKyymoCXJ3Oarc=; b=CDTfimcomeJ3wN0h0E9FzTXNLN
	8uajwPXKu5+twyAytMnG9806/1mu4QDw0A8IJw4jKCDZ8PmHDE3N2WvJ+OKIzdf+W6ai4MkmUJEbZ
	dW18z457SjLLD20EBW0C5F1KULKHIM5rmTfYU2JxrFDat4OEkANJmlA/XDOSmrmqSpSqNaryAkb5b
	8b6Hxxskc2nz8c61yvHRyv+DuQTcN8YAjd1HM6iSvKJ397AtHGYfAXXc1AQ+iGOnOpWdZJYa3dGFI
	yViHzPs4iAap7BFbeqJ4ZldPBgEKTmkTLpZVYcyvtLLBKSz09BwVl4qJLlORSWnTqvFCSQvcNdH+Z
	Jm+YA8Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCEtp-0000000BRxa-3h83;
	Tue, 06 May 2025 09:47:41 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCEBY-0000000BFu8-3TWS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 09:01:58 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43cf58eea0fso23400465e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 02:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1746522115; x=1747126915; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XRbwfcPISTocHOhXVUtVqcS/MjhgKVKyymoCXJ3Oarc=;
        b=qCQcPkjgZ5dG7Szy0cb/tfoPvqvJxGTqVQJisO9P7AeWcaTcQIp0S5FD/eIrbpyjiT
         j1023GRVMY46uDU3jcQlnPvQB1VNBrYdn1jNmVuEPCFTmpKcgskbXaJTphHQPaoDxR1a
         CWkx40yMYEJvP4ykEK3Dr3GEaemmYzeoOFS12alEtYx4/Dn2bW6445VsQaI5ntKXbNum
         rHcDCbUEnaJj5i7IzTGztDBILbuEZVimXO3KaoseOSCP93uVIu3HjmZNBf58nglcPop2
         bBXFYBtUbX2fbUIdz4sBL7FH+w2euygwPWhaMrtrGHcVH9ULseGD8WBmWrEmS9ZAiJ/e
         Ib0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746522115; x=1747126915;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XRbwfcPISTocHOhXVUtVqcS/MjhgKVKyymoCXJ3Oarc=;
        b=ZVdD60XZiZtgWbeL3nnDPHQEiTTRq+m8TPxaZ1uZ5Km7aawbEcwDA8py/yR91SQbnS
         8R3c4R0pJvgyXqEESktaXHhKDMK23MmvAQREnx4/3j4Wgg8CqFDB/KUNBGJb6/1IS/R0
         Gj5Z4rHsM/2ExZO+EmtFZCetRCMO4Y8O7z9fdPLd4VV4jM6pHcW0v+6mSA4JnZhVJ7Ti
         LyHhzXM3RcDsZsgxUim2PueJqUwkGD1qrkv9dWi2uiBmrAhYlQc1wG8Sh6UbIzT2A4tY
         HO3lXonctYjR9F+VTkFc1bCUuexuEa4kp0/tLNmVB6erkxnrWGjOSWAbo4I7Ed0Xww+I
         DCHw==
X-Forwarded-Encrypted: i=1; AJvYcCV2UrgrkxcosN71qQcB/14fnQiVRjI0jPDmfJf6kulYfgUq5bYucECmMPZhBCHB7qQJiixcc8ti151LQmttaACv@lists.infradead.org
X-Gm-Message-State: AOJu0Yz287kCe7dUu505uMkVpA+EvPIMYbFd6nskjituYIMRDL+pdrSD
	As0YaML6eCjLYlPdV5xJaAsca24u3M1f9Je97JkHMCjFW0n06hEKTn810LWk5o0=
X-Gm-Gg: ASbGncsJoLMWERsE99d6yOAVWC7L0TLcscqp7LmRKlAQenoK268mIjJ61Zq5+FgEyce
	czCJzUXLslySwNQ52dwHImGWe4UBR9lbRWO7dgleVYZ1B6MM5Mhr+t58+02ojLVc1p5rh0cmErf
	f4nfuMf92+y9sBAMBjt4tSjvJtAzdNJvOsd7lOWEYVdaFhAdKHS1HOywlC+S/I6uqz7nRDqQXZF
	lvf4/gSQ0uDTkVPSpUWnLHoSPp+v67tPyDF6yM8pT1asdJPCiTY5ZrOPUvDI6BLWFlD8/XZ5PpJ
	AKefx5iOF7y5uxLgLBu3FEZv6jRiyLa094s=
X-Google-Smtp-Source: AGHT+IFaS4uuNDBaE6dhkhCQZlPqtoW9s6ejNK/wKywX5ZJFKn+MgnjgDQY3rIFa7aCju9NeyyMDmg==
X-Received: by 2002:a05:600c:1987:b0:43d:49eb:963f with SMTP id 5b1f17b1804b1-441bbf33b31mr127301045e9.24.1746522115124;
        Tue, 06 May 2025 02:01:55 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:bfd0:3ad7:fd8a:fe95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441bc83d471sm138125725e9.26.2025.05.06.02.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 02:01:54 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 06 May 2025 11:01:45 +0200
Subject: [PATCH 02/12] gpio: lp87565: use new GPIO line value setter
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-gpiochip-set-rv-gpio-part3-v1-2-0fbdea5a9667@linaro.org>
References: <20250506-gpiochip-set-rv-gpio-part3-v1-0-0fbdea5a9667@linaro.org>
In-Reply-To: <20250506-gpiochip-set-rv-gpio-part3-v1-0-0fbdea5a9667@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Vladimir Zapolskiy <vz@mleia.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1940;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=g7BgjBBWPP4HAHZDBrZkWD5sdQj4Cs5tbDmVip+FOsM=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoGc/9ERgHtadWP7KkHQX+SJca3tVfXEyXuW72V
 BoPbo0tG1CJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaBnP/QAKCRARpy6gFHHX
 ciGyD/4zlyrvqUlkFdwqgF6/1bmPTMA+93X1SFLWKapDdKrqY6qB5ax4uK8vlaoVJj+EGNLpV45
 PxHxDOaQwYLAlMSatc7jXiGCGhFX8dfDyqEcKM4w1ow25Cgx9GaOf2IxMKeUtA5DljGR+fvaoLo
 itfBnXi9u0KhlfX6aoEtMfKJjL/waIWp4HMGISTreeWZBiK/Cancv+qdCZem5nlVnQToK+nrrY4
 C1rwbZ20aJhha4hrK/A2mGKhGOtA1qA/CXE7vBSKVVN5BraH3iAvlbNfWgk1rCz6X9x58IRAE34
 gc9M0lREJ5yJoopjEyvR7jxpGpRZ21kiuIMlvD6PRwNyUwi1j8I7SoxNr2UwWq+vmQcN/qnE1nQ
 fFlHfYEhHGibqrl/EgGf/eeG0O4qc1GcoCLK2ocm+ENCoFiEpiPYbS56b3rYUHy6JFWD1+RIJ5/
 4hdQE4Gm0b7F0sOa7+yC0sijojAZ8yPPZFhHayprULmzhS9MNlO9lAOjh/VXpKOrdfi2lnarnvy
 HqvtmfwYKU6qCO7JnlJP8GRepr43s/XAN4BVGd4J9hX+CcPSLfKB+xkM/D0XukauNtFoUctNuX2
 0VmdoCwcYQWChvaZ3d49YENC3PYbDFUmJm1LMxRXD8oMQHMSi6YELPLvRftvqL0K5n7q412i8uz
 XTil/+VBYkSIXwQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_020156_872123_7C22C60B 
X-CRM114-Status: GOOD (  12.75  )
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
 drivers/gpio/gpio-lp87565.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-lp87565.c b/drivers/gpio/gpio-lp87565.c
index d3ce027de081f..8ea687d5d028a 100644
--- a/drivers/gpio/gpio-lp87565.c
+++ b/drivers/gpio/gpio-lp87565.c
@@ -30,13 +30,13 @@ static int lp87565_gpio_get(struct gpio_chip *chip, unsigned int offset)
 	return !!(val & BIT(offset));
 }
 
-static void lp87565_gpio_set(struct gpio_chip *chip, unsigned int offset,
-			     int value)
+static int lp87565_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			    int value)
 {
 	struct lp87565_gpio *gpio = gpiochip_get_data(chip);
 
-	regmap_update_bits(gpio->map, LP87565_REG_GPIO_OUT,
-			   BIT(offset), value ? BIT(offset) : 0);
+	return regmap_update_bits(gpio->map, LP87565_REG_GPIO_OUT,
+				  BIT(offset), value ? BIT(offset) : 0);
 }
 
 static int lp87565_gpio_get_direction(struct gpio_chip *chip,
@@ -69,8 +69,11 @@ static int lp87565_gpio_direction_output(struct gpio_chip *chip,
 					 unsigned int offset, int value)
 {
 	struct lp87565_gpio *gpio = gpiochip_get_data(chip);
+	int ret;
 
-	lp87565_gpio_set(chip, offset, value);
+	ret = lp87565_gpio_set(chip, offset, value);
+	if (ret)
+		return ret;
 
 	return regmap_update_bits(gpio->map,
 				  LP87565_REG_GPIO_CONFIG,
@@ -136,7 +139,7 @@ static const struct gpio_chip template_chip = {
 	.direction_input	= lp87565_gpio_direction_input,
 	.direction_output	= lp87565_gpio_direction_output,
 	.get			= lp87565_gpio_get,
-	.set			= lp87565_gpio_set,
+	.set_rv			= lp87565_gpio_set,
 	.set_config		= lp87565_gpio_set_config,
 	.base			= -1,
 	.ngpio			= 3,

-- 
2.45.2


