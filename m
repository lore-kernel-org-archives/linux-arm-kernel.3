Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A2D4CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 22:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iTQdFFF3FKkU5XvoYy4TpMUg34G9UYAo7tdKpYcO93g=; b=u5ubNOoCQZ0jIOx/Lr3kHgEJjX
	87YG4WOWFQQwMy5gi+dR2lHQsymsLbU8LbgloF5i+X5wgx8DddnjuDyjCVjqc72GefP9ad7909/FK
	LlTz5MOLuO5dvHxzSDvpHK9Zp4juuA68uVYfjtX3dZYzMFvXqL2h+DdehD/3f1mjFau4aicId0WpF
	kHEOGqY2AXmeLz0svmnIaaIaj6npZAxwUYg4X08Ya/Xjqc4lOKVfnXyZEZj3JVv9YwC76j18ckN+D
	3rHiFg5K8NsFpcEC1G9bJrozgdWw+pxVsFWmiDPA2QuCIQwe+sf778lDRXaB2Hdbm5GkNOPWjbtLB
	gk9YGXzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upDu8-00000000m6X-1k9w;
	Thu, 21 Aug 2025 22:37:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up7OY-0000000HQaJ-0B26;
	Thu, 21 Aug 2025 15:40:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F0FB141A29;
	Thu, 21 Aug 2025 15:40:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 574DBC2BD05;
	Thu, 21 Aug 2025 15:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755790804;
	bh=2CrMi3bli5OVyaXQbvJOqLF2o0yRqYDCyXNV/LrPZAo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LKeC1Pw1GJvqWf1JdMjme3pPInHOIwVTmHofpd3jCA+1IMJutSNHKwc3wAekRzCVl
	 L0ZYN3dYX6LEFSS49zQYi9c6yFxTK7JtaWfRKQbR7VcPwBsq65iZdGDZGLMsjj+9wO
	 kTCP83sTq3+r6OvUszxJiZjl352sUD9QiLKvpvtNOqaq6ltZqAx08H6L0JJ1b8LHkY
	 8Bs773g96jEY74Yiu6gu7M+1c2XpVg/7wF5RR1zDK1JRnNkJPcHCAV3OqXCv339v2f
	 9xkSelXnghVL4I9zUybCULXbATkyUDTOXif5hGj7fmG9WLSVDJ43Bm676hXQAZS7a+
	 1SSLI54eul1Og==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 481C9CA0FE2;
	Thu, 21 Aug 2025 15:40:04 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Thu, 21 Aug 2025 15:39:14 +0000
Subject: [PATCH RFC 22/22] arm64: dts: apple: t8103: Add Apple Type-C PHY
 and dwc3 nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250821-atcphy-6-17-v1-22-172beda182b8@kernel.org>
References: <20250821-atcphy-6-17-v1-0-172beda182b8@kernel.org>
In-Reply-To: <20250821-atcphy-6-17-v1-0-172beda182b8@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, 
 Sven Peter <sven@kernel.org>, Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10871; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=2CrMi3bli5OVyaXQbvJOqLF2o0yRqYDCyXNV/LrPZAo=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ8Zy2/OzC7ZdaXxlcb2xLs9uaovut4PuMzQEWvr2ad45K
 cgU+Uqlo5SFQYyDQVZMkWX7fnvTJw/fCC7ddOk9zBxWJpAhDFycAjCRGYkM/4x++UnHvOnl45ay
 UY7e7xysLRcvUaD29KR4zUGViVelOBkZvhw5WJ7X6scg+d5qxtH+lg/P7t63/xpZElb+Q6S8MMi
 eDwA=
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_084006_176089_D5635FDF 
X-CRM114-Status: GOOD (  11.53  )
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

Add all nodes and connections required to make USB3 work on M1-based
Apple machines.

Co-developed-by: Hector Martin <marcan@marcan.st>
Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: Sven Peter <sven@kernel.org>
---
 arch/arm64/boot/dts/apple/t8103-j274.dts  |  12 +++
 arch/arm64/boot/dts/apple/t8103-j293.dts  |  12 +++
 arch/arm64/boot/dts/apple/t8103-j313.dts  |  12 +++
 arch/arm64/boot/dts/apple/t8103-j456.dts  |  12 +++
 arch/arm64/boot/dts/apple/t8103-j457.dts  |  12 +++
 arch/arm64/boot/dts/apple/t8103-jxxx.dtsi | 137 ++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t8103.dtsi      | 105 +++++++++++++++++++++++
 7 files changed, 302 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103-j274.dts b/arch/arm64/boot/dts/apple/t8103-j274.dts
