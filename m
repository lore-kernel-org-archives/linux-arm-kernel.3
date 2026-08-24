Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1010C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 06:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LzpXl+b3FWngVKy2ZMztRx5RELS/0dE1GIl2/foCu98=; b=kbRRBQMk6AjYtcy8/7ysBJOYd5
	xGe3mTlQG4aaESd0pjNItqYrZ0pOIB6v/ha4Xp3/3LdPObuJ959iultlPfhkRf1Uhu7aSrduVPS77
	NB7cnofGlHhn5yoYnz+Gr/Ps8r1qK7KOsB7qItsyfOxNHzqtZt1v3gM+RyuuQyAVjxeBFbTQ/qJnN
	QRrsMyPFVF2QhKLc1tQbqYUeMTPVk4+DsfhUI91mh4wIKwC7HeN+MogTBkaJr0xG16DICixBKfOXc
	OjVlBm5TkWJg73Bk+0kZRF2gXP+LI9SXZOsPK2kQhvFaoQqMR78+NwbJpj38eFo02cZ1vFlDjkRHX
	qQs0VBBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyOLe-0000000G0fA-0HS6;
	Mon, 24 Aug 2026 06:39:58 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyOLM-0000000G0WM-0opB;
	Mon, 24 Aug 2026 06:39:44 +0000
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id CBB41201AD4;
	Mon, 24 Aug 2026 08:39:35 +0200 (CEST)
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1wyOLH-0033if-2B;
	Mon, 24 Aug 2026 08:39:35 +0200
Received: from [::1] (helo=dude02.red.stw.pengutronix.de)
	by dude02.red.stw.pengutronix.de with esmtp (Exim 4.98.2)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1wyOLH-0000000DClv-26dq;
	Mon, 24 Aug 2026 08:39:35 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Mon, 24 Aug 2026 08:39:36 +0200
Subject: [PATCH 3/3] media: verisilicon: Allow the EOS event to be
 subscribed
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-rk3588-jpegdec-v1-3-180a30a2852d@pengutronix.de>
References: <20260824-rk3588-jpegdec-v1-0-180a30a2852d@pengutronix.de>
In-Reply-To: <20260824-rk3588-jpegdec-v1-0-180a30a2852d@pengutronix.de>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Hans Verkuil <hverkuil@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Sascha Hauer <s.hauer@pengutronix.de>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787553575; l=2637;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=CSDZMDraCixAGdr5N8Azz8zPQA868QAxlWadugj7Sys=;
 b=zIi40BZhFWOQYmFfJkmHHGaGki/pbyuUFglvSD79epaBQRsubEh9/Y7Yn5kw7pXRNk7ALSU0m
 7Oy8gz3DFrxBm2S7h59kv3tcmiGIBFQ8BGNVTW8W2bShsZxEx5xFUwI
X-Developer-Key: i=s.hauer@pengutronix.de; a=ed25519;
 pk=4kuc9ocmECiBJKWxYgqyhtZOHj5AWi7+d0n/UjhkwTg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260823_233940_534294_2DC26B77 
X-CRM114-Status: GOOD (  15.02  )
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

hantro queues a V4L2_EVENT_EOS in three places.  vidioc_encoder_cmd()
sends it when a V4L2_ENC_CMD_STOP has drained the encoder:

	if (ec->cmd == V4L2_ENC_CMD_STOP &&
	    v4l2_m2m_has_stopped(ctx->fh.m2m_ctx))
		v4l2_event_queue_fh(&ctx->fh, &hantro_eos_event);

hantro_buf_queue() sends it for a capture buffer queued after the last
one, and hantro_stop_streaming() when the output queue stops while
draining.

No application can ask for any of them.  The ioctl ops offer

	.vidioc_subscribe_event = v4l2_ctrl_subscribe_event,

and v4l2_ctrl_subscribe_event() only knows about V4L2_EVENT_CTRL, so
VIDIOC_SUBSCRIBE_EVENT for V4L2_EVENT_EOS fails with -EINVAL and the
queued events are dropped on the floor.  An application following the
drain sequence in the stateful encoder documentation has to fall back to
V4L2_BUF_FLAG_LAST, which hantro does set, so this has gone unnoticed.

Dispatch on the event type and hand V4L2_EVENT_EOS to
v4l2_event_subscribe(), the way coda-common.c does.  Everything else
keeps going to the control handler.

V4L2_EVENT_SOURCE_CHANGE is deliberately not added, hantro never sends
one.

Fixes: daf3999c12dc ("media: hantro: Implement support for encoder commands")
Assisted-by: Claude:claude-opus-5
Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/media/platform/verisilicon/hantro_v4l2.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/verisilicon/hantro_v4l2.c b/drivers/media/platform/verisilicon/hantro_v4l2.c
index 83af9fa1ce949..9e19daffe0075 100644
--- a/drivers/media/platform/verisilicon/hantro_v4l2.c
+++ b/drivers/media/platform/verisilicon/hantro_v4l2.c
@@ -765,6 +765,17 @@ static int vidioc_encoder_cmd(struct file *file, void *priv,
 	return 0;
 }
 
+static int hantro_subscribe_event(struct v4l2_fh *fh,
+				  const struct v4l2_event_subscription *sub)
+{
+	switch (sub->type) {
+	case V4L2_EVENT_EOS:
+		return v4l2_event_subscribe(fh, sub, 0, NULL);
+	default:
+		return v4l2_ctrl_subscribe_event(fh, sub);
+	}
+}
+
 const struct v4l2_ioctl_ops hantro_ioctl_ops = {
 	.vidioc_querycap = vidioc_querycap,
 	.vidioc_enum_framesizes = vidioc_enum_framesizes,
@@ -787,7 +798,7 @@ const struct v4l2_ioctl_ops hantro_ioctl_ops = {
 	.vidioc_remove_bufs = v4l2_m2m_ioctl_remove_bufs,
 	.vidioc_expbuf = v4l2_m2m_ioctl_expbuf,
 
-	.vidioc_subscribe_event = v4l2_ctrl_subscribe_event,
+	.vidioc_subscribe_event = hantro_subscribe_event,
 	.vidioc_unsubscribe_event = v4l2_event_unsubscribe,
 
 	.vidioc_streamon = v4l2_m2m_ioctl_streamon,

-- 
2.47.3


