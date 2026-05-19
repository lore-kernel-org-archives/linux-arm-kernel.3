Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1AB9CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 05:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uErCr9zi75Tnls+mLi86yEzEO9RwxFHR5lw/x24Nf98=; b=EdbJj8Haizy6ggzWXyjO2C8HnE
	AnGhS6BwnrZ70aTME7k2aDWuxk/4CAH2WL4UUNP6j/wGDudxulhSNeXvVkdQDhW3x6dPx7uWy1br+
	Wajkwqc5OmZOds3WE48iHRbLO5gbfjGTky9mz5B2NqgCy//HH1a66D46sG2iJI3ku+9biHbFLXwPe
	B2S1jrJZRSB5MQhu+RrfFH32cKDvad0Vuv8l7Iqr/Og8Up7JiV6rWBFU8RlxcOQwxpfVUPsfREK/S
	H6/2yohbAx+w24LPKBAiB074PWEIjw2pMwDvXPxntpTJXHJ9V7rQMZw9ZtTn2xCUAi1KMR3bmmzyh
	mN0zt14A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPDN8-00000000F1F-1r9w;
	Tue, 19 May 2026 05:52:06 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPDN4-00000000Ezn-1hOd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 05:52:03 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-83ef8b48f94so2341654b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 22:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779169921; x=1779774721; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uErCr9zi75Tnls+mLi86yEzEO9RwxFHR5lw/x24Nf98=;
        b=rm2gMYF6Nls7+ZK5XHRLiv4GiE//0CjfdxwaWOXH9DDCaQJyvCXpQCUwBvytx3CDvL
         OpgSylk4521lTgx6xqKLSYBhAEJnA4C/vbwGOdYSs4B8lQh9rO6grY0wYTMhjddCEm67
         Y75232Glp/wB2uWk4A9wC7ZeKiJDwmAkmm4p1QGHgLIIBmz8J1E0C+dQQ0ABgC8lsj27
         4qegkMWEPBAQ2Lvv6tmsQJB4/LiI1/8RpOdK5p8LMibAfPBXC+JBup6gHcOxHHWTdJ/3
         ZalSu1OXl+AecVS0F5iizjpS/WJAFwzJUomaHCn2MKOw4utVmh6akeoU8MKmZh/XfT3V
         bk5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779169921; x=1779774721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uErCr9zi75Tnls+mLi86yEzEO9RwxFHR5lw/x24Nf98=;
        b=jObrE5Pfyatw98y7OIVHOfp++5sIuN/QiFccUiFhGvTnUIqUuKe8SqORmMVoEICVCq
         tcYYvu580CI6U0EjoWGfibA1nXAKBOMQ3YU8sE1TzPXtnb6LvrQd3RFQPcnJNhU88UAm
         QA/P52foEHK134diCF7Q2pIAhmbuU2PVnwy9rOYntlGUO4i7NhW3LT3Wdm4bJ+/kbh94
         1pVX65JnIvTUq/11YlVf79ZGojK5YEWMfBz6doosMMOdvnM/FXX0uy4kntW8XIdFKGVm
         K+tVGU5Kod4GMDbMdm2pK8bil4jrckliUH85FQ4Xjbqlxj2CojTDzXtw9yU8yo5r0x5m
         BVsw==
X-Forwarded-Encrypted: i=1; AFNElJ9U0x72N7I+PSdoLILkIN277OZILU86tH5kDjmo8yMP4Q9T3sYhkvewSD5AoX5xoucVt8QCogRCgXzzynPCdrfl@lists.infradead.org
X-Gm-Message-State: AOJu0Yzs47GY+xJs/irafnmuzZ90Gt553c/GCzpnqCPHVx/3Ps9L7Niv
	MNBNvYZpDGtyGHEDelr71GkC94HVJJkUeJoClbrgaXDz9dv3YJhZDkik
X-Gm-Gg: Acq92OHaMic4GyGEjuwWjNvs4K1kmbb4rAflvJbCXpikKTOMOz1k2ud7D2nqvn03QMb
	9sVeUTSztG9c2ypp1LprUa5226W9YT+7mJbdb3SJkVIPsviMwyfa7B/sQyVd2xgmzESEPVeAZQ6
	sglTr2ZSM/inZvMfchsbKyQhvzV9u312LTGCURGGqPSw+YlHrcsHH8duEV4XohEvB5dZ2nytc1Y
	azR1PIvP08URWwIk+ov/KGcE7PFFIm7xrBLS2V0V7kaW6qRHwP7FNlD9XNielC1tJq99Dpdg5J0
	t5WViHbJBxjqynpCF7uGIUO8kEuiuPHRsDRT+qdWIcQAgk8Udg0RiBlAtqzD4WXwjFFk2dQPsBp
	MRWrnOC5zT1S+ZvxEc3RLpeauI/vus+cXkrNwXf0FQNOGbqG0TgY5byQC5BiJP6B9K7lSM7wp8H
	whUquDYGG8FpwLcfhjmc8ChdVYh876mHPH43cqzypXVDG37zM8Vta03rDfUiCkmkixoQyDp1Pn5
	s7/upd7FCeg
