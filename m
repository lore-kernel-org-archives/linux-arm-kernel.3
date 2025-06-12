Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10D81C7114A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 19:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qXOeSoBKwd4+haJ3JvgSLXQF+sIOgqi9Fow9Bw5pk0w=; b=k1XjGO+W8GnA0NeeqJxW/j8Ifl
	s3FzgZpMn8KwFH12sZiqQmUdlAtV0qmjObqeRHxDkFe1/lmT/iZdpv8jG9OemhqRu7yLvYflKrJ9J
	QR6REcSaMki303OpEigjTiFu/c8uuzGV9wwDQ5HzPiiVMpLnemLh9pEg696OMLr/EUjQ9kGHCn6rs
	dQjJvysMBjhmnCJEYkd3+9PIp62kyRXXAh6KsZj3Al+oPNerY/mYe8SYMrzk/ejprFhaTQGNy5W+F
	cQ0EIZkzsNRmBzarLosY089H9VBrGuab7UgTC07i7JuPeEt3QdYYHY9V9nSttHzDVamTw052jsEbv
	50Suen7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPnnb-0000000EEaR-0S58;
	Thu, 12 Jun 2025 19:41:19 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPhmV-0000000DLq0-2eAs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 13:15:48 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3a4f72cba73so1510089f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Jun 2025 06:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749734146; x=1750338946; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qXOeSoBKwd4+haJ3JvgSLXQF+sIOgqi9Fow9Bw5pk0w=;
        b=IOnz4p99PrVvxDW8b0aW/SHI9mhAyFqAczaKKJ/Ks6YlbX6KahzmWda1RFYc2H+939
         O7Claw3492v4G0l8aYe6XmyyWsDTj0tntA7JfX9i1BzLljERErmLNCxnFPRk0jnzVpZY
         ghSYX44jQywqZkMvCOkiF2D9CvVjq9RcAr1Q391IM9BWxvOiyg0YlI1zfnprAv9p9Tq7
         VxF0FavXKNqfZypi6zAfFpiSyQyuIyRHGRKMZe0yC+KQEG4EtIhdJiqTpFD8k3RUjEue
         TXEOUMKwOpyQ3RMmXFoQ260UM9uacfFN7mnHb1QRrRAZCeTBWwxUwjRTAhvPEu+bIZJs
         ws5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749734146; x=1750338946;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qXOeSoBKwd4+haJ3JvgSLXQF+sIOgqi9Fow9Bw5pk0w=;
        b=PPFU98nigy/7itL4xxIBrynGsCdSoPM0n8H4aVqlelnsGMkef3EafHHuo8iognrBsT
         KO7Y8bP5AMRwBu78K8X0BDPvxpsSvVLwfyBin1OS+/k6aK8kB+6oIWrEbEbEKX0Eh2L1
         1PlFwTQRcHdiTwWtFBHsmDvKRT5q/fvPEkovIxxYSZ68QrKPKdeoLqe6QGdxQIIpeChd
         tMMtz+ktE9j+JZ5FrZ1qR4Uyb0j9+Pc4SODB/0JEiURsIv6viNk7lgOhfEFWQwhNY8uI
         qqJP35q1/c5a+pzdc5Fmqn1Rat27cVKyrEY4NiIKTQbndcDyOtDkH41RrSK0CQk4A4+Q
         pKrw==
X-Gm-Message-State: AOJu0YxxIv3t6c3XjaengbeEDn5K8aewzF1IusA7zv+Pq66MylAIZAYk
	IaPulALNeUJwRUzvT0iQkZjL78kNCxS21XM8BFvHIrjNrHLibW3BTq7bRP0bVxDjJOY=
X-Gm-Gg: ASbGnct8IWLLi61xpZKxXlBQJshhHDUy8t8tDLG8o/u0G9aU0Na9xZ2jihx9xGRCQvn
	FYZkK2djthBcK+iK3QQmqedU0aL2A9qTuQkIYBRR3n1v7iH/lV11Kq/7Hy5bDJBCyGJMwhuq3eC
	YFYsgbDr4VX34Xq0inwIsrj30xJ2JtzTdW1dB/6AUXPrNhb2Q4sgUTzCbDkAdbQVvGheKfTvqV3
	sbHItdiio+0ygeJxs3RUioHh1KYI5STff8ps957C313XKqeLZ6uBWwpzxc24MQBdns5AEosXZad
	DyOi0aQF/BZAq9+qyPiEGk9ZAOxMQfeECFDtofdBWZ+r4A1OnIy5xnM=
