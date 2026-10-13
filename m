Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DDD8CC6B0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 07:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ltew1KHXNB8+YhpDwLMPSUsY2dQV2R5blJIdndy1I2I=; b=uR/MEIAbqg78f2ltV3fYi30O6y
	48ErtprxbzWx5+uVygXutaBXvjAw6yTO5szk4D0gUThFsKcZrQS8V7fYHuUK77IJ8X60mZKzjH8jj
	XpXuQXngWb3AJttxw981Mwr9KjR9s5Ovo0BFfJRRSxYIaupk4FTb9aK0GtkbqV3TNTjtkw4yYKU8S
	ppk7uRFlOtXo7rcAZEAyuQGFNT+iyTg8Eq5sjqp6w7+UeklKXU4Tt7X0v5pLweX4l1mJFUXDWCFb+
	0A4kT1Hpel8XbXMgDwVqRCZSDpK4ILd9ti+Gs8W86cxBdvzqYsrMB+gGeGRUtWV4whKdr5Asckw34
	jmCehi2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGVfR-0000000C5z1-16Td;
	Tue, 13 Oct 2026 06:07:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGVfN-0000000C5vh-0HBx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 06:07:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C2CD143EAB;
	Tue, 13 Oct 2026 06:07:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 96627C2BCFC;
	Tue, 13 Oct 2026 06:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791871632;
	bh=Zzzint5ECeIvn557DthDmutEppVqwPr3W2qzFUq9hXQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=BDabJj95IuB3mLaJUjXR94r+wWVF/AX0lysQN4ZdvnbrR3dcsZaN94cRO7YzngoG6
	 0hFKBsNC7tW7hwmBMqdP37YeWQhB8awQL/cY3wz3JIfP6QfYGXTxVin7jlRRsTgkFe
	 Ew4lZq7dhmdw9bM0sypmbS6prNTM26kuoJG5dFeMcqCZZb26NzC00KPMl+srnsqKl2
	 rZtkt+yTf3Yy9sl1kVoO8tR0pTg85gS7E02XAgdyw8ddnpLv2olOzxy0I8Ybv7ALfE
	 Af/GdmaR8Lx0kTyB8+dMUhNYhj4Agxl7RX7aHe0j3LCSazlutKCxcIyfM6wr4BgRMo
	 vh1l8WyMQz/pQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82480CC6B03;
	Tue, 13 Oct 2026 06:07:12 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Tue, 13 Oct 2026 09:07:11 +0300
Subject: [PATCH v3 01/11] dt-bindings: interrupt-controller: Add Cortina
 Systems CS7542 peripheral interrupt controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-b4-cs75xx-s2-v3-1-181bb0d23f4c@gmail.com>
References: <20261013-b4-cs75xx-s2-v3-0-181bb0d23f4c@gmail.com>
In-Reply-To: <20261013-b4-cs75xx-s2-v3-0-181bb0d23f4c@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791871630; l=2339;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=A+5dV3NaQB/TuZqJfC9IFKI7zbkGEtJkk6VbEFbSsyk=;
 b=CBRbOlCi5m0QTRcyWOFGQnEKmf+3eiUaNk4OXM4BdQ0BXv+WbEY6zV5K/yoQsNFtF5qAd+BzK
 xMkC7gmepSrDYGPutKYr7tm17p2cvT+KagNIbev0bxx0Ga5PkEoT2Lj
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

The low speed peripherals of the Cortina Systems CS75xx SoCs share one
GIC interrupt. A small controller in the peripheral register block
reports which of its 15 sources are asserted and allows masking them.

Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
---
 .../interrupt-controller/cortina,cs7542-intc.yaml  | 57 ++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/cortina,cs7542-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/cortina,cs7542-intc.yaml
new file mode 100644
index 000000000..2963acaf7
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/cortina,cs7542-intc.yaml
@@ -0,0 +1,57 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/cortina,cs7542-intc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cortina Systems CS7542 peripheral interrupt controller
+
+maintainers:
+  - Fil Dunsky <filipp.dunsky@gmail.com>
+
+description:
+  The low speed peripherals of the Cortina Systems CS75xx (Goldengate G2)
+  SoCs (two software interrupts, two timers, the AXI bridge, SPI, the five
+  GPIO banks, I2C, MDIO, SSP and the random number generator) share one GIC
+  interrupt. This controller has a status register showing the level of the
+  15 sources and an enable register to mask them. The sources are cleared in
+  the peripherals themselves.
+
+properties:
+  compatible:
+    const: cortina,cs7542-intc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 1
+    description:
+      The number of the source, 0 to 14. All sources are active high level
+      interrupts.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-controller
+  - "#interrupt-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    interrupt-controller@f0070004 {
+        compatible = "cortina,cs7542-intc";
+        reg = <0xf0070004 0x8>;
+        interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-controller;
+        #interrupt-cells = <1>;
+    };

-- 
2.53.0



