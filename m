Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76689C5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Aug 2026 21:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RRTi+2XfPP4e/3o2uPviWSe0YdqRzssbdRkwWqs+fb4=; b=GLuEo3MxO2hM0djEyOEiQfETlo
	56lydATEeI3Raop8FDTAxauXpx6KDAZXF5SXVjUXEJk95Ob1SlbhYXwqhlm81thCzReCGITdAJL/q
	v4H5FP0hM9vg3J0MoD92xuZueVKq/exsWNQ0bWQgghLghoa6ik0qhJ2/eVYVvWStFVejCwZah2wcV
	NKRjuxk9q1bFYS745wfhwqIeVc3N4DRG4T3/rr4SQFUBfQOB+UjTBQBZz4+Z8nMd58c47b1EuGFig
	xZArtay6F8SKeESCRHTdC/i1bl0T1ouLvfK8PvpHGKfgzFb1v5aCqu5pcFd4yEZq7B0b7RDyNMizj
	yogcG9KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvMGx-00000004DPP-2Bca;
	Sat, 15 Aug 2026 21:50:35 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvMGu-00000004DOK-0Vpj
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Aug 2026 21:50:35 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2cf49dc28ccso3587975ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Aug 2026 14:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786830631; x=1787435431; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RRTi+2XfPP4e/3o2uPviWSe0YdqRzssbdRkwWqs+fb4=;
        b=sg2XPqvTNjrU09U+SwAMyvwFYpV1811QPUuxUfBv1+XuQvH77+gtmSj9DuQ35X+ODH
         6Wl+j4jwP09vb6vVWuEGDhFpxJo0balBG68/fmB4l3R58jlziuLUAmgLzuEVnzrsPA56
         fgj2pFEuHIGBXVQ9IO8ZJnyOf0S9D+7zf2Wc5dfrm0nlWjOgdsZZBlPONMAsIwEBMI9E
         Tcohncyuwc0KOlH141h1BXlsUXl2I+o2T5MhBdvwWvIm33786d3+pXZLF1rUdBO6mJZd
         5oMeM5/6weUGkwfEDb8KRcN2QbEj0G2IEkjx+pyg42rbwlNaI1YSfr6sgJQNkX/ag3KO
         Wszw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786830631; x=1787435431;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RRTi+2XfPP4e/3o2uPviWSe0YdqRzssbdRkwWqs+fb4=;
        b=eNoYeq+zet9BeFeUZaH0Ea7z7OrE0bmbIXkueBrrsauK7qZ8tamsxCxt0N/JZaWKsS
         NFr4G5YbrcWJ2OcyfzOp0gilyrULbATT4fZ6Lxio35EEzKp2JeyqU/+gmE6XuybTH9Um
         XJ2m14NMz7aFRvSazfekWl4htusOH4v+G/LDVcvIQmquZ5hoMWKFo0eORQGC2hcpghkY
         7jZvJOxsD1umEpW1wzMz++833W9gqQW5Gy+IkyEDGgOaEZ3oCa8ryc5fczCtqMOerGxz
         YpU+RyVzexv4wPJx/QUFSYlP3Q9Hv2LtXncYl2FDEJ2OJhtjXh/SbHCX8rQFvHz31oex
         +3aQ==
X-Forwarded-Encrypted: i=1; AHgh+RrMCRK7IqA/MxhQP/ccRbTdqigLuiejGa7Rky0V2SsBwRlrwMB413MEyTsWqqoqh04z6BA6lCkM5939cwwiH0oB@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+MVdd9JM54eEp3VjeSl9K5d+GEm9ITGJ0QNCkN9F74EnDc7XO
	jtUZWaZJaPLxlQQpjblIBftwJ8olQoPwYZl5RSJOUnjhPLn6sEKBSp7k
