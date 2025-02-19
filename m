Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14C77C021B1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 10:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fvFx40Wkz1+EUgvvJu1sZ6LkhHVZr+FyaICn1UZ2ZFQ=; b=kPOk8kExH1p9Rjfy0j3s2i7cZI
	dMg7vsoGNVcf2H7g7/qBDUMQ9LwrHPIutKX2m2JnBf3W/JfcP93TYL0vk0RRvYhzrKFfDHMDuQTOT
	nLHYIMGD3Y7nxFfPj/lpa3nnPQCZ/t5ZVsyh/I/3GoFVOsbM4AA1mxKOMRXx0REwm+wCSltsFWdAt
	Iv9bPrg0SuVEXXk9jHjQrP9q/oSlh2EMrqAWYp4AiIRW5GEvcxxfGyDtL4AcNIViOUVeVE7yu7szo
	RaeKPNlySc8mWymMsh9neWtYR9d+/8BzaPWgH47clYy2XL5xRGL+VOVYda67himz7B/h5kFokSDcS
	NULsNJUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkhZw-0000000CDP9-15eI;
	Wed, 19 Feb 2025 10:45:20 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkhJ8-0000000C9AY-3JtO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 10:28:00 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-43984e9cc90so3825145e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Feb 2025 02:27:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739960876; x=1740565676; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fvFx40Wkz1+EUgvvJu1sZ6LkhHVZr+FyaICn1UZ2ZFQ=;
        b=zhyr5wAV/DsUl4x3rWrjv04qq9qhbSiDurLtWkrfFpr1XnQtrBoIEPvmuS68rAaPrk
         TpdyOjW+l6H/m5b87qn1+7cdvpyWsb4EZGFa8lMp2DpIeJWkEtr3Q0D9SLwPcrJn+0yh
         Q/uRElzIbs2skdXMoGlBuwYjLFaOi7Sk4tSJTy3lMZ8FOGQgGMHbf1eGCBLEseOWNphA
         la/8InqDRypUPiBDSiam7KMheV66aNAjpg8eeBNPvv+Unv5d9KFo1GOPtweJFTvgcLDm
         Jxm14IUv2ncf2WFbcsxAL3G3iDsZMWniEfO2NNwFVoL5ARRqAJdZ3Y43vwfL3KCxAtjB
         WHpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739960876; x=1740565676;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fvFx40Wkz1+EUgvvJu1sZ6LkhHVZr+FyaICn1UZ2ZFQ=;
        b=tIDYqlZ1cVM7uhJE1uYNaDWtRNPUs6UJeWmmlg1isMQAyFJACpROE+aIP5qnXD0+dk
         e0WgJ7nd9ykVw49LCx18Pt71wTPKQ0I4KkPjPJ5OO6HxxXiB+C+tRxtUiiOsdN0PE5TX
         1umaVo69BaQqoyepxm5Cy69vDVvvQqJm+6Qg7LfglCXm7xWyXxRSS1iRy88gZ504dWYV
         3O6V8gEi63tMnUv9S0GvB78qJRbC0w30skBo/sUS0n15sAictkw+n84e775xmngAE5N5
         fPJggvtpEeajCOwpHuDofSkOf7J5DPFMO7bUv7akHp3zI6/iKNfJwohE5w7XhDJXRfpV
         EEaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkqJZn5Ez+vBplPMPiYI/1jGnxAb8N2yjK3Xf3E7FnBe4eBvWj4f4111dofzw6k27XYfu0OMbGhhEMXyZa2adR@lists.infradead.org
X-Gm-Message-State: AOJu0YyTxGFQ9BqntQdCj+UQDFdzE9nxrpXNOKHikwgcGIvxin33K+pD
	DMN4niB4eVwH70ol7/Fa7NnvP4jrHE1ohwqWyTAfZAQXqnDLtqhoQ37D2rx0gAg=
X-Gm-Gg: ASbGncs3Aw6wbr2plktAorI3zZYW+lK4cHq/AN9GnxybHCDdqLt5zZB8WfjFMajOfdO
	otvhNI4vQMdl5EdNTxoeCZ0vl9XFN44jkACH+V2L+272e6awm4gJewjqaiLaGRAKvFvWdTeiBqM
	QHBU7n033HepxsHy/v+fsxF2m0l1pdUAbb7VamPkvPnAzA+EhbyF8KFYDf73XOtDa99JOXH/dL3
	aR0V/SC+5XNZRGRks+MO6ZeCxFGrTGtuAR33ysv11Wwf4K+sQ+SmgeSwKm0KUCcw7p+sE/n1b4i
	0lVqIbpzv89E0g==
X-Google-Smtp-Source: AGHT+IFlkOBpfCVx9q6F8niujWCdyL0EtEeWnSdwbrl7CVR7yKaGyBHih66p6S5yCje9Vgk4wUHg3A==
X-Received: by 2002:a05:6000:1fa7:b0:38d:d222:ee70 with SMTP id ffacd0b85a97d-38f57d93168mr2442618f8f.20.1739960874730;
        Wed, 19 Feb 2025 02:27:54 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:f0ed:3532:fe6:315c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259d5f4fsm17492626f8f.78.2025.02.19.02.27.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 02:27:54 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	Liao Chen <liaochen4@huawei.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Mark Brown <broonie@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-gpio@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [RFC/RFT PATCH] pinctrl: bcm2835: don't -EINVAL on alternate funcs from get_direction()
Date: Wed, 19 Feb 2025 11:27:50 +0100
Message-ID: <20250219102750.38519-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_022759_093531_4B598AF3 
X-CRM114-Status: GOOD (  15.98  )
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

Since commit 9d846b1aebbe ("gpiolib: check the return value of
gpio_chip::get_direction()") we check the return value of the
get_direction() callback as per its API contract. This driver returns
-EINVAL if the pin in question is set to one of the alternative
(non-GPIO) functions. This isn't really an error that should be
communicated to GPIOLIB so default to returning the "safe" value of
INPUT in this case. The GPIO subsystem does not have the notion of
"unknown" direction.

Fixes: 9d846b1aebbe ("gpiolib: check the return value of gpio_chip::get_direction()")
Reported-by: Mark Brown <broonie@kernel.org>
Closes: https://lore.kernel.org/all/Z7VFB1nST6lbmBIo@finisterre.sirena.org.uk/
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/bcm/pinctrl-bcm2835.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-bcm2835.c b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
index cc1fe0555e19..eaeec096bc9a 100644
--- a/drivers/pinctrl/bcm/pinctrl-bcm2835.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
@@ -346,14 +346,14 @@ static int bcm2835_gpio_get_direction(struct gpio_chip *chip, unsigned int offse
 	struct bcm2835_pinctrl *pc = gpiochip_get_data(chip);
 	enum bcm2835_fsel fsel = bcm2835_pinctrl_fsel_get(pc, offset);
 
-	/* Alternative function doesn't clearly provide a direction */
-	if (fsel > BCM2835_FSEL_GPIO_OUT)
-		return -EINVAL;
+	if (fsel == BCM2835_FSEL_GPIO_OUT)
+		return GPIO_LINE_DIRECTION_OUT;
 
-	if (fsel == BCM2835_FSEL_GPIO_IN)
-		return GPIO_LINE_DIRECTION_IN;
-
-	return GPIO_LINE_DIRECTION_OUT;
+	/*
+	 * Alternative function doesn't clearly provide a direction. Default
+	 * to INPUT.
+	 */
+	return GPIO_LINE_DIRECTION_IN;
 }
 
 static void bcm2835_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
-- 
2.45.2


