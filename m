Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B94FC83F0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 19:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V/FdxCHOqnmqljJ5efijaTmACitlfKN8eXZe1cKiHWU=; b=yaaD/cn2ww68loWQqL4cJ6Szu8
	hn8ijBmD/JE2qd8gAsPzeSbE9+fT4eDR+OJ05Ix3Ncgw2BceaEBdfpPp5uD3Tq3uSa3Jfz/Nmtf/O
	U9nIKHFSc8MlGtb0anlVv/QM5tjQ4keTmu0ByfMu8mKObbGD4GkPAeAe6PQvEyEiPJkKk7C5Uoe/I
	JaZvg7+mhgSpCMsNYn5BfROT12XI2OwtT0WRYAlLWjhgAmoaLXN4ACh04KCURgFHwuOZ5hSsBl6KU
	UqTxPmRYYxavoZD2cqqopoZAjXm2s90taMvMXLuYe4fL3V5EyNqC+x0uCMFucDTMcRFcNUYTWOZjy
	qFUmtdfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZEAW-00000006NM2-2vCO;
	Tue, 08 Jul 2025 19:39:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZCRl-000000069ww-0bjt
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 08 Jul 2025 17:49:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Content-ID:Content-Description;
	bh=V/FdxCHOqnmqljJ5efijaTmACitlfKN8eXZe1cKiHWU=; b=nXHZ3/ufOtdeGtHlqOMsJYfl7G
	V8RH+e6bah6F7xQ5iA5WSK6RGuoip5ndLssl2hIKtOHnonIzGWKPdAX6RKvaHjbPHNkeX0rEiDjRZ
	rHsD1sh6LrgrILt7s26bw72vbeYVrvQOsXIHFA5dtw8upM6sHoTGmngocBABaAI8usV/of8Abw0k7
	Vu0UBzHK7V0J/QK/Y0p3hWcYZSxlRH1uk1wUlYRloBFP++7wG9H2ida1BwgL6yBFVXTZoVL+fWa5B
	7rnAxY3e7dq/8QFDBN1uj1kBQ5gugVLIo/rT816vpYgIuXNzFrtGrSXl2CSC1wKIie23CC0dqD2Et
	sas0VbOw==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZCRh-00000008lvu-25zf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 17:49:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CFBE046921;
	Tue,  8 Jul 2025 17:49:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 89D85C4CEFE;
	Tue,  8 Jul 2025 17:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751996967;
	bh=y422oLl4Af8bIStHV0FEsx1jbyaFQfD6IX+O8/xN0bI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=s3kCJT1hX08M8FG/jF79mfOEmGy9WkAoZ+36No9E7u+qT0aAVb1n821xkD4d3oApp
	 Prc6TE+8Y8Z+CdcYwdhZwlaAiijjct/554Xx49TVf2hetQhr6hW4S4JQPYF0SqVQTf
	 sUklemAjhK0TnhD5mWcYB32CeYRhibP2A8co2E3UydW8qMaSwv2tbGkg2XbV9Om0Lg
	 zT4RMt5PzGr6/p8ph2DkkOHbDFSXQm8f8h9IyRcOxOPDUvOnk3kT4fp9FUSUZZ/Tzb
	 a0iFyWQhkq//Jyub5KGDfen/XAuEKbk3ZoDbStMzI3q/ThBaHKBDbCV7i3dS9L2APJ
	 C1Nh7p3Zs52tg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D333C83F15;
	Tue,  8 Jul 2025 17:49:27 +0000 (UTC)
From: Frank Li via B4 Relay <devnull+Frank.Li.nxp.com@kernel.org>
Date: Tue, 08 Jul 2025 13:48:45 -0400
Subject: [PATCH v3 4/4] arm64: dts: imx8qxp-mek: add parallel ov5640 camera
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250708-imx8qxp_pcam-v3-4-c8533e405df1@nxp.com>
References: <20250708-imx8qxp_pcam-v3-0-c8533e405df1@nxp.com>
In-Reply-To: <20250708-imx8qxp_pcam-v3-0-c8533e405df1@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rui Miguel Silva <rmfrfs@gmail.com>, 
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751996966; l=3808;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=FpMilXYCpACC8eUJJu2RUd94r9uH1mqEpsHmTQ4r+GA=;
 b=LXSCs1NlOU4BcME49CIR7E+uQV9Q2NJLEocoJl926QzI9muKFgn/otWFMNlBk7ZoKuO/0Isuz
 XSlKsvujR+wBuhgmhEDJMmfD0sSqsTxY4BijqA7AmhiREEsyYRenPZ2
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-Endpoint-Received: by B4 Relay for Frank.Li@nxp.com/20240130 with
 auth_id=121
X-Original-From: Frank Li <Frank.Li@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_184934_318865_3EC1A195 
X-CRM114-Status: GOOD (  14.71  )
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
Reply-To: Frank.Li@nxp.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Frank Li <Frank.Li@nxp.com>

