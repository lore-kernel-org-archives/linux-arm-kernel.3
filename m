Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 692FEC7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 12:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gnET98UW3q4Lh5roGHBULYTY/QH8nhGQbEQwpvTzKlQ=; b=REaqL+Ae+bag1gQxCsVRSLB4QE
	LYGaE96liHZNC/KuPX1I/t5gjUuxqPEybn+4zJC5YnoTLKEyU6ku5Y7KXaGVbcqDPPNaZhW8tfHw+
	wRi0NEsciIZBe9I6QvkFf6BDf7v00YHYg8bUjx04Y8XUFTR9kY2Okx4TO4rApO00lRKKjK7Xdfkcj
	5f1MWJz2mwoU5oNNM78M1z8O7Ao8kr2gfcQUFGVsvItuQ3Cf0FffOEdB4ZT3r2CvhXl1QcNrJVjzQ
	TQ54z6I9D5SR4R0GsvVYFuQz3wsGJzC83/5iryLRdqr82uhDH9ZyjyHn6iPRbhCIQCQC+/MiK+Neb
	P1yMfttQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWaXl-00000005P9B-2IyX;
	Tue, 01 Jul 2025 12:57:01 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWZUj-00000004vHT-3RPW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 11:49:51 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3a6cd1a6fecso5926851f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Jul 2025 04:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751370588; x=1751975388; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gnET98UW3q4Lh5roGHBULYTY/QH8nhGQbEQwpvTzKlQ=;
        b=FZ3mxzQwY0HU6spVwx++F63XqBOP0QXb08Z891sO4uME1z5EaqFthT54/uemkiStRP
         8cuVYGptB2TTz8Al7Yl84KwaO2XsJWu1zQW6vR3OUT/H1NHwnC05WDD6tTeSRXDkGFKv
         tp+/N+HgsJcnesrwgTBkINps+3+4v6QKygWK1j5vLhZ1sp9X6nJkBkO7r8dPNk4s6OdR
         UjwpijqCmlXdoZYJFmFkVmPuEl8jiYAla9DmEvBi/kXRNnrgk6+cUawYxffNhzr1VIqZ
         tkk7uienErRoMc7mxgFWlkEIXPnbgbGTRd0o5gt+H0dJ3C1coEUZihEdtA4wGS3JZQXB
         lvPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751370588; x=1751975388;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gnET98UW3q4Lh5roGHBULYTY/QH8nhGQbEQwpvTzKlQ=;
        b=aGTuun0kGS8A2MAZ8n8aquxy+GoCJcruQSpuNW7TaW8iyW5XEbJS8/KYASxwGm015U
         xCtzouVvJxZ1PqHuKeabbusAbXelzRQlvlfyXvopO0pWcRlIGGzPs2JyBz4otuP8s3ke
         OFrIwjwj3arYAYEbbJ90qDxs7BQRVZjMd/zl7z0CW+F+ylJQ7FJ2CyJheFCQP3AD/uGr
         FeDrBDXeoSh+DcO0T5VnfuOr+1iB/QwCuG3OLZkEmFVDB1ZTLmgYtFjAPrylWiySGRi5
         tBT2cIREwzpi3hBu6f8y58PvneIhaTfMskNSHiYjrhJ5ze17I/4dHt+JXVtuNufkcJOW
         4vuA==
X-Forwarded-Encrypted: i=1; AJvYcCVdAqnsB4FyDFwlXUoWOnag4rWTl0wnrugPU7gRlgQLY6t1OfInvrQKqdrDnwwcOmZ9jAGyKmUvfy9VF0YrUKX8@lists.infradead.org
X-Gm-Message-State: AOJu0Yylnj3wnV9IAp+b95V6Sb7Eu1tR9h7NIiKq3duhZtSF3jQqbIIg
	ZKzQ+BxefVISe11+ZMKUPGpuc0J1poFqvqcqWO2XXprPwX2GBD4pmWgX71VfQwZoqMA=
X-Gm-Gg: ASbGnctG4QRWDBsTjza4sj7KYj726Z11SrTvxiZQwXa569BeTRVcO3cA3H+Itwg3AV8
	Qu9FX76dFSylEUJfOjWfDvTLEZa4HWWBM9rIp7r9Mf2pC3ahY7dtIAzojV029IDWq/rXjK+xqhb
	Cd9FjuN79cva7Su4DLCo3eVAP0eO5AivIbtG3jLLvQXDfhjMpyRFk4ue6lOqv5dRXXVQBPmq2Lu
	Dd7SZb9rohKUr9cO2kqa19axJkxNfvWWGbOan/ob3RpNg8Gusd6/R/v3eKWl8gsMjg5kBUkH6TZ
	hb+ST7dAF1yVk5VLPuec4ARZp55VJ9u3l56svbjUF3vO2ZevibG7VA==
