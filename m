Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CD42C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 07:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dhsKsvAkmlFqPDEeR+UcQMmg9tdoZDeEXP7FO3A/Ni8=; b=GVpHsuq9KxO4m4D7Rs48Z5/uKG
	+SLzK0ABU4Swb8KctUDJrPVs5+0tRmWIlvMMGJtzUnZNYHbXeHOmMNLo3JX79gHpexhcFwaJ7209A
	TxJVYQXODG5wEpLXzvJJIsaVrh1GXj9lJ6RM2wpy6GCypgctGFxXtV1G2wv9oD/mdIWPD2X00fSr8
	CN+/tfhN39Fjn1TgC3gqWqVSkVc88nRE1aN+UcPx/4j9C1kvK9c6/D6g84Kbe2q0j6dqrmIjHSRKZ
	l5ZXn5Cw13qBpV3u3mX098xLow1GuDVPOsV3/vzG1PvwKLsqDWinjQgl663uh4yoUc2cKJzsRLEQV
	fxdQs1YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZP45-00000007n6r-1BYc;
	Wed, 09 Jul 2025 07:18:01 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZOVh-00000007hBA-0vsI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 06:42:30 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3a6d1369d4eso3080444f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Jul 2025 23:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752043348; x=1752648148; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dhsKsvAkmlFqPDEeR+UcQMmg9tdoZDeEXP7FO3A/Ni8=;
        b=wLfg0h3onnywuuW9o2pmPT5QRei8SiGVAwa5kiww4agfKE/IxROzIqkp8e2LVxm3Ms
         8yJ7RNgZQybLtsIqa81KoUfP1Jtom+QAVi6Do6hHqexSg7JMLUCmXAiAUGAFZjPRcsbu
         ZyE1dLxZjW4Hr6J1dZDcKTfKPT6hu1JqlgA0cwbO8cxlts8pnYlKUWxnRiEkstubdLWv
         lkv2rMx6rUFVPlR4+wqqpyVWw8yH4bHnAPJ5dIQc6qiKMfQdeGEiTADKLF/CtZyTilEg
         xWEO8kzMgjQ2rljR2cBEB+gHLQQl2QPeQMPSB1NfL5kNYGBV5vW8BH3KuusZNJOJ9Tnr
         Qvzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752043348; x=1752648148;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dhsKsvAkmlFqPDEeR+UcQMmg9tdoZDeEXP7FO3A/Ni8=;
        b=ne7BkOtcZo3dLbbJf9S9+FO55A4mDq+SI9xS8vmfWQivA/A14G3qsvWM5WyaSUKtvx
         0cFFaiUMCT+pXLBQD2F2jL5CS00H4nmfThNxbgDyxnaJxN2U/eW2e/1YuYo5ZhA5DR1L
         HUaYq5ClGGUMxb1RPgYyM/8NFHOHXkkNqIcCZeBZ6jh+6C/da3Mk6YX7GRUSzi50ZzI5
         EO7BvvTLsB2OjZED2UxOa0ZahL2h4gzvje+/YP/rOobJaghKiA7upymuJAHT5GA/aOr2
         c5Fk3IPzW1W2hgRqgQFcMajtiQYr9pKd+D63alW4sT9d+fV90ojMWyyRkBUdA2AfpLqY
         USvw==
X-Forwarded-Encrypted: i=1; AJvYcCXA0rzkWhXLIxzhkLp1VVvCS8CzRqisVI1D+zzaz7bWtgfPbLhJXNLK0cHxsGP3Iii0JjJDRMob9t/0lotCzQwb@lists.infradead.org
X-Gm-Message-State: AOJu0YyuOBdp3UWqulZyYsbAd5YczBsVxkQbkBACbSdrhN/Rk68b1N8d
	Vlm+9D8rdGRsp7evU16DX5yleKOa4U8w2ZoAtzqdPOhAORKkAkN9kDpLGMCNJ8cNJIk=
X-Gm-Gg: ASbGncs5NhU3x2cJtyi9Ux1pT3DdSLLdlVlyLTMFKdn2Miga4QsRtJriy2+7DQlIEFQ
	Hf6Pal7/b5D8XUYc473QW3XLmYl5iBRMOMQljKhQPwc/JsHYR30NpATfC5VVYEWePJBohIK9PmQ
	s+8ABFMEAg6rZIouG0vUNt/0uVLvpWgPyJG2b13KhyOpznu3JaHTqE9fdYwxRaFFU9vwxuz/rs3
	c84syotuZgZOoy402sRLiVjivoFLHIXrjycRvN6lw8C6EKcpsZ2Xc4bA6cJcCJ2ngB6BEfacdRy
	4KBbGw5aE0d2CraArxtSwrfLMteFyH/IpUdyQYZDPHJdndpgHSD4J6I8
