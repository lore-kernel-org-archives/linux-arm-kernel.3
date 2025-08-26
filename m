Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26EBFCA0FE9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 10:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m4SIaXVWUkg+hHGv+4ixu8kbiUSIjwYzUEuWT5aiHX8=; b=szc0UPODgIOlJMcNIPEK+u2Hrk
	7qJ5CJQp4Rcav226I0h9CehuhyuQNAKHHro8zM+slasNdL8aEHuWD4B+hvSxF9UYU6ngKeki93zgV
	n+IA0HXuPVbOFf/nLspqm9zMHIm3s1gVhE4lQjRwSTMnS5sMKaDndnbJmUEb/KFBC928OjaEHamKZ
	JS/3I9PTSRsNahoqy/ZWGXj3ESHil9X6I6wiHTqteIK4nNs3lNMzKoAbRXaxOpi2waf8Jf4gtkWdy
	2yXTZG0v7LCd2E6oYLc9mmcdLWIuxCx2YfrNgwdhHCGyCflWf4RESay0YtYmAwwVxkpLqwgvQmTxy
	yjamUt2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqqc7-0000000BZeI-2WNi;
	Tue, 26 Aug 2025 10:09:15 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqq5P-0000000BR6k-1iGg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Aug 2025 09:35:28 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3c8fe6bd038so1047943f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Aug 2025 02:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756200926; x=1756805726; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m4SIaXVWUkg+hHGv+4ixu8kbiUSIjwYzUEuWT5aiHX8=;
        b=0Ye54yzfYBEutVDrhoh8WLxaTqSXkRaJjjTD63q6tXZN7prbhHyX0/7VfIVcxp0/z+
         A6ShkbORj8GMGPX3TK3ERl36eP0j2UKv1GER2F2WNTV9MjfhsKWA1Na3ZFRPUQUvH4th
         7q2cQZwyY/Qz3jrgwZpWSjQttDsl2iV+wfeRNsm74PL8neHWKEmVXSUwo65neTw/DmHJ
         RS+dkjBvZ8U28xKJJ+P/oK9ciFo8+uRZAkyxm2jVDhQ2Rlpgx5ca5ZRCMc6tl8b1LbI1
         ZyjNFSY8mC0UZrq2k5OE2GvY2QWXBsKISnL7fMejtCIB8zN0X0m+V1HEQY8U9mueHzOV
         wRSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756200926; x=1756805726;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m4SIaXVWUkg+hHGv+4ixu8kbiUSIjwYzUEuWT5aiHX8=;
        b=lDo7MHMbMtMJOiitWhxxvWu0Nf6NeW4Zqj7uKIOpfWwNmBObHFlbifcMtKthyhgsvM
         L9NjOaLhvMa5IsVPFhw0j34A431W96TmjWc0wTvlWurGg3bXqLBEw6vAuYfNHw4DaZ4+
         hviqZeiOROTxnioDGk5Vtf8SOlHtYnoWjmA54Azn1H4kh/vPLKQdvdzj0J9JasAX89QD
         Up1ineLMo82haZ0I/wpMSITI3inNYNFHrbf+8wVQGbnK9GRiEvz4HD9M3o5qiFUdtXMR
         KghO3atCzvQKo7MB1+6w1f9VXvl9cqO0aGu2LBooizXWVvy1/owlpLq07uiZKl2FU005
         Hn5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUzakaFmyVA6vkKY1vD7A3dbAvRxgKjxHlEK0IOt65IW+8yuVZjwAhzzPL/j5mPslVIWN8/UDnwZuihc5PwQUhH@lists.infradead.org
X-Gm-Message-State: AOJu0YwGcb4DtIlWnXzL4q/4UhCllQLToB5zgqEwJUWYEBP+46zmG4VO
	ChywNpIQCkq2qQEEv0AnGsg7uhRrrhPG50bzYKZ9vImblGueA9g1UW3SNEjm6z2ANF4=
X-Gm-Gg: ASbGncuI1pBA6inT1sBea10ELvt64BX2JRfWypy9eWBIdwK34yXO4WsPDkmhMFCQZLj
	RTaMLJGbhOFvHlr4O74zHaiIc22YRUEpTCsWIdtmIpNGrhVOnFh8UL3kCqZIq3TPvmv7ObBXIVV
	ZNLv0SyY6TXbIF2uBLq/iZe338D8JIdlqPoDg/pzrH0dWWNbL47yEyxPnyfjLmb7jsTixdeSjJY
	6eXHKty2mjWXQBGKCUSyNq5OYcxgO82ppJ3LiTg1X+CaNkOyrM8opix5az0AnPbkrwSdP9UHoMv
	aNyyjLsbFDwouOyxdpsrxGCSaH5yFws8hQIAkQyQuPfHOMibBV4c6TYbS832aV2Qh6+Z1hnMjjs
	q0eKEh0SgEYi0+fFqXsZMLzeQ01E=
X-Google-Smtp-Source: AGHT+IHIDohXLZAKff1GENvVq+fM/lMjSRZvIzBycvaCqcgyGD6B/NWZoIVvZstUWc4ib8hSnjpLpg==
X-Received: by 2002:a05:6000:2304:b0:3ca:ad45:6363 with SMTP id ffacd0b85a97d-3caad456a18mr2848159f8f.17.1756200925783;
        Tue, 26 Aug 2025 02:35:25 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:fed4:79fc:9440:6629])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c7117d5b10sm15308255f8f.47.2025.08.26.02.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 02:35:25 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 26 Aug 2025 11:35:13 +0200
