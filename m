Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D9A1C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 07:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5A9jSD/uIlp6QoHu76NxtQ37T1ywzmxmW0tNa71VcTc=; b=431JhBdNa054DNtTgpSNVZOtIA
	wI4Xafh5iuk5mczh+zPo+QP/zICg0TKbzVEwtqt/Z112OiwG45Pu5y3ThEMcgmHhD6hG2qlmmNM76
	DxxHWyey5zcd8Hth6LTxq3pwMDPuaoERkYsOj2Bsj1dbb6dcS2PFZ7Jy+EwOouNw4xq0pix5xa6g5
	mra9Rm6/RuGA9LTLh6JzSgO7tQgvjJ+S2GRGhNDAOF2Q2NQbBvyTET0l93UrLxwMpMZFHDGAtzb6t
	eqkA1q9MvLIucHeUyRkZv8W3xaaVsI5CqAAbo268iQtiGTgK3RHq6XFfudjo1Usy/SDJO33a3UxpB
	JxCahIjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Ue8-00000009XiV-0wYw;
	Wed, 23 Apr 2025 07:35:52 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7UKM-00000009TWw-2837
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 07:15:27 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso64606715e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 00:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745392525; x=1745997325; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5A9jSD/uIlp6QoHu76NxtQ37T1ywzmxmW0tNa71VcTc=;
        b=udw1rdEoS5V5rEoCJmAmO5BrJom5ientueHnFB01rfrkEReTXSvxzHvdJfdpoGHnLF
         B3KKaqE0rsARR7lLVljvtFssH9bvk9Xrp+yGmlCjLOo3z/MHyO1AvXuJZIz29QJZRcCE
         u0DEsAO3C/6NVHNZNi9bZj/h3/IwAUjk5YG0fM5CmZeC/DbrE6g2b8tA95dZZlKeB2SR
         EZM+bIUZmBhvoW/M7ssr6lyY4L0GXbtI3wKq5IeSxL8xqt3HDVsKpO5xHDgRwE/2MmQ3
         GN8XpTqGS28dXsOWm/fZ1bBobTpZDGkGQkh11jtBNmFLA3l/hWmm+mpxOJdUlmPLp5wj
         20UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745392525; x=1745997325;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5A9jSD/uIlp6QoHu76NxtQ37T1ywzmxmW0tNa71VcTc=;
        b=J/1l9QlubtElDjfdZTasyN0Ik3jsOYoY0CWoxwiT4n2Unx7x7IfBtU8tGK63j5qxo/
         Y7OeUOo1xhPZ2sdrWGmg3ivgwogd3ADGf7Vu9hGXj318CCCtvlfft/a9QqW3sXtOfdJ8
         Uzfjeuw1Qlep78Ues+sShMnFrLciRVJyf5G6EQKKfAv2IJcxf3xtGaAmEe1/EbPjjL1J
         NsUjSrX5TALsECQbm9pMLOar0dGMbXWQsulf/xbL+rAfZbjmXK+uidtMwuQBh5jNn6pv
         BwGheW1i/4Qlh1XjErR65jUZ82hZUE9ql+6tIusPCfL325JK+Vgdy3DLrlo0a0Gifigl
         T2qA==
X-Forwarded-Encrypted: i=1; AJvYcCWxMZOGphdMuIGRw7UYlEDLf6w/vPOgr3eZFj39hA4uxOEnxezjfuXPvNAOGVtCtcK3ZC5CMDV/F/r5opKQrTYb@lists.infradead.org
X-Gm-Message-State: AOJu0YxcW9xU/Qby+/JC1C/dp9UKSkoNsnXj5dk8jIzKako9Ne0HFE5l
	w9h07Wc/6vbDXGlz0Ksj1ginP684+Q9tuk4wskxF3KaARCK/8Kp2Sl63RW/cSYU=
X-Gm-Gg: ASbGncvFuHb/V0x2H6cOjb3TdaZHOz4d7C19MIJEWTbuLqoDnALA9qfFUsN72qu8/q2
	7bvh6atj35LxdAVewfoSxh1YkItHNxMPFzIfmFUAlZkYDSt5yzwoWNJqSOtt/85q8aElhGCtb9j
	AcvdUzBRQjgmQtwEbT9ewuSks/U98sCnu6cga9mmVCh8MDsI7xZfELgbE0BjvtigOhhRQedGl7o
	2wSsch7FfN8PASVKwm8QRIN9iCylr9c8zR2dpv2hn3t5OqwTmBXcwYtfVxESHYFZU3dW45KpCui
	1GP3cm/YxsHrKhJpSFFwbopCwUhlV5/fTg==
