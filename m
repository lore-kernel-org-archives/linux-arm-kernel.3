Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66ABCC369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 11:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YoWRRoUBCtB/ZPgUd2ZgkDkK1/5tN5cXWxvNrKDH+MY=; b=E/bAS0sq+MiwL1sx7seCF6OKcE
	bYwoa183jMs54A4ARoNqq63QSCECwR5q7AP/hMMEVz42KrsFPEDWO3O6AnpG44Vw/R5xdhkOB7wka
	6L9uw1TDfFaP1xGcr7Sl1N/82/3GZrfZB8CHgDTl7jQQDEi5O1nYooZj3kVe6nWkIWPhFzANR5uO3
	86K+GJ8HCMdrtDNus8WLTXSNTuGXAD8EPQI27cXrezFoYsapc/dF1H2OlavTrSuTY94wgEAx1Ijjm
	68L4T/M7Wqhf+H5rFLRd5VpVdMur1hnnuNXxJ7dN+R8cwUvzPnwMGb4vql2LHX1FxJNP3eg5BXJDQ
	ITojC38A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA5XB-0000000CfPk-0mxD;
	Wed, 30 Apr 2025 11:23:25 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA4kY-0000000CXjX-0dvZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 10:33:11 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-ac2a81e41e3so1272170466b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Apr 2025 03:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1746009188; x=1746613988; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YoWRRoUBCtB/ZPgUd2ZgkDkK1/5tN5cXWxvNrKDH+MY=;
        b=KV7ZvzwdBilywcJKkKpvPxY/ygsomgKdXxm5R5Qzfzsifz8P0amcPazSmU6KYzppKc
         yZQxuSpsGZEkQsMgT0mAWwfzoPF5UH9NaVlO7OO9q3hZTsg29piNdZqk84aVO/LpHILG
         +4kBS/sfU9LWvNaELko3eVOzyWUnAWVYXdMKbNwASIT2PeP0bec7/xewK10NVboEv4hZ
         baPvGXGZ0zymtNHjFqSeiV3Lc2FFslWTB6DQlCMeE+f1edZoOHFukLtiL8fEe55bM1kN
         LtZbCIx2np/2F6eo1f3SPULGNrTvxGuvdulNr9DLqAW75PYFzg3r4JkC6TShy5c8Zt5U
         jUhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746009188; x=1746613988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YoWRRoUBCtB/ZPgUd2ZgkDkK1/5tN5cXWxvNrKDH+MY=;
        b=RK0kHjHx0S4UqYSsXBgI2273rrBbVlh55dbyz+ATpWNHpMvDs8DOkeImN2uGRe3Qk2
         tHbDpeLaawjSZIZjULJlGLt7RpOEi+WuEDLuQqUSs+LoGkSFQAo0ueUarUc5GRTpS4W9
         Zl9rkv+aoTLoTXaPjnbCDrls8otbCZwphD1bmH4uEfb6wJpEwY6fPRcxkRe8Hg1nUmJq
         f3StiS6IFN6zc+x7be2BQM8+9A+fCJWzse8l2Dd/uj5sW3x1AVxkj+QzOcom5vumoufX
         8nhNQP/b2l5GqP1d1kX5IKnPX9Ju2IP6QU4R/LgdNE1U07+SVdmGMuPEbSMvZPIyfAy4
         agww==
X-Forwarded-Encrypted: i=1; AJvYcCUrLMAQjzPJa7uvxeMEi2NJ1aK7g0CHClHdP8f/B2uqJVWhoIFfDHGeWa7QqzmgVR8uvSvUiyPfozvL7ApxS+wu@lists.infradead.org
X-Gm-Message-State: AOJu0YxIu75a9y7w/dSlkEe/4D20lvDTELHwSObhvt3r1vhyBO2NOqzC
	kXgFNBNTQQW3BLZwoyBiDyVOPy7YQacEmIGu8iYkM2CvYyeo52kLI5v6/yzyUZg=
X-Gm-Gg: ASbGncsg1XkykjOmhFgAv6VJeQDxGNYcpqp2jbWB915Jz2XBY7KyW0+dV7ljH/Ocuz+
	crbW7t++jgvYCaJiZDn++Wcff16FWvBf30Kh3LVIo9OB1nh9scLKHkre0n5SmmiIkgxCV4p5il7
	HYChHfN3O/m+ByRlpDQKIIOimwrfUrdbSf6CT4C5cllAo/AFq0HQL0/zU4ki8vB3sKSNlFR+bvl
	VPycui/pu9oJN+h/8Epuhs0kq3BS8OBT5VvVj8+qU1QITDuohN6qEXge8yR6qRnl5Rgz9srfYdc
	6YVmBqiIW8bad9sA7/g+hI+1ujG9RAOPFzSFVaf+HMIqxkWUOlbkaDE/fafx4F1hHURmUOo=
