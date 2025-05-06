Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBA34C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 02:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pZABmXHQgj4/APNYQb1cl8+gYVVZQLMxzKCj9UIv1+s=; b=BM7zYdp9d3YpYjM73WDIbtbdgL
	jBCLN0J33FbEpBPChy4Rh2CqSKB8LbSTe63bCeELt3UVgAHkpv8p0HABmTWIQK8lxwjLTuMjmNAqs
	i22LBYYmNTedqp2fHCHCdXztOMaJ+H0cd1xU5aLBa8GXxsIAzQL6GPPB32jSqT7ChGTkawWaSL5E4
	3CZ2AM1rTl6AUkEC7xKpkRa1y1BgmDk1Cerc+BgaUYUDn0AE+mNMcvqI4xapWBI8BxobwLSSCZKQu
	7scXiV9SuRWsW2tifolagPqXwSsjGeu2pFJ6bAZGTL3JvYM8/TXqPhjSqEf9/XhVDQtfWMIcNGzjv
	wYvUff2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCUcX-0000000Dxxq-1AKW;
	Wed, 07 May 2025 02:34:53 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCQLB-0000000DUvg-2NzQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 22:00:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A7A515C5932;
	Tue,  6 May 2025 21:58:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72E79C4CEEF;
	Tue,  6 May 2025 22:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746568840;
	bh=gcf1J8rzv6+webHzaN9XOJsTcMRO4EZlNlQ175HgN+M=;
	h=From:To:Cc:Subject:Date:From;
	b=BZ8FMTv/l5xpG+wtcWuecDth82Inh+KHHULm9TcSs/ZEwCCZe8K+hc3vH+ADoCKf8
	 crfFpa/lDAoR2puOmhR5q5n3pwm/pDc0qqjSZQ6tfsq5BzkA49Ws18VWai6K8bMf25
	 0LtTq9jnHpAJci7v3G0qPphGGRKoV8GeTwvZoqRCmYgt36f2R1TZe2oK3d3+KzByqQ
	 2y/n/4FW0yvqjmSnpAeAMZ4IAQXsQCQoBrzQg6Q3fkG/9W1/KgrZuXuUaDPzYg0FLN
	 sdaZh6IDj2Nskd1E1V0H8eKn87wVQ31/SbYVdEMckwLWKTEWYl+ZMFRjThxFZphCbB
	 PsJBc9D2VI0tQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Taichi Sugaya <sugaya.taichi@socionext.com>,
	Takao Orito <orito.takao@socionext.com>
Cc: linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] dt-bindings: serial: Convert socionext,milbeaut-usio-uart to DT schema
Date: Tue,  6 May 2025 17:00:37 -0500
Message-ID: <20250506220038.2546557-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_150041_728549_3E83B80A 
X-CRM114-Status: GOOD (  14.00  )
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

Convert the Socionext Milbeaut UART binding to DT schema. It is a
straight-forward conversion.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/serial/milbeaut-uart.txt         | 21 -------
 .../serial/socionext,milbeaut-usio-uart.yaml  | 56 +++++++++++++++++++
 2 files changed, 56 insertions(+), 21 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/serial/milbeaut-uart.txt
 create mode 100644 Documentation/devicetree/bindings/serial/socionext,milbeaut-usio-uart.yaml

diff --git a/Documentation/devicetree/bindings/serial/milbeaut-uart.txt b/Documentation/devicetree/bindings/serial/milbeaut-uart.txt
deleted file mode 100644
index 3d2fb1a7ba94..000000000000
--- a/Documentation/devicetree/bindings/serial/milbeaut-uart.txt
+++ /dev/null
@@ -1,21 +0,0 @@
-Socionext Milbeaut UART controller
-
-Required properties:
-- compatible: should be "socionext,milbeaut-usio-uart".
-- reg: offset and length of the register set for the device.
-- interrupts: two interrupts specifier.
-- interrupt-names: should be "rx", "tx".
-- clocks: phandle to the input clock.
-
-Optional properties:
-- auto-flow-control: flow control enable.
-
-Example:
-	usio1: usio_uart@1e700010 {
-		compatible = "socionext,milbeaut-usio-uart";
-		reg = <0x1e700010 0x10>;
-		interrupts = <0 141 0x4>, <0 149 0x4>;
-		interrupt-names = "rx", "tx";
-		clocks = <&clk 2>;
-		auto-flow-control;
-	};
diff --git a/Documentation/devicetree/bindings/serial/socionext,milbeaut-usio-uart.yaml b/Documentation/devicetree/bindings/serial/socionext,milbeaut-usio-uart.yaml
new file mode 100644
index 000000000000..37db6459b67a
--- /dev/null
+++ b/Documentation/devicetree/bindings/serial/socionext,milbeaut-usio-uart.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/socionext,milbeaut-usio-uart.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Socionext Milbeaut UART controller
+
+maintainers:
+  - Sugaya Taichi <sugaya.taichi@socionext.com>
+
+allOf:
+  - $ref: /schemas/serial/serial.yaml#
+
+properties:
+  compatible:
+    const: socionext,milbeaut-usio-uart
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: RX interrupt specifier
+      - description: TX interrupt specifier
+
+  interrupt-names:
+    items:
+      - const: rx
+      - const: tx
+
+  clocks:
+    maxItems: 1
+
+  auto-flow-control:
+    description: Enable automatic flow control.
+    type: boolean
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    serial@1e700010 {
+        compatible = "socionext,milbeaut-usio-uart";
+        reg = <0x1e700010 0x10>;
+        interrupts = <0 141 0x4>, <0 149 0x4>;
+        interrupt-names = "rx", "tx";
+        clocks = <&clk 2>;
+        auto-flow-control;
+    };
-- 
2.47.2


