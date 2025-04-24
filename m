Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC334C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 08:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y/KXYtsmkb+G7CfllxPwkWPMcOpxgtUmoLcYzM1m4O0=; b=bly+a/JLbKxJ6R+4n2+zgJD3P0
	IOJ7JXGX6s19CZtK0aoUXgz4qeurqBfWbcPm6M2rYNlseXd12RJhSPtdYTOvpyj9W0eOeRy+lr6LD
	hyFn8l6XPgvR/0h9JZ7UzhtXsd2nm+6CXGplUYGFSmlnjThYjZ7AMrbalEUzI1C4DbfyJfD6lD0hO
	V2CZ/FyNYIwx38mvnJMPXQpCH5Yqz9WRyh53xqOygzy+0nT3G2PPhshZRwoRL6MFCqcnAMQnrtE9Z
	Z4l6MxhCyuiWoh18NVL/CI5PZefPS2qro2HqAEsFY4DNepDARz8mZXWpb9Xl66Ce4lUNKeYxm1oHp
	YOlQIqnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7sAz-0000000DNuy-0anf;
	Thu, 24 Apr 2025 08:43:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7s3i-0000000DL93-2bB7
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Apr 2025 08:35:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Y/KXYtsmkb+G7CfllxPwkWPMcOpxgtUmoLcYzM1m4O0=; b=LXE78z6Y8cKNAFgsGemtKPaQGK
	Tky+zIsQKCSpxbBpUIR06pn7j+DmEwtE6P1btDoafdGGkf79CdZcEuBDfKIozWyogF1hRuCfOrf+3
	vOtqx8A/cvaEJqCQsWwb4IX6WLzuwKhFF+3nBxTU+w0X5+keuNS8O2aKXW75KJ7znoJdxeSOPl5Yu
	5zHfL5Xwxd1eT4MAIiwLJTd9RcuT0qQNbBI1MdqpoklHIGXbYZPnXPY+vWOlF1un3xvylFT90VjRD
	q+4qLLzm85r428j1u+MaAnNbYxsOYTR4kvRVAQAyzqpRHtf3VT486BPO0qQV5pniyc5llzW8GOFny
	OiWqxbew==;
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7s3f-0000000Bcgk-0zu3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 08:35:49 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43ed8d32a95so5700405e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 01:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745483745; x=1746088545; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y/KXYtsmkb+G7CfllxPwkWPMcOpxgtUmoLcYzM1m4O0=;
        b=bO05dWJtaD8iX4gUn8VauNx8prZt4lETQ3zu28+bQD1dOrXttCPHGQgCNFf8NyeNZK
         9Kn6apNwEpCg3hPewo4wKvZtboIGQeB5m5347ij11x6O3zXR4tIBDfMh+GTjqz0vGeEz
         WJDMwr8uPJxHcSKx40GZdGaN1TPDwwsrE8J/32Qr9sOkhGc/BkwimIlZvmzZn1V4ad4q
         Qxur00vaxqnCakc/JGT4ef0GZ1xydfOPphhH7dnoelUJzawnaVDYcqoI3sC0j7H24ZSj
         eLycSGjLhWDfrbpvmJ0NxS5WeZJbyBQOv5h6VaUnmH4oZtmaPGX1cTHHNUve45FLSHoP
         +XUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745483745; x=1746088545;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y/KXYtsmkb+G7CfllxPwkWPMcOpxgtUmoLcYzM1m4O0=;
        b=KREdXqGrVT9pgu3R3JsYSAqqX1s4xHgys269KRPe1Utvy6shmzoYlM4LO1VF/AqEs4
         OT29b13MavDfS4eir4tcrs0P8uU1uF32PZYiZlEZvYbEy0w+GxcBIUDe965uWQT/kXJu
         XyJOPluvNOhuin+FyGej2EIWucUz8ZzIqht54qSd9xlmHytLubEzVuv7fQDPbIFlfga1
         kGZGHzLTW4jQo9J5n6UiIUJ1dhw4dbFLUerTQSq0Mp69EMzT6JYn0ZlLzkrM7uRUD0b/
         J81zLBhltj7NrpBtenHnyUYumE5XcTYsYihQyIxleAt1wURza+x3p3duROil5Lx7OY39
         tLqg==
X-Forwarded-Encrypted: i=1; AJvYcCXgvgGCnSRoexQeRwds3UDUqMCpf3aO8X6YFJWHTATQLN5YEGecvFWmId54NVVAzLUjm9m4BqK+UQ7TB6kInZtP@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4CHlQVxeGY9VDRIy2zTEtgk6qKl0kMXICs+MkDdNQqTNx2sxd
	B9pA2m/OSrmxkjYvNWrgF6cKZhfpyJuQQgiCahgH4NDzFQl3bp0o6yrbCnNGLmY=
X-Gm-Gg: ASbGncsnSR4/BpaALXjy/aREwZL+7YRl1z9ojwi3SJtQT3gUXitAX9Y3tRvfLA7HI4X
	3+c5v4KwLEpR1G28hc6fmab7dKQ2/5m3weq8bThlaFWobxCFkPrRb6O3XWajVDQ9vcZyuUDuQmx
	8YG9c8wQGBME+Lw5a3UlaH4JRUGVTtOkFsIyEkTI1DxQs8VvPXlsFqVcO3IJmveTBxVQvZ7NndS
	53kDYyXORiwUuUZIv9oBOLBR4s49dG3kjJaQAzhsB7ZpcGcENUQvp7ipoUYEZ/uaUL385j6qjFP
	xUxUAwASJnd9fX+NxQcqTNnHGelaktTZzg==
