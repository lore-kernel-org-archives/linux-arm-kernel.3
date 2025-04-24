Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D09BC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 09:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XaHaIgMkQszg4+Vg0zXH3vzF1A/P6OHY+YrBjGQv360=; b=EjfjuLv3cFasE4wm90wzPiQ8U0
	rXAWRyprX1nwACUduC96Po4pAREHwfhxEfsW/z56gplG6SXSBME8/Q/f5EJErrxJrQdrCuj/AoBxq
	SzzuNvK7Xjgw/3jc1ZKFco5anqsek7QXTK+uRiW070GPycrgFQBTrc3uQDgVIMA7OWGcy8ljVVlIY
	p527hOGZjpYeip7vRxyOLZpafz4i3RUA64ByWLV4J9YrZZdhv35Jm6XfOyvT8EwpQ68fneZibD6OK
	W3rK1HRVRGT2D1StgsDal2b8pYjgtpzBswMGNrGwvrqjHZ9XEoo0t+0UzTCoe68Y80K/3gH6+bwiP
	RqGaF5QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7sUj-0000000DRYn-3P5C;
	Thu, 24 Apr 2025 09:03:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7s3t-0000000DLD4-19zX
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Apr 2025 08:36:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=XaHaIgMkQszg4+Vg0zXH3vzF1A/P6OHY+YrBjGQv360=; b=V41k58y6YzH08phn3bsDo8fzlr
	aS1LphnNH6SK7siCGbzOUhUR7pYoeaxogI2HvEHiHVoHDiqzOaIeESe2diAA8OI0DI15lSNL+MjC9
	fFhKej751TQsZSikZ4qQm15dUjRQ8EwjqvtbHhHalo/j4lbYPj0eckl5iCFbjWdtk4xkzb/Ln6k0C
	OUcUYXLaQWxeq7u3DfRhRs7xP1h0SxQ1JWq8mJ07qhd7jiPLRIXeSCQqBu7F63/MjygV26Hm4w8ry
	qX+NojvChj2Zm+T/o9Kn7yGzMpsqKzp9YGReL8XECblMJeQJvx5UA79FCcX012cPewTX364VBbRh3
	cXmSGBxw==;
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7s3q-0000000Bclt-379p
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 08:36:00 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-39d83782ef6so1343041f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 01:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745483757; x=1746088557; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XaHaIgMkQszg4+Vg0zXH3vzF1A/P6OHY+YrBjGQv360=;
        b=d3v1QkfKy2F0TiimKKCkm8gAkhdySsDHQbyuW4EqC4i024jPtYxPyNusiGPq5+vLJ6
         Q2dQO9lntsng7nv7N6lU9hII2SE+TxBIrBxMxvI0bKZH2+GgNVDDpeXSYX0riMF4A4LZ
         re04lKoK4dgCEBq2GoCnCrSWNuYjFqFLLBIOxO+h18pF3KEGTo5ROAGvC8+zSrTk3vpo
         f+apwuctzbP1DWtpApYbTS3d5BjbEof3iQDj5yYQYeM9uM5xL6qpWFEJs4oOpkT+jsTv
         qXt9N8g8WCJzOtd7lddkoHvrxVncrj2Mc8I7UCKIR0ivGW4MqUYFXXSy7VN+FAJq1C97
         ckNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745483757; x=1746088557;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XaHaIgMkQszg4+Vg0zXH3vzF1A/P6OHY+YrBjGQv360=;
        b=e80DFm8XZeVHgZptA+282HtIBmemuzWvFcj5VdBbv8BIAJ9GWxrh65ZdxeqLlTm1iz
         6VIy8oQyS2sYsh89PC3ZIhkHLDS9hDQejjtBAL/PeuhJDykAD25dMp2m4T8j2t4n0u6M
         le5ha0nFGbWYkvvqd6SfJJB8SD7S8uVWGew6bts21Y0M5+bDghk1BHi3u3bGhHz7i3eL
         3TM/5kmNvK46CC2JI0wJv6xa54oQ7Ze/MwYJVdUxjCRhxUo4Ki+CgvOWvajqNa2TkU/M
         vy3aiyH1j2tgclMIOo9KCrhgkqJhp4DonfmMLXk02Cr2gIettsJ38jRTypEdzOCgPAJk
         aw2g==
X-Forwarded-Encrypted: i=1; AJvYcCU4DHoQQmZonCpijI3+Ng25KCqrzcZpSDMcwpZ27PoE3TCJMLuHLCbhZc+zizxqgufDIwSGQJOcMrSKWh/EmHUM@lists.infradead.org
X-Gm-Message-State: AOJu0YweyFX1Av5HTMI6ryJvBJwzbILPen1QfNXr9Q5ytMgomc2Z7rw0
	+78rjLuCWp2/dniJEMWpL5DMJe9Ec+Sb3rTlR4yjPaaDfkKyzJn1VHDZFL1OsckyGIiMaC0HQdl
	BKSw=
X-Gm-Gg: ASbGncsibxP2FLuvuol0aIPr5iyz9XLELFQurpQTtPuTzBh53zF+oRmb3ZUsrCVpBJn
	7K90XJlZymJNlLUikGR+D1rRFIrprL1nrl3p03RuRuSfmJqdLDdcWB8/QrlrHp6ogzhNGXHTC0A
	SKAPrbSiju7Pq5wR+tqrnEnmL1aKfDGiFPoNZ3LoSz6I/zEUmck8C1cu0vYsGtT30SvaPPJWCnk
	9dzPni2tpomC1ZtWKyIHL3cLTPL1HgC0+WL9nP7w7pgGGdNZEf5YJjZhjgZY9AEeMJZLSSiAg5F
	oXpI/zQPo08MBlx/zjIkAE88h2o3TH9Lxg==
