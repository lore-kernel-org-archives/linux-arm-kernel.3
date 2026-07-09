Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDDE9C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 04:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qxBAC1X03as+tFyIiqR1eSV5/XvfuyfF0ASJNC6z1U8=; b=xBJDS/+69qJG7eUTLFBR5pIM+0
	0ApIbtkQ7uNthEuWqjI0yyDUaJhBI5ZzxlwOBFWiLGznFsslUwQlgvhHmyKA/BIsfilsvjFUBatRK
	jWrko5mEXTOfeAKuxs2wLdXXz51u69d45notLTnKyvWNrtbYChbEzAr3krmD8S1WGUus2I8FpTOUF
	d9c2NlP+H2IvQAe2ngzsRfoilfvznC+S5nPlCp3GsXp49r/X9+1Q/FjeGCeOaPRmUbWFLesWGlly4
	w3gBbL2tkqsxZBHMigpvUsDuP8maYGqsEJ8CSYaUw/LIS5HCIo3XV7wxI3jyLhFWtUdJa39j64aN/
	lFQVJsjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whglV-000000010tV-2Sm7;
	Thu, 09 Jul 2026 04:53:37 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whglL-000000010hx-34be
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 04:53:30 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-3811074a8c5so1242165a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 21:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783572807; x=1784177607; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qxBAC1X03as+tFyIiqR1eSV5/XvfuyfF0ASJNC6z1U8=;
        b=cXaZQcthaIURSxk1jcwMkrZT76UCJdsvo2jmUC0YpbKEp1OhFuBPUKeTKLtRbtqyiZ
         eeRtHlhd+KTrrTcYDd8GKpSonNc+RnRFvwJ1IniDljPXUojw8y/wi2dTMWZFqFFFTAa1
         LnVCP7gnx9QBFBPrCldEM0TJXZkTaYNE06ycOYZWmkflsyNP477DyynJTq3Q3DRYGb8P
         1fULPrE4q0P/5MNwWvGjs8qFqAUFSOxvj1Sw4o/SFRo21386huq9G8Z0Ww9JwXlCZQJP
         8TNQibVb3m+97+8QmT2bDrlHpJBNyqe2G1ckymOe90hpkw1+iokD/zWuFBdacVqfguhC
         D+pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783572807; x=1784177607;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qxBAC1X03as+tFyIiqR1eSV5/XvfuyfF0ASJNC6z1U8=;
        b=tKkml+759ZMMwI8Dj82RfL8KWu4YXXLZYqJ4VgBAOzEgdbwOu3jMqQv1Pn5KjON5c0
         zl9NGRPbilCDC1nhCViUT6R3Rn3finFWtefYHN+IRV2w9ixpmCx4jF4BB2SAr4BuiuCH
         PE4tay22SMcv/25xFMPUkjYwLWAW6jqr5I2fDoOp40IFGevWwC3DkytgcI6kT/2pgjen
         i1yhUyTg1DeqzF9w+IfG0b05NU0MvsLXYkq2MW6IEWRlPCiIP8kDsKPlYLJqoOcVQuGa
         oFQrashIWP1TR8oHZMWwJ9VvN316VsHQ/OC8lg5UkeWULD+UagP5cAyLM18v5KPyoLTt
         N+cw==
X-Forwarded-Encrypted: i=1; AHgh+RoFzEfjvEroofMiV8E1Xd7KzZrBanqT/8bFfetSMSzrLmR1hrHC8OO3PJfA3nz//EA6I/mYB2ZkU361LK/4Erak@lists.infradead.org
X-Gm-Message-State: AOJu0YxsC3uzFzdDEC7SD5n+bq6EZ5Lu+CepWyb02fjSnuVmaOCU7uoY
	JSF4QjqNgyReglYeLzr3REaK72kRPpveHst3DWqVIuRICrN4ygmZmc18
X-Gm-Gg: AfdE7clsa5yQfAJoliYnLWYW21noQsbRZ5/G9hpO/nxFTk+wisKEXGiBNFS9b9ySnvT
	EIDzEbXFmPn13zkGtYQtpRtREGmxQca/vAhFK6UFPLNBDBooX+A0HILNef+H6QHomQjpjtzrdf4
	Lc8baEfNXSMdv0geNLdILmbBvpSAdMwcjiQ1xnaDMVpj78ouowCkaIWgD/fxIAEdDFFCev19cbn
	3FTeyPIeHUE8KTlYG83rj8tFdkKG0m3NX4EICYhcfYNhjcHHt0RDOWxnDudQvYSHGI8bIUHdg32
	t5CElYbaEgk1VIR0dDjhbCihQgWR0fcxm3wSHdnlzJIYLvITgHoKcJR10Jfh0SrGgjbGQmfLfGY
	WiemhudL46TUVWdbqIB2YSN6y2nDpXxzFumGp5fP6BZJ3yA1ddD34/cbKEB0NxNLvvnX+2EaggT
	6aNvC8T5LY7H+nxT/+fkk7Xw2e6Wbsh4v2QxxOL/YoxBFIzCvbrkVQJpzITdZup4kRGGIr7hvlZ
	7gYVjY2RmIVU/c=
