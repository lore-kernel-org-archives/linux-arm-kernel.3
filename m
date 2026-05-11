Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CACCACD37B7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 07:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fz3/iPbkPkVJpg+21eyeyZQXc8fO7eG+LOXjZ7wm054=; b=o8w/UB21fP3ny0qJv9BCF7+4JH
	2CPArkXPJhEIBhorQMeHxZ65pLHE9+P8OAANSa/Ta4+1jvmYi6BnIHrl2HxH1ivWWqtGoly7prRsw
	nGgxIAxGKiiAWiPMIkMKgCo+kxgEY5sI+sqdczcsaZURvIkGyOVeqffn1LWPm6ZJ5aS4zMTQd7SWv
	rzx/MrWZ2JryQa+5JybmvXCAtdW5TYdLuAxLD67O4OWLq2aJxuiqJgfJXmtGXpK2LWdobrlsrTQZi
	j3pSnQYC/JdcgKV2qfYF2JsGyalrjTJivnHjG4H3++Hl2+apra9dNJfM6Dazy0mZtQ3r4D+i0kVgM
	R4lpp8Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMLQj-0000000CewL-2wuH;
	Mon, 11 May 2026 07:51:57 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMLQg-0000000CevK-3EKO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 07:51:56 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-8353fd1cb5fso1855720b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 00:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778485914; x=1779090714; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fz3/iPbkPkVJpg+21eyeyZQXc8fO7eG+LOXjZ7wm054=;
        b=QKS45Kc81CrHmmdrsbtPSQo9m7syNfLWoUnc29bDy8esXrfziSeCHEDiFKM3QyXalw
         V90TKOC7BgZ/R/LxxIGzGfbye/a3mGgTLuNTgLS5h3+WLHvGDBk4Fytm0A/hnbOFRX29
         PqE9sUm9nGlbL9rv4smbkVJw5QJsD0KzbkKOeLgRD5CgDPknKjwgrVTm1yy3TKM8ndKY
         5VU2GUJfn+DluCMSdL/oesJGS1P3IyTfbTa3l+2+GuiqCKiBJ4Ob12XXBVtMY67oihKx
         Rdfo/4zho41YkUIDH9VSlRpn2VXOq8Vczmsiw0EyMATKmoyir3Nx9ErzQjIzJCELIPLf
         4Kbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778485914; x=1779090714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Fz3/iPbkPkVJpg+21eyeyZQXc8fO7eG+LOXjZ7wm054=;
        b=B6/L5K4g3/txxfSteakDVklfHvYfb8/W9fIdFxLHodDO4OIjYQMU6gTJFW2DzOZJBk
         r+duJueeg7vE/3dV6FbA1PXL++PNuj0ilN1U+YgvmZdYgI0YH9VbjjFoIRzLxJV2lmK6
         9S5IhSoBMIXBJoFAz+VufjR8DjfaCRRFwpIrLUlwu8Gn94c21uQE+NBDy5pNMoVe8QX5
         6xCNmezWDwCjtZ2nVeGLVrV0hHzWb56mEJaeP1PHxMSZIg4QuT0ev/LDPtAJSmZ+mQCA
         m0e6PpzpgQC4ZNMWik6GojjG4hYCsEs2Sf/XMEy+a4g+pmRni28Peu89f7ji43QsxZl/
         NFWQ==
X-Forwarded-Encrypted: i=1; AFNElJ/LBite8kf0wlN2sdLRmqrzKXy6WfqNMvcFH/aqkVCEO0M4lhPxODPdj/S9qC+2X3HeptEZouWobOX3iFtJzkOc@lists.infradead.org
X-Gm-Message-State: AOJu0YyNqGhBRPqljD2GL47mRKo0zIkCQM7qGiefv+HpHmqH1FPSI2GF
	szx8A13J8w665JcLAbLphDQEjtLYaAXUINb2V4VEeaDZQihGBJIqt8Uc
