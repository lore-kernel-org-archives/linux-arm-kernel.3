Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22BD8C369D8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 11:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e1nhd4aLppAWi4+bVzlCUpCnUz+WYC5fdznaksvHJEk=; b=Zq3jBituS7TbbsH0z3T27XlI0B
	6WSabRLU59KlkiU3l1QDPhEUnujEv639cCx2uuqVFOQNsQqmv40OTM1YJKTgdvv/7md2Mg2gSeTy4
	prTDU1XA3zFvFpx4V/Z4IBC9vQRn6BHFM8OowpJ31dGHv4l9aUmjwq1m5QSv6/4S27PElXTxkTPHi
	XKbBjZV7CfMGwJ4gmEPCHehZwqDvXxpqT8YCm0BXxiwJ35EhhwJXWL6SMHVSLrQk98K7gi07jtBiW
	1S2/APbvSKZSda8AuIbTgG4/06p4IW6U82bfEM/u0Sd+LiBFWCAqGdgrUNxcJaL3wldMpsoRb1wXT
	BEspQQiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7uQJ-0000000Dnas-2Yyu;
	Thu, 24 Apr 2025 11:07:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7s3m-0000000DLAR-0nEg
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Apr 2025 08:35:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=e1nhd4aLppAWi4+bVzlCUpCnUz+WYC5fdznaksvHJEk=; b=Ph7OBd9xGpJnaqb1pr28tpo9Sm
	leESDMeXZO/ZlIC32aN0qJiYwKZpi4HkKEHR4AjNaBeA48LkNgUo3AMnqKY9u1FuV5+QtDXX3pGdA
	WCETXkx20UPRAxLmP+p6lsb+t3mKIZMTjSrfykvB6Xa347kv3n1DZf1Xdf0Z9PNMQb2IMLFp7wWse
	nL5fIq0+ThZHTvJzhVtXLiY9dzjCOgVnoCswvtQ4ATjIChw9Tv+jH9wf/B2xhLjir+9ij/EGk01wQ
	h5hJaJKSJ3e2C7Nf1oqKr6zjLoe2h9tbE7pKYY2rT73GfBbyb808HARiMNnRL6MAnStU7XYEeJA6v
	37/rob+Q==;
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7s3i-0000000BciY-3jGF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 08:35:53 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-39c14016868so658690f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 01:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745483749; x=1746088549; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e1nhd4aLppAWi4+bVzlCUpCnUz+WYC5fdznaksvHJEk=;
        b=iW4CqRaskGlR/dnILY2+M/2T+bk3Zyi0hjRJlSIl83qGjdlBb+dRF1TdJ/csUJKo1J
         UtMiojYnzGbjh+C/TG0guYol3lH74rM0Flsu+uZa7a+wzjA90kFE01BmpP6spaygWAz2
         OQH2kYm5fQhPkTQEA2UEc8GnbS3Y6HOTevGsYOtezqenqWjcVWpF6E+27D/cH4rW9Jm4
         HvhHuos0jRaludQ0M5n5r5S60a30E4A4kmPr/fpSuANPg9wlhY9vfbqtON8i+cJQIZPf
         Gu21CpALXYoRRZD8OjFk7oHsMHCZ7zFTIIl0/c6gK17ypnwerDY/QOScgdLrS9zT1wTE
         bidA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745483749; x=1746088549;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e1nhd4aLppAWi4+bVzlCUpCnUz+WYC5fdznaksvHJEk=;
        b=Vhip/3Ju+e9s04eePcnJH/z7l+NcIb8ewU2KQn5vZlY9pNd5MCCwbA61W0rKH5CAQG
         ecVHCC19QkBSlIIMwS3ZrLKV/5a6QHOnReJdkqqMw28zTynwxmsfIGAvrnBmtxqXu6Pl
         Tl/Yq91RpwfsWTIh0U23JQJGHaxfVu7/EIN7efOnsjhYlI5DLnjji+JHZneFvsVKnpJ1
         mCLmR9zC9PpCsrqjaQQM42mGvx3nNm6I7HCEFH4yHTixnrv80X7y9mxIOvAlwzs5uBrn
         9ABO4kWHCcYaaYq2cAK3wHjh7cQ92raRi7nCSb0JQFumvyAx+zNvaWfnrSvA0amLLiEX
         a6Jg==
X-Forwarded-Encrypted: i=1; AJvYcCUVARrREGU8kJmiB7B3LAUzxvwp0CxXxJTmAV8noCsd84bGQuu27nCBgf2m7+k2NLkitOLOGnPNGTmgalFChBxG@lists.infradead.org
X-Gm-Message-State: AOJu0YzRKaynBMtEOUudVMp3h+F4i2ZFnoRUZw2ag55+q5nYrI8QzAki
	vUO3aEPyEWc0eGPLveUaWhRXjFk6EWeu1AjSm/0KchxSdLhGQyyh8t8r146y8x0=
