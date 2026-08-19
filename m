Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20D3DC5DF8C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 11:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uFs8a0CzhNmyFti/F2HGbwnDzLH/gDnp95hN7uy7ZAY=; b=tu4GQ4Nts5w6TmxwZQU3fyaSSZ
	rbo1owJeSrUwQk46i/DA4SjdRrL8VF9VBQrxDQm23C47Y712+w992z8j/IQRvuCUn/YsJ7kTaM00G
	YMZMg+vQA7UmAA+jfpKIgAIFhSK9J0riXaYI6QBW78RuuFFGB0jvqIwFy/KzFP0BWouMNyDCnTpWa
	3rrzEw/wRhI0Q/Rq4yscSfsrkwhyLCXZfFDN+YqwQOYGbflHHbT4HJA8hK4fW/AnKHRJ6ZCDUppLa
	Sr3m5C3to7g6zU+45U5xTHVgj6m1KjjGe8fSaEd+7017w/N/UqZOpHl7c5pwhndOvBKMGDfARWpxN
	4VGBRn8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwe6x-00000009cMs-1eFi;
	Wed, 19 Aug 2026 11:05:35 +0000
Received: from mx1.white.stw.pengutronix.de ([185.203.200.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwe6i-00000009cAb-2BMt;
	Wed, 19 Aug 2026 11:05:22 +0000
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id F0DFB20227F;
	Wed, 19 Aug 2026 13:05:17 +0200 (CEST)
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1wwe6f-002HRa-2N;
	Wed, 19 Aug 2026 13:05:17 +0200
Received: from [::1] (helo=dude02.red.stw.pengutronix.de)
	by dude02.red.stw.pengutronix.de with esmtp (Exim 4.98.2)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1wwe6f-00000004K0O-2Sxk;
	Wed, 19 Aug 2026 13:05:17 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Wed, 19 Aug 2026 12:37:31 +0200
Subject: [PATCH 2/7] media: verisilicon: Complete the request on the
 ->run() error paths
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260819-rk3588-jpegdec-v1-2-33d74cdf369c@pengutronix.de>
References: <20260819-rk3588-jpegdec-v1-0-33d74cdf369c@pengutronix.de>
In-Reply-To: <20260819-rk3588-jpegdec-v1-0-33d74cdf369c@pengutronix.de>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>, 
 Hans Verkuil <hverkuil@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lucas Sinn <lucas.sinn@wolfvision.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787137517; l=6242;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=q+N1QxJB5EPKH/FAFy+Ua/qwmhUKQ8iu0PuyLy12Oww=;
 b=jDwDnoEVA+fgU+YOlHMQyolvT1mmtBtHqSkdRIh71pZ7N2Y7fejlAy9aFNEasWEG0tn7Q+/5u
 1h4tYFNfPODAZ3Lb+Zu453grnZO1SJfaaRCpFmA+PCEZ9C/xeL0VlB8
X-Developer-Key: i=s.hauer@pengutronix.de; a=ed25519;
 pk=4kuc9ocmECiBJKWxYgqyhtZOHj5AWi7+d0n/UjhkwTg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_040520_748143_1F37AFD6 
X-CRM114-Status: GOOD (  17.05  )
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

Several codec ->run() operations return early without calling
hantro_end_prepare_run(), even though hantro_start_prepare_run() has
already run and set up the controls of the request attached to the source
buffer.

The buffers are still returned to userspace, device_run() finishes the job
with VB2_BUF_STATE_ERROR, but nothing completes the control handler object
bound to the media request. vb2_buffer_done() only unbinds the request
object owned by videobuf2 itself, so num_incomplete_objects never drops to
zero and the request stays in MEDIA_REQUEST_STATE_QUEUED forever: poll() on
the request file descriptor never returns and MEDIA_REQUEST_IOC_REINIT
fails with -EBUSY. The request is only cleaned up when userspace closes it.

The vb2 buf_request_complete() callback does not help here, it is only
called from __vb2_queue_cancel() for buffers that were never queued to the
driver.

Call hantro_end_prepare_run() with the error code on those paths. Since
hantro_end_prepare_run() takes an error argument this completes the request
without arming the watchdog.

Fixes: 42cb2a8f27d2 ("media: hantro: change hantro_codec_ops run prototype to return errors")
Assisted-by: Claude:claude-opus-5
Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/media/platform/verisilicon/hantro_g1_h264_dec.c        | 4 +++-
 drivers/media/platform/verisilicon/hantro_g1_vp8_dec.c         | 4 +++-
 drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c        | 9 +++++++--
 drivers/media/platform/verisilicon/rockchip_vpu2_hw_h264_dec.c | 4 +++-
 drivers/media/platform/verisilicon/rockchip_vpu2_hw_jpeg_enc.c | 4 +++-
 drivers/media/platform/verisilicon/rockchip_vpu2_hw_vp8_dec.c  | 4 +++-
 6 files changed, 22 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro_g1_h264_dec.c b/drivers/media/platform/verisilicon/hantro_g1_h264_dec.c
index 30c2ac32cd0b0..4e1012eeeab6d 100644
--- a/drivers/media/platform/verisilicon/hantro_g1_h264_dec.c
+++ b/drivers/media/platform/verisilicon/hantro_g1_h264_dec.c
@@ -255,8 +255,10 @@ int hantro_g1_h264_dec_run(struct hantro_ctx *ctx)
 
 	/* Prepare the H264 decoder context. */
 	ret = hantro_h264_dec_prepare_run(ctx);
-	if (ret)
+	if (ret) {
+		hantro_end_prepare_run(ctx, ret);
 		return ret;
+	}
 
 	/* Configure hardware registers. */
 	src_buf = hantro_get_src_buf(ctx);
diff --git a/drivers/media/platform/verisilicon/hantro_g1_vp8_dec.c b/drivers/media/platform/verisilicon/hantro_g1_vp8_dec.c
index eb43b2fc19582..a001b37ee1e32 100644
--- a/drivers/media/platform/verisilicon/hantro_g1_vp8_dec.c
+++ b/drivers/media/platform/verisilicon/hantro_g1_vp8_dec.c
@@ -442,8 +442,10 @@ int hantro_g1_vp8_dec_run(struct hantro_ctx *ctx)
 	hantro_start_prepare_run(ctx);
 
 	hdr = hantro_get_ctrl(ctx, V4L2_CID_STATELESS_VP8_FRAME);
-	if (WARN_ON(!hdr))
+	if (WARN_ON(!hdr)) {
+		hantro_end_prepare_run(ctx, -EINVAL);
 		return -EINVAL;
+	}
 
 	/* Reset segment_map buffer in keyframe */
 	if (V4L2_VP8_FRAME_IS_KEY_FRAME(hdr) && ctx->vp8_dec.segment_map.cpu)
diff --git a/drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c b/drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c
index d76d03eeac39d..2093cbe59b837 100644
--- a/drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c
+++ b/drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c
@@ -596,7 +596,7 @@ int hantro_g2_hevc_dec_run(struct hantro_ctx *ctx)
 	/* Prepare HEVC decoder context. */
 	ret = hantro_hevc_dec_prepare_run(ctx);
 	if (ret)
-		return ret;
+		goto end_prepare_run;
 
 	/* Configure hardware registers. */
 	set_params(ctx);
@@ -604,7 +604,7 @@ int hantro_g2_hevc_dec_run(struct hantro_ctx *ctx)
 	/* set reference pictures */
 	ret = set_ref(ctx);
 	if (ret)
-		return ret;
+		goto end_prepare_run;
 
 	set_buffers(ctx);
 	prepare_tile_info_buffer(ctx);
@@ -634,4 +634,9 @@ int hantro_g2_hevc_dec_run(struct hantro_ctx *ctx)
 	vdpu_write(vpu, G2_REG_INTERRUPT_DEC_E, G2_REG_INTERRUPT);
 
 	return 0;
+
+end_prepare_run:
+	hantro_end_prepare_run(ctx, ret);
+
+	return ret;
 }
diff --git a/drivers/media/platform/verisilicon/rockchip_vpu2_hw_h264_dec.c b/drivers/media/platform/verisilicon/rockchip_vpu2_hw_h264_dec.c
index eb9067d56f35d..58b39879de723 100644
--- a/drivers/media/platform/verisilicon/rockchip_vpu2_hw_h264_dec.c
+++ b/drivers/media/platform/verisilicon/rockchip_vpu2_hw_h264_dec.c
@@ -473,8 +473,10 @@ int rockchip_vpu2_h264_dec_run(struct hantro_ctx *ctx)
 
 	/* Prepare the H264 decoder context. */
 	ret = hantro_h264_dec_prepare_run(ctx);
-	if (ret)
+	if (ret) {
+		hantro_end_prepare_run(ctx, ret);
 		return ret;
+	}
 
 	src_buf = hantro_get_src_buf(ctx);
 	set_params(ctx, src_buf);
diff --git a/drivers/media/platform/verisilicon/rockchip_vpu2_hw_jpeg_enc.c b/drivers/media/platform/verisilicon/rockchip_vpu2_hw_jpeg_enc.c
index aa34bd2e47ad2..b273b0b56ced5 100644
--- a/drivers/media/platform/verisilicon/rockchip_vpu2_hw_jpeg_enc.c
+++ b/drivers/media/platform/verisilicon/rockchip_vpu2_hw_jpeg_enc.c
@@ -143,8 +143,10 @@ int rockchip_vpu2_jpeg_enc_run(struct hantro_ctx *ctx)
 
 	memset(&jpeg_ctx, 0, sizeof(jpeg_ctx));
 	jpeg_ctx.buffer = vb2_plane_vaddr(&dst_buf->vb2_buf, 0);
-	if (!jpeg_ctx.buffer)
+	if (!jpeg_ctx.buffer) {
+		hantro_end_prepare_run(ctx, -ENOMEM);
 		return -ENOMEM;
+	}
 
 	jpeg_ctx.width = ctx->dst_fmt.width;
 	jpeg_ctx.height = ctx->dst_fmt.height;
diff --git a/drivers/media/platform/verisilicon/rockchip_vpu2_hw_vp8_dec.c b/drivers/media/platform/verisilicon/rockchip_vpu2_hw_vp8_dec.c
index 6568e2aee80fc..1569e86c23bbf 100644
--- a/drivers/media/platform/verisilicon/rockchip_vpu2_hw_vp8_dec.c
+++ b/drivers/media/platform/verisilicon/rockchip_vpu2_hw_vp8_dec.c
@@ -519,8 +519,10 @@ int rockchip_vpu2_vp8_dec_run(struct hantro_ctx *ctx)
 	hantro_start_prepare_run(ctx);
 
 	hdr = hantro_get_ctrl(ctx, V4L2_CID_STATELESS_VP8_FRAME);
-	if (WARN_ON(!hdr))
+	if (WARN_ON(!hdr)) {
+		hantro_end_prepare_run(ctx, -EINVAL);
 		return -EINVAL;
+	}
 
 	/* Reset segment_map buffer in keyframe */
 	if (V4L2_VP8_FRAME_IS_KEY_FRAME(hdr) && ctx->vp8_dec.segment_map.cpu)

-- 
2.47.3


