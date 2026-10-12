Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C23AACA9EDE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 17:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s6Ri3bt1nB4J1P4VisEWV/TUnToiG2cuBi0NznVGKnA=; b=nI621y+6AAk4qmzcZTeVhQUKte
	gMa+LyfChol9gYd7ZQhpF7pNvE8mET0+3AXVo9huaPRr12+UxlnhwRUkI69UWFgdg4jFQhTs92SZ6
	Y9zdh4+PokgVbIKWQEbcHAchjpq5Dbs1BiaJ95wb8QbTMm2J996iGGSAiM9MAv6hH+D4UzbXbhiNA
	298Gtgrz6c3WS76x+j/ks4NPxGsJHBkjneXtfiyU9CdB2IJG0tTQfD6+2oWWVa/VTjU30pn+umSYQ
	8FFW1SbqD62yvn9aK2ULVsbbAsRW2PS2DPJJR9ZKimm+0v0lG2PF4jZtbF2Up/FccjGNjmcgfikza
	7M2mo05w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGJtX-0000000B6ZH-0IWS;
	Mon, 12 Oct 2026 17:33:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGJtS-0000000B6WC-3P97
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 17:32:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7ECA243F67;
	Mon, 12 Oct 2026 17:32:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5E8A2C2BD00;
	Mon, 12 Oct 2026 17:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791826378;
	bh=31t7A4ec1Xhu+LA6GuFAzpvU2Mlareg98Anh2jPt2bA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=h+89zG009aIaMz6KIlxyGoZM1eEDnW9eyQL5CFvhHABr8NYDhvBW6QBaHMK5fibK8
	 qXZX2VyRe2bGCsxivIWY1RH87+bJLVFQcneyPSo5smHpGMOXLTOEGhiNcaYXLQUdQS
	 Z/Z6H0mabSqQiHMBe4JQoKJ5SrI/Zmhv83/zQAEj8ZWSWzpX4RF2iZxnoiNU05XiZn
	 dH4yUJ3u93EMzk/9Rjf0YqUjqJ6XpJlRGFyoca6lcxQ/zxuMNzV+7/9bBMKA6S4Qhb
	 A9sFkUCNoboCwUuVb1yHjEUJvmRVvVQ5sL4zgtObw6Km5BK9HxW5tL4uCbV0ZhcrYH
	 LlrX3NnEozOQA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BD1CCA9ED0;
	Mon, 12 Oct 2026 17:32:58 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Mon, 12 Oct 2026 20:33:00 +0300
Subject: [PATCH 05/11] dt-bindings: i2c: Add Cortina Systems CS7542 I2C
 controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-b4-cs75xx-s2-v1-5-8a7641b7b79c@gmail.com>
References: <20261012-b4-cs75xx-s2-v1-0-8a7641b7b79c@gmail.com>
In-Reply-To: <20261012-b4-cs75xx-s2-v1-0-8a7641b7b79c@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Russell King <linux@armlinux.org.uk>, 
 Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-i2c@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 Fil Dunsky <filipp.dunsky@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791826375; l=1834;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=aHpVqUhA73R0k52i9jHgHCikRVBzEr4JeY2wk8AHGqM=;
 b=5nAJjrIZ4JK7X2RvtD4JY+ObrZ1oQAgb5/XUJxS8+GwbX0rfr3K3TA3GQukom3x29Akyb/srE
 /Z1yWWqkj3LBo8vPtzyrNIb2cK/YRxPL7WRkcrZQE237iYhYPYvweTG
X-Developer-Key: i=filipp.dunsky@gmail.com; a=ed25519;
 pk=JAYP8e2rJ54DHOmhNtXud8rl1igAaAXoOHxtJmVXI1g=
X-Endpoint-Received: by B4 Relay for filipp.dunsky@gmail.com/20260930 with
 auth_id=1085
X-Original-From: Fil Dunsky <filipp.dunsky@gmail.com>
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
Reply-To: filipp.dunsky@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Fil Dunsky <filipp.dunsky@gmail.com>

Add a binding for the I2C ("Bi-Wire") controller of the Cortina Systems
CS75xx SoCs.

Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
---
 .../bindings/i2c/cortina,cs7542-i2c.yaml           | 56 ++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/cortina,cs7542-i2c.yaml b/Documentation/devicetree/bindings/i2c/cortina,cs7542-i2c.yaml
new file mode 100644
index 000000000..f70984bd7
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/cortina,cs7542-i2c.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/cortina,cs7542-i2c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cortina Systems CS7542 I2C controller
+
+maintainers:
+  - Fil Dunsky <filipp.dunsky@gmail.com>
+
+description:
+  The I2C ("Bi-Wire") controller of the Cortina Systems CS75xx (Goldengate
+  G2) SoCs. It transfers one byte per command and runs from the peripheral
+  (APB) clock through a 16-bit prescaler.
+
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+
+properties:
+  compatible:
+    const: cortina,cs7542-i2c
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-frequency:
+    enum: [100000, 400000]
+    default: 100000
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
+    i2c@f00700e8 {
+        compatible = "cortina,cs7542-i2c";
+        reg = <0xf00700e8 0x28>;
+        interrupt-parent = <&intc>;
+        interrupts = <11>;
+        clocks = <&apb_clk>;
+        clock-frequency = <400000>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+    };

-- 
2.53.0



