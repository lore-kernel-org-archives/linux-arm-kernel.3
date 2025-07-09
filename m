Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72389C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 07:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D1ym2OeCkr8pQMFEPmypEnTbrpUrxWB31rOAPrAMJlc=; b=iZQnyDDn1nRmcxS5Dw2jGGwKxB
	H9tUEcigHlKRn9tjjMDRZgLBdDRvui0WODWVmgc/wh0dpgBTZ7YNGwV/8IIC5MMc5Ff5g69K704lQ
	Ly/AcVxNOyfEq9w/nGiCTad1Pu+HFYVeyAaRUTCkvQllO2K3vVzzutJBdl+rfRLGPLmIVLO70nsso
	4X/DUiiId8Ti+ejHZlHOFG4XaRJEQgX+gNr+o8xIkF6KBciGCKt0liKoeKchTJWUur/K+/nrh+Xzc
	BLE/hGnTJPo3eboj1IkFp9HWOSMoADWnoK7pJTXwUZd7I7lnp2CP0tm67D6GkxVyWvNxYX0nTWzUw
	y39NwhwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZOnt-00000007kRe-0etv;
	Wed, 09 Jul 2025 07:01:17 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZOVX-00000007h6h-33fZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 06:42:20 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4537fdec39fso15843015e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Jul 2025 23:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752043338; x=1752648138; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D1ym2OeCkr8pQMFEPmypEnTbrpUrxWB31rOAPrAMJlc=;
        b=hgLoBQFKslYvezZnyRsnlXvoCaFckciSNalDH7Mb5R12qmFs0eSc6AErt0MesX/Xe3
         3e9QQJgDiKdg6b2+zD+bt+fEFBM2DGDhDLkIBOAHf4duQ/DHblXdcvT5LDp8KF6LnJ3O
         dGs88vUZK8hRjyEh8xHTgrAd7FmjdTROCh1d2Sod9iQap00414kdlxttMvZRHIWoiwYx
         x2rQIsIB+wS8mmMKdwwEEpv4SM3EGWO6XMmxiK9xp2x43a1URMINg6pOLB1NB/xDTCtN
         sdUEwietP4tSJOCIPygtbvzA9h6K0cYj6PGK/OeqS0qs/O8CS6VGI9AUxGM84u+4orXt
         Fe0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752043338; x=1752648138;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D1ym2OeCkr8pQMFEPmypEnTbrpUrxWB31rOAPrAMJlc=;
        b=een1rozVsPD0kT6n4yAWs9dwTzRnRBGRAkKjN02eC40YnL+aCDHeQbnFxXTwldNNFt
         2r+HTj9SRErFnLztsyoG6tc1gxZAbwn54G/70ummNeZ3EgjzPDmh9//4oYRLR7y1HTZX
         ZilTd7TQOdgVtBFK3WLt1wkms/GT4JMWhPcEyTj3krC7hE7HkRNnc/0yk6MOuRxTVPzI
         +TLOge8g0drE/fDl95CwsmkD/5MgkE18+NSrAsABKHJ7iS/jbXtXV83cW8aUHHDsR7rL
         iiJcclt15NByi8Hqe4OoioZafx9pW8oeU6B8W/4gmdSETcRhK0k7tW9La2ammovVEYcP
         Siuw==
X-Forwarded-Encrypted: i=1; AJvYcCUKLGY+xUc59clkElpWSaJ90l4AXB2YcmsBNsBPy0U0Xy48MEIRRZozklicbezWDTD88pzeFh+pau/TV7kzOTGJ@lists.infradead.org
X-Gm-Message-State: AOJu0YzX4ONJ/XuekQ4beCyRtaBlMC7c4EMqf1M37wwBqdGf5n47jxPH
	gQWDJWjLE463M+ikH6iqQ6YJtVLMcNEOEfbVhATbuwmXi4HfDddOazZ4TK3DU19b9wM=
X-Gm-Gg: ASbGncuhBo/8zHvsgTVyjC+GiwHOZvYdhkl1wDuicKXFWbMgc8GPCHktoM8hDktzGy+
	5gyzlSkiu6IzpCsfYJJ8lZVAGf5TDi2ifj8pFSn9nuHjN5bBTbnjVFFkeE8NhbigADHKVBAqDJN
	6OxZJAM6kKY0UBDUJe/cgJUiymDcjcojACtYyWcUljDhrPUWXs8ZIS5nvQfE6oq5Ost4ngw3tuT
	n6nCgQDB8j+cQEYelEenRSWPk/UCqstllwXGmelmVh4Qv0otfSk12UQt8qgGZl0m8KBqWRO8VDC
	90+Sx+uAn2kfpQtsWgGhoRtPM6ACkpysfKGcae1qH4URHaLKKjijPoDk
