Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8924FC282CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 13:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hFP6OzlnsfQDERRUw+GGdLYipfzpI50/ga4CvHUlY5w=; b=Q05CQEz/BpivyRJKFmLo4XfoK1
	+NJ17UT8C8aMc13frvE9aTvnWcjel9J8yd3H8wAyioXEB8NrLIze2oTQpRTM9oot51qfAHTmmF8tJ
	vOhTXzZLACrkzS2UJ+V7w/1yi5MQYc/FeAPpirzD0Tqt+dODlNPVFI7h1YKlYrD1cLiUziE5M6DGt
	RVs3DptfIPTlcjspUncMKm5PVqRTs+QflvLjt8x0/MHWeDPts1jcDett88nG9W4tukDmo2gEIxCaq
	mbZWjrIo2CGlbGwGM5sX3JXuBrHfjWRdDUDvYreaeAM30bcxS7PogWi8x5PEw0qBeLR3n4m8rkbnE
	dT9dEHuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp5qd-00000000uyt-194L;
	Mon, 03 Mar 2025 13:28:43 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp5gx-00000000sXC-3rie
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 13:18:45 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-390fdaf2897so1645797f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 05:18:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741007922; x=1741612722; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hFP6OzlnsfQDERRUw+GGdLYipfzpI50/ga4CvHUlY5w=;
        b=irdB69OQ67esv2WuGqu4EYbP2tDQBA9sH68YP8B5+1/oLwmMl1y/tIk1UOQ38yElgy
         NQtsnfSm6LYwx4H4ZPjEU2YwVIFFHwpm2T5s9Z+yYA6g5vP9iKmidaxU8MzdZIdzTtPM
         NoVuDTtZp5vEZ0Gs+/SE9ZNX9DapjyxO77X36ZRjy0T6ocmLcIjMERC9jOPJYObzztyI
         AL3DRBG6Tjht5ez8Zt8xVKh2vT5Vvb4jJDrqJk8s2TWWsvm6C4G/AFEipXjlKThY9ME7
         idzykYMFdOg7Sf1wIhLAYyLvP767pIDN/2duEDxLpUs2KTBN8W0ct6ROhXI7BMAmYR1N
         aIsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741007922; x=1741612722;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hFP6OzlnsfQDERRUw+GGdLYipfzpI50/ga4CvHUlY5w=;
        b=eV7gzbux17BbQPYObpyw6V6GqIKNjqmpDIilrf51QeZaADplDoRGfnKNykUajuzy6h
         ho/0btDuVs4eRPbPLbMPxm1aLv0vBjUQViXISXg0tDOzm2+L92lT28kjzSM8lrlQpnuU
         eZRh8ypB23dxtES9jScQ2hmB+uuf0IkUARQFYnC7IF/EV41WFM/wiHWONRGyog9ZYG6h
         9n5Yk6n7RsX6tL86cXoXn/4xeBltOaWi1kjkE9LBVd+UL/2wiVtIJM/zFntA2xok3wsU
         eLUsxSlm+BUNZcYdyPS6CqQAkmOJGFYQnlxdySbtQ2cXSMekpHDgVPGbKAPWwpkgxzw2
         aazg==
X-Forwarded-Encrypted: i=1; AJvYcCWCJ/zaEcqNXf2biDTxdZrA5CX7gCcFYQ6wA7k8rYVr41I3uzxDua7UkhejFKEqtfg51vaDlJygezcJKisI8mWL@lists.infradead.org
X-Gm-Message-State: AOJu0YyF1tPXDyxO3VkuBiJ58WiDJMj8e4lFTiIAZokBHMCGTLW9xzgs
	tVpqUZl9Sp1MhyWPIsc1Qo5fs5+NbcxVvt1jA3qUOqkg+U4uS/GL7v8eMyKY7m4=
X-Gm-Gg: ASbGncuRY4K4f4sznstmW12nywHr5mcj2GgMyPg5bQNtG387EpFRvQE1myNHr/CFYnj
	gUS4lxs/cInMTUNUS9dnNsNXg/hAQ5lOF7C9m/WtEuHrL1q9l4Er4lBTiNZ7tA3t3YFSo+EdG0h
	v5V0HLRqkF3AnfEA/dRQ1DNAGdzYTxhyU5oT4Z2a0bqFgLrvTADiyFBxYMHHTgK7Kgiz2jZ/hQT
	I2w7Yie44GtMUgk8QhLpKorEhvZSMBaPAHULtdeRb3B4O7QCgQoRXeWn6OjzclGY0mM2W1mZYkn
	mLpFP3/gr56itBlAhPO0OIh0PUlu4CZkgFM8tw==
