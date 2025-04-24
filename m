Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D87BBC369D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 09:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wyD1ibYwZZNQjABTauO+kWeZmIcgNLsOAbjC6l1tSrA=; b=dNJIeEUZnqSX3N3DcTK1wcYZJ+
	l/UvmVgCmWsWvqxVnOHSSN1YlRvtwyb/bOPxwxlAn4CfyvJBzluIrJy5CLwzpauA0fKvk2huEZpif
	Thh4BbJqWg2U2QPEJh/PCem3JOU4lSV4nxKSubFBhxhStAEA0KDDJMnsY8U0ZpDeXTZRTnjU2W7Sx
	GhBk6rsii4aMUCyCuFpLhmvZEIU777PtU3ekywA5pxW+4RgjoDMn9O+gXLEfE7enkb6Sd1Crwi01P
	mKh/MH6BxOAU+RxzGteIqdI/ZF8UviKYTJQaVdV4E7fXX86rPhniVRqtyqXyflz6LUj89qaQOn7fJ
	560LrFiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7sWk-0000000DRmT-2Lmp;
	Thu, 24 Apr 2025 09:05:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7s3w-0000000DLDz-0rmZ
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Apr 2025 08:36:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=wyD1ibYwZZNQjABTauO+kWeZmIcgNLsOAbjC6l1tSrA=; b=rfqWMl0zJjWra8vrhczPl6Ct89
	GjurpJw1Bl9guWLkJmGIYFs3ZEBqh+WLdInJUJPXYtb7zpGs/N897T4ZlIhtQCghbPWSVKAnoilCB
	XQw7YftpXlhl/dMc9gF839WtKwlBEOUwrpuKOCCRqWrEQyOcMdyPZgw1RiU/Ck0ptA4S66CPZVbv7
	mmXqwbYCrplkfHojb1ocDH2uO5SY8ycqf4NK6p3CpW9Oiko3PRclXwtPmWa29tJm5rNulXKJvS9WE
	kRob8yWdax3yGJmir/6dhmK7Zcw8YVyYi7hiR1KvbxnVHXBjm18G1wsDV2/jyL3iYeuupk68NBrIV
	+VPXZWrA==;
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7s3t-0000000BcmM-2H2J
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 08:36:03 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so6378975e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 01:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745483760; x=1746088560; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wyD1ibYwZZNQjABTauO+kWeZmIcgNLsOAbjC6l1tSrA=;
        b=T8KRrWY5SlzR/zup5EUGvfKMI2CFcnICLXxPx3XKjgv6+qLKGtUBg7HNLEftZGZjCT
         6AIFWjyfwKAld/rMtYUHguoOnkTwNXda5Ew1lTOd0Wwai3xPA506Dai34rXEEbwSp+CY
         KTIXW0Ez4ccS1jZBKjGHG/s41pTx6HZZN34aPY7wNy2KFtd2THUa5LGyT66/h8JkMRt0
         dug/fG+lIFo2/D+7RiMkkObEi7dN97bcGLexoL0wVJTSmB5esb26XayhIAlnJ68AQRpm
         D5XD+ZeT3gLIGc42DFiocODxb3KJ8cAYLUYEQaNkLPectpuWNfiMnp77F7x/mZ41VUOK
         DGeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745483760; x=1746088560;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wyD1ibYwZZNQjABTauO+kWeZmIcgNLsOAbjC6l1tSrA=;
        b=DoUjTMvnAQcedMLVdAQV3pH2pi9MxBik7fRvp7xt2AalXCpfnVJK8lOyhKneisXSd+
         fIU6gU1PAiobtjsH6wrc517xme1UoR4i7slVxCVsNgPuCTjcRqCZH7S+DrVearOnl3VX
         8CTffqS1KrcFfhz21Wk+nHgEI0N1Z2x5pqi+Tlu/Baxm5+xNebODkjv13zaANk9t/11h
         c5InwDGduCp6rJHfotqgyBOtfNnCU9wcyLrL7xHn8FSJR+tBprnwc4GMbUFjd4WZ1HoT
         yXJ4mv//YGWlWXZ5OAvPPjuPQwYvUxTJkP66W2kuyA4i9ZyHO61KLJEbNSzmYEmFyrt9
         6dqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhtMj8dYy+SFUejXGq7HhQ2dvW0mJHuoSOgGdp17xct0OVNpJlQ+M//LyHEp/y1Xx+4CGXQQHEy0XgiMjg04vO@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+wEX73iunYhoS4C+74bzfhZjPrf3nUE5WlwocFBIF0UmRs/Rx
	q3gw+tDq11UZHFdP69LsrZ9natECibOQ5YX7GIbrZlr4Ycxa1leCIZz/RL7FxV8=
X-Gm-Gg: ASbGncvJmjzkr8egvH0VD1FIFhCRWI3cHEKszRN+l7YrFE9n/6cnnZ8bpoM3tN+Wv/5
	kalJ3F/6X2WphyW1QIACbFxeBJwWmH1D9r1efKRfLyiQ8UtZmcz4CMhwV+GsA+sFljd2iOzhgp2
	WNSshC/mMpdoP5kUUnHett9k4EqLiKGe5BKZOPK3xf++pr7Mvwh+4Ls5bf6a3eCHcQYmqmHgY82
	FLAZObA6XS0I5DXkiYnfaVOcsCX7Tn3BLa5xm3EyHjn0EDV3hP+3wlEnXxCGjCQZSKt2Fu8Q3kV
	BMhFxWw60f0XBugy6zD0Lyo+1Wn8/7NqOkW4UncXYGrM