Add parallel ov5640 nodes in imx8qxp-mek and create overlay file to enable
it because it can work at two mode: MIPI CSI and parallel mode.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
changes in v3
- replace csi with cpi.
- use imx8qxp-mek-ov5640-cpi.dtso since csi use imx8qxp-mek-ov5640-csi.dtso

change in v2
- move ov5640 part to overlay file
- rename to imx8qxp-mek-ov5640-parallel.dtso
- remove data-lanes
---
 arch/arm64/boot/dts/freescale/Makefile             |  3 +
 .../boot/dts/freescale/imx8qxp-mek-ov5640-cpi.dtso | 82 ++++++++++++++++++++++
 2 files changed, 85 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 02ef35578dbc7e05b35b781dbfca0f0bc124ead1..d5b6cbdc144bb00963d93c92dd493513d1f00540 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -330,6 +330,9 @@ dtb-$(CONFIG_ARCH_MXC) += imx8qxp-mek-pcie-ep.dtb
 imx8qxp-mek-ov5640-csi-dtbs := imx8qxp-mek.dtb imx8qxp-mek-ov5640-csi.dtbo
 dtb-${CONFIG_ARCH_MXC} += imx8qxp-mek-ov5640-csi.dtb
 
+imx8qxp-mek-ov5640-cpi-dtbs := imx8qxp-mek.dtb imx8qxp-mek-ov5640-cpi.dtbo
+dtb-${CONFIG_ARCH_MXC} += imx8qxp-mek-ov5640-cpi.dtb
+
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-tqma8xqp-mba8xx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-tqma8xqps-mb-smarc-2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8ulp-evk.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-mek-ov5640-cpi.dtso b/arch/arm64/boot/dts/freescale/imx8qxp-mek-ov5640-cpi.dtso
new file mode 100644
index 0000000000000000000000000000000000000000..01f6333f507286133000eb0401a50043ca49a5df
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-mek-ov5640-cpi.dtso
@@ -0,0 +1,82 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2025 NXP
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/imx8-lpcg.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/media/video-interfaces.h>
+#include <dt-bindings/pinctrl/pads-imx8qxp.h>
+
+&cm40_i2c {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	ov5640_pi: camera@3c {
+		compatible = "ovti,ov5640";
+		reg = <0x3c>;
+		clocks = <&pi0_misc_lpcg IMX_LPCG_CLK_0>;
+		clock-names = "xclk";
+		assigned-clocks = <&pi0_misc_lpcg IMX_LPCG_CLK_0>;
+		assigned-clock-rates = <24000000>;
+		AVDD-supply = <&reg_2v8>;
+		DOVDD-supply = <&reg_1v8>;
+		DVDD-supply = <&reg_1v5>;
+		pinctrl-0 = <&pinctrl_parallel_cpi>;
+		pinctrl-names = "default";
+		powerdown-gpios = <&lsio_gpio3 2 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&lsio_gpio3 3 GPIO_ACTIVE_LOW>;
+
+		port {
+			ov5640_pi_ep: endpoint {
+				bus-type = <MEDIA_BUS_TYPE_PARALLEL>;
+				bus-width = <8>;
+				hsync-active = <1>;
+				pclk-sample = <1>;
+				remote-endpoint = <&parallel_cpi_in>;
+				vsync-active = <0>;
+			};
+		};
+	};
+};
+
+&iomuxc {
+	pinctrl_parallel_cpi: parallelcpigrp {
+		fsl,pins = <
+			IMX8QXP_CSI_D00_CI_PI_D02		0xc0000041
+			IMX8QXP_CSI_D01_CI_PI_D03		0xc0000041
+			IMX8QXP_CSI_D02_CI_PI_D04		0xc0000041
+			IMX8QXP_CSI_D03_CI_PI_D05		0xc0000041
+			IMX8QXP_CSI_D04_CI_PI_D06		0xc0000041
+			IMX8QXP_CSI_D05_CI_PI_D07		0xc0000041
+			IMX8QXP_CSI_D06_CI_PI_D08		0xc0000041
+			IMX8QXP_CSI_D07_CI_PI_D09		0xc0000041
+
+			IMX8QXP_CSI_MCLK_CI_PI_MCLK		0xc0000041
+			IMX8QXP_CSI_PCLK_CI_PI_PCLK		0xc0000041
+			IMX8QXP_CSI_HSYNC_CI_PI_HSYNC		0xc0000041
+			IMX8QXP_CSI_VSYNC_CI_PI_VSYNC		0xc0000041
+			IMX8QXP_CSI_EN_LSIO_GPIO3_IO02		0xc0000041
+			IMX8QXP_CSI_RESET_LSIO_GPIO3_IO03	0xc0000041
+		>;
+	};
+};
+
+&isi {
+	status = "okay";
+};
+
+&parallel_cpi {
+	status = "okay";
+
+	ports {
+		port@0 {
+			parallel_cpi_in: endpoint {
+				remote-endpoint = <&ov5640_pi_ep>;
+			};
+		};
+	};
+};

-- 
2.34.1



