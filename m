Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD832C44500
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 03:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MMrqUfMvT5vpakCL5ikkaGZV0QE+15QhOUc7fLT1f/Q=; b=qKW32TOXs/lJDQyEqhoSNRYU1E
	1hJmPQytNhzF12+mO3Ve538DnS9QWiOmXxaM7VHuyUhkMz+dC2zR2niYXrclnYIFw8OINdalM9ySi
	8N0WCVSthWBBlCUeuh2GHcPT8EmcWADiyl3qlcBsQQ+tIOhosVQRuN6j02uY/o0K5j2vbZ/fd9P6Q
	W+552wbslYXsGAY8V6xktle0Wva1Y9tnz3Dl1+cBYtkEQk9aVdiBlWxPbXwniu+AVsRgmTN8pOnVG
	sGopIkpyj+Vj4lto9fBJOP9nukgzkirD+X+DoMbPNZYHpSHwaaf/6X7yvs0L0qKrF3fVGMrV4Lfmc
	a/jK5mEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgwGH-0000000DzCM-0qD8;
	Tue, 07 Jul 2026 03:14:17 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgwGC-0000000Dz95-1m29
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 03:14:13 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-845f2909cd4so2541632b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 20:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783394051; x=1783998851; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MMrqUfMvT5vpakCL5ikkaGZV0QE+15QhOUc7fLT1f/Q=;
        b=iecrzWkHhIp5pFCtyqw/UEZM88U7GH/Jy4C0OQoNEYJOirbIaeBUq3ztq8vOoiYG9z
         biTeUTzw2a7qmsp5CdI45YVY7nxZmdgi6JAsxnVHKYDSZIF2HkXxotGVHDXjMU/8cFqt
         7Sm4MLTcVyiAv+ePlIgI8tRf80kjZ51lB4PPX0D2RSuMQZ4lKgpQaRKWKxXnG4yyzed3
         ThC7bezKXIYkZBLF6T+KH5//Mf+F0wgLkWMUZ1u46im12mR+WAUD/613HTRfRjdr9CRf
         iHWKYp2m7wcU2jt+ZYdf7bosjlyi3eMARp0h6Q5fyekGrOkYQDEPic2a9YvlyIflaeiz
         q+Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783394051; x=1783998851;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MMrqUfMvT5vpakCL5ikkaGZV0QE+15QhOUc7fLT1f/Q=;
        b=Eey/7WSFZcVB0KGcLu1hjZ06b/BYvX5kTIfXoyhGo59GeSxhXPhWlx/TEB9aRlkUsc
         0bUFfLrqjDdJej5/p3cYAU3Ks+ia3fRGmb8VclWQJiO4KPVp4mi2SNfMiTAVNu7jodJS
         8XT4acfNy3xT1+Ga7F2Snl2rkZpeq4o98O1Eh+1LWoz9iU6LwwepnA/n2KzAmS6Tfjcz
         AqCcqy7LmyP9d0BCZcj3+2ibHjVSBOE/Wx3Aq+GiSagIxzrBcgTYG5rFk49vKCvj1GO/
         Ds85u3e5MwWZXFduFNhpKTQZYvF4Bla83lHMguCWoJWvVyS9oSZgpCjFTy/090XZ6Nb3
         KJuw==
X-Gm-Message-State: AOJu0YzKjs0TFaGonRDAoDXyin9gpYpdoHDeWeEpnsMu493e0UILNayR
	WKXSisJ3Ux8oJXWSAjO1XgO1ZG7TXhzhy47sII4Upa6PqGpbF/eGsV2PkKhDbQ==
X-Gm-Gg: AfdE7cmY9Pm838eHXPCC4ZdU1nJqHKb3Ho5moQgODF9zAj8bld1Otz+QEIXf32fFYGr
	CABOyllfygsvRLDUoM6VzmPUzC/UCMQUuIIZiH8YswvjE0Grw47WCKxND9rxkprlVJ2BaY1XImc
	m+HBIWm7X45keHLbrGTqC/kyVa0heIUIDfxsZCgtLhO+EcLM4TWH7ekdZr/LFtxzclslLnx66m4
	XGmEySgV37AhRVHLRz3lVKhSriVIdHhBTPYI2d9HMPpmRoK8QVlufxLwZQBxbIlFWCs8owVTxYy
	BoZcZx46o8k9qbJs9W7Q4R43fNp89tvpJaFh5jvb4Ek8Fuhhi7r6jFgDXpMQb2HwUC9Simx5kfK
	oWOKXHb6+heSHSP06kxiYmiJ7iRThaIdVm/wxX7YjcFiTq9vxC+A3zl5dRQmZUE5we5lijxGa1u
	1HZp99/tgTiSgT3ZBWO2P7qJNV/slWu1g7XOPWM6hpVizNZoRNZmZMkYBDNsvbDu6Gcngwl6jnW
	2NC
X-Received: by 2002:a05:6a21:6b05:b0:38d:fad1:cf2a with SMTP id adf61e73a8af0-3c08ed0adfcmr3907819637.13.1783394051311;
        Mon, 06 Jul 2026 20:14:11 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:d89b:1fdd:a8f2:dbeb])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659666e7sm3339905c88.7.2026.07.06.20.14.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 20:14:10 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Mon, 06 Jul 2026 20:14:03 -0700
Subject: [PATCH 4/4] ARM: sa1100: h3xxx: convert gpio-keys to use software
 nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-sa1100-swnode-v1-4-332759bbd930@gmail.com>
