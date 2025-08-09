Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9A25C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Aug 2025 21:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zwYnLH1YuSIDwsmfwzFly4siTx468UCkJOH6ju1Fqv8=; b=L43eLe4h22JeypcqLfMUk4aplz
	ihq+9F2hso+J9pcE8VMOj2FuPIXhbYcCioaz/Z2/oqtFUscTgWSS5f0ExjXE2Yp2e9veeKYJ+GLkT
	RE0eV9qS+lGVGgPjWNCvsSNDcTLGS66y01hxVsZ0Be/5XMkF8IKUj/v/5icYv57Wr/7dfpgLjyPbx
	wi7zubUomNEEZ5PAlL4D7T5+5RPpq+85JnWWro1dJF8x9K/GEVWFKjMoW8ZCp25mcIZDPI3C+Ehvs
	x+ZMLcqDkOie7/le5SvHJC89Pho3Sq63I4vOgS9YVsRjAt33nZLpmoXHduzedRMa8W4+RMcwMAGYS
	hDrLpG4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukrNp-00000004y8J-262M;
	Sat, 09 Aug 2025 21:45:45 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukqxZ-00000004vsn-2r1o;
	Sat, 09 Aug 2025 21:18:38 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id AED0615B5;
	Sat,  9 Aug 2025 23:17:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754774265;
	bh=uWWtrhvYU2EEvPxj8g8G/xSlAx0/xw2bGYq2TdQvdu8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Eysm6QrdIxQkXyNAdHU8a6JL6pMOB6qi6DM19OPdtYHZqZ7BkD9MWzNuXW1sizdGe
	 N4FqjyV9qjaeMCMV9jUMl4Q0D6d9ywubE77nAHy98gnjMI9XEH4yU7tv9LWMnGbzM6
	 Nxi48FVl9+o5EpzFwtSminUdI1q3u+4Q/I61QIZg=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hans@jjverkuil.nl>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 51/76] media: rockchip: rkvdec: Access v4l2_fh from file
Date: Sun, 10 Aug 2025 00:16:28 +0300
Message-ID: <20250809211654.28887-52-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250809211654.28887-1-laurent.pinchart@ideasonboard.com>
References: <20250809211654.28887-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250809_141837_865949_536799FD 
X-CRM114-Status: GOOD (  10.82  )
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
Reviewed-by: Detlev Casanova <detlev.casanova@collabora.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
Changes since v1:

- Update file-to-ctx macro due to removal of fh-to-ctx macro
---
 drivers/media/platform/rockchip/rkvdec/rkvdec.c | 14 +++++++-------
 drivers/media/platform/rockchip/rkvdec/rkvdec.h |  7 +------
 2 files changed, 8 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index 481c2488f9ac..9fa80ab3c62b 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
@@ -354,7 +354,7 @@ static int rkvdec_try_capture_fmt(struct file *file, void *priv,
 				  struct v4l2_format *f)
 {
 	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
-	struct rkvdec_ctx *ctx = fh_to_rkvdec_ctx(priv);
+	struct rkvdec_ctx *ctx = file_to_rkvdec_ctx(file);
 	const struct rkvdec_coded_fmt_desc *coded_desc;
 
 	/*
@@ -387,7 +387,7 @@ static int rkvdec_try_output_fmt(struct file *file, void *priv,
 				 struct v4l2_format *f)
 {
 	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
-	struct rkvdec_ctx *ctx = fh_to_rkvdec_ctx(priv);
+	struct rkvdec_ctx *ctx = file_to_rkvdec_ctx(file);
 	const struct rkvdec_coded_fmt_desc *desc;
 
 	desc = rkvdec_find_coded_fmt_desc(pix_mp->pixelformat);
@@ -418,7 +418,7 @@ static int rkvdec_try_output_fmt(struct file *file, void *priv,
 static int rkvdec_s_capture_fmt(struct file *file, void *priv,
 				struct v4l2_format *f)
 {
-	struct rkvdec_ctx *ctx = fh_to_rkvdec_ctx(priv);
+	struct rkvdec_ctx *ctx = file_to_rkvdec_ctx(file);
 	struct vb2_queue *vq;
 	int ret;
 
@@ -439,7 +439,7 @@ static int rkvdec_s_capture_fmt(struct file *file, void *priv,
 static int rkvdec_s_output_fmt(struct file *file, void *priv,
 			       struct v4l2_format *f)
 {
-	struct rkvdec_ctx *ctx = fh_to_rkvdec_ctx(priv);
+	struct rkvdec_ctx *ctx = file_to_rkvdec_ctx(file);
 	struct v4l2_m2m_ctx *m2m_ctx = ctx->fh.m2m_ctx;
 	const struct rkvdec_coded_fmt_desc *desc;
 	struct v4l2_format *cap_fmt;
@@ -504,7 +504,7 @@ static int rkvdec_s_output_fmt(struct file *file, void *priv,
 static int rkvdec_g_output_fmt(struct file *file, void *priv,
 			       struct v4l2_format *f)
 {
-	struct rkvdec_ctx *ctx = fh_to_rkvdec_ctx(priv);
+	struct rkvdec_ctx *ctx = file_to_rkvdec_ctx(file);
 
 	*f = ctx->coded_fmt;
 	return 0;
@@ -513,7 +513,7 @@ static int rkvdec_g_output_fmt(struct file *file, void *priv,
 static int rkvdec_g_capture_fmt(struct file *file, void *priv,
 				struct v4l2_format *f)
 {
-	struct rkvdec_ctx *ctx = fh_to_rkvdec_ctx(priv);
+	struct rkvdec_ctx *ctx = file_to_rkvdec_ctx(file);
 
 	*f = ctx->decoded_fmt;
 	return 0;
@@ -532,7 +532,7 @@ static int rkvdec_enum_output_fmt(struct file *file, void *priv,
 static int rkvdec_enum_capture_fmt(struct file *file, void *priv,
 				   struct v4l2_fmtdesc *f)
 {
-	struct rkvdec_ctx *ctx = fh_to_rkvdec_ctx(priv);
+	struct rkvdec_ctx *ctx = file_to_rkvdec_ctx(file);
 	u32 fourcc;
 
 	fourcc = rkvdec_enum_decoded_fmt(ctx, f->index, ctx->image_fmt);
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.h b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
index 3a6322d42b26..481aaa4bffe9 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.h
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
@@ -124,14 +124,9 @@ struct rkvdec_ctx {
 	void *priv;
 };
 
-static inline struct rkvdec_ctx *fh_to_rkvdec_ctx(struct v4l2_fh *fh)
-{
-	return container_of(fh, struct rkvdec_ctx, fh);
-}
-
 static inline struct rkvdec_ctx *file_to_rkvdec_ctx(struct file *filp)
 {
-	return fh_to_rkvdec_ctx(file_to_v4l2_fh(filp));
+	return container_of(file_to_v4l2_fh(filp), struct rkvdec_ctx, fh);
 }
 
 struct rkvdec_aux_buf {
-- 
Regards,

Laurent Pinchart


