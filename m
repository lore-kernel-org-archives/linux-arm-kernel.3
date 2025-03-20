Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B053CC28B30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 07:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KzsI2dcH77WIYuzMov1WZY4sjPCFu5uSEpq9ji+VCkM=; b=GqmeezmvItbvH+tTc8SgiAIR0K
	9C16t95KNmnNhrwjsglOOSeklep25akdaB/oD8LL2vPGh8gdWXszbGsbDQhvl5fWbCeTKFfc+TSzS
	v8gvrYHHXe0OZaTz0zespucOuhMAczBUFulZ9UNs3jR79qgd1q0zhkO+APZ0pbcPr96PCuhDLRBrz
	1C/icodrf9ArD/cHiNJHYmhIBq0bn/Zgc7mCIb/UiCO1mr/kN15uSGF8OgXs7ZhrQ8PtcITKgvkif
	cKPZ8YZi3CwKzrJqHDJcLHf9d6x+hiILyemKm92tPhWgPYOoWsmdeeZzcMo8HcqSnkCQUJcGDsrK9
	nt8aDdcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvAVt-0000000BQfW-35O9;
	Thu, 20 Mar 2025 07:40:25 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvASa-0000000BQB1-18PZ;
	Thu, 20 Mar 2025 07:37:01 +0000
X-UUID: 19cb4b48055e11f0a1e849db4cc18d44-20250320
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=KzsI2dcH77WIYuzMov1WZY4sjPCFu5uSEpq9ji+VCkM=;
	b=k5cxgUnRiA0GQN4I4WMIGQSx5diKIpkGreWF4G7Z3LyORyq7d4p3thfvxr1ZOJ1k+4zFBIM3PBjdHNyryd+YhdGZH9jZ1MdNYsxYj3ONeil90CtErDl9m3SkDw/AUJ/URtXpSNJHkL926CVDmFuWKjYL2YzgtNMOR+C5eMgbAxI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:7ad52262-c361-42d2-aacb-293398dc69cb,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:918ddbfd-c03c-4d2b-a585-04cfa9287728,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 19cb4b48055e11f0a1e849db4cc18d44-20250320
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <xueqi.zhang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 823442336; Thu, 20 Mar 2025 00:36:56 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 20 Mar 2025 15:36:55 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 20 Mar 2025 15:36:54 +0800
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
Subject: [PATCH 2/3] memory: mtk-smi: Add a flag skip_rpm
Date: Thu, 20 Mar 2025 15:36:17 +0800
Message-ID: <20250320073625.25225-3-xueqi.zhang@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250320073625.25225-1-xueqi.zhang@mediatek.com>
References: <20250320073625.25225-1-xueqi.zhang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_003700_312366_463D626A 
X-CRM114-Status: GOOD (  16.13  )
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

MT8196 SMI commons is backed up/restored by RTFF HW.
It doesn't need SW control the register backup/store
in the runtime callback.Therefore, add a flag skip_rpm
to help skip RPM operations for SMI commons.

Signed-off-by: Xueqi Zhang <xueqi.zhang@mediatek.com>
---
 drivers/memory/mtk-smi.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
index a8f5467d6b31..b9affa3c3185 100644
--- a/drivers/memory/mtk-smi.c
+++ b/drivers/memory/mtk-smi.c
@@ -123,6 +123,7 @@ static const char * const mtk_smi_common_clks[] = {"apb", "smi", "gals0", "gals1
 struct mtk_smi_common_plat {
 	enum mtk_smi_type	type;
 	bool			has_gals;
+	bool			skip_rpm;
 	u32			bus_sel; /* Balance some larbs to enter mmu0 or mmu1 */
 
 	const struct mtk_smi_reg_pair	*init;
@@ -547,6 +548,9 @@ static int mtk_smi_dts_clk_init(struct device *dev, struct mtk_smi *smi,
 {
 	int i, ret;
 
+	if (smi->plat->skip_rpm)
+		return 0;
+
 	for (i = 0; i < clk_nr_required; i++)
 		smi->clks[i].id = clks[i];
 	ret = devm_clk_bulk_get(dev, clk_nr_required, smi->clks);
@@ -783,7 +787,7 @@ static int mtk_smi_common_probe(struct platform_device *pdev)
 	common->dev = dev;
 	common->plat = of_device_get_match_data(dev);
 
-	if (common->plat->has_gals) {
+	if (!common->plat->skip_rpm && common->plat->has_gals) {
 		if (common->plat->type == MTK_SMI_GEN2)
 			clk_required = MTK_SMI_COM_GALS_REQ_CLK_NR;
 		else if (common->plat->type == MTK_SMI_GEN2_SUB_COMM)
@@ -814,13 +818,14 @@ static int mtk_smi_common_probe(struct platform_device *pdev)
 	}
 
 	/* link its smi-common if this is smi-sub-common */
-	if (common->plat->type == MTK_SMI_GEN2_SUB_COMM) {
+	if (common->plat->type == MTK_SMI_GEN2_SUB_COMM && !common->plat->skip_rpm) {
 		ret = mtk_smi_device_link_common(dev, &common->smi_common_dev);
 		if (ret < 0)
 			return ret;
 	}
 
-	pm_runtime_enable(dev);
+	if (!common->plat->skip_rpm)
+		pm_runtime_enable(dev);
 	platform_set_drvdata(pdev, common);
 	return 0;
 }
-- 
2.46.0


