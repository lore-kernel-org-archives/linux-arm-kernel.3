Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7B9EC7115B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 08:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j3425DJ9smVNqtgfiewFDDuDZUIYNH7UVu89t2el+0A=; b=NdfmwdUDX+k5nUQ3yYbpHqh7Rs
	V5R8yalWeNkl3jMNXsI+CZ4HyYvm9pg+R5RCo7RJm19/n6piXwpY7Q/uE8yJWlAbRiVy6B9LNMO7O
	GH95clsf1wK000o1bKnflKsYHq4EvmQZAbvJMCOT6t7wNaZYPv9W2xOV3UHawMBuJ4x0CYs/FFWjz
	IfJC2t55dgjOH9uEXEytHWjnIwChqnRqVDNewngSUX4NwqiMrVTXCtdlaotlNe+In2EhQzCdLv0Py
	/5fkMc+S8VGPTq5xEejvCYpJH+Ul04sJJQvxUt0+pNBwKHyO0go5wjGx6W3R+EQaDykLTV1Ia4Fu3
	ZQDnPrCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSB7d-0000000CWtQ-1Jfg;
	Thu, 19 Jun 2025 08:59:49 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSAiC-0000000CRHX-2QKM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 08:33:33 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-450cf214200so4411345e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Jun 2025 01:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750322011; x=1750926811; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j3425DJ9smVNqtgfiewFDDuDZUIYNH7UVu89t2el+0A=;
        b=Evz+mKmeH4TFvW2LovsFVE6S6GfNBj2l4OLQQi6zOTrDFT8Ol5oNbg1BrKx8AqNkcS
         NeTRBJy78/F974lImNF0Dl9X+z5zitrmliS8yYWOO4EYZJuoDENxg4JdNp8TzSmakzok
         hu+BSsA7iTK9am/I9aroQqFOgxLLW4uX81piGvdpXzq4M2+bYUH2LoVfjthHl/EcWudh
         iCP+6JmGjdPVZ6ubZ/rkew8pX/hfR6kiRZWtHlTQ/f5Gxh5wXg7GWquxHsL/fmt1Kfin
         3nZoz/5AqnZ9fKg3lVYAlwQVA5194FR6+8Z/V7iTxDg8/peSCb03ftbnS2ZgchmPCp+L
         4z1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750322011; x=1750926811;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j3425DJ9smVNqtgfiewFDDuDZUIYNH7UVu89t2el+0A=;
        b=UvoeC0xvE/p3RvJaerWVlx1dELmEg+lPhqztsoqcWBBJfPw7+9x0kw1lJOl+E9ty0S
         rWt0mTM6rcxyBWwG0tSXVFXHbghlqlcCdG+99GN9Qwu77YoMixfCr7ODdufWGapV9z8W
         rP7j/UViOlH1GkkBfhMyPDJXc13jVuLFa4qXUuE+w0t1B42JjXJR+gVMLtBGwf78zdoA
         IIN3ujl126vhAwA5gCASczD4ppWAEUmIEdkzKTsq53G+Yo/CHAda86Y9GeKoIPt7syyE
         jwJbG6vrXcIUoReChGGd76TPvbZhU1OoNLt72DCFE5T1JpHS1KzcIAnNAatAeyciymEz
         R0xA==
X-Forwarded-Encrypted: i=1; AJvYcCUQXpR0hORkf1cph6YvKQYYotuJ+DVC5qPfIqV43W2drkfnzyHOymF2Lvr1tIEqzXKgZXkxFiTtSbWa5qVhtWn+@lists.infradead.org
X-Gm-Message-State: AOJu0Yzjt4/ww2iS5N4GUHTJvsvcYrYd8+Z/ymo8rZwwS41FIksEzrls
	XkNHdeYzeCWWDqTN8GpQmABaOGTo7Pt0bvowcAiCbVGzvyN+py9JjHooFYaRt8AaTPE=
