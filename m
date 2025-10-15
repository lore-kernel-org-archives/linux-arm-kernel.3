Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1FAECCD18E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 03:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MDEDeQYTPIUsq+6PmAHcXHddj1Fwad7TXehTCtC8sm8=; b=a3DlP/DCzuQX2V30qO0enfkmfw
	gAi1SCMYIQKdAvu1bpjope75PlDpQx0Xm6A1xh99+eXZEnKK7dXmKtv+RkedyjBsudZZT0xDVF98/
	xyHesl3Yt1sHhMZpk4KVyDwcD8oKlp8RHiBeJLrunZWCQpo4NdBUS5IJHyejZ7hljOt10MrM1fKST
	xjxsrtb8V51zbM0a32iHk5haqL66fC69IUwTbzg4ACJU5MHsypxsN4IL8HTIq4BguU+IhcEA8cP5Q
	PMORtiFkpp1IJ0oFz2mAWEkOrqLrAqNMTQeiX1Wfk454jgg0My51akEod4RBt6bIAmqF+93Qpo4Hf
	Cr7IU9nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8s9f-00000000KoK-3Iiu;
	Wed, 15 Oct 2025 03:26:23 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8s9d-00000000Klf-2Xo6;
	Wed, 15 Oct 2025 03:26:22 +0000
X-UUID: b5f24af0a97611f0a52f393f94899d25-20251014
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=MDEDeQYTPIUsq+6PmAHcXHddj1Fwad7TXehTCtC8sm8=;
	b=iLfguMWY4p2anOjuH5xTMTtQuFCQIcFpeNK/a2E2GcBIUCswoS1ov6bBIkvqPKFUxv07CVablNs09Km6PlWr/0whY23EMQBCqLaHu/4t49Qs7j7xo1Fw3lshekLAWDjUKaI0IWUKrGPRe8m7ipfAzDI5x/Rzfnra7g3pnRKcMx0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:b456d5fa-e368-4e54-92f6-90c16f58ee6c,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:a9d874c,CLOUDID:07236602-eaf8-4c8c-94de-0bc39887e077,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b5f24af0a97611f0a52f393f94899d25-20251014
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <zhengnan.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1620293700; Tue, 14 Oct 2025 20:26:17 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 15 Oct 2025 11:26:15 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.10 via Frontend Transport; Wed, 15 Oct 2025 11:26:14 +0800
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
Subject: [PATCH v2 4/5] iommu/mediatek: mt8189: Add INFRA IOMMUs support
Date: Wed, 15 Oct 2025 11:24:20 +0800
Message-ID: <20251015032509.5057-5-zhengnan.chen@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20251015032509.5057-1-zhengnan.chen@mediatek.com>
References: <20251015032509.5057-1-zhengnan.chen@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_202621_664080_A9FEFCA3 
X-CRM114-Status: GOOD (  11.66  )
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

Add support for mt8189 INFRA IOMMUs.

Signed-off-by: Zhengnan Chen <zhengnan.chen@mediatek.com>
---
 drivers/iommu/mtk_iommu.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 999f7b858164..2eb62a073a58 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -339,6 +339,7 @@ static int mtk_iommu_hw_init(const struct mtk_iommu_data *data, unsigned int ban
 #define MTK_IOMMU_4GB_MODE_REMAP_BASE	 0x140000000UL
 
 static LIST_HEAD(apulist);	/* List the apu iommu HWs */
+static LIST_HEAD(infralist);	/* List the iommu_infra HW */
 static LIST_HEAD(m4ulist);	/* List all the M4U HWs */
 
 #define for_each_m4u(data, head)  list_for_each_entry(data, head, list)
@@ -1758,6 +1759,18 @@ static const struct mtk_iommu_plat_data mt8189_data_apu = {
 	.iova_region_larb_msk = mt8189_apu_region_msk,
 };
 
+static const struct mtk_iommu_plat_data mt8189_data_infra = {
+	.m4u_plat	= M4U_MT8189,
+	.flags		= WR_THROT_EN | DCM_DISABLE | MTK_IOMMU_TYPE_INFRA |
+			  CFG_IFA_MASTER_IN_ATF | SHARE_PGTABLE | PGTABLE_PA_35_EN,
+	.hw_list	= &infralist,
+	.banks_num	= 1,
+	.banks_enable	= {true},
+	.inv_sel_reg	= REG_MMU_INV_SEL_GEN2,
+	.iova_region	= single_domain,
+	.iova_region_nr	= ARRAY_SIZE(single_domain),
+};
+
 static const struct mtk_iommu_plat_data mt8192_data = {
 	.m4u_plat       = M4U_MT8192,
 	.flags          = HAS_BCLK | HAS_SUB_COMM_2BITS | OUT_ORDER_WR_EN |
@@ -1860,6 +1873,7 @@ static const struct of_device_id mtk_iommu_of_ids[] = {
 	{ .compatible = "mediatek,mt8188-iommu-vdo",   .data = &mt8188_data_vdo},
 	{ .compatible = "mediatek,mt8188-iommu-vpp",   .data = &mt8188_data_vpp},
 	{ .compatible = "mediatek,mt8189-iommu-apu",   .data = &mt8189_data_apu},
+	{ .compatible = "mediatek,mt8189-iommu-infra", .data = &mt8189_data_infra},
 	{ .compatible = "mediatek,mt8192-m4u", .data = &mt8192_data},
 	{ .compatible = "mediatek,mt8195-iommu-infra", .data = &mt8195_data_infra},
 	{ .compatible = "mediatek,mt8195-iommu-vdo",   .data = &mt8195_data_vdo},
-- 
2.46.0


