Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1257BC369D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 08:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rNkYr76mp1i7nVgGetDvEHtsIWDovRPdxkWR1fDzPxI=; b=GKWGRdEFDo5556sPgtCRCZPaKS
	VNs44YHDvSaEBdgDfC6kKbjSVH+CUyC/ZuDdMtD9IO5xbhqIJqgIYdwTx3/CrGnKEPHh8vv/i5kIe
	ge4wb1ocHDXdoPwHB5Aw1ueMDDQ/vdek7i5ujgIdRV50hmY6/ipFDhyKzX/Uh+E4rI1K56U0dWdyr
	0tJYyAZV1OqbN7jPepqmfNSSezEjRC5AVsKh7isHaiZnDuJKIPfCmCcNJ/fkbtuKYaIhqebtv1pQz
	v0RvSjSWKPOmRBkuFHj4DQ5uWnunzD2SmYAohVfvIH0F7dnZxw4M6D0hfzOUF+AftmJiiPDepPqNI
	FR974FJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7sOp-0000000DQj1-2cV2;
	Thu, 24 Apr 2025 08:57:39 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7s3p-0000000DLBa-1Q9l
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 08:35:58 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-39ee57c0b8cso695519f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 01:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745483756; x=1746088556; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rNkYr76mp1i7nVgGetDvEHtsIWDovRPdxkWR1fDzPxI=;
        b=ieflVQaFEd1qZCOJMV6mSbahUQIBNS5YnN8ETuCwO7iR9BhEJZPVeuPmdqQOouVeHY
         EtJCaaHBTfRZZPkCYHG7EVjzDl0YloSv43qcGxuvnfc7GKFs8rJxoRoKDYXuK/SEHNBH
         eFn4dUTLBWL/I3YUCYi/bplh7HAxPxYexV9GtFMEVGh9Lfx0yLU2HKXUJA3v52ox3jIm
         Hw8GB7Tt9yuHAXrrY3QXogmOar9L5zXzNRZvPtp0502y4P5mlhRtquJeTGDIUeFcLOdj
         q6pbtBC5NLN6ddHDyqA04FcNDASYPGtOqJTHyYj89E2xgaZZzCkX7/6UohJKaiUa5OEQ
         y+gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745483756; x=1746088556;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rNkYr76mp1i7nVgGetDvEHtsIWDovRPdxkWR1fDzPxI=;
        b=fsz9jykCnS/nGWowjaz0X631IVZhNCKcKfQHh6vMUHRpJm4rd0qJV4QMp/BejI+5h1
         A5ubd8SrdDlTzYlqmPbhg9L3hRxfPWdXG6MHccd4KnQCmBPls21t30ySW1QP3PMEqIGf
         9SKvb0IfokYen7tfSxxUTXDYbLGuhzzplJo4SI7Fk827nSWDwNggfa+RM3agTuiPXMjv
         4va5QecoJ6NTfYAS29ZZnUdc0ElhaJ8Mx5dCbQjLtzuFXQ04VCBE0A8+h57aVeJ2ERlT
         lCRz6NVUDqfyxImZbG8mnfiFSRU5E9LFJx/Yt3OdGulc7S+0htPA67TUFUnDaqrD24Xn
         EfRA==
X-Forwarded-Encrypted: i=1; AJvYcCXDojfEYibuilnGjzfSda8cnW9+4nxMZ4h+sJB48p6H/VWM4fB7AhPFasf0efA7bILyGp71o9pdV80sOnVFRo+7@lists.infradead.org
X-Gm-Message-State: AOJu0YyEyJ2J/PULGgBLF01BWtq7HQ1PD7oy8Se7oyISlmrGZh5n7OTk
	zLFSD5TCeevOc6oR3mxhrZAmWv9DaZ99pKSWjTRL0IRfTYd/rULmr7jg8LFVLs8=
X-Gm-Gg: ASbGnctCOo1ZmIR/IKbGISBCf0ufjLkQvnkAOtW9JHjI/cJSCp5rl1oufeeLLb0q0Y3
	r4rOaNBHq8eAAopBBuE04Aqf4zSr3Mzx7Gi7YZZGsNa5Y0D7TMOehmtHjLAxEDbk/ablKGfgX3m
	T3hAqYFZuw1ENt2mwriTDKfWLg3VHO0EUpfGuNQTnsDrY95pIDeeosam8ljBOEWUESxY0IA33uW
	Xo9tYhZupyQ2qhygXC4egA/EU5+TmU0ovBNme8ppQ1EGgbNvMBpzxRvE5U+AnF9WPbW+nqdE+ZU
	9Pi+6wig4b/F871SW4s4YW4aE5ilPZsG/g==
X-Google-Smtp-Source: AGHT+IFjK2Ih7IwrcWu/Ekc2IScPqnu8LdiHaMHhLUAVC8NOSxem7de6NFgjnyJadaWki95xHXhVmg==
X-Received: by 2002:a05:6000:2285:b0:39c:dfa:d33e with SMTP id ffacd0b85a97d-3a06cf5ee26mr1184882f8f.23.1745483755990;
        Thu, 24 Apr 2025 01:35:55 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:6266:7750:57ce:7cb4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d54ee11sm1295376f8f.97.2025.04.24.01.35.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 01:35:55 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 24 Apr 2025 10:35:32 +0200
