Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D768C1B0D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 15:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G0bimvLxqpdsAnmq95gtQRY7p/b87OPXBA7IS8VNAdg=; b=Rp+47OghrhJvAm53kHYPYkVHk5
	vQpY7Ka8B5bVl/PSPyKqhccH7gSZIVKut5ug1Bol8BF9KRCrk/nO5N4KeHuRy+byzAOBJXaACrC/A
	Rgnih7kMM7JTGye0UIiR42ZeHg3V9VFkH/VCy1P7Ac5fRfCox3OEZo1DfHSBoMrpaztWLJ7PIPpdh
	4S1YG5xSOVe04aMbCb4URRb6eYqKot70wDF/pa4jAsIxW0vQ2GMoT3Iz2FMNdi9+3AuPQyHMZ9Xu0
	xjeB5heAyvt3Nde0y/LT/L4bEQ5BQCRm6etB5Fu618p9ERlYxkL+RyyMiXA3XM8ca+Dl+z3cAwVZn
	dv0kQ8FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnJEu-00000004FQW-1d87;
	Wed, 26 Feb 2025 15:22:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnIFz-0000000432b-1EEm
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 26 Feb 2025 14:19:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Content-ID:Content-Description;
	bh=G0bimvLxqpdsAnmq95gtQRY7p/b87OPXBA7IS8VNAdg=; b=jkXZalbAWA+kjhxO4kqVUAfr0z
	6gvhqMUTlyoF9Mqu7tv6HB5DNZn+8ZeSRRjE5LlvDNf+QLYA+SudLorR7FRdaQJDyxPt/sgvukQKV
	d66/uNWRhK7qsCRHyUFBr0zJpKAjP3SF5jjr7DE0tYVTFczeZT2sJbeZcboCD8fw+6EbDW8Qpr9ID
	2lDqzlyaLDGjaJCa9eCbiG2cSD9lRtEU7rTmNbqtSt5BvGqDGy45p7vy+jV3VVmTI0FFT5EshZB68
	CGdgAfto0MP/xPQkCb4Lcii7X09rRP725m4zHz+ONawLdqCbK4b3nGWZ0E3dmsDrgN136OXJ3vxcE
	Jh4g3jqg==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnIFu-00000003cXi-2bJd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 14:19:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 819B75C485E;
	Wed, 26 Feb 2025 14:18:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B451BC4CEED;
	Wed, 26 Feb 2025 14:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740579558;
	bh=osfiWDazaUUhIdjl88Wsp3F8y+CDBUMkVLAgYN+JnH8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=rvSnPX9b4IMPt5UqTG/4eLqsYj0/DwHMOjH/wsWG1mkivnH11hP3vfIYRmbBmOQsv
	 tzc8GaFi47nXAyQpnqx6aAoPF/83mj8EbSb4en4kQqCXwgFKeyP794jjKWKh3z+ZtA
	 erhKBs84jLaPk5oC8WyyfyeJ9oPRc7s/7GrtBGhamZfV9sSGmLFIe0k9AbT09dkgEP
	 PTZ738Zh9a1uuFYuygsZVN4c5fgpkvK8cdzwvG6mAODGmhlP95s61WOeu5Yhm4euoB
	 WzwrRbVcv/VZlk6cNLjaKMEtIon54RdGeyaHtCD2CyvdIbtBgKJOsr+B9kewD0ABlO
	 xiHvI9C4Rg4KA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4A15C021B8;
	Wed, 26 Feb 2025 14:19:18 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Date: Wed, 26 Feb 2025 15:19:14 +0100
Subject: [PATCH v2 03/12] dt-bindings: connector: Add the GOcontroll
 Moduline module slot bindings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250226-initial_display-v2-3-23fafa130817@gocontroll.com>
References: <20250226-initial_display-v2-0-23fafa130817@gocontroll.com>
In-Reply-To: <20250226-initial_display-v2-0-23fafa130817@gocontroll.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Liu Ying <victor.liu@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org, 
 Maud Spierings <maudspierings@gocontroll.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740579556; l=5048;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=pJTRryEUH61y/AD454hzp/uuXsK9vkVHu0FC9+9tIo4=;
 b=5Vy65hAOZ6+zDffYGJ4I89iOR6gkn9v6VIpxtfvaD3g4iEr4vK6fOm3hDLEHBc73H+EZYNOzC
 B4UQQjssmy/DnyeOH0kqf0Lwj/p2P6Svkw30uRwwBAvZPQG4emMmWoa
