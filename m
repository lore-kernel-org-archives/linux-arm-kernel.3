Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3650CCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 08:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ACyxMecizYW12J23tXuRIyhftReZ8PH9vxzdX/cHOv4=; b=j1dpXO0kA81LtkqBgG3urhK9tS
	EhhRy8OSYQO1YIO1/sJ4em2JuYH27g/i5G7gR1bV13DqBrQ9pIAGE+I1z+OuK7T63h3vXlGcauutM
	v2ZvymU4+Kt5AOl9+0rHwNgeunVNnkEvNn0/l74Sf2waJe3bX0etjTZ78S/e5Q5m9zII1VXTNzqUH
	zzJ3Uu2TTWVo2GzGZ8JMv7e2OA2mqZC85y+4KudphZWH4/nB0RXV7BnNkeNPBpuroYtHkBK76PN9J
	hy6HgzyDt6Ed703ID4aZWe8ZnCs5cpaeAnTcJHSJSEFMUiymM4141vJnvBcmV/L5UfjERDCOh1VlK
	ftP/VhxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCDE5-00000008gNr-2JXf;
	Fri, 24 Oct 2025 08:32:45 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCDE2-00000008gLg-1gpv;
	Fri, 24 Oct 2025 08:32:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1761294759;
	bh=Xbh+qFQgQocth6/B470ZtHunlKrpzoudANOpCUxtQM8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mj3y1br7Pnos3rilPQ+XNWxD2cis82VD+DLhpSD841g2EcOVJxfzx1spFuPCfQEP+
	 JYG8hdsPY7BnkE0s4HbPBTL16ouWZ+1NUUgYYpPIWnEYOQPzqdsEvcOSRDNZ3Yjel3
	 l4hSsq4OHAtgJdqs8NyYZltb2BBvfx5BteJhAlhfsIcwL5LCnygsbByeki0dmC4LiB
	 vgN+YK1cbOmv1Knvqh0FJP1GarY6WeWDSnepKazqd7ksxkJzTDXIaiVcHQLBqDnKxx
	 0NQD38sSNeYukZcT0jIple+5mxUUiFLP3lyneHTFAdCw8LFM32vZ5NC9aPyr1/RCT+
	 L3bEXUzEe/Wbw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A731517E1310;
	Fri, 24 Oct 2025 10:32:38 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	wenst@chromium.org,
	igor.belwon@mentallysanemainliners.org
Subject: [PATCH v10 1/9] dt-bindings: regulator: Document MediaTek MT6316 PMIC Regulators
Date: Fri, 24 Oct 2025 10:32:13 +0200
Message-ID: <20251024083221.25758-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251024083221.25758-1-angelogioacchino.delregno@collabora.com>
References: <20251024083221.25758-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_013242_595819_1E68EE95 
X-CRM114-Status: GOOD (  13.76  )
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

Add bindings for the regulators found in the MediaTek MT6316 PMIC,
usually found in board designs using the MT6991 Dimensity 9400 and
on MT8196 Kompanio SoC for Chromebooks.

This chip is fully controlled by SPMI and has multiple variants
providing different phase configurations.

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../regulator/mediatek,mt6316b-regulator.yaml | 78 +++++++++++++++++++
 .../regulator/mediatek,mt6316c-regulator.yaml | 78 +++++++++++++++++++
 .../regulator/mediatek,mt6316d-regulator.yaml | 77 ++++++++++++++++++
 3 files changed, 233 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6316b-regulator.yaml
 create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6316c-regulator.yaml
 create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6316d-regulator.yaml

diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6316b-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6316b-regulator.yaml
new file mode 100644
index 000000000000..65b70dd90728
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6316b-regulator.yaml
@@ -0,0 +1,78 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/mediatek,mt6316b-regulator.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT6316 BP/VP SPMI PMIC Regulators
+
+maintainers:
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+
+description:
+  The MediaTek MT6316BP/VP PMICs are fully controlled by SPMI interface, both
+  feature four step-down DC/DC (buck) converters, and provides 2+2 Phases,
+  joining Buck 1+2 for the first phase, and Buck 3+4 for the second phase.
+
+properties:
+  compatible:
+    const: mediatek,mt6316b-regulator
+
+  reg:
+    maxItems: 1
+
+patternProperties:
+  "^vbuck(12|34)$":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    properties:
+      regulator-allowed-modes:
+        description: |
+          Allowed Buck regulator operating modes allowed. Valid values below.
+            0 - Normal mode with automatic power saving, reducing the switching
+                frequency when light load conditions are detected
+            1 - Forced Continuous Conduction mode (FCCM) for improved voltage
+                regulation accuracy with constant switching frequency but lower
+                regulator efficiency
+            2 - Forced Low Power mode for improved regulator efficiency, used
+                when no heavy load is expected, will shut down unnecessary IP
+                blocks and secondary phases to reduce quiescent current.
+                This mode does not limit the maximum output current but unless
+                only a light load is applied, there will be regulation accuracy
+                and efficiency losses.
+        minItems: 1
+        maxItems: 3
+        items:
+          enum: [ 0, 1, 2 ]
+
+required:
+  - compatible
+  - reg
+  - '#address-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/spmi/spmi.h>
+
+    spmi {
+      #address-cells = <2>;
+      #size-cells = <0>;
+
+      pmic@8 {
+        compatible = "mediatek,mt6316b-regulator";
+        reg = <0x8 SPMI_USID>;
+        #address-cells = <0>;
+
+        vbuck12 {
+          regulator-name = "dvdd_core";
+          regulator-min-microvolt = <450000>;
+          regulator-max-microvolt = <965000>;
+          regulator-allowed-modes = <0 1 2>;
+          regulator-enable-ramp-delay = <256>;
+        };
+      };
+    };
+...
diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6316c-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6316c-regulator.yaml
new file mode 100644
index 000000000000..1565aee43f1c
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6316c-regulator.yaml
@@ -0,0 +1,78 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/mediatek,mt6316c-regulator.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT6316 CP/HP/KP SPMI PMIC Regulators
+
+maintainers:
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+
+description:
+  The MediaTek MT6316CP/HP/KP PMICs are fully controlled by SPMI interface,
+  features four step-down DC/DC (buck) converters, and provides 3+1 Phases,
+  joining Buck 1+2+4 for the first phase, and uses Buck 3 for the second.
+
+properties:
+  compatible:
+    const: mediatek,mt6316c-regulator
+
+  reg:
+    maxItems: 1
+
+patternProperties:
+  "^vbuck(124|3)$":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    properties:
+      regulator-allowed-modes:
+        description: |
+          Allowed Buck regulator operating modes allowed. Valid values below.
+            0 - Normal mode with automatic power saving, reducing the switching
+                frequency when light load conditions are detected
+            1 - Forced Continuous Conduction mode (FCCM) for improved voltage
+                regulation accuracy with constant switching frequency but lower
+                regulator efficiency
+            2 - Forced Low Power mode for improved regulator efficiency, used
+                when no heavy load is expected, will shut down unnecessary IP
+                blocks and secondary phases to reduce quiescent current.
+                This mode does not limit the maximum output current but unless
+                only a light load is applied, there will be regulation accuracy
+                and efficiency losses.
+        minItems: 1
+        maxItems: 3
+        items:
+          enum: [ 0, 1, 2 ]
+
+required:
+  - compatible
+  - reg
+  - '#address-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/spmi/spmi.h>
+
+    spmi {
+      #address-cells = <2>;
+      #size-cells = <0>;
+
+      pmic@6 {
+        compatible = "mediatek,mt6316c-regulator";
+        reg = <0x6 SPMI_USID>;
+        #address-cells = <0>;
+
+        vbuck124 {
+          regulator-name = "dvdd_proc_m";
+          regulator-min-microvolt = <450000>;
+          regulator-max-microvolt = <1277500>;
+          regulator-allowed-modes = <0 1 2>;
+          regulator-enable-ramp-delay = <256>;
+        };
+      };
+    };
+...
diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6316d-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6316d-regulator.yaml
new file mode 100644
index 000000000000..b53c5a4a6f96
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6316d-regulator.yaml
@@ -0,0 +1,77 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/mediatek,mt6316d-regulator.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT6316 DP/TP SPMI PMIC Regulators
+
+maintainers:
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+
+description:
+  The MediaTek MT6316DP/TP PMICs are fully controlled by SPMI interface, both
+  feature four step-down DC/DC (buck) converters, and provides a single Phase,
+  joining Buck 1+2+3+4.
+
+properties:
+  compatible:
+    const: mediatek,mt6316d-regulator
+
+  reg:
+    maxItems: 1
+
+  vbuck1234:
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    properties:
+      regulator-allowed-modes:
+        description: |
+          Allowed Buck regulator operating modes allowed. Valid values below.
+            0 - Normal mode with automatic power saving, reducing the switching
+                frequency when light load conditions are detected
+            1 - Forced Continuous Conduction mode (FCCM) for improved voltage
+                regulation accuracy with constant switching frequency but lower
+                regulator efficiency
+            2 - Forced Low Power mode for improved regulator efficiency, used
+                when no heavy load is expected, will shut down unnecessary IP
+                blocks and secondary phases to reduce quiescent current.
+                This mode does not limit the maximum output current but unless
+                only a light load is applied, there will be regulation accuracy
+                and efficiency losses.
+        minItems: 1
+        maxItems: 3
+        items:
+          enum: [ 0, 1, 2 ]
+
+required:
+  - compatible
+  - reg
+  - '#address-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/spmi/spmi.h>
+
+    spmi {
+      #address-cells = <2>;
+      #size-cells = <0>;
+
+      pmic@7 {
+        compatible = "mediatek,mt6316d-regulator";
+        reg = <0x7 SPMI_USID>;
+        #address-cells = <0>;
+
+        vbuck1234 {
+          regulator-name = "dvdd_gpustack";
+          regulator-min-microvolt = <400000>;
+          regulator-max-microvolt = <1277500>;
+          regulator-allowed-modes = <0 1 2>;
+          regulator-enable-ramp-delay = <256>;
+        };
+      };
+    };
+...
-- 
2.51.1


