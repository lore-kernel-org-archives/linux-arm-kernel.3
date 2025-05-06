Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C14EEC3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 09:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hzbCIL5EmcrHi3mTAUSbK1a5S0Wxm64DnLguO1BXQQU=; b=L2b72O8mbXD25eoM3EmbSFG25G
	yL1JS8gtdwlLW6KL5/3qVrvESbu/ePcoGyuOKxfANEeoXMKz7iQzOzzxaWrZZcjH/TvRTXOykd4Zw
	/jLq6Mlk/wRWbUufhJVavwa71aDgUcIC+Ci6hy8Bhaj/sR0rSXx/JctgUt7O+R2iXAknysUfp51+7
	sbikH9UTAXXYG8NIxexXOA0uISc8ohrYdxjjf8giYQisEILwuI45Yt/R6bFyEHMz6TsAjUNIWM688
	GG8PCjD5SqqaFJtvKe9fSVxq/v8BGL5FHEwwgCmv1gH98qZjH8qqCtj6A4UwpkITuyrJNHky453VU
	FWUGlZ/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCExe-0000000BSdM-2S5X;
	Tue, 06 May 2025 09:51:38 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCEBa-0000000BFvr-3X86
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 09:01:59 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-441d1ed82faso1996115e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 02:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1746522117; x=1747126917; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hzbCIL5EmcrHi3mTAUSbK1a5S0Wxm64DnLguO1BXQQU=;
        b=HyO/3KC1LZByceyTzDC3yeTf5kFVce/Fkg7Sih1pikFiXSsMI16hgJSgorBe2u9aMr
         oNzITT2mIvBxmcIRnk9amOH8yavpJDPrDsYNXUQBWWoH+ip9lsWStj4tY7D884ciMbBK
         42Bk668qgHLG7LRFkV2ROMz2UmWzT4mEIafGcV1KsBp2wDJ9wPecvQIYbkVHzaoSFiAj
         2GyCE3kErZyNfZ1Kyfek/kxANlw6VkTH6jrqbsZG0/A1pTjB/XNOK6Aq4RGSHrsdCPem
         FbIkzCRzqYlKcM5VlU/cnxCmq3GpezfrwC7TcrCZJbTWL9yhL2d6FufLIEgpbjph0Huu
         OrRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746522117; x=1747126917;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hzbCIL5EmcrHi3mTAUSbK1a5S0Wxm64DnLguO1BXQQU=;
        b=Yb9r+KxTsx395vp0Ys+iuaHXzvruCYLKSuVJ+ZN2+OG2nXoGIQLcY4zz2iVoZB4Eqb
         K+RbrfJZGHuDgJ+3CQVGjSa/0f6zDoX/rv3wY1vSv+oNT+3bD4nNvJLSFjhXSBMCa3yT
         W5iMbyu2XHlxvPrptPKF2ZHmd1QEHWWJgCwK3JQGsxJfKhu7mipu/Hx9jkJKxWTYLdEY
         dDSdSCKfxTcr2KD4CU7l7jQwuqpNGziNsgx6Yio1EIxd/h6b8yzac89pvHk0oiMwY67D
         brV7qN11RSF8QxGPBEp9Smixr6E8I54tAkW2y9xRbQjokzG2EcQgQZlEST/TsG17GMEL
         OuYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjoKHYFeg69+Op1/qzKUQQnGgrx50wYuaJ0YSKY361fNHO/Ws4AsTfKbi39/mZS0yfx/bUgt1QCavo9xKK8Hfu@lists.infradead.org
X-Gm-Message-State: AOJu0YzhW2tOb7mSoUoqIdxfSu3acvlhkBVB8YRWMNUBiA1ogk1yNHZa
	jK5/QsE5Un95GL5ANrpig6MxKdvSA7mRSyWSW3wNJ0pIvQABABy89Oc7j4KMePQ=
