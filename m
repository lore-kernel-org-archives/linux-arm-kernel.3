Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78AEEC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 06:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rw58FESB0zTLL3rOoRjWAP/vMtkBg8dNnr+WcNnHIeA=; b=WWKBGtTfWFKFR8FOPmGzw1LwEi
	J83uyKffhhac5rkNBVL3dIXMTdaMgtzkQXqbc8VqJ+g7ICWpDUxLZHiJXChP1vInRZfdlNYfiEb4D
	+GYC3r/9Jh2pnRqIIRK8qD5v5FNbNQtIpbx1XTkOpXaaSlcr4uRGQ0nEtTcgCJPREZQnXlsX8NwPN
	mbnYDo3Iof6tOY08BEKL1v4J0+r+sIbDZEnqx9ZVwh2VikuZOZzvUIGSD/Rcg6eNfZFtv+DF6GsfW
	4hhmmVySzOG1vxM8zOOYh8U6Uu16MlgINBahrHBzn/DMOCQPi/ZuHXhMZm2kyRrF+dBM4SVV/N9iM
	UwHPkR7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgzf1-0000000EFrp-3GjO;
	Tue, 07 Jul 2026 06:52:03 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgzev-0000000EFoY-1EHO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 06:51:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=Rw58FESB0zTLL3rOoRjWAP/vMtkBg8dNnr+WcNnHIeA=; b=YtsADyMCArFP0XM91epgdxd5ZD
	vonS0+Y87m7lZIW8ofv72uoT9/yV2oYfVhj9IbeC+Sq5cGRFX6vSgLGkSD76DZSRpITHo8KhsLliG
	ygXv/tkh294ulo9zzRylh3EoV5xNaR4psoWYy6Q/G5NCpP4ju4djJkeJfp6DJjdVEiBTL9TRoZL18
	00f+eD6YGEr38DXkwjOeJ8jAX9XX0D2VGd+TukQqZ5zdyLbhsbvJHIoMdGxR76nM4XsoY2QEnz3hN
	HE/BawFHK29VPOHvqI4OK3sjTcJS9rS+b5/9LQg31wCUQYB+gK/vf4bWV5RNkn+GUnuNUeV3wiHZQ
	v02tgRyw==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wgzet-000Lgl-0z;
	Tue, 07 Jul 2026 08:51:55 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy01.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wgzet-0005WX-0X;
	Tue, 07 Jul 2026 08:51:55 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Martin Schmiedel <Martin.Schmiedel@tq-group.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH v4 3/3] arm64: dts: imx93-tqma9352-mba93xxla-mini: Add LVDS overlay
Date: Tue,  7 Jul 2026 08:51:49 +0200
Message-ID: <20260707065151.1079667-4-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260707065151.1079667-1-alexander.stein@ew.tq-group.com>
References: <20260707065151.1079667-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28052/Mon Jul  6 08:24:35 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_235157_351343_73900D6D 
X-CRM114-Status: GOOD (  11.20  )
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

From: Martin Schmiedel <Martin.Schmiedel@tq-group.com>

Add the overlay for the Tianma TM070JVHG33 LVDS display.

Signed-off-by: Martin Schmiedel <Martin.Schmiedel@tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/Makefile        |  2 +
 .../imx93-tqma9352-mba93xxla-mini.dts         | 45 +++++++++++++++++++
 2 files changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index bd3d35ffde975..d387a4f5ed285 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -644,10 +644,12 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba91xxca-rgb-cdtech-dc44.dtb
 imx93-tqma9352-mba93xxca-lvds-tm070jvhg33-dtbs += imx93-tqma9352-mba93xxca.dtb imx93-tqma9352-mba93xxla-lvds-tm070jvhg33.dtbo
 imx93-tqma9352-mba93xxla-lvds-tm070jvhg33-dtbs += imx93-tqma9352-mba93xxla.dtb imx93-tqma9352-mba93xxla-lvds-tm070jvhg33.dtbo
 imx93-tqma9352-mba93xxla-mini-ezurio-wlan-dtbs += imx93-tqma9352-mba93xxla-mini.dtb imx93-tqma9352-mba93xxla-mini-ezurio-wlan.dtbo
+imx93-tqma9352-mba93xxla-mini-lvds-tm070jvhg33-dtbs += imx93-tqma9352-mba93xxla-mini.dtb imx93-tqma9352-mba93xxla-lvds-tm070jvhg33.dtbo
 
 dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxca-lvds-tm070jvhg33.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxla-lvds-tm070jvhg33.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxla-mini-ezurio-wlan.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxla-mini-lvds-tm070jvhg33.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-var-dart-sonata.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-var-som-symphony.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93w-evk.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla-mini.dts b/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla-mini.dts
index 4afd6b650d9d8..0d553a8da7135 100644
--- a/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla-mini.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla-mini.dts
@@ -58,6 +58,37 @@ aliases {
 		spi5 = &lpspi6;
 	};
 
+	backlight_lvds: backlight {
+		compatible = "pwm-backlight";
+		pwms = <&tpm5 0 5000000 0>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_backlight>;
+		brightness-levels = <0 4 8 16 32 64 128 255>;
+		default-brightness-level = <7>;
+		power-supply = <&reg_12v0>;
+		enable-gpios = <&gpio2 5 GPIO_ACTIVE_HIGH>;
+		status = "disabled";
+	};
+
+	display: display {
+		/*
+		 * Display is not fixed, so compatible has to be added from
+		 * DT overlay
+		 */
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_display>;
+		power-supply = <&reg_3v3>;
+		enable-gpios = <&gpio2 7 GPIO_ACTIVE_HIGH>;
+		backlight = <&backlight_lvds>;
+		status = "disabled";
+
+		port {
+			panel_in_lvds0: endpoint {
+				remote-endpoint = <&ldb_lvds_ch0>;
+			};
+		};
+	};
+
 	iio-hwmon {
 		compatible = "iio-hwmon";
 		io-channels = <&adc1 0>, <&adc1 1>, <&adc1 2>, <&adc1 3>;
@@ -311,6 +342,10 @@ &lpuart8 {
 	status = "okay";
 };
 
+&ldb_lvds_ch0 {
+	remote-endpoint = <&panel_in_lvds0>;
+};
+
 &pcf85063 {
 	/* RTC_EVENT# from SoM is connected on mainboard */
 	pinctrl-names = "default";
@@ -375,6 +410,16 @@ &usdhc3 {
 };
 
 &iomuxc {
+	pinctrl_backlight: backlightgrp {
+		fsl,pins = /* HYS | PD | FSEL_2 | DSE X4 */
+			   <MX93_PAD_GPIO_IO05__GPIO2_IO05			0x011e>;
+	};
+
+	pinctrl_display: displaygrp {
+		fsl,pins = /* HYS | PD | FSEL_2 | DSE X4 */
+			   <MX93_PAD_GPIO_IO07__GPIO2_IO07			0x011e>;
+	};
+
 	pinctrl_eqos: eqosgrp {
 		fsl,pins = /* PD | FSEL_2 | DSE X4 */
 			   <MX93_PAD_ENET1_MDC__ENET_QOS_MDC				0x51e>,
-- 
2.54.0


