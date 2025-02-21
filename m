Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCC48C021B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 20:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1pvaaqiA/SmRoJNAwsNTHeXGNX/6oeYrcqiqLNPnA9o=; b=uVZt4mQ7Qif0NQQKimUdY7wfGW
	tZW2+SZsiTJJhNFSxc8nO31fxCKRJw/tbqXrH/mhYYQ1RZPyImALEJDR2T3uIc0EgOqvN6RVLyAHn
	zG+E6bq/ELXR+y/3P08SAoc0oKAJpNxqDn4ufRFBWCGh8DMxKfcIULcem05AY7JHr1SsiaOEtKHJ9
	7+RlIfpKd5F2U9e/C3fGM56Mm3+RFHGFETRQhl4B+X+MxHFmsD6pfbUu4DbCgfqRID7l7q3kQAFwk
	y6SmS3lSa7OACKROTdhsfaWMi/ab0aiUX/DJokTfizViMZOQxBhGB/PvfcSaAkGLWVggbGFgRm6yJ
	FMiIDnYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlZrm-00000006pm9-3dDG;
	Fri, 21 Feb 2025 20:43:22 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlZhe-00000006nsS-2q5t
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 20:32:56 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-5e095d47a25so4848081a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Feb 2025 12:32:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740169973; x=1740774773; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1pvaaqiA/SmRoJNAwsNTHeXGNX/6oeYrcqiqLNPnA9o=;
        b=EwrbQfqqz1BcZdgNpCeKoDJgdX0snfIsnAap0JQPLARKAz1sL7+Wo47qFKxk3/Z2js
         YbRmQN5s6DXf9TfEw5zbkPUJwYb9E8tI9Y794wb7E8QLXbIeyJC7TGXobeFPlD1lOpWr
         9yKXNgx18eJP2K0owiFSBsu2DSAAe+LVaIwVOsKPEOMz7ZqbvlT+70h9buakrVc/QlHZ
         PADkI2wlJ3D0i9S4EiHfmMSY+vbFHh/s+hZocLvu/3UHuiiJQk2RhfljHhVuJ5PqRZEI
         uOLWdqAN2Mkglr7evQRF6Vhsppl0/YPnwEUl4kDBBQAMxwaynYAd5VGly8rD/cgFXb3k
         x/Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740169973; x=1740774773;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1pvaaqiA/SmRoJNAwsNTHeXGNX/6oeYrcqiqLNPnA9o=;
        b=KcF3I1RxbsDt9DP2dAm30jELEg9X01rJTb/ig27FqC/O2zVPO9xXmWRGzIDFgQeY7b
         duY7E/i9UCQNLAPXcuO73r8zWdJSOU21WS7o6i+e20abikd/U/zMKHgVB/7KRHlHK5W6
         aqY4QHbYgKstQfLcBxPXVEh3UL2XIuBUSDugt/He0b8XKu5EdjaQRb/YNj2ke6OlWBUj
         5F5ygnggaGGwYqGwObSKXFZ5WXDBWe0w66JVvc4qPA4hNwX0g8AC08Neg/cnDY37phH4
         iOEDoqXB4MOl5ipzNQM19wquC8S2sveO9rCNGG0rFegsRMZIwMMPfL5a+Wh69qH5hqAK
         I0xQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqSD5BJ1CQcD6bMnl1GdK1HFCzGJ4Gm69bBm8Pps3rFJfpx7pACF14NLmwoCRy68xWPN9KSe9qvnGp0QvdImdO@lists.infradead.org
X-Gm-Message-State: AOJu0YxgdGwK5jQRO9jXQWZd7OXbteAEeEAqvjqE9Ml6nsKEFU+X6Ut9
	kRw30AypGiOTyXE7qlDArWOt+XAEWnHyPCgZWDUg1/GXppGkYwPU
