Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F645C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 07:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mKHBQhlPmU3j6804TJoiY+lijz2sviuHoc3u/Cr+n0I=; b=2yHLqMzfpoco5IySBRKoRXorBn
	zTX2TjMkrlRsg3th7kd3Frwm2RTzHH3rtir3qB0wnoMDQdOibPz963/d8COsfVuTywmtxeETVlzXS
	tegJeOMNE6pZ1ylNhkF+TWMXDGao04ry18MJHA5n6PAPXcmZ6GCxws67LTvC9QEgIp6DySKv9rySI
	dLi/4JP8232j+SzgBooBbsshwccbH4mw0nAT+abL/HE7Hd2FTeo0FQre95MAVfC+RNnW15A44VLP/
	6qVWOY5Kt9mscHvT2Zjva4N6r+HGXWoO6nG5VWz5Haw24tyiJUPTJSWgZuW8x+eL8O4dCEel0UKmF
	mdOG7EFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1gij-0000000GiBa-2i2l;
	Mon, 07 Apr 2025 07:16:37 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1gbq-0000000GgSP-0Pfz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 07:09:31 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-39c1efbefc6so2168794f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Apr 2025 00:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744009768; x=1744614568; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mKHBQhlPmU3j6804TJoiY+lijz2sviuHoc3u/Cr+n0I=;
        b=1ITPt3JyVzzg2WGKPDykWtjiZHcIszm423gD4LSqc0bmqGskb/07/EKhdHsDb4gMlM
         /ZFBlMx3eifZyk/PkOCXmtqN4hWcUuTIumQgZlw7oqHTCYxJzMsvpM8JJrgqBoI6LY6b
         a4O65aKobM3W+gH292XgCsMxKUoAirv72ytDMT9qtvfkOVivs0iru832gPuw684yPEZP
         aONg+Wt4RPtXPjBJYiD54Bwl1m2T5AInOHCB/Mx7ltJVgJu6WISmMNvl68HPvQyspEEj
         Dz/Kt0+vTSSuBacld6Gi/Oh6aNM0rVRsFGIHthlAFZzGZw3AdNj7QzuddoSzRSxap3P0
         KSJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744009768; x=1744614568;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mKHBQhlPmU3j6804TJoiY+lijz2sviuHoc3u/Cr+n0I=;
        b=FhYfM85AYUnfwGWrgSdqwhNJ5PeVnkB2J++VkxE44zml+fCsI4XtQNErEOlzbbYCRc
         z6uKbAi9Ao1cf65K0AwiN2tKhFxVvUCF+M+CU3ZQZ1nMlBQ6GZeAjOJ3z4/oyvVZt2b6
         OxEpA3DQ7AKDd2frfEK29Ly10aN/3h6OoAO1/tMxa3lWOt4Xe8ysdQBiB3THN+H35r3H
         FRub+gsTRjRhk32k4qOOw9HUE+Y6h+4TeAuGVT9hnbpZl+zksfp2A0puGD7lg3nHTywq
         liIFv8Wo+YuhdDK5Qp7einbU5eZNZGfeflJXFT5lGwBI50DkSXuWvJWNcqWduv8TLpaE
         G4Mg==
X-Gm-Message-State: AOJu0YyeiT6DlUKX1DS5B2gNvj+1KeRNXDjUGg0lsGQQMY3LsZMnwr3b
	hAc9sX1TuV6CVs/YMRw7VpRvsz+oKNNIOu/4sbqTLDY5LpARRRl+lmKTQreaXEE=
X-Gm-Gg: ASbGnctnI2vTW6NIGXrRX3gvaxaLyJpNKSGKVssSeApQCFpBd8huPu382UPcuebamEw
	pwfKYH3tObvSpeChzvI/a3PrHQYj3g2FWTCJeMcZPBiMc4aFjjH0KBbumvlaX4BTuuyhdhezmS5
	iCRcJdSfCJm6fb9gvSTWn5l6SkRqV2PaWSbGwujKPwacMzf/eXam9pmn/ddiNv5rCv+8q8MSa5M
	2wHgCmhH52/MfP+mnq3Wv/1Ci14b5wDlaHU0Qg1Ra23H1psbY33PQaymMmJAKMJ3GxuIGuaQkwE
	HY40K4SbHpdh9Hcm00J+LqFv5JlSp52afT54869wMqVG5oHN