X-Gm-Gg: Acq92OGksKLZLdARMuG+4p6pqGdmdI0tZUfxGp6S1LC+li/gqRcjLUO/Epeo12X41oN
	k4ahdIZkpqFgTqbS4qTeHB4P9Cv9l4TYodaQ0t/4kSmOOqt66Yxf4rJfmDD2OJD4Gf2Wj7qLbjd
	mlHkbcL87qOqUtLS9Gvfpc3mZrgCauKOkEZHFTeTSamho1vf0VlWPhBD/xMaMZ9VN6/dS2n0dWE
	xDrHcgCW3BQtixKpF4V8LoQSmX2v6kG0yqyNxYH5hQX+KzQ/XxqbYbfQQIzHPF5r2Dt36XdvQRW
	uTdUaqrM8++gjeeIqGuqubuihCod8oFMJ36TTwIxdORWgrua07Nh7CPe9uCItadKOaIxSxShCQX
	rP/JLzPIVqEq1tggynuWSqrSRiqawNt1yjHmbyVkqfQRrdSjl9wqecJ3DI3cNGmMCg13pGPDu2E
	qbhfAAKUMSwt7a+z5evrSRB066IU4u+wEVzbYVuA5NOZnx9dAH4pxtmbtKVzao7YZ+EOVCAfOQb
	RDuxkzzCJm4
X-Received: by 2002:a05:6a00:2304:b0:837:8a0c:8f70 with SMTP id d2e1a72fcca58-83bb8691c49mr14478252b3a.28.1778485913610;
        Mon, 11 May 2026 00:51:53 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965d36a12sm17694642b3a.27.2026.05.11.00.51.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 00:51:53 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: zhengxingda@iscas.ac.cn,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	yclu4@nuvoton.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH 1/2] dt-bindings: display: verisilicon,dc: generalize for DCUltra Lite variant
Date: Mon, 11 May 2026 15:51:41 +0800
Message-ID: <20260511075142.54752-2-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260511075142.54752-1-a0987203069@gmail.com>
References: <20260511075142.54752-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_005154_820620_254B8585 
X-CRM114-Status: GOOD (  22.17  )
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

Extend the verisilicon,dc base schema to accommodate the Nuvoton MA35D1
DCUltra Lite (a previous generation of the DC8000 series) which has a
different clock topology, no reset control, and a single output.

- Replace the fixed clock/reset item lists with minItems/maxItems ranges
  so sub-schemas can enforce variant-specific constraints
- Add a 'port' property (single-port alias) alongside the existing 'ports'
  for single-output variants
- Remove the mandatory 'ports' requirement from the base schema; sub-schemas
  shall enforce their own port topology
- Add a 'select' stanza so the validator matches any node whose compatible
  contains a known Verisilicon DC string, including SoC-specific glue
- Relax additionalProperties to allow unevaluatedProperties enforcement in
  sub-schemas
- Fix a minor whitespace issue in the port@0 description

Add nuvoton,ma35d1-dcu.yaml as a sub-schema for the Nuvoton MA35D1 DCUltra
Lite display controller:

The Nuvoton MA35D1 integrates the Verisilicon DCUltra Lite display
controller. It is a single-output display controller with a 32-bit
RGB (DPI) interface. Unlike the DC8000, it does not have discoverable
chip identity registers, does not support the CONFIG_EX commit path,
and uses dedicated IRQ status/enable registers at offsets 0x147C/0x1480.
The clock topology uses two clocks (bus gate and pixel divider) and
does not require explicit reset control from the driver.

Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 .../bindings/display/nuvoton,ma35d1-dcu.yaml  | 94 +++++++++++++++++++
 .../bindings/display/verisilicon,dc.yaml      | 64 +++++++------
 2 files changed, 131 insertions(+), 27 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/nuvoton,ma35d1-dcu.yaml

