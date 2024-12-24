Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6E83E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Dec 2024 08:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PPDkySt8SMBgbwI9GqZ74rsS7zUg5mbUT5R3oUQV3Ts=; b=hdJqvpaYyeffKdDiDbHqYjhv4F
	UKkyoAtaSmgXN/LafsUPmDDZKsePNven46n8HzeehEyvK4PqlI3b3JZ2D7kPfyiWZF9lZYsjw31mm
	yaj5h7l0S/8lY9xWAoJqm26PdYk0OTyn9/EFPuhxd5cMr6PyUERsGiVqJM/y1X+r068XRogOI4EUQ
	A0dEbkwT/H/4T10TNSzr38Gs1hWU44skMeyPcossqnKrFRKShet7jTt6tt1YIdO6UHuLaHUVgyp1C
	K4aYZ+l89Jnq7hkn02MfI9H/R3TqDyCccTsRPQSBY4Bh8QndyxzVTmDQ7nmgS3eOxj+5k7tqrxG6X
	taFtNVmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ0dE-0000000BXAR-1yLo;
	Tue, 24 Dec 2024 08:51:12 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ0au-0000000BWq8-3VRQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Dec 2024 08:48:49 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-21680814d42so45753155ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Dec 2024 00:48:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1735030128; x=1735634928; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PPDkySt8SMBgbwI9GqZ74rsS7zUg5mbUT5R3oUQV3Ts=;
        b=kLQ4oxjNTsUjyR3BXlcHzTR6DXLg7lO4VrpnwhPwbibh/43EZ2+e2C/vvWCqQJMzhF
         Lvl+yJJFQnTzquLi/fP++XUMq8Jgo52qacHUB7GUeUt32MxTVucrJZYPgo5MJE/NodMJ
         uVpq0prqImuqOTV6o9AuVA/NwvZwSdcegEgmw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735030128; x=1735634928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PPDkySt8SMBgbwI9GqZ74rsS7zUg5mbUT5R3oUQV3Ts=;
        b=nZWuyrv2hRJKS2d97gR23cfjvRHm2aowEbmOONT75cHP2Bw1gZrvehJkiW5ZtV7Wo5
         pZXyGq7msexz7F8z5QzOMHZ5OMCmlXwZkMVMudrnSvmWNOzL8O9V31nCa20cP4+3Hfbp
         txcJYIGmA6jWCxgGZocYM4HBltjMC1xo7b5ejrpztDFcHbB2I9jFgQcJwwK5sjCfHReb
         zsGDjcmRH61yuWZ6we5sKVDQALn05lStJi3jcngItVryafs5ka3q7hmvlc61pV2MaLPl
         GL4YTj99s4+j2O0WvJrNKZu0+a/Nr0yU1BeYjG1yr0gdrbS0syZrDopSxw/H5g5FyAaq
         uEQA==
X-Forwarded-Encrypted: i=1; AJvYcCWPHHhq8+SVU8QGYrms3fsea6DWoQSp3TCz8F2iBwgAierJBgUGLDsuyHp8+eno0ahO5r4sPvp2qypAZcz3tECI@lists.infradead.org
X-Gm-Message-State: AOJu0YwSb3sn0BCW8+77NM6kgCtZhj5DDd5LK1H343xhjD4hU0ppX2ja
	vC7u8a9h7L1p+G0pOU5CAQPw6m4BSBKpP1qN+nrsfArhumVtplagqbu7P356Qg==
X-Gm-Gg: ASbGnctwzOwcBpzV7yJzi9zcDoH4bwxulD38BWpc7/CsKIqurm80seOdcHtoFzF1TJR
	M9ywNx4UyTxR5KwwUG7IZkO7JOU9c+PEIBsVRlsAaOUIEnhcsrbrV7wlZB1tzieq65vfvjA0HBu
	+Jlz0I76iOl4cCCRjBhFoHqNAKdS3t2UoRPSCFjBmxkUu7QKcyvdCU7FKX2Rp37VTvW2FcEif0u
	27PFjm/lhbhY1FZ9xJrkgxFnOJt6CiHJWMI4UxDVsjc8qysBPv2vQ3H/sKoj5w1FIcs4l4kqrc=
