Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66A79C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 Aug 2025 01:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sjS9P8TpqRxiurbKmtABEangmp3PoxKilfWki9gAUuo=; b=qyrytFNNqaz6r7dRAePtP0KcHy
	f8voPmq8+PhAqX2K4TOrsItRJCdPcTcP04qTDtBa/GSrbnR/Kp0hgrcdns8wQOYV9Xfi0P/SVs8N1
	Ub1JCt/pp6znN6swFMfHG3rThVayt/WYmuSNsSRnrfZgnodCprETXrOSgzvUNi4+akL/bvpQ/oFQ3
	gkJNlKkKsStRR5YHV6TNFKHTpoy/OXK85Ywmjs8J46h/QbTLQ0+nZBFDp2ra+0q3LAUggfOLraGRB
	IMv70bSZYSoVG3m7Es/TCPgZt2ijKt/41aDBWkK/nm4XuBtfS3CNxSK9M1KhPFKJryHe9tD2JtaEj
	xIdG2muw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukv4S-000000058tO-0tAM;
	Sun, 10 Aug 2025 01:42:00 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukuvG-000000057aW-3CJR;
	Sun, 10 Aug 2025 01:32:32 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id A6CBD104D;
	Sun, 10 Aug 2025 03:31:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754789498;
	bh=9lmvYyOYztL02CeNZX+3xsDeVzk4qhTGGo4MAk7g7zE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eTwyup11RNxcIQnRk180JYNAmUjuNiE/vFA4VJ4ZxZ6DrnZ7FI4fO3O9OlIiH9335
	 MSkealOmqzCzVuXcWsro5AyOmGEaSunfh8MXUcUZlS+AANtX6MAU04xNDpcKnQWPJ3
	 L7etgHokItfjG+uixCVhB2bvP3ORB15RRYU0c63s=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Hans Verkuil <hans@jjverkuil.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Bin Liu <bin.liu@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3 41/76] media: mtk: jpeg: Access v4l2_fh from file->private_data
Date: Sun, 10 Aug 2025 04:30:23 +0300
Message-ID: <20250810013100.29776-42-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250810013100.29776-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20250810013100.29776-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250809_183230_940406_C0C2310E 
X-CRM114-Status: GOOD (  10.33  )
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

From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

The v4l2_fh associated with an open file handle is now guaranteed
to be available in file->private_data, initialised by v4l2_fh_add().

Access the v4l2_fh, and from there the driver-specific structure,
from the file * in all ioctl handlers.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Co-developed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
Changes since v1:

- Update file-to-ctx macro due to removal of fh-to-ctx macro
---
 .../platform/mediatek/jpeg/mtk_jpeg_core.c    | 29 ++++++++-----------
 1 file changed, 12 insertions(+), 17 deletions(-)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index de15d6f0b490..6268d651bdcf 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -119,14 +119,9 @@ static inline struct mtk_jpeg_ctx *ctrl_to_ctx(struct v4l2_ctrl *ctrl)
 	return container_of(ctrl->handler, struct mtk_jpeg_ctx, ctrl_hdl);
 }
 
