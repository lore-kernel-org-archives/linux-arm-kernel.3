Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47A29C3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 10:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EqJOkLDpEbdjHj6y0NvdqBxAKuQLVchFLzPyCOvEcoA=; b=hojlJfGQ30JHDm+EKRdRIaJ/K9
	s8syqX5jL77GNi0o03eW8HOwUBRow9ci2RZMybdD9Sq5Q56ZrGohOSk2CbxecJQilHXz3kI3h6RM9
	cgQHbpuL65zBvY+esewAU8IiYrkYarOSFfFEuKJKt2RYfaiPISGahuc2OVh14T8IcATQTRYQrTdBR
	nJQ+0soq4XUV8C0l3Ek8im69e3o3GJGoL3q4azOyjmarXSQQgyjk9SiMKttBr+9g+5Gw8XBtNyqeQ
	THfN74aXahTOxoVGG3YEXkCjxTRV8LqgPim4r86UtdrKejoIW3wMooIJzQcOoq1WBX6fa+Kc8S3OT
	ew6fSScQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCF96-0000000BVGl-0Rrx;
	Tue, 06 May 2025 10:03:28 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCEBg-0000000BFyt-3LW2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 09:02:06 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43edecbfb46so29923385e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 02:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1746522123; x=1747126923; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EqJOkLDpEbdjHj6y0NvdqBxAKuQLVchFLzPyCOvEcoA=;
        b=lD+X+kvwDhsyuhC7rk5YNs8ORuwp1UHiuGqGseZm1ykRL+Cu4QXxTAuBGUJ2YVdXXZ
         Vs5TDBPuvaiYFALcVoQC6/IOGCbuqCaIT1whh3SnzDoSldCgpl2G8QnQNl163r9Kn8Pm
         T2o/MJr6E7WBYrFJPHn+ddACW9YzCw64oq5z32jhBbE5fvPgjFReJIdwpArdVZBRsWYa
         /6ui5EjC3Nj+2lVRcPW4201IXX2bHMv/U2vgHJY5hzYefuQNqx1vx1HwLGmvH7hFb+Yx
         Ax7O2lzGVM9pVfCg5Zp/syRAXEb+Z7QCSaKL0i4B1zITXuF9HnR2C3xLTtbU0FUp0jdI
         7vuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746522123; x=1747126923;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EqJOkLDpEbdjHj6y0NvdqBxAKuQLVchFLzPyCOvEcoA=;
        b=tUPTRmDOyw2LnNgTIOcE5fksM2pvJtFgo3ie7ok9dAosIi5BU35tKWmKb57OfEHWAK
         gl8g5slts+f5oghySBIYBIv/zN7/YnC2BGAF6Vip6DGxk+kzoFZZBYoP7C3NrzW6xXpK
         Bm7HfOV3giyHtB5nUxyn8n7Q66/Rrzunc4e2G82m0qdTVCyyRIRLXPLW+1XgJOoGoNci
         ltcHXYXH3Iud0l5jrzfTmjOlKuLhmeO39+pTLIJakvStvaelaH/bSfp7YgHpfUEnYUUE
         urfPUm3MsvLJQkAzENj8eS8LnufqcFk4gucq+bR/bkGPYNQcS/N6DGbKPVst7PPvxO0D
         XEwA==
X-Forwarded-Encrypted: i=1; AJvYcCXrsNmljtjLkaZhZDs2GTCpoQ1mcC/Renv1Zspi6o2r1JbNIinwBCGMTAuC+u0ZfpL6k3zW5KAn2JqFlNZPqXKa@lists.infradead.org
X-Gm-Message-State: AOJu0Yx98Ys8NPirwFYVWP380AIZGGI1Rb+ozK/8CejfIqvs3RBJAs38
	UPYW1UxRsAvEdqjCXGQA6Lp4OKRfl+46C64FH1t9qsMFYWw3B3Abm5dnEIq7b50=
X-Gm-Gg: ASbGncslZd/pRYTLCzW9YX344dTjYlR8gF1nVpm9a0uPWdIk8jL2fMPDjPz12W/ZYUG
	+E0dqxW2/CyVIK+F+UHnp950Oh3K7o0wfq0815h6w0GGjgxjWzHianglbGhBckG47GU7GRrqit4
	h66JmjXhkvCeSCazKw1bhaXQqMfW/9V8n4h68s/y53y/X8Y7hc6Hr6j8+JhlGmkWI2+uJvlMoCt
	fXqaGxPx3FmUErttrRPJSig9DeqZ/+cdmi9mibc0IOYqzfjygmjY/MJrGdMMoMtlzJy0f3fTG+m
	eL6VzP86w5pv31/4qEe5F7qxGwb2hZk2WkHJSaOZ6W6CEw==
