Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 730C8C83F07
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 08:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=owEraWtJk7venlb8RdKv9EQUsLOSykpZFSy3CByRBtY=; b=l6JHitBBVFEcfriOdAiNDquybK
	9/5E2tRXqdWHJBgvzFiLhI8CXT7SM+cL4cu+MNzEhpb2Vf4opopHVUFsm7A1CnZU3quRiVNXs0E0J
	bUsV/9NhpuUzfne0POpYDSfKzD9xcbyBI0xOdfun6KYAz+TzUKsVyoDGpSkKP57sJdHbZsiudFHD2
	P0Vq0w3KYhBsKznlp+cmQGt9Ps6zB6u1wVBBGk/T4NDTxRcK2QY4GIvvS6wUhlXQyzJUKDXBbYNc1
	2NySPllD6T194DuaH2aYizzp2SUocN+9eoJbc9+hcNaMIkbIWklTgguWuFx4o8bj149auh6Dh4BZS
	jol9sQDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYhOc-00000001sML-054u;
	Mon, 07 Jul 2025 08:40:18 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYgcN-00000001kJK-1UEG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 07:50:28 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-450cfb79177so15091185e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Jul 2025 00:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751874626; x=1752479426; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=owEraWtJk7venlb8RdKv9EQUsLOSykpZFSy3CByRBtY=;
        b=bTFtXuhg+3ThtPSyh4BrMpWM70Kw9o08sAQaY8zqVIUhkPIxQv6BIAkFLXhHajMZZv
         Rp9QkX7G+3YP9cFmxmgrp6acvQklJL0eG3PQhBz5vj9jCMgfnD+Q9g7Y8FExOdG44z67
         71rrjbwGzgzorIM7X4mPg56kGn64ClHeEzogi15vfZ4ct6cg9suKdHKYUqYvPSACwrCd
         2QfdNcBgOyqfm3yyQsTefJZKJh0golTcAbc7Qpmw1/j90DlNTao3PB6QO+gCNh/H7B64
         vEKQAZt/XNGQhIHUki+ZjWwFRAqb7c9nG6k3/jm8gh/KOp31djy4Rr09tO1/JrtzRJlo
         uC7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751874626; x=1752479426;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=owEraWtJk7venlb8RdKv9EQUsLOSykpZFSy3CByRBtY=;
        b=Qo8BRhrpz/4YtV36SsrHvTnEB+nle/FyPErmpPbLGP/INc1TPebSURecG4nOAHHQ5o
         CV+oUsxSRScOqYhaht5sQTH2fCwpp5uOL4zLRk5TEb9EwFs/HtxmiBsBUPd5ATLUTVIg
         FUOEp2Vvm/Yt2LYzYKob8INf/4JoazhorE79H+C8Qi0EWQfD2gnEqvAnNG3uwmM9U9YF
         eQy/io2P6LgHn4wqRuJ/XEpfGcIb2BAGRxK3g4Tz6igzgvqA6vUxznMYe19YtySKBwpW
         kSyykF7kbFmNet+PLO406Y0MYphCiDxQq4dTxFTy6FKngZ67GmsjQrGc66IgJSxOkO+a
         desw==
X-Forwarded-Encrypted: i=1; AJvYcCU8Mw94f0WbMFSkQHySBRA4S5zt5WrRNGN3sCnx/mFVEArX9JxCGWczPrvak4TKMJHvRWFUoSxuLI+HRbyqdPCT@lists.infradead.org
X-Gm-Message-State: AOJu0YxAFMxi65X6nF9asA3tm5vVD4ID7TuJ5otcqSTQumqbg8WGtPFP
	G+yrKb0UqvLL682Eba51snnqO6ABJHeXY5paS//TBUHNh2BYfOsylSOQv52WXZgQgHg=
X-Gm-Gg: ASbGncsiHR74iUTBmKttWAJFrxp6asGvQ1q9epMyrb2YhgIb+h20tlTwPNQW4+wA1oR
	FIYfdyy9ZeP/IJyq/lBLK/gCQYXOoRSXwbvb57GnNer54UKUc34WRVThOB8V3NMxQUNe/7AV6pc
	c2sFYnykPLMOGSTlLkTe2r3kJ8MN+F0W/ZxOWpJHmnZ4cLmLi6XHwVlQMFSc29R9pF7XAI0PyaC
	KtrFqorakycBYnEY+7AV/k309w5y2XVhaTchlDKYfil7WJpu6P5YBEXFWGAfcbN0uzmWfhDUoI3
	kwwORuGbrMO9kMvfEECMcysP2z9RlHVebAhDFfaNJ53LVnPxbdnQkRkP
X-Google-Smtp-Source: AGHT+IHcLAdEzsYO6A/XPeJMQOyMyLhg3wuM/Yxmsuk4VJlAur6oeQiGzHyOLYpkD1eISNiDrgZeDw==
X-Received: by 2002:a05:6000:2910:b0:3a4:f63b:4bfc with SMTP id ffacd0b85a97d-3b49aa7748cmr4980896f8f.34.1751874625808;
        Mon, 07 Jul 2025 00:50:25 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3cf3:a61f:85ed:69db])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454b1893479sm104215455e9.39.2025.07.07.00.50.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 00:50:25 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 07 Jul 2025 09:50:17 +0200
