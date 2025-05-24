Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A38CC54F32
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 May 2025 12:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LFhkfG5hFlvoLcVg2OosYLYbiX+Pk5SM/1IR3ru0lMQ=; b=Ib60Sm/Ig41G0VSpTLT/hgNiLy
	QjgxvbR3Mvy8aigNmBS9ELBk8z9XpG5S2lNdTQT4tnDr1f7Buunj1MwmxwjKaCk6SBscN9BKEQEAE
	bC2NvJweJ+aLEis0zd/YGL0cJoGeySKNV5slfbUDVnkyNHEC6jIZ+JQ80X90uPHXr2diXq7CnqQ/T
	nEMeojW0jyQmTFLB7G6VNsmc1ocNX0+CffrkFFLxWuXJzl9tzNf0G7vuByUQF4PErCOREbt6GQPeB
	pxjrs1aZpNzihfawn9B8RrJqfSJCnvMK0j+Ti7ukw32g6TPYA+L5vh4kiEEE1Y6x2uI489jShbLxj
	j1R5GOUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uInas-00000005pJj-0vEC;
	Sat, 24 May 2025 12:03:14 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uInPy-00000005oHO-2m7M;
	Sat, 24 May 2025 11:52:02 +0000
X-UUID: 7ba70478389511f0bed96b30c12bc3d6-20250524
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=LFhkfG5hFlvoLcVg2OosYLYbiX+Pk5SM/1IR3ru0lMQ=;
	b=jgHrtuwvPSvbJjT+lVuNrqpFJ0CWfYQ46eAu85vMNEZYxwev5IFZzmEiPFvjDLSK8pKStcmjfViWoCtEiOEXBUJYtlgZAGi3xnAjY7naybfvLYWeeXZnXAHO5/ZHtYdtd1CJqDviBMvELGGIhhdVc1Rn26i/1yFTFswywXLE03M=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:db0e1364-3a12-4fb9-a1bc-9fb8b0e2c3d2,IP:0,UR
	L:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:25
X-CID-META: VersionHash:0ef645f,CLOUDID:f5faad47-ee4f-4716-aedb-66601021a588,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:11|97|99|83|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 7ba70478389511f0bed96b30c12bc3d6-20250524
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <olivia.wen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1988614475; Sat, 24 May 2025 04:51:52 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Sat, 24 May 2025 19:51:48 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Sat, 24 May 2025 19:51:48 +0800
From: Olivia Wen <olivia.wen@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Olivia Wen <olivia.wen@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<teddy.chen@mediatek.com>, <yunkec@chromium.org>
Subject: [PATCH v1 01/10] dt-bindings: media: Add MediaTek mt8188 ImgSys components
Date: Sat, 24 May 2025 19:49:53 +0800
Message-ID: <20250524115144.3832748-2-olivia.wen@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250524115144.3832748-1-olivia.wen@mediatek.com>
References: <20250524115144.3832748-1-olivia.wen@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250524_045158_703571_0C49A05E 
X-CRM114-Status: GOOD (  14.68  )
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

Introduce more Image System (ImgSys) components present in MT8188.

Signed-off-by: Olivia Wen <olivia.wen@mediatek.com>
---
 .../bindings/media/mediatek,imgsys.yaml       | 180 ++++++++++++++++++
 1 file changed, 180 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,imgsys.yaml

