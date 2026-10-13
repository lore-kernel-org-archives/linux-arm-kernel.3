Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A872CA9ED2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 11:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lR3g9r7ldwwxqZPCT2gtgAgv6surlCSHIrRX8PctGhQ=; b=K/0HoxwiNXx6u2qFdHcrVhbp6b
	EDKHCiTr8SrJLNnRDuswcYrI/kbDvK7OJr7gWfTY/yCM95VCXQhAPBJm3Y0Ggv/I1NZSvX7vek8uG
	HwGwPPw7PNMEQqpHFsF0Pd8ybr0hmlG9WYZ9pv/i51hB7eNlkMJK+Q5fI/weBoZnTXusn5DPkPMfL
	tyVs0FTVG+oNkho8jasPfT3L4cGYab1gxyGYVPM27xBQM4UUuDxdrGMHTMHa52j8ATrxtPgXt3U4S
	HyzBQh4gcgp//J8T+GZJNacrClGvmAx0zYFy9u14HRue1awixYG2Sn2gBCcGPEGpm0kgftUR/P+vG
	kDq8ga4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGaWJ-0000000CgR6-1zLh;
	Tue, 13 Oct 2026 11:18:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGaW3-0000000CgIm-3ztk
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 13 Oct 2026 11:17:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=lR3g9r7ldwwxqZPCT2gtgAgv6surlCSHIrRX8PctGhQ=; b=iuZG1eR83jNnHaXwi/IX+BLomV
	3LsAkx5+QXl+Xr3Y74ornRJVZKB4cVKwpBKxNVP0QRuQaxp1iYDR5tdDIY8x1vFNh+k7DzBBrEo2k
	ghr1bQ+Jx+DUjzUlpgDLiVwTjcZTNiIJA+O9JS+fleD58t76b663bHI94GZF01qUsBQF9k63+pl0N
	glYXwqeThHaCNkLYsI+uXiGiw/1vLnu9ZftVA99HpvdxVpgIlRvNchOUjPZb8erV0F2sMbos37BBg
	F7OqL475VPFb1ony6BHYG8WbibzonsJkCXZjdXLI9102yQtu/bWadDaHlHTSbKCllVbqD1VWCq/QF
	oS3dndEw==;
Received: from www537.your-server.de ([188.40.3.216])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGaW0-0000000FTKW-2MUk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 11:17:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=lR3g9r7ldwwxqZPCT2gtgAgv6surlCSHIrRX8PctGhQ=; b=NrKTkPAge5QFXX76EZk7kpz7hH
	FtORA4T+BVPhq6as+z7JN6Z3GcdIRs3dn4ijdwgbvLIoC9bmR5xpp0TYAOOZhvoKfjJqOEjGtzyOM
	BC4Hg83s2SsD/Da0OEnQ0M6FG/MzfgI8g4iALYO1XRqTCentGtOBfnGmCZHfmrlbLHypPFe7SQtsd
	vk7QE+DCJ6tlHjcPmIV18IyFDkAseh1Vp+XL+jiFvbNkokx0soRXNYBdS1ud+aQvQNDTT/9xMiM+U
	+wx/NsW7g8HHpGmI6H3Qycp/VfbA0Hlq+/AtZobeE1isySOrbV0tndrzlJ5i643iYwzRqdtOdwQvm
	xbn0pgeg==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xGaVs-000ODV-1H;
	Tue, 13 Oct 2026 13:17:44 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy03.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xGaVr-0005it-2a;
	Tue, 13 Oct 2026 13:17:43 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dong Aisheng <aisheng.dong@nxp.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com,
	Liu Ying <victor.liu@nxp.com>
Subject: [PATCH 4/5] arm64: dts: freescale: Add LVDS overlays for TQMa8Xx
Date: Tue, 13 Oct 2026 13:17:28 +0200
Message-ID: <20261013111737.998282-5-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261013111737.998282-1-alexander.stein@ew.tq-group.com>
References: <20261013111737.998282-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28152/Tue Oct 13 08:26:14 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_121752_926000_E9167395 
X-CRM114-Status: GOOD (  16.96  )
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

