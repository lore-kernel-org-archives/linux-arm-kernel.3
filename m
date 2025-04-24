Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75886C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 08:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5mBwNaS+N09jQ7vb9rTgiq0CfSJO3DJXgU4YGfNreNo=; b=Jj/ymjMxQZpbpJFtRexGg335Sd
	2idkajLIyemIB3I4HIvtlDQC84jwyb3t1T7FqDKUUU41qrsta+HBc/chLyWSo5jeYaCE/VI7LzSkA
	iFpdYF7CGydeK20VwRWHgrGqZ4L4dM8NtwdGUybj3JKD88M16WvupoqxWcLYZHXefR6jaKeJ8wltd
	fC81p53skAZUC33qSh5DbRNgqBufi1VZN8CTtv9p+CmzMcw1mo3IAtE5FTdcY0ELigyZ2DXOPf/fw
	QIMlJZA3l96NduLh7rMt5XSd3WJVfOLjsDYyqUmWf7MOtxO/K5gU1PyVRF7p5HaaVUml9W1Tm9hqa
	hrzqiH0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7sEy-0000000DOjW-06iN;
	Thu, 24 Apr 2025 08:47:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7s3k-0000000DL9s-21ke
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Apr 2025 08:35:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=5mBwNaS+N09jQ7vb9rTgiq0CfSJO3DJXgU4YGfNreNo=; b=giGAXr84HzeqiB5Hg/YzGMeK48
	HrDP+xxUlmUFfUy+dNV7Z3Mjq6wzwZ6l1SXuqEb1D+ejf869HAHDSW3kw5d77Hpd5Dn3OodKlW6Xa
	algo8GE6f6EYEgmnc6vsSF1Ex+kVUQt7MLELq3ppVGb10UmgDrPsK2ayIO6L5Y335CAU6nxYREOaO
	MUI5WcIW17ONJ9iiZy+S1kVFqZaGFTztktugIxbKlFvuvK2XI3PxhK1ekeqrLb0nV8/msH8MfXNeg
	DYOtsax2iau3sH4vmrpWhHYbxOvkUdaLgwffTyEkgUka0ZBPOgnaX+5wnv/kJBKdMfB4Op6tgnO7M
	XBsgDa0Q==;
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7s3h-0000000Bchz-3Knc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 08:35:51 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-39ee682e0ddso423879f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 01:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745483747; x=1746088547; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5mBwNaS+N09jQ7vb9rTgiq0CfSJO3DJXgU4YGfNreNo=;
        b=y9TI+f7mEyns/HfjmSCuFDyBmUy6xSnIjwYs5zRx/hFzu2YIuX/58f6LdDM47wByOq
         OesX4Fhz4scOy7bnHdA5FBnJNRxezKl9lWeA3U7MnAe6m1TAZ+aBGEER4CFioTcbmUiZ
         6MS4JH0cJJKDB+C+3IL7RFYb2goPEDxi+vNk1RQ1Bxl1Uv2cWrwyQQrR8M9bBqn9OOTP
         bK1m1PwB56twRsFFglUMTTr3BgQlmIUZyc6nEvB0aIM5KTZKS4XElVvjiAGQPlv0BaoS
         TAPT5ES/XxTqh2nm0RaDtfUFip35cdBcSzfQmSubt67IyeZQdNj6OX2/IAfZCtphzf+I
         lxdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745483747; x=1746088547;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5mBwNaS+N09jQ7vb9rTgiq0CfSJO3DJXgU4YGfNreNo=;
        b=sRZOc3JTEVQnkbaVuX99siHKh7rtn4ZY7QUIkePLOS/CojoiMOPDDjnPxYBhgrg064
         fVM7X+N/g+OqIK2kfy6sdnKi4CQphzilDwaGyMxiNNLEWIJiBPlcEw8gO9jtfLB8JgAX
         N+NgrVU4M36lIzalszInKrdYh67rc8fFkxp2bPBZYbGjW48z5L/W6bNMh5aIsDzulp76
         CcH2iokamIpktG4A/sX0o92E5BnRabKLewvYdzokuRO/lgeyOUFyzXUHdXraiuhktJDc
         zyULqGHZFbPwJtZTFfDSC+cInLYcesSXU8Hzj9lr9wVZVJss+omCewQHWAP6aO7dKIWK
         aZHw==
X-Forwarded-Encrypted: i=1; AJvYcCWmFe5dNWxn7n/h2I/ZisjxTsVSwwht5vH4uEJo4KZWJGds440ASIvnPhknsAU4dqp75ngjlYuu0576Dmij0+51@lists.infradead.org
X-Gm-Message-State: AOJu0YyeyG7WwwMnVaw66435j/VCtvaAB1taaJnfhBgm9raLDxrgWLVh
	lPr1c3wEnoSzl6DnfTMzCNskjeiYFUiOqhHfLcCM0S2fA9a+ur0VKQHnOfZUW/o=
X-Gm-Gg: ASbGncuqi62qlkhSXj8j07cVRS1zkFdJF2temDGOfAarPGsw/zf5SZpGg+9yFyBmNAl
	cm5qiG1q8P4ZKJbeiWH46l11R4GVQdQsGi/+0EY4mjx1PW64WU867iFzIgTu1SARVYOcfITcrbx
	XVF9zrUB+gz/uz4NNH5c2r/iWsDoHAI/J7ZgTn+qZbf1JgzqWIuFyVGvn7yZi64a40hGUUVcoA7
	KHsoiE8/2ZPQjX77PMXyWvawy/cAU5+5X1EjKG0887gYausB4Pgn+RHvui0aIpqBxSlHTkkh5eH
	XOO8EJjGpGMuuEsDHWcjMUvtn0VuVclpQQ==
