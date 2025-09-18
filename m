Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 058BDCA1013
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 14:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JbFHMHpTkKU6yPK8q5jKbhj8eJ6a6WeM1NQfXhEQTMc=; b=lmVyeUrKlKN2r+YTAOhMt4D8lq
	mJKqYOFHUg920mkhmhqDiOdSanbIvwUa4WAm/3nzwMqEJJ0S0QKl93EJ1FSepUnxh9geqqEm+0aDd
	OEN+iGiIt6MVYxNjTcXtLa2Ogg785kRqoGUu3PsBF7QzNVKFf18jauywzzF+QCn7T1Jup1hgK2cbZ
	l6zfAJDN81X4j9Gt+EheofW8f2jdaoCVZ1YSYQ45GGJuS+HN8t4+/OKG78kDnXI4jmWwApUM75XBI
	07kZGLynP3caHgxM3YN8bKAnh1no1m4MrMOUOm9ZYV3q31db2XeEufk+J7n/DiYUWROya7OcmnGeL
	xrcCFIVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzG63-00000000EsG-3nhM;
	Thu, 18 Sep 2025 14:58:55 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzG61-00000000EpR-3rqN;
	Thu, 18 Sep 2025 14:58:55 +0000
Received: from ideasonboard.com (unknown [IPv6:2a00:6020:448c:6c00:ace3:d2c2:5eff:9cc5])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 251B9842;
	Thu, 18 Sep 2025 16:57:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1758207449;
	bh=cPGO1N9WZ9kh/g+Cn2Z/DFMLIdDurxeSbmeWGZt6UBI=;
	h=From:To:Cc:Subject:Date:From;
	b=EWbX6WutkR6zJM6u6Jpw5XmGbWKE6MV4icwXgi/M2KYPL/mpxSRD87/VDB/edeNv/
	 QlukMfq8c11HZZpo+9k9tII6fNDjJ1Xovy1UY54MAmSZfXDoEricVIPedtfVLIq0im
	 stsxKpxCzTLtz8lGTRRb6M4hXgE8qfZvYTRJBx8E=
From: Stefan Klug <stefan.klug@ideasonboard.com>
To: linux-media@vger.kernel.org,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Stefan Klug <stefan.klug@ideasonboard.com>,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] media: rkisp1: Improve frame sequence correctness on stats and params buffers
Date: Thu, 18 Sep 2025 16:54:33 +0200
Message-ID: <20250918145504.111428-2-stefan.klug@ideasonboard.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_075854_099395_B87972B0 
X-CRM114-Status: GOOD (  21.79  )
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

