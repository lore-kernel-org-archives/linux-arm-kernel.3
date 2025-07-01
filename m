Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 469DDC7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 13:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G5JfVfRdI8YGSmLupnI2yntxXLXiEBq3CMfmRLHEFpg=; b=jp6J9GzLzbaewWNTREtzhOnOLB
	FDLr01jbDVy+oPQuPGmRq3CDT8K5g84LW3gSF2X+NjGfJ1TUKzuFXGWltGLNOWjAmjN+sfQSvOFDM
	yPd5qJNuGVD/AEC/ZNOCOqu1rvKG1iCZU10aMqM+eescE7uvLB92LKPZAeNwlwWjpKTtcxkmLoobA
	l9kF+XxhRtzANeA3TZSjr/tGVchEBNun6CYxZAPNpDGYcFk92KzlyGsJW9Q2pgNC0rRZDwVO8hTg0
	57y5N2BpgTpcyd0o6l9QKfi66AgsHz5ompBt7ThflPMdOfNg9m35BKH5vc29ThPkqH9c16xJrdjnT
	i1mwdmgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWaeg-00000005QyH-16Uy;
	Tue, 01 Jul 2025 13:04:10 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWZUo-00000004vKM-0ILn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 11:49:55 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3a4e742dc97so4131643f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Jul 2025 04:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751370592; x=1751975392; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G5JfVfRdI8YGSmLupnI2yntxXLXiEBq3CMfmRLHEFpg=;
        b=SudWvlEZeWYL3m0qBIXUPDGG1isutiBQuz3x2GetNTb3tz9YKLXCwflR3EAGMlsM59
         n1WcK3/SVdF9jI/M1pqud8zumocH/daLIHLVTzADpLpvXzhJ70Md02ng564kjzKWLdQX
         tzH4wEVI516t7CQ1XGSitlYFGdXCZqDqv/bsSF5w+099vi8c2Y1ayKFIaMUmgE50gS0J
         yGwbpmeQctJ7e2oIbOfNsYzi6fVcEvW1bYsSsBh/MWIiGGn7g3e0tefeDd8iLllhx1eq
         4iPbR0iZDYPoWeK5lgjGlBuH2RhSOq+F4KoO0eZAGRD5YIYvy9cbD2fxJ5+7btTziKVl
         Uikg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751370592; x=1751975392;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G5JfVfRdI8YGSmLupnI2yntxXLXiEBq3CMfmRLHEFpg=;
        b=PsVkBlssEia5qd4grQ8Xunf9OtyQMRkt0b8gpsWiP0nfm9NWsqGkVlPNZ+6L3YQIbk
         NjSX1n8PB1xYYNXmXd7GfaJoVtCQLi3bWXEjqqgaIVyOaXxCxzeFFhFIv3gtK+iJ+js9
         Hn6zVpmLrznpsoTMKxsQJNPxRxtwJcCLzQoSftHxVwZbhF6x/vnd6ogC3j3AqdV83L4q
         k+P11xR1LfY47oF4DsMCn628H2BLX5zdNQVyCY5yxyyAeCtYK3/nR6XcQ649lu73y5FD
         sP2pd+3sbjzzUgCiSfnPysyKlapQZJ/HRfV0aXDxVvfMNr3K+ZkOg0gkpaxIjEsBcEOM
         yWDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBKF5kUTM7GusgIyYKRRUFU4mIjYaikI5wubH8JzloN2B/Cq1oE30rXSyNE2a80VimCIZB7jZCm29kR56vhUB5@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+xLEvte6yW6/QJCX+xI0PRS+dU013CFHhM0YL2RM5Ey8mY+VL
	5VnJQj1CC+GmJ5GAgFCM9Yh1JvqInTZ8qvur/zeS2xPife6nVzYA4RaBLeST0vGqo40=
X-Gm-Gg: ASbGncvBjw88wiyNrCsq/Mlp49yIurPIm7xIk1+2nW0eykMpjWocVkLG37AZ7jvO2Uc
	Q9XsaN5Rvi0Iw7SYp5jW0Ub9Rt2/6LhybFPTDJi83gDe5mfUU4BKQ0jf1d0v/BZdr1BbyofkrqK
	Pgiw7jMrhDdU+FfiC4ZJawn1AVcjTIndqtNPW4Tumn3IPfPqcVD4nhKjHZ7Y/KBgTA1Y7LFuii7
	eCr2D/v6aywbU/ZC8YSqTeBeU9oMVu5Cxi4wqOJLyX7j7wTOu2ACSA7RybZxQ8v+dRKb2JHf7lp
	YywnQZJMMOgmDjxGlmjaIB0WOomyy15pnyG15f5oyIQekUJ8RKjOgg==
X-Google-Smtp-Source: AGHT+IFBzvAMW8OcUT3OzLMR56Uz0A7DDsGCczyaZLiFWhXpYZeAX5dF84CgrX1TS2+Bnz9657x6Hg==
X-Received: by 2002:adf:ea09:0:b0:3a4:e1f5:41f4 with SMTP id ffacd0b85a97d-3af100ae561mr2412822f8f.17.1751370592384;
        Tue, 01 Jul 2025 04:49:52 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:a387:7a32:8457:f9b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538233c05csm193988925e9.5.2025.07.01.04.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 04:49:51 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 01 Jul 2025 13:49:39 +0200
Subject: [PATCH RFT v2 5/6] ARM: s3c: crag6410: use generic device
 properties for gpio-mmio
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-gpio-mmio-pdata-v2-5-ebf34d273497@linaro.org>
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
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2505;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=Csz4Ip4F3hS2hKgICREYbcOQHfEZUMwUqPJfONVy8Bs=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoY8tXJojV9gB1TOh7n6XBghRiq0iDiiZ/ZcyDE
 +zhzMX8YQ+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaGPLVwAKCRARpy6gFHHX
 chEzEACFiqLeHegljvLOJZKOgMI/7feOpGsAaU6leda/8EMbLme22btPegktzBE2Tx+25dc1NMk
 1S4hZOElYE9kmJ3RtG8k73hIx4aGXWx9V5tc5qPjH1fETRwMw6q0NTbX+htTvKTweNccQTGpXt2
 Ck807f72IdwQgp1VpDlA3AHWyFxKZgUufNlt5tUK+5NATO37+QWfJXgiAZzEBJsQMUKCHkngKmh
 2kHyGTR++BAIvQS1N7pao8D21fUf94+jN1GIQe3WE+IkV3peFf5mNFm79RMojKtROHYVqQcUufB
 AEzv2/23aUJJFSx6gMI6x/VQ3/ijH+fdbjeoNvFPS9X8UtcSbxtRRcoCj1tKZHAltD7xTdW/tMX
 dGz+rgzkuO2dgx3Z8sJ5LGcCybYk7+DJ6Zq4wxcDDhUFr9h9ldwzEyhKt63/KERqZonhAC0Wnx7
 yqG/LxvgTcoyedbspNOhAqsMMZ/C0JdFMfogDtwThcQJXSYUvHEak7ftsRbb1iNp+dpXjLjS9E+
 +nuZOf4k137Vk5CAStaGKp5Owxe9AL6D8eHIZo31ou5woBlI1BPSx8x7WiOYDtYnnxEVYy98DFw
 OF70h4BCXWWlZO7X+eMBJc40Q5KhRl4Mf7p6UzLAT5y/4EmcR/WIw7ss5+6NTtIuPJ0vK0ybpJr
 pp4oITttl0uyP0w==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_044954_113593_922983CA 
X-CRM114-Status: GOOD (  18.86  )
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

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
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


