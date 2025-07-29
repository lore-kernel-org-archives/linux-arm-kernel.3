Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F857C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 02:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bYebe6d6FF9a4Sv4DvMcxFHqACdPJ8d1sUQcdh4dprA=; b=tONKjccFmvkZCqaswvlW/h1gbX
	z6HxIsF/hC8NAG+84JrtRC/2uk/XHV0x5EtvAsrwrg4U7Oakp5wAUi/A2Da0fCVr1eBbyDstzymV1
	qjFPKFI/JMc18H1wbBdm5rdV1f1RnZvDG1vuYsicLkZP04sG74jZPowq7BQQLxy/AidrunwLfjplb
	VcHnjxL8KQZ5gQehJSq8sW8wgQPnFDK+xgFx+8t6YYc1AqJ9mgfYtM0b/DYuHygfrJ27gxh/fOR9m
	dvm4yYFbaJZoLCMs8hqwh/7nfGyK4oLiqLkGwu6xWF6l4gM9ErYk69NcIVJ+aNFowDSSF9iYlk3dK
	tWSvkPRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugaHj-0000000FmjT-1GAs;
	Tue, 29 Jul 2025 02:41:47 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uga7x-0000000Flik-0f0R;
	Tue, 29 Jul 2025 02:31:42 +0000
X-UUID: 25f1d5366c2411f09f706fa2197c6ceb-20250728
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=bYebe6d6FF9a4Sv4DvMcxFHqACdPJ8d1sUQcdh4dprA=;
	b=HGkbQybOGOYQBWIuNXkYPFYAVg1vnabqsg9i4zZ3150X+6Hxz/5o1xczpGc5oWPI5YTLKDDsSdIzi3RmD4oBIgglrJx7QAUehYPxDk95j1Q6kydcm3QwIdGVIEW2wmsxuz1Ny5h6nxj3JjtQ6s9T7sVOxaRgicpBM2Fnxq1rwgo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:e01232dd-0e92-4373-a332-7d6e61586257,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:9eb4ff7,CLOUDID:baba450f-6968-429c-a74d-a1cce2b698bd,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|15|50,EDM
	:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 25f1d5366c2411f09f706fa2197c6ceb-20250728
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <huayu.zong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1577368797; Mon, 28 Jul 2025 19:31:35 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Tue, 29 Jul 2025 10:31:33 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Tue, 29 Jul 2025 10:31:32 +0800
From: Huayu Zong <huayu.zong@mediatek.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"Matthias Brugger" <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Tinghan Shen
	<tinghan.shen@mediatek.com>
CC: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<--cc=Project_Global_Chrome_Upstream_Group@mediatek.com>, Huayu Zong
	<huayu.zong@mediatek.com>
Subject: [PATCH 3/3] remoteproc: mediatek: Support MT8189 SCP
Date: Tue, 29 Jul 2025 10:31:13 +0800
Message-ID: <20250729023125.9036-4-huayu.zong@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250729023125.9036-1-huayu.zong@mediatek.com>
References: <20250729023125.9036-1-huayu.zong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_193141_196166_1E4B2A74 
X-CRM114-Status: GOOD (  15.00  )
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

Add SCP support for mt8189.

Signed-off-by: Huayu Zong <huayu.zong@mediatek.com>
---
 drivers/remoteproc/mtk_common.h | 11 ++++++++++
 drivers/remoteproc/mtk_scp.c    | 37 ++++++++++++++++++++++++++++++---
 2 files changed, 45 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/mtk_common.h b/drivers/remoteproc/mtk_common.h
index fd5c539ab2ac..fb2131e0ed07 100644
--- a/drivers/remoteproc/mtk_common.h
+++ b/drivers/remoteproc/mtk_common.h
@@ -35,6 +35,11 @@
 #define MT8186_SCP_L1_SRAM_PD_P1	0x40B0
 #define MT8186_SCP_L1_SRAM_PD_p2	0x40B4
 
+#define MT8189_SCP2APMCU_IPC_CLR	0x30010
+#define MT8189_SCP2SPM_IPC_CLR		0x30018
+#define MT8189_SCP_SECURE_DOMAIN	0xA080
+#define MT8189_SCP_DOMAIN_VAL		0x3303003
+
 #define MT8192_L2TCM_SRAM_PD_0		0x10C0
 #define MT8192_L2TCM_SRAM_PD_1		0x10C4
 #define MT8192_L2TCM_SRAM_PD_2		0x10C8
