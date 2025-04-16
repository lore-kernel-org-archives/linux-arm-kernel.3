Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B7DDC369C9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 20:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CQlit9kN6oD5sRIOL/9WK/0jdsLoZ1hCOk4HeRR9CFw=; b=q8zpWODQHdAFUh/HcgZk74ATO0
	mfQncW61u3cjeGHUhZWSF2xRKkNe7Ne32dP15F2bypbEjc02zwYDFvsjralPpvZaq0rqvnWWEGdSo
	i3nV9s1z3tB36gCHTlvRuAVjDzwucajUQACmXJYX/93bkzAWZn7c0lwsXdlRANPdbhKKbH7vcUdGv
	vSQ/4v8SyhayK/KEytPGZOZ4hLog0LyRkxPi2CzFw3lAK3vbh1ZSDvFow6AnpII7+w2lwHBMb0ai4
	wTPBkPzenGRDsibLe4CfMOP3SwqLXiFgvJzd/qpb7lWYjdAmT3It3NNGGxHK1Lf2D/8Eu63dCd6BJ
	VL2ndivw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u59Kz-0000000AoYN-3u8o;
	Wed, 16 Apr 2025 20:26:25 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u59J6-0000000Ao40-1Iiz;
	Wed, 16 Apr 2025 20:24:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 013D6A4896B;
	Wed, 16 Apr 2025 20:18:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6DD6C4CEE2;
	Wed, 16 Apr 2025 20:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744835067;
	bh=WfUFnz3XQTI9rQiMVaDEIMykc9/pCuEV+oouum9Aruw=;
	h=From:To:Cc:Subject:Date:From;
	b=fus07UYxBpb6RauZcuhpJUcoUAcoOkj1CKhhdPf9Tnx40vE9AaTWrOKp0/0iiRNDb
	 6EnmLxkyS9qEZtI1sGOSie29mEmD/BeglKRiK4GQBxIplbam6U4hayLkXmc2r455hp
	 nNAZytskGxUX+AqAZ6Z+3qr5W2vnx2b94HiP05BmdrS5d1Wuhtg5InI2GesflU7tcb
	 0S/Ro4gkncRKTSVmAqeKV+I51JohxVqpI2NwBfVVAbOT5Q4214KKma0GeVcC8kald7
	 IbntXwb2z5JkBjnuw++LRvy8YFosEVb7ApJOS8BTFXmMoQ7STaNkCIEKXMCpWIO0nI
	 7daRXh8veDorw==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v2] dt-bindings: phy: rockchip: Convert RK3399 Type-C PHY to schema
Date: Wed, 16 Apr 2025 15:24:17 -0500
Message-ID: <20250416202419.3836688-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_132428_474567_6CE8BE4E 
X-CRM114-Status: GOOD (  18.64  )
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

Convert the Rockchip RK3399 Type-C PHY to DT schema format. Add the
missing "power-domains" property and "port" and "orientation-switch"
properties in the child nodes.

Omit the previously deprecated properties as they aren't used anywhere.

Drop the 2nd example which was pretty much identical to the 1st example.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

---
v2:
 - Update reference in rockchip,dwc3.yaml
---
 .../bindings/phy/phy-rockchip-typec.txt       |  84 -------------
 .../phy/rockchip,rk3399-typec-phy.yaml        | 116 ++++++++++++++++++
 .../bindings/usb/rockchip,dwc3.yaml           |   2 +-
 3 files changed, 117 insertions(+), 85 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/phy/phy-rockchip-typec.txt
 create mode 100644 Documentation/devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/phy-rockchip-typec.txt b/Documentation/devicetree/bindings/phy/phy-rockchip-typec.txt
