Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 036D7CCF9F7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 08:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e0yotIABUBYqL+jy+i6v6JHpaUOVhmugbaoR/8MEZr8=; b=kYVuWCTqOoPUFEIf0k+WP+bFm4
	/Va5gVhQLk9sKJQOtXlFFMI9sxDhdZII4HC3bLVwgm02sxRGoabplE5a4WSUnNINbTamIM8qlagBp
	catRB6Crtpin+d23ef1bZ+Qry/Zu9ceLqywxomhM30/rWx/2Zx08IqxHOdwoVIeR5cT9dMoCSuFzn
	RJLsFIGFyXRoCT0YMi2SGqnNHi79VPvFIk6OP8JFGPI3GVkcPpE1vrmTB+lgKutcXz2guD7yqHTIv
	Q0bayWsNT1ISNU5vGtpJnLl+PW8RA1uFp3+MR+rmokqrCCD7frmgyEdSD2uIXpFFivp2I6ZVY6j7r
	x5QiuGHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE1NB-00000000Fho-3ScE;
	Wed, 29 Oct 2025 08:17:37 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE1N5-00000000FYx-1b4p;
	Wed, 29 Oct 2025 08:17:32 +0000
X-UUID: b4c8e79ab49f11f09f706fa2197c6ceb-20251029
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From; bh=e0yotIABUBYqL+jy+i6v6JHpaUOVhmugbaoR/8MEZr8=;
	b=YifYThkvpXR+NlwiyhDcoO7U5IGTnWP97QmuFfL7KB7GA3ljCNhD8pot5yBeCIyEbiyT7ymLeIt8SQ0/stnkLKuHyq0IaZlbRsXM/w/jGsjyaPdoj54BSkyJ51oRq7TEMg+Tm2wpwbScCspU7fpsbDFaWRsd2WZ3eGroZbyW7rE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:26d437a4-46d7-4efe-a351-0fe9812364b8,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:706ef23a-b16f-49fc-bb37-560773c432f7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b4c8e79ab49f11f09f706fa2197c6ceb-20251029
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1166555031; Wed, 29 Oct 2025 01:17:27 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 29 Oct 2025 16:17:23 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Wed, 29 Oct 2025 16:17:23 +0800
From: Kyrie Wu <kyrie.wu@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Kyrie Wu <kyrie.wu@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [RESEND v10 05/12] media: mediatek: jpeg: fix multi-core clk suspend and resume setting
Date: Wed, 29 Oct 2025 16:17:10 +0800
Message-ID: <20251029081717.29551-6-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20251029081717.29551-1-kyrie.wu@mediatek.com>
References: <20251029081717.29551-1-kyrie.wu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_011731_449842_CAD7BF51 
X-CRM114-Status: GOOD (  20.24  )
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

The suspend/resume callback function is defined in the dev_pm_ops
structure, which is defined in platform_driver. For multiple-core
architecture, each hardware driver will register a platform_driver
structure, so it is necessary to add a suspend/resume callback
function for each hardware to support this operation.

Fixes: 934e8bccac95 ("mtk-jpegenc: support jpegenc multi-hardware")
Fixes: 0fa49df4222f ("media: mtk-jpegdec: support jpegdec multi-hardware")

Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
---
 .../platform/mediatek/jpeg/mtk_jpeg_core.c    | 28 +++----
 .../platform/mediatek/jpeg/mtk_jpeg_dec_hw.c  | 75 ++++++++++++++++++-
 .../platform/mediatek/jpeg/mtk_jpeg_enc_hw.c  | 75 ++++++++++++++++++-
 3 files changed, 151 insertions(+), 27 deletions(-)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index dc88ec13f1dd..a90d949e53f5 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -1115,6 +1115,9 @@ static void mtk_jpeg_clk_on(struct mtk_jpeg_dev *jpeg)
 {
 	int ret;
 
+	if (jpeg->variant->multi_core)
+		return;
+
 	ret = clk_bulk_prepare_enable(jpeg->variant->num_clks,
 				      jpeg->variant->clks);
 	if (ret)
@@ -1123,6 +1126,9 @@ static void mtk_jpeg_clk_on(struct mtk_jpeg_dev *jpeg)
 
 static void mtk_jpeg_clk_off(struct mtk_jpeg_dev *jpeg)
 {
+	if (jpeg->variant->multi_core)
+		return;
+
 	clk_bulk_disable_unprepare(jpeg->variant->num_clks,
 				   jpeg->variant->clks);
 }
@@ -1651,13 +1657,6 @@ static void mtk_jpegenc_worker(struct work_struct *work)
 		goto enc_end;
 	}
 