X-Google-Smtp-Source: AGHT+IGzD4Mf8syZLNv6toYxZEcYHBpzR51yBNAd8gDbc5ThQS0t22Hcfo27kXGUE7z0H6MDx9Amyg==
X-Received: by 2002:a05:6000:104e:b0:3a4:f513:7f03 with SMTP id ffacd0b85a97d-3a917bc827cmr12012983f8f.44.1751370588497;
        Tue, 01 Jul 2025 04:49:48 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:a387:7a32:8457:f9b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538233c05csm193988925e9.5.2025.07.01.04.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 04:49:47 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 01 Jul 2025 13:49:36 +0200
Subject: [PATCH RFT v2 2/6] gpio: mmio: get chip label and GPIO base from
 device properties
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-gpio-mmio-pdata-v2-2-ebf34d273497@linaro.org>
References: <20250701-gpio-mmio-pdata-v2-0-ebf34d273497@linaro.org>
In-Reply-To: <20250701-gpio-mmio-pdata-v2-0-ebf34d273497@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Lee Jones <lee@kernel.org>, 
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>, 
 Russell King <linux@armlinux.org.uk>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
 patches@opensource.cirrus.com, linux-samsung-soc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1825;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=GroFk8Q5FkhtN365brFZHyh2tlzBuOR036y6JYVpJP8=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoY8tXgR8SvDBadENlz3jrMIRT1uq7RXKh2WvYk
 h5qNXOpDVqJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaGPLVwAKCRARpy6gFHHX
 coMTEADCnHYB6sIGGMnETNsvZvTMFWuIKl4hmd/MJvNwxPLxGSAQMY8Iv5AMkfa5y+vpFI1CCqY
 ItUhoMYuoZhgWZbuPp2Mp5n0k8rbZuR8xvlNRmRl1okJF5UfkBUZXNU++yE1OnFkKqdIqdjvCLe
 GjiCZ6d7Rlyj1eAiztikmz0X+a3otxj88gBbJ4Xce8xldqreAt9psxwTt5Csso2Ed7CBifFCkdF
 jggoFS43tmUKiEgQDX7QrMdUz2ZzWcEnScXzxXCybwChAwBm89CNC8nwDIdpkwv8SVpTXLjoDBI
 KMUo59dDIDM5JlVQG+hOvEGn0KwXwdOdUdIrxjC4jmOy9P1SZBQDpuQjGQ0KrkgWHodvsobzWsH
 gDboc9/lF+vhA6cb8JqlW8b7efovKfPdgzryvGHU1fDAuA67fx0uaP1uk03sMdjsfcXU4j1+6Q7
 4H5UPNqnJhXS2ZtONHUnMHHoFdOdp4IAIYgS/FnZ5pgZ6uCrwPYP8TizLs+7MfaBP+Nd9x1R97L
 oOZT8GX4x5AVOWvC0Ja4EZ1AhFD/ohEiCc3qE6lmHkvCWSrbW+5CJ0l34b9FpQ98tneqIecRGmp
 QaIdfjYq1PniianL9wOyXpiG1asjjQzvnapg1liCMla4LDxUDlrFW7xii6z+3tA1lg5iASR+GqA
 dHRw54sQZ++x2MA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_044949_900477_EA71259D 
X-CRM114-Status: GOOD (  18.08  )
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

Ahead of removing struct bgpio_pdata support from the gpio-mmio generic
module, let's add support for getting the relevant values from generic
device properties. "label" is a semi-standardized property in some GPIO
drivers so let's go with it. There's no standard "base" property, so
let's use the name "gpio-mmio,base" to tie it to this driver
specifically. The number of GPIOs will be retrieved using
gpiochip_get_ngpios() so there's no need to look it up in the software
node.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-mmio.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
index ffe6b6f6cc9b1e9341e1c42cf8fee917e0147bf3..f66137caa245b14e6e8dbd043243224bc47c9609 100644
--- a/drivers/gpio/gpio-mmio.c
+++ b/drivers/gpio/gpio-mmio.c
@@ -737,6 +737,9 @@ MODULE_DEVICE_TABLE(of, bgpio_of_match);
 static struct bgpio_pdata *bgpio_parse_fw(struct device *dev, unsigned long *flags)
 {
 	struct bgpio_pdata *pdata;
+	const char *label;
+	unsigned int base;
+	int ret;
 
 	if (!dev_fwnode(dev))
 		return NULL;
@@ -753,6 +756,18 @@ static struct bgpio_pdata *bgpio_parse_fw(struct device *dev, unsigned long *fla
 	if (device_property_read_bool(dev, "no-output"))
 		*flags |= BGPIOF_NO_OUTPUT;
 
+	ret = device_property_read_string(dev, "label", &label);
+	if (!ret)
+		pdata->label = label;
+
+	/*
+	 * This property *must not* be used in device-tree sources, it's only
+	 * meant to be passed to the driver from board files and MFD core.
+	 */
+	ret = device_property_read_u32(dev, "gpio-mmio,base", &base);
+	if (!ret && base <= INT_MAX)
+		pdata->base = base;
+
 	return pdata;
 }
 

-- 
2.48.1


