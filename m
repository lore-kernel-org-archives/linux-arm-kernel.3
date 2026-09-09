Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE121C79FB7
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 21:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Eh26+fMTBRHost86hhgYFkXWy1BCjqv4Lpa79eE87Vg=; b=PrxKAWb7X8aH642FPS0KM8gud/
	gr6eHAwwn8fjLTkv2XN8LBgtiAazZ8sRUgOmwL9UC56hLLITlaneJBPgSmV+ZVCXQ6NqxYszv+HGE
	qkeOYRNVAqdmVhZ9VjdnTwzUXwAv/wLBtr8hkOE7xUiOMda6E5b9V7FtSypG1L/g3Fz0AmGFootWl
	IwpDcV/ynWvq53ZpgVN/RWA7l4/f7CSEKYYB7/N23KRJCk0SVg3JmLk9O1V1aq5hLLIccnDhdY1Zk
	MFKiBYOPISQLpXmNH7IYKGm5vPsUggDsOXjmv72V6mOni0BILKsB4zSdQsYSow+eVBR3hvbywMMsH
	STWNc3rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Pm9-0000000CsbJ-0gxj;
	Wed, 09 Sep 2026 21:24:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Pm8-0000000CsbA-2SsI;
	Wed, 09 Sep 2026 21:24:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Eh26+fMTBRHost86hhgYFkXWy1BCjqv4Lpa79eE87Vg=; b=m1UJIoDKbdtYOsbGG7rSiNcaVf
	KKxgraIGUSxPtEI++u22OprthZSkej9Nio31huUrCS+9LBXCEBsFKtg6HGxZBuQOKsXxJIU7RAfVJ
	XSLUnPMb+yBL8sgve6GSN8Eyouhly3bm/4of/4cHDnE/fSo7tcjcnzZk1kSEVhooAI2MhpZD3Njjd
	IfLYgghfFHM/+n0GxRByC7ms/HYu3woNVqu1tMIUvCMROOm7v0Xa6klDa+2M7xuGvkW7CJSyFsbtQ
	LNMMGG5ABZPe8txWmig+EZ4t3ROvlzxxYFQvVkn68kV686Vc1xGG7pdqpKgUXvv2RcyDBJnThWgIU
	xMg+u7pw==;
Received: from mail.cjdns.fr ([5.135.140.105])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4Pkh-00000001hBm-13G8;
	Wed, 09 Sep 2026 21:24:06 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EB19740935D;
	Wed,  9 Sep 2026 23:22:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1788988940; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=Eh26+fMTBRHost86hhgYFkXWy1BCjqv4Lpa79eE87Vg=;
	b=WexsMZQLNOm5xpeKwK54w03P0PEIFh/hCTjPusUrn07KG0NvYkQLi0LHusZPpzmgOz4sRX
	7Ua5+xTBmTqCfHI6bnrYnEiVOuh8bCPfkAJMwd4tOfPb0Di7fTUBwmvGOAYdgrWHO+ec+M
	aaGmK+xPoq2WVR/x3YYBAgiKsDFDmXDkeF06lLxvVPRRnFH6S4YML0a524SE+Trjdg5Vqe
	1d88WLkwpFvnVEPgJV2Zm7YIlMQioqO2juPABeF/Sp2a3rNg0MugP+mfayWzK69tTjfOPm
	0NiFYmi3ETasiUiiwgmOKN4XWqttTXtsAfQ/+hK7JtBeR412Y7P5up4OsBUnXw==
From: Caleb James DeLisle <cjd@cjdns.fr>
To: netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	vadim.fedorenko@linux.dev,
	maxime.chevallier@bootlin.com,
	dong100@mucse.com,
	wangruikang@iscas.ac.cn,
	25181214217@stu.xidian.edu.cn,
	hkallweit1@gmail.com,
	han.junyang@zte.com.cn,
	xuanzhuo@linux.alibaba.com,
	enelsonmoore@gmail.com,
	jes@trained-monkey.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	naseefkm@gmail.com,
	b.larsson@gmx.com,
	Caleb James DeLisle <cjd@cjdns.fr>
Subject: [PATCH net-next 1/2] dt-bindings: net: econet: add EN751221 ethernet
Date: Wed,  9 Sep 2026 21:21:45 +0000
Message-Id: <20260909212146.3184077-2-cjd@cjdns.fr>
In-Reply-To: <20260909212146.3184077-1-cjd@cjdns.fr>
References: <20260909212146.3184077-1-cjd@cjdns.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_222317_711365_F9452EC7 
X-CRM114-Status: GOOD (  15.19  )
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