-	ret = clk_prepare_enable(comp_jpeg[hw_id]->venc_clk.clks->clk);
-	if (ret) {
-		dev_err(jpeg->dev, "%s : %d, jpegenc clk_prepare_enable fail\n",
-			__func__, __LINE__);
-		goto enc_end;
-	}
-
 	v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
 	v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
 
@@ -1755,20 +1754,13 @@ static void mtk_jpegdec_worker(struct work_struct *work)
 	jpeg_dst_buf->frame_num = ctx->total_frame_num;
 
 	mtk_jpegdec_set_hw_param(ctx, hw_id, src_buf, dst_buf);
-	ret = pm_runtime_get_sync(comp_jpeg[hw_id]->dev);
+	ret = pm_runtime_resume_and_get(comp_jpeg[hw_id]->dev);
 	if (ret < 0) {
 		dev_err(jpeg->dev, "%s : %d, pm_runtime_get_sync fail !!!\n",
 			__func__, __LINE__);
 		goto dec_end;
 	}
 
-	ret = clk_prepare_enable(comp_jpeg[hw_id]->jdec_clk.clks->clk);
-	if (ret) {
-		dev_err(jpeg->dev, "%s : %d, jpegdec clk_prepare_enable fail\n",
-			__func__, __LINE__);
-		goto clk_end;
-	}
-
 	v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
 	v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
 
@@ -1778,7 +1770,7 @@ static void mtk_jpegdec_worker(struct work_struct *work)
 				 &dst_buf->vb2_buf, &fb)) {
 		dev_err(jpeg->dev, "%s : %d, mtk_jpeg_set_dec_dst fail\n",
 			__func__, __LINE__);
-		goto setdst_end;
+		goto set_dst_fail;
 	}
 
 	schedule_delayed_work(&comp_jpeg[hw_id]->job_timeout_work,
@@ -1800,9 +1792,7 @@ static void mtk_jpegdec_worker(struct work_struct *work)
 
 	return;
 
-setdst_end:
-	clk_disable_unprepare(comp_jpeg[hw_id]->jdec_clk.clks->clk);
-clk_end:
+set_dst_fail:
 	pm_runtime_put(comp_jpeg[hw_id]->dev);
 dec_end:
 	v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
index 6f4288d0915d..997fcb848977 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
@@ -540,14 +540,13 @@ static void mtk_jpegdec_timeout_work(struct work_struct *work)
 	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf);
 
 	mtk_jpeg_dec_reset(cjpeg->reg_base);
-	clk_disable_unprepare(cjpeg->jdec_clk.clks->clk);
-	pm_runtime_put(cjpeg->dev);
 	cjpeg->hw_state = MTK_JPEG_HW_IDLE;
 	atomic_inc(&master_jpeg->hw_rdy);
 	wake_up(&master_jpeg->hw_wq);
 	v4l2_m2m_buf_done(src_buf, buf_state);
 	mtk_jpegdec_put_buf(cjpeg);
 	jpeg_buf_queue_dec(ctx);
+	pm_runtime_put(cjpeg->dev);
 }
 
 static irqreturn_t mtk_jpegdec_hw_irq_handler(int irq, void *priv)
@@ -589,12 +588,11 @@ static irqreturn_t mtk_jpegdec_hw_irq_handler(int irq, void *priv)
 	v4l2_m2m_buf_done(src_buf, buf_state);
 	mtk_jpegdec_put_buf(jpeg);
 	jpeg_buf_queue_dec(ctx);
