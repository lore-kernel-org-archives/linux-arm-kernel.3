Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01A91C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 01:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qDv70T7UNNrrX/9FSdKEicGqVoiRZiNKUAnvMM2D1jk=; b=0+CPobA55Ce38xKX6K4Z+pGUAH
	9mYg7V847XdDszUQTk27K5xDU804kr5SGa6aA35qSyvCqakwI4WVKaKc+BkrNUCK8WGj5kpF9FL5E
	eCqaMqH+mDOJBJYVi6gccAVpISE5NkMrpZ6xd9MF18pmhKO72hqlg8lXdZkwuyQXetBgnu275UZel
	jFSYfTSNuSsstnIMsdujMcQcXLlaBojfzD+eJTiqJicsKuwIkT8qHP3wh0rN6QWyo8TdeIMcg/+CI
	RQRXBP9EJGSpt5/2gVo5p+RxFYpdbrcOd0LLeYjnbCpWZy0TpF4zpIJ1hNNjqW5VKESDxGoPw+adG
	nHXfoIUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgY9O-0000000BC4J-2aw1;
	Mon, 06 Jul 2026 01:29:34 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgY9L-0000000BC0m-3Yb9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 01:29:32 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2caf4496889so10970485ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jul 2026 18:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783301371; x=1783906171; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qDv70T7UNNrrX/9FSdKEicGqVoiRZiNKUAnvMM2D1jk=;
        b=EEsm394VROJdWX8zMJi7VumseOgCgFB3/10PtelGnoJYIwkw61axKSKzjlUrtq+nnj
         w2XFcoiEdEYzkfIbiDBEWLKPmxczP2Ng3jQyvT/HjS+jaRYAd70FJb2RkbNU+9gZsIvv
         A3ddLhiHfGdWKs35jPFRx/qEvzBm1+pmRKOf8pBFU9DnkDajAjY7cRmcHlBUia72iwpr
         fUgh27Q97wkA86415KpSk79X1PSsJ85Nlb5ynfROvuARw5IAStPysrdazyhJSnhB9Lqn
         ZDqTxkAYWmZoJWwftVwKkZAvveSfsVcaIaLVBuK96w8l0DbzQaSmExlqiPpnkOtww+3J
         lW2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783301371; x=1783906171;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qDv70T7UNNrrX/9FSdKEicGqVoiRZiNKUAnvMM2D1jk=;
        b=s20vDgyGxuk/0znVXB4ATUksZdqoxhNEqbqnKYVqsYlXwETdNyPGfSqZMqjPAKllEM
         uwdOI3+F35DOZyhsMDAw46qMmw5EKzIOxQXhdwsdJ+qtmUEP7xhbldUNbPJ9rlOQ5gEr
         lTN+GJmE05mvm6cQYFbZXs0rzz7YgrzlnvIjkugHWjY0Zy4Ul3m/MjSQsjLPWNuZC3d2
         SetNYSYip2hZesp/rxDZcDBDH60jRVp7SO4A96vE6ryFBoaWi1LNbeIseQcMahv1aSoB
         K2ehU+xzS/faBZHTp1ZmtuLXw9N90HRlUvnkbdosEej4+WAsDboKi5OWoUDWA4cUvDMX
         UWow==
X-Forwarded-Encrypted: i=1; AHgh+Rr5jXvG5Bz2FtLt9wR1KuzOEPb1c1jFUByCiYOLVdzQOMTv3TTs521PFhS29HAqsMX00PCPXWQ+P1THCytcWHSw@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/n17Mr1iBbNZirDk7Truui+xo/moUEU+yuDbATBGpusp+p4kb
	M8Gyer11InKO7+SHo9SGxPy+15/2/llI+9w0jL04nkJSOhobEiPHTtpw1jMEjA==