X-Received: by 2002:a05:6a20:a107:b0:3b5:489c:7bb5 with SMTP id adf61e73a8af0-3c0bc95a3cbmr6838051637.28.1783572806789;
        Wed, 08 Jul 2026 21:53:26 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:e229:88c8:fd09:9a39])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b658a99afsm26559252c88.0.2026.07.08.21.53.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 21:53:25 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Wed, 08 Jul 2026 21:53:09 -0700
Subject: [PATCH v2 11/11] ARM: s3c: crag6410: convert basic-mmio-gpio and
 LEDs to software properties
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-samsung-kp-v2-11-3c6ed4c9b3b6@gmail.com>
References: <20260708-samsung-kp-v2-0-3c6ed4c9b3b6@gmail.com>
In-Reply-To: <20260708-samsung-kp-v2-0-3c6ed4c9b3b6@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>, 
 Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-input@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 patches@opensource.cirrus.com
X-Mailer: b4 0.16-dev-b242f
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_215327_819072_CCF7872D 
X-CRM114-Status: GOOD (  17.45  )
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

Convert the basic-mmio-gpio device and the GPIO-controlled LEDs on the
Cragganmore 6410 board to use software nodes/properties. This allows
removing the crag_leds_table GPIO lookup table.

Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 arch/arm/mach-s3c/mach-crag6410.c | 117 +++++++++++++++++++++-----------------
 1 file changed, 64 insertions(+), 53 deletions(-)

diff --git a/arch/arm/mach-s3c/mach-crag6410.c b/arch/arm/mach-s3c/mach-crag6410.c
index 03a97a20e38c..b48980920aee 100644
--- a/arch/arm/mach-s3c/mach-crag6410.c
+++ b/arch/arm/mach-s3c/mach-crag6410.c
@@ -319,12 +319,17 @@ static const struct property_entry crag6410_mmgpio_props[] = {
 	{ }
 };
 
+static const struct software_node crag6410_mmgpio_node = {
+	.name		= "basic-mmio-gpio",
+	.properties	= crag6410_mmgpio_props,
+};
+
 static struct platform_device_info crag6410_mmgpio_devinfo = {
 	.name		= "basic-mmio-gpio",
 	.id		= -1,
 	.res		= crag6410_mmgpio_resource,
 	.num_res	= ARRAY_SIZE(crag6410_mmgpio_resource),
-	.properties	= crag6410_mmgpio_props,
+	.swnode		= &crag6410_mmgpio_node,
 };
 
 static struct platform_device speyside_device = {
@@ -839,61 +844,68 @@ static struct s3c_sdhci_platdata crag6410_hsmmc0_pdata = {
 	.host_caps		= MMC_CAP_POWER_OFF_CARD,
 };
 
-static const struct gpio_led gpio_leds[] = {
-	{
-		.name = "d13:green:",
-		.default_state = LEDS_GPIO_DEFSTATE_ON,
-	},
-	{
-		.name = "d14:green:",
-		.default_state = LEDS_GPIO_DEFSTATE_ON,
-	},
-	{
-		.name = "d15:green:",
-		.default_state = LEDS_GPIO_DEFSTATE_ON,
-	},
-	{
-		.name = "d16:green:",
-		.default_state = LEDS_GPIO_DEFSTATE_ON,
-	},
-	{
-		.name = "d17:green:",
-		.default_state = LEDS_GPIO_DEFSTATE_ON,
-	},
-	{
-		.name = "d18:green:",
-		.default_state = LEDS_GPIO_DEFSTATE_ON,
-	},
-	{
-		.name = "d19:green:",
-		.default_state = LEDS_GPIO_DEFSTATE_ON,
-	},
-	{
-		.name = "d20:green:",
-		.default_state = LEDS_GPIO_DEFSTATE_ON,
-	},
+static const struct software_node crag6410_leds_node = {
+	.name = "leds-gpio",
 };
 
-static struct gpiod_lookup_table crag_leds_table = {
-	.dev_id = "leds-gpio",
-	.table = {
-		GPIO_LOOKUP_IDX("basic-mmio-gpio", 0, "cs", 0, GPIO_ACTIVE_LOW),
-		GPIO_LOOKUP_IDX("basic-mmio-gpio", 1, "cs", 1, GPIO_ACTIVE_LOW),
-		GPIO_LOOKUP_IDX("basic-mmio-gpio", 2, "cs", 2, GPIO_ACTIVE_LOW),
-		GPIO_LOOKUP_IDX("basic-mmio-gpio", 3, "cs", 3, GPIO_ACTIVE_LOW),
-		GPIO_LOOKUP_IDX("basic-mmio-gpio", 4, "cs", 4, GPIO_ACTIVE_LOW),
-		GPIO_LOOKUP_IDX("basic-mmio-gpio", 5, "cs", 5, GPIO_ACTIVE_LOW),
-		GPIO_LOOKUP_IDX("basic-mmio-gpio", 6, "cs", 6, GPIO_ACTIVE_LOW),
-		GPIO_LOOKUP_IDX("basic-mmio-gpio", 7, "cs", 7, GPIO_ACTIVE_LOW),
-		{ },
-	},
-};
+#define CRAG6410_LED_NODE(_idx, _name)					\
+static const struct property_entry crag6410_led##_idx##_props[] = {	\
+	PROPERTY_ENTRY_STRING("label", _name),				\
+	PROPERTY_ENTRY_GPIO("gpios", &crag6410_mmgpio_node,		\
+			    _idx, GPIO_ACTIVE_LOW),			\
+	PROPERTY_ENTRY_STRING("default-state", "on"),			\
+	{ }								\
+};									\
+static const struct software_node crag6410_led##_idx##_node = {	\
+	.parent = &crag6410_leds_node,					\
+	.properties = crag6410_led##_idx##_props,			\
+}
 
