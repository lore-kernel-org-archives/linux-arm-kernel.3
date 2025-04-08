Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F3C7C369A4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 07:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oinSzm+bMahZJYAUWu862y4MPTAeTqz9q0Fj/pnJpP0=; b=phwujWPvGT3B2XPmkKR3smBQw/
	SEY/cv29H8HUK/8USTf4EYx/1+F979iUJOsgbZ25PMOS2pAXUKXPn6jBVnPcXi6CpVeNchIEWLm0O
	wA8vJFA+qlPPJTZt8P47QnvVYDgX12tfFIhpETB/CWjivpKCHtxq+PtDCw+p2jT/sbwSkmtvNKb+W
	c/Zr5ohXOPSxjBhXykq/uyajptedSRHq+rdPnsWEkMMoqrm+0EX4xaklosKKa58idg0gnhvrBl+8M
	IZ1GJRgOeCEG6C+o8JwBEiW1LFVlrTNN4x0V0iaNE+uT5lMTINHb5s78lkXQiSMbexA4alNGaje4+
	zdYBpdBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u23KS-000000033DK-1QtR;
	Tue, 08 Apr 2025 07:25:04 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u23DY-000000031fU-1B3R
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 07:17:57 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3912fdddf8fso3973065f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Apr 2025 00:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744096674; x=1744701474; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oinSzm+bMahZJYAUWu862y4MPTAeTqz9q0Fj/pnJpP0=;
        b=igWbW1iAw3FYGURemyDT7qynBLbtmjtoSINC03Nh+DjJGxvseSSf7NTW/c1fvdHdnJ
         ZTf02CsSqCooKZnR0JHE9UegJVmok/kAfXagFZNhQ9FV/7RO20a6jA78c2fCQ/6mXKVW
         BxyUagxlO/EQ8yIVHzjOyCCOOWRmZoapcd+P+/6/XxONphk9k2N1mByFWb+0pEL21QbT
         hjj4TAOUSPyUlp+QUxgABZRrM9TK6Jua+JgSTCdqJwGwS46D6v52NreJtI6T8op7k4Pi
         FHNreF4K51uwImA+fWwVsV//edGwqgOtVhDjGGhMyIqXWs70MhnwHOBdSgJ9K6OIoKhK
         OGCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744096674; x=1744701474;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oinSzm+bMahZJYAUWu862y4MPTAeTqz9q0Fj/pnJpP0=;
        b=XcR7xgQ3+/5uEZMlaax+ca6cHjOaY9gjLOU2B8MIrO7FyVgoo56utwLcvfk4Jv7hgQ
         xVHWesJEa0Xv5cIytSlxjuye+jka1cS6cg++L4n7Qe29gTA8VL51MdH0KC2ie/yOqXtG
         Mggpnu3psVjP8tpT4xfg2dfRDJ5/C0K9rkx1h2KMkBjtMUD/10kmcr29LQqQ2cru3mUz
         kxruZFZprvoM0e3Fb95bstMkcc82SsdekW6Qhs/fDOzxBw7/lTa/r1mcLCoCmgl3Voll
         0Va6sYMC03+c8ALHklkSsxBgtfzrz8OkDiAJ1o7pMVwb1FkgPcUmqzMVLG7lpLaeCgO2
         VJgg==
X-Gm-Message-State: AOJu0YxDHy8Xq+JTmxYP9CRki/XSPCLcEh59RKOozj0TUAaefURxn+l1
	PVgOftyAlmwNUDcIRZez71EACsTOJUvf3Hb4qBveZebhpYKUd3JS0m/SzLayWOU=
X-Gm-Gg: ASbGnctt06S+JpwN8jjv5HUTCdk+R07svYJ2YW6hmnesiNFuRujaUJZ2S0BjSL5bbie
	g6GK/fSKfPRFEoOe9rKEMX6Iqsi3v7Wku+z2+O0IjkbUNLsmEQL8+wqDZQzQcDggLgEsu3I5kwj
	uyyGxDWeOUQ6Ep/cIXn9rtr3VIxfhqcoyRHUFdwNPgD43h2b6zGQWBNwj+1E0rG5T964C/8w6Rq
	AvzVYjUDmHjiyh079jPfqRhT2y9F7FPacAHxCVdkjiRuT1SgOOop0pAvr+vJeNhyq1txBRVrRd0
	UgtycDxoZk3LlKtjBdOdV81fyN8EYa103hQ47A==