X-Google-Smtp-Source: AGHT+IFDVvKbqbQCc57anrhr3bH0NS/6VL2EdsqMYXAYy4mnb5bctdCFuHC/meZO5Slm/+f4y8xO+Q==
X-Received: by 2002:a5d:6dac:0:b0:394:d0c3:da5e with SMTP id ffacd0b85a97d-3a06cfa827cmr1289003f8f.47.1745483744837;
        Thu, 24 Apr 2025 01:35:44 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:6266:7750:57ce:7cb4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d54ee11sm1295376f8f.97.2025.04.24.01.35.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 01:35:44 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 24 Apr 2025 10:35:24 +0200
Subject: [PATCH 01/12] pinctrl: amd: use new GPIO line value setter
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-gpiochip-set-rv-pinctrl-part2-v1-1-504f91120b99@linaro.org>
References: <20250424-gpiochip-set-rv-pinctrl-part2-v1-0-504f91120b99@linaro.org>
In-Reply-To: <20250424-gpiochip-set-rv-pinctrl-part2-v1-0-504f91120b99@linaro.org>
To: Basavaraj Natikar <Basavaraj.Natikar@amd.com>, 
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Chen-Yu Tsai <wens@csie.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Paul Cercueil <paul@crapouillou.net>, 
 Steen Hegelund <Steen.Hegelund@microchip.com>, 
 Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
 Ludovic Desroches <ludovic.desroches@microchip.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org, 
 linux-mips@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1680;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=NXF8n4jsfSDUE1BwCGs8Wk+0RRESis4p2gxPAXy7zJ8=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoCffaXhDusyvG2co2zg72Y3EMPUiJTRQhwls9L
 A4IcRn6OQuJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAn32gAKCRARpy6gFHHX
 cuVND/9nSgA0+zQ9BeJQXZoMGuPOSsTcd5ft47Rz+PFTWcCHc4gR74Yyz1JYlyFirhQukhrZAI9
 ayiFXnxz+DRmalcR1GNyRp4UmxjfYI1wfEW3L8y5MnQcO1xGJbk18AH+8RIGEJK5bRuv4fHUVrQ
 hV5ZOjao4hJlEt7td9YYxtgh4dx3OQtkph4SzY4kYggtKJNyiEdBhUt3yKo5X4vJsScfQFScAeZ
 9tBfdkSdQ7PY44zhvoxhHgelLEHGgOf7F4cXgDFND3fCFTV0jF9HvcFlkuW61NnQMA4hhPQSpes
 MUwQAS6ZnOwGhcqGhL/dWY0wHaDY/ywabZ2WxmMvLXd0rkXASERgtzoNx1/nzEm4XUa281iA9i+
 NeYK2GMkjsvHx5mn3iDvcOm56nmHsYYA+B3+lORaYVlfkBGZi7KWn9k6AMFlrRiGjlDI/DsTXMk
 L7kUkgUM2YFu/OzEVuRGfn6PsJaNRMPRd3j2oXyPU2Cy9/FdtR9PYoDUPawCqcNCW3PMrdBK3az
 aDqqARtQvzIv83kZ+SO2+LaxV71ruxStTfiG0t21+jh44hTZ8WLJ6Ouy7Nl0j2EGifuRrliEQRT
 YuPhpehkhllAQkPp0iKlVgp1BZIXa6TuItEJTbieLsPUNSHwLC6xaIXRprIiBc8Zg1V6/wlbzte
 W6EmpFQxkbAr0NA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_093547_415697_3498760C 
X-CRM114-Status: GOOD (  12.47  )
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
 drivers/pinctrl/pinctrl-amd.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index 1d7fdcdec4c8..9ab3a7fc3bdd 100644
--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -101,7 +101,8 @@ static int amd_gpio_get_value(struct gpio_chip *gc, unsigned offset)
 	return !!(pin_reg & BIT(PIN_STS_OFF));
 }
 
-static void amd_gpio_set_value(struct gpio_chip *gc, unsigned offset, int value)
+static int amd_gpio_set_value(struct gpio_chip *gc, unsigned int offset,
+			      int value)
 {
 	u32 pin_reg;
 	unsigned long flags;
@@ -115,6 +116,8 @@ static void amd_gpio_set_value(struct gpio_chip *gc, unsigned offset, int value)
 		pin_reg &= ~BIT(OUTPUT_VALUE_OFF);
 	writel(pin_reg, gpio_dev->base + offset * 4);
 	raw_spin_unlock_irqrestore(&gpio_dev->lock, flags);
+
+	return 0;
 }
 
 static int amd_gpio_set_debounce(struct amd_gpio *gpio_dev, unsigned int offset,
@@ -1128,7 +1131,7 @@ static int amd_gpio_probe(struct platform_device *pdev)
 	gpio_dev->gc.direction_input	= amd_gpio_direction_input;
 	gpio_dev->gc.direction_output	= amd_gpio_direction_output;
 	gpio_dev->gc.get			= amd_gpio_get_value;
-	gpio_dev->gc.set			= amd_gpio_set_value;
+	gpio_dev->gc.set_rv			= amd_gpio_set_value;
 	gpio_dev->gc.set_config		= amd_gpio_set_config;
 	gpio_dev->gc.dbg_show		= amd_gpio_dbg_show;
 

-- 
2.45.2