-static const struct gpio_led_platform_data gpio_leds_pdata = {
-	.leds = gpio_leds,
-	.num_leds = ARRAY_SIZE(gpio_leds),
+CRAG6410_LED_NODE(0, "d13:green:");
+CRAG6410_LED_NODE(1, "d14:green:");
+CRAG6410_LED_NODE(2, "d15:green:");
+CRAG6410_LED_NODE(3, "d16:green:");
+CRAG6410_LED_NODE(4, "d17:green:");
+CRAG6410_LED_NODE(5, "d18:green:");
+CRAG6410_LED_NODE(6, "d19:green:");
+CRAG6410_LED_NODE(7, "d20:green:");
+
+static const struct software_node *crag6410_leds_swnodes[] = {
+	&crag6410_leds_node,
+	&crag6410_led0_node,
+	&crag6410_led1_node,
+	&crag6410_led2_node,
+	&crag6410_led3_node,
+	&crag6410_led4_node,
+	&crag6410_led5_node,
+	&crag6410_led6_node,
+	&crag6410_led7_node,
+	NULL
 };
 
+static void __init crag6410_setup_leds(void)
+{
+	struct platform_device_info leds_info = {
+		.name	= "leds-gpio",
+		.id	= PLATFORM_DEVID_NONE,
+	};
+	struct platform_device *pd;
+	int err;
+
+	err = software_node_register_node_group(crag6410_leds_swnodes);
+	if (err) {
+		pr_err("failed to register leds software nodes: %d\n", err);
+		return;
+	}
+
+	leds_info.fwnode = software_node_fwnode(&crag6410_leds_node);
+
+	pd = platform_device_register_full(&leds_info);
+	err = PTR_ERR_OR_ZERO(pd);
+	if (err)
+		pr_err("failed to create leds-gpio device: %d\n", err);
+}
+
 static struct dwc2_hsotg_plat crag6410_hsotg_pdata;
 
 static const struct software_node_ref_args crag6410_spi0_gpio_refs[] = {
@@ -972,13 +984,12 @@ static void __init crag6410_machine_init(void)
 	platform_add_devices(crag6410_devs0, ARRAY_SIZE(crag6410_devs0));
 	platform_device_register_full(&crag6410_mmgpio_devinfo);
 
-	gpiod_add_lookup_table(&crag_leds_table);
 	crag6410_setup_keypad();
 	crag6410_setup_gpio_keys();
 	crag6410_setup_spi0();
 
 	platform_add_devices(crag6410_devs1, ARRAY_SIZE(crag6410_devs1));
-	gpio_led_register_device(-1, &gpio_leds_pdata);
+	crag6410_setup_leds();
 
 	regulator_has_full_constraints();
 

-- 
2.55.0.795.g602f6c329a-goog