X-Google-Smtp-Source: AGHT+IFAk6Uxvk5ehKLFgDIpV9hJBhJETnQ7nKluyJfT+5cxYx74NrTmY8yPYKw+PXWYOutAzJ3Z4Q==
X-Received: by 2002:a05:6a21:3987:b0:1e1:ccfb:240 with SMTP id adf61e73a8af0-1e5e081d78cmr26108020637.41.1735030127983;
        Tue, 24 Dec 2024 00:48:47 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:a4dc:753e:e6ca:9a68])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8dbaa6sm9203156b3a.91.2024.12.24.00.48.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2024 00:48:47 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 2/2] arm64: dts: mediatek: mt8192: Drop Chromebook variants that never shipped
Date: Tue, 24 Dec 2024 16:48:38 +0800
Message-ID: <20241224084839.2904335-2-wenst@chromium.org>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
In-Reply-To: <20241224084839.2904335-1-wenst@chromium.org>
References: <20241224084839.2904335-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_004848_873397_719829FD 
X-CRM114-Status: GOOD (  12.46  )
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

The Hayato rev5 sku2 and Spherion rev4 variants were designed in
anticipation of shortages of the headphone codec. This never happened.
As far as our records show: the variants were never produced or
shipped, and no such devices were deployed to any lab.

Drop them.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

