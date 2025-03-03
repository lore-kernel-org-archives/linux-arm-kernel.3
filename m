Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9CD3C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 13:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nNPL1a6roW0ZZry8Zwf4bxHUCK/ikUGMkO2GYygkBZ8=; b=mGQ68Yiblg1fE22b80nsOxpjTu
	7XFsr1FMLJUvJYvfH6dOF+RC1Iqx7jk7SBNXca9Ed4EZ6JcE6LifKSTsfHrQHHQ5XNVsdVVhX9jgo
	7n1XzL4fv5lI4NNcAqYvHtvlzED91p1pyCa9pix95kaF4wfhXBm4CBQk0fgA8pNZytRgAAzZMg8jX
	5E2QUuTqHBArihrTRfWqwp2LNphCfYPgYrGAtEmRQehKL/MWd+RcSHiIzPXsI5y3Td6VNZBncVSqu
	GXWS5HbDPKK65X9jA8JYp4JxjQe4T6LvBjGdhf0IujS2Q8qXod9uJyM38gs8YaxbpESyK/Lm9CJ3N
	B2HClf5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp5sA-00000000vIa-3jQX;
	Mon, 03 Mar 2025 13:30:18 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp5gy-00000000sXh-3oLl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 13:18:46 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4399d14334aso40803735e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 05:18:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741007923; x=1741612723; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nNPL1a6roW0ZZry8Zwf4bxHUCK/ikUGMkO2GYygkBZ8=;
        b=BMzdj+JoN4cUDnSfEZ6IOJZwqmxHsOna4cs5fefdqOwBymxI9MKXC7att7IHkabwu/
         vcgxUeHiMnknFRINELaY5pEhWB7qMq2DzFH9xtCvIku7A1dlauZutGc5+DDj/zFUoQP8
         ud18crBIfVH6K+ru+adtcWoFwkWk4u5D3V8DANFpVBWxxpYMAgFd1kz6w8+UK7QERUR2
         aNDpbxulBXaN/OwlWbUBF3AhOe8C98kCiagchW8APJSHwHPQOigAW383sdZJNwgoYTes
         I2n/wLJKTQ4NlkuNOVLyvYZLRur59Cifxv5VXQM2tx/OjQ4XgkEVvvtENCOK4bAvwVy5
         P1gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741007923; x=1741612723;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nNPL1a6roW0ZZry8Zwf4bxHUCK/ikUGMkO2GYygkBZ8=;
        b=EL02DTbaCfUcGU8JuqkfM37P/Gm0cOtHvpArJGn4v1qhZu9rAseXxNDGz2FSPONQvn
         QyrycJJNXSCQQOj1ClhQX3Yy5sjuaTCerZBi/CkcDIiEbQqfd+32fu6K/Z9vwPSMgJdz
         ewsrPPDZQ6FS8Nv167ebfs0mux3Rqmx4/C64wrWgupu5nH7Z5lJ6m0LX100N4Q/f0iZy
         hMiKyEMI6jtEyzXN9dJfVfmiExkTtrxwj+MhAsilcj3LSiJGZAIA2ApckhoAqvvYSont
         czhdS+u0VVZsUnXMWeRJeQMWBVGVm+/koDX5uVSp07R0/BNAcKnYK7V0dp811AwXwZFO
         Me2g==
X-Forwarded-Encrypted: i=1; AJvYcCUOn89/PauRQCypjp0srl7+mlnryyNuCHQln/JryD5DCOJZU3AAjlmflG2jbsRUqdfV5hMeSttI8ZkBoX8y5Nie@lists.infradead.org
X-Gm-Message-State: AOJu0YwwhoOOMgngM3/3WLiLYssMaDB9j37eajh7fT9MTKW6D3bMgVJm
	bvS6xaZfLPBMvTG8rG0a6KtB7dcUpLTk2VVpjU0SURPHu/LZY6uEd9PElJKCvkcme1q2jBfHBzG
	J
X-Gm-Gg: ASbGncsgkyHlShV7tjCUTDNKGzzCL2P8UiW6LyMer/s0gI2MgHcC6WMQI7qxhCv9w5D
	9BMAfrbCgZ+8yqUTxY2BND2xQLPTSV4BJgikR2GXbwGYj2T1goEgfA3JksLwYLDZ0CiVtRwGAjH
	JvYy4bbDyeh99D1dcfIlaTzlsXm0QyKkxfhO8Pek//9ye46HwHkVu89UOoivQCu6xSyCtV/E1S5
	xtubp9LdQiAyslECDh+rlJA/xCjuWl98bP9+whPG6cOhkg9JA1IxUWEclmgq8MCouwzUnDQ0WzS
	xAMe2j37zPr3jYBeuHYJyeWrkhOT0YxqmGsIUw==
