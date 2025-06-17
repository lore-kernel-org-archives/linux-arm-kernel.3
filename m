Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81014C71157
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 12:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j3425DJ9smVNqtgfiewFDDuDZUIYNH7UVu89t2el+0A=; b=o0BxsVyBZaAuHf624Q2qGeYgJj
	GIyucaCu3FK0RJ3GRlWfN1ZvhQR/QuVIPVeZcwpWCnFat53kPnP1PjQ67iErE4YZeL8VcnZx8pS0D
	bQNwftmbzYhQN0UxJ+rpXWM0Duct09hCdb9QfS1azTSBpdgzFtEZR9ZYWgYSs3F9p4Qplgm4aPdDz
	yDtyUL6faKSQqx60xSZjCG6iBynuYalGgwTLbULlebdI4u13VGGHdkdS7usiy9Qsdi8nKNCeriysV
	3AVN1r9zlLenXi1RPcDj9yRlTtAvYnriFQW/b5RruqOvB3x5QPbUqUKU2Gcsr6M7EPnAc49UeXAtU
	HReKUvjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRVrx-00000007Fs1-0jL2;
	Tue, 17 Jun 2025 12:56:53 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRVMu-00000007Az4-3CvB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 12:24:50 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-453398e90e9so30310665e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Jun 2025 05:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750163087; x=1750767887; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j3425DJ9smVNqtgfiewFDDuDZUIYNH7UVu89t2el+0A=;
        b=H9KJ0V2PYWA39wezTJDRDk6bjhzGaqHB9a27lB11rMcLHHGeRF8Dif5w7ObepW8oaW
         gNLnw1LK7asbRk3mJ6dPR4Bd1/YHwQvL/FxpBxNPruwZNIHqbq/8UQO+bwRbDnv4jxBH
         BnPkupwPRn1vCSDkNChpnpEvOnAaJKrZSXjzPFyXp53BZOmAscammjV55TYh5QW8OPjT
         2SitqWeGxZKqIuDsAOA+WrE0gaVC3ERrAWoQoAZ62nNxiNGgwN2oPcZfgyWkjAIP9r/j
         oNXlQ8jZkGHHsrR+Nmu4mEnpiIg9safd2u0DRNgAhEgTyHAX3H6IoXdRj2qyiQa47CaJ
         wS2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750163087; x=1750767887;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j3425DJ9smVNqtgfiewFDDuDZUIYNH7UVu89t2el+0A=;
        b=SlH1ICkoFYpjQpIFmcouD9gBBxkeUBVH1GeTwldaRZ/XZB4STO2WlJrAcKj4rbBGwo
         TciK9HwDkgPIceO809bITdZ4YP6SdungBtonbBmrtkb1O8hjfoBDJDmGGPr8CyVPBptD
         mdJoWjurSt1l0H1a9S+wIossU0XQM1rpz1EhPMklnHAOfdGZDAHKt3gsGa7SulYn1uzR
         enZIK/4Jta5C0m218kdvraQAEKkPN601dmtXwrgFzfcANyC5HPtZoFdFcw/+PwOCLfVz
         WR8YRw2utY6GRUN4FuZuQQmFuW0MrgxpdpHSXJoWAqXMZYEZDbEA93bOF9xyuqdaP1LE
         lPRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsxU/cJGOt0V/HruBq3ES9bIpw5E2PGdIC6szSzmy0mvdSzsD9zeHIFbu1K12eQp1J+pDVdQm7uaxvDsr+ggej@lists.infradead.org
X-Gm-Message-State: AOJu0Yxm6Ayw14LJshqYWuLuq5GaspbbBcNLY+d7wZn+A2fw/ILCVJTu
	3jecjYEt7skCOcd4GKZss8ixDz/yZYqxf+UU8Jk5JJqWNpXgQZRQCRsCcBzq7jegPkw=
X-Gm-Gg: ASbGncvniOT7Y6rdV9jvMf0CUv7lsu2VUqexIgmCJAUnS2nDUKe/OYB7pOJPzyr/kVR
	WstOQCktXedY1nzM48hhR14OpaB6Huu2PkywzUBUt01gS9e1V37TBGb5Nv0+YvsbgQk+4pApMTJ
	GNrqtgV4PIYxm5bjSjRvcAmO7iHK93IZpewLlqGFzK7mJyeaFdCffr1xy1TUuW0nk6MJVeHwZcE
	Z0NS9vQhKWXvd/vowk7pMrdc7xMDtejC+xF1HF2hH18kheienxWpgJrqh9ipdzWGEsENagVNSY2
	iXK0FmRLqvhf4VgTk/HNzmpvl2UAmhHQYogp91W8GsouR8sqDb/s4vFH3UjmxXlQSYU=
