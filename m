Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8AF9C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 08:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tEtmO9fJ+uBB8S0davk+ZIXu0Xo38Vmwmt1Jp6drvMw=; b=XczNL77ue5mWsxPW0w2M5dUHxs
	14azr8jhRXHxDWOKfyOa3yicIfoWngNadA4O3OuT/FZfuhSDbi02x2AkWyyBkOtQ5u2a3Ct1Rke7F
	S8ZaGUKqeGQonZMdnQ3EwVDph5AelUjZ3csCNpJU95svbZTj1Zc937LyVpF5wtEaIAkX9ork5L77P
	O9DdUSLQ53e2e2wyTjrQejZGcRMzbU8xL37ilnAGwuMftjMxAf94lUzjFDppjP69G64BEIjLbeDmG
	prCsZ4TRUqPvbio7V64/2pF5kAJmyoyPTR7Sno6dcEA/n5zJ2x5VazAeLTTuocW3pnHVH8QQyu5GB
	hidEXU+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYhQu-00000001scf-2yb8;
	Mon, 07 Jul 2025 08:42:40 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYgcP-00000001kJs-2Gro
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 07:50:30 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-451d7b50815so21840615e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Jul 2025 00:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751874628; x=1752479428; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tEtmO9fJ+uBB8S0davk+ZIXu0Xo38Vmwmt1Jp6drvMw=;
        b=MiGrDFbDbz0JcvpL0uER3gjFW5tnqr7tfyO36gaC8soREbF/H55RynUIOGVHW0bk2X
         n8lTCwEPKfdXIz3m5z1ziYlOwjcVs4702IHJXdk7X3KiRCTKCOPq6qFvJ/dFlnlL5LuZ
         a7cg30agMe7iuHLQQlIdOOL900ckN79s2Ols4Jki4dVBh9u8yU4ODiA1Au8279v1G1YQ
         YNNqr9AnRG0TfIz3F8naLIJBIiKGSmyCK2kD7CtIxpMdzZqfdO8/Cm4UIgBFhjLPI2lq
         iejy4wLpgd9ZLq5yrIqut6nneBOKgZF5Lj+nvtTc/ygHkW4piOZEMVuNPDhpkX6bXOag
         cgkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751874628; x=1752479428;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tEtmO9fJ+uBB8S0davk+ZIXu0Xo38Vmwmt1Jp6drvMw=;
        b=SxSpSd9rXXed9wtzownyhpR0Ti9VHYNWxqfyIj26Dz1gZ93rvb3pp38svVIrctW6S3
         wK+PFtVQtp29dEmhrPArA3YAJcbSsqY9f6Bf6roZ8idCNZONRgK41wv3bM1Rh6D4zZrU
         owUC3Nl3RjufJrjx1xPBort5Y7L/EuegeJYdfChXCIMIrgqV4jujr0FJjcnHR1D5HdaL
         OisFksMfjIBjvUUNiYzFfXiGLZz6Lr+n4OjGDbGY03pKdejzw5inlDUlg6DSrfb6GzCw
         DMBNd/gxJNziZUDWOv0ZKW0q9wCK22+itxx0qsIzWb37GomZXZz4rtep4FXCsK50zt8e
         CaaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjB+xJpAStb5vLvCHJMqzRWdPgKtsHmNY8D3I4laaIeROvwH66ACpPTtdzStGo9ceWB5y2CIv1iGQgylPpmwfC@lists.infradead.org
X-Gm-Message-State: AOJu0YyauKG+oPn0V7xJzKinjZBNUas6fXwpVki9D7X+hIdj5jgM7tWS
	5PBQSJOj5M0dZlSIgviOZs4r0XRzJoaFjZGyiCdBWzAoP3i9HsTHxEITDy2if2lCoGk=
X-Gm-Gg: ASbGnctWqOUJaXLhRvLZQoEpqk7kwnGw0cweQH71ido1ZGXKoxLH5biYR9FOgSpi3RM
	zEeWewhDJw5Vej8tyi6HosRN6IFXept8Jjev22y6qr7eGRcs/ZKYy/xHhPVeLVwch/A+M6vrMU0
	V4TPv0Fy6C6LqL4MzCMuVBp/SuOzMijokPR8qDTxijCjcHxyR3nHi2dFnWLslv7t7ZTPKod5fXG
	r7M142M+ttujC7XE1UuVtKdv9TQjhYz4R4++4GuiqzkcUnaLqyAujt4K0yvGJvlltjse0poc8dU
	4bgJwCdVo5NmMv7BMM0+D++bq5OCRAaKP3cEUZaKiUirDR5H2l8jQST1
