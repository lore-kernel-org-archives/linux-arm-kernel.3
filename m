Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C99EE77180
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 15:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zPnaZW02PIP5kcf5Fls7hd76T+YMjlePL2sgbZ052Sc=; b=x8hQTG0JWXbXSoqhTSIrp6z19V
	lKHfJFWzDKEBwKf9+nObxsLyRlXa+lXG/EW+CFMw9XuGfXa1Sg50djveRahnwb6IY/SF7qbp0WzWa
	mV+P5+lHgn36XVnPDNkaWN8sJTXyzg93qfKzbLr1UKZOS5QlfrHVepC70XHvuS5l8wN0iOfgMQEVZ
	3JS9AI6udZKiaDdw6ZtPhjmnUTIea746zckgeeNqXoc964Vgcm89wbHnJfC7KpQYn7ftxQETtd/ra
	G1Hq1DE249ljEDg+4okMdXkKnOZllk0l+ztp9hg7nj+mK9R44mCEl32mUdY8XQX8XC5MaC4Op3HNI
	vtL8Agig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLlRH-00000000onL-0pPU;
	Thu, 12 Dec 2024 15:49:19 +0000
Received: from a7-33.smtp-out.eu-west-1.amazonses.com ([54.240.7.33])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLlLl-00000000nVJ-1m11;
	Thu, 12 Dec 2024 15:43:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=bc7lryepznv65m6r2ewkpoafjt4fiq42; d=collabora.com; t=1734018213;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=BaXocg+MHIdJ5iEhJoO7IWpl2ct1VQ9kpsjJPFAitGM=;
	b=GpY0p13aRAC2pqzDPl8thWNyJ73XW4f1/2KRl/Fa2+CiXNcrtbz9+fR0nuxM5pKh
	6sPgTRukzo7H4IB/gHHZPzTATQoRcFLd0jsTZZjCJukqBFhKhuc4CLClOyG2B9CoOdJ
	/kqJ+l6eWE8AjkaZkPvIUjk81D8sXIJr8uV7EwHMzxucmHvbIGucDgCR+Oyq3G4qexB
	QBfDHZ5x7RH/El+JVanBsUNKxBnnnJEuEW9L8L7+bo1aRVWRofo8jzo5eac4wqAL7aA
	MCp3df5sKmpycfIWNfAO584n+4Ptd0QHST+ndloI+RNW5AGkLW829rmgZCnOjeBUU+1
	WNHguWxCZQ==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1734018213;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
	bh=BaXocg+MHIdJ5iEhJoO7IWpl2ct1VQ9kpsjJPFAitGM=;
	b=EWJGSOPgUvy2agff9iG4gq75WKwbAhclFM0nAcLgkrcgbfT0sV08xLqn6tBPgNcT
	qULgrLKkLJVi3iTXOt73ToJHRvqQbk8Da1Kp74JgksLQIy23yTSdAGbkuoYRhu/dKM/
	LJ8MdS2DFCgS+tpyN8NkAHbPNTYEJqzJAwlvMz4Q=
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: p.zabel@pengutronix.de, mchehab@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: [PATCH v2 1/2] media: verisilicon: Store reference frames pixels format
Date: Thu, 12 Dec 2024 15:43:33 +0000
Message-ID: <01020193bb8a2706-6355fcf8-dd11-4685-8d3f-512a19423599-000000@eu-west-1.amazonses.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241212154328.84904-1-benjamin.gaignard@collabora.com>
References: <20241212154328.84904-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Feedback-ID: ::1.eu-west-1.YpP9ZbxnARFfy3Cb5pfsLd/pdsXBCNK0KEM7HforL4k=:AmazonSES
X-SES-Outgoing: 2024.12.12-54.240.7.33
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_074338_198318_FFE61BC3 
X-CRM114-Status: GOOD (  15.53  )
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

