Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 707DCCCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 06:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J9lgi4iASLQbPZH+IlakQQS3ZNaMCSi4cb/VmwHm048=; b=vRY8JG0uANXA3GdJ3P8aE3zWsM
	Yt8Ak0b3TcsLwby8wfEtGdbFgFKzsQdBasjamyZNKGsCQY7q+EIaQka7x7BJe0MWIYKyYLggybTAG
	gfgxsc+KUXvY0HAwHcOE+gKUJR4OtmADZ3NlG2hGLtAq4FP1FGZECcC44bNtJ6K1D80oo6fLW0nOJ
	TAhw5f66p7HZRMXgaHzk4QHbxajNLiuMf7Arh1LE00nTkNSM6YEUnxDIdHJjX0Da/ZPqcsmm2kkWL
	17L02MWIXLQAZtubEWiCto/U3669FtQmqicaCl8lhGPRHISuI7QM6p88+4/h+sqHE1nKaFkk6M+Dx
	vPloLbkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE04V-0000000HY9f-0vjV;
	Wed, 29 Oct 2025 06:54:15 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE04N-0000000HY2b-1koo;
	Wed, 29 Oct 2025 06:54:08 +0000
X-UUID: 0e4d1482b49411f0a52f393f94899d25-20251028
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From; bh=J9lgi4iASLQbPZH+IlakQQS3ZNaMCSi4cb/VmwHm048=;
	b=DfR+ry1QCegAVF4nKL58dZ8uBvSnbzCpmjMBPSEo6UiuvHcSpjz5nl1pLTcf8b8HStMLCLpECj+7atQdBFBKa4tD69f/FUZaqQNduvQVsbGjOA7z7F2bbLFXFbIqsbeXPQZVpb67C4DIussgGq/LMS7scBjDA2cDx9EhxWZV0RE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:9ed0b9b3-73fe-4db1-8f8d-484fc4c729b6,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:4676f13a-b16f-49fc-bb37-560773c432f7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 0e4d1482b49411f0a52f393f94899d25-20251028
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 144857982; Tue, 28 Oct 2025 23:54:03 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 29 Oct 2025 14:54:00 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Wed, 29 Oct 2025 14:53:59 +0800
From: Kyrie Wu <kyrie.wu@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Kyrie Wu <kyrie.wu@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH v10 04/12] media: mediatek: jpeg: fix stop streaming flow for multi-core
Date: Wed, 29 Oct 2025 14:53:45 +0800
Message-ID: <20251029065354.22257-5-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20251029065354.22257-1-kyrie.wu@mediatek.com>
References: <20251029065354.22257-1-kyrie.wu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_235407_464494_99D5F395 
X-CRM114-Status: GOOD (  19.38  )
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

For jpeg multi-core architecture, if all hardware run at the
same time, some input and output buffers are occupied.
If one hardware is completed firstly, while other hardwares are
still running. The decoding completion signal calls
mtk_jpeg_dec_stop_streaming, and the function of v4l2_m2m_buf_done
is called in mtk_jpeg_dec_stop_streaming to complete all
input/output buffers. However, some buffers are occupied by other
hardwares, resulting in errors. It needs to add a counter to
calculate the used decoding buffer counts, it will increase 1 when
the buffer set to hardware and decrease to 0 until the all buffers
decoded and the function could continue to be executed.

Fixes: 0fa49df4222f ("media: mtk-jpegdec: support jpegdec multi-hardware")
Fixes: dedc21500334 ("media: mtk-jpegdec: add jpeg decode worker interface")
Fixes: 934e8bccac95 ("mtk-jpegenc: support jpegenc multi-hardware")
Fixes: 5fb1c2361e56 ("mtk-jpegenc: add jpeg encode worker interface")

Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>

