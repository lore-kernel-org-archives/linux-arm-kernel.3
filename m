Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB2D0C36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 22:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=plvsvbHZrGBbQxxrd0WmILXR8Yciz+CcWUbCLwqlqxY=; b=kRAoBudSZ6dmfaqSOHxDnoYwIZ
	qzNi0LhWp+Y1MaqBRU6ait0tLtowbQs5pj60CTkZuJTARfczgjlfjvoWXhhGyE83YFw3cHjkwz8gd
	ujeHtkqn8/oS5KBgbKCfzIqijs/z6idWcJHmJxKnadkLMJa+bAEXP4YcIh2+5T/TiyrOad3jmpE4D
	fjUo78zCILoAHJ7LgoMlxwbnr8iWfbFY4HxF/TbL/m5XWg1ORKkX+flpNDyyoM5kESnhbKPQWi8s5
	zDKFxgAtPOfrY7JoH+TbRVzuYH95IYnpLT2U4pzFJ0bKZkTu0vJaoWpZEbj0+Lk2NMykCIT3yorAe
	PUXndMew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2dZh-00000008fag-3khb;
	Wed, 09 Apr 2025 22:07:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2dLX-00000008dTe-07CI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 21:52:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 47364452BB;
	Wed,  9 Apr 2025 21:52:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D397CC4CEE2;
	Wed,  9 Apr 2025 21:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744235553;
	bh=58+w0lhd+J1mGi9AuOWwOwmXB6IzavnsSwQ2CK9L2aI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=IjjcXZuqo2a7giHXOCyU7SSYrrF7tC7M3yBKQUFPkfkfZ1FQRpPkZsCz+ICpl7zI6
	 vrUoW0nRy6E1QKKASKUvrRFQs3M8ad4EQE5X6dAOZbT+mbiQBSD8TN5iNz7KIMZ2lI
	 e2syZt/RagThC6m5gdzfQb+TSQ3FAAQaokPBQxe+a1f3ppJ6FVbOy/QZ7neRwbO1KQ
	 vJjNtwSW3REmRrq+NeNRfMAUOoPNAUuNuJQzq49IwpOHsAFwS/kHXimL/dLWvPHJ0X
	 rkg+B+lutN9Yus6iQQjUZxyI56ZgEIoDX4tnI5Mh1bEu1ua/CtS1fTS4XZZ/AILWab
	 KqDaZBZ6tS6QQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF0A4C369A2;
	Wed,  9 Apr 2025 21:52:33 +0000 (UTC)
From: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Date: Wed, 09 Apr 2025 23:52:12 +0200
Subject: [PATCH v4 1/3] dt-bindings: spmi: Add Apple SPMI controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250409-spmi-v4-1-eb81ecfd1f64@gmail.com>
References: <20250409-spmi-v4-0-eb81ecfd1f64@gmail.com>
In-Reply-To: <20250409-spmi-v4-0-eb81ecfd1f64@gmail.com>
To: Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Neal Gompa <neal@gompa.dev>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744235551; l=2425;
 i=fnkl.kernel@gmail.com; s=20241124; h=from:subject:message-id;
 bh=zl8cAzlIaOxUvOq3GfN8ra0zdMLJS6X1fL7CB5qh1Fo=;
 b=iG3+aBox6UlVraYoVxIUbfXcpwfTTfLIUW2EZkGMOQ+VEe20sGyDmFBR4Vt/Kw1EGLDZhmFwN
 qu15DziQmh8AWJtVuLlx4RskGTk8SdL+tZsR6Dzpcpl6OnZt17Q8SV3
X-Developer-Key: i=fnkl.kernel@gmail.com; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-Endpoint-Received: by B4 Relay for fnkl.kernel@gmail.com/20241124 with
 auth_id=283
X-Original-From: Sasha Finkelstein <fnkl.kernel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_145235_111549_B76AB58B 
X-CRM114-Status: GOOD (  12.47  )
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
Reply-To: fnkl.kernel@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Sasha Finkelstein <fnkl.kernel@gmail.com>

Add bindings for the SPMI controller present on most Apple SoCs

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Sven Peter <sven@svenpeter.dev>
Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
---
 .../devicetree/bindings/spmi/apple,spmi.yaml       | 49 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 2 files changed, 50 insertions(+)

diff --git a/Documentation/devicetree/bindings/spmi/apple,spmi.yaml b/Documentation/devicetree/bindings/spmi/apple,spmi.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..16bd7eb2b7af2c0b176f0e5b1970f4670af691da
--- /dev/null
+++ b/Documentation/devicetree/bindings/spmi/apple,spmi.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/spmi/apple,spmi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Apple SPMI controller
+
+maintainers:
+  - Sasha Finkelstein <fnkl.kernel@gmail.com>
+
+description: A SPMI controller present on most Apple SoCs
+
+allOf:
+  - $ref: spmi.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - apple,t8103-spmi
+          - apple,t6000-spmi
+          - apple,t8112-spmi
+      - const: apple,spmi
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/spmi/spmi.h>
+
+    spmi@920a1300 {
+        compatible = "apple,t6000-spmi", "apple,spmi";
+        reg = <0x920a1300 0x100>;
+        #address-cells = <2>;
+        #size-cells = <0>;
+
+        pmic@f {
+            reg = <0xf SPMI_USID>;
+            /* PMIC-specific properties */
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 96b82704950184bd71623ff41fc4df31e4c7fe87..5f348736ea0bbdb83fe541c872103ce4835de40b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2282,6 +2282,7 @@ F:	Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
 F:	Documentation/devicetree/bindings/power/apple*
 F:	Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml
 F:	Documentation/devicetree/bindings/spi/apple,spi.yaml
+F:	Documentation/devicetree/bindings/spmi/apple,spmi.yaml
 F:	Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
 F:	arch/arm64/boot/dts/apple/
 F:	drivers/bluetooth/hci_bcm4377.c

-- 
2.49.0



