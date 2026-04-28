Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1DE9FF886C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 09:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VlHKzknu60VR8q0yT1YydWnqqMU+Bj/aZYf+T5ynhZE=; b=WkE88c81ipplVcdqVNvcDSCH35
	NvbtmZTmrLWWtG5cdreHgMuXNFVUQ3CnH4DJudGyR8GfzsdPrNIwTM6w7Uzd5U8OYuHMpEaIS6ihZ
	CXzp5j0tzYQthDLlLTXSnzq/sPLOc1vekgKL8nSaZf4YXPGgZ9Blnom8c4GokvmarMCDSrXT9SZE2
	iRHI49PcJRh0wgqH/axWMHxnYuds1TsN8UpqrUJKr+D4E8I2ZIUukFEe2IKZx+BxNC6fse/gW1UT0
	qr9FeE78CfWsLiUk+cq8w5PADu2eBUIkUXgGxlBqksEuhqWDKL5YSV8Vxc6YekgwE0YURlWYJ9hVJ
	jWGZl3cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHeKI-00000000yLC-0lMq;
	Tue, 28 Apr 2026 09:01:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHeJy-00000000xsL-3fl2
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 28 Apr 2026 09:01:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=VlHKzknu60VR8q0yT1YydWnqqMU+Bj/aZYf+T5ynhZE=; b=gkVrCVfdqMB6bkbrk+Ae5RIcWG
	TT1T4vcJR1pYOCUpNenDKoqqbzjyFK9JSu9wFv4VkGxLgf8vGylFlOL6jU+gCCRrfkL3fas+rq98I
	tze7e25CJv4IXbqx+r4qlEQ5DA+7a7VxgEuO4WxUXbL3GGUt9k15A5bR6a96AcDi4BYW0dJyLCoY2
	2ZxO3AxEEqk/U/B3kbN4dfBoCUpOBy0+CSSwUY7e3mDAU1lXK/WD0+Ms12wLjNk4XfH7gMcpB5Wsy
	11kfrCrSNoVmYlSW0GIMY233F9YUJB2HR/Bld+uSsNdhGgVKcE4rdiOibTIdOsshtXueREL7Wsrgv
	aXQi0Qeg==;
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHeJs-00000002VT1-0iZj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 09:01:33 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1wHeJG-0004Lz-SP; Tue, 28 Apr 2026 11:00:50 +0200
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Tue, 28 Apr 2026 11:00:52 +0200
Subject: [PATCH v5 17/29] media: rockchip: rga: prepare cmdbuf on streamon
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260428-spu-rga3-v5-17-eb7f5d019d86@pengutronix.de>
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
X-CRM114-CacheID: sfid-20260428_100128_483443_1484E8BC 
X-CRM114-Status: GOOD (  16.29  )
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

Prepare the command buffer on streamon to reuse it's contents instead of
completely writing it for every frame. Due to the stream settings being
fixed after a streamon we only need to replace the source and destination
addresses for each frame. This reduces the amount of CPU and memory
operations done in each frame.

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>

---

Changes in v5:
- Don't set the flipping and rotation values at streamon and preventing
  the userspace from chainging them at runtime
---
 drivers/media/platform/rockchip/rga/rga-hw.c | 13 +++++++++----
 drivers/media/platform/rockchip/rga/rga.c    | 13 ++++++++++++-
 drivers/media/platform/rockchip/rga/rga.h    |  1 +
 3 files changed, 22 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c b/drivers/media/platform/rockchip/rga/rga-hw.c