X-Gm-Gg: AR+sD108542ygChST6ulSNqTZkEV586wDCk7urBJ8TsH5AN4tScfBU6jo7t9EpqvGsJ
	4Pmy+Dapn+YtkKjhm5za5INjrMqEqLxhw8Xz3073o23CpjlkJ7tWcwDh//dcPrbeIT2liPEUkr9
	iaJ/+aT39rbAx+z4Im5CV31egzvRtnaAeXTOFzZ+VU5tAXBez14ccPnCCuhTzAXrQNZB2lO5j06
	Lxe6/AVd5qiCPtg6CmWOJFVJtqlXivDfvB4hyU8hlXMwdy20lx8fIu0c78xhucvzFLZfjngANFM
	1pwLo+bqTc6X1UcCBLmDUBphdyyYuz7vmXBTDbn4JnnEPz2CFmHxcQhX5iUIb49Ms5TtOYYWqD1
	vvAgEByi332nEAcU9rx6OHdqa4x5AACmi0dpbPO2N38fKd0fPe2U8H1Qw6uxOu05WDhf9IJoIFG
	Q51/KQ9UEXvzBy90JYSzaYMis0NYOOuvg4SxJ2nz8lmAVYYZ6Ftj/i9ixpTwBW9aeSRHMMGw2Bp
	an86/voYfQ7zq1Y5YRXVUA=
X-Received: by 2002:a17:90b:4c87:b0:38e:549:9e04 with SMTP id 98e67ed59e1d1-3933b7d1d85mr11505275a91.1.1786830631002;
        Sat, 15 Aug 2026 14:50:31 -0700 (PDT)
Received: from [10.112.173.252] ([2409:40c2:505d:7e1:7f19:edf4:38f3:dccf])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141388b2554sm33541829c88.14.2026.08.15.14.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 14:50:30 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Sun, 16 Aug 2026 03:19:32 +0530
Subject: [PATCH 2/2] dt-bindings: spi: ti,davinci-spi: convert to DT schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260816-ti-davinci-spi-v1-2-a7f57dfd5262@gmail.com>
References: <20260816-ti-davinci-spi-v1-0-a7f57dfd5262@gmail.com>
In-Reply-To: <20260816-ti-davinci-spi-v1-0-a7f57dfd5262@gmail.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
 simona.toaca@nxp.com, j.bhargav.u@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786830590; l=9738;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=55tNRnilXGUpfBe40ZOG32nJPAfFrWCC6SLA0JdnEME=;
 b=Sm05bewC87sUqORgXy+/OaVlBGt+UhxbSF0u2lvPauwoxS1kKgyi5NuuxaP49AaoWlSYOImTA
 1BbK5JtNUwrATY8dZsexV8fjm3BvFgMutbbu0Yousz6H6Zv3AJlvofF
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260815_145032_913601_884D623C 
X-CRM114-Status: GOOD (  26.44  )
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

Convert the TI DaVinci/Keystone SPI controller binding from text format
to DT schema.

Changes during the conversion:
- Create a separate ti,davinci-spi-peripheral-props.yaml schema to
  properly define the ti,spi-wdelay peripheral property.
- Add missing dmas and dma-names properties.
- Add constraints to ti,spi-wdelay based on the 6-bit width
  of the SPIFMTn.WDELAY hardware register field.
- Add constraints to num-cs based on the maximum hardware chip
  selects available on the DA850 SoC.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 .../devicetree/bindings/spi/spi-davinci.txt        | 100 -----------------
 .../bindings/spi/spi-peripheral-props.yaml         |   1 +
 .../spi/ti,davinci-spi-peripheral-props.yaml       |  25 +++++
 .../devicetree/bindings/spi/ti,davinci-spi.yaml    | 118 +++++++++++++++++++++
 4 files changed, 144 insertions(+), 100 deletions(-)

