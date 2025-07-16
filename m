Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 435C3C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 11:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UaSkr3Mtkvd2G/yImBVwlc1QjOnwWe0If2XenQOoUZw=; b=R9wA2aq4jUqWXdHz0NSqOxlo4d
	BhHbIGHxCvRnZda1exZ5NDMLaCo5woki25tz2zRnkOl22alYDlWa+7vWRl6IiQVjW7drvwhFYO2eb
	yEQC5OUnZ8G4d26cVt0MsuIf0/yS20fAHjcrTp4NgTUpS0LVVpnCGE+FJKp/UV+U07FUaGgraW2eB
	z7vPKs5bdssr8jIpN+l0O8BmXdOTEqijzcNmvEw00G+KKBG+IXKfbowrvI5/yhnriALpdBzkM6npK
	IDam9VAx4qNsU6N1YgHVeFkT6ip6wd+OKabNZoUqBc8alofixgBNCm//8lhOTUT9lZQmNeq60mFGA
	tPppk3xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc0bk-00000007any-0SZm;
	Wed, 16 Jul 2025 11:47:32 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc0Bc-00000007Xe1-1cpS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 11:20:33 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56GBKFkp239948;
	Wed, 16 Jul 2025 06:20:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1752664815;
	bh=UaSkr3Mtkvd2G/yImBVwlc1QjOnwWe0If2XenQOoUZw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=d1pIgS0RxaFtBBO2EjCCvEdxT1OcyYv+pg/fLVdmD/yM7TAswuLQoiN6/JLaboAkn
	 GVctZzByCsQGxHKSZkl6vlksFChYn04n7VjotD8G2ah+1tKFtT/4WCkxFF7+J1POyA
	 e0PQOIPMyKixbURgX1mYZk4Wz/7eDwYcWLysxG3o=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56GBKEKj1981344
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 16 Jul 2025 06:20:14 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 16
 Jul 2025 06:20:14 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 16 Jul 2025 06:20:14 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [172.24.227.115])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56GBJep3344714;
	Wed, 16 Jul 2025 06:20:07 -0500
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
To: <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>
CC: <linux@armlinux.org.uk>, <ardb@kernel.org>, <ebiggers@kernel.org>,
        <geert+renesas@glider.be>, <claudiu.beznea@tuxon.dev>,
        <bparrot@ti.com>, <andre.draszik@linaro.org>,
        <kuninori.morimoto.gx@renesas.com>,
        <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        <heikki.krogerus@linux.intel.com>, <kory.maincent@bootlin.com>,
        <florian.fainelli@broadcom.com>, <lumag@kernel.org>,
        <dale@farnsworth.org>, <sbellary@baylibre.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <dagriego@biglakesoftware.com>, <u-kumar1@ti.com>,
        <y-abhilashchandra@ti.com>
Subject: [PATCH V2 3/4] dt-bindings: media: ti: vpe: Add bindings for Video Input Port
Date: Wed, 16 Jul 2025 16:49:11 +0530
Message-ID: <20250716111912.235157-4-y-abhilashchandra@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250716111912.235157-1-y-abhilashchandra@ti.com>
References: <20250716111912.235157-1-y-abhilashchandra@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_042032_509005_9540802B 
X-CRM114-Status: GOOD (  20.08  )
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

From: Dale Farnsworth <dale@farnsworth.org>

Add device tree bindings for the Video Input Port. Video Input Port (VIP)
can be found on devices such as DRA7xx and provides a parallel interface
to a video source such as a sensor or TV decoder.

Signed-off-by: Dale Farnsworth <dale@farnsworth.org>
Signed-off-by: Benoit Parrot <bparrot@ti.com>
Signed-off-by: Sukrut Bellary <sbellary@baylibre.com>
Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
---
Changelog:
Changes in v2:
- Remove array and just use hsync: true in bindings
- Remove array and use enum for bus width in bindings
- Use pattern properties since properties across ports are same
- Update copyright year

 .../devicetree/bindings/media/ti,vip.yaml     | 211 ++++++++++++++++++
 MAINTAINERS                                   |   1 +
 2 files changed, 212 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/ti,vip.yaml