index 6c1956b04f6ba..11079477a3008 100644
--- a/drivers/media/platform/rockchip/rga/rga-hw.c
+++ b/drivers/media/platform/rockchip/rga/rga-hw.c
@@ -427,8 +427,6 @@ static void rga_cmd_set(struct rga_ctx *ctx,
 {
 	struct rockchip_rga *rga = ctx->rga;
 
-	memset(ctx->cmdbuf_virt, 0, RGA_CMDBUF_SIZE);
-
 	rga_cmd_set_src_addr(ctx, src->dma_desc_pa);
 	/*
 	 * Due to hardware bug,
@@ -437,11 +435,9 @@ static void rga_cmd_set(struct rga_ctx *ctx,
 	rga_cmd_set_src1_addr(ctx, dst->dma_desc_pa);
 
 	rga_cmd_set_dst_addr(ctx, dst->dma_desc_pa);
-	rga_cmd_set_mode(ctx);
 
 	rga_cmd_set_src_info(ctx, &src->offset);
 	rga_cmd_set_dst_info(ctx, &dst->offset);
-	rga_cmd_set_format_scale_info(ctx);
 	rga_cmd_set_flip_rotate_info(ctx);
 
 	rga_write(rga, RGA_CMD_BASE, ctx->cmdbuf_phy);
@@ -451,6 +447,14 @@ static void rga_cmd_set(struct rga_ctx *ctx,
 				   PAGE_SIZE, DMA_BIDIRECTIONAL);
 }
 
+static void rga_hw_setup_cmdbuf(struct rga_ctx *ctx)
+{
+	memset(ctx->cmdbuf_virt, 0, RGA_CMDBUF_SIZE);
+
+	rga_cmd_set_mode(ctx);
+	rga_cmd_set_format_scale_info(ctx);
+}
+
 static void rga_hw_start(struct rockchip_rga *rga,
 			 struct rga_vb_buffer *src,  struct rga_vb_buffer *dst)
 {
@@ -593,6 +597,7 @@ const struct rga_hw rga2_hw = {
 	.max_height = MAX_HEIGHT,
 	.stride_alignment = 4,
 
+	.setup_cmdbuf = rga_hw_setup_cmdbuf,
 	.start = rga_hw_start,
 	.handle_irq = rga_handle_irq,
 	.get_version = rga_get_version,
diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index 16a663aeef8c9..d111b348255e2 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -568,6 +568,17 @@ static int vidioc_s_selection(struct file *file, void *priv,
 	return ret;
 }
 
+static int vidioc_streamon(struct file *file, void *priv,
+			   enum v4l2_buf_type type)
+{
+	struct rga_ctx *ctx = file_to_rga_ctx(file);
+	const struct rga_hw *hw = ctx->rga->hw;
+
+	hw->setup_cmdbuf(ctx);
+
+	return v4l2_m2m_streamon(file, ctx->fh.m2m_ctx, type);
+}
+
 static const struct v4l2_ioctl_ops rga_ioctl_ops = {
 	.vidioc_querycap = vidioc_querycap,
 
@@ -592,7 +603,7 @@ static const struct v4l2_ioctl_ops rga_ioctl_ops = {
 	.vidioc_subscribe_event = v4l2_ctrl_subscribe_event,
 	.vidioc_unsubscribe_event = v4l2_event_unsubscribe,
 
-	.vidioc_streamon = v4l2_m2m_ioctl_streamon,
+	.vidioc_streamon = vidioc_streamon,
 	.vidioc_streamoff = v4l2_m2m_ioctl_streamoff,
 
 	.vidioc_g_selection = vidioc_g_selection,
diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/platform/rockchip/rga/rga.h
index 38518146910a6..c741213710b32 100644
--- a/drivers/media/platform/rockchip/rga/rga.h
+++ b/drivers/media/platform/rockchip/rga/rga.h
@@ -152,6 +152,7 @@ struct rga_hw {
 	u32 max_width, max_height;
 	u8 stride_alignment;
 
+	void (*setup_cmdbuf)(struct rga_ctx *ctx);
 	void (*start)(struct rockchip_rga *rga,
 		      struct rga_vb_buffer *src, struct rga_vb_buffer *dst);
 	bool (*handle_irq)(struct rockchip_rga *rga);

-- 
2.54.0


