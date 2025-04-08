Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D604C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 07:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5HVOt+4srGnvQwsP1v9+2VHPQ1xwkV/AAlcGkzlseiw=; b=OQdt6YgOYgEBrrQxsj5EyF/dWD
	/SYtQbGKavOom+S/TUBtPbqIMlXyjD1OVJOxOq34lgO+rb0w3mc01A7fapjxKd8Az10hKuqZ7ZJ/L
	2onEH2HenQ73QLrPEElk3Pz6MKIOR+N4K/zWWzlT3iYPcVwpg1Trrw3o7TGwCgzWqOO+YPN4KNPBT
	6fj/eZPI+S9Tt1G6tOrUZUUAGnubF3ysH/fX/dD4RQE1sTDXz1G53c4j+dSo42Idc6Ps6A5W0Xfsk
	tbrrkjGAdUsBR7vM+ZO05TVFS1K+uNwIYCok806mQjeiGvUpfcVmdnq/FmXm/swirHazYn/s2ZRPY
	L3ZaTlgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u23Pf-000000034Q7-0amf;
	Tue, 08 Apr 2025 07:30:27 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u23Di-000000031k6-3Iqs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 07:18:07 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43ede096d73so20959865e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Apr 2025 00:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744096685; x=1744701485; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5HVOt+4srGnvQwsP1v9+2VHPQ1xwkV/AAlcGkzlseiw=;
        b=TA9Oxg/CfmO1mA2TeThTBq/VCGMTMAk7uFwafrweSYmEdc+OgglsI6GoMMKm6pA6Sg
         mcCqKwAe5e//ZK5tCVk/JuKJPSt1Dvb8Bz9dYWx/aG0EezQJovhaARLTst0qLFa35xpO
         Tcx/82bIKwkrJa+amuaueflhdRJOLoM7VeZFoDvSAXHy3xl98A+yUjLK9ABp0/omC72R
         +/jue3Tm+Ai7oM07FN4eJ30hzO8TX/EXSXRKEH5GVqrOe9//mKkq82zoRkp8tHb4qIaN
         a/wtyIB6QQ2wut9O+F9sFbDupwd5x050VQYRgCd87Ry9/Y42ycktYOXCwuugcGj+wSbB
         NmGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744096685; x=1744701485;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5HVOt+4srGnvQwsP1v9+2VHPQ1xwkV/AAlcGkzlseiw=;
        b=FpZWNC++ioHiWYr8M9LPX9UEL0DMgu2JaRE/at5y+BmB1KRkDtTW08jvu78i11b3ZM
         oKCixueBP/994wZ42pQLYzTc2r/pzOMG/OfKXAHVwr5j+whclOIqmN0vE4jlF1lrd/3Y
         BLdf5Ondf6BRaFff6Tp/C1o9NFZhrSUd3guHHG+eArOLEs+atKxtFOGAsOncBU8mqGv1
         qoSGISvLQKUjszmucax+iXB45kCqAcp/jvMIx8VeZnZc1+ciFIyKj2FfiCEn3IL+IMtv
         dnpMCZMyA5G1vtxN0/l/4tXscrxdQH5S2ab+VzzBJLoAwrntWnK1/k50EoBARcyw8xS4
         XKqQ==
X-Gm-Message-State: AOJu0Yzb6z+Gbv9KEe9F2EHCpOsInBbLapCxtJzcc+eaLRndVxvlzB96
	2oRbrzELGNkrmMAxyO/BZNFyk6LkE3EwHot1RV6VupuluoFw5sZWUPJmPfiFBbE=
X-Gm-Gg: ASbGncvfMgolk8NIisa0kgAODJdpRs6blCJlsOFqqCrRowBhMSqHAYDuTv7P0xXLoWy
	Q6fWLKsN69UpHgb1lywaBYpttFDbhRJcUpIsaQSuflzupM62WohGzTwFzqB+Pvz0pw85jLKrlma
	qNCJF1B3BDGcN0KqFnQypbV2vJTxM8O/56/RDRCs6yk3bNG1QFruSXwT4OufnJLj0pBoj+wv7yk
	z5dHAa5PJ9DS1MetrvnWwfJS0cR9hOtQ+orxUaWLvtFJ9zqsCi3mLJ3Swj0twMxEMUrhOFf0Ydw
	fYH8q3fkIH5ZkhSgv4z0+UlBDSvJn0mzqS88ew==
