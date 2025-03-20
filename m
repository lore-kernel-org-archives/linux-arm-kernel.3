Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A85E7C36001
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 07:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RZ2JcBvio+ntIgdmdYECbx7+bIzD61zrEsYhBVvtdO4=; b=KLfHk77MvlbawhF66eCKvA6Rz8
	QtC2Zmr8D1UlkGEV8tqf/jLb/G1DgN68E1MWq7UpS37BuLjpo3jVvpwt/F4trdnDIhYGYTB4ggQLh
	gwyx02CEdD77A3+hML9pFvR9m0u9HK4+iu82xE4jdq6/SW2akL8xjtjzy3xtq2HpixFHDu9nm0NOG
	ZEq5KdRGbDaJMR1BFi200WeOLUs9iyxtNfviuxUcNk8Ou9JppgXu7Xj1ejaBr11lj93lOw9ESe/Em
	dlZm2949JqbosTeustUY7LleJLhzxSCSqE6yHqDi3BMOtMofgIXNfcgX1AAgYlblIXVeDKJWVmOAW
	62JLjiGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvAZF-0000000BRFJ-0Lry;
	Thu, 20 Mar 2025 07:43:53 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvASc-0000000BQCT-27k0;
	Thu, 20 Mar 2025 07:37:03 +0000
X-UUID: 1c3b0012055e11f083f2a1c9db70dae0-20250320
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=RZ2JcBvio+ntIgdmdYECbx7+bIzD61zrEsYhBVvtdO4=;
	b=Gei0cDqUa+PAORV4DDXIdEHKtOSxHuTbrCk/TtXAzQ8QrPmb82KR/7wZ/8U9XKnfu9PQPX7JvP75a93D/4QDNi4E56xMS7sPVS0CbwN3vAWbiKbQd0laeqs+gcV1gFuR9CahWAnwmfSYo0MGZRer0btahf156ayov+R9j9xVu9c=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:62149578-b918-4be3-b74e-248951b88d11,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:ebaa584a-a527-43d8-8af6-bc8b32d9f5e9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 1c3b0012055e11f083f2a1c9db70dae0-20250320
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <xueqi.zhang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1289677114; Thu, 20 Mar 2025 00:37:00 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 20 Mar 2025 15:36:57 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 20 Mar 2025 15:36:57 +0800
From: Xueqi Zhang <xueqi.zhang@mediatek.com>
To: Yong Wu <yong.wu@mediatek.com>, Krzysztof Kozlowski <krzk@kernel.org>, Rob
 Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: Wendy-st Lin <wendy-st.lin@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<iommu@lists.linux.dev>, Xueqi Zhang <xueqi.zhang@mediatek.com>
Subject: [PATCH 3/3] memory: mtk-smi: mt8196: Add smi support
Date: Thu, 20 Mar 2025 15:36:18 +0800
Message-ID: <20250320073625.25225-4-xueqi.zhang@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250320073625.25225-1-xueqi.zhang@mediatek.com>
References: <20250320073625.25225-1-xueqi.zhang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_003702_550983_6805468A 
X-CRM114-Status: GOOD (  16.52  )
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

Add support for MT8196 SMI common and SMI LARB.
Since the MT8196 SMI connects with SMMU, rather than MTK_IOMMU,
it doesn't componet_add with mtk_iommu. Add a flag
MTK_SMI_FLAG_CONNECT_SMMUV3 for this.

Signed-off-by: Xueqi Zhang <xueqi.zhang@mediatek.com>
---
 drivers/memory/mtk-smi.c | 134 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 133 insertions(+), 1 deletion(-)

diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
index b9affa3c3185..bd68df23e40b 100644
--- a/drivers/memory/mtk-smi.c
+++ b/drivers/memory/mtk-smi.c
@@ -92,6 +92,7 @@
 #define MTK_SMI_FLAG_SW_FLAG		BIT(1)
 #define MTK_SMI_FLAG_SLEEP_CTL		BIT(2)
 #define MTK_SMI_FLAG_CFG_PORT_SEC_CTL	BIT(3)