X-Gm-Gg: ASbGncukWxMFUTc+McdKuAz6LGL1DdOudu+/bqM3Ple6wQ32rYtPLXitXsq4PAem06D
	ClNRyHOYvujzgnoxNQbBPPPvZm6ASK5pSZ5TxJEgyC3Oo8er8dqtwTfiHZqolhuF9BbM0yfJNcI
	LXNE5tu7FyJRfIKRWSugsyAMWmkoqhEfJJ594KbxGDre6c4Mrw2/k2zwNQpjn8qGioOzU4CBZBN
	VR8DgIuxoGyYvOJBA6qKJWCx3u6wHlZJQbJCiAYXRl2OE/Kunq2IjM5YmqGVAl5JI9fu6ZCqqHD
	OWjt+T3JC+38uhzQ3q1LRpmM6VkHAglRTZogo6mcJ2rEZ/umFzp+wHZNiMp9fsRBKDGU3zlw
X-Google-Smtp-Source: AGHT+IG8svSNh/gYeOBTqhQ8L5Z26mBOThRhLDOKdDTtl2i++2iJPATf7jNc/coLmYedzNMKZxPuAA==
X-Received: by 2002:a05:6402:5192:b0:5de:4f37:e59c with SMTP id 4fb4d7f45d1cf-5e0b724782amr4219796a12.31.1740169972869;
        Fri, 21 Feb 2025 12:32:52 -0800 (PST)
Received: from hex.my.domain (83.8.202.192.ipv4.supernova.orange.pl. [83.8.202.192])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece1c418bsm14653485a12.24.2025.02.21.12.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 12:32:52 -0800 (PST)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Fri, 21 Feb 2025 21:32:42 +0100
Subject: [PATCH v2 6/6] ARM: dts: bcm2166x: Add bcm2166x-pinctrl DTSI
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250221-bcm21664-pinctrl-v2-6-7d1f0279fe16@gmail.com>
References: <20250221-bcm21664-pinctrl-v2-0-7d1f0279fe16@gmail.com>
In-Reply-To: <20250221-bcm21664-pinctrl-v2-0-7d1f0279fe16@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Stanislav Jakubek <stano.jakubek@gmail.com>, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Artur Weber <aweber.kernel@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740169959; l=7006;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=PoeeTQAJjZ5RdKFBcSwIbKAekpRiUcC0+f84D/Pj5vE=;
 b=zlHYkjc9MveY75Vzf279SZEL8zo1UrW74RttN4qfEkj8EQd/GvUY6pm98QsjvEAOjreBhiXbx
 /0PJXFlhOgeACkWOYaL/NeOugqp7mwMACJ6zcDULsBLMj7+0miqiOkn
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_123254_720483_21870C45 
X-CRM114-Status: GOOD (  15.07  )
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

Add common DTSI with common pin control configs for BCM21664/BCM23550
and include it in bcm2166x-common.dtsi. The configs are kept in a
separate DTSI to keep things cleaner (pin config definitions take up
quite a lot of space).

Currently contains pins for BSC buses and SD/MMC; more pins can be
added in the future.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
 arch/arm/boot/dts/broadcom/bcm2166x-common.dtsi  |   2 +
 arch/arm/boot/dts/broadcom/bcm2166x-pinctrl.dtsi | 297 +++++++++++++++++++++++
 2 files changed, 299 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm2166x-common.dtsi b/arch/arm/boot/dts/broadcom/bcm2166x-common.dtsi
index d4b412ac8b0343bd3773f50c59a20fa00a3923f8..f535212cb52fec0668abfc06e7268bead70d958a 100644
--- a/arch/arm/boot/dts/broadcom/bcm2166x-common.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2166x-common.dtsi
@@ -337,3 +337,5 @@ master_ccu: master_ccu@3f001000 {
 		};
 	};
 };
