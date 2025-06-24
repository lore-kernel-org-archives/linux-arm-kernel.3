Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BB6AC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 13:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g2B/kiSHHHZJxgJh/qvuyiyzLHnz4/qgrmBlSv19H08=; b=fJKlvHYYbKuXp1PPZWw4H2O5lU
	tNLbhEqeUXuuEqb6mMvgUdNBwYKQINNPolHBIPUHm6kF35FTTrsJDEyUsZv7UcfqMv4WYfuRtDcfR
	WxGB/n/MBTDNv9qvXVPauTRhno0Y50gnlV/5ilhGW0tUxlZ8bqbLoP9ZdxtQrHoxf8fYAKCzorUMN
	D84PUYy6P7DEB8w+YeiJ5YSfK6VCWlqe+yKeRRYPTacnJFI6K3VTalxPZCjtfGAuLBaqZXYFQ7wCN
	oIfVpfEQifU3gper4t6Z7rk9kj9xhSk8EG1ZrQcVaTu3MfAfbxSLr37cCqKgtHA/2fRIadsymxlDM
	y4FjcHDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU3m7-00000005j6n-2j1h;
	Tue, 24 Jun 2025 13:33:23 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU3Yi-00000005h5m-1VAc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 13:19:33 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4535fbe0299so29107375e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 06:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750771171; x=1751375971; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g2B/kiSHHHZJxgJh/qvuyiyzLHnz4/qgrmBlSv19H08=;
        b=tuNMYWn46dGq6VuS98xdYkcbZqWNiMxsHOeySIe7k3sdZEwanb4NjHiT5rZamjflms
         SnLbw0vETwI1AwHykCwlApSjy/ZXrS89ZS6yVph/+ye4x9jhkCohq5bM+T/ZdJ1Eaiwu
         zHzosoXLxr3oKA9r5XPOF/CAqXc2CC4sCTvJZBQPutykmLOSnmewagkU4tHJkoJD7Enx
         Rc31w/461MWMAQPV/T6aeg+IgEbw38Na9TP/LfpzSFEYKwJb2UtUBJjZAMi0/3OUjqHr
         01ICF1i6Dlwe8TrOlzpi6R3EkY1zfNeVDyaAq8MZLj9Tsju+ARukvFy1+z0rPw5mp4Ep
         QI2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750771171; x=1751375971;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g2B/kiSHHHZJxgJh/qvuyiyzLHnz4/qgrmBlSv19H08=;
        b=cIDKmLDjhg5irUeOkX67Fd61ZkkNXeFZHewzzOQK+0q5KUhlz/BLD9c9M+qwVTMdzd
         d5BeWBjL45CuoB9rf9qd4SxAWs4vppWGEw3dsYoSj4X8KTsd0l6ekfNOMSoRYLi48dnr
         cAWzg16XtUYiU+oQINjMExM11lzWcin1e1EybreN+q4zofU9HKIcGtqBGiqYQpITUBJX
         0W5dQA9xT+F4j1yVBJgMVKEDv6ftaqBZRo5uT9lOwVVgJmp5rofEtYj/hC8ArU4iAUT2
         kkJySuy37ec/CkHaSZb1Q86iR+vepxus7EAQcQpNQBqTlcE8rg8jaI3O1R5P44kAk4Md
         +1sg==
X-Forwarded-Encrypted: i=1; AJvYcCXJC/SDiV5+3gszIU7QXLIZ3JbWQUlG0Ubr+sCQkyjT7syaTxhJB7xkDfSy1g+J0IUmAiseqa5I4k+4FDwbEX8M@lists.infradead.org
X-Gm-Message-State: AOJu0YzucFx1JQJCKW8+hLU8NT/5qoNrZxM5gYroejN2mLSDOOtmXv8u
	fXH+8YMhSjQp5fEGLoRTOCUlFn+Epo4LxfXWHHZNQ1eR4809nY19XzBLNyl9+taWI7I=
