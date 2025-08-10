Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED0FFC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 Aug 2025 01:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XebZD5gfe9RYLBGnJ3wHygAe5NuT+jM+1rDNKkO/ZxM=; b=Ba2LxbJMq7635q3tfFWruP9Lql
	JWr+cH4bUFwpaI++J9YAI/iMMzfyseyJcXi2n60URj29xK2EYguC5xOCY1E7zuVmCp3vh9FX9ipE5
	LxzXbmzU5DFp3/13f4gzFyrVhGH2sqZUYFwsw1jtrQnPL3eMBRRjX3gPCDvdFCzuk468xlZnObG/3
	kN89Z8ppNzSz+bN1US6eld8WkFEM8QJgU0JLCglMFWIbj3VHKaPMf/KiyqsVu62OEkXUH5gpThuGE
	lnajUhtkcbSZz5EJ5DICAvQXmp/mdf/AgSkAAyyWUoYWMKZgYtAyIV3bxmM/MmFelYxcOEWFAClQ8
	4Ra/ZljQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukvGu-000000059cb-3hzo;
	Sun, 10 Aug 2025 01:54:52 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukuvQ-000000057eW-2ZEc
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 Aug 2025 01:32:41 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 87ACE104D;
	Sun, 10 Aug 2025 03:31:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754789508;
	bh=+PbuaC8xIvQc2lZuS6NyqvYPmav84Z8vJv9xYpgkwv4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=g0v/Fws3rohFyfNqCRyDl5W620VC6eInsoYMhvIewceLd9CpZwf7rnsj7dLk7jGW5
	 0kswRxAdKJEU673NR/v1cSelR2FQk5cXFsPQUQZxwy8bN1d3bhZMgrZenwieGSfpXU
	 54auMP5Wiaw/Bf+PheMInPXn9+NgBAuaR5KNEEUw=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Hans Verkuil <hans@jjverkuil.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 47/76] media: imx-isi: Access v4l2_fh from file
Date: Sun, 10 Aug 2025 04:30:29 +0300
Message-ID: <20250810013100.29776-48-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250810013100.29776-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20250810013100.29776-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250809_183240_816269_384374EC 
X-CRM114-Status: UNSURE (   9.84  )
X-CRM114-Notice: Please train this message.
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
 .../media/platform/nxp/imx8-isi/imx8-isi-m2m.c  | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
index 31298307c672..5501214cc6c0 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
@@ -74,14 +74,9 @@ to_isi_m2m_buffer(struct vb2_v4l2_buffer *buf)
 	return container_of(buf, struct mxc_isi_m2m_buffer, buf.vb);
 }
 
-static inline struct mxc_isi_m2m_ctx *to_isi_m2m_ctx(struct v4l2_fh *fh)
-{
-	return container_of(fh, struct mxc_isi_m2m_ctx, fh);
-}
-
 static inline struct mxc_isi_m2m_ctx *file_to_isi_m2m_ctx(struct file *filp)
 {
-	return to_isi_m2m_ctx(file_to_v4l2_fh(filp));
+	return container_of(file_to_v4l2_fh(filp), struct mxc_isi_m2m_ctx, fh);
 }
 
 static inline struct mxc_isi_m2m_ctx_queue_data *
@@ -432,7 +427,7 @@ static int mxc_isi_m2m_try_fmt_vid(struct file *file, void *fh,
 	const enum mxc_isi_video_type type =
 		f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE ?
 		MXC_ISI_VIDEO_M2M_OUT : MXC_ISI_VIDEO_M2M_CAP;
-	struct mxc_isi_m2m_ctx *ctx = to_isi_m2m_ctx(fh);
+	struct mxc_isi_m2m_ctx *ctx = file_to_isi_m2m_ctx(file);
 
 	__mxc_isi_m2m_try_fmt_vid(ctx, &f->fmt.pix_mp, type);
 
@@ -442,7 +437,7 @@ static int mxc_isi_m2m_try_fmt_vid(struct file *file, void *fh,
 static int mxc_isi_m2m_g_fmt_vid(struct file *file, void *fh,
 				 struct v4l2_format *f)
 {
-	struct mxc_isi_m2m_ctx *ctx = to_isi_m2m_ctx(fh);
+	struct mxc_isi_m2m_ctx *ctx = file_to_isi_m2m_ctx(file);
 	const struct mxc_isi_m2m_ctx_queue_data *qdata =
 		mxc_isi_m2m_ctx_qdata(ctx, f->type);
 
@@ -457,7 +452,7 @@ static int mxc_isi_m2m_s_fmt_vid(struct file *file, void *fh,
 	const enum mxc_isi_video_type type =
 		f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE ?
 		MXC_ISI_VIDEO_M2M_OUT : MXC_ISI_VIDEO_M2M_CAP;
-	struct mxc_isi_m2m_ctx *ctx = to_isi_m2m_ctx(fh);
+	struct mxc_isi_m2m_ctx *ctx = file_to_isi_m2m_ctx(file);
 	struct v4l2_pix_format_mplane *pix = &f->fmt.pix_mp;
 	const struct mxc_isi_format_info *info;
 	struct vb2_queue *vq;
@@ -489,7 +484,7 @@ static int mxc_isi_m2m_s_fmt_vid(struct file *file, void *fh,
 static int mxc_isi_m2m_streamon(struct file *file, void *fh,
 				enum v4l2_buf_type type)
 {
-	struct mxc_isi_m2m_ctx *ctx = to_isi_m2m_ctx(fh);
+	struct mxc_isi_m2m_ctx *ctx = file_to_isi_m2m_ctx(file);
 	struct mxc_isi_m2m_ctx_queue_data *q = mxc_isi_m2m_ctx_qdata(ctx, type);
 	const struct v4l2_pix_format_mplane *out_pix = &ctx->queues.out.format;
 	const struct v4l2_pix_format_mplane *cap_pix = &ctx->queues.cap.format;
@@ -577,7 +572,7 @@ static int mxc_isi_m2m_streamon(struct file *file, void *fh,
 static int mxc_isi_m2m_streamoff(struct file *file, void *fh,
 				 enum v4l2_buf_type type)
 {
-	struct mxc_isi_m2m_ctx *ctx = to_isi_m2m_ctx(fh);
+	struct mxc_isi_m2m_ctx *ctx = file_to_isi_m2m_ctx(file);
 	struct mxc_isi_m2m_ctx_queue_data *q = mxc_isi_m2m_ctx_qdata(ctx, type);
 	struct mxc_isi_m2m *m2m = ctx->m2m;
 
-- 
Regards,

Laurent Pinchart


