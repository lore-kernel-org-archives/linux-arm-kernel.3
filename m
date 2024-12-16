Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA603E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 07:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ghfXEzNC0LKCgXVnuy0foatupNP0hXk60L3nylPjlwQ=; b=OtPRgTKMqUqUQHzIJjygfFyaQk
	CSpLbdFWvN4pqsCMrsECJCxJiHintlScPI5dSSbL8hmm6e2CsGKqJhqo9nu+mxBQs0iw8E+3/maWZ
	623/gwf/uCorge4QKYO/gJEl0QED7HVz8+sj55rcaeZ9vylH2IUZy1k86+wiRq6LHnqobvnDLgTVa
	Yt6Aufha9/CHRwKrxPNENCDc2CuDA9X6StE18HAxun7uNNgTVnDI6au/TCNJDTiCXfZdWTHo58/Qy
	pYdilpO/mZ5pIQ9wUtEgm2MNIisA0gOIcg3Xn2E2euiAfZqBHUVY8Lw2uBscIqjv81dn8YnYKwJ2g
	P3S2Om9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tN5eZ-00000009HoK-1WxW;
	Mon, 16 Dec 2024 07:36:31 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tN5dT-00000009HhF-21dM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 07:35:25 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2163bd70069so38073555ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Dec 2024 23:35:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pegatron-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1734334522; x=1734939322; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ghfXEzNC0LKCgXVnuy0foatupNP0hXk60L3nylPjlwQ=;
        b=xThiDBta3jXABHXJTJR/tsKX1bkP1CjnvtnC/LIWZ9uzkxJlWm3Hd9QMylqFJLDkk0
         nFhrivnhPQdRgnJ9Qgc0kgiPQ7f09A9O+CEoeDC7Tdr4D7IlOyGJJgB2nJNc62AWU19q
         CtHNmq3dZ7KJg+dFYmsmiKsOru48ebYNjz4zWhMu1kKIolOmnC1T4KMrh07YInNMNqQ7
         CwlRr128Z2Q0xLh0k7qOFwWRZys/TJ/Ow0VuRW4U/xvL50I1roPcsIn+ZLwUnqSrMEB3
         hwTqpJx9393Z6jdIlH2mD64ciu8b5rYhxJijwzLjbrAr2vz90vc5s2NmAlHbX4gZrHkg
         JhIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734334522; x=1734939322;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ghfXEzNC0LKCgXVnuy0foatupNP0hXk60L3nylPjlwQ=;
        b=E5SxXdj7D2hlNNwwhq8z/5lyJv9XjqXdv5ELKe8DkCR4Lhps8m3QWLr6w/vhsxo9vi
         CU/q8q8zUQZpLdeVgHnWG/rmbfbYfg24kXGIJZ6986uaM4X6yysLoRHWE1Pzee3SKvIC
         T5yoYCVYkg5uIgBzAmh/vbDH6H2S845ANR8NrEqhrcsCwGpD90J8OKJ0NIMLiLtK1cyb
         jSagxLZmeaUlQDCEWxf69J+uNsHY6vEGa0ul+jO1litr7DmDA1ih2mP2z7YrOWbVwtuw
         71unpd3f6raWEAqWTnyWPoXUNP0MkMeYf+Hqbn5MYVOd1kC9oA0v2eOycEw9YacEQGaH
         3efA==
X-Forwarded-Encrypted: i=1; AJvYcCWUdrlioKcWvHSIFLhRUXJWXJwxsfSb6VvKUm0X/tlV5H+t+UzMVoOy7NWffWqUsruCoJ0YvnylSvXRvVr/f2fC@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7YxzRsvX4hT0BKYwhkxbytRB/lbTWYj0X7hbgVawo2iyzDZQX
	y7QZj81G8KL4eVFq2Kq4MbC3yzKXKe7F2hlEzDP1j3l3a3AM051K4bw3XeaKDQg=
X-Gm-Gg: ASbGncvaaJ63FCWig7VipMRnMz3Vlip/6HvViqYVlwjpYDpdFi3imqIknH/eX72VbrE
	vjCZDD4CA3SMknCROfcV2dVsE9k1vIYU48TFdxCcgqgG9UNE7EwuDzA8Z/LRT4HjRmTeXikrQoz
	gE8+dnnJ9tPga+Cm216z0a4F4CjE3kFF6Auwy/z9Mep0W8USUUHgAye76k2ASQWGgSLE2Xm/LmZ
	Y0LMtwnMp+HVYafq2gb5tjDZvy8Dklj0bSx9AypDEYNQkH0BblWE/NjhWsRbZxl/KkuRIWLNprQ
	LlkeNJy/1httH/K3O9+gTGKPWwbihAq2XIMR4rC0nR3kvg9z3Yt/ax4T8vKLAq9C8eHoSfavVdp
	nqQ/teyoIwoLlfr0=