X-Gm-Gg: ASbGncsMqkaOlIhHkEr0aOZ8+a9SZdHIZXqOw+aVMfcEkWSoS2arrQsMlrvQqLfER1z
	yEx8m9emmibjHjH0x3gxjTq9jeGtyWDhOhG3ZC0fzQfgGyMdVuHzJfhihF5XK7qa+r6OKiBZ5JY
	Isx148u3XYoUtc6C/4eKYoDUhPB/6wEynUetxIkTkfkt0NcqIaeyABZCheGIAkWu+2f6Y45N7vw
	KJZWEfD4ht3ziPQ0fpcJ7nFw3VidcCC7a5bmETrf+ByHzpOMoZiGV2rkmDo8Ox7BgWmVZPH1JQP
	JWcAmJnjWuFbM4dNnM2YW9+IWZ3m/mBFGY4=
X-Google-Smtp-Source: AGHT+IGgnwi/HajGwBN2etEehTpEfYXl+12hvkBZaP+MY4NtXZEvU51wQ1BmWfxWVuZOtYDPaafmGQ==
X-Received: by 2002:a05:600c:870c:b0:43c:f61e:6ea8 with SMTP id 5b1f17b1804b1-441c48b0293mr95619375e9.2.1746522117202;
        Tue, 06 May 2025 02:01:57 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:bfd0:3ad7:fd8a:fe95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441bc83d471sm138125725e9.26.2025.05.06.02.01.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 02:01:56 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 06 May 2025 11:01:47 +0200
Subject: [PATCH 04/12] gpio: lpc32xx: use new GPIO line value setter
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-gpiochip-set-rv-gpio-part3-v1-4-0fbdea5a9667@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3802;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=pkwKmHhImUif17/jZfTfBMk3jt1SPyMBx6Ss/hErFtg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoGc/9TJ55lbmkFhoanmnEostEI47tL6hoIvYnL
 ZZagsOqxo6JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaBnP/QAKCRARpy6gFHHX
 ct1QEAC423y9clg9nGV1YeByPJgeWj0gMw56ZFNdnyyMycEv3OSni1/WHQkvTTCQFt8E1qq7b/F
 6xhGCoM/JqbCjOGU9mCTIv2WeeSa7l2AknIRXh0ZkvEd2FghdLwtj9Wm67vEXZ55TDva/H1vZ0s
 8CPBER8+RCKw7XgM+69mvkJWqryrpun0ZTxG2mG/+6LMLFOB5oSNVhtcoTsMp0tRUkvxzuzp7WA
 8cYw//hoLHjPizzikrb2hL0VNSxUTBPng/Kwz52q4AtH9anIm4EQ4FepkyQl8hMeljpBLU8OIoj
 IJYc1ZP7RPRsKOtdIgUgAQFzAFmBuOlT1uudjCpC3lSkp1iavqrp33+oHwYyKXli88bW6JVVNN4
 JgV6huyPI/62eFf/NmMrwLmniamsI6Jebb6J8zq5QJbM/XH5flRznoYFzaJkxTFeH4vdR7AeqIJ
 KunX2Fx46t8qItztrc95vcyygKaK9KZWJTjxSJAqz52jAW8hcoP1ui6txBNde6Zuwmm9xepQfJR
 P+ZCRkbEVhQ2azeYr1hkGl6JHTulaGxuykZlI33bsmw28EtPYBHjknlyz8X0JciXIOi9+HR/SJB
 fMi4/Ly0G9I4Y2I0gepTijxupA9E+Wv6Ps5L8AlBdaoeWDZ8JZxNpbA0cFatfxf0fqSX7IQRio4
 TYfKXfSySfvZL/g==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_020158_886222_6D34520B 
X-CRM114-Status: GOOD (  12.82  )
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
 drivers/gpio/gpio-lpc32xx.c | 28 +++++++++++++++++-----------
 1 file changed, 17 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpio-lpc32xx.c b/drivers/gpio/gpio-lpc32xx.c
index c097e310c9e84..6668b8bd9f1ea 100644
--- a/drivers/gpio/gpio-lpc32xx.c
+++ b/drivers/gpio/gpio-lpc32xx.c
@@ -340,28 +340,34 @@ static int lpc32xx_gpio_dir_out_always(struct gpio_chip *chip, unsigned pin,
 	return 0;
 }
 
-static void lpc32xx_gpio_set_value_p012(struct gpio_chip *chip, unsigned pin,
-	int value)
+static int lpc32xx_gpio_set_value_p012(struct gpio_chip *chip,
+				       unsigned int pin, int value)
 {
 	struct lpc32xx_gpio_chip *group = gpiochip_get_data(chip);
 
 	__set_gpio_level_p012(group, pin, value);
+
+	return 0;
 }
 
