Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A8FFC71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 19:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xRVP/g9ETBrQ7ivNn5p21D3d98uF7eL3W+bgcNUMLx4=; b=WRtAlPbhB5AzHJ2ByRqSP/eqRS
	kAWjfbmHsvvtCUy/+oFsMIr1E6Tr86fC2ajSLe+imjuguTukohW66BdRgpT6PlDy/iBqzAaMKDAzD
	/nisdtWY0q5hHwUCuYqVe+AhIvpGMmHLr00WiOE1yv952Yhe6CIxg3KwRIs/WwCSTmwMH4OmPE0ec
	9yf4J14URCkJHbEJy7uJYtcN8J06EdA4j7rrpawuPAXOOMmSgj35EI76D3K0ksUEsZymKPXtoaRBB
	nEyHwoXFh/c0qn1J3viNQBrec5w4EQw05XeobeN6yubLI++ZJJItgnsWPLCvrhY7ccPB982mboktW
	fj/zaJnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPnnS-0000000EEOu-2Ulc;
	Thu, 12 Jun 2025 19:41:10 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPhmP-0000000DLnk-2kWZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 13:15:42 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so11655845e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Jun 2025 06:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749734140; x=1750338940; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xRVP/g9ETBrQ7ivNn5p21D3d98uF7eL3W+bgcNUMLx4=;
        b=gcdYJigyeyECL8jOQogeNgVaJumG7Q5sy5t3RfYhaO2amQolfeqL6vFy3PLvunVsbD
         PuYyX3BiwE6ZHbw/eJgubR5054GWuRwo4Hr1ujeuaqH+wttIbK/3acERb8iruttgrqmd
         aY8ns9ndJaZ1iykXBFCwbhOsDNhDDU1Vxxaf6oxLrdUnnb7J5d1eK/PZYjczkGv+g/hv
         ppL93rYOuEwPuMeAkX+d52CZRsfhWnTvP6VEXdxd+5t7j/HnyeSzqQctWvkTKQkmQTo9
         JWHv1qxGmdPsM6WlXbLMyYYJXFxI3OBllh6RiqVj8vJOrocMF2AwCXc2+ghSZnYlqHyl
         TPgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749734140; x=1750338940;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xRVP/g9ETBrQ7ivNn5p21D3d98uF7eL3W+bgcNUMLx4=;
        b=hjlojgW1B4QOqWKI3+f5meoP0URumlprDIBou24B8E+LIZOccGyfcwWEvzMegRBGKj
         TPMYAf1Dql250cC2JtELrJqgYKWdNUU6AUT1MGsgRo1tojegBjNFwAHqN+kHm7PwQ97r
         +hpkVy686YJzjfduyezFyxBg1tVV69tvpAzAlG4vUkHmtQDHCHXDaO75CoOq+0BuXU5G
         HXSasPTNM3vzY0kQ+YhxAx68K+cT1pZuxxrCvhGLk2iTLRozc5D22JnDS2kbsGHLJIG+
         YzMPOHN0v/5i+Lv5FxuboO2FCL2zb6DiU2/ZWpc5uS5wS0GfDfa/G5JBUxFLNeE3qzyb
         XjEA==
X-Gm-Message-State: AOJu0YxRv3klJS2YUQeBfHnpnUuRjpVtpA0MVbL2PNDoQDdN7Pf57x3Q
	Q1JZW+FHOtOnkRsBACjcIRWZ+Tj/AKmlG8kLsO0iP4fnUZJKk1TKX3QMHBHxxv1vOYM=
X-Gm-Gg: ASbGncuzShv2yElv1ct5fpt89IFQ5rKJA8eiWz6Gy1Q4Xa+tGHhm7ppc/W4HPZos6C7
	NIDAJuYN75EGA657o8XC8PUhLZ7oSJb4eEAcPFxv9gKoHyr0dgEF+Wlr+h3Dm5efrheBoiomZm5
	KzR1s+5R/5Tl4S5Yq5ufRSFpxglIyUdxd5Gopy+jRr3lILnh8cPgh0aiMw5B75BdpaXmg4mlfEn
	U03GDlZETAO+L5sBLMf0qb4fzDgD9+KM5MIsyGjxdey1LA1z6/HYdOj5pXOfB/FRlyWyy0slsId
	mFBXT8/CcqOR6v9ygRbsw6HlqPaQj4wvSweKzuJ+L1YwNSYCrf8Sgl0=
X-Google-Smtp-Source: AGHT+IHSRKRz+S4AqZCA7nk2lBD5FvLjirlW/aLzXrlkeH/hiH8EEnGTppCPiobvVp5rFO/8nRH0ZA==
X-Received: by 2002:a05:600c:6304:b0:442:d9f2:c74e with SMTP id 5b1f17b1804b1-453248cadc7mr61464915e9.23.1749734140174;
        Thu, 12 Jun 2025 06:15:40 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8b99:9926:3892:5310])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532dea17d7sm20619795e9.10.2025.06.12.06.15.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 06:15:39 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 12 Jun 2025 15:15:22 +0200
