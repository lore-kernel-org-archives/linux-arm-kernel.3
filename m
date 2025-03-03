Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA6F2C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 13:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TidBt2SWkGKP+ilcC4ucnacYIVlA19tuK+wOmbWsRkQ=; b=3zJ6WVZVvQxofjnqU8GJPQJzb0
	dKsumAXUxrIBIwzTTBJ3z7tgKQA4NvjtOUAyCJK6V6XVPztS8EHvvr0AQTTT1Q8I70sgMMzCIt6V9
	5PcbRKKIlp8ghzk0und6XJvuqmrhemINeSPhpyiafXux9M2xXHfPsqWES8xTMDdRjpHc5Eo1zzVXr
	8ZMexgXQb25H455iFUj1Y68s1RIBGMA8T26y5ymuuqssirCVUPrdFu8eeQtuwhGiG3H45mhWamera
	ASrAzypSGm3iqApjVGLe+VsVGWRx5afEkfqpaaHMJSSkx5cmhE3wmf8JuIbRU+MfcdjrlmnXqhCY3
	EON6YvKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp5m0-00000000u6F-0k7c;
	Mon, 03 Mar 2025 13:23:56 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp5gu-00000000sVd-3mHa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 13:18:42 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-439ac3216dcso30218605e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 05:18:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741007919; x=1741612719; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TidBt2SWkGKP+ilcC4ucnacYIVlA19tuK+wOmbWsRkQ=;
        b=lVvshQrqXe+NbgsiUtl8AJ6El16gqvwlNclM875pw2oQ90sORvGNGdHMsMG2WcKdbD
         eubL1AlaHn4r8gaYt4zrJZiw95/i6dYOkuW1zE58KWfz8dL4e4utTupJYk0CaxAbbDeB
         r6cLXDdkHfuuTTVbyj4lHC/QP3Ki2sTksfliqQhXPIdI5hWo5nJtJ4nDy6wq0IBWLtZr
         3df3s+MKDuJuH+DiTwveWFN1uCZaYdQIiDTEcDex0zqQbhbgE+aYDs2cNoxDTrsvUX2t
         VuHdSGLq5jZtWgeGW85V0/qMN8B5XVVq85eNXu1WeEDNH5PebAe81lgUyPZFmHSSqURB
         ykXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741007919; x=1741612719;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TidBt2SWkGKP+ilcC4ucnacYIVlA19tuK+wOmbWsRkQ=;
        b=WyYjxeFElgIH4XkmacMj1VpIZiFRO38G2c1xEonDejpFMawUDHhgspvIJ4lcRwgX8t
         uNfJDSXd2yxYP16byFyj48Nszggw0PFOh9zmTqo3LCgYRwg+X9kp1QsGDzM12ojaJyd0
         NZkqbCbFvjICGfvtOm0kksUWK59Hv7P884qbwK+ZqnYUU8sgk7UvG3j8ht9VbEPlLmFv
         4xIILe3Cvut3IQqTRblNyzSkT83hQGhUCPjiTTqIO1keYZ2uQRhgmgQ+gTNnBwCKG83h
         VhPMi4/FkMzqrFrApRWm0QH3ZNgSMggKH5SR0XXE9AcS/+p3lxKoo9Y3MS84J/W4VU9L
         Rn0g==
X-Forwarded-Encrypted: i=1; AJvYcCVMB7PHTiW719mvIz/yMTIx4nN/4O/RFsGsy7LxZIdqyXB8MdZt8Heyg7UOzSBr7TuT5oboDTU5f+p8VhiKTW6l@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6keuZq10AsFvP5IF9y8kq3sM6IPhzYxjUVWUqbqnK7Lmwtii6
	EJGzG+a8evuCoATXkpHRGQgIDNdL+p38T/0fm2gg6gPtfT8ASsQRzQ/lfgzGPFE=
X-Gm-Gg: ASbGncswmFBvNwlfpz20AXcQ/r2pOUY+8cjRw1T/DqDyn3ePt4CMl96rZscQ6o7oSAi
	c98sp+KFdVbo72enc3dzpdToHs6wFd7kKXgWnqsiqjCB2+q4YOkhkrIpbffD4kA61sJ9mywlNNu
	un9fh5JldvAAhSz0VBH9i30Jf8Xuj6nHmGM/tZZWojsyFc3cB9MUjZHUY/Zm/Uxb8OWNNgYfTHe
	0h/bKfwVqs1UGoUsdBUyaedSW7cPnPayHxnCFlDg2lPbEI+66X7YpjuSWFqxr5G/rP0y6jJ2SYR
	GB31p/JME53cRTXO6JN+atxl1O2ESGcgwa13hQ==
X-Google-Smtp-Source: AGHT+IEGZIkGsjS/ODOZpGkDFGZZ9llwwB4c/+lpidwwZqW9qJGdaX/avIm1867Tn1hlaTWUqZfeFA==
X-Received: by 2002:a05:600c:a01:b0:439:8a44:1e65 with SMTP id 5b1f17b1804b1-43ba66e67b6mr114493835e9.7.1741007919063;
        Mon, 03 Mar 2025 05:18:39 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:664a:9e92:6aa8:6007])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba538b9fsm194821915e9.17.2025.03.03.05.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 05:18:38 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 03 Mar 2025 14:18:26 +0100
