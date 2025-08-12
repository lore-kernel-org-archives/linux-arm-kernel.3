Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2439CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 20:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cWg9nTC3QiXfhQyk7/1EDfJYjxYDaetd/ev07jlEnHw=; b=S55Rgy+rpOjzX4x0dnohcm67MU
	yyfWK3Pb35UA651N84/Kmd+NqNCxuJNLgjJ3dPjnBEXik54/Qaf/Yn/3kwVSdQromzOuSrCiS3JcE
	iCdEDbUrG1Ac8kTVNvuGnirrR8Vvi3k+FvnVhmFv9KAwxw/2agXGPlsdqF47S0Ks0mzYz5rze5q3v
	onq1khDDbV71I1V1VB++Y09D2UO9HuYepHu450YlfiONytE8losLUXP5qVBh1W0CTICShUj8qHpGV
	eohJLvmOLvane8P7uDCkC/qq0qW60ZaiG/CI+LLO21U5eR2S6W2TkYgFbpvhCttMD192FwCOOrRbX
	XNmURjwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulvgd-0000000Bx35-2e2t;
	Tue, 12 Aug 2025 20:33:35 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ultVx-0000000BgxS-2Qkp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 18:14:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 207925C5950;
	Tue, 12 Aug 2025 18:14:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7FF7C4CEF0;
	Tue, 12 Aug 2025 18:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755022464;
	bh=cbioamJT3IVDLAVzUrO/mAFSoEzHiRSuAKFCjOj6Q68=;
	h=From:To:Cc:Subject:Date:From;
	b=el8NBOBZ5qUsm6x1GnjGe+Tz6n7q4AacW6lD4SzxnzA0emsLs8nRmHK3BR5hp0dkb
	 IU87dsNWPyHxr4d0Gqa0O1K5wZgjBzP4KcNttr7hrLxoDF2VTs3kT25csHusI1LTwl
	 +UQHV/YL5UExdDzQJBk5REsd4H76EiMQ6Wna9fEJzilTvbENXbSlhS7j7Dh7mg+uF3
	 Zm4cR4V8eM66HRvXvX5jIu+rAMXa8LuXdVMGVy/IUklkgViwR3OY24SD+3ezvTP86o
	 M/tuF95P/6zzUWx9s2S6Vm+T/PoNBjZhiNhLRDqe5dQoD2njFydoe6zKtVycOKE7id
	 CiNnRBBHJ+sfw==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Khuong Dinh <khuong@os.amperecomputing.com>,
	Tai Nguyen <ttnguyen@apm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: perf: Convert apm,xgene-pmu to DT schema
Date: Tue, 12 Aug 2025 13:14:20 -0500
Message-ID: <20250812181422.68286-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_111425_695256_A2258814 
X-CRM114-Status: GOOD (  15.72  )
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

Convert the Applied Micro X-Gene PMU binding to DT schema format. It is
a straightforward conversion.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/perf/apm,xgene-pmu.yaml          | 142 ++++++++++++++++++
 .../bindings/perf/apm-xgene-pmu.txt           | 112 --------------
 2 files changed, 142 insertions(+), 112 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/perf/apm,xgene-pmu.yaml
 delete mode 100644 Documentation/devicetree/bindings/perf/apm-xgene-pmu.txt

