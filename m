Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 909E0C369D3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 07:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G2qxZ5SNufiuhH2/QCBic5ml0Ty+5BazjFOvOXbBOTw=; b=eO+9r4XiGUB7IJVzrykFTvffRw
	UQLTUjuUmk2qZiTIcCU8PDEVwOfR//HtdPZWeSZ3tDQp5fnAeNFCDmEWXQ9WM0gPwNq8F5K6BOqUU
	of8lrg4lm2PkW9fJlACVNqh4+7HefhBbvzCovkHtoQYLfqPBMCg5L2/binY+OgnD9x8K253CYnus4
	wpQUo08eoPakRUqj/hp9KL53EnoDn8GCAS8zzm4t4YSKGwrMbjdHvewJMsarhZ7XILRl9JAvBRxcU
	xc+4QxwAi/crc+PJwIPe2NA3u9f3TgMfNRgfSsivx8JW1Ma6bdt68ViONB2x0wGrBU8PfSKPq/71z
	i8GB+p9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7UYD-00000009WMv-1yiJ;
	Wed, 23 Apr 2025 07:29:45 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7UKI-00000009TVJ-1mTQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 07:15:23 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-43690d4605dso48050395e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 00:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745392520; x=1745997320; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G2qxZ5SNufiuhH2/QCBic5ml0Ty+5BazjFOvOXbBOTw=;
        b=W+CjSvt8FQtgTMqebHrwAbnt37uiSPNMe7EuLhZIppctHD4DHjFn61dG4qOk5lFjvl
         +sq2zT8bW/WRdYD7BA1VipXKsmpW4270jxSlL9QL0sy5ANm+Pgogo89oZRHm1MU1Z2+c
         A0NZQnBlE2eRB4b3oIRPU1B71G6/yVy4MzZQnppyovANhtV+wz1JV6kEWjLvhw61Yf1P
         mr9CHvsRkTQSYmQYMS9Odtx1hNSlqeOiVJuCvIs6msmpyhP6XOfivRfB5czFTrGfaxTB
         2c13uIjm9v9Lyc0o1x6iq7rGxbLQtMybCVqeEuDpAUVjiKK9GETj6Hg4KjH+Zsfx9Pln
         Yopw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745392520; x=1745997320;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G2qxZ5SNufiuhH2/QCBic5ml0Ty+5BazjFOvOXbBOTw=;
        b=d2HUcAVedVydVqLUyeYy9BC1gw/B+5M4nB/QXvYpWvjKXSPUE9kNbschjz+AQloZHs
         nERsvMcRdfU09DhsTgQ93dOebF1ANZv0kdvWuXgDc9c281P8K0bfjQwPq89q4SiHTO3f
         2lSl5BIpImoiYkkIdRr/ZIaVPcM7P0czLm7EjIeMH0q1MhJ+QBQQF3wC6z2XSipOVbEl
         ciNXhzl6+jJcxVKgaZc7ecmOTFGjaH53dv6stfqsTJ+Nw4DWAD3m9mG3aOULDTce6+cU
         2KBcHEBGg1gG1CxNF/wCQ28TfqnTuqLzIfMoHpfOvnGUNxJt9lmdAjmKLTzvFGVzj9Ux
         jOnw==
X-Forwarded-Encrypted: i=1; AJvYcCW/knaVhDO8NezekO24msMfD+xitoqg/H3+AGZNa1HpkiuvMyGoQyxrETFbBzuB4mATnxgBWV2rt7j2D8a1gX3R@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0rHm4g6PLWXLTSS3MKNZktovccoFRY32XJnNhhn4vp6ZA10xd
	iPSSugclrVRQxFvgHoJm0ygBSdV/VqhRaru1frWI0rSzloqA+0lb2sVe9mzMN2k=
X-Gm-Gg: ASbGncsV/m7zKOUZOM7PcXvBE0ZcQy/sJI7eOjdcp664Z5yof4+6Z15b3LLIJ+dP0b3
	O/tNygGAfp4Uw9Nqtg18d8305V9/eM/vuNJCqODRIQ3C1fJ8z/hnzz8/KHpiM7+MJwvNciKJeeF
	Wy5/I92SJ6VYGn7IQKOYHLB8rQ2hMNiqsLzLG5QTuT5O/4KD/T/VsI5YNful9Gu82UkaGcUIMMy
	doYzRlw/IdDOlzsDX71gR9Qfe3A7Rd0kC1MSX3mTtWtqmq6iM7a+j/pifE42X4VJMz5Q0Uh1M3/
	RcsheH7o4DLA2Gu3kBJIGCnz34/xWkFC8Q==
