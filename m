Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BEFDCAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Oct 2025 17:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gBYLck7sv1BMOdUqmPzoyNsNlQSzPw1ty8ON1PfdEmU=; b=f/+6CAoQgg2CgAwYXrwstkPTjl
	kWo4Y3MCr1jC8sI3LiJqr23kopfA4DDkiL2JNBqK6AFkjJrhINkfAnvkQaTVJst5fkn9KDWsmLn/g
	3PnPtbgDGOAQJroxye1FJZszOzZrYgDRwuH3dJzGICh+LTgFFhICH/4R4FvcipVMzeKMlAoGZMuG0
	sy5NrfalCsjQXkqgZsBDqGqg2MYGhplB+1vCKByIG9alfSf214qGGWsziKzXHFVj90K66R9n2Mm3n
	fLTSduIA/V3mp2HPu9w9IDCZ4TEZ29vAGUQYeIbu+hoFB4PrUm0QwAM9sYbPLGpZdFzPPWPrZZOOh
	r0LgNqRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6YJs-00000004PK0-0hrW;
	Wed, 08 Oct 2025 17:51:20 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6YJo-00000004PGn-2eLk;
	Wed, 08 Oct 2025 17:51:18 +0000
Received: from pendragon.ideasonboard.com (82-203-166-19.bb.dnainternet.fi [82.203.166.19])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id DB05AEFE;
	Wed,  8 Oct 2025 19:49:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1759945781;
	bh=WMeeQtK3YO+AKh44/py72TXav7h/l0dcqATYTLzyBjI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lXeLJML8XFLBTETv6GS7ukLCV4jzZRzEql/bGaUb9tGRZvpHVzZ22qOt+f8BC0wKv
	 Y1OliAtWTjReI/6eVoWuWn1/bxL0nvFQAAQ7xKvIjL6yyuqW7zXxP0ZbLTIjqNfCix
	 bJDJdgSgzFZjbMqcZ+x8DfDu/BzuovhCrNqSTKDM=
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
	Arnd Bergmann <arnd@arndb.de>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH 09/25] media: mediatek: vcodec: Drop unneeded v4l2_m2m_get_vq() NULL check
Date: Wed,  8 Oct 2025 20:50:36 +0300
Message-ID: <20251008175052.19925-10-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20251008175052.19925-1-laurent.pinchart@ideasonboard.com>
References: <20251008175052.19925-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_105117_346328_D71BF1EC 
X-CRM114-Status: GOOD (  12.91  )
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

In the set format handler, the check may have been intended to catch
invalid format types, but that's not needed as the V4L2 core picks the
appropriate VIDIOC_S_FMT ioctl handler based on the format type, so the
type can't be incorrect.

In the get format handler, the return value is not used for any purpose
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
 .../platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c     | 7 -------
 .../mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c    | 2 --
 .../mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c    | 2 --
 .../platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c     | 8 --------
 4 files changed, 19 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
index 98838217b97d..a07f878b7c82 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
@@ -674,15 +674,8 @@ static int vidioc_vdec_g_fmt(struct file *file, void *priv,
 {
 	struct mtk_vcodec_dec_ctx *ctx = fh_to_dec_ctx(priv);
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
index a01dc25a7699..f7222c617839 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
+++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
@@ -422,10 +422,6 @@ static int vidioc_venc_s_fmt_cap(struct file *file, void *priv,
 	const struct mtk_video_fmt *fmt;
 
 	vq = v4l2_m2m_get_vq(ctx->m2m_ctx, f->type);
-	if (!vq) {
-		mtk_v4l2_venc_err(ctx, "fail to get vq");
-		return -EINVAL;
-	}
 
 	if (vb2_is_busy(vq)) {
 		mtk_v4l2_venc_err(ctx, "queue busy");
@@ -477,10 +473,6 @@ static int vidioc_venc_s_fmt_out(struct file *file, void *priv,
 	const struct mtk_video_fmt *fmt;
 
 	vq = v4l2_m2m_get_vq(ctx->m2m_ctx, f->type);
-	if (!vq) {
-		mtk_v4l2_venc_err(ctx, "fail to get vq");
-		return -EINVAL;
-	}
 
 	if (vb2_is_busy(vq)) {
 		mtk_v4l2_venc_err(ctx, "queue busy");
-- 
Regards,

Laurent Pinchart


