Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABF41C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 10:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fI4INpVmKKLQ+GnUwLC8BM3GpY4ldbDIRRh2dXHIFMs=; b=ENWDm3yXjPeFUOMZhp5HmHnSv+
	p13wYDMXoi1Dp1k6gtXIOIecrGyh3EvfMnBjJjy7/cQpi5FJxQDDdGgpZWskXHTUeDBN5KAr0oLKR
	VWpTCSbFGxPsSrKqprh3inHGKwKuNFREznb0FJ4bG9BxHSnjW2QqHgfVhHrscdFFyNEhdtJEU7s0r
	EtJuHaZksX961Xhqw3KBV2PmUJmjjA+opyY6ZVmjT98falbTSfeCTeFgi9kmcZ0O63yKH1Upg9b0n
	jVu0SESR/2/anrkNxH5/4H3OXlN3BAu4WfEGS6rmHeMiFkMY7lEUlQCUQnXz3Q3CAFmc9jYVED6Kg
	VEZJS5tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6oM5-000000045gz-0uWQ;
	Mon, 21 Apr 2025 10:26:25 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6o9U-000000044BA-3lWh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Apr 2025 10:13:26 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-22c33e5013aso42582705ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Apr 2025 03:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745230404; x=1745835204; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fI4INpVmKKLQ+GnUwLC8BM3GpY4ldbDIRRh2dXHIFMs=;
        b=NNAi0VS9+juKEETjPKQAg+BMzjrCcFA2gmedFSmFUv+evodMehU3DD3c/nX9LlzOrv
         9kdxlVkx4KZM8nRc+3RchYWdX2a3VkYjltq77cLV58rNyHKaaehrsDn/2nJ5WxhSn+OV
         qP6dCgmPmV09m+cVOpEgN/VpAqDaz5V3a2Jyw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745230404; x=1745835204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fI4INpVmKKLQ+GnUwLC8BM3GpY4ldbDIRRh2dXHIFMs=;
        b=WCm1YEtPJshrmW1zoaYEcbQ+IpBYfn8FUNPMYdbeH2X942LspMck4dD8kqxntdvpiU
         Tinpc/FZ77jXkgMNxW70MI7QyKs6EZd1/ww5r7ZK8IAgHvVLNGmO1TX/s00vp4ow05+G
         CQMkARSyZNv5OWojWXxhttymiIQqqSVQ5/DccvV+9gv+PAGNM27WFZuA+u/+QalY3qIz
         EPSv38WAh/OjKOnIY830sOx8OUfXqa2cFoRAxWxzidXCoVxGItArpj+bh4D7UmaQ0e7N
         DiT/J6zHkDwX0/iOjop6zMeZrFpSc59pHBsiZ0WIPOCOxV27AoMdH7ZKrSuFg+PI6+1+
         ypBg==
X-Forwarded-Encrypted: i=1; AJvYcCWtfm51lKsBvQjIG+Y+wc/FGRnfJNuX2DkwFuiEiNXGDNjIRXNun8xCtQBmnB7HByRVEOry1KB5dTMqqOcUzEsU@lists.infradead.org
X-Gm-Message-State: AOJu0YwTJ9LWP74cjMhHa0P0Ue9RsE29q2QiQ37h1lE/0hr9Xz2zR/Me
	/N9TexyBX0noHj/kGPMcyvDNlcSgDaduF/9NHJj5zEIR6SxhbR4l9xoMbNHEog==
X-Gm-Gg: ASbGncsmcxYvyPWJc5140YsQEeHZu02K+1a7b7iRUPMrZszjHDq2GADvRiJG1tPqGZK
	N75zlo7XMwoo3/LJPmiDhXC91o187KQ1p2qH7B6bGGk0ZqliIkhdizMMdsf0k5W7aMXx7u8ovA/
	zvIDPKYm6gGDfd+0wqAvZ7qWk/kLVqkmYi1IK/TVWIUgBSlM58N0z9+Uhx4pVGccSxGbEeDTn18
	M5PWWObGisnEUr/7cEel9E7c1cZ2iXRoUTdvjwqhbmvbPmI/ARhhDj9wHqGjSpZox23wL4SS0jd
	J8Y0rD7Ceek7iMWBNCARkdVRPFKk7aVb8Fav2BeCEzPMw0M8S2WocWaprcM=
X-Google-Smtp-Source: AGHT+IGEkbtC/fVUVtuk0XcjS/PS+i1YOa/LJMDWAqNFAJ0mD3J0gKfEIcrJJeHWHk1BOZIZJkjZmQ==
X-Received: by 2002:a17:902:d48f:b0:227:ac2a:1dcf with SMTP id d9443c01a7336-22c535bf828mr153722745ad.23.1745230404197;
        Mon, 21 Apr 2025 03:13:24 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:7633:f42a:d31d:3f9c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22d78db8b04sm38985205ad.238.2025.04.21.03.13.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 03:13:23 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v2 6/8] arm64: dts: mediatek: mt8186: Add Squirtle Chromebooks
