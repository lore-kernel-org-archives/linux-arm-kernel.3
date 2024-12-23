Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E95BE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Dec 2024 10:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XmzIfX5M4nWXT0OGtIvRXIhRj4X+KiyCehm2n5HGgW8=; b=4GF9kP6fAGNVZTEkRXmL6cXbnC
	MU40eHiEQv6HUUPjFImfDG+4L4ctyDpxFFUbtOySW3bR74oVkRtmQMx93Qr2ImiWAek8UwkSQd4Ej
	9i0RaJxT2j2DvuA6Z6vzuyV4bNCqzYuMlp/I34R10to42MXcltk3NGOU4U9xqe0KiL/Ek1ksSOght
	XRvvgtE+eTsoJVEvBiSJDIEaAX0FqoYuwOC4KPY/r0gRKQz7Lm0d7phKZHIwZvX2NSpyLCYwmTy0S
	bjjRZMpgmdqId7yp1OWbyEXGNFNAsa5j6Ys82OIQReT22JBNppvzadjPr43tLAdnNKQXrvMhZeG4W
	OiOlIAzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPfUs-00000009m0t-3xiO;
	Mon, 23 Dec 2024 10:17:10 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPfSZ-00000009lmw-1fuF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Dec 2024 10:14:48 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2166360285dso36313835ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Dec 2024 02:14:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734948887; x=1735553687; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XmzIfX5M4nWXT0OGtIvRXIhRj4X+KiyCehm2n5HGgW8=;
        b=iZbSCCli46iHF0vnl7KFZN7qsriUupfVwxiWoGdKsiH2VWMhKOXnv6Pk7/fdRRsiz2
         ZqAsyvxA2Khd1UCbsgqj9ypAOruxsZCYu8pu86mV1OOjbdPDpGMiWurELj4HyQ7H+QLt
         8DzxBImq2hSea0MssIdWyQ1z5BnBcwFPwzxgw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734948887; x=1735553687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XmzIfX5M4nWXT0OGtIvRXIhRj4X+KiyCehm2n5HGgW8=;
        b=svERmgzv/OoAaSQueNNh5oNs5eXkF2PMpnmxb5Gn1ZJJek9arXHEd/CFhq7nOKXVBx
         fYA8sEk3wyCCp7+rOXLcsAORKTWgRIUzNlnu/QkLu+EkBvXCeNQJ63h3rfbSd8bGUmC2
         nVE0gylrloixY7FB+3rboa9jXVaidfzGuBhXEuJqYYbueOmSmszX0/+LUQF7U2gyhdf8
         OalOe2VMx6Qae8KNyClJdIiUOiyo0IT4KHHuc0oTL70XrlOWkVR+K4MkaKmFs/UfQFmk
         2k+MCFqb9JsayQ900Kg9o6G5dMhCzrt9xzPOUzb/of+kOVgrTxyctoVdoRRRnOqGWNcB
         zMLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDrXAy/jXqkgudaJ8QoFcVEu3NIzIfLG6lpu/1jbX32YbtZrRK0NHOkivaetDhCiddVCbW4bIYRhDWMjHLrroV@lists.infradead.org
X-Gm-Message-State: AOJu0YzYxOQoPSp8xdhr/Uc39xGOH8I/p/6RMO23kS9sHUybXpMxkPXm
	zSc6lx2jUuJQTPpN0COhBmqnLPFSB1M1+YVoj+DaGyaqiAzYnpE9Si7dUXKBiQ==
X-Gm-Gg: ASbGncs/LBQSewtx1PdDWqNUK65PWcmHskp1eLMgOji/6SNy1H44fpZRcpJ7+HaP/Ke
	aleEgVq29QHptk/izz+0Y7qUzqd4CcCFCqRMS8mRaHBRmlYHzVDjC/Xx39LmOY35iFi4n9YOn7s
	gW5DHnUou5YpRRIvCIwVRyCsH10WnDYecQSKAkUg4ir+DMGHxaQExTvjWla4uUkDVOY02M6qqfV
	ZUxzdM97m7jn7781BIuPQi4qhjERBgHI+9HiR42jCz85L1arOJy1dwyEu6ydu5adKIbi4pVsSE=
X-Google-Smtp-Source: AGHT+IGvn7LuflVagKwm3SfC0fRZuTKrAtTyakRZsoDywNt46ZDX54DNX8UbIKHJ4q6LUbIN1z/62A==
X-Received: by 2002:a17:903:41c4:b0:216:1367:7e3d with SMTP id d9443c01a7336-219e6eb45a7mr133755795ad.31.1734948886866;
        Mon, 23 Dec 2024 02:14:46 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:4fc4:9ee5:ceb8:cb2e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9cdde7sm70193325ad.149.2024.12.23.02.14.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 02:14:46 -0800 (PST)
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
Subject: [PATCH 2/2] arm64: dts: mediatek: mt8192: Drop Chromebook variants that never shipped
Date: Mon, 23 Dec 2024 18:14:32 +0800
Message-ID: <20241223101434.2170166-2-wenst@chromium.org>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
In-Reply-To: <20241223101434.2170166-1-wenst@chromium.org>
References: <20241223101434.2170166-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_021447_441880_6F04606B 
X-CRM114-Status: GOOD (  10.93  )
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
 .../mt8192-asurada-hayato-r5-sku2.dts         | 65 ----------------
 .../mediatek/mt8192-asurada-spherion-r4.dts   | 78 -------------------
 2 files changed, 143 deletions(-)
 delete mode 100644 arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dts
 delete mode 100644 arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r4.dts

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


