Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EAD7C83F09
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 07:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s0DQKfX3KmMx6Z8o+4jun5jM2c76vGf0tu/GbGgn4f0=; b=glDWqqfXzZ3WBFbZGZE3a39nF6
	ZIanswOsapU42OwYEaV+vLhqYigohAe1uNoxX/k/ADoQIUXwYat/29XVZKs1lYsEl+j6mcuouzQNG
	ltbJpC10vvKQ3TA0H5JjX+4kfQciXgciVBzcihaoBtFobd65AsJZGafP0NFzUPdegMIJe1rpAlB4Y
	NjWanwWkj3MW/mJQoK+/pyig6BqKRBbUOgBtrIYDfrQGwBImpi375+Dg3NjDaXUkRjEDweJCNooSY
	OsCmY+iJhcwgtygw6TBlU2VtukTzOzIHZpugw3DYbGL+QvwgU8QCJ9ps15zvwmixk4HpIwHPhzEJe
	BuUdmKkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZOur-00000007lqL-0Fp7;
	Wed, 09 Jul 2025 07:08:29 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZOVb-00000007h8M-1OLv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 06:42:24 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3a4fd1ba177so432997f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Jul 2025 23:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752043342; x=1752648142; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s0DQKfX3KmMx6Z8o+4jun5jM2c76vGf0tu/GbGgn4f0=;
        b=sTe2ivI+CFSC2SS6OAtnS+9GWVF1QNOFO4Dt7BnIOlBeQ5vPUzhG8kd9W/6II46iKd
         0m2AvTcOm2Z7bOiYsxFZhO6jL+wTuxWFKyn6RQqu3QDgimk8ysmK64VkV16Y+LC/YvaJ
         65mQIJ3OREAyq/m6bDXWh0+u3EwM67qCZBnGfna8ZeWQ4esP8SqpjaUy0bEaS6gJnr9r
         FR0SkOB1075M1VtyfyhT1esI7T6yejRNXYMgqOy40hNt9OqFIlNmYmKcrh6RgC61jCg7
         XVY2MrBi5xcOB17rZj8iM1lHHwClyoL6Vsmriyr2VK09QyHahb+QUgNo8v/hDeom3rsH
         19gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752043342; x=1752648142;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s0DQKfX3KmMx6Z8o+4jun5jM2c76vGf0tu/GbGgn4f0=;
        b=DwPSOii+ck31LDgLmrvnrOPCMF8x1x4Bt8N1rL2rpNCz+IlCdAGKlZkG+XsiOrV0wX
         6mp4A/rMKnOJABQJ28ETGPFW+B9TU6tU3Ic6+JFms7H0vIMD62fiTTI1UCiV1ULz7RNY
         XSOqg5HuDavfm+8JUQc+T0FoW7WSiEPKGppN5cQDn7ZqqTRDe7mGor89R8tLWzTqVCEv
         1jlb8RI4cd8PjE5bKQfdvW2VGWypXb592WQ787N4Q1ynF9nRNPaRZf851a6lHYEtC2yC
         CCAPI4XbUS0GVdFy/wcH27Q/CrAyP3H5oqAdemDHlEUz7lEJK2dkgfchlm8xBFHeQ1Sv
         47/A==
X-Forwarded-Encrypted: i=1; AJvYcCUJTSfLQ0sXkRLuJ79BV9Q5n3V6v2WEDB08CI7x43nQipbD0ongZcPWCNhi4LmUyGGfDT3SzzwqK1vf9bm6cn/C@lists.infradead.org
X-Gm-Message-State: AOJu0Yyu6Scx2uGJ63eHAaYSV+V3NR+vMr/PulS60nOQoAiQXrHUXmgq
	W/AD5tABE8W1ZjAmw7ieAR/83yPYJk6whYKwolPTwE3Zv5yGJPndrJ4FptDR67NZiJg=
X-Gm-Gg: ASbGncsyC+uZ5aRk43QKNAEowOtDAUl8970goTnBQLsZkZo2Ip1R2mLvvG5tMqm8vLS
	Vz19gcLWvVL1mOAz1y3yDFCRJR5Kkz+XWz26CL1qhjaWgGoH4ipLrttL8nXtovDKn7sRuA64l+f
	wjfa2WJxQLyHz6EMSkvKS9TIYI6oygRYl9nXXP/I9GNxlfri8imyt2rnydTdUxIkNyYMlJSFbFj
	CH8e3VIuIzfcRwE/1AkKJUbPVy1BPnaNnFZv+6M93FoXwIc/yKUchyG7jIsRgRO9F0Ynls27FJe
	IXuCg5k41aIH4WpfMXeSaH4+XSZFaXHmHreVmr5hijbwXHt2wpRMWdTx1x0TSrdtH8w=
X-Google-Smtp-Source: AGHT+IHYErGEszY0O6HURIFQJLFoxs1voB7vKtnglYD6IdLnU52B9nAfq1W2zadmnVEssWOvYkTf3A==
X-Received: by 2002:a05:6000:4a18:b0:3a4:e231:8632 with SMTP id ffacd0b85a97d-3b5e4461fcemr804748f8f.12.1752043342036;
        Tue, 08 Jul 2025 23:42:22 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:b04e:cfc4:3bd9:6180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47030c443sm15115341f8f.11.2025.07.08.23.42.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 23:42:21 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 09 Jul 2025 08:41:44 +0200
