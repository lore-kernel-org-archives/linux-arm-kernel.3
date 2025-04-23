Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8005FC369D3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 07:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cOrKi22/dqfrB3rRPsto8GuhAZh+Tay+I6m8tbaX9ss=; b=OorPmATl67N/68PCzVX9qsrcdV
	BCweNcNnbu+ToHI27MUQjTdURs+ehMOegwHDAzj/CZ4OTgYbTLgBr9vY78IIF9OU4YLkz1XfX9rre
	+AXe05lw2oH1ht9JMn8PUyNbQcdqf6mcb6TOnn434DA6shqnqLQaGzgfBv4gfAd8skhnfGEAFItOo
	hXMcgEAbzOYXAvv7r+0PtZmQHiiBqU16sHgzUjSQprmII2oTWruLQ1fOzYOclSKf8yc7yvPD6uEN/
	c+2pyb4Jyp7ys4o5s6ZZXD1VC+IqqkCzgxdwObHzPq97yG2MX0mmwgXVE7a8L/73pMMHEWgRCQYgO
	kPhESp3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7UcA-00000009XEC-07Tl;
	Wed, 23 Apr 2025 07:33:50 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7UKK-00000009TVo-2DL9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 07:15:25 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-43cf06eabdaso57714855e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 00:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745392523; x=1745997323; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cOrKi22/dqfrB3rRPsto8GuhAZh+Tay+I6m8tbaX9ss=;
        b=EHWe3TzrMRben7kKcHqWLRxwjMn9Zoh3Vl8UqSlxYJWPZjcnBvSGIN9bTihMpxzUHb
         RA/guB1BES0YUmvyUcKb4Qyq3+BF0MzkaBYEgFjYIdCS6gLCJO8VnRs8uF8ckXgPg06k
         095nuKsZYVuTJDWVeTafo/ZV1QuEDw1EQHXozNNgas5n3fimLbS/ZmHE11GetIWxRDKi
         /oHh7Ynp/U88qsMrOh5sMD9e7ZZEPwUeB0MKfmKmHiEvLh5cs4vVJIf1Rvkkm8vdSkaY
         4nL/dudGGuiUBrWM8c6TvfDj7qyCh3TFq6UO0/btxFIe59uqrpuXaxPzubQbI2gmnoma
         kqNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745392523; x=1745997323;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cOrKi22/dqfrB3rRPsto8GuhAZh+Tay+I6m8tbaX9ss=;
        b=eQd7TCv+dyqXRPtIAbXItDzsYD7+GF0FF4Q03s+5UXtKvNwauRgrSDo8xANX0tPEbX
         OY1GeHb/r3q3xv0cCmpVbN6KccFmfYFYWUvURKqKkYtDzKZeVJJzzVmydqs0EDEmnKa5
         urQNYmwyhYS7emkp9E6MK9pdQSykwOtbIAFv2KXGBvcvsyIT74LjVXHjLjTlmSW8QdUm
         81yZiDUKhwE7HwAi6YuC4jdxr5HX6LnSZPFV01leJ87ZLOOZk6NkOJZqEO4NqKp98pS+
         Slp98KCN0hJ2mV4jIABM3otVMxretZobezKyp0RJk/ZPrEIOYI4A78SWpi1n34Llxi10
         Rdig==
X-Forwarded-Encrypted: i=1; AJvYcCXKelsYtjzQaMON/quJZwbURAJA3ZqnB8kESzRyQAIlmq1YORT3J2Dmtd5NgB4Ilo6kMfouDE3l6L96mnkvfIKU@lists.infradead.org
X-Gm-Message-State: AOJu0YxT86uogsjWbBDyXTJXsuN1ettpVuD3GCaYW8l1t0R1Os5T7YHV
	6sClsFZOhZ1oiIilk2n2Qp9nlMzuTmt9X4IUJeRQ6CceJoMSsRU0inWlI57P0lw=
X-Gm-Gg: ASbGnct3Jwfhd86SloEe8FGKfZo2bMT7vmp6DdbIsEwMZJ3OO46eN51TTxwToQi7OrN
	VP5OunDwp5lrbNDl03nLYYDk2kEpWFiRKvBffLqvVXa7aevMGw/o3WfrETSsX4XGLcsTHKFq+ZO
	+2fztSefDh6kQ60tFGuaQjH5he7h/m4zjbILXHEnR1CHLWcypz+fQPiL2ohuPa6fYfj5Zc5H8Sk
	cic5wxOwMIi24q9QKOcnilOumL5XKhH/FSDWi3H0xILgl48/eApTXY7OXThSNCHxfFcAeTqbrrs
	CZoUbb4BHQJDSzU5rwWluUwlTEHswknZXYkGZ0xcapud
