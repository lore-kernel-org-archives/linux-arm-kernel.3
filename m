Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31E5BCA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 05:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tTdlHyy4zL51FrYWXTe3WQyidqS2LdEHrq0CGLTDvFQ=; b=VaaG1mdc0NoDwAEaoK79l93hiK
	qYGtlVv/ITkV3ywLY+E4fuK0xIewVR5UCI2KawRqKvcarPZGjxA3Z1OtA9cMvAOp5ImWpCEVtMzA+
	GhGyjjsrT5iwuxV0yQwBwyBBBHkYLkh6y0UIwJbYUVJTvzvlP1DmYkXLOg8GTf2P6+fNfUUpI97ht
	aUeniSFEKWlawiRofBwRTTBFrqz3fBtc1aj9nSXKqGkESeDJjTss6MvqJCqs87F/9EN59ii1B6t+7
	gMh6Yc5CdFBAEBoafAa0h6YAfwlJGAfMTDbS6Rnq0AeOtLfa1GFFC71zk4724jmZfcajvPoYv0G0M
	40Rn8eCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uns73-00000006WdP-0Bsz;
	Mon, 18 Aug 2025 05:08:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unrdh-00000006Tjm-0aGf
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 18 Aug 2025 04:38:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-ID:Date:Subject:Cc
	:To:From:Sender:Reply-To:Content-ID:Content-Description;
	bh=tTdlHyy4zL51FrYWXTe3WQyidqS2LdEHrq0CGLTDvFQ=; b=MjmUfEogzGh8C9K4VZppwDFzBG
	FpcCVM7vhOH5PajKTGiiAzdOEUtAoo3Ke/qS0F9kl12IN/Nt7WYNV4jVCVRHblpkOsYtPC9e5z2b9
	FRmWS3Kn0eLvmGOfyp9xtPWNWnL+McxGEi5FlLlPtQaisEZu7jtVirQWxZXWj1Cou0ttCM0ujwrop
	39avGewXSwRfvAl999CJemMIWajcJjDu2QqfWnRrQ8Fr+sZMbCoHfBeBdJGFMRq7OiIDdvCQMRant
	yy2uQji7wSOASgcUPqEw2wA6Hi99mWRQtEh1nR+M4M0KjIHiMbpfAIrCoiR+621274Slrx2f+x0kG
	GGrcgRwA==;
Received: from mailout2.samsung.com ([203.254.224.25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unrdX-0000000HF2Z-0fhR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 04:38:28 +0000
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250818043818epoutp027cc4b09e6196c4b68a6ea1da3a2ac433~cwpSsRSm61680116801epoutp02-
	for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Aug 2025 04:38:18 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250818043818epoutp027cc4b09e6196c4b68a6ea1da3a2ac433~cwpSsRSm61680116801epoutp02-
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755491898;
	bh=tTdlHyy4zL51FrYWXTe3WQyidqS2LdEHrq0CGLTDvFQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=me7YHKXslWt0eYyoysKKW5LNb72EYcy4nVq2bASIhoMBWS8N0qdhg8sXZKdAaFdnS
	 dXGfZbLbjA9APBajysxWiCq/RoHojMoOsgU0hJRot+sGHBrcjuJhliI6uwX1+OvnZk
	 BY+laXbkA1eIW2v7D5Fb2Adj7KfQYdC0/8cHLHsM=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250818043817epcas5p4c97abb05eac0e9315746e0dd1152fd16~cwpSAY67t2156321563epcas5p4N;
	Mon, 18 Aug 2025 04:38:17 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.88]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4c50MX2Hv0z2SSKh; Mon, 18 Aug
	2025 04:38:16 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250814141051epcas5p14dccee388087372973988aeebcb872cf~bp4DUyPvU0355803558epcas5p1l;
	Thu, 14 Aug 2025 14:10:51 +0000 (GMT)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250814141047epsmtip2d40283acf8de0531ae8149c6c2120968~bp3-gNYA41818718187epsmtip2a;
	Thu, 14 Aug 2025 14:10:47 +0000 (GMT)
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
Subject: [PATCH v2 10/12] dt-bindings: media: fsd: Document CSIS DMA
 controller
Date: Thu, 14 Aug 2025 19:39:41 +0530
Message-ID: <20250814140943.22531-11-inbaraj.e@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250814140943.22531-1-inbaraj.e@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250814141051epcas5p14dccee388087372973988aeebcb872cf
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250814141051epcas5p14dccee388087372973988aeebcb872cf
References: <20250814140943.22531-1-inbaraj.e@samsung.com>
	<CGME20250814141051epcas5p14dccee388087372973988aeebcb872cf@epcas5p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_053825_933398_A065B9A6 
X-CRM114-Status: GOOD (  14.22  )
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

Document bindings for the FSD CSIS DMA controller.

Signed-off-by: Inbaraj E <inbaraj.e@samsung.com>
---
 .../bindings/media/tesla,fsd-csis-media.yaml  | 74 +++++++++++++++++++
 1 file changed, 74 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/tesla,fsd-csis-media.yaml

diff --git a/Documentation/devicetree/bindings/media/tesla,fsd-csis-media.yaml b/Documentation/devicetree/bindings/media/tesla,fsd-csis-media.yaml
new file mode 100644
index 000000000000..ce6c2e58ed4e
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/tesla,fsd-csis-media.yaml
@@ -0,0 +1,74 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/tesla,fsd-csis-media.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Tesla FSD SoC MIPI CSI-2 DMA (Bridge device) receiver
+
+maintainers:
+  - Inbaraj E <inbaraj.e@samsung.com>
+
+description: |-
+  The FSD MIPI CSI-2 (Camera Serial Interface 2) have internal DMA engine to
+  capture frames originating from the sensor.
+
+properties:
+  compatible:
+    const: tesla,fsd-csis-media
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 3
+
+  clock-names:
+    items:
+      - const: aclk
+      - const: pclk
+      - const: pll
+
+  iommus:
+    maxItems: 1
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - iommus
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/fsd-clk.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    csi0: csi@12641000 {
+        compatible = "tesla,fsd-csis-media";
+        reg = <0x12661000 0x44c>;
+        interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&clock_csi CAM_CSI0_0_IPCLKPORT_I_ACLK>,
+                 <&clock_csi CAM_CSI0_0_IPCLKPORT_I_PCLK>,
+                 <&clock_csi CAM_CSI_PLL>;
+        clock-names = "aclk", "pclk", "pll";
+        iommus = <&smmu_isp 0x0 0x0>;
+
+        port {
+            csi_in_0: endpoint {
+                remote-endpoint = <&mipi_csis_0_out>;
+            };
+        };
+    };
+
+...
-- 
2.49.0


