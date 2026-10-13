Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 497A2CC6B0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 11:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kM1VFlEgUm4V+tMTVsBsNlrnL0ECpagomZUydMxZhSw=; b=lwW+gwDOAedAZy7Wk1ELc5LK1V
	LnoLpgnw077UV+/ifSgyeHFKlXOJnnDcnDK9kp3t0i5dIXgG8eQWPz3vifLRfKE3/ZpPz02Q129ff
	5Jq5DAb4AHj6AzZO5T4QUsnzwF6Tk6ytYhnxNEhqltkiwvqMthkM5THKSReupwOBGsIM93w5K/++5
	oDqvgfG/N4klUCKF0Gor5lJaYQk7RRrtB71uLBCk4OTypNpFK8KsrjzF4uOLH4rZuXiXA6dxjbsKX
	Vtu+V4LWvLEPIczU7RvWihvAcmS4+WnNdMESF+xZIVcpWXMUm8wE8fTonOz0HQI7vBfcFGheUaWwO
	cmmRu2qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGaW4-0000000CgKC-1miM;
	Tue, 13 Oct 2026 11:17:56 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGaVz-0000000CgG6-34lq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 11:17:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=kM1VFlEgUm4V+tMTVsBsNlrnL0ECpagomZUydMxZhSw=; b=Q5Ij0Q83kkodlqd0SeGBp5Bqw9
	1tlWSL6xiI8PkdE/Qywb6uP4A2B9YQc+989V0mGbKci1SWp+URET9bXdqEcjafz9zWRly421h+2P2
	G6/AWAyPmj11jIGSxW7PKqQxIeIr/ILZ2s+OoUBX5nE65dRB6jaKCjsh38f7ssmk8A3Ma42wkKo05
	kwmDou5mNqKDdQ0CrIL+ySHXCxB4p48cpzSNvWXITkBIJewrdrK58LnxJ2mTuOwk+1O/C4RacVOU3
	bc3T/n83b9U6SvKO9ujha4GmzawZ2dgicVrvjpJJ/BdGKRExxMWNZSHNw7VWN327hNqV72015gk1F
	PpZZyZfQ==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xGaVs-000OEg-2v;
	Tue, 13 Oct 2026 13:17:44 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy03.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xGaVs-0005it-0t;
	Tue, 13 Oct 2026 13:17:44 +0200
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
Subject: [PATCH 5/5] arm64: dts: freescale: Add dual-channel LVDS overlay for TQMa8Xx
Date: Tue, 13 Oct 2026 13:17:29 +0200
Message-ID: <20261013111737.998282-6-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261013111737.998282-1-alexander.stein@ew.tq-group.com>
References: <20261013111737.998282-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28152/Tue Oct 13 08:26:14 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_041751_814012_C93AA612 
X-CRM114-Status: GOOD (  12.64  )
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

Add an overlay for the supported LVDS display AUO G133HAN01 on connector
X14 (+ control on X22).
The corresponding display controller PLL is configured with 10x the
pixelclock.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/Makefile        |   2 +
 .../dts/freescale/mba8xx-lvds-g133han01.dtso  | 160 ++++++++++++++++++
 2 files changed, 162 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/mba8xx-lvds-g133han01.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 84aeff0e78cf2..3b3b1c51fcd6a 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -846,8 +846,10 @@ dtb-${CONFIG_ARCH_MXC} += imx8qxp-mek-ov5640-csi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-tqma8xqp-mba8xx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-tqma8xqps-mb-smarc-2.dtb
 
+imx8qxp-tqma8xqp-mba8xx-lvds-g133han01-dtbs += imx8qxp-tqma8xqp-mba8xx.dtb mba8xx-lvds-g133han01.dtbo
 imx8qxp-tqma8xqp-mba8xx-lvds0-tm070jvhg33-dtbs += imx8qxp-tqma8xqp-mba8xx.dtb mba8xx-lvds0-tm070jvhg33.dtbo
 imx8qxp-tqma8xqp-mba8xx-lvds1-tm070jvhg33-dtbs += imx8qxp-tqma8xqp-mba8xx.dtb mba8xx-lvds1-tm070jvhg33.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8qxp-tqma8xqp-mba8xx-lvds-g133han01.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-tqma8xqp-mba8xx-lvds0-tm070jvhg33.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-tqma8xqp-mba8xx-lvds1-tm070jvhg33.dtb
 
diff --git a/arch/arm64/boot/dts/freescale/mba8xx-lvds-g133han01.dtso b/arch/arm64/boot/dts/freescale/mba8xx-lvds-g133han01.dtso
new file mode 100644
index 0000000000000..acade7c01da83
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/mba8xx-lvds-g133han01.dtso
@@ -0,0 +1,160 @@
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
+	assigned-clock-rates = <1412000000>;
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
+	fsl,companion-ldb = <&mipi_lvds_1_ldb>;
+	status = "okay";
+
+	channel@0 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0>;
+		status = "okay";
+
+		port@1 {
+			reg = <1>;
+
+			lvds_ch0_out: endpoint {
+				remote-endpoint = <&panel_lvds0_in>;
+			};
+		};
+	};
+};
+
+&mipi_lvds_0_phy {
+	status = "okay";
+};
+
+&mipi_lvds_0_pxl2dpi {
+	fsl,companion-pxl2dpi = <&mipi_lvds_1_pxl2dpi>;
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
+&mipi_lvds_1_ldb {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	channel@1 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <1>;
+		status = "okay";
+
+		port@1 {
+			reg = <1>;
+
+			lvds_ch1_out: endpoint {
+				remote-endpoint = <&panel_lvds1_in>;
+			};
+		};
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
+&mipi_lvds_1_pxl2dpi_dc0_pixel_link0 {
+	status = "okay";
+};
+
+&mipi_lvds_1_pxl2dpi_mipi_lvds_1_ldb_ch1 {
+	status = "okay";
+};
+
+&panel_lvds0 {
+	compatible = "auo,g133han01";
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			dual-lvds-odd-pixels;
+
+			panel_lvds0_in: endpoint {
+				remote-endpoint = <&lvds_ch0_out>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+			dual-lvds-even-pixels;
+
+			panel_lvds1_in: endpoint {
+				remote-endpoint = <&lvds_ch1_out>;
+			};
+		};
+	};
+};
-- 
2.55.0


