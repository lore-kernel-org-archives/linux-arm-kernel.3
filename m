Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E26E0C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 10:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pvqw6982EGCfcMZjsBd3rEgWv+Hsc7YWNppWaSfoULI=; b=wmDJSJR8xuHnhrlsliWsKvkc7B
	/8KpYPkM+QsZAwLUzQjGFqdglzxvTuXMTBO/z4v7bO2xnkDrN8lG2PTlw1CPWo3xkea+PB7T72Ga0
	cgNTfb2zC+tVha8M/ULkvboN49panJ+31VlFaSFsPYe+UwaX/8dhlaQlhwdMBwFXWP8tacaNOvQ3b
	YKk0JY1nR1kr3BiYWAPVezLQ8vqvmEBBw4Sw23KJWIJey3tUkB9HpaMf4anGRkOlO6YLQ/1Aq7lNz
	vFf4uDppb4N+JWKKskAiV/IQ6Vfi0hjUaqsTDxVX6inwQM8odP0Ed2pyO4irSTTrAKi0ypzSlxAmI
	/92xd9AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzCUD-0000000055Z-0iMu;
	Mon, 31 Mar 2025 10:35:21 +0000
Received: from mx.denx.de ([89.58.32.78])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzCQp-000000004Kj-3GcX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Mar 2025 10:31:53 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 06DD31026C8AF;
	Mon, 31 Mar 2025 12:31:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1743417109; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=pvqw6982EGCfcMZjsBd3rEgWv+Hsc7YWNppWaSfoULI=;
	b=bLcVEj5rxdkwq1fctb6GdrTaHcFxNDwVmfq1yIVDWmLhAA+G/ZoMA6Zt8Sf3JzHLZ2c1l4
	8YC5FFoAP80T2FC8i+WcJ6ColgiZDbDLzCurvDhTLmEFSPJ5sv6tHwxIVCNdHHtuiErlHt
	/dkTSJKDbJwwHEvoaZoHqagZVFBDgzvaSTrTurVfkJon2WonpbbAJD9dEF3iVcs+E4KdB8
	iB8Ve6nBhN1P3a3og4JKx9//FVb+w9oqmORhYAQ3qOM7FxOV/rbM1XQyR0BkdtFzSUctWX
	vgNqNGDvR6x/8JdOQACVsIGZQoZAzSCwgc9uNJZ46seqcFaCbMUyLX7K+srXtQ==
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
	Lukasz Majewski <lukma@denx.de>
Subject: [PATCH v3 1/4] dt-bindings: net: Add MTIP L2 switch description
Date: Mon, 31 Mar 2025 12:31:13 +0200
Message-Id: <20250331103116.2223899-2-lukma@denx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250331103116.2223899-1-lukma@denx.de>
References: <20250331103116.2223899-1-lukma@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_033152_100372_20273871 
X-CRM114-Status: GOOD (  14.45  )
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
---
 .../bindings/net/nxp,imx287-mtip-switch.yaml  | 154 ++++++++++++++++++
 1 file changed, 154 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/nxp,imx287-mtip-switch.yaml

diff --git a/Documentation/devicetree/bindings/net/nxp,imx287-mtip-switch.yaml b/Documentation/devicetree/bindings/net/nxp,imx287-mtip-switch.yaml
new file mode 100644
index 000000000000..98eba3665f32
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/nxp,imx287-mtip-switch.yaml
@@ -0,0 +1,154 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/nxp,imx287-mtip-switch.yaml#
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
+$ref: ethernet-switch.yaml#
+
+properties:
+  compatible:
+    const: nxp,imx287-mtip-switch
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
+  pinctrl-names: true
+
+  ethernet-ports:
+    type: object
+    additionalProperties: false
+
+    properties:
+      '#address-cells':
+        const: 1
+      '#size-cells':
+        const: 0
+
+    patternProperties:
+      '^port@[12]+$':
+        type: object
+        description: MTIP L2 switch external ports
+
+        $ref: ethernet-controller.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          reg:
+            items:
+              - enum: [1, 2]
+            description: MTIP L2 switch port number
+
+          label:
+            description: Label associated with this port
+
+        required:
+          - reg
+          - label
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
+  - mdio
+  - ethernet-ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include<dt-bindings/interrupt-controller/irq.h>
+    switch@800f0000 {
+        compatible = "nxp,imx287-mtip-switch";
+        reg = <0x800f0000 0x20000>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&mac0_pins_a>, <&mac1_pins_a>;
+        phy-supply = <&reg_fec_3v3>;
+        interrupts = <100>, <101>, <102>;
+        clocks = <&clks 57>, <&clks 57>, <&clks 64>, <&clks 35>;
+        clock-names = "ipg", "ahb", "enet_out", "ptp";
+
+        ethernet-ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            mtip_port1: port@1 {
+                reg = <1>;
+                label = "lan0";
+                local-mac-address = [ 00 00 00 00 00 00 ];
+                phy-mode = "rmii";
+                phy-handle = <&ethphy0>;
+            };
+
+            mtip_port2: port@2 {
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
+            reset-gpios = <&gpio2 13 0>;
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


