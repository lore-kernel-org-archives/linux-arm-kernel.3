Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA858C369D3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 07:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8ir3eyI8qcGGsO3Ggl/orTJMx3W1xOxCUBEIWWxHP8U=; b=Fhg7Q/XfftR8p1lgPFjjm641Se
	aZ3huIgoqYVLNqSq9gwZLSfzkeab1P/T64741UY7lD+MkMjk+bt6KOoZ5tcJN5n07tQKmCLWn/O+M
	MMZxZWzSE+if6Fi6WUD2XwcttaI+Wb/8eJYklzr0CY9cN327dlPdLHb9UzOTdlhWNGd9yCV8ADtPJ
	L+8d9IWxuP/fIfZZ3IlfpnGrk+ClQrn9RFtf3oMX5OxrNz4C8PReNnXRNbTUiUuYD5k/d5Ao8wcCe
	bvb6hmJ8I/kdaeAY6ZjL6UFtNOJg7Ef8Euir7fEDUxgN2rukf4/C1pCV4d19JFOjs5VFNE9Ae4B6J
	+KZy7kDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Ug4-00000009Y5E-3xRl;
	Wed, 23 Apr 2025 07:37:52 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7UKM-00000009TXO-411w
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 07:15:28 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3a064a3e143so788093f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 00:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745392526; x=1745997326; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8ir3eyI8qcGGsO3Ggl/orTJMx3W1xOxCUBEIWWxHP8U=;
        b=qsyE2FpTW7XIxPR1x1thMyFrwKusX2VCd88GilXosmGgmDSrEYezQV3Z0hTdJXKqoc
         yuoQw8twWQ5gHUfFzrf5YDIVq9vHrb4M+WUoNTq3TNCIGAvNSt9FZPwMrVfwtHJG5cuA
         9F3lpLN7CexMKBcI38hi8tPAEVA5hxsWysrAWn1YtF6HdquLQ3E7hocOv3b88y+/iCk1
         JhuIsEo/QWKjDpgivB6H/WRnC63gwtosaadBHp7y1bhqSSfwkwQ5orWJA+WKMuYVBJMC
         dYVJphhnBbDuJK71r1eyKMsQE57RYqj561GLAhqBR4jF+Zt8g0ZfgLdQ2KXY9Mw6POM1
         jMQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745392526; x=1745997326;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8ir3eyI8qcGGsO3Ggl/orTJMx3W1xOxCUBEIWWxHP8U=;
        b=InmqxVhMjKO7PqoBSxf2G/UdaUdKMJMyrd/Nnz+z9k/5NpPjoBWoW0dan6P4UaocEp
         ZBUiHN4onwEO1Z6gnhcK4NMrtdoCkgOvHss15HdLT1DaOrS28KkJ+5OaKujacMxuKD3V
         dRTRERcjAyv1vgFrEdEoyZiDTbv0JQ0RzYvofy8DYZMYTy0KfZDh8CCTG/QlUahP1zep
         P01xvx3tmQ4oRp6/gX7TQwtMFI2ATsx+j3w+R6TxSjp0jiH9To/u6FnfikFiIbVP7Hwe
         A4ArHumKpwCId2e7y6+OZ0c1Oa8aZwKd1Y6vRqXkYEhDx1C2jszhr4wqUaersaiDWUxd
         kOiQ==
X-Forwarded-Encrypted: i=1; AJvYcCV36AFg7C/Yb0yHqXXeURzkck7UnRPX5G5/8pl8fNDQFJlHsUh531LQahzYuuKdo7qKPBZLL5h36KhaI14wRHqz@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1dRLvF54iX+MbM7gKE0i3+MnM90icJs76HawxSE3uqwo+V9Bm
	ECCzBuig7dmGrbpzVzc1CkyOkz+hY4ae5yF8YPINoa2Q7c9hQSElICZFv6HnnKu+YLKwEPx4CR6
	dH6A=
X-Gm-Gg: ASbGncsNTnarEtOVHxvCvpKrpHVJkbcAKMEnQvcfYT3EnaYg2T/43eW8SCWGjv+JJoG
	/7Ovl35foi4tRjcV0JQ1yqn9co2kGdhR7qG+aTwPFn6y8JzkwWpbsRTu6UnhV3T0fzhKZ1ciuGM
	rLkVATYNQMuTC9esUNcHTwwd4lLZlc0jgFY7tnVg4sOzwo7WXAecbqRkc7yaRrczU/f8tPGzLAk
	abuoe0RJsXjOha6biZYQ6QFlxyQ2tdePbDcP8T99Kc1Zqjr5N+vhz/89TGo20X3ExmJPADemFVP
	hD8k/KKCyzF+aXm/hmLdRHRvnu5ni+S8tQ==
