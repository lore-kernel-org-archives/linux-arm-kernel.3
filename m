Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 637C6C7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 13:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tU449U3rD07cot6WAW8djohd5BFLFtc92RhNFArY8gQ=; b=U9ZpwbLKHaItx5vrFEH/rNiG+A
	B2jRwfPuyQDe1ZhThCQ4g0FSrbELDkZGEUF+W9UkW3NTdpv8pn3hVuNyVffaAptMO/Pt4YgJ6q8IE
	5MUiVrctiHNOJwO32qkJj/2JtztKP6VD1P4gc21VWGr2wc95y3I00DKRn7rCrHYZBoEN+pLo4mOmM
	iWSylmqUjh1WH94oVZk++XE1Qw5bhWQ1asLEYc/Q5Q9s/PLLeQP4kUXLnTrTyXkEIMxSS31Fa4XgI
	Yb2g+kVCeAB3Fdb1T9eH3I8gq81yWVZwxoyAZ+qWK6Z53/TTAR6GVJadaFpdvhYLnLjOCTWPZHZbV
	+htmMqQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUQUt-00000008rTC-0nlS;
	Wed, 25 Jun 2025 13:49:07 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUNRo-00000008K5C-434O
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 10:33:46 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-45348bff79fso68678625e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Jun 2025 03:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750847623; x=1751452423; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tU449U3rD07cot6WAW8djohd5BFLFtc92RhNFArY8gQ=;
        b=ShO+8YVuU3iu3Aio7kZvMj3rI2D2TEQL+fJlcrcg3xvAtCxa0IYd/lzErYDKjR7jyX
         FaSWVwSmTEA2pqwmmwd+VnOm1wqpFKClCZ8bhrh6DSBgLc6LIvEg3rPkzsilJB8GwYI5
         RUedIW7uTTLsxHqeWBIw8ceoLpF9WcMm5oNK5KXSOC3h4H/1bfL01ZoRzIm/oQKFnqry
         huF51JOz+pvYSfNWO5yZ5JahMMT8tb+A7wnNEhQTt00XpH9ExIomA/xHa0ZH4qNruME/
         w13q+nlujXL+QDDW8hok3bsBTvCzQ3yFnRNHgZqlwScMra7AyfKLwltf91EIwMk1J1JE
         5K+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750847623; x=1751452423;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tU449U3rD07cot6WAW8djohd5BFLFtc92RhNFArY8gQ=;
        b=OW+lkDnfHTLGt61DwEJFF4C/SqqEuATlrzNHRux21618ze6tn6DBTkzwj2qOdqSl9X
         bLexWtFhcQHlNvXKy0DRVwFa/M//SapGbIu9irqClrWEhDarIdEXKi56oTF0OuhkpdO/
         nEJ07aCQaHl1hktm9DsEuc7qhH+MuEzzAlilvU1AwB6iFmQr8c2ZwOuCzp+1hSKujRQI
         18l0IXsOWlHVeg7HOKTcCWP90ch+9d7EUmd05JF0qh1Gk30NAj2Yuli4Wm788lA+4odr
         z+9B59B3wLEnP4QM6dSqBiCD4w2uW5iDIozDxo32bLjIAw4FR91snPFid6DMGcrQNnXJ
         Wcyg==
X-Gm-Message-State: AOJu0YyPJ8xZ1/B0TKydEPKIRDSZrDKwTr2ytyz/O7blnOB2zGvjVZjO
	NrQRzaM8y4nP3Qz6dtmKD2i7/mFbTgS7Piv9+ZxgKeslEqKizDhzyd5StFogsaiC04U=
X-Gm-Gg: ASbGncuVI2H4sVHYf+XTF/yntGCRxlRm1ZOj1Pz4wcuhun9cw9Fp+T+9k8+B6eC7lz7
	bbsNLpMNvofG2O5cIiQ4Xn2wte9XShsaqCDzEaa1ZWK4yLawEoF1/FS+o46lS4vPA6q4TzTjgjQ
	vkEghTjoDAu89zlwXs6g/zr9p63Z05XOL7pPMny3a0JoKwOegWdkiy3GA5W2CNDgL9xCUxGKkDB
	IEriKk8A6/ZgCXMLP61RTOmsnghsM+CGcOZ4Ta6VnLBOrZn/39M+iuf/cfR+OLmQHfHfe4JSuQ5
	FCYfXsZQefMeeJYqML/+l/ca4EGooKUmMSIJwIIn2E/mk9y43BYvmODo
X-Google-Smtp-Source: AGHT+IExdKWHy0zZaVYCrqx+BP7uJ368HB9lkEt9PPvj6/TYCB40ZTHcV1Ct7Y5lmkJLBkvOCbR3KA==
X-Received: by 2002:a05:600c:4689:b0:450:30e4:bdf6 with SMTP id 5b1f17b1804b1-453837b27admr15033695e9.19.1750847623364;
        Wed, 25 Jun 2025 03:33:43 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:d216:42f3:1e7e:472e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45382373c86sm16133195e9.33.2025.06.25.03.33.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 03:33:42 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 25 Jun 2025 12:33:27 +0200