X-Google-Smtp-Source: AGHT+IEOVwEvDvK/VaX877azSHwhGwB+qG3k0uZPl7enDJ5MXPhr/6Jl2r6haw04RdA5keAMOfMCAQ==
X-Received: by 2002:a05:6000:440d:b0:399:7f44:5c74 with SMTP id ffacd0b85a97d-39d6fd06920mr4321098f8f.55.1744009768449;
        Mon, 07 Apr 2025 00:09:28 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8c64:734d:705a:39a7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec1663060sm124622795e9.14.2025.04.07.00.09.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:09:27 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 07 Apr 2025 09:09:20 +0200
Subject: [PATCH 3/4] ARM: scoop/gpio: use new line value setter callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-gpiochip-set-rv-arm-v1-3-9e4a914c7fd4@linaro.org>
References: <20250407-gpiochip-set-rv-arm-v1-0-9e4a914c7fd4@linaro.org>
In-Reply-To: <20250407-gpiochip-set-rv-arm-v1-0-9e4a914c7fd4@linaro.org>
To: Andrew Lunn <andrew@lunn.ch>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1649;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=ehKRyvYg5rUoJTMfe9/Qu0Sq86m2y/6ATgEJ9xwP4+c=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn83ok4MKKf0abAA3OAYKfP6+RbRvjSZlJeEPjq
 onYoqwKNmOJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/N6JAAKCRARpy6gFHHX
 cg+gEACBTJJGVlRuVE35u0vd0TPLco/EUqtFuji2MMq9tgOsFcm+6EyEyHEQWYwVXELmtyi+pgs
 v47ssFCyjuUpRiTQuoDAiz+kNGhhbedC/Y81QS9HhmIiqRr7+4or1ntC0EF6w5bDaCJ8czd5b1u
 r+uHTdRr3K0PH7leknEkF03e2e8FaUoC6DfVhGDgiKSNujP+zHMI7CTLP1CCLMw6Vni4z5rnZ+B
 DTtwtPu/nStaMeYbGVVXdRHMfuzLqGHhT/vURx7RlT8x4ozmQCC+hRgjMeokIALearKmc9fxYGB
 6mLjyWbGDqlKg7ewiYLhs4/hVQqxrveH8fwxGUhqb9gu761NA6BXH6uqRGupXN1Yfb9bQBJDv0U
 8egk07IK/MjZ3r1pBfvICWR7mPPe+WPaiEIZYJdVU0FZr3n5qbj5Cvx3cxDbMawDkChProIlGKB
 La8MSZeeryoNdDhNqBCuTQDl5LzdUCQEZgr6a750ft2Lx8NJRckIBa9+xlwydt5/Sed6G5FqBtj
 mb8BBh21dARgYpr76EntXsciH5RifmwOuKMO8WhVzLwM920GOuBCc0KnVZjgE3BBSRyLZnjsLEj
 S6Uy6Iibd+lHLM8ACyvhERmG9VK2xhyBVzAKzEjp7D8UMlGaSjXznkrvHdePu3ybRMH4hftvDol
 VtUkDFktum4jREg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_000930_143184_D8A0028D 
X-CRM114-Status: GOOD (  14.52  )
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
 arch/arm/common/scoop.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm/common/scoop.c b/arch/arm/common/scoop.c
index 0b08b6621878..2d3ee76c8e17 100644
--- a/arch/arm/common/scoop.c
+++ b/arch/arm/common/scoop.c
@@ -63,7 +63,8 @@ static void __scoop_gpio_set(struct scoop_dev *sdev,
 	iowrite16(gpwr, sdev->base + SCOOP_GPWR);
 }
 
-static void scoop_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
+static int scoop_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			  int value)
 {
 	struct scoop_dev *sdev = gpiochip_get_data(chip);
 	unsigned long flags;
@@ -73,6 +74,8 @@ static void scoop_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 	__scoop_gpio_set(sdev, offset, value);
 
 	spin_unlock_irqrestore(&sdev->scoop_lock, flags);
+
+	return 0;
 }
 
 static int scoop_gpio_get(struct gpio_chip *chip, unsigned offset)
@@ -215,7 +218,7 @@ static int scoop_probe(struct platform_device *pdev)
 		devptr->gpio.label = dev_name(&pdev->dev);
 		devptr->gpio.base = inf->gpio_base;
 		devptr->gpio.ngpio = 12; /* PA11 = 0, PA12 = 1, etc. up to PA22 = 11 */
-		devptr->gpio.set = scoop_gpio_set;
+		devptr->gpio.set_rv = scoop_gpio_set;
 		devptr->gpio.get = scoop_gpio_get;
 		devptr->gpio.direction_input = scoop_gpio_direction_input;
 		devptr->gpio.direction_output = scoop_gpio_direction_output;

-- 
2.45.2


