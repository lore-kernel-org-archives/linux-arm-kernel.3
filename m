Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47512C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 01:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gGvSp5fyDj7TwHQ1Fp7icpxYJo/xaDzO9R+cKOZT4RA=; b=30HepeLf5wT2dlrf3O/m1X0OWb
	enXDRrfa3vAeI3Rl7ifnNt38fEkqHCKkJHAxQB7+uZ0EV0iI36K70LrB7J+ifH9BL2VTBUGdN14gk
	IOsP4Qr0J8e5zbAwGqkxh+TXCyWGwyD00f7uz8VF1ETPIlMesbf1VzKaE2A3bhWnwXU/lmwQ3hyzQ
	Q85Hxej8+ojSvUdJ1oQ4CVi/jeTU32uI1T2+hw4ssLjO3ng4uDwz+ZNs38CAw3FYgoKKe7p7ya1Wi
	uZ1DU71PgzEQdwtVUKbIy8ItsG5m+9BoRjZ98hxK+CGaYV56+98gL1wyrcGeNda89xOh9d+VbTk70
	1TEDV/AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgY9O-0000000BC3w-2AB8;
	Mon, 06 Jul 2026 01:29:34 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgY9K-0000000BBzP-2Buu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 01:29:31 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2cad8076b01so31566845ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jul 2026 18:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783301369; x=1783906169; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gGvSp5fyDj7TwHQ1Fp7icpxYJo/xaDzO9R+cKOZT4RA=;
        b=YCKrd74b79fYR1bjsm3A2NkcKBGejKzIqwS4R33rw0HrZ+nOyJ6DXCP0B6NoIhhc60
         XF1Z+4YHymb3dPgPOEOUJpsIxGyW+Wn7KqNMDVN7MtfrzTl8N9HqNKRMMAx3x14eLUSk
         V8IwbQvVR9Gd0o66DF1kfOahyQeeCFHt4ql2Z4WR547NV67PgqsrYWCJN4+pBHwcSxqf
         1Xy6z7sdfVMe4p/GTF/Ym/eZC8bSjK7rHk5z63SyT8vqgTSWzukmyqualsm5GBXXbzSS
         oyb+YEvl/Z9rZmfSM0zwMYUv4dwDf5qN3oakCN73l5YSpQwkPRiIlj893Nb18O8YEZhq
         dM7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783301369; x=1783906169;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gGvSp5fyDj7TwHQ1Fp7icpxYJo/xaDzO9R+cKOZT4RA=;
        b=gskmUNHD0ZUBSWV9jKPHfhvuNDmu7Odon32TKBOaShoQbUf+j+CQCa4Qy4YB5+uNLH
         gpD01cPIqbZUEAarrIOAWJsCF0mHRyTafmscYAqqVvgZUmEfkpDCeFuXsn6O3Jajo7pp
         r63uTOzMkfijDcqGsXNgUk17v2xgXIP/Zh6dUuEZhA4ygCTf3Ufbq5UbIUDKCEibWyqJ
         sT6YbN74N7E/GqXfpYz6MWuTtHevt/dKq0o5Ii6z5EUxYbY+F7AK0F0NuVG+ggv+B/hc
         Fw7JVTud69w4StyAZbhS+cdnVhozlQr0SUwT2tooXiQFZD6YK7bCr46SFzxvXpj/n+VW
         IkHg==
X-Forwarded-Encrypted: i=1; AHgh+Rok4gGw/xhb/z56K+ZJN02cEof0oQBiOMNIUo0o6LAgbCC4X+6noRIG2Ddf5NMunOyhTSF5BE/MQocn3yJ0mAAy@lists.infradead.org
X-Gm-Message-State: AOJu0YwhsHkYbeyzrc/yrwhxkboUBbFF45aAGfNzuwu5w4+2QPEeC4db
	TCEw5buzj4lLVeOOoYr65j7ug6QcxgsFLJyCoG/jrhgmaks01SM/sJ0v
X-Gm-Gg: AfdE7ckEbatCvgCYc8eCID39kIxbGA4XCxv8CY8XLjzhgKOIioy6y3ffSFaPlaJN2cZ
	F5ZdE9uhnaMByMT90ujkh4L+s7PpoNZDAdSssuJp/uaMPsSh5ARXKhWwL8czMXmcDMbp5Os92nI
	AVttCzF9SczfY3ZPil6Ndj6qW6i77gT9OV+v/+XuWKo8wqNEzcTFnXMqX/FXSefzNIjySFtaLWB
	6tE6PAa+wx0xMyBioyy15dg+sUuRsAHkRwHSTTTwmVMH+VCpOQw6Txy3WdMIsKjgVBiTRGJ03n+
	V1ZH0t/5De/GqDjIhwjOGCR0tjDx961CP3+rM6HZc8KlG8NRwZA15PaN/5FlarvT6rZCyi0RiBO
	nx3ay9SduTqoni7EteqE38oMBGwafpZ0dnoird255kJxI0UQ6UtTcu1togUXQdmEFho+Mw3NyO6
	21plKPru26ofQHXdGVRxckBdpSUOXySdufP9Wv3HyF7tXGJmys7NWfYxf6UfUWJQcKmJbpu8wl4
	1E=
