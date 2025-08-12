Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B895DCA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 16:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=leTFdfCJ6+RyienTiSwh2q3pg0tznaooZOPdYThkYBU=; b=XKcu822gcRUhbyl1vtgXro00LO
	vSaOMmbfXDZWUk1qv1PGFATmSgAqzLxb09yJ+2jP196NREPOCZRZKBbLj3/51cWr+Fq0CuQAH8Iz0
	m/fab5ncYVDuhSs27LS6GO6y+CoiymfJullGl+nX+vOPD3q1LCD3JHmFJ+YzhgXsQ201dCS5RGIgP
	lpX8lBVOgOYNaKHwbWnhOHjYwKsBYRDjCEqQFEWWQqpC6baiGDgsgVjiDqCnaXCbHG+lry63Ey1hT
	CyC9d//a+nnPM9F/aqj2I2n/1eUCm+aozJ4HiAVayq6qCvMQq5FvNkp98bxNE1IuL85YLSDTTQmUZ
	Dv2Rv7YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulrhl-0000000BHJ4-1NQG;
	Tue, 12 Aug 2025 16:18:29 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ullgF-0000000ARJo-2LYe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 09:52:32 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-459e1338565so49307825e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 02:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1754992350; x=1755597150; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=leTFdfCJ6+RyienTiSwh2q3pg0tznaooZOPdYThkYBU=;
        b=fYV1STXhQtePSkids9HF8mfLZl+X1f5ta7krh+DO+65ljovmXLmDAv/gozABD0V5Ch
         o6PcbT0EspzivFom73QEAoKw4HqSTKrN6tqShaW+eGRufP52Iac+JXD9boPPyExtDsA0
         8MIeuqGzv74DfwaFqa4an5XgUjh+HljjgAu1AOWJKsAoB4xOJUszH4CMAMt/DttBPeFm
         n4gzsVH0GdPBnZkk80y021ff7IAsywsDlh1TsvKld+oIWZvNapD0oVJcAO98AHNbJCTm
         5BnQL5AgxKDENUthsIauJXDS16TvBxfddkLrWkotNQfO/qZm+ZtIbjFtBaiw1Verw9eL
         G/8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754992350; x=1755597150;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=leTFdfCJ6+RyienTiSwh2q3pg0tznaooZOPdYThkYBU=;
        b=f7QeAYYxEqYbEfxKLMlFRYnyODIlzcWONdSQnNTguCWmGhBQrBmc0j+8BE2YvUCyWP
         EO5Q79kYRjkftd1Fi98Cm7ph/c6TKRPdqY48qjIhOrAjVNLZr4GxLQqXTHhOdyDgsqBA
         0WL+OMeg5a6Z18Eb3SJA4+PQKoSR7SwLxGoaM+IOMHu0HpNXH1mByx3tl+SWBk2aMh4e
         pE9tHzwx03zSnB3Qnu2IYtnTcfHGfeX3H6qLP/Ttcq3PR+VckJhTK13yJWbprP0yUQJv
         B0vqCIWd/l6plxyI6WNAe/LuerCgEu9++CtGSA3Y9citEBlJZscJ+CNFxcZHmkdenLCm
         5n6w==
X-Forwarded-Encrypted: i=1; AJvYcCXghMYb98C7OrrDoppEkIIf0QSa4F+nZeNzG1N5bQswvzMcR40hf4jX5+F0WxR7puOMb1WiCWB6zixl4RtUvh4R@lists.infradead.org
X-Gm-Message-State: AOJu0YwvjIbv6T+Y24zR1zBO/b0leWpXBPKD6/B0esSnzpF3wJ9v49PX
	v26pBW+O8omec3ycI1reL1xpP2lNThfOtrlcfYjHT3pAszc6oSqxjo/r7Ij1JpYjl7o=
X-Gm-Gg: ASbGncsvoXtUQHbwiZ3FEVkxhOdZZl5KzkxGmUGuvKrJ3QzEaEGw0FkB+lBrHCrB4wb
	IJJdje5oXWU0RNSzZQ8oXB9hHsFnnXWybPnaih02pmPQjOqIJzQa7Ix2djzUGEqOzq65s9JUi4l
	A2vYbdZcum39BOPoBK8C6psdHFL2HjY9mqK8Z9hwrHaCtj9zHyVe71HKCIRgc2zXHpRezZ/t803
	2EzZgf/dnzzYpkkaztU+4MfX1DEOGrUv4w4XLKPxmVSrsk4HTYGemHYB8xifq3OND52+PMvr5WS
	/bQYpn/ReUVMBq8C82x0Tu6ZGDU0/qmsBUI5KfSpKQtKWbu6uuNH680BsOWDz5sSHSxdN74cUFO
	RuGV0nmWpCTt3SPI=