Add overlays for the supported LVDS display tianma tm070jvhg33 on both
LVDS0 and LVDS1 channels on connector X14 (+ control on X22).
The corresponding display controller PLL is configured with 10x the
pixelclock.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/Makefile        | 12 +++
 .../freescale/mba8xx-lvds0-tm070jvhg33.dtso   | 88 +++++++++++++++++++
 .../freescale/mba8xx-lvds1-tm070jvhg33.dtso   | 88 +++++++++++++++++++
 arch/arm64/boot/dts/freescale/mba8xx.dtsi     | 58 +++++++++++-
 4 files changed, 243 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/mba8xx-lvds0-tm070jvhg33.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/mba8xx-lvds1-tm070jvhg33.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index a80cccf34eb56..84aeff0e78cf2 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -120,6 +120,12 @@ dtb-$(CONFIG_ARCH_MXC) += imx8dxl-hummingboard-telematics.dtb
 
 dtb-$(CONFIG_ARCH_MXC) += imx8dxp-tqma8xdp-mba8xx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8dxp-tqma8xdps-mb-smarc-2.dtb
+
+imx8dxp-tqma8xdp-mba8xx-lvds0-tm070jvhg33-dtbs += imx8dxp-tqma8xdp-mba8xx.dtb mba8xx-lvds0-tm070jvhg33.dtbo
+imx8dxp-tqma8xdp-mba8xx-lvds1-tm070jvhg33-dtbs += imx8dxp-tqma8xdp-mba8xx.dtb mba8xx-lvds1-tm070jvhg33.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8dxp-tqma8xdp-mba8xx-lvds0-tm070jvhg33.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8dxp-tqma8xdp-mba8xx-lvds1-tm070jvhg33.dtb
+
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-beacon-kit.dtb
 
 imx8mm-data-modul-edm-sbc-overlay-cm4-dtbs := \
@@ -839,6 +845,12 @@ dtb-${CONFIG_ARCH_MXC} += imx8qxp-mek-ov5640-csi.dtb
 
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-tqma8xqp-mba8xx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-tqma8xqps-mb-smarc-2.dtb
+
+imx8qxp-tqma8xqp-mba8xx-lvds0-tm070jvhg33-dtbs += imx8qxp-tqma8xqp-mba8xx.dtb mba8xx-lvds0-tm070jvhg33.dtbo
+imx8qxp-tqma8xqp-mba8xx-lvds1-tm070jvhg33-dtbs += imx8qxp-tqma8xqp-mba8xx.dtb mba8xx-lvds1-tm070jvhg33.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8qxp-tqma8xqp-mba8xx-lvds0-tm070jvhg33.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8qxp-tqma8xqp-mba8xx-lvds1-tm070jvhg33.dtb
+
 dtb-$(CONFIG_ARCH_MXC) += imx8ulp-9x9-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8ulp-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx91-9x9-qsb.dtb