References: <20260706-sa1100-swnode-v1-0-332759bbd930@gmail.com>
In-Reply-To: <20260706-sa1100-swnode-v1-0-332759bbd930@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>, Russell King <linux@armlinux.org.uk>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 soc@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org
X-Mailer: b4 0.16-dev-b242f
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_201412_516825_5F8FA37B 
X-CRM114-Status: GOOD (  18.09  )
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
HP iPAQ H3xxx series boards to use software nodes and device properties.
This helps progress the removal of platform data support from the
gpio-keys driver.

Define static software nodes for the gpio-keys device and the power and
action button child nodes at file scope, referencing the SA-1100 GPIO
controller node directly. In h3xxx_mach_init(), register the software node
group and use platform_device_register_full() to register the device.

Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 arch/arm/mach-sa1100/h3xxx.c | 69 +++++++++++++++++++++++++++-----------------
 1 file changed, 42 insertions(+), 27 deletions(-)

diff --git a/arch/arm/mach-sa1100/h3xxx.c b/arch/arm/mach-sa1100/h3xxx.c
index d685f03f51f3..13c0aa4c0bfa 100644
--- a/arch/arm/mach-sa1100/h3xxx.c
+++ b/arch/arm/mach-sa1100/h3xxx.c
@@ -8,9 +8,10 @@
 
 #include <linux/kernel.h>
 #include <linux/gpio/machine.h>
+#include <linux/gpio/property.h>
 #include <linux/gpio.h>
-#include <linux/gpio_keys.h>
 #include <linux/input.h>
+#include <linux/property.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/partitions.h>
 #include <linux/platform_data/gpio-htc-egpio.h>
@@ -168,35 +169,48 @@ static struct platform_device h3xxx_egpio = {
  * GPIO keys
  */
 
-static struct gpio_keys_button h3xxx_button_table[] = {
-	{
-		.code		= KEY_POWER,
-		.gpio		= H3XXX_GPIO_PWR_BUTTON,
-		.desc		= "Power Button",
-		.active_low	= 1,
-		.type		= EV_KEY,
-		.wakeup		= 1,
-	}, {
-		.code		= KEY_ENTER,
-		.gpio		= H3XXX_GPIO_ACTION_BUTTON,
-		.active_low	= 1,
-		.desc		= "Action button",
-		.type		= EV_KEY,
-		.wakeup		= 0,
-	},
+static const struct software_node h3xxx_gpio_keys_node = {
+	.name = "h3xxx-gpio-keys",
 };
 
-static struct gpio_keys_platform_data h3xxx_keys_data = {
-	.buttons  = h3xxx_button_table,
-	.nbuttons = ARRAY_SIZE(h3xxx_button_table),
+static const struct property_entry h3xxx_power_key_props[] = {
+	PROPERTY_ENTRY_U32("linux,code", KEY_POWER),
+	PROPERTY_ENTRY_GPIO("gpios", &sa1100_gpiochip_node,
+			    H3XXX_GPIO_PWR_BUTTON, GPIO_ACTIVE_LOW),
+	PROPERTY_ENTRY_STRING("label", "Power Button"),
+	PROPERTY_ENTRY_BOOL("wakeup-source"),
+	{ }
 };
 
-static struct platform_device h3xxx_keys = {
-	.name	= "gpio-keys",
-	.id	= -1,
-	.dev	= {
-		.platform_data = &h3xxx_keys_data,
-	},
+static const struct software_node h3xxx_power_key_node = {
+	.parent = &h3xxx_gpio_keys_node,
+	.properties = h3xxx_power_key_props,
+};
+
+static const struct property_entry h3xxx_action_key_props[] = {
+	PROPERTY_ENTRY_U32("linux,code", KEY_ENTER),
+	PROPERTY_ENTRY_GPIO("gpios", &sa1100_gpiochip_node,
+			    H3XXX_GPIO_ACTION_BUTTON, GPIO_ACTIVE_LOW),
+	PROPERTY_ENTRY_STRING("label", "Action button"),
+	{ }
+};
+
+static const struct software_node h3xxx_action_key_node = {
+	.parent = &h3xxx_gpio_keys_node,
+	.properties = h3xxx_action_key_props,
+};
+
+static const struct software_node * const h3xxx_gpio_keys_swnodes[] __initconst = {
+	&h3xxx_gpio_keys_node,
+	&h3xxx_power_key_node,
+	&h3xxx_action_key_node,
+	NULL
+};
+
+static const struct platform_device_info h3xxx_gpio_keys_dev_info __initconst = {
+	.name = "gpio-keys",
+	.id = PLATFORM_DEVID_NONE,
+	.swnode = &h3xxx_gpio_keys_node,
 };
 
 static struct resource h3xxx_micro_resources[] = {
@@ -214,7 +228,6 @@ struct platform_device h3xxx_micro_asic = {
 
 static struct platform_device *h3xxx_devices[] = {
 	&h3xxx_egpio,
-	&h3xxx_keys,
 	&h3xxx_micro_asic,
 };
 
@@ -240,6 +253,8 @@ void __init h3xxx_mach_init(void)
 	sa1100_register_uart_fns(&h3xxx_port_fns);
 	sa11x0_register_mtd(&h3xxx_flash_data, &h3xxx_flash_resource, 1);
 	platform_add_devices(h3xxx_devices, ARRAY_SIZE(h3xxx_devices));
+	software_node_register_node_group(h3xxx_gpio_keys_swnodes);
+	platform_device_register_full(&h3xxx_gpio_keys_dev_info);
 }
 
 static struct map_desc h3600_io_desc[] __initdata = {

-- 
2.55.0.rc2.803.g1fd1e6609c-goog