-static void lpc32xx_gpio_set_value_p3(struct gpio_chip *chip, unsigned pin,
-	int value)
+static int lpc32xx_gpio_set_value_p3(struct gpio_chip *chip,
+				     unsigned int pin, int value)
 {
 	struct lpc32xx_gpio_chip *group = gpiochip_get_data(chip);
 
 	__set_gpio_level_p3(group, pin, value);
+
+	return 0;
 }
 
-static void lpc32xx_gpo_set_value(struct gpio_chip *chip, unsigned pin,
-	int value)
+static int lpc32xx_gpo_set_value(struct gpio_chip *chip, unsigned int pin,
+				 int value)
 {
 	struct lpc32xx_gpio_chip *group = gpiochip_get_data(chip);
 
 	__set_gpo_level_p3(group, pin, value);
+
+	return 0;
 }
 
 static int lpc32xx_gpo_get_value(struct gpio_chip *chip, unsigned pin)
@@ -401,7 +407,7 @@ static struct lpc32xx_gpio_chip lpc32xx_gpiochip[] = {
 			.direction_input	= lpc32xx_gpio_dir_input_p012,
 			.get			= lpc32xx_gpio_get_value_p012,
 			.direction_output	= lpc32xx_gpio_dir_output_p012,
-			.set			= lpc32xx_gpio_set_value_p012,
+			.set_rv			= lpc32xx_gpio_set_value_p012,
 			.request		= lpc32xx_gpio_request,
 			.to_irq			= lpc32xx_gpio_to_irq_p01,
 			.base			= LPC32XX_GPIO_P0_GRP,
@@ -417,7 +423,7 @@ static struct lpc32xx_gpio_chip lpc32xx_gpiochip[] = {
 			.direction_input	= lpc32xx_gpio_dir_input_p012,
 			.get			= lpc32xx_gpio_get_value_p012,
 			.direction_output	= lpc32xx_gpio_dir_output_p012,
-			.set			= lpc32xx_gpio_set_value_p012,
+			.set_rv			= lpc32xx_gpio_set_value_p012,
 			.request		= lpc32xx_gpio_request,
 			.to_irq			= lpc32xx_gpio_to_irq_p01,
 			.base			= LPC32XX_GPIO_P1_GRP,
@@ -433,7 +439,7 @@ static struct lpc32xx_gpio_chip lpc32xx_gpiochip[] = {
 			.direction_input	= lpc32xx_gpio_dir_input_p012,
 			.get			= lpc32xx_gpio_get_value_p012,
 			.direction_output	= lpc32xx_gpio_dir_output_p012,
-			.set			= lpc32xx_gpio_set_value_p012,
+			.set_rv			= lpc32xx_gpio_set_value_p012,
 			.request		= lpc32xx_gpio_request,
 			.base			= LPC32XX_GPIO_P2_GRP,
 			.ngpio			= LPC32XX_GPIO_P2_MAX,
@@ -448,7 +454,7 @@ static struct lpc32xx_gpio_chip lpc32xx_gpiochip[] = {
 			.direction_input	= lpc32xx_gpio_dir_input_p3,
 			.get			= lpc32xx_gpio_get_value_p3,
 			.direction_output	= lpc32xx_gpio_dir_output_p3,
-			.set			= lpc32xx_gpio_set_value_p3,
+			.set_rv			= lpc32xx_gpio_set_value_p3,
 			.request		= lpc32xx_gpio_request,
 			.to_irq			= lpc32xx_gpio_to_irq_gpio_p3,
 			.base			= LPC32XX_GPIO_P3_GRP,
@@ -476,7 +482,7 @@ static struct lpc32xx_gpio_chip lpc32xx_gpiochip[] = {
 		.chip = {
 			.label			= "gpo_p3",
 			.direction_output	= lpc32xx_gpio_dir_out_always,
-			.set			= lpc32xx_gpo_set_value,
+			.set_rv			= lpc32xx_gpo_set_value,
 			.get			= lpc32xx_gpo_get_value,
 			.request		= lpc32xx_gpio_request,
 			.base			= LPC32XX_GPO_P3_GRP,

-- 
2.45.2