X-Gm-Gg: AfdE7cmTt42zOSQ3Y5vowk9d4vSNkqxxoSIPuodhRyPem/m228LWS10g7w5STx5AIJL
	AOfOOMIJ5BHpzqoy6X8bWlSFyk4PPGJp8xtFmi9lAAkCysdaGSpKpR11B1epZ/Z9yUPmRqVDMVO
	D6+q+pUZNzduNyO4yA0ptdGyiAPYGVB67nWd43qKSBJnMfpvUj3ygcxDkh710U+fYNL0JSmLbuW
	VFKROeNdpFC2/c4m9HWi30R7N92c0g9rZxrIKKR9BWvfYrzApEG+AClW2T4gbtBZ4eP5vvsUw1k
	cmXLsxa41JyEpDi7hrHXmd43Dz4ys2JmKEROkbI1g1yRXTYkhAsZ+8bjtFwTSx2NtU62DcFvowZ
	ZxrN0SyFOv3lvgYZJUT0K9XRI/hP0/KCuf+fDDX43vYaphChdfNwg2WRiZfVtF3Pv2KP0k+cIlB
	GzcEZlAa5unSg05HVSXvBxAmeXCY77KKFmmoZjfoiJCh2aVniXRwZ0D00DUgSWXKyR6aCt21Ymx
	E4=
X-Received: by 2002:a17:902:ec86:b0:2c9:fc0d:165b with SMTP id d9443c01a7336-2cacb195c92mr128123715ad.23.1783301370980;
        Sun, 05 Jul 2026 18:29:30 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:bf6:81d1:bcfe:9d1c])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7ef5b3sm63084524c88.1.2026.07.05.18.29.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 18:29:30 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sun, 05 Jul 2026 18:29:20 -0700
Subject: [PATCH 3/7] ARM: orion5x: dns323: convert gpio-keys to use
 software nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-orion-mv78xx0-swnode-v1-3-07d95ef4f447@gmail.com>
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
X-CRM114-CacheID: sfid-20260705_182931_921325_052A3634 
X-CRM114-Status: GOOD (  16.72  )
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

Convert the DNS-323 board setup from legacy gpio_keys_platform_data to
software nodes. The gpio-keys platform device is registered with static
software node properties and button configurations.

Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 arch/arm/mach-orion5x/dns323-setup.c | 98 +++++++++++++++++++++++-------------
 1 file changed, 63 insertions(+), 35 deletions(-)

diff --git a/arch/arm/mach-orion5x/dns323-setup.c b/arch/arm/mach-orion5x/dns323-setup.c
index fcd38ff7ca45..6dc7d2c0b64f 100644
--- a/arch/arm/mach-orion5x/dns323-setup.c
+++ b/arch/arm/mach-orion5x/dns323-setup.c
@@ -15,6 +15,8 @@
  */
 #include <linux/gpio.h>
 #include <linux/gpio/machine.h>
+#include <linux/gpio/property.h>
+#include <linux/property.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
 #include <linux/delay.h>
@@ -24,12 +26,12 @@
 #include <linux/mtd/physmap.h>
 #include <linux/mv643xx_eth.h>
 #include <linux/leds.h>
-#include <linux/gpio_keys.h>
 #include <linux/input.h>
 #include <linux/i2c.h>
 #include <linux/ata_platform.h>
 #include <linux/phy.h>
 #include <linux/marvell_phy.h>
+#include <plat/orion-gpio.h>
 #include <asm/mach-types.h>
 #include <asm/mach/arch.h>
 #include <asm/mach/pci.h>
