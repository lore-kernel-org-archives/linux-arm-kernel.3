Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBF3EC79FBF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 15:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fMLzyvdCDhOp+LMAXMo33v6YgTadM1kq8Lfjv4tjsH8=; b=IghTVV0EDXpQl8gHeGCCTEl68a
	QbaW5dH4Nnt8xObzwFVl5gE8hXyTZ2ZV5FbNrBVVGtOUu7wsUmTFtj1UQxzd77qGHwNmEtY23+gPT
	QPn0//lLbKhWvxGDa12e0D7jsbgwsL2Yl+02e7qtJ0vvx+HL9ovd3hRXaO1fe3Jx0LD+eK6wdly4j
	fuIooBJKDKYhdadVCAPh8LWr1xSbY5Qy8fRxh0yivtD44LWDoP9YqRctctLoeTHrzenMqJ71FDwW7
	i0KpeFDYwHvIdoV2p6NWhS70F7XjYWEZ+0eNM4Jn0CVKdpmIwV5wbCk3LRdRlS3uB+hJmyk2MzCvy
	tXoJ0BGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4gZX-0000000Em0W-1NsT;
	Thu, 10 Sep 2026 15:20:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4gZV-0000000ElzE-2dJ2
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 10 Sep 2026 15:20:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=fMLzyvdCDhOp+LMAXMo33v6YgTadM1kq8Lfjv4tjsH8=; b=F/xE/F7KGWpMTHv8yW6kV26qtw
	rwo4dAslayTcxKeLh2dqjsfVXfwb9XU3IZZ1OzYXb2zcLBuDzyv5GXVcOxl5PWyzm7j3QHgwY1YXL
	OmKDNJRIZ6SI0HAbGBMotvzZJPRPXG5ySEL2fewC1jYgG9qL8zS/Ndc/NtYnyEoc/ne4p9DPj8ePI
	QmyW97i59TkNE0aEfyvBbcf/Fakia2ShStlxWDlhGgkkwZBTa2DwLAdAFCfslWLW0aYCw+rVOYVRN
	a3n5K1F2q4Y/6S4mKv91ReuW9dd/JDVAAW9Ttsa5ZlV/1tLUKu78X5yXPD9MJwxm94aKd8E+FAR2X
	jegfHQuA==;
Received: from mail.fris.de ([116.203.77.234])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4gZR-00000002fLu-1vYx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 15:20:16 +0000
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1789053611;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fMLzyvdCDhOp+LMAXMo33v6YgTadM1kq8Lfjv4tjsH8=;
	b=zfxCzCRxpsgEG1AjAnutkwMFKvd7iRH45PJsNk0Dy+mqADVvnFefwJquPyrOot9SkABRCM
	jaZjpQZyhKBCSAmcM4DFWZsU/eKXFfTy+ug9SVtC17DBjlg1YOPAgTGnUYXsyeL4b/teyt
	8+x/y3sOvq3TuFddB616qpGaR/nHDsXfkGsGAZhcuZ61sr5jJTY5Mein1r2oYriBa3ELyr
	7ucQ3fKNyXaApS43UrWsqVWYASv7DVvKMgme81/+gB8Hq15P5jCIrJOCOaFMezG4BHrQzr
	Vu438FaX8iHdStoMdMJq8tOgf5lOjJTkE6arpaHXnW+w23006731o1JJiivaog==
Date: Thu, 10 Sep 2026 17:19:07 +0200
Subject: [PATCH 2/2] arm64: dts: imx93-kontron: Add support for Kontron
 i.MX93 DL
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-upstreaming-v7-3-imx93-displayline-v1-2-bb9446e6ed6e@kontron.de>
References: <20260910-upstreaming-v7-3-imx93-displayline-v1-0-bb9446e6ed6e@kontron.de>
In-Reply-To: <20260910-upstreaming-v7-3-imx93-displayline-v1-0-bb9446e6ed6e@kontron.de>
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Frieder Schrempf <frieder.schrempf@kontron.de>, 
 Mikhail Vaniulin <mikhail.vaniulin@axians.rs>