X-Google-Smtp-Source: AGHT+IGlE+pJSFOw6vH9Aqv3avNwNGn5mFUP5UKn0Q9HP54n73BXvlRB3Kq5i+TgrQRQO3lRBaB9xw==
X-Received: by 2002:a5d:5f55:0:b0:3a4:f52d:8b05 with SMTP id ffacd0b85a97d-3b4964df03fmr10640130f8f.35.1751874628016;
        Mon, 07 Jul 2025 00:50:28 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3cf3:a61f:85ed:69db])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454b1893479sm104215455e9.39.2025.07.07.00.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 00:50:27 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 07 Jul 2025 09:50:18 +0200
Subject: [PATCH 05/12] gpio: tqmx86: use new GPIO line value setter
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250707-gpiochip-set-rv-gpio-round4-v1-5-35668aaaf6d2@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1554;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=NgRXFxECTIGOfluzrXyJwaqY8NOQtfYF0rMAtRS6Rhg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoa3w6ErAw3SowptdZuCyqLCjwppWgEQANfdpre
 IzHnSXPb+6JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaGt8OgAKCRARpy6gFHHX
 chTnD/42+6CRgyNGdp2thzTybYnTiJryeQNSK/Lx2NfE2jcS4iboKz75sI8BXNYY1dR2bcGRQay
 CPk1u4V3Ya6I8jTXAZUe8S2T6ELuz1oNMQ4yvREaony2TzhBuBG8ffMuDZF0z7Bu/og3xtySKkx
 oIz3vRU/p6GtI49O5J9DpHQE8SBUg9Wd2K7rmcUklTTcmnOuIA0WY4Rj4reZHNLUeQ2nqBtIsL4
 6C24ncTwFj/e2YNxci+6lYlsrG87UZOJemMomVa28JW/JR9pxgVgLCwxQYJgggEIHsFvDPl1dDn
 V4VczZaTaTRb/CqRNawgRzseqnuZg9sNOhpWEpZtqseGjjXqVDzJt5mf0IZMPIQjGp1FpzTfDm/
 xoWSQ9rffO5MdrZBkRQ/XrfL8M2e2TfMcDDrijL4XEi3Ia8xHwhF0YKj7QP9YOoD058yxCg57Uh
 on8oGG1tn6KJgGp5RWKiW+Kml3l/NFyiNbl+yxLKMo8u9usCBkVOo94NoeTeLpphdQInkVbAO2b
 xJ5tj+q8rStmfUmkNaL553TMOEdsYEp+4HnnXLmbznSZMuVg1VuJYRXEhGHBfN9iiPdbHPdnT2T
 MJO5yz11R8Ck8meOOQSEKqfECz0WdrCyazIpGS0a2CScrg/HGmvsjElOlBmKwWqJBTuz7lGtNz+
 AzbrtTSPCMbmASw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_005029_584479_D6327C12 
X-CRM114-Status: GOOD (  12.96  )
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
 drivers/gpio/gpio-tqmx86.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-tqmx86.c b/drivers/gpio/gpio-tqmx86.c
index 18f523a15b3c03e083b363a026e751f7367fb080..056799ecce6a256f3438d9fd81ee4677cdd20125 100644
--- a/drivers/gpio/gpio-tqmx86.c
+++ b/drivers/gpio/gpio-tqmx86.c
@@ -93,14 +93,16 @@ static void _tqmx86_gpio_set(struct tqmx86_gpio_data *gpio, unsigned int offset,
 	tqmx86_gpio_write(gpio, bitmap_get_value8(gpio->output, 0), TQMX86_GPIOD);
 }
 
-static void tqmx86_gpio_set(struct gpio_chip *chip, unsigned int offset,
-			    int value)
+static int tqmx86_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			   int value)
 {
 	struct tqmx86_gpio_data *gpio = gpiochip_get_data(chip);
 
 	guard(raw_spinlock_irqsave)(&gpio->spinlock);
 
 	_tqmx86_gpio_set(gpio, offset, value);
+
+	return 0;
 }
 
 static int tqmx86_gpio_direction_input(struct gpio_chip *chip,
@@ -368,7 +370,7 @@ static int tqmx86_gpio_probe(struct platform_device *pdev)
 	chip->direction_output = tqmx86_gpio_direction_output;
 	chip->get_direction = tqmx86_gpio_get_direction;
 	chip->get = tqmx86_gpio_get;
-	chip->set = tqmx86_gpio_set;
+	chip->set_rv = tqmx86_gpio_set;
 	chip->ngpio = TQMX86_NGPIO;
 	chip->parent = pdev->dev.parent;
 

-- 
2.48.1