X-Google-Smtp-Source: AGHT+IHt07U2Xz5v4O7qgram4qRcjgWp95gR5cZRQzOYCsYLjawbfcTIUzAXt4+yL+o1s0TkUQdcFw==
X-Received: by 2002:a05:600c:4ed1:b0:453:6f1:bdba with SMTP id 5b1f17b1804b1-454d539ae58mr9109895e9.20.1752043338455;
        Tue, 08 Jul 2025 23:42:18 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:b04e:cfc4:3bd9:6180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47030c443sm15115341f8f.11.2025.07.08.23.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 23:42:17 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 09 Jul 2025 08:41:41 +0200
Subject: [PATCH 04/19] gpio: wcove: use new GPIO line value setter
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-gpiochip-set-rv-gpio-remaining-v1-4-b8950f69618d@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1685;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=6ucBCkbJOLiqAuQZJ3VCIGGEW17v/EwaGRwLA4V5JMc=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBobg9B4JpB8pMhhn437+VIuAIY7CmIdj+JcRuuS
 uEiRvWCjliJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaG4PQQAKCRARpy6gFHHX
 clKCD/sFvTus/eAyxHUgCoS8y5p5otcRR1TJO2ueDJB/HW509aW5EA3hYGf14ndSWvI8dyK8Bha
 LvxsZmja7p7CTftWZyOhwdh9DdfqybtduYek+u9alFU2KiAfoguXtBH8jJvxKgYeG215RM1gTDP
 D47AjFtax80JZO5IvqckTna5ubszZ8gh4KneKJe40f1a37qJqN2zfuAHEkMvJcsbzE+LC9M/jVR
 UazsfGlUfV149xpyJfSv8JVeKYWvYFv++KPOtliy+QGblL8kMZ9Y/Uq9ZhjKV9XPBX/acRpEikx
 ZChaM0rwqaq5w9HiJH3Bj5eTPKRmta9ah/lUaoHC9te3vQJla6TzwucauwnSHXUf0bDGFUJRgVF
 jDUQZovcen3+TLGWm+r8AN/gJkSn3voDUC14TvsAXmxfm5G9y3Mc4QMYq6iqKxM9AyekJy/AIC+
 NWurj/6eFbE9IuOKu4Q30ttt50IBFq60Zu6F/NesPnWxcfdb9kLYHAqKVeodbjJlwidNRmLSj2+
 TtxbZXiXYM3H0UTtPIFInQlvkCKLE16LreegEMd5JkhMf5AnncXk9drs2qV0TloOPQ2nm2/sbkt
 e2iDD1eOjQLLv7faZ9s6+qcSJCFem7eChdjIS1GMo52btA0JFET2dKC/z2tNonEnNwx6vkppbWO
 m6plrux4/on+Mcg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_234219_777234_F9F778DD 
X-CRM114-Status: GOOD (  13.36  )
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
 drivers/gpio/gpio-wcove.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-wcove.c b/drivers/gpio/gpio-wcove.c
index 1ec24f6f9300f33f5b3f0f8deb539e08392b8188..c50b74ced6364e3c3cfbe9ed385d21c80a2bb2e7 100644
--- a/drivers/gpio/gpio-wcove.c
+++ b/drivers/gpio/gpio-wcove.c
@@ -200,18 +200,18 @@ static int wcove_gpio_get(struct gpio_chip *chip, unsigned int gpio)
 	return val & 0x1;
 }
 
-static void wcove_gpio_set(struct gpio_chip *chip, unsigned int gpio, int value)
+static int wcove_gpio_set(struct gpio_chip *chip, unsigned int gpio, int value)
 {
 	struct wcove_gpio *wg = gpiochip_get_data(chip);
 	int reg = to_reg(gpio, CTRL_OUT);
 
 	if (reg < 0)
-		return;
+		return 0;
 
 	if (value)
-		regmap_set_bits(wg->regmap, reg, 1);
-	else
-		regmap_clear_bits(wg->regmap, reg, 1);
+		return regmap_set_bits(wg->regmap, reg, 1);
+
+	return regmap_clear_bits(wg->regmap, reg, 1);
 }
 
 static int wcove_gpio_set_config(struct gpio_chip *chip, unsigned int gpio,
@@ -442,7 +442,7 @@ static int wcove_gpio_probe(struct platform_device *pdev)
 	wg->chip.direction_output = wcove_gpio_dir_out;
 	wg->chip.get_direction = wcove_gpio_get_direction;
 	wg->chip.get = wcove_gpio_get;
-	wg->chip.set = wcove_gpio_set;
+	wg->chip.set_rv = wcove_gpio_set;
 	wg->chip.set_config = wcove_gpio_set_config;
 	wg->chip.base = -1;
 	wg->chip.ngpio = WCOVE_VGPIO_NUM;

-- 
2.48.1