@@ -112,6 +117,12 @@ struct mtk_scp_of_data {
 
 	u32 host_to_scp_reg;
 	u32 host_to_scp_int_bit;
+	u32 scp_to_host_ipc_set_reg;
+	u32 scp_to_host_ipc_clr_reg;
+	u32 scp_to_spm_ipc_clr_reg;
+
+	u32 scp_secure_domain_reg;
+	u32 scp_domain_value;
 
 	size_t ipi_buf_offset;
 	const struct mtk_scp_sizes_data *scp_sizes;
diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index 8206a1766481..956793fc6901 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -225,7 +225,8 @@ static void mt8192_scp_irq_handler(struct mtk_scp *scp)
 {
 	u32 scp_to_host;
 
-	scp_to_host = readl(scp->cluster->reg_base + MT8192_SCP2APMCU_IPC_SET);
+	scp_to_host = readl(scp->cluster->reg_base +
+			    scp->data->scp_to_host_ipc_set_reg);
 
 	if (scp_to_host & MT8192_SCP_IPC_INT_BIT) {
 		scp_ipi_handler(scp);
@@ -235,7 +236,7 @@ static void mt8192_scp_irq_handler(struct mtk_scp *scp)
 		 * MT8192_SCP2APMCU_IPC.
 		 */
 		writel(MT8192_SCP_IPC_INT_BIT,
-		       scp->cluster->reg_base + MT8192_SCP2APMCU_IPC_CLR);
+		       scp->cluster->reg_base + scp->data->scp_to_host_ipc_clr_reg);
 	} else {
 		scp_wdt_handler(scp, scp_to_host);
 		writel(1, scp->cluster->reg_base + MT8192_CORE0_WDT_IRQ);
@@ -559,8 +560,10 @@ static int mt8188_scp_c1_before_load(struct mtk_scp *scp)
 
 static int mt8192_scp_before_load(struct mtk_scp *scp)
 {
+	u32 scp2spm_ipc_clr = scp->data->scp_to_spm_ipc_clr_reg;
+
 	/* clear SPM interrupt, SCP2SPM_IPC_CLR */
-	writel(0xff, scp->cluster->reg_base + MT8192_SCP2SPM_IPC_CLR);
+	writel(0xff, scp->cluster->reg_base + scp2spm_ipc_clr);
 
 	writel(1, scp->cluster->reg_base + MT8192_CORE0_SW_RSTN_SET);
 
@@ -574,6 +577,11 @@ static int mt8192_scp_before_load(struct mtk_scp *scp)
 	/* enable MPU for all memory regions */
 	writel(0xff, scp->cluster->reg_base + MT8192_CORE0_MEM_ATT_PREDEF);
 
+	/* set the domain of master in SCP */
+	if (scp->data->scp_secure_domain_reg)
+		writel(scp->data->scp_domain_value,
+		       scp->cluster->reg_base + scp->data->scp_secure_domain_reg);
+
 	return 0;
 }
 
@@ -1464,6 +1472,24 @@ static const struct mtk_scp_of_data mt8188_of_data_c1 = {
 	.scp_sizes = &mt8188_scp_c1_sizes,
 };
 
+static const struct mtk_scp_of_data mt8189_of_data = {
+	.scp_clk_get = mt8195_scp_clk_get,
+	.scp_before_load = mt8192_scp_before_load,
+	.scp_irq_handler = mt8192_scp_irq_handler,
+	.scp_reset_assert = mt8192_scp_reset_assert,
+	.scp_reset_deassert = mt8192_scp_reset_deassert,
+	.scp_stop = mt8192_scp_stop,
+	.scp_da_to_va = mt8192_scp_da_to_va,
+	.host_to_scp_reg = MT8192_GIPC_IN_SET,
+	.host_to_scp_int_bit = MT8192_HOST_IPC_INT_BIT,
+	.scp_to_host_ipc_set_reg = MT8192_SCP2APMCU_IPC_SET,
+	.scp_to_host_ipc_clr_reg = MT8189_SCP2APMCU_IPC_CLR,
+	.scp_to_spm_ipc_clr_reg = MT8189_SCP2SPM_IPC_CLR,
+	.scp_secure_domain_reg = MT8189_SCP_SECURE_DOMAIN,
+	.scp_domain_value = MT8189_SCP_DOMAIN_VAL,
+	.scp_sizes = &default_scp_sizes,
+};
+
 static const struct mtk_scp_of_data mt8192_of_data = {
 	.scp_clk_get = mt8192_scp_clk_get,
 	.scp_before_load = mt8192_scp_before_load,
@@ -1475,6 +1501,10 @@ static const struct mtk_scp_of_data mt8192_of_data = {
 	.host_to_scp_reg = MT8192_GIPC_IN_SET,
 	.host_to_scp_int_bit = MT8192_HOST_IPC_INT_BIT,
 	.scp_sizes = &default_scp_sizes,
+	.scp_to_host_ipc_set_reg = MT8192_SCP2APMCU_IPC_SET,
+	.scp_to_host_ipc_clr_reg = MT8192_SCP2APMCU_IPC_CLR,
+	.scp_to_spm_ipc_clr_reg = MT8192_SCP2SPM_IPC_CLR,
+	.scp_sizes = &default_scp_sizes,
 };
 
 static const struct mtk_scp_of_data mt8195_of_data = {
@@ -1520,6 +1550,7 @@ static const struct of_device_id mtk_scp_of_match[] = {
 	{ .compatible = "mediatek,mt8186-scp", .data = &mt8186_of_data },
 	{ .compatible = "mediatek,mt8188-scp", .data = &mt8188_of_data },
 	{ .compatible = "mediatek,mt8188-scp-dual", .data = &mt8188_of_data_cores },
+	{ .compatible = "mediatek,mt8189-scp", .data = &mt8189_of_data },
 	{ .compatible = "mediatek,mt8192-scp", .data = &mt8192_of_data },
 	{ .compatible = "mediatek,mt8195-scp", .data = &mt8195_of_data },
 	{ .compatible = "mediatek,mt8195-scp-dual", .data = &mt8195_of_data_cores },
-- 
2.45.2


