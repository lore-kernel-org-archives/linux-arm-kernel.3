Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A297FC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 01:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3XIihc9T3PyY4VeI7uEgq9tHkMpV9x/Ffk0YNCQe1V8=; b=xAzrk9A3OQB8vuoN/oOspCNR7L
	esdqZfnMaAR1fZWaa2f4xJvfhGhwDQDAvqIokJd4ykQbOru6EF4o8KuNvRTrsOoipr5sSF6ZRUsgn
	5oRBphhSYnYuBlcl0FjfJOli2Q01he1HA6fF8MeD+Gta4Dl/w6QuPLViyuSGInpo3/VRGDak3lkI9
	f1LujY4CbRyDauypbeBJ817BI+tyx8i4B7l4XlJUZL1RR5iN/hOp7F/CviUTWJCA1oG1zUnQxk9c4
	02vfpWGllML9TfF7KAqZXdQ1fDvLy/S5LwJ6aN++qJoubX2y0bcjovytnJ5YyTZkDZfIkEQPvdmBX
	OHiuUvXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgY9T-0000000BC8y-0aBO;
	Mon, 06 Jul 2026 01:29:39 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgY9P-0000000BC4p-3MMv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 01:29:37 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2c7c61b5292so35847215ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jul 2026 18:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783301375; x=1783906175; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3XIihc9T3PyY4VeI7uEgq9tHkMpV9x/Ffk0YNCQe1V8=;
        b=itlYMC7Thh6azgp9Vc4WRBOOHxQKZPWXjoBlhESvKkprWXqmi35XmQXAeygi+MycKO
         rzAV9Dad7v8sZtj/KDwdrHRt0qeOMMQsAHr6aU4ztbQH3AU5Y5AOMPMzc+d1M2Dngs4q
         3VKQJz7DvJHMbHEL8Bg5S+wvYSCNFxS2DgfzZfjMhMEnxsvieSI5+qEVz+wSbTFuNjed
         cQfb6zi/qiZOD9xUjFN78yysjc6MfsiyOVZIvrw28DtEdJ9pGmDMitR6dbgMfVWMn2EW
         7kzL5/OABCCaF66zGhXuqFF/5icYHd+DvJtFYLBokF4tgtID7b+2dg39UkvZhJkThqOi
         ys+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783301375; x=1783906175;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3XIihc9T3PyY4VeI7uEgq9tHkMpV9x/Ffk0YNCQe1V8=;
        b=mkWCdLpnSzlTwvm8aZi85Fr6XN3jJ+rhKfh9YpebcYkV3uXDE+rL0FruQCQqgDGcOa
         aGu3dLvCcaK0bqeUSprVJQyDZBEFv8ZpclNcWk4EM116Rp+m9drmMOitjmWj6ZxAj+67
         izHG2PH/ymLIoP1el02eb2jTmrL3UtjfjCOXtKoHc5zsamY8Z9hcFY6/RR5Dr29uWbET
         C/d2NOjn0849Eua5tIPw2vzTrDLVvPhB0Y0FN2hKpp6nj5je3Nd7nR81W7Xu8d6+pG9f
         4bYOjUIfx5B81zkRRSS25wcfILJwqUkDcoIZq6azgpXl1YC+KxH76TyWzEhUMKUnxaFa
         WpLA==
X-Forwarded-Encrypted: i=1; AHgh+RrVKf0rKQp/I491AYBakwQn0kT77g0QzsOV7LuueALYXOo3EOTYHsbCcq/dIgbFAe3nQgDrihDx+T7EfbEcQIJu@lists.infradead.org
X-Gm-Message-State: AOJu0YxT5z+ZpzLN0Wlc2zZQbTbBIo999nWO5PpKAa8FQLBwlAPr7x/f
	JLUAszNSkpE4NhMAcPACrj6MXy78qO7D4TIis/3Od8HAD90JELvV1KSD
