Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91A67C369A1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 07:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XOjNNeHzyY58LMv3k+FTJZV8HBjSzUrYs1slCEoFb4s=; b=IfLCnt7vnTScJ3fgPxXpeCDzM1
	dyYNGBErNs6r+r5Yok25LxGJWa4D1E6i7kgiuXUPo6a5Csb5OJRvX0vOsFn1tv4HhS6KLQ0GXgaFf
	4jf/UmldEbF5FS7KmrjeegW+5g1QmtZNJaCAEEB0vy+JFSFVJbIWIu3IlxwIIBXaNn6Ic4U2qZ6TQ
	CYLNvPAaB3sxYEiLH4bbFkgAQYy0P7TGzz+SG7DMcnslR6FIYzeeN4Aal1DEaYdfJhJeOj7s8vU9U
	4LwLcHXf4OCTfn99xfc+4lagavjlqx1xuvFJ0+Deya6oRWpjbL4043WJCEDk0ELuOljxiobWfM+4o
	L+i4T1NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u23kW-000000039cT-3FKZ;
	Tue, 08 Apr 2025 07:52:00 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u23cM-000000037wD-28Rt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 07:43:40 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-ac2c663a3daso975176166b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Apr 2025 00:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744098213; x=1744703013; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XOjNNeHzyY58LMv3k+FTJZV8HBjSzUrYs1slCEoFb4s=;
        b=PwjtMKFBe9MUD55dKMUpJnt6LlkiU/QVh8FDUJaX47dTUiwToAuo6ycuS+c1Wvjrvc
         H/9NyEwspWBicAC4MaahHis0g7QwVIjvO4h59aSgd1QEzOegwVJu4PlnUbeoedGCxaPC
         JSgnvIpZkhorN3hXdVSOZdYyV/s8W3nUnFdcmxaxk0ovKLWZvEorYwFX3VWhYVSStLNh
         a+I5a2kA4Z9N/TtdVWWifuEshh2xCEB2CqgifLcxHT8zZWy0BzJTbytQmlf+woALHnsp
         ccFUqCUBvX25O5f3kYf448Twlx0AzjyQBRKBI63z9+SjLbysTa5chyvd+dztlG/n685E
         qDwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744098213; x=1744703013;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XOjNNeHzyY58LMv3k+FTJZV8HBjSzUrYs1slCEoFb4s=;
        b=UCVFbvU1vm2qj63eWUHVX4A61vVtunhtSyW6GRJlxkYitEhtKWPK6o00PD631jTezb
         dgGzsOJLgF3/UAb1bql4jsdVGvs/dpzUh5uyemsdD9BUxEwk3eqUi+IsYXKezs170++Z
         1fzgfyzfMlb1pXbmmm60VOFeaoznwRzaUrKq5+bvV09dmG7JefcJMCZZmv7FVlCo0D91
         KTp4RUVBB2aqPT2lGNXtVzoYDq3QG/RNCOdPkTblA3/Oj0ZY0KxXFC5u5AbFYPafW85P
         IBg5i+hMcFp+u8S5wMBhFksR0IL9NRH9kzdz7UbLLV01X2yjwXPpghaP9sp3F5leHAgg
         ggVg==
X-Gm-Message-State: AOJu0Ywf47BTOeevW2jiZnc/i/h5d0r+ZBCNLTB4CYetD63FVIZ1NuCG
	4D1ajf95fhC0Wm4bmsPZskYGHre/Sp3sFZzuYhIvO/P9b6Gu9jdNxKJK8ppWOkWCVj7XE8xBUox
	aOVc=
X-Gm-Gg: ASbGncuJvZn0QH/vlF/sf7sqNww9YrocEwSM5X9b1z2QV8eaqAgEwVem6vsSGTuB2GO
	zrTIJTtFlIYbn63EuafrYJQEd29bq6Dshh+Qug/Cd2ocI0HbrABCMDrpd/FmiYx+NUNeFM2HAeA
	awD1WR00e648aMi6yvjly5TG1+JCmd407TWLWoN+h8WYf8jceOUSIBo0+FjeYxUO6I9UqnAfsil
	rATWbhi1JUkYQYUcfMrqpuiuq8R3goHwR/yh+pJ5pnNl4nEYsrAUuURK4j049fFu3TGQtMRkDwI
	sSmeitXCyfKgqfjHkiLwzcg/TPLlJwK57gq1rw==
