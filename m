Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BFD3CA0EF8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 20:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DIcJXdY0bFOT+K5fxLDoNnlzrIjJ8KNGGAkp25jXns0=; b=dtBomZ+zBbo+od2Wexu7+b53nm
	nZ+JNHrKT0wCtOrF+zBtF2gpDU+imW469zrF8wMFXGt1JBy0wU6X03pJ/dNnNAfrtetVlPJlCz9QC
	aAQSBQBAuuPjkp1s1oHL5lr0flaK3LQNaR5S16ObWbeKpIdG4cXzvZrT7WtX0ExTXS3RsVJrdWpwQ
	YHLaDuX5fJPWMr+kNXyyKghbqa2uPMp+v4DVurMFbxLRwXOe5GxoaQxwr8dWIZaSUG8gAf5IEgcQe
	sakbK6KUPEqbONjVHBnPyTQ1tZuN/jg/F9mSgaBIwpARO4TiPUvyrXsNebefpui9zI2pjBBJweQ3q
	Utvt9IHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uopmD-0000000EuMa-17A5;
	Wed, 20 Aug 2025 20:51:21 +0000
Received: from mout-p-102.mailbox.org ([2001:67c:2050:0:465::102])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uolhB-0000000EOsu-23CO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 16:29:54 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4c6X3g5FF9z9vMs;
	Wed, 20 Aug 2025 18:29:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1755707391;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DIcJXdY0bFOT+K5fxLDoNnlzrIjJ8KNGGAkp25jXns0=;
	b=VFHsKdWNItDfUTvE68vx6ei2gdB20WBIeJlmbaKup6cmFzcRD8QWEgrK+SGoaiXJHmG2Kd
	iPdTMXgh0iDZBEqRzh+lzFUQsLlFbdaI4YYdbyUSGapWXPr7Mwt/Br2ZOGPHDY2batxBJj
	xzU2Qd6kUsnwFanbkjS4vqeklbUbI7dyJwkb9ANNx0xa1Vz03usMt41iTWKbOEP08L5M82
	yF6vAmsFJL4n9rTTFw6mOZgTMS16h3vTnTVzI/onWO3/fnrzMb3OG/E2EW7VzWlK1eoGZi
	qVHnMkZA+Tmya7YqOi+93RiwTcBevd6Dp6/H1Pe8eE7yci6S0OnCVcwA6/YKfw==
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1755707389;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DIcJXdY0bFOT+K5fxLDoNnlzrIjJ8KNGGAkp25jXns0=;
	b=OvTKxUqt4oP+waZA2q9EhhmDKB6kUFOnsF8WZvqfopnmsjvcnLndZmFlH8c5+90wr08PtV
	nC386+xfxenQrMjLPB1NZqCdXxy8n6EGS5cw7N4nyHU19qx10TVTB0mTn8CPLG+oZRRYTZ
	Rdw+EafXbCx5009LvywQkxKWEVM1qimYteBmHSTrko0HOo+FTVMXJMD287PB1aTg2BlnQc
	szwsG+XWyy9fblqBNHa5a3zIA/p11ZUc7oPLDJdYfpfVTEZMDNUQqTKVCRtRynkKO3da5r
	akyy3NgNYSRiu2SY8zfd6xKx3GGd2HdaeCh+PH74cCkdA/cWgSNIB8C3sJ2MkQ==
To: linux-media@vger.kernel.org
Cc: Marek Vasut <marek.vasut@mailbox.org>,
	Fabio Estevam <festevam@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Ming Qian <ming.qian@oss.nxp.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] media: imx-jpeg: Fix JPEG encoder ready race condition
Date: Wed, 20 Aug 2025 18:29:25 +0200
Message-ID: <20250820162938.209892-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 1ff6a9bf43c2ac3d2b1
X-MBO-RS-META: di1e7ameqb8sumcpdd3daidariamhnpu
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_092953_670125_1CE2DB3A 
X-CRM114-Status: GOOD (  17.50  )
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

The current mxc_jpeg_job_ready() implementation works for JPEG decode
side of this IP, it does not work at all for the JPEG encode side. The
JPEG encode side does not change ctx->source_change at all, therefore
the mxc_jpeg_source_change() always returns right away and the encode
side somehow works.

