Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73C86D3ABEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Dec 2025 07:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Eh8zbwl3BBYVc+9B6hMq3b7GWPBAajSCppyaHXoFIk4=; b=oxttTU33H896FmvXtm8chuFYdX
	WBJRuf6UBL4qnqFcgemSaZg1naVUFelPzQ3L+Uh3e+LLudqtdM8HkuNvBovthL7GXFNRVkZHb1ZVu
	B6XgxST22ds2uTM91M8nMqNaQebvdGKOoxVk9WHj6gWtnBMyQTUC1Yc8KMvBQ3laLOg0PRvtjC/uh
	5d/YmnzP8KAGo1amAxPZj4tYx0dKGhNdHUdCaDpIqBEzuLk+O0WqApFBfFLm6882WBbkd+tJvYqfI
	6Kkf2vDMKx1+yelzuImJr+tmQ2w2MVoQK6bZXuzIv4PiyvxCz2YFnOSByzGc9/S9UICpGqBm8z23u
	i/smJZyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSVkQ-0000000ClVP-0mDN;
	Mon, 08 Dec 2025 07:33:30 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSVkM-0000000ClSQ-2xaq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Dec 2025 07:33:28 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-7b86e0d9615so7230406b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 07 Dec 2025 23:33:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1765179206; x=1765784006; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Eh8zbwl3BBYVc+9B6hMq3b7GWPBAajSCppyaHXoFIk4=;
        b=Bb96/RpIIF6eIICaF0eAaJH/29vXGg69m/cw1gcuiopCUQTyOsBoLF6FIpErRByV6s
         25KbH7xiDfJrxVuXm52iV2OBxHv3DcyHT89PqWBW5BB5RQP2TP+Bju+Q/Uu5bWNnGZg0
         6BIVj7CQ9QJ3Gp0Hit0ZUT35BR1AwLY4sFVg8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765179206; x=1765784006;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Eh8zbwl3BBYVc+9B6hMq3b7GWPBAajSCppyaHXoFIk4=;
        b=Zb3vyvgXv+Zmm4CuN3Hl4gvpoHhgvvQyfYCRBl36WmeAvyGAdb3VgSy7QDoY+g+PHh
         2xm8vEqq7yptT7q9Wc24l3Se+TSESG5+RSqFmoYqO5HhpIWa5XU237/+zAgXtkUW/hu1
         Eyla30JYBwVszeyZ5rJuH8Xr6VJBrQi0C4BUABz/W+euz75s4aPnZnL+FjZy03wXXchL
         zR6buV/eRqDRtt1Vvxy545V58HL8+xWv1gl+mCval5fQRRE0PJbW2qioHKY2lVRGp1OA
         AkMZOoSBy/eF7e0cTom+LRe0zDE8IVDzcyUIhT2PfmWSsQir11TJbPcfrk8DmVNBQIst
         jneg==
X-Forwarded-Encrypted: i=1; AJvYcCXdinF354n5CTcishRY+88SkiRenuFCzTHAIqYAN5vZ9pG33k64EfRXxUqJaKecr4AgcDhfrHEShPHA5bm5vE10@lists.infradead.org
X-Gm-Message-State: AOJu0YypJJz637zruhiz7AA3AAZTiBJrQDtqeHohcmd6XDjYRYwgLDsl
	rFB86kkQvUcy5a//IbRCksg24dd1so/SubhWwSz+f1jl1PzMUtY5FH17vksP5ttZqhnMED4CjMN
	ziTzfcQ==
X-Gm-Gg: ASbGncvCWPZURnASs89y1c1crFo5Hq8aWUK8KTWijhVTUnX4UNqnrYnS5cnF07IKHmr
	z6tR5QZ8LhXRu4f9rhc0HsTvUWQeA/Mv7VueiQXqfkUrSEE/jlWhCtaiUft/+2BtgOuKiQEfKL3
	1rcSPT12gHbd55yWC0z+xrBC+2+4sPIguN91HR+bGmYVnuU5gz0DRQoP4afabP6/LY9kMUzxX1S
	/a+cZbur6ZoCq3IfXjlD3EjT/eNdIOTmsXnZkumg56z7zAJDMHs8xYuJr8ukRHTtnvnnwrqViea
	g73QS8FC5Okn6DkG8Uh23D2oLIYz+E0WIniRCzw3ovi8LL0EZthMkiQI5LJ8yUppktSH9AoFiFK
	/ThkOTE8q0fKHl3S2Nuxxc0aXCxb0/I7p0kR9YEFprgyn8j09YRGXa18LVRsCU+XlsDgOnBbDUZ
	MvDH9goGq2WDrXUoKl9Eg7D1IsxzwXs77qitVGNFyRb9+Ipi2ulw/PLlXcpgbwjwFuO/8k