X-Google-Smtp-Source: AGHT+IGDlv/Wz2Tv0JI+8Hx2njCPUM9rczyDR5EAPHa4oqor0nd3oFYHO3dEgeKjIpQ3eleoyeURtg==
X-Received: by 2002:a5d:59ae:0:b0:39c:27cc:7ba3 with SMTP id ffacd0b85a97d-39cb35aa8ecmr14702868f8f.33.1744096676320;
        Tue, 08 Apr 2025 00:17:56 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2adf:eaae:f6ea:1a73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d5d1sm14257694f8f.77.2025.04.08.00.17.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 00:17:55 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 08 Apr 2025 09:17:43 +0200
Subject: [PATCH 06/10] pinctrl: amlogic-a4: use new GPIO line value setter
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-gpiochip-set-rv-pinctrl-part1-v1-6-c9d521d7c8c7@linaro.org>
References: <20250408-gpiochip-set-rv-pinctrl-part1-v1-0-c9d521d7c8c7@linaro.org>
In-Reply-To: <20250408-gpiochip-set-rv-pinctrl-part1-v1-0-c9d521d7c8c7@linaro.org>
To: Ludovic Desroches <ludovic.desroches@microchip.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Patrick Rudolph <patrick.rudolph@9elements.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1680;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=zFDAJ44H3rDElvqiaNPmVwvOeCsvopBV8K2+vzPv+N0=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn9M2aCcCPhwuF/Scl+dWhUvbWutpdgADlyzo6E
 dkwEIOpAkiJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/TNmgAKCRARpy6gFHHX
 cnRjEACRE1eo2DpKjHGbPlQbMpv86tO6SMwS6frSIq+KfYxOaODnxG0vYoNPl1XeTMMPfKWxuKo
 MspJKWTkvUN0QuIxmjcZ8vBjIh2Ssf2biltkgH+3Ut1/ExIvxXr/M7gT0UOy2/r94+c7DkVzBEK
 MXr/4KXQXVZ4OSvLf588xywzpAYfsAPShtYaqDz9OdGk8uc9fPG5lzGH4ccc++V5cuv0ZlY9tD3
 ZXnb+hLdVs0BvC1ESV29eq9xcIkTRj/KhdzH4WdJDJB4Fx4xRvCBxuTrv9+Hv2FE6VyVgnX8Knt
 wPQY7lA3cwjzj0sWtwauKnLeZ0x1DD6IMexNhfxrfvgGpEXh0w3i09yOn6vnAvTxetgrzUoiZsq
 5210n+9CVXDRsBqfEUuqtBOx2/HJBwMibEOeyf/tK8wVBtbrEFq1ji769lP5H/PGJUFNT0bPXLd
 vnKVHrJiJUiyX0REr7gSm1AjTYXZb/jNq6PcBIY1JG8vYGaruh/7KsvN5PbWlmeIxn2DIKitoEB
 5c3paQ4gObhMQ1lHal6NduGavNkTb99awzhp7MjrFLQ7vHEkk6LWPVdn1/obav1Qnh7bwi6/RYI
 rfIeivF5Tge1zaLyASFLrEOQUIffbwsDEofBTf4iFicbK3EDjEXXtUNKuD4DDgO+q2/1XPzUYDj
 IgJ4xDux3XMrr+w==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_004334_543459_F6EA2B68 
X-CRM114-Status: GOOD (  12.75  )
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
 drivers/pinctrl/meson/pinctrl-amlogic-a4.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
index ee7bbc72f9b3..a76f266b4b94 100644
--- a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
+++ b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
@@ -806,15 +806,15 @@ static int aml_gpio_direction_output(struct gpio_chip *chip, unsigned int gpio,
 				  value ? BIT(bit) : 0);
 }
 
-static void aml_gpio_set(struct gpio_chip *chip, unsigned int gpio, int value)
+static int aml_gpio_set(struct gpio_chip *chip, unsigned int gpio, int value)
 {
 	struct aml_gpio_bank *bank = gpiochip_get_data(chip);
 	unsigned int bit, reg;
 
 	aml_gpio_calc_reg_and_bit(bank, AML_REG_OUT, gpio, &reg, &bit);
 
-	regmap_update_bits(bank->reg_gpio, reg, BIT(bit),
-			   value ? BIT(bit) : 0);
+	return regmap_update_bits(bank->reg_gpio, reg, BIT(bit),
+				  value ? BIT(bit) : 0);
 }
 
 static int aml_gpio_get(struct gpio_chip *chip, unsigned int gpio)
@@ -832,7 +832,7 @@ static const struct gpio_chip aml_gpio_template = {
 	.request		= gpiochip_generic_request,
 	.free			= gpiochip_generic_free,
 	.set_config		= gpiochip_generic_config,
-	.set			= aml_gpio_set,
+	.set_rv			= aml_gpio_set,
 	.get			= aml_gpio_get,
 	.direction_input	= aml_gpio_direction_input,
 	.direction_output	= aml_gpio_direction_output,

-- 
2.45.2