@@ -338,46 +340,66 @@ static struct platform_device dns323_gpio_leds = {
  * GPIO Attached Keys
  */
 
-static struct gpio_keys_button dns323ab_buttons[] = {
-	{
-		.code		= KEY_RESTART,
-		.gpio		= DNS323_GPIO_KEY_RESET,
-		.desc		= "Reset Button",
-		.active_low	= 1,
-	}, {
-		.code		= KEY_POWER,
-		.gpio		= DNS323_GPIO_KEY_POWER,
-		.desc		= "Power Button",
-		.active_low	= 1,
-	},
+static const struct software_node dns323_gpio_keys_node = {
+	.name = "dns323-gpio-keys",
 };
 
-static struct gpio_keys_platform_data dns323ab_button_data = {
-	.buttons	= dns323ab_buttons,
-	.nbuttons	= ARRAY_SIZE(dns323ab_buttons),
+static const struct property_entry dns323ab_reset_key_props[] = {
+	PROPERTY_ENTRY_U32("linux,code", KEY_RESTART),
+	PROPERTY_ENTRY_GPIO("gpios", &orion_gpio_swnodes[0],
+			    DNS323_GPIO_KEY_RESET, GPIO_ACTIVE_LOW),
+	PROPERTY_ENTRY_STRING("label", "Reset Button"),
+	{ }
 };
 
-static struct gpio_keys_button dns323c_buttons[] = {
-	{
-		.code		= KEY_POWER,
-		.gpio		= DNS323C_GPIO_KEY_POWER,
-		.desc		= "Power Button",
-		.active_low	= 1,
-	},
+static const struct software_node dns323ab_reset_key_node = {
+	.parent = &dns323_gpio_keys_node,
+	.properties = dns323ab_reset_key_props,
 };
 
-static struct gpio_keys_platform_data dns323c_button_data = {
-	.buttons	= dns323c_buttons,
-	.nbuttons	= ARRAY_SIZE(dns323c_buttons),
+static const struct property_entry dns323ab_power_key_props[] = {
+	PROPERTY_ENTRY_U32("linux,code", KEY_POWER),
+	PROPERTY_ENTRY_GPIO("gpios", &orion_gpio_swnodes[0],
+			    DNS323_GPIO_KEY_POWER, GPIO_ACTIVE_LOW),
+	PROPERTY_ENTRY_STRING("label", "Power Button"),
+	{ }
 };
 
-static struct platform_device dns323_button_device = {
-	.name		= "gpio-keys",
-	.id		= -1,
-	.num_resources	= 0,
-	.dev		= {
-		.platform_data	= &dns323ab_button_data,
-	},
+static const struct software_node dns323ab_power_key_node = {
+	.parent = &dns323_gpio_keys_node,
+	.properties = dns323ab_power_key_props,
+};
+
+static const struct software_node * const dns323ab_gpio_keys_swnodes[] __initconst = {
+	&dns323_gpio_keys_node,
+	&dns323ab_reset_key_node,
+	&dns323ab_power_key_node,
+	NULL
+};
+
+static const struct property_entry dns323c_power_key_props[] = {
+	PROPERTY_ENTRY_U32("linux,code", KEY_POWER),
+	PROPERTY_ENTRY_GPIO("gpios", &orion_gpio_swnodes[0],
+			    DNS323C_GPIO_KEY_POWER, GPIO_ACTIVE_LOW),
+	PROPERTY_ENTRY_STRING("label", "Power Button"),
+	{ }
+};
+
+static const struct software_node dns323c_power_key_node = {
+	.parent = &dns323_gpio_keys_node,
+	.properties = dns323c_power_key_props,
+};
+
+static const struct software_node * const dns323c_gpio_keys_swnodes[] __initconst = {
+	&dns323_gpio_keys_node,
+	&dns323c_power_key_node,
+	NULL
+};
+
+static const struct platform_device_info dns323_button_info __initconst = {
+	.name	= "gpio-keys",
+	.id	= PLATFORM_DEVID_NONE,
+	.swnode	= &dns323_gpio_keys_node,
 };
 
 /*****************************************************************************
@@ -611,6 +633,9 @@ static int __init dns323_identify_rev(void)
 
 static void __init dns323_init(void)
 {
+	const struct software_node * const *keys_swnodes = dns323ab_gpio_keys_swnodes;
+	int err;
+
 	/* Setup basic Orion functions. Need to be called early. */
 	orion5x_init();
 
@@ -665,7 +690,7 @@ static void __init dns323_init(void)
 		/* Hookup LEDs & Buttons */
 		gpiod_add_lookup_table(&dns323c_leds_gpio_table);
 		dns323_gpio_leds.dev.platform_data = &dns323c_led_data;
-		dns323_button_device.dev.platform_data = &dns323c_button_data;
+		keys_swnodes = dns323c_gpio_keys_swnodes;
 
 		/* Hookup i2c devices and fan driver */
 		i2c_register_board_info(0, dns323c_i2c_devices,
@@ -681,7 +706,10 @@ static void __init dns323_init(void)
 	}
 
 	platform_device_register(&dns323_gpio_leds);
-	platform_device_register(&dns323_button_device);
+
+	err = software_node_register_node_group(keys_swnodes);
+	if (!err)
+		platform_device_register_full(&dns323_button_info);
 
 	/*
 	 * Configure peripherals.

-- 
2.55.0.rc0.799.gd6f94ed593-goog


