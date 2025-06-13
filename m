Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 231BEC71136
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 13:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t0U01zrim3Zbqcil3O4HFI2BkOpjanGCCkoqKewv0vk=; b=CQnq8E0NPgZ47n6NS3C09qHx1m
	rOxe/5B46gJcK2kPgC6kDv+yMrKd/Rn+ONrgf06NYhpQoMaOl6eqAnl+wj9bzr+An0OTDtXRRYum1
	fZxGf3ganjMMh1HAIq/YwruMxH8zxMaz6gzzNoJqHP3/eVuGfkfCQSib7vAJXGd5xyLfrgxmWVFrQ
	mM5YyEP/V+NGshYegExjZc6ScbCor70jBF4eeqDHE5agn+2UJsO6/Vq3827xrNNQidD1pVuUbzRD8
	xg26t0qZisGUfBXgh6qcY8lkxN3FYF7qpSW95aQsDa/Jwa5EJ2NBGRsa9JnznewpjYBtXoSZVj+e2
	gL3zRK+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ4nJ-0000000GZ8O-2YaQ;
	Fri, 13 Jun 2025 13:50:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ4cu-0000000GVV6-3Lyh;
	Fri, 13 Jun 2025 13:39:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Content-ID:Content-Description;
	bh=t0U01zrim3Zbqcil3O4HFI2BkOpjanGCCkoqKewv0vk=; b=MEKK3WGXtvEK4WZrS6mzXTXD0K
	Or9mSVq0oOXf6dbgkEpPoNyckphFJJ4mdaaZQRKpCNOWuvoyAihoBmjsWlW4lYTuv9BUUofiSU/cT
	1tFZG6qXlcQ8jNQoevgehcWGx7lUQ4C6Pq/D0iW9kViQoJioSAUY+MAIUkXyGWzvcYffaGjQVgZmB
	49EohgAyKJ+5fWXOwq/rbvDAS8mc85UGtfBL4UE5ovAAsPl57vKmFywDPnC5Ev5jrujfpbFFreSr5
	gTPWjwpQviXsatpL657GKXAprnCTl9bZbfh9KrUoUrriLvQTF7ubPLMJ60SiIb5SVGB98BPRjSR+W
	I+fzt3wA==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ4cs-000000030hb-0eai;
	Fri, 13 Jun 2025 13:39:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 47A555C697C;
	Fri, 13 Jun 2025 13:37:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 90679C4CEEF;
	Fri, 13 Jun 2025 13:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749821957;
	bh=TH0hgxyh5i3gv/6kqXf5Rz6s4iXGUSUXb14mkxEA5pc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=SgFY64J2G7OvEznEUgDW5TKPZBLxZxJIOtNPq38iXO+cYayvQvhUCz1VqkicWLscZ
	 zltE3AgMrlyMGGjTpMpInqpTcK9VBVUOxsfLN4JI/t9m2QxGeQKZNZyBo5q+/38ovF
	 M6mpxDTc2xNSMIJIijdgQchI2rvC8Oh5rcy/dOkhTG0mlj6cacJfmLzYYxFrlh+45b
	 lj1f0h/J972WYKwqh8RfZRBM89yzHvHrjkFCJ6SqEY12mActDWAOTu2lvyHRLAIHKf
	 pJNnRSDD9AkulyRmZdXWA0anIgpwxYlRhxZ1oxuHel1bBmdTWIj7GG+Mds18ojquA5
	 kttIMW+8YTuAQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8185DC71151;
	Fri, 13 Jun 2025 13:39:17 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Fri, 13 Jun 2025 15:39:14 +0200
Subject: [PATCH v3 2/2] arm64: dts: amlogic: Add Ugoos AM3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250613-ugoos-am3-v3-2-f8a43e6bbfdb@posteo.net>
References: <20250613-ugoos-am3-v3-0-f8a43e6bbfdb@posteo.net>
In-Reply-To: <20250613-ugoos-am3-v3-0-f8a43e6bbfdb@posteo.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749821956; l=4767;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=eeJa1pnKTo6xuMFOpShBZIU9ngPVs1Np32jvFt+1klM=;
 b=YFPM/fT/9mGlgV5aDi8wMRvX9l0IZXutthl2o4gOiuo7TL+9G+quyg78GmlyMbevHzbHknBk1
 ElPxI6fEwMTC3drHI4+kccHZMJ7ombo7DLCIs4NFBHtTZYdSe6J3hrO
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_143922_492855_C24D0BAB 
X-CRM114-Status: GOOD (  17.72  )
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
Reply-To: j.ne@posteo.net
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: "J. Neuschäfer" <j.ne@posteo.net>

The Ugoos AM3 is a small set-top box based on the Amlogic S912 SoC,
with a board design that is very close to the Q20x development boards.
The MMC max-frequency properties are copied from the downstream device
tree.

  https://ugoos.com/ugoos-am3-16g

