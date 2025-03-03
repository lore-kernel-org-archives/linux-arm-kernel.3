Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B74E4C282CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 13:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gz+znbWREsKmtzW3OBAmXUrUOCp/yw4x3Y/d/8vV1Bs=; b=bRJ4ze40d4Ui2aEtGU3ipPSd7s
	Hg8NZFw/4vLRERFci1tbDlGc8ZHlfPbBCcXYbb0qFYfXQMnqXhTVudsvM9nk5B8YPOJ4wXzxE/Arf
	qq6LG97HkPmReCljjVYyGE9RGAps85hB0hKSpEPGIJHCYQfFta/RiyfyINFGOpc+el44r1RrSL2/m
	2Y2WxfvRtHeDXWdHOigaUVaqUJyWHJSstYsEEUbI2m5S2A8sg+3ls8LMAdsIBV2DTueUy42KHXtlB
	2mhpFg5W3B8TfwN/sW/rL19fsfKlwrIvxfr+iJIpR0zZBaXmljeJSn8WQev9fE+ssJC1/R+mWSrWa
	satdy6TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp5vH-00000000w54-1ilM;
	Mon, 03 Mar 2025 13:33:31 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp5h0-00000000sZS-3LRf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 13:18:47 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4394345e4d5so30311795e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 05:18:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741007925; x=1741612725; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gz+znbWREsKmtzW3OBAmXUrUOCp/yw4x3Y/d/8vV1Bs=;
        b=e8pE38cM6Ej32wERZhCKXxpriPGhaWiO32/ScuB3063hQaD5/+W8CQziYsYwx2+NUP
         TMk/VfAO/7bt/a8VCl075sxNwxw5cHgSriy3YmpXqDif+fBBEj95d9syWeXnl5RHzAa4
         jr+lr56etyrRupCpoiN4bVoB6DTV5fjYX/xz8yjQvZxqMLTbG/G9kJ0eEl22M4L1STOJ
         ppbPnq7feAC7zHAarSuJ63bw+ln0/OF1ey/c4AYpDyHMidzIVLuZzchEGI5GqCeGr7qk
         FAN7VFi8d3VvJqMorm+bHJPS/a+l46TwxjGLog9RcLYPRkiXtOvMGxLhTr0JK1SWmypZ
         fLOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741007925; x=1741612725;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gz+znbWREsKmtzW3OBAmXUrUOCp/yw4x3Y/d/8vV1Bs=;
        b=dLI/trHWm/IHzBdEv6wWQqPVHeQchROJq+NqNFfiPXDLYOQ+PrybksdAa9Ambj7WqW
         a7O8WzdH82lVskhD7mFpGWch0iCWLT9VYASY36f0HVX7phWosGf7JsCjA9gy7HoEaPN1
         /m5zQu1Wr0BWvQcC9T0SkA3opFt60k3om7Xxi+LRNLEpBetnB452fe30Bv7mfLTUG5wH
         RvZXb1SdTKojpy89e7YNEHlcMGQz3hm+iO/NJOZhT2ZDJZVHZ3TQC8dPJtze6UQ7GZfd
         JKsbZSHU6tnVdyF60t3lVONlEkxETLQWyOZSnSUNyUSpSTZhtGBgEkq7u6H5katRt6qC
         s9QA==
X-Forwarded-Encrypted: i=1; AJvYcCWAyYOGRiCrp5fWyJgz6kuOB/ucbvVsdq0wMkoGdE8qxS71OV3GVaXgeoo+EM1xWUpPP1LgM/m/rBVfmr+L2iTs@lists.infradead.org
X-Gm-Message-State: AOJu0YxVpB23HvVTth5zKXyCZ6tSIj8rcSt/67VJC3PBd9ju8N71EPd/
	9d0/pp/+8xQzrTwuCGsCaDuB4PixBdw/msqlzzruiojiVaOAaezQh3nzyTAni+53DgQeXVEE5Kh
	N
X-Gm-Gg: ASbGncuat7gWmQR8L0LUDmkGIINRcaB8iZ3BnDiDYxP4np8YAt/4G+VKqpNtJZ4vNAr
	0Fz85hdIVhtEyDw6Sn1rcbx7DoeW2kpgl70GpJbzf9+ZsPZP/ySTosysDbeDqlhWFoStIraNfsh
	9rUfxNVt2l8Ap5v/z1TaUkUAl5QOnz5PLmmyNbbtzftGrLuo5kzFFOacwIqSdgPCOicFkO00rz0
	m5ypTSyNIQmT87RrPUErK5ZudWBVl57VrPE0+sF8Nx7+sO1tPGwOlaR8x1Qg+DM9wg10NZDPF/a
	TX+vj8kGvm703tfZLxbiXQq2hUqvibROtFnQ1A==