X-Google-Smtp-Source: AGHT+IHrjnllwruX19f7P/GJ6q4XihZ8rfCQK9jOXGEEswSMIiSKCV482ACd4hwI02zSsicA1Cwvhg==
X-Received: by 2002:a05:6000:2289:b0:39c:30f7:a599 with SMTP id ffacd0b85a97d-39d820f7f4emr1793514f8f.18.1744096674126;
        Tue, 08 Apr 2025 00:17:54 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2adf:eaae:f6ea:1a73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d5d1sm14257694f8f.77.2025.04.08.00.17.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 00:17:53 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 08 Apr 2025 09:17:41 +0200
Subject: [PATCH 04/10] pinctrl: abx500: use new GPIO line value setter
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-gpiochip-set-rv-pinctrl-part1-v1-4-c9d521d7c8c7@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1591;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=nW8gbeASZZPGvCfMjx4XcSCJQKXVyNGKry+o6wrAY6k=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn9M2ZVzNUI3VgRQMzfUNu5ztBdbgFOzKCX2cTD
 gqJRJh5fnqJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/TNmQAKCRARpy6gFHHX
 ckcMD/9lHTxFJCt7mJF9tP1pyTVlOFcI4iTV1L1QK53z5FW2Z3SMIbsg/WP0Ox+KZTEQhQIH3rM
 wwqGzcFbxbursx8+r7+ZvVqkU4QZIBUyACF7u1pek1/n8JBWnexyzkfimQ/4dv84Mg8fblHxX6/
 e9AxG0M296lr/4pAiXZ1OD25/6m9fmgaetnGniuV57A4pLBJe9hlfZ2YzB5mYUgkf1H//Jbwa+A
 6XaU8J7I4WJxHP8tl6QsF4nWHGmtgm2fhT82RFptXXjqk4O4soM7AG+Ss+tjQK6UQz9anNLU6Lm
 rmqduN1o+po7YG+d9QycugTfQLY+ldfFNdSba874x5yFE0yN5u6hWFUlf7kqCSA9/ShGC3h1b1d
 P3SrzAAp/KzpaZ0qz4k3uHr8AWzjtoebNiQLf0np9Rhj6QlsXMPTjpRvO8qu6TwbjgMUVwXs+ML
 LAU2zu2R1fixy6aGTWSrsqOHHB7OOlUsUa2Gx4LvWVk5suCmM1xbfDPoByv89XnsFLphWZVxUvK
 aJGTZoxqeRJVCy+Hfx8X9v29LWuxTlLQC6oNMkvVpk9Pycf8fKsnjpKqnwNQ8Of16WN8gMmVTAb
 w4ONrOgUNVqfGiBiUJqcKD1U3JafBOwIdNX7SuEwqraaSC6bMhiSiynASp0nnYhkZEAuJMLEqV9
 8aWIUWj5E3JEMig==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_001756_316582_54F1C6E1 
X-CRM114-Status: GOOD (  12.82  )
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
 drivers/pinctrl/nomadik/pinctrl-abx500.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/nomadik/pinctrl-abx500.c b/drivers/pinctrl/nomadik/pinctrl-abx500.c
index 8cd4ba5cf0bd..2f55f83127cf 100644
--- a/drivers/pinctrl/nomadik/pinctrl-abx500.c
+++ b/drivers/pinctrl/nomadik/pinctrl-abx500.c
@@ -167,14 +167,10 @@ static int abx500_gpio_get(struct gpio_chip *chip, unsigned offset)
 	return bit;
 }
 
-static void abx500_gpio_set(struct gpio_chip *chip, unsigned offset, int val)
+static int abx500_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			   int val)
 {
-	struct abx500_pinctrl *pct = gpiochip_get_data(chip);
-	int ret;
-
-	ret = abx500_gpio_set_bits(chip, AB8500_GPIO_OUT1_REG, offset, val);
-	if (ret < 0)
-		dev_err(pct->dev, "%s write failed (%d)\n", __func__, ret);
+	return abx500_gpio_set_bits(chip, AB8500_GPIO_OUT1_REG, offset, val);
 }
 
 static int abx500_gpio_direction_output(struct gpio_chip *chip,
@@ -540,7 +536,7 @@ static const struct gpio_chip abx500gpio_chip = {
 	.direction_input	= abx500_gpio_direction_input,
 	.get			= abx500_gpio_get,
 	.direction_output	= abx500_gpio_direction_output,
-	.set			= abx500_gpio_set,
+	.set_rv			= abx500_gpio_set,
 	.to_irq			= abx500_gpio_to_irq,
 	.dbg_show		= abx500_gpio_dbg_show,
 };

-- 
2.45.2


