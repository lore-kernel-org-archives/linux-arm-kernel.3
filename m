Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36FC8C71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 19:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ip6lbynAFYtNjOClsW2vFt7aCkU5Ra6KlZGM45oXiHg=; b=3b+cI1/PVaevRbAGtWxOLdU3mo
	DwSLRRQvHPsrBYTRNlt+ExwKYKezBE3sIsWKa3/4tqS+BY9E6Kew0i4GtDvWQnava/OCKsXenyYoW
	fgg6gCH4hZhTRB6UGs/w6SOzSWMFp+vtBCC6fN6GFzgS3DjPZK7m5UlQPeUYYB68eDs5UWrRK5XQA
	tT0eohrxue7SH30oOf72d9oVgPwJ2A7RUm6jbV26782pNysMDCI0FYYFkIZWxyNTWJl5ZMWJODOJf
	9lJOXCsRU2BenLCA7kVzSPesJZRfe6O1L//EMoM62DfniKVIOHpzVXwcL9aa1iMYnlvJ8dQqFz6OK
	iwvfaBJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPnnE-0000000EEAl-3jdI;
	Thu, 12 Jun 2025 19:41:01 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPhmM-0000000DLli-0bhB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 13:15:39 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-451d6ade159so7953505e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Jun 2025 06:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749734137; x=1750338937; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ip6lbynAFYtNjOClsW2vFt7aCkU5Ra6KlZGM45oXiHg=;
        b=D93iDrK3H+xQgXqoVqm3TR7+ccLd3fFgo319Yewy7xSIe1v83DMugoEiHoEdQfoz6z
         ddzk+ii/D26F3dQLfremlB/JtfCwcAdLDEVBEJhQeGoElNKm6rGVc3hUtjuZIyO1U3I8
         F2g5VUyIaqQ9oX2fQieWcWqgBvZQkYFKpT+M9zZVcc8rBADPWWCdJEmfgQ0r/zhZeTuK
         Bh3xiyHfitHEZaFNL5b3pjRAIwTn/MHAd/lSHx5m6DuI1j52HaHfacS/ZPsBdick/Nqo
         bNA+HF7wPPfUKElcVd48AcXmCFK5a7JXvfcdc7oaCO7SqAM90PL3JBYcgGZh5XzLkPXe
         aTxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749734137; x=1750338937;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ip6lbynAFYtNjOClsW2vFt7aCkU5Ra6KlZGM45oXiHg=;
        b=iJlqafLQo2vb6Mu/P1Rn4Ti77AbOl7J74Kl+jWyLYOanTpuGWLgNKzBW3bLSv9vRrJ
         zkSWj+Fj2sjkUk8q0RpBKCkHxFO8jhFXDYdjjPGZLaafHDNih5JI4mreTX0R3M1+ZqGb
         Y1K0RU5lPgsgwVclGh8IZpkbsnikHCzR6B7qobKuaX2QmtihCuD0nwkp9BxhWVQliHLx
         ww62p6UHY34/thTnyf8UNjxbn04p+XYylXP6weRVeo6zH6dTtBs3u0PATdx6qKhcfwat
         1vp+xIp7BVpjFBrVxRYXtPuDebD31frJ0Ncnk/HRi9nkD2JksChYpI53eHRG+5iCsDrQ
         /8ZA==
X-Gm-Message-State: AOJu0YxYTP1tyq7IJCILRxWtGVUaLc1oUZUCfNMlqTKnBLsYRAkPdzyh
	XVCmOBP/ILYzvZZirnM2BVKiN7I0n8mywXWIUNPgyRbsZjpDK/ynaHS0X4hv71DUtl8=
X-Gm-Gg: ASbGnctH2mELRg/5/jwEnJo6DsOxW0dJhv81lyjNF3Rt02bJiAjLrvF5blXYOy4bDeI
	zRWMw1cOy4U/dc0qlfIoBvEOet7vBS9lF4nIhgVXSmVIf137J71F1Avp1OH68QCe+p2JSoXPyu8
	H9/d0LVNbWImXnSPIM57SZ8nsM3BILqomG3vhRvttSBUKWcydfmF0WILXISj6ajbck7sBg24Gy3
	MODigz4xhu083d4J5rvSFXyLTlV3gBwqi/sdbDFyKxK6FlRnNOqOVqakpXCf1TH+j2LrgNCfaf5
	0+G4P837b1XZL9JB6Y4egzfGO/XGUoVD5JaQ9TDtBdk/m+w//JafDGk=
