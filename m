Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4756CCC6B24
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 07:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CnnJd+dlET+eoZtbsw+uqPIRNpAgMCODbb9/Gk0peE0=; b=ntKsf/khsPT7Ya/+PZyXoGygCd
	b15w5hq1LGs1cba2/YtoQNJirss3Zbg2/8zz3mm3GHs1W2ln6h/H2/GRZXVnZ3lzPqpTnDZ8IvSne
	iD8yoRPIwCgoahkbyHGCqLSyuldZRQmJ4dxaTV33s6v99eBxvV19V0W7F+joe9eCsh+C28esghadr
	KrB/s4z2WdS+u+OJsMnIr1BhcQNIar74Qa4H4XRc3yw0h3vQdmm7uFG6ADVJFmQpgABdc3F7l3GVb
	1b0+D8GX5e0FBSSoMQ6U67J4NEdLiJaGgcAaclp7O/yxBT5Jymu8+NdLsH44LCwV+XdtQ5YoliSR6
	bnfvIWuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGtKF-0000000EjCt-0Vfz;
	Wed, 14 Oct 2026 07:22:59 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGtKB-0000000Ej9u-2zPA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 07:22:57 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-48af4d4e61fso2666834f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 00:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791962574; x=1792567374; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CnnJd+dlET+eoZtbsw+uqPIRNpAgMCODbb9/Gk0peE0=;
        b=ohmTwoAcJRb+MtQRkohiKs0XouIHvAp6PS4jhwZhuOcRMJYGTg/u5hzySxEn7HRZF3
         zs7C9DEZUn85+dldj6zfnU24bCwlSsSA0oPlcFapdoIToPuao08cjCUUNg451y+2d0pZ
         TPVvia55NGB4jMHtKpiOHm64Jm5HemA5zULRklaXENae4ZveYngpG7TNdAaHSc8BrdEW
         XibrEhg/ZOTQGr5L0Xt7Vk5D3tlGhV9zEtKjgJoyA2YzyhVOHE4rU5FSA7bb3hJ+UWRq
         WF3nA3AJH9GpbAFRNEVgi8udhMMBVnCpIfWFNZbHHoeWuxm0jXea9c7G4O5wiMRkWNks
         O+Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791962574; x=1792567374;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CnnJd+dlET+eoZtbsw+uqPIRNpAgMCODbb9/Gk0peE0=;
        b=QXWMZ+O1o7R6ESbllEQzb8nJw2ArFC5pstkYXNjrbiPtmqpye5DakOA5XJQdwQJLaU
         pXULT2sCuJvqnz4uv9jnfekxaacgFQL7/QihZEezNLl69wWsnssOn91YVpR0C+KKw4KR
         teRkBrw5jcexEf9J/4CS0AYRG+ylI4kygbclaIxRLzKbqhWXrl+Q3PrqsWdPlNB69ZyS
         1oNPsOUKYFU+hpSlcM6oIRO2H5os/0uFRr/BND8Js3mld1ljeh14njIqMccG4MXRs+Hd
         XoHGj3TRhO5L+IhX5bTXCDvIBxfC0q3jFHIzieJnw5OYrByutJs1dj/kEWMn+vGN/1i5
         yHFQ==
X-Gm-Message-State: AFq9FYKmTbKwQsxrDWCApUoMncnXiSnfhcAYmXJLEJZhSwVb6kcccma5
	PHyUktT3oCMb9lBkiUIvnrg2dFUDZtCS7n01n89jP7efXKrQxssefWnmufqhCBuk5Z/Etw==
