Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 821C9C3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 15:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vFYwpx2Pz2sYjNUtBaClPAFRAXtKUQosMdnnOSBqGqc=; b=Jn7sXyP1wXylwXf7sxFWfHx5oa
	2pkP4VCghhlDYDJETAiKoXcbjnoq3P0Y5q9pv6YW24TP8uKxX1/4zcBX4B9l6eaUD6bWXSEoc5FMs
	qCjEVLwxrbMMT/6Tthvp4fI5OuB+oOlB8CXWIr3xwOWPRiS7QeAvNsJnbDEUGIsVLUachwCp7IPZj
	GkgLmhX2SZs2SmYaCjqYMccS2JyfdkQafkzSQv3ldGWJTqDXRBDWl+jnkyiJtgOzWiLpQIZrUmjaL
	8idPvmENU7Ea3rgBWSjOx3RTCtDiFAf0NIjA5kfAUSXnHBXBwiXhxiT1W6TKOES+ZG8K6IrHZcjAq
	Jb68dGEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBxMj-00000007kL4-2COx;
	Mon, 05 May 2025 15:04:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBx5k-00000007fzl-0Nd0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 14:46:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1AC6E4537D;
	Mon,  5 May 2025 14:46:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74B55C4CEE4;
	Mon,  5 May 2025 14:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746456407;
	bh=ERHiE7jfGbGlun1ZgZ2HCmXIpyxX1q5s9y081hy3rKg=;
	h=From:To:Cc:Subject:Date:From;
	b=Eqm3zwmd/yCKSUaVYeOY9/caSyMOp/lECJPoFIpkTyvxQ+AJ2xlMS+UdwR8Ns7nd9
	 Fk9OzT/PiavF+RercFPh8XjmXD6AsmOJ6TOtpYBq5MvcRhmx/05Of0G26gKTN89lLH
	 qGWrjnLDks6KV/2UN3RQj9FGbKFUEKGMNpnPyorxBWjgaUhBRWTRKBb251d3Z9vKJ1
	 43Ns6TmMaI3dGrNFNfCbCV82gNv4eJ+RAS1EiwwU9YE8de55CxI9gw3lcfABEtyZH5
	 tIVdoR5qyzgk3zOHiMfD5vhlkfUuidJTm2vfEk1Aq4v7u1Snu9FEmn0msft1iEUmLe
	 jQ+iLb2ZY3WkA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Baruch Siach <baruch@tkos.co.il>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] dt-bindings: interrupt-controller: Convert cnxt,cx92755-ic to DT schema
Date: Mon,  5 May 2025 09:46:43 -0500
Message-ID: <20250505144644.1288617-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_074648_167562_401AAB80 
X-CRM114-Status: GOOD (  13.92  )
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

Convert the Conexant Digicolor interrupt controller binding to schema
format. It's a straight-forward conversion of the typical interrupt
controller.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../interrupt-controller/cnxt,cx92755-ic.yaml | 47 +++++++++++++++++++
 .../interrupt-controller/digicolor-ic.txt     | 21 ---------
 2 files changed, 47 insertions(+), 21 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/cnxt,cx92755-ic.yaml
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/digicolor-ic.txt

diff --git a/Documentation/devicetree/bindings/interrupt-controller/cnxt,cx92755-ic.yaml b/Documentation/devicetree/bindings/interrupt-controller/cnxt,cx92755-ic.yaml
new file mode 100644
index 000000000000..3f016cf47812
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/cnxt,cx92755-ic.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/cnxt,cx92755-ic.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Conexant Digicolor Interrupt Controller
+
+maintainers:
+  - Baruch Siach <baruch@tkos.co.il>
+
+description: Conexant Digicolor Interrupt Controller
+
+properties:
+  compatible:
+    const: cnxt,cx92755-ic
+
+  reg:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 1
+
+  syscon:
+    description: A phandle to the syscon node describing UC registers
+    $ref: /schemas/types.yaml#/definitions/phandle
+
+required:
+  - compatible
+  - reg
+  - interrupt-controller
+  - '#interrupt-cells'
+  - syscon
+
+additionalProperties: false
+
+examples:
+  - |
+    interrupt-controller@f0000040 {
+        compatible = "cnxt,cx92755-ic";
+        interrupt-controller;
+        #interrupt-cells = <1>;
+        reg = <0xf0000040 0x40>;
+        syscon = <&uc_regs>;
+    };
diff --git a/Documentation/devicetree/bindings/interrupt-controller/digicolor-ic.txt b/Documentation/devicetree/bindings/interrupt-controller/digicolor-ic.txt
deleted file mode 100644
index 42d41ec84c7b..000000000000
--- a/Documentation/devicetree/bindings/interrupt-controller/digicolor-ic.txt
+++ /dev/null
@@ -1,21 +0,0 @@
-Conexant Digicolor Interrupt Controller
-
-Required properties:
-
-- compatible : should be "cnxt,cx92755-ic"
-- reg : Specifies base physical address and size of the interrupt controller
-  registers (IC) area
-- interrupt-controller : Identifies the node as an interrupt controller
-- #interrupt-cells : Specifies the number of cells needed to encode an
-  interrupt source. The value shall be 1.
-- syscon: A phandle to the syscon node describing UC registers
-
-Example:
-
-	intc: interrupt-controller@f0000040 {
-		compatible = "cnxt,cx92755-ic";
-		interrupt-controller;
-		#interrupt-cells = <1>;
-		reg = <0xf0000040 0x40>;
-		syscon = <&uc_regs>;
-	};
-- 
2.47.2


