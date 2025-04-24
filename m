Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7226C369D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 11:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n7xB0NSx1H7vCCe+l6ESBPVP9pl7qaey136eLZ31dwo=; b=OKldLphql6wsaz36NLw5esH8At
	x1bL87WGwhTO75gvZfbO4Q//n8InqM/x+Xm8LrSGLar6wyDjM9QgNyaV+iWKCImVT3xaRnki/E8jF
	NOgUXk0ft7hpDQu9A+c0cYyB+mgGxp/lRJn+fG7uZSJE/zqM2lI49ApurIN0q7DyBvfvoU5hQayiK
	Vm9QFuWele4YXLia1QvYer5wQSrS5O2j0ztuDBlLuv749kbipxqAE6aiydgZ+9XwE2fpRos0/8/uW
	nqSXirsf0rcStkmu169XWDQhmClodaOQXeKX7Kixh0feb+CXvSXlSH42UV72NMaiGqa8R+Zn223fg
	322TzJRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7uQI-0000000DnaR-3m04;
	Thu, 24 Apr 2025 11:07:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7s3j-0000000DL99-0nYM
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Apr 2025 08:35:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=n7xB0NSx1H7vCCe+l6ESBPVP9pl7qaey136eLZ31dwo=; b=QsixSCC8PVMWHTrSRsY1fACE+P
	EpJTKLfyQbfTW+r15/vEmFX1An0kynDc+VZPuHR9enPL040QeYfUbJ3O06a+kzw7mSnQVBydh2BI8
	YkZKJmXpi2+hQUzX0n8jR9EoNXbIx0WmdJ5K5pj79dfCompffAYeh924rguE/QvUpR4GQuj3xcBr+
	uc5r19u5cpSZaAhqumY3mx55Ahdq62LiCbtW+clw+RWxeMH48tXgxdWFyhsuYnfkdLKYu4N82K1+G
	K1uUA23WV/xPzNQOb7Y5ChyG6A6S0lNIJyEdXfslS0tX79yhPn6LdS84L78Nc4rdqYh+cM+Gy9412
	puztaIFA==;
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7s3g-0000000BchN-1mgw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 08:35:50 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3914aba1ce4so504197f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 01:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745483746; x=1746088546; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n7xB0NSx1H7vCCe+l6ESBPVP9pl7qaey136eLZ31dwo=;
        b=ej9dMgdQBRnzpH58Zz4wymYaIesDKo6xS2i9AghWBJPczFG6dPgRqCxr6JtsBqf8VH
         gIoU3MULrJDCVHPgpFj0CJVTiGEpEudgU/a+HZQwRL83fKXGpi3wK8mjLVKY/m4uFX2m
         S1pLCt68H5JwK+If2BD4pLj4ksLtSyopDKUT5gCt2FLxd4bI1z97nyJ2nDDmDsonta2c
         inTTWroSIit6tu8eziFXkzP8oddr3fTiXtdBLUER83LVBvxrwgS0MabhAHEVKXWBwoqT
         DN3G2Z0R4PdYIGRl3aLFKLfG+r/Sbyg9Sz6vvG3UoCQ3Tv0XAKse+YW4BQWgRbv4MIO8
         puIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745483746; x=1746088546;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n7xB0NSx1H7vCCe+l6ESBPVP9pl7qaey136eLZ31dwo=;
        b=nsEos4VpkF3qCr4oIsajTWEkqrGMy2+a19MC4xUQ7RH1GbX/1D092zv+gLFwoM2P0d
         7QmeI9z/bYT2vhOTQfD2rWesACgtyPZTMrYlEL1MUhmZOwQEtTG0nNM9DpG4dJkwjcij
         XS5+afUbauGxc8Ply4dn37RwTKP/1d1INS/AN9xg4mW/eqXWTiW1W43+ZGdW3KS9Op5R
         qE+q+kxlCUDfUZYqheHVOLgxww5I7Ix397wTwsC2R3FNmYL/1zlK6RSsK+Fl9M8YHMcD
         PjRNLKyO4pr9nPWiZd8nKTJdpLZjCqZ6ZFf0MCSIlhi+ltZEEtZT2IcuIsHeJqlvceWI
         xGng==
