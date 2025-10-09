Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83A38CCD185
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 11:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DNvdPN6IIKGJd2BqpWlF0EUaZa2SqUpjxSA02g2Kr8c=; b=xUpnMyu6TLQOTR2gbdEeZVXqcI
	mmVc8yKuKfzcz66LTfVDvUAFr3ZtwSXK1JF9v2yRBa+FoWjAofZr6o0dwprCqsBUWHrrUKdH1dr+3
	t+Jlk0q8NFzTiMYdHpfSx0VgsPP8RgZQc1MyrA0wcGJuCdvR+89gdDgZYJPq3l70A/3zQLuHHiFRC
	YdTyu9ATDWSCeVYD4BXjUz1zlVpiWvdfzSoGlmtn5pHLSRCbzATe+cdvwgo8FVtf1Bl0X3bzG861k
	YjCMUw09lt6Ph/CC26JLVzt3ss4ySXovZ2ZYUTPb6yB/yJiteN96w+a6bOgs+b7gsM+ujYyElM00N
	0f5SNKjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6ohY-00000005wvv-23iF;
	Thu, 09 Oct 2025 11:20:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6ohW-00000005wuV-2xsk;
	Thu, 09 Oct 2025 11:20:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=DNvdPN6IIKGJd2BqpWlF0EUaZa2SqUpjxSA02g2Kr8c=; b=CzeB7d87242xvyDRofiybWnB8L
	+rqDiCHQvfChgXUMr21ru5XYr6tCM4+16EqBJKRm3JBo0BOigwxEmwo8HQqNv+fnY6yhlyBma0Dae
	QZV5ebYBeoL4fMr+GguZMDYKI+2oyxPu7J0TVHaz2zeNNlGidUiIya5F9avqAD81JO87Qcj0CFis4
	1l3zy9hW8pVWdh++bDQDfRkoNMpXS7uL7sjWr0+exH9xVlNTBnIg93c7MV2NySnSLAJfAepR0ppGp
	xeIu46XAwWmZOEoIfS7pWu7PM8fIjqavPdM0FzZQT1FJSeJdD1JW7mVCQG62RuywmNudqw7dkMYPl
	cbq7YA4g==;
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6ohT-00000001PLJ-24Wk;
	Thu, 09 Oct 2025 11:20:49 +0000
Received: from pendragon.ideasonboard.com (82-203-166-19.bb.dnainternet.fi [82.203.166.19])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 84018965;
	Thu,  9 Oct 2025 13:10:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1760008215;
	bh=hHz8YdtHioPSOVwHRJYVN90dGjplXI5Vmj7Mglb6IE8=;
	h=From:To:Cc:Subject:Date:From;
	b=Pyv/kJxz95Ui53C0pDU9sxoFjf0lXr36X+jpVrdRnVmSfnPYQ8mf0E0TIyJV+asyy
	 ViTKOlbKiqc6JELvOZGMspBZH6b9tDA6c1El3DncWGcXlFPkxa74Wtl7fIGKjfUI2r
	 G8W3cga/15Td3/GqHNkAkIF7JVNtktCe9D7DMPcU=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
	Bin Liu <bin.liu@mediatek.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Hans Verkuil <hverkuil@kernel.org>,
	Jacob Chen <jacob-chen@iotwrt.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jiasheng Jiang <jiashengjiangcool@gmail.com>,
	Matthew Majewski <mattwmajewski@gmail.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Xavier Roumegue <xavier.roumegue@oss.nxp.com>
Subject: [PATCH] media: v4l2-mem2mem: Don't copy frame flags for frame-based devices
Date: Thu,  9 Oct 2025 14:11:43 +0300
Message-ID: <20251009111143.9137-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_122047_904200_6D4F9D95 
X-CRM114-Status: GOOD (  12.27  )
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

The v4l2_m2m_buf_copy_metadata() function takes a boolean
copy_frame_flags argument. When true, it causes the function to copy the
V4L2_BUF_FLAG_KEYFRAME, V4L2_BUF_FLAG_BFRAME and V4L2_BUF_FLAG_PFRAME
flags from the output buffer to the capture buffer.

Many frame-based M2M drivers (e.g. for JPEG encoders, scalers,
dewarpers, 2D blenders, ...) set the argument to true, while the frame
flags are not applicable to those drivers as they have no concept of
key, B or P frames. Set the argument to false to avoid further
cargo-cult mistakes.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c     | 4 ++--
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c   | 4 ++--
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c   | 4 ++--
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c      | 2 +-
 drivers/media/platform/nxp/dw100/dw100.c                 | 2 +-
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c           | 2 +-
 drivers/media/platform/rockchip/rga/rga.c                | 2 +-
 drivers/media/platform/st/stm32/dma2d/dma2d.c            | 2 +-
 drivers/media/platform/sunxi/sun8i-di/sun8i-di.c         | 2 +-
 drivers/media/platform/sunxi/sun8i-rotate/sun8i_rotate.c | 2 +-
 drivers/media/test-drivers/vim2m.c                       | 2 +-
 drivers/staging/media/imx/imx-media-csc-scaler.c         | 2 +-
 12 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index 35c70ec3ad2c..6bd5036430dc 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -1619,7 +1619,7 @@ static void mtk_jpegenc_worker(struct work_struct *work)
 	if (!dst_buf)
 		goto getbuf_fail;
 
