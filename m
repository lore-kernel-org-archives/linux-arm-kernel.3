Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8559CCCD1AA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Oct 2025 13:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GqSnn4N2+xwCdyaHv2txZ21/LyrmQQPl6bRhFXBkPBc=; b=hB6Y6tf4+i2h9dcNiVVCXJRmga
	7Gdza5KfUTA9RcEo75VWpWZEfoVFqPOM4LnBPG8BjApcHYND836GNroT7JmTDSu2fr2TcGIHg9bGn
	upCR8G0alFUASkvtBTwoDGWzb2Et9wbDAJcedxpKo1AfVvWYYRV2n0Bvs+7d7rLOigZejADPU9pzG
	jdiLer050TZjh5/G38QW/pCrp+7MF4f3SsTD6viqtyMREilnFHWFvJP7te8UJr027Qx9G9G4MTOs6
	nLEAbEuBlrPPqwGeIpa5sExhRHUJFKXC2DVhE5z50M0KS/Jq5w//ou9Jwotli8w879BdnKVtjyYfD
	GGx6GDyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vA6xI-00000009xkN-0WnK;
	Sat, 18 Oct 2025 13:26:44 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vA6xC-00000009xgF-1cEC;
	Sat, 18 Oct 2025 13:26:40 +0000
X-UUID: 12225066ac2611f09f706fa2197c6ceb-20251018
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=GqSnn4N2+xwCdyaHv2txZ21/LyrmQQPl6bRhFXBkPBc=;
	b=ez8RxCs6rivwBKmKWW8L1/0WHJ8fdxbr0Ca+r3lQNH+7IrwyTIpVpXqYsk/TV5HdemEhSvlxke+EylXcc3goEPQc9ErQggqPeybcVs9Ppf28Vmb0bvV8D9he8lSRAb+8GQVUH/V+qkSdGENrnz7JwM8CHOYgjNr0wzlg2N5FqhY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:4888acc8-2d1c-4abf-be36-fec958b3f572,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:f5c14eb9-795c-4f99-91f3-c115e0d49051,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 12225066ac2611f09f706fa2197c6ceb-20251018
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <zhengnan.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1921264617; Sat, 18 Oct 2025 06:26:36 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Sat, 18 Oct 2025 21:26:30 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Sat, 18 Oct 2025 21:26:29 +0800
From: Zhengnan Chen <zhengnan.chen@mediatek.com>
To: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>, Will
 Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: <iommu@lists.linux.dev>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Zhengnan Chen
	<zhengnan.chen@mediatek.com>
Subject: [PATCH v4 5/5] iommu/mediatek: mt8189: Add MM IOMMUs support
Date: Sat, 18 Oct 2025 21:26:14 +0800
Message-ID: <20251018132625.14428-6-zhengnan.chen@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20251018132625.14428-1-zhengnan.chen@mediatek.com>
References: <20251018132625.14428-1-zhengnan.chen@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251018_062638_429580_B773E823 
X-CRM114-Status: GOOD (  10.71  )
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

Add support for mt8189 MM IOMMUs.

Signed-off-by: Zhengnan Chen <zhengnan.chen@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/iommu/mtk_iommu.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index e71acaa292cc..989e07599193 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -1771,6 +1771,33 @@ static const struct mtk_iommu_plat_data mt8189_data_infra = {
 	.iova_region_nr	= ARRAY_SIZE(single_domain),
 };
 
+static const u32 mt8189_larb_region_msk[MT8192_MULTI_REGION_NR_MAX][MTK_LARB_NR_MAX] = {
+	[0] = {~0, ~0, ~0, [22] = BIT(0)},	/* Region0: all ports for larb0/1/2 */
+	[1] = {[3] = ~0, [4] = ~0},		/* Region1: all ports for larb4(3)/7(4) */
+	[2] = {[5] = ~0, [6] = ~0,		/* Region2: all ports for larb9(5)/11(6) */
+	       [7] = ~0, [8] = ~0,		/* Region2: all ports for larb13(7)/14(8) */
+	       [9] = ~0, [10] = ~0,		/* Region2: all ports for larb16(9)/17(10) */
+	       [11] = ~0, [12] = ~0,		/* Region2: all ports for larb19(11)/20(12) */
+	       [21] = ~0},			/* Region2: larb21 fake GCE larb */
+};
+
+static const struct mtk_iommu_plat_data mt8189_data_mm = {
+	.m4u_plat	= M4U_MT8189,
+	.flags		= HAS_BCLK | HAS_SUB_COMM_3BITS | OUT_ORDER_WR_EN |
+			  WR_THROT_EN | IOVA_34_EN | MTK_IOMMU_TYPE_MM |
+			  PGTABLE_PA_35_EN | DL_WITH_MULTI_LARB,
+	.hw_list	= &m4ulist,
+	.inv_sel_reg	= REG_MMU_INV_SEL_GEN2,
+	.banks_num	= 5,
+	.banks_enable	= {true, false, false, false, false},
+	.iova_region	= mt8192_multi_dom,
+	.iova_region_nr	= ARRAY_SIZE(mt8192_multi_dom),
+	.iova_region_larb_msk = mt8189_larb_region_msk,
+	.larbid_remap	= {{0}, {1}, {21/* GCE_D */, 21/* GCE_M */, 2},
+			   {19, 20, 9, 11}, {7}, {4},
+			   {13, 17}, {14, 16}},
+};
+
 static const struct mtk_iommu_plat_data mt8192_data = {
 	.m4u_plat       = M4U_MT8192,
 	.flags          = HAS_BCLK | HAS_SUB_COMM_2BITS | OUT_ORDER_WR_EN |
@@ -1874,6 +1901,7 @@ static const struct of_device_id mtk_iommu_of_ids[] = {
 	{ .compatible = "mediatek,mt8188-iommu-vpp",   .data = &mt8188_data_vpp},
 	{ .compatible = "mediatek,mt8189-iommu-apu",   .data = &mt8189_data_apu},
 	{ .compatible = "mediatek,mt8189-iommu-infra", .data = &mt8189_data_infra},
+	{ .compatible = "mediatek,mt8189-iommu-mm",    .data = &mt8189_data_mm},
 	{ .compatible = "mediatek,mt8192-m4u", .data = &mt8192_data},
 	{ .compatible = "mediatek,mt8195-iommu-infra", .data = &mt8195_data_infra},
 	{ .compatible = "mediatek,mt8195-iommu-vdo",   .data = &mt8195_data_vdo},
-- 
2.46.0


