Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03D1EC44500
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 01:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9H2eHlUxiAac2XyfvIaa5M45MW9DKb80fpZh45IqzI4=; b=lfc98Ybwmw+3Fn+hCzqfHiG4QW
	b9XoAJlVo8nnG1xI8wJc1cYlW7q74o6MWC/plz5dbtqmt5qd50uRezP3o+eDSH/b5PbCjHYU2R1PU
	2F44coFO/6No3MbwATgUcfYObLd7cNQMu8JdKkXCWeFbOBYqFifs0aKZhcOA7bdzlvc6uq/1AtS4Y
	Hn6SClUjEvK8YlOWeI+uwKyamfvXxIZQ3poBbETnVGgOcC87Erd0y/dTFdhiT47XG46ucz4MHsCt8
	RaXQDMjmyP1OMQ64KFCzIYmFle1LNBaLPL6TzeTjhDua8asRSY5a4vRVJ2eUOfOd4t153HmrBDCcX
	FGoag/+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgY9S-0000000BC8J-3hWH;
	Mon, 06 Jul 2026 01:29:38 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgY9O-0000000BC32-0Ip8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 01:29:35 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-c88cc025f54so1556702a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jul 2026 18:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783301373; x=1783906173; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9H2eHlUxiAac2XyfvIaa5M45MW9DKb80fpZh45IqzI4=;
        b=jF406vGrWFJyKKCfLMd8ECO6nIrPZZO0MGCpJHVb2fdWuJifjoh0fq2Rsh0EFbFPtt
         WMwAJx1uucGYgr0Yo08WWEfHkw/kulqMKYR1Zg3kfd16VdjwtQBGF9m3xvUu2S8OX/rA
         3U7cEtUy2WbB3tZ5Z1ajABGQwF6kG+TtaUO4e/kuqtCCVuM+p3agk0AjHisxDQ4yhMcs
         8AIHtIyWu6kNWokZ6Rmwx7C9eMpyIaQZQT1pVqnj2NnZhea3Je0BYmtcrgPxBQAPkhXz
         JyJEofpjS9/rTExI89YbHniHnsOszlC/2+9+X9Zquc4ZcDlJuxWxniYYojAbx3MmJrlS
         4T9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783301373; x=1783906173;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9H2eHlUxiAac2XyfvIaa5M45MW9DKb80fpZh45IqzI4=;
        b=DtOTfAfn4P4lCTl+CFs+qGUDYa3afovtPxWar869FWzbrBPnKFWgq0fnPUpKUiWzIb
         wLQFKh199HXG/0bK3yTn7lDkGgK1KD9NmPrZcIew8iLwiqog61RTGGGZTzSPOx7xTAIo
         KiAYwfK4ZaR5WocvrflrQehEpgkDwH7rI114qa+geEUBSYXRjxry+zdluK9tGfltMSkC
         wdAVwFby8+U7lsN62j+EncyJOL8qifF7ST62IgQuCZ3dLLbVvPzTgUN+ggvmt+SBJZ46
         vbzHJ3FT/WbbXqfScbYlhV77F+y/+HWM3/5KGGfzrTbhaZuQ05l2+QpTBL6f1ObC4iaA
         WRBw==
X-Forwarded-Encrypted: i=1; AHgh+Rqb+zDAQre6sikYhWNmEsjFqYfPrsDKX4K4IlG+EQMG3haGRNwZqk90bdWbZIiMMuxHDronPgmihukEsOZhvflh@lists.infradead.org
X-Gm-Message-State: AOJu0YxisD6kldnT/VTzNnY3bAB3nRVbt2DbnOen2QZePk0XLi/j+KrF
	ObbPii8IvWnf+KkqN4ugWfOZ6bYk1eJETWhSIK1M/2jv4HR5QZZg0oPv