The following functionality has been tested and is known to work:
 - debug serial port
 - "update" button inside the case
 - USB host mode, on all three ports
 - HDMI video/audio output
 - eMMC, MicroSD, and SDIO WLAN
 - S/PDIF audio output
 - Ethernet
 - Infrared remote control input

The following functionality doesn't seem to work:
 - USB role switching and device mode on the "OTG" port
 - case LED

Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---

V3:
- Add Martin's and Neil's R-b tags

V2:
- Fix vendor name in patch subject
- Remove incorrect override of SDIO pwrseq reset line
---
 arch/arm64/boot/dts/amlogic/Makefile               |  1 +
 .../arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi |  2 +-
 .../arm64/boot/dts/amlogic/meson-gxm-ugoos-am3.dts | 91 ++++++++++++++++++++++
 3 files changed, 93 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
index 15e7901c126876964b858d2afaaaa5a5c86f1c22..619dce79b0204d286d1f45443fd681c9b58e7f2d 100644
--- a/arch/arm64/boot/dts/amlogic/Makefile
+++ b/arch/arm64/boot/dts/amlogic/Makefile
@@ -80,6 +80,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-gxm-q200.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxm-q201.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxm-rbox-pro.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxm-s912-libretech-pc.dtb
+dtb-$(CONFIG_ARCH_MESON) += meson-gxm-ugoos-am3.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxm-vega-s96.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxm-wetek-core2.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-s4-s805x2-aq222.dtb
diff --git a/arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi
index 6da1316d97c60c8445477375bddb161fc0c6a7f4..b4f88ed6273b8f0db956d163451ea6855c45fe48 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi
@@ -97,7 +97,7 @@ sdio_pwrseq: sdio-pwrseq {
 		clock-names = "ext_clock";
 	};
 
-	cvbs-connector {
+	cvbs_connector: cvbs-connector {
 		compatible = "composite-video-connector";
 
 		port {
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-ugoos-am3.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-ugoos-am3.dts
new file mode 100644
index 0000000000000000000000000000000000000000..ba871f3f53bb99b47b325bae228b59b722c5123b
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-ugoos-am3.dts
@@ -0,0 +1,91 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2025 J. Neuschäfer <j.ne@posteo.net>
+ *
+ * Debug UART (3.3V, 115200 baud) at the corner of the board:
+ *   (4) (3) (2) [1]
+ *   Vcc RXD TXD GND
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/interrupt-controller/amlogic,meson-g12a-gpio-intc.h>
+
+#include "meson-gxm.dtsi"
+#include "meson-gx-p23x-q20x.dtsi"
+
+/ {
+	compatible = "ugoos,am3", "amlogic,s912", "amlogic,meson-gxm";
+	model = "Ugoos AM3";
+
+	adc-keys {
+		compatible = "adc-keys";
+		io-channels = <&saradc 0>;
+		io-channel-names = "buttons";
+		keyup-threshold-microvolt = <1710000>;
+
+		button-function {
+			label = "Update";
+			linux,code = <KEY_VENDOR>;
+			press-threshold-microvolt = <10000>;
+		};
+	};
+};
+
+&cvbs_connector {
+	/* Not used on this board */
+	status = "disabled";
+};
+
+&ethmac {
+	pinctrl-0 = <&eth_pins>;
+	pinctrl-names = "default";
+
+	/* Select external PHY by default */
+	phy-handle = <&external_phy>;
+
+	amlogic,tx-delay-ns = <2>;
+
+	/* External PHY is in RGMII */
+	phy-mode = "rgmii";
+
+	status = "okay";
+};
+
+&external_mdio {
+	external_phy: ethernet-phy@0 {
+		/* Realtek RTL8211F (0x001cc916) */
+		reg = <0>;
+
+		reset-assert-us = <10000>;
+		reset-deassert-us = <80000>;
+		reset-gpios = <&gpio GPIOZ_14 GPIO_ACTIVE_LOW>;
+
+		interrupt-parent = <&gpio_intc>;
+		/* MAC_INTR on GPIOZ_15 */
+		interrupts = <25 IRQ_TYPE_LEVEL_LOW>;
+	};
+};
+
+&i2c_B {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c_b_pins>;
+
+	rtc: rtc@51 {
+		compatible = "haoyu,hym8563";
+		reg = <0x51>;
+		#clock-cells = <0>;
+	};
+};
+
+/* WLAN: Atheros 10k (QCA9377) */
+&sd_emmc_a {
+	max-frequency = <200000000>;
+};
+
+/* eMMC */
+&sd_emmc_c {
+	max-frequency = <100000000>;
+};

-- 
2.48.0.rc1.219.gb6b6757d772