X-Google-Smtp-Source: AGHT+IGSySduYIODYDDBNhKW+V8JxaftIxx0mbfbLM56e4WvjRuBEIilNZOQDJkJo2kY1AIOFFw1zA==
X-Received: by 2002:a05:600c:1d28:b0:43d:7de:16e3 with SMTP id 5b1f17b1804b1-43ed0d9d18emr123594385e9.24.1744096684912;
        Tue, 08 Apr 2025 00:18:04 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2adf:eaae:f6ea:1a73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d5d1sm14257694f8f.77.2025.04.08.00.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 00:18:04 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 08 Apr 2025 09:17:46 +0200
Subject: [PATCH 09/10] pinctrl: ocelot: use new GPIO line value setter
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-gpiochip-set-rv-pinctrl-part1-v1-9-c9d521d7c8c7@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1855;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=spvpQCaMJt/FlIsnba8JPp3MhbofiKGgIiv9FJg4rZg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn9M2agt3O6aR1vCS8hOqHTDKX4aiCLJ+nYrJpF
 NCIW4f85ciJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/TNmgAKCRARpy6gFHHX
 cij6EADKyrhyl0qDS61cTLux6MOWrF0i8ovx0ZQmpwIhr0Bg5B+CblqHxvZat19Nu7Z/KQuhoxa
 5a4ZjXS8zPhwsmNHcJL8XmmCO7AuZyzbIw/dJAygTYI6OrSzueQYkwP5vZpAyxet7FuT1YH5JCw
 AKvK5JuGVvzXt/1+S0QhyqRa1DBk/r9qW/PGztC+Q+1JIP2r7feH6HlncUVIUwcUmAtz47d1GKU
 d9WdVpTnCDHkoQOSX43tLjkyf+bWEUz35UYdBYvlfQ691lbhiEgyJZo8cU56ecomEvyTazRrZel
 IPsNTSh1TYRxmQ/gG/yks6vYRor8W09Gaw0FrsS6r5ifS5/BdkYI0/W5gX6I54YDaQYReRflW6G
 e96ttMnq/Z8KuMsKIUEteJbJMqomGgb5fJ9q5gEIw3QafPDTn9G5b99Jco4HVa6RwDPA5/LAXmY
 ttBiDSb/t7dTmdHdHxNHdzkYKzwk2MxkH34FBOX0/wo+7HoCuAeePRR1D72+DhbDm40qtzwPhIW
 Tkd+O16r6I0zfcX4kMUD7znBhtCMNTTSCyKjzQofWO3wqRQmC/lxZU+m+9WjsnCobS2jV6bTGb/
 6HE1y+gTQLWisUWQCGbsYviBPph9oEM1aA7O3zarkvGGcMtGx5/W0bKBdZ2nCh/us7+xv45Qh88
 jH2gOpx/XG01JmA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_001806_835468_11B4BC67 
X-CRM114-Status: GOOD (  11.64  )
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
 drivers/pinctrl/pinctrl-ocelot.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-ocelot.c b/drivers/pinctrl/pinctrl-ocelot.c
index 329d54b11529..fbb3d43746bb 100644
--- a/drivers/pinctrl/pinctrl-ocelot.c
+++ b/drivers/pinctrl/pinctrl-ocelot.c
@@ -1950,17 +1950,18 @@ static int ocelot_gpio_get(struct gpio_chip *chip, unsigned int offset)
 	return !!(val & BIT(offset % 32));
 }
 
-static void ocelot_gpio_set(struct gpio_chip *chip, unsigned int offset,
-			    int value)
+static int ocelot_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			   int value)
 {
 	struct ocelot_pinctrl *info = gpiochip_get_data(chip);
 
 	if (value)
-		regmap_write(info->map, REG(OCELOT_GPIO_OUT_SET, info, offset),
-			     BIT(offset % 32));
-	else
-		regmap_write(info->map, REG(OCELOT_GPIO_OUT_CLR, info, offset),
-			     BIT(offset % 32));
+		return regmap_write(info->map,
+				    REG(OCELOT_GPIO_OUT_SET, info, offset),
+				    BIT(offset % 32));
+
+	return regmap_write(info->map, REG(OCELOT_GPIO_OUT_CLR, info, offset),
+			    BIT(offset % 32));
 }
 
 static int ocelot_gpio_get_direction(struct gpio_chip *chip,
@@ -1996,7 +1997,7 @@ static int ocelot_gpio_direction_output(struct gpio_chip *chip,
 static const struct gpio_chip ocelot_gpiolib_chip = {
 	.request = gpiochip_generic_request,
 	.free = gpiochip_generic_free,
-	.set = ocelot_gpio_set,
+	.set_rv = ocelot_gpio_set,
 	.get = ocelot_gpio_get,
 	.get_direction = ocelot_gpio_get_direction,
 	.direction_input = pinctrl_gpio_direction_input,

-- 
2.45.2