X-Google-Smtp-Source: AGHT+IEQW7YZHCrSLWSEknFmca2KCALoGeG/H70z0XerHtGSCpqthigF58jSy3FNcBdb29iDiMLtqA==
X-Received: by 2002:a05:600c:5493:b0:43b:c3af:3304 with SMTP id 5b1f17b1804b1-43bc3af34c2mr18251825e9.28.1741007925218;
        Mon, 03 Mar 2025 05:18:45 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:664a:9e92:6aa8:6007])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba538b9fsm194821915e9.17.2025.03.03.05.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 05:18:44 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 03 Mar 2025 14:18:32 +0100
Subject: [PATCH 07/15] gpio: altera-a10sr: use new line value setter
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-gpiochip-set-conversion-v1-7-1d5cceeebf8b@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1769;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=92motqkZmcdTqKDZ0pbU5Fpe7KR5fxlrz4Z+U7eO+v4=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnxawqQygDSg3gkaKutuN+SS1W5PBDPQ7axtGpJ
 lUog7E6preJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ8WsKgAKCRARpy6gFHHX
 cuH1EACxW2kuBBYKDwQHK83+US5eYzcAEXawXkCLyQoz2XEfFhdxD1QimIFJm1EqYBPUh5CBWOL
 zxkL3aKSAQoJY9jWFS1zvyq4/gZPTJycJKRXlu+HFjzqz/79hvUZXEuHFyTtXR54uhXDFki5Mb0
 4o2PkqsrKtU6lKxwTvH0+TS2/iEM0KOfbz/v95WtFK1jQdXS3aQ4h8CWtCMk38CElYwAVbvkEin
 FUO2PFSqtIULt6+l0Pz2dCU4CyDlX1gtFbx8WCGsAqEZpCVy8auMyCJxXJKdb+OxQLaHuBviW6t
 WYshDG8yH/A4XF8qXXQVjKun41VUgQERbIG39PWLFzBy57Mt2aPTwQK2+++qcUzuu0WOIRqiuoA
 pX58nz5K2Ygn+zXT35ywaDi1a2P0G8L8+ErRo2EuKTZ8Jb20BR8tf7oeKLNu3Bls/15jxGHfaS1
 mO8QBHt3R0bLpwCpgNeRiBtS6N7cLl3iqAqhdn7k21X7n8mvTszallAnm3vrD7sYz9ocWHaSA4c
 CvGPG6EjE+KhtsbPaTm87Z918cA8JFDaq8Ey0dvM2ITRG/Kw7hUBZw7T61YBjIXYTWgun/siEhN
 QHSXI0VHOtUW40UFWOcUyoi9vM6C3GVuTarMHdLs2kvL7JyDDe/b6yX/ILTUitQx3Bm6dWAdZ33
 MEJlJpdfI9kdwAg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_051846_840723_494B3BAC 
X-CRM114-Status: GOOD (  11.38  )
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
 drivers/gpio/gpio-altera-a10sr.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-altera-a10sr.c b/drivers/gpio/gpio-altera-a10sr.c
index 11edf1fe6c90..77a674cf99e4 100644
--- a/drivers/gpio/gpio-altera-a10sr.c
+++ b/drivers/gpio/gpio-altera-a10sr.c
@@ -35,15 +35,15 @@ static int altr_a10sr_gpio_get(struct gpio_chip *chip, unsigned int offset)
 	return !!(val & BIT(offset - ALTR_A10SR_LED_VALID_SHIFT));
 }
 
-static void altr_a10sr_gpio_set(struct gpio_chip *chip, unsigned int offset,
-				int value)
+static int altr_a10sr_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			       int value)
 {
 	struct altr_a10sr_gpio *gpio = gpiochip_get_data(chip);
 
-	regmap_update_bits(gpio->regmap, ALTR_A10SR_LED_REG,
-			   BIT(ALTR_A10SR_LED_VALID_SHIFT + offset),
-			   value ? BIT(ALTR_A10SR_LED_VALID_SHIFT + offset)
-			   : 0);
+	return regmap_update_bits(gpio->regmap, ALTR_A10SR_LED_REG,
+				  BIT(ALTR_A10SR_LED_VALID_SHIFT + offset),
+				  value ?
+				  BIT(ALTR_A10SR_LED_VALID_SHIFT + offset) : 0);
 }
 
 static int altr_a10sr_gpio_direction_input(struct gpio_chip *gc,
@@ -69,7 +69,7 @@ static const struct gpio_chip altr_a10sr_gc = {
 	.label = "altr_a10sr_gpio",
 	.owner = THIS_MODULE,
 	.get = altr_a10sr_gpio_get,
-	.set = altr_a10sr_gpio_set,
+	.set_rv = altr_a10sr_gpio_set,
 	.direction_input = altr_a10sr_gpio_direction_input,
 	.direction_output = altr_a10sr_gpio_direction_output,
 	.can_sleep = true,

-- 
2.45.2