X-Google-Smtp-Source: AGHT+IEn1spt/h2u5dpKe8vDHbB7DwPQ7hB5lVmJHia8LQyke4IXqZH06mvc9G/kfquH6FxEAPcrzA==
X-Received: by 2002:a05:600c:1914:b0:43d:45a:8fc1 with SMTP id 5b1f17b1804b1-4406ab70701mr153653645e9.4.1745392524615;
        Wed, 23 Apr 2025 00:15:24 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:74b0:71bd:6dda:dcc1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa493446sm17696935f8f.74.2025.04.23.00.15.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 00:15:24 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 23 Apr 2025 09:15:10 +0200
Subject: [PATCH 08/12] gpio: ljca: use new line value setter callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-gpiochip-set-rv-gpio-part2-v1-8-b22245cde81a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2030;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=b4e9Yh21OkyIv9obgoEt9uaVpzJ2jn0uGM1AhPkmL8k=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoCJOCVzTKB9P3OgjYJzBe1LF+XVaeO2f9Li9su
 ekmz2jV/HuJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAiTggAKCRARpy6gFHHX
 chT0D/9Pz0ea0xoZZIO8L5T7J6QFHTeq5HWhqnCTnNTNkelWPIudJu0KNhs3oCRhcZT/u71VnLL
 WcJEsXuNcdIoK7140LbEMlu3xYC61N0tP0CCMtrRT4B4Ddv2FQZY9WOE3FaFsluPeeDlaZKjIJI
 xNbkSCV/U3XJO8dxLCewcUf+ju3Tb/kddy/4qFAC07yNbcjEEKFg8wROjW10gAQDu2L1famCSmL
 Q9vP0Fiynki7tK7OSm8dDdN4a3oLsmuyx+c79R2h/o0YnvAoivFZXfoe25SwXg0BRkk+hWRtlZP
 r5c3EhV8g44ZfP6E4D9t2xzFNLpuV3pqruIsgzse5vuIsW2UKLFzeiq5MTArUpDRuj8jiuDNbSO
 g33fz+nv37+1yzrIzstqCtSuNe0B64gixzlLEmRlLxq2yrM2Dsmr/bMs5upNB4UdlU2/Aoa1wp5
 QPqX2giIFEH+huZ65p+6UJoPU067Q/kFuZmGVO/KzrFNMRcO0EWeyspwsBTBBK/+1FdQPADGpI7
 gDrHr5UCRdmfoCd4bQLS7C4AosydlvVkfNTnSjgy0JK9ORZcpsKIYzxEnUyHHfv2hSrdqJO98MO
 4I0iE2dE1nBKtQKxvrFQRIF8qPKrJtCoHpZMSJci3zKDDWnqShghUOaMKQpof5pYSu/UYM6rADX
 fYZqx3dLCF4OPIA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_001526_772043_81D9BBEE 
X-CRM114-Status: GOOD (  12.24  )
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
 drivers/gpio/gpio-ljca.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-ljca.c b/drivers/gpio/gpio-ljca.c
index 817ecb12d550..61524a9ba765 100644
--- a/drivers/gpio/gpio-ljca.c
+++ b/drivers/gpio/gpio-ljca.c
@@ -144,8 +144,8 @@ static int ljca_gpio_get_value(struct gpio_chip *chip, unsigned int offset)
 	return ljca_gpio_read(ljca_gpio, offset);
 }
 
-static void ljca_gpio_set_value(struct gpio_chip *chip, unsigned int offset,
-				int val)
+static int ljca_gpio_set_value(struct gpio_chip *chip, unsigned int offset,
+			       int val)
 {
 	struct ljca_gpio_dev *ljca_gpio = gpiochip_get_data(chip);
 	int ret;
@@ -155,6 +155,8 @@ static void ljca_gpio_set_value(struct gpio_chip *chip, unsigned int offset,
 		dev_err(chip->parent,
 			"set value failed offset: %u val: %d ret: %d\n",
 			offset, val, ret);
+
+	return ret;
 }
 
 static int ljca_gpio_direction_input(struct gpio_chip *chip, unsigned int offset)
@@ -183,7 +185,10 @@ static int ljca_gpio_direction_output(struct gpio_chip *chip,
 	if (ret)
 		return ret;
 
-	ljca_gpio_set_value(chip, offset, val);
+	ret = ljca_gpio_set_value(chip, offset, val);
+	if (ret)
+		return ret;
+
 	set_bit(offset, ljca_gpio->output_enabled);
 
 	return 0;
@@ -432,7 +437,7 @@ static int ljca_gpio_probe(struct auxiliary_device *auxdev,
 	ljca_gpio->gc.direction_output = ljca_gpio_direction_output;
 	ljca_gpio->gc.get_direction = ljca_gpio_get_direction;
 	ljca_gpio->gc.get = ljca_gpio_get_value;
-	ljca_gpio->gc.set = ljca_gpio_set_value;
+	ljca_gpio->gc.set_rv = ljca_gpio_set_value;
 	ljca_gpio->gc.set_config = ljca_gpio_set_config;
 	ljca_gpio->gc.init_valid_mask = ljca_gpio_init_valid_mask;
 	ljca_gpio->gc.can_sleep = true;

-- 
2.45.2


