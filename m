Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8B1BC3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 14:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JlsKhkoz828MEtVy2v5Fu7Luz+EY3Qo135bmujvMVE8=; b=Yw85FCg/KiVUkpkEYMvcuOpkKT
	tTu8i57m2Ul7oFAF6JmGXIZKoeWsedWRWzmrC2mxSNUKM0l6e1QBQx+8j6rIKVyszXpeWrFaFTI0a
	7T8Bi653iYSJ3K5nEs+US0xhhuxVCLHw2NBQf+jj/UMAuxxcbDTMybkDo0c2vOZwHrlsLhdxya4tU
	aA4WU7SCa4i1fljYZFhJ5Kcssn1uxW82ebpA6LG7JxOzXtdp4AFtFoWvb/KpHkuDWJUhbIIhhNfbz
	sY9KbVDvH6NnoqJ37gz28v6bAxaITJ3wTfw+nJZX4GVWYMyKeiiK+M+h5Zejkn2orSFCNdf+p6U0t
	z1dHoAVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBxGq-00000007iqm-1REK;
	Mon, 05 May 2025 14:58:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBx5A-00000007fpS-0Wt8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 14:46:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0C8E561155;
	Mon,  5 May 2025 14:45:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AC7CC4CEEF;
	Mon,  5 May 2025 14:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746456371;
	bh=x7tnnriKWWyb+OOuz9Jm2Bv/3oa5SNZPvGNweMUWMIU=;
	h=From:To:Cc:Subject:Date:From;
	b=g2L9k+WPZ+3OvN9rVu72Dcp1LHEzvAtWshioq4cwfDRz5dhPuLGkql2COEPoTeti1
	 r6Wyz8I2gy/Rd76okDAVba4h1+yPlgChYIS6+VhXkhkZXfgMHuGPS740zXIoI1k7qG
	 +AJLi/QkoKqnk/f4Ew/DXA7Iv96yQIS/dp7Gk2oKzEE1dJhsDNThHTJL0wjBIwYGv2
	 JLPSd7yrxNnr+OXhYtLrOCstGa1Y+kIanVT5Zoh6sBPFEz8wBYu6u7JyFan7cAcc9A
	 BSJhVVLA1p6xCZZ1q5EiDISbBzSQaJU1Oamejd/CNuc4ACSFN8p/AA7NrXwPdcIZPY
	 xo9hqlVu8qB8g==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-i2c@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: [PATCH] dt-bindings: interrupt-controller: Convert aspeed,ast2400-i2c-ic to DT schema
Date: Mon,  5 May 2025 09:46:04 -0500
Message-ID: <20250505144605.1287121-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
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

Convert the Aspeed I2C interrupt controller binding to schema format.

Drop the "#address-cells" and "#size-cells" as they are unused and
incorrect anyways.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../aspeed,ast2400-i2c-ic.txt                 | 25 ----------
 .../aspeed,ast2400-i2c-ic.yaml                | 46 +++++++++++++++++++
 MAINTAINERS                                   |  2 +-
 3 files changed, 47 insertions(+), 26 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2400-i2c-ic.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2400-i2c-ic.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2400-i2c-ic.txt b/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2400-i2c-ic.txt
deleted file mode 100644
index 033cc82e5684..000000000000
--- a/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2400-i2c-ic.txt
+++ /dev/null
@@ -1,25 +0,0 @@
-Device tree configuration for the I2C Interrupt Controller on the AST24XX and
-AST25XX SoCs.
-
-Required Properties:
-- #address-cells	: should be 1
-- #size-cells 		: should be 1
-- #interrupt-cells 	: should be 1
-- compatible 		: should be "aspeed,ast2400-i2c-ic"
-			  or "aspeed,ast2500-i2c-ic"
-- reg			: address start and range of controller
-- interrupts		: interrupt number
-- interrupt-controller	: denotes that the controller receives and fires
-			  new interrupts for child busses
-
-Example:
-
-i2c_ic: interrupt-controller@0 {
-	#address-cells = <1>;
-	#size-cells = <1>;
-	#interrupt-cells = <1>;
-	compatible = "aspeed,ast2400-i2c-ic";
-	reg = <0x0 0x40>;
-	interrupts = <12>;
-	interrupt-controller;
-};
diff --git a/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2400-i2c-ic.yaml b/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2400-i2c-ic.yaml
new file mode 100644
index 000000000000..6cff6a7231bb
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2400-i2c-ic.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/aspeed,ast2400-i2c-ic.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Aspeed I2C Interrupt Controller (AST24XX/AST25XX)
+
+maintainers:
+  - Ryan Chen <ryan_chen@aspeedtech.com>
+
+properties:
+  compatible:
+    enum:
+      - aspeed,ast2400-i2c-ic
+      - aspeed,ast2500-i2c-ic
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - '#interrupt-cells'
+  - interrupts
+  - interrupt-controller
+
+additionalProperties: false
+
+examples:
+  - |
+    interrupt-controller@0 {
+        compatible = "aspeed,ast2400-i2c-ic";
+        reg = <0x0 0x40>;
+        #interrupt-cells = <1>;
+        interrupts = <12>;
+        interrupt-controller;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index b830dfeaa05f..9e37f0c14496 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2328,7 +2328,7 @@ L:	linux-i2c@vger.kernel.org
 L:	openbmc@lists.ozlabs.org (moderated for non-subscribers)
 S:	Maintained
 F:	Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
-F:	Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2400-i2c-ic.txt
+F:	Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2400-i2c-ic.yaml
 F:	drivers/i2c/busses/i2c-aspeed.c
 F:	drivers/irqchip/irq-aspeed-i2c-ic.c
 
-- 
2.47.2


