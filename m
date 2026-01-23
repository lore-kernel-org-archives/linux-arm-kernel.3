Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EBDFD72379
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 11:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JrOhy2hQ7D7K1pp/d34klSH1BeVFqpGIBGtRmxugz+8=; b=Y9DUDHWAzEKYVz6sq/4+I1RGbF
	i5v2tLHUwuvNjXyJ/13+ibj6yN0ZsmU5k4qE6WZrD252iv9UO1LoHu+kZ+Em1jpGPPREoBBN/fsHl
	qTAJIt3r1wXvZ8QfKEGBSNpRifHjblN8BNboaWE+mC3BcjpbLKFPn/Y//TxBxWYFtYGTuLwPNAr8d
	F0eqvt4a/A3mNRehP7LB9YkxekKlm/AhVoYuDnjT7R4FoU/Bo/MBD8o3HGzfTt6SKS9F8LQMh3zGC
	xTGs4I9rtH3J7FNqR2R4iCEMNU0dOONXYZJDYIpfHb1Ao7J1ZwIvEj3ygw2FJEZt4izgntJMeTSNe
	Ankf5WCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjFO3-00000008qJJ-2B1V;
	Fri, 23 Jan 2026 11:31:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjFO1-00000008qHg-3Hmv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 11:31:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BAE07601EF;
	Fri, 23 Jan 2026 11:31:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 52ADBC2BC86;
	Fri, 23 Jan 2026 11:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769167892;
	bh=I+GVZKcx+MBYS1PuUVaF2l26z5GWB2GsAag9y9Lqrb0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=jC7l93+aFbKEamIHQywtZW2r2l/k9wiQHB6Cn8V7cvo6kRmhAU6/aDJDTqqBMtwy4
	 orI6zs2cs7dMc1x+rIkNs+ver88aThjklPUZSxNA8lByKyAah1F7HOEFqaQaiFgXz9
	 1rDKOsR1FRfz0umqFvh0rsJRFxejq0hkUOGZzqd9wSsg8Q31ddvGTaoiEDYeayLxJr
	 YZc+Ajvkg3eNDuV45sgRIFtUGae484AbrLuJm21D3REZIp37yGKGXWiDMJ+HWOb7Ab
	 i3omf03OQ2xBZMHOECGZSi8MF/UJZau2XekBaTcPm+Zhl0m2oPdFei0wWEjq87GsHq
	 H6X8boe4301Jg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49818D72379;
	Fri, 23 Jan 2026 11:31:32 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Date: Fri, 23 Jan 2026 12:31:30 +0100
Subject: [PATCH v7 1/4] dt-bindings: backlight: Add max25014 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260123-max25014-v7-1-15e504b9acc7@gocontroll.com>
References: <20260123-max25014-v7-0-15e504b9acc7@gocontroll.com>
In-Reply-To: <20260123-max25014-v7-0-15e504b9acc7@gocontroll.com>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-fbdev@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Maud Spierings <maudspierings@gocontroll.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769167891; l=3636;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=ZOQsl8OAiJDWwB3K+E4EP5ngBND6aBuPtx4fJEq8WZA=;
 b=pbAsLA7HaokmGS2MoTnWAZR9eNOgYVunL9bwZ6CEwq8mJr7yBqsDHh6YlJXJ2Y6dNHGPYLX2d
 ksZSkvy3C/PD+v5LNVaOo//Ar0Ln0bhEG7At/mxePpLmworMFnuF2l4
X-Developer-Key: i=maudspierings@gocontroll.com; a=ed25519;
 pk=7chUb8XpaTQDvWhzTdHC0YPMkTDloELEC7q94tOUyPg=
X-Endpoint-Received: by B4 Relay for maudspierings@gocontroll.com/20250214
 with auth_id=341
X-Original-From: Maud Spierings <maudspierings@gocontroll.com>
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
Reply-To: maudspierings@gocontroll.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Maud Spierings <maudspierings@gocontroll.com>

The Maxim MAX25014 is a 4-channel automotive grade backlight driver IC
with integrated boost controller.

Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>

---

In the current implementation the control registers for channel 1,
control all channels. So only one led subnode with led-sources is
supported right now. If at some point the driver functionality is
expanded the bindings can be easily extended with it.
---
 .../bindings/leds/backlight/maxim,max25014.yaml    | 91 ++++++++++++++++++++++
 MAINTAINERS                                        |  5 ++
 2 files changed, 96 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml b/Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml
new file mode 100644
index 000000000000..c499e6224a8f
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml
@@ -0,0 +1,91 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/backlight/maxim,max25014.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Maxim max25014 backlight controller
+
+maintainers:
+  - Maud Spierings <maudspierings@gocontroll.com>
+
+properties:
+  compatible:
+    enum:
+      - maxim,max25014
+
+  reg:
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+  default-brightness:
+    minimum: 0
+    maximum: 100
+    default: 50
+
+  enable-gpios:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  power-supply:
+    description: Regulator which controls the boost converter input rail.
+
+  pwms:
+    maxItems: 1
+
+  maxim,iset:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    maximum: 15
+    default: 11
+    description:
+      Value of the ISET field in the ISET register. This controls the current
+      scale of the outputs, a higher number means more current.
+
+  maxim,strings:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description:
+      A 4-bit bitfield that describes which led strings to turn on.
+    minItems: 4
+    maxItems: 4
+    items:
+      maximum: 1
+    default:
+      [1 1 1 1]
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        backlight@6f {
+            compatible = "maxim,max25014";
+            reg = <0x6f>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+            default-brightness = <50>;
+            enable-gpios = <&gpio1 4 GPIO_ACTIVE_HIGH>;
+            interrupt-parent = <&gpio1>;
+            interrupts = <2 IRQ_TYPE_EDGE_FALLING>;
+            power-supply = <&reg_backlight>;
+            pwms = <&pwm1>;
+            maxim,iset = <7>;
+            maxim,strings = <1 1 1 0>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 9b1b87d08fac..eb248f4634ac 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15515,6 +15515,11 @@ F:	Documentation/userspace-api/media/drivers/max2175.rst
 F:	drivers/media/i2c/max2175*
 F:	include/uapi/linux/max2175.h
 
+MAX25014 BACKLIGHT DRIVER
+M:	Maud Spierings <maudspierings@gocontroll.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml
+
 MAX31335 RTC DRIVER
 M:	Antoniu Miclaus <antoniu.miclaus@analog.com>
 L:	linux-rtc@vger.kernel.org

-- 
2.52.0



