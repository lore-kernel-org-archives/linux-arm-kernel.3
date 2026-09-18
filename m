Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54082C982D7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 18:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wSwV9QyihTEWzNpSev0Rq3JhnfzG5CYZv5DMfWp7kMA=; b=w79bx7DYIRW2YuNvJnBxcGAy7H
	lNif4YChwYjNfwvscHJVpQOCLHp1IGBvCLvG12PUbMPo+MooFXNdS3LVyWIcl1iwyKU4mvIGaj/FI
	BL/g0LIi8RhvAk4+lg9wwzZNiEFVd0akiMRbrdOKJJxRP9jX/DkYDFZ6KiZZ0IjWEncsPea7YtPn6
	ztFi0TlRDhyYDDRc/NTdrSE3tv2cWnIRRSeOA/5/PMNpxU08GfFLDTLeA4RAAaRuGW3xIkhhD9Aj1
	HpnyHk3v6yIsrGTcNHYDUIPTb9Bzn0ZtMxPEv+Xh5JC3zCWlpAoZEMq7rSqhuUzimcH7ebOiouQXY
	AL6WNBbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7dnZ-0000000FMYV-0cHf;
	Fri, 18 Sep 2026 18:59:01 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7dnW-0000000FMXw-3BtR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 18:59:00 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49e69b9e16aso11599765e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 11:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789757936; x=1790362736; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wSwV9QyihTEWzNpSev0Rq3JhnfzG5CYZv5DMfWp7kMA=;
        b=DwrwEopOdsHxjz8znp9YQxdHZl4BzprEtHR2pN7W1gEDRaqq2BDRMsvvEpf3f0ffIk
         3zbFiv4AY9/XyVCG7CGLUHR5xTR7VW2TEtHB3A/bhUrvuPqk7ODgL9hylqlSc+T2bmJ3
         KrqyS2yKm2xKiNDzw9SE/1RBbjoSBTK7JK5vccOy4rtJbmJQLIfyXDGulV3JKFV9fvcc
         82SrY5KvWiADLlRnGODd3XzVm+c5S8tXusHy81VARllp0lUJ7IH54eEYqJsLLT8Ng+QZ
         gbO/piPraS5ALAiFdcd8qNxwc27XjyUkVMJAOs8rKqOT+PbWieOlZPiSXpzUXTQU2TBI
         wDzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789757936; x=1790362736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wSwV9QyihTEWzNpSev0Rq3JhnfzG5CYZv5DMfWp7kMA=;
        b=q6jJIzWl0GwZo7iR5M1wAsupJZkdxnf5YvUmiR5FjIozSdMN5K8E6R+d9T2gHmsF1Y
         MfgEXjXAiyECDzzj9YkFq9uSW5vUDmNfbQn4eX1GbDScBsbnoGL3Cc4cO9UcyW0j5ilt
         HKUQg/nSj8u+EF2boD1dXODJIoF22MSI8rCVCqs5gi+C0Op1iruwyqeR1tsXj2HmJKFb
         Bx6LLh9mGgi0uCJN5ZcgEaansvZvgH7rnn8KF5wpN+UDRw0El8nD2Wl7uM09FD3WA5Va
         lIlMd1UY6cMXtoHwqPhkltjg1sNvA+Rgn3sWREogCt1aPvUr5z49zA3sFi5C4hg8oh05
         9mgA==
X-Forwarded-Encrypted: i=1; AKwUvBxt/RshcQW2Jc2ZSFmGPUCt4zB+GH4DjTlmQJbOSqWwHvOasarYyanuyZuqFdMFC9lhhV26LvQEQE8PNcF3PeTQ@lists.infradead.org
X-Gm-Message-State: AFuF++mjg/UkZfUy8zTgjPqfoyLpLihVQnzD8eIdTdGOe1DGZa4gUSzY
	AGcaRDrhTxBBqbNk0Ay4TEvh3LzcxYhhJ33BwO41Po6EZ3k9MieLbIyD