X-Google-Smtp-Source: AGHT+IGOIU+hg5lbLXSrdiLWIfIj0Z6VBovKrVeJsa1AYwz5Jfx+BVUrmpZ/19GgPgtdamSh98AS4Q==
X-Received: by 2002:a17:902:ea0e:b0:216:5e6e:68cb with SMTP id d9443c01a7336-218929a1ec5mr134535545ad.16.1734334522021;
        Sun, 15 Dec 2024 23:35:22 -0800 (PST)
Received: from [127.0.1.1] (2001-b400-e261-f376-b358-4574-ae63-0466.emome-ip6.hinet.net. [2001:b400:e261:f376:b358:4574:ae63:466])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-218a1e5ce3esm36716575ad.195.2024.12.15.23.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Dec 2024 23:35:21 -0800 (PST)
From: Geoffrey Chien <geoffrey_chien@pegatron.corp-partner.google.com>
Date: Mon, 16 Dec 2024 15:35:12 +0800
Subject: [PATCH] arm64: dts: mt8186: Add mt8186-skitty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241216-skitty_kernel-v1-1-bc75dcdfeb57@pegatron.corp-partner.google.com>
X-B4-Tracking: v=1; b=H4sIAC/YX2cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDI0Mz3eLszJKSyvjs1KK81Bxds1RjY4NEE0vjFFNDJaCegqLUtMwKsHn
 RsbW1AIxqyDxfAAAA
X-Change-ID: 20241216-skitty_kernel-6e330a493d51
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 herbert1_wu@pegatron.corp-partner.google.com, 
 Thomas_Hsieh@pegatron.corp-partner.google.com, 
 Geoffrey Chien <geoffrey_chien@pegatron.corp-partner.google.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734334517; l=9093;
 i=geoffrey_chien@pegatron.corp-partner.google.com; s=20241216;
 h=from:subject:message-id; bh=tzaOt2BnX2MCQK+1QpzW9jTGoy3s0LwZzuPUxYu++Go=;
 b=nvHpO/GngrjjlY6vJkhlBhJb03k5ZRSwMHlFOHjP3Us6maM9PL6CDpoS5wW//qXEvEaW2iYs7
 gqOnuwEfvsMCiYUf6HUGb1ROVXh9z+OH6AdlCLPSjPyhnzqJ2rM6YPp
X-Developer-Key: i=geoffrey_chien@pegatron.corp-partner.google.com; a=ed25519;
 pk=P8X+ifKsuR9w8T8cIa35nudXKmZX6qk0iS+5EcuwtrU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241215_233523_840368_BA74D319 
X-CRM114-Status: GOOD (  13.54  )
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

Add Skitty initial device tree.
Support second source Synaptics trackpad
Support US2 keyboard.
Enhance touch screen timing for ELAN
Based on experiment, set drive-strength to 6mA (default = 8mA)
Modify sbs battery reg to 0x0f

Signed-off-by: Geoffrey Chien <geoffrey_chien@pegatron.corp-partner.google.com>
---
 .../devicetree/bindings/arm/mediatek.yaml          |  8 +++
 arch/arm64/boot/dts/mediatek/Makefile              |  4 ++
 .../dts/mediatek/mt8186-corsola-skitty-sku1.dts    | 23 +++++++
 .../dts/mediatek/mt8186-corsola-skitty-sku2.dts    | 13 ++++
 .../dts/mediatek/mt8186-corsola-skitty-sku3.dts    | 40 ++++++++++++
 .../dts/mediatek/mt8186-corsola-skitty-sku4.dts    | 30 +++++++++
 .../boot/dts/mediatek/mt8186-corsola-skitty.dtsi   | 76 ++++++++++++++++++++++
 7 files changed, 194 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 1d4bb50fcd8d9aadb7b77e144a474b79da005056..29e7555569a772ba042e29af01ea98fdd3be1525 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -224,6 +224,14 @@ properties:
               - google,pico-sku2
           - const: google,pico
           - const: mediatek,mt8183
+      - description: Google Skitty (HP Chromebook G1m 11 inch)
+        items:
+          - const: google,skitty-sku1
+          - const: google,skitty-sku2
+          - const: google,skitty-sku3
+          - const: google,skitty-sku4
+          - const: google,skitty
+          - const: mediatek,mt8186
       - description: Google Willow (Acer Chromebook 311 C722/C722T)
         items:
           - enum:
diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index 8fd7b2bb7a1590341e7bb4ea1ecf039ae3e8eb0d..328e1ee444bd81b5a2aa3d21acb7a5c5a3318a87 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -59,6 +59,10 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-magneton-sku393216.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-magneton-sku393217.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-magneton-sku393218.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-rusty-sku196608.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-skitty-sku1.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-skitty-sku2.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-skitty-sku3.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-skitty-sku4.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-steelix-sku131072.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-steelix-sku131073.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-tentacool-sku327681.dtb
diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty-sku1.dts b/arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty-sku1.dts
new file mode 100644
index 0000000000000000000000000000000000000000..a0e7b10445333d6f83fc4c461ce8f8d75ffaa697
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty-sku1.dts
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2024 Google LLC
+ */
+
+/dts-v1/;
+#include "mt8186-corsola-skitty.dtsi"
+
+/ {
+	model = "Google Skitty sku1 board";
+	compatible = "google,skitty-sku1",
+		"google,skitty", "google,corsola", "mediatek,mt8186";
+};
+
+&i2c1 {
+	/delete-node/ touchscreen@10;
+	touchscreen: touchscreen@10 {
+		compatible = "elan,ekth3500";
+		reg = <0x10>;
+		interrupts-extended = <&pio 12 IRQ_TYPE_LEVEL_LOW>;
+		status = "okay";
+	};
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty-sku2.dts b/arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty-sku2.dts
new file mode 100644
index 0000000000000000000000000000000000000000..c071c1b8952b50eacfc2d48dbb9450e9b358ef0e
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty-sku2.dts
@@ -0,0 +1,13 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2024 Google LLC
+ */
+
+/dts-v1/;
+#include "mt8186-corsola-skitty.dtsi"
+
+/ {
+	model = "Google Skitty sku2 board";
+	compatible = "google,skitty-sku2",
+		"google,skitty", "google,corsola", "mediatek,mt8186";
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty-sku3.dts b/arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty-sku3.dts
new file mode 100644
index 0000000000000000000000000000000000000000..09b4b26aba93c0e65b5fbef6eb81edbe414daa0b
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty-sku3.dts
@@ -0,0 +1,40 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2024 Google LLC
+ */
+
+/dts-v1/;
+#include "mt8186-corsola-skitty.dtsi"
+
+/ {
+	model = "Google Skitty sku3 board";
+	compatible = "google,skitty-sku3",
+		"google,skitty", "google,corsola", "mediatek,mt8186";
+};
+
+&i2c1 {
+	/delete-node/ touchscreen@10;
+	touchscreen: touchscreen@10 {
+		compatible = "elan,ekth3500";
+		reg = <0x10>;
+		interrupts-extended = <&pio 12 IRQ_TYPE_LEVEL_LOW>;
+		status = "okay";
+	};
+};
+
+&keyboard_controller {
+	linux,keymap = <
+		MATRIX_KEY(0x00, 0x02, KEY_BACK)
+		MATRIX_KEY(0x03, 0x02, KEY_REFRESH)
+		MATRIX_KEY(0x02, 0x02, KEY_ZOOM)
+		MATRIX_KEY(0x01, 0x02, KEY_SCALE)
+		MATRIX_KEY(0x03, 0x04, KEY_SYSRQ)
+		MATRIX_KEY(0x02, 0x04, KEY_BRIGHTNESSDOWN)
+		MATRIX_KEY(0x01, 0x04, KEY_BRIGHTNESSUP)
+		MATRIX_KEY(0x02, 0x09, KEY_MUTE)
+		MATRIX_KEY(0x01, 0x09, KEY_VOLUMEDOWN)
+		MATRIX_KEY(0x00, 0x04, KEY_VOLUMEUP)
+		CROS_STD_MAIN_KEYMAP
+		MATRIX_KEY(0x04, 0x00, KEY_102ND)
+	>;
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty-sku4.dts b/arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty-sku4.dts
new file mode 100644
index 0000000000000000000000000000000000000000..c3e2dbd0120f32062dba6a2f6f9e8ee31db02588
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty-sku4.dts
@@ -0,0 +1,30 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2024 Google LLC
+ */
+
+/dts-v1/;
+#include "mt8186-corsola-skitty.dtsi"
+
+/ {
+	model = "Google Skitty sku4 board";
+	compatible = "google,skitty-sku4",
+		"google,skitty", "google,corsola", "mediatek,mt8186";
+};
+
+&keyboard_controller {
+	linux,keymap = <
+		MATRIX_KEY(0x00, 0x02, KEY_BACK)
+		MATRIX_KEY(0x03, 0x02, KEY_REFRESH)
+		MATRIX_KEY(0x02, 0x02, KEY_ZOOM)
+		MATRIX_KEY(0x01, 0x02, KEY_SCALE)
+		MATRIX_KEY(0x03, 0x04, KEY_SYSRQ)
+		MATRIX_KEY(0x02, 0x04, KEY_BRIGHTNESSDOWN)
+		MATRIX_KEY(0x01, 0x04, KEY_BRIGHTNESSUP)
+		MATRIX_KEY(0x02, 0x09, KEY_MUTE)
+		MATRIX_KEY(0x01, 0x09, KEY_VOLUMEDOWN)
+		MATRIX_KEY(0x00, 0x04, KEY_VOLUMEUP)
+		CROS_STD_MAIN_KEYMAP
+		MATRIX_KEY(0x04, 0x00, KEY_102ND)
+	>;
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty.dtsi b/arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..51a05f96191b4e40ad1f77e6a8ea23c99af3b279
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty.dtsi
@@ -0,0 +1,76 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2024 Google LLC
+ */
+
+/dts-v1/;
+#include "mt8186-corsola-krabby.dtsi"
+
+&keyboard_controller {
+	function-row-physmap = <
+		MATRIX_KEY(0x00, 0x02, 0)	/* T1 */
+		MATRIX_KEY(0x03, 0x02, 0)	/* T2 */
+		MATRIX_KEY(0x02, 0x02, 0)	/* T3 */
+		MATRIX_KEY(0x01, 0x02, 0)	/* T4 */
+		MATRIX_KEY(0x03, 0x04, 0)	/* T5 */
+		MATRIX_KEY(0x02, 0x04, 0)	/* T6 */
+		MATRIX_KEY(0x01, 0x04, 0)	/* T7 */
+		MATRIX_KEY(0x02, 0x09, 0)	/* T8 */
+		MATRIX_KEY(0x01, 0x09, 0)	/* T9 */
+		MATRIX_KEY(0x00, 0x04, 0)	/* T10 */
+	>;
+
+	linux,keymap = <
+		MATRIX_KEY(0x00, 0x02, KEY_BACK)
+		MATRIX_KEY(0x03, 0x02, KEY_REFRESH)
+		MATRIX_KEY(0x02, 0x02, KEY_ZOOM)
+		MATRIX_KEY(0x01, 0x02, KEY_SCALE)
+		MATRIX_KEY(0x03, 0x04, KEY_SYSRQ)
+		MATRIX_KEY(0x02, 0x04, KEY_BRIGHTNESSDOWN)
+		MATRIX_KEY(0x01, 0x04, KEY_BRIGHTNESSUP)
+		MATRIX_KEY(0x02, 0x09, KEY_MUTE)
+		MATRIX_KEY(0x01, 0x09, KEY_VOLUMEDOWN)
+		MATRIX_KEY(0x00, 0x04, KEY_VOLUMEUP)
+		CROS_STD_MAIN_KEYMAP
+	>;
+};
+
+&usb_c1 {
+	status = "disabled";
+};
+
+&target {
+	temperature = <76000>;
+};
+
+&i2c2 {
+	touchpad@2c {
+		compatible = "hid-over-i2c";
+		reg = <0x2c>;
+		hid-descr-addr = <0x20>;
+		interrupts-extended = <&pio 11 IRQ_TYPE_LEVEL_LOW>;
+		vcc-supply = <&pp3300_s3>;
+		wakeup-source;
+	};
+};
+
+&mmc1_pins_uhs {
+	pins-clk {
+		drive-strength = <MTK_DRIVE_6mA>;
+	};
+
+	pins-cmd-dat {
+		drive-strength = <MTK_DRIVE_6mA>;
+	};
+};
+
+&i2c_tunnel {
+	/delete-node/ sbs-battery@b;
+
+	battery: sbs-battery@f {
+		compatible = "sbs,sbs-battery";
+		reg = <0xf>;
+		sbs,i2c-retry-count = <2>;
+		sbs,poll-retry-count = <1>;
+	};
+};

---
base-commit: 78d4f34e2115b517bcbfe7ec0d018bbbb6f9b0b8
change-id: 20241216-skitty_kernel-6e330a493d51

Best regards,
-- 
Geoffrey Chien <geoffrey_chien@pegatron.corp-partner.google.com>


