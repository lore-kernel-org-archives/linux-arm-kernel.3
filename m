Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 438C9C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 13:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4XWDrcCR7OT510Ct+OwfzYOyuZ8GrtVgHNMqiJtKBDc=; b=S3hh3Ui3mmlzNlCBA77oNGyGIE
	6Nlp5hhp6K/m9f7XruNk8rlYzbIeNTcuIdwbzkMDiU2lAs0VQlkbX1u5SQ5DWnYA9Q+GqxiMTTyBg
	C+BG7IvbOFEa9CzHn1dRw1luQRigMd+YqAFkEKZv8gW1W7WDR9jNy8JCBtWMeZwNAOHnNREODkdmD
	59S5rWZASfRWxTnxgPb5sd4R63S3EgBDJ/oMe8foeiiFsbT54whqA6kTdPUjmHlozlAkQwE30jr9r
	xn0aDlHtKFcqmr61Mu+3ItuwLr8J9f892w7jLz4uET3v1N/X8i3HUlqZSmJrA5Sep1pcHyCW+QF3m
	fdARrolQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU3oN-00000005jOn-1Tmh;
	Tue, 24 Jun 2025 13:35:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU3Yj-00000005h6A-3U8I
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 24 Jun 2025 13:19:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=4XWDrcCR7OT510Ct+OwfzYOyuZ8GrtVgHNMqiJtKBDc=; b=CKFmLF+NjX+j3hOe6ffYBy/Xj6
	HbmjqZP9+5zM4THwqX3pphFzQRoqVlDW5AQmwuNK12E90L2ceH1X3/w0ifrieuJDUTukaHCm5z5W+
	0/4WsNvV7BegexSwfUrWjswmBIBGAndy3jpwVbuZSaoRKJ49gMiOu5z8P3gq89HpTd57dPMN3VRaW
	KLXgMPIZE/jCSzlubJyO8gUFWfjkF6nn5RYJp5GhoGhLi5ofYV0QVn47gPplW1gSfR6NKiPuMMaft
	iCh9xRg6Yubri0utbmm57cv/xSJtIE1aVuGFHlb7Ubf+Ghdl1gFm3vmLEAF2a49O3U7wbp/WirpQ8
	GvQtInqg==;
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU3Yh-00000005Rbp-1Usc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 13:19:33 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-45348bff79fso58755715e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 06:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750771169; x=1751375969; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4XWDrcCR7OT510Ct+OwfzYOyuZ8GrtVgHNMqiJtKBDc=;
        b=mYTSbycnfL0PZUT878mmewUSwChHTcvWlon/pWYQBuFsK1m/Oj9YvcVRP8MkAched5
         NEshYofXSZXicTJMqVdcVs3nts7jiqB2Q3PKUDOPHrYZTnvAyGhKO4rqbDS6FNGyTtLG
         9DiOn1kc3NbTnDd1+oJ2qgiuoHx6LkVFmGayREojHi3IlbbzD59k/BDoEk/AJuo9/Vjb
         h1UxevI3pBrLXkXVgjz53mMpYSBktAos7OY0XXhEBiPXlPOx3ZtioCW1IkL0u8XOAT+r
         hcjMnwrvCGGR1zgoxOJ7h4Kw8OXpSI2FmoP2Qu0+Dp4KtOb6WrdGcpqds0I8MXITyXxB
         4ASg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750771169; x=1751375969;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4XWDrcCR7OT510Ct+OwfzYOyuZ8GrtVgHNMqiJtKBDc=;
        b=Me2Uan+D7IrApm5hKHFS+RZLyZLAyAasuK2QUxgiJsGJtol3OdP9obexwXnNEXgRMR
         ns72zqFXStL7+3/Ywrr1ajyNezp+F6LR230J8B63WlceRI0V/gd6iQLtMuQME0oYo+e0
         PnsVM50lQm8skHR9p9aY+RkTQK0BCPIprxXpMpvP8Gjqp42oHq7OYKUxOfeqzfYYxUg2
         cM3w81PWJ0+YjQ3rW/fjTAHeKH3ewMPFQWdvAlaKHqVnZ5wjsIIVGJy0U7SLJDuZ1ZQt
         aiBZudlqhLn98/7cta0lQwqIrQBUd8Df4MccF0gbH+w+6HD2L6/6ory9IskcOcCcL5s9
         qZIg==
