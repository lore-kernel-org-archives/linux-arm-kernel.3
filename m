Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D74A9C5DF94
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 15:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lE/rYSgTu+7vVlM7Q/N7mTybmAXAnYZ3Hp73xUd/q4E=; b=MbKA1b24hRDL6cMTevbs79rgNj
	sw+rRphBHjCtGONXTdLTzgQkc79XS5vKV4QY9JT4+a6edkZ3ze6zZhRYcb97yQgMfWPeXXl6AvXhK
	ZUxhPiGZ0BCiEByzmNbQgDlcvCqUC69c5Cm0sg4+3qanG3CTHrPEPkXP6+2/dfDbkx9R5nfIz+iY4
	nb+3XRIO43XGy0pt2j+gtoyTJIw4O16a3VwY/SXKOlMlNSDVLJp9OWCuMaZA8rrqCDMz1/YAxKSzK
	RZ2vYSJ71FYmpw/El/e/NCM1zeFc9sCe6x/YquLT5ya6BCAY0al7wWGHK9g+8j1dDX0unswa6lVeb
	7MmXPERA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxRRG-0000000DiRB-2FqV;
	Fri, 21 Aug 2026 15:45:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxRRD-0000000DiPf-2xYv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 15:45:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EA61A6187C;
	Fri, 21 Aug 2026 15:45:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8FF1BC2BCF4;
	Fri, 21 Aug 2026 15:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787327146;
	bh=+ixko2Bt0RcawsuOfq9EeeMloylw3ayN6yWX9GXtlRI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=dsg9dIclTvdZX2VEI3Zx4breRowsGScDS9Zr+W0bSyJK2HKzoVlH2yvzHeGlID3aQ
	 JMzwlMT0VEvpIuqsiKLcMbZvcW5lN292PfcN25ltMRnff2naQboIvRo/YeoMnxBwZa
	 zqGsRQDaTSg8rD+QEw+bYqO+aStcza2gqjGq1A4VN4KT6b7vaoud3dDG0pYWnjt0Vl
	 JCF+8yiui9IggyZ/eUbNmIZ7lsipqLqmLodjjbynNwttNqdh21Q2LW0DTC7AxHBatA
	 lXZ3NntI+K0bP1BadXUoivEYj6nAUXME3wsTMy7ZmflVNofvRmW5Eas3RUuX/iofzA
	 Akp3rEwfn4B1A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ED1AC5DF7D;
	Fri, 21 Aug 2026 15:45:46 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Fri, 21 Aug 2026 17:44:54 +0200
Subject: [PATCH v2 1/3] dt-bindings: reset: Add Apple SoC CIO reset
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-b4-cio-reset-v2-1-2d045f80a424@kernel.org>
References: <20260821-b4-cio-reset-v2-0-2d045f80a424@kernel.org>
In-Reply-To: <20260821-b4-cio-reset-v2-0-2d045f80a424@kernel.org>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Joshua Peisach <jpeisach@ubuntu.com>, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4541; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=+ixko2Bt0RcawsuOfq9EeeMloylw3ayN6yWX9GXtlRI=;
 b=owGbwMvMwCXmIlirolUq95LxtFoSQ1ZH0bKdNpa/NnYFXzwkcf7KcrnH86OqN98KO9jP7P532
 9PXkbd3d5SyMIhxMciKKbJs329v+uThG8Glmy69h5nDygQyhIGLUwAmwsfIyDDLZrNhekGTYeF1
 DvPtq/3v+PMrpRqcE+Tqznsb1XJPM4OR4drV/qsXw3ma/a49PBD0+6kSz0uVqaYZE0pmXLqXzyy
 exgMA
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
index c67b67ba065a..49b4bec36461 100644
--- a/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml
+++ b/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml
@@ -59,6 +59,12 @@ patternProperties:
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
@@ -103,6 +109,12 @@ examples:
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
index 8014b9f8253e..e1ec54f4d80e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2606,6 +2606,7 @@ F:	Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
 F:	Documentation/devicetree/bindings/power/apple*
 F:	Documentation/devicetree/bindings/power/reset/apple,smc-reboot.yaml
 F:	Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml
+F:	Documentation/devicetree/bindings/reset/apple,t8103-cio-reset.yaml
 F:	Documentation/devicetree/bindings/rtc/apple,smc-rtc.yaml
 F:	Documentation/devicetree/bindings/spi/apple,spi.yaml
 F:	Documentation/devicetree/bindings/spmi/apple,spmi.yaml

-- 
2.55.0