X-Google-Smtp-Source: AGHT+IHar0PqDY1QE4EHUJ2UDPwjmIuAL/4fwnWhb7FmMh0PHKvPQEkqatf4UNuUJGPMW4GVTDu7YQ==
X-Received: by 2002:a05:600c:8b56:b0:43d:17f1:2640 with SMTP id 5b1f17b1804b1-4532d30e471mr25451165e9.26.1749734136591;
        Thu, 12 Jun 2025 06:15:36 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8b99:9926:3892:5310])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532dea17d7sm20619795e9.10.2025.06.12.06.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 06:15:36 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 12 Jun 2025 15:15:19 +0200
Subject: [PATCH 10/16] pinctrl: apple: use new GPIO line value setter
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-10-556b0a530cd4@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1644;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=1IApo4igNtXTEv/Q7vu31GP6B3n4wjJlImJTj9XqA2s=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoStLmWXbtvzzN20cI8pq1ql0lzItgzIAO4vu7/
 Vh13Q8eW6qJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaErS5gAKCRARpy6gFHHX
 cu4rD/0bUGcQAKydYhwzI9Rk/4kHLYT1KvTVAL/i42Z3N0kU9QrjzFMdnxe7jVZscx8cUH4C0RJ
 X9vX1NV14ApTq4Go5LEVS87FcIdp+/PFp1v6HEJ2Z5Ei+lFdiGuViKFiVnbt0k7KUdLG/biuyyM
 s6fFrmrS+TfsQ5BFkvtpCwMfMANjwALeIeCP4WrYERolA9GZatzEePL/ARH6y1DSXROrVeMGDzE
 o4QV5ertmVruQ7cQaDBYdUSKcXziz3nUk3vVU0aq3RLWz4z0jPqnCsurFZ7XWH6++JSdwl9eGDD
 N+p/3J/wpZDelRBqVD/AP40yjN19ZnEKYJuseqMWttjNyzv+Tavo50Rtr1Zp4gVD2ynUU57Z0vL
 sEMEA8+n3RvnOXutl/uFVp4NdK5eaJruYdT2+ghGilFAdEn/UcdQGWE1gTPGqvD4k2NUSGJ96X4
 8T8eFub+XjCYsI4wnnCONAnuu1XYOe52wBFeUjCq93IFXlbOw+TUdspUkW9ih/YTUA985jdJKOJ
 tbfCEf6yADWiWCiHgKPcWgrnCh/TXoaxvooD/K+kkXUBQ/N8brH2KbqXnt1d8kVquhyNqVIBFoL
 w8p+GSbvQJQ3DGwzFuWGVO3aAa0fSjQI7BpFePHwFJbW+e7i/vVKozf6dqVUuhpNiqnF7WD5j5U
 Pfx5x5E6gbynZDw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_061538_199520_9A3732CC 
X-CRM114-Status: GOOD (  12.25  )
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
 drivers/pinctrl/pinctrl-apple-gpio.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-apple-gpio.c b/drivers/pinctrl/pinctrl-apple-gpio.c
index 0f551d67d482d96c7a1e4c28a6db580f0db6452e..dcf3a921b4df54250194403f06a3c1fb40110eaa 100644
--- a/drivers/pinctrl/pinctrl-apple-gpio.c
+++ b/drivers/pinctrl/pinctrl-apple-gpio.c
@@ -217,11 +217,13 @@ static int apple_gpio_get(struct gpio_chip *chip, unsigned offset)
 	return !!(reg & REG_GPIOx_DATA);
 }
 
-static void apple_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
+static int apple_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	struct apple_gpio_pinctrl *pctl = gpiochip_get_data(chip);
 
 	apple_gpio_set_reg(pctl, offset, REG_GPIOx_DATA, value ? REG_GPIOx_DATA : 0);
+
+	return 0;
 }
 
 static int apple_gpio_direction_input(struct gpio_chip *chip, unsigned int offset)
@@ -376,7 +378,7 @@ static int apple_gpio_register(struct apple_gpio_pinctrl *pctl)
 	pctl->gpio_chip.direction_input = apple_gpio_direction_input;
 	pctl->gpio_chip.direction_output = apple_gpio_direction_output;
 	pctl->gpio_chip.get = apple_gpio_get;
-	pctl->gpio_chip.set = apple_gpio_set;
+	pctl->gpio_chip.set_rv = apple_gpio_set;
 	pctl->gpio_chip.base = -1;
 	pctl->gpio_chip.ngpio = pctl->pinctrl_desc.npins;
 	pctl->gpio_chip.parent = pctl->dev;

-- 
2.48.1


