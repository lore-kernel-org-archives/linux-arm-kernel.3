Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 084BCC8303F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 09:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nh+NV/RCQEe7YpPNjzL9CCS4Sy68m8a+56F+E9QurCM=; b=J2MdGdeQkNWftt1r44ky1GM0oB
	CxXgGexLjuGyZEuccjmgyyIPAEyboSJ4cpHL61lutTrlcTQY1EON83c0KqozNfzSCAi7mv5mu8uVx
	QB37Poym/5WTpPAhCLqJdOHWdc3RlHrHVu0QTUCDVotVXlFQUb7PMrnRmqWYn9uU8LL7578N/CLHC
	o715+EOHasygvy69I3L1qAcqO9Jvasx2egbZ+2OvV7F/J7aQD2uPmBlo/e07olhu2ulhQdflAmlJs
	MNeT6bvmf4U5c/5N+SbkRa1jLhDeyYmSjbY9u9/9DWVuiszrEryzwKVEqKO24czoJtnD9jm+8aOi/
	bTtqpLRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urZJI-000000012cw-46ho;
	Thu, 28 Aug 2025 09:52:48 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urYTl-00000000t7b-06z5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 08:59:34 +0000
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250828085928epoutp010da21c5f1a7d405121414c83fd0c0efc~f4qLeD38Y1047110471epoutp01g
	for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 08:59:28 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250828085928epoutp010da21c5f1a7d405121414c83fd0c0efc~f4qLeD38Y1047110471epoutp01g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756371568;
	bh=Nh+NV/RCQEe7YpPNjzL9CCS4Sy68m8a+56F+E9QurCM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FHkLhmcR1r597S1wksvh9dJ25IOlg8H66lwtNHHyS6dMC8Y25dIfXxWyuNk7xk03m
	 kSqiVaEAPRubOUHPXOA+zMhM1y6PGGS9feTRAH3Ct1CkG71EpsOxnLqVi7gVC7P7tv
	 zrp9m1ACpvcU9YYIvv2DZgZEKqRXAYF0T5YkFziY=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20250828085928epcas5p13a4867c73b3c3e4ba4afbd9dd228c504~f4qK_IiF00547205472epcas5p1w;
	Thu, 28 Aug 2025 08:59:28 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.92]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4cCFhH2CZWz2SSKZ; Thu, 28 Aug
	2025 08:59:27 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250828085926epcas5p1b82576210280fb44c6c7f02851da71c6~f4qJgV6OG0547105471epcas5p1m;
	Thu, 28 Aug 2025 08:59:26 +0000 (GMT)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250828085923epsmtip25f82c5e1bb289e9b9357c0b6a86fd6d4~f4qG3h2CV0309203092epsmtip2h;
	Thu, 28 Aug 2025 08:59:23 +0000 (GMT)
From: Inbaraj E <inbaraj.e@samsung.com>
To: rmfrfs@gmail.com, laurent.pinchart@ideasonboard.com, martink@posteo.de,
	kernel@puri.sm, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de
Cc: kernel@pengutronix.de, festevam@gmail.com, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, pankaj.dubey@samsung.com,
	ravi.patel@samsung.com, shradha.t@samsung.com, Inbaraj E
	<inbaraj.e@samsung.com>
Subject: [PATCH v3 1/7] dt-bindings: media: nxp: Add support for FSD SoC
Date: Thu, 28 Aug 2025 14:29:05 +0530
Message-ID: <20250828085911.81266-2-inbaraj.e@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250828085911.81266-1-inbaraj.e@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250828085926epcas5p1b82576210280fb44c6c7f02851da71c6
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250828085926epcas5p1b82576210280fb44c6c7f02851da71c6
References: <20250828085911.81266-1-inbaraj.e@samsung.com>
	<CGME20250828085926epcas5p1b82576210280fb44c6c7f02851da71c6@epcas5p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_015933_382343_1F50A48A 
X-CRM114-Status: GOOD (  17.57  )
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

The Tesla FSD CSIS link controller is used to configure MIPI CSI-2
Rx link operations.

The Tesla FSD SoC include a MIPI CSI-2 Rx IP core named CSIS, which is
compatible with the CSIS IP found in NXP i.MX7 and i.MX8 SoCs. Add the
compatible string "tesla,fsd-mipi-csi2" to support the MIPI CSI-2 Rx
link operation on the Tesla FSD SoC.

Signed-off-by: Inbaraj E <inbaraj.e@samsung.com>
---
 .../bindings/media/nxp,imx-mipi-csi2.yaml     | 91 +++++++++++++++----
 1 file changed, 71 insertions(+), 20 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml
index 41ad5b84eaeb..39b9447fd40c 100644
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
 
+  tesla,syscon-csis:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description:
+      Syscon used to hold and release the reset of MIPI D-PHY
+
   phy-supply:
     description: The MIPI D-PHY digital power supply
 
@@ -93,7 +91,8 @@ properties:
             properties:
               data-lanes:
                 description:
-                  Note that 'fsl,imx7-mipi-csi2' only supports up to 2 data lines.
+                  Note that 'fsl,imx7-mipi-csi2' only supports up to 2 data
+                  lines.
                 minItems: 1
                 items:
                   - const: 1
@@ -115,7 +114,6 @@ required:
   - interrupts
   - clocks
   - clock-names
-  - power-domains
   - ports
 
 additionalProperties: false
@@ -124,20 +122,73 @@ allOf:
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
+        tesla,syscon-csis: false
+        fsl,num-channels: false
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
+        tesla,syscon-csis: false
+        fsl,num-channels: false
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
+        - tesla,syscon-csis
+        - fsl,num-channels
 
 examples:
   - |
-- 
2.49.0


