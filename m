Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FBC8FF885D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 09:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vwBpSHQVvaheaKYajQUWMJIh34jIgmTq9lyhWmYKoM0=; b=eAmfNIUPVZL2xKOpqY0qYiVgGS
	qOBrH6z1WTPLRXLYFWKQU5mMXVgMvfv7PdDchCOZkyW00252KviMvMMjyZlWmUMWXkai1lbYB7BAV
	q1xd8c5D2LSodE9ALetZnb1KT0aLqpnkTtP3Wdg81eNcodud+EJkMMj/69Fsyrddm0yDYV/nKZB6P
	hGu+NhGxrNTJ3d7xFtvy6Wt10YiNrBXq8A/oZt0eEPBfoLziNYiVndojMr2ZWuShL63CVajzU6yNT
	gMbJL29j25zw3fC16B6mbcIRE2+I6BO9dHXCSLnYnZwCHbv5lpVKuwN+BXAMa3LhHQhl2bxZEcmz8
	jkCfSs0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHeKl-00000000yso-17ya;
	Tue, 28 Apr 2026 09:02:23 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHeK6-00000000y3x-3DBh
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 28 Apr 2026 09:01:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=vwBpSHQVvaheaKYajQUWMJIh34jIgmTq9lyhWmYKoM0=; b=XOoIH3rEt9VA+4WEt7su5uzqiM
	DuO30Iuk9ME2XfrGN3cvUULb+D4yc+zGIIS4GECRxX0s8niCqaVDcw2MNCys5eGmlFL4LXDrbbZc2
	97rDDCfO7oxV4zALkD4+1D1uRj2eiy/OIeCAAmr79bbYWaqusSsdHMoc5nGOHcueRmAy0NeYkkWHq
	McRrI7weZqnoX4+stGYd4Mb8z+4pZZ4xwM9TKFWlpOtMYoUKHn9Bbk6P/LnF+UxbkwKAgRIIbCVx/
	IpFIRhYq2zhHllQiKwjTRp2ZTnXFojZ/fL+RiwTa/HvmJdxU4DRA+4/LHdkcIXdq0T5UQYnZwK6k+
	8Py/GpwA==;
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHeJz-00000003VK0-3hRD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 09:01:41 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1wHeJM-0004Lz-Hp; Tue, 28 Apr 2026 11:00:56 +0200
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Tue, 28 Apr 2026 11:01:01 +0200
Subject: [PATCH v5 26/29] media: rockchip: rga: add feature flags
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260428-spu-rga3-v5-26-eb7f5d019d86@pengutronix.de>
References: <20260428-spu-rga3-v5-0-eb7f5d019d86@pengutronix.de>
In-Reply-To: <20260428-spu-rga3-v5-0-eb7f5d019d86@pengutronix.de>
To: Jacob Chen <jacob-chen@iotwrt.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@pengutronix.de, nicolas@ndufresne.ca, 
 sebastian.reichel@collabora.com, 
 =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
X-Mailer: b4 0.15.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.pueschel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_100135_970921_BB0C228E 
X-CRM114-Status: GOOD (  14.39  )
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

In preparation to the RGA3 addition add feature flags, which can limit
the exposed feature set of the video device, like rotating or selection
support. This is necessary as the RGA3 doesn't initially implement the
full feature set currently exposed by the driver.

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
---
 drivers/media/platform/rockchip/rga/rga-hw.c |  4 ++++
 drivers/media/platform/rockchip/rga/rga.c    | 23 +++++++++++++++--------
 drivers/media/platform/rockchip/rga/rga.h    |  7 +++++++
 3 files changed, 26 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c b/drivers/media/platform/rockchip/rga/rga-hw.c
