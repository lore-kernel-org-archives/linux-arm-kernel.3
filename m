Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0361C0219C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 20:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1pvaaqiA/SmRoJNAwsNTHeXGNX/6oeYrcqiqLNPnA9o=; b=S9tXW3p6h1PKAvMbX1xuvSLzX3
	bqcM9EwWLd0glz0MidONRFBfKEst1ngAIt0P6cM0KA9ayG7KNg4ufu4lGMWe2teqPTBVGG7XVzp2U
	kPHC9BTXRJrBW6lZ9reCH+5H5nj/Jacmw6H5XPVgocfYFsYLGrLrZjYRfPiCR2Osnkl1zQpC239h9
	wVf3JcxYQ2Ch3LGGDPwduMOiC1byxjUn6/FcJsWM9W0ADJ7oAzfFH4pbZHNU5yEH63rMEzd14S/3F
	knh1+fyFVM6/kyDwGxjPIdZQ/X4cxGo0icN6FKnvTQ80rzQXbaP3A5cUFOAfFRfNrFk9PNs4Wli1w
	RA3oXTAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgUzM-0000000B4zy-3gBs;
	Fri, 07 Feb 2025 20:30:12 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgUZ2-0000000B0Qd-1vhI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 20:03:01 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5dced61e5a3so4502856a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Feb 2025 12:03:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738958579; x=1739563379; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1pvaaqiA/SmRoJNAwsNTHeXGNX/6oeYrcqiqLNPnA9o=;
        b=NUEf5kitgZ6xzd73TxAesadS7BTtPGKIPLFb2kQ1ufp9onwO82mNLT1Ta7mtqg3V8/
         i8qjrtb6BMv+u1BaGhAJTEuspMvVQiXP0JDbzcwTsQbqCmqqSP9NRinIuORtTysn2EFk
         LwXgAnyVGuk9NTb4enaMRL5i7ww2Ivx66w1sj3nfdofYfz2IG5HTqwIqm98ctxUHc08B
         oaMeNLZJ3rdhFwHCUBFcf78ALdRWTCyX4Axl5iiORqhEG+noTyWF6l5X6+tHbmJsfhQJ
         hnnUIzQ94TmAClwpCWhk+503P9AMYWwZfqSpZtGVRROsIfApUgjD9YE5pGxPZK+Hk3N9
         4W6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738958579; x=1739563379;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1pvaaqiA/SmRoJNAwsNTHeXGNX/6oeYrcqiqLNPnA9o=;
        b=JrOBlg13K9P+fw/zUQ0dLGzf2zh1nPV+abVnHTAuHqzKvc1rWB0hIEmxmdQt86znKq
         aGEpyv5SU0qMGLc7XOMwmSe0tgc0Gwstcv9yS0HNf54vI7XilGalA6leeee0OkXlZNEm
         N23XOeU+4lfBtFLVJbcz2bm4u18HxLC4lYjpdbwXmVmcQYr3f8gYHc9c6SlPmLZd05i/
         obkV/Ds8Y9RS8RiVqDbM0QWsZFL7JJgTJGu5Mg01DJGXm+ub2NfJhWZyL7QTvjyhIPD7
         h6gtKWdStVnDYPI3C7NFN2I4nf2hoYWoyu4jq7u9Yu4yxK/XX69ER3sg+LjeEH7B/T9H
         GudQ==
X-Forwarded-Encrypted: i=1; AJvYcCViQzrMndZLDAUP+V8Sdp0Dsq3Tn+vX4AXolREB1LoyK87m66fLaa1HM1wxSp5zVmT0YTi2obv96qMIIAqcI8EX@lists.infradead.org
X-Gm-Message-State: AOJu0YwaRea0nKah2AjLcKjcW/xApqxio+Br25kppFLcnyXM2dQhJHbY
	qXy03vgCI5aZP7HzkcrjSYRGwtWQh/rmxIiZtFcO/0HOO5ukyVkv
X-Gm-Gg: ASbGncs+8ieGSZwqACQD6m2Dsm3Q9OHz0n4NkquXjLKo9dKuwsWti4uBNlc1LYwhmD1
	ps9HPDJBU/0fNoYmzW7Ms9Gj9wcqrUE/HgjcvlROJnrq4hmQk5VhiKzBWiDh6Ep8EqNmdijoScj
	W+GTjiy8oW4nxKCXZMIPggKPb/eJFzxVU0z4fDeaZocrxG7kUl+NBSGSaNK16kv0AyeYQdzorTd
	GKkgiUU0bnbcSTQSo5pOxdqIuul/+4d1tZxZzhYybOmuge9HR2GvCDdRUw2mfim4ZkwecuqwTlz
	d6K11wYXKqr89vbmo0CIXJq4o6HKgJHhFbk0C0kIyCwZsvk8knxZAuBx
X-Google-Smtp-Source: AGHT+IE4QF7IVhoaNhrO3jS9kTfFrHnXGutu8tKTKQs8oJYJmgx7PdCZKkvctu+cUBQJ84rNlQSPwQ==
X-Received: by 2002:a05:6402:5202:b0:5dc:74fd:abf0 with SMTP id 4fb4d7f45d1cf-5de45070621mr6028965a12.15.1738958578486;
        Fri, 07 Feb 2025 12:02:58 -0800 (PST)
Received: from hex.my.domain (83.8.206.8.ipv4.supernova.orange.pl. [83.8.206.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5de59f893ebsm256797a12.45.2025.02.07.12.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 12:02:58 -0800 (PST)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Fri, 07 Feb 2025 21:02:46 +0100
Subject: [PATCH 7/7] ARM: dts: bcm2166x: Add bcm2166x-pinctrl DTSI
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250207-bcm21664-pinctrl-v1-7-e7cfac9b2d3b@gmail.com>
References: <20250207-bcm21664-pinctrl-v1-0-e7cfac9b2d3b@gmail.com>
In-Reply-To: <20250207-bcm21664-pinctrl-v1-0-e7cfac9b2d3b@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Christian Daudt <bcm@fixthebug.org>, Sherman Yin <syin@broadcom.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Stanislav Jakubek <stano.jakubek@gmail.com>, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Artur Weber <aweber.kernel@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738958562; l=7006;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=PoeeTQAJjZ5RdKFBcSwIbKAekpRiUcC0+f84D/Pj5vE=;
 b=3SwA1y2LTND27CT78fpcsbZg+FtSHEAc3BBHVRg7suIc10IJeHBu/J6a3bYG73aCy+5q8lI0j
 iqru4LSW8KUC3c4ZmUd1dEGY39q+Apw1eYtlE1kglnfu3ADK+nTj1OQ
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_120300_505706_7A64FBC7 
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


