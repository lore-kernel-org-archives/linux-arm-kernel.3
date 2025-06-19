Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BDD8C7115A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 09:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kXdEOuSE84y7KQ8YXqskQa8fEM4BBQcsKhAUrS+jouY=; b=xEYkBfnwTscrA7EJG4047tS9/E
	G+pZonR6AeKWqBGzTRYCTzXrt5jlEsUK5nc/Gf2q5v73ggXHyqxMqOEh9whbFJC/FfYwuPOEe3Cwg
	5VkZ7qavpVezL6VWtF5cunuS4szDCi4p87ikkVG3KhaS/PQTscKYd1A4Y/OCW4hWy20CKDIrZ9xLH
	kji9aCJuZ4wp4ycpwmLX4S0mz4RFfqZI1pyPLFiVjBq1tl3jqznvbj6PyuYQzZgo2MxSly+cnOmHW
	pcUw6FtWVuKaKWxxPdH+8ut1g4RTX+1G8o630aNJbZlITxZ9G2wGOGA3LKGnZBHrz40FZeJkWIq9p
	ETW1o8nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSBPA-0000000CayJ-0SmC;
	Thu, 19 Jun 2025 09:17:56 +0000
Received: from mail-wr1-f43.google.com ([209.85.221.43])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSAiK-0000000CRLb-0S5P
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 08:33:41 +0000
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a4fb9c2436so265697f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Jun 2025 01:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750322018; x=1750926818; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kXdEOuSE84y7KQ8YXqskQa8fEM4BBQcsKhAUrS+jouY=;
        b=eKwwpN7Uvf65YInETC9dLV9WUk40z2tXYzZm7y6Jrfrf21UURqzf2NVeCzvooc/Yaq
         jwpjKXqV10iV0mfdZNMK1+etm8SYgzJnW7rUPbfOBHmWmH5ZfeizgWTd2tbNGizEHiKs
         0/FLuUHN9HRcxwdSI9iBc5YN5m8s8HCRW2zqMHirhleZHQ6SMwThxU9nc6bjQpSPUAOL
         ASWVZageaO5fYxyXBjVAhHVmFS+pInJnkUIeQygLO1e1/sx8yiK/eeF+czSSx2qDFD0R
         Pa5jVE7K6aL7QJKq/yfYZiAITBrRC1UJIzf05Fm2RNpDTJncMv4/XHZCDkv+LSo7IYe9
         8TAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750322018; x=1750926818;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kXdEOuSE84y7KQ8YXqskQa8fEM4BBQcsKhAUrS+jouY=;
        b=vjt1VjzuqQlJfCkxAjrpryp4tYJc+HkzXuX1Z3ddtFL/5xy424SaLwA/URPwGxGIAP
         daOI+2B1xC3dMUGKIN/56y83xmVG9BLMZRLstXt8J6mEIWW1gya+pJY2LGpiTVgeSbxS
         hO/Vi2p2AuXYEPxPi5g1uE1eiTOG0ZiC8N91/j9YeKhyW/3uxvQdv0aejjBaG5SomEnU
         IT3tMOKIwrD4m2ZRm4OilEZQbLvDl+hhfZLXTmIzdeu1aprZqqI+x+PCGylIj045DZCx
         a+IinsHd2RLX0qHTfbg9hYQsrrahbVLAEIb93IYfRQ0VoTUfM8bTlbGyQoT3nLaRq0L4
         5w4g==
X-Forwarded-Encrypted: i=1; AJvYcCUQt16ZGLFsIPrFiSqctPxIabd8NiVpoBsK7tw1EFuRzwNgRTdRA/WIL04u1XaodNxZdRAx29B/Q03lbm2+NrbL@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1hx/rhiCTVV54ksg3SdIV3Enwox5SVma8+iRRznl3IYg1sChW
	EuXdrs8CbU25HoCjMGmOwcM6h/+qbewUFqjoysvlJyzawXrAoud6kBisP5jEiM77uJQ=
X-Gm-Gg: ASbGncs5sbpPHTKwjk+a8FDjJiATy2uC3a5tjV3iSuJsEZaPnGBGZouHzP6D1gwvDGM
	dAROmhzOT+b9WN0DdmtbyVurAoFDTJCRRUSgYnA2QWrYGXJH/vE5FhCS4Q1KmPVmNJLEvVnN3Ey
	2hhZXYBT0BJE9t/3ypvr/87UMx27sPRSUXknDDgCEdRt2Rz/+CXCK6P/Kh8o3SOF22Wu/QEyS5u
	XArBVhpf46x2HQEt6G2KRERe7WuzUWrkYRnyODPg0eYCXIvunN9nheg1a87J6Zmm5VPBkHcVovu
	APbJpvYkVuMPRy68vXX5gbFZhg+mpUE0bnfVX6CAsNICQgrVHzP8b51a
