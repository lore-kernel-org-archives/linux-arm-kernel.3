Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FAEDC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 07:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XD5pUwvjF21WHvNYwLGg3m0Hf3jMmd7qTIORgnVtv+o=; b=ImgZdwhurdRfVu9IOinYFzuUwi
	Qj+TKM21loXqjuiMIO4vg9/9diCz8FifMP+Pc+HZ6epYHyqh2kUFqsZ3jjiNIw+YOf1KuQJ32pwSa
	G+P3ucCXdMQNMp9hvQwG6eMpu+1L+xlYbRyaSYkE9nVdP32tQ+S+VU9XWWAktJ120jUXg9Ikg17Mq
	W3cuUMi890DOZWlActE024RF4c/ElQBHA6aB0OGKe/ecKBBb4tTOe6ndb/ghIvQHVW10gKaT7wMXK
	1rfDRUSo+iRrx1cBf7QS+RD4+5RLCgRhVVTrnJcGZ0ClJHz0bkcdDwmJy3ZaNdcs8DCTSIEyqbVg7
	JYamYNFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u23Nv-0000000340I-0coE;
	Tue, 08 Apr 2025 07:28:39 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u23Dh-000000031jS-2VVP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 07:18:06 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-39141ffa9fcso5662106f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Apr 2025 00:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744096684; x=1744701484; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XD5pUwvjF21WHvNYwLGg3m0Hf3jMmd7qTIORgnVtv+o=;
        b=BJXueTru7PlYa08crIeV9MmrHoZCNguzOIDzvgioHh/XV0GQVdbqOun1iqJqXm6Irp
         +jJ8I0uBiTzU7l0NDQp32Fg4/D+q2ZJ5EjRUxtZJQTQ2bQNwzXg4JoXtTLXN47DKCHeL
         i8cDh+7U1l4xaYIGo0QAnrKG+Px6W1AR28z3Oa5ZnXWS6fisjPl8ieTIsJbsXll0AOvx
         t0uzvtFiAY3yDPxFlsfLv1mzy//93P77uLAjVXoUOaNrR0xpO7y9gT644Zlg1cQWrsGt
         3t88nKVe8cYDEz9OWn/kncd5E5W/GWrwgu167qZedRjAd44pque1Ho+WhXuxEM3ptzMj
         t4NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744096684; x=1744701484;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XD5pUwvjF21WHvNYwLGg3m0Hf3jMmd7qTIORgnVtv+o=;
        b=brn5cypMHuDU4zjcjgsx+YpfCy8m+VW5ZSb0VSMCMo0wyUUg22FZlDMDHE0mThcd0/
         IqYBeABN8o1RY/f6gVZEqnmVakADJLtOW4taXhEW2eBduCcS+Wh/lLBJyaffoaSUsDNS
         +gmxkftkgUHk+vFxl4uOL6i0uKnhqHT3ldjAmIGeBaIYkT13eerDwSKR5WJaMgi4Yz7C
         m/Lcoj2sFJ12KnPTU4nfYQALFrkBqxrsPLFOLN7i5lNQ420gfMTKlR9R+NR4aelx2gYa
         UbJ0XqHC8+KSQYjzkLnnYnsCrqlEwWroOlNn9jg+0HU7chXfcOpArCat0yaKVTqs3JiZ
         XDDQ==
X-Gm-Message-State: AOJu0YzNCWb3RhTr5/gi/hv1omZhMelXu7d/Otp0XrbIwOpYjRCrZQUU
	1fsdJ16h0dvjkK+tpmxYxRtooRcqX1oW4yYpo4cWUMK7XkqxLesL0shOWWYHZq8=
X-Gm-Gg: ASbGncs8xmPAI4g/B7FMP+pCYjILvxuDpvuftxCsfOjdvn57tmmJKXUdG3ENf/1+68E
	a4RCIFuuIR5cbVh9kF2gGTrsbGUGIvHMuyUGDtTqtN8ctlxmd22ytTcpm0QfQJU6V63yLFQPJ6a
	DxMvsBDDDwYAx19DT0UhNIekTfbbPVUlkCOZ06ndv72uSxnnl6b3ornFShm+yo8fjDOt6RM0Jgk
	lpx5WthzIMIjDhnwacsIMcFND78eJ1uWJzxsGZayXS/jnUcgw23Cg/Nr/G+2qiECHM0vT4FJcLr
	rm0e/95H3UfyjNdGIGKsfv8a14CaNVlsHzJdinWMgrY2w5nm
X-Google-Smtp-Source: AGHT+IFABP+0NyYfjrmBkKOY8Qu8GHG07RX08meqZeJWYd12gU6oEH77JekbQo0tofcJZaJ2znOR0A==
X-Received: by 2002:a5d:64cb:0:b0:38f:4d20:4a17 with SMTP id ffacd0b85a97d-39d6fc48b9fmr10149766f8f.13.1744096683833;
        Tue, 08 Apr 2025 00:18:03 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2adf:eaae:f6ea:1a73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d5d1sm14257694f8f.77.2025.04.08.00.18.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 00:18:03 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 08 Apr 2025 09:17:45 +0200
