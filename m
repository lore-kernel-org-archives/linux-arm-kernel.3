Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F273DCD6E6E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 22:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YskUxxS/ZoAl+6eSFA2U84FQf5UdFptbgxV9+fGlYRs=; b=jUfrAD6uEto+N3G359dujKQtnR
	1y9THw51/a8khHtDNaa82+muOQ7c7J+Wlu7Z4B2YSyzAIC27giKFzllJ5793X7CM3FszyFD3Eou2o
	1ZrTr17cWlgjYyymyYkBlf8G3Iqb9HkcH8f4xypTPW7OBcIr5L/iLOdU7Aqe5syM57z9HoRiAsRwm
	zZ1RDAKOsYf56cQXdUw1029xY0MSYDog8J6uQZpN+Lbxlldo0d5bvR0+rvc+4S1mhI177ydl0+UmM
	uGAWh945+MisBX9Af17rkDGPtUaeDiaYdMBMJz017jQyVBNI8U/Qop6W8tmpIncn+bHiFZQ1aSHJe
	dX3D2nMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVcik-00000001FOp-0duP;
	Fri, 05 Jun 2026 22:08:54 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVciZ-00000001Evk-3vHm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 22:08:45 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1wVci5-0000LW-3d; Sat, 06 Jun 2026 00:08:13 +0200
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Sat, 06 Jun 2026 00:06:52 +0200
Subject: [PATCH 06/17] media: rockchip: rga: move power handling to
 device_run
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260606-spu-rga3multicore-v1-6-3ec2b15675f7@pengutronix.de>
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
X-CRM114-CacheID: sfid-20260605_150844_025257_3062FDA6 
X-CRM114-Status: GOOD (  16.86  )
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

Move the power handling to the device_run function in preparation for
enabling multiple cores. This allows to power the only the necessary cores
instead of powering all available cores.

As the decision on which core the given job is executed will be done in
device_run, we can only power to correct core there.

To avoid unpowering the core in a streaming state switch to autosuspend.
This avoids powering down the core when the next frame is scheduled in
the next 50ms. The timeout maps to a framerate of 20fps, which should be
pretty uncommon in a normal video stream.

Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
---
 drivers/media/platform/rockchip/rga/rga-buf.c | 12 ------------
 drivers/media/platform/rockchip/rga/rga.c     | 11 +++++++++++
 2 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/rockchip/rga/rga-buf.c b/drivers/media/platform/rockchip/rga/rga-buf.c
index c0ea6003336bf..3f7c3c68e0cb8 100644
--- a/drivers/media/platform/rockchip/rga/rga-buf.c
+++ b/drivers/media/platform/rockchip/rga/rga-buf.c
@@ -242,14 +242,6 @@ static int rga_buf_prepare_streaming(struct vb2_queue *q)
 static int rga_buf_start_streaming(struct vb2_queue *q, unsigned int count)
 {
 	struct rga_ctx *ctx = vb2_get_drv_priv(q);
-	struct rockchip_rga *rga = ctx->rga;
-	int ret;
-
-	ret = pm_runtime_resume_and_get(rga->dev);
-	if (ret < 0) {
-		rga_buf_return_buffers(q, VB2_BUF_STATE_QUEUED);
-		return ret;
-	}
 
 	if (V4L2_TYPE_IS_OUTPUT(q->type))
 		ctx->osequence = 0;
@@ -261,11 +253,7 @@ static int rga_buf_start_streaming(struct vb2_queue *q, unsigned int count)
 
 static void rga_buf_stop_streaming(struct vb2_queue *q)
 {
-	struct rga_ctx *ctx = vb2_get_drv_priv(q);
-	struct rockchip_rga *rga = ctx->rga;
-
 	rga_buf_return_buffers(q, VB2_BUF_STATE_ERROR);
-	pm_runtime_put(rga->dev);
 }
 
 const struct vb2_ops rga_qops = {
diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index 8c03422d669cf..0eff558d7f133 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -37,6 +37,14 @@ static void device_run(void *prv)
 	struct rockchip_rga *rga = ctx->rga;
 	struct vb2_v4l2_buffer *src, *dst;
 	unsigned long flags;
+	int ret;
+
+	ret = pm_runtime_resume_and_get(rga->dev);
+	if (ret < 0) {
+		v4l2_m2m_buf_done_and_job_finish(rga->m2m_dev, ctx->fh.m2m_ctx,
+						 VB2_BUF_STATE_ERROR);
+		return;
+	}
 
 	spin_lock_irqsave(&rga->ctrl_lock, flags);
 	if (ctx->cmdbuf_dirty) {
@@ -81,6 +89,8 @@ static irqreturn_t rga_isr(int irq, void *prv)
 		v4l2_m2m_buf_done(src, VB2_BUF_STATE_DONE);
 		v4l2_m2m_buf_done(dst, VB2_BUF_STATE_DONE);
 		v4l2_m2m_job_finish(rga->m2m_dev, ctx->fh.m2m_ctx);
+
+		pm_runtime_put_autosuspend(rga->dev);
 	}
 
 	return IRQ_HANDLED;
@@ -797,6 +807,7 @@ static int rga_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(&pdev->dev, ret, "Unable to parse OF data\n");
 
+	pm_runtime_set_autosuspend_delay(rga->dev, 50);
 	pm_runtime_enable(rga->dev);
 
 	rga->regs = devm_platform_ioremap_resource(pdev, 0);

-- 
2.54.0


