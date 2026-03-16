Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2490F506E1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 14:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mJpzIoG8vHCShHmOQrQ4HR4CTAI6WdcksZZ8V4h76OU=; b=YORW4yolatJStB7jAOw+NPrqnC
	gDkba2AHVha59aaN9xPG5ZsItfkqrmsb6tfoyL5/Eb0pklI4qtAAtqZyOVtIecil5yKUe5wd7xZir
	E4d5abcCVwHnnMk5vjNtrRgTlkM3irzDaOx4RZSGuH3jvhSUpFA62Nz7JKosyQ43Tlg1ZYocIe3za
	Yw62KMiJj+MLh31fZHNZuD/aZz3p3rvqKpilgXlE1u02yu3SwtGy01pJvU7/CMwMlTl+tm5MHzCQf
	sWIEddFMZijnO1AswJFmzP38P0Lj/NgSq3HGgmQq6m+ac6aWEJKS5Ze9lemc4eHOl3RnrvS9j+NyZ
	2nulPSVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w29LT-00000004FvI-33m4;
	Mon, 16 Mar 2026 14:55:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w29LS-00000004FuS-3GJn
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 16 Mar 2026 14:55:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=mJpzIoG8vHCShHmOQrQ4HR4CTAI6WdcksZZ8V4h76OU=; b=gLo4BnAjbFV1euqSGYeD17U4Xc
	Cyp0QtmrwPbeMPP7fjprr5pg1207QpcLZfAfPdKNGxu+kP2aIibhBarbb+bSFLtenEG6D0skcVIzT
	djazcMtHcNg8OFGrTMQPsnD142sIHt4j92N3BJSM8pwy+fHPnKlGIKE1BMMI/vlE4nv6rtNKDGH6t
	BPhx9ngDWBoL0FuBJB2xfMTMVM5yM2VC0AC/ikvQPJx7IqMAsFe9Z+qtudBfXfhYz6n0wKBWHGUdT
	y8Z2s64+kGRWCrTOisSL8CgslarMYVj/3MfBBj4TUAgpoKh9rtWRdJ05x3FqILiV44o3UlUGxGotQ
	VUgNxFRg==;
Received: from www537.your-server.de ([188.40.3.216])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w28Sl-00000006sod-0rpO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 13:58:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=mJpzIoG8vHCShHmOQrQ4HR4CTAI6WdcksZZ8V4h76OU=; b=RAEYYRiVyhflbHPdSPIW9gyJh8
	YPuRF7K5pO7anE1hW0EugrRQxDi9RTC3vRh7/ONLsLP5RQRLRo2yIXFel4gPNx9KItu0fzGMlVE8Y
	qimPMwMoF0y90t4zEGt+ZHu27gzKCOrVw3Gb6HKiXNRlmUsXgqDUP6UHo26d1kCJFBrGZJMHPsDZz
	hcpm5qQ+BF4vfGb6eVx5+m5UOxJ23PCWGH6WM/VZBidVIQ24XgJej8rh9x2Nq5fjKDI/D+slbwi87
	HA+Utg7oMf8wmlptqty4KGmIfu8asWRHiX58Zgz+lUpe8bkC28o3T5j+YVhDgoY3uWRkNzQFIv5O/
	pjrthP/w==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w28Sf-000LlW-14;
	Mon, 16 Mar 2026 14:58:25 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy05.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w28Sf-000LMt-1C;
	Mon, 16 Mar 2026 14:58:24 +0100
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com
Subject: [PATCH v2 2/2] arm64: dts: freescale: tqma8mqml/tqma8mxnl-mba8mx: Add dual-channel LVDS overlay
Date: Mon, 16 Mar 2026 14:58:19 +0100
Message-ID: <20260316135820.760073-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260316135820.760073-1-alexander.stein@ew.tq-group.com>
References: <20260316135820.760073-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/27942/Mon Mar 16 07:24:14 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_135831_366411_56A760EF 
X-CRM114-Status: GOOD (  12.97  )
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

