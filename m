Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE4F1CCF2D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 03:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZXMPOwO5URaUWXudb6WIYNl+wUSYFfStSEDQV6YfRwU=; b=tODFTFwroZdJHYvI68MWc6J60p
	RPeVVUmYlS7Q0TwIJ8xj53mKxB25kAUViyw9IPHftncsJyIcWqvlMGnkW6wPN4d9TrTGEDn9X8fN5
	RSFg2N5FHnA9U8kje4yhMKOCIEQWGxEHFk5qj5R607omV+XLr/EE/PsFngtzvykxZUTQRXsMg8I8j
	nmMYdZ2yqmYi8mflSHKvvfYFzxbtPZ7pwLo9KTU1FXy9RCzq6KkAwVy4L0KM5TQUMjuqSZHDVrhyJ
	mQq1XjhGdHP2jSDPP1a+5pYvkPmVfMmbMSUFPzVK1cQcqLwzgJqqIw0yhK1q3kid60waq8Pkvapva
	wTWOObrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIdd8-00000006UjC-1b7n;
	Mon, 19 Oct 2026 03:01:42 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIdd2-00000006Ugd-3OmC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 03:01:38 +0000
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-93f2b8cf037so124942285a.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Oct 2026 20:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1792378895; x=1792983695; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZXMPOwO5URaUWXudb6WIYNl+wUSYFfStSEDQV6YfRwU=;
        b=BYNht1dOV3G3/dtmNyQm9GpIowtDRAqf0Wls108/SAdNhehHdQa/T+0i7u8NP9bpNx
         xEzUM4yQ7ZJTtdPRPvZjgW8XMjfk1tLnv5E/4a34ouRVHGB8ypwHN8TFzvh992bdF1Rr
         cld8TQ58GsePa2qodW2Pff1D8Auj8SlthXy6OGpdFDHT7o5t4s3oknnkgIyfWufYLqEX
         IIK9KE9JJILBE3ZQU63ft5wn8swVy33ic/DaB00NUBQOIhe2TWsDQGuGhuNEIjpwfF79
         9GSLJoL4GWcIoYP5q+d/hHg4upChv8n3s7Tk5BwkHKkyotqzBFTgVsHoVX2ZYyNpo1W7
         ZGog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792378895; x=1792983695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZXMPOwO5URaUWXudb6WIYNl+wUSYFfStSEDQV6YfRwU=;
        b=y1G037xke4cwOMPgc/FHidL4GkfxkHkB/tdcd5OWY0/u1dJip5tZHY4KDPb/VL4cwR
         vhvZ3b0+TwyBetoPsOlsuH2QC8avnOOqnkQ13RSU5kLNcGXkpD3Fng7wKfWQa0M/OyN3
         k9hdleM5Ca925VesOuZ+5zjcHiEQzp3JZKUw6FsPW/aS8rE9r1gg0126R5Bsg0jpklzM
         ELfcGhzz3ZQodEy1Z0Cc+W3dPC1IbIRvjbV5HTDNCGcqefoYWdm1mDNEa2/FJu5P+ccN
         yRHA3u/uqcwbxlIWF5g386MFkQJA0qQBLmp96Nn2qqr5espH07/1Nxcm9Cjv3NmUYWDk
         0Eng==
X-Forwarded-Encrypted: i=1; AKwUvByhFfmg/AAPtLcMtaANcv1QFaW61voyECOni7wVcy96xlUabEO7r+G/mr1eXnj492XpKRzkppzjaFmIXwO8NnXh@lists.infradead.org
X-Gm-Message-State: AFq9FYKgbnJhwOmNa/oZNSylToZmwhgKfgQuB7o5eraCjfHn5fIkot7s
	B0e+JMEd4OKHf8ol0r4C84GEm7fi4LlycIB0+hEKEbvR+XcTMN9lsikJHeR1uXeEjcU=
X-Gm-Gg: AYBFou26wCldhr/iG9CzmnvivrpB492Ws/ljUdaW/WjLIq71mEU+urEjvEz3gpTAEI/
	+LIinO4vdiDMTUgikEgm8nmPzEx8cP1OybDrOdIehsfeB5deQkKdr4wxR3xQlAsOAymnecVwBlS
	wu2AxLjchrnhljzaXO6hH87/Yx5Ys4jQxKlhBg1RSe2KbarxCDUfOOm+IijXjq94/00m9Ni4VEZ
	5wn8C+PtrZ0I/jZIOOGNzQ/f1/hDS+KzHkIBCk2aSefvSssx4ZRtKkgqhnYnZNHZa3upUj9C6oO
	6vqjm6HEeww1bEH9oHnMgPcwNZqcAE+AXe/KVUf6T0gf1EkkqSXFXPYPIxZCnNBGZASkBF+ORQZ
	LSlkSUlFTINLpDoEKA2bTUoY3qBUr6AXZg1hApoqRUnsI+pg116Z4JiYjPpTV7xv6DRowIQE+sP
	/Pv/p6S/410uyBE+jPvZD7Xkdud7aGpyBG4876dMOBkK3gJ7F+VVTaCweO5/4hRSMS1Z7/LlwGI
	pQ=