Subject: [PATCH 04/12] gpio: tps68470: use new GPIO line value setter
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250707-gpiochip-set-rv-gpio-round4-v1-4-35668aaaf6d2@linaro.org>
References: <20250707-gpiochip-set-rv-gpio-round4-v1-0-35668aaaf6d2@linaro.org>
In-Reply-To: <20250707-gpiochip-set-rv-gpio-round4-v1-0-35668aaaf6d2@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>, Viresh Kumar <vireshk@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux@ew.tq-group.com, linux-arm-kernel@lists.infradead.org, 
 virtualization@lists.linux.dev, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2364;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=kbZlw0Gflv8gFE21sTPxvu5J+D1q02/GNnK0E//zR6Q=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoa3w6Qiuf9YTwbK1bK+qsw0alzUiL3Ps+RmwD5
 en/aypaFgaJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaGt8OgAKCRARpy6gFHHX
 ctgGEACWZF3GkmtOU1lcrcGxOt+PD7o21FLW6YY0zxGTvt1wqNCGZp9poRkY/LZfSCp3ZCSylD2
 6NKfGD3rh/jwb1Da79u8yrz8yLle2lcp+RxNaRQx7QEyX9vNYYoW4NbnBZcBIcY+AU/6/5pN/an
 gL/stbN7EZ7eonR/d+ivYWJ1WAS2/lmEhgy+KpM7dF42vlbYblVYg+PO2LwzC87po7HEPYb2LTy
 scELTrQDhw/7137Hep4J1Uqrh+JfpIeg34Lgxgj4GPa+ouTB3myVdotFWUxAVdIhjHr38Dh4TNb
 8SfcQkHOiPRFbmsK/b97SRINPRwJiN3zQp5WaMYDU1bV58SHT+PAcPzth6sCtUnP7eZA9JKiLWU
 tyEj4I8fd0uFuFcgLzpD1xDJ5nnWVQGM4ALC6keR6Yb6gtpJ5wCGZmYO0UNQdwFswIg++q4IhNq
 8SNM2YNBHfSXVbxQBzjhpQdecYJqrGm2+s7rHp4OabVl5rho0u8UM4bJSmAPrfzSneMZeZNuBvk
 JuP9ioG+07Sb0/BAZeMlqsOPCCNVmSg+KgW5DcC8KauzF4bKlHiFMvNt8kGrRTYbjTGdbjHeFhN
 09WNxjJXGw58AijtZ/+lKP8Q+hVbd8lS9H/Ki/Bkh4qANo4/UuKEvPsjoc22ipEeCISokG2Eb9X
 0EnpgzbKrQ88bOA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_005027_399581_CE8CB78E 
X-CRM114-Status: GOOD (  13.80  )
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
 drivers/gpio/gpio-tps68470.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-tps68470.c b/drivers/gpio/gpio-tps68470.c
index 532deaddfd4e2e2f306f3872e746ad4d85925893..3b8805c854f7dbf4ae96fc06afaeb775bbdcacb1 100644
--- a/drivers/gpio/gpio-tps68470.c
+++ b/drivers/gpio/gpio-tps68470.c
@@ -70,8 +70,8 @@ static int tps68470_gpio_get_direction(struct gpio_chip *gc,
 						    GPIO_LINE_DIRECTION_IN;
 }
 
-static void tps68470_gpio_set(struct gpio_chip *gc, unsigned int offset,
-				int value)
+static int tps68470_gpio_set(struct gpio_chip *gc, unsigned int offset,
+			     int value)
 {
 	struct tps68470_gpio_data *tps68470_gpio = gpiochip_get_data(gc);
 	struct regmap *regmap = tps68470_gpio->tps68470_regmap;
@@ -82,7 +82,8 @@ static void tps68470_gpio_set(struct gpio_chip *gc, unsigned int offset,
 		offset -= TPS68470_N_REGULAR_GPIO;
 	}
 
-	regmap_update_bits(regmap, reg, BIT(offset), value ? BIT(offset) : 0);
+	return regmap_update_bits(regmap, reg, BIT(offset),
+				  value ? BIT(offset) : 0);
 }
 
 static int tps68470_gpio_output(struct gpio_chip *gc, unsigned int offset,
@@ -90,9 +91,12 @@ static int tps68470_gpio_output(struct gpio_chip *gc, unsigned int offset,
 {
 	struct tps68470_gpio_data *tps68470_gpio = gpiochip_get_data(gc);
 	struct regmap *regmap = tps68470_gpio->tps68470_regmap;
+	int ret;
 
 	/* Set the initial value */
-	tps68470_gpio_set(gc, offset, value);
+	ret = tps68470_gpio_set(gc, offset, value);
+	if (ret)
+		return ret;
 
 	/* rest are always outputs */
 	if (offset >= TPS68470_N_REGULAR_GPIO)
@@ -138,7 +142,7 @@ static int tps68470_gpio_probe(struct platform_device *pdev)
 	tps68470_gpio->gc.direction_output = tps68470_gpio_output;
 	tps68470_gpio->gc.get = tps68470_gpio_get;
 	tps68470_gpio->gc.get_direction = tps68470_gpio_get_direction;
-	tps68470_gpio->gc.set = tps68470_gpio_set;
+	tps68470_gpio->gc.set_rv = tps68470_gpio_set;
 	tps68470_gpio->gc.can_sleep = true;
 	tps68470_gpio->gc.names = tps68470_names;
 	tps68470_gpio->gc.ngpio = TPS68470_N_GPIO;

-- 
2.48.1


