Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6198BC5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 16:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Hr9b/XLqf5ZDJpuwGVa2yy8IR3LSeHLObl789Jl3VYU=; b=Nru1lJ/xzzQM6cAFJp190DQIwE
	nBiyX9qe6OiFe+sghUlOHZfKp3gJgXb95tjb4VyZ1E/6OBx0omt7FxqbGHvkWpIbHgEKlcvqAL9Zu
	w+M+DCe6Rsa04W1tH1DWEDSudpMFcsiyRDHapTQbyQzVF638naMyFASJ+vkyf8WQv0D+C5hciGaou
	3h/FaOjKq1lwtmZUQcSTxXB0VX+zKMKEPq3YMF1Hx7CwiQaY62ZfPVb+uutZrVz2jJkR+G7ZtPFk7
	jtytuEYlNO6a8mOCQ2XrbaEMTChX/jWAucEz+upZzSyOp0l9t+BP2dvIQzPruSaLlj4EOZmZxaFWe
	3WRneO0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwjFG-0000000AC37-3U82;
	Wed, 19 Aug 2026 16:34:30 +0000
Received: from mx.nabladev.com ([2a00:f820:417:0:178:251:229:89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwjFD-0000000AC2T-3ZPn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 16:34:29 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C08C2119206;
	Wed, 19 Aug 2026 18:34:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1787157261; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=Hr9b/XLqf5ZDJpuwGVa2yy8IR3LSeHLObl789Jl3VYU=;
	b=Cf3AHAWetSlup9payahjjVWstjoaf0V5y+LS0d0/1GDrDTiK6fMfQ1WTTNmfyWICctNfNE
	UYiUyAtjL9XYUVtZXX3g6u2qDIQEue7FFN5v8LLJtXfXiW86QYTx3m0kAA368adcByqXgz
	rAGKiLkMPdTKw6MACXBfE4pkoRPvk8Y3jy8GhP1+xNQnF1KDTbUCV4lztiP4SgvctR2XcP
	LEerpPZvgynft54h4qD0vGmo7xWHIZQcDK2Z+zIRkeAOps57YW828vHcYuAn0YDj5uLgAh
	/aKnAuVGcvvTAzJVLjfl13sKK9ffukPTi8/DeP4f3cnk6fSckIHgc/pv2AsCJg==
From: Marek Vasut <marex@nabladev.com>
To: linux-usb@vger.kernel.org
Cc: fabrice.gasnier@foss.st.com,
	Marek Vasut <marex@nabladev.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	devicetree@vger.kernel.org,
	kernel@dh-electronics.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 1/4] dt-bindings: usb: Document ST UCPD
Date: Wed, 19 Aug 2026 18:33:52 +0200
Message-ID: <20260819163410.119755-1-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_093428_164820_214D1AC2 
X-CRM114-Status: GOOD (  12.70  )
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

Document ST UCPD Type-C block. The UCPD integrates the physical
layer of the Power Delivery (PD), with CC signaling method, for
operation with Type-C cables. Vbus and Vconn control is performed
using an external chip, usually ST TCPP01/TCPP02/TCPP03 or similar.

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: devicetree@vger.kernel.org
Cc: kernel@dh-electronics.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-usb@vger.kernel.org
---
 .../bindings/usb/st,stm32mp25-ucpd.yaml       | 154 ++++++++++++++++++
 1 file changed, 154 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/st,stm32mp25-ucpd.yaml

diff --git a/Documentation/devicetree/bindings/usb/st,stm32mp25-ucpd.yaml b/Documentation/devicetree/bindings/usb/st,stm32mp25-ucpd.yaml
new file mode 100644
index 0000000000000..9b13efdc90597
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/st,stm32mp25-ucpd.yaml
@@ -0,0 +1,154 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/st,stm32mp25-ucpd.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STMicroelectronics STM32MP25 UCPD Type-C controller
+
+maintainers:
+  - Marek Vasut <marex@nabladev.com>
+
+description:
+  The UCPD integrates the physical layer of the Power Delivery (PD),
+  with CC signaling method, for operation with Type-C cables. Vbus
+  and Vconn control is performed using an external chip, usually
+  ST TCPP01/TCPP02/TCPP03 or similar.
+
+properties:
+  compatible:
+    const: st,stm32mp25-ucpd
+
+  reg:
+    maxItems: 1
+
+  access-controllers:
+    maxItems: 1
+
+  clocks:
+    minItems: 2
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: apb
+      - const: ker
+
+  interrupts:
+    maxItems: 1
+
+  nvmem-cells:
+    maxItems: 1
+
+  nvmem-cell-names:
+    const: trim
+
+  power-domains:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  reset-names:
+    const: phy
+
+  vconn-gpios:
+    description: GPIOs used to control CC1 and CC2 Vconn
+
+  vdd33-supply:
+    description: Regulator that supplies the CC lines driver
+
+  connector:
+    type: object
+    $ref: /schemas/connector/usb-connector.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      compatible:
+        const: usb-c-connector
+
+      power-role: true
+
+      typec-power-opmode: true
+
+    required:
+      - compatible
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - nvmem-cells
+  - nvmem-cell-names
+  - power-domains
+  - resets
+  - reset-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/st,stm32mp25-rcc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/reset/st,stm32mp25-rcc.h>
+
+    ucpd: phy@480a0000 {
+        compatible = "st,stm32mp25-ucpd";
+        reg = <0x480a0000 0x1000>;
+        access-controllers = <&rifsc 69>;
+        clocks = <&rcc CK_BUS_USBTC>, <&rcc CK_KER_USBTC>;
+        clock-names = "apb", "ker";
+        interrupts = <46 IRQ_TYPE_LEVEL_HIGH>;
+        nvmem-cells = <&ucpdtrim>;
+        nvmem-cell-names = "trim";
+        power-domains = <&cluster_pd>;
+        resets = <&rcc USBTC_R>;
+        reset-names = "phy";
+
+        vconn-gpios = <&tcpp 0 0>, <&tcpp 1 0>;
+        vdd33-supply = <&scmi_vdd33ucpd>;
+
+        connector {
+            compatible = "usb-c-connector";
+            label = "USB-C";
+            data-role = "dual";
+            power-role = "source";
+            self-powered;
+            vbus-gpios = <&gpioa 10 0>;
+            vbus-supply = <&reg_usbc_vbus>;
+
+            altmodes {
+                displayport {
+                    svid = /bits/ 16 <0xff01>;
+                    vdo = <0xffffffff>;
+                };
+            };
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    usbc0_hs_ep: endpoint {
+                        remote-endpoint = <&usb_drd0_hs_ep>;
+                    };
+                };
+                port@1 {
+                    reg = <1>;
+                    usbc0_ss_ep: endpoint {
+                        remote-endpoint = <&usb_drd0_ss_ep>;
+                    };
+                };
+
+                port@2 {
+                    reg = <2>;
+                    usbc0_sbu_ep: endpoint {
+                        remote-endpoint = <&usb_sbu_ep>;
+                    };
+                };
+            };
+        };
+    };
-- 
2.53.0