X-Gm-Gg: AfdE7cnb01ievrFEQ6w0H3GmEibMBVq85xQ+3rUuH2hQrzuuycgfPdDQJTljh+2vYLA
	wxniE2W8M5IcYOS3Nc7GNF32Q6Ge/iJuuBOwWKmwtmF3OT/9tV/gwIpQ4T/BQeFb8/CYwVlYjEZ
	6qNyza4GyyIo5yutgpU/FKO0ciTmiQNugVZz/+DiXgpg/VPud82NFU9edsopD1qQSPdumpfPeuN
	7ErP/FUt53/UlXQgfiKdhIp1M1SsjjbW5WuLlYPhPrP4buo73ksEVsnF1RMUXRNR0XlF5VlDBN+
	vdmCC3YDY9eoNO++cl2V4/eMifImFpY2jYnlDlkPQ9W65D+jaqPvYgQfOtFB1IP7XXkaOF7cyuq
	NZaXU6O7RtlYS7RAZ1/6eCrdHciTWbDw895iDtap93sXs4hcBt2V+TpCwrYKt/J4HlM9/ERMfyF
	8pBQOXV9fRL6Y5AfQLgyvYZH942YdED0T0uNCBaxh/Y/AnJcl0TSB45Xm+uDVxM8ggOE0VhGW8m
	Aw=
X-Received: by 2002:a17:902:d585:b0:2ca:d31e:ac50 with SMTP id d9443c01a7336-2cbb750dffamr84727705ad.17.1783301374848;
        Sun, 05 Jul 2026 18:29:34 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:bf6:81d1:bcfe:9d1c])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7ef5b3sm63084524c88.1.2026.07.05.18.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 18:29:34 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sun, 05 Jul 2026 18:29:23 -0700
Subject: [PATCH 6/7] ARM: orion5x: ts209: convert gpio-keys to use software
 nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-orion-mv78xx0-swnode-v1-6-07d95ef4f447@gmail.com>
References: <20260705-orion-mv78xx0-swnode-v1-0-07d95ef4f447@gmail.com>
In-Reply-To: <20260705-orion-mv78xx0-swnode-v1-0-07d95ef4f447@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Gregory Clement <gregory.clement@bootlin.com>
Cc: Russell King <linux@armlinux.org.uk>, 
 Bartosz Golaszewski <brgl@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev-b242f
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_182935_905342_C1049213 
X-CRM114-Status: GOOD (  16.18  )
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

Convert the QNAP TS-209 board setup from legacy gpio_keys_platform_data
to software nodes. The gpio-keys platform device is registered with
static software node properties and button configurations.

Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 arch/arm/mach-orion5x/ts209-setup.c | 70 ++++++++++++++++++++++++-------------
 1 file changed, 46 insertions(+), 24 deletions(-)

diff --git a/arch/arm/mach-orion5x/ts209-setup.c b/arch/arm/mach-orion5x/ts209-setup.c
index de9092e992c5..321bfad8bce6 100644
--- a/arch/arm/mach-orion5x/ts209-setup.c
+++ b/arch/arm/mach-orion5x/ts209-setup.c
@@ -13,11 +13,14 @@
 #include <linux/mtd/physmap.h>
 #include <linux/mtd/rawnand.h>
 #include <linux/mv643xx_eth.h>
-#include <linux/gpio_keys.h>
+#include <linux/gpio/machine.h>
+#include <linux/gpio/property.h>
+#include <linux/property.h>
 #include <linux/input.h>
 #include <linux/i2c.h>
 #include <linux/serial_reg.h>
 #include <linux/ata_platform.h>
+#include <plat/orion-gpio.h>
 #include <asm/mach-types.h>
 #include <asm/mach/arch.h>
 #include <asm/mach/pci.h>
