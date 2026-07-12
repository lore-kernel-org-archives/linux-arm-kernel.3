Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD7C6C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 02:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D66XWjgtUCsx9ojkNcJlPyxMEJV2A88EMZ1xU4Y6xY8=; b=UF61+SrVKOSg31yy60GERyo10Y
	NIEV6QM10Xs4oWqbTjofp07U6DYDOFM9z/GuecnjIIx3miJwbCOToCH6FUFtcV5orEmfLbEmWuRI8
	ya68KoYVOfZXVabWegR64GqHE8Eg6FUeKfXE3DAlHniS3JFbgPp86LlK86wxb2nMGBeKavQxPWM4i
	emACF6o4xcKF6PzsKH6+G4rMLF8Kg9r4kJeYZksxFvBwhdyJ4JRlUC4d3hudJp5bdWSeWcBH3Ay3x
	g/mXWwcrlmXb/7/TCRQSSwJij0B4Ta0k4pEu/45PIpbmjnXku+J8tw5XhWGsp91n/1vTbbrkXxYFT
	1jupwj4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wijhD-000000070N2-1Fyy;
	Sun, 12 Jul 2026 02:13:31 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wijh0-0000000709b-02T6
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jul 2026 02:13:19 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-381c51fde6bso2046134a91.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Jul 2026 19:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783822397; x=1784427197; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D66XWjgtUCsx9ojkNcJlPyxMEJV2A88EMZ1xU4Y6xY8=;
        b=jqZ0YAW0b7adZkTyXQu4jIi/GetZgDZP/DqRB9+JXENZgb2EpSa2yEtXef9fBQVLii
         amMDjRhHepRgBFCDI6ggDhYAF8yftZry1Clze4y/ZIYXMymUNs1AVjqnVM0xZ38cxEHN
         W9d3RxCwHDJd/NQqtdZH7ZCEW9kNf694YtuhZCycX/UwocxvqpzHR9GCNtSKXIyunLBv
         78t/0yj51nC4Uhb5xlMqQnU4jVF2NKDRi2yeBP3cdQ0anviu6XQF727ZVRTH8qw1TqV+
         KxWwITAbfEaFAFbs8rclo+KpgNuXwu6JkI21BCLbV+ZRwL/3y7lfPggKjbW2iyHvHdo7
         4k1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783822397; x=1784427197;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D66XWjgtUCsx9ojkNcJlPyxMEJV2A88EMZ1xU4Y6xY8=;
        b=H26fg2yY+X7Ys5+cwSXon8lpfPgD7FYfJwzUqMaL1nWdkTNLzmLdcKSo/+OA+H+XsW
         1fMkeGZGjD4iFBQL47HPazoJoGw3hfMtNlSe3Z/tpMhkWACzuvZHeKpa8Udni2ncAa00
         hWlRbssKYmqaKGYgzTrwuX20ZQSouyNmDFleBrqz5XPZhdFFM0miYA3wgS5c95BAX+Ol
         LL5ramOiykoP42rWxNafvyW2HeH63WR7WZVQXHKWRu7M74XOgJVV0RvBvhJ1JLfTJm5j
         1NehtlewkMV9BHgc7zd/8xD/HOUk/el7hOSvuYn7lYZd5RscOpXFxN9YHZtS502ZceGF
         aEuA==
X-Forwarded-Encrypted: i=1; AHgh+RojVnDBCJfQUkQOdXImSHg+KemVN6YDkBr6+p2jmr5R5cPrXZUNeT0nx4KU4lphj53WoLPZC+EPPgYCpq5V5H/+@lists.infradead.org
X-Gm-Message-State: AOJu0YymH6ATTOIewPtGv7rCayWLazj9aF57uhEVnkVwHr+F4pngrvNx
	EiWAV4kdtvij7Awfr2dIJVv8xBh8SlyhnqK1sS7Sr86iV1MBbUlYCGwa
X-Gm-Gg: AfdE7cnq9BkINzP5cc6zRd0rZeWW0thscjZVkyHdKNMfYYjleNqJ8h4pwFlWNxd2BoW
	BnqNLWByAVxxkTPfxu2qdahrKdZU+6H4eP4KLjqwFXRbN7L1abTWiy26wW2X8j54uwaUII7dler
	517VMjpEdeMcfSHoTdPy86IQmFIorA2gXgrG4kkXNJGvpnXLrG7D632SHwuxY4I+rbWPnVMGEsc
	RXiZqGGoIOtwlkfTgOJElydoEDDLIJTd+hk6HP+avHpKY2pqBTwjyQziOFyA974hECme4iwbHWC
	Q1v/tqnlcDeTvVBKeHSHvwXl2GN4zD/Iwsd20Qs+sL+Ys32E0IY3HlPPVOFgpNIxf1a4kZdEGVl
	4usTTUt6tknidUBOArXq9mkeU08VE3YZCOYBfxBQLC4n47bZyCZFpQR4ttyYvOkZDLYUCsUEM/F
	mf3JYE2PWhLL1mt1T9C/xkwVtpQkaeuc9/Ih2IJQ1jkzGxSx8fu/FEqznvtnsxRh/TJ+nVaH0wN
	6k=
X-Received: by 2002:a17:90b:5686:b0:37f:9ce1:cdb3 with SMTP id 98e67ed59e1d1-38dc77993ecmr4169672a91.33.1783822397411;
        Sat, 11 Jul 2026 19:13:17 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:c63e:9756:a95c:c75])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3117d847e17sm54796692eec.18.2026.07.11.19.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 19:13:16 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sat, 11 Jul 2026 19:12:50 -0700
Subject: [PATCH v3 09/10] ARM: s3c: crag6410: convert basic-mmio-gpio and
 LEDs to software properties
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260711-samsung-kp-v3-9-b2fcaba77aff@gmail.com>
References: <20260711-samsung-kp-v3-0-b2fcaba77aff@gmail.com>
In-Reply-To: <20260711-samsung-kp-v3-0-b2fcaba77aff@gmail.com>
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
 patches@opensource.cirrus.com, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-b242f
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260711_191318_059419_BD90689C 
X-CRM114-Status: GOOD (  17.48  )
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
Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 arch/arm/mach-s3c/mach-crag6410.c | 117 +++++++++++++++++++++-----------------
 1 file changed, 64 insertions(+), 53 deletions(-)

diff --git a/arch/arm/mach-s3c/mach-crag6410.c b/arch/arm/mach-s3c/mach-crag6410.c
index 1abf08fdb543..1ba3d47d85b7 100644
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
@@ -835,61 +840,68 @@ static struct s3c_sdhci_platdata crag6410_hsmmc0_pdata = {
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
 
 static struct gpiod_lookup_table crag_spi0_gpiod_table = {
@@ -939,12 +951,11 @@ static void __init crag6410_machine_init(void)
 	platform_add_devices(crag6410_devs0, ARRAY_SIZE(crag6410_devs0));
 	platform_device_register_full(&crag6410_mmgpio_devinfo);
 
-	gpiod_add_lookup_table(&crag_leds_table);
 	crag6410_setup_keypad();
 	crag6410_setup_gpio_keys();
 
 	platform_add_devices(crag6410_devs1, ARRAY_SIZE(crag6410_devs1));
-	gpio_led_register_device(-1, &gpio_leds_pdata);
+	crag6410_setup_leds();
 
 	regulator_has_full_constraints();
 

-- 
2.55.0.795.g602f6c329a-goog


