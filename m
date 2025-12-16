Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBC74D5B87E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 01:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=weL0Q2RWbd0hDla0WW9on+dgFPaOW8HXPxasfOujFjE=; b=SJSysbGPYKmXfUdTmSOpo+5lB3
	w/hZh0b99t4XmpM8yhNB3SFquqocZ3FqLhcDje/7EzXkbcTGhAubUouLewnJP06mLIjA97/po71Ga
	C2uPkEvL7OZG76XbwTN+WLhpsTJPM/apCU0UFJugvT+PrUwHw4BIhEjmM2nwDg9XUYYd7PQaIAB3X
	XaCfNYdh/jC+MTcIt5eVyBVTNcoy8KyXDsiKiLqdRZdMnhdAPYZCqXRfXyvmrgDLodeea+ia/famw
	FK/nhClpFnGoC6f/IoC2TOcUOTw7LSxoP1SgWg3h2jeTJeFLFskam2pwpV2KoPp1QCZNSPm/odX/P
	rmKYTrsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVKCl-00000004WEr-0v11;
	Tue, 16 Dec 2025 01:50:23 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVKCg-00000004WA6-10cT;
	Tue, 16 Dec 2025 01:50:19 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 16 Dec
 2025 09:50:00 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 16 Dec 2025 09:50:00 +0800
From: Jacky Chou <jacky_chou@aspeedtech.com>
Date: Tue, 16 Dec 2025 09:50:01 +0800
Subject: [PATCH v7 2/7] dt-bindings: PCI: Add ASPEED PCIe RC support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251216-upstream_pcie_rc-v7-2-4aeb0f53c4ce@aspeedtech.com>
References: <20251216-upstream_pcie_rc-v7-0-4aeb0f53c4ce@aspeedtech.com>
In-Reply-To: <20251216-upstream_pcie_rc-v7-0-4aeb0f53c4ce@aspeedtech.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, "Andrew
 Jeffery" <andrew@codeconstruct.com.au>, Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, "Manivannan
 Sadhasivam" <mani@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, Neil Armstrong
	<neil.armstrong@linaro.org>
CC: <linux-aspeed@lists.ozlabs.org>, <linux-pci@vger.kernel.org>,
	<linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Andrew Jeffery <andrew@aj.id.au>, <openbmc@lists.ozlabs.org>,
	<linux-gpio@vger.kernel.org>, Jacky Chou <jacky_chou@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765849800; l=5476;
 i=jacky_chou@aspeedtech.com; s=20251031; h=from:subject:message-id;
 bh=3evHXYYlI16QeUUt+k5HTmmb35jffMvovX+cLj/1A00=;
 b=8Nx+YnWR3oUE5luURwmqlm82Tuj7tQtDoFzP8aQLpvBg10FBOzAWSxLYJp0K9IsDqt9uj2ZWj
 vnnf90B5ctvDAXJHt9Sw7GIA1QnTXF1bgoZPTmbxehH0brGYdqsnHhz
X-Developer-Key: i=jacky_chou@aspeedtech.com; a=ed25519;
 pk=8XBx7KFM1drEsfCXTH9QC2lbMlGU4XwJTA6Jt9Mabdo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_175018_290537_6D7B1841 
X-CRM114-Status: GOOD (  12.63  )
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

ASPEED AST2600 provides one PCIe RC for Gen2 and AST2700 provides three
PCIe RC for two Gen4 and one Gen2. All of these RCs have just one root
port to connect to PCIe device. And also have Mem, I/O access, legacy
interrupt and MSI.

Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
---
 .../bindings/pci/aspeed,ast2600-pcie.yaml          | 182 +++++++++++++++++++++
 1 file changed, 182 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/aspeed,ast2600-pcie.yaml b/Documentation/devicetree/bindings/pci/aspeed,ast2600-pcie.yaml
