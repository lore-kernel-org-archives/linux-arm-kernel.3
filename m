Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70787C8303F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 09:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XTEfXLQM+A9VUaqsYa0+kOHsGPzuzCyuDiyg7PrGRkI=; b=bRogZ+2hHHyCs9IrmZJilVJsck
	PbnaFMmsuTRWbkarQtRyI7V3c+3FcCqBT5uTANTbgMSz8UQNEn+HPTVA3EO/oVlxTlbGyvDSKNATP
	stb2PU0yRkh9K1XdPXzGahdx/0MDWul0n354dcdPSQFofioxnBTn7BSQc7XkjDkxJabXk3Bb3b5Qr
	zuT9AS4BB+zI/eDzR1MaJlLsEKwwgFh/FK8toru9WbTMPsWUNERxcyg7Ckieq22rmz1BTsxpv4mFJ
	YPlU59NDHb2pl97I+vlsaVshpPRdI5Firs3T13UHcXhyGS59uqVYBm9dqoU48mTkISUxFgFJo4/Jg
	2HSgwShg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urZLz-00000001326-3j05;
	Thu, 28 Aug 2025 09:55:37 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urYTq-00000000tAe-3RC4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 08:59:40 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250828085933epoutp0323bd9c1058592f9ab4e9818fbc32442a~f4qPaMU4O0030500305epoutp03V
	for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 08:59:33 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250828085933epoutp0323bd9c1058592f9ab4e9818fbc32442a~f4qPaMU4O0030500305epoutp03V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756371573;
	bh=XTEfXLQM+A9VUaqsYa0+kOHsGPzuzCyuDiyg7PrGRkI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bJb0VE+LFxbL7o1vASQsDB0UHU+p9VXoi7orhWHXFdgBRjL/mAgmjaDorAUNtZOQ2
	 jwbIleKDa6ZmImqanCLWLPK4ZJlJWUuqA+b5AI71mH1AQuyFWJPpcir+e1DOmIaCz3
	 uFhzi5wk8AnJLdAu3hkUBjL4nOC4unSmAIcctRjQ=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250828085932epcas5p4e09ce768a1e522b1d067b78ba5c19ebd~f4qOvpfmV0476004760epcas5p4R;
	Thu, 28 Aug 2025 08:59:32 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.93]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4cCFhM24bmz6B9mK; Thu, 28 Aug
	2025 08:59:31 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250828085930epcas5p1719c7db08074bf1540dc85b71736a6c5~f4qNN7ifM0548005480epcas5p1Y;
	Thu, 28 Aug 2025 08:59:30 +0000 (GMT)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250828085927epsmtip293a425196cb6dc7c30d2f75654487ccd~f4qKkAQCW0306303063epsmtip2V;
	Thu, 28 Aug 2025 08:59:27 +0000 (GMT)
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
Subject: [PATCH v3 2/7] dt-bindings: media: fsd: Add CSIS video capture
 interface
Date: Thu, 28 Aug 2025 14:29:06 +0530
Message-ID: <20250828085911.81266-3-inbaraj.e@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250828085911.81266-1-inbaraj.e@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250828085930epcas5p1719c7db08074bf1540dc85b71736a6c5
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250828085930epcas5p1719c7db08074bf1540dc85b71736a6c5
References: <20250828085911.81266-1-inbaraj.e@samsung.com>
	<CGME20250828085930epcas5p1719c7db08074bf1540dc85b71736a6c5@epcas5p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_015939_166248_5B4D1194 
X-CRM114-Status: GOOD (  15.21  )
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

The Tesla FSD CSIS video capture interface is used to capture frames.

Signed-off-by: Inbaraj E <inbaraj.e@samsung.com>
---
 .../bindings/media/tesla,fsd-csis-media.yaml  | 76 +++++++++++++++++++
 1 file changed, 76 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/tesla,fsd-csis-media.yaml

diff --git a/Documentation/devicetree/bindings/media/tesla,fsd-csis-media.yaml b/Documentation/devicetree/bindings/media/tesla,fsd-csis-media.yaml
new file mode 100644
index 000000000000..f045094ae539
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/tesla,fsd-csis-media.yaml
@@ -0,0 +1,76 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/tesla,fsd-csis-media.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Tesla FSD SoC MIPI CSI-2 video capture interface(Bridge device).
+
+maintainers:
+  - Inbaraj E <inbaraj.e@samsung.com>
+
+description:
+  The Tesla FSD CSIS has an internal video capture interface to capture
+  frames originating from the sensor. The power supply for the IP is
+  managed by custom firmware and is expected to remain enabled
+  permanently, so power supply control is not added in linux.
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
+    csis0: csis@12641000 {
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


