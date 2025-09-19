Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EA72CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 19:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QvzknwcqOGAIf0MQXaclEmaRkfVstN6hzNjrF+yWVco=; b=BQImTGGg6Dvqx9u6wKPP/QKRV2
	kBw3rck5ee9Wu2oeXBUh+G9v/qVvdGK3ULVWb2pn0lblTW6SPSRezXj8VYLUPe+v0hsEnLGRRAw7M
	MddAl1woNaLm9t6+niJVnpQ/DftKV0Oxcm1cj+oYmw5iIs9KZplVW7sMSzijg5WQMstMudlWkGUkd
	K12UMKFimrDxVVrPy25ps5rotgnGrdPhhMyQi9iXQXm3FFQfPrRFMgp/yLEHtM+IQShMOD1SQa4DS
	+Z7urkQTGRFWkc80IKeEvy3/+FwnzVYaGXO+AbEJzBWW6QsujmZj4AU2qcsjoKY49IY60l7YUGFvu
	AXmSTO5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzhAq-00000003wFd-0nin;
	Fri, 19 Sep 2025 19:53:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzhAm-00000003wF5-3dA7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 19:53:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1A85E44A19;
	Fri, 19 Sep 2025 19:53:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FE43C4CEF7;
	Fri, 19 Sep 2025 19:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758311616;
	bh=BhNfeUjBhFH3Y3XO7HytlVMbwMMe+nuaGzu6cpTp5HM=;
	h=From:To:Cc:Subject:Date:From;
	b=Hz3mMJ8rxvRkBOSq9Jl5+9krcajggcFHmyy/8scaXT+Kvjirh6Fh8Ylsyv2h56ulQ
	 46cQAlRB1NWdUxXmIX3+WMHHTgSKp0uyXRSO0gZ3oYtrt3tXwfPEKDOPYCfWkaY0qz
	 ryUgP1C4NloC6qW9/EWMgVU3ISCij13e18BPdHW7Q5zrQ63AmU0wJhiw0Kg2/X+1Tp
	 HT8VH//kDlU3vIY61E0eqATpUFLgRpMce/4wcV9G1DCl2tfu9jWOes3G5vmGDoEWkt
	 rqnDkyzqO1uY1cmstFFfI1tp13naHvdenJ8dTBuFFieSs6jXWQhtcaWs40Fyw6plaI
	 tZHYct2FIXyxg==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Stefan Schaeckeler <sschaeck@cisco.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: edac: Convert aspeed,ast2400-sdram-edac to DT schema
Date: Fri, 19 Sep 2025 14:53:24 -0500
Message-ID: <20250919195326.2079446-1-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_125336_942686_493FE23D 
X-CRM114-Status: GOOD (  15.52  )
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

Convert the ASpeed SDRAM EDAC binding to DT schema. It's a
straight-forward conversion.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../edac/aspeed,ast2400-sdram-edac.yaml       | 48 +++++++++++++++++++
 .../bindings/edac/aspeed-sdram-edac.txt       | 28 -----------
 MAINTAINERS                                   |  2 +-
 3 files changed, 49 insertions(+), 29 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/edac/aspeed,ast2400-sdram-edac.yaml
 delete mode 100644 Documentation/devicetree/bindings/edac/aspeed-sdram-edac.txt

diff --git a/Documentation/devicetree/bindings/edac/aspeed,ast2400-sdram-edac.yaml b/Documentation/devicetree/bindings/edac/aspeed,ast2400-sdram-edac.yaml
new file mode 100644
index 000000000000..09735826d707
--- /dev/null
+++ b/Documentation/devicetree/bindings/edac/aspeed,ast2400-sdram-edac.yaml
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/edac/aspeed,ast2400-sdram-edac.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Aspeed BMC SoC SDRAM EDAC controller
+
+maintainers:
+  - Stefan Schaeckeler <sschaeck@cisco.com>
+
+description: >
+  The Aspeed BMC SoC supports DDR3 and DDR4 memory with and without ECC (error
+  correction check).
+
+  The memory controller supports SECDED (single bit error correction, double bit
+  error detection) and single bit error auto scrubbing by reserving 8 bits for
+  every 64 bit word (effectively reducing available memory to 8/9).
+
+  Note, the bootloader must configure ECC mode in the memory controller.
+
+properties:
+  compatible:
+    enum:
+      - aspeed,ast2400-sdram-edac
+      - aspeed,ast2500-sdram-edac
+      - aspeed,ast2600-sdram-edac
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    sdram@1e6e0000 {
+        compatible = "aspeed,ast2500-sdram-edac";
+        reg = <0x1e6e0000 0x174>;
+        interrupts = <0>;
+    };
diff --git a/Documentation/devicetree/bindings/edac/aspeed-sdram-edac.txt b/Documentation/devicetree/bindings/edac/aspeed-sdram-edac.txt
deleted file mode 100644
index 8ca9e0a049d8..000000000000
--- a/Documentation/devicetree/bindings/edac/aspeed-sdram-edac.txt
+++ /dev/null
@@ -1,28 +0,0 @@
-Aspeed BMC SoC EDAC node
-
-The Aspeed BMC SoC supports DDR3 and DDR4 memory with and without ECC (error
-correction check).
-
-The memory controller supports SECDED (single bit error correction, double bit
-error detection) and single bit error auto scrubbing by reserving 8 bits for
-every 64 bit word (effectively reducing available memory to 8/9).
-
-Note, the bootloader must configure ECC mode in the memory controller.
-
-
-Required properties:
-- compatible: should be one of
-	- "aspeed,ast2400-sdram-edac"
-	- "aspeed,ast2500-sdram-edac"
-	- "aspeed,ast2600-sdram-edac"
-- reg:        sdram controller register set should be <0x1e6e0000 0x174>
-- interrupts: should be AVIC interrupt #0
-
-
-Example:
-
-	edac: sdram@1e6e0000 {
-		compatible = "aspeed,ast2500-sdram-edac";
-		reg = <0x1e6e0000 0x174>;
-		interrupts = <0>;
-	};
diff --git a/MAINTAINERS b/MAINTAINERS
index ec0aba646e7e..b6800e86286a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8848,7 +8848,7 @@ F:	drivers/edac/armada_xp_*
 EDAC-AST2500
 M:	Stefan Schaeckeler <sschaeck@cisco.com>
 S:	Supported
-F:	Documentation/devicetree/bindings/edac/aspeed-sdram-edac.txt
+F:	Documentation/devicetree/bindings/edac/aspeed,ast2400-sdram-edac.yaml
 F:	drivers/edac/aspeed_edac.c
 
 EDAC-BLUEFIELD
-- 
2.51.0