-	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, true);
+	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, false);
 
 	mtk_jpegenc_set_hw_param(ctx, hw_id, src_buf, dst_buf);
 	ret = pm_runtime_get_sync(comp_jpeg[hw_id]->dev);
@@ -1715,7 +1715,7 @@ static void mtk_jpegdec_worker(struct work_struct *work)
 	if (!dst_buf)
 		goto getbuf_fail;
 
-	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, true);
+	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, false);
 	jpeg_src_buf = mtk_jpeg_vb2_to_srcbuf(&src_buf->vb2_buf);
 	jpeg_dst_buf = mtk_jpeg_vb2_to_srcbuf(&dst_buf->vb2_buf);
 
diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
index e78e1d11093c..556865100872 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
@@ -530,7 +530,7 @@ static void mtk_jpegdec_timeout_work(struct work_struct *work)
 
 	src_buf = cjpeg->hw_param.src_buffer;
 	dst_buf = cjpeg->hw_param.dst_buffer;
-	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, true);
+	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, false);
 
 	mtk_jpeg_dec_reset(cjpeg->reg_base);
 	clk_disable_unprepare(cjpeg->jdec_clk.clks->clk);
@@ -560,7 +560,7 @@ static irqreturn_t mtk_jpegdec_hw_irq_handler(int irq, void *priv)
 	ctx = jpeg->hw_param.curr_ctx;
 	src_buf = jpeg->hw_param.src_buffer;
 	dst_buf = jpeg->hw_param.dst_buffer;
-	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, true);
+	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, false);
 
 	irq_status = mtk_jpeg_dec_get_int_status(jpeg->reg_base);
 	dec_irq_ret = mtk_jpeg_dec_enum_result(irq_status);
diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
index 9ab27aee302a..4c8427b3c384 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
@@ -261,7 +261,7 @@ static void mtk_jpegenc_timeout_work(struct work_struct *work)
 
 	src_buf = cjpeg->hw_param.src_buffer;
 	dst_buf = cjpeg->hw_param.dst_buffer;
-	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, true);
+	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, false);
 
 	mtk_jpeg_enc_reset(cjpeg->reg_base);
 	clk_disable_unprepare(cjpeg->venc_clk.clks->clk);
@@ -289,7 +289,7 @@ static irqreturn_t mtk_jpegenc_hw_irq_handler(int irq, void *priv)
 	ctx = jpeg->hw_param.curr_ctx;
 	src_buf = jpeg->hw_param.src_buffer;
 	dst_buf = jpeg->hw_param.dst_buffer;
-	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, true);
+	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, false);
 
 	irq_status = readl(jpeg->reg_base + JPEG_ENC_INT_STS) &
 		JPEG_ENC_INT_STATUS_MASK_ALLIRQ;
diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c
index 59ce5cce0698..dba46a69c6be 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c
@@ -51,7 +51,7 @@ static void mdp_m2m_process_done(void *priv, int vb_state)
 	ctx->curr_param.frame_no = ctx->frame_count[MDP_M2M_SRC];
 	src_vbuf->sequence = ctx->frame_count[MDP_M2M_SRC]++;
 	dst_vbuf->sequence = ctx->frame_count[MDP_M2M_DST]++;
-	v4l2_m2m_buf_copy_metadata(src_vbuf, dst_vbuf, true);
+	v4l2_m2m_buf_copy_metadata(src_vbuf, dst_vbuf, false);
 
 	v4l2_m2m_buf_done(src_vbuf, vb_state);
 	v4l2_m2m_buf_done(dst_vbuf, vb_state);
diff --git a/drivers/media/platform/nxp/dw100/dw100.c b/drivers/media/platform/nxp/dw100/dw100.c
index 7a0ee44d9e1f..b73302d54635 100644
--- a/drivers/media/platform/nxp/dw100/dw100.c
+++ b/drivers/media/platform/nxp/dw100/dw100.c
@@ -1483,7 +1483,7 @@ static void dw100_start(struct dw100_ctx *ctx, struct vb2_v4l2_buffer *in_vb,
 				V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE),
 		in_vb->sequence, out_vb->sequence);
 
-	v4l2_m2m_buf_copy_metadata(in_vb, out_vb, true);
+	v4l2_m2m_buf_copy_metadata(in_vb, out_vb, false);
 
 	/* Now, let's deal with hardware ... */
 	dw100_hw_master_bus_disable(dw_dev);
diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
index 37e0670f98c5..e1dda1e834e4 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
@@ -1537,7 +1537,7 @@ static void mxc_jpeg_device_run(void *priv)
 	src_buf->sequence = q_data_out->sequence++;
 	dst_buf->sequence = q_data_cap->sequence++;
 
-	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, true);
+	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, false);
 
 	jpeg_src_buf = vb2_to_mxc_buf(&src_buf->vb2_buf);
 	if (q_data_cap->fmt->mem_planes != dst_buf->vb2_buf.num_planes) {
diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index 48b88da59da0..075b684fb178 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -75,7 +75,7 @@ static irqreturn_t rga_isr(int irq, void *prv)
 		WARN_ON(!src);
 		WARN_ON(!dst);
 
-		v4l2_m2m_buf_copy_metadata(src, dst, true);
+		v4l2_m2m_buf_copy_metadata(src, dst, false);
 
 		dst->sequence = ctx->csequence++;
 
diff --git a/drivers/media/platform/st/stm32/dma2d/dma2d.c b/drivers/media/platform/st/stm32/dma2d/dma2d.c
index 643913adc1f3..4184bdb96e6d 100644
--- a/drivers/media/platform/st/stm32/dma2d/dma2d.c
+++ b/drivers/media/platform/st/stm32/dma2d/dma2d.c
@@ -483,7 +483,7 @@ static void device_run(void *prv)
 
 	src->sequence = frm_out->sequence++;
 	dst->sequence = frm_cap->sequence++;
-	v4l2_m2m_buf_copy_metadata(src, dst, true);
+	v4l2_m2m_buf_copy_metadata(src, dst, false);
 
 	if (clk_enable(dev->gate))
 		goto end;
diff --git a/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c b/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c
index 3e7f2df70408..11a6c7f5212e 100644
--- a/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c
+++ b/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c
@@ -71,7 +71,7 @@ static void deinterlace_device_run(void *priv)
 	src = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
 	dst = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
 
-	v4l2_m2m_buf_copy_metadata(src, dst, true);
+	v4l2_m2m_buf_copy_metadata(src, dst, false);
 
 	deinterlace_write(dev, DEINTERLACE_MOD_ENABLE,
 			  DEINTERLACE_MOD_ENABLE_EN);
diff --git a/drivers/media/platform/sunxi/sun8i-rotate/sun8i_rotate.c b/drivers/media/platform/sunxi/sun8i-rotate/sun8i_rotate.c
index abd10b218aa1..f6e2f11a20dd 100644
--- a/drivers/media/platform/sunxi/sun8i-rotate/sun8i_rotate.c
+++ b/drivers/media/platform/sunxi/sun8i-rotate/sun8i_rotate.c
@@ -70,7 +70,7 @@ static void rotate_device_run(void *priv)
 	src = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
 	dst = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
 
-	v4l2_m2m_buf_copy_metadata(src, dst, true);
+	v4l2_m2m_buf_copy_metadata(src, dst, false);
 
 	val = ROTATE_GLB_CTL_MODE(ROTATE_MODE_COPY_ROTATE);
 	if (ctx->hflip)
diff --git a/drivers/media/test-drivers/vim2m.c b/drivers/media/test-drivers/vim2m.c
index dc82830a35a5..3e8476165721 100644
--- a/drivers/media/test-drivers/vim2m.c
+++ b/drivers/media/test-drivers/vim2m.c
@@ -482,7 +482,7 @@ static int device_process(struct vim2m_ctx *ctx,
 
 	out_vb->sequence = q_data_out->sequence++;
 	in_vb->sequence = q_data_in->sequence++;
-	v4l2_m2m_buf_copy_metadata(in_vb, out_vb, true);
+	v4l2_m2m_buf_copy_metadata(in_vb, out_vb, false);
 
 	if (ctx->mode & MEM2MEM_VFLIP) {
 		start = height - 1;
diff --git a/drivers/staging/media/imx/imx-media-csc-scaler.c b/drivers/staging/media/imx/imx-media-csc-scaler.c
index 19fd31cb9bb0..770ba3fbaba2 100644
--- a/drivers/staging/media/imx/imx-media-csc-scaler.c
+++ b/drivers/staging/media/imx/imx-media-csc-scaler.c
@@ -96,7 +96,7 @@ static void ipu_ic_pp_complete(struct ipu_image_convert_run *run, void *_ctx)
 	src_buf = v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
 	dst_buf = v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
 
-	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, true);
+	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, false);
 
 	src_buf->sequence = ctx->sequence++;
 	dst_buf->sequence = src_buf->sequence;

base-commit: e5f0a698b34ed76002dc5cff3804a61c80233a7a
-- 
Regards,

Laurent Pinchart


