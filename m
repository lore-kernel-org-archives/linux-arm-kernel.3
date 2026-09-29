Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3898ECA5FB2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 06:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e0VGD3X/peauhNb/icV3qvhJKQ5zgJQNYDC9a4QoeC8=; b=I5DuYBykBdIfAUhdjy135qyT3J
	Pfa3+WBQ6tFkSoECcfFTvh9rN7Mmp537xCjy0o2oSNfMLhew+l0UIXyTdTd02y8UUBoXytCnbdMmu
	oNXcOCPlMXqqEw8JBaITEfKk7M84whugG6jeeo1TV3okOXpgliH+a5BEo3eqLd/jgAuXQ+2PfF+Mq
	mqBldtY7yNqLBdCzOoc8IvB0OO+uqji54isKhOlbU72JorqAwFEOMq+5jdw/Iel63fQis9iwogm9n
	by3v7YDCONcuZQB0kAMSFgOvlzg7kMRnLrIoBky/X199VLAP1+2p8j+QRRIlqS46pxfnXfzv/hiQo
	WXcEotlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBRSF-00000002Tzj-2jxh;
	Tue, 29 Sep 2026 06:36:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBRRl-00000002Tja-3kBP;
	Tue, 29 Sep 2026 06:36:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A1D97444EE;
	Tue, 29 Sep 2026 06:36:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FCD41F0089A;
	Tue, 29 Sep 2026 06:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790663773;
	bh=e0VGD3X/peauhNb/icV3qvhJKQ5zgJQNYDC9a4QoeC8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Bs1APU3NscaEec/mANEaayJt9GkGjMdfrdY4NxI7xRCp5WHO7c6pr2zPQCj2LudvV
	 Zta283jpfO/hZY9skQmm9I8nf5f1IXgzm84GdKSYjrxV+ahXqSHvuBkH/7zhjXfPZ1
	 G51Ty//cxojqV+BSaQtJR49mL8Qd9fpt9ll5rZqSoJ/oLRmhYCrm379p0KEUbjB1Z/
	 FsN11tTXJTepR0A333KtbK/DqflQuyQbvJ5nvnAejKdd4SB8qlnIUxxBT6gmhk/7FQ
	 J0C238fPG+l5mwM58iK0CdInfftCvTZlSobilennqjgJLW2vgQCu8VNsZR5gwAnFEM
	 d7bhWTtDBWxjA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Lee Jones <lee@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-i3c@lists.infradead.org,
	mfd@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 17/20] dt-bindings: mfd: Add Synaptics SL261x global block binding
Date: Tue, 29 Sep 2026 14:14:14 +0800
Message-ID: <20260929061417.20733-18-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260929061417.20733-1-jszhang@kernel.org>
References: <20260929061417.20733-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Document the AVIO global, CPU wrapper, chip control, and MCU global
register blocks on SL261x SoCs. Each block exposes its clock and, where
applicable, pinctrl and reset functions through child nodes.

Document the chip control syscon phandle used by the CPU clock
controller.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 .../bindings/mfd/syna,sl261x-gbl.yaml         | 208 ++++++++++++++++++
 1 file changed, 208 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/syna,sl261x-gbl.yaml