-	pm_runtime_put(ctx->jpeg->dev);
-	clk_disable_unprepare(jpeg->jdec_clk.clks->clk);
 
 	jpeg->hw_state = MTK_JPEG_HW_IDLE;
 	wake_up(&master_jpeg->hw_wq);
 	atomic_inc(&master_jpeg->hw_rdy);
+	pm_runtime_put(jpeg->dev);
 
 	return IRQ_HANDLED;
 }
@@ -677,15 +675,84 @@ static int mtk_jpegdec_hw_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, dev);
 	pm_runtime_enable(&pdev->dev);
+	ret = devm_clk_bulk_get(dev->dev,
+				jpegdec_clk->clk_num,
+				jpegdec_clk->clks);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to init clk\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static void mtk_jpeg_clk_on(struct mtk_jpegdec_comp_dev *jpeg)
+{
+	int ret;
+
+	ret = clk_bulk_prepare_enable(jpeg->jdec_clk.clk_num,
+				      jpeg->jdec_clk.clks);
+	if (ret)
+		dev_err(jpeg->dev, "%s : %d, jpegdec clk_prepare_enable fail\n",
+			__func__, __LINE__);
+}
+
+static void mtk_jpeg_clk_off(struct mtk_jpegdec_comp_dev *jpeg)
+{
+	clk_bulk_disable_unprepare(jpeg->jdec_clk.clk_num,
+				   jpeg->jdec_clk.clks);
+}
+
+static __maybe_unused int mtk_jpegdec_pm_suspend(struct device *dev)
+{
+	struct mtk_jpegdec_comp_dev *jpeg = dev_get_drvdata(dev);
+
+	mtk_jpeg_clk_off(jpeg);
 
 	return 0;
 }
 
+static __maybe_unused int mtk_jpegdec_pm_resume(struct device *dev)
+{
+	struct mtk_jpegdec_comp_dev *jpeg = dev_get_drvdata(dev);
+
+	mtk_jpeg_clk_on(jpeg);
+
+	return 0;
+}
+
+static __maybe_unused int mtk_jpegdec_suspend(struct device *dev)
+{
+	struct mtk_jpegdec_comp_dev *jpeg = dev_get_drvdata(dev);
+
+	v4l2_m2m_suspend(jpeg->master_dev->m2m_dev);
+	return pm_runtime_force_suspend(dev);
+}
+
+static __maybe_unused int mtk_jpegdec_resume(struct device *dev)
+{
+	struct mtk_jpegdec_comp_dev *jpeg = dev_get_drvdata(dev);
+	int ret;
+
+	ret = pm_runtime_force_resume(dev);
+	if (ret < 0)
+		return ret;
+
+	v4l2_m2m_resume(jpeg->master_dev->m2m_dev);
+	return ret;
+}
+
+static const struct dev_pm_ops mtk_jpegdec_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(mtk_jpegdec_suspend, mtk_jpegdec_resume)
+	SET_RUNTIME_PM_OPS(mtk_jpegdec_pm_suspend, mtk_jpegdec_pm_resume, NULL)
+};
+
 static struct platform_driver mtk_jpegdec_hw_driver = {
 	.probe = mtk_jpegdec_hw_probe,
 	.driver = {
 		.name = "mtk-jpegdec-hw",
 		.of_match_table = mtk_jpegdec_hw_ids,
+		.pm             = &mtk_jpegdec_pm_ops,
 	},
 };
 
diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
index dd5a78c3c006..955409061894 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
@@ -271,14 +271,13 @@ static void mtk_jpegenc_timeout_work(struct work_struct *work)
 	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf);
 
 	mtk_jpeg_enc_reset(cjpeg->reg_base);
-	clk_disable_unprepare(cjpeg->venc_clk.clks->clk);
-	pm_runtime_put(cjpeg->dev);
 	cjpeg->hw_state = MTK_JPEG_HW_IDLE;
 	atomic_inc(&master_jpeg->hw_rdy);
 	wake_up(&master_jpeg->hw_wq);
 	v4l2_m2m_buf_done(src_buf, buf_state);
 	mtk_jpegenc_put_buf(cjpeg);
 	jpeg_buf_queue_enc(ctx);
