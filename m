Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B0D4C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 11:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uANE6YtuOzoDy4yZ+j82kd7aME3T0hDL7pX3USXZ8FQ=; b=bVnJikLCcZexEBStfs9Ww3Wj/v
	p7tiTNTD9V8n9jRlfdCV8+pYs3wYFA4enrMSeh1QJ2FT70SYX1/OEOGYDGsRlM+E1Sf57v+6reiea
	O3zKf85JiWDACsHqHhg9zwff4TVinz7jQvIoFokmx+D9wBzRQphVgfVcfBFwl52pR2jBk3j5oE9OW
	J1x2ZlP6jDq63ZDHlxFkodHbqm9MUNuAihMYVuLNVOgfBp+BNkHSSeCLVGeFMSOVcEfN/MYRGUL6w
	ZI71cU4WIP9CWS2UHj+acgOS6BqwymZ8261G5WlGcuvPZHGojibRgqKMf67RJy/13kjebcB7zYQCf
	Jf6q2DjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFWcU-00000000NtB-370n;
	Thu, 15 May 2025 11:19:22 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFVEU-00000000DXb-0eId;
	Thu, 15 May 2025 09:50:31 +0000
X-UUID: e4902910316f11f08d385d50fb11b32d-20250515
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=uANE6YtuOzoDy4yZ+j82kd7aME3T0hDL7pX3USXZ8FQ=;
	b=C5qW2huaI9F2AeSMU16Ta6g1caYMulghx+rAzdBHVNln60g+EMj8+r7vUIhVyJ7kLExpxVIMV9LhE2G6AuBdSYcH349MMCqL6IlbUKGLRiZjIwqtZKb4JrKVXtKtxC4fx5+KLZ+q1yHrKrzqOxBB2/0+y2agSGBjJN10CD78hXQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:07847d27-3110-43e7-ac49-b613da50321b,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:88e504c0-eade-4d5b-9f81-31d7b5452436,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: e4902910316f11f08d385d50fb11b32d-20250515
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <paul-pl.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1388628885; Thu, 15 May 2025 02:35:09 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 15 May 2025 17:35:06 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 15 May 2025 17:35:06 +0800
From: paul-pl.chen <paul-pl.chen@mediatek.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<chunkuang.hu@kernel.org>, <angelogioacchino.delregno@collabora.com>
CC: <matthias.bgg@gmail.com>, <p.zabel@pengutronix.de>,
	<jason-jh.lin@mediatek.com>, <nancy.lin@mediatek.com>,
	<singo.chang@mediatek.com>, <xiandong.wang@mediatek.com>,
	<sirius.wang@mediatek.com>, <paul-pl.chen@mediatek.com>,
	<sunny.shen@mediatek.com>, <fshao@chromium.org>, <treapking@chromium.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v3 07/17] soc: mediatek: mutex: Reused the switch case for SOF ID
Date: Thu, 15 May 2025 17:34:19 +0800
Message-ID: <20250515093454.1729720-8-paul-pl.chen@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250515093454.1729720-1-paul-pl.chen@mediatek.com>
References: <20250515093454.1729720-1-paul-pl.chen@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_025030_219220_6A544DDC 
X-CRM114-Status: GOOD (  10.56  )
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

From: Paul-pl Chen <paul-pl.chen@mediatek.com>

Reused the switch case for SOF IDs.

Signed-off-by: Nancy Lin <nancy.lin@mediatek.com>
Signed-off-by: Paul-pl Chen <paul-pl.chen@mediatek.com>
---
 drivers/soc/mediatek/mtk-mutex.c | 81 ++++++++++++++------------------
 1 file changed, 36 insertions(+), 45 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
index aaa965d4b050..47f4d9ae4bfc 100644
--- a/drivers/soc/mediatek/mtk-mutex.c
+++ b/drivers/soc/mediatek/mtk-mutex.c
@@ -853,43 +853,45 @@ void mtk_mutex_unprepare(struct mtk_mutex *mutex)
 }
 EXPORT_SYMBOL_GPL(mtk_mutex_unprepare);
 