X-Gm-Gg: AYBFou0oVOtr+Yxq4KNSYLA4yp5a+0TISfsat8jkJpuLb8HknSGcHxN0BSsMxDDcao6
	+dUxb3uyO8atqy6ph42euaEevEHsBocXkJD2yOAGZG1woiVwdw2PzIooQFt1dVm/Nn/IjcSIWY1
	vP2LoP3eX0voF5TaQizsK/LxAYiKRpkHOY7WV4nrDm3rsZA1G+Xe+xLXarK6G6PzeU5A9cuiwuz
	8g1MpmiTmCrKnHnVyLEMTG2edBR00c8JXXdWB5sdbnXJpX3ETnJ+VleyyCpf22AbrknxDMNn0Dz
	9rwNFaiLqq6T7Y2I8cSkOhZcpjUQpH7AZDazv30yTjxtRE3HJ00mxAn76XCrBixNSr2cc5Hr3r9
	2nLNNJ3zDpWA+08V4YSz2T8skn4mvZMHZSrK3ajiNR78hEP/xjRxWUzreYqlSIdC9LCzgpfaDhx
	Vx/d6+VSDLcCd1/7Pez6Yo4s3+iiZLwo93AiZwirdd9hUwFebdFGJQAPXiAvTro6wEcnVJpiFFK
	PNOeg0DTEDlbnPLorwJzT63+rBSyjce1OkaWly9UNtyUfxVQy46u1up40WAqT9/HVlDxC5Je9Vh
	sHG+4gHDc7M8p3N27Kfag2a/nyuqo/M/hJO1lRRDrIycJxQyyLq4hGYfqhQALQ==
X-Received: by 2002:adf:f184:0:b0:48a:f5de:2ad1 with SMTP id ffacd0b85a97d-48dbad2acb9mr21245583f8f.42.1791962573812;
        Wed, 14 Oct 2026 00:22:53 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de3f7f8b8sm8500933f8f.35.2026.10.14.00.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 00:22:53 -0700 (PDT)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: arnd@arndb.de,
	stefandoesinger@gmail.com,
	krzk@kernel.org,
	Navid Ghahremani <ghahramani.navid@gmail.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 04/24] dt-bindings: clock: Add ZTE ZX279128S CRM clock bindings
Date: Wed, 14 Oct 2026 08:20:44 +0100
Message-ID: <20261014072109.1759502-5-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_002255_809357_19A3147B 
X-CRM114-Status: GOOD (  16.46  )
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

Add Device Tree binding schemas for the ZTE ZX279128S clock controllers:
topcrm, lspcrpm, and crm2. Define fixed clock lists and simple-mfd
for child nodes inside topcrm.

Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
---
 .../bindings/clock/zte,zx279128s-crm2.yaml    |  48 +++++++++
 .../bindings/clock/zte,zx279128s-lspcrpm.yaml | 101 ++++++++++++++++++
 .../bindings/clock/zte,zx279128s-topcrm.yaml  |  86 +++++++++++++++
 include/dt-bindings/clock/zte,zx279128s-crm.h |  51 +++++++++
 4 files changed, 286 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/zte,zx279128s-crm2.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/zte,zx279128s-lspcrpm.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/zte,zx279128s-topcrm.yaml
 create mode 100644 include/dt-bindings/clock/zte,zx279128s-crm.h

