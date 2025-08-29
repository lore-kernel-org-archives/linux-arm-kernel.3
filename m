Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C0A4CA0FF9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 00:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PclyMMgbbDGjur67rW5mJJ9OrsByZ4KCKPvr04JE9L8=; b=O0GJxYdoZbAVPYPc5BjYtwNTRB
	BOegXBVAOX7ltOi2OM2u28AHDOBaxYamomQ6v09/Y8BHtYmQLMfoNHXA1YPbhovLqYV9FWs6Q5C5W
	LpH7eG2boE8dj2un2GphfygzB+7FWAIxjA2h50fVvVxry2JwkECRjw7IFjs9LEoFYMqVoulJrZjwN
	tN/knJPUCUcJeTaqDB3Bu8xSDiLMeNxjIFa3cevGTRHqSlIb48IQOty59B3dMQbmSN3E0sC1Zb+Sf
	oPUmTssfQwYTuMaLGX7mjMgq9vH1HBNb/kt1nmulGW+obOc68XBaS2N/cw7izB0o/de/ZDK6Sz4l5
	QWJIENjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us9pd-00000007Dsv-1hs5;
	Sat, 30 Aug 2025 00:52:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us89Q-000000070GI-0jMv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 23:04:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E568543D9D;
	Fri, 29 Aug 2025 23:04:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AA53C4CEF0;
	Fri, 29 Aug 2025 23:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756508695;
	bh=cKMacLufL0Sp3xKcp2iVoauAa71+tRMKOtJUQm7TvL8=;
	h=From:To:Cc:Subject:Date:From;
	b=VQWJI8lunJdXCat2wSxvf1PIhGKg4VXqvOMHKs1L/fyq2QteJo8FIXHCA0V85r81X
	 GInwbhqCJ7F1ejqHbzMMDPfRLMCDQBt5nrV1kXSwXJMO3NZm0jlUYkc0P3kvn9MCm+
	 9I3ebWWQQ3+rHdTZ/Mej30ZJHmGFag4zXBZyH9fN57IEnLjUHveG0GZ07vNxdjQiWh
	 iqIaA8qgF1QFZNVmAj8hD+FNrllDuy590NmEFJUtO7xeedVW6S05LipOQ/tYgE/zFp
	 lSTr1SIVMYbYdB+7hXc7liv+zIeomgASI4gTb6dNTxnTT5KcwSHrXVH3Lz5jkIy1hF
	 6bDnrOTMNcB6Q==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Lee Jones <lee@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Andrew Jeffery <andrew@aj.id.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: mfd: Convert aspeed,ast2400-p2a-ctrl to DT schema
Date: Fri, 29 Aug 2025 18:04:49 -0500
Message-ID: <20250829230450.1496151-1-robh@kernel.org>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_160456_254047_1DEB16CB 
X-CRM114-Status: GOOD (  17.17  )
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

Convert the aspeed,ast2x00-p2a-ctrl binding to DT schema format. The schema
is simple enough to just add it to the parent aspeed,ast2x00-scu binding.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/mfd/aspeed,ast2x00-scu.yaml      | 33 ++++++++++++-
 .../bindings/misc/aspeed-p2a-ctrl.txt         | 46 -------------------
 2 files changed, 32 insertions(+), 47 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/misc/aspeed-p2a-ctrl.txt

diff --git a/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml b/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml
index 5eccd10d95ce..5adb7f6aca45 100644
--- a/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml
+++ b/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml
@@ -48,8 +48,34 @@ properties:
 
 patternProperties:
   '^p2a-control@[0-9a-f]+$':
-    description: See Documentation/devicetree/bindings/misc/aspeed-p2a-ctrl.txt
+    description: >
+      PCI-to-AHB Bridge Control
+
+      The bridge is available on platforms with the VGA enabled on the Aspeed
+      device. In this case, the host has access to a 64KiB window into all of
+      the BMC's memory. The BMC can disable this bridge. If the bridge is
+      enabled, the host has read access to all the regions of memory, however
+      the host only has read and write access depending on a register
+      controlled by the BMC.
     type: object
+    additionalProperties: false
+
+    properties:
+      compatible:
+        enum:
+          - aspeed,ast2400-p2a-ctrl
+          - aspeed,ast2500-p2a-ctrl
+      reg:
+        maxItems: 1
+
+      memory-region:
+        maxItems: 1
+        description:
+          A reserved_memory region to be used for the PCI to AHB mapping
+
+    required:
+      - compatible
+      - reg
 
   '^pinctrl(@[0-9a-f]+)?$':
     type: object
@@ -123,6 +149,11 @@ examples:
         #size-cells = <1>;
         ranges = <0x0 0x1e6e2000 0x1000>;
 
+        p2a-control@2c {
+            compatible = "aspeed,ast2400-p2a-ctrl";
+            reg = <0x2c 0x4>;
+        };
+
         silicon-id@7c {
             compatible = "aspeed,ast2500-silicon-id", "aspeed,silicon-id";
             reg = <0x7c 0x4>, <0x150 0x8>;
diff --git a/Documentation/devicetree/bindings/misc/aspeed-p2a-ctrl.txt b/Documentation/devicetree/bindings/misc/aspeed-p2a-ctrl.txt
deleted file mode 100644
index f2e2e28b317c..000000000000
--- a/Documentation/devicetree/bindings/misc/aspeed-p2a-ctrl.txt
+++ /dev/null
@@ -1,46 +0,0 @@
-======================================================================
-Device tree bindings for Aspeed AST2400/AST2500 PCI-to-AHB Bridge Control Driver
-======================================================================
-
-The bridge is available on platforms with the VGA enabled on the Aspeed device.
-In this case, the host has access to a 64KiB window into all of the BMC's
-memory.  The BMC can disable this bridge.  If the bridge is enabled, the host
-has read access to all the regions of memory, however the host only has read
-and write access depending on a register controlled by the BMC.
-
-Required properties:
-===================
-
- - compatible: must be one of:
-	- "aspeed,ast2400-p2a-ctrl"
-	- "aspeed,ast2500-p2a-ctrl"
-
-Optional properties:
-===================
-
-- reg: A hint for the memory regions associated with the P2A controller
-- memory-region: A phandle to a reserved_memory region to be used for the PCI
-		to AHB mapping
-
-The p2a-control node should be the child of a syscon node with the required
-property:
-
-- compatible : Should be one of the following:
-		"aspeed,ast2400-scu", "syscon", "simple-mfd"
-		"aspeed,ast2500-scu", "syscon", "simple-mfd"
-
-Example
-===================
-
-g4 Example
-----------
-
-syscon: scu@1e6e2000 {
-	compatible = "aspeed,ast2400-scu", "syscon", "simple-mfd";
-	reg = <0x1e6e2000 0x1a8>;
-
-	p2a: p2a-control {
-		compatible = "aspeed,ast2400-p2a-ctrl";
-		memory-region = <&reserved_memory>;
-	};
-};
-- 
2.50.1


