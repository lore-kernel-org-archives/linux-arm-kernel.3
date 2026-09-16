Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06E26C88E77
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 12:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d9clsv65KP7miuXWuGSwYtJ+gKiTMpauqdvSERwB1jY=; b=JxEHbf86M4la7T7SnaaUyQzNW4
	0xGcyVi1r4a+YkncVGhnLLEUWjZa4wIUpGUoax5Q7uxx7gQouZmjBgriTAYmRMl9qqw6uRPRFExFG
	FC8DjE5XlxdzWQMbdPmCDEy8EGhucWIribf66tWYazDTdNTsP5vdiVqSxn3BV88IeCxpCq5wHOzUJ
	3vRW5DGWUyv7lK8Czhr43h/xDuiqDxPjFm0VGdlYzhqrqxsVMvajlf2pi1+bjWrbsyyfPXlq+itR9
	9RkqAZA7RFAzEBjkrzV7uepAcSfZ8d6BsoMlxFrcwrT+HYu4g97YZeWiKekcwcb0NuMAEUvTCScIc
	w43q9rNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6ogO-00000009AAm-2GPg;
	Wed, 16 Sep 2026 12:24:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6ogM-00000009A9r-3FZS
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 16 Sep 2026 12:24:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=References:Content-Type:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=d9clsv65KP7miuXWuGSwYtJ+gKiTMpauqdvSERwB1jY=; b=L7IswDT6wqXLp3vSjdE9eHHMK+
	2tYKGPkeNUp72mnvZIscazJiPWtL9cw49LlQR+O3H1pRHbyCft5qP7viqdhiyqJ1HqB1fdOGEpNDL
	IqhKHRTC6biv6uytrq5zYyz59xIBzNRlasqXPcKpYPQ1XKUYbR27T7gj+vvPMKKiiNzzReQS+eGb2
	gknwOTe5gm7I/3X7w65yOtktWETNjF7+PbWLKLX4UhziVRF/pES4KedppVD4DYD0/84NuKcvXQHe9
	TIIaLsDiM86tgj1iqxQrVyolCeod+Ccg/06cfYmdSlkftP+/cgn4e73T9cwhFgGAcetmcRrkrOZFH
	w6Ea51mA==;
Received: from mailout3.samsung.com ([203.254.224.33])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6ogI-00000007q7f-1MN6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 12:24:09 +0000
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20260916122356epoutp0319b3ad5f37f473a5f38e730ac2e302bf~VzKUy0oGT0365203652epoutp03f
	for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 12:23:56 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20260916122356epoutp0319b3ad5f37f473a5f38e730ac2e302bf~VzKUy0oGT0365203652epoutp03f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1789561436;
	bh=d9clsv65KP7miuXWuGSwYtJ+gKiTMpauqdvSERwB1jY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hPRv60cUQ6xzDz6ijvsQGbAOJ0DOebE3+y5GmJllAoJBDCv6DXaTg8tGjkik4nAzL
	 3rWo9rbV3TZudsoFoknXSLwBmKpTzXxRPPb2uPe3RQw7x4eWBdwiah89a7017fqNQX
	 z/eeMOlVF2+KD3+8pGRS2EFKokNg21UiHFT5skgk=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20260916122356epcas5p172f58abb443b695f66f404fa97550258~VzKUEEQgs2436624366epcas5p14;
	Wed, 16 Sep 2026 12:23:56 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.86]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4hlJ2z0qKnz2SSKY; Wed, 16 Sep
	2026 12:23:55 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20260916122354epcas5p401fd6470d6cef75951af732b03aa5970~VzKSrhk6G2362023620epcas5p42;
	Wed, 16 Sep 2026 12:23:54 +0000 (GMT)
Received: from vega.samsungds.net (unknown [107.108.73.84]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260916122351epsmtip2a0d230ddcf74ce15a76721bae9f3f745~VzKP1PVk31938919389epsmtip2g;
	Wed, 16 Sep 2026 12:23:51 +0000 (GMT)
From: Selvarasu Ganesan <selvarasu.g@samsung.com>
To: krzk@kernel.org, peter.griffin@linaro.org, alim.akhtar@samsung.com,
	gregkh@linuxfoundation.org, robh@kernel.org, conor+dt@kernel.org,
	Thinh.Nguyen@synopsys.com, mani@kernel.org, selvarasu.g@samsung.com,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: jh0801.jung@samsung.com, h10.kim@samsung.com, dh10.jung@samsung.com,
	akash.m5@samsung.com, hongpooh.kim@samsung.com, eomji.oh@samsung.com,
	shijie.cai@samsung.com, muhammed.ali@samsung.com, thiagu.r@samsung.com
Subject: [PATCH v2 2/3] dt-bindings: usb: Introduce samsung,snps-dwc3
Date: Wed, 16 Sep 2026 17:52:28 +0530
Message-Id: <20260916122229.2604003-3-selvarasu.g@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260916122229.2604003-1-selvarasu.g@samsung.com>
X-CMS-MailID: 20260916122354epcas5p401fd6470d6cef75951af732b03aa5970
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260916122354epcas5p401fd6470d6cef75951af732b03aa5970
References: <20260916122229.2604003-1-selvarasu.g@samsung.com>
	<CGME20260916122354epcas5p401fd6470d6cef75951af732b03aa5970@epcas5p4.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_132406_944770_7D93712A 
X-CRM114-Status: GOOD (  15.10  )
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

Add the Samsung Exynos8855 DWC3 binding using a flattened node
representation, where the DWC3 controller is directly addressable
rather than nested as a child node of a glue layer.

This is the first Samsung Exynos binding using the flattened
representation. The existing samsung,exynos-dwc3 binding describes the
parent and child representation used by existing Exynos SoCs, which can
be migrated to the flattened model.

Samsung Exynos SoCs sharing the same flattened model can be added by
using the samsung,snps-dwc3 fallback compatible and extending the
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


