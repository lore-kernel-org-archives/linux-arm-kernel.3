Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27F35C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 08:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m5D/gCx91/Y//En9n7QYQnwwJaerz4uwu5zS3XJUkJg=; b=qi2mA43S0lhV0A6fEbAbGyivBR
	JYgK9ZHKSCJ+Rh0tGqJGstY1OuXwRwXrMbT9K1kGDHMBQ8G41fXx3igXFwy8kDFKhfhpnGX6Dc5H4
	B0SHZumlQDDYvg7rUJh9RSCFlThN2MV2vxQeMBLbi90hjPzsn9f6AjCrm7PEVSz/cBCRySAtB8chZ
	ByXuPP6f7YlK8HrgJJZQZKR6K1HVzDN4G1qgrDZB7kswgWJa5TftbrNqR+UtznFOWYft1wW2falvQ
	s5dqejCXLIAvUtDL/qfcPmfu0Hp/7xK1tcVkkgIfR82JfvyJ/1GiBJp5QaZs29bucuEExlxqMyHmU
	0Ewo/Byw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYhMK-00000001s8d-0uXL;
	Mon, 07 Jul 2025 08:37:56 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYgcM-00000001kIw-0mR0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 07:50:27 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3a57c8e247cso2058764f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Jul 2025 00:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751874625; x=1752479425; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m5D/gCx91/Y//En9n7QYQnwwJaerz4uwu5zS3XJUkJg=;
        b=M+1PIw4Yl6RdpNyO4n3gtvVYgxgFiHAtqVeHHO9ItvMbvqqMZpX8UkWtg4GbLihQN9
         Gk8YVTyUgZ60dHp8g6YgAmH6U1KeB1CtQRb+vXxtH1t9wtih0lzvTkYI0QeOQzYf8+yj
         VA0DBYehYC79d8oYe/yab1fbSuwnOP2Rjc2V29nFKCKaC4vS/6DJASh/i6dlBMRazYM8
         hx6k34eEEhb4kuZwBNvGoLkTESrWg1jnqr9eoRb5ueehe/QGWLi9wTfja1F42GDI5XO0
         x0xB7T3JV+dEI6MkncUs9606ltF8nfLNL2pNCU2zD8l6sIE5TyOeQUVmmtMgW3IQ8raB
         /WMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751874625; x=1752479425;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m5D/gCx91/Y//En9n7QYQnwwJaerz4uwu5zS3XJUkJg=;
        b=aloEK5pKvJNBiphoRCgAiR6AjmE+ZDUSCXkskfeCkNiz5SEKT+8+46nko1qmIy+Ty0
         h6wW20V6CEWEk9Pn0sMtGjpoLZDU/4LaARmBOPS6nX9moTo1wq16x1TPx3mTF37vJWcu
         oRPjRZBkmNUyiM36Rwb1rIZCNo+NZ/jXeKN968SS8ldGovQK7D/v9mcuOjJaitAyEN7r
         0x3CyowS/kEHB6nyes2YiMOUnVu2gVfbQXvYi4seLrLa8xdCSIorfQxGHWi3Eb2a88DE
         q1Q6sLc9gdjUdjfZ7kZYcMhI/XPaUnI7OW7KZeerRET7BhgJQ4LEe9HDIlSurxxmlx/s
         3f2A==
X-Forwarded-Encrypted: i=1; AJvYcCVYjbpe3gY/L72kJfroVVYTi89rzNz8gdOgLQUfprhoesn33rahxSZyQ46icNjyuUOLachWr80pF+XSqGCxsBLu@lists.infradead.org
X-Gm-Message-State: AOJu0YxqJIuAZg1hKch3OrvW9AjSYP78j1WqsiWjrwHNLyJrSWEW6Run
	u53jaV0hpMlgNHoWKOo5sOMdTAmpyy92jbg71Zf6x48Q4yJwuoc9hyS99EYyJ7ISeeA=
X-Gm-Gg: ASbGnctyffjKUvhJqaLEfpoPH6UkNgWFp9RbN66hv371X78dCbcRq2ODegTEXjOeySB
	V/M1V6A/jdw0L5GdKYGSqmawC/M/PNc3wDGgx7vaBfhTqP0MTRnRmi/uaU4rjMZo+B1pd2NOcvJ
	jKxgTGJVY9a7CTCYvgYs1HpEG1nMezljPK1OvXqxF4ytT55WdJ6L2AOjfzvwH7xgrkk+XQ05dzM
	kVgjdrUSxAO+uffBLWvF1Jdvwn+40pOgAb8FO3jIfJr6IfIY92JZmgHd/1KsV0KhQ6y8P0iwiiQ
	//gkFK9LcaHCLUEA9aHD6OUGLMOpIvn3JDz0OcBlMJcar1E+NKYTvULp