X-Gm-Gg: AfdE7ckBS7wjKF2uFfc65G3oqhc9Jk8WDh4Zl/qF0ESjm4lAXJU3DurAS+RBhh7RtyU
	3XZUkAR01uXvjH4JGPTcvIXmipoUIytWr2s2rBcMvwDGzpmXAwmgyBXXVilwTVPCZFLMRHHBy7J
	D1SY01XLaOvLMr39s02NNrREdObhA0Mg1lHJefWMvSCy5A34ne1srwXABQcph3QSXHYt/0cXKQH
	LYFbhYmVAnhfV9FOPX0xB32dTJoe1c6voQd4PolxtT0iCIsGd6oTVUMhPSc1eXfVX0fWuLg0hoo
	DIW8Hqe+D1CdTJR8bqbGGVOhQgVLH3wiN3viCCo2w2Ai6amUOmrfR3WD5wfOs3vXb/xgXlMJSpY
	B0PjnCblo8IeSfHz7IOPo90xuG/IKbOgBnah9h5BJtOxqwFK3beb8CIH+116XKVLPStCzSLOm6g
	oSYy7Q1rxeZxVj22I/gzpRmD+rPCsmmALpTuv0EOz2XSwz/U7G8eWqImO+EfLsyykeee4D3/Pa9
	PI=
X-Received: by 2002:a05:6a20:431f:b0:3bf:9fe1:c27 with SMTP id adf61e73a8af0-3c03e501a34mr8574489637.40.1783301373575;
        Sun, 05 Jul 2026 18:29:33 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:bf6:81d1:bcfe:9d1c])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7ef5b3sm63084524c88.1.2026.07.05.18.29.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 18:29:33 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sun, 05 Jul 2026 18:29:22 -0700
Subject: [PATCH 5/7] ARM: orion5x: net2big: convert gpio-keys to use
 software nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-orion-mv78xx0-swnode-v1-5-07d95ef4f447@gmail.com>
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
X-CRM114-CacheID: sfid-20260705_182934_125105_BB50E993 
X-CRM114-Status: GOOD (  15.26  )
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

Convert the Net2Big board setup from legacy gpio_keys_platform_data to
software nodes. The gpio-keys platform device is registered with static
software node properties and button configurations.

Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 arch/arm/mach-orion5x/net2big-setup.c | 94 +++++++++++++++++++++++------------
 1 file changed, 61 insertions(+), 33 deletions(-)

diff --git a/arch/arm/mach-orion5x/net2big-setup.c b/arch/arm/mach-orion5x/net2big-setup.c
index 4afd9b4c71a9..01eb453657c4 100644
--- a/arch/arm/mach-orion5x/net2big-setup.c
+++ b/arch/arm/mach-orion5x/net2big-setup.c
@@ -13,7 +13,8 @@
 #include <linux/mtd/physmap.h>
 #include <linux/mv643xx_eth.h>
 #include <linux/leds.h>
-#include <linux/gpio_keys.h>
+#include <linux/gpio/property.h>
+#include <linux/property.h>
 #include <linux/input.h>
 #include <linux/i2c.h>
 #include <linux/ata_platform.h>
@@ -309,41 +310,64 @@ static void __init net2big_gpio_leds_init(void)
 #define NET2BIG_SWITCH_POWER_ON		0x1
 #define NET2BIG_SWITCH_POWER_OFF	0x2
 