diff --git a/Documentation/devicetree/bindings/media/ti,vip.yaml b/Documentation/devicetree/bindings/media/ti,vip.yaml
new file mode 100644
index 000000000000..44091c15a537
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/ti,vip.yaml
@@ -0,0 +1,211 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2025 Texas Instruments Incorporated -  http://www.ti.com/
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/ti,vip.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments DRA7x VIDEO INPUT PORT (VIP).
+
+maintainers:
+  - Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
+
+description: |-
+  The Video Input Port (VIP) is a key component for image capture
+  applications. The capture module provides the system interface and the
+  processing capability to connect parallel image-sensor as well as
+  BT.656/1120 capable encoder chip to DRA7x device.
+
+  Each VIP instance supports 2 independently configurable external video
+  input capture slices (Slice 0 and Slice 1) each providing up to two video
+  input ports (Port A and Port B) where Port A can be configured as
+  24/16/8-bit port and Port B is fixed as 8-bit port.
+  Here these ports a represented as follows
+    port@0 -> Slice 0 Port A
+    port@1 -> Slice 0 Port B
+    port@2 -> Slice 1 Port A
+    port@3 -> Slice 1 Port B
+
+  Each camera port nodes should contain a 'port' child node with child
+  'endpoint' node. Please refer to the bindings defined in
+  Documentation/devicetree/bindings/media/video-interfaces.yaml.
+
+properties:
+  compatible:
+    enum:
+      - ti,dra7-vip
+
+  label:
+    description: Instance name
+
+  reg:
+    items:
+      - description: The VIP main register region
+      - description: Video Data Parser (PARSER) register region for Slice0
+      - description: Color Space Conversion (CSC) register region for Slice0
+      - description: Scaler (SC) register region for Slice0
+      - description: Video Data Parser (PARSER) register region for Slice1
+      - description: Color Space Conversion (CSC) register region for Slice1
+      - description: Scaler (SC) register region for Slice1
+      - description: Video Port Direct Memory Access (VPDMA) register region
+
+  reg-names:
+    items:
+      - const: vip
+      - const: parser0
+      - const: csc0
+      - const: sc0
+      - const: parser1
+      - const: csc1
+      - const: sc1
+      - const: vpdma
+
+  interrupts:
+    minItems: 2
+    description:
+      IRQ index 0 is used for Slice0 interrupts
+      IRQ index 1 is used for Slice1 interrupts
+
+  ti,vip-clk-polarity:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description:
+      phandle to the device control module. The 1st argument should
+      contain the register offset to the CTRL_CORE_SMA_SW_1 register.
+      2nd argument contains the bit field to slice 0 port A,
+      3rd argument contains the bit field to slice 0 port B,
+      4th argument contains the bit field to slice 1 port A,
+      5th argument contains the bit field to slice 1 port B.
+
+patternProperties:
+  '^port@[0-3]$':
+    type: object
+    additionalProperties: false
+
+    properties:
+      "#address-cells":
+        const: 1
+
+      "#size-cells":
+        const: 0
+      reg:
+        description: The port number
+        maxItems: 1
+
+      label:
+        description: Port name. Usually the pin group name
+
+      endpoint:
+        $ref: /schemas/graph.yaml#/properties/endpoint
+        type: object
+        additionalProperties: false
+
+        properties:
+          hsync-active: true
+          vsync-active: true
+          pclk-sample: true
+          bus-width:
+            enum: [8, 24]
+            default: 8
+
+          remote-endpoint: true
+
+    required:
+      - "#address-cells"
+      - "#size-cells"
+      - port@0
+      - reg
+      - label
+
+required:
+  - compatible
+  - label
+  - reg
+  - reg-names
+  - interrupts
+  - ti,vip-clk-polarity
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    vip1: vip@48970000 {
+        compatible = "ti,dra7-vip1";
+        label = "vip1";
+        reg = <0x48970000 0x114>,
+              <0x48975500 0xD8>,
+              <0x48975700 0x18>,
+              <0x48975800 0x80>,
+              <0x48975a00 0xD8>,
+              <0x48975c00 0x18>,
+              <0x48975d00 0x80>,
+              <0x4897d000 0x400>;
+        reg-names = "vip",
+                    "parser0",
+                    "csc0",
+                    "sc0",
+                    "parser1",
+                    "csc1",
+                    "sc1",
+                    "vpdma";
+        interrupts = <GIC_SPI 351 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 392 IRQ_TYPE_LEVEL_HIGH>;
+        ti,vip-clk-polarity = <&scm_conf 0x534 0x1 0x4 0x2 0x8>;
+
+        ports {
+              #address-cells = <1>;
+              #size-cells = <0>;
+
+              vin1a: port@0 {
+                    reg = <0>;
+                    label = "vin1a";
+
+                    vin1a_ep: endpoint {
+                           remote-endpoint = <&camera1>;
+                           hsync-active = <1>;
+                           vsync-active = <1>;
+                           pclk-sample = <0>;
+                           bus-width = <8>;
+                    };
+              };
+              vin1b: port@1 {
+                    reg = <1>;
+                    label = "vin1b";
+              };
+              vin2a: port@2 {
+                    reg = <2>;
+                    label = "vin2a";
+              };
+              vin2b: port@3 {
+                    reg = <3>;
+                    label = "vin2b";
+              };
+         };
+    };
+
+    i2c {
+        clock-frequency = <400000>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+         camera@37 {
+              compatible = "ovti,ov10633";
+              reg = <0x37>;
+
+              clocks = <&fixed_clock>;
+              clocks-names = "xvclk";
+
+              port {
+                   camera1: endpoint {
+                           remote-endpoint = <&vin1a_ep>;
+                           hsync-active = <1>;
+                           vsync-active = <1>;
+                           pclk-sample = <0>;
+                           bus-width = <8>;
+                   };
+              };
+         };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index ea4b29c8b6b5..c5c5f0d1967f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25211,6 +25211,7 @@ S:	Maintained
 W:	http://linuxtv.org/
 Q:	http://patchwork.linuxtv.org/project/linux-media/list/
 F:	Documentation/devicetree/bindings/media/ti,cal.yaml
+F:	Documentation/devicetree/bindings/media/ti,vip.yaml
 F:	Documentation/devicetree/bindings/media/ti,vpe.yaml
 F:	drivers/media/platform/ti/cal/
 F:	drivers/media/platform/ti/vpe/
-- 
2.34.1