X-Google-Smtp-Source: AGHT+IH4JWES9ARnc+bAEeGbW+TGmzRI13+v2x9lWq0KdFeC2YMdrtpeHPu9rNemD9SH+Vsoyms9pQ==
X-Received: by 2002:a5d:47ad:0:b0:38f:3791:c1df with SMTP id ffacd0b85a97d-390ec7cdcd9mr16010467f8f.15.1741007922072;
        Mon, 03 Mar 2025 05:18:42 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:664a:9e92:6aa8:6007])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba538b9fsm194821915e9.17.2025.03.03.05.18.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 05:18:41 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 03 Mar 2025 14:18:29 +0100
Subject: [PATCH 04/15] gpio: adnp: use new line value setter callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-gpiochip-set-conversion-v1-4-1d5cceeebf8b@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2053;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=kaPruJN9Kqnj6pYgKtiRCJyUBIyZUBSHWZ9yCXz+XTc=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnxawqMe3ivpxHTwxjmRFDD+r5+f7Fb5d0Noi1G
 O5lxfuzzSSJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ8WsKgAKCRARpy6gFHHX
 cmp4D/9jaHcQF7O+UdJIKHTVsZUWHdT/ZGnlWy1V3W1/TlaMF97G5wDnkiNu8Abc/PxBzSIt7Vo
 KBMyBZrdnswEDYNm04jbPBI25aQfX6tWozJEZf9iYmpe9wFlcFTzksQzJpUFBtmKqd6vNbmfItm
 fCi1KIafodHkdb9RUDWAvSu2oq3iv97mq72cqDYzqnwYTFGE3sRihwrVxQf/zbQxdJ+Bgggp8Zh
 bqOoleGxS5pKG8fcqro2cd/HEf4VsjNbjq0tFes+XRILE7ef4PWHacVJFLwiHuR6mgfskXZgqGm
 o0O3Q5FWRrbNpDJhuPWkvn/dR7gqcipLj5GyQgSL4t00/D2oFvkYW5n9LVPpPADv1N/YKiWNr2j
 HInoAV+f0REw8KC8InxkPcpaErGNaaXwgnrAu5Y9HXWkhzcSjYZfS/1xCmXXQKXwZN+Ln+fX4G1
 YccNjDF7ZFOmxClF18WPVkMu9m5kvZjyIqtgnvo/H8X+kMCpX9DR4FsmqOa6rl0KO8IKcge+D7d
 WobcW2JM7A49kYe/ZlTxhEX1pTfXKAIUfUuy1/o3ocVUdiIZjPjBbkaHyimA74usFeUAxDL1+q8
 k3cJxwl8jpJDmJvWpGCh5g+HLssBC0WNpo/UvXCxt3vqB7Wnl7G6Fmsfv/4nQk5KRv4/pPF4sj9
 CHJZ/DGf3QGZI2Q==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_051843_962415_D8B01F00 
X-CRM114-Status: GOOD (  13.51  )
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
 drivers/gpio/gpio-adnp.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-adnp.c b/drivers/gpio/gpio-adnp.c
index d6ae9cf1eb54..b31ce0e337ae 100644
--- a/drivers/gpio/gpio-adnp.c
+++ b/drivers/gpio/gpio-adnp.c
@@ -80,7 +80,7 @@ static int adnp_gpio_get(struct gpio_chip *chip, unsigned offset)
 	return (value & BIT(pos)) ? 1 : 0;
 }
 
-static void __adnp_gpio_set(struct adnp *adnp, unsigned offset, int value)
+static int __adnp_gpio_set(struct adnp *adnp, unsigned int offset, int value)
 {
 	unsigned int reg = offset >> adnp->reg_shift;
 	unsigned int pos = offset & 7;
@@ -89,23 +89,23 @@ static void __adnp_gpio_set(struct adnp *adnp, unsigned offset, int value)
 
 	err = adnp_read(adnp, GPIO_PLR(adnp) + reg, &val);
 	if (err < 0)
-		return;
+		return err;
 
 	if (value)
 		val |= BIT(pos);
 	else
 		val &= ~BIT(pos);
 
-	adnp_write(adnp, GPIO_PLR(adnp) + reg, val);
+	return adnp_write(adnp, GPIO_PLR(adnp) + reg, val);
 }
 
-static void adnp_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
+static int adnp_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	struct adnp *adnp = gpiochip_get_data(chip);
 
 	guard(mutex)(&adnp->i2c_lock);
 
-	__adnp_gpio_set(adnp, offset, value);
+	return __adnp_gpio_set(adnp, offset, value);
 }
 
 static int adnp_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
@@ -430,7 +430,7 @@ static int adnp_gpio_setup(struct adnp *adnp, unsigned int num_gpios,
 	chip->direction_input = adnp_gpio_direction_input;
 	chip->direction_output = adnp_gpio_direction_output;
 	chip->get = adnp_gpio_get;
-	chip->set = adnp_gpio_set;
+	chip->set_rv = adnp_gpio_set;
 	chip->can_sleep = true;
 
 	if (IS_ENABLED(CONFIG_DEBUG_FS))

-- 
2.45.2


