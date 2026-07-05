Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C44AC43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jul 2026 08:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ah/zRB/XuriwXpF5NOF9MEJmfk7QHzQ87OYCQjCuCrw=; b=1fT3KBJ4UPA27oSCMZHepJJcLr
	Yxhx9dGr1th0lt2VTT2Zvzg33B71YZYIQtFpGKHHionQ9l6+gZoe4yxNFpVkk1DuHwWSGwr7WjY+x
	gywUs+YnstiSr5aACJHwm9qaHYcXmzpE71TcwCPJTIzwngJM51t6ZZp1GEZGXKJiu/mo2xKlOP0Aq
	A3gPs/gk88dUrsgqiAfH8P1qpj2yMdFHszFWHPXUzt5a+Tl42ceU1oaeQFqVqrDmvgiZJAMhxwFHj
	zkn/0Q67gQQCRueNS4xMTR5DAlXH27ykoEvTdMzZvdxxSCaKsCn59RVlk+33Gc7x8oiWGzHo8r68Q
	QlhL7H5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgIbc-00000009AeR-2PMC;
	Sun, 05 Jul 2026 08:53:40 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgIbZ-00000009Ae7-0v60
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jul 2026 08:53:39 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-47c6e9a694bso227624f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jul 2026 01:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783241615; x=1783846415; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ah/zRB/XuriwXpF5NOF9MEJmfk7QHzQ87OYCQjCuCrw=;
        b=g2bKIcHIUsbd/AHLp0PbmVns57J+NmwfsWBaVz//dVKdTblvCVG08JKwJpT/iOQtE1
         S13NVF1fvHAh3eRrEnnBxWvdRjGEuX5zbCzi82KmYpqqcocpwn0U4qLt/q112yAv9MoG
         V4l/I+2cksSRpQLtTYTT3QDmG92kCQxV6R5XinLcF4WNnky1SZLwCX98G5VnBYiStABK
         oIFRV/asjSeKUvxf3i0UXu3KPMnjBtbeshe1UO4Cdc72VkELNlAWLfEiSMyhhIOQshNA
         TuZEqS+GhuKVOzMBKQdvk2JjDptp0JRh8nqTeCgm2psmcStFK1L+EYjnftWA25agP80/
         boHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783241615; x=1783846415;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ah/zRB/XuriwXpF5NOF9MEJmfk7QHzQ87OYCQjCuCrw=;
        b=IusfeNhIN6JiOCN/Mei1rLyjaW6Xc1arbOcDcuYjytZnKbb/sfYxYTizveWRlfbwqU
         yOgNzTMWqqSp+ccgBJFuQf3doakzVoZLI9NfZB5yVqOjyEpkj17gnd4kEI1ZreoKji3K
         c0dfK/f7nZ8Tg4ybxaowIA/I4T/ywd0HD4+uZjWZLPhA1hZfPoqqCLHyD/Tc0+8sM7mm
         EfqEyz77wr5y4ImUMvvh1K7iQxVrnfklGRhmaYBa7NDs1qd7bECKK3hCgAzkyx4oTWm6
         AZEOAIarI3IvBV0ZfbB/hsvMTdd5N0WIHUbHXtf5IJ+diEu2MGW0y/5YK1Q8jwPddLGb
         91BA==
X-Forwarded-Encrypted: i=1; AHgh+RqgsOYcg37vgnLjcBJ7hXgT3ncyheVLiFMnUVNSv2hnQu1LAl0iWQnQT7o/yrgi6lVJbRvN85GIUcHdaUv1Kg2Q@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8DcEAC/SI1XGAM+48mvNPdvhWSHKM6I3tRi8hyEuYwUFtWOXa
	+OY7bfe+qT7i63LqzBv3RWs7t/ZoktMvb2gcaXtQZo83UVwj3Fwxcu2W
X-Gm-Gg: AfdE7cmAdCJKve42BtS0wObqbiZxu9ATFoDluEU3zwqy/N0gCzH8BDkfVlu2QgLzYFc
	xiStOX6E8YMbzRFv53Qd1+uLwPkkepdP8tLzyMOWVj+I+bQMOjZs//Gaxn6rI+NyYvPyxg1n6+4
	GbXodvRxmIpRHfxgCzlJFr/bI5Xq6uy3fcC9+7ViYdWTAhTKvtPYrzwt9bm09JYSay2Po4XpfIg
	ivI1bJm5tfD9q74zbPFobkyJ3hT2BLUxDaHcaWqmtmY62L23Jfz9rTh11RN1DIO7GPNV6W9Iy6i
	cI2MDWkzIsOlhaO9g+bWmDYyqju540z0cUum1rqLaUKPacBCkNaS6jynyN/kKVHEmTSA7uL/2Qe
	cJ5Lje4BJX0rl5uBifz+7PuNGJFFrQTbKTYH+/ML1HptJeVyrlUqzdUFb/5aum/1R8xJkSx7oDw
	yV5jOX8A==
