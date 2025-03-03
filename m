Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D75DC282CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 13:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tcjPMcYJBZ0o2cTrKN4oQq7L05UvaqKLS11WKTvT3CY=; b=foPRMaHj0Ga0NUL/4CPpkfN176
	SoBEiMobRjzvlQvUZuxrVdaXffCjCs64A/GpU+4dyC71qrl78t2RKPi7+LUA3hNQLAt6Vx+csFScy
	qBU1MpRh4B6UwhjGT7P83mpq/dvx7HlTKvWe0jAW6nw083J9/9PFyjt5CC+9FpNC0WNoy102q6INJ
	F8h9axUZXoH2lwgGaciUzlw+4khm3N3RXWNNDmcKNiR5yu8Kx9gGR9XOPTWK583JXF7ZOZ0xipPpP
	aKfkNTleoSblKyyYLokmDUlliQDMmT+gCcdC+AuwtSceIkh1RKWp104WWmQ48XM+Rf2JcyCrwwGvA
	L3F1rlGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp5zu-00000000x3z-2Lue;
	Mon, 03 Mar 2025 13:38:18 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp5h4-00000000sbA-0s7q
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 13:18:51 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-43bc6a6aaf7so4830355e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 05:18:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741007929; x=1741612729; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tcjPMcYJBZ0o2cTrKN4oQq7L05UvaqKLS11WKTvT3CY=;
        b=RrkHeU70OE1MiWr/PqErWDwRDFxFW8k2eLmxTQeLHmtzZGW4r2TdmLUupJ1faYbuhA
         3uWWdes9NK8OI6vUoWLud3DUCoCyyR2Uyb08gVkj6BlhzpalNZBAo54TVnGQ+/BWPqd2
         IcM6fu8UQZNPdWlgCvTH4nq9+ccf7PCwBw3A1pJW225pnBlTtQQclsHYXGOhe5uegBG8
         +cvqi6zVDgtfISCMlSKiHauUvXJ0Z4hcBEyunmZnMKTcPX5y/8+kyU1CGk85WhU7EikY
         3RzltM+pQP9PJyLkTual9+t5CZNHsZXmSmWJVYpCHFcl11r9rryKZ20mwCFRUMg3P1n4
         EgCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741007929; x=1741612729;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tcjPMcYJBZ0o2cTrKN4oQq7L05UvaqKLS11WKTvT3CY=;
        b=rkVOkFgp8suC3Iy/4Z1papcYOmJdrpe7sKfSfs9J56z6cxpMaWErSqOXxPXbvk18QS
         aW/XiafhzPz5YQj4KRnbWwlESIzPAa59yeEnmOcNJJSvvuryjnMi8/XkSPQK+g7+xYcH
         o53ZT8YRTnJpuoLBI2zMqWh/32Ma8nygA/cwf+KO8bJHuAFE3SLTcrFarVVHEcQ795+2
         4QS/b71W5V2YSo7DQrA+Q4kDNWAcua/mbQrpEwhG13LKIRkG8fqyBm3hbtz1MMwreOcy
         y776nQRAWE81NVBtooFKNEBv8YihUKq5KrVaQWTJ33bRB7gUuCy2vJrWvOx5fENtRvFw
         Qrvw==
X-Forwarded-Encrypted: i=1; AJvYcCUIWQvDg7dnYSSUUVQxwOQoz0dMw7lpklm6Yw04UDHI7qGiyQ4u5sIfm1xsRcb91n46Krajw9u8GK5AcIpFq+uE@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6hfj8WfMFzrZwjO6SaAGfIco01zZ43uQK/ksaQOvUzr038MvJ
	OLLs/iiZlI04YY4BIvn0od9g3siiPFUSqVwiiihY+T42vzSNt4u60TXlKhJs5rw=
X-Gm-Gg: ASbGnctoz3kp84qQ+u+kYJR4tE8EV0E0dpCKvtsqmQgrI+jx5tpbjqwIsJzGTcbJ22j
	qmzjAPuDeXud6WY3mQWPabhuBfdzKtC/qj6/mezAH3kw4gXW/X2X1Nve8uZLdxS/aMfPXCgf68O
	Ug61bRZcAOb+YWpM2b+tFFSG/8fM0RIUM2yIjdhkPkHMkRskhyGYFm95DqpnFBqtRLUGEBNWi64
	MwkFuFUzj87LCzJ+DnbLHHx89hxSrmVt1JBVpsYLWmNasOax6cxZZjwcP2genUJaVxEFy1L3UDZ
	K0eak+XSmVPR8+aL/Cv0K5/3Z8mf6959mYrdhg==
