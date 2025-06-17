Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2CD1C71157
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 13:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AMHaAkSc/mi83kBCslhtD5+Hl3KktEIZpzS91Yh6h2M=; b=blY5G7x9IVGf/rrl309TbWbSoI
	7/9yI9gQ7XjBwFfbCtnxx+l7+Dt58YaaGTcrG4K/k9s3apTuinPV696EXbNNbKU67oVoLhgi0L/gp
	PZDCoICPcTgadOxDdz6i6JlAxTrBYwYTB/c+Y2wcpmBA35hHiRl4uitsxkRUV2kX5AVAv8YW4QDej
	hRbDAIk94V++uaQKV/AOn17jdDDRpcHvYLTa0w/vE1AvYbZ4y+QcQ3Ka6aRAAxmyovG+7MMhkgGG0
	yTY2Zh6wfAMr5EBgmCTIm3iGiUdbq2SEHDEmfyRA4CoLkQY6e2QFstpBbRXCGtOHVHZI1uiereqVu
	8MaG1uoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRVyj-00000007H9i-1pTC;
	Tue, 17 Jun 2025 13:03:53 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRVMx-00000007B1L-3mPF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 12:24:52 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-451d3f72391so64097995e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Jun 2025 05:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750163090; x=1750767890; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AMHaAkSc/mi83kBCslhtD5+Hl3KktEIZpzS91Yh6h2M=;
        b=Lz5410cgpcSi273y7kRT9VHnE3KfAfOghk/bTTR91NJPyUKqPmL1cYqA5v0yQyjPKy
         hU9Ej5SfouE+3UVH1+jMADD7SYjw2DZD+fK3ad5/yee1SKqw566SyakogpubZ3FlWZDV
         GWWDFRilD3Id24FJp/heYuKlmmM+0efPGbJ/eGUDHvtmYO9O9YQjk8QUzXDQLY/BCDgH
         oK6RgSP2jUWi1MnnBWgGtyJ4x9/wu/wfyJt+mgudaL71ntQQPbSlhfAQUX8OvTAqlcQG
         yc5p+v35K0227OyqFeYLXaC3Cv7uRcyqbNVEnlvUpbqz2cHS6VNqF8EhdGr2OUhNos7J
         eWkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750163090; x=1750767890;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AMHaAkSc/mi83kBCslhtD5+Hl3KktEIZpzS91Yh6h2M=;
        b=ObQNVi3rkAz/m1mBALvNWdq0esiuGmftJUBHvuN+raSlf/TSTEQ/UrZyuxVBB4xZwf
         5t3t+CA3M4TIZA3mnDlMzjhX20AFpgoYAmD/9hSxewhTy64K4Lu3M5GmbVtf+FTrQZ+D
         lPjc4MrhPwTwKnH8IFG4x5QFVoBkFwduMgwjUFc1EL840PmrYevP+A1PW7DQVXQ4AosY
         qB0nOnKHdGdEwoBF2qKT1y1SrNk4IDut9jRfei4U5vHob50buNQYMuxr/Pe5Yicv8pMt
         z0P1V86JM2YJfWUcf7TiT/nOQJwini6HAtiX6CpcFjXGhnYm5hDKOJQ0GH6DdcatZs/U
         rscg==
X-Forwarded-Encrypted: i=1; AJvYcCWk0xYAinE55wau/hjGrFPY1eiTAAef88oUfpWfDMjxSC10v7qdCUmtt6xXqUYJVN0PNU3A5WxbphDtGHx/v+O6@lists.infradead.org
X-Gm-Message-State: AOJu0Yx82RLVhmn3ew+sN8AzUKDNgEg0iZp+0jsY8jbupRDgAm/+aHgQ
	/CWMG33mY6nYB6RZNNFp7K80fYJbhx+KegwqquMEmo29GGAUhBVTeHOiZ6MhiNFxnRk=
X-Gm-Gg: ASbGnct192Ooytf3xSbqDng3XvZ4u/Vt8oLDdz5gJGFJdnpF2I8BrIyJauCXxUVFQsx
	naYtYheV8oPj+7Yozm0sUGgnLniSegR+YJ+iWMC9K5NehWSinnbcXI/RH7taqekI9W0KVY/zkUv
	HC3UtpO6NbeRvDXJpwJt+HmmcHFW2AS76caWNdOZGuQQE9bSOai4+EOO3mROZDA5PJFoD+D1cKJ
	zjaMTpTw/0KcTruv5IkoI2AvjO7S+0cVS0ZnadYVaeWfCrg6H4Ia+M5B3I6ri+P+tbl9VjKabPQ
	4Q7igep5bAp+upY34tQdOBmDhPw8qs3N8dYo7iry4aAKJU1ifivnF3mg
