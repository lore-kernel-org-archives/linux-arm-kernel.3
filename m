Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9F09CAC586
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 12:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=P1UVHGPHfUIyxNabBaNQuKtasOtALBq5EAMGLACTLMI=; b=OCwqJBGqKKVNpBRLSD1mKP6TBy
	SCVxSzPJoypUnkgi31HcxnBbx9w4FVcwOSxhKiOE39ypmRVL7nOq+JRg/OF7EUe78R1/H45HlrS0n
	Q1Y+vy8SXtoJ61ls7fGaAZWlCgUJG88iE7CJXZCGc/ZiAfH6gh6liZlwpB1YJ/me8uA5ojnks+D3R
	blsoumXyYXTXUeEJ4lK1Hsz3SWlxhPx77Rj70tbmslpkN+Lrko6V4lGs9okhtd3yVRj+jjtHHcPYX
	02tcu4elzB8GVDN5DmHJGplw2WKOcz60azYmPoDAqEUfPhNO0Cx8H0fGOV+ad0uNyZf4Vb5/69ZMu
	nyz5HRKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvabe-0000000GqAu-2vtO;
	Mon, 08 Sep 2025 12:04:22 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvYOE-0000000G75P-1WiZ;
	Mon, 08 Sep 2025 09:42:24 +0000
Received: from ideasonboard.com (unknown [IPv6:2a00:6020:448c:6c00:c241:40fd:9e5d:437c])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id A397310BE;
	Mon,  8 Sep 2025 11:41:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1757324464;
	bh=rnd6RDB+ozLJ6GnyO0aYYhAe1Suo1G2ATJAAjchaT4k=;
	h=From:To:Cc:Subject:Date:From;
	b=dQ4NJpI5PqVhdipK9jmKPgYLgosjlgb1nWZtjezh3jmh7178lplS4hxGh+eXpqkO0
	 W9MkAw4pnUxJBO9FfcZNU4Ypcr43Sg0OA/A3VxHHbB0d1NXDjDa5iUIrOm+D79CeZs
	 U2knWweIh4ly9rdszHBoD/BuLpn1y2eweOHPcR40=
From: Stefan Klug <stefan.klug@ideasonboard.com>
To: linux-media@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Stefan Klug <stefan.klug@ideasonboard.com>,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: rkisp1: Improve frame sequence correctness on stats and params buffers
Date: Mon,  8 Sep 2025 11:41:48 +0200
Message-ID: <20250908094200.48002-1-stefan.klug@ideasonboard.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_024222_542697_51A58DA3 
X-CRM114-Status: GOOD (  18.65  )
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
 .../platform/rockchip/rkisp1/rkisp1-common.h    |  1 +
 .../media/platform/rockchip/rkisp1/rkisp1-isp.c | 17 +++++++++++++----
 2 files changed, 14 insertions(+), 4 deletions(-)

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
index 8c29a1c9309a..1469075b2d45 100644
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
@@ -1112,14 +1116,15 @@ irqreturn_t rkisp1_isp_isr(int irq, void *ctx)
 	rkisp1_write(rkisp1, RKISP1_CIF_ISP_ICR, status);
 
 	/* Vertical sync signal, starting generating new frame */
-	if (status & RKISP1_CIF_ISP_V_START) {
-		rkisp1->isp.frame_sequence++;
-		rkisp1_isp_queue_event_sof(&rkisp1->isp);
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
@@ -1138,6 +1143,7 @@ irqreturn_t rkisp1_isp_isr(int irq, void *ctx)
 	if (status & RKISP1_CIF_ISP_FRAME) {
 		u32 isp_ris;
 
+		rkisp1->isp.frame_active = false;
 		rkisp1->debug.complete_frames++;
 
 		/* New frame from the sensor received */
@@ -1152,5 +1158,8 @@ irqreturn_t rkisp1_isp_isr(int irq, void *ctx)
 		rkisp1_params_isr(rkisp1);
 	}
 
+	if (status & RKISP1_CIF_ISP_V_START && !rkisp1->isp.frame_active)
+		rkisp1_isp_sof(&rkisp1->isp);
+
 	return IRQ_HANDLED;
 }
-- 
2.48.1


