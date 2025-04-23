Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F6AFC369D3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 07:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KuO8LXLaj6tGmiK61iwiXl1Q+QX1pLUQ0uBHuTCHujA=; b=vbJnMUHyi0D9GTYxqxo6nh7rUH
	0I5nSlVoPOmiVJbLlxAwXSpoura3ThXaQoSC6uh3HsJCYLDaQdhr2LoCdVP8awz0K9DJ4O5tytly7
	n1Tex+/72I2/MV8N15de3Sa4SpkI9gf3rCWmNzvUHNwgF8D0Wg5ihAkd1FRUADPkiEH1wB/7BrHkf
	eBEk5VJN3oGE5XIJC87gbCxzEz0xO7sdv9Vbu+tJlH83Vs0vTrSwmYqEjVKqm9Hqaw+v0kuyRhd0l
	ziD1+ferZm+a7+c5K7m5TmkyxXEKoHzm8nYaKwAb/KF2yyKy3qsQ63Jsp7Un6755uwixB5LI0Rqey
	L2gCBIlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Ui1-00000009YIK-32gy;
	Wed, 23 Apr 2025 07:39:53 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7UKO-00000009TXx-2JSF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 07:15:29 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-39d83782ef6so419670f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 00:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745392527; x=1745997327; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KuO8LXLaj6tGmiK61iwiXl1Q+QX1pLUQ0uBHuTCHujA=;
        b=EG9ND7ECHx59ZQQUJrfUD44zFvIdsyPyTCoV/qJn4KrsSHRIWg9tnSxUMNuWFDU+SB
         Udz+O8QZA4+OZGHcGUqztfk13YpbrSDCHq5C3Br93lG3Hw8UwZhCsTKION6FTuUtvbvM
         W88rRyopHv0DfcMrezBimOJyZ+VnsUeOqWHF0lKzIiUcruzUGnHfjXK2T+vLU/2+65AI
         f5RKxT3jbJQ5KRpYaeyxtFJL1h92Yj14VJD6TGj3XaJfmCRAL5AEESwakx86lZiU/MC9
         2alnFemNW/OgqrftnJQjhSah8gF8AhXYWo/f+JoZMeuGzU6F/NvlPhgS36N2G24+eau8
         PwaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745392527; x=1745997327;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KuO8LXLaj6tGmiK61iwiXl1Q+QX1pLUQ0uBHuTCHujA=;
        b=OiQUejUDIA/BLz1FzdjStk2a64u0uWBwqxcLdhN8PyQM4nacQEiJHhlcRWCzKPDRqP
         FExpDhyaHjoSJ8Bi9EkgZgyotiOzbKbgH25dyzccB0eI9OAVdcCTqT4HXbBn02Rc++CG
         3glcVuy+ez50/AYIthfYsej4H/LRJZpjbthXTh42KSkkuXzhd20ncwRsAi4uj8IQ9Efl
         tOva2EY5/Y2fjKD5FdhOomcQa2eTf5KMu/F4gLFChpB+Y3QkP7gA2+GipzfCodzsQ7FH
         7ZeSxcjDxXKdZDlZi+I1yFeVZELdkLO0fzI2N76b+AgAl42JzVi5ZYu3Nr4FSfrRvKro
         oBiw==
X-Forwarded-Encrypted: i=1; AJvYcCWoWYG8HLSXqzmUmCiXnQi3HlDTQtyTd4I+RVsjfDyNYMhw32mhTs54IGS4NaljBmMJvKoZibs52dXgarFqYByW@lists.infradead.org
X-Gm-Message-State: AOJu0Yxv9+dc765M2ZLngA7TQ5S4aCUN836za+MO9mOE76WNdG8xKdpR
	VJsL3Lckl6Znpuo8+UDNTD4fEcjWgjglJgclNBcaxu6C5S3mFghRXbJ70Eeccw8=
X-Gm-Gg: ASbGnctGmKAvn0MbvZsF8ZpipGnSKyT2ugPwFQqNqoaV5bSc26d2oYs5gWwUgh5ALFd
	cXLWaEBPLHqaRUvXkNzedtZw15pNWaWbG5TEPOebR2B8S36phLGi2HwOd+B0o1P+vlylhbpsfMM
	tNNG+AMI/HaXK0p/OMKZIlRxMKvjuGWuUkHPZQSQI/Lr51uW1FkghTWxP15xfObvNuW64nI8TMY
	yPTVsVFQmdpXa9U7H6UlmmmDukApE60ZcLQiJqpWBE/mBGhcwVRo5nzlnAXvOq1u1rgXSr6Tyfm
	zOf4csrS9xFtsvVqrI1swoTCYViSpmq0wg==
