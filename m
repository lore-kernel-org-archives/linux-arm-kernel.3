Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A48CC02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 07:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KBzdP99yV3ZxCwnGo2sE7OX1HCuNFPynfYdsPZrFS/k=; b=eDosyvMDNFbYIW5wZxiI5oOtBN
	gNoQaXJc6DGvQz+jEVqSNGgLIhNJTVBTRLVLXfY0XJdkFqLKNxZngtbrJp8IjiLGLrUKcUo5oWplu
	zsmYSwnBnwclVCB6yQYE6beFyF0K82d92kur9ekoviwqfFfVZNL/KoQ3oLKCT6x/swZgoHgkHC+xh
	cZHHs4DIAO8NDEejj2y7K2xpdzI4dQ18fj3De399yLmR6MuqhrQ1zedIPdkjBq/rgpcKLf8tmnb4y
	3nwh9ugfjVIra+LSAarkJlhCneX5BJP0ZmUFV2JshhMjiPwxfW8WfKdyUyFc2ZT8/DXCepUrNKsj1
	ZF5pCk3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXy7x-0000000Az0P-3xZA;
	Wed, 15 Jan 2025 07:47:49 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXy4O-0000000AyUm-1ODO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 07:44:09 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-21636268e43so150687385ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jan 2025 23:44:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pegatron-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1736927048; x=1737531848; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KBzdP99yV3ZxCwnGo2sE7OX1HCuNFPynfYdsPZrFS/k=;
        b=KCNshPhThheBRkioUL8UNLV4IK+xAeF0HJwWrn9rrF2rw+ouw9AE+g2wDUF2FV00P8
         Cl2GffHJdti2VlCyfJBBk+vY4QOJTc1lrCCwWEYN3f48dPqbf5UcZOivukQWqLYwdsIh
         jLxEi/eg8oeA8kztJuMMsuJ80/m1OQFuhYuBbEDEnPNjewbXREd/ipxb1aj/bY3TWagO
         jR6BhNaHVobOTpRaJn6764k4bj4S8CyfjF3t8xN2Zc2VVVnvx8icpsjKA/Qt6gK+e8OE
         uA4+PzBpgra01wqIeIjL8OA92YEgNwIDXvJpTrg+MFx4/t34w4Ozl7QETDaYfdh5SfjR
         BHBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736927048; x=1737531848;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KBzdP99yV3ZxCwnGo2sE7OX1HCuNFPynfYdsPZrFS/k=;
        b=JPEFNxEZ6zqB/FsoCSWvY2d9Z2ISpHgETarYBB3F/Bs/uxOEa6EnKUDqFf/6Oe4yGk
         VMtZsHhIpqzAiEXyGP1iUnsTYEMcEhRuOzeau+BfTsDaXkymhbc7lpdmz5/PXc0PK2tG
         rkSlNx//QpMB061dZIX9UCskceRpRXrw0ct7oFI1tFsEPa+2lC1F4hj2NvWQgiWXa97y
         uSZrOVi4TgRYr6hdz7st/pQD12GNN8lZ5Nlp9objTfbiHqX7bgxp1VPrp+Elok16vYtt
         YOMvvR3CrSV/xnrX+gea76xwFeqQJsNGSLHLPGWJLdGq3tqhf0u1lNu2WR7eOX9i0gaJ
         1j8A==
X-Forwarded-Encrypted: i=1; AJvYcCUe4uYU0vgn5z2J3OABZp5fiUN9e18NRMN5lexw50sH3n1wvQqLJW7OO7DUL1Flj3EYxFwWXHJwvprvDI7jolNE@lists.infradead.org
X-Gm-Message-State: AOJu0YzKCU5ftuLTkbB4uxXxycK20CFv8h86GfInxgOgNPl16S5SqCNn
	0y65VBl4i+rkeaGczDHRUKJLC9ZCa+nO3Sc4dvcnZ70DRXv+4qLqu4hmv69pBu8=
X-Gm-Gg: ASbGncuIAZFUTMpf0iEhYtypmbQ2XO8DJ8OU81MQvUpRo/bBRhOMVERG56lqGpofYbe
	DT/CfaXnqAqIgO2wOtCp4l44mhTam+yI+AVabLRjOaFwT+SQcsv2xbQYjWad7RLJ50At8jmWIKW
	saYSmMbxiCQ96sOQ4ZjKB/nAOorBne57yeP7QwbYWLHnMrZM7IMRI+bhNEPxCeL7p3gEZpDBr2H
	e77p15qiAW+JIan3QVvWsSX/Y2OJc4yd7uLiktbrxUBLKgiS9s8/fqKxsjzQw7kcIqP0ri2nUED
	ktQJTm+v4ULB+W/mwZ8HLLTtq/5EVyH9CFmbSn8EY483XYnWAGkw72KBm+usP6Tn0VCmKepvZKg
	H1t27N9TTZuto2DD3
X-Google-Smtp-Source: AGHT+IHxJYTMrcJUwmiV9sxWbdmBVkObu5KSmsI25YIzuCtHYnmnfHBaHATP9T7P49ge6j/aR2nDyA==
X-Received: by 2002:a05:6a20:7491:b0:1e1:a06b:375a with SMTP id adf61e73a8af0-1e88d0ddc82mr51120833637.35.1736927047711;
        Tue, 14 Jan 2025 23:44:07 -0800 (PST)
