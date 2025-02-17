Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40BBFC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 10:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oTm1fXXyNbEjaSytwTVBGR6jZI+/WfArELCCgciIDnY=; b=R9yIAxp5Y/3fVmuTltDJPg8f7r
	pwIBDWo+PFGBm15BZanQQZMt5qVSYdflBKpk1LBz4k5gdODtYSysvGYcd2w685dYzi1lY+zGdPNZI
	J5CdAgve6YoPialajPU/kstYEkGM7ZkeTdoMB40eFSGPT4bEr6LmDvFtNyV21qu/fbapqW5C2ofnO
	GP4FAi5eAefVrVDC+uJgXUZ193lDKrwyNo0apToACsRoIST0urLRJ646yBEYYPVTvoE1AqXexCUGo
	u5cGCJaW3DLJMQgO3MQOFs9lTkJdtN929wicZWlYjhsy8YgtwT9hvAb7a0BPAtmhvqRjuPhBWu8QI
	nsturJfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjylN-00000004C1B-0xJc;
	Mon, 17 Feb 2025 10:54:09 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjyLh-000000046v2-1ETV;
	Mon, 17 Feb 2025 10:27:38 +0000
X-UUID: cafbac94ed1911ef83f2a1c9db70dae0-20250217
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=oTm1fXXyNbEjaSytwTVBGR6jZI+/WfArELCCgciIDnY=;
	b=dXCQZGot1auTr7crYJkjJ6hCVDw9x2erR2ryM0gffgjZbvG6HBFLhMFmxxTTkEaSJweRvMpzTvI48ynA9+S8f3+r95LjhTGMpqO5juWBVQ7hv64QNBnmBPy/JnxSyotearM9ruD6vx462LYoI7YnUfCIBBuB0iopbPJcY57KZOc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:3dfd5f3f-8056-4d0f-b7dd-b8227ec77b5f,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:200a7afc-7800-43c5-b97b-ddbe32561a5b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: cafbac94ed1911ef83f2a1c9db70dae0-20250217
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2092940999; Mon, 17 Feb 2025 03:27:30 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Mon, 17 Feb 2025 18:27:27 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Mon, 17 Feb 2025 18:27:27 +0800
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>, Will
 Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<iommu@lists.linux.dev>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Alexandre Mergnat
	<amergnat@baylibre.com>
CC: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>, Macpaul Lin <macpaul@gmail.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-usb@vger.kernel.org>, <stable@vger.kernel.org>, Chris-qj chen
	<chris-qj.chen@mediatek.com>
Subject: [PATCH v6 RESEND] dt-bindings: iommu: mediatek: Fix interrupt count constraint for new SoCs
Date: Mon, 17 Feb 2025 18:26:52 +0800
Message-ID: <20250217102652.1858304-1-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_022737_338345_EB6D04EE 
X-CRM114-Status: GOOD (  12.18  )
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

The infra-iommu node in mt8195.dtsi was triggering a CHECK_DTBS error due
to an excessively long 'interrupts' property. The error message was:

  infra-iommu@10315000: interrupts: [[0, 795, 4, 0], [0, 796, 4, 0],
                     [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]]
                     is too long

To address this issue, update the compatbile matching rule for
'interrupts' property. This change allows flexibility in the number
of interrupts for new SoCs like MT8195.
The purpose of these 5 interrupts is also added into description.

Fixes: bca28426805d ("dt-bindings: iommu: mediatek: Convert IOMMU to DT schema")
Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/iommu/mediatek,iommu.yaml        | 28 ++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

Changes for v2:
 - commit message: re-formatting and add a description of adding 5 interrupts.
 - add 'description' and 'maxItems: 5' for 'interrupt' property of
   'mt8195-iommu-infra'
 - others keeps 'maxItems: 1'

Changes for v3:
 - Refine the description for 'interrupts' property and fixes the compatible
   matching rules.
 - Refine commit message.

Changes for v4:
  - add missing 'minItems: 5' to 'mediatek,mt8195-iommu-infra'.
    Thanks the explanation from Conor and Krzysztof. 

Changes for v5:
  - Repharse the description for interrupts property of MT8195.

Changes for v6:
  - Remove maxItems for mt8195-iommu-infra.
  - Add 'Reviewed-by' tag from Rob. Thanks for the review.

diff --git a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
index ea6b0f5f24de..eeb39f5acf7e 100644
--- a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
+++ b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
@@ -96,7 +96,16 @@ properties:
     maxItems: 1
 
   interrupts:
-    maxItems: 1
+    description: |
+      Usually, the IOMMU requires only one interrupt.
+
+      The infra IOMMU in MT8195 has five banks: each features one set
+      of APB registers. One for the normal world (set 0), three for the
+      protected world (sets 1-3), and one for the secure world (set 4).
+      and each set has its own interrupt. Therefore, five interrupts
+      are needed.
+    minItems: 1
+    maxItems: 5
 
   clocks:
     items:
@@ -210,6 +219,23 @@ allOf:
       required:
         - mediatek,larbs
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mediatek,mt8195-iommu-infra
+
+    then:
+      properties:
+        interrupts:
+          minItems: 5
+
+    else:
+      properties:
+        interrupts:
+          maxItems: 1
+
 additionalProperties: false
 
 examples:
-- 
2.45.2