X-Gm-Gg: ASbGncsT36W0kRUgw8of2cYDX58GsLVMBxJNN7rpjGHL8uyq7GhykXnS0psSnCz1W1i
	GVn7LWpv6SB4N6xbGeodjWm6rLqeQbfa4jdlX8wOvhsFscNTCmab/2gDR9SlNt2ziWa9t9vapnM
	djOwt2ycvRlSY1mBWOxr/CrEjkR9fR+ornvskZrZ7kwTUAim9/Q1qlrKFaYuP1ZZHtVBmPyQN+z
	fNoMn+WJ+9pOG+FTgBidq1OeUYND/vO0XTVFge+hCpQ42NWy3nCDLd1S6ZNFS0X8DlyUusdYkrx
	5F7dY2hzTRfUU6JwA6CCkqdy2yqsu+tm0FPRANPMKgi2687jWrpNx5bn71MVErwyoQ==
X-Google-Smtp-Source: AGHT+IEonwGwTEN0PQTTY5zvr8GZMj5f2L5JRFileQvI4Ft8kxR7RvhZm0EGSz4y5sH3Ydfuq5cdmg==
X-Received: by 2002:a5d:5f53:0:b0:3a6:eb59:f37f with SMTP id ffacd0b85a97d-3a6eb59f3d2mr816690f8f.12.1750771170749;
        Tue, 24 Jun 2025 06:19:30 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:34d2:109c:3293:19e9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453646fd74asm141302195e9.22.2025.06.24.06.19.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 06:19:30 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 24 Jun 2025 15:19:17 +0200
Subject: [PATCH RFT 6/6] gpio: mmio: remove struct bgpio_pdata
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-gpio-mmio-pdata-v1-6-a58c72eb556a@linaro.org>
References: <20250624-gpio-mmio-pdata-v1-0-a58c72eb556a@linaro.org>
In-Reply-To: <20250624-gpio-mmio-pdata-v1-0-a58c72eb556a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3644;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=H3M3IpDQpY9NSlvQzNFcRcqnugqGexh8ZnJKDM0pSQk=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoWqXYsMqxCAK8bVz8LUzIFa3A10IhSZWnxZZsN
 y8r7RVwjcSJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFql2AAKCRARpy6gFHHX
 ck/vEACtGvpcJ1rDqsgHSQ1GwautrZv4YEuXxKtBnuKN+NKbKghxnTNRHCCpyNXnCtxEbtiq7y8
 OjE8GYR13yIXh+1q7W+hK73xOKZZYp7OKgszPx6sc1XZVxQVUFaZZK9l1IKT36uV6GMdzHkBYTR
 VLXV1B8i3FYqgT9VVJiXlPCTeYkyRt3bOhslU2Wgf/i82p19bvW99oZ4odEgC+BAXpMEMOmb1bi
 s5gUjdNfaISr8OhvHIWmDOSjqnwnwMcBVPl6VnI8/Zy1bFo7DjaU0rTYcGDQMwoJ8jn1PRPbkKA
 J5vsXCQOkCe7CkMs7A0u1AQgbX4gQtST2Nun3Zndjk/OX1P4k+m6YU65hzs6kC2BI/ApH1pmCct
 tLlsIUDjPM8WAgsc1U4Y6WYVmSJf7SIVAy1uFDwLeKn3C1TzF93zb1HhF9fSeZNGNydcCtyh3ZO
 siD6Gb8u4cOa6kAtcEekj9BY2HBt7dl9Z1pIfRWL+6IbZX3PKftx6KkQKEFm3Br4FnQMSY8Vnti
 /yhgqO320uLRS6bIOZH70S91IcTigcwHdVkj8ndRazqgDc6pDaQ1xsUAE7CAk3hjnF4RoXaU3hs
 1vkdBp6qaOnwhfLDadsq11vMZoW8jZDv6A35M6PSY1zuGWL2uHZdVsOOc4AtnOGEblLXaWZDaar
 J16/cpP8OIkWQHw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_061932_404971_F310D18B 
X-CRM114-Status: GOOD (  16.16  )
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