diff --git a/Documentation/devicetree/bindings/media/mediatek,imgsys.yaml b/Documentation/devicetree/bindings/media/mediatek,imgsys.yaml
new file mode 100644
index 000000000000..c2899c4b227b
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek,imgsys.yaml
@@ -0,0 +1,180 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/mediatek,imgsys.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek Camera Image System
+
+maintainers:
+  - Olivia Wen <olivia.wen@mediatek.com>
+
+description:
+  MediaTek Camera Image System is the image processing hardware present in MediaTek SoCs
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt8188-isp-imgsys
+
+  reg:
+    minItems: 1
+    maxItems: 17
+
+  clocks:
+    minItems: 1
+    maxItems: 17
+
+  clock-names:
+    minItems: 1
+    maxItems: 17
+
+  assigned-clocks: true
+
+  assigned-clock-parents: true
+
+  '#address-cells':
+    const: 2
+
+  '#size-cells':
+    const: 2
+
+  iommus:
+    minItems: 1
+    maxItems: 30
+
+  mediatek,larbs:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    minItems: 1
+    maxItems: 32
+    items:
+      maxItems: 1
+    description: |
+      List of phandle to the local arbiters in the current Socs.
+      Refer to bindings/memory-controllers/mediatek,smi-larb.yaml. It must sort
+      according to the local arbiter index, like larb0, larb1, larb2...
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - iommus
+  - mediatek,larbs
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          enum:
+            - mediatek,mt8188-isp-imgsys
+
+    then:
+      required:
+        - compatible
+        - reg
+        - clocks
+        - clock-names
+        - iommus
+        - mediatek,larbs
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mediatek,mt8188-clk.h>
+    #include <dt-bindings/memory/mediatek,mt8188-memory-port.h>
+
+    imgsys_fw: imgsys-fw@15000000 {
+        compatible = "mediatek,mt8188-isp-imgsys";
+        reg = <0 0x15000000 0 0x4000>,  /* 0 IMGSYS_TOP */
+              <0 0x15020000 0 0x10000>, /* 1 IMGSYS_TRAW */
+              <0 0x15040000 0 0x10000>, /* 2 IMGSYS_LTRAW */
+              <0 0x15640000 0 0x10000>, /* 3 IMGSYS_XTRAW */
+              <0 0x15100000 0 0x10000>, /* 4 IMGSYS_DIP */
+              <0 0x15150000 0 0x10000>, /* 5 IMGSYS_DIP_NR */
+              <0 0x15210000 0 0x10000>, /* 6 IMGSYS_PQDIP_A */
+              <0 0x15510000 0 0x10000>,	/* 7 IMGSYS_PQDIP_B */
+              <0 0x15200000 0 0x10000>,	/* 8 IMGSYS_WPE_EIS */
+              <0 0x15500000 0 0x10000>,	/* 9 IMGSYS_WPE_TNR */
+              <0 0x15600000 0 0x10000>,	/* 10 IMGSYS_WPE_LITE */
+              <0 0x15220000 0 0x00100>,	/* 11 IMGSYS_WPE1_DIP1 */
+              <0 0x15320000 0 0x10000>,	/* 12 IMGSYS_ME */
+              <0 0x15520000 0 0x00100>,	/* 13 IMGSYS_WPE2_DIP1 */
+              <0 0x15620000 0 0x00100>,	/* 14 IMGSYS_WPE3_DIP1 */
+              <0 0x15110000 0 0x00100>,	/* 15 IMGSYS_DIP_TOP */
+              <0 0x15130000 0 0x00100>;	/* 16 IMGSYS_DIP_TOP_NR */
+
+        assigned-clocks = <&topckgen CLK_TOP_IMG>;
+        assigned-clock-parents = <&apmixedsys CLK_APMIXED_IMGPLL>;
+        #address-cells = <2>;
+        #size-cells = <2>;
+        clocks = <&imgsys CLK_IMGSYS_MAIN_TRAW0>,
+             <&imgsys CLK_IMGSYS_MAIN_TRAW1>,
+             <&imgsys CLK_IMGSYS_MAIN_VCORE_GALS>,
+             <&imgsys CLK_IMGSYS_MAIN_DIP0>,
+             <&imgsys CLK_IMGSYS_MAIN_WPE0>,
+             <&imgsys CLK_IMGSYS_MAIN_WPE1>,
+             <&imgsys CLK_IMGSYS_MAIN_WPE2>,
+             <&imgsys CLK_IMGSYS_MAIN_GALS>,
+             <&imgsys1_dip_top CLK_IMGSYS1_DIP_TOP_DIP_TOP>,
+             <&imgsys1_dip_nr CLK_IMGSYS1_DIP_NR_DIP_NR>,
+             <&imgsys_wpe1 CLK_IMGSYS_WPE1>,
+             <&imgsys_wpe2 CLK_IMGSYS_WPE2>,
+             <&imgsys_wpe3 CLK_IMGSYS_WPE3>,
+             <&imgsys CLK_IMGSYS_MAIN_IPE>,
+             <&ipesys CLK_IPESYS_TOP>,
+             <&ipesys CLK_IPE_ME>,
+             <&ipesys CLK_IPE_SMI_LARB12>;
+        clock-names = "IMGSYS_CG_IMG_TRAW0",
+                  "IMGSYS_CG_IMG_TRAW1",
+                  "IMGSYS_CG_IMG_VCORE_GALS",
+                  "IMGSYS_CG_IMG_DIP0",
+                  "IMGSYS_CG_IMG_WPE0",
+                  "IMGSYS_CG_IMG_WPE1",
+                  "IMGSYS_CG_IMG_WPE2",
+                  "IMGSYS_CG_IMG_GALS",
+                  "DIP_TOP_DIP_TOP",
+                  "DIP_NR_DIP_NR",
+                  "WPE1_CG_DIP1_WPE",
+                  "WPE2_CG_DIP1_WPE",
+                  "WPE3_CG_DIP1_WPE",
+                  "ME_CG_IPE",
+                  "ME_CG_IPE_TOP",
+                  "ME_CG",
+                  "ME_CG_LARB12";
+
+        iommus = <&vdo_iommu M4U_PORT_L9_IMGI_T1_A>,
+                 <&vdo_iommu M4U_PORT_L9_UFDI_T1_A>,
+                 <&vdo_iommu M4U_PORT_L9_IMGBI_T1_A>,
+                 <&vdo_iommu M4U_PORT_L9_IMGCI_T1_A>,
+                 <&vdo_iommu M4U_PORT_L9_SMTI_T1_A>,
+                 <&vdo_iommu M4U_PORT_L9_SMTI_T4_A>,
+                 <&vdo_iommu M4U_PORT_L9_TNCSTI_T1_A>,
+                 <&vdo_iommu M4U_PORT_L9_TNCSTI_T4_A>,
+                 <&vdo_iommu M4U_PORT_L9_YUVO_T1_A>,
+                 <&vdo_iommu M4U_PORT_L9_YUVBO_T1_A>,
+                 <&vdo_iommu M4U_PORT_L9_YUVCO_T1_A>,
+                 <&vdo_iommu M4U_PORT_L9_TIMGO_T1_A>,
+                 <&vdo_iommu M4U_PORT_L9_YUVO_T2_A>,
+                 <&vdo_iommu M4U_PORT_L9_YUVO_T5_A>,
+                 <&vdo_iommu M4U_PORT_L9_IMGI_T1_B>,
+                 <&vdo_iommu M4U_PORT_L9_IMGBI_T1_B>,
+                 <&vdo_iommu M4U_PORT_L9_IMGCI_T1_B>,
+                 <&vdo_iommu M4U_PORT_L9_SMTI_T4_B>,
+                 <&vdo_iommu M4U_PORT_L9_TNCSO_T1_A>,
+                 <&vdo_iommu M4U_PORT_L9_SMTO_T1_A>,
+                 <&vdo_iommu M4U_PORT_L9_SMTO_T4_A>,
+                 <&vdo_iommu M4U_PORT_L9_TNCSTO_T1_A>,
+                 <&vdo_iommu M4U_PORT_L9_YUVO_T2_B>,
+                 <&vdo_iommu M4U_PORT_L9_YUVO_T5_B>,
+                 <&vdo_iommu M4U_PORT_L9_SMTO_T4_B>;
+
+        mediatek,larbs = <&larb9>,
+                         <&larb10>,
+                         <&larb11a>,
+                         <&larb11b>,
+                         <&larb11c>,
+                         <&larb15>,
+                         <&larb12>;
+    };
-- 
2.45.2


