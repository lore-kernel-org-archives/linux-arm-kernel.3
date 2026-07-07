Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15314C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 03:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lQ2OUfXyXPiXVwMUZqWdZ7fztGiD1A5bWtr7SaHjq24=; b=pQXyas8gDIJ7f8ilFGkMFePqqS
	GQoeSTo4GgXF3KOJwYHPxIz/3ozsA8vtRsWuSuEVlt+37K4/2F8oRw3GhvrJm7sj7QraXU+tY2nVY
	PdLNfgx5jniw5YZIEIBA/BVAUALgLflWLXzttqiP18rk/fuXU49PmaF97VweV5l1A73Vy2MVIl7L1
	TdwcZvKRuu6UkMMsq/QJ+qQiD4iorux0zfwH/IOQ3tU1pNY7oK+BkbrNoKZ0TPrMhPcRr+2Ap9pQH
	mRNs7fonlp0/U6Q1U+3gW5P9ixLFcPzME3cKdI/mXejSB7kYWE+mygIOy4Sklpdt9yWcT2ff4tK1q
	cJly/8Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgwGH-0000000DzCH-0RK9;
	Tue, 07 Jul 2026 03:14:17 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgwGB-0000000Dz8H-00Sv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 03:14:12 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2cc7e86e7aeso22055015ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 20:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783394050; x=1783998850; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lQ2OUfXyXPiXVwMUZqWdZ7fztGiD1A5bWtr7SaHjq24=;
        b=BoS1G1d8Ftjl4Dibn78/8bqzBw0z9yTjnm9JHMX08DdkdUSNVcn8McfVToSRfzsJsX
         UL6LAw0NGCF2+Z59QP391VUaEWvMMQPJbJ/w5kLIthc83oOJYertIrfrGD4LSkhyhghs
         7vJWQPBNG4+/ZQjMZ5uMRKCVE+a+oN2/qCh5Fe1uwWxoyPN7xdBszsDFIRHwJh5nKbAn
         Xdk8n72FiIh5+hI/CC4VR2sUgSLqG+5XSz4wSoTCNvla2fk4EKJdftVnTlXeUGo9dyOR
         9ZwWZmPPXWzm8zqJhal2wMmM/v/Ak14ZknMw13M0xQVHiITCrEu7KaIUzcZZ+DCYbt4E
         S8SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783394050; x=1783998850;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lQ2OUfXyXPiXVwMUZqWdZ7fztGiD1A5bWtr7SaHjq24=;
        b=pD7yl/4n7SQ++WaD32Wesja+CjxM7ENulh3qy6ouw42Y5AsPCs1WUNn2UjFRwpuBf5
         OdLi3Tco26m/MsUom5NZYM/+Kma+hf5iAwCYKaMHWfN1LWVlLHA0PiWLwSvV9Q3gmBs3
         8N6qZhWYoMPacTeHT82Vf4TNDTe+M9D7em0m7z78UjBSCZY1uXYqTp+Pz5dhDFnqwFUq
         H3cTfxqyC6Cj/03PMNibWlndMMNyaxpUUOJl5xEb5yrDAxT+imwzksgkgRjxzSLlvIZS
         SUaYCp7RekY0pttrve7wG1sswvgW7CmNmj3kzO7/CdsbYRx+KX6ttmkuf1hRoTLPZwnO
         zE3A==
X-Gm-Message-State: AOJu0YwFj4MvqGnZ+BL5J7DY9jor8JWcoZViu8vlsN838Y9j6pSG5YeB
	cb0RkNjeOV8sk1Jv21+CR2+tsSZenDJycy9wWQ2bEqhNA+G2H9S+DY1ZS/VE7g==
X-Gm-Gg: AfdE7ckb5Wwhkg/h8N7i9R6Ye9kBV3URvF79Ia4ZWtT6gDNFUJyZUMwiq4ylWIV7qyk
	eH9sF7BplBT9TktGre9Dz5xwQT/Tq44yUlt+IawYo7cLWptD2G/qqShqWuAPKJAJ+xdTiwGQn1d
	cLXwmy6e4tkMTPpHmh2kteQndw5Q6YKdFqJS0f59zrjFemtwt4eDKhmhG7AxTTvlPM3JFdPZqqD
	GnRCTdHPJm62QbJAcq9xvt1EJ6R7843d8OfQ0NOgaQidYSkEGmkViZ1ndgmToHed+QgiqfQlMRc
	p6DpW1y6k+urOrdFVJCkGl7RvDnt4rDUPjGAGvQM8YGtxGSc+Q7mV4c/SwSRfBjKpeHq7SIj+NK
	HRG/sRDcWseNfyoNJf6atYs0xKElXsizGeeib1Xfo+EZ6OQh8KkDYQM/bE6xAtRVnhdvgXMp8yz
	m13Pezfzk6hK3LHVmsjcNMvCY9Y07WmwqNL2j9GOWPO38y4Mj7rxR2dGmPCMV+AGZ1jfm58VtWx
	0mlMCAhB6u79s8=
X-Received: by 2002:a05:6a20:5499:b0:3bf:9e25:1a18 with SMTP id adf61e73a8af0-3c08ef55ba0mr4090827637.52.1783394049834;
        Mon, 06 Jul 2026 20:14:09 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:d89b:1fdd:a8f2:dbeb])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659666e7sm3339905c88.7.2026.07.06.20.14.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 20:14:09 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Mon, 06 Jul 2026 20:14:02 -0700
Subject: [PATCH 3/4] ARM: sa1100: collie: convert gpio-keys to use software
 nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-sa1100-swnode-v1-3-332759bbd930@gmail.com>