X-Gm-Gg: AYBFou0yWlt1TCUFluzmWxgJlwW0t2Yqohtar/w9Oxa2yQxixWwZ+JGEiZmUZ7IAk/U
	1Tb5diWkjxPmUTxGHndRaGOWSlA8o9WUfKGKpPxUfu9apUDLKHEL7P1mUc/HW+g6x9D7yPSKQJC
	MXNKSttsPOcxB5YmlIqgSGFW6leg4dHQpClHmsf/rcWDQHN1pAVJnH7OxMrLbgXnWJQ+VVcegDX
	Yll/wlvPlFHu5dneCsrKZ2P0ZAzB+sXKnTQuPT2+5qimAzeqgTlLX2IGOGlcsg71J7BFsQoZxj7
	IyRZP5LH+fVXeRCUU+vqZLBSiUtIJ7RKYColUl9ENM3fudQGICbK9NCDLS8cLHDsyqEeE3+FCYP
	YZGKpEkZc0NSouU8eeNlx4kq3zAOnvI/Aqj+btSnfHiSeNwBCzUV0zmPqz7nMJMUaRJ6LdTw5N0
	vnEVQnPd37pCG5cjZjZKIxzC77RTKFTHfO73IW1CT4JBqIRk53ezDq344aNCCjVbkyMMGgj/98z
	duMa66efOwu+VzRIoYLqYkJjmNM1C17xgSbrnsDcsuNRWA=
X-Received: by 2002:a05:600c:3512:b0:49c:e1cd:536 with SMTP id 5b1f17b1804b1-49fc56aee64mr48011805e9.12.1789757936371;
        Fri, 18 Sep 2026 11:58:56 -0700 (PDT)