X-Google-Smtp-Source: AGHT+IGIcINkdiK0LNz/i++bv0RtZ8hP381jlLDx4TdmYRuzvhN/HMrb4TfbDRUlL2JwjGPQsH0Szw==
X-Received: by 2002:a05:600c:1caa:b0:456:e39:ec1a with SMTP id 5b1f17b1804b1-459f4ec3a43mr159061415e9.14.1754992349900;
        Tue, 12 Aug 2025 02:52:29 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:16c8:50:27fe:4d94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459e587e154sm312580295e9.27.2025.08.12.02.52.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 02:52:29 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 12 Aug 2025 11:52:02 +0200
Subject: [PATCH 05/14] gpio: ts4800: use generic device properties
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-gpio-mmio-gpio-conv-v1-5-9f43e95dea98@linaro.org>
References: <20250812-gpio-mmio-gpio-conv-v1-0-9f43e95dea98@linaro.org>
In-Reply-To: <20250812-gpio-mmio-gpio-conv-v1-0-9f43e95dea98@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Yinbo Zhu <zhuyinbo@loongson.cn>, 
 Hoan Tran <hoan@os.amperecomputing.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, Yang Shen <shenyang39@huawei.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-unisoc@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1370;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=nK9pJAlcVqEpACXDhaB9m0pP1KYR56NEQPbKtHUMK9c=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBomw7GBscP67JH5SX99nyhFAOUx+Gt0iwwFvC9Z
 hi0AI/V4juJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJsOxgAKCRARpy6gFHHX
 ck9hD/4lxQ4nelKeye5szjwGOfRfZTuTicWo0zhTlKdddlkk6xoh66S6JcXMp/50mhZ6gEHaJXq
 Q4opBxRZuN6v4aGsJbZgA8rH3LpVNgobh600taxKRx5sHLUyWyw2avAK/leGr5iuoLY7Fqc1Uaj
 2u3vrE1e3E/ZPOqcFn7Xb+fpL8cVI05xKVV1OgNDijT84ExRe22wTQVKll8NHM6KoKJnUQTBgbA
 UDnVxtaiCkk++HoA/jNxeOanH3FrvAo9hFhDEpW24BWkANpPzt+E2bBwJWpFbd5rbcDH20qJ06f
 QHSCanc3huYGyHxZqiSH9UwFja1f83QfLjyoNKzJ4zhK+0TJrs9zHghvpp8jT8lXBfKs7jPK6bd
 CRT8gMzhIppcQUyQZwVGFS5QuoqDtHUBSZZDn4sfQU1KwyMJh1ArON5LJhdBaZvfYnUilPbDBVh
 sE6SswcFS4HAM1Gosf+yHBHd5SCyiPyFpkx5C8zMK+4pfCoBRevD1ER+GY7a+D2vyazx+NPUkwt
 wPsWYxcQBABUeIrZpWSwkdTVRF4weNZq/FRcmwkIlJFIdVk4giAs3ZCAbuEaE8og6uaHWihEHtH
 poQctsPGzdnlKdecj4LJ+OvyBa57PU5XKZcSbl5pMFweUtUv55hCNxeVqXQlfTjkaW6xHF/2tdb
 AfVCaZlsKTziFqg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_025231_599206_26AF4B95 
X-CRM114-Status: GOOD (  14.75  )
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

Avoid pulling in linux/of.h by using the generic device properties.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-ts4800.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-ts4800.c b/drivers/gpio/gpio-ts4800.c
index 86f7947ca9b2d23292c1e6660fe93c611e0cb837..f4ae87325393c909c66eda3bb7b2f849e645b7a4 100644
--- a/drivers/gpio/gpio-ts4800.c
+++ b/drivers/gpio/gpio-ts4800.c
@@ -7,8 +7,8 @@
 
 #include <linux/gpio/driver.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 
 #define DEFAULT_PIN_NUMBER      16
 #define INPUT_REG_OFFSET        0x00
@@ -17,7 +17,7 @@
 
 static int ts4800_gpio_probe(struct platform_device *pdev)
 {
-	struct device_node *node;
+	struct device *dev = &pdev->dev;
 	struct gpio_chip *chip;
 	void __iomem *base_addr;
 	int retval;
@@ -31,11 +31,7 @@ static int ts4800_gpio_probe(struct platform_device *pdev)
 	if (IS_ERR(base_addr))
 		return PTR_ERR(base_addr);
 
-	node = pdev->dev.of_node;
-	if (!node)
-		return -EINVAL;
-
-	retval = of_property_read_u32(node, "ngpios", &ngpios);
+	retval = device_property_read_u32(dev, "ngpios", &ngpios);
 	if (retval == -EINVAL)
 		ngpios = DEFAULT_PIN_NUMBER;
 	else if (retval)

-- 
2.48.1