deleted file mode 100644
index 960da7fcaa9e..000000000000
--- a/Documentation/devicetree/bindings/phy/phy-rockchip-typec.txt
+++ /dev/null
@@ -1,84 +0,0 @@
-* ROCKCHIP type-c PHY
----------------------
-
-Required properties:
- - compatible : must be "rockchip,rk3399-typec-phy"
- - reg: Address and length of the usb phy control register set
- - rockchip,grf : phandle to the syscon managing the "general
-   register files"
- - clocks : phandle + clock specifier for the phy clocks
- - clock-names : string, clock name, must be "tcpdcore", "tcpdphy-ref";
- - assigned-clocks: main clock, should be <&cru SCLK_UPHY0_TCPDCORE> or
-		    <&cru SCLK_UPHY1_TCPDCORE>;
- - assigned-clock-rates : the phy core clk frequency, shall be: 50000000
- - resets : a list of phandle + reset specifier pairs
- - reset-names : string reset name, must be:
-		 "uphy", "uphy-pipe", "uphy-tcphy"
-
-Optional properties:
- - extcon : extcon specifier for the Power Delivery
-
-Required nodes : a sub-node is required for each port the phy provides.
-		 The sub-node name is used to identify dp or usb3 port,
-		 and shall be the following entries:
-	* "dp-port" : the name of DP port.
-	* "usb3-port" : the name of USB3 port.
-
-Required properties (port (child) node):
-- #phy-cells : must be 0, See ./phy-bindings.txt for details.
-
-Deprecated properties, do not use in new device tree sources, these
-properties are determined by the compatible value:
- - rockchip,typec-conn-dir
- - rockchip,usb3tousb2-en
- - rockchip,external-psm
- - rockchip,pipe-status
-
-Example:
-	tcphy0: phy@ff7c0000 {
-		compatible = "rockchip,rk3399-typec-phy";
-		reg = <0x0 0xff7c0000 0x0 0x40000>;
-		rockchip,grf = <&grf>;
-		extcon = <&fusb0>;
-		clocks = <&cru SCLK_UPHY0_TCPDCORE>,
-			 <&cru SCLK_UPHY0_TCPDPHY_REF>;
-		clock-names = "tcpdcore", "tcpdphy-ref";
-		assigned-clocks = <&cru SCLK_UPHY0_TCPDCORE>;
-		assigned-clock-rates = <50000000>;
-		resets = <&cru SRST_UPHY0>,
-			 <&cru SRST_UPHY0_PIPE_L00>,
-			 <&cru SRST_P_UPHY0_TCPHY>;
-		reset-names = "uphy", "uphy-pipe", "uphy-tcphy";
-
-		tcphy0_dp: dp-port {
-			#phy-cells = <0>;
-		};
-
-		tcphy0_usb3: usb3-port {
-			#phy-cells = <0>;
-		};
-	};
-
-	tcphy1: phy@ff800000 {
-		compatible = "rockchip,rk3399-typec-phy";
-		reg = <0x0 0xff800000 0x0 0x40000>;
-		rockchip,grf = <&grf>;
-		extcon = <&fusb1>;
-		clocks = <&cru SCLK_UPHY1_TCPDCORE>,
-			 <&cru SCLK_UPHY1_TCPDPHY_REF>;
-		clock-names = "tcpdcore", "tcpdphy-ref";
-		assigned-clocks = <&cru SCLK_UPHY1_TCPDCORE>;
-		assigned-clock-rates = <50000000>;
-		resets = <&cru SRST_UPHY1>,
-			 <&cru SRST_UPHY1_PIPE_L00>,
-			 <&cru SRST_P_UPHY1_TCPHY>;
-		reset-names = "uphy", "uphy-pipe", "uphy-tcphy";
-
-		tcphy1_dp: dp-port {
-			#phy-cells = <0>;
-		};
-
-		tcphy1_usb3: usb3-port {
-			#phy-cells = <0>;
-		};
-	};
diff --git a/Documentation/devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml b/Documentation/devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml
new file mode 100644
index 000000000000..91c011f68cd0
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml
@@ -0,0 +1,116 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/rockchip,rk3399-typec-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip Type-C PHY
+
+maintainers:
+  - Heiko Stuebner <heiko@sntech.de>
+
+properties:
+  compatible:
+    const: rockchip,rk3399-typec-phy
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: tcpdcore
+      - const: tcpdphy-ref
+
+  extcon: true
+
+  power-domains:
+    maxItems: 1
+
+  resets:
+    maxItems: 3
+
+  reset-names:
+    items:
+      - const: uphy
+      - const: uphy-pipe
+      - const: uphy-tcphy
+
+  rockchip,grf:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the syscon managing the "general register files" (GRF).
+
+  dp-port:
+    type: object
+    additionalProperties: false
+
+    properties:
+      '#phy-cells':
+        const: 0
+
+      port:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Connection to USB Type-C connector
+
+    required:
+      - '#phy-cells'
+
+  usb3-port:
+    type: object
+    additionalProperties: false
+
+    properties:
+      '#phy-cells':
+        const: 0
+
+      orientation-switch: true
+
+      port:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Connection to USB Type-C connector SS port
+
+    required:
+      - '#phy-cells'
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - dp-port
+  - usb3-port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/rk3399-cru.h>
+
+    phy@ff7c0000 {
+        compatible = "rockchip,rk3399-typec-phy";
+        reg = <0xff7c0000 0x40000>;
+        rockchip,grf = <&grf>;
+        extcon = <&fusb0>;
+        clocks = <&cru SCLK_UPHY0_TCPDCORE>,
+           <&cru SCLK_UPHY0_TCPDPHY_REF>;
+        clock-names = "tcpdcore", "tcpdphy-ref";
+        resets = <&cru SRST_UPHY0>,
+                 <&cru SRST_UPHY0_PIPE_L00>,
+                 <&cru SRST_P_UPHY0_TCPHY>;
+        reset-names = "uphy", "uphy-pipe", "uphy-tcphy";
+
+        dp-port {
+            #phy-cells = <0>;
+        };
+
+        usb3-port {
+            #phy-cells = <0>;
+        };
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/usb/rockchip,dwc3.yaml b/Documentation/devicetree/bindings/usb/rockchip,dwc3.yaml
index fba2cb05ecba..fd1b13c0ed6b 100644
--- a/Documentation/devicetree/bindings/usb/rockchip,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/rockchip,dwc3.yaml
@@ -18,7 +18,7 @@ description:
   Documentation/devicetree/bindings/phy/rockchip,inno-usb2phy.yaml
 
   Type-C PHY
-  Documentation/devicetree/bindings/phy/phy-rockchip-typec.txt
+  Documentation/devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml
 
 select:
   properties:
-- 
2.47.2


