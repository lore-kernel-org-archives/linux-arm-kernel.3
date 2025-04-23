Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51103C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 07:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nDPnLb9e7MtlJKq+kitIrFY2UoRe6RaLIN9ni7aHQLA=; b=HY+nGp2jhnPJl1T+/QIenXJ5hf
	k9cFsgtcBBDMM/yIgkdCztaLkdsnxcNuCGd5U1qTQuDCXPsxeQlg9OX8zxCrYgRDgC4jRbI97TXNC
	Waupps55W/8njwLz/zoK1uc9EfBQ7oN9oaZ3cYO9dKnQXM8KcJwC78PFFQdHXTVKG+noFOK42w0fz
	jolXtb5WndfG1NNK8XGb+PRYUq4uOUeFkHhNhr5ckstaKOTXTuubAyaKo+00j2mFhwh+Ly7Wh0KQU
	fUf2b+de/8HLndJPuW8Xa5mEkRmqASw4+Dr3XDi5HFcZlIF+34kGh9yuBeXmH/snVfbPjXusIuJxb
	LV7sASHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Uns-00000009Ywd-3rIx;
	Wed, 23 Apr 2025 07:45:56 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7UKQ-00000009TYw-1cFP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 07:15:31 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-39ee682e0ddso3476355f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 00:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745392528; x=1745997328; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nDPnLb9e7MtlJKq+kitIrFY2UoRe6RaLIN9ni7aHQLA=;
        b=oyhqW7cBAUnr8VO0PbNyTRJNxzViSIxh2NfSMVG5LiBhO5WgFC3jpW8nP8lGj1351o
         WE8Sc6nwEDxy3ElDzLhBXRk18wx9FAH+M+vpMeNUBxAr9/kzedq4YhKu/qzZUpK2VO4k
         Tmv0wVNJPii4pCBIbneHbxGmxQiibb5/ZoRu/DHmBUYbr4Hi3JnAdM9hWOZorOqWJFf+
         D5B/fVxX4vG55GK4nM4EirHVZFvG7aYZGvD7irJoaIkq08YdkgXmSpom9482iOThXH3H
         goeTsApSrJPDF1xHqFCWnBmR1yDXSMosLxRMxbAjQTHlqL64AVshY29/TyN32SmVbGc3
         VRkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745392528; x=1745997328;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nDPnLb9e7MtlJKq+kitIrFY2UoRe6RaLIN9ni7aHQLA=;
        b=vRZun7cCbgM7m66H4ZIFo53rsx7qau6Kf9W/JvRREDFck+UFDrB+u657X8LqskeQ+Y
         9yy/zxZHdNK2Pu1kCay7/rPhBFspBTuTC3dbPMhyGZfMQF+11dI+UJGK8QV7FfYVG6lS
         jrJmAyq8qrEO6/s+prvjANgngfFC08PHU6o91aUmHRMSZO2VwZUWqof5N8ewGvlhGD5R
         57OFL0PI7fCoVVf/wELre6F/TSdDVdjJE51+08OJMUaJYsa5zFSC/DA25TMKeRTUUKvF
         on4v4i3GEJBAKjOB2/qU7Y2lzEuRLRxrOtG74OkSh1l2BHYSiS1DwhmfDZJFftp+KKMZ
         AuUw==
X-Forwarded-Encrypted: i=1; AJvYcCVQ2MF6Y+yOLKTh8wPkuAt/5S6Sdizi4gg5TZ8vJEtjHoDbeJxRI00HIEMA1XWjmMa0cIjd0USWjiBpHjBDbR4R@lists.infradead.org
X-Gm-Message-State: AOJu0YyGN7ZyspvTaxUjWEGyzzskmMr/FhpP030xTuCa5qzMwaxRrOE/
	IhOhFWFPYuUG6o8UlIpMQTd5deGbK3Bau4f+sBU/pm6mPzzrv5sa/Cek+ffxcpzc1HAiEFhMIUM
	8EOE=
X-Gm-Gg: ASbGncvnU2k3/m9KiJcggnanYtbTfJZgyQz5QJPfHPmYhtjoG2Hd10HiZ20THE+j2kx
	labckvUvkCeJuyaUowkG7w103oK8WltVpTdUOenVhDvNv8mn7fsJtBpqn8DFLsprIuQ1p2HC+io
	KjvvlCAwWoWCSCCyBMvlULhLSYTwWAJoF39OIWEgm6w6eoTIoIf2GnM/q2mLE4/l+QmvwTSjxfB
	T8JTy1Vwkb1mfcbZi4cGL9mffrDsGJY+FdPTWwb/nyWNLo/EE2nweu2Rox+8TcDqUtzeN3Hyvsa
	YdR1ugeUEbToiLkTRVlI8GIBiVCXx3BfDg==