+
+#include "bcm2166x-pinctrl.dtsi"
diff --git a/arch/arm/boot/dts/broadcom/bcm2166x-pinctrl.dtsi b/arch/arm/boot/dts/broadcom/bcm2166x-pinctrl.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..51b8730c8feea501f2c5ca6a7bad8233ed708c82
--- /dev/null
+++ b/arch/arm/boot/dts/broadcom/bcm2166x-pinctrl.dtsi
@@ -0,0 +1,297 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Common pinmux configrations for BCM2166x (BCM21664/BCM23550).
+ *
+ * Copyright (C) 2025 Artur Weber <aweber.kernel@gmail.com>
+ */
+
+&pinctrl {
+	/* BSC1 */
+	bsc1_pins: bsc1-pins {
+		bsc1clk-grp0 {
+			pins = "bsc1clk";
+			function = "alt1"; /* BSC1CLK */
+		};
+
+		bsc1dat-grp0 {
+			pins = "bsc1dat";
+			function = "alt1"; /* BSC1DAT */
+		};
+	};
+
+	/* BSC2 */
+	bsc2_pins: bsc2-pins {
+		bsc2clk-grp0 {
+			pins = "gpio16";
+			function = "alt2"; /* BSC2CLK */
+		};
+
+		bsc2dat-grp0 {
+			pins = "gpio17";
+			function = "alt2"; /* BSC2DAT */
+		};
+	};
+
+	/* BSC3 */
+	bsc3_pins: bsc3-pins {
+		bsc3clk-grp0 {
+			pins = "lcdscl";
+			function = "alt1"; /* BSC3_CLK */
+		};
+
+		bsc3dat-grp0 {
+			pins = "lcdsda";
+			function = "alt1"; /* BSC3_SDA */
+		};
+	};
+
+	/* BSC4 */
+	bsc4_pins: bsc4-pins {
+		bsc4clk-grp0 {
+			pins = "lcdres";
+			function = "alt1"; /* BSC4_CLK */
+		};
+
+		bsc4dat-grp0 {
+			pins = "lcdte";
+			function = "alt1"; /* BSC4_SDA */
+		};
+	};
+
+	/* PMBSC */
+	pmbsc_pins: pmbsc-pins {
+		pmbscclk-grp0 {
+			pins = "pmbscclk";
+			function = "alt1"; /* PMBSCCLK */
+		};
+
+		pmbscdat-grp0 {
+			pins = "pmbscdat";
+			function = "alt1"; /* PMBSCDAT */
+		};
+	};
+
+	/* SD */
+	sd_width1_pins: sd-width1-pins {
+		sdck-grp0 {
+			pins = "sdck";
+			function = "alt1"; /* SDCK */
+			bias-disable;
+		};
+
+		sdcmd-grp0 {
+			pins = "sdcmd";
+			function = "alt1"; /* SDCMD */
+			bias-pull-up;
+		};
+
+		sddat-grp0 {
+			pins = "sddat0";
+			function = "alt1"; /* SDDATx */
+			bias-pull-up;
+		};
+	};
+
+	sd_width4_pins: sd-width4-pins {
+		sdck-grp0 {
+			pins = "sdck";
+			function = "alt1"; /* SDCK */
+			bias-disable;
+		};
+
+		sdcmd-grp0 {
+			pins = "sdcmd";
+			function = "alt1"; /* SDCMD */
+			bias-pull-up;
+		};
+
+		sddat-grp0 {
+			pins = "sddat0", "sddat1", "sddat2", "sddat3";
+			function = "alt1"; /* SDDATx */
+			bias-pull-up;
+		};
+	};
+
+	/* SD1 */
+	sd1_width1_pins: sd1-width1-pins {
+		sd1ck-grp0 {
+			pins = "mmc1dat7";
+			function = "alt6"; /* SD1CK */
+			bias-disable;
+		};
+
+		sd1cmd-grp0 {
+			pins = "spi0txd";
+			function = "alt2"; /* SD1CMD */
+			bias-pull-up;
+		};
+
+		sd1dat0-grp0 {
+			pins = "mmc1dat5";
+			function = "alt6"; /* SD1DAT0 */
+			bias-pull-up;
+		};
+	};
+
+	sd1_width4_pins: sd1-width4-pins {
+		sd1ck-grp0 {
+			pins = "mmc1dat7";
+			function = "alt6"; /* SD1CK */
+			bias-disable;
+		};
+
+		sd1cmd-grp0 {
+			pins = "spi0txd";
+			function = "alt2"; /* SD1CMD */
+			bias-pull-up;
+		};
+
+		sd1dat0-grp0 {
+			pins = "mmc1dat5";
+			function = "alt6"; /* SD1DAT0 */
+			bias-pull-up;
+		};
+
+		sd1dat1-grp0 {
+			pins = "gpio93";
+			function = "alt1"; /* SD1DAT1 */
+			bias-pull-up;
+		};
+
+		sd1dat2-grp0 {
+			pins = "gpio94";
+			function = "alt1"; /* SD1DAT2 */
+			bias-pull-up;
+		};
+
+		sd1dat3-grp0 {
+			pins = "mmc1dat3";
+			function = "alt6"; /* SD1DAT3 */
+			bias-pull-up;
+		};
+	};
+
+	/* MMC0 */
+	mmc0_width1_pins: mmc0-width1-pins {
+		mmc0ck-grp0 {
+			pins = "mmc0ck";
+			function = "alt1"; /* MMC0CK */
+			bias-disable;
+		};
+
+		mmc0cmd-grp0 {
+			pins = "mmc0cmd";
+			function = "alt1"; /* MMC0CMD */
+			bias-pull-up;
+		};
+
+		mmc0dat-grp0 {
+			pins = "mmc0dat0";
+			function = "alt1"; /* MMC0DATx */
+			bias-pull-up;
+		};
+	};
+
+	mmc0_width4_pins: mmc0-width4-pins {
+		mmc0ck-grp0 {
+			pins = "mmc0ck";
+			function = "alt1"; /* MMC0CK */
+			bias-disable;
+		};
+
+		mmc0cmd-grp0 {
+			pins = "mmc0cmd";
+			function = "alt1"; /* MMC0CMD */
+			bias-pull-up;
+		};
+
+		mmc0dat-grp0 {
+			pins = "mmc0dat0", "mmc0dat1", "mmc0dat2", "mmc0dat3";
+			function = "alt1"; /* MMC0DATx */
+			bias-pull-up;
+		};
+	};
+
+	mmc0_width8_pins: mmc0-width8-pins {
+		mmc0ck-grp0 {
+			pins = "mmc0ck";
+			function = "alt1"; /* MMC0CK */
+			bias-disable;
+		};
+
+		mmc0cmd-grp0 {
+			pins = "mmc0cmd";
+			function = "alt1"; /* MMC0CMD */
+			bias-pull-up;
+		};
+
+		mmc0dat-grp0 {
+			pins = "mmc0dat0", "mmc0dat1", "mmc0dat2", "mmc0dat3",
+			       "mmc0dat4", "mmc0dat5", "mmc0dat6", "mmc0dat7";
+			function = "alt1"; /* MMC0DATx */
+			bias-pull-up;
+		};
+	};
+
+	/* MMC1 */
+	mmc1_width1_pins: mmc1-width1-pins {
+		mmc1ck-grp0 {
+			pins = "mmc1ck";
+			function = "alt1"; /* MMC1CK */
+			bias-disable;
+		};
+
+		mmc1cmd-grp0 {
+			pins = "mmc1cmd";
+			function = "alt1"; /* MMC1CMD */
+			bias-pull-up;
+		};
+
+		mmc1dat-grp0 {
+			pins = "mmc1dat0";
+			function = "alt1"; /* MMC1DATx */
+			bias-pull-up;
+		};
+	};
+
+	mmc1_width4_pins: mmc1-width4-pins {
+		mmc1ck-grp0 {
+			pins = "mmc1ck";
+			function = "alt1"; /* MMC1CK */
+			bias-disable;
+		};
+
+		mmc1cmd-grp0 {
+			pins = "mmc1cmd";
+			function = "alt1"; /* MMC1CMD */
+			bias-pull-up;
+		};
+
+		mmc1dat-grp0 {
+			pins = "mmc1dat0", "mmc1dat1", "mmc1dat2", "mmc1dat3";
+			function = "alt1"; /* MMC1DATx */
+			bias-pull-up;
+		};
+	};
+
+	mmc1_width8_pins: mmc1-width8-pins {
+		mmc1ck-grp0 {
+			pins = "mmc1ck";
+			function = "alt1"; /* MMC1CK */
+			bias-disable;
+		};
+
+		mmc1cmd-grp0 {
+			pins = "mmc1cmd";
+			function = "alt1"; /* MMC1CMD */
+			bias-pull-up;
+		};
+
+		mmc1dat-grp0 {
+			pins = "mmc1dat0", "mmc1dat1", "mmc1dat2", "mmc1dat3",
+			       "mmc1dat4", "mmc1dat5", "mmc1dat6", "mmc1dat7";
+			function = "alt1"; /* MMC1DATx */
+			bias-pull-up;
+		};
+	};
+};

-- 
2.48.1