+	pm_runtime_put(cjpeg->dev);
 }
 
 static irqreturn_t mtk_jpegenc_hw_irq_handler(int irq, void *priv)
@@ -313,12 +312,11 @@ static irqreturn_t mtk_jpegenc_hw_irq_handler(int irq, void *priv)
 	v4l2_m2m_buf_done(src_buf, buf_state);
 	mtk_jpegenc_put_buf(jpeg);
 	jpeg_buf_queue_enc(ctx);
-	pm_runtime_put(ctx->jpeg->dev);
-	clk_disable_unprepare(jpeg->venc_clk.clks->clk);
 
 	jpeg->hw_state = MTK_JPEG_HW_IDLE;
 	wake_up(&master_jpeg->hw_wq);
 	atomic_inc(&master_jpeg->hw_rdy);
+	pm_runtime_put(jpeg->dev);
 
 	return IRQ_HANDLED;
 }
@@ -399,15 +397,84 @@ static int mtk_jpegenc_hw_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, dev);
 	pm_runtime_enable(&pdev->dev);
+	ret = devm_clk_bulk_get(dev->dev,
+				jpegenc_clk->clk_num,
+				jpegenc_clk->clks);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to init clk\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static void mtk_jpeg_clk_on(struct mtk_jpegenc_comp_dev *jpeg)
+{
+	int ret;
+
+	ret = clk_bulk_prepare_enable(jpeg->venc_clk.clk_num,
+				      jpeg->venc_clk.clks);
+	if (ret)
+		dev_err(jpeg->dev, "%s : %d, jpegenc clk_prepare_enable fail\n",
+			__func__, __LINE__);
+}
+
+static void mtk_jpeg_clk_off(struct mtk_jpegenc_comp_dev *jpeg)
+{
+	clk_bulk_disable_unprepare(jpeg->venc_clk.clk_num,
+				   jpeg->venc_clk.clks);
+}
+
+static __maybe_unused int mtk_jpegenc_pm_suspend(struct device *dev)
+{
+	struct mtk_jpegenc_comp_dev *jpeg = dev_get_drvdata(dev);
+
+	mtk_jpeg_clk_off(jpeg);
 
 	return 0;
 }
 
+static __maybe_unused int mtk_jpegenc_pm_resume(struct device *dev)
+{
+	struct mtk_jpegenc_comp_dev *jpeg = dev_get_drvdata(dev);
+
+	mtk_jpeg_clk_on(jpeg);
+
+	return 0;
+}
+
+static __maybe_unused int mtk_jpegenc_suspend(struct device *dev)
+{
+	struct mtk_jpegenc_comp_dev *jpeg = dev_get_drvdata(dev);
+
+	v4l2_m2m_suspend(jpeg->master_dev->m2m_dev);
+	return pm_runtime_force_suspend(dev);
+}
+
+static __maybe_unused int mtk_jpegenc_resume(struct device *dev)
+{
+	struct mtk_jpegenc_comp_dev *jpeg = dev_get_drvdata(dev);
+	int ret;
+
+	ret = pm_runtime_force_resume(dev);
+	if (ret < 0)
+		return ret;
+
+	v4l2_m2m_resume(jpeg->master_dev->m2m_dev);
+	return ret;
+}
+
+static const struct dev_pm_ops mtk_jpegenc_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(mtk_jpegenc_suspend, mtk_jpegenc_resume)
+	SET_RUNTIME_PM_OPS(mtk_jpegenc_pm_suspend, mtk_jpegenc_pm_resume, NULL)
+};
+
 static struct platform_driver mtk_jpegenc_hw_driver = {
 	.probe = mtk_jpegenc_hw_probe,
 	.driver = {
 		.name = "mtk-jpegenc-hw",
 		.of_match_table = mtk_jpegenc_drv_ids,
+		.pm = &mtk_jpegenc_pm_ops,
 	},
 };
 
-- 
2.45.2


