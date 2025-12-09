Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D073D1CDC6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 12:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6ueCO3OPjwSJikPNTYVOesL+vCkYXPKcBKrWInaAO5E=; b=qNA9DUVUH3N3wbl0l6IWYqjr9Q
	m5+9M/OHH3oDty3PS0/yeaxueYJIrBeKagueXfYUj+px6DQbtSwRUmOmOh3I9o7TiIjHAeJqtvm+9
	GlHYICfvOav+VMAj5vxDvdYhYMTcUA+dniGcveeXV2XLjGkVhXRu+pQMVufYed40t5gIsrkzZ0vXp
	YtOFQk43gcQxjjL7T3My3Vinn6/m7pYyQ2a9iZllrfWeu3X5nVnoESKhmEHbmAL4XqQqmm39wqzCk
	7I17OrjaqgkL/Q9NG/DXaRcbyhdXBPx/O8ni/MG+HjGObcwwiE3jrmfkiuNBp64Wcr3E96k+8VjZY
	aqmixDKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSwso-0000000EFLH-47aZ;
	Tue, 09 Dec 2025 12:31:58 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSwsl-0000000EFHj-4AlA;
	Tue, 09 Dec 2025 12:31:57 +0000
Received: from isaac-ThinkPad-T16-Gen-2.infra.iob (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 65D4D7E6;
	Tue,  9 Dec 2025 13:31:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1765283512;
	bh=ug/J00ml0noX1QaBJY7xGdOLjc/+Nt6LtyzhtftDOg4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=f0Vs0DS6nae9owtOW6VdF8WiVnVEs02qu663ORQS8Xgcf1Myj/zs8vHshUjISmkMw
	 12TlLsuHy659AwoR23hrV3ay7W8QGWEMbhSXPE0IWsSgQEm3lFuUsHhf4aMRFfWXb2
	 4Ir4WNgu0J+SpINBGa6QnC0twBCexnTws0ZGm+OE=
From: Isaac Scott <isaac.scott@ideasonboard.com>
To: dafna@fastmail.com
Cc: laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org,
	heiko@sntech.de,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Isaac Scott <isaac.scott@ideasonboard.com>
Subject: [RFC PATCH 2/6] media: rkisp1-isp: Add in_bypass flag for YUV bypass
Date: Tue,  9 Dec 2025 12:31:32 +0000
Message-ID: <20251209123136.273938-3-isaac.scott@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251209123136.273938-1-isaac.scott@ideasonboard.com>
References: <20251209123136.273938-1-isaac.scott@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_043156_177501_E30DDFCD 
X-CRM114-Status: GOOD (  11.90  )
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

The rkisp1 features a 'bypass' mode for RAW and YUV formats. This
disables all ISP blocks, and makes the rkisp1 display input data from
the mipi csi receiver at the output, unmodified.

To determine whether we can activate bypass, we can detect whether both
the source and sink formats are YUV. If they are, we can set a new
in_bypass flag.

Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
---
 drivers/media/platform/rockchip/rkisp1/rkisp1-common.h | 1 +
 drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c    | 6 +++++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
index 5e6a4d5f6fd1..d90233e31ad3 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
@@ -532,6 +532,7 @@ struct rkisp1_device {
 	struct rkisp1_debug debug;
 	const struct rkisp1_info *info;
 	int irqs[RKISP1_NUM_IRQS];
+	bool in_bypass;
 	bool irqs_enabled;
 };
 
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
index 2311672cedb1..7f0802ae3dcc 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
@@ -212,6 +212,8 @@ static int rkisp1_config_isp(struct rkisp1_isp *isp,
 	const struct v4l2_mbus_framefmt *sink_frm;
 	const struct v4l2_rect *sink_crop;
 
+	rkisp1->in_bypass = false;
+
 	sink_frm = v4l2_subdev_state_get_format(sd_state,
 						RKISP1_ISP_PAD_SINK_VIDEO);
 	sink_crop = v4l2_subdev_state_get_crop(sd_state,
@@ -240,7 +242,9 @@ static int rkisp1_config_isp(struct rkisp1_isp *isp,
 		}
 	} else if (sink_fmt->pixel_enc == V4L2_PIXEL_ENC_YUV) {
 		acq_mult = 2;
-		if (mbus_type == V4L2_MBUS_CSI2_DPHY) {
+		if (src_fmt->pixel_enc == V4L2_PIXEL_ENC_YUV) {
+			rkisp1->in_bypass = true;
+		} else if (mbus_type == V4L2_MBUS_CSI2_DPHY) {
 			isp_ctrl = RKISP1_CIF_ISP_CTRL_ISP_MODE_ITU601;
 		} else {
 			if (mbus_type == V4L2_MBUS_BT656)
-- 
2.43.0


