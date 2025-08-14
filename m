Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32B91CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 04:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t2ssHoU0LlSLJn81mT3BTJVhAxgpHc/CvHKSl7Yo5G8=; b=MVUqMqlZRVQhnYaQp99fAkjYOh
	FXrzVuMAhXpxgkiOVLxlnyC/AwxKrHSquZYWfpbCDZgG+H+jYgaShVZFxXEwKAAlsQmBvTd9odel1
	L01nIfiZv7bxkctjTwxTnoKj+rJh3lgSt70Pf3xmhT6Cs/JNQIwqcnWOflu+TSCjJp6IbJRKgXLU9
	IvfGq67OFYWnd0uasGntUzh7Ynrf17XQfmJkmrbw0UpFTH3WRsxVqTmTAew/WgchZbOIm8+H3i/uf
	FEa9P/pmBfWcXbCZnyq68aHHGNGDyDpNp4IAnU1V7xQ6k+xpqbENOb/FpcalxQ1kAzdkAzY9AsqmB
	wmmYwqzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unrmm-00000006UvU-10OM;
	Mon, 18 Aug 2025 04:47:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unrd5-00000006TdA-0GwW
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 18 Aug 2025 04:37:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-ID:Date:Subject:Cc
	:To:From:Sender:Reply-To:Content-ID:Content-Description;
	bh=t2ssHoU0LlSLJn81mT3BTJVhAxgpHc/CvHKSl7Yo5G8=; b=gkfmUikgDNfuJ4HTWrPxP8DqN8
	YB47YiA69GGHg5Rrf+x5uxlxjP9pnE+y9qT16A8IJLWFulhVzxOmCsqyaZgNMWPDJMUtR8QImwsIV
	iyJVnuW9EfEUPer1zzPdI5Zj1HYfIqb4oQtRQd3/mEj2jzYc7kVPj4llm/hLLIlLhYibpWLzkEhVj
	kuSjIQov5/lG0j/nqFOnOhI3qFdrVwTgtpHx60xhE3xIRWcIOx7hCZ9J31+eBsCS18iOo+oI8e0Og
	4FY5D4snQpDlnArVzFYpWYrmy310JACTAW8aIZEpe6imeiKS7wkdkaU+SisB5uFbrQK03aNivXR6t
	g+G+XTEw==;
Received: from mailout3.samsung.com ([203.254.224.33])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unrcy-0000000HEzL-1trW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 04:37:52 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250818043742epoutp03bebe695f9c3eb1779a24ee44377b7358~cwoxNKqI70888908889epoutp03R
	for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Aug 2025 04:37:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250818043742epoutp03bebe695f9c3eb1779a24ee44377b7358~cwoxNKqI70888908889epoutp03R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755491862;
	bh=t2ssHoU0LlSLJn81mT3BTJVhAxgpHc/CvHKSl7Yo5G8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FzpKJhAWKWc8fFYnbJLfbiol/2wEehvagk1s9zWhgvGPKCIxHUakU4YUQYpDa5bSH
	 qnXyngrwnI7MStMJZJuI+Y3RasJSLg43iO75BrWz21JSfPnQYCX8BYMAHCcm/2RxWk
	 kTrvYChx3LmKcI2q3Cjb5dM6lJXzuThzXtD3wkJ4=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250818043742epcas5p235a9682aefa4ebfb5a1dd91873fb3b20~cwowpsO6F0138801388epcas5p2d;
	Mon, 18 Aug 2025 04:37:42 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.86]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4c50Lr6rlzz6B9m9; Mon, 18 Aug
	2025 04:37:40 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250814141014epcas5p410d41ede7e8ae4f3cf8db6d041d03946~bp3g-24j41288712887epcas5p4w;
	Thu, 14 Aug 2025 14:10:14 +0000 (GMT)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250814141010epsmtip2d3fa3e0416c211931a50ce9066ad1416~bp3dKpZXp1817818178epsmtip2k;
	Thu, 14 Aug 2025 14:10:10 +0000 (GMT)
From: Inbaraj E <inbaraj.e@samsung.com>
To: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, krzk@kernel.org,
	s.nawrocki@samsung.com, s.hauer@pengutronix.de, shawnguo@kernel.org,
	cw00.choi@samsung.com, rmfrfs@gmail.com, laurent.pinchart@ideasonboard.com,
	martink@posteo.de, mchehab@kernel.org, linux-fsd@tesla.com, will@kernel.org,
	catalin.marinas@arm.com, pankaj.dubey@samsung.com, shradha.t@samsung.com,
	ravi.patel@samsung.com
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, alim.akhtar@samsung.com,
	linux-samsung-soc@vger.kernel.org, kernel@puri.sm, kernel@pengutronix.de,
	festevam@gmail.com, linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, Inbaraj E <inbaraj.e@samsung.com>
