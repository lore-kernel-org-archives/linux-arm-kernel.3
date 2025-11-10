Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D0C5CCFA1E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 17:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7sHMOBUaDG1Wui3cyeff4HsBqo1sgWu6v9dYZ/ORpKI=; b=Ly6IwKghD1X0oxjZBfJfNz6vK9
	SyeYzGnau0lGI7gIfE4mxdiFQ8SZK1nO4bdKKH8W1BwPrHzcS81xWcLJvuV2K59Z/aZ5IVmoHjrBY
	YEYBh5Jh/F2LjMaOzXOwCbdaBnMo+WZ2lYIzJg9kdNt+1nRZLIYm+gv3QDP4zkdROcHOdc7NH66nB
	F8ihuAxJSxzRrEPcvYx4WLvSo8LdjbkWb68LkNfloYmIkaHdf+d/Mzd0y/f/9saDJwvo/RNkBw/YL
	goejDrfGm2pan46EDESAznjvtKyLZZEWmOs9ruOWwlo0cJsafpfIZCCssG4uRh1dYMi99Dlv7MyPn
	WyFkKvBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIVlu-00000005uYQ-2PQs;
	Mon, 10 Nov 2025 17:33:42 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIVlr-00000005uWQ-0ZuX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 17:33:40 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4777a9aeedaso14120845e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 09:33:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762796017; x=1763400817; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7sHMOBUaDG1Wui3cyeff4HsBqo1sgWu6v9dYZ/ORpKI=;
        b=BXqJARu5sui8DlkeJPB6fsODJQ/ltT7MOyFh4FiyZ0bDmMqVptilPrR3Jy663bLi7+
         lWb6AfTKcKAm7NdgPrPLIDp9kKg6+JvdIobcWExtAwzfJ8gAxpTJX0CQLpO5lIULBH0P
         +oga9xvqDlv7K09chahZhIOafj48HPn7ohQhboTDx4TuF0u26YGNaVGUeHGMuMz/5rYa
         ipeXnvEV4gxRh+OCxAx9w/y6TTY6Q3jdsqflTHU+KHhVIXn0jkDUOYhH2kFoJSciRNDx
         RK5qq50ZSCyaDEjEj0S4JyWsITf+63QBmiW/I1AldAE9csA3rx+fBULtIjRnHW0X+uK5
         Txnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762796017; x=1763400817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7sHMOBUaDG1Wui3cyeff4HsBqo1sgWu6v9dYZ/ORpKI=;
        b=AD3MlktEpli7ixkL78UB4O350xaSN03hfHmtA8dPc7r1oVqSKar/xBWFv6xErZaMd5
         80DxneuHcpybGmySFtptufEiXfD3CbQ8gAKGhc2gJBy8KoBJMtaSZYsNGZASVJKm6hex
         +2xVqIS3Pac5x2N1wdaQk6G3TGe+6wgo+pWIK9cYs2o/su2MQPGvgheGE1N5CVWBJtCz
         fkysyKhcSnNXxVxsAk+hrT4AqUfFUtc2rLBdcT0ouzlXEK9huF1WHtWX+hYXCwWgwwmN
         Z/oLJ0GpV/MrrboseYwQDYRJH155htFurEvWSUP/LNm0u5ACtuYsSDocPQqMeF9LX6LW
         Wf0g==
X-Forwarded-Encrypted: i=1; AJvYcCVITtdSufwDwOEL8knoev0y20tbbpqwZalo3FjBNbWESzEXZ04GLgwMf6jDA4tndswyOVpbpo6/FkioETdd3KFA@lists.infradead.org
X-Gm-Message-State: AOJu0YzdKyFhCO5+LSufan4jtnyIm6dGzIQOC2Dsj4AffVRGc07QFn/N
	CnpljxxcC+n7kkWPtcsUX0FylnsW6IRfxeNlzUIKM1THzWg8lJKcssJSlsXAbffLhWs=
X-Gm-Gg: ASbGncuA+Co7lP30aPTdiZjAd8Z2DEUGh7CydG7r0CsAWZyQWW+qbBZ+qsSYTJP812Q
	5G30ZRUguMR3AovTzPC7/KrPyX5vJh64pdxKXWz818hFKtbWqinTY0YOhO4ub2Nm28psmzrYVyl
	OlndILFed3C0ltK9JaPnxTPR+HzeXmokzu11tx/bqhBML6dd2qNVd21nrOgH8N/RScF+o5PT3vE
	ANQOJoWJKl3LWuNFlP8f4IsuoLqChTn2f30geBQU9lB5ijb6uLUqepqC6IxWA8wBNa2pYc6Nyui
	gyUIepJ4Hv7EOrEP6l/7QZrPDM8pfG8dTrGAFEmGgbJNVQPFNcc4NMPvBcEtM4XmFXf9SvRTdoM
	9qTE8VLdPZv+mNM8/LxjLoza+sulRQEcQxE/jw0PypjztouYUhby4b7B1DB8u4fd7gK1G8xD2CX
	ZxL3Zayojc
X-Google-Smtp-Source: AGHT+IFFes5RpqIkwRV81cjLZLjmcQ90Ib1gecuHLTiUtJRRieBtbR+NqpbH88IgcfUI1Bw2hVKcTw==
X-Received: by 2002:a05:600c:474c:b0:475:da13:256b with SMTP id 5b1f17b1804b1-4777329777amr79682445e9.38.1762796017253;
        Mon, 10 Nov 2025 09:33:37 -0800 (PST)