diff --git a/arch/arm64/boot/dts/freescale/mba8xx-lvds0-tm070jvhg33.dtso b/arch/arm64/boot/dts/freescale/mba8xx-lvds0-tm070jvhg33.dtso
new file mode 100644
index 0000000000000..3bff1c4ca0b73
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/mba8xx-lvds0-tm070jvhg33.dtso
@@ -0,0 +1,88 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
+/*
+ * Copyright (c) 2021-2026 TQ-Systems GmbH <linux@ew.tq-group.com>,
+ * D-82229 Seefeld, Germany.
+ * Author: Alexander Stein
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/firmware/imx/rsrc.h>
+
+&adma_pwm {
+	status = "okay";
+};
+
+&backlight_lvds {
+	status = "okay";
+};
+
+&dc0_framegen0 {
+	assigned-clocks = <&clk IMX_SC_R_DC_0_PLL_0 IMX_SC_PM_CLK_PLL>,
+			  <&clk IMX_SC_R_DC_0 IMX_SC_PM_CLK_MISC0>;
+	assigned-clock-parents = <0>,
+				 <&clk IMX_SC_R_DC_0_PLL_0 IMX_SC_PM_CLK_PLL>;
+	assigned-clock-rates = <682000000>;
+};
+
+&dc0_pc {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	channel@0 {
+		reg = <0>;
+		status = "okay";
+	};
+};
+
+&dc0_pixel_link0 {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@1 {
+			reg = <1>;
+			status = "okay";
+		};
+	};
+};
+
+&dc0 {
+	status = "okay";
+};
+
+&mipi_lvds_0_ldb {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	channel@0 {
+		reg = <0>;
+		status = "okay";
+	};
+};
+
+&mipi_lvds_0_phy {
+	status = "okay";
+};
+
+&mipi_lvds_0_pxl2dpi {
+	status = "okay";
+};
+
+&mipi_lvds_0_pxl2dpi_dc0_pixel_link0 {
+	status = "okay";
+};
+
+&mipi_lvds_0_pxl2dpi_mipi_lvds_0_ldb_ch0 {
+	status = "okay";
+};
+
+&panel_lvds0 {
+	compatible = "tianma,tm070jvhg33";
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/freescale/mba8xx-lvds1-tm070jvhg33.dtso b/arch/arm64/boot/dts/freescale/mba8xx-lvds1-tm070jvhg33.dtso
new file mode 100644
index 0000000000000..4a8ba61962725
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/mba8xx-lvds1-tm070jvhg33.dtso
@@ -0,0 +1,88 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
+/*
+ * Copyright (c) 2021-2026 TQ-Systems GmbH <linux@ew.tq-group.com>,
+ * D-82229 Seefeld, Germany.
+ * Author: Alexander Stein
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/firmware/imx/rsrc.h>
+
+&adma_pwm {
+	status = "okay";
+};
+
+&backlight_lvds {
+	status = "okay";
+};
+
+&dc0_framegen1 {
+	assigned-clocks = <&clk IMX_SC_R_DC_0_PLL_1 IMX_SC_PM_CLK_PLL>,
+			  <&clk IMX_SC_R_DC_0 IMX_SC_PM_CLK_MISC1>;
+	assigned-clock-parents = <0>,
+				 <&clk IMX_SC_R_DC_0_PLL_1 IMX_SC_PM_CLK_PLL>;
+	assigned-clock-rates = <682000000>;
+};
+
+&dc0_pc {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	channel@1 {
+		reg = <0>;
+		status = "okay";
+	};
+};
+
+&dc0_pixel_link1 {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@1 {
+			reg = <1>;
+			status = "okay";
+		};
+	};
+};
+
+&dc0 {
+	status = "okay";
+};
+
+&mipi_lvds_1_ldb {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	channel@0 {
+		reg = <0>;
+		status = "okay";
+	};
+};
+
+&mipi_lvds_1_phy {
+	status = "okay";
+};
+
+&mipi_lvds_1_pxl2dpi {
+	status = "okay";
+};
+
+&mipi_lvds_1_pxl2dpi_dc0_pixel_link1 {
+	status = "okay";
+};
+
+&mipi_lvds_1_pxl2dpi_mipi_lvds_1_ldb_ch0 {
+	status = "okay";
+};
+
+&panel_lvds1 {
+	compatible = "tianma,tm070jvhg33";
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/freescale/mba8xx.dtsi b/arch/arm64/boot/dts/freescale/mba8xx.dtsi
index e32519b156d93..a94594db34d56 100644
--- a/arch/arm64/boot/dts/freescale/mba8xx.dtsi
+++ b/arch/arm64/boot/dts/freescale/mba8xx.dtsi
@@ -80,7 +80,37 @@ led2 {
 		};
 	};
 
-	/* TODO LVDS panels */
+	panel_lvds0: panel-lvds0 {
+		/*
+		 * Display is not fixed, so compatible has to be added from
+		 * DT
+		 */
+		backlight = <&backlight_lvds>;
+		power-supply = <&reg_3v3>;
+		status = "disabled";
+
+		port {
+			panel_in_lvds0: endpoint {
+				remote-endpoint = <&lvds0_out>;
+			};
+		};
+	};
+
+	panel_lvds1: panel-lvds1 {
+		/*
+		 * Display is not fixed, so compatible has to be added from
+		 * DT
+		 */
+		backlight = <&backlight_lvds>;
+		power-supply = <&reg_3v3>;
+		status = "disabled";
+
+		port {
+			panel_in_lvds1: endpoint {
+				remote-endpoint = <&lvds1_out>;
+			};
+		};
+	};
 
 	reg_12v0: regulator-12v0 {
 		compatible = "regulator-fixed";
@@ -280,8 +310,6 @@ &i2c2 {
 	status = "okay";
 };
 
-/* TODO LDB */
-
 &lpspi1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_spi1>;
@@ -329,6 +357,30 @@ &lsio_gpio3 {
 			  "", "", "", "";
 };
 
+&mipi_lvds_0_ldb {
+	channel@0 {
+		port@1 {
+			reg = <1>;
+
+			lvds0_out: endpoint {
+				remote-endpoint = <&panel_in_lvds0>;
+			};
+		};
+	};
+};
+
+&mipi_lvds_1_ldb {
+	channel@0 {
+		port@1 {
+			reg = <1>;
+
+			lvds1_out: endpoint {
+				remote-endpoint = <&panel_in_lvds1>;
+			};
+		};
+	};
+};
+
 &pcieb {
 	phys = <&hsio_phy 0 PHY_TYPE_PCIE 0>;
 	phy-names = "pcie-phy";
-- 
2.55.0