X-Google-Smtp-Source: AGHT+IEnpJ6Q4AZ8oPyYmaUzcDZGuReMq7lbniJezZBAPId2TYPV/p2NnMGPvdWDp/pysd3sY6Avhg==
X-Received: by 2002:a05:6000:1acc:b0:3a4:eb7a:2ccb with SMTP id ffacd0b85a97d-3a5607fa6a9mr2707038f8f.16.1749734143769;
        Thu, 12 Jun 2025 06:15:43 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8b99:9926:3892:5310])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532dea17d7sm20619795e9.10.2025.06.12.06.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 06:15:43 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 12 Jun 2025 15:15:25 +0200
Subject: [PATCH 16/16] pinctrl: amdisp: use new GPIO line value setter
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-16-556b0a530cd4@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1643;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=ME7t3PhskqpuTEodGS0joNb0JvX701e6DVecRBqhzik=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoStLn8MZgPfXtIzTahad3jneTgIaic/QOkZGyI
 SGVy3H/f3GJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaErS5wAKCRARpy6gFHHX
 cmoRD/0a+ixlOlllZnxdQ3IwiZjofhYGTNWzylVmVuilwkjx74Ac0WhwgNOgk5uCmmF2NGn47Lz
 E435pD4buRkFabuolt2o9TL8wMz/0RDBg32C9bjwz9fezuo6zTgzSwOjEh5cRd647C84rRl0KWc
 YHu+TOoz2o4uLlV75o3nQTqLM3l1jFVZ3+VSt31kn1Zavk6/31+PgUYiSjgTIsxlT/Gdps4VRtH
 wa/aiQgsQsiFHtCM7iv1U583mqmt1fyy3DcZukPCRuIyWOIBMDvi/gqk9leFU29A9h0srxVog+b
 2atd0fQ4ad1OubxK41SjP79dMWtYCixfFespdF2IrwaZrVN03CtyobPyUeIkzlYqy+j+XcVocDO
 NjjWKIYMEYJkruZsAOCp6RnA720dgwIaPMSHCb9EL/t1FuLODewQSnenP5FeWSZaiw/y0s0HNWE
 u5xsj/scBHbfLBGmsXxgSr7mOO9hzjyNxYki8z8+PdJQHiEWRq0F1D+FoXcIHUqQ4YrQK5Dawhw
 aQuOGjzWqV36vIoUCA26atb3hiQS/pIePKqxAtnWOg9w2ghzZB8deMzBPTGDg632LEnQYGzr5eV
 2jZt4jkSxcUYLzAs2RNnPoiDh546HzSIvkw36qrNT2LHX7VrBQPLJOJDSZX0Wb2L7MnN8xnEan/
 UkQWDDMnqWN8GnA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_061547_690251_E1D2BA8A 
X-CRM114-Status: GOOD (  12.52  )
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
 drivers/pinctrl/pinctrl-amdisp.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-amdisp.c b/drivers/pinctrl/pinctrl-amdisp.c
index 9256ed67bb20e9eefef6c6574f1b60d71814cdc0..2e706bf8bcde0536b9e09614665d46130e12c406 100644
--- a/drivers/pinctrl/pinctrl-amdisp.c
+++ b/drivers/pinctrl/pinctrl-amdisp.c
@@ -117,7 +117,7 @@ static int amdisp_gpio_get(struct gpio_chip *gc, unsigned int gpio)
 	return !!(pin_reg & BIT(GPIO_CONTROL_PIN));
 }
 
-static void amdisp_gpio_set(struct gpio_chip *gc, unsigned int gpio, int value)
+static int amdisp_gpio_set(struct gpio_chip *gc, unsigned int gpio, int value)
 {
 	unsigned long flags;
 	u32 pin_reg;
@@ -131,6 +131,8 @@ static void amdisp_gpio_set(struct gpio_chip *gc, unsigned int gpio, int value)
 		pin_reg &= ~BIT(GPIO_CONTROL_PIN);
 	writel(pin_reg, pctrl->gpiobase + gpio_offset[gpio]);
 	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
+
+	return 0;
 }
 
 static int amdisp_gpiochip_add(struct platform_device *pdev,
@@ -149,7 +151,7 @@ static int amdisp_gpiochip_add(struct platform_device *pdev,
 	gc->direction_input	= amdisp_gpio_direction_input;
 	gc->direction_output	= amdisp_gpio_direction_output;
 	gc->get			= amdisp_gpio_get;
-	gc->set			= amdisp_gpio_set;
+	gc->set_rv		= amdisp_gpio_set;
 	gc->base		= -1;
 	gc->ngpio		= ARRAY_SIZE(amdisp_range_pins);
 

-- 
2.48.1