References: <20260706-sa1100-swnode-v1-0-332759bbd930@gmail.com>
In-Reply-To: <20260706-sa1100-swnode-v1-0-332759bbd930@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>, Russell King <linux@armlinux.org.uk>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 soc@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org
X-Mailer: b4 0.16-dev-b242f
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_201411_055665_C6CD4C9B 
X-CRM114-Status: GOOD (  17.88  )
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

Convert the legacy gpio-keys platform device on the StrongARM SA-1100
Collie (Sharp Zaurus SL-5500) board to use software nodes and device
properties. This helps progress the removal of platform data support
from the gpio-keys driver.

Define static software nodes for the gpio-keys device and the power and
sync button child nodes at file scope, referencing the SA-1100 GPIO
controller node directly and specifying EV_PWR input type. In
collie_init(), register the software node group and use
platform_device_register_full() to register the gpio-keys device.

Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 arch/arm/mach-sa1100/collie.c | 74 +++++++++++++++++++++++++++----------------
 1 file changed, 46 insertions(+), 28 deletions(-)

diff --git a/arch/arm/mach-sa1100/collie.c b/arch/arm/mach-sa1100/collie.c
index 466d755d5702..53df6eb9ce83 100644
--- a/arch/arm/mach-sa1100/collie.c
+++ b/arch/arm/mach-sa1100/collie.c
@@ -27,10 +27,11 @@
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/partitions.h>
 #include <linux/timer.h>
-#include <linux/gpio_keys.h>
+#include <linux/gpio/property.h>
 #include <linux/input.h>
 #include <linux/gpio.h>
 #include <linux/gpio/machine.h>
+#include <linux/property.h>
 #include <linux/power/gpio-charger.h>
 
 #include <video/sa1100fb.h>
@@ -228,43 +229,57 @@ struct platform_device collie_locomo_device = {
 	.resource	= locomo_resources,
 };
 
-static struct gpio_keys_button collie_gpio_keys[] = {
-	{
-		.type	= EV_PWR,
-		.code	= KEY_RESERVED,
-		.gpio	= COLLIE_GPIO_ON_KEY,
-		.desc	= "On key",
-		.wakeup	= 1,
-		.active_low = 1,
-	},
-	{
-		.type	= EV_PWR,
-		.code	= KEY_WAKEUP,
-		.gpio	= COLLIE_GPIO_WAKEUP,
-		.desc	= "Sync",
-		.wakeup = 1,
-		.active_low = 1,
-	},
+static const struct software_node collie_gpio_keys_node = {
+	.name = "collie-gpio-keys",
 };
 
-static struct gpio_keys_platform_data collie_gpio_keys_data = {
-	.buttons	= collie_gpio_keys,
-	.nbuttons	= ARRAY_SIZE(collie_gpio_keys),
+static const struct property_entry collie_on_key_props[] = {
+	PROPERTY_ENTRY_U32("linux,code", KEY_RESERVED),
+	PROPERTY_ENTRY_GPIO("gpios", &sa1100_gpiochip_node,
+			    COLLIE_GPIO_ON_KEY, GPIO_ACTIVE_LOW),
+	PROPERTY_ENTRY_STRING("label", "On key"),
+	PROPERTY_ENTRY_U32("linux,input-type", EV_PWR),
+	PROPERTY_ENTRY_BOOL("wakeup-source"),
+	{ }
 };
 
-static struct platform_device collie_gpio_keys_device = {
-	.name	= "gpio-keys",
-	.id	= -1,
-	.dev	= {
-		.platform_data = &collie_gpio_keys_data,
-	},
+static const struct software_node collie_on_key_node = {
+	.parent = &collie_gpio_keys_node,
+	.properties = collie_on_key_props,
+};
+
+static const struct property_entry collie_wakeup_key_props[] = {
+	PROPERTY_ENTRY_U32("linux,code", KEY_WAKEUP),
+	PROPERTY_ENTRY_GPIO("gpios", &sa1100_gpiochip_node,
+			    COLLIE_GPIO_WAKEUP, GPIO_ACTIVE_LOW),
+	PROPERTY_ENTRY_STRING("label", "Sync"),
+	PROPERTY_ENTRY_U32("linux,input-type", EV_PWR),
+	PROPERTY_ENTRY_BOOL("wakeup-source"),
+	{ }
+};
+
+static const struct software_node collie_wakeup_key_node = {
+	.parent = &collie_gpio_keys_node,
+	.properties = collie_wakeup_key_props,
+};
+
+static const struct software_node * const collie_gpio_keys_swnodes[] __initconst = {
+	&collie_gpio_keys_node,
+	&collie_on_key_node,
+	&collie_wakeup_key_node,
+	NULL
+};
+
+static const struct platform_device_info collie_gpio_keys_dev_info __initconst = {
+	.name = "gpio-keys",
+	.id = PLATFORM_DEVID_NONE,
+	.swnode = &collie_gpio_keys_node,
 };
 
 static struct platform_device *devices[] __initdata = {
 	&collie_locomo_device,
 	&colliescoop_device,
 	&collie_power_device,
-	&collie_gpio_keys_device,
 };
 
 static struct mtd_partition collie_partitions[] = {
@@ -384,6 +399,9 @@ static void __init collie_init(void)
 		printk(KERN_WARNING "collie: Unable to register LoCoMo device\n");
 	}
 
+	software_node_register_node_group(collie_gpio_keys_swnodes);
+	platform_device_register_full(&collie_gpio_keys_dev_info);
+
 	sa11x0_register_lcd(&collie_lcd_info);
 	sa11x0_register_mtd(&collie_flash_data, collie_flash_resources,
 			    ARRAY_SIZE(collie_flash_resources));

-- 
2.55.0.rc2.803.g1fd1e6609c-goog