X-Google-Smtp-Source: AGHT+IFSaiKVtjNdh8JpqeiVYaqMnisnI6PtZWZir+IMOwFShpzWggv/UUCBrlgK4mkCKC+HFcgJ9w==
X-Received: by 2002:a05:600c:3513:b0:453:a95:f086 with SMTP id 5b1f17b1804b1-45343d2c0c4mr106531565e9.12.1750163087329;
        Tue, 17 Jun 2025 05:24:47 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:90df:ded7:9cbf:4074])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45320562afbsm173816135e9.1.2025.06.17.05.24.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 05:24:46 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 17 Jun 2025 14:24:27 +0200
Subject: [PATCH 05/12] gpio: pmic-eic-sprd: drop unneeded .set() callback
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250617-gpiochip-set-rv-gpio-v1-5-903703881fa2@linaro.org>
References: <20250617-gpiochip-set-rv-gpio-v1-0-903703881fa2@linaro.org>
In-Reply-To: <20250617-gpiochip-set-rv-gpio-v1-0-903703881fa2@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Robert Jarzmik <robert.jarzmik@free.fr>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1348;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=U5ElyLmZBGysFJL9KcblCpbMCuSewiTUa3oGkohc5iA=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoUV6HxHcn+27NvQvfcxrQSoAF+rm4EBXSaiw7O
 jAF5IOHFY6JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFFehwAKCRARpy6gFHHX
 ctlqD/4/gbxk99tyQvyLzHrNJeGi24mjwUKkq1j+sQw6ALbBKzoDHmqfnKqIY8OLsCHbUTg8o7H
 WLpHhDv9MDocmKEc2xnBGqdhca8950X2Yw7bJ14AYGaBSNTk2gbnCqPtgwCxyzlGYRTH2e4qSDT
 d0Cqe9mnV0B6Rrrt5aNj8rKTVyt/J7X7uPyf5GAKS8TGO6IUfeQrCewVvHCaCo5NV9pJNG6ejEN
 iQPSSihfNWTzD6SXCjk70tmDN5zhvZDdNYThNj59HSNoqjfynIzS5ktlk6soYs039DHLCVH45NL
 QT5lHJ8hCpm3bAB3N5Lj6YOARL/YSGhm3r/8VevKOB2pp6aaKrKDSN5WMbqgW2WMo/MuiSEmIsT
 gLFIvF8uOCFS7LarA2OvuO11JjHzqQvEy19zMNxiiQYBsEQpsuufELBACem2g8XBOK+GKNUyvqT
 6MF3nTtT8HvTgNzOJGNQ6y6KlOKhDxOqJmi7ry24bP5A2TOapEP02tSoPwvV3cPcsI2DMzYbPSs
 epODKf1eCc4YqOEdO88F2YeJssIJEhbYYpsdYD1zTNxub2CPsZ0qfXV4Hq7LgR1gJ+Dt4xWWa9B
 ZoQi9CaF4e8a6170SQtMrKrtUuDpeBEPSfBGUNIbYbrFnJM6jvj03wxdzhaNOuGLSSRpHY/MCJe
 g3QUwGjaBa2LvOA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_052448_837284_A3F27C62 
X-CRM114-Status: GOOD (  10.86  )
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

The lines on this chip are input-only. GPIO core can handle the missing
.set() callback so there's no need to implement a dummy here. Drop it.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-pmic-eic-sprd.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/gpio/gpio-pmic-eic-sprd.c b/drivers/gpio/gpio-pmic-eic-sprd.c
index d9b228bea42eec53ba9d0d0945125f530a22946c..cb015fb5c9467484022723910354219e2c98d3c7 100644
--- a/drivers/gpio/gpio-pmic-eic-sprd.c
+++ b/drivers/gpio/gpio-pmic-eic-sprd.c
@@ -109,12 +109,6 @@ static int sprd_pmic_eic_direction_input(struct gpio_chip *chip,
 	return 0;
 }
 
-static void sprd_pmic_eic_set(struct gpio_chip *chip, unsigned int offset,
-			      int value)
-{
-	/* EICs are always input, nothing need to do here. */
-}
-
 static int sprd_pmic_eic_set_debounce(struct gpio_chip *chip,
 				      unsigned int offset,
 				      unsigned int debounce)
@@ -351,7 +345,6 @@ static int sprd_pmic_eic_probe(struct platform_device *pdev)
 	pmic_eic->chip.request = sprd_pmic_eic_request;
 	pmic_eic->chip.free = sprd_pmic_eic_free;
 	pmic_eic->chip.set_config = sprd_pmic_eic_set_config;
-	pmic_eic->chip.set = sprd_pmic_eic_set;
 	pmic_eic->chip.get = sprd_pmic_eic_get;
 	pmic_eic->chip.can_sleep = true;
 

-- 
2.48.1


