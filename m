Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7457FC43602
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 01:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jMlJFQaGdBBRmEhtG4IXXB+jKLFY6kHDbxEn3m4l6Wo=; b=vL+6ZhhX44Zo4WS9oqZ6ahvKks
	ZuBw0pynFfCms3yojbHk5GEYGgJk1wWw8FDOw1vnz3IAaV285oIqYWAZ3q0G+NYAkxdgvq/bcrjVr
	FfOPMnB9FKGFnhT4jhyOrzNStptjpH9J3pFxnEebMgxNFNFDWCDughCDOQ8+YrpnENefYueTA2PEI
	Bp0hgimkr4vctAJD8D9Jzu9qkni1iEdyth1UXY2sFcY23kerBEnNdoV7tTB4Ubyi6KBa8z4l6oPGE
	L5YGVapKCykKzJyM1qsdnmfXdRG4DgqhcDJxF9PcIgUBoJivWvcv6L3YtNR5PNpnV71C+dgyZkH2t
	Mpbe1m9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgY9T-0000000BC8c-00LX;
	Mon, 06 Jul 2026 01:29:39 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgY9O-0000000BC2v-1MZz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 01:29:35 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-845e363246aso2696304b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jul 2026 18:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783301373; x=1783906173; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jMlJFQaGdBBRmEhtG4IXXB+jKLFY6kHDbxEn3m4l6Wo=;
        b=BTr1RAUf69zWE2x4E7R0RZs50IVp1jGoDQj4pHAUKl4UJisxakUc+AMv5o+P/d1m0g
         PbH0rG1gacVcTfgCzZwutbTQhYkvAtnShHa24uyToHs+mICI2ystylKbwYP26tP37Wsc
         H7PwbrNLlkdOI8Ojjtm5ANckncYQhLgeIgJGaHiTROcsQSzEsokQq5Qd8aQ/EKMYiBwU
         xh8tKSuGYrwytnuQHEirGm0pCUrxBTLHGhCPenf2qsQ8TFtS+veV9zs2oPAl0j5177VR
         VAf40VYhfNjzpRKB7nlTCzkCr/QPoKy6P0VgAbWmXEIJxmm7bJ/dMnqJ0O9kMRvxf7Qf
         WiSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783301373; x=1783906173;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jMlJFQaGdBBRmEhtG4IXXB+jKLFY6kHDbxEn3m4l6Wo=;
        b=VY5FXKeWja1ZIrXJ4+ohARAPugM+YxGnk/0L/lIuYWOSqlj3N+7rXm3opZBHKxwhhC
         C2R3twdZPeRNqUtMPufslK/015b3b7SQ/rJKBZCyZV6C/sEMz3mY/KbZ+5Obyh1z7j/1
         M0cnIyTLT6hy0765Fwv939wV+QtAu/8gR/3niIjPqbdFfC1wR18qmuKANHOd7rq4BH6D
         8a5rj5N6E4UcbcVOEBnhxiW/h3ViRR26PwbqAoVXfhe90hrrh6JNNfPD81FY/+1fN3Op
         uzsVsyopn60oS9Sw6rBh02Wv5sgJwpKMKNIklBwqiw8xgHYskri4byMgJ8CaYkTyJB8b
         RuxA==
X-Forwarded-Encrypted: i=1; AHgh+Rrh22lmPwVuA4wKPwRXWy+6EpAPh160Qvc1/9JBZVn2q2AU5qIeZgMDpBCwrriaXq48G91xlO14EkfYW9Fft5TB@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5QimER0xB513hAhrJ8frfSQP7mtU1PSsM91JYiStsy/iBp8CD
	uGmm11QnowkAS4hVNTuVvz10llNBRH7TxNK+l08Zjp0IVItghKM0SAxJ
X-Gm-Gg: AfdE7cmwRRHqOwYWCDd3/QIsXpfFvkafJy+oTpHnpo10mVdXEbdThoJ0v2U4OESVria
	RcAr3p3fuwF4fZkQXD+BHkSiTz7riChV4goDVXPN8ui3Tkc/Qf5hKEg1wyaLBIz06SCtaWDrFzT
	NGIIrMgwp84a/NtzZLCyOcbK/sTYcTBIHa1cGWPpAaB+q38MY7PCbei4iipsHLE2UKNXNgubZn2
	u9rjwheZCOi1OXiwkiWiNIJI5VuPJP2j6Ual5BlgdK3su9BoB2W4U7Mg7Y/JVAtylUi0mn04wgY
	8XQaiYFMGhnzj9VcdX65IE6utiCCUpmjhpB40F4fCKC4Oj+EkDa2zrrJCjjknAD5fIJf3jDUQ5D
	CfxerkLCI8l6+TVlwAyI0ihSP2Ylryz4Bfv6AYGirAkgv+MzdPU6aw85hw3/umfAd6UdZLCMWS1
	J7I7OhLny7U2fUCh5ajO8W56sZKTwJ7UycK5HqEsk6zGpw2AllxiLAtLpoqv/MmWXMkWB2fg8DQ
	1g=
X-Received: by 2002:a05:6a20:9188:b0:3bf:82c5:ed13 with SMTP id adf61e73a8af0-3c03e498301mr8165505637.38.1783301372368;
        Sun, 05 Jul 2026 18:29:32 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:bf6:81d1:bcfe:9d1c])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7ef5b3sm63084524c88.1.2026.07.05.18.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 18:29:31 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sun, 05 Jul 2026 18:29:21 -0700