X-Received: by 2002:a05:620a:27d0:b0:93f:1936:b229 with SMTP id af79cd13be357-93f29dbec24mr972782385a.77.1792378895343;
        Sun, 18 Oct 2026 20:01:35 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f3c61c440sm216840185a.10.2026.10.18.20.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 20:01:34 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: maxime.chevallier@bootlin.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	richardcochran@gmail.com,
	p.zabel@pengutronix.de,
	peppe.cavallaro@st.com,
	joabreu@synopsys.com,
	mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	daniel@riscstar.com,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 1/5] dt-bindings: net: add support for Toshiba TC9564
Date: Sun, 18 Oct 2026 22:01:24 -0500
Message-ID: <20261019030129.1470307-2-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261019030129.1470307-1-elder@riscstar.com>
References: <20261019030129.1470307-1-elder@riscstar.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_200136_887364_05110877 
X-CRM114-Status: GOOD (  21.08  )
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

The Toshiba TC9564 is an SoC that exposes two XGMAC 10 Gbps Ethernet
interfaces, each of which is attached to an embedded PCIe function.

These XGMAC interfaces have three resets, for the MAC, PMA, and XPCS
layers.  These resets differ from the standard two resets defined
in "snps,dwmac.yaml".

To permit these other resets to be used, modify the way resets are
defined in "snps,dwmac.yaml" to be similar to the way interrupts and
their names are defined earlier in the file.  That is, rather than
adding descriptions with the resets property values, just specify the
maximum number of items.  Then, in the reset-names property, provide
a list of description/constant value pairs, indicating which renames
may be used among the (three) reset items specified.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 .../devicetree/bindings/net/snps,dwmac.yaml   |  26 +-
 .../bindings/net/toshiba,tc9564-xgmac.yaml    | 327 ++++++++++++++++++
 MAINTAINERS                                   |   7 +
 3 files changed, 351 insertions(+), 9 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/toshiba,tc9564-xgmac.yaml

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 2218a492817fd..ace827ee4eb6c 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -120,6 +120,7 @@ properties:
         - starfive,jh7110-dwmac
         - tesla,fsd-ethqos
         - thead,th1520-gmac
+        - toshiba,tc9564-xgmac
         - ultrarisc,dp1000-gmac
 
   reg:
@@ -174,17 +175,24 @@ properties:
 
   resets:
     minItems: 1
-    items:
-      - description: GMAC stmmaceth reset
-      - description: AHB or OCP reset
+    maxItems: 3
 
   reset-names:
-    oneOf:
-      - items:
-          - enum: [stmmaceth, ahb]
-      - items:
-          - const: stmmaceth
-          - enum: [ahb, stmmaceth-ocp]
+    maxItems: 3
+    items:
+      - oneOf:
+          - description: GMAC stmmaceth reset
+            const: stmmaceth
+          - description: AHB reset
+            const: ahb
+          - description: MAC reset
+            const: mac-reset
+          - description: PMA (Physical Medium Attachment) reset
+            const: pma-reset
+          - description: XPCS reset
+            const: xpcs-reset
+          - description: OCP reset (deprecated)
+            const: stmmaceth-ocp
 
   power-domains:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/net/toshiba,tc9564-xgmac.yaml b/Documentation/devicetree/bindings/net/toshiba,tc9564-xgmac.yaml
