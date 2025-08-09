Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DB6CC87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Aug 2025 21:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xQHCzkSJaRc1R8YgGTF4R/QCFl6OqQTW+ykgsLPdXoQ=; b=EW2PxOftUUfb/0H+H7jtD/1uo/
	Q8HJqxRZp09wo8HMvL+Ggeng8sCoNo7+DWeR3E+Zfmp/M2Y1TogTsqeprGRKsWvtEU40DhqUsW/gb
	cCBbpWuThuf2GcTcGbLhLIYOLHSYyRz/x+Gx/E3FlDus5oG390pNyzXJJw7rySUuymNldVS1V6mri
	HaXaL0vYRRdg+zNYH+wOFz6M9ocx3h+fOyyhGByS2qNT8+tTa0qm3/s0Wv2B7PngRjRncgADsqoJ7
	oonEwpgh4M/pDj9agqJY29LaPf9f7XAhrZS+FfVIf9Ik1nTnU2GxxIy+MYNL9icMxOfh6AiW10+1Z
	5YxIu1SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukr8w-00000004xD7-13fV;
	Sat, 09 Aug 2025 21:30:22 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukqxK-00000004voc-3b2D;
	Sat, 09 Aug 2025 21:18:24 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id E39761440;
	Sat,  9 Aug 2025 23:17:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754774251;
	bh=QUmyUP7KPuvFSGt3TNQ5G2VNNjAJ0nl3CUpyOjF2oX8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZWqxgoLVqvSw1rtOErHL90duDjLEhAIDSUmoR9e+IPVscyvr7gXu7fwGFbvJpBnr7
	 9vqMyxGi+p1n5kEOKSjniV1Zf2cj4ZUyQo5tPw5mJoPl8Ig5fkbbQhZxJUvWTtl069
	 PFnx4/p7nj/+logutP4QBGOY1VNj/IDPFsF49rdg=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hans@jjverkuil.nl>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
	Houlong Wei <houlong.wei@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 42/76] media: mtk_mdp_m2m: Access v4l2_fh from file
Date: Sun, 10 Aug 2025 00:16:19 +0300
Message-ID: <20250809211654.28887-43-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250809211654.28887-1-laurent.pinchart@ideasonboard.com>
References: <20250809211654.28887-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250809_141823_034243_7AFCD436 
X-CRM114-Status: GOOD (  10.80  )
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

From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

The v4l2_fh associated with an open file handle is now guaranteed
to be available in file->private_data, initialised by v4l2_fh_add().

Access the v4l2_fh, and from there the driver-specific structure,
from the file * in all ioctl handlers.

Co-developed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
Changes since v1:

- Update file-to-ctx macro due to removal of fh-to-ctx macro
---
 .../media/platform/mediatek/mdp/mtk_mdp_m2m.c | 23 ++++++++-----------
 1 file changed, 9 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c b/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c
index 7e89a8443707..03c07948dfdd 100644
--- a/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c
+++ b/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c
@@ -348,14 +348,9 @@ static int mtk_mdp_try_crop(struct mtk_mdp_ctx *ctx, u32 type,
 	return 0;
 }
 
-static inline struct mtk_mdp_ctx *fh_to_ctx(struct v4l2_fh *fh)
-{
-	return container_of(fh, struct mtk_mdp_ctx, fh);
-}
-
 static inline struct mtk_mdp_ctx *file_to_ctx(struct file *filp)
 {
-	return fh_to_ctx(file_to_v4l2_fh(filp));
+	return container_of(file_to_v4l2_fh(filp), struct mtk_mdp_ctx, fh);
 }
 
 static inline struct mtk_mdp_ctx *ctrl_to_ctx(struct v4l2_ctrl *ctrl)
