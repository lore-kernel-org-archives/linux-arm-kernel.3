Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35CEDEFCE20
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 17:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JZBXdWVZi0XDY8R115Oci0agVJEUHhOf+qeqIk47aSE=; b=lh6LGO+OOMgGdKtC0Clh7Xy08e
	gxc5wmCJkMrVwFp+VCltrXU3fiWPcZyl4pr57GCljLuGSedf/P1kCky6mDYsZ4XTD3Bp0sCFJiAhA
	WCpJFna0aoNJFZ9qKQwOy+O2YS4RmAplNq1+tKkyH5ngKyNCW0xWY9uyY0fjIXZe7Tp1Dn6qTKXif
	4R47iXsvwoylR42+xQ4wDE+OP7Lwm1OF+yL9Ev/m8c3HDi9KMdJ3UpJxPO0UcKPjfuYFm6kbaUiDv
	GqdFaO+I3KEcuwbXKSXhb3A6YVFc3w0gSQL4ycPlK1hkLqSwqEwQdMX6KZq/tCX2zKJi8LQik9ICL
	9x/LK1IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxpvP-00000000AfK-3a7W;
	Wed, 04 Mar 2026 17:22:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxpvN-00000000Ads-3DGh;
	Wed, 04 Mar 2026 17:22:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C762860018;
	Wed,  4 Mar 2026 17:22:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D32E7C2BCB0;
	Wed,  4 Mar 2026 17:22:09 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Antoine Tenart <atenart@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Mark-PK Tsai <mark-pk.tsai@mediatek.com>,
	Daniel Palmer <daniel@thingy.jp>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Nishanth Menon <nm@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-amlogic@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/4] dt-bindings: interrupt-controller: arm,gic: Document symbolic definitions
Date: Wed,  4 Mar 2026 18:21:56 +0100
Message-ID: <36c8fe02dc911141170ea6607034422410e0ddc2.1772644406.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1772644406.git.geert+renesas@glider.be>
References: <cover.1772644406.git.geert+renesas@glider.be>
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

Currently, the various GIC DT bindings document the magic GIC and
interrupt numbers used in interrupts properties, but omit any references
to the corresponding symbolic DT binding definitions.

Add references to these symbolic definitions, and convert the examples
to make use of them.  This improves readability, and makes the examples
more similar to what actual users look like.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../bindings/interrupt-controller/arm,gic-v3.yaml    | 12 +++++++++---
 .../interrupt-controller/arm,gic-v5-iwb.yaml         |  2 ++
 .../bindings/interrupt-controller/arm,gic-v5.yaml    |  2 ++
 .../bindings/interrupt-controller/arm,gic.yaml       | 11 +++++++++--
 4 files changed, 22 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.yaml b/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.yaml
index 360a0643a0b567a4..d1a4b36f06bc3bdb 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.yaml
@@ -46,6 +46,7 @@ properties:
       The 1st cell is the interrupt type; 0 for SPI interrupts, 1 for PPI
       interrupts, 2 for interrupts in the Extended SPI range, 3 for the
       Extended PPI range. Other values are reserved for future use.
+      See <dt-bindings/interrupt-controller/arm-gic.h> for symbolic values.
 
       The 2nd cell contains the interrupt number for the interrupt type.
       SPI interrupts are in the range [0-987]. PPI interrupts are in the
@@ -56,6 +57,7 @@ properties:
       bits[3:0] trigger type and level flags.
         1 = edge triggered
         4 = level triggered
+      See <dt-bindings/interrupt-controller/irq.h> for symbolic values.
 
       The 4th cell is a phandle to a node describing a set of CPUs this
       interrupt is affine to. The interrupt must be a PPI, and the node