X-Developer-Key: i=maudspierings@gocontroll.com; a=ed25519;
 pk=7chUb8XpaTQDvWhzTdHC0YPMkTDloELEC7q94tOUyPg=
X-Endpoint-Received: by B4 Relay for maudspierings@gocontroll.com/20250214
 with auth_id=341
X-Original-From: Maud Spierings <maudspierings@gocontroll.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_141923_086014_370955B9 
X-CRM114-Status: GOOD (  20.81  )
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

Add the bindings that describe a GOcontroll Moduline module slot. This
slot provides all the interfaces to interface with a Moduline compatible
IO module. The actual module is not reasonable to describe as it can be
swapped at will, with this connector the driver will be able to probe
for a module on boot.

The connector consists of 2 parts, one part for interfacing with the SoC
and main board, the other part has 13 IO channels for the module to
interact with the outside world. The functions of these IO channels are
determined by the type of module in the slot. The IO on the SoC side is
as follows:

 - a 3v3 supply, this tends to be the logic level of the module and its
   microcontroller
 - a 5v0 supply, this can be used to power low power peripherals on the
   module
 - a 6v-8v supply, this can be used for high power peripherals on the
   module
 - a 6v-30v supply, this tends to be a dirty supply that comes from the
   controller supply after some circuit protection, or is the same as
   the 6v-8v supply.
 - an SPI bus which carries the communication between the SoC and the
   microcontroller on the module.
 - an I2C bus shared between the SoC and all module slots which can
   carry direct module-to-module communication.
 - a reset line
 - an interrupt line that indicates a clear to transmit signal
 - a sync line shared between the SoC and all module slots which could
   be used to synchronize modules for time sensitive IO spread across
   modules.
 - a SMBus alert line that is shared between the modules but is not
   connected to the SoC so that is ignored.

A slot-number property is used to identify the physical location of a
module slot. Without it, it would be impossible to identify which module
to control if there are multiple of one type, to address the desired IO.

Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
---
 .../connector/gocontroll,moduline-module-slot.yaml | 88 ++++++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/Documentation/devicetree/bindings/connector/gocontroll,moduline-module-slot.yaml b/Documentation/devicetree/bindings/connector/gocontroll,moduline-module-slot.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..a16ae2762d160180d5b163e20f5294235e65053b
--- /dev/null
+++ b/Documentation/devicetree/bindings/connector/gocontroll,moduline-module-slot.yaml
@@ -0,0 +1,88 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/connector/gocontroll,moduline-module-slot.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: GOcontroll Moduline Module slot
+
+maintainers:
+  - Maud Spierings <maudspierings@gocontroll.com>
+
+description:
+  The GOcontroll Moduline module slot represents a connector that fullfills the
+  Moduline slot specification, and can thus house any IO module that is also
+  built to this spec.
+
+properties:
+  compatible:
+    const: gocontroll,moduline-module-slot
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    description: indicates readiness, high means busy.
+    maxItems: 1
+  reset-gpios:
+    description: resets the module, active low.
+    maxItems: 1
+  sync-gpios:
+    description: sync line between all module slots.
+    maxItems: 1
+
+  vdd-supply:
+    description: low power 3v3 supply generally for the microcontroller.
+  vddp-supply:
+    description: medium power 5v0 supply for on module low power peripherals.
+  vddhpp-supply:
+    description: high power 6v-8v supply for on module high power peripherals.
+  power-supply:
+    description: high power 6v-30v supply for high power module circuits.
+
+  i2c-bus:
+    description: i2c bus shared between module slots and the SoC
+    $ref: /schemas/types.yaml#/definitions/phandle
+
+  slot-number:
+    description:
+      The number of the module slot representing the location of on the pcb.
+      This enables access to the modules based on slot location.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  spi-max-frequency: true
+
+required:
+  - compatible
+  - reg
+  - reset-gpios
+  - interrupts
+  - sync-gpios
+  - i2c-bus
+  - slot-number
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        connector@0 {
+            reg = <0>;
+            compatible = "gocontroll,moduline-module-slot";
+            reset-gpios = <&gpio5 10 GPIO_ACTIVE_LOW>;
+            sync-gpios = <&gpio4 16 GPIO_ACTIVE_HIGH>;
+            interrupt-parent = <&gpio4>;
+            interrupts = <5 IRQ_TYPE_EDGE_FALLING>;
+            vdd-supply = <&reg_3v3_per>;
+            vddp-supply = <&reg_5v0>;
+            vddhpp-supply = <&reg_6v4>;
+            i2c-bus = <&i2c2>;
+            slot-number = <1>;
+        };
+    };

-- 
2.48.1



