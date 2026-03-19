Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F1271088E65
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 02:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rgjfTRZ3IyQu3d0jM6so/Baz2x66MH/2IptdxNGeCsE=; b=43LFGYAzFqgC3Ro1EHgHSBEdbe
	dmdukv2svSxmeQtvaY8J8w15NH60V4ds+uZWBimxTJ5Hz/gMyPOnMz4RP4XohizXmo7/LoblUTzd/
	bDb1PovuOj4a8y8873SxPPdYbEbqYgI1mNXN/PG5+pDPBBV8cJJhqcX5J2zohhUsSFm0k5Fle3E2l
	ogPH0Wem+NjWWSmkrPBXw3NDUEldq2aLARm3lkwaiQzgutWFD7sauXQHGhpRA5RjlHqVimAMPOzdp
	1aXyFC3Bbrj8Gjob9y1yUydHQ141HIt9eNAitgPvYp3w4vrujahgAxDzXKmCb0WLMkEn5qJtgd+kN
	ZdUuqvgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w331e-00000009jHA-3pYN;
	Thu, 19 Mar 2026 02:22:18 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w331P-00000009j2W-3HgW;
	Thu, 19 Mar 2026 02:22:04 +0000
X-UUID: 67747676233a11f1a6de359d7043e138-20260318
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From; bh=rgjfTRZ3IyQu3d0jM6so/Baz2x66MH/2IptdxNGeCsE=;
	b=UAyVQy00BikG4jG88kBLJYqZD1iLTCmw5TQAZaodD2ue+Xj8QOYgCfLi8sIhGSz1rrq2+pSErIc03pOQWr/zhF/TII2XqQw+1l+8Ypj8YuwjS8THfEW8aAUn4e9m2VdLCO0eaUQKHJ10VmEn7ZZcKfDgzJse6bVSzGVGqnaIkeQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:af17e83b-a530-454e-a022-93912ae3caca,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:6d56f693-f8ef-4ca8-bea0-143568f9ca1d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 67747676233a11f1a6de359d7043e138-20260318
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 341137102; Wed, 18 Mar 2026 19:21:57 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 19 Mar 2026 10:21:55 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 19 Mar 2026 10:21:54 +0800
From: Kyrie Wu <kyrie.wu@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Kyrie Wu <kyrie.wu@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH v13 01/12] media: mediatek: jpeg: fix jpeg cores' amounts setting
Date: Thu, 19 Mar 2026 10:21:40 +0800
Message-ID: <20260319022152.31313-2-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260319022152.31313-1-kyrie.wu@mediatek.com>
References: <20260319022152.31313-1-kyrie.wu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_192203_870047_13F85364 
X-CRM114-Status: GOOD (  17.03  )
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

Different ICs have different amounts of cores,
use a variable to set the cores' amounts.

Fixes: 934e8bccac95 ("mtk-jpegenc: support jpegenc multi-hardware")
Fixes: 0fa49df4222f ("media: mtk-jpegdec: support jpegdec multi-hardware")
Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c   | 8 ++++----
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h   | 2 ++
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c | 1 +
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c | 1 +
 4 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index c01124a349f6..ed93117f276e 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -1460,7 +1460,7 @@ static int mtk_jpegenc_get_hw(struct mtk_jpeg_ctx *ctx)
 	int i;
 
 	spin_lock_irqsave(&jpeg->hw_lock, flags);
-	for (i = 0; i < MTK_JPEGENC_HW_MAX; i++) {
+	for (i = 0; i < jpeg->max_hw_count; i++) {
 		comp_jpeg = jpeg->enc_hw_dev[i];
 		if (comp_jpeg->hw_state == MTK_JPEG_HW_IDLE) {
 			hw_id = i;
@@ -1507,7 +1507,7 @@ static int mtk_jpegdec_get_hw(struct mtk_jpeg_ctx *ctx)
 	int i;
 
 	spin_lock_irqsave(&jpeg->hw_lock, flags);
-	for (i = 0; i < MTK_JPEGDEC_HW_MAX; i++) {
+	for (i = 0; i < jpeg->max_hw_count; i++) {
 		comp_jpeg = jpeg->dec_hw_dev[i];
 		if (comp_jpeg->hw_state == MTK_JPEG_HW_IDLE) {
 			hw_id = i;
@@ -1590,7 +1590,7 @@ static void mtk_jpegenc_worker(struct work_struct *work)
 		jpeg_work);
 	struct mtk_jpeg_dev *jpeg = ctx->jpeg;
 
-	for (i = 0; i < MTK_JPEGENC_HW_MAX; i++)
+	for (i = 0; i < jpeg->max_hw_count; i++)
 		comp_jpeg[i] = jpeg->enc_hw_dev[i];
 	i = 0;
 
@@ -1685,7 +1685,7 @@ static void mtk_jpegdec_worker(struct work_struct *work)
 	struct mtk_jpeg_fb fb;
 	unsigned long flags;
 
-	for (i = 0; i < MTK_JPEGDEC_HW_MAX; i++)
+	for (i = 0; i < jpeg->max_hw_count; i++)
 		comp_jpeg[i] = jpeg->dec_hw_dev[i];
 	i = 0;
 
diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
index 02ed0ed5b736..6be5cf30dea1 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
@@ -212,6 +212,7 @@ struct mtk_jpegdec_comp_dev {
  * @reg_decbase:	jpg decode register base addr
  * @dec_hw_dev:	jpg decode hardware device
  * @hw_index:		jpg hw index
+ * @max_hw_count:	jpeg hw-core count
  */
 struct mtk_jpeg_dev {
 	struct mutex		lock;
@@ -234,6 +235,7 @@ struct mtk_jpeg_dev {
 	void __iomem *reg_decbase[MTK_JPEGDEC_HW_MAX];
 	struct mtk_jpegdec_comp_dev *dec_hw_dev[MTK_JPEGDEC_HW_MAX];
 	atomic_t hw_index;
+	u32 max_hw_count;
 };
 
 /**
diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
index 32372781daf5..4534caeb104f 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
@@ -664,6 +664,7 @@ static int mtk_jpegdec_hw_probe(struct platform_device *pdev)
 	master_dev->dec_hw_dev[i] = dev;
 	master_dev->reg_decbase[i] = dev->reg_base;
 	dev->master_dev = master_dev;
+	master_dev->max_hw_count++;
 
 	platform_set_drvdata(pdev, dev);
 	pm_runtime_enable(&pdev->dev);
diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
index b6f5b2249f1f..2765dafab4ad 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
@@ -386,6 +386,7 @@ static int mtk_jpegenc_hw_probe(struct platform_device *pdev)
 	master_dev->enc_hw_dev[i] = dev;
 	master_dev->reg_encbase[i] = dev->reg_base;
 	dev->master_dev = master_dev;
+	master_dev->max_hw_count++;
 
 	platform_set_drvdata(pdev, dev);
 	pm_runtime_enable(&pdev->dev);
-- 
2.45.2