X-Received: by 2002:a05:6000:1847:b0:475:e3fe:8ac3 with SMTP id ffacd0b85a97d-47aa92c0701mr7196920f8f.8.1783241614935;
        Sun, 05 Jul 2026 01:53:34 -0700 (PDT)
Received: from avermoal ([185.13.176.155])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d780csm14649722f8f.11.2026.07.05.01.53.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 01:53:34 -0700 (PDT)
From: Avermoal <avermoal@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Avermoal <avermoal@gmail.com>
Subject: [PATCH] dt-bindings: iio: adc: convert Xilinx XADC bindings to YAML
Date: Sun,  5 Jul 2026 14:53:08 +0600
Message-ID: <20260705085308.8819-2-avermoal@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_015337_318969_6AED3EF6 
X-CRM114-Status: GOOD (  33.65  )
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

Convert the Xilinx XADC binding documentation from .txt to YAML format.
This conversion is part of the ongoing effort to migrate all DT bindings
to a machine-verifiable schema.

The new xilinx-xadc.yaml file was created from the original .txt and
includes all necessary properties, descriptions, and examples. The
conversion also fixes a minor typo in the 'xlnx,channels' property name.

Signed-off-by: Avermoal <avermoal@gmail.com>
---
 .../bindings/iio/adc/xilinx-xadc.txt          | 141 -------------
 .../bindings/iio/adc/xilinx-xadc.yaml         | 186 ++++++++++++++++++
 2 files changed, 186 insertions(+), 141 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/iio/adc/xilinx-xadc.txt
 create mode 100644 Documentation/devicetree/bindings/iio/adc/xilinx-xadc.yaml

