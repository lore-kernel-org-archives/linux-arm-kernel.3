Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69AE3CA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 00:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xkCZhodwr3RomP8vx5KfiL+DMYSIm6v8A61e1GuVIto=; b=n8JR+cFPmGWhD0SvjE2Ymou4Ou
	bcHBegvovgrOtBUkgoOq5smjwtl6EU9y3u6FwITyXMxNYLErA3mNN99esROQA6DHhYJ7am4oH9G6Q
	8R952ZWEi6JPwq9Xlo/R2WCN8rB9LgEu89I1p+r/GsizEhB9VsksxFlTRHvove3Kd1/iPIIB6lAvf
	iP9HEXkiiAZTmk6ujEVgfpQRC78ZfEG/IkUrOjOEFAtfk+lGFPONiqzwjA75FsJ89O4gSJPCxuEF2
	z7UuJXNCOoa76v/Lf8/CdM+C2PJDUh087SPv0FiSa4qeNGX5nkNWJNibCb5yZfdDDf9s1JjVOhNFM
	tRmQzVIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us9pa-00000007Doz-0Ytr;
	Sat, 30 Aug 2025 00:52:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us89I-000000070Ec-2Nlh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 23:04:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7F1FE6014D;
	Fri, 29 Aug 2025 23:04:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12622C4CEF0;
	Fri, 29 Aug 2025 23:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756508687;
	bh=lVy0nGCp4W9LsUGnCrLcZC8nGhc9aZD0sfWzO1ugqb0=;
	h=From:To:Cc:Subject:Date:From;
	b=n40IqzHf8NlGH+zlDQkwIjiMqxccwyPOgUi2Gb97TUhyJ0HxLOqJBAgDX/+Ruqrn2
	 VGsGBVNI6hYorMB0LNfKslKl/xi6j1aEkFz5hRGbFm1MrZiPpLVNItHg7mVbW0Uuom
	 yLXEkP8LY3BW/7XulqzHf4v6FbZy0xC4EHYRm0roxM3lCLz2QweX9EQVMczT6uTnXg
	 IXL0w2yvzWfotuDdrbCoAYa3kw44y185fDNL3IbiY6+EDuqEwNL3xyOuZ9D+IXFzVQ
	 wjvPjr8hfrAFVbxIiPjqDb13MgyUy2G318dovaYNXLWqU/hs5XByEtw7hU89n2o3/w
	 V0EV0ZL8fXwhg==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Joel Stanley <joel@jms.id.au>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Lee Jones <lee@kernel.org>
Cc: linux-aspeed@lists.ozlabs.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: gpu: Convert aspeed,ast2400-gfx to DT schema
Date: Fri, 29 Aug 2025 18:04:40 -0500
Message-ID: <20250829230442.1495926-1-robh@kernel.org>
X-Mailer: git-send-email 2.50.1
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

Convert the ASpeed GFX Display Controller binding to DT schema format.
There was a duplicate, incomplete binding in mfd which can be dropped.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/gpu/aspeed,ast2400-gfx.yaml      | 58 +++++++++++++++++++
 .../devicetree/bindings/gpu/aspeed-gfx.txt    | 41 -------------
 .../devicetree/bindings/mfd/aspeed-gfx.txt    | 17 ------
 MAINTAINERS                                   |  2 +-
 4 files changed, 59 insertions(+), 59 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpu/aspeed,ast2400-gfx.yaml
 delete mode 100644 Documentation/devicetree/bindings/gpu/aspeed-gfx.txt
 delete mode 100644 Documentation/devicetree/bindings/mfd/aspeed-gfx.txt

