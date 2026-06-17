Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17860CD98F3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 18:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S3dOtNy8UnoBFSgngRxTeTjLjAb47u0m87RUJA9qunA=; b=YNHDbvHfLvne6316WE4d284OOl
	OJ4dysFepfh6IzqEJVrnrFgRXBIfShd3PSihWo3O9Y/od3RbeMoEkGYJsxGbSPJ/hM3ZPfg0eJpj3
	u6sH6k/m3D0lshMg/dlmbx8W36zqZQH9odlwyqllS6gFOdLC+aQwkvZYYTL3UkzRCas2Tf77PnYF6
	QIq1qhsCuovBBD1nbHtgs2e5H64lMq5/dS8T+6h1sh9EYQiDO3PJMPLb6cMJQKMVuIMTAqUJHRjou
	He5fFdbw6xBbLvkggqO7wriGfvknMQy3OfhvlDq4/1Za4+DKuQBgNfliqKayrvpjsdc6NAaiKrJJB
	8dgRjp/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZujb-000000009Rg-2ufG;
	Wed, 17 Jun 2026 18:11:31 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZujQ-000000009Ez-1gyj;
	Wed, 17 Jun 2026 18:11:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781719877;
	bh=n1SkJYuM2PtMsbvPGZKz/74m8eLWqsSSeKJl91cyFjw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LtMONZa0UA+4avPvY8Lra9jqCbW6aGGl0wSJklSkL3TgCIGTtGljYu5F9ReJ9K6P5
	 zOsuRfeuHQBlcBXWgFxLeEPHsWuKPTlm9bHp8FcrFHs3VzzLkvABCvYoM+/kvIlGvR
	 Eg1Tkm1eQ8ncoV7k3M4Z1P93hAT7IPlFQtccUmU4cSeIAdwiN65oavbewxfd8ZEQgD
	 vRLgVMh88pN39jIzJ5kNWXZAo1zMzWwre/Nalum+VXChPkSoZ/UAHCIAAivmMBOyDX
	 H23WERbIVKqBglXkzPu86GvgS73i0L4NjHM2pkygjXKXSw5ZCf+8TauPTLskhCT7e8
	 1nRFfipDRyu4g==
Received: from [192.168.0.15] (unknown [100.64.0.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E920917E0CA9;
	Wed, 17 Jun 2026 20:11:15 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
Date: Wed, 17 Jun 2026 14:10:59 -0400
Subject: [PATCH v2 4/5] media: hantro: add per-context fdinfo usage stats
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260617-v4l2-add-fdinfo-v2-4-d298e98ce06a@collabora.com>
References: <20260617-v4l2-add-fdinfo-v2-0-d298e98ce06a@collabora.com>
In-Reply-To: <20260617-v4l2-add-fdinfo-v2-0-d298e98ce06a@collabora.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, kernel@collabora.com, 
 Detlev Casanova <detlev.casanova@collabora.com>, 
 linux-arm-kernel@lists.infradead.org, 
 Christopher Healy <healych@amazon.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_111120_617643_A499936E 
X-CRM114-Status: GOOD (  13.25  )
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

From: Christopher Healy <healych@amazon.com>

Add per-file-descriptor hardware utilization tracking to the Hantro
VPU stateless codec driver, exposed via v4l2_stats.

Update the v4l2_stats instance each time a job completes with the
time it took in ns.

This enables userspace monitoring tools to compute per-process decoder
and encoder utilization. The current and max frequency keys report the
same value today since the driver lacks devfreq support, but will
diverge once DVFS is added, allowing userspace to approximate true
capacity utilization without any fdinfo code changes. A future series
can add hardware cycle counter support (via media-cycles) to v4l2_stats
for exact utilization under DVFS, with no changes to the existing uAPI.

Signed-off-by: Christopher Healy <healych@amazon.com>
Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 drivers/media/platform/verisilicon/hantro.h     |  3 +++
 drivers/media/platform/verisilicon/hantro_drv.c | 19 +++++++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/drivers/media/platform/verisilicon/hantro.h b/drivers/media/platform/verisilicon/hantro.h
index 0353de154a1e..37fd13cc7afa 100644
--- a/drivers/media/platform/verisilicon/hantro.h
+++ b/drivers/media/platform/verisilicon/hantro.h
@@ -16,6 +16,7 @@
 #include <linux/videodev2.h>
 #include <linux/wait.h>
 #include <linux/clk.h>
+#include <linux/ktime.h>
 #include <linux/reset.h>
 
 #include <media/v4l2-ctrls.h>
@@ -268,6 +269,8 @@ struct hantro_ctx {
 	struct hantro_postproc_ctx postproc;
 	bool need_postproc;
 
+	ktime_t start_time;
+
 	/* Specific for particular codec modes. */
 	union {
 		struct hantro_h264_dec_hw_ctx h264_dec;
diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
index 2e81877f640f..3b837ef0f3bc 100644
--- a/drivers/media/platform/verisilicon/hantro_drv.c
+++ b/drivers/media/platform/verisilicon/hantro_drv.c
@@ -21,6 +21,7 @@
 #include <linux/videodev2.h>
 #include <linux/workqueue.h>
 #include <media/v4l2-event.h>
+#include <media/v4l2-stats.h>
 #include <media/v4l2-mem2mem.h>
 #include <media/videobuf2-core.h>
 #include <media/videobuf2-vmalloc.h>
@@ -90,6 +91,9 @@ static void hantro_job_finish(struct hantro_dev *vpu,
 			      struct hantro_ctx *ctx,
 			      enum vb2_buffer_state result)
 {
+	v4l2_stats_update_hw_usage(&ctx->fh.stats,
+				   ktime_to_ns(ktime_sub(ktime_get(), ctx->start_time)));
+
 	pm_runtime_put_autosuspend(vpu->dev);
 
 	clk_bulk_disable(vpu->variant->num_clocks, vpu->clocks);
@@ -186,6 +190,8 @@ static void device_run(void *priv)
 
 	v4l2_m2m_buf_copy_metadata(src, dst);
 
+	ctx->start_time = ktime_get();
+
 	if (ctx->codec_ops->run(ctx))
 		goto err_cancel_job;
 
@@ -664,6 +670,9 @@ static int hantro_open(struct file *filp)
 
 	v4l2_fh_init(&ctx->fh, vdev);
 	v4l2_fh_add(&ctx->fh, filp);
+	v4l2_stats_set_media_dev_type(&ctx->fh.stats,
+				      ctx->is_encoder ? MEDIA_DEV_TYPE_V4L2_STATELESS_ENCODER
+						      : MEDIA_DEV_TYPE_V4L2_STATELESS_DECODER);
 
 	hantro_reset_fmts(ctx);
 
@@ -701,10 +710,20 @@ static int hantro_release(struct file *filp)
 	return 0;
 }
 
+static void hantro_show_fdinfo(struct seq_file *m, struct file *f)
+{
+	struct hantro_ctx *ctx = file_to_ctx(f);
+	struct hantro_dev *vpu = ctx->dev;
+
+	v4l2_stats_show(&ctx->fh.stats, m);
+	v4l2_stats_show_clock(m, vpu->clocks[0].clk);
+}
+
 static const struct v4l2_file_operations hantro_fops = {
 	.owner = THIS_MODULE,
 	.open = hantro_open,
 	.release = hantro_release,
+	.show_fdinfo = hantro_show_fdinfo,
 	.poll = v4l2_m2m_fop_poll,
 	.unlocked_ioctl = video_ioctl2,
 	.mmap = v4l2_m2m_fop_mmap,

-- 
2.54.0