Hantro decoder always produce tiled pixels formats but
when the post-processor is used the destination pixels
format is a non tiled pixels format. This led to compute
wrong reference frame size and offsets.
Getting and saving the correct tiled pixels format for 8
and 10 bit stream solve the computation issues.

Fluster VP9 score increase to 166/305 (vs 145/305).
HEVC score is still 141/147.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
Version 2:
- rebased on top of media-commiter/next
- Add reviewed-by tags

 drivers/media/platform/verisilicon/hantro.h   |  2 ++
 .../media/platform/verisilicon/hantro_g2.c    |  2 +-
 .../platform/verisilicon/hantro_postproc.c    | 32 +++++++------------
 .../media/platform/verisilicon/hantro_v4l2.c  | 21 ++++++++++++
 4 files changed, 35 insertions(+), 22 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro.h b/drivers/media/platform/verisilicon/hantro.h
index 811260dc3c77..14fc6a3e2878 100644
--- a/drivers/media/platform/verisilicon/hantro.h
+++ b/drivers/media/platform/verisilicon/hantro.h
@@ -227,6 +227,7 @@ struct hantro_dev {
  * @src_fmt:		V4L2 pixel format of active source format.
  * @vpu_dst_fmt:	Descriptor of active destination format.
  * @dst_fmt:		V4L2 pixel format of active destination format.
+ * @ref_fmt:		V4L2 pixel format of the reference frames format.
  *
  * @ctrl_handler:	Control handler used to register controls.
  * @jpeg_quality:	User-specified JPEG compression quality.
@@ -255,6 +256,7 @@ struct hantro_ctx {
 	struct v4l2_pix_format_mplane src_fmt;
 	const struct hantro_fmt *vpu_dst_fmt;
 	struct v4l2_pix_format_mplane dst_fmt;
+	struct v4l2_pix_format_mplane ref_fmt;
 
 	struct v4l2_ctrl_handler ctrl_handler;
 	int jpeg_quality;
diff --git a/drivers/media/platform/verisilicon/hantro_g2.c b/drivers/media/platform/verisilicon/hantro_g2.c
index 5c1d799d8618..aae0b562fabb 100644
--- a/drivers/media/platform/verisilicon/hantro_g2.c
+++ b/drivers/media/platform/verisilicon/hantro_g2.c
@@ -47,7 +47,7 @@ irqreturn_t hantro_g2_irq(int irq, void *dev_id)
 
 size_t hantro_g2_chroma_offset(struct hantro_ctx *ctx)
 {
-	return ctx->dst_fmt.width * ctx->dst_fmt.height * ctx->bit_depth / 8;
+	return ctx->ref_fmt.plane_fmt[0].bytesperline *	ctx->ref_fmt.height;
 }
 
 size_t hantro_g2_motion_vectors_offset(struct hantro_ctx *ctx)
diff --git a/drivers/media/platform/verisilicon/hantro_postproc.c b/drivers/media/platform/verisilicon/hantro_postproc.c
index 232c93eea7ee..c435a393e0cb 100644
--- a/drivers/media/platform/verisilicon/hantro_postproc.c
+++ b/drivers/media/platform/verisilicon/hantro_postproc.c
@@ -194,35 +194,25 @@ void hantro_postproc_free(struct hantro_ctx *ctx)
 
 static unsigned int hantro_postproc_buffer_size(struct hantro_ctx *ctx)
 {
-	struct v4l2_pix_format_mplane pix_mp;
-	const struct hantro_fmt *fmt;
 	unsigned int buf_size;
 
-	/* this should always pick native format */
-	fmt = hantro_get_default_fmt(ctx, false, ctx->bit_depth, HANTRO_AUTO_POSTPROC);
-	if (!fmt)
-		return 0;
-
-	v4l2_fill_pixfmt_mp(&pix_mp, fmt->fourcc, ctx->src_fmt.width,
-			    ctx->src_fmt.height);
-
-	buf_size = pix_mp.plane_fmt[0].sizeimage;
+	buf_size = ctx->ref_fmt.plane_fmt[0].sizeimage;
 	if (ctx->vpu_src_fmt->fourcc == V4L2_PIX_FMT_H264_SLICE)
-		buf_size += hantro_h264_mv_size(pix_mp.width,
-						pix_mp.height);
+		buf_size += hantro_h264_mv_size(ctx->ref_fmt.width,
+						ctx->ref_fmt.height);
 	else if (ctx->vpu_src_fmt->fourcc == V4L2_PIX_FMT_VP9_FRAME)
-		buf_size += hantro_vp9_mv_size(pix_mp.width,
-					       pix_mp.height);
+		buf_size += hantro_vp9_mv_size(ctx->ref_fmt.width,
+					       ctx->ref_fmt.height);
 	else if (ctx->vpu_src_fmt->fourcc == V4L2_PIX_FMT_HEVC_SLICE) {
-		buf_size += hantro_hevc_mv_size(pix_mp.width,
-						pix_mp.height);
+		buf_size += hantro_hevc_mv_size(ctx->ref_fmt.width,
+						ctx->ref_fmt.height);
 		if (ctx->hevc_dec.use_compression)
-			buf_size += hantro_hevc_compressed_size(pix_mp.width,
-								pix_mp.height);
+			buf_size += hantro_hevc_compressed_size(ctx->ref_fmt.width,
+								ctx->ref_fmt.height);
 	}
 	else if (ctx->vpu_src_fmt->fourcc == V4L2_PIX_FMT_AV1_FRAME)
-		buf_size += hantro_av1_mv_size(pix_mp.width,
-					       pix_mp.height);
+		buf_size += hantro_av1_mv_size(ctx->ref_fmt.width,
+					       ctx->ref_fmt.height);
 
 	return buf_size;
 }
diff --git a/drivers/media/platform/verisilicon/hantro_v4l2.c b/drivers/media/platform/verisilicon/hantro_v4l2.c
index 2513adfbd825..2bce940a5822 100644
--- a/drivers/media/platform/verisilicon/hantro_v4l2.c
+++ b/drivers/media/platform/verisilicon/hantro_v4l2.c
@@ -126,6 +126,24 @@ hantro_find_format(const struct hantro_ctx *ctx, u32 fourcc)
 	return NULL;
 }
 
+static int
+hantro_set_reference_frames_format(struct hantro_ctx *ctx)
+{
+	const struct hantro_fmt *fmt;
+	int dst_bit_depth = hantro_get_format_depth(ctx->vpu_dst_fmt->fourcc);
+
+	fmt = hantro_get_default_fmt(ctx, false, dst_bit_depth, HANTRO_AUTO_POSTPROC);
+	if (!fmt)
+		return -EINVAL;
+
+	ctx->ref_fmt.width = ctx->src_fmt.width;
+	ctx->ref_fmt.height = ctx->src_fmt.height;
+
+	v4l2_apply_frmsize_constraints(&ctx->ref_fmt.width, &ctx->ref_fmt.height, &fmt->frmsize);
+	return v4l2_fill_pixfmt_mp(&ctx->ref_fmt, fmt->fourcc,
+				   ctx->ref_fmt.width, ctx->ref_fmt.height);
+}
+
 const struct hantro_fmt *
 hantro_get_default_fmt(const struct hantro_ctx *ctx, bool bitstream,
 		       int bit_depth, bool need_postproc)
@@ -595,6 +613,9 @@ static int hantro_set_fmt_cap(struct hantro_ctx *ctx,
 
 	ctx->vpu_dst_fmt = hantro_find_format(ctx, pix_mp->pixelformat);
 	ctx->dst_fmt = *pix_mp;
+	ret = hantro_set_reference_frames_format(ctx);
+	if (ret)
+		return ret;
 
 	/*
 	 * Current raw format might have become invalid with newly
-- 
2.43.0