@@ -237,6 +239,8 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
     gic: interrupt-controller@2cf00000 {
       compatible = "arm,gic-v3";
       #interrupt-cells = <3>;
@@ -249,7 +253,7 @@ examples:
             <0x2c000000 0x2000>,  // GICC
             <0x2c010000 0x2000>,  // GICH
             <0x2c020000 0x2000>;  // GICV
-      interrupts = <1 9 4>;
+      interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
 
       msi-controller;
       mbi-ranges = <256 128>;
@@ -263,6 +267,8 @@ examples:
     };
 
   - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
     interrupt-controller@2c010000 {
       compatible = "arm,gic-v3";
       #interrupt-cells = <4>;
@@ -278,7 +284,7 @@ examples:
             <0x2c040000 0x2000>,  // GICC
             <0x2c060000 0x2000>,  // GICH
             <0x2c080000 0x2000>;  // GICV
-      interrupts = <1 9 4 0>;
+      interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH 0>;
 
       msi-controller@2c200000 {
         compatible = "arm,gic-v3-its";
@@ -307,7 +313,7 @@ examples:
 
     device@0 {
       reg = <0 4>;
-      interrupts = <1 1 4 &part0>;
+      interrupts = <GIC_PPI 1 IRQ_TYPE_LEVEL_HIGH &part0>;
     };
 
 ...
diff --git a/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v5-iwb.yaml b/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v5-iwb.yaml
index 99a266a62385a354..3103d314fdcae94c 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v5-iwb.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v5-iwb.yaml
@@ -46,6 +46,8 @@ properties:
       4 = active high level-sensitive
       8 = active low level-sensitive
 
+      See <dt-bindings/interrupt-controller/irq.h> for symbolic values.
+
     const: 2
 
   interrupt-controller: true
diff --git a/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v5.yaml b/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v5.yaml
index 86ca7f3ac2810312..16c66b043210d815 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v5.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v5.yaml
@@ -57,6 +57,8 @@ properties:
         4 = active high level-sensitive
         8 = active low level-sensitive
 
+      See <dt-bindings/interrupt-controller/irq.h> for symbolic values.
+
     const: 3
 
   interrupt-controller: true
diff --git a/Documentation/devicetree/bindings/interrupt-controller/arm,gic.yaml b/Documentation/devicetree/bindings/interrupt-controller/arm,gic.yaml
index ee4c77dac201ad8f..f05917d0071b5446 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/arm,gic.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/arm,gic.yaml
@@ -74,6 +74,7 @@ properties:
     description: |
       The 1st cell is the interrupt type; 0 for SPI interrupts, 1 for PPI
       interrupts.
+      See <dt-bindings/interrupt-controller/arm-gic.h> for symbolic values.
 
       The 2nd cell contains the interrupt number for the interrupt type.
       SPI interrupts are in the range [0-987].  PPI interrupts are in the
@@ -85,6 +86,7 @@ properties:
           2 = high-to-low edge triggered (invalid for SPIs)
           4 = active high level-sensitive
           8 = active low level-sensitive (invalid for SPIs).
+        See <dt-bindings/interrupt-controller/irq.h> for symbolic values.
         bits[15:8] PPI interrupt cpu mask.  Each bit corresponds to each of
         the 8 possible cpus attached to the GIC.  A bit set to '1' indicated
         the interrupt is wired to that CPU.  Only valid for PPI interrupts.
@@ -92,6 +94,7 @@ properties:
         DEFINED and as such not guaranteed to be present (most SoC available
         in 2014 seem to ignore the setting of this flag and use the hardware
         default value).
+        See <dt-bindings/interrupt-controller/arm-gic.h> for symbolic values.
 
   reg:
     description: |
@@ -201,6 +204,8 @@ examples:
 
   - |
     // GICv2
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
     interrupt-controller@2c001000 {
       compatible = "arm,cortex-a15-gic";
       #interrupt-cells = <3>;
@@ -209,18 +214,20 @@ examples:
             <0x2c002000 0x2000>,
             <0x2c004000 0x2000>,
             <0x2c006000 0x2000>;
-      interrupts = <1 9 0xf04>;
+      interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
     };
 
   - |
     // GICv2m extension for MSI/MSI-x support
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
     interrupt-controller@e1101000 {
       compatible = "arm,gic-400";
       #interrupt-cells = <3>;
       #address-cells = <1>;
       #size-cells = <1>;
       interrupt-controller;
-      interrupts = <1 8 0xf04>;
+      interrupts = <GIC_PPI 8 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
       ranges = <0 0xe1100000 0x100000>;
       reg = <0xe1110000 0x01000>,
             <0xe112f000 0x02000>,
-- 
2.43.0