X-Forwarded-Encrypted: i=1; AJvYcCVSQYpomqzs853JbHTSG9Y0lDWTd4aT3XQOdje2WIy0j8rEALTh9IvO129CGDVTwXh50uZKE85PJkydeJGDseV7@lists.infradead.org
X-Gm-Message-State: AOJu0YxBfQNE0X5/S0TqgJAmjhz6lFA8vrmvfcZkNs/iWWDk/8NnbhMF
	bwAxFV3lJqlIzBn2wZrLOFe0KLUuS5JVKOCe6g/x/pzMh2SqHHhBo62u6a8X7pY=
X-Gm-Gg: ASbGncsKEkcgIdayQoU2REWtfpebcMixxUU5/0LCUbkw6bdauu57+Jq/ioS+Z7tmt7J
	Rpbv/b18myJjwmSFUxEKEFwgkh+IHi4wA8c7xY7zy/SLhgaQ7ydZaVPJ1ONo6hH+xHq3uZilzBk
	weBl1xBenezdjpLCf3P2DeOsAS2NGTwPi2NiXBJU71XL/VT4HFfLg1Vv00mzi5mW8o9/DkvCcxX
	ev+03FpuumNFxwj36Az7bf4PjP2DpP6oDe+SOcj1CpQACjRHrX+pHUYRU6IoHeITB15I057wwEA
	q3FfSuGttEt8sWdKu1DJrdYtkpbW+HBupSGVH7/qZnhf
X-Google-Smtp-Source: AGHT+IFSD6M5XIauG5i+d/G86hFhT7OFRGq6PzYxSsoMAu4S54uAZ/T5Wwmoogoet09ubvq4IMvYRA==
X-Received: by 2002:a05:6000:40d9:b0:39c:1257:ccb0 with SMTP id ffacd0b85a97d-3a06cfc5660mr1453719f8f.59.1745483746115;
        Thu, 24 Apr 2025 01:35:46 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:6266:7750:57ce:7cb4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d54ee11sm1295376f8f.97.2025.04.24.01.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 01:35:45 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 24 Apr 2025 10:35:25 +0200
Subject: [PATCH 02/12] pinctrl: axp209: use new GPIO line value setter
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-gpiochip-set-rv-pinctrl-part2-v1-2-504f91120b99@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2498;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=MgZVjd8Gr19iJhQk6NvM15O47jgqGqaBw/RcQkb1G5I=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoCffbYYgK3T3LpUSxYaTlg1RQUUtOaeq8+GZ/u
 B4TY1aYiK6JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAn32wAKCRARpy6gFHHX
 cvwwD/40PM8MvPIIjKYdoBuWnigqXm5J9mOEAwo0IpSBLk+1NrZtxCDfCUtfG8qnkKxEdr1VqG4
 6mrNRSEHCZifkUpZsd9j1/qqvkSUckanWm+w39DVs4zsSka65n9Bs7dnA1+SGrLrp+/n9+P9MtA
 lM34+iNO1T+9KusL6PqVvKAu6DGfaqw0bjecp2sfpta2zPtHwxq5lXFxGkHaVkPW3j242bQVJMo
 OxU8NDepqb+WL0fZbMQ5rqRKhws/pmHzh0pc5fdiELlPOWlqNBOETuyxmgi82zYE16/chG6xgPg
 216JJsncREoy4zCWFVBbrBbv9L02v3bDLnPh1zhIKESQaoINtG8bkwtev6qRPVd+uStU/2JCH1h
 f/3D4RxLWdmhByFfRbHoUjmxn3VBuJUSKbeUzyaGHvZVssXog9TpvfZNQRiD8Nkuywe92KjurAL
 x4uNTJbbQg2fqiGNI/E4uyxLmL6I36TMhM4sdLblDwJOg+3+tre10Bw+4Q4tLTdpFA8bKBEGGIy
 Dt7XbALdrhuOWIk+0uCG26vCYBKMQ1+0mx1U0lFdEYq41NBloLCpS8vfdFqZJHUAvS1fmmQxdhM
 YEp5REgnyY8mU7MnN+hxKUIp8gS/se+notLxKNO4OGMY/MQYx0CS6yrgP/3P85WACR2SXZyoMLs
 4yNJiAOsNG12c6A==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_093548_610245_DC541F7E 
