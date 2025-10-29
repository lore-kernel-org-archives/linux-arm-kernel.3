Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E164CCF9EE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 18:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YsBOpAAqa1N3JbCYBbVWgB5n+zm6R9AZZTXVVHL0rwI=; b=n0JpbwB4I8NJc2+zDijJbquf2o
	03/m6uSg2HJAuXuOBI3vOp/92AmlqW0kgOD7ya4sZX8xJpsPfIpwH5iV7XblZdejFgNTZ34fw8zax
	lp7I16PaaKYUB6/oBTmSUhaGTj0hmt4jzpm2Mgs9rQXU9zmsyrNCbc7rfVNuJC5es8GSMr5RsyRSd
	mwC3jUvp8SMNF9Sh2bQjda1DaNHeKHfnqSwcToAUbK0pr2zBwDml//cjgJU/DGK6m4vKrMNy4sVLh
	9wnYCrwwOaNIk14pXdHIGwTEDh8+Ntu3NHp28MqQztp2QNoa8vf5ljea6yrY9vCQlZXyL/3XQDw/a
	gRp4astg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEBJx-00000002TfU-3YDX;
	Wed, 29 Oct 2025 18:54:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEBJw-00000002Tel-0RmZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 18:54:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6E3B241AAF;
	Wed, 29 Oct 2025 18:54:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7164C4CEF8;
	Wed, 29 Oct 2025 18:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761764095;
	bh=Ux2ENO/i6V+guiQo5qhqzoW+zBs4ctUVICsR7hoAkmM=;
	h=From:To:Cc:Subject:Date:From;
	b=sVS4zzVoWEbn3QNcolgohy69sS19mV2rlckr+Nb1zlcn94jHeFxnwQuWxg2DHk6BR
	 igkJp82NMhShSfHOAPUq24eD+mGpH0QvxJv5r2lWjm9GKBe3az64cj9fhB0eZGaidy
	 GtcLGhr4poM+za/wWzkLrP2at6lO0Bhu58WHOlV5yNHL7cswjeNgNX3vOkTdBy11BH
	 Ax2+WrZY59Ww4m0riErBCGxbdr7U53xiZeruL+TohdZjmleelKKid3663ihTaWc/NG
	 rHGxe2y6yJMfGcbI6AGlNEtck/TQC+G2RhMfqKzDX1qVj1LKBNW/oR+U+dQTVXGUbX
	 aBEXlLI3AR2jQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: hwmon: Convert aspeed,ast2400-pwm-tacho to DT schema
Date: Wed, 29 Oct 2025 13:54:47 -0500
Message-ID: <20251029185448.2121857-1-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_115456_187108_5FB7449A 
X-CRM114-Status: GOOD (  18.98  )
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

Convert the ASpeed fan controller binding to DT schema format.

The '#cooling-cells' value used is 1 rather than 2. '#size-cells' is 0
rather 1.

Some users define more that 8 fan nodes where 2 fans share a PWM. The
driver seems to let the 2nd fan just overwrite the 1st one. That also
creates some addressing errors in the DT (duplicate addresses and wrong
unit-addresses).

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../hwmon/aspeed,ast2400-pwm-tacho.yaml       | 105 ++++++++++++++++++
 .../bindings/hwmon/aspeed-pwm-tacho.txt       |  73 ------------
 2 files changed, 105 insertions(+), 73 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/aspeed,ast2400-pwm-tacho.yaml
 delete mode 100644 Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt

