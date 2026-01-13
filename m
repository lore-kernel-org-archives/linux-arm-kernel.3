Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAEA0CF45DA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 00:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/GyImWZTbKl+ezkSlROtAG0Gk3LdRCG1Mciv3tVf1qk=; b=A/PE04rxsTiETaZJEN6+djmZEG
	6w8dhnRBPNIGCbWdfJFn+sPxKbkvTgmbQg2M+Wexo10Krh8z7qdnl1bOokEFJTJzAjev9RNe3cBA1
	Pw/KJOmsNpYJDUjYblhxcXRv+DEAqhQzaasBN3UaSUAyeWV0nVPcpI1wXI4B4BqNRBezx87vgR/eP
	/wT/vALiO4lqs/Tk3kufpAwuRlmRb9l8OxTLBaTcWM9NeNGmeLLW73hMXQNzcem9xazBAP5CvxuKl
	h+nJp346muzHOD2N5tD1rnTgnW6QttZYc82AHu4pwZRl2JevRzfitjDyTnSGj/RuKe/Z8K0OZp1db
	Ph/5DU/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfRwd-00000006Kl2-0cPA;
	Tue, 13 Jan 2026 00:07:35 +0000
Received: from mout-p-101.mailbox.org ([2001:67c:2050:0:465::101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfRwa-00000006Kjt-0XAd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 00:07:33 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4dqqLp3bqsz9t2h;
	Tue, 13 Jan 2026 01:07:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1768262850;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/GyImWZTbKl+ezkSlROtAG0Gk3LdRCG1Mciv3tVf1qk=;
	b=cZx3MI6NWQZDC4UVAbRxLwUTZQhZV7Cjs0KNocbFY4ngZ+6kFUOE82JYHgnhjzBJGZc5Uw
	z8fXuRhy0hDG51LY5AP9Y5umu6FuVr1JY3V/egHvs9YPVkWkIu/NtJGljCGvvlqRoXH7Er
	ShhmqcGDDgRgWDZPt40JH/ZLJyYJyvuWiUJH2eTVjju5QtB6XvKXkmZTG50Ez7lnCkCzIr
	bqgzpRcaLWctu9q27CsMTIdTHDvjNa01yGVjTtGiGBDxno33SK4SG/SOg7MkGiUuz6CZHn
	8PbSJr3SjkvWlz1I051S6nesLT99rVbidt+ffEx9dSzZYVdpVUBmYVPI6K2JBg==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=wA47KovY;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1768262848;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/GyImWZTbKl+ezkSlROtAG0Gk3LdRCG1Mciv3tVf1qk=;
	b=wA47KovYvsW0V19y+bcfQ5Ou2DwGkR8+3VrbEbPe8PzpWWUAhK54cJxsVmx+vuM6NTdseN
	aCFeI55n7jFlQsir+sbp813WBtAvZnQokvIMwEuzyzRnOAPNjplVN01JAxsU2JDLXgSc6Q
	dZvc+qIcoOCpudpVj7GHmxUrMegXyjFo+DImCxTgan2QI4Kc3m1ejGQfhe8T8addlylkxQ
	rLiv+6OQcskLNYZ/IyM/JdKkrkrpMKJ9T3vELrk4xq7fNNMTIwOUgB5dEqh9e5ZxsuIXv7
	kO4E4Hr/5g8aNUopzQMlPemYuaC1h4p/f4JXgFpP2zzVkCiWGGRC2oORaBUqRw==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Sam Ravnborg <sam@ravnborg.org>,
	Simona Vetter <simona@ffwll.ch>,
	Thierry Reding <thierry.reding@gmail.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: renesas: sparrow-hawk: Add overlay for WaveShare Display 13.3"
Date: Tue, 13 Jan 2026 01:05:31 +0100
Message-ID: <20260113000715.231238-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260113000715.231238-1-marek.vasut+renesas@mailbox.org>
References: <20260113000715.231238-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 5rwg5zk9ujw1snn6pc6ci6jc77s4breu
X-MBO-RS-ID: 05d7ad5e57ae50e8301
X-Rspamd-Queue-Id: 4dqqLp3bqsz9t2h
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_160732_311266_FFD9486A 
X-CRM114-Status: GOOD (  15.43  )
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

Add a DT overlay to bind the WaveShare 13.3inch 1920x1080 DSI Capacitive
Touch Display on the Retronix R-Car V4H Sparrow Hawk board.

Current device link is at https://www.waveshare.com/13.3inch-dsi-lcd.htm

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
DEPENDS:
- https://lore.kernel.org/linux-input/20260112234534.225954-1-marek.vasut+renesas@mailbox.org/
- https://lore.kernel.org/linux-devicetree/20260112234834.226128-1-marek.vasut+renesas@mailbox.org/
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Jessica Zhang <jesszhan0024@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 arch/arm64/boot/dts/renesas/Makefile          |   3 +
 ...r8a779g3-sparrow-hawk-ws-display-13in.dtso | 108 ++++++++++++++++++
 2 files changed, 111 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-ws-display-13in.dtso

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 1fab1b50f20e6..8a2d1baa69c77 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -120,6 +120,9 @@ dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-rpi-display-2-5in.dtb
 dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-rpi-display-2-7in.dtbo
 r8a779g3-sparrow-hawk-rpi-display-2-7in-dtbs := r8a779g3-sparrow-hawk.dtb r8a779g3-sparrow-hawk-rpi-display-2-7in.dtbo
 dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-rpi-display-2-7in.dtb
+dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-ws-display-13in.dtbo
+r8a779g3-sparrow-hawk-ws-display-13in-dtbs := r8a779g3-sparrow-hawk.dtb r8a779g3-sparrow-hawk-ws-display-13in.dtbo
+dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-ws-display-13in.dtb
 
 dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-white-hawk-single.dtb
 r8a779g3-white-hawk-single-ard-audio-da7212-dtbs := r8a779g3-white-hawk-single.dtb white-hawk-ard-audio-da7212.dtbo
diff --git a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-ws-display-13in.dtso b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-ws-display-13in.dtso
new file mode 100644
index 0000000000000..e520fa264d790
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-ws-display-13in.dtso
@@ -0,0 +1,108 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Overlay for the Waveshare 13.3 MIPI DSI panel connected
+ * to J4:DSI on R-Car V4H ES3.0 Sparrow Hawk board
+ *
+ * Copyright (C) 2025-2026 Marek Vasut <marek.vasut+renesas@mailbox.org>
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	panel {
+		compatible = "waveshare,13.3inch-panel", "panel-dpi";
+		width-mm = <293>;
+		height-mm = <163>;
+		power-supply = <&reg_5p0v>;
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&bridge_out>;
+			};
+		};
+
+		panel-timing {
+			clock-frequency = <148500000>;
+			hactive = <1920>;
+			vactive = <1080>;
+			hfront-porch = <88>;
+			hback-porch = <148>;
+			hsync-len = <44>;
+			vback-porch = <4>;
+			vfront-porch = <36>;
+			vsync-len = <5>;
+			hsync-active = <1>;
+			vsync-active = <1>;
+			de-active = <0>;
+			pixelclk-active = <0>;
+		};
+	};
+
+	reg_5p0v: regulator-5p0v {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-5.0V";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+};
+
+&i2c0_mux3 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	touchscreen@41 {
+		compatible = "ilitek,ili251x";
+		reg = <0x41>;
+	};
+
+	bridge@45 {
+		compatible = "waveshare,dsi2dpi";
+		reg = <0x45>;
+		power-supply = <&reg_5p0v>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				bridge_in: endpoint {
+					data-lanes = <1 2 3 4>;
+					remote-endpoint = <&dsi0_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				bridge_out: endpoint {
+					remote-endpoint = <&panel_in>;
+				};
+			};
+		};
+	};
+};
+
+&dsi0 {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@1 {
+			reg = <1>;
+
+			dsi0_out: endpoint {
+				remote-endpoint = <&bridge_in>;
+				data-lanes = <1 2 3 4>;
+			};
+		};
+	};
+};
-- 
2.51.0