X-Google-Smtp-Source: AGHT+IFa84choTa1mcCVuQGvjjgEmdRH9HlvyIG+7lrhNevStMTJlm/OytKRYpi+e4zX9vxoz/GHOQ==
X-Received: by 2002:a05:6000:40de:b0:391:9b2:f48d with SMTP id ffacd0b85a97d-3a06cf62a28mr1355792f8f.33.1745483747375;
        Thu, 24 Apr 2025 01:35:47 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:6266:7750:57ce:7cb4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d54ee11sm1295376f8f.97.2025.04.24.01.35.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 01:35:47 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 24 Apr 2025 10:35:26 +0200
Subject: [PATCH 03/12] pinctrl: stmfx: use new GPIO line value setter
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-gpiochip-set-rv-pinctrl-part2-v1-3-504f91120b99@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2157;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=goHZgmT9yJTYnSgX1qwQQpFML/4BhFXlFKBeDD9aKZQ=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoCffbdnAxPhaJKaJSps/EzFiEC45gufsQ1Alt4
 qq09XNXIk+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAn32wAKCRARpy6gFHHX
 cpC1EACk2t+HP6KYD9aJArx7fiGflDxgI1WbKJ6Fu14huQEvp7PuA5rPYehuFCH1Gk1QDZiNYCb
 hIqrsmivpsIMWt+466di/ih3PbJOoGk4rjDVWe2Qf0sqY2SSyk0oYMixfztP1SI70MxCaZAZCLG
 n7XU0j057krrx++3YTvqGY/wnGgasSZa+2xJrVPjtXCUskF7RzNG9UwabQwmLqR8bDl5s4OhV3F
 3tRo+1yN0XGFQ8j6AaSdu6FNQb6oINHNc51H1E7lINc6F8spGhgrPT5nm19hEt9+dv1AbIdyz30
 ttnBRghwa8jedtnbv7JtAgxm+xLqAUP1sRY9LmzRwIyiLPRA4stunNuD6uwOACJ+/vpVNT+h4C9
 kyZR3CgLau/uY40HKqBG8k83ViWJUOjusAidOeRoRBpxFSIXmMS9lP5jvdCW4mAmJoriymxiqrw
 a2APMc8TgoRAfpGJrXESk3Aj7DtBi2C0zeGD3qy9AVg65EJGerWP4D3+k37dDmU0qg/mw/ko3hh
 UTJ5C5+MiWj3lpqSlJrjKy2i+M0aq/dhVoeVdOG14BHS5bxsGyvl4D9LXYKos209SoLTEAWYVNR
 uYrXEShrPRGrtwapj/uZelp+xH24b9FTbitop+uLfFc4Si5GX8BfmJMnx7Wa24U0daHwd82lz8D
 KvP3120WxRcM19A==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_093549_986638_28274C90 
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
 drivers/pinctrl/pinctrl-stmfx.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-stmfx.c b/drivers/pinctrl/pinctrl-stmfx.c
index aae01120dc52..f4fdcaa043e6 100644
--- a/drivers/pinctrl/pinctrl-stmfx.c
+++ b/drivers/pinctrl/pinctrl-stmfx.c
@@ -115,14 +115,14 @@ static int stmfx_gpio_get(struct gpio_chip *gc, unsigned int offset)
 	return ret ? ret : !!(value & mask);
 }
 
-static void stmfx_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
+static int stmfx_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
 {
 	struct stmfx_pinctrl *pctl = gpiochip_get_data(gc);
 	u32 reg = value ? STMFX_REG_GPO_SET : STMFX_REG_GPO_CLR;
 	u32 mask = get_mask(offset);
 
-	regmap_write_bits(pctl->stmfx->map, reg + get_reg(offset),
-			  mask, mask);
+	return regmap_write_bits(pctl->stmfx->map, reg + get_reg(offset),
+				 mask, mask);
 }
 
 static int stmfx_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
@@ -161,8 +161,11 @@ static int stmfx_gpio_direction_output(struct gpio_chip *gc,
 	struct stmfx_pinctrl *pctl = gpiochip_get_data(gc);
 	u32 reg = STMFX_REG_GPIO_DIR + get_reg(offset);
 	u32 mask = get_mask(offset);
+	int ret;
 
-	stmfx_gpio_set(gc, offset, value);
+	ret = stmfx_gpio_set(gc, offset, value);
+	if (ret)
+		return ret;
 
 	return regmap_write_bits(pctl->stmfx->map, reg, mask, mask);
 }
@@ -694,7 +697,7 @@ static int stmfx_pinctrl_probe(struct platform_device *pdev)
 	pctl->gpio_chip.direction_input = stmfx_gpio_direction_input;
 	pctl->gpio_chip.direction_output = stmfx_gpio_direction_output;
 	pctl->gpio_chip.get = stmfx_gpio_get;
-	pctl->gpio_chip.set = stmfx_gpio_set;
+	pctl->gpio_chip.set_rv = stmfx_gpio_set;
 	pctl->gpio_chip.set_config = gpiochip_generic_config;
 	pctl->gpio_chip.base = -1;
 	pctl->gpio_chip.ngpio = pctl->pctl_desc.npins;

-- 
2.45.2