X-Forwarded-Encrypted: i=1; AJvYcCVBSeRLAOKIK0ZoPM3V+L/nRkLa8FQ1TD83fAHhiETo/15hL95of1oh4wl9w//qAsrqnIu2yW2cCbs8Dv5HshpL@lists.infradead.org
X-Gm-Message-State: AOJu0YzWFurFXk9KQ5ua96+Y/I9HuFZ6B8ZABai1ncbAq4lns465ZrgP
	iCv8ZRfifjIuWp0UOzpQpC40f+FASUZk7T7i7YdYombWRkanbodFRkbURIM2O1NtVj4=
X-Gm-Gg: ASbGnctIamTPb5NG1/5Qq9LIgn0BxkjfODhfVj1XahezLljgKc/Kcv5vGVflh29l3Y6
	m/S3C/VJHYixzGnISP2vVZ8xLUsnBK+UnNHJlzpxHkzSJWQ2aNzedsm4yFi1fyBE+f0YxpuTwDb
	S5rI+vf/EI47MsQza+BDkPemFGrHtRAM2B1hBsic0AQJQ932asouby+RsrsbGB3wicwSHpYjXPI
	jXFEJd8eXrnZjCve9w6e59/E3Cx9ziwWRBc1pdiVf33GGtEkwUR0zZ3fpmVwn2Ztahftj6iEAuX
	DSpSy/9E/xNPpdOcjK8SFqyv+5xHHbXf+r2eF+UVzhJkdzLmcV4XxGZSMYV10qmDlQ==
X-Google-Smtp-Source: AGHT+IHock10RuoGmx9RjV0wcweNeUWiSlaHQv7qydV2y+gLq8elzq2R6RpRHGxEHqwYFF+B8DlZkQ==
X-Received: by 2002:a05:600c:474b:b0:43c:f63c:babb with SMTP id 5b1f17b1804b1-453659b87a8mr141107155e9.1.1750771169216;
        Tue, 24 Jun 2025 06:19:29 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:34d2:109c:3293:19e9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453646fd74asm141302195e9.22.2025.06.24.06.19.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 06:19:28 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 24 Jun 2025 15:19:16 +0200
Subject: [PATCH RFT 5/6] ARM: s3c: crag6410: use generic device properties
 for gpio-mmio
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-gpio-mmio-pdata-v1-5-a58c72eb556a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2325;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=M6ivCbrYHPALir/oej/d6m+XWZnB9b1K2kuZYU64O7E=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoWqXYHuWIS08dfkwBSN+97xWMlPd21eWVTsrnJ
 aCZTr2sEbCJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFql2AAKCRARpy6gFHHX
 cmJ5EADEZBGMrsssERYb0hbYHuDO71o5tJOkBGjtxDQMWd69JSv/peQj3COKiIsNF/Gr0nRibnI
 JQR9DYoPrU/zYNClACJIwUcBQhO90OGl3SJnCHw0+/oZJLkV9GODi/eWfP0pXJBMODhif0lmI6D
 by2gxddx5gLTJPdH3LgPzeCIqBdaZZVUcBczeKAUohCXubLUdGsNGjW6LBVv2551UT42GHRe/58
 HIDSQcnOkMs349hfYnJJ46B4Y0eVCIPKxn0O0vazcX1A4zZ8YoNyxalJFZePDAXceYixgodB5Ff
 FaGqb4GynaMX555Xm6gb3Q8qoTUk7Z3j8nneJGWVdsx4tn7CzRG6LAfB5nNr+ZPE8vt202uM6Jj
 ZLPw4u0x8y8vu0KY+mmao24DKhvsno+w60UcBwkWHMurz7eJYaC5mHdw2InYeVIYIAMdVNmLWXj
 f6nHsMpw4Y8Hq/W8nLSlRVr+tRyNoiXqPo5w23E0L+EXR90LFd/kB/KDYpe7DDfz6sIhy5+mR9k
 xAzi97fZ0kryw/CQ2Kl1sifpiX6jzvl2Z1xJkG2cB+O52G6RcPyzaPhSMssPiC/KLo5V4+dNdMy
 JlQYJJe1Bzv5/pPnYskdrYLZRWgkzswDLWNshjznUqRHVoRGjhrhKUTH7Gi7ksoj2i3xUmesxGU
 M7UJ/5rPUB2CDPw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_141931_506782_9EF0F54E 