Date: Mon, 21 Apr 2025 18:12:44 +0800
Message-ID: <20250421101248.426929-7-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
In-Reply-To: <20250421101248.426929-1-wenst@chromium.org>
References: <20250421101248.426929-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_031324_942676_66A89D6E 
X-CRM114-Status: GOOD (  17.29  )
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

Add a device tree for the MT8186 based Squirtle Chromebooks, also known
as the Acer Chromebook Spin 311 (R724T). The device is a 2-in-1
convertible.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/Makefile         |   1 +
 .../dts/mediatek/mt8186-corsola-squirtle.dts  | 107 ++++++++++++++++++
 .../dts/mediatek/mt8186-corsola-steelix.dtsi  |   2 +-
 3 files changed, 109 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dts

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index ff67931e7821..77ce29608170 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -65,6 +65,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-magneton-sku393216.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-magneton-sku393217.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-magneton-sku393218.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-rusty-sku196608.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-squirtle.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-starmie-sku0.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-starmie-sku1.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-steelix-sku131072.dtb
diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dts b/arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dts
new file mode 100644
index 000000000000..f721ad4e5c97
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dts
@@ -0,0 +1,107 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2024 Google LLC
+ */
+
+/dts-v1/;
+#include "mt8186-corsola-voltorb.dtsi"
+
+/ {
+	model = "Google squirtle board";
+	compatible = "google,squirtle", "mediatek,mt8186";
+	chassis-type = "convertible";
+};
+
+&i2c1 {
+	touchscreen@10 {
+		compatible = "elan,ekth6915";
+		reg = <0x10>;
+		interrupts-extended = <&pio 12 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&touchscreen_pins>;
+		reset-gpios = <&pio 60 GPIO_ACTIVE_LOW>;
+		vcc33-supply = <&pp3300_s3>;
+		status = "fail-needs-probe";
+	};
+
+	touchscreen@16 {
+		compatible = "elan,ekth8d18", "elan,ekth6a12nay";
+		reg = <0x16>;
+		interrupts-extended = <&pio 12 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&touchscreen_pins>;
+		reset-gpios = <&pio 60 GPIO_ACTIVE_LOW>;
+		vcc33-supply = <&pp3300_s3>;
+		status = "fail-needs-probe";
+	};
+};
+
+&i2c2 {
+	trackpad@68 {
+		compatible = "hid-over-i2c";
+		reg = <0x68>;
+		hid-descr-addr = <0x20>;
+		interrupts-extended = <&pio 11 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&trackpad_pin>;
+		vdd-supply = <&pp3300_s3>;
+		wakeup-source;
+		status = "fail-needs-probe";
+	};
+};
+
+&i2c5 {
+	clock-frequency = <400000>;
+
+	/delete-node/ codec@1a;
+
+	rt5650: codec@1a {
+		compatible = "realtek,rt5650";
+		reg = <0x1a>;
+		interrupts-extended = <&pio 17 IRQ_TYPE_EDGE_BOTH>;
+		avdd-supply = <&mt6366_vio18_reg>;
+		cpvdd-supply = <&mt6366_vio18_reg>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&speaker_codec_pins_default>;
+		cbj-sleeve-gpios = <&pio 150 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		realtek,dmic1-data-pin = <2>;
+		realtek,jd-mode = <2>;
+	};
+};
+
+&sound {
+	compatible = "mediatek,mt8186-mt6366-rt5650-sound";
+	model = "mt8186_rt5650";
+
+	audio-routing =
+		"Headphone", "HPOL",
+		"Headphone", "HPOR",
+		"HDMI1", "TX";
+
+	hs-playback-dai-link {
+		codec {
+			sound-dai = <&rt5650>;
+		};
+	};
+
+	hs-capture-dai-link {
+		codec {
+			sound-dai = <&rt5650>;
+		};
+	};
+
+	spk-hdmi-playback-dai-link {
+		codec {
+			sound-dai = <&it6505dptx>;
+		};
+	};
+};
+
+&speaker_codec {
+	status = "disabled";
+};
+
+&trackpad_steelix {
+	status = "disabled";
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix.dtsi b/arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix.dtsi
index 822a177e7c19..8a196dc9a96b 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix.dtsi
@@ -118,7 +118,7 @@ &i2c2 {
 	i2c-scl-internal-delay-ns = <22000>;
 
 	/* second source component */
-	trackpad@2c {
+	trackpad_steelix: trackpad@2c {
 		compatible = "hid-over-i2c";
 		reg = <0x2c>;
 		hid-descr-addr = <0x20>;
-- 
2.49.0.805.g082f7c87e0-goog