Received: from localhost.localdomain ([176.220.123.16])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd0eab91sm14380145e9.1.2026.09.18.11.58.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 11:58:55 -0700 (PDT)
From: Omer PALA <palaomer100@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	linux-iio@vger.kernel.org (open list:IIO SUBSYSTEM AND DRIVERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/ZYNQ ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Cc: linux-iio@vger.kernel.org (open list:IIO SUBSYSTEM AND DRIVERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/ZYNQ ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3] dt-bindings: iio: adc: Add dt binding to xlnx,xadc
Date: Fri, 18 Sep 2026 21:58:06 +0300
Message-ID: <20260918185813.5070-1-palaomer100@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260918174809.17502-1-palaomer100@gmail.com>
References: <20260918174809.17502-1-palaomer100@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_115858_856381_2EFD22C1 
X-CRM114-Status: GOOD (  31.95  )
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

Add yaml devicetree binding for xlnx,zynq-xadc-1.00.a,
xlnx,axi-xadc-1.00.a and xlnx,system-management-wiz-1.3 from
xilinx-xadc.txt file.

Signed-off-by: Omer PALA <palaomer100@gmail.com>
---
 PATCH v3 Details:
 - Fixed $schema URI: "schemas/meta-schema.yaml#" -> "meta-schemas/core.yaml#"
 - Added "required: [xlnx,external-mux]" to each allOf/if block so the
  none/single/dual mux conditionals only match when the property is
  actually set, not just absent

 .../bindings/iio/adc/xilinx-xadc.txt          | 141 -------------
 .../bindings/iio/adc/xlnx,xadc.yaml           | 191 ++++++++++++++++++
 2 files changed, 191 insertions(+), 141 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/iio/adc/xilinx-xadc.txt
 create mode 100644 Documentation/devicetree/bindings/iio/adc/xlnx,xadc.yaml

diff --git a/Documentation/devicetree/bindings/iio/adc/xilinx-xadc.txt b/Documentation/devicetree/bindings/iio/adc/xilinx-xadc.txt
deleted file mode 100644
index f42e18078..000000000
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
diff --git a/Documentation/devicetree/bindings/iio/adc/xlnx,xadc.yaml b/Documentation/devicetree/bindings/iio/adc/xlnx,xadc.yaml
new file mode 100644
index 000000000..ffaada52f
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/xlnx,xadc.yaml
@@ -0,0 +1,191 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/adc/xlnx,xadc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Xilinx XADC device driver
+
+maintainers:
+  - Omer PALA <palaomer100@gmail.com>
+
+description: |
+  This binding document describes the bindings for the Xilinx 7 Series XADC as well
+  as the UltraScale/UltraScale+ System Monitor.
+
+properties:
+  compatible:
+    enum:
+      - xlnx,zynq-xadc-1.00.a
+      - xlnx,axi-xadc-1.00.a
+      - xlnx,system-management-wiz-1.3
+
+  reg:
+    description: Address and length of the register set for the device
+    maxItems: 1
+
+  interrupts:
+    description: Interrupt for the XADC control interface.
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  interrupt-parent: true
+
+  xlnx,external-mux:
+    description: Selects the external mux mode.
+    enum: [none, single, dual]
+    default: none
+
+  xlnx,external-mux-channel:
+    description: >
+      Configures which pair of pins is used to sample data in
+      external mux mode.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  xlnx,channels:
+    type: object
+    description: List of external channels that are connected to the ADC.
+    properties:
+      "#address-cells":
+        const: 1
+      "#size-cells":
+        const: 0
+    required:
+      - "#address-cells"
+      - "#size-cells"
+    patternProperties:
+      "^channel@[0-9a-f]+$":
+        type: object
+        properties:
+          reg:
+            description: Pair of pins the channel is connected to
+            minimum: 0
+            maximum: 16
+          xlnx,bipolar:
+            description: If set the channel is used in bipolar mode.
+            $ref: /schemas/types.yaml#/definitions/flag
+        required:
+          - reg
+        additionalProperties: false
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+unevaluatedProperties: false
+
+allOf:
+  - if:
+      properties:
+        xlnx,external-mux:
+          const: none
+      required:
+        - xlnx,external-mux
+    then:
+      properties:
+        xlnx,external-mux-channel: false
+
+  - if:
+      properties:
+        xlnx,external-mux:
+          const: single
+      required:
+        - xlnx,external-mux
+    then:
+      properties:
+        xlnx,external-mux-channel:
+          minimum: 0
+          maximum: 16
+      required:
+        - xlnx,external-mux-channel
+
+  - if:
+      properties:
+        xlnx,external-mux:
+          const: dual
+      required:
+        - xlnx,external-mux
+    then:
+      properties:
+        xlnx,external-mux-channel:
+          minimum: 1
+          maximum: 8
+      required:
+        - xlnx,external-mux-channel
+
+examples:
+  - |
+    soc {
+      #address-cells = <1>;
+      #size-cells = <1>;
+
+      xadc@f8007100 {
+        compatible = "xlnx,zynq-xadc-1.00.a";
+        reg = <0xf8007100 0x20>;
+        interrupts = <0 7 4>;
+        interrupt-parent = <&gic>;
+        clocks = <&pcap_clk>;
+
+        xlnx,external-mux = "single";
+        xlnx,external-mux-channel = <0>;
+
+        xlnx,channels {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          channel@0 {
+            reg = <0>;
+          };
+          channel@1 {
+            reg = <1>;
+          };
+          channel@8 {
+            reg = <8>;
+          };
+        };
+      };
+      xadc@43200000 {
+        compatible = "xlnx,axi-xadc-1.00.a";
+        reg = <0x43200000 0x1000>;
+        interrupts = <0 53 4>;
+        interrupt-parent = <&gic>;
+        clocks = <&fpga1_clk>;
+
+        xlnx,external-mux = "single";
+        xlnx,external-mux-channel = <0>;
+
+        xlnx,channels {
+          #address-cells = <1>;
+          #size-cells = <0>;
+          channel@0 {
+            reg = <0>;
+            xlnx,bipolar;
+          };
+        };
+      };
+      adc@80000000 {
+        compatible = "xlnx,system-management-wiz-1.3";
+        reg = <0x80000000 0x1000>;
+        interrupts = <0 81 4>;
+        interrupt-parent = <&gic>;
+        clocks = <&fpga1_clk>;
+
+        xlnx,external-mux = "single";
+        xlnx,external-mux-channel = <0>;
+
+        xlnx,channels {
+          #address-cells = <1>;
+          #size-cells = <0>;
+          channel@0 {
+            reg = <0>;
+            xlnx,bipolar;
+          };
+        };
+      };
+    };
-- 
2.55.0