Received: from vingu-cube.. ([2a01:e0a:f:6020:d5ec:666a:8d59:87fa])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47774df2d80sm140111375e9.14.2025.11.10.09.33.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 09:33:36 -0800 (PST)
From: Vincent Guittot <vincent.guittot@linaro.org>
To: chester62515@gmail.com,
	mbrugger@suse.com,
	ghennadi.procopciuc@oss.nxp.com,
	s32@nxp.com,
	bhelgaas@google.com,
	jingoohan1@gmail.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Ionut.Vicovan@nxp.com,
	larisa.grigore@nxp.com,
	ciprianmarian.costea@nxp.com,
	bogdan.hamciuc@nxp.com,
	Frank.li@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Cc: cassel@kernel.org
Subject: [PATCH 1/4 v4] dt-bindings: PCI: s32g: Add NXP PCIe controller
Date: Mon, 10 Nov 2025 18:33:31 +0100
Message-ID: <20251110173334.234303-2-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251110173334.234303-1-vincent.guittot@linaro.org>
References: <20251110173334.234303-1-vincent.guittot@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_093339_202624_5094D58E 
X-CRM114-Status: GOOD (  14.32  )
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

Describe the PCIe host controller available on the S32G platforms.

Co-developed-by: Ionut Vicovan <Ionut.Vicovan@nxp.com>
Signed-off-by: Ionut Vicovan <Ionut.Vicovan@nxp.com>
Co-developed-by: Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>
Signed-off-by: Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>
Co-developed-by: Larisa Grigore <larisa.grigore@nxp.com>
Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
Co-developed-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
Signed-off-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
Co-developed-by: Ciprian Marian Costea <ciprianmarian.costea@nxp.com>
Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@nxp.com>
Co-developed-by: Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
Signed-off-by: Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
---
 .../bindings/pci/nxp,s32g-pcie.yaml           | 130 ++++++++++++++++++
 1 file changed, 130 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/nxp,s32g-pcie.yaml

diff --git a/Documentation/devicetree/bindings/pci/nxp,s32g-pcie.yaml b/Documentation/devicetree/bindings/pci/nxp,s32g-pcie.yaml
new file mode 100644
index 000000000000..6077c251c2cd
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/nxp,s32g-pcie.yaml
@@ -0,0 +1,130 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pci/nxp,s32g-pcie.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP S32G2xxx/S32G3xxx PCIe Root Complex controller
+
+maintainers:
+  - Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
+  - Ionut Vicovan <ionut.vicovan@nxp.com>
+
+description:
+  This PCIe controller is based on the Synopsys DesignWare PCIe IP.
+  The S32G SoC family has two PCIe controllers, which can be configured as
+  either Root Complex or Endpoint.
+
+allOf:
+  - $ref: /schemas/pci/snps,dw-pcie.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - nxp,s32g2-pcie
+      - items:
+          - const: nxp,s32g3-pcie
+          - const: nxp,s32g2-pcie
+
+  reg:
+    maxItems: 6
+
+  reg-names:
+    items:
+      - const: dbi
+      - const: dbi2
+      - const: atu
+      - const: dma
+      - const: ctrl
+      - const: config
+
+  interrupts:
+    maxItems: 2
+
+  interrupt-names:
+    items:
+      - const: msi
+      - const: dma
+    minItems: 1
+
+  pcie@0:
+    description:
+      Describe the S32G Root Port.
+    type: object
+    $ref: /schemas/pci/pci-pci-bridge.yaml#
+
+    properties:
+      reg:
+        maxItems: 1
+
+      phys:
+        maxItems: 1
+
+    required:
+      - reg
+      - phys
+
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - interrupt-names
+  - ranges
+  - pcie@0
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/phy/phy.h>
+
+    bus {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        pcie@40400000 {
+            compatible = "nxp,s32g3-pcie",
+                         "nxp,s32g2-pcie";
+            reg = <0x00 0x40400000 0x0 0x00001000>,   /* dbi registers */
+                  <0x00 0x40420000 0x0 0x00001000>,   /* dbi2 registers */
+                  <0x00 0x40460000 0x0 0x00001000>,   /* atu registers */
+                  <0x00 0x40470000 0x0 0x00001000>,   /* dma registers */
+                  <0x00 0x40481000 0x0 0x000000f8>,   /* ctrl registers */
+                  <0x5f 0xffffe000 0x0 0x00002000>;   /* config space */
+            reg-names = "dbi", "dbi2", "atu", "dma", "ctrl", "config";
+            dma-coherent;
+            #address-cells = <3>;
+            #size-cells = <2>;
+            device_type = "pci";
+            ranges =
+                     <0x81000000 0x0 0x00000000 0x5f 0xfffe0000 0x0 0x00010000>,
+                     <0x82000000 0x0 0x00000000 0x58 0x00000000 0x0 0x80000000>,
+                     <0x82000000 0x1 0x00000000 0x59 0x00000000 0x6 0xfffe0000>;
+
+            bus-range = <0x0 0xff>;
+            interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
+            interrupt-names = "msi", "dma";
+            #interrupt-cells = <1>;
+            interrupt-map-mask = <0 0 0 0x7>;
+            interrupt-map = <0 0 0 1 &gic 0 0 GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
+                            <0 0 0 2 &gic 0 0 GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>,
+                            <0 0 0 3 &gic 0 0 GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+                            <0 0 0 4 &gic 0 0 GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>;
+
+            pcie@0 {
+                reg = <0x0 0x0 0x0 0x0 0x0>;
+                #address-cells = <3>;
+                #size-cells = <2>;
+                ranges;
+
+                device_type = "pci";
+                phys = <&serdes0 PHY_TYPE_PCIE 0 0>;
+            };
+        };
+    };
-- 
2.43.0