diff --git a/Documentation/devicetree/bindings/perf/apm,xgene-pmu.yaml b/Documentation/devicetree/bindings/perf/apm,xgene-pmu.yaml
new file mode 100644
index 000000000000..01f0373eac7d
--- /dev/null
+++ b/Documentation/devicetree/bindings/perf/apm,xgene-pmu.yaml
@@ -0,0 +1,142 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/perf/apm,xgene-pmu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: APM X-Gene SoC PMU
+
+maintainers:
+  - Tai Nguyen <ttnguyen@apm.com>
+
+description: |
+  This is APM X-Gene SoC PMU (Performance Monitoring Unit) module.
+  The following PMU devices are supported:
+
+    L3C            - L3 cache controller
+    IOB            - IO bridge
+    MCB            - Memory controller bridge
+    MC             - Memory controller
+
+properties:
+  compatible:
+    enum:
+      - apm,xgene-pmu
+      - apm,xgene-pmu-v2
+
+  "#address-cells":
+    const: 2
+
+  "#size-cells":
+    const: 2
+
+  ranges: true
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  regmap-csw:
+    $ref: /schemas/types.yaml#/definitions/phandle
+
+  regmap-mcba:
+    $ref: /schemas/types.yaml#/definitions/phandle
+
+  regmap-mcbb:
+    $ref: /schemas/types.yaml#/definitions/phandle
+
+required:
+  - compatible
+  - regmap-csw
+  - regmap-mcba
+  - regmap-mcbb
+  - reg
+  - interrupts
+
+additionalProperties:
+  type: object
+  additionalProperties: false
+
+  properties:
+    compatible:
+      enum:
+        - apm,xgene-pmu-l3c
+        - apm,xgene-pmu-iob
+        - apm,xgene-pmu-mcb
+        - apm,xgene-pmu-mc
+
+    reg:
+      maxItems: 1
+
+    enable-bit-index:
+      description:
+        Specifies which bit enables the associated resource in MCB or MC subnodes.
+      $ref: /schemas/types.yaml#/definitions/uint32
+      maximum: 31
+
+examples:
+  - |
+    bus {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        pmu@78810000 {
+            compatible = "apm,xgene-pmu-v2";
+            reg = <0x0 0x78810000 0x0 0x1000>;
+            #address-cells = <2>;
+            #size-cells = <2>;
+            ranges;
+            regmap-csw = <&csw>;
+            regmap-mcba = <&mcba>;
+            regmap-mcbb = <&mcbb>;
+            interrupts = <0x0 0x22 0x4>;
+
+            pmul3c@7e610000 {
+                compatible = "apm,xgene-pmu-l3c";
+                reg = <0x0 0x7e610000 0x0 0x1000>;
+            };
+
+            pmuiob@7e940000 {
+                compatible = "apm,xgene-pmu-iob";
+                reg = <0x0 0x7e940000 0x0 0x1000>;
+            };
+
+            pmucmcb@7e710000 {
+                compatible = "apm,xgene-pmu-mcb";
+                reg = <0x0 0x7e710000 0x0 0x1000>;
+                enable-bit-index = <0>;
+            };
+
+            pmucmcb@7e730000 {
+                compatible = "apm,xgene-pmu-mcb";
+                reg = <0x0 0x7e730000 0x0 0x1000>;
+                enable-bit-index = <1>;
+            };
+
+            pmucmc@7e810000 {
+                compatible = "apm,xgene-pmu-mc";
+                reg = <0x0 0x7e810000 0x0 0x1000>;
+                enable-bit-index = <0>;
+            };
+
+            pmucmc@7e850000 {
+                compatible = "apm,xgene-pmu-mc";
+                reg = <0x0 0x7e850000 0x0 0x1000>;
+                enable-bit-index = <1>;
+            };
+
+            pmucmc@7e890000 {
+                compatible = "apm,xgene-pmu-mc";
+                reg = <0x0 0x7e890000 0x0 0x1000>;
+                enable-bit-index = <2>;
+            };
+
+            pmucmc@7e8d0000 {
+                compatible = "apm,xgene-pmu-mc";
+                reg = <0x0 0x7e8d0000 0x0 0x1000>;
+                enable-bit-index = <3>;
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/perf/apm-xgene-pmu.txt b/Documentation/devicetree/bindings/perf/apm-xgene-pmu.txt
deleted file mode 100644
index afb11cf693c0..000000000000
--- a/Documentation/devicetree/bindings/perf/apm-xgene-pmu.txt
+++ /dev/null
@@ -1,112 +0,0 @@
-* APM X-Gene SoC PMU bindings
-
-This is APM X-Gene SoC PMU (Performance Monitoring Unit) module.
-The following PMU devices are supported:
-
-  L3C			- L3 cache controller
-  IOB			- IO bridge
-  MCB			- Memory controller bridge
-  MC			- Memory controller
-
-The following section describes the SoC PMU DT node binding.
-
-Required properties:
-- compatible		: Shall be "apm,xgene-pmu" for revision 1 or
-                          "apm,xgene-pmu-v2" for revision 2.
-- regmap-csw		: Regmap of the CPU switch fabric (CSW) resource.
-- regmap-mcba		: Regmap of the MCB-A (memory bridge) resource.
-- regmap-mcbb		: Regmap of the MCB-B (memory bridge) resource.
-- reg			: First resource shall be the CPU bus PMU resource.
-- interrupts            : Interrupt-specifier for PMU IRQ.
-
-Required properties for L3C subnode:
-- compatible		: Shall be "apm,xgene-pmu-l3c".
-- reg			: First resource shall be the L3C PMU resource.
-
-Required properties for IOB subnode:
-- compatible		: Shall be "apm,xgene-pmu-iob".
-- reg			: First resource shall be the IOB PMU resource.
-
-Required properties for MCB subnode:
-- compatible		: Shall be "apm,xgene-pmu-mcb".
-- reg			: First resource shall be the MCB PMU resource.
-- enable-bit-index	: The bit indicates if the according MCB is enabled.
-
-Required properties for MC subnode:
-- compatible		: Shall be "apm,xgene-pmu-mc".
-- reg			: First resource shall be the MC PMU resource.
-- enable-bit-index	: The bit indicates if the according MC is enabled.
-
-Example:
-	csw: csw@7e200000 {
-		compatible = "apm,xgene-csw", "syscon";
-		reg = <0x0 0x7e200000 0x0 0x1000>;
-	};
-
-	mcba: mcba@7e700000 {
-		compatible = "apm,xgene-mcb", "syscon";
-		reg = <0x0 0x7e700000 0x0 0x1000>;
-	};
-
-	mcbb: mcbb@7e720000 {
-		compatible = "apm,xgene-mcb", "syscon";
-		reg = <0x0 0x7e720000 0x0 0x1000>;
-	};
-
-	pmu: pmu@78810000 {
-		compatible = "apm,xgene-pmu-v2";
-		#address-cells = <2>;
-		#size-cells = <2>;
-		ranges;
-		regmap-csw = <&csw>;
-		regmap-mcba = <&mcba>;
-		regmap-mcbb = <&mcbb>;
-		reg = <0x0 0x78810000 0x0 0x1000>;
-		interrupts = <0x0 0x22 0x4>;
-
-		pmul3c@7e610000 {
-			compatible = "apm,xgene-pmu-l3c";
-			reg = <0x0 0x7e610000 0x0 0x1000>;
-		};
-
-		pmuiob@7e940000 {
-			compatible = "apm,xgene-pmu-iob";
-			reg = <0x0 0x7e940000 0x0 0x1000>;
-		};
-
-		pmucmcb@7e710000 {
-			compatible = "apm,xgene-pmu-mcb";
-			reg = <0x0 0x7e710000 0x0 0x1000>;
-			enable-bit-index = <0>;
-		};
-
-		pmucmcb@7e730000 {
-			compatible = "apm,xgene-pmu-mcb";
-			reg = <0x0 0x7e730000 0x0 0x1000>;
-			enable-bit-index = <1>;
-		};
-
-		pmucmc@7e810000 {
-			compatible = "apm,xgene-pmu-mc";
-			reg = <0x0 0x7e810000 0x0 0x1000>;
-			enable-bit-index = <0>;
-		};
-
-		pmucmc@7e850000 {
-			compatible = "apm,xgene-pmu-mc";
-			reg = <0x0 0x7e850000 0x0 0x1000>;
-			enable-bit-index = <1>;
-		};
-
-		pmucmc@7e890000 {
-			compatible = "apm,xgene-pmu-mc";
-			reg = <0x0 0x7e890000 0x0 0x1000>;
-			enable-bit-index = <2>;
-		};
-
-		pmucmc@7e8d0000 {
-			compatible = "apm,xgene-pmu-mc";
-			reg = <0x0 0x7e8d0000 0x0 0x1000>;
-			enable-bit-index = <3>;
-		};
-	};
-- 
2.47.2