+#define MTK_SMI_FLAG_CONNECT_SMMUV3	BIT(4)
 #define MTK_SMI_CAPS(flags, _x)		(!!((flags) & (_x)))
 
 struct mtk_smi_reg_pair {
@@ -275,6 +276,9 @@ static int mtk_smi_larb_config_port_gen2_general(struct device *dev)
 		}
 	}
 
+	if (MTK_SMI_CAPS(larb->larb_gen->flags_general, MTK_SMI_FLAG_CONNECT_SMMUV3))
+		return 0;
+
 	for_each_set_bit(i, (unsigned long *)larb->mmu, 32) {
 		reg = readl_relaxed(larb->base + SMI_LARB_NONSEC_CON(i));
 		reg |= F_MMU_EN;
@@ -410,6 +414,101 @@ static const u8 mtk_smi_larb_mt8195_ostd[][SMI_LARB_PORT_NR_MAX] = {
 	[28] = {0x1a, 0x0e, 0x0a, 0x0a, 0x0c, 0x0e, 0x10,},
 };
 
+static const u8 mtk_smi_larb_mt8196_ostd[][SMI_LARB_PORT_NR_MAX] = {
+	[0] = {0x4, 0x4, 0x40, 0x40, 0x1, 0x1, 0x2, 0x2, 0x4, 0x4,
+	       0x1, 0x1, 0x1,},
+	[1] = {0x4, 0x4, 0x40, 0x40, 0x32, 0x1, 0x2, 0x2, 0x2, 0x4,
+	       0x4, 0x2, 0x1, 0x1, 0x1, 0x1,},
+	[2] = {0x1, 0x1, 0x1, 0x1, 0x9, 0xb, 0x2a, 0x1, 0x1, 0x1,
+	       0x1, 0x1, 0x1, 0x1, 0x3, 0x1c, 0x1, 0x1,},
+	[3] = {0x2, 0x2, 0x2, 0x2, 0x1a, 0x20, 0x2a, 0x2, 0x1, 0x1,
+	       0x1, 0x1, 0x1, 0x2, 0x8, 0x1c, 0x1, 0x1,},
+	[4] = {0x40, 0x10, 0x10, 0x1, 0x4, 0x10, 0x8, 0x8,},
+	[5] = {0x10, 0x8, 0x40, 0x1e, 0x8, 0x8, 0x4, 0x1,},
+	[6] = {0x40, 0x12, 0x1,},
+	[7] = {0x20, 0x6, 0x6, 0x1, 0x1, 0x24, 0x2b, 0x7, 0x4, 0x1,
+	       0x1, 0xf, 0x3, 0x5, 0x8, 0x8, 0x3, 0x8, 0x5, 0x23,
+	       0x24, 0x4, 0x2, 0xb, 0x10, 0x17, 0x4, 0x8, 0x5, 0x1,
+	       0x1, 0x6,},
+	[8] = {0x20, 0x6, 0x6, 0x1, 0x1, 0x24, 0x2b, 0x7, 0x4, 0x1,
+	       0x1, 0xf, 0x3, 0x5, 0x8, 0x8, 0x3, 0x8, 0x5, 0x23,
+	       0x24, 0x4, 0x2, 0xb, 0x10, 0x17, 0x4, 0x8, 0x5, 0x1,
+	       0x1, 0x6,},
+	[9] = {0x2b, 0x8, 0x9, 0x31, 0x10, 0x26, 0x15, 0x13, 0x7, 0x4,
+	       0x1, 0x1, 0x7, 0xa, 0xb, 0x6, 0x1, 0x1, 0x1, 0x1,
+	       0x1, 0x1, 0xf, 0x9, 0x6, 0x3,},
+	[10] = {0x2b, 0x8, 0x20, 0x1d, 0x19, 0xf, 0x1, 0x3,},
+	[11] = {0x8, 0x16, 0x16, 0x24, 0x1, 0x1, 0x1, 0x3, 0x32, 0x1,
+		0x8, 0x10, 0x16, 0x2, 0x38,},
+	[12] = {0xa, 0xa, 0x1,},
+	[13] = {0x2, 0x20, 0x14, 0x1, 0x1, 0x2, 0x2,},
+	[14] = {0x2, 0x20, 0x14, 0x1, 0x2, 0x2,},
+	[15] = {0x2b, 0x7, 0x31, 0xa, 0x10, 0x10, 0x2b, 0x29, 0x7, 0x1,},
+	[16] = {0x4, 0x4, 0x12, 0x8, 0x8, 0x16, 0x8, 0x6, 0xe, 0x6,
+		0x1e, 0x18, 0x16, 0xe, 0x8, 0xe, 0x8, 0x2, 0x2,},
+	[17] = {0x18, 0x18, 0x8, 0x8, 0xc, 0x4, 0x2,},
+	[18] = {0xb, 0x1, 0x10, 0x1, 0x2,},
+	[19] = {0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x4, 0x2, 0x1, 0x1,
+		0x4, 0x2, 0x1,},
+	[20] = {0x2, 0x2, 0x2, 0x40, 0x40, 0x40, 0x1, 0x2, 0x2, 0x2,
+		0x4, 0x4, 0x4, 0x1, 0x1,},
+	[21] = {0x2, 0x2, 0x2, 0x40, 0x40, 0x40, 0x1, 0x32, 0x32, 0x32,
+		0x2, 0x2, 0x2, 0x4, 0x4, 0x4, 0x2, 0x1,},
+	[22] = {0x8, 0x16, 0x16, 0x24, 0x1, 0x1, 0x1, 0x3, 0x32, 0x1,
+		0x8, 0x10, 0x16, 0x2, 0x38,},
+	[23] = {0x8, 0x16, 0x16, 0x24, 0x1, 0x1, 0x1, 0x3, 0x32, 0x1,
+		0x8, 0x10, 0x16, 0x2, 0x38,},
+	[24] = {0x20, 0x6, 0x6, 0x1, 0x1, 0x24, 0x2b, 0x7, 0x4, 0x1,
+		0x1, 0xf, 0x3, 0x5, 0x8, 0x8, 0x3, 0x8, 0x5, 0x23,
+		0x24, 0x4, 0x2, 0xb, 0x10, 0x17, 0x4, 0x8, 0x5, 0x1,
+		0x1, 0x6,},
+	[25] = {0x2, 0xc, 0x2, 0xc, 0x6, 0x6, 0x3, 0x3, 0x3, 0x1,
+		0x1, 0x2, 0x2,},
+	[26] = {0x2, 0xc, 0x2, 0xc, 0x6, 0x6, 0x3, 0x3, 0x3, 0x1,
+		0x1, 0x2, 0x2,},
+	[27] = {0x6, 0x2, 0xe, 0x6, 0x2, 0x14, 0x14, 0x4, 0x6,},
+	[28] = {0x2b, 0x8, 0x31, 0x10, 0x26, 0x15, 0x1, 0x10,},
+	[29] = {0x2, 0x2, 0x2, 0x2, 0x10, 0xe, 0x6, 0x6, 0x1, 0x1,
+		0x2, 0x2, 0x2, 0x2,},
+	[30] = {0x2, 0x2, 0x2, 0x2,},
+	[31] = {},
+	[32] = {0x1, 0x1, 0x1, 0x1, 0x2, 0x2, 0x32, 0x32, 0x1, 0x2,},
+	[33] = {0xa, 0x1, 0x1, 0x1, 0xa, 0xa, 0xa, 0x1, 0x26, 0x32,
+		0x32, 0x32, 0x32, 0x32, 0x2, 0x1,},
+	[34] = {0x4, 0x4, 0x40, 0x40, 0x1, 0x1, 0x2, 0x2, 0x4, 0x4,
+		0x1, 0x1, 0x1,},
+	[35] = {0x4, 0x4, 0x40, 0x40, 0x32, 0x1, 0x2, 0x2, 0x2, 0x4,
+		0x4, 0x2, 0x1, 0x1, 0x1, 0x1,},
+	[36] = {0x2, 0x2, 0x2, 0x40, 0x40, 0x40, 0x1, 0x2, 0x2, 0x2,
+		0x4, 0x4, 0x4, 0x1, 0x1,},
+	[37] = {0x2, 0x2, 0x2, 0x40, 0x40, 0x40, 0x1, 0x32, 0x32, 0x32,
+		0x2, 0x2, 0x2, 0x4, 0x4, 0x4, 0x2, 0x1,},
+	[38] = {0x29, 0x40, 0x40, 0x7, 0x4, 0x40, 0x4, 0x18, 0x1, 0x1,
+		0x1, 0x7, 0x4,},
+	[39] = {0x16, 0x4, 0x4, 0x8, 0x4, 0x6, 0x6, 0x13, 0x11, 0x20,
+		0x11, 0x1, 0x1, 0x1, 0x9, 0x8, 0x4, 0x6, 0x6,},
+	[40] = {0x9, 0x7, 0x7, 0xb, 0xf, 0x1d, 0x13, 0x6, 0x1, 0x1,
+		0x1, 0x6, 0x9, 0x7, 0xe, 0x3,},
+	[41] = {0x40, 0x8, 0x1, 0x1, 0x2, 0x1, 0x1, 0x1, 0x1, 0x1,
+		0x8, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1,
+		0x1, 0x8, 0x8, 0x8, 0x8, 0x8, 0x1, 0x1, 0x1, 0x1,
+		0x1, 0x1,},
+	[42] = {0x1, 0x8, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1,
+		0x8, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1,
+		0x1, 0x8, 0x8, 0x8, 0x8, 0x8, 0x1, 0x1, 0x1, 0x1,
+		0x1, 0x1,},
+	[43] = {0x4, 0x4, 0x12, 0x8, 0x8, 0x16, 0x8, 0x6, 0xe, 0x6,
+		0x1e, 0x18, 0x16, 0xe, 0x8, 0xe, 0x8, 0x1, 0x1,},
+	[44] = {0x4, 0x4, 0x12, 0x8, 0x8, 0x16, 0x8, 0x6, 0xe, 0x6,
+		0x1e, 0x18, 0x16, 0xe, 0x8, 0xe, 0x8, 0x1, 0x1,},
+	[45] = {0x18, 0x18, 0x8, 0x8, 0xc, 0x4, 0x1,},
+	[46] = {0x18, 0x18, 0x8, 0x8, 0xc, 0x4, 0x1,},
+	[47] = {0x1, 0x8, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1,
+		0x8, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1,
+		0x1, 0x8, 0x8, 0x8, 0x8, 0x8, 0x1, 0x1, 0x1, 0x1,
+		0x1, 0x1,},
+};
+
 static const struct mtk_smi_larb_gen mtk_smi_larb_mt2701 = {
 	.port_in_larb = {
 		LARB0_PORT_OFFSET, LARB1_PORT_OFFSET,
@@ -470,6 +569,13 @@ static const struct mtk_smi_larb_gen mtk_smi_larb_mt8195 = {
 	.ostd		            = mtk_smi_larb_mt8195_ostd,
 };
 
+static const struct mtk_smi_larb_gen mtk_smi_larb_mt8196 = {
+	.config_port                = mtk_smi_larb_config_port_gen2_general,
+	.flags_general	            = MTK_SMI_FLAG_THRT_UPDATE | MTK_SMI_FLAG_SW_FLAG |
+				      MTK_SMI_FLAG_SLEEP_CTL | MTK_SMI_FLAG_CONNECT_SMMUV3,
+	.ostd		            = mtk_smi_larb_mt8196_ostd,
+};
+
 static const struct of_device_id mtk_smi_larb_of_ids[] = {
 	{.compatible = "mediatek,mt2701-smi-larb", .data = &mtk_smi_larb_mt2701},
 	{.compatible = "mediatek,mt2712-smi-larb", .data = &mtk_smi_larb_mt2712},
@@ -482,6 +588,7 @@ static const struct of_device_id mtk_smi_larb_of_ids[] = {
 	{.compatible = "mediatek,mt8188-smi-larb", .data = &mtk_smi_larb_mt8188},
 	{.compatible = "mediatek,mt8192-smi-larb", .data = &mtk_smi_larb_mt8192},
 	{.compatible = "mediatek,mt8195-smi-larb", .data = &mtk_smi_larb_mt8195},
+	{.compatible = "mediatek,mt8196-smi-larb", .data = &mtk_smi_larb_mt8196},
 	{}
 };
 MODULE_DEVICE_TABLE(of, mtk_smi_larb_of_ids);
@@ -569,6 +676,7 @@ static int mtk_smi_larb_probe(struct platform_device *pdev)
 {
 	struct mtk_smi_larb *larb;
 	struct device *dev = &pdev->dev;
+	bool connect_with_smmuv3;
 	int ret;
 
 	larb = devm_kzalloc(dev, sizeof(*larb), GFP_KERNEL);
@@ -580,6 +688,13 @@ static int mtk_smi_larb_probe(struct platform_device *pdev)
 	if (IS_ERR(larb->base))
 		return PTR_ERR(larb->base);
 
+	connect_with_smmuv3 = MTK_SMI_CAPS(larb->larb_gen->flags_general,
+					   MTK_SMI_FLAG_CONNECT_SMMUV3);
+	if (connect_with_smmuv3 && !IS_ENABLED(CONFIG_ARM_SMMU_V3)) {
+		dev_err(dev, " SMMU property conflict.\n");
+		return -EINVAL;
+	}
+
 	ret = mtk_smi_dts_clk_init(dev, &larb->smi, mtk_smi_larb_clks,
 				   MTK_SMI_LARB_REQ_CLK_NR, MTK_SMI_LARB_OPT_CLK_NR);
 	if (ret)
@@ -593,6 +708,10 @@ static int mtk_smi_larb_probe(struct platform_device *pdev)
 
 	pm_runtime_enable(dev);
 	platform_set_drvdata(pdev, larb);
+
+	if (!connect_with_smmuv3)
+		return 0;
+
 	ret = component_add(dev, &mtk_smi_larb_component_ops);
 	if (ret)
 		goto err_pm_disable;
@@ -610,7 +729,8 @@ static void mtk_smi_larb_remove(struct platform_device *pdev)
 
 	device_link_remove(&pdev->dev, larb->smi_common_dev);
 	pm_runtime_disable(&pdev->dev);
-	component_del(&pdev->dev, &mtk_smi_larb_component_ops);
+	if (!MTK_SMI_CAPS(larb->larb_gen->flags_general, MTK_SMI_FLAG_CONNECT_SMMUV3))
+		component_del(&pdev->dev, &mtk_smi_larb_component_ops);
 }
 
 static int __maybe_unused mtk_smi_larb_resume(struct device *dev)
@@ -750,6 +870,16 @@ static const struct mtk_smi_common_plat mtk_smi_sub_common_mt8195 = {
 	.has_gals = true,
 };
 
+static const struct mtk_smi_common_plat mtk_smi_common_mt8196 = {
+	.type     = MTK_SMI_GEN2,
+	.skip_rpm = true,
+};
+
+static const struct mtk_smi_common_plat mtk_smi_sub_common_mt8196 = {
+	.type     = MTK_SMI_GEN2_SUB_COMM,
+	.skip_rpm = true,
+};
+
 static const struct mtk_smi_common_plat mtk_smi_common_mt8365 = {
 	.type     = MTK_SMI_GEN2,
 	.bus_sel  = F_MMU1_LARB(2) | F_MMU1_LARB(4),
@@ -770,6 +900,8 @@ static const struct of_device_id mtk_smi_common_of_ids[] = {
 	{.compatible = "mediatek,mt8195-smi-common-vdo", .data = &mtk_smi_common_mt8195_vdo},
 	{.compatible = "mediatek,mt8195-smi-common-vpp", .data = &mtk_smi_common_mt8195_vpp},
 	{.compatible = "mediatek,mt8195-smi-sub-common", .data = &mtk_smi_sub_common_mt8195},
+	{.compatible = "mediatek,mt8196-smi-common", .data = &mtk_smi_common_gen2},
+	{.compatible = "mediatek,mt8196-smi-sub-common", .data = &mtk_smi_sub_common_mt8196},
 	{.compatible = "mediatek,mt8365-smi-common", .data = &mtk_smi_common_mt8365},
 	{}
 };
-- 
2.46.0


