Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEE08C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 02:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QSUUqqnDG37cxCAki3Ao/54d9tNSFWntK76yGOjq/3I=; b=dmyTW2H1k2jr1EMTSLuOK9wllb
	yIB1aNMhPgOsOipJDi8un8xBdFkf2yQHfYuuRhK0GgFRPuTqXAYfTFv33Zb9tPBDAemidbezd+fvK
	G8x61I7mhPr7H44gp85kMbh1zfw00RZCciPkDW+K6EDQ0Ls1s4AvZFUBh4oJX00fYCXztNDhn0VYq
	TJiwQMyiZIPb82ynxS4x4/OvyBjfHDvOPc1dyPlP9UdPvqhpW4NSD9PpK/kY6LbtOidm8akesEjMt
	ERSBS8dl8Ke+f4PP3166o8CFZUwUSZqm+U9vS4SCmFMpHzfZS7zi87UT7gp6Aq1PAGCABcqXg9A2x
	n689R5aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCUcT-0000000Dxql-45rt;
	Wed, 07 May 2025 02:34:50 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCQKz-0000000DUt8-2IMQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 22:00:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EA2D561136;
	Tue,  6 May 2025 22:00:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5198AC4CEE4;
	Tue,  6 May 2025 22:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746568828;
	bh=Q7rma2RwRj36D72JBVslC3/pqB7P7ZnfkKx8oZ+43NY=;
	h=From:To:Cc:Subject:Date:From;
	b=Fa7aXd5kLvyPLSMKt40QRRoZuYn77uA31RZqQwKdTC3lycJODdUqlmE8rehXx8pm3
	 nnKuLSBve3+JxcwtM4d3l2It5ed6UoLkR5P9z9dyaINoDwCHjWtz/qmunSMFweDfB8
	 k5+1Nm92BWKeH0yM8ImrRtnXJXlr3I9OfLDBuXryxqQFVadbrRfPpIphc7WoegBGzr
	 ACfDeZ4K0wFm8K3vN8Lnd/uupc7AL+Lcs6pmDgbntMHE5eDzE36Gp9Ekdre3XZB0wR
	 cI4V3+PCm8ZGzRCddNlMdlsD2/+hmGyogq/DteYBJngHovbew1Q9CJkMjVX+zpH8Y4
	 8wHYl9sheRSgw==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Baruch Siach <baruch@tkos.co.il>
Cc: linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] dt-bindings: serial: Convert cnxt,cx92755-usart to DT schema
Date: Tue,  6 May 2025 17:00:24 -0500
Message-ID: <20250506220025.2545995-1-robh@kernel.org>
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

Convert the Conexant Digicolor USART binding to DT schema. It is a
straight-forward conversion.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/serial/cnxt,cx92755-usart.yaml   | 48 +++++++++++++++++++
 .../bindings/serial/digicolor-usart.txt       | 27 -----------
 2 files changed, 48 insertions(+), 27 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/serial/cnxt,cx92755-usart.yaml
 delete mode 100644 Documentation/devicetree/bindings/serial/digicolor-usart.txt

diff --git a/Documentation/devicetree/bindings/serial/cnxt,cx92755-usart.yaml b/Documentation/devicetree/bindings/serial/cnxt,cx92755-usart.yaml
new file mode 100644
index 000000000000..720229455330
--- /dev/null
+++ b/Documentation/devicetree/bindings/serial/cnxt,cx92755-usart.yaml
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/serial/cnxt,cx92755-usart.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Conexant Digicolor USART
+
+maintainers:
+  - Baruch Siach <baruch@tkos.co.il>
+
+description: >
+  Note: this binding is only applicable for using the USART peripheral as UART.
+  USART also support synchronous serial protocols like SPI and I2S.
+  Use the binding that matches the wiring of your system.
+
+allOf:
+  - $ref: /schemas/serial/serial.yaml#
+
+properties:
+  compatible:
+    const: cnxt,cx92755-usart
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - interrupts
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    serial@f0000740 {
+        compatible = "cnxt,cx92755-usart";
+        reg = <0xf0000740 0x20>;
+        clocks = <&main_clk>;
+        interrupts = <44>;
+    };
diff --git a/Documentation/devicetree/bindings/serial/digicolor-usart.txt b/Documentation/devicetree/bindings/serial/digicolor-usart.txt
deleted file mode 100644
index 2d3ede66889d..000000000000
--- a/Documentation/devicetree/bindings/serial/digicolor-usart.txt
+++ /dev/null
@@ -1,27 +0,0 @@
-Binding for Conexant Digicolor USART
-
-Note: this binding is only applicable for using the USART peripheral as
-UART. USART also support synchronous serial protocols like SPI and I2S. Use
-the binding that matches the wiring of your system.
-
-Required properties:
-- compatible : should be "cnxt,cx92755-usart".
-- reg: Should contain USART controller registers location and length.
-- interrupts: Should contain a single USART controller interrupt.
-- clocks: Must contain phandles to the USART clock
-  See ../clocks/clock-bindings.txt for details.
-
-Note: Each UART port should have an alias correctly numbered
-in "aliases" node.
-
-Example:
-	aliases {
-		serial0 = &uart0;
-	};
-
-	uart0: uart@f0000740 {
-		compatible = "cnxt,cx92755-usart";
-		reg = <0xf0000740 0x20>;
-		clocks = <&main_clk>;
-		interrupts = <44>;
-	};
-- 
2.47.2


