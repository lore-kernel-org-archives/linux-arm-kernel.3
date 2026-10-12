Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0873CA9EDE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 17:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DbZTNCPjBpU/fyCQN2hp2bLTGNDbSSPSACBZJQwLEEA=; b=WLhB5zFIUWZSLvtbwE2NrZyVfe
	MppxEfvIl13GidDMuXMuPGyuPuqI2077J0ydX58yFQLl+bty+kOEJ7HhMWYUsHVvF5VqAsfRAtSHK
	26Hh4ClKvOX3UXZ721Dy+n4S7TFtJQ7HQTjxOHO9RIoK8BuJXTVF7b/wPyKaANSymul4SwKL7DQqC
	NY5YoqHRxqISBN9krT9QzjdcNJdB7RgspW98meGeoLm682i6Hn6Se+vP/JkPav2Glwib3YqJhPoRn
	LSR5N996Wh/ax2jealmnkmndcxzfmZRj6uavOPKh5NUUAx7koN54aDte+aSKjpuxUExB2c5vNMvVx
	sNvHSQDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGJtW-0000000B6YS-32qP;
	Mon, 12 Oct 2026 17:33:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGJtS-0000000B6W7-2nQi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 17:32:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6B8E743EDD;
	Mon, 12 Oct 2026 17:32:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3BC38C2BCFD;
	Mon, 12 Oct 2026 17:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791826378;
	bh=Ben9ds7l5snlJMg8NPMQQZULDqBGhQj1SfVWHLiwrlA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=EIIuX59bzzt1wIQ7KqG0rE1JlLqb50B8/qB4Hs2CUqVf5lLRrACGTOcJJKuLzzwJt
	 7VrEa9afCWi6BllLDIGl7AlYxFPGM8zJxsZTe9YY0grbPKFk1Q46bzFQUUkiHOfWGA
	 IgmiOBuhv7qwqILLATbrKQg1DyedNl0GY6tSz6utUDW7vKmhfVRpzU4I8Wc6eh4h4p
	 srKK3obCAemayA3akBIxHY9MN5GrVnFF6UY0Q8fD/tzRm49OtK7OAUsKyU6NgSo1XO
	 n0huE6bsON2MkO2lGGfqstFpgEHW8wB8eHZG3Hx5V9sa8SmuAIkW2RrNb3EM2wDhpy
	 FTM9ngvCtmLRA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21CA7CA9EC5;
	Mon, 12 Oct 2026 17:32:58 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Mon, 12 Oct 2026 20:32:58 +0300
Subject: [PATCH 03/11] dt-bindings: gpio: Add Cortina Systems CS7542 GPIO
 controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-b4-cs75xx-s2-v1-3-8a7641b7b79c@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791826375; l=2368;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=uz2ou1IT1ghc6GBy1z+YYFHHajTQ9VyMONdxfzPSdIk=;
 b=8+fbyqjLofqG9WBhmK3gaslEb9wRm4Pc5xw3UL1wayW/7eXxOp9epY3IB4OdC3VgYa5cymASk
 Oxp0F5tSARSCXp2/j+1xmBxbShTVxqPqFd0+4f2NQ2MHlJX6TOvnV+q
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

The Cortina Systems CS75xx SoCs have five banks of 32 GPIO lines. Each
pin is shared between a GPIO line and a peripheral function, selected by
the bank's GPIO_MUX register in the global control block, which is
described as the second register region of the bank.

Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
---
 .../bindings/gpio/cortina,cs7542-gpio.yaml         | 68 ++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/cortina,cs7542-gpio.yaml b/Documentation/devicetree/bindings/gpio/cortina,cs7542-gpio.yaml
new file mode 100644
index 000000000..b54421d65
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/cortina,cs7542-gpio.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/cortina,cs7542-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cortina Systems CS7542 GPIO controller
+
+maintainers:
+  - Fil Dunsky <filipp.dunsky@gmail.com>
+
+description:
+  The Cortina Systems CS75xx (Goldengate G2) SoCs have five banks of 32
+  GPIO lines, each with its own interrupt. Every pin is shared between a
+  GPIO line and a peripheral function; the choice is made per pin in the
+  GPIO_MUX register of the bank, which is part of the global control
+  block.
+
+properties:
+  compatible:
+    const: cortina,cs7542-gpio
+
+  reg:
+    items:
+      - description: GPIO bank registers
+      - description: GPIO_MUX register of the bank
+
+  interrupts:
+    maxItems: 1
+
+  gpio-controller: true
+
+  "#gpio-cells":
+    const: 2
+
+  gpio-line-names:
+    maxItems: 32
+
+  gpio-reserved-ranges: true
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 2
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - gpio-controller
+  - "#gpio-cells"
+  - interrupt-controller
+  - "#interrupt-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    gpio@f00701f0 {
+        compatible = "cortina,cs7542-gpio";
+        reg = <0xf00701f0 0x20>, <0xf0000020 0x4>;
+        interrupt-parent = <&intc>;
+        interrupts = <7>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+    };

-- 
2.53.0