Subject: [PATCH 07/19] gpio: wm8350: use new GPIO line value setter
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-gpiochip-set-rv-gpio-remaining-v1-7-b8950f69618d@linaro.org>
References: <20250709-gpiochip-set-rv-gpio-remaining-v1-0-b8950f69618d@linaro.org>
In-Reply-To: <20250709-gpiochip-set-rv-gpio-remaining-v1-0-b8950f69618d@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, 
 Srinivas Neeli <srinivas.neeli@amd.com>, 
 Michal Simek <michal.simek@amd.com>, Nandor Han <nandor.han@ge.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com, linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1996;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=WGAWbXvlPeScqv4ww3b0QbsLDz6kCz/hkdXurfcwXnY=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBobg9CP34zqJv31E9aqr/Vmid76S9bwLxrD2Azq
 LTyPQxvLniJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaG4PQgAKCRARpy6gFHHX
 clEKD/9v23e0N93FtyWOphQC+FFZGhZUu3VHAVPF9sr7xyGS9MF4tUnGR/uCMLqThCKaKT7Bwuc
 Yc8QqMMO/8qJ5YIJBhaZcqgGAgfWDeoYOlkK+kPpePHasXGKtxSQNkoemOo5FiReuqpalr1JK0F
 S9uYPJA7mndabfvpoJgMwk48oWU3SjNu19yf8id3hov9p0HM1rBmZxtEDTwDW8iE9RDaq9hgpHE
 ArsaCOEK+Pewgaa2+RnDO+wnpHLE4H0pAV8DeCizW+EtobCTYsVdJMlY0d2vU1cFT1HDRYE9g1b
 fxnDA94xVLjpe56aCUNBeg3Hd0aMuatx9Kcm10av8ARa+DrVIpfghiova+frhJX1sXn8YSD3yB7
 4b6k2jqIcFLYhotf6V9dNOqkM49iAONu6cF4QLxhBKCxs7V70UXsFQ6w2WlQgNIeVosD5k2UhMc
 R1hYlykS72yDsH8Qmevr49Kt2vFb/x/D5q4eRfdssfFuq1FjsSZUK+W/6LmzxeHpjD1MP8zBDEc
 +xPXvvaxX2bSKQohqTR1klXgn6WUtCJ54FP65oGS7XCpFDu+y77gAbrQ1wwFb2XkybPf5iynWKl
 SAGU7YHBQfAp1puxth87820lWtEGWPiJ0S1u3mPEObpA3T9mjJWcvtA2/4YveRttCfy0nkHvIqc
 fB9WtVhigp6gIuQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_234223_380912_DF87F987 
X-CRM114-Status: GOOD (  12.77  )
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
 drivers/gpio/gpio-wm8350.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-wm8350.c b/drivers/gpio/gpio-wm8350.c
index 2421cf606ed6fded2231b76a2cda2839ed824d64..9a7677f841fc62383267e5e4d95843e2115c83d6 100644
--- a/drivers/gpio/gpio-wm8350.c
+++ b/drivers/gpio/gpio-wm8350.c
@@ -48,15 +48,16 @@ static int wm8350_gpio_get(struct gpio_chip *chip, unsigned offset)
 		return 0;
 }
 
-static void wm8350_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
+static int wm8350_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			   int value)
 {
 	struct wm8350_gpio_data *wm8350_gpio = gpiochip_get_data(chip);
 	struct wm8350 *wm8350 = wm8350_gpio->wm8350;
 
 	if (value)
-		wm8350_set_bits(wm8350, WM8350_GPIO_LEVEL, 1 << offset);
-	else
-		wm8350_clear_bits(wm8350, WM8350_GPIO_LEVEL, 1 << offset);
+		return wm8350_set_bits(wm8350, WM8350_GPIO_LEVEL, 1 << offset);
+
+	return wm8350_clear_bits(wm8350, WM8350_GPIO_LEVEL, 1 << offset);
 }
 
 static int wm8350_gpio_direction_out(struct gpio_chip *chip,
@@ -72,9 +73,7 @@ static int wm8350_gpio_direction_out(struct gpio_chip *chip,
 		return ret;
 
 	/* Don't have an atomic direction/value setup */
-	wm8350_gpio_set(chip, offset, value);
-
-	return 0;
+	return wm8350_gpio_set(chip, offset, value);
 }
 
 static int wm8350_gpio_to_irq(struct gpio_chip *chip, unsigned offset)
@@ -94,7 +93,7 @@ static const struct gpio_chip template_chip = {
 	.direction_input	= wm8350_gpio_direction_in,
 	.get			= wm8350_gpio_get,
 	.direction_output	= wm8350_gpio_direction_out,
-	.set			= wm8350_gpio_set,
+	.set_rv			= wm8350_gpio_set,
 	.to_irq			= wm8350_gpio_to_irq,
 	.can_sleep		= true,
 };

-- 
2.48.1