Subject: [PATCH 04/12] gpio: siox: use new GPIO line value setter callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-gpiochip-set-rv-gpio-round2-v1-4-bc110a3b52ff@linaro.org>
References: <20250625-gpiochip-set-rv-gpio-round2-v1-0-bc110a3b52ff@linaro.org>
In-Reply-To: <20250625-gpiochip-set-rv-gpio-round2-v1-0-bc110a3b52ff@linaro.org>
To: Ludovic Desroches <ludovic.desroches@microchip.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
 Thorsten Scherer <t.scherer@eckelmann.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1858;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=bJcwe6Hr5XvIVx8G6ghZMJiYUF0XZL199iB3coJfAfk=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoW9B+PQpCwI9SoOycpwUWmzmglijqLdeB/U5Eg
 kE1VEMdyMKJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFvQfgAKCRARpy6gFHHX
 cuFFEADfNeOln1AAQDWFM9wsl7uEhDwfsbG71W4/R7OgBczrNFkK+UtKviXp2HJ9O01kv/hOWs7
 6EHhIBxDrY3pFDdCE+Wy+NSeUrjAmu+c6e318/1GLlFKuByq4RPXekslFzg6vFxqLpDcBZj90CU
 c1wUFWCZZtASvlEycZTrptz7iDoRsiWrrPfWbca1szxTMpwerPyUpMF0VrP36xurC6WQxW/1h4V
 Cq8YmYy3rwSH1f4uuM/kkAJe3bLS34cD0HuZjVpU5B/y4k5lwv57dve6LYSEU4Fy4eXI41eQwW2
 +Gpch2bEFZmJlkUth7pHVoLmFsvZQPMhWgw0A6jegQII82k8eM45CJRXZArNUsMPuJDlXur4HF+
 rBIwKFgRSKQzG7HhSE+xwKGkmdqCXc1C1Wn83SO0y+V3uvW91HAwGZZQOnG8CjBVdxdOcsh2pAx
 bealDn8ZLONkKw/5Z8zYQEtxUIP1bWTLUPoftc6X7gWjyZG8OX4vs8KCXh1isM5o+f7usuQNiYa
 vO4UW8hil77mCfWWx4yzX6r87ZS36V6WZqYWVgLkaCiN8/d4JG21eaKqPcLxX3E/veTMsMy/RTy
 4ZXlQq5YztpHNAInC0FbcAuM54PMNKASc4AGGwTpKZaAiFtsMzwBpcZ+uKxpP0+H7/IBsqKPnbb
 bsgrz1crt8iUXww==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_033345_023481_84F82C4A 
X-CRM114-Status: GOOD (  12.65  )
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
 drivers/gpio/gpio-siox.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-siox.c b/drivers/gpio/gpio-siox.c
index 051bc99bdfb2aa3c8a382f773c5892fed6e0a8b3..95355dda621b40124f4702432565b7381c4e6686 100644
--- a/drivers/gpio/gpio-siox.c
+++ b/drivers/gpio/gpio-siox.c
@@ -160,8 +160,8 @@ static int gpio_siox_get(struct gpio_chip *chip, unsigned int offset)
 	return ret;
 }
 
-static void gpio_siox_set(struct gpio_chip *chip,
-			  unsigned int offset, int value)
+static int gpio_siox_set(struct gpio_chip *chip,
+			 unsigned int offset, int value)
 {
 	struct gpio_siox_ddata *ddata = gpiochip_get_data(chip);
 	u8 mask = 1 << (19 - offset);
@@ -174,6 +174,8 @@ static void gpio_siox_set(struct gpio_chip *chip,
 		ddata->setdata[0] &= ~mask;
 
 	mutex_unlock(&ddata->lock);
+
+	return 0;
 }
 
 static int gpio_siox_direction_input(struct gpio_chip *chip,
@@ -191,8 +193,7 @@ static int gpio_siox_direction_output(struct gpio_chip *chip,
 	if (offset < 12)
 		return -EINVAL;
 
-	gpio_siox_set(chip, offset, value);
-	return 0;
+	return gpio_siox_set(chip, offset, value);
 }
 
 static int gpio_siox_get_direction(struct gpio_chip *chip, unsigned int offset)
@@ -236,7 +237,7 @@ static int gpio_siox_probe(struct siox_device *sdevice)
 	gc->parent = dev;
 	gc->owner = THIS_MODULE;
 	gc->get = gpio_siox_get;
-	gc->set = gpio_siox_set;
+	gc->set_rv = gpio_siox_set;
 	gc->direction_input = gpio_siox_direction_input;
 	gc->direction_output = gpio_siox_direction_output;
 	gc->get_direction = gpio_siox_get_direction;

-- 
2.48.1