diff --git a/Documentation/devicetree/bindings/mfd/syna,sl261x-gbl.yaml b/Documentation/devicetree/bindings/mfd/syna,sl261x-gbl.yaml
new file mode 100644
index 000000000000..3e5842169c4a
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/syna,sl261x-gbl.yaml
@@ -0,0 +1,208 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/syna,sl261x-gbl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Synaptics SL261x global and control register blocks
+
+maintainers:
+  - Jisheng Zhang <jszhang@kernel.org>
+
+description: |
+  The SL261x global and control register blocks contain clock, reset, and
+  pin control registers. Each functional child uses its parent's register
+  range. The CPU clock controller also refers to the chip control syscon.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - const: syna,sl261x-avio-gbl
+          - const: syscon
+          - const: simple-mfd
+      - items:
+          - const: syna,sl261x-cpu-wrp
+          - const: syscon
+          - const: simple-mfd
+      - items:
+          - const: syna,sl261x-chip-control
+          - const: syscon
+          - const: simple-mfd
+      - items:
+          - const: syna,sl261x-mcu-gbl
+          - const: syscon
+          - const: simple-mfd
+
+  reg:
+    maxItems: 1
+
+  clock:
+    type: object
+    additionalProperties: true
+
+  pin-controller:
+    type: object
+    additionalProperties: true
+
+  reset:
+    type: object
+    additionalProperties: true
+
+required:
+  - compatible
+  - reg
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: syna,sl261x-avio-gbl
+    then:
+      required:
+        - clock
+      properties:
+        clock:
+          properties:
+            compatible:
+              const: syna,sl261x-aio-clk
+        pin-controller: false
+        reset: false
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: syna,sl261x-cpu-wrp
+    then:
+      required:
+        - clock
+      properties:
+        clock:
+          properties:
+            compatible:
+              const: syna,sl261x-cpu-clk
+        pin-controller: false
+        reset: false
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: syna,sl261x-chip-control
+    then:
+      required:
+        - clock
+        - pin-controller
+        - reset
+      properties:
+        clock:
+          properties:
+            compatible:
+              const: syna,sl261x-soc-clk
+        pin-controller:
+          properties:
+            compatible:
+              const: syna,sl261x-soc-pinctrl
+        reset:
+          properties:
+            compatible:
+              const: syna,sl261x-soc-reset
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: syna,sl261x-mcu-gbl
+    then:
+      required:
+        - clock
+        - pin-controller
+        - reset
+      properties:
+        clock:
+          properties:
+            compatible:
+              const: syna,sl261x-system-clk
+        pin-controller:
+          properties:
+            compatible:
+              const: syna,sl261x-system-pinctrl
+        reset:
+          properties:
+            compatible:
+              const: syna,sl261x-system-reset
+
+additionalProperties: false
+
+examples:
+  - |
+    osc: clock-osc {
+        compatible = "fixed-clock";
+        #clock-cells = <0>;
+        clock-frequency = <25000000>;
+    };
+
+    avio_gbl: avio-gbl@f7490000 {
+        compatible = "syna,sl261x-avio-gbl", "syscon", "simple-mfd";
+        reg = <0xf7490000 0x4000>;
+
+        aioclk: clock {
+            compatible = "syna,sl261x-aio-clk";
+            #clock-cells = <1>;
+            clocks = <&osc>;
+        };
+    };
+
+    chip: chip-control@f7e10000 {
+        compatible = "syna,sl261x-chip-control", "syscon", "simple-mfd";
+        reg = <0xf7e10000 0x10000>;
+
+        clk: clock {
+            compatible = "syna,sl261x-soc-clk";
+            #clock-cells = <1>;
+            clocks = <&osc>;
+        };
+
+        pinctrl: pin-controller {
+            compatible = "syna,sl261x-soc-pinctrl";
+        };
+
+        rst: reset {
+            compatible = "syna,sl261x-soc-reset";
+            #reset-cells = <1>;
+        };
+    };
+
+    cpu_wrp: cpu-wrp@f7e30000 {
+        compatible = "syna,sl261x-cpu-wrp", "syscon", "simple-mfd";
+        reg = <0xf7e30000 0x4000>;
+
+        cpuclk: clock {
+            compatible = "syna,sl261x-cpu-clk";
+            #clock-cells = <1>;
+            clocks = <&osc>;
+            syna,gbl-syscon = <&chip>;
+        };
+    };
+
+    mcu_gbl: mcu-gbl@e5025000 {
+        compatible = "syna,sl261x-mcu-gbl", "syscon", "simple-mfd";
+        reg = <0xe5025000 0x1000>;
+
+        sm_clk: clock {
+            compatible = "syna,sl261x-system-clk";
+            #clock-cells = <1>;
+        };
+
+        sm_pinctrl: pin-controller {
+            compatible = "syna,sl261x-system-pinctrl";
+        };
+
+        sm_rst: reset {
+            compatible = "syna,sl261x-system-reset";
+            #reset-cells = <1>;
+        };
+    };
+...
-- 
2.53.0