Received: from [127.0.1.1] (2001-b400-e25f-ed65-f855-8c86-b103-448b.emome-ip6.hinet.net. [2001:b400:e25f:ed65:f855:8c86:b103:448b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-a31d5047ea0sm9335482a12.58.2025.01.14.23.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 23:44:07 -0800 (PST)
From: Geoffrey Chien <geoffrey_chien@pegatron.corp-partner.google.com>
Date: Wed, 15 Jan 2025 15:43:44 +0800
Subject: [PATCH 2/2] arm64: dts: mt8186: Add MT8186 Krabby platform based
 Skitty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250115-skitty_kernel-v1-2-6ef2086858ba@pegatron.corp-partner.google.com>
References: <20250115-skitty_kernel-v1-0-6ef2086858ba@pegatron.corp-partner.google.com>
In-Reply-To: <20250115-skitty_kernel-v1-0-6ef2086858ba@pegatron.corp-partner.google.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 herbert1_wu@pegatron.corp-partner.google.com, 
 Geoffrey Chien <geoffrey_chien@pegatron.corp-partner.google.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736927028; l=11366;
 i=geoffrey_chien@pegatron.corp-partner.google.com; s=20241216;
 h=from:subject:message-id; bh=xgFEOHhyTXycUkRi65Eww7YQ5BY7+zt0b7RDW0dNem4=;
 b=AjUW+fK2yzwazSwM+i9OJNDIJOdJ2TRCqbRPCjvo9HSpqO74liUTsS0Eg92Xnv3J/1bJmYiFF
 ecyieQcmAgGAzA6U+MlCFLB6E9baYPtNIRDVeAL6nB9s5j87sXKKC36
X-Developer-Key: i=geoffrey_chien@pegatron.corp-partner.google.com; a=ed25519;
 pk=P8X+ifKsuR9w8T8cIa35nudXKmZX6qk0iS+5EcuwtrU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_234408_382848_7D9B5CD5 
X-CRM114-Status: GOOD (  15.51  )
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

Skitty is MT8186 based Chromebook based on the Krabby design.

Skitty also known as the HP Chromebook G1m 11 inch. The device is
a clamshell laptop with an optional touchscreen and keyboard.

The SKU IDs of the Skitty devices map to different touchscreen and
keyboard.

This patch depends on patch "dt-bindings: arm: mediatek: Add MT8186 Skitty"

Signed-off-by: Geoffrey Chien <geoffrey_chien@pegatron.corp-partner.google.com>
---
 arch/arm64/boot/dts/mediatek/Makefile              |  4 +
 .../dts/mediatek/mt8186-corsola-skitty-sku1.dts    | 92 +++++++++++++++++++++
 .../dts/mediatek/mt8186-corsola-skitty-sku2.dts    | 82 +++++++++++++++++++
 .../dts/mediatek/mt8186-corsola-skitty-sku3.dts    | 93 ++++++++++++++++++++++
 .../dts/mediatek/mt8186-corsola-skitty-sku4.dts    | 83 +++++++++++++++++++
 5 files changed, 354 insertions(+)

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
index 0000000000000000000000000000000000000000..d0f22888c14914aecc47351408f0fa2474d9ab3d
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty-sku1.dts
@@ -0,0 +1,92 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2024 Google LLC
+ */
+
+/dts-v1/;
+#include "mt8186-corsola-krabby.dtsi"
+
+/ {
+	model = "Google Skitty board";
+	compatible = "google,skitty-sku1", "google,skitty", "mediatek,mt8186";
+	chassis-type = "laptop";
+};
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
diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty-sku2.dts b/arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty-sku2.dts
new file mode 100644
index 0000000000000000000000000000000000000000..201195631d2411880a748bd46dbe4efb200002be
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty-sku2.dts
@@ -0,0 +1,82 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2024 Google LLC
+ */
+
+/dts-v1/;
+#include "mt8186-corsola-krabby.dtsi"
+
+/ {
+	model = "Google Skitty board";
+	compatible = "google,skitty-sku2", "google,skitty", "mediatek,mt8186";
+	chassis-type = "laptop";
+};
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
diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty-sku3.dts b/arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty-sku3.dts
new file mode 100644
index 0000000000000000000000000000000000000000..42a0bcbd61283c865dd9c167e203694f9d8891b9
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty-sku3.dts
@@ -0,0 +1,93 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2024 Google LLC
+ */
+
+/dts-v1/;
+#include "mt8186-corsola-krabby.dtsi"
+
+/ {
+	model = "Google Skitty board";
+	compatible = "google,skitty-sku3", "google,skitty", "mediatek,mt8186";
+	chassis-type = "laptop";
+};
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
+		MATRIX_KEY(0x04, 0x00, KEY_102ND)
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
diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty-sku4.dts b/arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty-sku4.dts
new file mode 100644
index 0000000000000000000000000000000000000000..581642e27043c0149bbf72b4252394f3e2f3c6ec
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty-sku4.dts
@@ -0,0 +1,83 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2024 Google LLC
+ */
+
+/dts-v1/;
+#include "mt8186-corsola-krabby.dtsi"
+
+/ {
+	model = "Google Skitty board";
+	compatible = "google,skitty-sku4", "google,skitty", "mediatek,mt8186";
+	chassis-type = "laptop";
+};
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
+		MATRIX_KEY(0x04, 0x00, KEY_102ND)
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

-- 
2.34.1