X-Google-Smtp-Source: AGHT+IHbszq+vMxzQMr31b4yJpnsrbZ47M8sVQM15El+wQuWQDwBK5/Bpb/PIWwe1VCZA2bf3aRtzw==
X-Received: by 2002:a05:600c:4687:b0:439:88bb:d000 with SMTP id 5b1f17b1804b1-43ba6a83af1mr92775155e9.25.1741007923152;
        Mon, 03 Mar 2025 05:18:43 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:664a:9e92:6aa8:6007])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba538b9fsm194821915e9.17.2025.03.03.05.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 05:18:42 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 03 Mar 2025 14:18:30 +0100
Subject: [PATCH 05/15] gpio: adp5520: use new line value setter callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-gpiochip-set-conversion-v1-5-1d5cceeebf8b@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1693;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=SunsCTO9F+EWaLdjYQiV46KnQmX+82e2K+lprMGFRIU=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnxawqgKKxH1y23tQzCweLRSEGjaAyGcRFDUeq/
 rVWsBlWpxGJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ8WsKgAKCRARpy6gFHHX
 ciKKEACBBk4kHvWvq9gEzt3a5+c5/x2eJ9ofpSxc1k6scdiEyfuTckeG0jNwsnuKnmWGVcZt5+z
 8OPcjsT0+csJp3FzC6PGpCSMfbZUtw03JIQJGM8TWeI9ulmBka8MlineJCR5DOERPeRx34SKzD+
 BQpvZfcQJngxK3LC+jkQZe5Z1vNINnA7BDbxaIFOcrweYjO+BgKJjE5TmPfdAlBSGC6BUuR1iMj
 +AhL75DSMv1bbaQ353KeDSeKhL+y1Ze29bKW5TCbzJMdU0kIsHL3BsklC1xldNZa0+Nl55J70Qt
 X8NPXyh6+Y/YbRI1lA9rrHkJ9XmvP02lU3Qsurs16hAgBT5TtxSHmp/ax0Jm+u3mG6t0Cd1EB4U
 bEiGB1Si600EmbxI/UWyIyLFISxpvQ0aHnSdL/MplN69ZiSspnqIU1gI3ZbgGznyy5hYAClZcKM
 5Gh6uws7oGhlSL8ETakeFWliTxMEZj3T+TyK2r8NHvLubPVo5c4IN6eRulRk3upWDvAhnK8n6Aw
 7hl194jwWCTYD+4ao2kfFKnSMSf6scU7P6tKw7vMRCW2aW114kU8SvfGV/Yf29RiKRL5db1W3vW
 ljM/LPc8eoRpobP5W2hQn7HrIohEw9zv/cYH3w41EC2Ac6mfFQetDtaT/UQXRPoAI2yR8rIsbd7
 V96KA6HPqQ2Ei1A==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_051844_960505_E0BB033F 
X-CRM114-Status: GOOD (  11.93  )
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
 drivers/gpio/gpio-adp5520.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-adp5520.c b/drivers/gpio/gpio-adp5520.c
index c55e821c63b6..57d12c10cbda 100644
--- a/drivers/gpio/gpio-adp5520.c
+++ b/drivers/gpio/gpio-adp5520.c
@@ -40,16 +40,18 @@ static int adp5520_gpio_get_value(struct gpio_chip *chip, unsigned off)
 	return !!(reg_val & dev->lut[off]);
 }
 
-static void adp5520_gpio_set_value(struct gpio_chip *chip,
-		unsigned off, int val)
+static int adp5520_gpio_set_value(struct gpio_chip *chip,
+				  unsigned int off, int val)
 {
 	struct adp5520_gpio *dev;
 	dev = gpiochip_get_data(chip);
 
 	if (val)
-		adp5520_set_bits(dev->master, ADP5520_GPIO_OUT, dev->lut[off]);
+		return adp5520_set_bits(dev->master, ADP5520_GPIO_OUT,
+					dev->lut[off]);
 	else
-		adp5520_clr_bits(dev->master, ADP5520_GPIO_OUT, dev->lut[off]);
+		return adp5520_clr_bits(dev->master, ADP5520_GPIO_OUT,
+					dev->lut[off]);
 }
 
 static int adp5520_gpio_direction_input(struct gpio_chip *chip, unsigned off)
@@ -120,7 +122,7 @@ static int adp5520_gpio_probe(struct platform_device *pdev)
 	gc->direction_input  = adp5520_gpio_direction_input;
 	gc->direction_output = adp5520_gpio_direction_output;
 	gc->get = adp5520_gpio_get_value;
-	gc->set = adp5520_gpio_set_value;
+	gc->set_rv = adp5520_gpio_set_value;
 	gc->can_sleep = true;
 
 	gc->base = pdata->gpio_start;

-- 
2.45.2