index d4282fc5d92ba..2a14d18baf532 100644
--- a/drivers/media/platform/rockchip/rga/rga-hw.c
+++ b/drivers/media/platform/rockchip/rga/rga-hw.c
@@ -613,6 +613,10 @@ const struct rga_hw rga2_hw = {
 	.max_height = MAX_HEIGHT,
 	.max_scaling_factor = MAX_SCALING_FACTOR,
 	.stride_alignment = 4,
+	.features = RGA_FEATURE_FLIP
+		  | RGA_FEATURE_ROTATE
+		  | RGA_FEATURE_BG_COLOR
+		  | RGA_FEATURE_SELECTION,
 
 	.setup_cmdbuf = rga_hw_setup_cmdbuf,
 	.start = rga_hw_start,
diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index 364c1dac3f81c..b0c88ad647e96 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -162,17 +162,21 @@ static int rga_setup_ctrls(struct rga_ctx *ctx)
 
 	v4l2_ctrl_handler_init(&ctx->ctrl_handler, 4);
 
-	v4l2_ctrl_new_std(&ctx->ctrl_handler, &rga_ctrl_ops,
-			  V4L2_CID_HFLIP, 0, 1, 1, 0);
+	if (rga->hw->features & RGA_FEATURE_FLIP) {
+		v4l2_ctrl_new_std(&ctx->ctrl_handler, &rga_ctrl_ops,
+				  V4L2_CID_HFLIP, 0, 1, 1, 0);
 
-	v4l2_ctrl_new_std(&ctx->ctrl_handler, &rga_ctrl_ops,
-			  V4L2_CID_VFLIP, 0, 1, 1, 0);
+		v4l2_ctrl_new_std(&ctx->ctrl_handler, &rga_ctrl_ops,
+				  V4L2_CID_VFLIP, 0, 1, 1, 0);
+	}
 
-	v4l2_ctrl_new_std(&ctx->ctrl_handler, &rga_ctrl_ops,
-			  V4L2_CID_ROTATE, 0, 270, 90, 0);
+	if (rga->hw->features & RGA_FEATURE_ROTATE)
+		v4l2_ctrl_new_std(&ctx->ctrl_handler, &rga_ctrl_ops,
+				  V4L2_CID_ROTATE, 0, 270, 90, 0);
 
-	v4l2_ctrl_new_std(&ctx->ctrl_handler, &rga_ctrl_ops,
-			  V4L2_CID_BG_COLOR, 0, 0xffffffff, 1, 0);
+	if (rga->hw->features & RGA_FEATURE_BG_COLOR)
+		v4l2_ctrl_new_std(&ctx->ctrl_handler, &rga_ctrl_ops,
+				  V4L2_CID_BG_COLOR, 0, 0xffffffff, 1, 0);
 
 	if (ctx->ctrl_handler.error) {
 		int err = ctx->ctrl_handler.error;
@@ -536,6 +540,9 @@ static int vidioc_s_selection(struct file *file, void *priv,
 	struct rga_frame *f;
 	int ret = 0;
 
+	if (!(rga->hw->features & RGA_FEATURE_SELECTION))
+		return -EINVAL;
+
 	f = rga_get_frame(ctx, s->type);
 	if (IS_ERR(f))
 		return PTR_ERR(f);
diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/platform/rockchip/rga/rga.h
index d98e57c6d7b57..849b96392b780 100644
--- a/drivers/media/platform/rockchip/rga/rga.h
+++ b/drivers/media/platform/rockchip/rga/rga.h
@@ -6,6 +6,7 @@
 #ifndef __RGA_H__
 #define __RGA_H__
 
+#include <linux/bits.h>
 #include <linux/clk.h>
 #include <linux/platform_device.h>
 #include <media/videobuf2-v4l2.h>
@@ -133,6 +134,11 @@ static inline void rga_mod(struct rockchip_rga *rga, u32 reg, u32 val, u32 mask)
 	rga_write(rga, reg, temp);
 };
 
+#define RGA_FEATURE_FLIP	BIT(0)
+#define RGA_FEATURE_ROTATE	BIT(1)
+#define RGA_FEATURE_BG_COLOR	BIT(2)
+#define RGA_FEATURE_SELECTION	BIT(3)
+
 struct rga_hw {
 	const char *card_type;
 	bool has_internal_iommu;
@@ -141,6 +147,7 @@ struct rga_hw {
 	u32 max_width, max_height;
 	u8 max_scaling_factor;
 	u8 stride_alignment;
+	u8 features;
 
 	void (*setup_cmdbuf)(struct rga_ctx *ctx);
 	void (*start)(struct rockchip_rga *rga,

-- 
2.54.0