X-Google-Smtp-Source: AGHT+IF6SVfs8RHa2BnADJcSY6J1I9halvCK1KnXR67dc661aBEXTvglED7nQaJPJMMIX/l2j+WJCw==
X-Received: by 2002:a05:6000:c08:b0:3a0:65bc:3543 with SMTP id ffacd0b85a97d-3a065bc358amr1886761f8f.35.1745392525708;
        Wed, 23 Apr 2025 00:15:25 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:74b0:71bd:6dda:dcc1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa493446sm17696935f8f.74.2025.04.23.00.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 00:15:25 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 23 Apr 2025 09:15:11 +0200
Subject: [PATCH 09/12] gpio: logicvc: use new line value setter callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-gpiochip-set-rv-gpio-part2-v1-9-b22245cde81a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1906;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=uEXyapUiU2zuU+gAX/AtJAOANlE8Iy85z/xFY4aI4tc=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoCJOCCFWE0JSqUtSesVr7mzuU1M/ku4tksaurU
 rUbPU9KQmOJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAiTggAKCRARpy6gFHHX
 cmecD/oDvN3BKxrxrluO97/IgXHtepSYXO/eBzaKqLSk46iZdLfN1ELs7wHsUUCRmq2Hcej463z
 TxWtZwr07ZL908O8pz8zRVVcnJO1yFup+nI+BE7cZ4T7/Pj19/VGw1ho5Th1IVliSLTPDxKv3wE
 UV75Y1wlMk68b6hXi8hM23v4fz6OXZgdEVCnYPAxYhtntLyBaB4BtG+ThkjKk6d4ss+PUJ17Gdk
 EyPqUiuMp1mEwIusQp7OsSs4yIpAHNJhCDzNJ/uRmyPQ1f2yXkEz2FVHWApJJxXonw1VRWvpFLq
 ZG8F8Bk+K0XoBf++3dofAzsCvMyggHSEyAewsW0QmB8skAO926oR8QpVD9gstdjpzKls8ei2q9W
 Xg9m3Lcquv19Yw9wnZFpRpnNn+XtgJ4cj+83IztRU33NvxcbvFbB9Z9XMNcBj9sz0iAgA6txYgw
 h5wILlAHqzeoFU7ibGssNASTrg8bH0JSP0ViL5PctN/ye5/i1xGUryRXb650M4S6KRQCSjgL/VK
 i0RmEiBUqd0Dvr2K5qGV16O1j39J7oVtu60wglI9huydbBqbJG3pMQvi8Bae5FR1Zdj6/a+GLdJ
 Lcqd053up9xLuw11VFAGN9he49iS8D/z83e2oMdox2G/EHa7hq+p5yQKWQz9+oNDKRmkWne24k1
 NSW65Qz796zVw2Q==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_001527_026050_1A99C9AD 
X-CRM114-Status: GOOD (  13.70  )
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
 drivers/gpio/gpio-logicvc.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-logicvc.c b/drivers/gpio/gpio-logicvc.c
index 05d62011f335..19cd2847467c 100644
--- a/drivers/gpio/gpio-logicvc.c
+++ b/drivers/gpio/gpio-logicvc.c
@@ -61,23 +61,22 @@ static int logicvc_gpio_get(struct gpio_chip *chip, unsigned offset)
 	return !!(value & bit);
 }
 
-static void logicvc_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
+static int logicvc_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			    int value)
 {
 	struct logicvc_gpio *logicvc = gpiochip_get_data(chip);
 	unsigned int reg, bit;
 
 	logicvc_gpio_offset(logicvc, offset, &reg, &bit);
 
-	regmap_update_bits(logicvc->regmap, reg, bit, value ? bit : 0);
+	return regmap_update_bits(logicvc->regmap, reg, bit, value ? bit : 0);
 }
 
 static int logicvc_gpio_direction_output(struct gpio_chip *chip,
 					 unsigned offset, int value)
 {
 	/* Pins are always configured as output, so just set the value. */
-	logicvc_gpio_set(chip, offset, value);
-
-	return 0;
+	return logicvc_gpio_set(chip, offset, value);
 }
 
 static struct regmap_config logicvc_gpio_regmap_config = {
@@ -135,7 +134,7 @@ static int logicvc_gpio_probe(struct platform_device *pdev)
 	logicvc->chip.ngpio = LOGICVC_CTRL_GPIO_BITS +
 			      LOGICVC_POWER_CTRL_GPIO_BITS;
 	logicvc->chip.get = logicvc_gpio_get;
-	logicvc->chip.set = logicvc_gpio_set;
+	logicvc->chip.set_rv = logicvc_gpio_set;
 	logicvc->chip.direction_output = logicvc_gpio_direction_output;
 
 	return devm_gpiochip_add_data(dev, &logicvc->chip, logicvc);

-- 
2.45.2