X-Google-Smtp-Source: AGHT+IGYf6Ur9Ugv00BgKRd4oArCMUnqUFrWbDyyGQdN0NxdK6b+fGQpGmKSwn4EbOC14dV/Zz+MRA==
X-Received: by 2002:a05:6000:1a8e:b0:3a5:2208:41d9 with SMTP id ffacd0b85a97d-3a572e92134mr16408329f8f.40.1750322018388;
        Thu, 19 Jun 2025 01:33:38 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c485:fe15:c9ab:c72f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a63a42sm18828151f8f.28.2025.06.19.01.33.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 01:33:37 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 19 Jun 2025 10:33:24 +0200
Subject: [PATCH v2 11/12] gpio: rtd: use new GPIO line value setter
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250619-gpiochip-set-rv-gpio-v2-11-74abf689fbd8@linaro.org>
References: <20250619-gpiochip-set-rv-gpio-v2-0-74abf689fbd8@linaro.org>
In-Reply-To: <20250619-gpiochip-set-rv-gpio-v2-0-74abf689fbd8@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1662;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=v7M2Umlyn2cPSJSz3+M1vQ3MpPcGxR4ur24zUL3eZaA=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoU8tThgGdaruvFHruvGZ1lAgXO57/m24G9JZAH
 AZ0dHw+AMOJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFPLUwAKCRARpy6gFHHX
 cpX2D/4iJISKxtRrP48ODihJoiJODatcQMlQc7qJrlQLGfyqLACXHtKsWH3vo4ZYvHikNgYvQRJ
 D1nzxPRafhpjXoUNaE0TMiVgAlNKv9WTqPh8/ca2vopFGeG+12V4TJ0RolHwfeWF6rZlSlfU+CA
 FvT4uglIG4oz3YIndaFMKuiPqMomFTuZ0sz6nNr9S9WlWUhgXsNm9AKG8xL4IzkXqjtKBFiNu2+
 U3K7koUtZzrvTm8aKdtBVpr+Kh5fAyEqbjIUM8KOkoac5CfacDs5anNnBu9PKyrknB5dvjkw/Tj
 DfA5KyxsLMcEl5iT4UW5xS8NRuwrd2cXoVpY7NjLMeHOMKy8KE7LFp9uDxJUsiHuG2ANr+pNF+/
 Sp+rl+r5szqRedXKpvRobS9q+e3EP0vNDU/VDu1pZo/JXnoMuNM2qpx/nQVRU8Tsq8QcjUYl9ce
 lwj3Snv0N3vLx6DIj714XhH6wwZEaVKQhBofRj9acJG5pOKa6jB2WPRGvW125y1ztYvTMDeRfEv
 j2H2jU4CXmygo6ctNjELJGSJVJumx4KCPWqkrZtPbkWlOwMeO2fo29J+FLWIGoFhTsm+O8rMI3D
 Cl8TjTeMgJ2IZopO+r8CVVGpRCUAOrCeGhm4n04NxnSzuAKKqpB8gVhYIq4eL8fynV+EFkj49TV
 WjjMy+HzldWpe2w==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_013340_138832_7679D6E8 
X-CRM114-Status: GOOD (  13.80  )
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
 drivers/gpio/gpio-rtd.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-rtd.c b/drivers/gpio/gpio-rtd.c
index bf7f008f58d703347cba14f35c19f5798ee3a949..25bbd749b019bf8a272c173a3e7373a442f72350 100644
--- a/drivers/gpio/gpio-rtd.c
+++ b/drivers/gpio/gpio-rtd.c
@@ -275,7 +275,7 @@ static int rtd_gpio_set_config(struct gpio_chip *chip, unsigned int offset,
 	}
 }
 
-static void rtd_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
+static int rtd_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	struct rtd_gpio *data = gpiochip_get_data(chip);
 	u32 mask = BIT(offset % 32);
@@ -292,6 +292,8 @@ static void rtd_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
 	else
 		val &= ~mask;
 	writel_relaxed(val, data->base + dato_reg_offset);
+
+	return 0;
 }
 
 static int rtd_gpio_get(struct gpio_chip *chip, unsigned int offset)
@@ -563,7 +565,7 @@ static int rtd_gpio_probe(struct platform_device *pdev)
 	data->gpio_chip.get_direction = rtd_gpio_get_direction;
 	data->gpio_chip.direction_input = rtd_gpio_direction_input;
 	data->gpio_chip.direction_output = rtd_gpio_direction_output;
-	data->gpio_chip.set = rtd_gpio_set;
+	data->gpio_chip.set_rv = rtd_gpio_set;
 	data->gpio_chip.get = rtd_gpio_get;
 	data->gpio_chip.set_config = rtd_gpio_set_config;
 	data->gpio_chip.parent = dev;

-- 
2.48.1