@@ -594,7 +589,7 @@ static const struct vb2_ops mtk_mdp_m2m_qops = {
 static int mtk_mdp_m2m_querycap(struct file *file, void *fh,
 				struct v4l2_capability *cap)
 {
-	struct mtk_mdp_ctx *ctx = fh_to_ctx(fh);
+	struct mtk_mdp_ctx *ctx = file_to_ctx(file);
 	struct mtk_mdp_dev *mdp = ctx->mdp_dev;
 
 	strscpy(cap->driver, MTK_MDP_MODULE_NAME, sizeof(cap->driver));
@@ -632,7 +627,7 @@ static int mtk_mdp_m2m_enum_fmt_vid_out(struct file *file, void *priv,
 static int mtk_mdp_m2m_g_fmt_mplane(struct file *file, void *fh,
 				    struct v4l2_format *f)
 {
-	struct mtk_mdp_ctx *ctx = fh_to_ctx(fh);
+	struct mtk_mdp_ctx *ctx = file_to_ctx(file);
 	struct mtk_mdp_frame *frame;
 	struct v4l2_pix_format_mplane *pix_mp;
 	int i;
@@ -671,7 +666,7 @@ static int mtk_mdp_m2m_g_fmt_mplane(struct file *file, void *fh,
 static int mtk_mdp_m2m_try_fmt_mplane(struct file *file, void *fh,
 				      struct v4l2_format *f)
 {
-	struct mtk_mdp_ctx *ctx = fh_to_ctx(fh);
+	struct mtk_mdp_ctx *ctx = file_to_ctx(file);
 
 	if (!mtk_mdp_try_fmt_mplane(ctx, f))
 		return -EINVAL;
@@ -681,7 +676,7 @@ static int mtk_mdp_m2m_try_fmt_mplane(struct file *file, void *fh,
 static int mtk_mdp_m2m_s_fmt_mplane(struct file *file, void *fh,
 				    struct v4l2_format *f)
 {
-	struct mtk_mdp_ctx *ctx = fh_to_ctx(fh);
+	struct mtk_mdp_ctx *ctx = file_to_ctx(file);
 	struct vb2_queue *vq;
 	struct mtk_mdp_frame *frame;
 	struct v4l2_pix_format_mplane *pix_mp;
@@ -727,7 +722,7 @@ static int mtk_mdp_m2m_s_fmt_mplane(struct file *file, void *fh,
 static int mtk_mdp_m2m_reqbufs(struct file *file, void *fh,
 			       struct v4l2_requestbuffers *reqbufs)
 {
-	struct mtk_mdp_ctx *ctx = fh_to_ctx(fh);
+	struct mtk_mdp_ctx *ctx = file_to_ctx(file);
 
 	return v4l2_m2m_reqbufs(file, ctx->m2m_ctx, reqbufs);
 }
@@ -735,7 +730,7 @@ static int mtk_mdp_m2m_reqbufs(struct file *file, void *fh,
 static int mtk_mdp_m2m_streamon(struct file *file, void *fh,
 				enum v4l2_buf_type type)
 {
-	struct mtk_mdp_ctx *ctx = fh_to_ctx(fh);
+	struct mtk_mdp_ctx *ctx = file_to_ctx(file);
 	int ret;
 
 	if (!mtk_mdp_ctx_state_is_set(ctx, MTK_MDP_VPU_INIT)) {
@@ -773,8 +768,8 @@ static inline bool mtk_mdp_is_target_crop(u32 target)
 static int mtk_mdp_m2m_g_selection(struct file *file, void *fh,
 				       struct v4l2_selection *s)
 {
+	struct mtk_mdp_ctx *ctx = file_to_ctx(file);
 	struct mtk_mdp_frame *frame;
-	struct mtk_mdp_ctx *ctx = fh_to_ctx(fh);
 	bool valid = false;
 
 	if (s->type == V4L2_BUF_TYPE_VIDEO_CAPTURE) {
@@ -840,8 +835,8 @@ static int mtk_mdp_check_scaler_ratio(struct mtk_mdp_variant *var, int src_w,
 static int mtk_mdp_m2m_s_selection(struct file *file, void *fh,
 				   struct v4l2_selection *s)
 {
+	struct mtk_mdp_ctx *ctx = file_to_ctx(file);
 	struct mtk_mdp_frame *frame;
-	struct mtk_mdp_ctx *ctx = fh_to_ctx(fh);
 	struct v4l2_rect new_r;
 	struct mtk_mdp_variant *variant = ctx->mdp_dev->variant;
 	int ret;
-- 
Regards,

Laurent Pinchart