@@ -200,32 +203,47 @@ static struct i2c_board_info __initdata qnap_ts209_i2c_rtc = {
 #define QNAP_TS209_GPIO_KEY_MEDIA	1
 #define QNAP_TS209_GPIO_KEY_RESET	2
 
-static struct gpio_keys_button qnap_ts209_buttons[] = {
-	{
-		.code		= KEY_COPY,
-		.gpio		= QNAP_TS209_GPIO_KEY_MEDIA,
-		.desc		= "USB Copy Button",
-		.active_low	= 1,
-	}, {
-		.code		= KEY_RESTART,
-		.gpio		= QNAP_TS209_GPIO_KEY_RESET,
-		.desc		= "Reset Button",
-		.active_low	= 1,
-	},
+static const struct software_node qnap_ts209_gpio_keys_node = {
+	.name = "qnap-ts209-gpio-keys",
 };
 
-static struct gpio_keys_platform_data qnap_ts209_button_data = {
-	.buttons	= qnap_ts209_buttons,
-	.nbuttons	= ARRAY_SIZE(qnap_ts209_buttons),
+static const struct property_entry qnap_ts209_copy_key_props[] = {
+	PROPERTY_ENTRY_U32("linux,code", KEY_COPY),
+	PROPERTY_ENTRY_GPIO("gpios", &orion_gpio_swnodes[0],
+			    QNAP_TS209_GPIO_KEY_MEDIA, GPIO_ACTIVE_LOW),
+	PROPERTY_ENTRY_STRING("label", "USB Copy Button"),
+	{ }
 };
 
-static struct platform_device qnap_ts209_button_device = {
-	.name		= "gpio-keys",
-	.id		= -1,
-	.num_resources	= 0,
-	.dev		= {
-		.platform_data	= &qnap_ts209_button_data,
-	},
+static const struct software_node qnap_ts209_copy_key_node = {
+	.parent = &qnap_ts209_gpio_keys_node,
+	.properties = qnap_ts209_copy_key_props,
+};
+
+static const struct property_entry qnap_ts209_reset_key_props[] = {
+	PROPERTY_ENTRY_U32("linux,code", KEY_RESTART),
+	PROPERTY_ENTRY_GPIO("gpios", &orion_gpio_swnodes[0],
+			    QNAP_TS209_GPIO_KEY_RESET, GPIO_ACTIVE_LOW),
+	PROPERTY_ENTRY_STRING("label", "Reset Button"),
+	{ }
+};
+
+static const struct software_node qnap_ts209_reset_key_node = {
+	.parent = &qnap_ts209_gpio_keys_node,
+	.properties = qnap_ts209_reset_key_props,
+};
+
+static const struct software_node * const qnap_ts209_gpio_keys_swnodes[] __initconst = {
+	&qnap_ts209_gpio_keys_node,
+	&qnap_ts209_copy_key_node,
+	&qnap_ts209_reset_key_node,
+	NULL
+};
+
+static const struct platform_device_info qnap_ts209_button_info __initconst = {
+	.name	= "gpio-keys",
+	.id	= PLATFORM_DEVID_NONE,
+	.swnode	= &qnap_ts209_gpio_keys_node,
 };
 
 /*****************************************************************************
@@ -265,6 +283,8 @@ static unsigned int ts209_mpp_modes[] __initdata = {
 
 static void __init qnap_ts209_init(void)
 {
+	int err;
+
 	/*
 	 * Setup basic Orion functions. Need to be called early.
 	 */
@@ -300,7 +320,9 @@ static void __init qnap_ts209_init(void)
 	orion5x_uart1_init();
 	orion5x_xor_init();
 
-	platform_device_register(&qnap_ts209_button_device);
+	err = software_node_register_node_group(qnap_ts209_gpio_keys_swnodes);
+	if (!err)
+		platform_device_register_full(&qnap_ts209_button_info);
 
 	/* Get RTC IRQ and register the chip */
 	if (gpio_request(TS209_RTC_GPIO, "rtc") == 0) {

-- 
2.55.0.rc0.799.gd6f94ed593-goog


