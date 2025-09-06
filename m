Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F2B1CA1012
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 15:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DAa5dXT9xE7kshWcRdj1025Ci9ifjgtTEPNx94rNwyU=; b=nkjhzpDMjNoNyLnI5rIUEY8p7j
	xK999gK9NiFMiSvJK8vE76Wzl84ZQD9XKAULCdPCrxOPyTuXQzZatjKHjy99slXbV+3M8orZgcTMF
	xKqeNMT/IASqocWMo7DSbnn3KkFI/uHUpYyRHvKWU5W5aC+DHmUquEkhjbf7kw5V8pcGWopPALXTH
	TrvzyY+OOgyef5jOETXUispNPjU4UPH1HM2A1ayF8mJmeERi/dSkaSgnOKksXORQXrBbtcabVqI3Y
	F/CFehc2tN/jYV7FRW0ldQX3D7ob6iHnu9f4E8Hs9wukdrFhdDsImmSHwwiuK0SgvlgkYPxWJd3xI
	XK8f5aPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuvAS-000000083Tt-0ks9;
	Sat, 06 Sep 2025 15:49:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuv4m-000000081ex-2QkQ;
	Sat, 06 Sep 2025 15:43:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C7245601DF;
	Sat,  6 Sep 2025 15:43:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3E97AC4CEF7;
	Sat,  6 Sep 2025 15:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757173419;
	bh=ijo1hW/xWUy1/m3cbnSQCqYPTm7fk4/pyNoDtB66FEQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qWerm7PvhC+FRMtxnYufAPBQprwLjvFkcA6/A07k70IekDAWpMWyC7IM/AlGvasUh
	 9oxKn6j6RhnY5eqG5QVnDHOSpETO/OicZ/ERbPtKzwabsJNOppU8D3XThFx1w/SN4J
	 3nzhbH4k0Co/835Zbp/FiCBhTx5mUYb9R4Ab9V8JW4hVuLPwDGo5VMIXX2UauQFDQC
	 uNcNjXLHMSYNhiKIdHvJxYqVzWqQu3HaIAYJL1V4ggnZxUfd/wtsBgoqp6ztkD8O1b
	 PWhRdXPRWOVZqZhwNDXUm0zHLLJDp1JxCbVbf5pj4GUg0BobV6t98n9+CIjLpOhBiP
	 w/tI7jM7eKleQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CCB3CA1012;
	Sat,  6 Sep 2025 15:43:39 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Sat, 06 Sep 2025 15:43:14 +0000
Subject: [PATCH v2 01/22] dt-bindings: usb: Add Apple dwc3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250906-atcphy-6-17-v2-1-52c348623ef6@kernel.org>
References: <20250906-atcphy-6-17-v2-0-52c348623ef6@kernel.org>
In-Reply-To: <20250906-atcphy-6-17-v2-0-52c348623ef6@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Frank Li <Frank.Li@nxp.com>, 
 Ran Wang <ran.wang_1@nxp.com>, Peter Chen <peter.chen@nxp.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, 
 Sven Peter <sven@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3085; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=ijo1hW/xWUy1/m3cbnSQCqYPTm7fk4/pyNoDtB66FEQ=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ8aesJlHJ09wPGhpqSoWlrB1t1jvi52zQmV2Nfv98rP6+
 H/SmxfCHaUsDGIcDLJiiizb99ubPnn4RnDppkvvYeawMoEMYeDiFICJXFdk+MN34WbjvRwt82d8
 fXHav37y/0w83TJzZbZV5ouycjOuvlRGhq9W7Y/atPWuu+y72HtviirTtCShvrvRFxZyr9hWPat
 xHQcA
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407
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

Apple Silicon uses Synopsys DesignWare dwc3 based USB controllers for
their Type-C ports.

Signed-off-by: Sven Peter <sven@kernel.org>
---
 .../devicetree/bindings/usb/apple,dwc3.yaml        | 80 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 2 files changed, 81 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/apple,dwc3.yaml b/Documentation/devicetree/bindings/usb/apple,dwc3.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..7c8708143696faf2133c141d2a78abd3b5813979
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/apple,dwc3.yaml
@@ -0,0 +1,80 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/apple,dwc3.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Apple Silicon DWC3 USB controller
+
+maintainers:
+  - Sven Peter <sven@kernel.org>
+
+description:
+  Apple Silicon SoCs use a Synopsys DesignWare DWC3 based controller for each of
+  their Type-C ports.
+
+allOf:
+  - $ref: snps,dwc3-common.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - apple,t6000-dwc3
+              - apple,t6020-dwc3
+              - apple,t8112-dwc3
+          - const: apple,t8103-dwc3
+      - const: apple,t8103-dwc3
+
+  reg:
+    items:
+      - description: Core DWC3 region
+      - description: Apple-specific DWC3 region
+
+  reg-names:
+    items:
+      - const: dwc3-core
+      - const: dwc3-apple
+
+  interrupts:
+    maxItems: 1
+
+  iommus:
+    maxItems: 2
+
+  resets:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - iommus
+  - resets
+  - power-domains
+  - usb-role-switch
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/apple-aic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    usb@82280000 {
+      compatible = "apple,t8103-dwc3";
+      reg = <0x82280000 0xce00>, <0x8228cd00 0x3200>;
+      reg-names = "dwc3-core", "dwc3-apple";
+      interrupts = <AIC_IRQ 777 IRQ_TYPE_LEVEL_HIGH>;
+      iommus = <&dwc3_0_dart_0 0>, <&dwc3_0_dart_1 1>;
+
+      power-domains = <&ps_atc0_usb>;
+      resets = <&atcphy0>;
+
+      usb-role-switch;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index fe168477caa45799dfe07de2f54de6d6a1ce0615..0e085cb0762f765958d67be61ae0d3d773503431 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2399,6 +2399,7 @@ F:	Documentation/devicetree/bindings/power/reset/apple,smc-reboot.yaml
 F:	Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml
 F:	Documentation/devicetree/bindings/spi/apple,spi.yaml
 F:	Documentation/devicetree/bindings/spmi/apple,spmi.yaml
+F:	Documentation/devicetree/bindings/usb/apple,dwc3.yaml
 F:	Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
 F:	arch/arm64/boot/dts/apple/
 F:	drivers/bluetooth/hci_bcm4377.c

-- 
2.34.1