new file mode 100644
index 0000000000000..9c494d216c3a2
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/toshiba,tc9564-xgmac.yaml
@@ -0,0 +1,327 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/toshiba,tc9564-xgmac.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Toshiba TC9564 XGMAC Ethernet Controller
+
+maintainers:
+  - Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
+  - Alex Elder <elder@riscstar.com>
+  - Daniel Thompson <daniel@riscstar.com>
+
+description:
+  This binding describes the Toshiba TC9564 SoC implementation of the
+  Synopsys XGMAC Ethernet controller.
+
+  The Toshiba TC9564 incorporates a PCIe gen 3 switch with one upstream
+  and three downstream ports.  The first two downstream ports are exposed
+  externally, while the third is used by an internal PCIe endpoint.  The
+  PCIe endpoint implements two PCIe functions, and attached to each of
+  these is a 10 Gbps capable Synopsys XGMAC Ethernet controller.  Access
+  to management registers for each controller is via BAR 4 of its
+  respective PCI function.
+
+allOf:
+  - $ref: snps,dwmac.yaml#
+
+select:
+  properties:
+    compatible:
+      contains:
+        const: toshiba,tc9564-xgmac
+  required:
+    - compatible
+
+properties:
+  compatible:
+    const: toshiba,tc9564-xgmac
+
+  reg:
+    maxItems: 1
+
+  toshiba,config-syscon:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description:
+      The phandle and offset for a syscon that provides access to a
+      register containing a bit that indicates that PMA initialization
+      is done.
+    maxItems: 1
+
+  clocks:
+    minItems: 5
+    items:
+      - description: MAC main clock (125 MHz)
+      - description: PTP reference clock (250 MHz)
+      - description: MAC TX clock
+      - description: MAC RX clock
+      - description: MAC all clock gate
+      - description: MAC RMII clock (function 1 only)
+
+  clock-names:
+    minItems: 5
+    items:
+      - const: stmmaceth
+      - const: ptp_ref
+      - const: mac-tx-clock
+      - const: mac-rx-clock
+      - const: mac-all-clock
+      - const: mac-rmii-clock
+
+  resets:
+    items:
+      - description: MAC reset
+      - description: PMA (Physical Medium Attachment) reset
+      - description: XPCS reset
+
+  reset-names:
+    items:
+      - const: mac-reset
+      - const: pma-reset
+      - const: xpcs-reset
+
+  interrupts:
+    minItems: 17
+    maxItems: 17
+
+  interrupt-names:
+    minItems: 17
+    maxItems: 17
+
+  snps,tso:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      Enable TCP segmentation offload.
+
+  snps,pbl:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Set the programmable burst length.
+
+  snps,force_sf_dma_mode:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      Force store-and-forward mode for both TX and RX DMA.
+
+  snps,perfect-filter-entries:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Set the number of perfect filter entries supported.
+
+  snps,mtl-rx-config:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to a rx-queues-config node that describes the RX queues
+      managed by the stmmac memory transfer layer.
+
+  snps,mtl-tx-config:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to a tx-queues-config node that describes the TX queues
+      managed by the stmmac memory transfer layer.
+
+  rx-fifo-depth:
+    $ref: /schemas/net/ethernet-controller.yaml#/properties/rx-fifo-depth
+    maximum: 47104
+    description:
+      RX FIFO size in bytes.  This must be set explicitly because
+      the size (46KB) differs from the power-of-2 indicated by the
+      HW_FEATURE0 register, so the size is not accurately detected.
+
+  tx-fifo-depth:
+    $ref: /schemas/net/ethernet-controller.yaml#/properties/tx-fifo-depth
+    maximum: 47104
+    description:
+      TX FIFO size in bytes.  This must be set explicitly because
+      the size (46KB) differs from the power-of-2 indicated by the
+      HW_FEATURE0 register, so the size is not accurately detected.
+
+  snps,axi-config:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to a node describing AXI burst configuration.
+
+  iommus:
+    maxItems: 1
+
+  phy-mode:
+    const: sgmii
+
+  phy-handle: true
+
+  tx-queues-config:
+    $ref: /schemas/net/snps,dwmac.yaml#/properties/tx-queues-config
+
+  rx-queues-config:
+    $ref: /schemas/net/snps,dwmac.yaml#/properties/rx-queues-config
+
+  stmmac-axi-config:
+    $ref: /schemas/net/snps,dwmac-common.yaml#/properties/stmmac-axi-config
+
+  mdio:
+    $ref: /schemas/net/snps,dwmac.yaml#/properties/mdio
+
+required:
+  - toshiba,config-syscon
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - rx-fifo-depth
+  - tx-fifo-depth
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    ethernet@48000 {
+        compatible = "toshiba,tc9564-xgmac";
+        reg = <0x48000 0x8000>;
+        toshiba,config-syscon = <&tc9564_config_syscon0 0x1074>;
+
+        clocks = <&tc9564_ref_125mhz_clk>,
+                 <&tc9564_ref_250mhz_clk>,
+                 <&tc9564_clock0 13>,
+                 <&tc9564_clock0 14>,
+                 <&tc9564_clock0 18>,
+                 <&tc9564_clock0 15>;
+        clock-names = "stmmaceth",
+                      "ptp_ref",
+                      "mac-tx-clock",
+                      "mac-rx-clock",
+                      "mac-all-clock",
+                      "mac-rmii-clock";
+
+        resets = <&tc9564_reset0 8>,
+                 <&tc9564_reset0 9>,
+                 <&tc9564_reset0 10>;
+        reset-names = "mac-reset",
+                      "pma-reset",
+                      "xpcs-reset";
+
+        interrupts-extended = <&tc9564_msigen1 2>,
+                              <&tc9564_msigen1 3>,
+                              <&tc9564_msigen1 4>,
+                              <&tc9564_msigen1 5>,
+                              <&tc9564_msigen1 6>,
+                              <&tc9564_msigen1 7>,
+                              <&tc9564_msigen1 8>,
+                              <&tc9564_msigen1 9>,
+                              <&tc9564_msigen1 10>,
+                              <&tc9564_msigen1 11>,
+                              <&tc9564_msigen1 12>,
+                              <&tc9564_msigen1 13>,
+                              <&tc9564_msigen1 14>,
+                              <&tc9564_msigen1 15>,
+                              <&tc9564_msigen1 16>,
+                              <&tc9564_msigen1 17>,
+                              <&tc9564_msigen1 18>;
+        interrupt-names = "macirq",
+                          "tx-queue-0",
+                          "tx-queue-1",
+                          "tx-queue-2",
+                          "tx-queue-3",
+                          "tx-queue-4",
+                          "tx-queue-5",
+                          "tx-queue-6",
+                          "tx-queue-7",
+                          "rx-queue-0",
+                          "rx-queue-1",
+                          "rx-queue-2",
+                          "rx-queue-3",
+                          "rx-queue-4",
+                          "rx-queue-5",
+                          "rx-queue-6",
+                          "rx-queue-7";
+
+        snps,tso;
+        snps,pbl = <32>;
+        snps,force_sf_dma_mode;
+        snps,perfect-filter-entries = <32>;
+
+        snps,mtl-rx-config = <&tc9564_mtl_rx_emac1_setup>;
+        snps,mtl-tx-config = <&tc9564_mtl_tx_emac1_setup>;
+        rx-fifo-depth = <32768>;
+        tx-fifo-depth = <32768>;
+
+        snps,axi-config = <&tc9564_axi_emac1_setup>;
+
+        /* SID comes from the iommu-map for &pcie1 */
+        iommus = <&apps_smmu 0x1c90 0x0>;
+
+        phy-mode = "sgmii";
+        phy-handle = <&tc9564_emac1_phy>;
+
+        tc9564_mtl_rx_emac1_setup: rx-queues-config {
+            snps,rx-queues-to-use = <4>;
+            snps,rx-sched-sp;
+            queue0 {
+                snps,dcb-algorithm;
+                snps,map-to-dma-channel = <0x0>;
+            };
+            queue1 {
+                snps,dcb-algorithm;
+                snps,map-to-dma-channel = <0x1>;
+            };
+            queue2 {
+                snps,dcb-algorithm;
+                snps,map-to-dma-channel = <0x2>;
+            };
+            queue3 {
+                snps,dcb-algorithm;
+                snps,map-to-dma-channel = <0x3>;
+            };
+        };
+
+        tc9564_mtl_tx_emac1_setup: tx-queues-config {
+            snps,tx-queues-to-use = <4>;
+            snps,tx-sched-wrr;
+            queue0 {
+                snps,weight = <0x0c>;
+                snps,dcb-algorithm;
+            };
+            queue1 {
+                snps,weight = <0x0c>;
+                snps,dcb-algorithm;
+            };
+            queue2 {
+                snps,weight = <0x0c>;
+                snps,dcb-algorithm;
+            };
+            queue3 {
+                snps,weight = <0x0c>;
+                snps,dcb-algorithm;
+            };
+        };
+
+        tc9564_axi_emac1_setup: stmmac-axi-config {
+            snps,lpi_en;
+            snps,wr_osr_lmt = <31>;
+            snps,rd_osr_lmt = <31>;
+            snps,blen = <256 128 64 32 16 8 4>;
+        };
+
+        mdio {
+            compatible = "snps,dwmac-mdio";
+
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            tc9564_emac1_phy: ethernet-phy@1c {
+                compatible = "ethernet-phy-id004d.d101";
+                reg = <0x1c>;
+
+                reset-assert-us = <11000>;
+                reset-deassert-us = <70000>;
+
+                vdd18-supply = <&qep_1p8>;
+
+                pinctrl-names = "default";
+                pinctrl-0 = <&qep_irq_pin>;
+                interrupts-extended = <&tlmm 101 IRQ_TYPE_LEVEL_LOW>;
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 149bc44003bda..55ead3d1007a8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -28305,6 +28305,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/misc/pci1179,0220.yaml
 F:	drivers/misc/tc9564-pci.c
 
+TOSHIBA TC9564 DWMAC ETHERNET DRIVER
+M:	Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
+M:	Alex Elder <elder@kernel.org>
+M:	Daniel Thompson <danielt@kernel.org>
+S:	Maintained
+F:	Documentation/devicetree/bindings/net/toshiba,tc9564-dwmac.yaml
+
 TOSHIBA WMI HOTKEYS DRIVER
 M:	Azael Avalos <coproscefalo@gmail.com>
 L:	platform-driver-x86@vger.kernel.org
-- 
2.53.0