diff --git a/Documentation/devicetree/bindings/display/nuvoton,ma35d1-dcu.yaml b/Documentation/devicetree/bindings/display/nuvoton,ma35d1-dcu.yaml
new file mode 100644
index 000000000000..9279004ae27c
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/nuvoton,ma35d1-dcu.yaml
@@ -0,0 +1,94 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/nuvoton,ma35d1-dcu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton MA35D1 DCUltra Lite display controller
+
+maintainers:
+  - Joey Lu <yclu4@nuvoton.com>
+
+description:
+  The Nuvoton MA35D1 integrates the Verisilicon DCUltra Lite display
+  controller. It is a single-output display controller with a 32-bit
+  RGB (DPI) interface.
+
+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - nuvoton,ma35d1-dcu
+  required:
+    - compatible
+
+allOf:
+  - $ref: http://devicetree.org/schemas/display/verisilicon,dc.yaml#
+
+properties:
+  compatible:
+    const: nuvoton,ma35d1-dcu
+
+  reg:
+    maxItems: 1
+    description:
+      Register range of the DCUltra Lite controller. The address space
+      is 0x2000 bytes.
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Bus clock that gates register access (DCU_GATE)
+      - description: Pixel clock divider for display timing (DCUP_DIV)
+
+  clock-names:
+    items:
+      - const: core
+      - const: pix0
+
+  resets:
+    maxItems: 1
+    description:
+      Optional reset for the display controller. The driver does not
+      assert or deassert this reset; it may be used by firmware or
+      boot loaders to bring the hardware to a clean state.
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description:
+      Output port to the downstream display device (e.g. RGB panel).
+      The DCUltra Lite supports a single parallel RGB output.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - port
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
+    #include <dt-bindings/reset/nuvoton,ma35d1-reset.h>
+
+    display@40260000 {
+        compatible = "nuvoton,ma35d1-dcu";
+        reg = <0x40260000 0x2000>;
+        interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&clk DCU_GATE>, <&clk DCUP_DIV>;
+        clock-names = "core", "pix0";
+        resets = <&sys MA35D1_RESET_DISP>;
+
+        port {
+            dpi_out: endpoint {
+                remote-endpoint = <&panel_in>;
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/display/verisilicon,dc.yaml b/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
index 9dc35ab973f2..00884529f8c1 100644
--- a/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
+++ b/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
@@ -9,15 +9,34 @@ title: Verisilicon DC-series display controllers
 maintainers:
   - Icenowy Zheng <uwu@icenowy.me>
 
+description:
+  Verisilicon DC-series display controllers.
+
+# Select any node whose compatible contains one of the known Verisilicon DC
+# or DC-derived compatible strings, including SoC-specific glue variants.
+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - verisilicon,dc
+          - thead,th1520-dc8200
+          - nuvoton,ma35d1-dcu
+  required:
+    - compatible
+
 properties:
   $nodename:
     pattern: "^display@[0-9a-f]+$"
 
   compatible:
-    items:
-      - enum:
-          - thead,th1520-dc8200
-      - const: verisilicon,dc # DC IPs have discoverable ID/revision registers
+    # Enumerated in full so the schema validator can verify any compatible
+    # string against this list, including those from child schemas.
+    contains:
+      enum:
+        - verisilicon,dc
+        - thead,th1520-dc8200
+        - nuvoton,ma35d1-dcu
 
   reg:
     maxItems: 1
@@ -26,32 +45,24 @@ properties:
     maxItems: 1
 
   clocks:
-    items:
-      - description: DC Core clock
-      - description: DMA AXI bus clock
-      - description: Configuration AHB bus clock
-      - description: Pixel clock of output 0
-      - description: Pixel clock of output 1
+    minItems: 2
+    maxItems: 5
 
   clock-names:
-    items:
-      - const: core
-      - const: axi
-      - const: ahb
-      - const: pix0
-      - const: pix1
+    minItems: 2
+    maxItems: 5
 
   resets:
-    items:
-      - description: DC Core reset
-      - description: DMA AXI bus reset
-      - description: Configuration AHB bus reset
+    minItems: 1
+    maxItems: 3
 
   reset-names:
-    items:
-      - const: core
-      - const: axi
-      - const: ahb
+    minItems: 1
+    maxItems: 3
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description: Single video output port for single-output variants.
 
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
@@ -59,7 +70,7 @@ properties:
     properties:
       port@0:
         $ref: /schemas/graph.yaml#/properties/port
-        description: The first output channel , endpoint 0 should be
+        description: The first output channel, endpoint 0 should be
           used for DPI format output and endpoint 1 should be used
           for DP format output.
 
@@ -75,9 +86,8 @@ required:
   - interrupts
   - clocks
   - clock-names
-  - ports
 
-additionalProperties: false
+additionalProperties: true
 
 examples:
   - |
-- 
2.43.0


