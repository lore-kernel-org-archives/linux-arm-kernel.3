Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44618C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 14:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hKsxFyucq1BakC1c3Sw1LsOOiiJAybngj8+dLBZ1o00=; b=kai8oVispb+lfWl14+T1xGQ4a0
	3CIVSR45iAS/T5gFYODaOSLvtAX76VcwJeZGoDPmkJrIv0sow/mp0oorEIf1sS8x5mgBCqd2iGWa7
	Z+HsHyIprJQxEbW0QLEHEey7ih9HJlnmweEQMnxOz/4tTLgKK1eQuTZlv1K4SrtfsUpq+FR+MQslK
	F5qynGD8enaxZlve97OQ31+XkuCkxNURro8NvNQxYmKwrzohuPoznolmSDXgehseBKvB/FQjGO9IL
	csAOwGNkzgYOIXGOqQcqh/JfYhhNlu3AaCiii7hDbvxWVOi6SrSgI7WwxwErRYp414Vf6SYWsk2eo
	pxOPWpvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4KXB-00000002JJW-4Acr;
	Mon, 14 Apr 2025 14:11:37 +0000
Received: from mx.denx.de ([89.58.32.78])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4KNw-00000002H5a-1NxL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 14:02:06 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4207B1026CEBF;
	Mon, 14 Apr 2025 16:02:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1744639322; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=hKsxFyucq1BakC1c3Sw1LsOOiiJAybngj8+dLBZ1o00=;
	b=HSsETckq8d2eEx89kid1+jM62XLbmqhjpnmn3oCftKkpD25aPUDGbRxFLPuZI4G1CCusZ5
	Zwcu+bAyaaCOZlBoPvpH0MPvFUIme66M5Hb04abb+Ipae3KJOzt5H3r2m9+I7BJsw3X3Li
	epPBBciqBEzJzfS0XsCn9ekkYUP++bE8Lx2JZtEtl9LCeQ6hkT06m9PQmLfh1hVcVjf/h+
	2YaGVcsciJNBy5vSw1B7+SgHv/bL6rw5bjPELJqS54wwGVJLgvKjZQ0viO/meBluEGxH0V
	4S9K7xCiBp7SXR9M91mgLtv3MSWTPA5A0Ayi2QMkeAbrGmIWYCfk71eztb/ybg==
From: Lukasz Majewski <lukma@denx.de>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefan Wahren <wahrenst@gmx.net>,
	Simon Horman <horms@kernel.org>,
	Lukasz Majewski <lukma@denx.de>,
	Andrew Lunn <andrew@lunn.ch>
Subject: [net-next v5 3/6] ARM: dts: nxp: mxs: Adjust XEA board's DTS to support L2 switch
Date: Mon, 14 Apr 2025 16:01:25 +0200
Message-Id: <20250414140128.390400-4-lukma@denx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250414140128.390400-1-lukma@denx.de>
References: <20250414140128.390400-1-lukma@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_070204_524367_3B2FF96F 
X-CRM114-Status: GOOD (  11.32  )
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

The description is similar to the one used with the new CPSW driver.

Signed-off-by: Lukasz Majewski <lukma@denx.de>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>

---
Changes for v2:
- Remove properties which are common for the imx28(7) SoC
- Use mdio properties to perform L2 switch reset (avoid using
  deprecated properties)

Changes for v3:
- Replace IRQ_TYPE_EDGE_FALLING with IRQ_TYPE_LEVEL_LOW
- Update comment regarding PHY interrupts s/AND/OR/g

Changes for v4:
- Use GPIO_ACTIVE_LOW instead of 0 in 'reset-gpios'
- Replace port@[12] with ethernet-port@[12]

Changes for v5:
- Add proper multiline comment for IRQs description
---
 arch/arm/boot/dts/nxp/mxs/imx28-xea.dts | 56 +++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/mxs/imx28-xea.dts b/arch/arm/boot/dts/nxp/mxs/imx28-xea.dts
index 6c5e6856648a..69032b29d767 100644
--- a/arch/arm/boot/dts/nxp/mxs/imx28-xea.dts
+++ b/arch/arm/boot/dts/nxp/mxs/imx28-xea.dts
@@ -5,6 +5,7 @@
  */
 
 /dts-v1/;
+#include<dt-bindings/interrupt-controller/irq.h>
 #include "imx28-lwe.dtsi"
 
 / {
@@ -90,6 +91,61 @@ &reg_usb_5v {
 	gpio = <&gpio0 2 0>;
 };
 
+&eth_switch {
+	pinctrl-names = "default";
+	pinctrl-0 = <&mac0_pins_a>, <&mac1_pins_a>;
+	phy-supply = <&reg_fec_3v3>;
+	status = "okay";
+
+	ethernet-ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		mtip_port1: ethernet-port@1 {
+			reg = <1>;
+			label = "lan0";
+			local-mac-address = [ 00 00 00 00 00 00 ];
+			phy-mode = "rmii";
+			phy-handle = <&ethphy0>;
+		};
+
+		mtip_port2: ethernet-port@2 {
+			reg = <2>;
+			label = "lan1";
+			local-mac-address = [ 00 00 00 00 00 00 ];
+			phy-mode = "rmii";
+			phy-handle = <&ethphy1>;
+		};
+	};
+
+	mdio_sw: mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		reset-gpios = <&gpio3 21 GPIO_ACTIVE_LOW>;
+		reset-delay-us = <25000>;
+		reset-post-delay-us = <10000>;
+
+		ethphy0: ethernet-phy@0 {
+			reg = <0>;
+			smsc,disable-energy-detect;
+			/*
+			 * Both PHYs (i.e. 0,1) have the same, single GPIO,
+			 * line to handle both, their interrupts (OR'ed)
+			 */
+			interrupt-parent = <&gpio4>;
+			interrupts = <13 IRQ_TYPE_LEVEL_LOW>;
+		};
+
+		ethphy1: ethernet-phy@1 {
+			reg = <1>;
+			smsc,disable-energy-detect;
+			interrupt-parent = <&gpio4>;
+			interrupts = <13 IRQ_TYPE_LEVEL_LOW>;
+		};
+	};
+};
+
 &spi2_pins_a {
 	fsl,pinmux-ids = <
 		MX28_PAD_SSP2_SCK__SSP2_SCK
-- 
2.39.5