X-Gm-Gg: ASbGncsr6gcBSWuaPHSoqUcukIIquWzFAEtb/W3nVYSJfT714MgMJB2tLivq4YF5xUY
	EPiSgnkV7I9PV/fc+6vdJ9EtK5hPpRqBBc6k4pKg9D3mrZVVHHskUzq/LMu2+mEqcgzYNvp/c9V
	Ub5YJw4z2OOSazuJ1Td+wLoLL1Y4aPuQg9cWtpAMab/P1X7mXyGcxLvwdfqAJjVTn2k28tUJh2c
	3gMimFwcUy7Zb7KxX87y5wASr/gdZ9qfVwDZjg2hz/FISkaHS1eh+Nh/C2ZNPLovAxtniTcHTXa
	Run8fOwhvRiUy7+VStQppKnMGOW48HelNwP8Xl5OG3YShiucpfXFKQagBuS9HkkHv+M=
X-Google-Smtp-Source: AGHT+IFrsPvQBcfdGkjODy+e3yqc3AHlIahKNReGa+rvtx4ektz8kpZyRE1e3BB7ON0JDvQ8oJpUfA==
X-Received: by 2002:a5d:64ee:0:b0:3a4:e75f:53f5 with SMTP id ffacd0b85a97d-3a5723a26f8mr17708250f8f.35.1750322011048;
        Thu, 19 Jun 2025 01:33:31 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c485:fe15:c9ab:c72f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a63a42sm18828151f8f.28.2025.06.19.01.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 01:33:30 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 19 Jun 2025 10:33:18 +0200
Subject: [PATCH v2 05/12] gpio: pmic-eic-sprd: drop unneeded .set()
 callback
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250619-gpiochip-set-rv-gpio-v2-5-74abf689fbd8@linaro.org>
References: <20250619-gpiochip-set-rv-gpio-v2-0-74abf689fbd8@linaro.org>
In-Reply-To: <20250619-gpiochip-set-rv-gpio-v2-0-74abf689fbd8@linaro.org>
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
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoU8tSNZDHMC4DZ4e94TG9I0QxUTJPp/knIHoLZ
 ngpzNeMrj+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFPLUgAKCRARpy6gFHHX
 cs7tEADbq0rtKcu0CtpTMbhplPaVXYghftiJVLjNx9ls/h6bpBkGrExc9GChQzG+Q7zhbcHnD9u
 C2jZn5ptHvOH7heEQ2vVjh6YD9YrwGECInonaAld8CaKlF9li75bIAu2EIPmnGHnkoeb9y9ejQq
 NUgqfirWA+Vn89x8JYkZ2yYQGn/kYHWSYvjad4y1//nWPlTQsQTXozhafHv/sEoqUlHxI1677x3
 jIxA8nZMpg+TK+DfjalolY+tMbGti6RYt/AYwK7k+OCERsizg+3znNQDgpF16dG4P+duDRsFTPN
 MTuBU+/nvuDmAsfzReY7qlQEGTMvKOap5VGUx2LAXRomlj28hOomYjrSVdQjjJIBgWiArZj57lT
 pIQVrc7vIj2UEAEmDBU6x/vJ+Ap7UpYTduZukAh+BNo+3g8RxfeW9DOcKE7HWjHODvU0Q8SDkVc
 vRkO4k+tvkcc/5lMLF0IalPGBX6AQCDCHOo0b9GoXWVdtsix33EFG9yqiQgu4C9PDP7IcCZfH7A
 K6MSIE73cXim8CvXAXfIpI2/PwV3RCv8jF1+NfxrIApruyfrgJb5uM7HA3n8LgjwoS+ZkywcvDW
 qnUfQrtyAii6SWW9aBhPa+wAwsHcGbgR/x4Mt7aS9QPZh3OKG4KVP3pWFxTBV80w1DGiFHsor0s
 +I4VtQeCui/0NNA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_013332_623764_85C04456 
X-CRM114-Status: GOOD (  11.43  )
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


