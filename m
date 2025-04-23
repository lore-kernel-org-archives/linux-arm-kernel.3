Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BA7DC369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 07:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3dUpHlzVQ0Nluzp3HoN5pgyga3apGsC9qYfohIDy0Rw=; b=FR9YnUDLfypSUXl9wD3297PoAp
	9ayiTQvSMFWcz9f4jzyxMt/5FLiKtejRgiCWFji/3gTAHp+xCtPbpHX170IBNkQYGiEFB6mBhe2WY
	P9A4vg/kZM/N6d5v3Togxrdh6GD1FLSTxacpRwYYGyGbwmXKaS1Nhi72Bqa5uCCv4p4e4maEEZFTq
	oYJe+rhTvScgrvXEaYOm12NU+EMpZJlsmPIFmIbj2tmInPw3mnKxMldy9+QHeoOeU6tHP4Y+TPNue
	/N7xUogXJeM3k2mkTutt/VQGcSHQ/rVkhxPbAcOauA0JX6ZMl2im5tcTiEmnxc6aOyNN1h+nSMD/S
	giz9Tbjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Ujy-00000009YVe-1kD7;
	Wed, 23 Apr 2025 07:41:54 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7UKP-00000009TY0-0Pds
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 07:15:30 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43ed8d32a95so52406435e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 00:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745392527; x=1745997327; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3dUpHlzVQ0Nluzp3HoN5pgyga3apGsC9qYfohIDy0Rw=;
        b=bMUGKcQ1ufhfT+2xoOqk+z7HSyFUcoIvjxs6gqvAnMsV9niBcsolPRA9L9XY9aA2oH
         RVuXPlzYJjoQGipTwiHr1NedSbDTnbOTmOQxx39JTOEecTgxksehhysxHoM+31OLm5tm
         rSp4nL7fulrSmkHImp+ECWvbRZn5/xIb9PXkmusbma6cRhbV6LdXh0M2Ewd9JNaRr/k8
         xJKL8A2PQMy68MFI5woeJk6fPi1H1ggPpWtutYSt5bgFRFzlaR0XHlZQWT+5wglMvo1I
         fBm8FkRaOsiDMZpw04tF/2yrFzGCNbDMrowrHgiXn9CImNSuXoagsUXaUQ740tuCAxEJ
         Hczw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745392527; x=1745997327;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3dUpHlzVQ0Nluzp3HoN5pgyga3apGsC9qYfohIDy0Rw=;
        b=ckTf0ykP6IYf3FURJTOcbyQUxcTZagwnSCCMdMwb1kFVkX76ENgMnwOU2VzfDyeybu
         iiLEhNcBx14LoSteHYur8AyPn1h6zut+lQvi2r1pJLoZrtcQQK/ZL6CJJ1Q/8Mg927A8
         rw69avkXXw3rpL8cbq69R3BpvKolMtsCNBu1wmR31YVG4S/+18WEIcnefXghnpAX1xTZ
         cbVk9M6JgEvHFMy1BJ5eMcerq4kEj9EyQidMcWBUqoWZgxEOGqp/ZZmu4+b/1sX1qhXC
         YVAhmvRtBa4dp3lGCZAEC6Kl0agTGEdhQ1UoNBRpvrK/ddOblPwdluadNLavkvjL7RfV
         NPQw==
X-Forwarded-Encrypted: i=1; AJvYcCUGVYg4afZ54B5vESefViWRDw5iBpQX4ekOZ0BEYD9/qSb5tYNb5FKswMdHqivyEeQidO0tEiQoEn3Jv2Ibsoq2@lists.infradead.org
X-Gm-Message-State: AOJu0Yzm8MKYQmJFg63NAbkX8AlWO3s3ZltyAbbiFsTTtGH72n3W2L50
	bj7jpjq+Corp2p0Aq9ULY+CKAH+0UDNe6puO3hk7ELprGaFctfM2HucLSx+2/tA=
X-Gm-Gg: ASbGnctI2aWLEWPBvew9bP7al0O/RNerCzv8lar/vKAYmQ5o3bzrOfcg7iTNTImgjAn
	eob7joBIgOvL97Qpg/Z7o+k8pHjVfiMO6tLHR5NxJIArN5FRPssfw4LWEl+eQLT5TjNi4fkvhQY
	1D0FSopzhd1C6DoJVLbeFgesUF0fNz3ZpaLjYqK0jplV8EQeEOynmqPIzO6budxVJ+7dKcnJw1F
	6QyR3Hcqd/YA8O33b+9yrh8PbIUL/mOywJbAhKRpwXAVKi6MmJ+i02dzImGOaE9ys2fU3IbtQvj
	8mDxh7GLs+TKH7QDcBm5RnD/LhjV8G3ykUfiGHrEmxY+