-static struct gpio_keys_button net2big_buttons[] = {
-	{
-		.type		= EV_SW,
-		.code		= NET2BIG_SWITCH_POWER_OFF,
-		.gpio		= NET2BIG_GPIO_POWER_SWITCH_OFF,
-		.desc		= "Power rocker switch (auto|off)",
-		.active_low	= 0,
-	},
-	{
-		.type		= EV_SW,
-		.code		= NET2BIG_SWITCH_POWER_ON,
-		.gpio		= NET2BIG_GPIO_POWER_SWITCH_ON,
-		.desc		= "Power rocker switch (on|auto)",
-		.active_low	= 0,
-	},
-	{
-		.type		= EV_KEY,
-		.code		= KEY_POWER,
-		.gpio		= NET2BIG_GPIO_PUSH_BUTTON,
-		.desc		= "Front Push Button",
-		.active_low	= 0,
-	},
+static const struct software_node net2big_gpio_keys_node = {
+	.name = "net2big-gpio-keys",
 };
 
-static struct gpio_keys_platform_data net2big_button_data = {
-	.buttons	= net2big_buttons,
-	.nbuttons	= ARRAY_SIZE(net2big_buttons),
+static const struct property_entry net2big_power_sw_off_props[] = {
+	PROPERTY_ENTRY_U32("linux,input-type", EV_SW),
+	PROPERTY_ENTRY_U32("linux,code", NET2BIG_SWITCH_POWER_OFF),
+	PROPERTY_ENTRY_GPIO("gpios", &orion_gpio_swnodes[0],
+			    NET2BIG_GPIO_POWER_SWITCH_OFF, GPIO_ACTIVE_HIGH),
+	PROPERTY_ENTRY_STRING("label", "Power rocker switch (auto|off)"),
+	{ }
 };
 
-static struct platform_device net2big_gpio_buttons = {
-	.name		= "gpio-keys",
-	.id		= -1,
-	.dev		= {
-		.platform_data	= &net2big_button_data,
-	},
+static const struct software_node net2big_power_sw_off_node = {
+	.parent = &net2big_gpio_keys_node,
+	.properties = net2big_power_sw_off_props,
+};
+
+static const struct property_entry net2big_power_sw_on_props[] = {
+	PROPERTY_ENTRY_U32("linux,input-type", EV_SW),
+	PROPERTY_ENTRY_U32("linux,code", NET2BIG_SWITCH_POWER_ON),
+	PROPERTY_ENTRY_GPIO("gpios", &orion_gpio_swnodes[0],
+			    NET2BIG_GPIO_POWER_SWITCH_ON, GPIO_ACTIVE_HIGH),
+	PROPERTY_ENTRY_STRING("label", "Power rocker switch (on|auto)"),
+	{ }
+};
+
+static const struct software_node net2big_power_sw_on_node = {
+	.parent = &net2big_gpio_keys_node,
+	.properties = net2big_power_sw_on_props,
+};
+
+static const struct property_entry net2big_power_key_props[] = {
+	PROPERTY_ENTRY_U32("linux,input-type", EV_KEY),
+	PROPERTY_ENTRY_U32("linux,code", KEY_POWER),
+	PROPERTY_ENTRY_GPIO("gpios", &orion_gpio_swnodes[0],
+			    NET2BIG_GPIO_PUSH_BUTTON, GPIO_ACTIVE_HIGH),
+	PROPERTY_ENTRY_STRING("label", "Front Push Button"),
+	{ }
+};
+
+static const struct software_node net2big_power_key_node = {
+	.parent = &net2big_gpio_keys_node,
+	.properties = net2big_power_key_props,
+};
+
+static const struct software_node * const net2big_gpio_keys_swnodes[] __initconst = {
+	&net2big_gpio_keys_node,
+	&net2big_power_sw_off_node,
+	&net2big_power_sw_on_node,
+	&net2big_power_key_node,
+	NULL
+};
+
+static const struct platform_device_info net2big_button_info __initconst = {
+	.name	= "gpio-keys",
+	.id	= PLATFORM_DEVID_NONE,
+	.swnode	= &net2big_gpio_keys_node,
 };
 
 /*****************************************************************************
@@ -387,6 +411,8 @@ static void net2big_power_off(void)
 
 static void __init net2big_init(void)
 {
+	int err;
+
 	/*
 	 * Setup basic Orion functions. Need to be called early.
 	 */
@@ -413,7 +439,9 @@ static void __init net2big_init(void)
 				    NET2BIG_NOR_BOOT_SIZE);
 	platform_device_register(&net2big_nor_flash);
 
-	platform_device_register(&net2big_gpio_buttons);
+	err = software_node_register_node_group(net2big_gpio_keys_swnodes);
+	if (!err)
+		platform_device_register_full(&net2big_button_info);
 	net2big_gpio_leds_init();
 
 	i2c_register_board_info(0, net2big_i2c_devices,

-- 
2.55.0.rc0.799.gd6f94ed593-goog


