Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CB97EE3695
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 16:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5MZZcYNSoONZAezZHJIv9jcwrQmtSBeHfynzQYe5h2g=; b=D1fxzFjiFXGDudQjlalW/fXUIa
	eEnV0u8oMJRd22zSf5R0KXQGvBaeiVbQVRtUjvhBC/qU/uwFh/3YW/8iQ+4wZSiKHCNZZutxl+p1R
	g9oA9vqYwcQkfVu0elxqHAZhigy8dYZTgszLNunHEKiWzwKJUMEjDL1ho2cNHxf7EY9OJeR9YTmPM
	0Cuxdy6tps/D0Y9fP1czcpTjTaRSmFeEIMt7QKxKi7rncBEMLm5obUcEK8TYriA1B12StVFGN7Hjs
	poZlZ1mlo6msx08FkeME8DgNFbvfgQkvNKcgekFvd4F5fpJwtR16feEaaboqd+DJpq34hIgBhVyzW
	BMOZ5f4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqZUN-00000002LsJ-3WoB;
	Thu, 12 Feb 2026 16:24:23 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqZUG-00000002LgN-3YbN;
	Thu, 12 Feb 2026 16:24:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770913453;
	bh=EgY6rRozA0nftZszqOZUvhTiePvvlTkScGicAmL6ngk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=I/El3T4P0xovkgMTWcwcUXRdgkb5x/Jtnuc437sudcJIWdnjlnXYE41volTkySBfe
	 g7jQRcLsGl/6alBEVCexl9s9fNPtON5QVNL73QcPbYHGdDtI2xmR/0NTAl9fXhJD97
	 qFgkabxP+3rZGcrSj/VLHSKhIhAq7nLVYZzkjHJ1vCw1IqG+/MV1hueucPtyb6z0Ib
	 6JJCp4vP4H9d182O5pN+LiOzLutxAzCRJr2Iv2W1tiEb3dXrCcmuYPMCgXKDOukGs9
	 CiNst9RRZQqTFC8aF46h8zMFj8HeWJ7xWZO/9c9oit/M9SXY9Hz5RaDDX0zYuBPuZD
	 0q/HX4jCb7KJw==
Received: from trenzalore (modemcable014.2-22-96.mc.videotron.ca [96.22.2.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A672017E0A49;
	Thu, 12 Feb 2026 17:24:10 +0100 (CET)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Yunke Cao <yunkec@google.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Pavan Bobba <opensource206@gmail.com>,
	James Cowgill <james.cowgill@blaize.com>,
	Ma Ke <make24@iscas.ac.cn>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH 11/11] media: hantro: Add fdinfo callback
Date: Thu, 12 Feb 2026 11:23:28 -0500
Message-ID: <20260212162328.192217-12-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260212162328.192217-1-detlev.casanova@collabora.com>
References: <20260212162328.192217-1-detlev.casanova@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_082417_149520_5F5D2D7D 
X-CRM114-Status: GOOD (  16.17  )
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

The fdinfo shows the number of buffers in each queue and the total amount
of video buffer memory.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 drivers/media/platform/verisilicon/hantro.h      |  1 +
 drivers/media/platform/verisilicon/hantro_drv.c  | 15 +++++++++++++++
 drivers/media/platform/verisilicon/hantro_v4l2.c | 10 +++++++++-
 3 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/verisilicon/hantro.h b/drivers/media/platform/verisilicon/hantro.h
index d5cddc783688..9e9fc0658586 100644
--- a/drivers/media/platform/verisilicon/hantro.h
+++ b/drivers/media/platform/verisilicon/hantro.h
@@ -268,6 +268,7 @@ struct hantro_ctx {
 	const struct hantro_codec_ops *codec_ops;
 	struct hantro_postproc_ctx postproc;
 	bool need_postproc;
+	u64 stats_buf_memory;
 
 	/* Specific for particular codec modes. */
 	union {
diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
index 8dd26ca32459..86d316a8a3e8 100644
--- a/drivers/media/platform/verisilicon/hantro_drv.c
+++ b/drivers/media/platform/verisilicon/hantro_drv.c
@@ -17,6 +17,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm.h>
 #include <linux/pm_runtime.h>
+#include <linux/seq_file.h>
 #include <linux/slab.h>
 #include <linux/videodev2.h>
 #include <linux/workqueue.h>
@@ -711,6 +712,19 @@ static int hantro_release(struct file *filp)
 	return 0;
 }
 
+static void hantro_show_fdinfo(struct seq_file *m, struct file *filp)
+{
+	struct hantro_ctx *ctx =
+		container_of(filp->private_data, struct hantro_ctx, fh);
+
+	struct vb2_queue *src_q = v4l2_m2m_get_src_vq(ctx->fh.m2m_ctx);
+	struct vb2_queue *dst_q = v4l2_m2m_get_dst_vq(ctx->fh.m2m_ctx);
+
+	seq_printf(m, "src-queued-count: %04u\n", src_q->queued_count);
+	seq_printf(m, "dst-queued-count: %04u\n", dst_q->queued_count);
+	seq_printf(m, "buf-size: %llu\n", ctx->stats_buf_memory);
+}
+
 static const struct v4l2_file_operations hantro_fops = {
 	.owner = THIS_MODULE,
 	.open = hantro_open,
@@ -718,6 +732,7 @@ static const struct v4l2_file_operations hantro_fops = {
 	.poll = v4l2_m2m_fop_poll,
 	.unlocked_ioctl = video_ioctl2,
 	.mmap = v4l2_m2m_fop_mmap,
+	.show_fdinfo = hantro_show_fdinfo,
 };
 
 static const struct of_device_id of_hantro_match[] = {
diff --git a/drivers/media/platform/verisilicon/hantro_v4l2.c b/drivers/media/platform/verisilicon/hantro_v4l2.c
index fcf3bd9bcda2..6d129613ea3d 100644
--- a/drivers/media/platform/verisilicon/hantro_v4l2.c
+++ b/drivers/media/platform/verisilicon/hantro_v4l2.c
@@ -820,18 +820,26 @@ hantro_queue_setup(struct vb2_queue *vq, unsigned int *num_buffers,
 		return -EINVAL;
 	}
 
+	ctx->stats_buf_memory = 0;
+
 	if (*num_planes) {
 		if (*num_planes != pixfmt->num_planes)
 			return -EINVAL;
-		for (i = 0; i < pixfmt->num_planes; ++i)
+		for (i = 0; i < pixfmt->num_planes; ++i) {
 			if (sizes[i] < pixfmt->plane_fmt[i].sizeimage)
 				return -EINVAL;
+			ctx->stats_buf_memory += pixfmt->plane_fmt[i].sizeimage;
+		}
+
+		ctx->stats_buf_memory *= *num_buffers;
+
 		return 0;
 	}
 
 	*num_planes = pixfmt->num_planes;
 	for (i = 0; i < pixfmt->num_planes; ++i)
 		sizes[i] = pixfmt->plane_fmt[i].sizeimage;
+
 	return 0;
 }
 
-- 
2.53.0


