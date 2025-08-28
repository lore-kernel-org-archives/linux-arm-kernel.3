Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB821CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 08:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vIUvJDPGS4Dw1VUMAmTrLQ5eazcx2pQQKieLKSwhI7c=; b=cEtLO66kipKXQy0qN/JhDJyIxF
	clMekDcvFgBSBbdvJsqBnudW5XYMstCIyDQqxYd0yN+pVzF6BWXnV2R2yFqUBM3fI7wNKV3lzlQ+V
	DlMdDBr7PefrRJRsvop/p9MaQBRnGBaYW1npJpJ982/0caAIUmTClXOFpFgo1LCy5bCU3mt8qgIof
	6QiO8doua43C71zL6HiE6JvZrG7d4vaG44R9K9pq2uWKkim2FexOoRRDFMrmp+bgX945nAbxMlz+1
	1eAZkrE3M26ifB1IEjRCV7fVeAhd27Vj5W0WAQW7sMvKC7Sc333a72V/7r/VJc4bcrsMrygMJQAEE
	/XHxAMbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urYFb-00000000qQS-0wTI;
	Thu, 28 Aug 2025 08:44:55 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urXh4-00000000jRD-0nsz;
	Thu, 28 Aug 2025 08:09:15 +0000
X-UUID: 4570a55c83e611f09eb0dd999d3936bf-20250828
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=vIUvJDPGS4Dw1VUMAmTrLQ5eazcx2pQQKieLKSwhI7c=;
	b=RbEjfOZVrpX5ukL2igsIdL3BuI9IPPh0RuGZC2iHAO+RxIghMl+IbetKWvMg8maDsJhHf2ylZQqlmjx37KNL/lcNsjQimjI6Tk7g2QtrBAh8WYP5vXKjDWplJ7V8VlO78YK6I93z17/rmV3C+Kpv2VCLQ+pn4N/dL5wXQSJXG0o=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:e510af81-b141-4a18-a0cb-3919bd4548d6,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:f1326cf,CLOUDID:370b9920-786d-4870-a017-e7b4f3839b3f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:-5,Content:0|15|50,EDM:
	-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 4570a55c83e611f09eb0dd999d3936bf-20250828
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <paul-pl.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1092635578; Thu, 28 Aug 2025 01:09:07 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
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
Subject: [PATCH v4 09/19] soc: mediatek: mutex: refactor SOF settings for output components
Date: Thu, 28 Aug 2025 16:07:04 +0800
Message-ID: <20250828080855.3502514-10-paul-pl.chen@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250828080855.3502514-1-paul-pl.chen@mediatek.com>
References: <20250828080855.3502514-1-paul-pl.chen@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_010914_256031_84EBFFD3 
X-CRM114-Status: GOOD (  12.90  )
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

Refactor SOF settings by adding mtk_mutex_get_output_comp_sof()
and extracting SOF logic from mtk_mutex_add_comp()
and mtk_mutex_remove_comp().

Signed-off-by: Paul-pl Chen <paul-pl.chen@mediatek.com>
---
 drivers/soc/mediatek/mtk-mutex.c       | 57 +++++++++++++++++++++-----
 include/linux/soc/mediatek/mtk-mutex.h |  4 ++
 2 files changed, 51 insertions(+), 10 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
index 1e5df5aa0bd5..c48983d8a6cd 100644
--- a/drivers/soc/mediatek/mtk-mutex.c
+++ b/drivers/soc/mediatek/mtk-mutex.c
@@ -913,19 +913,57 @@ static int mtk_mutex_get_output_comp_sof(enum mtk_ddp_comp_id id)
 	return -EINVAL;
 }
 