X-Google-Smtp-Source: AGHT+IE4zT0K660/YKUi/PMngnz83sua+XYwAUF10tYT8pEOxvZ7ocV0PPZvpQksStrBGl/Fb6vzjw==
X-Received: by 2002:a17:907:971c:b0:ac7:3918:50f6 with SMTP id a640c23a62f3a-acedc7b0eafmr258696366b.61.1746009188201;
        Wed, 30 Apr 2025 03:33:08 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.166])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ed6af86sm909390366b.133.2025.04.30.03.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 03:33:07 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: bhelgaas@google.com,
	lpieralisi@kernel.org,
	kw@linux.com,
	manivannan.sadhasivam@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	saravanak@google.com,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 4/8] dt-bindings: PCI: renesas,r9a08g045s33-pcie: Add documentation for the PCIe IP on Renesas RZ/G3S
Date: Wed, 30 Apr 2025 13:32:32 +0300
Message-ID: <20250430103236.3511989-5-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250430103236.3511989-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250430103236.3511989-1-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_033310_195174_74049A8D 
X-CRM114-Status: GOOD (  15.21  )
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

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The PCIe IP available on the Renesas RZ/G3S complies with the PCI Express
Base Specification 4.0. It is designed for root complex applications and
features a single-lane (x1) implementation. Add documentation for it.
The interrupts, interrupt-names, resets, reset-names, clocks, clock-names
description were obtained from the hardware manual.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 .../pci/renesas,r9a08g045s33-pcie.yaml        | 242 ++++++++++++++++++
 1 file changed, 242 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/renesas,r9a08g045s33-pcie.yaml