diff --git a/Documentation/devicetree/bindings/gpu/aspeed,ast2400-gfx.yaml b/Documentation/devicetree/bindings/gpu/aspeed,ast2400-gfx.yaml
new file mode 100644
index 000000000000..77ec5ad10ac6
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpu/aspeed,ast2400-gfx.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ASPEED GFX Display Controller
+
+maintainers:
+  - Joel Stanley <joel@jms.id.au>
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - aspeed,ast2500-gfx
+          - aspeed,ast2400-gfx
+      - const: syscon
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  memory-region:
+    maxItems: 1
+    description:
+      a reserved-memory region to use for the framebuffer.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - resets
+  - memory-region
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/aspeed-clock.h>
+
+    display@1e6e6000 {
+        compatible = "aspeed,ast2500-gfx", "syscon";
+        reg = <0x1e6e6000 0x1000>;
+        clocks = <&syscon ASPEED_CLK_GATE_D1CLK>;
+        resets = <&syscon ASPEED_RESET_CRT1>;
+        interrupts = <0x19>;
+        memory-region = <&gfx_memory>;
+    };
diff --git a/Documentation/devicetree/bindings/gpu/aspeed-gfx.txt b/Documentation/devicetree/bindings/gpu/aspeed-gfx.txt
deleted file mode 100644
index 958bdf962339..000000000000
--- a/Documentation/devicetree/bindings/gpu/aspeed-gfx.txt
+++ /dev/null
@@ -1,41 +0,0 @@
-Device tree configuration for the GFX display device on the ASPEED SoCs
-
-Required properties:
-  - compatible
-    * Must be one of the following:
-      + aspeed,ast2500-gfx
-      + aspeed,ast2400-gfx
-    * In addition, the ASPEED pinctrl bindings require the 'syscon' property to
-      be present
-
-  - reg: Physical base address and length of the GFX registers
-
-  - interrupts: interrupt number for the GFX device
-
-  - clocks: clock number used to generate the pixel clock
-
-  - resets: reset line that must be released to use the GFX device
-
-  - memory-region:
-    Phandle to a memory region to allocate from, as defined in
-    Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
-
-
-Example:
-
-gfx: display@1e6e6000 {
-	compatible = "aspeed,ast2500-gfx", "syscon";
-	reg = <0x1e6e6000 0x1000>;
-	reg-io-width = <4>;
-	clocks = <&syscon ASPEED_CLK_GATE_D1CLK>;
-	resets = <&syscon ASPEED_RESET_CRT1>;
-	interrupts = <0x19>;
-	memory-region = <&gfx_memory>;
-};
-
-gfx_memory: framebuffer {
-	size = <0x01000000>;
-	alignment = <0x01000000>;
-	compatible = "shared-dma-pool";
-	reusable;
-};
diff --git a/Documentation/devicetree/bindings/mfd/aspeed-gfx.txt b/Documentation/devicetree/bindings/mfd/aspeed-gfx.txt
deleted file mode 100644
index aea5370efd97..000000000000
--- a/Documentation/devicetree/bindings/mfd/aspeed-gfx.txt
+++ /dev/null
@@ -1,17 +0,0 @@
-* Device tree bindings for Aspeed SoC Display Controller (GFX)
-
-The Aspeed SoC Display Controller primarily does as its name suggests, but also
-participates in pinmux requests on the g5 SoCs. It is therefore considered a
-syscon device.
-
-Required properties:
-- compatible:		"aspeed,ast2500-gfx", "syscon"
-- reg:			contains offset/length value of the GFX memory
-			region.
-
-Example:
-
-gfx: display@1e6e6000 {
-	compatible = "aspeed,ast2500-gfx", "syscon";
-	reg = <0x1e6e6000 0x1000>;
-};
diff --git a/MAINTAINERS b/MAINTAINERS
index 11a58d3279ec..536a0403edda 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7592,7 +7592,7 @@ M:	Joel Stanley <joel@jms.id.au>
 L:	linux-aspeed@lists.ozlabs.org (moderated for non-subscribers)
 S:	Supported
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
-F:	Documentation/devicetree/bindings/gpu/aspeed-gfx.txt
+F:	Documentation/devicetree/bindings/gpu/aspeed,ast2400-gfx.yaml
 F:	drivers/gpu/drm/aspeed/
 
 DRM DRIVER FOR AST SERVER GRAPHICS CHIPS
-- 
2.50.1