diff --git a/Documentation/devicetree/bindings/clock/zte,zx279128s-crm2.yaml b/Documentation/devicetree/bindings/clock/zte,zx279128s-crm2.yaml
new file mode 100644
index 0000000000..aa90ad15d1
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/zte,zx279128s-crm2.yaml
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/zte,zx279128s-crm2.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ZTE ZX279128S CRM2 clock and reset controller
+
+maintainers:
+  - Navid Ghahremani <ghahramani.navid@gmail.com>
+
+description:
+  Top CRM 2 (clock and reset module 2) provides clocks and resets for
+  PCIe controllers on the ZTE ZX279128S SoC.
+
+properties:
+  compatible:
+    oneOf:
+      - const: zte,zx279128s-crm2
+      - items:
+          - const: zte,zx279128s-crm2
+          - const: syscon
+
+  reg:
+    maxItems: 1
+
+  "#clock-cells":
+    const: 1
+
+  "#reset-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - "#clock-cells"
+  - "#reset-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    clock-controller@94100000 {
+        compatible = "zte,zx279128s-crm2";
+        reg = <0x94100000 0x1000>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+    };
diff --git a/Documentation/devicetree/bindings/clock/zte,zx279128s-lspcrpm.yaml b/Documentation/devicetree/bindings/clock/zte,zx279128s-lspcrpm.yaml
new file mode 100644
index 0000000000..3448829a69
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/zte,zx279128s-lspcrpm.yaml
@@ -0,0 +1,101 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/zte,zx279128s-lspcrpm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ZTE ZX279128S Low Speed Peripheral Clock Modules
+
+maintainers:
+  - Stefan Dösinger <stefandoesinger@gmail.com>
+  - Navid Ghahremani <ghahramani.navid@gmail.com>
+
+description: |
+  Each of the two groups of low speed peripherals (LSP) has a peripheral clock
+  module (LSP CRPM) of its own, fed by the top CRM.
+
+properties:
+  compatible:
+    enum:
+      - zte,zx279128s-lsp0crpm
+      - zte,zx279128s-lsp1crpm
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    minItems: 4
+    maxItems: 5
+
+  clock-names:
+    minItems: 4
+    maxItems: 5
+
+  '#clock-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - '#clock-cells'
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: zte,zx279128s-lsp0crpm
+    then:
+      properties:
+        clocks:
+          items:
+            - description: register (APB) clock of the group
+            - description: 25 MHz work clock
+            - description: 32.768 kHz work clock
+            - description: 100 MHz work clock
+        clock-names:
+          items:
+            - const: pclk
+            - const: wclk25m
+            - const: wclk32k
+            - const: wclk100m
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: zte,zx279128s-lsp1crpm
+    then:
+      properties:
+        clocks:
+          items:
+            - description: register (APB) clock of the group
+            - description: AXI clock of the group
+            - description: 25 MHz work clock
+            - description: 49.152 MHz work clock
+            - description: 100 MHz work clock
+        clock-names:
+          items:
+            - const: pclk
+            - const: aclk
+            - const: wclk25m
+            - const: wclk49m
+            - const: wclk100m
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/zte,zx279128s-crm.h>
+
+    clock-controller@94400000 {
+        compatible = "zte,zx279128s-lsp0crpm";
+        reg = <0x94400000 0x1000>;
+        clocks = <&topcrm ZX279128S_TOP_LSP0_PCLK>,
+                 <&topcrm ZX279128S_TOP_LSP0_25M>,
+                 <&topcrm ZX279128S_TOP_LSP0_32K>,
+                 <&topcrm ZX279128S_TOP_LSP0_100M>;
+        clock-names = "pclk", "wclk25m", "wclk32k", "wclk100m";
+        #clock-cells = <1>;
+    };
diff --git a/Documentation/devicetree/bindings/clock/zte,zx279128s-topcrm.yaml b/Documentation/devicetree/bindings/clock/zte,zx279128s-topcrm.yaml
new file mode 100644
index 0000000000..9466661929
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/zte,zx279128s-topcrm.yaml
@@ -0,0 +1,86 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/zte,zx279128s-topcrm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ZTE ZX279128S Top Clock and Reset Module
+
+maintainers:
+  - Stefan Dösinger <stefandoesinger@gmail.com>
+  - Navid Ghahremani <ghahramani.navid@gmail.com>
+
+description: |
+  The top clock and reset module (CRM) of the ZTE ZX279128S holds the PLLs,
+  bus clocks, peripheral clocks and the reset controller.
+
+properties:
+  compatible:
+    items:
+      - const: zte,zx279128s-topcrm
+      - const: syscon
+      - const: simple-mfd
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: 25 MHz crystal oscillator
+
+  clock-names:
+    items:
+      - const: osc
+
+  '#clock-cells':
+    const: 1
+
+  '#reset-cells':
+    const: 1
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+  reboot:
+    type: object
+    $ref: /schemas/power/reset/syscon-reboot.yaml#
+    description: System reboot controller child node
+
+patternProperties:
+  "^phy@[01]$":
+    type: object
+    description: PCIe PHY child nodes
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - '#clock-cells'
+  - '#reset-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/zte,zx279128s-crm.h>
+    #include <dt-bindings/reset/zte,zx279128s-reset.h>
+
+    topcrm: clock-controller@94000000 {
+        compatible = "zte,zx279128s-topcrm", "syscon", "simple-mfd";
+        reg = <0x94000000 0x1000>;
+        clocks = <&osc>;
+        clock-names = "osc";
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+
+        reboot {
+            compatible = "syscon-reboot";
+            offset = <0x44>;
+            mask = <0x1>;
+            value = <0x1>;
+        };
+    };
diff --git a/include/dt-bindings/clock/zte,zx279128s-crm.h b/include/dt-bindings/clock/zte,zx279128s-crm.h
new file mode 100644
index 0000000000..dadb2cd007
--- /dev/null
+++ b/include/dt-bindings/clock/zte,zx279128s-crm.h
@@ -0,0 +1,51 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (C) 2026 Navid Ghahremani <ghahramani.navid@gmail.com>
+ */
+
+#ifndef _DT_BINDINGS_CLOCK_ZTE_ZX279128S_CRM_H
+#define _DT_BINDINGS_CLOCK_ZTE_ZX279128S_CRM_H
+
+/* Top CRM */
+#define ZX279128S_TOP_PLL_A9		0
+#define ZX279128S_TOP_PLL_LSP		1
+#define ZX279128S_TOP_CPU		2
+#define ZX279128S_TOP_A9_PERIPH		3
+#define ZX279128S_TOP_MATRIX_ACLK	4
+#define ZX279128S_TOP_MATRIX_HCLK	5
+#define ZX279128S_TOP_MATRIX_PCLK	6
+#define ZX279128S_TOP_LSP0_PCLK		7
+#define ZX279128S_TOP_LSP0_25M		8
+#define ZX279128S_TOP_LSP0_32K		9
+#define ZX279128S_TOP_LSP0_100M		10
+#define ZX279128S_TOP_LSP1_PCLK		11
+#define ZX279128S_TOP_LSP1_ACLK		12
+#define ZX279128S_TOP_LSP1_25M		13
+#define ZX279128S_TOP_LSP1_49M		14
+#define ZX279128S_TOP_LSP1_100M		15
+#define ZX279128S_TOP_IRAM_ACLK		16
+#define ZX279128S_TOP_IROM_ACLK		17
+#define ZX279128S_TOP_SYS_CTRL_PCLK	18
+#define ZX279128S_TOP_USB_ACLK		19
+#define ZX279128S_TOP_USB_SUSPEND	20
+#define ZX279128S_TOP_USB_REF		21
+
+
+/* Low speed peripherals 0 */
+#define ZX279128S_LSP0_UART0_WCLK	0
+#define ZX279128S_LSP0_UART0_PCLK	1
+#define ZX279128S_LSP0_UART1_WCLK	2
+#define ZX279128S_LSP0_UART1_PCLK	3
+#define ZX279128S_LSP0_SPI_WCLK		4
+#define ZX279128S_LSP0_SPI_PCLK		5
+#define ZX279128S_LSP0_GPIO_PCLK	6
+
+/* Low speed peripherals 1 */
+#define ZX279128S_LSP1_MDIO_WCLK	0
+#define ZX279128S_LSP1_MDIO_PCLK	1
+
+/* Top CRM 2 */
+#define ZX279128S_CRM2_PCIE0_CLK	0
+#define ZX279128S_CRM2_PCIE1_CLK	1
+
+#endif
-- 
2.55.0