diff --git a/Documentation/devicetree/bindings/pci/renesas,r9a08g045s33-pcie.yaml b/Documentation/devicetree/bindings/pci/renesas,r9a08g045s33-pcie.yaml
new file mode 100644
index 000000000000..354f9c3be139
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/renesas,r9a08g045s33-pcie.yaml
@@ -0,0 +1,242 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pci/renesas,r9a08g045s33-pcie.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas RZ/G3S PCIe host controller
+
+maintainers:
+  - Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
+
+description:
+  Renesas RZ/G3S PCIe host controller complies with PCIe Base Specification
+  4.0 and supports up to 5 GT/s (Gen2).
+
+properties:
+  compatible:
+    const: renesas,r9a08g045s33-pcie # RZ/G3S
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: System error interrupt
+      - description: System error on correctable error interrupt
+      - description: System error on non-fatal error interrupt
+      - description: System error on fatal error interrupt
+      - description: AXI error interrupt
+      - description: INTA interrupt
+      - description: INTB interrupt
+      - description: INTC interrupt
+      - description: INTD interrupt
+      - description: MSI interrupt
+      - description: Link bandwidth interrupt
+      - description: PME interrupt
+      - description: DMA interrupt
+      - description: PCIe event interrupt
+      - description: Message interrupt
+      - description: All interrupts
+
+  interrupt-names:
+    items:
+      - description: int_serr
+      - description: int_ser_cor
+      - description: int_serr_nonfatal
+      - description: int_serr_fatal
+      - description: axi_err_int
+      - description: inta_rc
+      - description: intb_rc
+      - description: intc_rc
+      - description: intd_rc
+      - description: intmsi_rc
+      - description: int_link_bandwidth
+      - description: int_pm_pme
+      - description: dma_int
+      - description: pcie_evt_int
+      - description: msg_int
+      - description: int_all
+
+  clocks:
+    items:
+      - description: System clock
+      - description: PM control clock
+
+  clock-names:
+    items:
+      - description: aclk
+      - description: clkl1pm
+
+  resets:
+    items:
+      - description: AXI2PCIe Bridge reset
+      - description: Data link layer/transaction layer reset
+      - description: Transaction layer (ACLK domain) reset
+      - description: Transaction layer (PCLK domain) reset
+      - description: Physical layer reset
+      - description: Configuration register reset
+      - description: Configuration register reset
+
+  reset-names:
+    items:
+      - description: aresetn
+      - description: rst_b
+      - description: rst_gp_b
+      - description: rst_ps_b
+      - description: rst_rsm_b
+      - description: rst_cfg_b
+      - description: rst_load_b
+
+  power-domains:
+    maxItems: 1
+
+  dma-ranges:
+    description:
+      A single range for the inbound memory region.
+    maxItems: 1
+
+  renesas,sysc:
+    description: System controller phandle
+    $ref: /schemas/types.yaml#/definitions/phandle
+
+  vendor-id:
+    const: 0x1912
+
+  device-id:
+    const: 0x0033
+
+  legacy-interrupt-controller:
+    description: Interrupt controller node for handling legacy PCI interrupts
+    type: object
+
+    properties:
+      "#address-cells":
+        const: 0
+
+      "#interrupt-cells":
+        const: 1
+
+      interrupt-controller: true
+
+      interrupts:
+        items:
+          - description: INTA interrupt
+          - description: INTB interrupt
+          - description: INTC interrupt
+          - description: INTD interrupt
+
+    required:
+      - "#address-cells"
+      - "#interrupt-cells"
+      - interrupt-controller
+      - interrupts
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - resets
+  - reset-names
+  - interrupts
+  - interrupt-names
+  - interrupt-map
+  - interrupt-map-mask
+  - power-domains
+  - "#address-cells"
+  - "#size-cells"
+  - "#interrupt-cells"
+  - renesas,sysc
+  - vendor-id
+  - device-id
+
+allOf:
+  - $ref: /schemas/pci/pci-host-bridge.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/r9a08g045-cpg.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    bus {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        gic: interrupt-controller {
+            interrupt-controller;
+            #interrupt-cells = <3>;
+        };
+
+        pcie@11e40000 {
+            compatible = "renesas,r9a08g045s33-pcie";
+            reg = <0 0x11e40000 0 0x10000>;
+            ranges = <0x03000000 0 0x30000000 0 0x30000000 0 0x8000000>;
+            dma-ranges = <0x42000000 0 0x48000000 0 0x48000000 0 0x8000000>;
+            bus-range = <0x0 0xff>;
+            clocks = <&cpg CPG_MOD R9A08G045_PCI_ACLK>,
+                     <&cpg CPG_MOD R9A08G045_PCI_CLKL1PM>;
+            clock-names = "aclk", "clkl1pm";
+            resets = <&cpg R9A08G045_PCI_ARESETN>,
+                     <&cpg R9A08G045_PCI_RST_B>,
+                     <&cpg R9A08G045_PCI_RST_GP_B>,
+                     <&cpg R9A08G045_PCI_RST_PS_B>,
+                     <&cpg R9A08G045_PCI_RST_RSM_B>,
+                     <&cpg R9A08G045_PCI_RST_CFG_B>,
+                     <&cpg R9A08G045_PCI_RST_LOAD_B>;
+            reset-names = "aresetn", "rst_b", "rst_gp_b", "rst_ps_b",
+                          "rst_rsm_b", "rst_cfg_b", "rst_load_b";
+            interrupts = <GIC_SPI 395 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 396 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 397 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 398 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 399 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 400 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 401 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 402 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 403 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 404 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 405 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 406 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 407 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 408 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 409 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 410 IRQ_TYPE_LEVEL_HIGH>;
+            interrupt-names = "int_serr", "int_serr_cor", "int_serr_nonfatal",
+                              "int_serr_fatal", "axi_err_int", "inta_rc",
+                              "intb_rc", "intc_rc", "intd_rc",
+                              "intmsi_rc", "int_link_bandwidth", "int_pm_pme",
+                              "dma_int", "pcie_evt_int", "msg_int",
+                              "int_all";
+            #interrupt-cells = <1>;
+            interrupt-map-mask = <0 0 0 7>;
+            interrupt-map = <0 0 0 1 &pcie_intx 0>, /* INT A */
+                            <0 0 0 2 &pcie_intx 1>, /* INT B */
+                            <0 0 0 3 &pcie_intx 2>, /* INT C */
+                            <0 0 0 4 &pcie_intx 3>; /* INT D */
+            device_type = "pci";
+            num-lanes = <1>;
+            #address-cells = <3>;
+            #size-cells = <2>;
+            power-domains = <&cpg>;
+            renesas,sysc = <&sysc>;
+            vendor-id = <0x1912>;
+            device-id = <0x0033>;
+
+            pcie_intx: legacy-interrupt-controller {
+                interrupt-controller;
+                #interrupt-cells = <1>;
+                #address-cells = <0>;
+                interrupt-parent = <&gic>;
+                interrupts = <GIC_SPI 400 IRQ_TYPE_LEVEL_HIGH>,
+                             <GIC_SPI 401 IRQ_TYPE_LEVEL_HIGH>,
+                             <GIC_SPI 402 IRQ_TYPE_LEVEL_HIGH>,
+                             <GIC_SPI 403 IRQ_TYPE_LEVEL_HIGH>;
+            };
+        };
+    };
+
+...
-- 
2.43.0