index 1c3e37f86d46d7b5d733717b47c4b57dc55e1201..968fe22163d4431fe5e7049854687e61e0ec50f1 100644
--- a/arch/arm64/boot/dts/apple/t8103-j274.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j274.dts
@@ -29,6 +29,18 @@ &wifi0 {
 	brcm,board-type = "apple,atlantisb";
 };
 
+/*
+ * Provide labels for the USB type C ports.
+ */
+
+&typec0 {
+	label = "USB-C Back-left";
+};
+
+&typec1 {
+	label = "USB-C Back-right";
+};
+
 /*
  * Force the bus number assignments so that we can declare some of the
  * on-board devices and properties that are populated by the bootloader
diff --git a/arch/arm64/boot/dts/apple/t8103-j293.dts b/arch/arm64/boot/dts/apple/t8103-j293.dts
index 5b3c42e9f0e6776241bf746d3458766e44e3639a..678f89c3d47fbf2d0705b46bb8feba3fa018ca7a 100644
--- a/arch/arm64/boot/dts/apple/t8103-j293.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j293.dts
@@ -46,6 +46,18 @@ &wifi0 {
 	brcm,board-type = "apple,honshu";
 };
 
+/*
+ * Provide labels for the USB type C ports.
+ */
+
+&typec0 {
+	label = "USB-C Left-back";
+};
+
+&typec1 {
+	label = "USB-C Left-front";
+};
+
 &i2c2 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/apple/t8103-j313.dts b/arch/arm64/boot/dts/apple/t8103-j313.dts
index 97a4344d8dca685708aff136af92a1b316f3c3dd..bce9b911009e2b0caa9d8b2222cd1e8c3215f3b9 100644
--- a/arch/arm64/boot/dts/apple/t8103-j313.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j313.dts
@@ -41,3 +41,15 @@ &wifi0 {
 &fpwm1 {
 	status = "okay";
 };
+
+/*
+ * Provide labels for the USB type C ports.
+ */
+
+&typec0 {
+	label = "USB-C Left-back";
+};
+
+&typec1 {
+	label = "USB-C Left-front";
+};
diff --git a/arch/arm64/boot/dts/apple/t8103-j456.dts b/arch/arm64/boot/dts/apple/t8103-j456.dts
index 58c8e43789b4861544e20c717124ede3327be010..9983e11cacdf19d0a92ede108ceac21b7a02d5da 100644
--- a/arch/arm64/boot/dts/apple/t8103-j456.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j456.dts
@@ -47,6 +47,18 @@ hpm3: usb-pd@3c {
 	};
 };
 