+void mtk_mutex_add_comp_sof(struct mtk_mutex *mutex, enum mtk_ddp_comp_id id)
+{
+	struct mtk_mutex_ctx *mtx = container_of(mutex, struct mtk_mutex_ctx,
+						 mutex[mutex->id]);
+	int sof_id = mtk_mutex_get_output_comp_sof(id);
+	unsigned int offset;
+
+	if (sof_id < 0 || sof_id >= DDP_MUTEX_SOF_MAX)
+		return;
+
+	WARN_ON(&mtx->mutex[mutex->id] != mutex);
+
+	offset = DISP_REG_MUTEX_SOF(mtx->data->mutex_sof_reg, mutex->id);
+
+	writel_relaxed(mtx->data->mutex_sof[sof_id], mtx->regs + offset);
+}
+EXPORT_SYMBOL_GPL(mtk_mutex_add_comp_sof);
+
+void mtk_mutex_remove_comp_sof(struct mtk_mutex *mutex, enum mtk_ddp_comp_id id)
+{
+	struct mtk_mutex_ctx *mtx = container_of(mutex, struct mtk_mutex_ctx,
+						 mutex[mutex->id]);
+	unsigned int reg;
+	int sof_id = mtk_mutex_get_output_comp_sof(id);
+	unsigned int offset;
+
+	if (sof_id < 0 || sof_id >= DDP_MUTEX_SOF_MAX)
+		return;
+
+	WARN_ON(&mtx->mutex[mutex->id] != mutex);
+
+	offset = DISP_REG_MUTEX_SOF(mtx->data->mutex_sof_reg, mutex->id);
+	reg = readl_relaxed(mtx->regs + offset);
+	reg &= ~(1 << mtx->data->mutex_sof[id]);
+
+	writel_relaxed(reg, mtx->regs + offset);
+}
+EXPORT_SYMBOL_GPL(mtk_mutex_remove_comp_sof);
+
 void mtk_mutex_add_comp(struct mtk_mutex *mutex,
 			enum mtk_ddp_comp_id id)
 {
 	struct mtk_mutex_ctx *mtx = container_of(mutex, struct mtk_mutex_ctx,
 						 mutex[mutex->id]);
 	unsigned int reg;
-	unsigned int sof_id, mod_id;
 	unsigned int offset;
-	int sof_id = mtk_mutex_get_output_comp_sof(id);
+	bool is_output_comp = (mtk_mutex_get_output_comp_sof(id) > 0);
 
 	WARN_ON(&mtx->mutex[mutex->id] != mutex);
 
-	if (sof_id < 0) {
+	if (!is_output_comp) {
 		if (mtx->data->mutex_mod[id] < 32) {
 			offset = DISP_REG_MUTEX_MOD(mtx->data->mutex_mod_reg,
 						    mutex->id);
@@ -941,8 +979,7 @@ void mtk_mutex_add_comp(struct mtk_mutex *mutex,
 		return;
 	}
 
-	writel_relaxed(mtx->data->mutex_sof[sof_id], mtx->regs +
-		       DISP_REG_MUTEX_SOF(mtx->data->mutex_sof_reg, mutex->id));
+	mtk_mutex_add_comp_sof(mutex, id);
 }
 EXPORT_SYMBOL_GPL(mtk_mutex_add_comp);
 
@@ -954,10 +991,11 @@ void mtk_mutex_remove_comp(struct mtk_mutex *mutex,
 	unsigned int reg;
 	unsigned int mod_id;
 	unsigned int offset;
-	int sof_id = mtk_mutex_get_output_comp_sof(id);
+	bool is_output_comp = (mtk_mutex_get_output_comp_sof(id) > 0);
+
 	WARN_ON(&mtx->mutex[mutex->id] != mutex);
 
-	if (sof_id < 0) {
+	if (!is_output_comp) {
 		if (mtx->data->mutex_mod[id] < 32) {
 			offset = DISP_REG_MUTEX_MOD(mtx->data->mutex_mod_reg,
 						    mutex->id);
@@ -973,9 +1011,8 @@ void mtk_mutex_remove_comp(struct mtk_mutex *mutex,
 		return;
 	}
 
-	writel_relaxed(MUTEX_SOF_SINGLE_MODE,
-		       mtx->regs + DISP_REG_MUTEX_SOF(mtx->data->mutex_sof_reg,
-		       mutex->id));
+	mtk_mutex_remove_comp_sof(mutex, id);
+
 }
 EXPORT_SYMBOL_GPL(mtk_mutex_remove_comp);
 
diff --git a/include/linux/soc/mediatek/mtk-mutex.h b/include/linux/soc/mediatek/mtk-mutex.h
index 635218e3ac68..515e2d8bfc90 100644
--- a/include/linux/soc/mediatek/mtk-mutex.h
+++ b/include/linux/soc/mediatek/mtk-mutex.h
@@ -69,6 +69,10 @@ enum mtk_mutex_sof_index {
 
 struct mtk_mutex *mtk_mutex_get(struct device *dev);
 int mtk_mutex_prepare(struct mtk_mutex *mutex);
+void mtk_mutex_add_comp_sof(struct mtk_mutex *mutex,
+			    enum mtk_ddp_comp_id id);
+void mtk_mutex_remove_comp_sof(struct mtk_mutex *mutex,
+			       enum mtk_ddp_comp_id id);
 void mtk_mutex_add_comp(struct mtk_mutex *mutex,
 			enum mtk_ddp_comp_id id);
 void mtk_mutex_enable(struct mtk_mutex *mutex);
-- 
2.45.2


