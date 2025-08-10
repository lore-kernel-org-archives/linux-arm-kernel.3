Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41267C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 Aug 2025 02:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5DHcin9F35uMrgsMBtM34/pxm/lJXyzFawxb03WhbSg=; b=xqWc+7o9EWJG0u/kMh91lCN2SP
	38TL5lWxbPuvpVOZl3M4ZpzCbZ6UJYl+Z3NchAS2iagbXA6y1I9SE/G7isiw5ackItLCu3TdtMl0N
	diPdYf6OX83ManHlF5biWoR6so0+r7VnasYki9hbQMV4Xdx5zb1yachR8dxIwsPGgy73Kr2Jg6jxf
	FN3vsQ0WYScWW8ybuCYsicmSrUUjfPIZXM/Jf3M0s2P8vLk5X07boMj+H8+dpu95geyh5oGAzTsX8
	ywETyz84Hsvai67HxP3Qm7frJ8iao5/+8GUCk0QL767x1AX692p80dahOXLXpj3HWy/pti9738bNc
	MSBn3ldg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukvOP-00000005AI6-0dfU;
	Sun, 10 Aug 2025 02:02:37 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukuvY-000000057ha-2a7z
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 Aug 2025 01:32:49 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 89EBE1121;
	Sun, 10 Aug 2025 03:31:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754789516;
	bh=k4C3/0pnZEw49ZyNQR5zWjsJnuTJz8uTnBt8HMZaE3g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WB9uYaaqC8WyXoEGP33cK4Uv66UuY8j6+oCM/9zke2pRnq9shspMb2LtAstDnScEO
	 984HnpulNAP7aCcSFZilO3X93F9Co8iGMEuQNhZQycggL5AQogs7pTTjE8+ry3Slj6
	 bvOfLcrCEbGTxHJ//ccxO+hU5k8TOiNj/uKxx5EI=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Hans Verkuil <hans@jjverkuil.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH v3 52/76] media: exynos-gsc: Access v4l2_fh from file
Date: Sun, 10 Aug 2025 04:30:34 +0300
Message-ID: <20250810013100.29776-53-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250810013100.29776-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20250810013100.29776-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250809_183248_795325_32994D46 
X-CRM114-Status: GOOD (  12.07  )
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
 .../platform/samsung/exynos-gsc/gsc-core.h    |  4 +---
 .../platform/samsung/exynos-gsc/gsc-m2m.c     | 24 +++++++++----------
 2 files changed, 13 insertions(+), 15 deletions(-)

diff --git a/drivers/media/platform/samsung/exynos-gsc/gsc-core.h b/drivers/media/platform/samsung/exynos-gsc/gsc-core.h
index 56856e9f9baf..265221abf4dc 100644
--- a/drivers/media/platform/samsung/exynos-gsc/gsc-core.h
+++ b/drivers/media/platform/samsung/exynos-gsc/gsc-core.h
@@ -85,8 +85,6 @@ enum gsc_yuv_fmt {
 	GSC_CRCB,
 };
 
-#define fh_to_ctx(__fh) container_of(__fh, struct gsc_ctx, fh)
-
 #define is_rgb(x) (!!((x) & 0x1))
 #define is_yuv420(x) (!!((x) & 0x2))
 #define is_yuv422(x) (!!((x) & 0x4))