X-Google-Smtp-Source: AGHT+IE9q3D6H1GQiSGZ7AcHRsGtYbQq9ZPf0BYDp6zHpmdTX7TwrerIwRMk4FYZqkacGFOvWKLeNw==
X-Received: by 2002:a05:6000:1788:b0:3a4:f379:65bc with SMTP id ffacd0b85a97d-3b497038e7emr8999552f8f.40.1751874624545;
        Mon, 07 Jul 2025 00:50:24 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3cf3:a61f:85ed:69db])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454b1893479sm104215455e9.39.2025.07.07.00.50.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 00:50:23 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 07 Jul 2025 09:50:16 +0200
Subject: [PATCH 03/12] gpio: tps65912: use new GPIO line value setter
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250707-gpiochip-set-rv-gpio-round4-v1-3-35668aaaf6d2@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1569;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=njAvtdVnxWRlINwsdw8tywJxxxUNxg5ByBiqLbpLFkc=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoa3w6MMvFmoVqaXM5v/0/S4TOBonUxrVRC0Rfy
 oCggMgQFOCJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaGt8OgAKCRARpy6gFHHX
 csJWD/0e0mBypz9MzWTZzbT4hEw7e0gkI0Ba1/PVBmUVVodHFTL3Stjt0WmK646DDRMpHqBHTiY
 Iq9ZzKlhSx5O2rvppnDdI/MzSktt0Lv3hl4GO6zPP9WBYvdv6LBfSRFi2a3p/lUV6api0DmI+s2
 PISctwGoDbaZnZeOTYZ981yBhivTw7yjHcMNVFPMMnPfHG5D96v1ONuWJFgEuQ3x8H6DVTDJLMK
 qPgqpOLr19TG2cLGAeEui+ES+KxO+OgrzsSTuz9ujFuCtRhLKU3cXLcQof2fx9fwg/cHWlopiTf
 m2HJYDx/jMQIWHsiwjOaNjjmw9Le4rwzjvUZUR2QhD1Sjh6QJrGiU+myMmijns5Xhd5+LB7Hc9n
 hJ2rPXYZ91ttj1Ozdee1UOwXBBsbLYDonURUnLr4Re/6nFMeYKjYPpAO1mLV0amLGLXzv/X/1+L
 0BQroNJK0NtWuTz9hZ/RCkyKxvnjWazk83nQtoE1guYFenIfZzKeMNn4ogIbzT5a1/4R2VxzCEJ
 IlKZuHBNjtx0/J8Gtqzv1EkZo72E58dgRnxmzUSb+zxNYbKTtIsOxbEqVTeC1YVEF4bWfdgEP1Q
 U7IRchb1/aaSwRZ09j2dPlDS987IdvdVB3gySxb0S2tQxyN/vd1SbtrGPxXizFKMr07xx2eF+SO
 a1O0y5m9g0Y+bvg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_005026_228176_6A767AF4 
X-CRM114-Status: GOOD (  13.25  )
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
 drivers/gpio/gpio-tps65912.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-tps65912.c b/drivers/gpio/gpio-tps65912.c
index bac757c191c2ea0d103eb0577710065611fd79aa..d586ccfbfc56c17ca18f5c2b04a807305dd66890 100644
--- a/drivers/gpio/gpio-tps65912.c
+++ b/drivers/gpio/gpio-tps65912.c
@@ -76,13 +76,13 @@ static int tps65912_gpio_get(struct gpio_chip *gc, unsigned offset)
 	return 0;
 }
 
-static void tps65912_gpio_set(struct gpio_chip *gc, unsigned offset,
-			      int value)
+static int tps65912_gpio_set(struct gpio_chip *gc, unsigned int offset,
+			     int value)
 {
 	struct tps65912_gpio *gpio = gpiochip_get_data(gc);
 
-	regmap_update_bits(gpio->tps->regmap, TPS65912_GPIO1 + offset,
-			   GPIO_SET_MASK, value ? GPIO_SET_MASK : 0);
+	return regmap_update_bits(gpio->tps->regmap, TPS65912_GPIO1 + offset,
+				  GPIO_SET_MASK, value ? GPIO_SET_MASK : 0);
 }
 
 static const struct gpio_chip template_chip = {
@@ -92,7 +92,7 @@ static const struct gpio_chip template_chip = {
 	.direction_input	= tps65912_gpio_direction_input,
 	.direction_output	= tps65912_gpio_direction_output,
 	.get			= tps65912_gpio_get,
-	.set			= tps65912_gpio_set,
+	.set_rv			= tps65912_gpio_set,
 	.base			= -1,
 	.ngpio			= 5,
 	.can_sleep		= true,

-- 
2.48.1


