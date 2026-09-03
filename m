Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB64AC624D4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 07:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BnxZREpoQomMdni/0IbPmEvnTyI2nuMEf4vRri/185k=; b=ZCygC6+ZeZ0Ti9i8gYzTy2TYz3
	k+phRquAku9TEbtWcIKz7ZkZo4WBvTrbO4uQaitlmXf433DOIqDGfYmLef601M5zmfE0Ef1vzoN7g
	fC2Bk9hc2UaUTvm3DdZkMv1AFkCyhbpP7O7jUC1KF8rgR4YkeQI72YDR/FUGmRQqDF+5P3yRPu5iM
	E3wOGoGLDFwjXCvitHVMDH9FRTKVcADCZwhIxbG7tYsiypKTw2KIhC9qhbZrr4qFtG3khlIMowm67
	pl0kL51RHyZPsfBO94LEOV5pDmBPG5bMmnGKsCH/zoLxW9pKtQtHendpCmvhwV06kKcbxnE3jmdrR
	kjP+1vTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x21da-0000000GXuc-0bFw;
	Thu, 03 Sep 2026 07:13:30 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x21dW-0000000GXsO-262l
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 07:13:29 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20260903071320epoutp0314c4a81e39c582640b237de9b7a657e7~Rvia8Eaeq0705507055epoutp03r
	for <linux-arm-kernel@lists.infradead.org>; Thu,  3 Sep 2026 07:13:20 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20260903071320epoutp0314c4a81e39c582640b237de9b7a657e7~Rvia8Eaeq0705507055epoutp03r
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1788419600;
	bh=BnxZREpoQomMdni/0IbPmEvnTyI2nuMEf4vRri/185k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EqzJUY0p4eaEhIq8RyaRRkbsplFwaOJFeXUEEDw3kQcDFbRd2KfQKSHablegT2e68
	 9O16/tKRBcvEqPWgHMKrUoDenKXNfH+bR+vq9GTkQfQKxn4eVB7T0yJwubaFQQQ3IB
	 M2fQqxW2BwS/MrRQcZdIvAsYxkpk0UrVqwUVwxtg=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20260903071320epcas5p1e4e4d69e93efaf2f2b3ae59d2045154f~RviacGfoO2447024470epcas5p1a;
	Thu,  3 Sep 2026 07:13:20 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.94]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4hb9mb0sswz6B9mJ; Thu,  3 Sep
	2026 07:13:19 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20260903071318epcas5p4b804edb84554847c576d1d034b814d7a~RviZEeIdN0465304653epcas5p47;
	Thu,  3 Sep 2026 07:13:18 +0000 (GMT)
