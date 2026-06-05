Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 695A2CD8C86
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 22:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z2ZjXtysM/ZX/YdUEc/R7n+zL9i2l3Lo8xFQ9+8Az78=; b=oUc20rXFyZ9eYwuPQToqKyVRT3
	hubI8oA5koOG+uIKyIdVHyyaVKQgabhkBVcVXIUyJsGTj3QnAoplzRlQMk/ZYE7Dc+hlqnlVhZmB/
	Yr1P4czlHPM79U52H7L3HkuYsw6edRzi5mCz/Y3Gb46XukS04ZOiUrNSo0/NT0EZMZb/rWR1QrjQH
	NO40vdN/0itNck0QEh/L5zCNk6o4tXdy6Ifh7SHsAgPEu8PycJeZBy+5vHYpsuBh4MOg4L2BeMikD
	9GePKlaRUjC7U3hU9D3Pj/o4uPARmsJ/cTkqePREr1Y4grw3UAqqnL2rcFDDxfITa1VD57iyyRA4L
	EGecFQNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVciX-00000001Eqo-0hRt;
	Fri, 05 Jun 2026 22:08:41 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVciQ-00000001EW4-02jN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 22:08:36 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1wVciE-0000LW-Ht; Sat, 06 Jun 2026 00:08:22 +0200
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Sat, 06 Jun 2026 00:07:01 +0200
Subject: [PATCH 15/17] media: rockchip: rga: schedule jobs to multiple
 cores
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260606-spu-rga3multicore-v1-15-3ec2b15675f7@pengutronix.de>
References: <20260606-spu-rga3multicore-v1-0-3ec2b15675f7@pengutronix.de>
In-Reply-To: <20260606-spu-rga3multicore-v1-0-3ec2b15675f7@pengutronix.de>
To: Jacob Chen <jacob-chen@iotwrt.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@pengutronix.de, Detlev Casanova <detlev.casanova@collabora.com>, 
 Michael Tretter <m.tretter@pengutronix.de>, 
 =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
X-Mailer: b4 0.15.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.pueschel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_150834_095920_A8D4F221 
X-CRM114-Status: GOOD (  15.99  )
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

Schedule jobs to multiple cores to utilize all RGA cores. To avoid race
conditions when selecting the next free core a dedicated spinlock is added.

Note that this doesn't increase the max frame rate of a single
stream, as a context will wait for the job to finish before starting
the next device_run call.

Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
---
 drivers/media/platform/rockchip/rga/rga.c | 22 +++++++++++++++++++---
 drivers/media/platform/rockchip/rga/rga.h |  1 +
 2 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index 9cebb461b3fd2..f00b7f99f2521 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -38,15 +38,31 @@ static void device_run(void *prv)
 {
 	struct rga_ctx *ctx = prv;
 	struct rockchip_rga *rga = ctx->rga;
-	struct rga_core *core = rga->cores[0];
+	struct rga_core *core = NULL;
 	struct vb2_v4l2_buffer *src, *dst;
 	unsigned long flags;
 	int ret;
+	unsigned int i;
+
+	spin_lock_irqsave(&rga->cores_lock, flags);
+	for (i = 0; i < rga->num_cores; i++) {
+		if (!rga->cores[i]->curr) {
+			core = rga->cores[i];
+			core->curr = ctx;
+			break;
+		}
+	}
+	spin_unlock_irqrestore(&rga->cores_lock, flags);
+
+	WARN_ONCE(!core, "No free core although max parallel jobs matches the core count!\n");
+	if (!core)
+		return;
 
 	ret = pm_runtime_resume_and_get(core->dev);
 	if (ret < 0) {
 		v4l2_m2m_buf_done_and_job_finish(rga->m2m_dev, ctx->fh.m2m_ctx,
 						 VB2_BUF_STATE_ERROR);
+		core->curr = NULL;
 		return;
 	}
 
@@ -58,8 +74,6 @@ static void device_run(void *prv)
 	}
 	spin_unlock_irqrestore(&rga->ctrl_lock, flags);
 
-	core->curr = ctx;
-
 	src = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
 	src->sequence = ctx->osequence++;
 
@@ -946,6 +960,7 @@ static int rga_bind(struct device *dev)
 		ret = PTR_ERR(rga->m2m_dev);
 		goto rel_vdev;
 	}
+	v4l2_m2m_set_max_parallel_jobs(rga->m2m_dev, rga->num_cores);
 
 	ret = video_register_device(vfd, VFL_TYPE_VIDEO, -1);
 	if (ret) {
@@ -1021,6 +1036,7 @@ static int rga_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, -ENODEV, "failed to get match data\n");
 
 	spin_lock_init(&rga->ctrl_lock);
+	spin_lock_init(&rga->cores_lock);
 	mutex_init(&rga->mutex);
 
 	dev_set_drvdata(dev, rga);
diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/platform/rockchip/rga/rga.h
index 6237436b984eb..c0dfacdb6f212 100644
--- a/drivers/media/platform/rockchip/rga/rga.h
+++ b/drivers/media/platform/rockchip/rga/rga.h
@@ -85,6 +85,7 @@ struct rockchip_rga {
 	struct mutex mutex;
 	/* ctrl parm lock */
 	spinlock_t ctrl_lock;
+	spinlock_t cores_lock;
 
 	const struct rga_hw *hw;
 

-- 
2.54.0


