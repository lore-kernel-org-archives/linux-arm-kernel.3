Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD062F588C1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 12:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4SrW3DGZA3mD4JpOI7eLmRN3gzb5/GAWX8KXl7C+EUQ=; b=RcC6SRA+pM29L4JTIpt1mLbcTz
	GcFgHjBorC+/ty/xBdvEGwiaLpNRVI4n+g6feZsN5XgQJJYw6wcAjSBw7/KSzyhfnW0hrqoG8I6gQ
	H6yz0GToDKUL0QFWBQVw2oUrX7NkhKQn3bk7Oq0IDXMuIcKpdjMwwzhpBaIDVE0cSo9PFxPM8srOD
	RyMoDMUhKfBGfk18kg8kc+4l7IqYf6LeHxATDKSTqjbM6jH74bsOMoGQBdNx0CzUvIAO63UnKZ9ge
	Yle3+uBb26iCHemv5UFTTck8fm/7GP5wNKy7F0WF/3HcWUWREAy0esyzbhylnPq93pwXhj/cqXAgo
	S30IGO4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEo9B-00000006usz-1D2o;
	Mon, 20 Apr 2026 12:54:41 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEo97-00000006urI-2urj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 12:54:39 +0000
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7C9F4265D;
	Mon, 20 Apr 2026 14:52:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1776689578;
	bh=BQkAQsRSJV/BKvqWkVDSbgZZF5KbSieZBvu6S74X2tg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Tip7VlqJPlE+7zUiS0g1vPCTn1ZQPmZoB7I8WqIEn9XCf4hB49mpw8zitbAJVgE6V
	 LP6bYfHkYN8iMVLG0ZE6R0j4yCePTLure1xO1tIu8UuPW32F4RIzaJL6njGuo/3Cjl
	 Mos8uhwcYLwTeWjtX2XrPdPP0QA2xG4IB6nB5dME=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Mon, 20 Apr 2026 15:54:08 +0300
Subject: [PATCH 01/15] dt-bindings: display: ti: Move ti,am62l-dss binding
 to a new binding file
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-beagley-ai-display-v1-1-f628543dfd14@ideasonboard.com>
References: <20260420-beagley-ai-display-v1-0-f628543dfd14@ideasonboard.com>
In-Reply-To: <20260420-beagley-ai-display-v1-0-f628543dfd14@ideasonboard.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Aradhya Bhatia <aradhya.bhatia@linux.dev>, Nishanth Menon <nm@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Swamil Jain <s-jain1@ti.com>, 
 Devarsh Thakkar <devarsht@ti.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=10239;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=BQkAQsRSJV/BKvqWkVDSbgZZF5KbSieZBvu6S74X2tg=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBp5iID3NURbXzJgkljXH7TV5ZqVjLrIRPA0UhDt
 yQV2Zx7qDiJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaeYiAwAKCRD6PaqMvJYe
 9eZtD/9ONa0f5GJXPjqZNArWC0sZjeUmoLQ/Dgl4yhbcUcOmqlzss+e+4zKDPr0uy7xdtBItR27
 fvo6Gri97PfPvl3hGLfQIks1b0d6xOSmghbDhKWcVdNKOwd7xCvPtE2J6RYXK+Kx9VGmH6PbQEa
 LJrEHmk7C3SYgLiBEa/ad/8QaVfjMzmjyDLlGAANccwrhr2ZUUHHCpOOV2SkOPpsujAGnWxAQHJ
 kqC33cNTmkRP+ssAO1rlD+L5EterTaRTzVQGmETaqJ6p1BR+wMN2V8SWTCGpfK8vaRpu1xlYNUm
 5Om4uL/2mFhrEz1JZEjV2jOSsDyl1JMqYoSDBnjNTz78kC+Kp85fLCK4LEcN5ZkvvRv0DXw2/iE
 zzB3m4nnI+5Ev30jgk2fbRWin56Z+lyilHzubvPVDKf7vpCsrLvmBYuFbzeaAoozqGLd9ZxcMdB
 LCkme4jv6xzTHwCQw+fn+/xgGXSAYwxUneO9RLpDU2l8JjxDzeIQ6XsEVaFh42SyepQE/y6c3Yq
 QpZE//egF+Ce4CJLHIVc2gNX9qsJ5ScMK95Wfa1izkDFptNZ9NiaFmEUAsFVI2TqRzLrUI62KRi
 miwjswibOj79TD5F5rirT4098GMpEiI4LBAPtjFahGheX6iC1uJCu6fMOoh2tR/0PVMFK7xi5O+
 T8zjQw2F8l/ic1g==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_055438_084963_5BDEC53C 
