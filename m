Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D75C1C3601B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 07:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j7V+na5WMoWftKQ2Hz3mhtzoxRwiO3a5WF1VMKOb3JI=; b=EjHoXqLRAURH0rrhZ1e8wo5QVU
	6XDHxiDyTfBVFuJv1JgkGDpefuIlj+5WSTqsUisBTU2N+sP/vKNyHe2b4lJPnrH00aikdGqqIC6jb
	sOdwPgtluatc6+KqK0f+8bh4m0aZ5O8QDYhR8KowBliH0DHVdBKeI7YVPoA2tyYlxR2MUFs9H/GGU
	7U7CStArRmFVKMRJiW7whKwnmxHL1uaxH+QT6VZraVuQ6S/IpPvwB8dhOrl8NNeYDkMsecxbBzu4D
	ykZbHLVz4ATf1wLILmBuetdWPTuf/b8VjDCB/pPjeUknh1R4NigK5RnFLgpUyTbiriCoBfg3OwuV2
	MvHI1YyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0FFC-000000089lc-2Vxg;
	Thu, 03 Apr 2025 07:44:10 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0FBP-0000000895v-31yY;
	Thu, 03 Apr 2025 07:40:17 +0000
X-UUID: df97eb6e105e11f0a1e849db4cc18d44-20250403
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=j7V+na5WMoWftKQ2Hz3mhtzoxRwiO3a5WF1VMKOb3JI=;
	b=N8wMtqK1O1QhkAXLaW1QNLneRqVSkX66rNKMIA7aX4jZW5iMCG8+p6Smg1f6ywmS+2iVWfYMsSMwoCkjLEqP4JT4l+1rZHbf33P2hT+lj+ggGGxappyPw/i0LhQeTGTb+L4Uy0r1knfWXPQLYQjPbPqAUMXopriwryoK4Vv0cTs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:78ba5f7b-d5ee-4ac0-bdef-ff99f228ab9d,IP:0,UR
	L:25,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:06d624c7-16da-468a-87f7-8ca8d6b3b9f7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:11|83|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: df97eb6e105e11f0a1e849db4cc18d44-20250403
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <bo.kong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 27830790; Thu, 03 Apr 2025 00:40:11 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 3 Apr 2025 15:40:08 +0800
Received: from mszsdhlt06.gcn.mediatek.inc (10.16.6.206) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 3 Apr 2025 15:40:08 +0800
From: bo.kong <bo.kong@mediatek.com>
To: Rob Herring <robh@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, mtk29348 <Bo.Kong@mediatek.com>,
	<linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: <zhaoyuan.chen@mediatek.com>, <Teddy.Chen@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v5 1/4] media: dt-bindings: add MT8188 AIE
Date: Thu, 3 Apr 2025 15:38:33 +0800
Message-ID: <20250403074005.21472-2-bo.kong@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250403074005.21472-1-bo.kong@mediatek.com>
References: <20250403074005.21472-1-bo.kong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_004015_772587_7D307023 
X-CRM114-Status: GOOD (  12.58  )
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

From: Bo Kong <Bo.Kong@mediatek.com>

Add YAML device tree bindings for MT8188 AIE.

Signed-off-by: Bo Kong <Bo.Kong@mediatek.com>
---
Changes in v5:
1. Modify the description to make it more concise.
2. Delete the description of reg.
3. Modify the description of iommus and delete the maxItems of iommus.
4. Delete all mediatek,larb.
5. Modify the name of clock, change _ to -.

Changes in v4:
1. Remove address-cells and size-cells
2. Remove larb12 related content
3. Update id content

Changes in v3:
None

Changes in v2:
1. Fix coding style
---
 .../bindings/media/mediatek,mt8188-aie.yaml   | 78 +++++++++++++++++++
 1 file changed, 78 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8188-aie.yaml

diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8188-aie.yaml b/Documentation/devicetree/bindings/media/mediatek,mt8188-aie.yaml
new file mode 100644
index 000000000000..861110bb0c98
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek,mt8188-aie.yaml
@@ -0,0 +1,78 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/mediatek,mt8188-aie.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: The AI Engine Unit of MediaTek Camera System
+
+maintainers:
+  - Bo Kong <bo.kong@mediatek.com>
+
+description:
+  AIE(AI Engine) provides a hardware-accelerated face detection function.
+
+properties:
+  compatible:
+    items:
+      - const: mediatek,mt8188-aie
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  iommus:
+    description:
+      List of the hardware port in respective IOMMU block for current Socs.
+      Refer to bindings/iommu/mediatek,iommu.yaml.
+
+  power-domains:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: clock for imgsys main ipe
+      - description: clock for ipe fdvt
+      - description: clock for ipe top
+
+  clock-names:
+    items:
+      - const: img-ipe
+      - const: ipe-fdvt
+      - const: ipe-top
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - iommus
+  - power-domains
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/memory/mediatek,mt8188-memory-port.h>
+    #include <dt-bindings/power/mediatek,mt8188-power.h>
+    #include <dt-bindings/clock/mediatek,mt8188-clk.h>
+    aie@15310000 {
+      compatible = "mediatek,mt8188-aie";
+      reg = <0x15310000 0x1000>;
+      interrupts = <GIC_SPI 787 IRQ_TYPE_LEVEL_HIGH 0>;
+      iommus = <&vpp_iommu M4U_PORT_L12_FDVT_RDA_0>,
+               <&vpp_iommu M4U_PORT_L12_FDVT_RDB_0>,
+               <&vpp_iommu M4U_PORT_L12_FDVT_WRA_0>,
+               <&vpp_iommu M4U_PORT_L12_FDVT_WRB_0>;
+      power-domains = <&spm MT8188_POWER_DOMAIN_IPE>;
+      clocks = <&imgsys CLK_IMGSYS_MAIN_IPE>,
+               <&ipesys CLK_IPE_FDVT>,
+               <&ipesys CLK_IPESYS_TOP>;
+      clock-names = "img-ipe",
+                    "ipe-fdvt",
+                    "ipe-top";
+    };
-- 
2.45.2


