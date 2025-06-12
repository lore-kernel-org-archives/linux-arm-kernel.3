Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADF30C71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 19:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zmZkKLxN2UmLakt+dPeotcVOQqoR98FTAzfeh6JlZVI=; b=acQ3s1rdDuwFbqh3Oz8wBA1fX6
	ddJh8IY831yhvn1xc+qthj6/rgQfD5SU1yL5r0LKjvBb0wGTMTD74RZps3Wyp+1AQiqm9yjkHnai+
	5MrDTstKu274RDdRNQ8T6/x9MZyCIrODHh6LOTtGplqZ7RQAt8hDZroKdQ9E4CL64qmDGupBcYnKK
	pxM322/OS1wqK/HWV+y6v80yoZY2GLjdQxr97OfoHfzKE5afep8YqOYusizgcjAkCq4BUXbOh871S
	H7EdB5n9iSjLhGGyxJDUZmenZGkAG7gquvPMHmQ6b0ba3uKTKLIgqhXFriBywu0mQ/fyezXIOD2rM
	gJLEVqLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPnn5-0000000EDvW-3y5C;
	Thu, 12 Jun 2025 19:40:47 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPhm7-0000000DLg6-2gap
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 13:15:25 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-450cf0120cdso7891225e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Jun 2025 06:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749734122; x=1750338922; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zmZkKLxN2UmLakt+dPeotcVOQqoR98FTAzfeh6JlZVI=;
        b=xF+v9Ap4+pbvUoxwuakSGdKkl7Lz+s4T9a6ENRmJTKJgf/qHhGXsJbq2cmA1JwqYpR
         2w3JSBNG21zVC9A3kx00c9If3KZ+RZJnyL6xPXS4fjj/x5tUsE95jpvxDdpDmIHOn6Lw
         Do9vKpGuppRmCxVfsFqt5TAY5kaw3AI99/mvh8mby3smpbBxTorBKNs+PX+mqYnEq9Zp
         bzobzFcHOii0X7S6H6a+tMJtr3+OPmykcgUv0Yg3hM1q3mTUEsEo8fK3eTzZknoQXOGk
         Am1+oZ32mxZs7Ekdycu5BxRF2+JsAJYlUkl86zsLTgIwI29g4ibHoBZ6vBRIRBUrWSNa
         tZjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749734122; x=1750338922;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zmZkKLxN2UmLakt+dPeotcVOQqoR98FTAzfeh6JlZVI=;
        b=dAVaMJot0TYhtNPV1vr5cK/qUHUevrrZiK4MnAh9lp7B/aCoIlMPzfbdP1GXKfz5Kp
         keKgqLiuWE0TaltTQi7Zc0rg0NZ7I9d7mKZ5sgwqUlOv4M/vf9KGJTpBrrHIOYdYF4J0
         E9W28anFgCbsf/TzMzK6sGmpAzWDtI2tRScgyNUj4gDl4LQqP74JdQBJbO06+nSSQHXh
         /3VGBY3bBUyTE+6aUzE2wrRFb+qjwTUgTUhwg0vkCGjxX6/uP915h7E8GS88An9skBE7
         oS5J6MpA0dvmEgEzxwwlbqTFHdYuSUlOf5k7fgUw3tIQkKzWbWgh7UMQg7Y7+LlNJ1GC
         5H1A==
X-Gm-Message-State: AOJu0YzeAYdeCZbnnWUwlL0EZA7TBeCxWSpwVquRFsF+GiWboo3EJSAc
	6fCJCmU6HbSrqdZOR3GQ+nKdSP0tE5NIYNQr0OwUSMuYeaJKSC2uQqS1BuYkujB2yQI=
X-Gm-Gg: ASbGncuLrUYCuZeyfw9DvruukoFnMKlFnGk+GPOGau8tFifu1TX3vGmDm27kapGoQ2G
	SxwmnzrkAPmRtr070nl3U4FkGM25nB4Ra2wqxeEeDgv51lMZduPkFAQDUy6gG6jeOBEEzYvKwpt
	de4lHtrxP/HHU346aiCixr5Nqan6Xxeve0r0ym9hSMXpCVQ1b0occsN5MaGBYPKLuCK61YlQHNL
	ztszCDph7BXkAslgEoxgwW1mWQP4RdzUgaeiiUwMeG4QVFFN4oaDSHyljjcNsodWUgBTrMr9062
	+xYNHQUklJ+0ZwONNEyKQIcfdga4vGxGB+wW3QtwRpJuJOm9ZD/YFhU=
X-Google-Smtp-Source: AGHT+IFdr6eiKmLNU1U7PCiAyyEcaNtod1q+PU6cBesinlO+7E1MRjBPyMho7YxEmPTyFNNlQJ5EIQ==
X-Received: by 2002:a05:600c:c16a:b0:450:d61f:dd45 with SMTP id 5b1f17b1804b1-4532d37700emr31586985e9.4.1749734122088;
        Thu, 12 Jun 2025 06:15:22 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8b99:9926:3892:5310])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532dea17d7sm20619795e9.10.2025.06.12.06.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 06:15:21 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 12 Jun 2025 15:15:10 +0200
