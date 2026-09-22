Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E395C98302
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 19:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Nb71XVGxN3R2MxtTDnL6kdmJZRIDV18V8tQLOUcQmgg=; b=CCf024S/hkS/0MK9rjMo6oI8fJ
	cKoYHpenhuBo/8vVTT+8V6lsxKx0EeAQmy5589tTjvbRbI4tJ0nfHPusOevDem0vGc1SCqNzgekRY
	Gbcl7Qp/seSKYEoUYriREQPQK1C2vLHXcpGa7zS/sAGop/P94ZLPOyHxCqiReOMzwqbROfDc4XiSw
	hHQTJQp0Q2dicn0CCsccWzY/wFQE+dQjPsUKI74UGEvY4fXUHBG7oxllnI/FSVrGpwx7YpyIsf1ZT
	3jhSgqCgRdDKQ4XUhCveNLIl2n/7G9t/r9c6bjo4exzCUdLwJv8hR2Jl9/bdJ/n+/cevZ8bYVdzI1
	0x9RbI3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x96a8-00000006SmW-0jk7;
	Tue, 22 Sep 2026 19:55:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x96a5-00000006Slm-3v1R;
	Tue, 22 Sep 2026 19:55:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5D997602CA;
	Tue, 22 Sep 2026 19:55:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF8651F000FF;
	Tue, 22 Sep 2026 19:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790106909;
	bh=Nb71XVGxN3R2MxtTDnL6kdmJZRIDV18V8tQLOUcQmgg=;
	h=From:To:Cc:Subject:Date;
	b=owJgOB2/8rdgNyaNK1+qLqitv68/0OEjLdptIlSe/fdtbMnHxe+DjD7HkrWuGsRHl
	 o83W2Oa0KeBipjmt/+/g+lycb7TKtzwGispk8Q402idhuHmX3aL7VSC2ncW8VMqjDy
	 nrVXy9WdZ5ro8nYW6pgRyMm1pSSJDZ9phRrghE0+aps3WnoIBg8NbYJ5GonJB/nXtv
	 Xb/feolKhIxsLeeWw5NsPf1mObD6z48NrzmZUxewYadXHhaDytKeTBPvbXFpL1DigA
	 8vL4M9gV/gQ0KCsA81gDcZDWcgZoRg8wOOeMTC/txLeIn0D5AvUN+xYJ5fXPK5OYx1
	 ZU88eKGOd2uMQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Flora Fu <flora.fu@mediatek.com>,
	Alexandre Mergnat <amergnat@baylibre.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] regulator: dt-bindings: Convert mediatek,mt6380-regulator to DT schema
Date: Tue, 22 Sep 2026 14:55:01 -0500
Message-ID: <20260922195502.818012-1-robh@kernel.org>
X-Mailer: git-send-email 2.53.0
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

Convert the MediaTek mediatek,mt6380-regulator binding to DT schema
format. It's a straight forward conversion.

The regulators are part of the "pwrap" block, so add a $ref to them.

Assisted-by: LLM
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../regulator/mediatek,mt6380-regulator.yaml  | 117 ++++++++++++++++++
 .../bindings/regulator/mt6380-regulator.txt   |  89 -------------
 .../bindings/soc/mediatek/mediatek,pwrap.yaml |   3 +
 3 files changed, 120 insertions(+), 89 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6380-regulator.yaml
 delete mode 100644 Documentation/devicetree/bindings/regulator/mt6380-regulator.txt

diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6380-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6380-regulator.yaml
new file mode 100644
index 000000000000..0b3c604da727
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6380-regulator.yaml
@@ -0,0 +1,117 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/mediatek,mt6380-regulator.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT6380 Regulator
+
+maintainers:
+  - Sean Wang <sean.wang@mediatek.com>
+
+properties:
+  compatible:
+    const: mediatek,mt6380-regulator
+
+patternProperties:
+  '^buck-(vcore1?|vrf)$':
+    description: BUCK regulators
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+
+    required:
+      - regulator-min-microvolt
+      - regulator-max-microvolt
+      - regulator-ramp-delay
+
+  '^ldo-v([mat]|phy|ddr)$':
+    type: object
+    description: LDO regulators
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+
+    required:
+      - regulator-min-microvolt
+      - regulator-max-microvolt
+      - regulator-ramp-delay
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    regulators {
+        compatible = "mediatek,mt6380-regulator";
+
+        buck-vcore1 {
+            regulator-name = "vcore1";
+            regulator-min-microvolt = <600000>;
+            regulator-max-microvolt = <1393750>;
+            regulator-ramp-delay = <6250>;
+            regulator-always-on;
+            regulator-boot-on;
+        };
+
+        buck-vcore {
+            regulator-name = "vcore";
+            regulator-min-microvolt = <600000>;
+            regulator-max-microvolt = <1393750>;
+            regulator-ramp-delay = <6250>;
+        };
+
+        buck-vrf {
+            regulator-name = "vrf";
+            regulator-min-microvolt = <1200000>;
+            regulator-max-microvolt = <1575000>;
+            regulator-ramp-delay = <0>;
+            regulator-always-on;
+            regulator-boot-on;
+        };
+
+        ldo-vm {
+            regulator-name = "vm";
+            regulator-min-microvolt = <1050000>;
+            regulator-max-microvolt = <1400000>;
+            regulator-ramp-delay = <0>;
+            regulator-always-on;
+            regulator-boot-on;
+        };
+
+        ldo-va {
+            regulator-name = "va";
+            regulator-min-microvolt = <2200000>;
+            regulator-max-microvolt = <3300000>;
+            regulator-ramp-delay = <0>;
+            regulator-always-on;
+            regulator-boot-on;
+        };
+
+        ldo-vphy {
+            regulator-name = "vphy";
+            regulator-min-microvolt = <1800000>;
+            regulator-max-microvolt = <1800000>;
+            regulator-ramp-delay = <0>;
+            regulator-always-on;
+            regulator-boot-on;
+        };
+
+        ldo-vddr {
+            regulator-name = "vddr";
+            regulator-min-microvolt = <1240000>;
+            regulator-max-microvolt = <1840000>;
+            regulator-ramp-delay = <0>;
+            regulator-always-on;
+            regulator-boot-on;
+        };
+
+        ldo-vt {
+            regulator-name = "vt";
+            regulator-min-microvolt = <2200000>;
+            regulator-max-microvolt = <3300000>;
+            regulator-ramp-delay = <0>;
+            regulator-always-on;
+            regulator-boot-on;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/regulator/mt6380-regulator.txt b/Documentation/devicetree/bindings/regulator/mt6380-regulator.txt
deleted file mode 100644
index 0058441f16d2..000000000000
--- a/Documentation/devicetree/bindings/regulator/mt6380-regulator.txt
+++ /dev/null
@@ -1,89 +0,0 @@
-MediaTek MT6380 Regulator
-
-All voltage regulators provided by the MT6380 PMIC are described as the
-subnodes of the MT6380 regulators node. Each regulator is named according
-to its regulator type, buck-<name> and ldo-<name>. The definition for each
-of these nodes is defined using the standard binding for regulators at
-Documentation/devicetree/bindings/regulator/regulator.txt.
-
-The valid names for regulators are:
-BUCK:
-  buck-core1, buck-vcore, buck-vrf
-LDO:
-  ldo-vm ,ldo-va , ldo-vphy, ldo-vddr, ldo-vt
-
-Example:
-
-	regulators {
-		compatible = "mediatek,mt6380-regulator";
-
-		mt6380_vcpu_reg: buck-vcore1 {
-			regulator-name = "vcore1";
-			regulator-min-microvolt = < 600000>;
-			regulator-max-microvolt = <1393750>;
-			regulator-ramp-delay = <6250>;
-			regulator-always-on;
-			regulator-boot-on;
-		};
-
-		mt6380_vcore_reg: buck-vcore {
-			regulator-name = "vcore";
-			regulator-min-microvolt = <600000>;
-			regulator-max-microvolt = <1393750>;
-			regulator-ramp-delay = <6250>;
-		};
-
-		mt6380_vrf_reg: buck-vrf {
-			regulator-name = "vrf";
-			regulator-min-microvolt = <1200000>;
-			regulator-max-microvolt = <1575000>;
-			regulator-ramp-delay = <0>;
-			regulator-always-on;
-			regulator-boot-on;
-		};
-
-		mt6380_vm_reg: ldo-vm {
-			regulator-name = "vm";
-			regulator-min-microvolt = <1050000>;
-			regulator-max-microvolt = <1400000>;
-			regulator-ramp-delay = <0>;
-			regulator-always-on;
-			regulator-boot-on;
-		};
-
-		mt6380_va_reg: ldo-va {
-			regulator-name = "va";
-			regulator-min-microvolt = <2200000>;
-			regulator-max-microvolt = <3300000>;
-			regulator-ramp-delay = <0>;
-			regulator-always-on;
-			regulator-boot-on;
-		};
-
-		mt6380_vphy_reg: ldo-vphy {
-			regulator-name = "vphy";
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-			regulator-ramp-delay = <0>;
-			regulator-always-on;
-			regulator-boot-on;
-		};
-
-		mt6380_vddr_reg: ldo-vddr {
-			regulator-name = "vddr";
-			regulator-min-microvolt = <1240000>;
-			regulator-max-microvolt = <1840000>;
-			regulator-ramp-delay = <0>;
-			regulator-always-on;
-			regulator-boot-on;
-		};
-
-		mt6380_vt_reg: ldo-vt {
-			regulator-name = "vt";
-			regulator-min-microvolt = <2200000>;
-			regulator-max-microvolt = <3300000>;
-			regulator-ramp-delay = <0>;
-			regulator-always-on;
-			regulator-boot-on;
-		};
-	};
diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
index e7c4a3984c60..79b755858bad 100644
--- a/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
+++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
@@ -105,6 +105,9 @@ properties:
   pmic:
     type: object
 
+  regulators:
+    $ref: /schemas/regulator/mediatek,mt6380-regulator.yaml#
+
 required:
   - compatible
   - reg
-- 
2.53.0