---
Changes since v1:
- Also drop their entries from the Makefile
---
 arch/arm64/boot/dts/mediatek/Makefile         |  2 -
 .../mt8192-asurada-hayato-r5-sku2.dts         | 65 ----------------
 .../mediatek/mt8192-asurada-spherion-r4.dts   | 78 -------------------
 3 files changed, 145 deletions(-)
 delete mode 100644 arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dts
 delete mode 100644 arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r4.dts

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index 8d638976a2af..7b1fc9839935 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -84,9 +84,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8188-geralt-ciri-sku5.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8188-geralt-ciri-sku6.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8188-geralt-ciri-sku7.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8192-asurada-hayato-r1.dtb
-dtb-$(CONFIG_ARCH_MEDIATEK) += mt8192-asurada-hayato-r5-sku2.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8192-asurada-spherion-r0.dtb
-dtb-$(CONFIG_ARCH_MEDIATEK) += mt8192-asurada-spherion-r4.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8192-evb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8195-cherry-dojo-r1.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8195-cherry-tomato-r1.dtb
diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dts b/arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dts
deleted file mode 100644
index cd86ad9ba28a..000000000000
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dts
+++ /dev/null
@@ -1,65 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0 OR MIT)
-/*
- * Copyright 2022 Google LLC
- */
-/dts-v1/;
-#include "mt8192-asurada.dtsi"
-
-/ {
-	model = "Google Hayato rev5";
-	chassis-type = "convertible";
-	compatible = "google,hayato-rev5-sku2", "google,hayato-sku2",
-		     "google,hayato", "mediatek,mt8192";
-};
-
-&keyboard_controller {
-	function-row-physmap = <
-		MATRIX_KEY(0x00, 0x02, 0)	/* T1 */
-		MATRIX_KEY(0x03, 0x02, 0)	/* T2 */
-		MATRIX_KEY(0x02, 0x02, 0)	/* T3 */
-		MATRIX_KEY(0x01, 0x02, 0)	/* T4 */
-		MATRIX_KEY(0x03, 0x04, 0)	/* T5 */
-		MATRIX_KEY(0x02, 0x04, 0)	/* T6 */
-		MATRIX_KEY(0x01, 0x04, 0)	/* T7 */
-		MATRIX_KEY(0x02, 0x09, 0)	/* T8 */
-		MATRIX_KEY(0x01, 0x09, 0)	/* T9 */
-		MATRIX_KEY(0x00, 0x04, 0)	/* T10 */
-	>;
-	linux,keymap = <
-		MATRIX_KEY(0x00, 0x02, KEY_BACK)
-		MATRIX_KEY(0x03, 0x02, KEY_FORWARD)
-		MATRIX_KEY(0x02, 0x02, KEY_REFRESH)
-		MATRIX_KEY(0x01, 0x02, KEY_FULL_SCREEN)
-		MATRIX_KEY(0x03, 0x04, KEY_SCALE)
-		MATRIX_KEY(0x02, 0x04, KEY_BRIGHTNESSDOWN)
-		MATRIX_KEY(0x01, 0x04, KEY_BRIGHTNESSUP)
-		MATRIX_KEY(0x02, 0x09, KEY_MUTE)
-		MATRIX_KEY(0x01, 0x09, KEY_VOLUMEDOWN)
-		MATRIX_KEY(0x00, 0x04, KEY_VOLUMEUP)
-
-		CROS_STD_MAIN_KEYMAP
-	>;
-};
-
-&rt5682 {
-	compatible = "realtek,rt5682s";
-};
-
-&sound {
-	compatible = "mediatek,mt8192_mt6359_rt1015p_rt5682s";
-
-	speaker-codecs {
-		sound-dai = <&rt1015p>;
-	};
-
-	headset-codec {
-		sound-dai = <&rt5682 0>;
-	};
-};
-
-&touchscreen {
-	compatible = "hid-over-i2c";
-	post-power-on-delay-ms = <10>;
-	hid-descr-addr = <0x0001>;
-	vdd-supply = <&pp3300_u>;
-};
diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r4.dts b/arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r4.dts
deleted file mode 100644
index 5e9e598bab90..000000000000
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r4.dts
+++ /dev/null
@@ -1,78 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0 OR MIT)
-/*
- * Copyright 2022 Google LLC
- */
-/dts-v1/;
-#include "mt8192-asurada.dtsi"
-#include <dt-bindings/leds/common.h>
-
-/ {
-	model = "Google Spherion (rev4)";
-	chassis-type = "laptop";
-	compatible = "google,spherion-rev4", "google,spherion",
-		     "mediatek,mt8192";
-
-	pwmleds {
-		compatible = "pwm-leds";
-
-		led {
-			function = LED_FUNCTION_KBD_BACKLIGHT;
-			color = <LED_COLOR_ID_WHITE>;
-			pwms = <&cros_ec_pwm 0>;
-			max-brightness = <1023>;
-		};
-	};
-};
-
-&cros_ec_pwm {
-	status = "okay";
-};
-
-&keyboard_controller {
-	function-row-physmap = <
-		MATRIX_KEY(0x00, 0x02, 0)	/* T1 */
-		MATRIX_KEY(0x03, 0x02, 0)	/* T2 */
-		MATRIX_KEY(0x02, 0x02, 0)	/* T3 */
-		MATRIX_KEY(0x01, 0x02, 0)	/* T4 */
-		MATRIX_KEY(0x03, 0x04, 0)	/* T5 */
-		MATRIX_KEY(0x02, 0x04, 0)	/* T6 */
-		MATRIX_KEY(0x01, 0x04, 0)	/* T7 */
-		MATRIX_KEY(0x02, 0x09, 0)	/* T8 */
-		MATRIX_KEY(0x01, 0x09, 0)	/* T9 */
-		MATRIX_KEY(0x00, 0x04, 0)	/* T10 */
-	>;
-	linux,keymap = <
-		MATRIX_KEY(0x00, 0x02, KEY_BACK)
-		MATRIX_KEY(0x03, 0x02, KEY_REFRESH)
-		MATRIX_KEY(0x02, 0x02, KEY_FULL_SCREEN)
-		MATRIX_KEY(0x01, 0x02, KEY_SCALE)
-		MATRIX_KEY(0x03, 0x04, KEY_SYSRQ)
-		MATRIX_KEY(0x02, 0x04, KEY_BRIGHTNESSDOWN)
-		MATRIX_KEY(0x01, 0x04, KEY_BRIGHTNESSUP)
-		MATRIX_KEY(0x02, 0x09, KEY_MUTE)
-		MATRIX_KEY(0x01, 0x09, KEY_VOLUMEDOWN)
-		MATRIX_KEY(0x00, 0x04, KEY_VOLUMEUP)
-
-		CROS_STD_MAIN_KEYMAP
-	>;
-};
-
-&rt5682 {
-	compatible = "realtek,rt5682s";
-};
-
-&sound {
-	compatible = "mediatek,mt8192_mt6359_rt1015p_rt5682s";
-
-	speaker-codecs {
-		sound-dai = <&rt1015p>;
-	};
-
-	headset-codec {
-		sound-dai = <&rt5682 0>;
-	};
-};
-
-&touchscreen {
-	compatible = "elan,ekth3500";
-};
-- 
2.47.1.613.gc27f4b7a9f-goog