Subject: [PATCH 01/15] gpio: 74x164: use new line value setter callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-gpiochip-set-conversion-v1-1-1d5cceeebf8b@linaro.org>
References: <20250303-gpiochip-set-conversion-v1-0-1d5cceeebf8b@linaro.org>
In-Reply-To: <20250303-gpiochip-set-conversion-v1-0-1d5cceeebf8b@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mun Yew Tham <mun.yew.tham@intel.com>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pwm@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2379;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=fJTqv/+sZnRFGZ6FlOnt5hhk1BWl5pYK/rnPH5nY6Lg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnxawpW8tUrAxZZ/uk/w5xMTaLwsBNhfY98oNOV
 E6KDpZn+g2JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ8WsKQAKCRARpy6gFHHX
 cpXFD/90YRmLFeyVnmIsi24hzo26FQhOWMYIRRDxzqpqNifd2b5mGvcBLkEwjzddss4IcMVw21Q
 gS0MpbNM+Rc/5g0YTAsQj5MKkpA5BSTvWyBUSA1trgrg0jZycAOGWBzRlpTYds/BH8yhCs/0pi6
 jmr90cZ6YXNnwnn6tU8Dmm+VOEDTnJimqBajFU+X9LDauS9ztFrbujTbVnfYMdSVjZHq6ZwLrIi
 qstWSErBzvhIAgAI0C/a2NrE6fh9Cw405kAE1wNI9DZAIo8gsSfP1leoDzVZ7i/LWurlnBRYmq0
 QapIAkzpl/Z1eBJkeS2ZR9OarmJeckFvuZHB96FRxvYG+wCYXxQYz25spUm8V5z4wxtxWKPA+5k
 5eA41bD5JlEtpb6QfTBin5dIlQU27UMrYZcZ7t6iBpE/gJyin7Os6R3fZaiM4qXR3wQ5RGYKJQz
 nGaaq5t6vTwUGDHsrJ4Bo1OQX/HISzfI5SGeaKUXhCfQ+1Geq8bLOD2wTeOt1BKtLvktU6CZh8a
 3V4IUfcddbMtemRGIcxcLM7Miy9cC+Kp/vZi4tWNpI6OwWkVg2C5WlBbKprsR39MQ9JqYdzS7RO
 PS3NYhJUj8YVocKe2vSeRtpW96rU3G1Qru8AXqkzD0URk7Nnbin41UUdW8Y+9ytmXjndYhGT1gh
 JDb3B9tKdW80oag==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_051840_958887_49FADA94 
X-CRM114-Status: GOOD (  12.29  )
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
 drivers/gpio/gpio-74x164.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-74x164.c b/drivers/gpio/gpio-74x164.c
index 640ac24b72a2..4dd5c2c330bb 100644
--- a/drivers/gpio/gpio-74x164.c
+++ b/drivers/gpio/gpio-74x164.c
@@ -50,8 +50,8 @@ static int gen_74x164_get_value(struct gpio_chip *gc, unsigned offset)
 	return !!(chip->buffer[bank] & BIT(pin));
 }
 
-static void gen_74x164_set_value(struct gpio_chip *gc,
-		unsigned offset, int val)
+static int gen_74x164_set_value(struct gpio_chip *gc,
+				unsigned int offset, int val)
 {
 	struct gen_74x164_chip *chip = gpiochip_get_data(gc);
 	u8 bank = chip->registers - 1 - offset / 8;
@@ -64,11 +64,11 @@ static void gen_74x164_set_value(struct gpio_chip *gc,
 	else
 		chip->buffer[bank] &= ~BIT(pin);
 
-	__gen_74x164_write_config(chip);
+	return __gen_74x164_write_config(chip);
 }
 
-static void gen_74x164_set_multiple(struct gpio_chip *gc, unsigned long *mask,
-				    unsigned long *bits)
+static int gen_74x164_set_multiple(struct gpio_chip *gc, unsigned long *mask,
+				   unsigned long *bits)
 {
 	struct gen_74x164_chip *chip = gpiochip_get_data(gc);
 	unsigned long offset;
@@ -85,7 +85,7 @@ static void gen_74x164_set_multiple(struct gpio_chip *gc, unsigned long *mask,
 		chip->buffer[bank] &= ~bankmask;
 		chip->buffer[bank] |= bitmask;
 	}
-	__gen_74x164_write_config(chip);
+	return __gen_74x164_write_config(chip);
 }
 
 static int gen_74x164_direction_output(struct gpio_chip *gc,
@@ -141,8 +141,8 @@ static int gen_74x164_probe(struct spi_device *spi)
 	chip->gpio_chip.label = spi->modalias;
 	chip->gpio_chip.direction_output = gen_74x164_direction_output;
 	chip->gpio_chip.get = gen_74x164_get_value;
-	chip->gpio_chip.set = gen_74x164_set_value;
-	chip->gpio_chip.set_multiple = gen_74x164_set_multiple;
+	chip->gpio_chip.set_rv = gen_74x164_set_value;
+	chip->gpio_chip.set_multiple_rv = gen_74x164_set_multiple;
 	chip->gpio_chip.base = -1;
 	chip->gpio_chip.ngpio = GEN_74X164_NUMBER_GPIOS * chip->registers;
 	chip->gpio_chip.can_sleep = true;

-- 
2.45.2