diff --git a/Documentation/devicetree/bindings/hwmon/aspeed,ast2400-pwm-tacho.yaml b/Documentation/devicetree/bindings/hwmon/aspeed,ast2400-pwm-tacho.yaml
new file mode 100644
index 000000000000..018249f97a5d
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/aspeed,ast2400-pwm-tacho.yaml
@@ -0,0 +1,105 @@
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/aspeed,ast2400-pwm-tacho.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ASPEED AST2400/AST2500 PWM and Fan Tacho controller
+
+maintainers:
+  - Joel Stanley <joel@jms.id.au>
+  - Andrew Jeffery <andrew@codeconstruct.com.au>
+
+description: >
+  The ASPEED PWM controller can support upto 8 PWM outputs. The ASPEED Fan Tacho
+  controller can support upto 16 Fan tachometer inputs.
+
+  There can be up to 8 fans supported. Each fan can have 1 PWM output and
+  1-2 Fan tach inputs.
+
+properties:
+  compatible:
+    enum:
+      - aspeed,ast2400-pwm-tacho
+      - aspeed,ast2500-pwm-tacho
+
+  reg:
+    maxItems: 1
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+  '#cooling-cells':
+    const: 1
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+patternProperties:
+  '^fan@[0-7]$':
+    description: Fan subnode
+    type: object
+    additionalProperties: false
+
+    properties:
+      reg:
+        description: PWM source port index (0 = PWM A, ..., 7 = PWM H)
+        maximum: 7
+
+      cooling-levels:
+        description: PWM duty cycle values for cooling states
+        $ref: /schemas/types.yaml#/definitions/uint8-array
+        minItems: 1
+        maxItems: 16  # Should be enough
+
+      aspeed,fan-tach-ch:
+        description: Fan tachometer input channel
+        $ref: /schemas/types.yaml#/definitions/uint8-array
+        minItems: 1
+        maxItems: 2
+        items:
+          maximum: 15
+
+    required:
+      - reg
+      - aspeed,fan-tach-ch
+
+required:
+  - compatible
+  - reg
+  - '#address-cells'
+  - '#size-cells'
+  - clocks
+  - resets
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/aspeed-clock.h>
+
+    fan-controller@1e786000 {
+        compatible = "aspeed,ast2500-pwm-tacho";
+        reg = <0x1e786000 0x1000>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+        #cooling-cells = <1>;
+        clocks = <&syscon ASPEED_CLK_APB>;
+        resets = <&syscon ASPEED_RESET_PWM>;
+
+        fan@0 {
+            reg = <0x00>;
+            cooling-levels = /bits/ 8 <125 151 177 203 229 255>;
+            aspeed,fan-tach-ch = /bits/ 8 <0x00>;
+        };
+
+        fan@1 {
+            reg = <0x01>;
+            aspeed,fan-tach-ch = /bits/ 8 <0x01 0x02>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt b/Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt
deleted file mode 100644
index 8645cd3b867a..000000000000
--- a/Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt
+++ /dev/null
@@ -1,73 +0,0 @@
-ASPEED AST2400/AST2500 PWM and Fan Tacho controller device driver
-
-The ASPEED PWM controller can support upto 8 PWM outputs. The ASPEED Fan Tacho
-controller can support upto 16 Fan tachometer inputs.
-
-There can be upto 8 fans supported. Each fan can have one PWM output and
-one/two Fan tach inputs.
-
-Required properties for pwm-tacho node:
-- #address-cells : should be 1.
-
-- #size-cells : should be 1.
-
-- #cooling-cells: should be 2.
-
-- reg : address and length of the register set for the device.
-
-- pinctrl-names : a pinctrl state named "default" must be defined.
-
-- pinctrl-0 : phandle referencing pin configuration of the PWM ports.
-
-- compatible : should be "aspeed,ast2400-pwm-tacho" for AST2400 and
-	       "aspeed,ast2500-pwm-tacho" for AST2500.
-
-- clocks : phandle to clock provider with the clock number in the second cell
-
-- resets : phandle to reset controller with the reset number in the second cell
-
-fan subnode format:
-===================
-Under fan subnode there can upto 8 child nodes, with each child node
-representing a fan. If there are 8 fans each fan can have one PWM port and
-one/two Fan tach inputs.
-For PWM port can be configured cooling-levels to create cooling device.
-Cooling device could be bound to a thermal zone for the thermal control.
-
-Required properties for each child node:
-- reg : should specify PWM source port.
-	integer value in the range 0 to 7 with 0 indicating PWM port A and
-	7 indicating PWM port H.
-
-- cooling-levels: PWM duty cycle values in a range from 0 to 255
-                  which correspond to thermal cooling states.
-
-- aspeed,fan-tach-ch : should specify the Fan tach input channel.
-                integer value in the range 0 through 15, with 0 indicating
-		Fan tach channel 0 and 15 indicating Fan tach channel 15.
-		At least one Fan tach input channel is required.
-
-Examples:
-
-pwm_tacho: pwmtachocontroller@1e786000 {
-	#address-cells = <1>;
-	#size-cells = <1>;
-	#cooling-cells = <2>;
-	reg = <0x1E786000 0x1000>;
-	compatible = "aspeed,ast2500-pwm-tacho";
-	clocks = <&syscon ASPEED_CLK_APB>;
-	resets = <&syscon ASPEED_RESET_PWM>;
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_pwm0_default &pinctrl_pwm1_default>;
-
-	fan@0 {
-		reg = <0x00>;
-		cooling-levels = /bits/ 8 <125 151 177 203 229 255>;
-		aspeed,fan-tach-ch = /bits/ 8 <0x00>;
-	};
-
-	fan@1 {
-		reg = <0x01>;
-		aspeed,fan-tach-ch = /bits/ 8 <0x01 0x02>;
-	};
-};
-- 
2.51.0