X-CRM114-Status: GOOD (  22.28  )
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

We currently have two binding files for different TI K3 DSS versions:
ti,j721e-dss.yaml which contains bindings for the "full" DSS version,
with four planes and outputs, and ti,am65x-dss.yaml which used to
contain bindings for the "lite" DSS version, with two planes and
outputs.

ti,am62l-dss binding was added recently to the ti,am65x-dss.yaml file,
which only has a single plane and a single output. To keep with the
above "binding file per DSS model" style, and to simplify the
ti,am65x-dss.yaml file, let's move the ti,am62l-dss to a separate, new
file.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 .../bindings/display/ti/ti,am62l-dss.yaml          | 136 +++++++++++++++++++++
 .../bindings/display/ti/ti,am65x-dss.yaml          |  94 +++-----------
 MAINTAINERS                                        |   1 +
 3 files changed, 156 insertions(+), 75 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/ti/ti,am62l-dss.yaml b/Documentation/devicetree/bindings/display/ti/ti,am62l-dss.yaml
new file mode 100644
index 000000000000..ce6185dca18d
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/ti/ti,am62l-dss.yaml
@@ -0,0 +1,136 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2026 Texas Instruments Incorporated
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/ti/ti,am62l-dss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments AM62L Display Subsystem
+
+maintainers:
+  - Tomi Valkeinen <tomi.valkeinen@ti.com>
+
+description: |
+  The AM62L display subsystem is a cut-down version of the TI Keystone
+  Display SubSystem. It has a single output port which supports DPI
+  format and a single video "lite plane" which does not support scaling.
+  The output port is routed to the SoC boundary via the DPI interface,
+  and the same DPI signals are also routed internally to the DSI Tx
+  controller present within the SoC. Due to clocking limitations only
+  one of the interfaces (DSI or DPI) can be used at a time.
+
+properties:
+  compatible:
+    const: ti,am62l-dss
+
+  reg:
+    description:
+      Addresses to each DSS memory region described in the SoC's TRM.
+    items:
+      - description: common DSS register area
+      - description: VIDL1 light video plane
+      - description: OVR1 overlay manager for vp1
+      - description: VP1 video port 1
+      - description: common1 DSS register area
+
+  reg-names:
+    items:
+      - const: common
+      - const: vidl1
+      - const: ovr1
+      - const: vp1
+      - const: common1
+
+  clocks:
+    items:
+      - description: fck DSS functional clock
+      - description: vp1 Video Port 1 pixel clock
+
+  clock-names:
+    items:
+      - const: fck
+      - const: vp1
+
+  assigned-clocks:
+    minItems: 1
+    maxItems: 2
+
+  assigned-clock-parents:
+    minItems: 1
+    maxItems: 2
+
+  interrupts:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+    description: phandle to the associated power domain
+
+  dma-coherent: true
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          The DSS DPI output port node from video port 1, which may be
+          connected to the external DPI pins or to the internal DSI Tx
+          controller.
+
+    required:
+      - port@0
+
+  max-memory-bandwidth:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Input memory (from main memory to dispc) bandwidth limit in
+      bytes per second
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - interrupts
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    bus {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        dss: dss@30200000 {
+            compatible = "ti,am62l-dss";
+            reg = <0x00 0x30200000 0x00 0x1000>, /* common */
+                  <0x00 0x30202000 0x00 0x1000>, /* vidl1 */
+                  <0x00 0x30207000 0x00 0x1000>, /* ovr1 */
+                  <0x00 0x3020a000 0x00 0x1000>, /* vp1 */
+                  <0x00 0x30201000 0x00 0x1000>; /* common1 */
+            reg-names = "common", "vidl1", "ovr1", "vp1", "common1";
+            power-domains = <&scmi_pds 39>;
+            clocks = <&scmi_clk 162>,
+                     <&scmi_clk 161>;
+            clock-names = "fck", "vp1";
+            interrupts = <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                port@0 {
+                    reg = <0>;
+                    dpi0_out: endpoint {
+                        remote-endpoint = <&dsi_in>;
+                    };
+                };
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
index 49a007cbcd3a..75d9640398f0 100644
--- a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
+++ b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
@@ -18,68 +18,45 @@ description: |
   internally routed to 2 OLDI TXes. The second video port supports DPI
   format. The first plane is full video plane with all features and the
   second is a "lite plane" without scaling support.
-  The AM62L display subsystem has a single output port which supports DPI
-  format but it only supports single video "lite plane" which does not support
-  scaling. The output port is routed to SoC boundary via DPI interface and same
-  DPI signals are also routed internally to DSI Tx controller present within the
-  SoC. Due to clocking limitations only one of the interface i.e. either DSI or
-  DPI can be used at once.
 
 properties:
   compatible:
     enum:
       - ti,am625-dss
       - ti,am62a7-dss
-      - ti,am62l-dss
       - ti,am65x-dss
 
   reg:
     description:
       Addresses to each DSS memory region described in the SoC's TRM.
-    oneOf:
-      - items:
-          - description: common DSS register area
-          - description: VIDL1 light video plane
-          - description: VID video plane
-          - description: OVR1 overlay manager for vp1
-          - description: OVR2 overlay manager for vp2
-          - description: VP1 video port 1
-          - description: VP2 video port 2
-          - description: common1 DSS register area
-      - items:
-          - description: common DSS register area
-          - description: VIDL1 light video plane
-          - description: OVR1 overlay manager for vp1
-          - description: VP1 video port 1
-          - description: common1 DSS register area
+    items:
+      - description: common DSS register area
+      - description: VIDL1 light video plane
+      - description: VID video plane
+      - description: OVR1 overlay manager for vp1
+      - description: OVR2 overlay manager for vp2
+      - description: VP1 video port 1
+      - description: VP2 video port 2
+      - description: common1 DSS register area
 
   reg-names:
-    oneOf:
-      - items:
-          - const: common
-          - const: vidl1
-          - const: vid
-          - const: ovr1
-          - const: ovr2
-          - const: vp1
-          - const: vp2
-          - const: common1
-      - items:
-          - const: common
-          - const: vidl1
-          - const: ovr1
-          - const: vp1
-          - const: common1
+    items:
+      - const: common
+      - const: vidl1
+      - const: vid
+      - const: ovr1
+      - const: ovr2
+      - const: vp1
+      - const: vp2
+      - const: common1
 
   clocks:
-    minItems: 2
     items:
       - description: fck DSS functional clock
       - description: vp1 Video Port 1 pixel clock
       - description: vp2 Video Port 2 pixel clock
 
   clock-names:
-    minItems: 2
     items:
       - const: fck
       - const: vp1
@@ -113,8 +90,6 @@ properties:
           For AM625 DSS, the internal DPI output port node from video
           port 1.
           For AM62A7 DSS, the port is tied off inside the SoC.
-          For AM62L DSS, the DSS DPI output port node from video port 1
-          or DSI Tx controller node connected to video port 1.
         properties:
           endpoint@0:
             $ref: /schemas/graph.yaml#/properties/endpoint
@@ -189,38 +164,7 @@ allOf:
       properties:
         compatible:
           contains:
-            const: ti,am62l-dss
-    then:
-      properties:
-        ports:
-          properties:
-            port@1: false
-        reg:
-          maxItems: 5
-        reg-names:
-          maxItems: 5
-        clocks:
-          maxItems: 2
-        clock-names:
-          maxItems: 2
-    else:
-      properties:
-        reg:
-          minItems: 8
-        reg-names:
-          minItems: 8
-        clocks:
-          minItems: 3
-        clock-names:
-          minItems: 3
-
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - ti,am62l-dss
-              - ti,am65x-dss
+            const: ti,am65x-dss
     then:
       properties:
         oldi-transmitters: false
diff --git a/MAINTAINERS b/MAINTAINERS
index d1cc0e12fe1f..902502e1d63c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8756,6 +8756,7 @@ L:	dri-devel@lists.freedesktop.org
 S:	Maintained
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/ti/ti,am625-oldi.yaml
+F:	Documentation/devicetree/bindings/display/ti/ti,am62l-dss.yaml
 F:	Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
 F:	Documentation/devicetree/bindings/display/ti/ti,j721e-dss.yaml
 F:	Documentation/devicetree/bindings/display/ti/ti,k2g-dss.yaml

-- 
2.43.0