X-Developer-Signature: v=1; a=openpgp-sha256; l=3435;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=2MoUiiYl7TgFn82k5cuGD2bvJWlqdJspTEKCJ86zaqY=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JIWvRqZViT9U8Lm1gjAv1zTzaq2L+omzz04+Oay1eTtrX0
 Lrs54RlHaUsDGJcDLJiiixS/Bavbc1ifeSPVUfBzGFlAhnCwMUpABM5vpbhn9K6RS5HtmU/M8g+
 4Ou1pKziTbfdhi1qm9flK6XoNz0Jnsjwv6DfLXTlaaY5McUpegY/WtZZB9XcCa2stFvmacx09PM
 NPgA=
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_162013_661930_DC97959E 
X-CRM114-Status: GOOD (  12.23  )
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

From: Mikhail Vaniulin <mikhail.vaniulin@axians.rs>

This provides an overlay to enable the 7" LVDS panel on Kontron
i.MX93 DL devices.

Signed-off-by: Mikhail Vaniulin <mikhail.vaniulin@axians.rs>
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 arch/arm64/boot/dts/freescale/Makefile             |   4 +
 .../arm64/boot/dts/freescale/imx93-kontron-dl.dtso | 104 +++++++++++++++++++++
 2 files changed, 108 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 95ae85ab4adf..2f0d3378c050 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -653,6 +653,10 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-11x11-frdm-pixpaper.dtb
 
 dtb-$(CONFIG_ARCH_MXC) += imx93-14x14-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-kontron-bl-osm-s.dtb
+
+imx93-kontron-dl-dtbs += imx93-kontron-bl-osm-s.dtb imx93-kontron-dl.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx93-kontron-dl.dtb
+
 dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-nash.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin.dtb
 
diff --git a/arch/arm64/boot/dts/freescale/imx93-kontron-dl.dtso b/arch/arm64/boot/dts/freescale/imx93-kontron-dl.dtso
new file mode 100644
index 000000000000..2d962823dfeb
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx93-kontron-dl.dtso
@@ -0,0 +1,104 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Copyright (C) 2024 Kontron Electronics GmbH
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+&{/} {
+	model = "Kontron DL i.MX93 OSM-S";
+	compatible = "kontron,imx93-bl-osm-s", "kontron,imx93-osm-s", "fsl,imx93";
+
+	backlight: backlight {
+		compatible = "pwm-backlight";
+		pwms = <&tpm3 3 50000 0>;
+		brightness-levels = <0 100>;
+		num-interpolated-steps = <100>;
+		default-brightness-level = <100>;
+	};
+
+	panel {
+		compatible = "jenson,bl-jt60050-01a", "panel-lvds";
+		backlight = <&backlight>;
+		data-mapping = "vesa-24";
+		enable-gpios = <&gpio2 29 GPIO_ACTIVE_HIGH>;
+		power-supply = <&reg_vcc_panel>;
+		height-mm = <86>;
+		width-mm = <154>;
+
+		panel-timing {
+			clock-frequency = <50000000>;
+			hactive = <1024>;
+			hback-porch = <160>;
+			hfront-porch = <160>;
+			hsync-len = <1>;
+			vactive = <600>;
+			vback-porch = <23>;
+			vfront-porch = <12>;
+			vsync-len = <1>;
+		};
+
+		port {
+			panel_in_lvds0: endpoint {
+				remote-endpoint = <&ldb_lvds_ch0>;
+			};
+		};
+	};
+};
+
+&gpio3 {
+	panel-rst-hog {
+		gpio-hog;
+		gpios = <26 GPIO_ACTIVE_LOW>;
+		output-low;
+		line-name = "panel-reset";
+	};
+
+	panel-stby-hog {
+		gpio-hog;
+		gpios = <27 GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "panel-standby";
+	};
+};
+
+&lcdif {
+	status = "okay";
+};
+
+&ldb_lvds_ch0 {
+	remote-endpoint = <&panel_in_lvds0>;
+};
+
+&lpi2c2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	touchscreen@5d {
+		compatible = "goodix,gt928";
+		reg = <0x5d>;
+		interrupt-parent = <&gpio2>;
+		interrupts = <22 IRQ_TYPE_LEVEL_LOW>;
+		irq-gpios = <&gpio2 22 GPIO_ACTIVE_HIGH>;
+		AVDD28-supply = <&reg_vcc_panel>;
+		VDDIO-supply = <&reg_vcc_panel>;
+		reset-gpios = <&gpio2 28 GPIO_ACTIVE_HIGH>;
+	};
+};
+
+&lvds_bridge {
+	status = "okay";
+};
+
+&media_blk_ctrl {
+	status = "okay";
+};
+
+&tpm3 {
+	status = "okay";
+};

-- 
2.55.0