diff --git a/Documentation/devicetree/bindings/spi/spi-davinci.txt b/Documentation/devicetree/bindings/spi/spi-davinci.txt
deleted file mode 100644
index f012888656ec..000000000000
--- a/Documentation/devicetree/bindings/spi/spi-davinci.txt
+++ /dev/null
@@ -1,100 +0,0 @@
-Davinci SPI controller device bindings
-
-Links on DM:
-Keystone 2 - https://www.ti.com/lit/ug/sprugp2a/sprugp2a.pdf
-dm644x - https://www.ti.com/lit/ug/sprue32a/sprue32a.pdf
-OMAP-L138/da830 - http://www.ti.com/lit/ug/spruh77a/spruh77a.pdf
-
-Required properties:
-- #address-cells: number of cells required to define a chip select
-	address on the SPI bus. Should be set to 1.
-- #size-cells: should be zero.
-- compatible:
-	- "ti,dm6441-spi" for SPI used similar to that on DM644x SoC family
-	- "ti,da830-spi" for SPI used similar to that on DA8xx SoC family
-	- "ti,keystone-spi" for SPI used similar to that on Keystone2 SoC
-		family
-- reg: Offset and length of SPI controller register space
-- num-cs: Number of chip selects. This includes internal as well as
-	GPIO chip selects.
-- ti,davinci-spi-intr-line: interrupt line used to connect the SPI
-	IP to the interrupt controller within the SoC. Possible values
-	are 0 and 1. Manual says one of the two possible interrupt
-	lines can be tied to the interrupt controller. Set this
-	based on a specific SoC configuration.
-- interrupts: interrupt number mapped to CPU.
-- clocks: spi clk phandle
-          For 66AK2G this property should be set per binding,
-          Documentation/devicetree/bindings/clock/ti,sci-clk.yaml
-
-SoC-specific Required Properties:
-
-The following are mandatory properties for Keystone 2 66AK2G SoCs only:
-
-- power-domains:	Should contain a phandle to a PM domain provider node
-			and an args specifier containing the SPI device id
-			value. This property is as per the binding,
-
-Optional:
-- cs-gpios: gpio chip selects
-	For example to have 3 internal CS and 2 GPIO CS, user could define
-	cs-gpios = <0>, <0>, <0>, <&gpio1 30 0>, <&gpio1 31 0>;
-	where first three are internal CS and last two are GPIO CS.
-
-Optional properties for slave devices:
-SPI slave nodes can contain the following properties.
-Not all SPI Peripherals from Texas Instruments support this.
-Please check SPI peripheral documentation for a device before using these.
-
-- ti,spi-wdelay : delay between transmission of words
-	(SPIFMTn.WDELAY, SPIDAT1.WDEL) must be specified in number of SPI module
-	clock periods.
-
-	delay = WDELAY * SPI_module_clock_period + 2 * SPI_module_clock_period
-
-Below is timing diagram which shows functional meaning of
-"ti,spi-wdelay" parameter.
-
-             +-+ +-+ +-+ +-+ +-+                           +-+ +-+ +-+
-SPI_CLK      | | | | | | | | | |                           | | | | | |
-  +----------+ +-+ +-+ +-+ +-+ +---------------------------+ +-+ +-+ +-
-
-SPI_SOMI/SIMO+-----------------+                           +-----------
-  +----------+ word1           +---------------------------+word2
-             +-----------------+                           +-----------
-                                          WDELAY
-                                <-------------------------->
-
-Example of a NOR flash slave device (n25q032) connected to DaVinci
-SPI controller device over the SPI bus.
-
-spi0:spi@20bf0000 {
-	#address-cells			= <1>;
-	#size-cells			= <0>;
-	compatible			= "ti,dm6446-spi";
-	reg				= <0x20BF0000 0x1000>;
-	num-cs				= <4>;
-	ti,davinci-spi-intr-line	= <0>;
-	interrupts			= <338>;
-	clocks				= <&clkspi>;
-
-	flash: flash@0 {
-		#address-cells = <1>;
-		#size-cells = <1>;
-		compatible = "st,m25p32";
-		spi-max-frequency = <25000000>;
-		reg = <0>;
-		ti,spi-wdelay = <8>;
-
-		partition@0 {
-			label = "u-boot-spl";
-			reg = <0x0 0x80000>;
-			read-only;
-		};
-
-		partition@1 {
-			label = "test";
-			reg = <0x80000 0x380000>;
-		};
-	};
-};
diff --git a/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml b/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
index 880a9f624566..cb5d608998e1 100644
--- a/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
+++ b/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
@@ -155,5 +155,6 @@ allOf:
   - $ref: fsl,dspi-peripheral-props.yaml#
   - $ref: samsung,spi-peripheral-props.yaml#
   - $ref: nvidia,tegra210-quad-peripheral-props.yaml#