Received: from vega.samsungds.net (unknown [107.108.73.84]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260903071315epsmtip1689e8b7180bcc558724f6b8c00059c43~RviV6Jy-p2402924029epsmtip1T;
	Thu,  3 Sep 2026 07:13:15 +0000 (GMT)
From: Selvarasu Ganesan <selvarasu.g@samsung.com>
To: krzk@kernel.org, peter.griffin@linaro.org, alim.akhtar@samsung.com,
	gregkh@linuxfoundation.org, robh@kernel.org, conor+dt@kernel.org,
	Thinh.Nguyen@synopsys.com, selvarasu.g@samsung.com,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: jh0801.jung@samsung.com, dh10.jung@samsung.com, akash.m5@samsung.com,
	hongpooh.kim@samsung.com, eomji.oh@samsung.com, shijie.cai@samsung.com,
	muhammed.ali@samsung.com, thiagu.r@samsung.com
Subject: [PATCH 2/3] dt-bindings: usb: Introduce samsung,snps-dwc3
Date: Thu,  3 Sep 2026 12:42:49 +0530
Message-Id: <20260903071250.3421499-3-selvarasu.g@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260903071250.3421499-1-selvarasu.g@samsung.com>
X-CMS-MailID: 20260903071318epcas5p4b804edb84554847c576d1d034b814d7a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260903071318epcas5p4b804edb84554847c576d1d034b814d7a
References: <20260903071250.3421499-1-selvarasu.g@samsung.com>
	<CGME20260903071318epcas5p4b804edb84554847c576d1d034b814d7a@epcas5p4.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_001328_081738_C380FC29 
X-CRM114-Status: GOOD (  15.63  )
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

The Samsung Exynos8855 USB glue is not separate from the Synopsys DWC3
core, using a flattened model where the DWC3 controller is directly
addressable rather than nested as a child node of a glue layer.

Describe the Exynos USB block as a single node, referencing the split
out Synopsys DWC3 core properties via snps,dwc3-common.yaml. The new
binding follows the same approach as qcom,snps-dwc3.

A generic fallback compatible "samsung,snps-dwc3" is introduced to
describe this binding, selected by the validator based on the presence
of the fallback string in the compatible list. Future Exynos SoCs
utilizing the same flattened model can be added by extending the
compatible enum with per SoC clock and property constraints.

Co-developed-by: Muhammed Ali <muhammed.ali@samsung.com>
Signed-off-by: Muhammed Ali <muhammed.ali@samsung.com>
Signed-off-by: Selvarasu Ganesan <selvarasu.g@samsung.com>
---

Krzysztof Kozlowski is added as a maintainer of this YAML binding, as
he is the ARM/Samsung SoC architecture maintainer (ARM/SAMSUNG S3C,
S5P AND EXYNOS ARM ARCHITECTURES) who already maintains Samsung Exynos
DT bindings (e.g. samsung,exynos-dwc3.yaml) and reviews all
Samsung related binding changes. This follows the same convention used
by existing Samsung Exynos DT binding schemas.
---
 .../bindings/usb/samsung,snps-dwc3.yaml       | 98 +++++++++++++++++++
 1 file changed, 98 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/samsung,snps-dwc3.yaml

diff --git a/Documentation/devicetree/bindings/usb/samsung,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/samsung,snps-dwc3.yaml
new file mode 100644
index 000000000000..480308c16f37
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/samsung,snps-dwc3.yaml
@@ -0,0 +1,98 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/samsung,snps-dwc3.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung Exynos SoC DWC3 USB Controller
+
+maintainers:
+  - Krzysztof Kozlowski <krzk@kernel.org>
+  - Selvarasu Ganesan <selvarasu.g@samsung.com>
+
+description:
+  Describes the DWC3 USB controller block implemented on Samsung Exynos SoCs.
+
+select:
+  properties:
+    compatible:
+      contains:
+        const: samsung,snps-dwc3
+  required:
+    - compatible
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - samsung,exynos8855-dwc3
+      - const: samsung,snps-dwc3
+
+  reg:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    description: |
+      Several clocks are used, depending on the variant. Typical ones are:
+       - ref: Reference clock for SOF/ITP generation.
+       - bus: Bus (APB) clock for register access.
+    minItems: 1
+    maxItems: 4
+
+  clock-names:
+    minItems: 1
+    maxItems: 4
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+
+allOf:
+  - $ref: snps,dwc3-common.yaml#
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos8855-dwc3
+    then:
+      properties:
+        clocks:
+          minItems: 2
+          maxItems: 2
+        clock-names:
+          items:
+            - const: ref
+            - const: bus
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    usb@13200000 {
+        compatible = "samsung,exynos8855-dwc3",
+                     "samsung,snps-dwc3";
+        reg = <0x13200000 0x10000>;
+        interrupts = <GIC_SPI 436 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&usb_clk 0>,
+                 <&usb_clk 1>;
+        clock-names = "ref", "bus";
+        dr_mode = "peripheral";
+        phys = <&usbdrd_phy 0>;
+        phy-names = "usb2-phy";
+        snps,quirk-frame-length-adjustment = <0x20>;
+        snps,dis-u2-freeclk-exists-quirk;
+        snps,gfladj-refclk-lpm-sel-quirk;
+    };
+...
-- 
2.17.1