+/*
+ * Provide labels for the USB type C ports.
+ */
+
+&typec0 {
+	label = "USB-C Back-right";
+};
+
+&typec1 {
+	label = "USB-C Back-right-middle";
+};
+
 /*
  * Force the bus number assignments so that we can declare some of the
  * on-board devices and properties that are populated by the bootloader
diff --git a/arch/arm64/boot/dts/apple/t8103-j457.dts b/arch/arm64/boot/dts/apple/t8103-j457.dts
index 152f95fd49a2118093396838fbd8b6bd1b518f81..a622ff607d407519000d1526b7244419a59644a3 100644
--- a/arch/arm64/boot/dts/apple/t8103-j457.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j457.dts
@@ -29,6 +29,18 @@ &wifi0 {
 	brcm,board-type = "apple,santorini";
 };
 
+/*
+ * Provide labels for the USB type C ports.
+ */
+
+&typec0 {
+	label = "USB-C Back-right";
+};
+
+&typec1 {
+	label = "USB-C Back-left";
+};
+
 /*
  * Force the bus number assignments so that we can declare some of the
  * on-board devices and properties that are populated by the bootloader
diff --git a/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi b/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi
index 0c8206156bfefda8a32c869787b2e0c8e67a9d17..758b2196954bc139c201d25298444f59c7832ea5 100644
--- a/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi
+++ b/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi
@@ -15,6 +15,8 @@ aliases {
 		serial0 = &serial0;
 		serial2 = &serial2;
 		wifi0 = &wifi0;
+		atcphy0 = &atcphy0;
+		atcphy1 = &atcphy1;
 	};
 
 	chosen {
@@ -53,6 +55,30 @@ hpm0: usb-pd@38 {
 		interrupt-parent = <&pinctrl_ap>;
 		interrupts = <106 IRQ_TYPE_LEVEL_LOW>;
 		interrupt-names = "irq";
+
+		typec0: connector {
+			compatible = "usb-c-connector";
+			power-role = "dual";
+			data-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					typec0_connector_hs: endpoint {
+						remote-endpoint = <&dwc3_0_hs>;
+					};
+				};
+				port@1 {
+					reg = <1>;
+					typec0_connector_ss: endpoint {
+						remote-endpoint = <&atcphy0_typec_lanes>;
+					};
+				};
+			};
+		};
 	};
 
 	hpm1: usb-pd@3f {
@@ -61,6 +87,117 @@ hpm1: usb-pd@3f {
 		interrupt-parent = <&pinctrl_ap>;
 		interrupts = <106 IRQ_TYPE_LEVEL_LOW>;
 		interrupt-names = "irq";
+
+		typec1: connector {
+			compatible = "usb-c-connector";
+			power-role = "dual";
+			data-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					typec1_connector_hs: endpoint {
+						remote-endpoint = <&dwc3_1_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					typec1_connector_ss: endpoint {
+						remote-endpoint = <&atcphy1_typec_lanes>;
+					};
+				};
+			};
+		};
+	};
+};
+
+/* USB controllers */
+&dwc3_0 {
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			dwc3_0_hs: endpoint {
+				remote-endpoint = <&typec0_connector_hs>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+			dwc3_0_ss: endpoint {
+				remote-endpoint = <&atcphy0_usb3>;
+			};
+		};
+	};
+};
+
+&dwc3_1 {
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			dwc3_1_hs: endpoint {
+				remote-endpoint = <&typec1_connector_hs>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+			dwc3_1_ss: endpoint {
+				remote-endpoint = <&atcphy1_usb3>;
+			};
+		};
+	};
+};
+
+/* Type-C PHYs */
+&atcphy0 {
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			atcphy0_typec_lanes: endpoint {
+				remote-endpoint = <&typec0_connector_ss>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+			atcphy0_usb3: endpoint {
+				remote-endpoint = <&dwc3_0_ss>;
+			};
+		};
+	};
+};
+
+&atcphy1 {
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			atcphy1_typec_lanes: endpoint {
+				remote-endpoint = <&typec1_connector_ss>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+			atcphy1_usb3: endpoint {
+				remote-endpoint = <&dwc3_1_ss>;
+			};
+		};
 	};
 };
 
diff --git a/arch/arm64/boot/dts/apple/t8103.dtsi b/arch/arm64/boot/dts/apple/t8103.dtsi
index 589ddc0397995ecf6fc11b135164229ab1ee7cf8..659a73fafccb04c1b944f6b7afeb0e372d4bb748 100644
--- a/arch/arm64/boot/dts/apple/t8103.dtsi
+++ b/arch/arm64/boot/dts/apple/t8103.dtsi
@@ -10,6 +10,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/apple-aic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/phy/phy.h>
 #include <dt-bindings/pinctrl/apple.h>
 #include <dt-bindings/spmi/spmi.h>
 
@@ -972,6 +973,110 @@ nvme@27bcc0000 {
 			resets = <&ps_ans2>;
 		};
 