diff --git a/Documentation/devicetree/bindings/iio/adc/xilinx-xadc.txt b/Documentation/devicetree/bindings/iio/adc/xilinx-xadc.txt
deleted file mode 100644
index f42e18078376..000000000000
--- a/Documentation/devicetree/bindings/iio/adc/xilinx-xadc.txt
+++ /dev/null
@@ -1,141 +0,0 @@
-Xilinx XADC device driver
-
-This binding document describes the bindings for the Xilinx 7 Series XADC as well
-as the UltraScale/UltraScale+ System Monitor.
-
-The Xilinx XADC is an ADC that can be found in the Series 7 FPGAs from Xilinx.
-The XADC has a DRP interface for communication. Currently two different
-frontends for the DRP interface exist. One that is only available on the ZYNQ
-family as a hardmacro in the SoC portion of the ZYNQ. The other one is available
-on all series 7 platforms and is a softmacro with a AXI interface. This binding
-document describes the bindings for both of them since the bindings are very
-similar.
-
-The Xilinx System Monitor is an ADC that is found in the UltraScale and
-UltraScale+ FPGAs from Xilinx. The System Monitor provides a DRP interface for
-communication. Xilinx provides a standard IP core that can be used to access the
-System Monitor through an AXI interface in the FPGA fabric. This IP core is
-called the Xilinx System Management Wizard. This document describes the bindings
-for this IP.
-
-Required properties:
-	- compatible: Should be one of
-		* "xlnx,zynq-xadc-1.00.a": When using the ZYNQ device
-		  configuration interface to interface to the XADC hardmacro.
-		* "xlnx,axi-xadc-1.00.a": When using the axi-xadc pcore to
-		  interface to the XADC hardmacro.
-		* "xlnx,system-management-wiz-1.3": When using the
-		  Xilinx System Management Wizard fabric IP core to access the
-		  UltraScale and UltraScale+ System Monitor.
-	- reg: Address and length of the register set for the device
-	- interrupts: Interrupt for the XADC control interface.
-	- clocks: When using the ZYNQ this must be the ZYNQ PCAP clock,
-	  when using the axi-xadc or the axi-system-management-wizard this must be
-	  the clock that provides the clock to the AXI bus interface of the core.
-
-Optional properties:
-	- xlnx,external-mux:
-		* "none": No external multiplexer is used, this is the default
-		  if the property is omitted.
-		* "single": External multiplexer mode is used with one
-		   multiplexer.
-		* "dual": External multiplexer mode is used with two
-		  multiplexers for simultaneous sampling.
-	- xlnx,external-mux-channel: Configures which pair of pins is used to
-	  sample data in external mux mode.
-	  Valid values for single external multiplexer mode are:
-		0: VP/VN
-		1: VAUXP[0]/VAUXN[0]
-		2: VAUXP[1]/VAUXN[1]
-		...
-		16: VAUXP[15]/VAUXN[15]
-	  Valid values for dual external multiplexer mode are:
-		1: VAUXP[0]/VAUXN[0] - VAUXP[8]/VAUXN[8]
-		2: VAUXP[1]/VAUXN[1] - VAUXP[9]/VAUXN[9]
-		...
-		8: VAUXP[7]/VAUXN[7] - VAUXP[15]/VAUXN[15]
-
-	  This property needs to be present if the device is configured for
-	  external multiplexer mode (either single or dual). If the device is
-	  not using external multiplexer mode the property is ignored.
-	- xnlx,channels: List of external channels that are connected to the ADC
-	  Required properties:
-		* #address-cells: Should be 1.
-		* #size-cells: Should be 0.
-
-	  The child nodes of this node represent the external channels which are
-	  connected to the ADC. If the property is no present no external
-	  channels will be assumed to be connected.
-
-	  Each child node represents one channel and has the following
-	  properties:
-		Required properties:
-			* reg: Pair of pins the channel is connected to.
-				0: VP/VN
-				1: VAUXP[0]/VAUXN[0]
-				2: VAUXP[1]/VAUXN[1]
-				...
-				16: VAUXP[15]/VAUXN[15]
-			  Note each channel number should only be used at most
-			  once.
-		Optional properties:
-			* xlnx,bipolar: If set the channel is used in bipolar
-			  mode.
-
-
-Examples:
-	xadc@f8007100 {
-		compatible = "xlnx,zynq-xadc-1.00.a";
-		reg = <0xf8007100 0x20>;
-		interrupts = <0 7 4>;
-		interrupt-parent = <&gic>;
-		clocks = <&pcap_clk>;
-
-		xlnx,channels {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			channel@0 {
-				reg = <0>;
-			};
-			channel@1 {
-				reg = <1>;
-			};
-			channel@8 {
-				reg = <8>;
-			};
-		};
-	};
-
-	xadc@43200000 {
-		compatible = "xlnx,axi-xadc-1.00.a";
-		reg = <0x43200000 0x1000>;
-		interrupts = <0 53 4>;
-		interrupt-parent = <&gic>;
-		clocks = <&fpga1_clk>;
-
-		xlnx,channels {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			channel@0 {
-				reg = <0>;
-				xlnx,bipolar;
-			};
-		};
-	};
-
-	adc@80000000 {
-		compatible = "xlnx,system-management-wiz-1.3";
-		reg = <0x80000000 0x1000>;
-		interrupts = <0 81 4>;
-		interrupt-parent = <&gic>;
-		clocks = <&fpga1_clk>;
-
-		xlnx,channels {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			channel@0 {
-				reg = <0>;
-				xlnx,bipolar;
-			};
-		};
-	};
diff --git a/Documentation/devicetree/bindings/iio/adc/xilinx-xadc.yaml b/Documentation/devicetree/bindings/iio/adc/xilinx-xadc.yaml
new file mode 100644
index 000000000000..d61635516ce2
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/xilinx-xadc.yaml
@@ -0,0 +1,186 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/adc/xilinx-xadc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Xilinx 7 Series XADC and UltraScale/UltraScale+ System Monitor
+
+maintainers:
+  - Avermoal <avermoal@gmail.com>
+
+description: |
+  The Xilinx XADC is an ADC that can be found in the Series 7 FPGAs from Xilinx.
+  The XADC has a DRP interface for communication. Currently two different
+  frontends for the DRP interface exist. One that is only available on the ZYNQ
+  family as a hardmacro in the SoC portion of the ZYNQ. The other one is
+  available on all series 7 platforms and is a softmacro with an AXI interface.
+  This binding document describes the bindings for both of them since the
+  bindings are very similar.
+
+  The Xilinx System Monitor is an ADC that is found in the UltraScale and
+  UltraScale+ FPGAs from Xilinx. The System Monitor provides a DRP interface
+  for communication. Xilinx provides a standard IP core that can be used to
+  access the System Monitor through an AXI interface in the FPGA fabric.
+  This IP core is called the Xilinx System Management Wizard. This document
+  describes the bindings for this IP.
+
+properties:
+  compatible:
+    description: |
+      Specifies the interface type and the target device.
+      - "xlnx,zynq-xadc-1.00.a"
+      for ZYNQ device configuration interface (hardmacro in SoC)
+      - "xlnx,axi-xadc-1.00.a"
+      for AXI pcore softmacro on all Series 7 FPGAs
+      - "xlnx,system-management-wiz-1.3"
+      for UltraScale/UltraScale+ System Monitor via AXI
+    enum:
+      - xlnx,zynq-xadc-1.00.a
+      - xlnx,axi-xadc-1.00.a
+      - xlnx,system-management-wiz-1.3
+
+  reg:
+    description: Address and length of the register set for the device.
+    maxItems: 1
+
+  interrupts:
+    description: Interrupt for the XADC control interface.
+    maxItems: 1
+
+  clocks:
+    description: |
+      When using the ZYNQ this must be the ZYNQ PCAP clock,
+      when using the axi-xadc or the axi-system-management-wizard this must be
+      the clock that provides the clock to the AXI bus interface of the core.
+    maxItems: 1
+
+  xlnx,external-mux:
+    description: |
+      External multiplexer mode. If omitted, defaults to "none".
+      - "none" – no external multiplexer (default)
+      - "single" – one external multiplexer
+      - "dual" – two external multiplexers for simultaneous sampling
+    $ref: /schemas/types.yaml#/definitions/string
+    enum: [none, single, dual]
+    default: none
+
+  xlnx,external-mux-channel:
+    description: |
+      Configures which pair of pins is used to sample data in external mux mode.
+      For single mode: 0 (VP/VN) or 1..16 (VAUXP[0..15]/VAUXN[0..15]).
+      For dual mode: 1..8, where the value n corresponds to the pair
+      (VAUXP[n-1]/VAUXN[n-1] and VAUXP[n+7]/VAUXN[n+7]).
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 16
+
+  xlnx,channels:
+    description: |
+      Container for external channels that are connected to the ADC.
+      If this property is not present, no external channels will be assumed.
+    type: object
+    properties:
+      "#address-cells":
+        const: 1
+      "#size-cells":
+        const: 0
+    patternProperties:
+      "^channel@[0-9a-f]+$":
+        type: object
+        description: Each child node represents one external channel.
+        properties:
+          reg:
+            description: |
+              Pair of pins the channel is connected to.
+              0: VP/VN
+              1..16: VAUXP[0..15]/VAUXN[0..15]
+            maxItems: 1
+          xlnx,bipolar:
+            description: If present, the channel is used in bipolar mode.
+            type: boolean
+        required:
+          - reg
+        additionalProperties: false
+    required:
+      - "#address-cells"
+      - "#size-cells"
+    additionalProperties: false
+
+allOf:
+  - if:
+      required:
+        - xlnx,external-mux
+      properties:
+        xlnx,external-mux:
+          enum: [single, dual]
+    then:
+      required:
+        - xlnx,external-mux-channel
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    xadc@f8007100 {
+        compatible = "xlnx,zynq-xadc-1.00.a";
+        reg = <0xf8007100 0x20>;
+        interrupts = <0 7 4>;
+        interrupt-parent = <&gic>;
+        clocks = <&pcap_clk>;
+
+        xlnx,channels {
+            #address-cells = <1>;
+            #size-cells = <0>;
+            channel@0 {
+                reg = <0>;
+            };
+            channel@1 {
+                reg = <1>;
+            };
+            channel@8 {
+                reg = <8>;
+            };
+        };
+    };
+  - |
+    xadc@43200000 {
+        compatible = "xlnx,axi-xadc-1.00.a";
+        reg = <0x43200000 0x1000>;
+        interrupts = <0 53 4>;
+        interrupt-parent = <&gic>;
+        clocks = <&fpga1_clk>;
+
+        xlnx,channels {
+            #address-cells = <1>;
+            #size-cells = <0>;
+            channel@0 {
+                reg = <0>;
+                xlnx,bipolar;
+            };
+        };
+    };
+  - |
+    adc@80000000 {
+        compatible = "xlnx,system-management-wiz-1.3";
+        reg = <0x80000000 0x1000>;
+        interrupts = <0 81 4>;
+        interrupt-parent = <&gic>;
+        clocks = <&fpga1_clk>;
+
+        xlnx,channels {
+            #address-cells = <1>;
+            #size-cells = <0>;
+            channel@0 {
+                reg = <0>;
+                xlnx,bipolar;
+            };
+        };
+    };
+...
-- 

Changes in v2:
- Fix conditional requirement for xlnx,external-mux-channel (add if/required block)
- Correct reg type in child nodes (use maxItems: 1 instead of items)
- Make #address-cells and #size-cells required under xlnx,channels
2.52.0