X-CRM114-Status: GOOD (  18.07  )
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

The GPIO device in crag6410 is registered with struct bgpio_pdata passed
as platform_data to the gpio-mmio driver. We want to remove the
bgpio_pdata from the kernel and the gpio-mmio driver is now also able to
get the relevant values from the software node. Set up device properties
and switch to using platform_device_info to register the device as
platform_add_devices() doesn't allow us to pass device properties to the
driver model.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm/mach-s3c/mach-crag6410.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/arch/arm/mach-s3c/mach-crag6410.c b/arch/arm/mach-s3c/mach-crag6410.c
index e5df2cb51ab27896d9dd80571f421e959db1fd1e..028169c7debf325ab6f51475d3595b92b1307189 100644
--- a/arch/arm/mach-s3c/mach-crag6410.c
+++ b/arch/arm/mach-s3c/mach-crag6410.c
@@ -252,14 +252,17 @@ static struct resource crag6410_mmgpio_resource[] = {
 	[0] = DEFINE_RES_MEM_NAMED(S3C64XX_PA_XM0CSN4, 1, "dat"),
 };
 
-static struct platform_device crag6410_mmgpio = {
+static const struct property_entry crag6410_mmgpio_props[] = {
+	PROPERTY_ENTRY_U32("gpio-mmio,base", MMGPIO_GPIO_BASE),
+	{ }
+};
+
+static struct platform_device_info crag6410_mmgpio_devinfo = {
 	.name		= "basic-mmio-gpio",
 	.id		= -1,
-	.resource	= crag6410_mmgpio_resource,
-	.num_resources	= ARRAY_SIZE(crag6410_mmgpio_resource),
-	.dev.platform_data = &(struct bgpio_pdata) {
-		.base	= MMGPIO_GPIO_BASE,
-	},
+	.res		= crag6410_mmgpio_resource,
+	.num_res	= ARRAY_SIZE(crag6410_mmgpio_resource),
+	.properties	= crag6410_mmgpio_props,
 };
 
 static struct platform_device speyside_device = {
@@ -373,7 +376,6 @@ static struct platform_device *crag6410_devices[] __initdata = {
 	&crag6410_gpio_keydev,
 	&crag6410_dm9k_device,
 	&s3c64xx_device_spi0,
-	&crag6410_mmgpio,
 	&crag6410_lcd_powerdev,
 	&crag6410_backlight_device,
 	&speyside_device,
@@ -871,6 +873,7 @@ static void __init crag6410_machine_init(void)
 
 	pwm_add_table(crag6410_pwm_lookup, ARRAY_SIZE(crag6410_pwm_lookup));
 	platform_add_devices(crag6410_devices, ARRAY_SIZE(crag6410_devices));
+	platform_device_register_full(&crag6410_mmgpio_devinfo);
 
 	gpio_led_register_device(-1, &gpio_leds_pdata);
 

-- 
2.48.1