X-Google-Smtp-Source: AGHT+IE+INKuhg3s+6b8+naNepG4jj8nvP01S3s32sLn7T7V4DzcQdK7nbVe2ipp2f5euqAiLmaZbQ==
X-Received: by 2002:a05:6a00:a28:b0:7e8:4398:b354 with SMTP id d2e1a72fcca58-7e8c4a766bamr6669231b3a.39.1765179205747;
        Sun, 07 Dec 2025 23:33:25 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:d31e:c84f:5cc1:d554])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7e29ff6b56esm12127686b3a.20.2025.12.07.23.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Dec 2025 23:33:25 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 2/3] arm64: dts: mt8188-ciri: Split into base and overlays based on components
Date: Mon,  8 Dec 2025 15:33:03 +0800
Message-ID: <20251208073306.75279-3-wenst@chromium.org>
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
In-Reply-To: <20251208073306.75279-1-wenst@chromium.org>
References: <20251208073306.75279-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251207_233326_769154_B98D273C 
X-CRM114-Status: GOOD (  17.59  )
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

The MT8188-based Ciri device has 8 SKUs. These are derived from the
combinations of 3 types of components (headphone codec, speaker codec,
and display panel), each having 2 options.

Decompose the existing dtsi / dts files into 6 overlays for each
component option. The audio codec have combined audio routing and graph
connections,  cannot be easily separated into separate bits without
adding even more glue overlays. The per-SKU dts files are also converted
to overlays, though now they only contain the final board compatible and
model name.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/Makefile         | 34 ++++++++
 ...88-geralt-ciri-audio-max98390-es8326.dtso} | 40 ++++++---
 ...88-geralt-ciri-audio-max98390-rt5682s.dtso | 81 +++++++++++++++++++
 ...188-geralt-ciri-audio-tas2563-es8326.dtso} | 18 ++---
 ...88-geralt-ciri-audio-tas2563-rt5682s.dtso} | 46 +++++------
 .../mt8188-geralt-ciri-panel-boe.dtso         | 10 +++
 .../mt8188-geralt-ciri-panel-ivo.dtso         | 10 +++
 .../dts/mediatek/mt8188-geralt-ciri-sku0.dts  | 32 --------
 .../dts/mediatek/mt8188-geralt-ciri-sku0.dtso | 11 +++
 .../dts/mediatek/mt8188-geralt-ciri-sku1.dtso | 11 +++
 .../dts/mediatek/mt8188-geralt-ciri-sku2.dts  | 59 --------------
 .../dts/mediatek/mt8188-geralt-ciri-sku2.dtso | 11 +++
 .../dts/mediatek/mt8188-geralt-ciri-sku3.dts  | 32 --------
 .../dts/mediatek/mt8188-geralt-ciri-sku3.dtso | 11 +++
 .../dts/mediatek/mt8188-geralt-ciri-sku4.dts  | 48 -----------
 .../dts/mediatek/mt8188-geralt-ciri-sku4.dtso | 11 +++
 .../dts/mediatek/mt8188-geralt-ciri-sku5.dtso | 11 +++
 .../dts/mediatek/mt8188-geralt-ciri-sku6.dtso | 11 +++
 .../dts/mediatek/mt8188-geralt-ciri-sku7.dts  | 48 -----------
 .../dts/mediatek/mt8188-geralt-ciri-sku7.dtso | 11 +++
 ...eralt-ciri.dtsi => mt8188-geralt-ciri.dts} | 54 ++-----------
 21 files changed, 285 insertions(+), 315 deletions(-)
 rename arch/arm64/boot/dts/mediatek/{mt8188-geralt-ciri-sku1.dts => mt8188-geralt-ciri-audio-max98390-es8326.dtso} (59%)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-audio-max98390-rt5682s.dtso
 rename arch/arm64/boot/dts/mediatek/{mt8188-geralt-ciri-sku5.dts => mt8188-geralt-ciri-audio-tas2563-es8326.dtso} (78%)
 rename arch/arm64/boot/dts/mediatek/{mt8188-geralt-ciri-sku6.dts => mt8188-geralt-ciri-audio-tas2563-rt5682s.dtso} (52%)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-panel-boe.dtso
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-panel-ivo.dtso
 delete mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtso
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtso
 delete mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtso
 delete mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtso
 delete mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtso
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtso
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtso
 delete mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtso
 rename arch/arm64/boot/dts/mediatek/{mt8188-geralt-ciri.dtsi => mt8188-geralt-ciri.dts} (81%)

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index c5fd6191a925..39a844386366 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -86,6 +86,40 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-tentacruel-sku262148.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-voltorb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-evb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8188-evb.dtb
+
+mt8188-geralt-ciri-sku0-dtbs := mt8188-geralt-ciri.dtb \
+				mt8188-geralt-ciri-panel-boe.dtbo \
+				mt8188-geralt-ciri-audio-max98390-rt5682s.dtbo \
+				mt8188-geralt-ciri-sku0.dtbo
+mt8188-geralt-ciri-sku1-dtbs := mt8188-geralt-ciri.dtb \
+				mt8188-geralt-ciri-panel-ivo.dtbo \
+				mt8188-geralt-ciri-audio-max98390-es8326.dtbo \
+				mt8188-geralt-ciri-sku1.dtbo
+mt8188-geralt-ciri-sku2-dtbs := mt8188-geralt-ciri.dtb \
+				mt8188-geralt-ciri-panel-boe.dtbo \
+				mt8188-geralt-ciri-audio-max98390-es8326.dtbo \
+				mt8188-geralt-ciri-sku2.dtbo
+mt8188-geralt-ciri-sku3-dtbs := mt8188-geralt-ciri.dtb \
+				mt8188-geralt-ciri-panel-ivo.dtbo \
+				mt8188-geralt-ciri-audio-max98390-rt5682s.dtbo \
+				mt8188-geralt-ciri-sku3.dtbo
+mt8188-geralt-ciri-sku4-dtbs := mt8188-geralt-ciri.dtb \
+				mt8188-geralt-ciri-panel-boe.dtbo \
+				mt8188-geralt-ciri-audio-tas2563-rt5682s.dtbo \
+				mt8188-geralt-ciri-sku4.dtbo
+mt8188-geralt-ciri-sku5-dtbs := mt8188-geralt-ciri.dtb \
+				mt8188-geralt-ciri-panel-ivo.dtbo \
+				mt8188-geralt-ciri-audio-tas2563-es8326.dtbo \
+				mt8188-geralt-ciri-sku5.dtbo
+mt8188-geralt-ciri-sku6-dtbs := mt8188-geralt-ciri.dtb \
+				mt8188-geralt-ciri-panel-boe.dtbo \
+				mt8188-geralt-ciri-audio-tas2563-es8326.dtbo \
+				mt8188-geralt-ciri-sku6.dtbo
+mt8188-geralt-ciri-sku7-dtbs := mt8188-geralt-ciri.dtb \
+				mt8188-geralt-ciri-panel-ivo.dtbo \
+				mt8188-geralt-ciri-audio-tas2563-rt5682s.dtbo \
+				mt8188-geralt-ciri-sku7.dtbo
+
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8188-geralt-ciri-sku0.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8188-geralt-ciri-sku1.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8188-geralt-ciri-sku2.dtb
diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dts b/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-audio-max98390-es8326.dtso
similarity index 59%
rename from arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dts
rename to arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-audio-max98390-es8326.dtso
index ef5ea9d12b1d..b99bd4c78ec5 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-audio-max98390-es8326.dtso
@@ -2,20 +2,14 @@
 /*
  * Copyright 2023 Google LLC
  */
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
 /dts-v1/;