With no more users, we can now remove struct bgpio_pdata. Move the
relevant bits from bgpio_parse_fw() into bgpio_pdev_probe() while
maintaining the logical ordering (get flags before calling
bgpio_init()).

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-mmio.c    | 65 +++++++++++----------------------------------
 include/linux/gpio/driver.h |  6 -----
 2 files changed, 15 insertions(+), 56 deletions(-)

diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
index 8108aa8e6b86ae3d0b520a0f22a09689ab1d9bc5..cf4d3f968af52bb750038d32f78d1c39498d3f06 100644
--- a/drivers/gpio/gpio-mmio.c
+++ b/drivers/gpio/gpio-mmio.c
@@ -734,39 +734,6 @@ static const struct of_device_id bgpio_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, bgpio_of_match);
 
-static struct bgpio_pdata *bgpio_parse_fw(struct device *dev, unsigned long *flags)
-{
-	struct bgpio_pdata *pdata;
-	const char *label;
-	unsigned int base;
-	int ret;
-
-	if (!dev_fwnode(dev))
-		return NULL;
-
-	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
-	if (!pdata)
-		return ERR_PTR(-ENOMEM);
-
-	pdata->base = -1;
-
-	if (device_is_big_endian(dev))
-		*flags |= BGPIOF_BIG_ENDIAN_BYTE_ORDER;
-
-	if (device_property_read_bool(dev, "no-output"))
-		*flags |= BGPIOF_NO_OUTPUT;
-
-	ret = device_property_read_string(dev, "label", &label);
-	if (!ret)
-		pdata->label = label;
-
-	ret = device_property_read_u32(dev, "gpio-mmio,base", &base);
-	if (!ret && base <= INT_MAX)
-		pdata->base = base;
-
-	return pdata;
-}
-
 static int bgpio_pdev_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -778,18 +745,10 @@ static int bgpio_pdev_probe(struct platform_device *pdev)
 	void __iomem *dirin;
 	unsigned long sz;
 	unsigned long flags = 0;
+	unsigned int base;
 	int err;
 	struct gpio_chip *gc;
-	struct bgpio_pdata *pdata;
-
-	pdata = bgpio_parse_fw(dev, &flags);
-	if (IS_ERR(pdata))
-		return PTR_ERR(pdata);
-
-	if (!pdata) {
-		pdata = dev_get_platdata(dev);
-		flags = pdev->id_entry->driver_data;
-	}
+	const char *label;
 
 	r = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dat");
 	if (!r)
@@ -821,17 +780,23 @@ static int bgpio_pdev_probe(struct platform_device *pdev)
 	if (!gc)
 		return -ENOMEM;
 
+	if (device_is_big_endian(dev))
+		flags |= BGPIOF_BIG_ENDIAN_BYTE_ORDER;
+
+	if (device_property_read_bool(dev, "no-output"))
+		flags |= BGPIOF_NO_OUTPUT;
+
 	err = bgpio_init(gc, dev, sz, dat, set, clr, dirout, dirin, flags);
 	if (err)
 		return err;
 
-	if (pdata) {
-		if (pdata->label)
-			gc->label = pdata->label;
-		gc->base = pdata->base;
-		if (pdata->ngpio > 0)
-			gc->ngpio = pdata->ngpio;
-	}
+	err = device_property_read_string(dev, "label", &label);
+	if (!err)
+		gc->label = label;
+
+	err = device_property_read_u32(dev, "gpio-mmio,base", &base);
+	if (!err && base <= INT_MAX)
+		gc->base = base;
 
 	platform_set_drvdata(pdev, gc);
 
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 97cc75623261917e9b3624e1e636d2432c0db205..4b984e8f8fcdbba5c008fc67ff0557bda11df40b 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -718,12 +718,6 @@ const unsigned long *gpiochip_query_valid_mask(const struct gpio_chip *gc);
 /* get driver data */
 void *gpiochip_get_data(struct gpio_chip *gc);
 
-struct bgpio_pdata {
-	const char *label;
-	int base;
-	int ngpio;
-};
-
 #ifdef CONFIG_IRQ_DOMAIN_HIERARCHY
 
 int gpiochip_populate_parent_fwspec_twocell(struct gpio_chip *gc,

-- 
2.48.1