X-Google-Smtp-Source: AGHT+IFhho4idDCteO0g9jy+tOrP6KrDeOVzx+yLtKrh7942wsW3Cz+EGc7Oxn5Z+QFnIfxYQ2MoJg==
X-Received: by 2002:a05:6000:402a:b0:38f:2efb:b829 with SMTP id ffacd0b85a97d-390eca815a6mr10808948f8f.50.1741007928914;
        Mon, 03 Mar 2025 05:18:48 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:664a:9e92:6aa8:6007])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba538b9fsm194821915e9.17.2025.03.03.05.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 05:18:48 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 03 Mar 2025 14:18:35 +0100
Subject: [PATCH 10/15] gpio: amd-fch: use new line value setter callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-gpiochip-set-conversion-v1-10-1d5cceeebf8b@linaro.org>
References: <20250303-gpiochip-set-conversion-v1-0-1d5cceeebf8b@linaro.org>
In-Reply-To: <20250303-gpiochip-set-conversion-v1-0-1d5cceeebf8b@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mun Yew Tham <mun.yew.tham@intel.com>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pwm@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1534;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=9eVt33K4IbRQUOdQWj39q7CiV8Th/sXfepGKt9kNNRE=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnxawrbxiPGpQVYAB1cWmhKX+ZK1p87IdH7rSqD
 6Mm+ENK85+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ8WsKwAKCRARpy6gFHHX
 clwvEACG9rCLcmUYrp6fcssfEz6AE2R/ukaohKncxCYYbAX/rW2pV6g+qY6GaJWEFP/n+qRUCca
 ImG6zhs+hxyTBrKTa/UlVdYUJMjn4SC2ZsshH4eCzDYkBTiomLn58bzkxBStRBammI+K8qAMe+W
 dCldrLdfZs5rcbotRVzZ5euHIH8eaxeLOcc7+h/rjfEPxvoo9Q9OW1xkuXDdlGC84fhe62YuFQc
 WXdlZUhLBFXpS592viL036bqrGlAxbLiyeipEndPdG55Gjf4PA4N5d+gk/7CTfBaKVfogJoAJpn
 HXL5h4V2j4ZYkhM162i/zGVjbCjPAAGyLXeXM0iKK2WsHFw7YK85chRrCfeNR27SL+KAggdJFDG
 x6Sj/xaJb5rI2J6b3G+kLy99d58hPQyaUVABsOxZHbaz1Y3gn+esMOnlMvCmFY3t5/8CQBoaZSz
 6XuVOZi5+dPUcDuKWKd7+lUtYO6o6qxcDz0ihzBmZTZHvZ9C/UjaPSGEyWqFZA5uEsY+M/BxYn3
 OmTsQWqVYC3khOl1eGCcdDsPjXVl/JBSdtQkwkLTm43s+Mrcn3DM/Z0y0qbEhYFDmcFbEnhvF9A
 w55Wpdx320FOGUTebh6MXxEg24zWayCUlfM9fuESpR/+LoXYGDpe3LaVTd+KG6tcYr0WqBZEuvy
 9Imns1QzMQEPTcA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_051850_252524_577D6DF0 
X-CRM114-Status: GOOD (  12.51  )
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
 drivers/gpio/gpio-amd-fch.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-amd-fch.c b/drivers/gpio/gpio-amd-fch.c
index 2a21354ed6a0..f8d0cea46049 100644
--- a/drivers/gpio/gpio-amd-fch.c
+++ b/drivers/gpio/gpio-amd-fch.c
@@ -95,8 +95,7 @@ static int amd_fch_gpio_get_direction(struct gpio_chip *gc, unsigned int gpio)
 	return ret ? GPIO_LINE_DIRECTION_OUT : GPIO_LINE_DIRECTION_IN;
 }
 
-static void amd_fch_gpio_set(struct gpio_chip *gc,
-			     unsigned int gpio, int value)
+static int amd_fch_gpio_set(struct gpio_chip *gc, unsigned int gpio, int value)
 {
 	unsigned long flags;
 	struct amd_fch_gpio_priv *priv = gpiochip_get_data(gc);
@@ -113,6 +112,8 @@ static void amd_fch_gpio_set(struct gpio_chip *gc,
 	writel_relaxed(mask, ptr);
 
 	spin_unlock_irqrestore(&priv->lock, flags);
+
+	return 0;
 }
 
 static int amd_fch_gpio_get(struct gpio_chip *gc,
@@ -164,7 +165,7 @@ static int amd_fch_gpio_probe(struct platform_device *pdev)
 	priv->gc.direction_output	= amd_fch_gpio_direction_output;
 	priv->gc.get_direction		= amd_fch_gpio_get_direction;
 	priv->gc.get			= amd_fch_gpio_get;
-	priv->gc.set			= amd_fch_gpio_set;
+	priv->gc.set_rv			= amd_fch_gpio_set;
 
 	spin_lock_init(&priv->lock);
 

-- 
2.45.2