Add an overlay for the supported LVDS display AUO G133HAN01. Apply
it for both TQMa8MxML and TQMa8MxNL.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v2:
* Merge Patch 3 of v1
* Adjust commit message

 arch/arm64/boot/dts/freescale/Makefile        |  4 +
 ...mx8mm-tqma8mqml-mba8mx-lvds-g133han01.dtso | 86 +++++++++++++++++++
 2 files changed, 90 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx-lvds-g133han01.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 8a85b5c39f3cc..18fe5134ff407 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -180,7 +180,9 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-ivy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-yavia.dtb
 
+imx8mm-tqma8mqml-mba8mx-lvds-g133han01-dtbs += imx8mm-tqma8mqml-mba8mx.dtb imx8mm-tqma8mqml-mba8mx-lvds-g133han01.dtbo
 imx8mm-tqma8mqml-mba8mx-lvds-tm070jvhg33-dtbs += imx8mm-tqma8mqml-mba8mx.dtb imx8mm-tqma8mqml-mba8mx-lvds-tm070jvhg33.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-tqma8mqml-mba8mx-lvds-g133han01.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-tqma8mqml-mba8mx-lvds-tm070jvhg33.dtb
 
 dtb-$(CONFIG_ARCH_MXC) += imx8mn-beacon-kit.dtb
@@ -214,8 +216,10 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mn-vhip4-evalboard-v1.dtb \
 			  imx8mn-vhip4-evalboard-v2-overlay-ksz8794.dtb \
 			  imx8mn-vhip4-evalboard-v2-overlay-ksz8794.dtbo
 
+imx8mn-tqma8mqnl-mba8mx-lvds-g133han01-dtbs += imx8mn-tqma8mqnl-mba8mx.dtb imx8mm-tqma8mqml-mba8mx-lvds-g133han01.dtbo
 imx8mn-tqma8mqnl-mba8mx-lvds-tm070jvhg33-dtbs += imx8mn-tqma8mqnl-mba8mx.dtb imx8mn-tqma8mqnl-mba8mx-lvds-tm070jvhg33.dtbo
 imx8mn-tqma8mqnl-mba8mx-usbotg-dtbs += imx8mn-tqma8mqnl-mba8mx.dtb imx8mn-tqma8mqnl-mba8mx-usbotg.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mn-tqma8mqnl-mba8mx-lvds-g133han01.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mn-tqma8mqnl-mba8mx-lvds-tm070jvhg33.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mn-tqma8mqnl-mba8mx-usbotg.dtb
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx-lvds-g133han01.dtso b/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx-lvds-g133han01.dtso
new file mode 100644
index 0000000000000..ce12bc46553dc
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx-lvds-g133han01.dtso
@@ -0,0 +1,86 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
+/*
+ * Copyright (c) 2019-2026 TQ-Systems GmbH <linux@ew.tq-group.com>,
+ * D-82229 Seefeld, Germany.
+ * Author: Alexander Stein
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/imx8mq-clock.h>
+#include <dt-bindings/gpio/gpio.h>
+
+&backlight_lvds {
+	status = "okay";
+};
+
+&dsi_lvds_bridge {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@2 {
+			reg = <2>;
+
+			lvds_bridge_out0: endpoint {
+				remote-endpoint = <&panel_in_lvds0>;
+			};
+		};
+
+		port@3 {
+			reg = <3>;
+
+			lvds_bridge_out1: endpoint {
+				remote-endpoint = <&panel_in_lvds1>;
+			};
+		};
+	};
+};
+
+&expander0 {
+	dsi-mux-oe-hog {
+		gpio-hog;
+		gpios = <10 GPIO_ACTIVE_LOW>;
+		output-high;
+		line-name = "DSI_MUX_OE#";
+	};
+};
+
+&lcdif {
+	status = "okay";
+};
+
+&mipi_dsi {
+	status = "okay";
+};
+
+&panel {
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
+			panel_in_lvds0: endpoint {
+				remote-endpoint = <&lvds_bridge_out0>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+			dual-lvds-even-pixels;
+
+			panel_in_lvds1: endpoint {
+				remote-endpoint = <&lvds_bridge_out1>;
+			};
+		};
+	};
+};
-- 
2.43.0