+		dwc3_0: usb@382280000 {
+			compatible = "apple,t8103-dwc3", "snps,dwc3";
+			reg = <0x3 0x82280000 0x0 0x100000>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 777 IRQ_TYPE_LEVEL_HIGH>;
+			dr_mode = "otg";
+			usb-role-switch;
+			role-switch-default-mode = "host";
+			iommus = <&dwc3_0_dart_0 0>, <&dwc3_0_dart_1 1>;
+			power-domains = <&ps_atc0_usb>;
+			resets = <&atcphy0>;
+			phys = <&atcphy0 PHY_TYPE_USB2>, <&atcphy0 PHY_TYPE_USB3>;
+			phy-names = "usb2-phy", "usb3-phy";
+		};
+
+		dwc3_0_dart_0: iommu@382f00000 {
+			compatible = "apple,t8103-dart";
+			reg = <0x3 0x82f00000 0x0 0x4000>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 781 IRQ_TYPE_LEVEL_HIGH>;
+			#iommu-cells = <1>;
+			power-domains = <&ps_atc0_usb>;
+		};
+
+		dwc3_0_dart_1: iommu@382f80000 {
+			compatible = "apple,t8103-dart";
+			reg = <0x3 0x82f80000 0x0 0x4000>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 781 IRQ_TYPE_LEVEL_HIGH>;
+			#iommu-cells = <1>;
+			power-domains = <&ps_atc0_usb>;
+		};
+
+		atcphy0: phy@383000000 {
+			compatible = "apple,t8103-atcphy";
+			reg = <0x3 0x83000000 0x0 0x4c000>,
+				<0x3 0x83050000 0x0 0x8000>,
+				<0x3 0x80000000 0x0 0x4000>,
+				<0x3 0x82a90000 0x0 0x4000>,
+				<0x3 0x82a84000 0x0 0x4000>;
+			reg-names = "core", "lpdptx", "axi2af", "usb2phy",
+				"pipehandler";
+
+			#phy-cells = <1>;
+			#reset-cells = <0>;
+
+			orientation-switch;
+			mode-switch;
+			power-domains = <&ps_atc0_usb>;
+			//power-domains = <&ps_atc0_usb_aon>, <&ps_atc0_common>;
+		};
+
+		dwc3_1: usb@502280000 {
+			compatible = "apple,t8103-dwc3", "snps,dwc3";
+			reg = <0x5 0x02280000 0x0 0x100000>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 857 IRQ_TYPE_LEVEL_HIGH>;
+			dr_mode = "otg";
+			usb-role-switch;
+			role-switch-default-mode = "host";
+			iommus = <&dwc3_1_dart_0 0>, <&dwc3_1_dart_1 1>;
+			power-domains = <&ps_atc1_usb>;
+			resets = <&atcphy1>;
+			phys = <&atcphy1 PHY_TYPE_USB2>, <&atcphy1 PHY_TYPE_USB3>;
+			phy-names = "usb2-phy", "usb3-phy";
+		};
+
+		dwc3_1_dart_0: iommu@502f00000 {
+			compatible = "apple,t8103-dart";
+			reg = <0x5 0x02f00000 0x0 0x4000>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 861 IRQ_TYPE_LEVEL_HIGH>;
+			#iommu-cells = <1>;
+			power-domains = <&ps_atc1_usb>;
+		};
+
+		dwc3_1_dart_1: iommu@502f80000 {
+			compatible = "apple,t8103-dart";
+			reg = <0x5 0x02f80000 0x0 0x4000>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 861 IRQ_TYPE_LEVEL_HIGH>;
+			#iommu-cells = <1>;
+			power-domains = <&ps_atc1_usb>;
+		};
+
+		atcphy1: phy@503000000 {
+			compatible = "apple,t8103-atcphy";
+			reg = <0x5 0x03000000 0x0 0x4c000>,
+				<0x5 0x03050000 0x0 0x8000>,
+				<0x5 0x0 0x0 0x4000>,
+				<0x5 0x02a90000 0x0 0x4000>,
+				<0x5 0x02a84000 0x0 0x4000>;
+			reg-names = "core", "lpdptx", "axi2af", "usb2phy",
+				"pipehandler";
+
+			#phy-cells = <1>;
+			#reset-cells = <0>;
+
+			orientation-switch;
+			mode-switch;
+			power-domains = <&ps_atc1_usb>;
+			//power-domains = <&ps_atc1_usb_aon>, <&ps_atc1_common>;
+		};
+
 		pcie0_dart_0: iommu@681008000 {
 			compatible = "apple,t8103-dart";
 			reg = <0x6 0x81008000 0x0 0x4000>;

-- 
2.34.1



