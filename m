Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9CA5CA5FE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 20:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I4TUfkKfMWSWwb4iVAV5NwfbMTRlzCSu+IdlC1vfaoA=; b=aNNUB1lKgDXhJMg/I/Vu6uQVg/
	He4YP4qSGfDtCAOVKN7b7DdlMkAPDJ2j1hewkalgkOiGj9LqoqFIW8vKlcDDJdpJfflvzpd6osUOc
	I5i7qTFv8i1zgXenRH6DibjUmZsBNPYXRLn4OqHxb38jrSq2FT1FE/or5352vk81qX4gCfB5eNf9o
	LPf8U1iptvtFP3BqWdaf3SRcZ6/9aaBj/vuA0UOGYVy2Fdng3jr64lJVW3dbR3M4lOXkY47+JkWva
	GMsOb7Dx5Lxf4nTPSoDduUa7HmMR/BVfIwzTF8aZtT+b4jQY4nZAUaJaJuFgI8l+E0cmELIlQxJe2
	B6d2HP9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD6hO-0000000E2KA-3ter;
	Sat, 03 Oct 2026 20:51:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD6hJ-0000000E2Ii-0E2F
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Oct 2026 20:51:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CD2AF44519;
	Sat,  3 Oct 2026 20:51:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A55DBC4AF13;
	Sat,  3 Oct 2026 20:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791060668;
	bh=hAswI+y+di4O0xhi0HD2U6PW8nbMtrMfOI7QENBDFcA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=XonjfY9z9lLTRawr6zdxNqW0HrVzKybODu+YiNFMHHf6Vc+4T+gCaWZv7wcM1RLAL
	 mmwouD7YnIwIy3tHFEd1ZTQcZOQWuMJJ+wP5+RoQHlmo9XZs72/3y1xxQecACRVLvT
	 CsLu4W+OrcbKD0N5gSQHFqkrdbpuLPngmZ5jLw/miCoiGHsaOmNse3+jFpu4jyuUmu
	 N9rfU7FfHRajIeOWKM70PCSBIIV2tx3giTz9NUOtMT9nVQHTtY9E61T/s4dY6SU72s
	 QLB11B27BtPEPeeKgSGhAp9Mn8U4A4XokDAerz1JTLDupw68e2xTbBrMmBQesfl8YX
	 TMqNlB8HdNyEg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 917B2CA5FE4;
	Sat,  3 Oct 2026 20:51:08 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Sat, 03 Oct 2026 22:51:00 +0200
Subject: [PATCH v3 1/3] dt-bindings: reset: Add Apple SoC CIO reset
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261003-b4-cio-reset-v3-1-e605f9e5c8a4@kernel.org>
References: <20261003-b4-cio-reset-v3-0-e605f9e5c8a4@kernel.org>
In-Reply-To: <20261003-b4-cio-reset-v3-0-e605f9e5c8a4@kernel.org>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Joshua Peisach <jpeisach@ubuntu.com>, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4557; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=hAswI+y+di4O0xhi0HD2U6PW8nbMtrMfOI7QENBDFcA=;
 b=owGbwMvMwCXmIlirolUq95LxtFoSQ9bBrB1ymcLGT3gEXz933nHli6XPMbXYBftns6h982Hpy
 uH992pyRykLgxgXg6yYIsv2/famTx6+EVy66dJ7mDmsTCBDGLg4BWAitrmMDK+myh8o6TOZV63b
 97Fm2+tbG/ZOfbBOPXjjvQrzut+9p5gZGWZOWcGaskllm0vGygW/Gf5tPFb7oPyplpmNaeT7j5N
 Mi9gA
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407
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

The CIO (USB4/Thunderbolt) blocks on Apple Silicon SoCs have a reset
inside the power manager that has to be deasserted before their
co-processor can be booted. On t8103 each port comes with a dedicated
register page, represented as a standalone node. On t600x a single
register shared by all ports of a die is located in the middle of the
PMGR MMIO region instead, represented as a sub-node of the PMGR syscon.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Sven Peter <sven@kernel.org>
---
 .../devicetree/bindings/arm/apple/apple,pmgr.yaml  | 12 +++++
 .../bindings/reset/apple,t8103-cio-reset.yaml      | 61 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 3 files changed, 74 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml b/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml
index 1d2001836eb4..6429ca685b9d 100644
--- a/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml
+++ b/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml
@@ -61,6 +61,12 @@ patternProperties:
     type: object
     $ref: /schemas/power/apple,pmgr-pwrstate.yaml#
 
+  "reset-controller@[0-9a-f]+$":
+    description:
+      Reset controller for the CIO (USB4/Thunderbolt) blocks
+    type: object
+    $ref: /schemas/reset/apple,t8103-cio-reset.yaml#
+
 required:
   - compatible
   - reg
@@ -105,6 +111,12 @@ examples:
                 label = "uart0";
                 power-domains = <&ps_uart_p>;
             };
+
+            reset-controller@13034 {
+                compatible = "apple,t6000-cio-reset";
+                reg = <0x13034 0x4>;
+                #reset-cells = <1>;
+            };
         };
 
         power-management@23d280000 {
diff --git a/Documentation/devicetree/bindings/reset/apple,t8103-cio-reset.yaml b/Documentation/devicetree/bindings/reset/apple,t8103-cio-reset.yaml
new file mode 100644
index 000000000000..6f602669d242
--- /dev/null
+++ b/Documentation/devicetree/bindings/reset/apple,t8103-cio-reset.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/reset/apple,t8103-cio-reset.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Apple SoC CIO (USB4/Thunderbolt) block reset controller
+
+maintainers:
+  - Sven Peter <sven@kernel.org>
+
+description: |
+  The CIO (Converged I/O) blocks on Apple Silicon SoCs have a reset
+  inside the power manager (PMGR) that has to be deasserted before
+  their co-processor can be booted. On t8103 each port comes with a
+  dedicated register page, represented as a standalone node. On t600x a
+  single register shared by all ports of a die with one request bit per
+  port is used instead. Since this register is located in the middle of
+  the PMGR MMIO region it is represented as a sub-node of the PMGR
+  syscon with reg used as an offset into it.
+
+  In both cases the reset id is the CIO port index on the die.
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - apple,t8103-cio-reset
+          - apple,t6000-cio-reset
+      - items:
+          - const: apple,t8112-cio-reset
+          - const: apple,t8103-cio-reset
+      - items:
+          - const: apple,t6020-cio-reset
+          - const: apple,t6000-cio-reset
+
+  reg:
+    maxItems: 1
+
+  '#reset-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - '#reset-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        reset-controller@23b784000 {
+            compatible = "apple,t8103-cio-reset";
+            reg = <0x2 0x3b784000 0x0 0x8000>;
+            #reset-cells = <1>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 3a19da74d00c..e333c7863460 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2654,6 +2654,7 @@ F:	Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
 F:	Documentation/devicetree/bindings/power/apple*
 F:	Documentation/devicetree/bindings/power/reset/apple,smc-reboot.yaml
 F:	Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml
+F:	Documentation/devicetree/bindings/reset/apple,t8103-cio-reset.yaml
 F:	Documentation/devicetree/bindings/rtc/apple,smc-rtc.yaml
 F:	Documentation/devicetree/bindings/soc/apple/apple,t6000-pmgr-misc.yaml
 F:	Documentation/devicetree/bindings/spi/apple,spi.yaml

-- 
2.55.0