-static inline struct mtk_jpeg_ctx *mtk_jpeg_fh_to_ctx(struct v4l2_fh *fh)
-{
-	return container_of(fh, struct mtk_jpeg_ctx, fh);
-}
-
 static inline struct mtk_jpeg_ctx *mtk_jpeg_file_to_ctx(struct file *filp)
 {
-	return mtk_jpeg_fh_to_ctx(file_to_v4l2_fh(filp));
+	return container_of(file_to_v4l2_fh(filp), struct mtk_jpeg_ctx, fh);
 }
 
 static inline struct mtk_jpeg_src_buf *mtk_jpeg_vb2_to_srcbuf(
@@ -217,7 +212,7 @@ static int mtk_jpeg_enum_fmt(struct mtk_jpeg_fmt *mtk_jpeg_formats, int n,
 static int mtk_jpeg_enum_fmt_vid_cap(struct file *file, void *priv,
 				     struct v4l2_fmtdesc *f)
 {
-	struct mtk_jpeg_ctx *ctx = mtk_jpeg_fh_to_ctx(priv);
+	struct mtk_jpeg_ctx *ctx = mtk_jpeg_file_to_ctx(file);
 	struct mtk_jpeg_dev *jpeg = ctx->jpeg;
 
 	return mtk_jpeg_enum_fmt(jpeg->variant->formats,
@@ -228,7 +223,7 @@ static int mtk_jpeg_enum_fmt_vid_cap(struct file *file, void *priv,
 static int mtk_jpeg_enum_fmt_vid_out(struct file *file, void *priv,
 				     struct v4l2_fmtdesc *f)
 {
-	struct mtk_jpeg_ctx *ctx = mtk_jpeg_fh_to_ctx(priv);
+	struct mtk_jpeg_ctx *ctx = mtk_jpeg_file_to_ctx(file);
 	struct mtk_jpeg_dev *jpeg = ctx->jpeg;
 
 	return mtk_jpeg_enum_fmt(jpeg->variant->formats,
@@ -310,7 +305,7 @@ static int mtk_jpeg_g_fmt_vid_mplane(struct file *file, void *priv,
 	struct vb2_queue *vq;
 	struct mtk_jpeg_q_data *q_data = NULL;
 	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
-	struct mtk_jpeg_ctx *ctx = mtk_jpeg_fh_to_ctx(priv);
+	struct mtk_jpeg_ctx *ctx = mtk_jpeg_file_to_ctx(file);
 	struct mtk_jpeg_dev *jpeg = ctx->jpeg;
 	int i;
 
@@ -356,7 +351,7 @@ static int mtk_jpeg_g_fmt_vid_mplane(struct file *file, void *priv,
 static int mtk_jpeg_try_fmt_vid_cap_mplane(struct file *file, void *priv,
 					   struct v4l2_format *f)
 {
-	struct mtk_jpeg_ctx *ctx = mtk_jpeg_fh_to_ctx(priv);
+	struct mtk_jpeg_ctx *ctx = mtk_jpeg_file_to_ctx(file);
 	struct mtk_jpeg_dev *jpeg = ctx->jpeg;
 	struct mtk_jpeg_fmt *fmt;
 
@@ -385,7 +380,7 @@ static int mtk_jpeg_try_fmt_vid_cap_mplane(struct file *file, void *priv,
 static int mtk_jpeg_try_fmt_vid_out_mplane(struct file *file, void *priv,
 					   struct v4l2_format *f)
 {
-	struct mtk_jpeg_ctx *ctx = mtk_jpeg_fh_to_ctx(priv);
+	struct mtk_jpeg_ctx *ctx = mtk_jpeg_file_to_ctx(file);
 	struct mtk_jpeg_dev *jpeg = ctx->jpeg;
 	struct mtk_jpeg_fmt *fmt;
 
@@ -475,7 +470,7 @@ static int mtk_jpeg_s_fmt_vid_out_mplane(struct file *file, void *priv,
 	if (ret)
 		return ret;
 
-	return mtk_jpeg_s_fmt_mplane(mtk_jpeg_fh_to_ctx(priv), f,
+	return mtk_jpeg_s_fmt_mplane(mtk_jpeg_file_to_ctx(file), f,
 				     MTK_JPEG_FMT_FLAG_OUTPUT);
 }
 
@@ -488,7 +483,7 @@ static int mtk_jpeg_s_fmt_vid_cap_mplane(struct file *file, void *priv,
 	if (ret)
 		return ret;
 
-	return mtk_jpeg_s_fmt_mplane(mtk_jpeg_fh_to_ctx(priv), f,
+	return mtk_jpeg_s_fmt_mplane(mtk_jpeg_file_to_ctx(file), f,
 				     MTK_JPEG_FMT_FLAG_CAPTURE);
 }
 
@@ -517,7 +512,7 @@ static int mtk_jpeg_subscribe_event(struct v4l2_fh *fh,
 static int mtk_jpeg_enc_g_selection(struct file *file, void *priv,
 				    struct v4l2_selection *s)
 {
-	struct mtk_jpeg_ctx *ctx = mtk_jpeg_fh_to_ctx(priv);
+	struct mtk_jpeg_ctx *ctx = mtk_jpeg_file_to_ctx(file);
 
 	if (s->type != V4L2_BUF_TYPE_VIDEO_OUTPUT)
 		return -EINVAL;
@@ -542,7 +537,7 @@ static int mtk_jpeg_enc_g_selection(struct file *file, void *priv,
 static int mtk_jpeg_dec_g_selection(struct file *file, void *priv,
 				    struct v4l2_selection *s)
 {
-	struct mtk_jpeg_ctx *ctx = mtk_jpeg_fh_to_ctx(priv);
+	struct mtk_jpeg_ctx *ctx = mtk_jpeg_file_to_ctx(file);
 
 	if (s->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
 		return -EINVAL;
@@ -571,7 +566,7 @@ static int mtk_jpeg_dec_g_selection(struct file *file, void *priv,
 static int mtk_jpeg_enc_s_selection(struct file *file, void *priv,
 				    struct v4l2_selection *s)
 {
-	struct mtk_jpeg_ctx *ctx = mtk_jpeg_fh_to_ctx(priv);
+	struct mtk_jpeg_ctx *ctx = mtk_jpeg_file_to_ctx(file);
 
 	if (s->type != V4L2_BUF_TYPE_VIDEO_OUTPUT)
 		return -EINVAL;
@@ -594,7 +589,7 @@ static int mtk_jpeg_enc_s_selection(struct file *file, void *priv,
 static int mtk_jpeg_qbuf(struct file *file, void *priv, struct v4l2_buffer *buf)
 {
 	struct v4l2_fh *fh = file_to_v4l2_fh(file);
-	struct mtk_jpeg_ctx *ctx = mtk_jpeg_fh_to_ctx(priv);
+	struct mtk_jpeg_ctx *ctx = mtk_jpeg_file_to_ctx(file);
 	struct vb2_queue *vq;
 	struct vb2_buffer *vb;
 	struct mtk_jpeg_src_buf *jpeg_src_buf;
-- 
Regards,

Laurent Pinchart