X-Received: by 2002:a05:6a00:299a:b0:83b:c487:43d2 with SMTP id d2e1a72fcca58-83f33df451fmr18417039b3a.36.1779169921605;
        Mon, 18 May 2026 22:52:01 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f8b9c2ea5sm2641252b3a.13.2026.05.18.22.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 22:52:01 -0700 (PDT)
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
Subject: [PATCH v2 1/4] dt-bindings: display: verisilicon,dc: generalize for  single-output variants
Date: Tue, 19 May 2026 13:51:06 +0800
Message-ID: <20260519055114.1886525-2-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260519055114.1886525-1-a0987203069@gmail.com>
References: <20260519055114.1886525-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_225202_448669_F8220098 
X-CRM114-Status: GOOD (  14.85  )
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

The existing schema assumes a fixed clock/reset topology and dual-output
port structure matching the DC8200 IP block.  This prevents reuse for
single-output variants such as the Verisilicon DCU Lite used in the
Nuvoton MA35D1 SoC.

Rework the schema so that variant-specific constraints are expressed
via allOf/if-then-else:

- The thead,th1520-dc8200 compatible keeps its existing five-clock,
  three-reset, dual-port requirements.

- A standalone verisilicon,dc compatible covers IPs whose identity is
  discovered entirely through hardware registers; these have flexible
  clock and reset counts, a single 'port' property, and no 'ports'
  requirement.

Changes to the base schema:
- Replace the fixed clock/reset items lists with minItems/maxItems
  ranges; variant sub-schemas tighten the constraints via if-then-else.
- Add a 'port' property (graph.yaml single-port alias) alongside the
  existing 'ports', for single-output variants.
- Drop the unconditional 'ports' requirement; each if-branch enforces
  its own port topology.
- Tighten additionalProperties to unevaluatedProperties to allow
  per-variant schemas to add their own constraints cleanly.
- Fix a stray space in the port@0 description.
- Add a DT example for the generic verisilicon,dc compatible
  (Nuvoton MA35D1 DCU Lite).

Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 .../bindings/display/verisilicon,dc.yaml      | 135 ++++++++++++++----
 1 file changed, 108 insertions(+), 27 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/verisilicon,dc.yaml b/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
index 9dc35ab973f2..3a814c2e083e 100644
--- a/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
+++ b/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
@@ -14,10 +14,12 @@ properties:
     pattern: "^display@[0-9a-f]+$"
 
   compatible:
-    items:
-      - enum:
-          - thead,th1520-dc8200
-      - const: verisilicon,dc # DC IPs have discoverable ID/revision registers
+    oneOf:
+      - items:
+          - enum:
+              - thead,th1520-dc8200
+          - const: verisilicon,dc
+      - const: verisilicon,dc  # DC IPs have discoverable ID/revision registers
 
   reg:
     maxItems: 1
@@ -26,32 +28,24 @@ properties:
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
@@ -59,7 +53,7 @@ properties:
     properties:
       port@0:
         $ref: /schemas/graph.yaml#/properties/port
-        description: The first output channel , endpoint 0 should be
+        description: The first output channel, endpoint 0 should be
           used for DPI format output and endpoint 1 should be used
           for DP format output.
 
@@ -75,9 +69,75 @@ required:
   - interrupts
   - clocks
   - clock-names
-  - ports
 
-additionalProperties: false
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: thead,th1520-dc8200
+    then:
+      properties:
+        clocks:
+          items:
+            - description: DC Core clock
+            - description: DMA AXI bus clock
+            - description: Configuration AHB bus clock
+            - description: Pixel clock of output 0
+            - description: Pixel clock of output 1
+
+        clock-names:
+          items:
+            - const: core
+            - const: axi
+            - const: ahb
+            - const: pix0
+            - const: pix1
+
+        resets:
+          items:
+            - description: DC Core reset
+            - description: DMA AXI bus reset
+            - description: Configuration AHB bus reset
+
+        reset-names:
+          items:
+            - const: core
+            - const: axi
+            - const: ahb
+
+      required:
+        - ports
+
+    else:
+      properties:
+        clocks:
+          items:
+            - description: Bus clock that gates register access
+            - description: Pixel clock divider for display timing
+
+        clock-names:
+          items:
+            - const: core
+            - const: pix0
+
+        resets:
+          maxItems: 1
+          description:
+            Reset line for the display controller.
+
+        reset-names:
+          items:
+            - const: core
+
+      required:
+        - port
+
+      not:
+        required:
+          - ports
+
+unevaluatedProperties: false
 
 examples:
   - |
@@ -120,3 +180,24 @@ examples:
         };
       };
     };
+
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
+    #include <dt-bindings/reset/nuvoton,ma35d1-reset.h>
+
+    display@40260000 {
+        compatible = "verisilicon,dc";
+        reg = <0x40260000 0x20000>;
+        interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&clk DCU_GATE>, <&clk DCUP_DIV>;
+        clock-names = "core", "pix0";
+        resets = <&sys MA35D1_RESET_DISP>;
+        reset-names = "core";
+
+        port {
+            dpi_out: endpoint {
+                remote-endpoint = <&panel_in>;
+            };
+        };
+    };
-- 
2.43.0