Subject: [PATCH 01/16] pinctrl: sppctl: use new GPIO line value setter
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-1-556b0a530cd4@linaro.org>
References: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-0-556b0a530cd4@linaro.org>
In-Reply-To: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-0-556b0a530cd4@linaro.org>
To: Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Support Opensource <support.opensource@diasemi.com>, 
 Baruch Siach <baruch@tkos.co.il>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Viresh Kumar <vireshk@kernel.org>, 
 Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev, soc@lists.linux.dev, 
 linux-sunxi@lists.linux.dev, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1728;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=LieHmje5ivI5luNfORERBIvPNT4Z77mh5n845VHvScA=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoStLk4RH7GPVp8SssQRxQJp6gzZ2YETuVm14Kq
 ofe5DUznf6JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaErS5AAKCRARpy6gFHHX
 cr/lEACI6ET2WlvZ9cyQDzGwOdmiCfZct2usLbI+rS53HlFtmhOQcNkSmaUGnwVPfPHX1OKG7u8
 dbqcNZIdDG6lrAjwrodXYH7a1vrgYl4fLrudzgfzXyx/pyT+4NJZvRWfprR4w4TraR6/W9iQzdO
 wP3bL6aoNjJQjxz3P0ey6wN/zPuvQJaxjAh+lJDMEFh8mz5P0UDMZ4D66yIKi2Cm6Ea0xZgGJyR
 KJOGz4mct+SIxm358x4VzGpQckl5dZF0hqK3CfjD+MAe595dVdFJ2m9NghpyjJV+xYYUrA/tl6T
 yHMxNVVaczWBNyvrynetjzEFh0LHJ1lK3woV+mzoiFeXT5PaWXJBhxTJeXBSdXAs1EdF5DWjeb3
 gf1xcSBfd9eqV2bTnSYtjsgobI3JYLTeFl7LT9h9GtJ4HfD39BuzyA0Ss0+ZAkP+0RbhARTf8Dd
 LNOqMPmFirJVka+ELdb1qNf56x2cFpRETLOdZ2OtNsAS151YAwJDiLLKBI8FLDvUqxbNK1sST+S
 4M6hYV9k3URKnrim10RgFTxPcQrCuW5q62+1mTRUjg7XxpIUlrSdX6TtvPqWmtMoY1zM71OwHl7
 f4ZCx+47It/Y0/pIQzZWm31bgsmNv2MW2oIhK/1QHFPK/JDVZtvJPYUtr8AXF+ZEHgJcPqFCZ8s
 MScuhzi/9MgLUwQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_061523_686118_02D22049 
X-CRM114-Status: GOOD (  12.88  )
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
 drivers/pinctrl/sunplus/sppctl.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/sunplus/sppctl.c b/drivers/pinctrl/sunplus/sppctl.c
index ae156f779a16b8c4bb91c4cb0d5d4363ebd15d25..3c3357f80889a95c46557b3f8129882d2ce96f6e 100644
--- a/drivers/pinctrl/sunplus/sppctl.c
+++ b/drivers/pinctrl/sunplus/sppctl.c
@@ -461,13 +461,15 @@ static int sppctl_gpio_get(struct gpio_chip *chip, unsigned int offset)
 	return (reg & BIT(bit_off)) ? 1 : 0;
 }
 
-static void sppctl_gpio_set(struct gpio_chip *chip, unsigned int offset, int val)
+static int sppctl_gpio_set(struct gpio_chip *chip, unsigned int offset, int val)
 {
 	struct sppctl_gpio_chip *spp_gchip = gpiochip_get_data(chip);
 	u32 reg_off, reg;
 
 	reg = sppctl_prep_moon_reg_and_offset(offset, &reg_off, val);
 	sppctl_gpio_out_writel(spp_gchip, reg, reg_off);
+
+	return 0;
 }
 
 static int sppctl_gpio_set_config(struct gpio_chip *chip, unsigned int offset,
@@ -545,7 +547,7 @@ static int sppctl_gpio_new(struct platform_device *pdev, struct sppctl_pdata *pc
 	gchip->direction_input  = sppctl_gpio_direction_input;
 	gchip->direction_output = sppctl_gpio_direction_output;
 	gchip->get              = sppctl_gpio_get;
-	gchip->set              = sppctl_gpio_set;
+	gchip->set_rv           = sppctl_gpio_set;
 	gchip->set_config       = sppctl_gpio_set_config;
 	gchip->dbg_show         = IS_ENABLED(CONFIG_DEBUG_FS) ?
 				  sppctl_gpio_dbg_show : NULL;

-- 
2.48.1


