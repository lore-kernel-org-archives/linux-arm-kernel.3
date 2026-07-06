Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75B19C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 13:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GCm2NOc4vWw+31gj/Ag1rs2/KHxagKNe31eFduqcDX0=; b=mON3JUYDDzK/DxYKBJJCR71urZ
	GjcFjKc/2M290XX6EsNQn1ayyQJgM5RGrn6qUIMUCh4ys/KfojxO4c7fymDuuTs+b3GH92+EnCz+a
	T6kaSXKbePYLWhQdEj9CM6kEyxTaMx8TzGMDg3PqYr+Is9cW0lufgv8Gavsn8JygGjb0OAuHaEaVL
	lrawqhypoIc4tCkclunebWHqyN4zCzlx3Eh5z2rhMsSJbPQ/UCZltn+OkcALjVxGrAYukGGcO/HcC
	WlxHWBydnR45FyvQ5fU9ZstTz3+j4k+DXcq6TAZBRNVbm5svvlnq1K+UR3AT2Xm/Qw2/ZDV8lfGLY
	rHam8YcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgjas-0000000CdIi-08dz;
	Mon, 06 Jul 2026 13:42:42 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgjap-0000000CdDI-0XrX;
	Mon, 06 Jul 2026 13:42:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783345356;
	bh=U44aJJ8b4BbdxcO2Vi5B2hjqvUSwUvpArxdIxZ0VMJA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=WYNpXFY/02XAa1AqZ6hQYizozKt15Ei/m141irZHQvlO6IXa2PNc0G9AD/1qqzTwt
	 r0W6iv4WGiNPzqWOvkpXLDdKWfmJ34xzMCLfMzl3uabKvIwgN1M/HMc0IVAOxNuz4S
	 LmfwSqt8tJJkFklx2z65KEtaUECd0WVb+o2dwQkUqztRxaELeEhCjxrtcP+3n3Rgho
	 EPtaMVdfPeOLDv2MdwMmBogAvtMZvLn/PPmssYqarNFIAg9Twcmgdn2LZvan9NzBZB
	 E+4Q1aybHQNCv+HkTnN7gX/+C5kLaF8aa6Yu1BcfbWARCRvbyyOLtNG3Dc5XHK2AXs
	 DNE83NQS8Fc5g==
Received: from [192.168.0.15] (unknown [100.64.0.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 62CF817E0D33;
	Mon, 06 Jul 2026 15:42:35 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
Date: Mon, 06 Jul 2026 09:42:22 -0400
Subject: [PATCH v3 5/5] media: rkvdec: Add per-context fdinfo usage metrics
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-v4l2-add-fdinfo-v3-5-d556568cf38e@collabora.com>
References: <20260706-v4l2-add-fdinfo-v3-0-d556568cf38e@collabora.com>
In-Reply-To: <20260706-v4l2-add-fdinfo-v3-0-d556568cf38e@collabora.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, kernel@collabora.com, 
 Detlev Casanova <detlev.casanova@collabora.com>, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_064239_354981_D9D20CE0 
X-CRM114-Status: GOOD (  13.29  )
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

Add hardware utilization tracking to the rkvdec stateless codec driver,
exposed via v4l2_metrics.

Update the v4l2_metrics instance each time a job completes with the
time it took in ns.

This enables userspace monitoring tools to compute per-process decoder
and encoder utilization. The current and max frequency keys report the
same value today since the driver lacks devfreq support, but will
diverge once DVFS is added, allowing userspace to approximate true
capacity utilization without any fdinfo code changes.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 drivers/media/platform/rockchip/rkvdec/rkvdec.c | 19 +++++++++++++++++++
 drivers/media/platform/rockchip/rkvdec/rkvdec.h |  1 +
 2 files changed, 20 insertions(+)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index 1d1e9bfef8e9..0451d9582273 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
@@ -25,6 +25,7 @@
 #include <linux/workqueue.h>
 #include <media/v4l2-event.h>
 #include <media/v4l2-mem2mem.h>
+#include <media/v4l2-metrics.h>
 #include <media/videobuf2-core.h>
 #include <media/videobuf2-vmalloc.h>
 
@@ -1094,6 +1095,9 @@ static void rkvdec_job_finish(struct rkvdec_ctx *ctx,
 {
 	struct rkvdec_dev *rkvdec = ctx->dev;
 
+	v4l2_metrics_update_hw_time(&ctx->fh.metrics,
+				   ktime_to_ns(ktime_sub(ktime_get(), ctx->start_time)));
+
 	pm_runtime_put_autosuspend(rkvdec->dev);
 	rkvdec_job_finish_no_pm(ctx, result);
 }
@@ -1174,6 +1178,8 @@ static void rkvdec_device_run(void *priv)
 		return;
 	}
 
+	ctx->start_time = ktime_get();
+
 	ret = desc->ops->run(ctx);
 	if (ret)
 		rkvdec_job_finish(ctx, VB2_BUF_STATE_ERROR);
@@ -1304,6 +1310,8 @@ static int rkvdec_open(struct file *filp)
 
 	v4l2_fh_add(&ctx->fh, filp);
 
+	v4l2_metrics_set_driver_type(&ctx->fh.metrics, V4L2_DRIVER_TYPE_STATELESS_DECODER);
+
 	return 0;
 
 err_cleanup_m2m_ctx:
@@ -1327,10 +1335,21 @@ static int rkvdec_release(struct file *filp)
 	return 0;
 }
 
+static void rkvdec_show_fdinfo(struct seq_file *m, struct file *file)
+{
+	struct rkvdec_ctx *ctx = file_to_rkvdec_ctx(file);
+	struct rkvdec_dev *rkvdec = ctx->dev;
+
+	v4l2_metrics_show(&ctx->fh.metrics, m, 0);
+
+	v4l2_metrics_show_clock(m, rkvdec->axi_clk, 0);
+}
+
 static const struct v4l2_file_operations rkvdec_fops = {
 	.owner = THIS_MODULE,
 	.open = rkvdec_open,
 	.release = rkvdec_release,
+	.show_fdinfo = rkvdec_show_fdinfo,
 	.poll = v4l2_m2m_fop_poll,
 	.unlocked_ioctl = video_ioctl2,
 	.mmap = v4l2_m2m_fop_mmap,
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.h b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
index a24be6638b6b..590e213bd800 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.h
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
@@ -157,6 +157,7 @@ struct rkvdec_ctx {
 	void *priv;
 	u8 has_sps_st_rps: 1;
 	u8 has_sps_lt_rps: 1;
+	ktime_t start_time;
 };
 
 static inline struct rkvdec_ctx *file_to_rkvdec_ctx(struct file *filp)

-- 
2.54.0


