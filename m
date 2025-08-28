Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A02DECA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 09:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iBmqpY6tE/5ikFaZx5+coINmSyxtZJXaiouD5K2cw+s=; b=2vCeopLMGMOx8w2cWGRoDUkkM4
	F2J/Cq8/ckpF67B/HQ4UV3w6aHoI8G9bEY7iJ3REBBeDvajN5bKAltbpQCcgr0aGVXY4TG5GR7uoh
	ZOfZpmJUGd1jHwGyU6Mu266dV81/7/hnJbW2RUM5uyrPJIbtApHlXLLVZB8N8+OvnddEQIWEXcfol
	v134oe+sUG0kCk2zT72GBz+RKcvlUV0nSkgKG1mTceM3+3kpQ/rxoTe7Mqevbc0dALqlhRqf3UKlh
	/ubOR+F9NJhlwumCstdBYT3lo+D4vJJCoxEfWQ7AOkeON/KCThFK6DG3SxXOSddpgkNzm9Rv8xRlx
	NCa7/BUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urYVm-00000000trX-0vBi;
	Thu, 28 Aug 2025 09:01:38 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urXh6-00000000jRT-1XC6;
	Thu, 28 Aug 2025 08:09:18 +0000
X-UUID: 4562987283e611f09f706fa2197c6ceb-20250828
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=iBmqpY6tE/5ikFaZx5+coINmSyxtZJXaiouD5K2cw+s=;
	b=AFzNDAA8wnIggMn7Z0yb6gEwKSj8AjD5B1L6BxP2pwzJSxLmnHbJLBCa0OUfpJX0lwJLrnVph+zXXHrG2ninDI4t94zt7NdUVIXorklvJn9ND8QUSianeuh5bWw9kZxg2Q+YbTGOmakHImZKF100pESimme0rTtqCGwJRK1uOcE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:9c535b08-04c1-4fae-98e7-1afa9f06ee64,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:f1326cf,CLOUDID:7a9bb36d-c2f4-47a6-876f-59a53e9ecc6e,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:-5,Content:0|15|50,EDM:
	-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 4562987283e611f09f706fa2197c6ceb-20250828
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <paul-pl.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 877244127; Thu, 28 Aug 2025 01:09:07 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 28 Aug 2025 16:09:04 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 28 Aug 2025 16:09:04 +0800
From: Paul Chen <paul-pl.chen@mediatek.com>
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
Subject: [PATCH v4 08/19] soc: mediatek: mutex: Reused the switch case for SOF ID
Date: Thu, 28 Aug 2025 16:07:03 +0800
Message-ID: <20250828080855.3502514-9-paul-pl.chen@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250828080855.3502514-1-paul-pl.chen@mediatek.com>
References: <20250828080855.3502514-1-paul-pl.chen@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_010916_432632_7DED6CB9 
X-CRM114-Status: GOOD (  11.71  )
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

Signed-off-by: Paul-pl Chen <paul-pl.chen@mediatek.com>
---
 drivers/soc/mediatek/mtk-mutex.c | 115 ++++++++++++++++---------------
 1 file changed, 60 insertions(+), 55 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
index 38179e8cd98f..1e5df5aa0bd5 100644
--- a/drivers/soc/mediatek/mtk-mutex.c
+++ b/drivers/soc/mediatek/mtk-mutex.c
@@ -887,53 +887,61 @@ void mtk_mutex_unprepare(struct mtk_mutex *mutex)
 }
 EXPORT_SYMBOL_GPL(mtk_mutex_unprepare);
 
-void mtk_mutex_add_comp(struct mtk_mutex *mutex,
-			enum mtk_ddp_comp_id id)
+static int mtk_mutex_get_output_comp_sof(enum mtk_ddp_comp_id id)
 {
-	struct mtk_mutex_ctx *mtx = container_of(mutex, struct mtk_mutex_ctx,
-						 mutex[mutex->id]);
-	unsigned int reg;
-	unsigned int sof_id, mod_id;
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
-		offset = DISP_REG_MUTEX_MOD(mtx, mtx->data->mutex_mod[id], mutex->id);
-		mod_id = mtx->data->mutex_mod[id] % 32;
-		reg = readl_relaxed(mtx->regs + offset);
-		reg |= BIT(mod_id);
-		writel_relaxed(reg, mtx->regs + offset);
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
+	unsigned int sof_id, mod_id;
+	unsigned int offset;
+	int sof_id = mtk_mutex_get_output_comp_sof(id);
+
+	WARN_ON(&mtx->mutex[mutex->id] != mutex);
+
+	if (sof_id < 0) {
+		if (mtx->data->mutex_mod[id] < 32) {
+			offset = DISP_REG_MUTEX_MOD(mtx->data->mutex_mod_reg,
+						    mutex->id);
+			reg = readl_relaxed(mtx->regs + offset);
+			reg |= 1 << mtx->data->mutex_mod[id];
+			writel_relaxed(reg, mtx->regs + offset);
+		} else {
+			offset = DISP_REG_MUTEX_MOD2(mutex->id);
+			reg = readl_relaxed(mtx->regs + offset);
+			reg |= 1 << (mtx->data->mutex_mod[id] - 32);
+			writel_relaxed(reg, mtx->regs + offset);
+		}
 		return;
 	}
 
-	writel_relaxed(mtx->data->mutex_sof[sof_id],
-		       mtx->regs +
+	writel_relaxed(mtx->data->mutex_sof[sof_id], mtx->regs +
 		       DISP_REG_MUTEX_SOF(mtx->data->mutex_sof_reg, mutex->id));
 }
 EXPORT_SYMBOL_GPL(mtk_mutex_add_comp);
@@ -946,31 +954,28 @@ void mtk_mutex_remove_comp(struct mtk_mutex *mutex,
 	unsigned int reg;
 	unsigned int mod_id;
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
-		offset = DISP_REG_MUTEX_MOD(mtx, mtx->data->mutex_mod[id], mutex->id);
-		mod_id = mtx->data->mutex_mod[id] % 32;
-		reg = readl_relaxed(mtx->regs + offset);
-		reg &= ~BIT(mod_id);
-		writel_relaxed(reg, mtx->regs + offset);
-		break;
+	if (sof_id < 0) {
+		if (mtx->data->mutex_mod[id] < 32) {
+			offset = DISP_REG_MUTEX_MOD(mtx->data->mutex_mod_reg,
+						    mutex->id);
+			reg = readl_relaxed(mtx->regs + offset);
+			reg &= ~(1 << mtx->data->mutex_mod[id]);
+			writel_relaxed(reg, mtx->regs + offset);
+		} else {
+			offset = DISP_REG_MUTEX_MOD2(mutex->id);
+			reg = readl_relaxed(mtx->regs + offset);
+			reg &= ~(1 << (mtx->data->mutex_mod[id] - 32));
+			writel_relaxed(reg, mtx->regs + offset);
+		}
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