X-Google-Smtp-Source: AGHT+IFmKyHtiTnK3f0MnCL25OY403d6ySVCu8IrYmqOaI/BNa9QItLKGnF8DD4RrTrk/qX7jMZHBg==
X-Received: by 2002:a05:600c:6211:b0:43c:f8fe:dd82 with SMTP id 5b1f17b1804b1-4533cab86f3mr122978975e9.18.1750163090447;
        Tue, 17 Jun 2025 05:24:50 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:90df:ded7:9cbf:4074])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45320562afbsm173816135e9.1.2025.06.17.05.24.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 05:24:50 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 17 Jun 2025 14:24:30 +0200
Subject: [PATCH 08/12] gpio: rdc321x: use new GPIO line value setter
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250617-gpiochip-set-rv-gpio-v1-8-903703881fa2@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1631;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=/FTgaK1cWGc0DF5sQuXKwdEauaSqv0NFqrELnWAzquo=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoUV6HxI/Kng34JgzZDWKYQKf8SOY7GXUJq2cX/
 QrIk9Wh/OmJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFFehwAKCRARpy6gFHHX
 ckXGD/4/iUM3v0T5QVM5vI2RC3Ut9NdycYDtiCIwbZFmIIZxah5HGVAYFj4hHNnnDmHgbOPKpbJ
 fvfFgQvz45DeYQkCt4pQiGZv0Qd/SqIgbJyYhc5qEtrMsyae4rhudlBYsW1omeeWw3WKZbpYJZa
 H+ZxUmGbPpRYWJ00ByGxGN7U0XwLEnGzdN9MFBTbMF1l2Skr6JR5xW7GSYEd8W0DUF+cKhHGlkG
 tTM+8sTClgTZKEhTwPU4xRm5iPN7WOjcMk5DmY0mG1UEXbySHcesZPEJNmM21B1+92IRk2JNe2H
 /VAEi7V/WkptmnNksEJ69Il01MaFBxMz4pxCQitD1TitfnJFmPkLjrzKbdrn3TyYmUv1CS7Pwb5
 53BODlK5dE7lx4Aa7oalaaEuB9jUi95cbAT1NggaAMPcYGEtV4/osEVsgvFJgHmjqaNyMdGR2iM
 u/8qM+PA9O3kTmWneQ3nO2PYpET16aDMNTOLjSCwKd2tTxzIdjoyuANw12R51w7RQtzXyGNmcKm
 JK0IqnHKNBngn1OgNpXIZg/JEi/UpIzFhPzRsekoD4UsX/FCcFFWQCHncvwQ2OxaBBGY6qcMZll
 HdBrKU+g5SxgCmCazOJbDue5kkTg2eLpczzEwQyUiVYZqmBmf669E2jH+28FaLh6L+A5WIdC8L6
 E+2w4xVaUPZMexQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_052451_933773_842BFD78 
X-CRM114-Status: GOOD (  12.96  )
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
 drivers/gpio/gpio-rdc321x.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-rdc321x.c b/drivers/gpio/gpio-rdc321x.c
index ec7fb9220a4747fad5dfdb88e25e68d2a104e37a..a75ed8021de57db122938e4736c3ac994bcdd2d1 100644
--- a/drivers/gpio/gpio-rdc321x.c
+++ b/drivers/gpio/gpio-rdc321x.c
@@ -64,8 +64,8 @@ static void rdc_gpio_set_value_impl(struct gpio_chip *chip,
 }
 
 /* set GPIO pin to value */
-static void rdc_gpio_set_value(struct gpio_chip *chip,
-				unsigned gpio, int value)
+static int rdc_gpio_set_value(struct gpio_chip *chip, unsigned int gpio,
+			      int value)
 {
 	struct rdc321x_gpio *gpch;
 
@@ -73,6 +73,8 @@ static void rdc_gpio_set_value(struct gpio_chip *chip,
 	spin_lock(&gpch->lock);
 	rdc_gpio_set_value_impl(chip, gpio, value);
 	spin_unlock(&gpch->lock);
+
+	return 0;
 }
 
 static int rdc_gpio_config(struct gpio_chip *chip,
@@ -157,7 +159,7 @@ static int rdc321x_gpio_probe(struct platform_device *pdev)
 	rdc321x_gpio_dev->chip.direction_input = rdc_gpio_direction_input;
 	rdc321x_gpio_dev->chip.direction_output = rdc_gpio_config;
 	rdc321x_gpio_dev->chip.get = rdc_gpio_get_value;
-	rdc321x_gpio_dev->chip.set = rdc_gpio_set_value;
+	rdc321x_gpio_dev->chip.set_rv = rdc_gpio_set_value;
 	rdc321x_gpio_dev->chip.base = 0;
 	rdc321x_gpio_dev->chip.ngpio = pdata->max_gpios;
 

-- 
2.48.1