@@ -384,7 +382,7 @@ struct gsc_ctx {
 
 static inline struct gsc_ctx *file_to_ctx(struct file *filp)
 {
-	return fh_to_ctx(file_to_v4l2_fh(filp));
+	return container_of(file_to_v4l2_fh(filp), struct gsc_ctx, fh);
 }
 
 void gsc_set_prefbuf(struct gsc_dev *gsc, struct gsc_frame *frm);
diff --git a/drivers/media/platform/samsung/exynos-gsc/gsc-m2m.c b/drivers/media/platform/samsung/exynos-gsc/gsc-m2m.c
index 2999fb2610f0..722e2531e23f 100644
--- a/drivers/media/platform/samsung/exynos-gsc/gsc-m2m.c
+++ b/drivers/media/platform/samsung/exynos-gsc/gsc-m2m.c
@@ -297,7 +297,7 @@ static int gsc_m2m_enum_fmt(struct file *file, void *priv,
 static int gsc_m2m_g_fmt_mplane(struct file *file, void *fh,
 			     struct v4l2_format *f)
 {
-	struct gsc_ctx *ctx = fh_to_ctx(fh);
+	struct gsc_ctx *ctx = file_to_ctx(file);
 
 	return gsc_g_fmt_mplane(ctx, f);
 }
@@ -305,7 +305,7 @@ static int gsc_m2m_g_fmt_mplane(struct file *file, void *fh,
 static int gsc_m2m_try_fmt_mplane(struct file *file, void *fh,
 				  struct v4l2_format *f)
 {
-	struct gsc_ctx *ctx = fh_to_ctx(fh);
+	struct gsc_ctx *ctx = file_to_ctx(file);
 
 	return gsc_try_fmt_mplane(ctx, f);
 }
@@ -313,7 +313,7 @@ static int gsc_m2m_try_fmt_mplane(struct file *file, void *fh,
 static int gsc_m2m_s_fmt_mplane(struct file *file, void *fh,
 				 struct v4l2_format *f)
 {
-	struct gsc_ctx *ctx = fh_to_ctx(fh);
+	struct gsc_ctx *ctx = file_to_ctx(file);
 	struct vb2_queue *vq;
 	struct gsc_frame *frame;
 	struct v4l2_pix_format_mplane *pix;
@@ -359,7 +359,7 @@ static int gsc_m2m_s_fmt_mplane(struct file *file, void *fh,
 static int gsc_m2m_reqbufs(struct file *file, void *fh,
 			  struct v4l2_requestbuffers *reqbufs)
 {
-	struct gsc_ctx *ctx = fh_to_ctx(fh);
+	struct gsc_ctx *ctx = file_to_ctx(file);
 	struct gsc_dev *gsc = ctx->gsc_dev;
 	u32 max_cnt;
 
@@ -374,35 +374,35 @@ static int gsc_m2m_reqbufs(struct file *file, void *fh,
 static int gsc_m2m_expbuf(struct file *file, void *fh,
 				struct v4l2_exportbuffer *eb)
 {
-	struct gsc_ctx *ctx = fh_to_ctx(fh);
+	struct gsc_ctx *ctx = file_to_ctx(file);
 	return v4l2_m2m_expbuf(file, ctx->m2m_ctx, eb);
 }
 
 static int gsc_m2m_querybuf(struct file *file, void *fh,
 					struct v4l2_buffer *buf)
 {
-	struct gsc_ctx *ctx = fh_to_ctx(fh);
+	struct gsc_ctx *ctx = file_to_ctx(file);
 	return v4l2_m2m_querybuf(file, ctx->m2m_ctx, buf);
 }
 
 static int gsc_m2m_qbuf(struct file *file, void *fh,
 			  struct v4l2_buffer *buf)
 {
-	struct gsc_ctx *ctx = fh_to_ctx(fh);
+	struct gsc_ctx *ctx = file_to_ctx(file);
 	return v4l2_m2m_qbuf(file, ctx->m2m_ctx, buf);
 }
 
 static int gsc_m2m_dqbuf(struct file *file, void *fh,
 			   struct v4l2_buffer *buf)
 {
-	struct gsc_ctx *ctx = fh_to_ctx(fh);
+	struct gsc_ctx *ctx = file_to_ctx(file);
 	return v4l2_m2m_dqbuf(file, ctx->m2m_ctx, buf);
 }
 
 static int gsc_m2m_streamon(struct file *file, void *fh,
 			   enum v4l2_buf_type type)
 {
-	struct gsc_ctx *ctx = fh_to_ctx(fh);
+	struct gsc_ctx *ctx = file_to_ctx(file);
 
 	/* The source and target color format need to be set */
 	if (V4L2_TYPE_IS_OUTPUT(type)) {
@@ -418,7 +418,7 @@ static int gsc_m2m_streamon(struct file *file, void *fh,
 static int gsc_m2m_streamoff(struct file *file, void *fh,
 			    enum v4l2_buf_type type)
 {
-	struct gsc_ctx *ctx = fh_to_ctx(fh);
+	struct gsc_ctx *ctx = file_to_ctx(file);
 	return v4l2_m2m_streamoff(file, ctx->m2m_ctx, type);
 }
 
@@ -440,8 +440,8 @@ static int is_rectangle_enclosed(struct v4l2_rect *a, struct v4l2_rect *b)
 static int gsc_m2m_g_selection(struct file *file, void *fh,
 			struct v4l2_selection *s)
 {
+	struct gsc_ctx *ctx = file_to_ctx(file);
 	struct gsc_frame *frame;
-	struct gsc_ctx *ctx = fh_to_ctx(fh);
 
 	if ((s->type != V4L2_BUF_TYPE_VIDEO_CAPTURE) &&
 	    (s->type != V4L2_BUF_TYPE_VIDEO_OUTPUT))
@@ -478,7 +478,7 @@ static int gsc_m2m_s_selection(struct file *file, void *fh,
 				struct v4l2_selection *s)
 {
 	struct gsc_frame *frame;
-	struct gsc_ctx *ctx = fh_to_ctx(fh);
+	struct gsc_ctx *ctx = file_to_ctx(file);
 	struct gsc_variant *variant = ctx->gsc_dev->variant;
 	struct v4l2_selection sel = *s;
 	int ret;
-- 
Regards,

Laurent Pinchart