X-Google-Smtp-Source: AGHT+IGX9aP5FGs6mIYBjE2Fy/Cf3MYPL+aEO76HfSyqqWsd5X9AWMYdMfxaiJI4eGNh/jiqHeIceA==
X-Received: by 2002:a05:600c:4fcf:b0:440:6a37:be0d with SMTP id 5b1f17b1804b1-4406abb245cmr171540525e9.15.1745392520323;
        Wed, 23 Apr 2025 00:15:20 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:74b0:71bd:6dda:dcc1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa493446sm17696935f8f.74.2025.04.23.00.15.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 00:15:19 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 23 Apr 2025 09:15:06 +0200
Subject: [PATCH 04/12] gpio: imx-scu: use new line value setter callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-gpiochip-set-rv-gpio-part2-v1-4-b22245cde81a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1536;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=FRmNocCMgDCqyKK3swLP6cODkyyIC7OT79L9GAY0bjI=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoCJOB/Ov6sr/uWpQe44AZ9kTd5SkCbX39gaQdU
 ccSZyRED5+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAiTgQAKCRARpy6gFHHX
 cggXEADC9I9dAp8L1/RZQY0dK85ZOpEVf6XAJMrSnBsXrkLU6zw7OZw5gZkWmuoJf4VcHq/ObGx
 OOhgSlr0WVXDo6p+71iJY1PXUy7IXdkfl3o8/f7H3TRHoczV9Tlc72JuZl/EJopVg3cpI5xRoPS
 zq7H8TZvPbwH49XwIanfFJCXAORxh8P8YSWVm1rn/oqrMUM35wIXkPe5Mvqq8DWJYWbmHgh5z3L
 /tq3HhHxfZGOGDZRbGsT1shgiAcVugWAKTafplG8JXQ93NdJjlrlM4Lno+p0DWjUd9JLjleYD+r
 ZochpLmjlXyaxqH1xATLYR4ZZDAMuji1wbopYnOvFT7HxoAqnRxFkPTSvkBS39wNw8TwsG5XuOO
 5TlTkSEfB4W3GyMmWqhv4AvCnIyll2p7V0/2Vkq8OfR2fHJEpKwZfwsWdfBeCFK6BsLwiTZge23
 bDWGLZfvXivk+h26DY325XhI+4ZtK/PJaabjA/YAF40tVztEJgXYxNx/7SGj6vFpKTj9MS1hlFz
 NkdXl9BY3YDy32+JDNv7DYgBWB0L7/hVA1cEX9nz8gQDN3Nq0+toSuigcaC02VYkZgp/cCKC4ZH
 bgMWCHgNflrBiDi5V/EsYMZBTaQQiiaoYLijx72aN++D6tnudp9Y0o/dqxjScLYfu8xNbjfcupu
 LRcbpKCJb1Q4l3g==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_001522_469391_D57D7E9D 
X-CRM114-Status: GOOD (  12.62  )
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
 drivers/gpio/gpio-imx-scu.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-imx-scu.c b/drivers/gpio/gpio-imx-scu.c
index cf98b948f804..1693dbf1b777 100644
--- a/drivers/gpio/gpio-imx-scu.c
+++ b/drivers/gpio/gpio-imx-scu.c
@@ -52,7 +52,8 @@ static int imx_scu_gpio_get(struct gpio_chip *chip, unsigned int offset)
 	return level;
 }
 
-static void imx_scu_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
+static int imx_scu_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			    int value)
 {
 	struct scu_gpio_priv *priv = gpiochip_get_data(chip);
 	int err;
@@ -65,6 +66,8 @@ static void imx_scu_gpio_set(struct gpio_chip *chip, unsigned int offset, int va
 	if (err)
 		dev_err(priv->dev, "SCU set (%d) failed: %d\n",
 				scu_rsrc_arr[offset], err);
+
+	return err;
 }
 
 static int imx_scu_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
@@ -99,7 +102,7 @@ static int imx_scu_gpio_probe(struct platform_device *pdev)
 	gc->ngpio = ARRAY_SIZE(scu_rsrc_arr);
 	gc->label = dev_name(dev);
 	gc->get = imx_scu_gpio_get;
-	gc->set = imx_scu_gpio_set;
+	gc->set_rv = imx_scu_gpio_set;
 	gc->get_direction = imx_scu_gpio_get_direction;
 
 	platform_set_drvdata(pdev, priv);

-- 
2.45.2