+  - $ref: ti,davinci-spi-peripheral-props.yaml#
 
 additionalProperties: true
diff --git a/Documentation/devicetree/bindings/spi/ti,davinci-spi-peripheral-props.yaml b/Documentation/devicetree/bindings/spi/ti,davinci-spi-peripheral-props.yaml
new file mode 100644
index 000000000000..1060f176c6cb
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/ti,davinci-spi-peripheral-props.yaml
@@ -0,0 +1,25 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/spi/ti,davinci-spi-peripheral-props.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI DaVinci/Keystone SPI Peripheral Properties
+
+maintainers:
+  - Bartosz Golaszewski <brgl@kernel.org>
+
+description:
+  Peripheral-specific properties for SPI devices attached to a TI
+  DaVinci/Keystone SPI controller.
+
+properties:
+  ti,spi-wdelay:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 63
+    description:
+      delay between transmission of words (SPIFMTn.WDELAY, SPIDAT1.WDEL)
+      must be specified in number of SPI module clock periods.
+
+additionalProperties: true
diff --git a/Documentation/devicetree/bindings/spi/ti,davinci-spi.yaml b/Documentation/devicetree/bindings/spi/ti,davinci-spi.yaml
new file mode 100644
index 000000000000..81014e963909
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/ti,davinci-spi.yaml
@@ -0,0 +1,118 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/spi/ti,davinci-spi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI DaVinci/Keystone SPI Controller
+
+maintainers:
+  - Bartosz Golaszewski <brgl@kernel.org>
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - ti,da830-spi
+          - ti,keystone-spi
+      - items:
+          - const: ti,keystone-spi
+          - const: ti,dm6441-spi
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+    description:
+      Should contain a phandle to a PM domain provider node
+      and an args specifier containing the SPI device id
+      value.
+
+  num-cs:
+    minimum: 1
+    maximum: 6
+    default: 1
+    description:
+      Number of chip selects supported by the controller. This
+      includes both internal and GPIO chip selects.
+
+  ti,davinci-spi-intr-line:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1]
+    description:
+      Interrupt line used to connect the SPI IP to the interrupt
+      controller within the SoC.  The SPI peripheral can route its
+      interrupt output to one of two lines (INT0 or INT1). Set
+      this based on the SoC-specific wiring to the interrupt
+      controller.
+
+  dmas:
+    items:
+      - description: RX DMA channel
+      - description: TX DMA channel
+
+  dma-names:
+    items:
+      - const: rx
+      - const: tx
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - ti,davinci-spi-intr-line
+
+allOf:
+  - $ref: spi-controller.yaml#
+  - if:
+      properties:
+        compatible:
+          const: ti,keystone-spi
+    then:
+      required:
+        - power-domains
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    spi@20bf0000 {
+        compatible = "ti,keystone-spi","ti,dm6441-spi";
+        reg = <0x20bf0000 0x1000>;
+        num-cs = <4>;
+        ti,davinci-spi-intr-line = <0>;
+        interrupts = <338>;
+        clocks = <&clkspi>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        flash@0 {
+            compatible = "jedec,spi-nor";
+            spi-max-frequency = <25000000>;
+            reg = <0>;
+            ti,spi-wdelay = <8>;
+        };
+    };
+
+  - |
+    spi@41000 {
+        compatible = "ti,da830-spi";
+        reg = <0x41000 0x1000>;
+        num-cs = <6>;
+        ti,davinci-spi-intr-line = <1>;
+        interrupts = <20>;
+        dmas = <&edma0 14 0>, <&edma0 15 0>;
+        dma-names = "rx", "tx";
+        clocks = <&psc0 4>;
+        power-domains = <&psc0 4>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+    };

-- 
2.55.0