Subject: [PATCH 09/12] pinctrl: at91: use new GPIO line value setter
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-gpiochip-set-rv-pinctrl-part2-v1-9-504f91120b99@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2126;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=hJTZiBYt8YR30cOIobq85K3/2m9qesklwxGOmsQ9g+A=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoCffcCq0GrDNjVi0FNEZfifP8+NRGD6rfnJWXk
 coBh3BYPZCJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAn33AAKCRARpy6gFHHX
 cmMXEACVIhPoysgXs4nu5CJDcrzmVOtI63aayA+4b79fBXpL+qGUHubLG3YzFMEjUXjHl85dd/6
 u+PbGSG++Td2UJwMOeToy/iU6XJeoDV9NcAv9A3+d8dEVceRGEzF/IV67jKmO1bygPVhxBTQQEi
 /zIZgPpE7lzaIM1OzDuiGntQ3w2gaNwTRpcs9IxS0hLmB692VjKRLywPkO4KAQ6q9XxoVl9VPXS
 6y9mHl3q73az6GnjjF/r1u9yfRMQGn6acO+aj5/Bvsi1Bw7qDow48UrYbXAEUc9uH8oeP0+uX9z
 tuMTPyg5d+3k7jv63X5OIb5daBS48MeRE6FPFo3VU7Xl+eeLSfRwF9frrll/O3vYGMOiqVLocU0
 AS+osCwUO7rZZ7QRq1GH3ALDM31j8aTOK2l4xXsXTYNZVUiiM4MOZR64Hyi4u7SYtPAN/RogT2u
 x8zcKpoXblnjfai77whaSsOXUmhkgQHJGCar4waLDSd7mIXtWlcj+ap1RzNka8B/uQtm/egMuOg
 PaPJQ7PYn/o98sUu7aCCG/LPHFkfjRDXXUjBLyjUit4Z1Dlc2FMLjn6CzlxwUbfR5TWF5eMkMlm
 Zq6DNWbNlbcPod4oxNbS/msyHUx8ZwDdf90kf1rF3IVNBsDxS2dnokrMcEc6lm/VrqVYt4ACLHc
 FUM8aDQrmoClWRg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_013557_383862_66E853B9 
X-CRM114-Status: GOOD (  13.53  )
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
 drivers/pinctrl/pinctrl-at91.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-at91.c b/drivers/pinctrl/pinctrl-at91.c
index 93ab277d9943..442dd8c80b65 100644
--- a/drivers/pinctrl/pinctrl-at91.c
+++ b/drivers/pinctrl/pinctrl-at91.c
@@ -1449,18 +1449,19 @@ static int at91_gpio_get(struct gpio_chip *chip, unsigned offset)
 	return (pdsr & mask) != 0;
 }
 
-static void at91_gpio_set(struct gpio_chip *chip, unsigned offset,
-				int val)
+static int at91_gpio_set(struct gpio_chip *chip, unsigned int offset, int val)
 {
 	struct at91_gpio_chip *at91_gpio = gpiochip_get_data(chip);
 	void __iomem *pio = at91_gpio->regbase;
 	unsigned mask = 1 << offset;
 
 	writel_relaxed(mask, pio + (val ? PIO_SODR : PIO_CODR));
+
+	return 0;
 }
 
-static void at91_gpio_set_multiple(struct gpio_chip *chip,
-				      unsigned long *mask, unsigned long *bits)
+static int at91_gpio_set_multiple(struct gpio_chip *chip,
+				  unsigned long *mask, unsigned long *bits)
 {
 	struct at91_gpio_chip *at91_gpio = gpiochip_get_data(chip);
 	void __iomem *pio = at91_gpio->regbase;
@@ -1472,6 +1473,8 @@ static void at91_gpio_set_multiple(struct gpio_chip *chip,
 
 	writel_relaxed(set_mask, pio + PIO_SODR);
 	writel_relaxed(clear_mask, pio + PIO_CODR);
+
+	return 0;
 }
 
 static int at91_gpio_direction_output(struct gpio_chip *chip, unsigned offset,
@@ -1798,8 +1801,8 @@ static const struct gpio_chip at91_gpio_template = {
 	.direction_input	= at91_gpio_direction_input,
 	.get			= at91_gpio_get,
 	.direction_output	= at91_gpio_direction_output,
-	.set			= at91_gpio_set,
-	.set_multiple		= at91_gpio_set_multiple,
+	.set_rv			= at91_gpio_set,
+	.set_multiple_rv	= at91_gpio_set_multiple,
 	.dbg_show		= at91_gpio_dbg_show,
 	.can_sleep		= false,
 	.ngpio			= MAX_NB_GPIO_PER_BANK,

-- 
2.45.2