Subject: [PATCH 13/16] pinctrl: keembay: use new GPIO line value setter
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-13-556b0a530cd4@linaro.org>
References: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-0-556b0a530cd4@linaro.org>
In-Reply-To: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-0-556b0a530cd4@linaro.org>
To: Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Support Opensource <support.opensource@diasemi.com>, 
 Baruch Siach <baruch@tkos.co.il>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Viresh Kumar <vireshk@kernel.org>, 
 Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev, soc@lists.linux.dev, 
 linux-sunxi@lists.linux.dev, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2154;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=uiWkBcfY0fL2/5gsJ5RtTL76wdCKi/XJJns8EXZp1Uc=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoStLmMUTq/R3HYvt1qPLJCXHDLlLJ2q7Mprw3y
 q+tW19o7dqJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaErS5gAKCRARpy6gFHHX
 ct8fEACqt7lUq3+S1tzRy8OrX4O3CMfw4nPrYnVysPwnIX5aR7rCUP9il86P5OxnBe1clhRmwf9
 HoPniYHRVUQF6YnI9EAGIDwhSUum1jbEzozs8EuWZ7akwxiY2lALTFQUB7pAw2aWqDQurWwASrh
 BAPCmHKNGQdiW4jPkj3dLIslFjsYCDyb4a7d0h7Rv4tHvOUJjwZTpmSlxh6jQhmj8/OnfF4FmSD
 A8SD5CTEpda8DN7KqBB1fsTu8o8/TRNLf1sa/DJf4UITLByVIfbtYMhfr/RbkMTCOa1I/Dca2/P
 Y8qdU4ZwwfmOTHnc/lA2TI6ioK5BvuhNtqvz4Cb1IEgG2Zlg+c5asL8lkSQySfaQCuWVBZ6+2Hp
 6pgnwuG0nSOllmDlZu6Tkzrd1ImxXcHfrsa02KtJ491H2I3Reth1gL1neP6RR6Nl3UDYNrcfUn3
 VqyShql609Nvgybzi+iTFSjRiwiPqG2yqgild3NQGG4yXE8kfSUys5UhBTzPaS5B8+VvpC/ZsAX
 xJfJ0KUdYCJumelmLmj2UUWKfC2pS9l4NPnQ9EqQOSiTnderpXlz7vJKNljTZW5Xz7ra3xmDff3
 VwRuV7ZIQrTn1lzp1FlY9U4bZ1Finj92YfG99YcWHQ0kTqN/Y0O3a7ioGWw4qxRszN5QakMKHOF
 J+HEqcwBsnDzYvA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_061541_700208_7FA11C01 
X-CRM114-Status: GOOD (  12.45  )
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
 drivers/pinctrl/pinctrl-keembay.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-keembay.c b/drivers/pinctrl/pinctrl-keembay.c
index 0d7cc8280ea2168e69cf3d0ea415f6d2389efd03..622000139317e9dfb95e9a76f2478366daebdcaf 100644
--- a/drivers/pinctrl/pinctrl-keembay.c
+++ b/drivers/pinctrl/pinctrl-keembay.c
@@ -1188,7 +1188,7 @@ static int keembay_gpio_get(struct gpio_chip *gc, unsigned int pin)
 	return keembay_read_pin(kpc->base0 + offset, pin);
 }
 
-static void keembay_gpio_set(struct gpio_chip *gc, unsigned int pin, int val)
+static int keembay_gpio_set(struct gpio_chip *gc, unsigned int pin, int val)
 {
 	struct keembay_pinctrl *kpc = gpiochip_get_data(gc);
 	unsigned int reg_val;
@@ -1200,6 +1200,8 @@ static void keembay_gpio_set(struct gpio_chip *gc, unsigned int pin, int val)
 	else
 		keembay_write_gpio_reg(~reg_val | BIT(pin % KEEMBAY_GPIO_MAX_PER_REG),
 				       kpc->base0 + KEEMBAY_GPIO_DATA_LOW, pin);
+
+	return 0;
 }
 
 static int keembay_gpio_get_direction(struct gpio_chip *gc, unsigned int pin)
@@ -1231,9 +1233,8 @@ static int keembay_gpio_set_direction_out(struct gpio_chip *gc,
 	val = keembay_read_reg(kpc->base1 + KEEMBAY_GPIO_MODE, pin);
 	val &= ~KEEMBAY_GPIO_MODE_DIR;
 	keembay_write_reg(val, kpc->base1 + KEEMBAY_GPIO_MODE, pin);
-	keembay_gpio_set(gc, pin, value);
 
-	return 0;
+	return keembay_gpio_set(gc, pin, value);
 }
 
 static void keembay_gpio_irq_handler(struct irq_desc *desc)
@@ -1480,7 +1481,7 @@ static int keembay_gpiochip_probe(struct keembay_pinctrl *kpc,
 	gc->direction_input	= keembay_gpio_set_direction_in;
 	gc->direction_output	= keembay_gpio_set_direction_out;
 	gc->get			= keembay_gpio_get;
-	gc->set			= keembay_gpio_set;
+	gc->set_rv		= keembay_gpio_set;
 	gc->set_config		= gpiochip_generic_config;
 	gc->base		= -1;
 	gc->ngpio		= kpc->npins;

-- 
2.48.1