X-Google-Smtp-Source: AGHT+IENaOXvdDwYvVzyNmm1O+wEFBO9qUA8eUmPoY2h2uvx0EEvGioW8nnYHrKcqYKrpStPrZphsQ==
X-Received: by 2002:a5d:5f45:0:b0:391:b93:c971 with SMTP id ffacd0b85a97d-3a06d6ccbf1mr1169019f8f.20.1745483757511;
        Thu, 24 Apr 2025 01:35:57 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:6266:7750:57ce:7cb4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d54ee11sm1295376f8f.97.2025.04.24.01.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 01:35:57 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 24 Apr 2025 10:35:33 +0200
Subject: [PATCH 10/12] pinctrl: armada-37xx: use new GPIO line value setter
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-gpiochip-set-rv-pinctrl-part2-v1-10-504f91120b99@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2277;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=W0QsCqlj8k41jahpfTRdRwpb75wjwAEccTgd/iB3NSg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoCffdShQB6dZ7am+8Zlg1v1xnScSWHPJ4AYGjK
 IuNEJ72zDqJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAn33QAKCRARpy6gFHHX
 cuhZEADgECrorArfyzL2QuJa6yQe9bYHLOnsa/SLqp+XLhf+MogYfB88ZBg52BGEy/260WhH3Ar
 TlDxqbNf7xbsDCEMp1QlhFb4S9VgmBKrttwkTGhgoD+3LRdby7tIt4OwKO0GaTXYE3EygwT/Iq4
 hrU6Se3dlBrraDvvMiQVItwNzzCJ5SvOHi8lE1jFQth6AVN9W6GZd7je8AWawFv9Wg+i96C71/A
 LL6g8qzLyWM1U7sLiXvQrnWtJb8cpWGNMce6jMz26KrCpwkGpSbuzMq3e2dUk1tv1p+UY0MPwi/
 vfA73gllbSX9IPwu2Av/fHUnl4unuBzzo0wEISM+lyZ8KnlWAqlrdIlHQErUpPBID7F5cyZvpih
 1BvJFjIXMf9xEMQTYWcV4ACfgEUhp6bG2VvvMX4L2/j/ZocIsseaEAYNaPIG+I0ZtApOV5Ne6+U
 5E3cMbN5dXT7ekyY/sIH2McA4ysuJK0KPhIYnYQTPu3McsIx5MqljY49PQMhiw+qVV+O4EfYUat
 IOA3xFTiPvKuoi5huSr1QFG7EpE85vSMix6o50VA4BcT/jlgxeoo7ufpgZmYtUTnM8aPSLgVucZ
 ReV5VoN8II+I+BwyBlmEBfbL8iiEwXA0A/4funmEKDVAplmX/KfHafRvfXnO/2PdS7n7YpqLW0L
 IeczklCyXpDVPJg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_093558_872755_6FD0A041 
X-CRM114-Status: GOOD (  13.44  )
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
 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
index 335744ac8310..18419920c33d 100644
--- a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
+++ b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
@@ -424,15 +424,12 @@ static int armada_37xx_gpio_direction_output(struct gpio_chip *chip,
 	mask = BIT(offset);
 
 	ret = regmap_update_bits(info->regmap, reg, mask, mask);
-
 	if (ret)
 		return ret;
 
 	reg = OUTPUT_VAL;
 	val = value ? mask : 0;
-	regmap_update_bits(info->regmap, reg, mask, val);
-
-	return 0;
+	return regmap_update_bits(info->regmap, reg, mask, val);
 }
 
 static int armada_37xx_gpio_get(struct gpio_chip *chip, unsigned int offset)
@@ -449,8 +446,8 @@ static int armada_37xx_gpio_get(struct gpio_chip *chip, unsigned int offset)
 	return (val & mask) != 0;
 }
 
-static void armada_37xx_gpio_set(struct gpio_chip *chip, unsigned int offset,
-				 int value)
+static int armada_37xx_gpio_set(struct gpio_chip *chip, unsigned int offset,
+				int value)
 {
 	struct armada_37xx_pinctrl *info = gpiochip_get_data(chip);
 	unsigned int reg = OUTPUT_VAL;
@@ -460,7 +457,7 @@ static void armada_37xx_gpio_set(struct gpio_chip *chip, unsigned int offset,
 	mask = BIT(offset);
 	val = value ? mask : 0;
 
-	regmap_update_bits(info->regmap, reg, mask, val);
+	return regmap_update_bits(info->regmap, reg, mask, val);
 }
 
 static int armada_37xx_pmx_gpio_set_direction(struct pinctrl_dev *pctldev,
@@ -513,7 +510,7 @@ static const struct pinmux_ops armada_37xx_pmx_ops = {
 static const struct gpio_chip armada_37xx_gpiolib_chip = {
 	.request = gpiochip_generic_request,
 	.free = gpiochip_generic_free,
-	.set = armada_37xx_gpio_set,
+	.set_rv = armada_37xx_gpio_set,
 	.get = armada_37xx_gpio_get,
 	.get_direction	= armada_37xx_gpio_get_direction,
 	.direction_input = armada_37xx_gpio_direction_input,

-- 
2.45.2