On the rkisp1 (in my case on a NXP i.MX8 M Plus) the ISP interrupt
handler is sometimes called with RKISP1_CIF_ISP_V_START (start of frame)
and RKISP1_CIF_ISP_FRAME (end of frame) being set at the same time. In
commit 8524fa22fd2f ("media: staging: rkisp1: isp: add a warning and
debugfs var for irq delay") a warning was added for that. There are two
cases where this condition can occur:

1. The v-sync and the frame-end belong to the same frame. This means,
   the irq was heavily delayed and the warning is likely appropriate.

2. The v-sync belongs to the next frame. This can happen if the vertical
   blanking between two frames is very short.

The current code always handles case 1 although case 2 is in my
experience the more common case and happens in regular usage. This leads
to incorrect sequence numbers on stats and params buffers which in turn
breaks the regulation in user space. Fix that by adding a frame_active
flag to distinguish between these cases and handle the start of frame
either at the beginning or at the end of the rkisp1_isp_isr().

Signed-off-by: Stefan Klug <stefan.klug@ideasonboard.com>

---

Hi all,

Here is an updated version of the patch with some fixes from the review.

Changes in v2:
- Removed test for !frame_active in second v_start handler
- Improved comments

Best regards,
Stefan

---
 .../platform/rockchip/rkisp1/rkisp1-common.h  |  1 +
 .../platform/rockchip/rkisp1/rkisp1-isp.c     | 27 +++++++++++++++----
 2 files changed, 23 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
index ca952fd0829b..adf23416de9a 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
@@ -222,6 +222,7 @@ struct rkisp1_isp {
 	struct media_pad pads[RKISP1_ISP_PAD_MAX];
 	const struct rkisp1_mbus_info *sink_fmt;
 	__u32 frame_sequence;
+	bool frame_active;
 };
 
 /*
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
index 8c29a1c9309a..2e49764d6262 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
@@ -965,6 +965,7 @@ static int rkisp1_isp_s_stream(struct v4l2_subdev *sd, int enable)
 	}
 
 	isp->frame_sequence = -1;
+	isp->frame_active = false;
 
 	sd_state = v4l2_subdev_lock_and_get_active_state(sd);
 
@@ -1086,12 +1087,15 @@ void rkisp1_isp_unregister(struct rkisp1_device *rkisp1)
  * Interrupt handlers
  */
 
-static void rkisp1_isp_queue_event_sof(struct rkisp1_isp *isp)
+static void rkisp1_isp_sof(struct rkisp1_isp *isp)
 {
 	struct v4l2_event event = {
 		.type = V4L2_EVENT_FRAME_SYNC,
 	};
 
+	isp->frame_sequence++;
+	isp->frame_active = true;
+
 	event.u.frame_sync.frame_sequence = isp->frame_sequence;
 	v4l2_event_queue(isp->sd.devnode, &event);
 }
@@ -1111,15 +1115,20 @@ irqreturn_t rkisp1_isp_isr(int irq, void *ctx)
 
 	rkisp1_write(rkisp1, RKISP1_CIF_ISP_ICR, status);
 
-	/* Vertical sync signal, starting generating new frame */
-	if (status & RKISP1_CIF_ISP_V_START) {
-		rkisp1->isp.frame_sequence++;
-		rkisp1_isp_queue_event_sof(&rkisp1->isp);
+	/*
+	 * Vertical sync signal, starting new frame. Defer handling of vsync
+	 * after RKISP1_CIF_ISP_FRAME if the previous frame was not completed
+	 * yet.
+	 */
+	if (status & RKISP1_CIF_ISP_V_START && !rkisp1->isp.frame_active) {
+		status &= ~RKISP1_CIF_ISP_V_START;
+		rkisp1_isp_sof(&rkisp1->isp);
 		if (status & RKISP1_CIF_ISP_FRAME) {
 			WARN_ONCE(1, "irq delay is too long, buffers might not be in sync\n");
 			rkisp1->debug.irq_delay++;
 		}
 	}
+
 	if (status & RKISP1_CIF_ISP_PIC_SIZE_ERROR) {
 		/* Clear pic_size_error */
 		isp_err = rkisp1_read(rkisp1, RKISP1_CIF_ISP_ERR);
@@ -1138,6 +1147,7 @@ irqreturn_t rkisp1_isp_isr(int irq, void *ctx)
 	if (status & RKISP1_CIF_ISP_FRAME) {
 		u32 isp_ris;
 
+		rkisp1->isp.frame_active = false;
 		rkisp1->debug.complete_frames++;
 
 		/* New frame from the sensor received */
@@ -1152,5 +1162,12 @@ irqreturn_t rkisp1_isp_isr(int irq, void *ctx)
 		rkisp1_params_isr(rkisp1);
 	}
 
+	/*
+	 * Deferred handling of vsync if RKISP1_CIF_ISP_V_START and
+	 * RKISP1_CIF_ISP_FRAME occurrend in the same irq.
+	 */
+	if (status & RKISP1_CIF_ISP_V_START)
+		rkisp1_isp_sof(&rkisp1->isp);
+
 	return IRQ_HANDLED;
 }
-- 
2.48.1