However, this is susceptible to a race condition between mxc_jpeg_dec_irq()
and mxc_jpeg_start_streaming(), where mxc_jpeg_start_streaming() might
start decoding another frame before mxc_jpeg_dec_irq() indicates completion
of encoding of current frame. Add new state, MXC_JPEG_ENC_DONE, which is
set in three locations, first when streaming starts to indicate the encoder
is ready to start processing a frame, second in mxc_jpeg_dec_irq() when the
encoder finishes encoding current frame, and third in mxc_jpeg_dec_irq() in
case of an error so the encoder can proceed with encoding another frame.

Update mxc_jpeg_job_ready() to check whether the encoder is in this new
MXC_JPEG_ENC_DONE state before reporting the encoder is ready to encode
new frame.

Fixes: b4e1fb8643da ("media: imx-jpeg: Support dynamic resolution change")
Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
---
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Ming Qian <ming.qian@oss.nxp.com>
Cc: Mirela Rabulea <mirela.rabulea@nxp.com>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-media@vger.kernel.org
---
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c | 18 ++++++++++++++++--
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h |  1 +
 2 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
index df3ccdf767baf..aef1d6473eb8d 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
@@ -1009,6 +1009,7 @@ static irqreturn_t mxc_jpeg_dec_irq(int irq, void *priv)
 
 		dev_err(dev, "Encoder/decoder error, dec_ret = 0x%08x, status=0x%08x",
 			dec_ret, ret);
+		ctx->enc_state = MXC_JPEG_ENC_DONE;
 		mxc_jpeg_clr_desc(reg, slot);
 		mxc_jpeg_sw_reset(reg);
 		buf_state = VB2_BUF_STATE_ERROR;
@@ -1062,9 +1063,16 @@ static irqreturn_t mxc_jpeg_dec_irq(int irq, void *priv)
 
 buffers_done:
 	mxc_jpeg_job_finish(ctx, buf_state, false);
-	spin_unlock(&jpeg->hw_lock);
 	cancel_delayed_work(&ctx->task_timer);
+
+	if (jpeg->mode == MXC_JPEG_ENCODE && ctx->enc_state == MXC_JPEG_ENCODING)
+		ctx->enc_state = MXC_JPEG_ENC_DONE;
+
 	v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
+
+	spin_unlock(&jpeg->hw_lock);
+
+
 	return IRQ_HANDLED;
 job_unlock:
 	spin_unlock(&jpeg->hw_lock);
@@ -1488,8 +1496,12 @@ static bool mxc_jpeg_source_change(struct mxc_jpeg_ctx *ctx,
 static int mxc_jpeg_job_ready(void *priv)
 {
 	struct mxc_jpeg_ctx *ctx = priv;
+	struct mxc_jpeg_dev *jpeg = ctx->mxc_jpeg;
 
-	return ctx->source_change ? 0 : 1;
+	if (jpeg->mode == MXC_JPEG_ENCODE)
+		return ctx->enc_state == MXC_JPEG_ENC_DONE;
+	else
+		return ctx->source_change ? 0 : 1;
 }
 
 static void mxc_jpeg_device_run_timeout(struct work_struct *work)
@@ -1713,6 +1725,8 @@ static int mxc_jpeg_start_streaming(struct vb2_queue *q, unsigned int count)
 
 	if (ctx->mxc_jpeg->mode == MXC_JPEG_DECODE && V4L2_TYPE_IS_CAPTURE(q->type))
 		ctx->source_change = 0;
+	if (ctx->mxc_jpeg->mode == MXC_JPEG_ENCODE)
+		ctx->enc_state = MXC_JPEG_ENC_DONE;
 	dev_dbg(ctx->mxc_jpeg->dev, "Start streaming ctx=%p", ctx);
 	q_data->sequence = 0;
 
diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h
index 44e46face6d1d..7f0910fc9b47e 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h
@@ -35,6 +35,7 @@
 enum mxc_jpeg_enc_state {
 	MXC_JPEG_ENCODING	= 0, /* jpeg encode phase */
 	MXC_JPEG_ENC_CONF	= 1, /* jpeg encoder config phase */
+	MXC_JPEG_ENC_DONE	= 2, /* jpeg encoder done/ready phase */
 };
 
 enum mxc_jpeg_mode {
-- 
2.50.1