X-Google-Smtp-Source: AGHT+IHvpRwL4gyNcss4buc5DbhMISzynWRKsNgohlceWdvTYfvFhoREEpevOPy7ECuUPWfEmr8Qgw==
X-Received: by 2002:a05:6000:4387:b0:3a4:e4ee:4ca9 with SMTP id ffacd0b85a97d-3b5e44ea0d1mr816440f8f.23.1752043347689;
        Tue, 08 Jul 2025 23:42:27 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:b04e:cfc4:3bd9:6180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47030c443sm15115341f8f.11.2025.07.08.23.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 23:42:27 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 09 Jul 2025 08:41:48 +0200
Subject: [PATCH 11/19] gpio: xlp: drop unneeded ngpio checks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-gpiochip-set-rv-gpio-remaining-v1-11-b8950f69618d@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1526;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=kX7w+JHvWpXIE/MJI0TmNI75597pjwhk48BNek2A0I4=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBobg9DjfalZzeUGBfvdwiGcfrZ171d4K3z9JFGc
 uxBWTNkcxKJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaG4PQwAKCRARpy6gFHHX
 cotWEACQjbypuFIfdv3rxgS/QD1bm4WGA6KiqvpGj8xTu/C56/kieYtnc7vIzCpcbeScl1T8lE8
 EAitfkS8VLZ6X2UR1nfUyg659eVi8I38KWSCHuxFytaTF9kecqmJ/+OXroJ352In/zKzEFTEfX3
 Rz3WZocW6SdN2vBZaHNUHowmW6h+dRPwrOG9kDgJfduROKO8DTwrUFexaQ1oNahowRxAwiq4BF/
 3Ggo5BU45ewhQpE/xmtKlm1aDtXa2S/xRlfLPlx9aqLeapxAkB5DafjOpWPHkmvMYzjapLiJXQV
 LUEcoCB5t54gENH5mC+sszT2zgyzqGUbWCZDkIRHGji0wyACb1EYl3y6KIVzQxvBySkDL3/B2V9
 eaODg64UDmLTuxh2KnbJU7/opDLQcH+N3h6+2p6YJtwxaFajmW4YLmocqVWPdzllnZqEBy1Mycs
 ao8riuFbfo0wZigCrF48i/d7I6Q2rI+dFFY5TDIlg/OUpz70d+Ruw8SZ2K5YioyWR6ALBTnFG0V
 +z6JEUf9RhOwjc4YAra6bg/uJDbnNlRzvRwsadNg0w1tgtsyS8CAkQKJxi8Lw2jcjxxjAyNlhEQ
 P83OszlX+c6c+eM2yrfpeHs9l970j8D0wETvrH0O6EvlBpH1noVcT1+Gd9Nq0nyz2PUOIrqdVSs
 prGuwSQDyS2j30Q==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_234229_323667_409BEE4C 
X-CRM114-Status: GOOD (  10.99  )
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

GPIO core already makes sure that offsets higher than the number of GPIOs
are never passed to controller callbacks. We can remove the unnecessary
check.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-xlp.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpio/gpio-xlp.c b/drivers/gpio/gpio-xlp.c
index b4b52213bcd955c3644b4410c2684d77951f03f2..35b376c73ce312df1312ab09b53246fb5905152a 100644
--- a/drivers/gpio/gpio-xlp.c
+++ b/drivers/gpio/gpio-xlp.c
@@ -206,7 +206,6 @@ static int xlp_gpio_dir_output(struct gpio_chip *gc, unsigned gpio, int state)
 {
 	struct xlp_gpio_priv *priv = gpiochip_get_data(gc);
 
-	BUG_ON(gpio >= gc->ngpio);
 	xlp_gpio_set_reg(priv->gpio_out_en, gpio, 0x1);
 
 	return 0;
@@ -216,7 +215,6 @@ static int xlp_gpio_dir_input(struct gpio_chip *gc, unsigned gpio)
 {
 	struct xlp_gpio_priv *priv = gpiochip_get_data(gc);
 
-	BUG_ON(gpio >= gc->ngpio);
 	xlp_gpio_set_reg(priv->gpio_out_en, gpio, 0x0);
 
 	return 0;
@@ -226,7 +224,6 @@ static int xlp_gpio_get(struct gpio_chip *gc, unsigned gpio)
 {
 	struct xlp_gpio_priv *priv = gpiochip_get_data(gc);
 
-	BUG_ON(gpio >= gc->ngpio);
 	return xlp_gpio_get_reg(priv->gpio_paddrv, gpio);
 }
 
@@ -234,7 +231,6 @@ static void xlp_gpio_set(struct gpio_chip *gc, unsigned gpio, int state)
 {
 	struct xlp_gpio_priv *priv = gpiochip_get_data(gc);
 
-	BUG_ON(gpio >= gc->ngpio);
 	xlp_gpio_set_reg(priv->gpio_paddrv, gpio, state);
 }
 

-- 
2.48.1