The EN751221 ethernet controller is somewhat similar to the
airoha,en7581-eth but it has a different register layout and different
capabilities of the QDMA engines.

The engine is roughly made up of two "QDMA" modules (which provide QoS
and also DMA), two GDM modules which service the two ports, a PPE
(packet processing engine) similar to that in mediatek,net, and an
overall "frame engine" which coordinates the components.

The QDMA modules provide both communication with the CPU and QoS
prioritized forwarding. For example GDM0 -> QDMA0 -> GDM1 forwarding
path is possible.

Add DT documentation for the EN751221 ethernet system.

Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
---
 .../bindings/net/econet,en751221-eth.yaml     | 127 ++++++++++++++++++
 MAINTAINERS                                   |   6 +
 2 files changed, 133 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/econet,en751221-eth.yaml

diff --git a/Documentation/devicetree/bindings/net/econet,en751221-eth.yaml b/Documentation/devicetree/bindings/net/econet,en751221-eth.yaml
new file mode 100644
index 000000000000..5d953eaa16e5
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/econet,en751221-eth.yaml
@@ -0,0 +1,127 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/econet,en751221-eth.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: EcoNet EN751221 Frame Engine Ethernet controller
+
+maintainers:
+  - Caleb James DeLisle <cjd@cjdns.fr>
+
+description:
+  The frame engine ethernet controller can be found on EcoNet chips
+  based on the EN751221 SoC.
+
+properties:
+  compatible:
+    enum:
+      - econet,en751221-eth
+      - econet,en7528-eth
+
+  reg:
+    items:
+      - description: Ethernet device
+
+  interrupts:
+    items:
+      - description: QDMA0 IRQ
+      - description: QDMA1 IRQ
+
+  resets:
+    items:
+      - description: Frame engine
+      - description: QDMA0
+      - description: QDMA1
+      - description: xPON MAC
+      - description: xPON PHY
+
+  reset-names:
+    items:
+      - const: fe
+      - const: qdma0
+      - const: qdma1
+      - const: xpon-mac
+      - const: xpon-phy
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^mac@[0-1]$":
+    type: object
+    unevaluatedProperties: false
+    $ref: ethernet-controller.yaml#
+    description:
+      Ethernet GMAC port associated to the MAC controller
+    properties:
+      compatible:
+        const: econet,eth-mac
+
+      reg:
+        items:
+          - description: GMAC port number
+
+    required:
+      - reg
+      - compatible
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - resets
+  - reset-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/reset/econet,en751221-scu.h>
+
+    soc {
+      #address-cells = <1>;
+      #size-cells = <1>;
+
+      ethernet: ethernet@1fb50000 {
+        compatible = "econet,en751221-eth";
+        reg = <0x1fb50000 0x8000>;
+
+        resets = <&scuclk EN751221_FE_RST>,
+          <&scuclk EN751221_FE_QDMA1_RST>,
+          <&scuclk EN751221_FE_QDMA2_RST>,
+          <&scuclk EN751221_XPON_MAC_RST>,
+          <&scuclk EN751221_XPON_PHY_RST>;
+        reset-names = "fe", "qdma0", "qdma1",
+                "xpon-mac", "xpon-phy";
+
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        interrupt-parent = <&intc>;
+        interrupts = <21>, <22>;
+
+        gmac0: mac@0 {
+          compatible = "econet,eth-mac";
+          reg = <0>;
+          phy-mode = "trgmii";
+          status = "disabled";
+
+          fixed-link {
+            speed = <1000>;
+            full-duplex;
+            pause;
+          };
+        };
+
+        gmac1: mac@1 {
+          compatible = "econet,eth-mac";
+          reg = <1>;
+          status = "disabled";
+          phy-mode = "rgmii-rxid";
+        };
+      };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index b23fb6f2f4ef..7417ca4ccc79 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9330,6 +9330,12 @@ F:	drivers/irqchip/irq-econet-en751221.c
 F:	include/dt-bindings/clock/econet,en751221-scu.h
 F:	include/dt-bindings/reset/econet,en751221-scu.h
 
+ECONET ETHERNET DRIVER
+M:	Caleb James DeLisle <cjd@cjdns.fr>
+L:	netdev@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/net/econet,en751221-eth.yaml
+
 ECONET PCIE PHY DRIVER
 M:	Caleb James DeLisle <cjd@cjdns.fr>
 L:	linux-mips@vger.kernel.org
-- 
2.39.5