Subject: [PATCH 12/12] gpio: visconti: use new generic GPIO chip API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250826-gpio-mmio-gpio-conv-part2-v1-12-f67603e4b27e@linaro.org>
References: <20250826-gpio-mmio-gpio-conv-part2-v1-0-f67603e4b27e@linaro.org>
In-Reply-To: <20250826-gpio-mmio-gpio-conv-part2-v1-0-f67603e4b27e@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Yang Shen <shenyang39@huawei.com>, 
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2444;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=lIkE26fimxtLsnv6/OivS6nB6z654zlY0oS9FIX70Es=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBorX/Og0nbErzpY3vQ9xVhUwQ4iNVAKpRoHYsW4
 LZRkjgeVXKJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaK1/zgAKCRARpy6gFHHX
 ciDAEADY4ihEtR9Q7yOEPZRGqxwnfxfrHl7l0+5fiDRcc1FroXh2IHJ0vTwbvBV7qbzrH2dM4Gl
 8H6mb/ToQaz7wQ05T33kB9KO4dkt80hapLHLqKrM/UJ1jgw/IE/bhrUGaAL5fy+thOMcPxUjNex
 pIJjwJHspqz1osilDW+2yP/wIgStol8GscbIWtdYoClTuoUzuj+/f3dgatzmAbio/o0BlycLE9P
 sRf2gMSwmzK+eOIvekbtPm7BfuVWzUJMavw78rz9zV66o2o5uBy1VmVmsb+Awq3/5W0QJEtE6VD
 gFSdMXDLO5UsDo0OaA2OWuZvallu5BvMqG2jhOcxkUAm3H3jzOrQy7AccA71Uza8B20IXmmxoVc
 fFJxXPABvFwfs3S40Y/WG/oG8mTHgB2ExlW8WBPtkH0jWTYjVrSZx9WjVL1f4zwX1FSCCaZkx96
 vrtYoPCC2YZSsJMvo8ys9sy0zH8RsbvydG0cfeFJHkaD4hMAeb/kxMzwRpYmj48mlxnfKpYyVii
 UXfCElyNv81k8MIzqisClidhmWj29NFXds2XVhdz3R1jXiLd3aNuhh6FRld6OgzLAg+pMETjfjT
 dUwaD/eNJr61h83U8iT3Ox7OCZLB/4KcjQGC6UCas/qCDtvDLtrG/8Cz8auDUmkQKajQQnbB793
 3E2mpLwnP78CEMA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_023527_460184_B5FBF750 
X-CRM114-Status: GOOD (  16.25  )
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

Convert the driver to using the new generic GPIO chip interfaces from
linux/gpio/generic.h.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-visconti.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/gpio/gpio-visconti.c b/drivers/gpio/gpio-visconti.c
index 5bd965c18a465f29884cbe56711b25d7e755df2d..cde1581a91033e0ffa855e6cab0a36fa01f2baa1 100644
--- a/drivers/gpio/gpio-visconti.c
+++ b/drivers/gpio/gpio-visconti.c
@@ -10,6 +10,7 @@
 
 #include <linux/bitops.h>
 #include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/module.h>
@@ -32,7 +33,7 @@
 struct visconti_gpio {
 	void __iomem *base;
 	spinlock_t lock; /* protect gpio register */
-	struct gpio_chip gpio_chip;
+	struct gpio_generic_chip chip;
 	struct device *dev;
 };
 
@@ -158,6 +159,7 @@ static const struct irq_chip visconti_gpio_irq_chip = {
 
 static int visconti_gpio_probe(struct platform_device *pdev)
 {
+	struct gpio_generic_chip_config config;
 	struct device *dev = &pdev->dev;
 	struct visconti_gpio *priv;
 	struct gpio_irq_chip *girq;
@@ -189,19 +191,22 @@ static int visconti_gpio_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	ret = bgpio_init(&priv->gpio_chip, dev, 4,
-			 priv->base + GPIO_IDATA,
-			 priv->base + GPIO_OSET,
-			 priv->base + GPIO_OCLR,
-			 priv->base + GPIO_DIR,
-			 NULL,
-			 0);
+	config = (typeof(config)){
+		.dev = dev,
+		.sz = 4,
+		.dat = priv->base + GPIO_IDATA,
+		.set = priv->base + GPIO_OSET,
+		.clr = priv->base + GPIO_OCLR,
+		.dirout = priv->base + GPIO_DIR,
+	};
+
+	ret = gpio_generic_chip_init(&priv->chip, &config);
 	if (ret) {
 		dev_err(dev, "unable to init generic GPIO\n");
 		return ret;
 	}
 
-	girq = &priv->gpio_chip.irq;
+	girq = &priv->chip.gc.irq;
 	gpio_irq_chip_set_chip(girq, &visconti_gpio_irq_chip);
 	girq->fwnode = dev_fwnode(dev);
 	girq->parent_domain = parent;
@@ -210,7 +215,7 @@ static int visconti_gpio_probe(struct platform_device *pdev)
 	girq->default_type = IRQ_TYPE_NONE;
 	girq->handler = handle_level_irq;
 
-	return devm_gpiochip_add_data(dev, &priv->gpio_chip, priv);
+	return devm_gpiochip_add_data(dev, &priv->chip.gc, priv);
 }
 
 static const struct of_device_id visconti_gpio_of_match[] = {

-- 
2.48.1