X-Google-Smtp-Source: AGHT+IHdkGntLIJpgevULhTBulmEF5ptbiFqEcKnuw1ZYC5LO7PfKcAh/nJQn8PlRTrDNV7n7jcsNA==
X-Received: by 2002:a05:6000:1ac9:b0:39b:fa24:950a with SMTP id ffacd0b85a97d-39efbadeb66mr15392672f8f.36.1745392522799;
        Wed, 23 Apr 2025 00:15:22 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:74b0:71bd:6dda:dcc1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa493446sm17696935f8f.74.2025.04.23.00.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 00:15:22 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 23 Apr 2025 09:15:08 +0200
Subject: [PATCH 06/12] gpio: janz-ttl: use new line value setter callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-gpiochip-set-rv-gpio-part2-v1-6-b22245cde81a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1427;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=oGCmkNdKxO8RV4qMx171fBCKku3RxsPW1rRe6wl5k5U=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoCJOC3ZB4v8rJEF242h0kCZt7/M/4vNi5Q9Irc
 rSkGUQUQIuJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAiTggAKCRARpy6gFHHX
 ci9aD/wMJoqanBDyhWyV2ciSgT4vnvNazG6/H6xjmAw90A83pI0LeE/uBgMTjVvQcXkJ5sq9IYL
 pMQSAJDO+V6stHMm3pb8C6op4t6h3Uc3VyntOGzonCdXOhYHjtd3z7+1O1AgceR1Sfh+XqzK8Ap
 RDabrPY6r0T60Q66e9DKH6C/GuUq++t7HdI6+p8bK+4hyg1KsZ2riCv/y6Jv9RDUwkDHeAgSPMi
 n+xeuvQH4kpG2kutaopWhLWTNt4QLNFjzcR3NR6t7PXKfsVZmXpG3wGWmCs1pazlZaoVTuidua3
 JPPn+8N1sO/TF+0t1fMuq7nmhzaXJy6wvGv7qUVzk4yVVZYqHd0TzaWfpTdXmtfcrTyGKVM1zQh
 WpNYEX+OG/GZqgllUCdo2g2HfGMcvoyyOtsArAdwuUMDRgyasslD5iMmf72CTQBi2h0boA/y5HD
 JAcVLK498gmhcjsDh8Z2B3G2OWMC4JnTWtyh5nR7PXGa+bL3h23eyxp58LPtNBE49yPAfgYZnkH
 EYbwRzldFMMFKj+1mPfhV0R4xDhTYuItjYD0wgpt8WkyqXqstGuhJJmEXA71c5ieMeTYtvYPDba
 LmT0B9ncjdETBR3ARAWI6mdFerI79rP7ovhcgTOb0S2D4kUYBribi4KtAcjp5K+gjNU5ZXZAJ5i
 2pDfSwy4Bdlnp6g==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_001524_578483_68E8EBFC 
X-CRM114-Status: GOOD (  13.21  )
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
 drivers/gpio/gpio-janz-ttl.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-janz-ttl.c b/drivers/gpio/gpio-janz-ttl.c
index cdf50e4ea165..9f548eda3888 100644
--- a/drivers/gpio/gpio-janz-ttl.c
+++ b/drivers/gpio/gpio-janz-ttl.c
@@ -76,7 +76,7 @@ static int ttl_get_value(struct gpio_chip *gpio, unsigned offset)
 	return !!ret;
 }
 
-static void ttl_set_value(struct gpio_chip *gpio, unsigned offset, int value)
+static int ttl_set_value(struct gpio_chip *gpio, unsigned int offset, int value)
 {
 	struct ttl_module *mod = dev_get_drvdata(gpio->parent);
 	void __iomem *port;
@@ -103,6 +103,8 @@ static void ttl_set_value(struct gpio_chip *gpio, unsigned offset, int value)
 
 	iowrite16be(*shadow, port);
 	spin_unlock(&mod->lock);
+
+	return 0;
 }
 
 static void ttl_write_reg(struct ttl_module *mod, u8 reg, u16 val)
@@ -169,7 +171,7 @@ static int ttl_probe(struct platform_device *pdev)
 	gpio->parent = &pdev->dev;
 	gpio->label = pdev->name;
 	gpio->get = ttl_get_value;
-	gpio->set = ttl_set_value;
+	gpio->set_rv = ttl_set_value;
 	gpio->owner = THIS_MODULE;
 
 	/* request dynamic allocation */

-- 
2.45.2