Subject: [PATCH 08/10] pinctrl: sx150x: use new GPIO line value setter
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-gpiochip-set-rv-pinctrl-part1-v1-8-c9d521d7c8c7@linaro.org>
References: <20250408-gpiochip-set-rv-pinctrl-part1-v1-0-c9d521d7c8c7@linaro.org>
In-Reply-To: <20250408-gpiochip-set-rv-pinctrl-part1-v1-0-c9d521d7c8c7@linaro.org>
To: Ludovic Desroches <ludovic.desroches@microchip.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Patrick Rudolph <patrick.rudolph@9elements.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2534;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=nW90rn+BHn4CcA4KM6329dEBeQrDE0H95eIQ6kXIjjg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn9M2anp9vmc2BpNT/BOe9JwVC3uov6dAPDjgly
 g/s/D9FRDaJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/TNmgAKCRARpy6gFHHX
 cjUhEACQA8gdiny3H0cIs/eCXCdyJOM9rKhuf2+4gj2/MdJ4pjxMDZN3V2spjwTYGEBIvnaD2aw
 8YI4+5YrJ/gacqwT5jdjBrv5M86+lRF5x86+aNRAFzrvKT1fp2ZQOSVCdFg5c/pDmPEU8HMJu85
 eZM4/n8/sw0vlUHZ6wC5A3oX5Sbxxq0ODdGC1dCdre8Msr4AIZF9Rud/U0l/y22pDHy5AKDsEBJ
 45mZjH1OmDd53+rAicyRRakUYgVM4hjGDmZuiAYrNQATMYnENj+DH367L8luvpChW7o8fHoDRZ8
 SOKri5vWh0/qd01aZY1waCCyH/8jjdOf3v663xcAX+vBZg0z11mfZY544nqEXoIPun+NYhC9goA
 +elwZSvzY6TjL5X3SaNFiWSrcNSGObk3otEPfb1/Rys5r5iJNEucwjKiGjKDVc0/WJC9BLewaBE
 yHyUqES98sh2Ku2o6e40CjdKDsXHwa4Nu4U873+GjpDrypUhlpb83ax2OzzkXuHv4mvLvUQu9lx
 Op0AGrK6iBc7LT0wuW6I63145+LILkjBnDCErF8JdK9Kjq1HYTLQvslx8onmZ3l8ge9yrQfWCGV
 i29GbD3Msfrbsdl06ZuAND29xiKUyTaL39tudfMlz6CPR/ii5YZmxVuFSe0vVWBkc3Pxb7B/FM8
 aL2+h9Qb3cin5zQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_001805_658142_92D10070 
X-CRM114-Status: GOOD (  13.72  )
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
 drivers/pinctrl/pinctrl-sx150x.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-sx150x.c b/drivers/pinctrl/pinctrl-sx150x.c
index 98262b8ce43a..d3a12c1c0de2 100644
--- a/drivers/pinctrl/pinctrl-sx150x.c
+++ b/drivers/pinctrl/pinctrl-sx150x.c
@@ -432,24 +432,25 @@ static int sx150x_gpio_oscio_set(struct sx150x_pinctrl *pctl,
 			    (value ? 0x1f : 0x10));
 }
 
-static void sx150x_gpio_set(struct gpio_chip *chip, unsigned int offset,
-			    int value)
+static int sx150x_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			   int value)
 {
 	struct sx150x_pinctrl *pctl = gpiochip_get_data(chip);
 
 	if (sx150x_pin_is_oscio(pctl, offset))
-		sx150x_gpio_oscio_set(pctl, value);
-	else
-		__sx150x_gpio_set(pctl, offset, value);
+		return sx150x_gpio_oscio_set(pctl, value);
+
+	return __sx150x_gpio_set(pctl, offset, value);
 }
 
-static void sx150x_gpio_set_multiple(struct gpio_chip *chip,
-				     unsigned long *mask,
-				     unsigned long *bits)
+static int sx150x_gpio_set_multiple(struct gpio_chip *chip,
+				    unsigned long *mask,
+				    unsigned long *bits)
 {
 	struct sx150x_pinctrl *pctl = gpiochip_get_data(chip);
 
-	regmap_write_bits(pctl->regmap, pctl->data->reg_data, *mask, *bits);
+	return regmap_write_bits(pctl->regmap, pctl->data->reg_data, *mask,
+				 *bits);
 }
 
 static int sx150x_gpio_direction_input(struct gpio_chip *chip,
@@ -1175,7 +1176,7 @@ static int sx150x_probe(struct i2c_client *client)
 	pctl->gpio.direction_input = sx150x_gpio_direction_input;
 	pctl->gpio.direction_output = sx150x_gpio_direction_output;
 	pctl->gpio.get = sx150x_gpio_get;
-	pctl->gpio.set = sx150x_gpio_set;
+	pctl->gpio.set_rv = sx150x_gpio_set;
 	pctl->gpio.set_config = gpiochip_generic_config;
 	pctl->gpio.parent = dev;
 	pctl->gpio.can_sleep = true;
@@ -1190,7 +1191,7 @@ static int sx150x_probe(struct i2c_client *client)
 	 * would require locking that is not in place at this time.
 	 */
 	if (pctl->data->model != SX150X_789)
-		pctl->gpio.set_multiple = sx150x_gpio_set_multiple;
+		pctl->gpio.set_multiple_rv = sx150x_gpio_set_multiple;
 
 	/* Add Interrupt support if an irq is specified */
 	if (client->irq > 0) {

-- 
2.45.2