new file mode 100644
index 000000000000..d9478249418a
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/aspeed,ast2600-pcie.yaml
@@ -0,0 +1,182 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pci/aspeed,ast2600-pcie.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ASPEED PCIe Root Complex Controller
+
+maintainers:
+  - Jacky Chou <jacky_chou@aspeedtech.com>
+
+description:
+  The ASPEED PCIe Root Complex controller provides PCI Express Root Complex
+  functionality for ASPEED SoCs, such as the AST2600 and AST2700.
+  This controller enables connectivity to PCIe endpoint devices, supporting
+  memory and I/O windows, MSI and INTx interrupts, and integration with
+  the SoC's clock, reset, and pinctrl subsystems. On AST2600, the PCIe Root
+  Port device number is always 8.
+
+properties:
+  compatible:
+    enum:
+      - aspeed,ast2600-pcie
+      - aspeed,ast2700-pcie
+
+  reg:
+    maxItems: 1
+
+  ranges:
+    minItems: 2
+    maxItems: 2
+
+  interrupts:
+    maxItems: 1
+    description: INTx and MSI interrupt
+
+  resets:
+    items:
+      - description: PCIe controller reset
+
+  reset-names:
+    items:
+      - const: h2x
+
+  aspeed,ahbc:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the ASPEED AHB Controller (AHBC) syscon node.
+      This reference is used by the PCIe controller to access
+      system-level configuration registers related to the AHB bus.
+      To enable AHB access for the PCIe controller.
+
+  aspeed,pciecfg:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the ASPEED PCIe configuration syscon node.
+      This reference allows the PCIe controller to access
+      SoC-specific PCIe configuration registers. There are the others
+      functions such PCIe RC and PCIe EP will use this common register
+      to configure the SoC interfaces.
+
+  interrupt-controller: true
+
+patternProperties:
+  "^pcie@[0-9a-f]+,0$":
+    type: object
+    $ref: /schemas/pci/pci-pci-bridge.yaml#
+
+    properties:
+      reg:
+        maxItems: 1
+
+      resets:
+        items:
+          - description: PERST# signal
+
+      reset-names:
+        items:
+          - const: perst
+
+      clocks:
+        maxItems: 1
+
+      phys:
+        maxItems: 1
+
+    required:
+      - resets
+      - reset-names
+      - clocks
+      - phys
+      - ranges
+
+    unevaluatedProperties: false
+
+allOf:
+  - $ref: /schemas/pci/pci-host-bridge.yaml#
+  - $ref: /schemas/interrupt-controller/msi-controller.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: aspeed,ast2600-pcie
+    then:
+      required:
+        - aspeed,ahbc
+    else:
+      properties:
+        aspeed,ahbc: false
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: aspeed,ast2700-pcie
+    then:
+      required:
+        - aspeed,pciecfg
+    else:
+      properties:
+        aspeed,pciecfg: false
+
+required:
+  - reg
+  - interrupts
+  - bus-range
+  - ranges
+  - resets
+  - reset-names
+  - msi-controller
+  - interrupt-controller
+  - interrupt-map-mask
+  - interrupt-map
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/ast2600-clock.h>
+
+    pcie0: pcie@1e770000 {
+      compatible = "aspeed,ast2600-pcie";
+      device_type = "pci";
+      reg = <0x1e770000 0x100>;
+      #address-cells = <3>;
+      #size-cells = <2>;
+      interrupts = <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>;
+      bus-range = <0x00 0xff>;
+
+      ranges = <0x01000000 0x0 0x00018000 0x00018000 0x0 0x00008000
+                0x02000000 0x0 0x60000000 0x60000000 0x0 0x20000000>;
+
+      resets = <&syscon ASPEED_RESET_H2X>;
+      reset-names = "h2x";
+
+      #interrupt-cells = <1>;
+      msi-controller;
+
+      aspeed,ahbc = <&ahbc>;
+
+      interrupt-controller;
+      interrupt-map-mask = <0 0 0 7>;
+      interrupt-map = <0 0 0 1 &pcie0 0>,
+                      <0 0 0 2 &pcie0 1>,
+                      <0 0 0 3 &pcie0 2>,
+                      <0 0 0 4 &pcie0 3>;
+
+      pcie@8,0 {
+        compatible = "pciclass,0604";
+        reg = <0x00004000 0 0 0 0>;
+        #address-cells = <3>;
+        #size-cells = <2>;
+        device_type = "pci";
+        resets = <&syscon ASPEED_RESET_PCIE_RC_O>;
+        reset-names = "perst";
+        clocks = <&syscon ASPEED_CLK_GATE_BCLK>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&pinctrl_pcierc1_default>;
+        phys = <&pcie_phy1>;
+        ranges;
+      };
+    };

-- 
2.34.1


