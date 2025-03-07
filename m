Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0DE8C282D0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 05:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sb9MNp7gIFnjf4puevqUWTv9bTnAa3A6ErG94WVlhYc=; b=ZLxWXLr4rK5i7GnCmGlhcde6Cz
	N2gi99ZyGUcdUAZO9ViOJfR5FGBrpwayTn2oi5ND0WGFLjuSuA553b+qpeidQZirXQJp06DKKCKnQ
	mH4JTxFYB1r4wo8O5h9lMno9hRdNtJRoYsQbY+c5CdOgi9lL/YyTxuxXiSfFJJdXWpHt0YTVmF2k0
	tMVAzbwkl/IXc19Hqo1d13OszodRn6MPIQY3/H/R8DqET15atUofb4T6nYGaSkZo+ex48o2I0brda
	CfPdQhLHIk7JoBdngIWjeKbvL/WdJ/HwI27+5RoWcDyi4Gq4MAdm5txGG77ZuwrcQnqriGIDmFUp4
	e43uePSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqQY8-0000000DF5R-3vZd;
	Fri, 07 Mar 2025 05:47:08 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqQWW-0000000DF11-2fxH;
	Fri, 07 Mar 2025 05:45:29 +0000
X-UUID: 5bc81b12fb1711efa1e849db4cc18d44-20250306
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=sb9MNp7gIFnjf4puevqUWTv9bTnAa3A6ErG94WVlhYc=;
	b=uOjyGJgkU2vTgU9aaxr5SIKnt1JAPVDefpRFX0lBZOfC2vjiXHbZEhf8GQbooiyelQkLdmi2T16re8ehWYh5P9JA6d/8r4MjD45mbtSPpvkKGJ6C3momeieje3G1kgAQUhoxboF/AbRk2RkJ1K8yhkljQwd+2wWLalNKGtmF4W8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:23e00922-710c-48de-bd2f-968c1518359b,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:4bd4118c-f5b8-47d5-8cf3-b68fe7530c9a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 5bc81b12fb1711efa1e849db4cc18d44-20250306
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <xueqi.zhang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1660429155; Thu, 06 Mar 2025 22:45:21 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Fri, 7 Mar 2025 13:45:18 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Fri, 7 Mar 2025 13:45:18 +0800
From: Xueqi Zhang <xueqi.zhang@mediatek.com>
To: Yong Wu <yong.wu@mediatek.com>, Krzysztof Kozlowski <krzk@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Xueqi Zhang
	<xueqi.zhang@mediatek.com>
Subject: [PATCH] memory: mtk-smi: Add ostd setting for mt8192
Date: Fri, 7 Mar 2025 13:45:08 +0800
Message-ID: <20250307054515.23455-1-xueqi.zhang@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_214528_686371_351DDFD0 
X-CRM114-Status: UNSURE (   8.70  )
X-CRM114-Notice: Please train this message.
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

Add initial ostd setting for mt8192. All the settings come from DE.
These settings help adjust Multimedia HW's bandwidth limits to achieve
a balanced bandwidth requirement.
Without this, the VENC HW work abnormal while stress testing.

Fixes: 02c02ddce427 ("memory: mtk-smi: Add mt8192 support")
Signed-off-by: Xueqi Zhang <xueqi.zhang@mediatek.com>
---
 drivers/memory/mtk-smi.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
index 5710348f72f6..a8f5467d6b31 100644
--- a/drivers/memory/mtk-smi.c
+++ b/drivers/memory/mtk-smi.c
@@ -332,6 +332,38 @@ static const u8 mtk_smi_larb_mt8188_ostd[][SMI_LARB_PORT_NR_MAX] = {
 	[25] = {0x01},
 };
 
+static const u8 mtk_smi_larb_mt8192_ostd[][SMI_LARB_PORT_NR_MAX] = {
+	[0] = {0x2, 0x2, 0x28, 0xa, 0xc, 0x28,},
+	[1] = {0x2, 0x2, 0x18, 0x18, 0x18, 0xa, 0xc, 0x28,},
+	[2] = {0x5, 0x5, 0x5, 0x5, 0x1,},
+	[3] = {},
+	[4] = {0x28, 0x19, 0xb, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x4, 0x1,},
+	[5] = {0x1, 0x1, 0x4, 0x1, 0x1, 0x1, 0x1, 0x16,},
+	[6] = {},
+	[7] = {0x1, 0x3, 0x2, 0x1, 0x1, 0x5, 0x2, 0x12, 0x13, 0x4, 0x4, 0x1,
+	       0x4, 0x2, 0x1,},
+	[8] = {},
+	[9] = {0xa, 0x7, 0xf, 0x8, 0x1, 0x8, 0x9, 0x3, 0x3, 0x6, 0x7, 0x4,
+	       0xa, 0x3, 0x4, 0xe, 0x1, 0x7, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1,
+	       0x1, 0x1, 0x1, 0x1, 0x1,},
+	[10] = {},
+	[11] = {0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1,
+		0x1, 0x1, 0x1, 0xe, 0x1, 0x7, 0x8, 0x7, 0x7, 0x1, 0x6, 0x2,
+		0xf, 0x8, 0x1, 0x1, 0x1,},
+	[12] = {},
+	[13] = {0x2, 0xc, 0xc, 0xe, 0x6, 0x6, 0x6, 0x6, 0x6, 0x12, 0x6, 0x28,
+		0x2, 0xc, 0xc, 0x28, 0x12, 0x6,},
+	[14] = {},
+	[15] = {0x28, 0x14, 0x2, 0xc, 0x18, 0x4, 0x28, 0x14, 0x4, 0x4, 0x4, 0x2,
+		0x4, 0x2, 0x8, 0x4, 0x4,},
+	[16] = {0x28, 0x14, 0x2, 0xc, 0x18, 0x4, 0x28, 0x14, 0x4, 0x4, 0x4, 0x2,
+		0x4, 0x2, 0x8, 0x4, 0x4,},
+	[17] = {0x28, 0x14, 0x2, 0xc, 0x18, 0x4, 0x28, 0x14, 0x4, 0x4, 0x4, 0x2,
+		0x4, 0x2, 0x8, 0x4, 0x4,},
+	[18] = {0x2, 0x2, 0x4, 0x2,},
+	[19] = {0x9, 0x9, 0x5, 0x5, 0x1, 0x1,},
+};
+
 static const u8 mtk_smi_larb_mt8195_ostd[][SMI_LARB_PORT_NR_MAX] = {
 	[0] = {0x0a, 0xc, 0x22, 0x22, 0x01, 0x0a,}, /* larb0 */
 	[1] = {0x0a, 0xc, 0x22, 0x22, 0x01, 0x0a,}, /* larb1 */
@@ -427,6 +459,7 @@ static const struct mtk_smi_larb_gen mtk_smi_larb_mt8188 = {
 
 static const struct mtk_smi_larb_gen mtk_smi_larb_mt8192 = {
 	.config_port                = mtk_smi_larb_config_port_gen2_general,
+	.ostd			    = mtk_smi_larb_mt8192_ostd,
 };
 
 static const struct mtk_smi_larb_gen mtk_smi_larb_mt8195 = {
-- 
2.46.0