---
 .../media/platform/mediatek/jpeg/mtk_jpeg_core.c | 16 ++++++++++++++++
 .../media/platform/mediatek/jpeg/mtk_jpeg_core.h |  2 ++
 .../platform/mediatek/jpeg/mtk_jpeg_dec_hw.c     |  9 +++++++++
 .../platform/mediatek/jpeg/mtk_jpeg_enc_hw.c     |  9 +++++++++
 4 files changed, 36 insertions(+)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index b83b43141e80..dc88ec13f1dd 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -850,8 +850,12 @@ static struct vb2_v4l2_buffer *mtk_jpeg_buf_remove(struct mtk_jpeg_ctx *ctx,
 static void mtk_jpeg_enc_stop_streaming(struct vb2_queue *q)
 {
 	struct mtk_jpeg_ctx *ctx = vb2_get_drv_priv(q);
+	struct mtk_jpeg_dev *jpeg = ctx->jpeg;
 	struct vb2_v4l2_buffer *vb;
 
+	if (jpeg->variant->multi_core)
+		wait_event(jpeg->hw_wq, (atomic_read(&ctx->buf_list_cnt) == 0));
+
 	while ((vb = mtk_jpeg_buf_remove(ctx, q->type)))
 		v4l2_m2m_buf_done(vb, VB2_BUF_STATE_ERROR);
 }
@@ -859,6 +863,7 @@ static void mtk_jpeg_enc_stop_streaming(struct vb2_queue *q)
 static void mtk_jpeg_dec_stop_streaming(struct vb2_queue *q)
 {
 	struct mtk_jpeg_ctx *ctx = vb2_get_drv_priv(q);
+	struct mtk_jpeg_dev *jpeg = ctx->jpeg;
 	struct vb2_v4l2_buffer *vb;
 
 	/*
@@ -866,6 +871,9 @@ static void mtk_jpeg_dec_stop_streaming(struct vb2_queue *q)
 	 * Before STREAMOFF, we still have to return the old resolution and
 	 * subsampling. Update capture queue when the stream is off.
 	 */
+	if (jpeg->variant->multi_core)
+		wait_event(jpeg->hw_wq, (atomic_read(&ctx->buf_list_cnt) == 0));
+
 	if (ctx->state == MTK_JPEG_SOURCE_CHANGE &&
 	    V4L2_TYPE_IS_CAPTURE(q->type)) {
 		struct mtk_jpeg_src_buf *src_buf;
@@ -1174,6 +1182,7 @@ static int mtk_jpeg_open(struct file *file)
 	spin_lock_init(&ctx->done_queue_lock);
 	v4l2_fh_init(&ctx->fh, vfd);
 	v4l2_fh_add(&ctx->fh, file);
+	atomic_set(&ctx->buf_list_cnt, 0);
 
 	ctx->jpeg = jpeg;
 	ctx->fh.m2m_ctx = v4l2_m2m_ctx_init(jpeg->m2m_dev, ctx,
@@ -1556,6 +1565,11 @@ static int mtk_jpegdec_set_hw_param(struct mtk_jpeg_ctx *ctx,
 	return 0;
 }
 
+static void jpeg_buf_queue_inc(struct mtk_jpeg_ctx *ctx)
+{
+	atomic_inc(&ctx->buf_list_cnt);
+}
+
 static irqreturn_t mtk_jpeg_enc_done(struct mtk_jpeg_dev *jpeg)
 {
 	struct mtk_jpeg_ctx *ctx;
@@ -1664,6 +1678,7 @@ static void mtk_jpegenc_worker(struct work_struct *work)
 			     &src_buf->vb2_buf);
 	mtk_jpeg_set_enc_params(ctx, comp_jpeg[hw_id]->reg_base);
 	mtk_jpeg_enc_start(comp_jpeg[hw_id]->reg_base);
+	jpeg_buf_queue_inc(ctx);
 	v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
 	spin_unlock_irqrestore(&comp_jpeg[hw_id]->hw_lock, flags);
 
@@ -1779,6 +1794,7 @@ static void mtk_jpegdec_worker(struct work_struct *work)
 				&bs,
 				&fb);
 	mtk_jpeg_dec_start(comp_jpeg[hw_id]->reg_base);
+	jpeg_buf_queue_inc(ctx);
 	v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
 	spin_unlock_irqrestore(&comp_jpeg[hw_id]->hw_lock, flags);
 
diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
index 148fd41759b7..33f7fbc4ca5e 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
@@ -288,6 +288,7 @@ struct mtk_jpeg_q_data {
  * @dst_done_queue:		encoded frame buffer queue
  * @done_queue_lock:		encoded frame operation spinlock
  * @last_done_frame_num:	the last encoded frame number
+ * @buf_list_cnt:		the frame buffer count own by jpeg driver
  */
 struct mtk_jpeg_ctx {
 	struct mtk_jpeg_dev		*jpeg;
@@ -306,6 +307,7 @@ struct mtk_jpeg_ctx {
 	/* spinlock protecting the encode done buffer */
 	spinlock_t done_queue_lock;
 	u32 last_done_frame_num;
+	atomic_t buf_list_cnt;
 };
 
 #endif /* _MTK_JPEG_CORE_H */
diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
index 4534caeb104f..6f4288d0915d 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
@@ -519,6 +519,11 @@ static void mtk_jpegdec_put_buf(struct mtk_jpegdec_comp_dev *jpeg)
 	spin_unlock_irqrestore(&ctx->done_queue_lock, flags);
 }
 
+static void jpeg_buf_queue_dec(struct mtk_jpeg_ctx *ctx)
+{
+	atomic_dec(&ctx->buf_list_cnt);
+}
+
 static void mtk_jpegdec_timeout_work(struct work_struct *work)
 {
 	enum vb2_buffer_state buf_state = VB2_BUF_STATE_ERROR;
@@ -527,9 +532,11 @@ static void mtk_jpegdec_timeout_work(struct work_struct *work)
 			     job_timeout_work.work);
 	struct mtk_jpeg_dev *master_jpeg = cjpeg->master_dev;
 	struct vb2_v4l2_buffer *src_buf, *dst_buf;
+	struct mtk_jpeg_ctx *ctx;
 
 	src_buf = cjpeg->hw_param.src_buffer;
 	dst_buf = cjpeg->hw_param.dst_buffer;
+	ctx = cjpeg->hw_param.curr_ctx;
 	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf);
 
 	mtk_jpeg_dec_reset(cjpeg->reg_base);
@@ -540,6 +547,7 @@ static void mtk_jpegdec_timeout_work(struct work_struct *work)
 	wake_up(&master_jpeg->hw_wq);
 	v4l2_m2m_buf_done(src_buf, buf_state);
 	mtk_jpegdec_put_buf(cjpeg);
+	jpeg_buf_queue_dec(ctx);
 }
 
 static irqreturn_t mtk_jpegdec_hw_irq_handler(int irq, void *priv)
@@ -580,6 +588,7 @@ static irqreturn_t mtk_jpegdec_hw_irq_handler(int irq, void *priv)
 	buf_state = VB2_BUF_STATE_DONE;
 	v4l2_m2m_buf_done(src_buf, buf_state);
 	mtk_jpegdec_put_buf(jpeg);
+	jpeg_buf_queue_dec(ctx);
 	pm_runtime_put(ctx->jpeg->dev);
 	clk_disable_unprepare(jpeg->jdec_clk.clks->clk);
 
diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
index 2765dafab4ad..dd5a78c3c006 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
@@ -248,6 +248,11 @@ static void mtk_jpegenc_put_buf(struct mtk_jpegenc_comp_dev *jpeg)
 	spin_unlock_irqrestore(&ctx->done_queue_lock, flags);
 }
 
+static void jpeg_buf_queue_enc(struct mtk_jpeg_ctx *ctx)
+{
+	atomic_dec(&ctx->buf_list_cnt);
+}
+
 static void mtk_jpegenc_timeout_work(struct work_struct *work)
 {
 	struct delayed_work *dly_work = to_delayed_work(work);
@@ -258,9 +263,11 @@ static void mtk_jpegenc_timeout_work(struct work_struct *work)
 	struct mtk_jpeg_dev *master_jpeg = cjpeg->master_dev;
 	enum vb2_buffer_state buf_state = VB2_BUF_STATE_ERROR;
 	struct vb2_v4l2_buffer *src_buf, *dst_buf;
+	struct mtk_jpeg_ctx *ctx;
 
 	src_buf = cjpeg->hw_param.src_buffer;
 	dst_buf = cjpeg->hw_param.dst_buffer;
+	ctx = cjpeg->hw_param.curr_ctx;
 	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf);
 
 	mtk_jpeg_enc_reset(cjpeg->reg_base);
@@ -271,6 +278,7 @@ static void mtk_jpegenc_timeout_work(struct work_struct *work)
 	wake_up(&master_jpeg->hw_wq);
 	v4l2_m2m_buf_done(src_buf, buf_state);
 	mtk_jpegenc_put_buf(cjpeg);
+	jpeg_buf_queue_enc(ctx);
 }
 
 static irqreturn_t mtk_jpegenc_hw_irq_handler(int irq, void *priv)
@@ -304,6 +312,7 @@ static irqreturn_t mtk_jpegenc_hw_irq_handler(int irq, void *priv)
 	buf_state = VB2_BUF_STATE_DONE;
 	v4l2_m2m_buf_done(src_buf, buf_state);
 	mtk_jpegenc_put_buf(jpeg);
+	jpeg_buf_queue_enc(ctx);
 	pm_runtime_put(ctx->jpeg->dev);
 	clk_disable_unprepare(jpeg->venc_clk.clks->clk);
 
-- 
2.45.2