X-CRM114-Status: GOOD (  13.30  )
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
 drivers/pinctrl/pinctrl-axp209.c | 29 +++++++++++++----------------
 1 file changed, 13 insertions(+), 16 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-axp209.c b/drivers/pinctrl/pinctrl-axp209.c
index 2b4805e74eed..28ff846d263a 100644
--- a/drivers/pinctrl/pinctrl-axp209.c
+++ b/drivers/pinctrl/pinctrl-axp209.c
@@ -192,34 +192,31 @@ static int axp20x_gpio_get_direction(struct gpio_chip *chip,
 static int axp20x_gpio_output(struct gpio_chip *chip, unsigned int offset,
 			      int value)
 {
-	chip->set(chip, offset, value);
-
-	return 0;
+	return chip->set_rv(chip, offset, value);
 }
 
-static void axp20x_gpio_set(struct gpio_chip *chip, unsigned int offset,
-			    int value)
+static int axp20x_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			   int value)
 {
 	struct axp20x_pctl *pctl = gpiochip_get_data(chip);
 	int reg;
 
 	/* AXP209 has GPIO3 status sharing the settings register */
 	if (offset == 3) {
-		regmap_update_bits(pctl->regmap, AXP20X_GPIO3_CTRL,
-				   AXP20X_GPIO3_FUNCTIONS,
-				   value ? AXP20X_GPIO3_FUNCTION_OUT_HIGH :
-				   AXP20X_GPIO3_FUNCTION_OUT_LOW);
-		return;
+		return regmap_update_bits(pctl->regmap, AXP20X_GPIO3_CTRL,
+					  AXP20X_GPIO3_FUNCTIONS,
+					  value ?
+						AXP20X_GPIO3_FUNCTION_OUT_HIGH :
+						AXP20X_GPIO3_FUNCTION_OUT_LOW);
 	}
 
 	reg = axp20x_gpio_get_reg(offset);
 	if (reg < 0)
-		return;
+		return reg;
 
-	regmap_update_bits(pctl->regmap, reg,
-			   AXP20X_GPIO_FUNCTIONS,
-			   value ? AXP20X_GPIO_FUNCTION_OUT_HIGH :
-			   AXP20X_GPIO_FUNCTION_OUT_LOW);
+	return regmap_update_bits(pctl->regmap, reg, AXP20X_GPIO_FUNCTIONS,
+				  value ? AXP20X_GPIO_FUNCTION_OUT_HIGH :
+					  AXP20X_GPIO_FUNCTION_OUT_LOW);
 }
 
 static int axp20x_pmx_set(struct pinctrl_dev *pctldev, unsigned int offset,
@@ -468,7 +465,7 @@ static int axp20x_pctl_probe(struct platform_device *pdev)
 	pctl->chip.owner		= THIS_MODULE;
 	pctl->chip.get			= axp20x_gpio_get;
 	pctl->chip.get_direction	= axp20x_gpio_get_direction;
-	pctl->chip.set			= axp20x_gpio_set;
+	pctl->chip.set_rv		= axp20x_gpio_set;
 	pctl->chip.direction_input	= pinctrl_gpio_direction_input;
 	pctl->chip.direction_output	= axp20x_gpio_output;
 

-- 
2.45.2


