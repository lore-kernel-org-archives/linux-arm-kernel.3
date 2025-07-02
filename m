Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E4A2C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 23:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2cB3Aizw1EcNWaqzw1LbFYdzbVVOmLjaZ0cCzYJJWyQ=; b=HY50WOh/x57YRaXCmOGPNqrIRc
	l06rWH91heG+JwZRGkDXLjhgQAwNOEN+Kwgdcefn5vYhpemk0NKH29ERiVEEy+4QpPO55KwvFYZa1
	2vXjhsTQLqD9ybrZgQJegvzXHJtDkJ3JoKxGqXlVFCTuzx7jwBioNUN0Q0REwTxa+wZJz5OTFEFEO
	ZNlja/MKck98wn1YLMN6qzJGLddfHg39PAdHA+8+iTzRlINa92VACr+gYiQMWEsQE5h6K6p8HQgYS
	zzD+E8iseb1GPOWZadI437CkBqHx5vsEb4TFoShFD/dLiKtsHCjHfVF/krTVVto5NiV9kmClEZjuj
	2AzPM5wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX6Tm-00000009lAD-0g6a;
	Wed, 02 Jul 2025 23:03:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX6RS-00000009kx2-2v29
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 23:00:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 02B3361142;
	Wed,  2 Jul 2025 23:00:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92B08C4CEEE;
	Wed,  2 Jul 2025 23:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751497235;
	bh=l1Dq2ziWwCy451Reco0CZbXcQxerBHOVbkQIpdPT240=;
	h=From:To:Cc:Subject:Date:From;
	b=NqrK4lF6a7z0RVq/7bt66Zp0oxXtKIpRrzXkFKBfaIJU2s3PFVCsCHLaQgp6YlJc/
	 TueC2n4JXr6dLMf9J9JnCi5wItGV4qNe3OvDTJdNRSAHRpA5r4DMdF+5NJiWVybWZ4
	 cAJCV/mlVduWetQ6BavQ2ldpdlei0IxRi5S13AUvBNhGtqo01kcET9/3dsGvtoVXM0
	 yQHeYo/5W6Usaj5ZokqltI3wSViXNlToX3ZI0+w4+ty7x8YjWi6jtKZRJ/RSjTU4m5
	 LsnKbvE983+S2Q624hX6UZdlF6g7SsGdgo7OJM0xMk5KqkXQWxXjI9ml4xIoWLdQn8
	 4Z7JN7FlAhW5g==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH] dt-binding: thermal: Convert marvell,armada-ap806-thermal to DT schema
Date: Wed,  2 Jul 2025 18:00:29 -0500
Message-ID: <20250702230030.2892116-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Convert the Marvell Armada AP80x/CP110 thermal binding to schema. It is
a straight forward conversion.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../arm/marvell/ap80x-system-controller.txt   | 39 ----------------
 .../arm/marvell/cp110-system-controller.txt   | 43 ------------------
 .../thermal/marvell,armada-ap806-thermal.yaml | 44 +++++++++++++++++++
 3 files changed, 44 insertions(+), 82 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/thermal/marvell,armada-ap806-thermal.yaml