X-Google-Smtp-Source: AGHT+IH6QOMYk+VJrhRN0zGGVgIfy1D2k+1MN8UGZUw2MzoHJ3Lm78KvUsSoh9H7JaBXZAa1kpHpxw==
X-Received: by 2002:a05:600c:1d02:b0:43c:fbbf:7bf1 with SMTP id 5b1f17b1804b1-4409bdb032cmr18240795e9.30.1745483760212;
        Thu, 24 Apr 2025 01:36:00 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:6266:7750:57ce:7cb4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d54ee11sm1295376f8f.97.2025.04.24.01.35.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 01:35:59 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 24 Apr 2025 10:35:35 +0200
Subject: [PATCH 12/12] pinctrl: samsung: use new GPIO line value setter
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-gpiochip-set-rv-pinctrl-part2-v1-12-504f91120b99@linaro.org>
References: <20250424-gpiochip-set-rv-pinctrl-part2-v1-0-504f91120b99@linaro.org>
In-Reply-To: <20250424-gpiochip-set-rv-pinctrl-part2-v1-0-504f91120b99@linaro.org>
To: Basavaraj Natikar <Basavaraj.Natikar@amd.com>, 
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Chen-Yu Tsai <wens@csie.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Paul Cercueil <paul@crapouillou.net>, 
 Steen Hegelund <Steen.Hegelund@microchip.com>, 
 Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
 Ludovic Desroches <ludovic.desroches@microchip.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org, 
 linux-mips@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1963;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=eG2KW5x0cqyXDN96Y9D3KPo3rE0JJ5CGRPpl+iXxy5M=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoCffdVG5Ygxdkgp3G4S/J2z4z5Tlan+vD7V30h
 TZ7h0V/5sqJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAn33QAKCRARpy6gFHHX
 cjrUD/4wlY3EyRbxHX7pcMIAP/3DRyfsZNReCKH3ZrZK01gpg0foFUc8R9H0I7tpjEjSAcAY76v
 HT6Cav5kSBB36HXaJHFnbS5jDeLX1My/AARxYsg4hUeZMPsEdhdyug5NLPV4v9U5qGYyscWQJyQ
 IwWtL5S1/tZAIxzE73GS7fBnvaLvxdKHbO+ihsBKDN+CICZsABKHeqmX8HC/mpf/Pn3VZDLdxw/
 v370ttF11vBuDqxQFqucfxlUgG44NsRTH7slXcpLFqsmYFiyQ+60Kr8qtR4uG0wjgcD84YTAWTA
 jnMOBMJyWoX60aJoqOu+7ntHGuUA7AfUId1TflJw4qGZZhayvH7YZWSFpZChBh+R4GzP2lrJnH1
 /l3WSICXjyuCbO00KEg0M/ETEdHzDfqcXsC++m0uUp+XVVbx+NvevmZ076l6BhVpake9w8udGP+
 Y6lwhiWZ8sd+/nec1W16T+R/feEwjS3Uv+zzSP+uImKmEA6Rt/EFeZ0kppvf1XgXTXagAHYRfnq
 AX4Z1SXHpFfCHXYrPNMxv8w2uM1/eIljOwRAW3Xye5WYWe5bWWR/tmOB8O64R331D1+UTdeTv/x
 ZuaGKlVB7ySPckXnPWzWBP1UHZQiR7DAHXC2juTTX1w+v4NAGx137CcqLE/rrfEgbdhjBoA9iFy
 +HWM7daAr7IScLg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_093601_698000_2B85B77A 
X-CRM114-Status: GOOD (  13.71  )
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
 drivers/pinctrl/samsung/pinctrl-samsung.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
index ef557217e173..fe1ac82b9d79 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.c
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
@@ -570,15 +570,18 @@ static void samsung_gpio_set_value(struct gpio_chip *gc,
 }
 
 /* gpiolib gpio_set callback function */
-static void samsung_gpio_set(struct gpio_chip *gc, unsigned offset, int value)
+static int samsung_gpio_set(struct gpio_chip *gc, unsigned int offset,
+			    int value)
 {
 	struct samsung_pin_bank *bank = gpiochip_get_data(gc);
 	struct samsung_pinctrl_drv_data *drvdata = bank->drvdata;
 	unsigned long flags;
+	int ret;
 
-	if (clk_enable(drvdata->pclk)) {
+	ret = clk_enable(drvdata->pclk);
+	if (ret) {
 		dev_err(drvdata->dev, "failed to enable clock\n");
-		return;
+		return ret;
 	}
 
 	raw_spin_lock_irqsave(&bank->slock, flags);
@@ -586,6 +589,8 @@ static void samsung_gpio_set(struct gpio_chip *gc, unsigned offset, int value)
 	raw_spin_unlock_irqrestore(&bank->slock, flags);
 
 	clk_disable(drvdata->pclk);
+
+	return 0;
 }
 
 /* gpiolib gpio_get callback function */
@@ -1062,7 +1067,7 @@ static int samsung_gpio_set_config(struct gpio_chip *gc, unsigned int offset,
 static const struct gpio_chip samsung_gpiolib_chip = {
 	.request = gpiochip_generic_request,
 	.free = gpiochip_generic_free,
-	.set = samsung_gpio_set,
+	.set_rv = samsung_gpio_set,
 	.get = samsung_gpio_get,
 	.direction_input = samsung_gpio_direction_input,
 	.direction_output = samsung_gpio_direction_output,

-- 
2.45.2