X-Google-Smtp-Source: AGHT+IEQBbyGNvSBH/IUZ7yIkS1NqraYFdwMWxFz3yplI3ge5b8Y0Hl4j3r2KPDZyW7P/JlTUqu6oQ==
X-Received: by 2002:a05:600c:1c0b:b0:43d:649:4e50 with SMTP id 5b1f17b1804b1-441d04feeabmr20345795e9.13.1746522123409;
        Tue, 06 May 2025 02:02:03 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:bfd0:3ad7:fd8a:fe95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441bc83d471sm138125725e9.26.2025.05.06.02.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 02:02:03 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 06 May 2025 11:01:53 +0200
Subject: [PATCH 10/12] gpio: mb86s7x: use new GPIO line value setter
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-gpiochip-set-rv-gpio-part3-v1-10-0fbdea5a9667@linaro.org>
References: <20250506-gpiochip-set-rv-gpio-part3-v1-0-0fbdea5a9667@linaro.org>
In-Reply-To: <20250506-gpiochip-set-rv-gpio-part3-v1-0-0fbdea5a9667@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Vladimir Zapolskiy <vz@mleia.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1602;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=Af+W5lkq0OOTLJFoxPrjkcufnz4i+x8pujOP6mAns+I=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoGc//nXJvfvNuFXirRuBnaS/f3lvGmAa5BZS94
 o12DeEaGrmJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaBnP/wAKCRARpy6gFHHX
 csv3D/kBSFLlqOIfps57wWdE3tJ2zBgTTX6pQhnjc+vB+c9WXL77cC666D4OrG3ZGaW6oHBRDyx
 L3R8OnvH/U5qaStUlQ5U9+TFz9broTUfI2FxGDe60Vzch63Db7uKqaL738vRE70G72+ZUvBjy3z
 6VKr08Xe+lh5X4MIcxgthLTcUbLgqoXDKe1gkY3EqhN18R0bwJce3TF1OTTu5t16AD+a2jKTC8c
 jq4ld6KmVGe9wVjijQ66U9hAcuFOTkgW6vsHNrvVV4a2Le81VAXLQvL06/eBXNz7ZcWvgT2DpJm
 MuZKiD+dhlkfjCQ5/IH+5GkDyZE+TfgrdvRR1jMPPqpAesr0CIOK8hctYXVVJV22fMTpIxiyQSe
 mpfb8FlR1eiH6pD5/rph8sCQbArUWnYkhYEKwtzRLcbh56YgfgEutZ2r+kHA76+FfJ9SZvaqpz8
 EEaqaEzNTIoZOlQ10V98eMiFEHR4Aa4yUvXEVpKp9Mj2blyVVImYq/L/iVawMBy2epMhgmmq69O
 g8RbmijkDxZxPl2xDTZkx63YLaNDnxVY/ZF1w05JkPOjqB8jDaeQ8ah+NYHr3UexNuHBVTJdiGp
 SOLKdtn8jdGUEUm57R4EzgCvi3f7td1g089F9N58QYUROqemQTFNdj+SWERzB2adHKC3Pr038oc
 74tmNN0JQEtX9MA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_020204_841707_BD105AB0 
X-CRM114-Status: GOOD (  13.36  )
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
 drivers/gpio/gpio-mb86s7x.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-mb86s7x.c b/drivers/gpio/gpio-mb86s7x.c
index 7ee891ef6905c..5ee2991ecdfdd 100644
--- a/drivers/gpio/gpio-mb86s7x.c
+++ b/drivers/gpio/gpio-mb86s7x.c
@@ -119,7 +119,7 @@ static int mb86s70_gpio_get(struct gpio_chip *gc, unsigned gpio)
 	return !!(readl(gchip->base + PDR(gpio)) & OFFSET(gpio));
 }
 
-static void mb86s70_gpio_set(struct gpio_chip *gc, unsigned gpio, int value)
+static int mb86s70_gpio_set(struct gpio_chip *gc, unsigned int gpio, int value)
 {
 	struct mb86s70_gpio_chip *gchip = gpiochip_get_data(gc);
 	unsigned long flags;
@@ -135,6 +135,8 @@ static void mb86s70_gpio_set(struct gpio_chip *gc, unsigned gpio, int value)
 	writel(val, gchip->base + PDR(gpio));
 
 	spin_unlock_irqrestore(&gchip->lock, flags);
+
+	return 0;
 }
 
 static int mb86s70_gpio_to_irq(struct gpio_chip *gc, unsigned int offset)
@@ -178,7 +180,7 @@ static int mb86s70_gpio_probe(struct platform_device *pdev)
 	gchip->gc.request = mb86s70_gpio_request;
 	gchip->gc.free = mb86s70_gpio_free;
 	gchip->gc.get = mb86s70_gpio_get;
-	gchip->gc.set = mb86s70_gpio_set;
+	gchip->gc.set_rv = mb86s70_gpio_set;
 	gchip->gc.to_irq = mb86s70_gpio_to_irq;
 	gchip->gc.label = dev_name(&pdev->dev);
 	gchip->gc.ngpio = 32;

-- 
2.45.2