X-Received: by 2002:a17:902:f681:b0:2ca:d91e:bfb4 with SMTP id d9443c01a7336-2cbb9ec1a1cmr86419275ad.24.1783301369574;
        Sun, 05 Jul 2026 18:29:29 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:bf6:81d1:bcfe:9d1c])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7ef5b3sm63084524c88.1.2026.07.05.18.29.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 18:29:29 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sun, 05 Jul 2026 18:29:19 -0700
Subject: [PATCH 2/7] ARM: mv78xx0: buffalo-wxl: convert gpio-keys to use
 software nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-orion-mv78xx0-swnode-v1-2-07d95ef4f447@gmail.com>
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
X-CRM114-CacheID: sfid-20260705_182930_570875_EC03F97B 
X-CRM114-Status: GOOD (  14.66  )
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

Convert the Buffalo WXL board setup from legacy gpio_keys_platform_data
to software nodes. The gpio-keys platform device is registered with
static software node properties and button configurations.

Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 arch/arm/mach-mv78xx0/buffalo-wxl-setup.c | 50 +++++++++++++++++++------------
 1 file changed, 31 insertions(+), 19 deletions(-)

diff --git a/arch/arm/mach-mv78xx0/buffalo-wxl-setup.c b/arch/arm/mach-mv78xx0/buffalo-wxl-setup.c
index 62e982f74bc2..0c15dd25e966 100644
--- a/arch/arm/mach-mv78xx0/buffalo-wxl-setup.c
+++ b/arch/arm/mach-mv78xx0/buffalo-wxl-setup.c
@@ -15,8 +15,10 @@
 #include <linux/ethtool.h>
 #include <linux/i2c.h>
 #include <linux/gpio.h>
-#include <linux/gpio_keys.h>
+#include <linux/gpio/property.h>
+#include <linux/property.h>
 #include <linux/input.h>
+#include <plat/orion-gpio.h>
 #include <asm/mach-types.h>
 #include <asm/mach/arch.h>
 #include "mv78xx0.h"
@@ -105,31 +107,39 @@ static unsigned int wxl_mpp_config[] __initdata = {
 	0
 };
 
-static struct gpio_keys_button tswxl_buttons[] = {
-	{
-		.code	   = KEY_OPTION,
-		.gpio	   = TSWXL_AUTO_SWITCH,
-		.desc	   = "Power-auto Switch",
-		.active_low     = 1,
-	}
+static const struct software_node tswxl_gpio_keys_node = {
+	.name = "tswxl-gpio-keys",
 };
 
-static struct gpio_keys_platform_data tswxl_button_data = {
-	.buttons	= tswxl_buttons,
-	.nbuttons       = ARRAY_SIZE(tswxl_buttons),
+static const struct property_entry tswxl_auto_switch_props[] = {
+	PROPERTY_ENTRY_U32("linux,code", KEY_OPTION),
+	PROPERTY_ENTRY_GPIO("gpios", &orion_gpio_swnodes[0],
+			    TSWXL_AUTO_SWITCH, GPIO_ACTIVE_LOW),
+	PROPERTY_ENTRY_STRING("label", "Power-auto Switch"),
+	{ }
 };
 
-static struct platform_device tswxl_button_device = {
-	.name	   = "gpio-keys",
-	.id	     = -1,
-	.num_resources  = 0,
-	.dev	    = {
-		.platform_data  = &tswxl_button_data,
-	},
+static const struct software_node tswxl_auto_switch_node = {
+	.parent = &tswxl_gpio_keys_node,
+	.properties = tswxl_auto_switch_props,
+};
+
+static const struct software_node * const tswxl_gpio_keys_swnodes[] __initconst = {
+	&tswxl_gpio_keys_node,
+	&tswxl_auto_switch_node,
+	NULL
+};
+
+static const struct platform_device_info tswxl_button_info __initconst = {
+	.name	= "gpio-keys",
+	.id	= PLATFORM_DEVID_NONE,
+	.swnode	= &tswxl_gpio_keys_node,
 };
 
 static void __init wxl_init(void)
 {
+	int err;
+
 	/*
 	 * Basic MV78xx0 setup. Needs to be called early.
 	 */
@@ -158,7 +168,9 @@ static void __init wxl_init(void)
 	gpio_direction_output(TSWXL_USB_POWER2, 1);
 
 	//enable rear switch
-	platform_device_register(&tswxl_button_device);
+	err = software_node_register_node_group(tswxl_gpio_keys_swnodes);
+	if (!err)
+		platform_device_register_full(&tswxl_button_info);
 }
 
 static int __init wxl_pci_init(void)

-- 
2.55.0.rc0.799.gd6f94ed593-goog