X-Google-Smtp-Source: AGHT+IEJRBYVe9vXo1X/mEloHEs7WsK7MXg+lLpQw/AFSEfrHU1wIu1UQhzy4bP2erJ227bIHP3Apg==
X-Received: by 2002:a05:6000:4021:b0:391:952:c74a with SMTP id ffacd0b85a97d-3a06723a77emr1339241f8f.8.1745392526817;
        Wed, 23 Apr 2025 00:15:26 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:74b0:71bd:6dda:dcc1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa493446sm17696935f8f.74.2025.04.23.00.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 00:15:26 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 23 Apr 2025 09:15:12 +0200
Subject: [PATCH 10/12] gpio: loongson-64bit: use new line value setter
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-gpiochip-set-rv-gpio-part2-v1-10-b22245cde81a@linaro.org>
References: <20250423-gpiochip-set-rv-gpio-part2-v1-0-b22245cde81a@linaro.org>
In-Reply-To: <20250423-gpiochip-set-rv-gpio-part2-v1-0-b22245cde81a@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Lixu Zhang <lixu.zhang@intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Yinbo Zhu <zhuyinbo@loongson.cn>
Cc: linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1726;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=sigjjIPTEY3ikG0qReuX5eSm0UPDZcBac77WahmCDlo=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoCJOC4b/5tUNY2cHVsO6pHKhqejDv85KHLO6gw
 b2r1E71uD+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAiTggAKCRARpy6gFHHX
 chWAD/9un4OKo68l/qCfaj3bETsvGglEXhCUTJemJZqJFSZuU/K+Qldmd41zqaqM+EkjJpwS2BR
 cy1gvC6hQF5drLpuYsUOiQGdjyoDKrNObRhJQmnC2IhOrvyu1bUPl81+e4j+lvq3tIKqM5dtgZU
 9zgjBrcKB2gTl8SHuyLswt0FYgUshgyLQ9O4McyxSF4diZjdC+5c2gIhKKtdlhQjZmlBXqY9UWn
 35S+Xm81VR+EzOSPUaTiLS9vvOyg4JZjmgaaaUrsNWf7+tmAUMMg2HwaC78AMqVgIsbfNXApPM2
 +k/535/Cg1jNF76IFdB3/lfiK7P3WLjMOBbPG66lqwMc48NEmKwrkjDSHwdhH7gHqrcy9bB8P19
 wzP0WrsER1d+nNz3P74oJFSO2KDf5F0qkl59SGD0m47YvV54m/byQMrVM0wz9k6+aMOlJjSAONZ
 gyusViuBzXKGErs2QWF7i1s0Cn3gGi/9LZo7UhiTBZDL7aoKLbJCoZjmHoCuQEXoibNzf5lWRo/
 m1vj3a6HQsGSe6c5P3oA6OSFznrzG9HBXR9rRF+5wOegFmNVzy6AdRp6zF9uOcol+30SbMglzu1
 tT37Iuw5qBsxXN0tB40X+ZW/WZ0uOF1Qh+USPi2u062RO8LVv4bLaasO/UGGAuI8v5FJmpgUR+9
 kUvTSREDdS8oLoA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_001528_652384_190BD6EC 
X-CRM114-Status: GOOD (  12.35  )
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
 drivers/gpio/gpio-loongson-64bit.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-loongson-64bit.c b/drivers/gpio/gpio-loongson-64bit.c
index a9a93036f08f..26227669f026 100644
--- a/drivers/gpio/gpio-loongson-64bit.c
+++ b/drivers/gpio/gpio-loongson-64bit.c
@@ -105,7 +105,7 @@ static int loongson_gpio_get_direction(struct gpio_chip *chip, unsigned int pin)
 	return GPIO_LINE_DIRECTION_OUT;
 }
 
-static void loongson_gpio_set(struct gpio_chip *chip, unsigned int pin, int value)
+static int loongson_gpio_set(struct gpio_chip *chip, unsigned int pin, int value)
 {
 	unsigned long flags;
 	struct loongson_gpio_chip *lgpio = to_loongson_gpio_chip(chip);
@@ -113,6 +113,8 @@ static void loongson_gpio_set(struct gpio_chip *chip, unsigned int pin, int valu
 	spin_lock_irqsave(&lgpio->lock, flags);
 	loongson_commit_level(lgpio, pin, value);
 	spin_unlock_irqrestore(&lgpio->lock, flags);
+
+	return 0;
 }
 
 static int loongson_gpio_to_irq(struct gpio_chip *chip, unsigned int offset)
@@ -155,7 +157,7 @@ static int loongson_gpio_init(struct device *dev, struct loongson_gpio_chip *lgp
 		lgpio->chip.get = loongson_gpio_get;
 		lgpio->chip.get_direction = loongson_gpio_get_direction;
 		lgpio->chip.direction_output = loongson_gpio_direction_output;
-		lgpio->chip.set = loongson_gpio_set;
+		lgpio->chip.set_rv = loongson_gpio_set;
 		lgpio->chip.parent = dev;
 		spin_lock_init(&lgpio->lock);
 	}

-- 
2.45.2


