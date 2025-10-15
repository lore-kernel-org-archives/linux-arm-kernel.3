Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C6D6CCD190
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 07:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xg8GiBjDJqyNRK5q8tsOi8JmkFU0bVjWnj72A8oToaI=; b=qQws7/+aGhzyJwJF7yqYwnyM5u
	i6cCQywUBbnUXJ29rS3queCdXLEO+Im6gKnO4wNViHNO5Nz2dbszuNo+IjmIG0S4I1IruI+n6ouIV
	wJJ06y3cl/zElOtp9ZAUB+a97LcV+7du4uhHbWDTkHp1kWPGqsfVkAvFDUGxfHQZ9aAG1wQvVnpon
	2jOuL6tWZQMDxLSojil2fcpm8NZmo9V/xSPm1PEJMBXHz+IB18sA542o6a2jyEChnv9b82ZZcPg1D
	RqKRz6vHhK722krVySYU8TpAVFyI9Cp9pDiWLzN/DMiUCVOs2LZyBRN71Ai5hlHzSppk/uO+23hzL
	fLaX23NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8wL2-00000000okp-0PTo;
	Wed, 15 Oct 2025 07:54:24 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8wKy-00000000ogB-0Pgy;
	Wed, 15 Oct 2025 07:54:21 +0000
Received: from pendragon.ideasonboard.com (87-94-110-32.bb.dnainternet.fi [87.94.110.32])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 94093162B;
	Wed, 15 Oct 2025 09:52:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1760514759;
	bh=R5HOgozqJoHFs+15LqFltUnY9B75cS3L+R4SpplU7WI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iEMWdVgHen4l3vZ7/248hwYc24ni4PWQ1bSDhTVNllVtT9oouIrkKyK1Ioh5g341A
	 BVn0eWk1uu8GCNMw5HGjQCZwf2kFqgbP7N+HRQ8z7I6sxynJfHClVDLWFzgZ1ZunN6
	 teI7e4RmJFUxEfi+tK1/rcSlUtg/lq4impkPTDGE=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>
Subject: [PATCH v2 09/25] media: mediatek: vcodec: Drop unneeded v4l2_m2m_get_vq() NULL check
Date: Wed, 15 Oct 2025 10:53:32 +0300
Message-ID: <20251015075353.22625-10-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251015075353.22625-1-laurent.pinchart@ideasonboard.com>
References: <20251015075353.22625-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_005420_274934_D3A42541 
X-CRM114-Status: GOOD (  12.48  )
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

The v4l2_m2m_get_vq() function never returns NULL.

In the set format handlers, the check may have been intended to catch
invalid format types, but that's not needed as the V4L2 core picks the
appropriate VIDIOC_S_FMT ioctl handler based on the format type, so the
type can't be incorrect.

In the get format handlers, the return value is not used for any purpose
other than the NULL check, which was therefore probably intended to
catch invalid format types. That's not needed for the same reason as in
the set format handler.

In other locations the v4l2_m2m_get_vq() function is called with a
hardcoded V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE type, so the NULL check
can't have been an attempt to catch an invalid type there either.

Drop the unneeded return value checks and, as the function has no side
effect, the unneeded function call as well.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes since v1:

- Address vidioc_venc_g_fmt()
---
 .../mediatek/vcodec/decoder/mtk_vcodec_dec.c       |  7 -------
 .../vcodec/decoder/vdec/vdec_av1_req_lat_if.c      |  2 --
 .../vcodec/decoder/vdec/vdec_vp9_req_lat_if.c      |  2 --
 .../mediatek/vcodec/encoder/mtk_vcodec_enc.c       | 14 --------------
 4 files changed, 25 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
index d691bd533103..1f32ba11a18c 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
@@ -674,15 +674,8 @@ static int vidioc_vdec_g_fmt(struct file *file, void *priv,
 {
 	struct mtk_vcodec_dec_ctx *ctx = file_to_dec_ctx(file);
 	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
-	struct vb2_queue *vq;
 	struct mtk_q_data *q_data;
 
-	vq = v4l2_m2m_get_vq(ctx->m2m_ctx, f->type);
-	if (!vq) {
-		mtk_v4l2_vdec_err(ctx, "no vb2 queue for type=%d", f->type);
-		return -EINVAL;
-	}
-
 	q_data = mtk_vdec_get_q_data(ctx, f->type);
 
 	pix_mp->field = V4L2_FIELD_NONE;
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c
index bf21f2467a0f..08e0f5a70935 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c
@@ -1810,8 +1810,6 @@ static int vdec_av1_slice_setup_core_buffer(struct vdec_av1_slice_instance *inst
 
 	/* reference buffers */
 	vq = v4l2_m2m_get_vq(instance->ctx->m2m_ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
-	if (!vq)
-		return -EINVAL;
 
 	/* get current output buffer */
 	vb = &v4l2_m2m_next_dst_buf(instance->ctx->m2m_ctx)->vb2_buf;
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
index 47c302745c1d..45cd555a5fb5 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
@@ -1686,8 +1686,6 @@ static int vdec_vp9_slice_setup_core_buffer(struct vdec_vp9_slice_instance *inst
 	/* reference buffers */
 	vq = v4l2_m2m_get_vq(instance->ctx->m2m_ctx,
 			     V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
-	if (!vq)
-		return -EINVAL;
 
 	/* get current output buffer */
 	vb = &v4l2_m2m_next_dst_buf(instance->ctx->m2m_ctx)->vb2_buf;
diff --git a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
index d815e962ab89..6faf3f659e75 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
+++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
@@ -421,10 +421,6 @@ static int vidioc_venc_s_fmt_cap(struct file *file, void *priv,
 	const struct mtk_video_fmt *fmt;
 
 	vq = v4l2_m2m_get_vq(ctx->m2m_ctx, f->type);
-	if (!vq) {
-		mtk_v4l2_venc_err(ctx, "fail to get vq");
-		return -EINVAL;
-	}
 
 	if (vb2_is_busy(vq)) {
 		mtk_v4l2_venc_err(ctx, "queue busy");
@@ -476,10 +472,6 @@ static int vidioc_venc_s_fmt_out(struct file *file, void *priv,
 	const struct mtk_video_fmt *fmt;
 
 	vq = v4l2_m2m_get_vq(ctx->m2m_ctx, f->type);
-	if (!vq) {
-		mtk_v4l2_venc_err(ctx, "fail to get vq");
-		return -EINVAL;
-	}
 
 	if (vb2_is_busy(vq)) {
 		mtk_v4l2_venc_err(ctx, "queue busy");
@@ -524,15 +516,9 @@ static int vidioc_venc_g_fmt(struct file *file, void *priv,
 {
 	struct v4l2_pix_format_mplane *pix = &f->fmt.pix_mp;
 	struct mtk_vcodec_enc_ctx *ctx = file_to_enc_ctx(file);
-	struct vb2_queue *vq;
 	struct mtk_q_data *q_data = mtk_venc_get_q_data(ctx, f->type);
 	int i;
 
-	vq = v4l2_m2m_get_vq(ctx->m2m_ctx, f->type);
-	if (!vq)
-		return -EINVAL;
-
-
 	pix->width = q_data->coded_width;
 	pix->height = q_data->coded_height;
 	pix->pixelformat = q_data->fmt->fourcc;
-- 
Regards,

Laurent Pinchart