X-Google-Smtp-Source: AGHT+IH2MsdDNILYCsPMW1ySHRfLwTlUNKKijfetG6ax3upZnauWSGQaIMu5VBaZHo1H5K5p/SAe6w==
X-Received: by 2002:a5d:5983:0:b0:39f:ef3:b51b with SMTP id ffacd0b85a97d-39f0ef3b57amr5697581f8f.32.1745392523690;
        Wed, 23 Apr 2025 00:15:23 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:74b0:71bd:6dda:dcc1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa493446sm17696935f8f.74.2025.04.23.00.15.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 00:15:23 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 23 Apr 2025 09:15:09 +0200
Subject: [PATCH 07/12] gpio: kempld: use new line value setter callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-gpiochip-set-rv-gpio-part2-v1-7-b22245cde81a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1705;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=GEPnmbXoB7fEIW2iO7oP13YH/mpOLXVRPH64FaTpdkA=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoCJOCWLqOVcCM9B5CKNnljLn3XvSwrTZkEt5m+
 EdjAfGiBV6JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAiTggAKCRARpy6gFHHX
 crz5EACpKy3hnh8x/i7lz5DRdTzrevhdTvj2GHcaNqpC9nMq/9jQxcxHyV8D4Aa1c4sEmS55ux0
 xEHbzaaP+jMTCuDrvmgZYLuXPnj0ff1cVBdlqgXoat5CuZYIhFGjUHZu8TIXRyE98MOmXtM+zpf
 KR15+MKLF/MFgGPf+pFiFnhZQgiIdMTUgGuYDND1XzyytYPoDWairH7zw5gkYcUMo4PtKwu8hzm
 ki47tNZZCvyhrwVSrSavZMGN3WH7RrbZakehUkRbsf5zUihpWT8G0DNnMLd/8HjNkj2ljjlEpaK
 pFUx4muqwiDLXH0i1ggHXDG/c4PJKLo9i+xdghac3TQd6m6LQTA+qNpZ3jl8cwch1hf06Je/l95
 c/9adIpl0RriXYQFD8+djuJBhz9g0QNW4pa1Hd9Apr9fbLFjJmvHyyky+yoivb06oIgC7sEImX2
 LRyro8kke7ChteD4VA1/U23BKFJSg51Zb6NZRS34JKgO05v8l7VUQf41tUrl+ZTacPXjSJ9r/lh
 pqjbObBMXu+TTSIsK0AVAf8FMw9eSndey7MuOkQR0sLiabTOSUvbKhO+UgZqkbWRJkZ9VPwQ86w
 Mq25Am90HWAI+h3TYxDI0hf4uOnIAjD5tyAAygo1CqvmeiCnPmza0EgnN3nD7OTQsBXACgi2MTz
 oi0POfIjKW5cr4g==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_001529_146691_1EDDE0DF 
X-CRM114-Status: GOOD (  13.29  )
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
 drivers/gpio/gpio-kempld.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-kempld.c b/drivers/gpio/gpio-kempld.c
index 4ea15f08e0f4..e38e604baa22 100644
--- a/drivers/gpio/gpio-kempld.c
+++ b/drivers/gpio/gpio-kempld.c
@@ -63,7 +63,8 @@ static int kempld_gpio_get(struct gpio_chip *chip, unsigned offset)
 	return !!kempld_gpio_get_bit(pld, KEMPLD_GPIO_LVL_NUM(offset), offset);
 }
 
-static void kempld_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
+static int kempld_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			   int value)
 {
 	struct kempld_gpio_data *gpio = gpiochip_get_data(chip);
 	struct kempld_device_data *pld = gpio->pld;
@@ -71,6 +72,8 @@ static void kempld_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 	kempld_get_mutex(pld);
 	kempld_gpio_bitop(pld, KEMPLD_GPIO_LVL_NUM(offset), offset, value);
 	kempld_release_mutex(pld);
+
+	return 0;
 }
 
 static int kempld_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
@@ -166,7 +169,7 @@ static int kempld_gpio_probe(struct platform_device *pdev)
 	chip->direction_output = kempld_gpio_direction_output;
 	chip->get_direction = kempld_gpio_get_direction;
 	chip->get = kempld_gpio_get;
-	chip->set = kempld_gpio_set;
+	chip->set_rv = kempld_gpio_set;
 	chip->ngpio = kempld_gpio_pincount(pld);
 	if (chip->ngpio == 0) {
 		dev_err(dev, "No GPIO pins detected\n");

-- 
2.45.2


