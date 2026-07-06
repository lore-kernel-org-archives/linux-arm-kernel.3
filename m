Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79166C44500
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 01:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U2HcuA7JHhVqg4nnVOcfr5tQLclMpm2XqQgpx/8U7dU=; b=okRUgKGGqBVzbR/WITa6JAOyAY
	uDJ0iWZvRMtBKnOSdxN49TdfArrr4FOcPiV4Uo7c0C+wAgFXyS5e/NgM2bvX3lqipUE3ygrdUaoZ1
	g9TBFboWpnHD/OrVcyiMAJPGNnpRdPYU9ZhLljIsEQxRnUmkA5Ao/0ghZHG/DeqU25Qig83NA69pu
	ZMQLr/E2ZOdInoRIpLVBiKNoex0jsnGPxTECQV6ENJJBsj6FBAkT/OS2CqK6a6fE7TDduB8SOQ2pu
	XIlQtv7I8Mr9+WGLgX3E9fDp0Wm2XthWLqcKtavckOquGkToQAWWYvb9SkEWGbqHNtjGjX5uXpNNM
	SfQOHU2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgY9X-0000000BCDs-1ul6;
	Mon, 06 Jul 2026 01:29:43 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgY9R-0000000BC5m-0NEc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 01:29:38 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-845eb7b96feso2318822b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jul 2026 18:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783301376; x=1783906176; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U2HcuA7JHhVqg4nnVOcfr5tQLclMpm2XqQgpx/8U7dU=;
        b=a5PSV5UXlFkvrq2kHQvh5eRaoCPSucxl8IDid2m+R2rRIo8jgSCeo87MchfqEw+ECm
         7XTem+DcggDMTxlJyP5ujD8bR29jeWU4qCB8ApP8HWIit2W7yDtES4UemM6cAUbucxwd
         gqlJfc5ZCW80I6LICRdV9zuvTo4YKNcvQHjvBKlbF3qAW8VG3LwMnCx6/osArmV4/h8d
         iGeGLKC8A9H09XsPaNazFDNa6zsljnykZyaVz7lGi4pYtbwj1Wh5oiWLStc613VxHVb6
         TP9X0MP7+gXZQGMrijEyv2vDXdyOuI3rU5P6lhc9IDz/hntaz55BaL8mnrfC11k9CejW
         fCwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783301376; x=1783906176;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U2HcuA7JHhVqg4nnVOcfr5tQLclMpm2XqQgpx/8U7dU=;
        b=kZvM8+v9xiowMCqrqwXugHVJOIF2zcV9o3+RavufXoEHvw3yzp3KNKNfSl0Smsxhik
         4Umhmw05YbYzaTQvLm2vrz/YgdATyLTQmjisGRS5S8rDo3+Db4rwmUQ3bEt5qrzOZAxk
         jzywDhAYYY+teKY647DxeqwV1HK8ACqrZ3XQGhpalUoJiWuA5L/1YlSRoztTS7usWtxp
         7neVGQ2cjpKasBZRVItDxepe35a/NVywY/w18F0cA7aC7syo8Bgc0nSvOZtQ78E5wFgC
         jbUiIlw9xVTfR+EKjKTJLD8SjMkHLSGRNya2H0ZcbwnckMLy1WqDjn1vg+8eLpru0qOA
         M3Ig==
X-Forwarded-Encrypted: i=1; AHgh+Rosm+BN2kwWXHKLahtw8QnEA+pkrIym/5CNfXott8wgDVBHDOSFN8kDZ2qcEODDBJI3Qy3WNQflVQBskeXF3NQP@lists.infradead.org
X-Gm-Message-State: AOJu0YwUWljNoL/EsXu2/p7uGZQPo+QvStqrIlDvc1QK7d9bCkfGoLHq
	dzWp8owYLQOMLH43YWLzMaeIOYP1jF1NE0CsWZm5iIpO3Yh0mr3LBmji
X-Gm-Gg: AfdE7cm2rpOR3qUaAeVjxEZg54TVskXrEKlu48MrXsZ67k44BmehKWhD0nZPMFzu6/1
	EV7Gn6VkYG6emJgGkiuRzlo9cGayR6Qt0F4sqksPNermaHziuxTfTRiMSd67Vrh4tmL8CqtUHi9
	SIj9za0wwHljgKuzViHYRk6S2pnljBOmXJ0hfZSZP4dA4bA4QwCwU84jB6sfp6aoVSAKsmradQ1
	M2UcxNRXCrzrN+e5iMKY9HRocLvc+4aKCfNlNYQvvFwl1HvVO5hopnH3rCj4JVJy2SpZOECSRpq
	qjk27lQ1N3xjrL3TYjBBDF5JSVFKEv/nNM1bvv7Jjgzc669oAAVFP8Lv8KjszK9yg64z4ixohUX
	fApUpNEDScYlCAYaTOIQCeDB9QHsVMjxrlmDgFW3g4XwhqukUf73NSZP0Heonbxv1CWbr7Otuok
	JvJVU6lCrFgnIfVSFMUmBERwhqzZn6dNR5Ol1c8U/j1FxZJaEfEN/o1d1Xg25fMBqyXRFLDRnxy
	co=
X-Received: by 2002:a05:6a20:b40b:b0:3bf:6222:2e7e with SMTP id adf61e73a8af0-3c03e1a2cf7mr8436370637.4.1783301376215;
        Sun, 05 Jul 2026 18:29:36 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:bf6:81d1:bcfe:9d1c])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7ef5b3sm63084524c88.1.2026.07.05.18.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 18:29:35 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sun, 05 Jul 2026 18:29:24 -0700