X-Gm-Gg: ASbGncv7QXi3wV3De8rk08I1pYfD5nK90LI8CC8vY9AGnGewEmoXEVZ+3KZXDptXlA6
	/qKSR+c3y2odJk7GiwFKwYMws0PZdSz8FybtGPglrINxs+qm+tl1ApKeEGWJ2c2jvVKhCN0zPSl
	CWui8YcQYuN+5kv9mP3PIIjlk/uEqr3cyCxMKJJBMSaOXLFd4bwvheZtU4DeErSPH4JL95Fd3dO
	mpTBUxwfKq3paxVQxVE/FMtqAqQJtRnES6+tOazoWblcIaJwLAl/8K+d5q+q6g0msNAx0k6wl9l
	uIXjOHifKHKeUBr8X9tPMwHw4E3fLHTd/w==
X-Google-Smtp-Source: AGHT+IFrT2ryKEI3Ak4fYWyfabnfpp9zOPWj4dcFDB84T+QE4vp8znh03ePvPXvInmYkhFQ+6kA3Rg==
X-Received: by 2002:a5d:64a4:0:b0:39c:12f2:2f86 with SMTP id ffacd0b85a97d-3a06cf4ebe9mr1139766f8f.8.1745483748680;
        Thu, 24 Apr 2025 01:35:48 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:6266:7750:57ce:7cb4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d54ee11sm1295376f8f.97.2025.04.24.01.35.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 01:35:48 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 24 Apr 2025 10:35:27 +0200
Subject: [PATCH 04/12] pinctrl: owl: use new GPIO line value setter
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-gpiochip-set-rv-pinctrl-part2-v1-4-504f91120b99@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1877;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=ksmfNK84GDabb7cwbZBiry3j0gjxGVa4nXCuGXvLQ78=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoCffbDmQjLh72fMV3yjWxABGClwjTKpZiO6lYE
 y+xV5eR9zyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAn32wAKCRARpy6gFHHX
 ck42D/9i5222ivEDPuYJfJramTA21Dz/Si68PgQJKw8MP+/dYK04nS1HRUrhy2s/f5d8l3IQEyk
 SUw/nOJGPKcElQSgK5wfrcMdUf7QTLJdRhNCw8QSOsu8zgxG8mnO+kDL73zSCj6UrZYmSzbhsQr
 pLOonJY5NYn594guZmHYpKLwBRDzKanJB7jvdjlw0gfszSTVxk/hzhG8hUUCM/bfQZHPvJyefFV
 FQWRoGvs+4NzTr9vn6xCSUlbAFUGj2Hw/cBz3FfnpjjVnJobvJq6q524MdE7u0OO8X036gIDGan
 xzcN7fRgoRrCbXwXa+LdihYAqRJf6pbYHO06I8Vwr5qdHcoqzVxfF9LmTzJNsfRDxxLrCM6cT1b
 FntYtKNgMc1nEQbTRPPydtniG4qQtDZFcqj4J987kdEUq13zTzmnlHQwWOdxPYYR9VZ2THuI9Ko
 MI8jq3GiGSDkzR4kaJE3UKV+F5xJUGt3WHBDLWuJdOXqyQhfPQCIia6p964VATg0i0vjN5SlAY0
 Qc9XtlyHZLnVy4JPaB5SFmuulMcufAUongkqc0xwxfysH14nptwQOJE3fGE8gSpOgw/sMxJA59O
 47YrddaVzPY6+L7+huekZiruLx/0uoSG7JOMh5rxj8TEAQoIYDan1o14/46KQbYbsl45o04l1dT
 liTVfyVG+QGKJ9w==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_093551_241329_B4310CE3 
X-CRM114-Status: GOOD (  12.93  )
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
 drivers/pinctrl/actions/pinctrl-owl.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/actions/pinctrl-owl.c b/drivers/pinctrl/actions/pinctrl-owl.c
index d49b77dcfcff..86f3d5c69e36 100644
--- a/drivers/pinctrl/actions/pinctrl-owl.c
+++ b/drivers/pinctrl/actions/pinctrl-owl.c
@@ -598,7 +598,7 @@ static int owl_gpio_get(struct gpio_chip *chip, unsigned int offset)
 	return !!(val & BIT(offset));
 }
 
-static void owl_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
+static int owl_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	struct owl_pinctrl *pctrl = gpiochip_get_data(chip);
 	const struct owl_gpio_port *port;
@@ -607,13 +607,15 @@ static void owl_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
 
 	port = owl_gpio_get_port(pctrl, &offset);
 	if (WARN_ON(port == NULL))
-		return;
+		return -ENODEV;
 
 	gpio_base = pctrl->base + port->offset;
 
 	raw_spin_lock_irqsave(&pctrl->lock, flags);
 	owl_gpio_update_reg(gpio_base + port->dat, offset, value);
 	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
+
+	return 0;
 }
 
 static int owl_gpio_direction_input(struct gpio_chip *chip, unsigned int offset)
@@ -960,7 +962,7 @@ int owl_pinctrl_probe(struct platform_device *pdev,
 	pctrl->chip.direction_input  = owl_gpio_direction_input;
 	pctrl->chip.direction_output = owl_gpio_direction_output;
 	pctrl->chip.get = owl_gpio_get;
-	pctrl->chip.set = owl_gpio_set;
+	pctrl->chip.set_rv = owl_gpio_set;
 	pctrl->chip.request = owl_gpio_request;
 	pctrl->chip.free = owl_gpio_free;
 

-- 
2.45.2


