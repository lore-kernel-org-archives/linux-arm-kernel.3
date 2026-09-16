Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FF63C982C5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 15:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bSNpnl3YoGJtc9BnTit8G19EBus5Id7TAijalgyO3vc=; b=C3s5vEyKuCFG7pY6fRmYlacRpi
	yZxeXj8bP3/v3pDqm0Y6A+5fSe0d29vOV6DPsCiFxri3srwo5e1yA33mSD2vLD7MGFqxnX1+8Dph+
	88LNMBao8acY5SPUKo54L5J588MWD94QC/sht+UyleRsFOQHwZCjbvWwaKpNnqjTbs3mDrOOzBys6
	R5YSoxL7klxh9YlTh5QLwVoNelHblOeWII0T3LJuNtfOgxbqK84pOhJKTL1yyLzHhXtST1DJbIRkB
	jwSaIOc6SIJzWbnKq5uczjm9wG2qDqBDYEp2Vs1RQaTCYIEbcbNR/oSsYFIvaDhaZ0MDJ0QSAKbZF
	sUMtmwWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6rHo-00000009Wbi-0YtU;
	Wed, 16 Sep 2026 15:11:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6rGn-00000009VsR-2rB1;
	Wed, 16 Sep 2026 15:09:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=bSNpnl3YoGJtc9BnTit8G19EBus5Id7TAijalgyO3vc=; b=bl8KL755RX0Mj5lcHBrtp/MSDD
	LNmkz9t6rBAmLKNLsYI5cIhO6CsS2OYSlEHzSEMh+H4Dx+J70i72xOWVdznGWPZsaItOm+/RL7G7E
	j+sHTAm2bveBCkAWN99122kbBoSiR4aBV3DDcU+CZ33uW8YfmPK2N/XoBROtTJq2Avb81n5xfv/lE
	P6aZP8TdnYf/MZ0PIKrphf4ztSCCS6/jXjeGKX0f6xADFO7JFimjgy/jE8Hppl85WqT7pWN5T4Xod
	aBjjDSsWhqG4VzWtz6gOVQtFepo2m1Fis8zofC/nOA1+nKj0a3E8Qa6e+inmp33e0EylzZg0At/io
	PRYneUCA==;
Received: from mx1.white.stw.pengutronix.de ([185.203.200.13])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6rGk-000000081KS-1FzW;
	Wed, 16 Sep 2026 15:09:56 +0000
X-PTX-Original-Recipient: ezequiel@vanguardiasur.com.ar
X-PTX-Original-Recipient: jacob-chen@iotwrt.com
X-PTX-Original-Recipient: mchehab@kernel.org
X-PTX-Original-Recipient: detlev.casanova@collabora.com
X-PTX-Original-Recipient: heiko@sntech.de
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-PTX-Original-Recipient: linux-rockchip@lists.infradead.org
X-PTX-Original-Recipient: lgs201920130244@gmail.com
X-PTX-Original-Recipient: p.zabel@pengutronix.de
X-PTX-Original-Recipient: kernel@pengutronix.de
X-PTX-Original-Recipient: s.pueschel@pengutronix.de
X-PTX-Original-Recipient: m.tretter@pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 2277C2059FA;
	Wed, 16 Sep 2026 17:09:52 +0200 (CEST)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1x6rGi-001Fsx-01;
	Wed, 16 Sep 2026 17:09:52 +0200
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Wed, 16 Sep 2026 17:09:49 +0200
Subject: [PATCH v2 08/17] media: rockchip: rga: move power handling to
 device_run
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260916-spu-rga3multicore-v2-8-23aa2cb74e61@pengutronix.de>
References: <20260916-spu-rga3multicore-v2-0-23aa2cb74e61@pengutronix.de>
In-Reply-To: <20260916-spu-rga3multicore-v2-0-23aa2cb74e61@pengutronix.de>
To: Jacob Chen <jacob-chen@iotwrt.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@pengutronix.de, Detlev Casanova <detlev.casanova@collabora.com>, 
 Michael Tretter <m.tretter@pengutronix.de>, 
 Guangshuo Li <lgs201920130244@gmail.com>, 
 =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_160954_537399_071D9FDE 
X-CRM114-Status: GOOD (  17.18  )
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
v2
- also set autosuspend flag with pm_runtime_use_autosuspend
  (https://sashiko.dev/#/patchset/20260606-spu-rga3multicore-v1-0-3ec2b15675f7%40pengutronix.de?part=6)
---
 drivers/media/platform/rockchip/rga/rga-buf.c | 12 ------------
 drivers/media/platform/rockchip/rga/rga.c     | 13 +++++++++++++
 2 files changed, 13 insertions(+), 12 deletions(-)

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
index d7f0712177b70..c24bc8e26b91e 100644
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
@@ -801,6 +811,9 @@ static int rga_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	pm_runtime_set_autosuspend_delay(rga->dev, 50);
+	pm_runtime_use_autosuspend(rga->dev);
+
 	rga->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(rga->regs))
 		return PTR_ERR(rga->regs);

-- 
2.55.0


