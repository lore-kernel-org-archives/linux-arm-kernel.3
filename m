Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4CECC87FCE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Jul 2025 10:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pgAuU1w+qadYVpknwB4tvolA7yZlJMHj4wJ1fNZp6FY=; b=CRo2JXbNdX/ZU8loPeq3+lDjux
	5pVEg0dFe5K0WzM3EAzb7RoIetsyLMMYgwlEOh5Auah4G0ymPyI+s7cuznSupAc9ysT5cBFkyPdvm
	qhF/r/n42DUw4ElKVa0rXJdwia5CKhRlzB+MgItH2H1utBrcqd9fpFgvZFc3tDTcdsqolHDR7jC1/
	CehQc6wLE+N8U8yjMbvmBue3T6NiP6v9zzfdiAe3PAghMfSFkVomLfFmmC3E+DStj/s6W6KwSX1Nl
	KEHxfZY58qheNIPq6r+0ABzJTQjzUAxoNxtSVHB+mDMsTIkwGjO7EbnV5xFD2TxyxdDvsTXltZbM+
	GDccOuKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufyHd-0000000Caem-22iK;
	Sun, 27 Jul 2025 10:07:09 +0000
Received: from mx.denx.de ([2a03:4000:64:cc:545d:19ff:fe05:8172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufyCb-0000000CZa2-13jT
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Jul 2025 10:01:58 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 580361038C128;
	Sun, 27 Jul 2025 12:01:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1753610515; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=pgAuU1w+qadYVpknwB4tvolA7yZlJMHj4wJ1fNZp6FY=;
	b=cRpC6V2QcBeCBCln8rd7qOCzJsiuItDSyPp0+xJBcmhbpwUBBzsD1Kc085OOKi2+iWz3m1
	mfWA6AfZoLgOnWOcWZhGAtwsaRewQszRtNG6d6eTW8PPPkHPdldzfpouKYa1gefW8LcnZB
	0xbvr20JAyXgdrviXnJSoLYlkTlxK8iKUcSedx/kgB+00Y9ohCL/mLWbetA1/BUvMAA3db
	YVqj1DzHCuEY5wPc0iQqvgEJucnb9da8DDaMc+Vank6tX1y3JdtLFVWab/J3zxN9Kr0fom
	/1xA0nffqb0fFuCFBQH3vjY7DL7JjAWegebpKCnVTatwBiDKW8JvuVcEFC7z2Q==
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
	Lukasz Majewski <lukma@denx.de>
Subject: [net-next v17 01/12] dt-bindings: net: Add MTIP L2 switch description
Date: Sun, 27 Jul 2025 12:01:17 +0200
Message-Id: <20250727100128.1411514-2-lukma@denx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250727100128.1411514-1-lukma@denx.de>
References: <20250727100128.1411514-1-lukma@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250727_030157_580417_C6AFB84F 
X-CRM114-Status: GOOD (  15.36  )
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

This patch provides description of the MTIP L2 switch available in some
NXP's SOCs - e.g. imx287.

Signed-off-by: Lukasz Majewski <lukma@denx.de>
Reviewed-by: Stefan Wahren <wahrenst@gmx.net>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

---
Changes for v2:
- Rename the file to match exactly the compatible
  (nxp,imx287-mtip-switch)

Changes for v3:
- Remove '-' from const:'nxp,imx287-mtip-switch'
- Use '^port@[12]+$' for port patternProperties
- Drop status = "okay";
- Provide proper indentation for 'example' binding (replace 8
  spaces with 4 spaces)
- Remove smsc,disable-energy-detect; property
- Remove interrupt-parent and interrupts properties as not required
- Remove #address-cells and #size-cells from required properties check
- remove description from reg:
- Add $ref: ethernet-switch.yaml#

Changes for v4:
- Use $ref: ethernet-switch.yaml#/$defs/ethernet-ports and remove already
  referenced properties
- Rename file to nxp,imx28-mtip-switch.yaml

Changes for v5:
- Provide proper description for 'ethernet-port' node

Changes for v6:
- Proper usage of
  $ref: ethernet-switch.yaml#/$defs/ethernet-ports/patternProperties
  when specifying the 'ethernet-ports' property
- Add description and check for interrupt-names property

Changes for v7:
- Change switch interrupt name from 'mtipl2sw' to 'enet_switch'

Changes for v8:
- None

Changes for v9:
- Add GPIO_ACTIVE_LOW to reset-gpios mdio phandle

Changes for v10:
- None

Changes for v11:
- None

Changes for v12:
- Remove 'label' from required properties
- Move the reference to $ref: ethernet-switch.yaml#/$defs/ethernet-ports
  the proper place (under 'allOf:')

Changes for v13 - v17:
- None
---
 .../bindings/net/nxp,imx28-mtip-switch.yaml   | 150 ++++++++++++++++++
 1 file changed, 150 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/nxp,imx28-mtip-switch.yaml

diff --git a/Documentation/devicetree/bindings/net/nxp,imx28-mtip-switch.yaml b/Documentation/devicetree/bindings/net/nxp,imx28-mtip-switch.yaml
new file mode 100644
index 000000000000..6a07dcd119ea
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/nxp,imx28-mtip-switch.yaml
@@ -0,0 +1,150 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/nxp,imx28-mtip-switch.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP SoC Ethernet Switch Controller (L2 MoreThanIP switch)
+
+maintainers:
+  - Lukasz Majewski <lukma@denx.de>
+
+description:
+  The 2-port switch ethernet subsystem provides ethernet packet (L2)
+  communication and can be configured as an ethernet switch. It provides the
+  reduced media independent interface (RMII), the management data input
+  output (MDIO) for physical layer device (PHY) management.
+
+allOf:
+  - $ref: ethernet-switch.yaml#/$defs/ethernet-ports
+
+properties:
+  compatible:
+    const: nxp,imx28-mtip-switch
+
+  reg:
+    maxItems: 1
+
+  phy-supply:
+    description:
+      Regulator that powers Ethernet PHYs.
+
+  clocks:
+    items:
+      - description: Register accessing clock
+      - description: Bus access clock
+      - description: Output clock for external device - e.g. PHY source clock
+      - description: IEEE1588 timer clock
+
+  clock-names:
+    items:
+      - const: ipg
+      - const: ahb
+      - const: enet_out
+      - const: ptp
+
+  interrupts:
+    items:
+      - description: Switch interrupt
+      - description: ENET0 interrupt
+      - description: ENET1 interrupt
+
+  interrupt-names:
+    items:
+      - const: enet_switch
+      - const: enet0
+      - const: enet1
+
+  pinctrl-names: true
+
+  ethernet-ports:
+    type: object
+    additionalProperties: true
+
+    patternProperties:
+      '^ethernet-port@[12]$':
+        type: object
+        additionalProperties: true
+        properties:
+          reg:
+            items:
+              - enum: [1, 2]
+            description: MTIP L2 switch port number
+
+        required:
+          - reg
+          - phy-mode
+          - phy-handle
+
+  mdio:
+    type: object
+    $ref: mdio.yaml#
+    unevaluatedProperties: false
+    description:
+      Specifies the mdio bus in the switch, used as a container for phy nodes.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - interrupt-names
+  - mdio
+  - ethernet-ports
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include<dt-bindings/interrupt-controller/irq.h>
+    #include<dt-bindings/gpio/gpio.h>
+    switch@800f0000 {
+        compatible = "nxp,imx28-mtip-switch";
+        reg = <0x800f0000 0x20000>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&mac0_pins_a>, <&mac1_pins_a>;
+        phy-supply = <&reg_fec_3v3>;
+        interrupts = <100>, <101>, <102>;
+        interrupt-names = "enet_switch", "enet0", "enet1";
+        clocks = <&clks 57>, <&clks 57>, <&clks 64>, <&clks 35>;
+        clock-names = "ipg", "ahb", "enet_out", "ptp";
+
+        ethernet-ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            mtip_port1: ethernet-port@1 {
+                reg = <1>;
+                label = "lan0";
+                local-mac-address = [ 00 00 00 00 00 00 ];
+                phy-mode = "rmii";
+                phy-handle = <&ethphy0>;
+            };
+
+            mtip_port2: ethernet-port@2 {
+                reg = <2>;
+                label = "lan1";
+                local-mac-address = [ 00 00 00 00 00 00 ];
+                phy-mode = "rmii";
+                phy-handle = <&ethphy1>;
+            };
+        };
+
+        mdio_sw: mdio {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            reset-gpios = <&gpio2 13 GPIO_ACTIVE_LOW>;
+            reset-delay-us = <25000>;
+            reset-post-delay-us = <10000>;
+
+            ethphy0: ethernet-phy@0 {
+                reg = <0>;
+            };
+
+            ethphy1: ethernet-phy@1 {
+                reg = <1>;
+            };
+        };
+    };
-- 
2.39.5