Subject: [PATCH v2 03/12] dt-bindings: media: nxp: Add support for FSD SoC
Date: Thu, 14 Aug 2025 19:39:34 +0530
Message-ID: <20250814140943.22531-4-inbaraj.e@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250814140943.22531-1-inbaraj.e@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250814141014epcas5p410d41ede7e8ae4f3cf8db6d041d03946
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250814141014epcas5p410d41ede7e8ae4f3cf8db6d041d03946
References: <20250814140943.22531-1-inbaraj.e@samsung.com>
	<CGME20250814141014epcas5p410d41ede7e8ae4f3cf8db6d041d03946@epcas5p4.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_053750_896823_C51A5286 
X-CRM114-Status: GOOD (  14.62  )
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

Document the MIPI CSI2 controller device tree bindings for Tesla
FSD SoC

Signed-off-by: Inbaraj E <inbaraj.e@samsung.com>
---
 .../bindings/media/nxp,imx-mipi-csi2.yaml     | 88 ++++++++++++++-----
 1 file changed, 68 insertions(+), 20 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml
index 03a23a26c4f3..802fb1bd150d 100644
--- a/Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml
+++ b/Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml
@@ -14,7 +14,7 @@ description: |-
   The NXP i.MX7 and i.MX8 families contain SoCs that include a MIPI CSI-2
   receiver IP core named CSIS. The IP core originates from Samsung, and may be
   compatible with some of the Exynos4 and S5P SoCs. i.MX7 SoCs use CSIS version
-  3.3, and i.MX8 SoCs use CSIS version 3.6.3.
+  3.3, i.MX8 SoCs use CSIS version 3.6.3 and FSD SoC uses CSIS version 4.3.
 
   While the CSI-2 receiver is separate from the MIPI D-PHY IP core, the PHY is
   completely wrapped by the CSIS and doesn't expose a control interface of its
@@ -26,6 +26,7 @@ properties:
       - enum:
           - fsl,imx7-mipi-csi2
           - fsl,imx8mm-mipi-csi2
+          - tesla,fsd-mipi-csi2
       - items:
           - enum:
               - fsl,imx8mp-mipi-csi2
@@ -38,24 +39,21 @@ properties:
     maxItems: 1
 
   clocks:
-    minItems: 3
-    items:
-      - description: The peripheral clock (a.k.a. APB clock)
-      - description: The external clock (optionally used as the pixel clock)
-      - description: The MIPI D-PHY clock
-      - description: The AXI clock
+    minItems: 2
+    maxItems: 4
 
   clock-names:
-    minItems: 3
-    items:
-      - const: pclk
-      - const: wrap
-      - const: phy
-      - const: axi
+    minItems: 2
+    maxItems: 4
 
   power-domains:
     maxItems: 1
 
+  samsung,syscon-csis:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description:
+      Syscon used to hold and release the reset of MIPI D-PHY
+
   phy-supply:
     description: The MIPI D-PHY digital power supply
 
@@ -85,7 +83,8 @@ properties:
             properties:
               data-lanes:
                 description:
-                  Note that 'fsl,imx7-mipi-csi2' only supports up to 2 data lines.
+                  Note that 'fsl,imx7-mipi-csi2' only supports up to 2 data
+                  lines.
                 minItems: 1
                 items:
                   - const: 1
@@ -107,7 +106,6 @@ required:
   - interrupts
   - clocks
   - clock-names
-  - power-domains
   - ports
 
 additionalProperties: false
@@ -116,20 +114,70 @@ allOf:
   - if:
       properties:
         compatible:
-          contains:
-            const: fsl,imx7-mipi-csi2
+          const: fsl,imx7-mipi-csi2
     then:
+      properties:
+        clocks:
+          items:
+            - description: The peripheral clock (a.k.a. APB clock)
+            - description: The external clock (optionally used as the pixel
+                clock)
+            - description: The MIPI D-PHY clock
+        clock-names:
+          items:
+            - const: pclk
+            - const: wrap
+            - const: phy
+        samsung,syscon-csis: false
       required:
+        - power-domains
         - phy-supply
         - resets
-    else:
+
+  - if:
+      properties:
+        compatible:
+          const: fsl,imx8mm-mipi-csi2
+    then:
       properties:
         clocks:
-          minItems: 4
+          items:
+            - description: The peripheral clock (a.k.a. APB clock)
+            - description: The external clock (optionally used as the pixel
+                clock)
+            - description: The MIPI D-PHY clock
+            - description: The AXI clock
         clock-names:
-          minItems: 4
+          items:
+            - const: pclk
+            - const: wrap
+            - const: phy
+            - const: axi
+        samsung,syscon-csis: false
         phy-supply: false
         resets: false
+      required:
+        - power-domains
+
+  - if:
+      properties:
+        compatible:
+          const: tesla,fsd-mipi-csi2
+    then:
+      properties:
+        clocks:
+          items:
+            - description: The peripheral clock (a.k.a. APB clock)
+            - description: The DMA clock
+        clocks-names:
+          items:
+            - const: pclk
+            - const: aclk
+        phy-supply: false
+        resets: false
+        power-domains: false
+      required:
+        - samsung,syscon-csis
 
 examples:
   - |
-- 
2.49.0


