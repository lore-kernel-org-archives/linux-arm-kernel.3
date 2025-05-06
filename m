Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D17ABC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 03:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cCAVKP7SrR333Gc2tei33vMDbZ4FO69ZTBSxGvMrZlo=; b=f5kPGUPl0Gr77cdZWkpf9iR9oL
	ybkBRYHtcz3W/EnknBV3PM/tCqVz9d+YsGzw8yVssSEkl3AjGq25sZxM7TJ7oqPhA8/ZOdWr7QcIU
	0zmlU3gLfNjqKTaEE/N5EgVwvIsXfm6MSlA6MIGjgwgxPPbs2nk7INFiEFZCoxvGEmGumqO52pik8
	czzsdk2k3GmyA7IjaBNFuW7wjZU+qp4C1FMN8PsaiDo6exw6892haM/ultR3xZhlo1Tpe9y4k1hg3
	KymB67ZJ4+b9Kop9W2pr35ERZPlzgrwkrpjP55AH0qurQ9SaWrCvLM6DUPDtOokF+GF95uqYqpdQH
	28izfyXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCVjx-0000000E7AY-1uLh;
	Wed, 07 May 2025 03:46:37 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCQKm-0000000DUqK-2B4v
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 22:00:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A299C5C5A41;
	Tue,  6 May 2025 21:57:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DC21C4CEE4;
	Tue,  6 May 2025 22:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746568815;
	bh=/+KalfFDzI80dknz8+VTKph/XzS0C0WyqI20V4kemKk=;
	h=From:To:Cc:Subject:Date:From;
	b=IPeFx3JtbKD48/vdr6KT0DoGPaB5rRo8NmKdt/oNs0fq7qPCowf98T3IfGWWcZ2pq
	 Xo4sQ0pNkTafRBRslPstN/7rRpamTVyjBnvfJeeyeciDNXrnhf6SZJrD01MaZ9Kt5O
	 KXHMxh9dDcHJMrFQdvA4WxJQOXHGdTf1DVDoLREMhndI5XyJ4GkRj3QYVf385seiHn
	 EL8teOD+jLL6Y+N9tWPpxiIlKWjIAn7nl7ce1K3E4/bjGBYCM8ZH6PlaSCJwUyv7dP
	 W6UWn4BUefJ86BuaIfSws2UyCU49dGgeWsF7pIh3ihByFzxA60K6avpN7fsFvLwxau
	 a73SD/Tg8ghwg==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Vladimir Murzin <vladimir.murzin@arm.com>
Cc: linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] dt-bindings: serial: Convert arm,mps2-uart to DT schema
Date: Tue,  6 May 2025 17:00:11 -0500
Message-ID: <20250506220012.2545470-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_150016_600209_28217E1C 
X-CRM114-Status: GOOD (  14.01  )
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

Convert the Arm MPS2 UART binding to DT schema. It is a straight-forward
conversion.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/serial/arm,mps2-uart.txt         | 19 --------
 .../bindings/serial/arm,mps2-uart.yaml        | 46 +++++++++++++++++++
 2 files changed, 46 insertions(+), 19 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/serial/arm,mps2-uart.txt
 create mode 100644 Documentation/devicetree/bindings/serial/arm,mps2-uart.yaml

diff --git a/Documentation/devicetree/bindings/serial/arm,mps2-uart.txt b/Documentation/devicetree/bindings/serial/arm,mps2-uart.txt
deleted file mode 100644
index 128cc6aed001..000000000000
--- a/Documentation/devicetree/bindings/serial/arm,mps2-uart.txt
+++ /dev/null
@@ -1,19 +0,0 @@
-ARM MPS2 UART
-
-Required properties:
-- compatible	: Should be "arm,mps2-uart"
-- reg		: Address and length of the register set
-- interrupts	: Reference to the UART RX, TX and overrun interrupts
-
-Required clocking property:
-- clocks	  : The input clock of the UART
-
-
-Examples:
-
-uart0: serial@40004000 {
-	compatible = "arm,mps2-uart";
-	reg = <0x40004000 0x1000>;
-	interrupts = <0 1 12>;
-	clocks = <&sysclk>;
-};
diff --git a/Documentation/devicetree/bindings/serial/arm,mps2-uart.yaml b/Documentation/devicetree/bindings/serial/arm,mps2-uart.yaml
new file mode 100644
index 000000000000..4a8df078e6f3
--- /dev/null
+++ b/Documentation/devicetree/bindings/serial/arm,mps2-uart.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/serial/arm,mps2-uart.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Arm MPS2 UART
+
+maintainers:
+  - Vladimir Murzin <vladimir.murzin@arm.com>
+
+allOf:
+  - $ref: /schemas/serial/serial.yaml#
+
+properties:
+  compatible:
+    const: arm,mps2-uart
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: RX interrupt
+      - description: TX interrupt
+      - description: Overrun interrupt
+
+  clocks:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    serial@40004000 {
+        compatible = "arm,mps2-uart";
+        reg = <0x40004000 0x1000>;
+        interrupts = <0>, <1>, <12>;
+        clocks = <&sysclk>;
+    };
-- 
2.47.2