Subject: [PATCH 4/7] ARM: orion5x: mv2120: convert gpio-keys to use
 software nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-orion-mv78xx0-swnode-v1-4-07d95ef4f447@gmail.com>
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
X-CRM114-CacheID: sfid-20260705_182934_374925_C996F616 
X-CRM114-Status: GOOD (  16.77  )
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

Convert the MV2120 board setup from legacy gpio_keys_platform_data to
software nodes. The gpio-keys platform device is registered with static
software node properties and button configurations.

Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 arch/arm/mach-orion5x/mv2120-setup.c | 68 +++++++++++++++++++++++-------------
 1 file changed, 44 insertions(+), 24 deletions(-)

diff --git a/arch/arm/mach-orion5x/mv2120-setup.c b/arch/arm/mach-orion5x/mv2120-setup.c
index 5b0249f109cd..07b8c34f6a79 100644
--- a/arch/arm/mach-orion5x/mv2120-setup.c
+++ b/arch/arm/mach-orion5x/mv2120-setup.c
@@ -9,6 +9,8 @@
  */
 #include <linux/gpio.h>
 #include <linux/gpio/machine.h>
+#include <linux/gpio/property.h>
+#include <linux/property.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
 #include <linux/platform_device.h>
@@ -16,10 +18,10 @@
 #include <linux/mtd/physmap.h>
 #include <linux/mv643xx_eth.h>
 #include <linux/leds.h>
-#include <linux/gpio_keys.h>
 #include <linux/input.h>
 #include <linux/i2c.h>
 #include <linux/ata_platform.h>
+#include <plat/orion-gpio.h>
 #include <asm/mach-types.h>
 #include <asm/mach/arch.h>
 #include "common.h"
@@ -76,34 +78,48 @@ static struct platform_device mv2120_nor_flash = {
 	.num_resources	= 1,
 };
 
-static struct gpio_keys_button mv2120_buttons[] = {
-	{
-		.code		= KEY_RESTART,
-		.gpio		= MV2120_GPIO_KEY_RESET,
-		.desc		= "reset",
-		.active_low	= 1,
-	}, {
-		.code		= KEY_POWER,
-		.gpio		= MV2120_GPIO_KEY_POWER,
-		.desc		= "power",
-		.active_low	= 1,
-	},
+static const struct software_node mv2120_gpio_keys_node = {
+	.name = "mv2120-gpio-keys",
 };
 
-static struct gpio_keys_platform_data mv2120_button_data = {
-	.buttons	= mv2120_buttons,
-	.nbuttons	= ARRAY_SIZE(mv2120_buttons),
+static const struct property_entry mv2120_reset_key_props[] = {
+	PROPERTY_ENTRY_U32("linux,code", KEY_RESTART),
+	PROPERTY_ENTRY_GPIO("gpios", &orion_gpio_swnodes[0],
+			    MV2120_GPIO_KEY_RESET, GPIO_ACTIVE_LOW),
+	PROPERTY_ENTRY_STRING("label", "reset"),
+	{ }
 };
 
-static struct platform_device mv2120_button_device = {
-	.name		= "gpio-keys",
-	.id		= -1,
-	.num_resources	= 0,
-	.dev		= {
-		.platform_data	= &mv2120_button_data,
-	},
+static const struct software_node mv2120_reset_key_node = {
+	.parent = &mv2120_gpio_keys_node,
+	.properties = mv2120_reset_key_props,
+};
+
+static const struct property_entry mv2120_power_key_props[] = {
+	PROPERTY_ENTRY_U32("linux,code", KEY_POWER),
+	PROPERTY_ENTRY_GPIO("gpios", &orion_gpio_swnodes[0],
+			    MV2120_GPIO_KEY_POWER, GPIO_ACTIVE_LOW),
+	PROPERTY_ENTRY_STRING("label", "power"),
+	{ }
 };
 
+static const struct software_node mv2120_power_key_node = {
+	.parent = &mv2120_gpio_keys_node,
+	.properties = mv2120_power_key_props,
+};
+
+static const struct software_node * const mv2120_gpio_keys_swnodes[] __initconst = {
+	&mv2120_gpio_keys_node,
+	&mv2120_reset_key_node,
+	&mv2120_power_key_node,
+	NULL
+};
+
+static const struct platform_device_info mv2120_button_info __initconst = {
+	.name	= "gpio-keys",
+	.id	= PLATFORM_DEVID_NONE,
+	.swnode	= &mv2120_gpio_keys_node,
+};
 
 /****************************************************************************
  * General Setup
@@ -200,6 +216,8 @@ static void mv2120_power_off(void)
 
 static void __init mv2120_init(void)
 {
+	int err;
+
 	/* Setup basic Orion functions. Need to be called early. */
 	orion5x_init();
 
@@ -222,7 +240,9 @@ static void __init mv2120_init(void)
 				    MV2120_NOR_BOOT_SIZE);
 	platform_device_register(&mv2120_nor_flash);
 
-	platform_device_register(&mv2120_button_device);
+	err = software_node_register_node_group(mv2120_gpio_keys_swnodes);
+	if (!err)
+		platform_device_register_full(&mv2120_button_info);
 
 	if (gpio_request(MV2120_GPIO_RTC_IRQ, "rtc") == 0) {
 		if (gpio_direction_input(MV2120_GPIO_RTC_IRQ) == 0)

-- 
2.55.0.rc0.799.gd6f94ed593-goog