Subject: [PATCH 7/7] ARM: orion5x: ts409: convert gpio-keys to use software
 nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-orion-mv78xx0-swnode-v1-7-07d95ef4f447@gmail.com>
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
X-CRM114-CacheID: sfid-20260705_182937_144468_9AE722F2 
X-CRM114-Status: GOOD (  16.09  )
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

Convert the QNAP TS-409 board setup from legacy gpio_keys_platform_data
to software nodes. The gpio-keys platform device is registered with
static software node properties and button configurations.

Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 arch/arm/mach-orion5x/ts409-setup.c | 69 ++++++++++++++++++++++++-------------
 1 file changed, 45 insertions(+), 24 deletions(-)

diff --git a/arch/arm/mach-orion5x/ts409-setup.c b/arch/arm/mach-orion5x/ts409-setup.c
index 725688aa5cba..6758aebd327b 100644
--- a/arch/arm/mach-orion5x/ts409-setup.c
+++ b/arch/arm/mach-orion5x/ts409-setup.c
@@ -17,10 +17,12 @@
 #include <linux/mtd/physmap.h>
 #include <linux/mv643xx_eth.h>
 #include <linux/leds.h>
-#include <linux/gpio_keys.h>
+#include <linux/gpio/property.h>
+#include <linux/property.h>
 #include <linux/input.h>
 #include <linux/i2c.h>
 #include <linux/serial_reg.h>
+#include <plat/orion-gpio.h>
 #include <asm/mach-types.h>
 #include <asm/mach/arch.h>
 #include <asm/mach/pci.h>
@@ -214,32 +216,47 @@ static struct platform_device ts409_leds = {
 #define QNAP_TS409_GPIO_KEY_RESET	14
 #define QNAP_TS409_GPIO_KEY_MEDIA	15
 
-static struct gpio_keys_button qnap_ts409_buttons[] = {
-	{
-		.code		= KEY_RESTART,
-		.gpio		= QNAP_TS409_GPIO_KEY_RESET,
-		.desc		= "Reset Button",
-		.active_low	= 1,
-	}, {
-		.code		= KEY_COPY,
-		.gpio		= QNAP_TS409_GPIO_KEY_MEDIA,
-		.desc		= "USB Copy Button",
-		.active_low	= 1,
-	},
+static const struct software_node qnap_ts409_gpio_keys_node = {
+	.name = "qnap-ts409-gpio-keys",
 };
 
-static struct gpio_keys_platform_data qnap_ts409_button_data = {
-	.buttons	= qnap_ts409_buttons,
-	.nbuttons	= ARRAY_SIZE(qnap_ts409_buttons),
+static const struct property_entry qnap_ts409_reset_key_props[] = {
+	PROPERTY_ENTRY_U32("linux,code", KEY_RESTART),
+	PROPERTY_ENTRY_GPIO("gpios", &orion_gpio_swnodes[0],
+			    QNAP_TS409_GPIO_KEY_RESET, GPIO_ACTIVE_LOW),
+	PROPERTY_ENTRY_STRING("label", "Reset Button"),
+	{ }
 };
 
-static struct platform_device qnap_ts409_button_device = {
-	.name		= "gpio-keys",
-	.id		= -1,
-	.num_resources	= 0,
-	.dev		= {
-		.platform_data	= &qnap_ts409_button_data,
-	},
+static const struct software_node qnap_ts409_reset_key_node = {
+	.parent = &qnap_ts409_gpio_keys_node,
+	.properties = qnap_ts409_reset_key_props,
+};
+
+static const struct property_entry qnap_ts409_copy_key_props[] = {
+	PROPERTY_ENTRY_U32("linux,code", KEY_COPY),
+	PROPERTY_ENTRY_GPIO("gpios", &orion_gpio_swnodes[0],
+			    QNAP_TS409_GPIO_KEY_MEDIA, GPIO_ACTIVE_LOW),
+	PROPERTY_ENTRY_STRING("label", "USB Copy Button"),
+	{ }
+};
+
+static const struct software_node qnap_ts409_copy_key_node = {
+	.parent = &qnap_ts409_gpio_keys_node,
+	.properties = qnap_ts409_copy_key_props,
+};
+
+static const struct software_node * const qnap_ts409_gpio_keys_swnodes[] __initconst = {
+	&qnap_ts409_gpio_keys_node,
+	&qnap_ts409_reset_key_node,
+	&qnap_ts409_copy_key_node,
+	NULL
+};
+
+static const struct platform_device_info qnap_ts409_button_info __initconst = {
+	.name	= "gpio-keys",
+	.id	= PLATFORM_DEVID_NONE,
+	.swnode	= &qnap_ts409_gpio_keys_node,
 };
 
 /*****************************************************************************
@@ -271,6 +288,8 @@ static unsigned int ts409_mpp_modes[] __initdata = {
 
 static void __init qnap_ts409_init(void)
 {
+	int err;
+
 	/*
 	 * Setup basic Orion functions. Need to be called early.
 	 */
@@ -296,7 +315,9 @@ static void __init qnap_ts409_init(void)
 	orion5x_uart0_init();
 	orion5x_uart1_init();
 
-	platform_device_register(&qnap_ts409_button_device);
+	err = software_node_register_node_group(qnap_ts409_gpio_keys_swnodes);
+	if (!err)
+		platform_device_register_full(&qnap_ts409_button_info);
 
 	/* Get RTC IRQ and register the chip */
 	if (gpio_request(TS409_RTC_GPIO, "rtc") == 0) {

-- 
2.55.0.rc0.799.gd6f94ed593-goog


