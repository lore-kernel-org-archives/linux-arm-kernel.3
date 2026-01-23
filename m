Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F4EFD778B2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 19:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7rloACMNoqDdhfi1aDZrBluw+GS2sAnJy71pQuYDbCY=; b=h3NLgtyn2lEQXKSZI8S0Bi5Vl9
	XVkklR+IGs/5PGaqjxJKMTm1ZEOWwwfizILrMNSUpTZRO1KBTLfcRX20c7eMrhXQLB+WLEOCunoeY
	DO5xlqFmMRSIz3/pwJyNxl6RcbNY1gid+moezR9xgTAWzFRShJwH2eTn2fvOoa7TBoYLTNwk/8WHp
	Z8SCKjdtLcTbCDthTv6Job9J1U3pDsw1se76m7WmOZwX2TiZkG9zmii9Ory9hlkhkPdbdo5gkrLj7
	W+A05SiLCeB+eh8QEYnaF0ieYErNO76pvMpmrbILrc4w6m9DQxm0KC/eEkXMWIG83TOajxwyPCmC0
	0mj9iezQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjMkB-00000009PX3-30NM;
	Fri, 23 Jan 2026 19:22:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjMk5-00000009PRY-31Qp;
	Fri, 23 Jan 2026 19:22:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 32F8F1476;
	Fri, 23 Jan 2026 11:22:42 -0800 (PST)
Received: from 010265703453.arm.com (unknown [10.57.51.35])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B858C3F632;
	Fri, 23 Jan 2026 11:22:46 -0800 (PST)
From: Robin Murphy <robin.murphy@arm.com>
To: heiko@sntech.de,
	neil.armstrong@linaro.org,
	dianders@chromium.org,
	thierry.reding@gmail.com,
	sam@ravnborg.org
Cc: jesszhan0024@gmail.com,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 4/4] arm64: dts: rockchip: Add overlay for FriendlyElec HD702E
Date: Fri, 23 Jan 2026 19:22:23 +0000
Message-Id: <2bbc2e62ae9b54ac7594355001ce2b15885d3493.1769191673.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1769191673.git.robin.murphy@arm.com>
References: <cover.1769191673.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_112250_845455_872B8CAB 
X-CRM114-Status: GOOD (  12.14  )
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

Add an overlay to support FriendlyElec's HD702E 7" eDP LCD touchscreen
module for the NanoPC-T4 board:

https://www.friendlyelec.com/index.php?route=product/product&path=81&product_id=230

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
v2:
 - Add pinctrl, tweak some naming [Doug]
 - Add main 3.3v regulator to tidy up power supplies
---
 arch/arm64/boot/dts/rockchip/Makefile         |  5 +
 .../dts/rockchip/rk3399-nanopc-t4-hd702e.dtso | 96 +++++++++++++++++++
 2 files changed, 101 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3399-nanopc-t4-hd702e.dtso

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index dbdda9783e93..4ab58a5961aa 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -62,6 +62,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-khadas-edge-v.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-kobol-helios64.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-leez-p710.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-nanopc-t4.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-nanopc-t4-hd702e.dtbo
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-nanopi-m4.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-nanopi-m4b.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-nanopi-neo4.dtb
@@ -238,6 +239,10 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += px30-ringneck-haikou-haikou-video-demo.dtb
 px30-ringneck-haikou-haikou-video-demo-dtbs := px30-ringneck-haikou.dtb \
 	px30-ringneck-haikou-video-demo.dtbo
 
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-nanopc-t4-hd702e.dtb
+rk3399-nanopc-t4-hd702e-dtbs := rk3399-nanopc-t4.dtb \
+	rk3399-nanopc-t4-hd702e.dtbo
+
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-puma-haikou-haikou-video-demo.dtb
 rk3399-puma-haikou-haikou-video-demo-dtbs := rk3399-puma-haikou.dtb \
 	rk3399-puma-haikou-video-demo.dtbo
diff --git a/arch/arm64/boot/dts/rockchip/rk3399-nanopc-t4-hd702e.dtso b/arch/arm64/boot/dts/rockchip/rk3399-nanopc-t4-hd702e.dtso
new file mode 100644
index 000000000000..66ac530392b7
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3399-nanopc-t4-hd702e.dtso
@@ -0,0 +1,96 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * FriendlyElec HD702E LCD on NanoPC-T4 board
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/pinctrl/rockchip.h>
+
+&{/} {
+	vdd_3_3v: regulator-vdd_3_3v {
+		compatible = "regulator-fixed";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-name = "vdd_3.3v";
+		vin-supply = <&vcc12v0_sys>;
+	};
+
+	backlight: backlight {
+		compatible = "pwm-backlight";
+		pwms = <&pwm0 0 25000 0>;
+		enable-gpios = <&gpio4 RK_PD5 GPIO_ACTIVE_HIGH>;
+		brightness-levels = <0 255>;
+		default-brightness-level = <200>;
+		num-interpolated-steps = <255>;
+		pinctrl-0 = <&bl_en>;
+		pinctrl-names = "default";
+	};
+};
+
+&edp {
+	force-hpd;
+	status = "okay";
+
+	aux-bus {
+		edp-panel {
+			compatible = "friendlyarm,hd702e";
+			backlight = <&backlight>;
+			no-hpd;
+			power-supply = <&vdd_3_3v>;
+
+			port {
+				panel_in_edp: endpoint {
+					remote-endpoint = <&edp_out_panel>;
+				};
+			};
+		};
+	};
+};
+
+&edp_out {
+	edp_out_panel: endpoint {
+		remote-endpoint = <&panel_in_edp>;
+	};
+};
+
+&i2c4 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	touchscreen@5d {
+		compatible = "goodix,gt9271";
+		reg = <0x5d>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <RK_PC4 IRQ_TYPE_EDGE_FALLING>;
+		irq-gpios = <&gpio1 RK_PC4 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&gpio1 RK_PB5 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&touch_int &touch_rst>;
+		pinctrl-names = "default";
+		AVDD28-supply = <&vdd_3_3v>;
+		VDDIO-supply = <&vdd_3_3v>;
+	};
+};
+
+&pinctrl {
+	backlight {
+		bl_en: bl-en {
+			rockchip,pins = <4 RK_PD5 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	touchscreen {
+		touch_int: touch-int {
+			rockchip,pins = <1 RK_PC4 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		touch_rst: touch-rst {
+			rockchip,pins = <1 RK_PB5 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+};
-- 
2.34.1