-void mtk_mutex_add_comp(struct mtk_mutex *mutex,
-			enum mtk_ddp_comp_id id)
+static int mtk_mutex_get_output_comp_sof(enum mtk_ddp_comp_id id)
 {
-	struct mtk_mutex_ctx *mtx = container_of(mutex, struct mtk_mutex_ctx,
-						 mutex[mutex->id]);
-	unsigned int reg;
-	unsigned int sof_id;
-	unsigned int offset;
-
-	WARN_ON(&mtx->mutex[mutex->id] != mutex);
-
 	switch (id) {
 	case DDP_COMPONENT_DSI0:
-		sof_id = MUTEX_SOF_DSI0;
-		break;
+		return MUTEX_SOF_DSI0;
 	case DDP_COMPONENT_DSI1:
-		sof_id = MUTEX_SOF_DSI0;
-		break;
+		return MUTEX_SOF_DSI1;
 	case DDP_COMPONENT_DSI2:
-		sof_id = MUTEX_SOF_DSI2;
-		break;
+		return MUTEX_SOF_DSI2;
 	case DDP_COMPONENT_DSI3:
-		sof_id = MUTEX_SOF_DSI3;
-		break;
+		return MUTEX_SOF_DSI3;
 	case DDP_COMPONENT_DPI0:
-		sof_id = MUTEX_SOF_DPI0;
-		break;
+		return MUTEX_SOF_DPI0;
 	case DDP_COMPONENT_DPI1:
-		sof_id = MUTEX_SOF_DPI1;
-		break;
+		return MUTEX_SOF_DPI1;
 	case DDP_COMPONENT_DP_INTF0:
-		sof_id = MUTEX_SOF_DP_INTF0;
-		break;
+		return MUTEX_SOF_DP_INTF0;
 	case DDP_COMPONENT_DP_INTF1:
-		sof_id = MUTEX_SOF_DP_INTF1;
-		break;
+		return MUTEX_SOF_DP_INTF1;
 	default:
+		break;
+	}
+
+	return -EINVAL;
+}
+
+void mtk_mutex_add_comp(struct mtk_mutex *mutex,
+			enum mtk_ddp_comp_id id)
+{
+	struct mtk_mutex_ctx *mtx = container_of(mutex, struct mtk_mutex_ctx,
+						 mutex[mutex->id]);
+	unsigned int reg;
+	unsigned int sof_id;
+	unsigned int offset;
+	int sof_id = mtk_mutex_get_output_comp_sof(id);
+
+	WARN_ON(&mtx->mutex[mutex->id] != mutex);
+
+	if (sof_id < 0) {
 		if (mtx->data->mutex_mod[id] < 32) {
 			offset = DISP_REG_MUTEX_MOD(mtx->data->mutex_mod_reg,
 						    mutex->id);
@@ -905,8 +907,7 @@ void mtk_mutex_add_comp(struct mtk_mutex *mutex,
 		return;
 	}
 
-	writel_relaxed(mtx->data->mutex_sof[sof_id],
-		       mtx->regs +
+	writel_relaxed(mtx->data->mutex_sof[sof_id], mtx->regs +
 		       DISP_REG_MUTEX_SOF(mtx->data->mutex_sof_reg, mutex->id));
 }
 EXPORT_SYMBOL_GPL(mtk_mutex_add_comp);
@@ -918,24 +919,10 @@ void mtk_mutex_remove_comp(struct mtk_mutex *mutex,
 						 mutex[mutex->id]);
 	unsigned int reg;
 	unsigned int offset;
-
+	int sof_id = mtk_mutex_get_output_comp_sof(id);
 	WARN_ON(&mtx->mutex[mutex->id] != mutex);
 
-	switch (id) {
-	case DDP_COMPONENT_DSI0:
-	case DDP_COMPONENT_DSI1:
-	case DDP_COMPONENT_DSI2:
-	case DDP_COMPONENT_DSI3:
-	case DDP_COMPONENT_DPI0:
-	case DDP_COMPONENT_DPI1:
-	case DDP_COMPONENT_DP_INTF0:
-	case DDP_COMPONENT_DP_INTF1:
-		writel_relaxed(MUTEX_SOF_SINGLE_MODE,
-			       mtx->regs +
-			       DISP_REG_MUTEX_SOF(mtx->data->mutex_sof_reg,
-						  mutex->id));
-		break;
-	default:
+	if (sof_id < 0) {
 		if (mtx->data->mutex_mod[id] < 32) {
 			offset = DISP_REG_MUTEX_MOD(mtx->data->mutex_mod_reg,
 						    mutex->id);
@@ -948,8 +935,12 @@ void mtk_mutex_remove_comp(struct mtk_mutex *mutex,
 			reg &= ~(1 << (mtx->data->mutex_mod[id] - 32));
 			writel_relaxed(reg, mtx->regs + offset);
 		}
-		break;
+		return;
 	}
+
+	writel_relaxed(MUTEX_SOF_SINGLE_MODE,
+		       mtx->regs + DISP_REG_MUTEX_SOF(mtx->data->mutex_sof_reg,
+		       mutex->id));
 }
 EXPORT_SYMBOL_GPL(mtk_mutex_remove_comp);
 
-- 
2.45.2