diff --git a/Documentation/devicetree/bindings/arm/marvell/ap80x-system-controller.txt b/Documentation/devicetree/bindings/arm/marvell/ap80x-system-controller.txt
index c83245065d44..72de11bd2ef0 100644
--- a/Documentation/devicetree/bindings/arm/marvell/ap80x-system-controller.txt
+++ b/Documentation/devicetree/bindings/arm/marvell/ap80x-system-controller.txt
@@ -115,45 +115,6 @@ ap_syscon: system-controller@6f4000 {
 SYSTEM CONTROLLER 1
 ===================
 
-Thermal:
---------
-
-For common binding part and usage, refer to
-Documentation/devicetree/bindings/thermal/thermal*.yaml
-
-The thermal IP can probe the temperature all around the processor. It
-may feature several channels, each of them wired to one sensor.
-
-It is possible to setup an overheat interrupt by giving at least one
-critical point to any subnode of the thermal-zone node.
-
-Required properties:
-- compatible: must be one of:
-  * marvell,armada-ap806-thermal
-- reg: register range associated with the thermal functions.
-
-Optional properties:
-- interrupts: overheat interrupt handle. Should point to line 18 of the
-  SEI irqchip. See interrupt-controller/interrupts.txt
-- #thermal-sensor-cells: shall be <1> when thermal-zones subnodes refer
-  to this IP and represents the channel ID. There is one sensor per
-  channel. O refers to the thermal IP internal channel, while positive
-  IDs refer to each CPU.
-
-Example:
-ap_syscon1: system-controller@6f8000 {
-	compatible = "syscon", "simple-mfd";
-	reg = <0x6f8000 0x1000>;
-
-	ap_thermal: thermal-sensor@80 {
-		compatible = "marvell,armada-ap806-thermal";
-		reg = <0x80 0x10>;
-		interrupt-parent = <&sei>;
-		interrupts = <18>;
-		#thermal-sensor-cells = <1>;
-	};
-};
-
 Cluster clocks:
 ---------------
 
diff --git a/Documentation/devicetree/bindings/arm/marvell/cp110-system-controller.txt b/Documentation/devicetree/bindings/arm/marvell/cp110-system-controller.txt
index 9d5d70c98058..54ff9f218328 100644
--- a/Documentation/devicetree/bindings/arm/marvell/cp110-system-controller.txt
+++ b/Documentation/devicetree/bindings/arm/marvell/cp110-system-controller.txt
@@ -189,46 +189,3 @@ CP110_LABEL(syscon0): system-controller@440000 {
 	};
 
 };
-
-SYSTEM CONTROLLER 1
-===================
-
-Thermal:
---------
-
-The thermal IP can probe the temperature all around the processor. It
-may feature several channels, each of them wired to one sensor.
-
-It is possible to setup an overheat interrupt by giving at least one
-critical point to any subnode of the thermal-zone node.
-
-For common binding part and usage, refer to
-Documentation/devicetree/bindings/thermal/thermal*.yaml
-
-Required properties:
-- compatible: must be one of:
-  * marvell,armada-cp110-thermal
-- reg: register range associated with the thermal functions.
-
-Optional properties:
-- interrupts-extended: overheat interrupt handle. Should point to
-  a line of the ICU-SEI irqchip (116 is what is usually used by the
-  firmware). The ICU-SEI will redirect towards interrupt line #37 of the
-  AP SEI which is shared across all CPs.
-  See interrupt-controller/interrupts.txt
-- #thermal-sensor-cells: shall be <1> when thermal-zones subnodes refer
-  to this IP and represents the channel ID. There is one sensor per
-  channel. O refers to the thermal IP internal channel.
-
-Example:
-CP110_LABEL(syscon1): system-controller@6f8000 {
-	compatible = "syscon", "simple-mfd";
-	reg = <0x6f8000 0x1000>;
-
-	CP110_LABEL(thermal): thermal-sensor@70 {
-		compatible = "marvell,armada-cp110-thermal";
-		reg = <0x70 0x10>;
-		interrupts-extended = <&CP110_LABEL(icu_sei) 116 IRQ_TYPE_LEVEL_HIGH>;
-		#thermal-sensor-cells = <1>;
-	};
-};
diff --git a/Documentation/devicetree/bindings/thermal/marvell,armada-ap806-thermal.yaml b/Documentation/devicetree/bindings/thermal/marvell,armada-ap806-thermal.yaml
new file mode 100644
index 000000000000..fdbdf3c1273a
--- /dev/null
+++ b/Documentation/devicetree/bindings/thermal/marvell,armada-ap806-thermal.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/thermal/marvell,armada-ap806-thermal.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Marvell Armada AP80x/CP110 thermal management
+
+maintainers:
+  - Miquel Raynal <miquel.raynal@bootlin.com>
+
+properties:
+  compatible:
+    enum:
+      - marvell,armada-ap806-thermal
+      - marvell,armada-ap807-thermal
+      - marvell,armada-cp110-thermal
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    description: overheat interrupt
+    maxItems: 1
+
+  '#thermal-sensor-cells':
+    description: Cell represents the channel ID. There is one sensor per
+      channel. O refers to the thermal IP internal channel.
+    const: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    thermal-sensor@80 {
+        compatible = "marvell,armada-ap806-thermal";
+        reg = <0x80 0x10>;
+        interrupts = <18>;
+        #thermal-sensor-cells = <1>;
+    };
-- 
2.47.2