X-Google-Smtp-Source: AGHT+IG4ElSHC7IwlTsGTLIS8AFpJo6V3IEFvD0t8DPJXLGCbfVBAFrUXLFfWQ80OqkPgdRhHCCGkA==
X-Received: by 2002:a5d:47cf:0:b0:391:3b11:d604 with SMTP id ffacd0b85a97d-39efbaf6f60mr15814842f8f.54.1745392528677;
        Wed, 23 Apr 2025 00:15:28 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:74b0:71bd:6dda:dcc1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa493446sm17696935f8f.74.2025.04.23.00.15.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 00:15:28 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 23 Apr 2025 09:15:14 +0200
Subject: [PATCH 12/12] gpio: lp3943: use new line value setter callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-gpiochip-set-rv-gpio-part2-v1-12-b22245cde81a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1908;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=FKv0jedtK8ZiOafLuePhziFUAqITUizBRiw5s9uuJh4=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoCJODsx6BmS5Uu3epYT6N1MlKACyMV3s6UBiz6
 5RntwZ/tcOJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAiTgwAKCRARpy6gFHHX
 ckvDD/9EH2Cq8MY5MoOXZTt6EMH1AEYUaKFr0FsHiSrhY9sp8VAZlwuAebQrfiTazzJ54yI1HAA
 zxk/F2yLuHJo5SxVJs7u6h+/0wf5MNJhKNr05ZJQdTzhn3M0KsE2MJDCzvf189nXA3B5BlBysbF
 KLaDTCGPJBGO9DjOm3BakFKHwT+YN53PZFKNlZkpjg2q9EkmGgondq0BFDC21gw5BDK8NCpBYwd
 YEYQ38fp/o/YGTlg4Dia8DPwYwmzI2mzyG7H/HnGGlWbqd/OqaHf4zx39t+kcKq6JQtdnn0s9SK
 1/SEkXmveDecJYUqkS7ckKP3EUD7nZcEReypoLwPhYn8Gi3veJVeEXns3Bfz9tnQororc28L1b5
 z+ZS+HTK2fV2O2HThQThzilNSepFKOq6Q23mFIiRnP7JpEKRRd27GgfknT6+xC6Dya2e4ZZ+KKO
 +UuGlTDBQFU48+cNeuJVfJYXNZroT6fbFjMpPUAZ0B/FU622qgWCjtX2Okt8O5bHdu9l88Xv2wV
 FHf/+EB8a06+atxP5WHtqCSfEv48CirSDeUCg1w+qeQicvBiJ7JmJKXm/u3OEGPAH3toIq3ktI8
 KTWWXlFIIUkIlVM15leFB/hrsHmBZgrOaLWx4zbAy8YNfAKZh4e3P9pPkKNRtXI58kWPncyMps6
 vqDvC+FesU7V9xQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_001530_432294_DFBB29D5 
X-CRM114-Status: GOOD (  13.13  )
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
 drivers/gpio/gpio-lp3943.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-lp3943.c b/drivers/gpio/gpio-lp3943.c
index 8e58242f5123..52ab3ac4844c 100644
--- a/drivers/gpio/gpio-lp3943.c
+++ b/drivers/gpio/gpio-lp3943.c
@@ -147,7 +147,8 @@ static int lp3943_gpio_get(struct gpio_chip *chip, unsigned int offset)
 		return lp3943_get_gpio_out_status(lp3943_gpio, chip, offset);
 }
 
-static void lp3943_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
+static int lp3943_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			   int value)
 {
 	struct lp3943_gpio *lp3943_gpio = gpiochip_get_data(chip);
 	u8 data;
@@ -157,15 +158,19 @@ static void lp3943_gpio_set(struct gpio_chip *chip, unsigned int offset, int val
 	else
 		data = LP3943_GPIO_OUT_LOW;
 
-	lp3943_gpio_set_mode(lp3943_gpio, offset, data);
+	return lp3943_gpio_set_mode(lp3943_gpio, offset, data);
 }
 
 static int lp3943_gpio_direction_output(struct gpio_chip *chip, unsigned int offset,
 					int value)
 {
 	struct lp3943_gpio *lp3943_gpio = gpiochip_get_data(chip);
+	int ret;
+
+	ret = lp3943_gpio_set(chip, offset, value);
+	if (ret)
+		return ret;
 
-	lp3943_gpio_set(chip, offset, value);
 	lp3943_gpio->input_mask &= ~BIT(offset);
 
 	return 0;
@@ -179,7 +184,7 @@ static const struct gpio_chip lp3943_gpio_chip = {
 	.direction_input	= lp3943_gpio_direction_input,
 	.get			= lp3943_gpio_get,
 	.direction_output	= lp3943_gpio_direction_output,
-	.set			= lp3943_gpio_set,
+	.set_rv			= lp3943_gpio_set,
 	.base			= -1,
 	.ngpio			= LP3943_MAX_GPIO,
 	.can_sleep		= 1,

-- 
2.45.2


