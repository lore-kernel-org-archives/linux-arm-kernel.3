Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AF11C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 09:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3R1eimp2sVIaoNWgM9ROE/GHiObjuM6mSUl62HDbHkw=; b=gr7fmN3y4UQMf0b7T2TV7Dh9s7
	umsLQjDV0NQQ07ffvMoqdtp1csWYzkEni7lRFhj5zBioSGs0q8UMmsKpPVFs1auhm3hH0T64Ogmuf
	I+nNFzOrOtvSZ7mOGSN75dIJMM4pcdy8ikK44Nw32DjeYdTCiM3jGjaSYNz7G7OvJr0rApKorFVG3
	HmI+/MDGA0iHHBnrNdnzZtMTHfA4Hct41hsbKG0OVcnYyWN2D9HFA7jSa07YNPEAB0tZ6uOZ2mDCS
	vRtvYjMOlqJmdTRZJnb8+Hwl3sWXIBVcTSiIsVl+qKuk4U0gm9YoOl30NFDXTPk558O2ONtyRCICI
	fK0u87aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue8zv-00000001x44-0im2;
	Tue, 22 Jul 2025 09:09:19 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue8on-00000001v5m-0F9U;
	Tue, 22 Jul 2025 08:57:50 +0000
X-UUID: ec7eb4a866d911f09f706fa2197c6ceb-20250722
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=3R1eimp2sVIaoNWgM9ROE/GHiObjuM6mSUl62HDbHkw=;
	b=WNxFC8J34uAD/cnf5awdv75YsHKUebD/PNq/HTmaefrzYSDNlb0dU/KSglWpYDMMM+/6oxOktScWJ9moWYdkSVx5p30YySlRpbmUpdks1bRl24FejLvVk3MgUClTjFvIc/xDCY1DhA/V4+r1QWqLX4RZ0TFlSXaNtsTWR8pLMuk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:e78c24fe-7aa8-49a1-9547-064308c22c7e,IP:0,UR
	L:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-25
X-CID-META: VersionHash:9eb4ff7,CLOUDID:a3a3249a-32fc-44a3-90ac-aa371853f23f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: ec7eb4a866d911f09f706fa2197c6ceb-20250722
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 11531353; Tue, 22 Jul 2025 01:57:41 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Tue, 22 Jul 2025 16:57:36 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Tue, 22 Jul 2025 16:57:36 +0800
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
	Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Peter Wang
	<peter.wang@mediatek.com>, Stanley Jhu <chu.stanley@gmail.com>, "James E . J
 . Bottomley" <James.Bottomley@HansenPartnership.com>, "Martin K . Petersen"
	<martin.petersen@oracle.com>, <linux-scsi@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
	Ramax Lo <ramax.lo@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>,
	Macpaul Lin <macpaul@gmail.com>, MediaTek Chromebook Upstream
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v2 3/4] dt-bindings: ufs: mediatek,ufs: add MT8195 compatible and update clock nodes
Date: Tue, 22 Jul 2025 16:57:19 +0800
Message-ID: <20250722085721.2062657-3-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250722085721.2062657-1-macpaul.lin@mediatek.com>
References: <20250722085721.2062657-1-macpaul.lin@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_015749_099753_7A3B36A6 
X-CRM114-Status: GOOD (  11.39  )
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

Add MT8195 UFSHCI compatible string.
Relax the schema to allow between one to eight clocks/clock-names
entries for all MediaTek UFS nodes. Legacy platforms may only need
a few clocks, whereas newer devices such as the MT8195 require
additional clock-gating domains. For MT8195 specifically, enforce
exactly eight clocks and clock-names entries to satisfy its hardware
requirements.

Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
---
 .../devicetree/bindings/ufs/mediatek,ufs.yaml | 42 ++++++++++++++++---
 1 file changed, 36 insertions(+), 6 deletions(-)

Changes for v2:
 - Remove duplicate minItems and maxItems as suggested in the review.
 - Add a description of how the MT8195 hardware differs from earlier
   platforms.

diff --git a/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml b/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
index 20f341d25ebc..1dec54fb00f3 100644
--- a/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
+++ b/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
@@ -9,21 +9,20 @@ title: Mediatek Universal Flash Storage (UFS) Controller
 maintainers:
   - Stanley Chu <stanley.chu@mediatek.com>
 
-allOf:
-  - $ref: ufs-common.yaml
-
 properties:
   compatible:
     enum:
       - mediatek,mt8183-ufshci
       - mediatek,mt8192-ufshci
+      - mediatek,mt8195-ufshci
 
   clocks:
-    maxItems: 1
+    minItems: 1
+    maxItems: 8
 
   clock-names:
-    items:
-      - const: ufs
+    minItems: 1
+    maxItems: 8
 
   phys:
     maxItems: 1
@@ -47,6 +46,37 @@ required:
 
 unevaluatedProperties: false
 
+allOf:
+  - $ref: ufs-common.yaml
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mediatek,mt8195-ufshci
+    then:
+      properties:
+        clocks:
+          minItems: 8
+        clock-names:
+          items:
+            - const: ufs
+            - const: ufs_aes
+            - const: ufs_tick
+            - const: unipro_sysclk
+            - const: unipro_tick
+            - const: unipro_mp_bclk
+            - const: ufs_tx_symbol
+            - const: ufs_mem_sub
+    else:
+      properties:
+        clocks:
+          maxItems: 1
+        clock-names:
+          items:
+            - const: ufs
+
 examples:
   - |
     #include <dt-bindings/clock/mt8183-clk.h>
-- 
2.45.2


