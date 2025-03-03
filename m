Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3CA9C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 21:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1pvaaqiA/SmRoJNAwsNTHeXGNX/6oeYrcqiqLNPnA9o=; b=lie3Ngcx50AYi6Zl1XSiDVPUIB
	YHlL6q2NXW3U9GKGjdxykey/DvTyY7otskXx97m0zxgvbiiRX4R+VNc4g59eGMdwe97TtUCCrH7KR
	VXoVajeEE3tPX4WYyGHMT5DfPSzdMvUttHdijKE51htLak5MzI//cnLVk088A/OVyJMAFD1nf+6VA
	645WP88O84adJQ5dH9pzqAwZ9JOyi8AvARjCRLrj2yY3JkFqUq6BomgLPLnpRUnMagns7XFc66Fpk
	V/gBJGceNop/vbFedFdMdbTQZ5OA6Imc244LH+u0Ak744kM0dpHnmzHatzIHT8ZuGo+3qktA2WOKD
	RagFlM+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpCzG-00000002KHD-1lEp;
	Mon, 03 Mar 2025 21:06:06 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpCoV-00000002Hvn-1Yci
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 20:55:00 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-5e539ea490dso2235445a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 12:54:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741035298; x=1741640098; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1pvaaqiA/SmRoJNAwsNTHeXGNX/6oeYrcqiqLNPnA9o=;
        b=b8cvlmbvkptnYrVJV70BJXC4VkmLjLjS6MT2TbfwsJZA+mqXDIwjYcesYFqgXhYPy4
         xeQfMlTgL7qOk7E2nOVa4SoOUTDkDVfntJ/3QNUVrUvYP1eMJTBtTgY839JiV9Ep+vTr
         ow7+cwpI3d0FfvnAWOIz3U07jZDQ5BZ9Lngz77GsCZU2CxCIGuNMDEe9KvnechQS1nbd
         cxt8w5B1gH+NCMlqyHj4y8o4TsQ0CVXhzPgAUA1u3JsHcW3vOD0UNCvjW55u+5s7Ojhm
         ogTWdwFdvqyP93/lRxan2OxY5eghtLOd/77WgGSRuVxm8/ipizMr0TNwuSCGSJt8qfit
         XMhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741035298; x=1741640098;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1pvaaqiA/SmRoJNAwsNTHeXGNX/6oeYrcqiqLNPnA9o=;
        b=tIwlLDZXZ5ilxPB6sJhFWVoNLVtaEoEy3phwMRD29MVHNMVe0r6d0gnOHNZExMrSHU
         LNnDM8wqhAKwKEYeHU6OU6KYAljTtQxpucVaMKW8MkQ1bCKD1yN1Nvigg546tfYbfCy6
         PNNZtOb2ggLIqLLYnUu2sfdIHJM8uYDu0/l44K0ygNCl2Wy4JE7uyDYfV1sO2uDoLwI8
         q3KEYqsST/g3xj7h5BoH+fBniXVtiv3EMR6c5sRH/kusBCOdxkzQ6Cx2HKJKQw/7nbXC
         PFUUexwgSywo9+U5wJqtHptgFdlzl8i2/UaAh2uu9dDLeiyCTRisANdQnSb9PpVDfeH1
         nTow==
X-Forwarded-Encrypted: i=1; AJvYcCU6QYT1xRIPtJypiMv7L0omX/oOnSVWdl9KiV5tHluNCVhmBeZUxN8c9ckAyVKahEqQDvlW9g7A24mtEea5Ov2A@lists.infradead.org
X-Gm-Message-State: AOJu0YwStrJs3G0yos0WEBONBs4gdhr8LwgowcN/dm/jESm443iEyczl
	RDNvFTf3HVJMHM2ZIOpVW1gv7r444+QC7b4wdbK1sVJF9A0JaTh1
X-Gm-Gg: ASbGncuGwn36FzB8OCywkxAAhUEq+tp5jZCinDM4J3uWR2cPp5KL4Kazbn9zYXuhuU8
	Lo2CaxAEUWG0ZZ3ZKSCf1PdNTmaAOeWI++LKIw/a299ZSmeLC2BcKaqktdHoqRxrYwvhxaRn2Yx
	Hjds85cqWKRkGw8ksjDa6DDjqpP2d6kkpfPwuFCF6I5E3nED5vfMC4slX60ivT1zBGPI3pZkPSQ
	AkPWgF7Awi01rVvmje3dUN3GndifwOpfUMh4mNrLGaUxlTznw2xBSY4K8rGjiz9UQJc8jKNcSOy
	7XpqKa9OxvoeVDkdO/7cMCBFoijjF/wEFe+JuwgF45KjEhaXucvz8/YR6sMmO4OBFLM6ukgfsiE
	aysuLxWuxUGk34DY=
X-Google-Smtp-Source: AGHT+IGL2YA/WqHKHuyosoZ0FTICgI26SVWArz7fch8CvYRnNoLDjfA4RUT/Cs6K1TVfnuAovJQnFQ==
X-Received: by 2002:a05:6402:274b:b0:5e4:d2c9:456c with SMTP id 4fb4d7f45d1cf-5e4d6b4c7c3mr40715184a12.22.1741035297448;
        Mon, 03 Mar 2025 12:54:57 -0800 (PST)
Received: from hex.my.domain (83.8.122.142.ipv4.supernova.orange.pl. [83.8.122.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf76063ab8sm266955566b.73.2025.03.03.12.54.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 12:54:57 -0800 (PST)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Mon, 03 Mar 2025 21:54:51 +0100
Subject: [PATCH v3 6/6] ARM: dts: bcm2166x: Add bcm2166x-pinctrl DTSI
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-bcm21664-pinctrl-v3-6-5f8b80e4ab51@gmail.com>
References: <20250303-bcm21664-pinctrl-v3-0-5f8b80e4ab51@gmail.com>
In-Reply-To: <20250303-bcm21664-pinctrl-v3-0-5f8b80e4ab51@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741035289; l=7006;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=PoeeTQAJjZ5RdKFBcSwIbKAekpRiUcC0+f84D/Pj5vE=;
 b=lHUpV2T1pqdq8Pcb9K+DP254BYkt0/S/jSk0n0VTwrRBdmPVBfNHMbAxri/uC1tu3CHQI2caz
 c6viWOIlAi+BMpIX9XMVgs0a/SDMcc0/RT4lgaP9vMu3qC8toLDnBLR
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_125459_416317_A46D9A51 
X-CRM114-Status: GOOD (  15.38  )
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