-#include "mt8188-geralt-ciri.dtsi"
-
-/ {
-	model = "Google Ciri sku1 board";
-	compatible = "google,ciri-sku1", "google,ciri", "mediatek,mt8188";
-};
-
-&dsi_panel {
-	compatible = "ivo,t109nw41", "himax,hx83102";
-};
+/plugin/;
 
 &i2c0 {
-	/delete-node/ audio-codec@1a;
+	#address-cells = <1>;
+	#size-cells = <0>;
 
 	es8326: audio-codec@19 {
 		compatible = "everest,es8326";
@@ -27,6 +21,23 @@ es8326: audio-codec@19 {
 		everest,jack-pol = [0e];
 		everest,interrupt-clk = [00];
 	};
+
+	max98390_38: amplifier@38 {
+		compatible = "maxim,max98390";
+		reg = <0x38>;
+		sound-name-prefix = "Front Right";
+		reset-gpios = <&pio 118 GPIO_ACTIVE_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&speaker_en>;
+		#sound-dai-cells = <0>;
+	};
+
+	max98390_39: amplifier@39 {
+		compatible = "maxim,max98390";
+		reg = <0x39>;
+		sound-name-prefix = "Front Left";
+		#sound-dai-cells = <0>;
+	};
 };
 
 &sound {
@@ -45,6 +56,13 @@ &sound {
 		"Left Spk", "Front Left BE_OUT",
 		"Right Spk", "Front Right BE_OUT";
 
+	dai-link-1 {
+		codec {
+			sound-dai = <&max98390_38>,
+				    <&max98390_39>;
+		};
+	};
+
 	dai-link-2 {
 		codec {
 			sound-dai = <&es8326>;
diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-audio-max98390-rt5682s.dtso b/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-audio-max98390-rt5682s.dtso
new file mode 100644
index 000000000000..44dd82926280
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-audio-max98390-rt5682s.dtso
@@ -0,0 +1,81 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2023 Google LLC
+ */
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+/dts-v1/;
+/plugin/;
+
+&i2c0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	rt5682s: audio-codec@1a {
+		compatible = "realtek,rt5682s";
+		reg = <0x1a>;
+		interrupts-extended = <&pio 108 IRQ_TYPE_EDGE_BOTH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&audio_codec_pins>;
+		#sound-dai-cells = <1>;
+
+		AVDD-supply = <&mt6359_vio18_ldo_reg>;
+		DBVDD-supply = <&mt6359_vio18_ldo_reg>;
+		LDO1-IN-supply = <&mt6359_vio18_ldo_reg>;
+		MICVDD-supply = <&pp3300_s3>;
+		realtek,jd-src = <1>;
+	};
+
+	max98390_38: amplifier@38 {
+		compatible = "maxim,max98390";
+		reg = <0x38>;
+		sound-name-prefix = "Front Right";
+		reset-gpios = <&pio 118 GPIO_ACTIVE_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&speaker_en>;
+		#sound-dai-cells = <0>;
+	};
+
+	max98390_39: amplifier@39 {
+		compatible = "maxim,max98390";
+		reg = <0x39>;
+		sound-name-prefix = "Front Left";
+		#sound-dai-cells = <0>;
+	};
+};
+
+&sound {
+	compatible = "mediatek,mt8188-rt5682s";
+	model = "mt8188_m98390_5682";
+
+	audio-routing =
+		"ETDM1_OUT", "ETDM_SPK_PIN",
+		"ETDM2_OUT", "ETDM_HP_PIN",
+		"ETDM1_IN", "ETDM_SPK_PIN",
+		"ETDM2_IN", "ETDM_HP_PIN",
+		"ADDA Capture", "MTKAIF_PIN",
+		"Headphone Jack", "HPOL",
+		"Headphone Jack", "HPOR",
+		"IN1P", "Headset Mic",
+		"Left Spk", "Front Left BE_OUT",
+		"Right Spk", "Front Right BE_OUT";
+
+	dai-link-1 {
+		codec {
+			sound-dai = <&max98390_38>,
+				    <&max98390_39>;
+		};
+	};
+
+	dai-link-2 {
+		codec {
+			sound-dai = <&rt5682s 0>;
+		};
+	};
+
+	dai-link-3 {
+		codec {
+			sound-dai = <&rt5682s 0>;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dts b/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-audio-tas2563-es8326.dtso
similarity index 78%
rename from arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dts
rename to arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-audio-tas2563-es8326.dtso
index bf87201ccf27..c64094c6c249 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-audio-tas2563-es8326.dtso
@@ -2,22 +2,14 @@
 /*
  * Copyright 2024 Google LLC
  */
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
 /dts-v1/;
-#include "mt8188-geralt-ciri.dtsi"
-
-/ {
-	model = "Google Ciri sku5 board (rev4)";
-	compatible = "google,ciri-sku5", "google,ciri", "mediatek,mt8188";
-};
-
-&dsi_panel {
-	compatible = "ivo,t109nw41", "himax,hx83102";
-};
+/plugin/;
 
 &i2c0 {
-	/delete-node/ audio-codec@1a;
-	/delete-node/ amplifier@38;
-	/delete-node/ amplifier@39;
+	#address-cells = <1>;
+	#size-cells = <0>;
 
 	es8326: audio-codec@19 {
 		compatible = "everest,es8326";
diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dts b/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-audio-tas2563-rt5682s.dtso
similarity index 52%
rename from arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dts
rename to arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-audio-tas2563-rt5682s.dtso
index 17d7359dfb6a..b8e6220a449e 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-audio-tas2563-rt5682s.dtso
@@ -2,32 +2,28 @@
 /*
  * Copyright 2024 Google LLC
  */
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
 /dts-v1/;
-#include "mt8188-geralt-ciri.dtsi"
-
-/ {
-	model = "Google Ciri sku6 board (rev4)";
-	compatible = "google,ciri-sku6", "google,ciri", "mediatek,mt8188";
-};
-
-&dsi_panel {
-	compatible = "boe,nv110wum-l60", "himax,hx83102";
-};
+/plugin/;
 
 &i2c0 {
-	/delete-node/ audio-codec@1a;
-	/delete-node/ amplifier@38;
-	/delete-node/ amplifier@39;
+	#address-cells = <1>;
+	#size-cells = <0>;
 
-	es8326: audio-codec@19 {
-		compatible = "everest,es8326";
-		reg = <0x19>;
-		interrupts-extended = <&pio 108 IRQ_TYPE_LEVEL_LOW>;
+	rt5682s: audio-codec@1a {
+		compatible = "realtek,rt5682s";
+		reg = <0x1a>;
+		interrupts-extended = <&pio 108 IRQ_TYPE_EDGE_BOTH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&audio_codec_pins>;
-		#sound-dai-cells = <0>;
-		everest,jack-pol = [0e];
-		everest,interrupt-clk = [00];
+		#sound-dai-cells = <1>;
+
+		AVDD-supply = <&mt6359_vio18_ldo_reg>;
+		DBVDD-supply = <&mt6359_vio18_ldo_reg>;
+		LDO1-IN-supply = <&mt6359_vio18_ldo_reg>;
+		MICVDD-supply = <&pp3300_s3>;
+		realtek,jd-src = <1>;
 	};
 
 	tas2563: amplifier@4f {
@@ -39,8 +35,8 @@ tas2563: amplifier@4f {
 };
 
 &sound {
-	compatible = "mediatek,mt8188-es8326";
-	model = "mt8188_tas2563_8326";
+	compatible = "mediatek,mt8188-rt5682s";
+	model = "mt8188_tas2563_5682";
 
 	audio-routing =
 		"ETDM1_OUT", "ETDM_SPK_PIN",
@@ -50,7 +46,7 @@ &sound {
 		"ADDA Capture", "MTKAIF_PIN",
 		"Headphone Jack", "HPOL",
 		"Headphone Jack", "HPOR",
-		"MIC1", "Headset Mic";
+		"IN1P", "Headset Mic";
 
 	dai-link-1 {
 		codec {
@@ -60,13 +56,13 @@ codec {
 
 	dai-link-2 {
 		codec {
-			sound-dai = <&es8326>;
+			sound-dai = <&rt5682s 0>;
 		};
 	};
 
 	dai-link-3 {
 		codec {
-			sound-dai = <&es8326>;
+			sound-dai = <&rt5682s 0>;
 		};
 	};
 };
diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-panel-boe.dtso b/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-panel-boe.dtso
new file mode 100644
index 000000000000..4d61226713bc
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-panel-boe.dtso
@@ -0,0 +1,10 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2023 Google LLC
+ */
+/dts-v1/;
+/plugin/;
+
+&dsi_panel {
+	compatible = "boe,nv110wum-l60", "himax,hx83102";
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-panel-ivo.dtso b/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-panel-ivo.dtso
new file mode 100644
index 000000000000..8cdacf64c100
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-panel-ivo.dtso
@@ -0,0 +1,10 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2023 Google LLC
+ */
+/dts-v1/;
+/plugin/;
+
+&dsi_panel {
+	compatible = "ivo,t109nw41", "himax,hx83102";
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dts b/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dts
deleted file mode 100644
index 79d6d12394b9..000000000000
--- a/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dts
+++ /dev/null
@@ -1,32 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0 OR MIT)
-/*
- * Copyright 2023 Google LLC
- */
-/dts-v1/;
-#include "mt8188-geralt-ciri.dtsi"
-
-/ {
-	model = "Google Ciri sku0 board";
-	compatible = "google,ciri-sku0", "google,ciri", "mediatek,mt8188";
-};
-
-&dsi_panel {
-	compatible = "boe,nv110wum-l60", "himax,hx83102";
-};
-
-&sound {
-	compatible = "mediatek,mt8188-rt5682s";
-	model = "mt8188_m98390_5682";
-
-	audio-routing =
-		"ETDM1_OUT", "ETDM_SPK_PIN",
-		"ETDM2_OUT", "ETDM_HP_PIN",
-		"ETDM1_IN", "ETDM_SPK_PIN",
-		"ETDM2_IN", "ETDM_HP_PIN",
-		"ADDA Capture", "MTKAIF_PIN",
-		"Headphone Jack", "HPOL",
-		"Headphone Jack", "HPOR",
-		"IN1P", "Headset Mic",
-		"Left Spk", "Front Left BE_OUT",
-		"Right Spk", "Front Right BE_OUT";
-};
diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtso b/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtso
new file mode 100644
index 000000000000..884a7b2d943c
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtso
@@ -0,0 +1,11 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2023 Google LLC
+ */
+/dts-v1/;
+/plugin/;
+
+&{/} {
+	model = "Google Ciri sku0 board";
+	compatible = "google,ciri-sku0", "google,ciri", "mediatek,mt8188";
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtso b/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtso
new file mode 100644
index 000000000000..d3ed6ea535d7
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtso
@@ -0,0 +1,11 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2023 Google LLC
+ */
+/dts-v1/;
+/plugin/;
+
+&{/} {
+	model = "Google Ciri sku1 board";
+	compatible = "google,ciri-sku1", "google,ciri", "mediatek,mt8188";
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dts b/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dts
deleted file mode 100644
index ef56786fc2be..000000000000
--- a/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dts
+++ /dev/null
@@ -1,59 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0 OR MIT)
-/*
- * Copyright 2024 Google LLC
- */
-/dts-v1/;
-#include "mt8188-geralt-ciri.dtsi"
-
-/ {
-	model = "Google Ciri sku2 board";
-	compatible = "google,ciri-sku2", "google,ciri", "mediatek,mt8188";
-};
-
-&dsi_panel {
-	compatible = "boe,nv110wum-l60", "himax,hx83102";
-};
-
-&i2c0 {
-	/delete-node/ audio-codec@1a;
-
-	es8326: audio-codec@19 {
-		compatible = "everest,es8326";
-		reg = <0x19>;
-		interrupts-extended = <&pio 108 IRQ_TYPE_LEVEL_LOW>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&audio_codec_pins>;
-		#sound-dai-cells = <0>;
-		everest,jack-pol = [0e];
-		everest,interrupt-clk = [00];
-	};
-};
-
-&sound {
-	compatible = "mediatek,mt8188-es8326";
-	model = "mt8188_m98390_8326";
-
-	audio-routing =
-		"ETDM1_OUT", "ETDM_SPK_PIN",
-		"ETDM2_OUT", "ETDM_HP_PIN",
-		"ETDM1_IN", "ETDM_SPK_PIN",
-		"ETDM2_IN", "ETDM_HP_PIN",
-		"ADDA Capture", "MTKAIF_PIN",
-		"Headphone Jack", "HPOL",
-		"Headphone Jack", "HPOR",
-		"MIC1", "Headset Mic",
-		"Left Spk", "Front Left BE_OUT",
-		"Right Spk", "Front Right BE_OUT";
-
-	dai-link-2 {
-		codec {
-			sound-dai = <&es8326>;
-		};
-	};
-
-	dai-link-3 {
-		codec {
-			sound-dai = <&es8326>;
-		};
-	};
-};
diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtso b/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtso
new file mode 100644
index 000000000000..3f9d38bc2ad2
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtso
@@ -0,0 +1,11 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2024 Google LLC
+ */
+/dts-v1/;
+/plugin/;
+
+&{/} {
+	model = "Google Ciri sku2 board";
+	compatible = "google,ciri-sku2", "google,ciri", "mediatek,mt8188";
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dts b/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dts
deleted file mode 100644
index 524f7f0064c1..000000000000
--- a/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dts
+++ /dev/null
@@ -1,32 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0 OR MIT)
-/*
- * Copyright 2024 Google LLC
- */
-/dts-v1/;
-#include "mt8188-geralt-ciri.dtsi"
-
-/ {
-	model = "Google Ciri sku3 board";
-	compatible = "google,ciri-sku3", "google,ciri", "mediatek,mt8188";
-};
-
-&dsi_panel {
-	compatible = "ivo,t109nw41", "himax,hx83102";
-};
-
-&sound {
-	compatible = "mediatek,mt8188-rt5682s";
-	model = "mt8188_m98390_5682";
-
-	audio-routing =
-		"ETDM1_OUT", "ETDM_SPK_PIN",
-		"ETDM2_OUT", "ETDM_HP_PIN",
-		"ETDM1_IN", "ETDM_SPK_PIN",
-		"ETDM2_IN", "ETDM_HP_PIN",
-		"ADDA Capture", "MTKAIF_PIN",
-		"Headphone Jack", "HPOL",
-		"Headphone Jack", "HPOR",
-		"IN1P", "Headset Mic",
-		"Left Spk", "Front Left BE_OUT",
-		"Right Spk", "Front Right BE_OUT";
-};
diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtso b/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtso
new file mode 100644
index 000000000000..e6a6f8f06141
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtso
@@ -0,0 +1,11 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2024 Google LLC
+ */
+/dts-v1/;
+/plugin/;
+
+&{/} {
+	model = "Google Ciri sku3 board";
+	compatible = "google,ciri-sku3", "google,ciri", "mediatek,mt8188";
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dts b/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dts
deleted file mode 100644
index ea953d7e1543..000000000000
--- a/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dts
+++ /dev/null
@@ -1,48 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0 OR MIT)
-/*
- * Copyright 2024 Google LLC
- */
-/dts-v1/;
-#include "mt8188-geralt-ciri.dtsi"
-
-/ {
-	model = "Google Ciri sku4 board (rev4)";
-	compatible = "google,ciri-sku4", "google,ciri", "mediatek,mt8188";
-};
-
-&dsi_panel {
-	compatible = "boe,nv110wum-l60", "himax,hx83102";
-};
-
-&i2c0 {
-	/delete-node/ amplifier@38;
-	/delete-node/ amplifier@39;
-
-	tas2563: amplifier@4f {
-		compatible = "ti,tas2563", "ti,tas2781";
-		reg = <0x4f>, <0x4c>; /* left / right channel */
-		reset-gpios = <&pio 118 GPIO_ACTIVE_HIGH>;
-		#sound-dai-cells = <0>;
-	};
-};
-
-&sound {
-	compatible = "mediatek,mt8188-rt5682s";
-	model = "mt8188_tas2563_5682";
-
-	audio-routing =
-		"ETDM1_OUT", "ETDM_SPK_PIN",
-		"ETDM2_OUT", "ETDM_HP_PIN",
-		"ETDM1_IN", "ETDM_SPK_PIN",
-		"ETDM2_IN", "ETDM_HP_PIN",
-		"ADDA Capture", "MTKAIF_PIN",
-		"Headphone Jack", "HPOL",
-		"Headphone Jack", "HPOR",
-		"IN1P", "Headset Mic";
-
-	dai-link-1 {
-		codec {
-			sound-dai = <&tas2563>;
-		};
-	};
-};
diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtso b/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtso
new file mode 100644
index 000000000000..ee5b28c4ef00
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtso
@@ -0,0 +1,11 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2024 Google LLC
+ */
+/dts-v1/;
+/plugin/;
+
+&{/} {
+	model = "Google Ciri sku4 board (rev4)";
+	compatible = "google,ciri-sku4", "google,ciri", "mediatek,mt8188";
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtso b/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtso
new file mode 100644
index 000000000000..ccf8d2f0eb70
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtso
@@ -0,0 +1,11 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2024 Google LLC
+ */
+/dts-v1/;
+/plugin/;
+
+&{/} {
+	model = "Google Ciri sku5 board (rev4)";
+	compatible = "google,ciri-sku5", "google,ciri", "mediatek,mt8188";
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtso b/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtso
new file mode 100644
index 000000000000..773c702b59d8
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtso
@@ -0,0 +1,11 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2024 Google LLC
+ */
+/dts-v1/;
+/plugin/;
+
+&{/} {
+	model = "Google Ciri sku6 board (rev4)";
+	compatible = "google,ciri-sku6", "google,ciri", "mediatek,mt8188";
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dts b/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dts
deleted file mode 100644
index 825015b452d5..000000000000
--- a/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dts
+++ /dev/null
@@ -1,48 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0 OR MIT)
-/*
- * Copyright 2024 Google LLC
- */
-/dts-v1/;
-#include "mt8188-geralt-ciri.dtsi"
-
-/ {
-	model = "Google Ciri sku7 board (rev4)";
-	compatible = "google,ciri-sku7", "google,ciri", "mediatek,mt8188";
-};
-
-&dsi_panel {
-	compatible = "ivo,t109nw41", "himax,hx83102";
-};
-
-&i2c0 {
-	/delete-node/ amplifier@38;
-	/delete-node/ amplifier@39;
-
-	tas2563: amplifier@4f {
-		compatible = "ti,tas2563", "ti,tas2781";
-		reg = <0x4f>, <0x4c>; /* left / right channel */
-		reset-gpios = <&pio 118 GPIO_ACTIVE_HIGH>;
-		#sound-dai-cells = <0>;
-	};
-};
-
-&sound {
-	compatible = "mediatek,mt8188-rt5682s";
-	model = "mt8188_tas2563_5682";
-
-	audio-routing =
-		"ETDM1_OUT", "ETDM_SPK_PIN",
-		"ETDM2_OUT", "ETDM_HP_PIN",
-		"ETDM1_IN", "ETDM_SPK_PIN",
-		"ETDM2_IN", "ETDM_HP_PIN",
-		"ADDA Capture", "MTKAIF_PIN",
-		"Headphone Jack", "HPOL",
-		"Headphone Jack", "HPOR",
-		"IN1P", "Headset Mic";
-
-	dai-link-1 {
-		codec {
-			sound-dai = <&tas2563>;
-		};
-	};
-};
diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtso b/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtso
new file mode 100644
index 000000000000..c22860eab9f8
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtso
@@ -0,0 +1,11 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2024 Google LLC
+ */
+/dts-v1/;
+/plugin/;
+
+&{/} {
+	model = "Google Ciri sku7 board (rev4)";
+	compatible = "google,ciri-sku7", "google,ciri", "mediatek,mt8188";
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri.dtsi b/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri.dts
similarity index 81%
rename from arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri.dtsi
rename to arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri.dts
index 6815c435a57e..2c9e9e67c8e2 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri.dts
@@ -5,6 +5,11 @@
 /dts-v1/;
 #include "mt8188-geralt.dtsi"
 
+/ {
+	model = "Google Ciri board";
+	compatible = "google,ciri", "mediatek,mt8188";
+};
+
 &aud_etdm_hp_on {
 	pins-mclk {
 		pinmux = <PINMUX_GPIO114__FUNC_O_I2SO2_MCK>;
@@ -19,40 +24,6 @@ pins-mclk {
 	};
 };
 
-&i2c0 {
-	rt5682s: audio-codec@1a {
-		compatible = "realtek,rt5682s";
-		reg = <0x1a>;
-		interrupts-extended = <&pio 108 IRQ_TYPE_EDGE_BOTH>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&audio_codec_pins>;
-		#sound-dai-cells = <1>;
-
-		AVDD-supply = <&mt6359_vio18_ldo_reg>;
-		DBVDD-supply = <&mt6359_vio18_ldo_reg>;
-		LDO1-IN-supply = <&mt6359_vio18_ldo_reg>;
-		MICVDD-supply = <&pp3300_s3>;
-		realtek,jd-src = <1>;
-	};
-
-	max98390_38: amplifier@38 {
-		compatible = "maxim,max98390";
-		reg = <0x38>;
-		sound-name-prefix = "Front Right";
-		reset-gpios = <&pio 118 GPIO_ACTIVE_LOW>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&speaker_en>;
-		#sound-dai-cells = <0>;
-	};
-
-	max98390_39: amplifier@39 {
-		compatible = "maxim,max98390";
-		reg = <0x39>;
-		sound-name-prefix = "Front Left";
-		#sound-dai-cells = <0>;
-	};
-};
-
 &i2c_tunnel {
 	/*
 	 * The virtual battery I2C addr is 0xf on Ciri, so we describe it
@@ -77,6 +48,8 @@ &mt6359_vm18_ldo_reg {
 };
 
 &sound {
+	/* compatible, model, routing, and dai-link codecs added by overlays */
+
 	dai-link-0 {
 		link-name = "ETDM1_IN_BE";
 		dai-format = "i2s";
@@ -87,29 +60,16 @@ dai-link-1 {
 		link-name = "ETDM1_OUT_BE";
 		dai-format = "i2s";
 		mediatek,clk-provider = "cpu";
-
-		codec {
-			sound-dai = <&max98390_38>,
-				    <&max98390_39>;
-		};
 	};
 
 	dai-link-2 {
 		link-name = "ETDM2_IN_BE";
 		mediatek,clk-provider = "cpu";
-
-		codec {
-			sound-dai = <&rt5682s 0>;
-		};
 	};
 
 	dai-link-3 {
 		link-name = "ETDM2_OUT_BE";
 		mediatek,clk-provider = "cpu";
-
-		codec {
-			sound-dai = <&rt5682s 0>;
-		};
 	};
 
 	dai-link-4 {
-- 
2.52.0.223.gf5cc29aaa4-goog


