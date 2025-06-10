Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39B16C71137
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 22:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Putbij/kA+CBQebDegJtghO8nOIvAHR4sh6yuiggMtM=; b=GnaGm14KVqI2N67JiSqKd2MLSn
	u4mmmiCvzGZktA/2ya8EyCx6kS1EMxe/l9IQpR1DXU0MTXIeaCtJQRvFmp5cd0YZEeIUEqY12bvEP
	YYcTzxIPvPxV5oYe4Ee1bnjcfigTmYmfxLbNiZCQ02tKGNB2E51VWSyyaxjC8wSw6a7wJo+bSRLsX
	mRYVZDySA9AaJRHWtTkbY4lY5lCpcRTRqQ03WW+FdOjHSMb0RTEblbS8MxMRXFOWZVqQ9STvCU1N/
	EVWKpTJBOV0jrnhyzzddJgvkRePf/5dYdHREpNUInNNG7sgLkSnGl6JdW9wyO7s/dPkNkhQD39VQ0
	uQ//WBxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP7l9-00000008EaX-12Xb;
	Tue, 10 Jun 2025 22:47:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP1Yl-00000007QoM-3daM
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 10 Jun 2025 16:10:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Putbij/kA+CBQebDegJtghO8nOIvAHR4sh6yuiggMtM=; b=b8B2YDChyg++Sx/Rv6LzMlra1R
	1ceo3SFNjaM7sNvT007PQfSPyW5lPinHGZYkf6Ff/9JjwwdbYPjAdFn2ppk6Fj8K1rH7uA/o6O6Ff
	fEl0vnEuiHDikYzeJ6IQUQfVvJNfaBgZ8MrVq22q4lQt+xBf0pMVAjledvepL7uCo/LIZBJQhblvE
	Dg0lKUgVfvUGIhhIi2oqom1u94pnsAgCZS70BwNnCedgqINBUuKJIldq0ThjnnVScpu2XQ20YqgHs
	54SulklQP+Fy0c3yUfc7BqVVkP0/YaZ6RvwpNSnrY2ZFhFPg+h0gpPiVHD9iJUcHgunZkzrvfMYVM
	2BRYV/xg==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP1Yi-00000001vWx-0OVs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 16:10:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C12CB4A8ED;
	Tue, 10 Jun 2025 16:10:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7497DC4CEF5;
	Tue, 10 Jun 2025 16:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749571839;
	bh=MpKAKeLwqqtr6InWSxHm2yFP1y7V+wBCfr1eih7q5s0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=G9NnCBsXt8kGCC4P2yV1eTkrcVdOd6slx53CgMZAGS/LwkaHgRpTU8sj9wqOSyP/5
	 l8gproc3g9WHGAT0m/AODgwchs1E6Tfu81klURZtvPjRw7JZEsJRzNbwsERFQFb1+C
	 B0QQoRcDDOU/6m3+uS/IBPegLuun/WtH8l7yZL6EFryazy9Qe6dfgjtlL8TKGYQkgW
	 PrOHxE2QD9bb4UVqlQgDZguX9ZAAf36hev8rlNz6KA0XgOuMHNVQtRU57LkU999g6P
	 kFy9gRWBdAK4rKH6FhqjVmIIv6ZuU0QClpxVNoGtgPEfE5MFylhUFJ101LmyzMWDyy
	 Z+4wwZl2EyoxA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67AAFC71132;
	Tue, 10 Jun 2025 16:10:39 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Tue, 10 Jun 2025 15:29:44 +0000
Subject: [PATCH v7 03/10] dt-bindings: mfd: Add Apple Mac System Management
 Controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-smc-6-15-v7-3-556cafd771d3@kernel.org>
References: <20250610-smc-6-15-v7-0-556cafd771d3@kernel.org>
In-Reply-To: <20250610-smc-6-15-v7-0-556cafd771d3@kernel.org>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Hector Martin <marcan@marcan.st>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sebastian Reichel <sre@kernel.org>, 
 Lee Jones <lee@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3512; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=MBhTLFSa+MA8vJScnTlr0fsDm4OGdrB/SyplsXOEjuQ=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ4aHf3FjV13HK+arrw96pNce/r7x/cGsvjkNtx8+Uhadv
 C//ftfSjlIWBjEOBlkxRZbt++1Nnzx8I7h006X3MHNYmUCGMHBxCsBE7B4x/Pdgd2xU5+ll2ytw
 bi6L02P2DtejZy2WvgieKndy2jo77i2MDCe+LGPj3LOmoH0e//eDD1Qni87zyQ3JSo83eaFZXnW
 5kBEA
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_171044_639590_2BE8C8AB 
X-CRM114-Status: GOOD (  12.82  )
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

From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>

Add a DT binding for the Apple Mac System Management Controller.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Sven Peter <sven@kernel.org>
---
 .../devicetree/bindings/mfd/apple,smc.yaml         | 79 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 2 files changed, 80 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/apple,smc.yaml b/Documentation/devicetree/bindings/mfd/apple,smc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..8a10e270d421ecd703848f64af597de351fcfd74
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/apple,smc.yaml
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/apple,smc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Apple Mac System Management Controller
+
+maintainers:
+  - Sven Peter <sven@kernel.org>
+
+description:
+  Apple Mac System Management Controller implements various functions
+  such as GPIO, RTC, power, reboot.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - apple,t6000-smc
+          - apple,t8103-smc
+          - apple,t8112-smc
+      - const: apple,smc
+
+  reg:
+    items:
+      - description: SMC area
+      - description: SRAM area
+
+  reg-names:
+    items:
+      - const: smc
+      - const: sram
+
+  mboxes:
+    maxItems: 1
+
+  gpio:
+    $ref: /schemas/gpio/apple,smc-gpio.yaml
+
+  reboot:
+    $ref: /schemas/power/reset/apple,smc-reboot.yaml
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - mboxes
+
+examples:
+  - |
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      smc@23e400000 {
+        compatible = "apple,t8103-smc", "apple,smc";
+        reg = <0x2 0x3e400000 0x0 0x4000>,
+               <0x2 0x3fe00000 0x0 0x100000>;
+        reg-names = "smc", "sram";
+        mboxes = <&smc_mbox>;
+
+        smc_gpio: gpio {
+          compatible = "apple,smc-gpio";
+          gpio-controller;
+          #gpio-cells = <2>;
+        };
+
+        reboot {
+          compatible = "apple,smc-reboot";
+          nvmem-cells = <&shutdown_flag>, <&boot_stage>,
+                        <&boot_error_count>, <&panic_count>;
+          nvmem-cell-names = "shutdown_flag", "boot_stage",
+                             "boot_error_count", "panic_count";
+        };
+      };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 1dd004f7dff669e3a3609e5f1702887129d8ff35..329b2df08d4b1039948e54353c5815e23ae65e77 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2339,6 +2339,7 @@ F:	Documentation/devicetree/bindings/iommu/apple,dart.yaml
 F:	Documentation/devicetree/bindings/iommu/apple,sart.yaml
 F:	Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml
 F:	Documentation/devicetree/bindings/mailbox/apple,mailbox.yaml
+F:	Documentation/devicetree/bindings/mfd/apple,smc.yaml
 F:	Documentation/devicetree/bindings/net/bluetooth/brcm,bcm4377-bluetooth.yaml
 F:	Documentation/devicetree/bindings/nvme/apple,nvme-ans.yaml
 F:	Documentation/devicetree/bindings/nvmem/apple,efuses.yaml

-- 
2.34.1



