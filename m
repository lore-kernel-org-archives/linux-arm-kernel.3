Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87926109C027
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 14:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VRtCBh+paAbaLXdD88Dk7++7RgD4I5m3mhQX4JqDDXU=; b=abeykuL3LRdOivgk7ZVeouwuNa
	hcAV9b//O31ef6jm5sxR5WyXEwKURyy1rZuV40LLiFXBLm+Z0zcnN0T0/hk8eduUx/O0frErqCqml
	9NRkHKvQL7Vu1YcYCVMw5Kwy6fT2SvHV+lKWL0SV6uvWmLARwr77tLyuDyTeImR/wvxcrXf4RPRk2
	g60+XS/KjRTWClgBd/ZkKwOQwPxZrDJ4nRLIQlDDRn4TFT5eCQfJ75iH6+XdRsDGFYAMeb59BbKW9
	TmU3sqQlEPPj/SdvQFuOWV0BzcFhZ8/GGJimdQUJ/9cpr+SYqDamEGqVx+r9UtNlMhCgbkh46NpM7
	bY/n4uLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Pa1-00000003gGM-0LDN;
	Wed, 25 Mar 2026 14:51:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5PZg-00000003fb3-0HXy
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 25 Mar 2026 14:51:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=VRtCBh+paAbaLXdD88Dk7++7RgD4I5m3mhQX4JqDDXU=; b=MFxd7Zgg5jeS2w8J126c9wZ4mk
	T62hdRO+YXO5uV4VUXseUIqJxXC80U/tX1QZFPgIbBdwd2A5EgpmZ170R1Nfrc1ETjV1vDO/YNBOQ
	QHxXXoqX/SwQC54RnnWw6OQs9VE9NG+L50VfsWVxagImnxxMprKo4Oyoetf6kvD/qZ+PC7+rPqzOC
	qkTumaLaUOF+JwqAPcCLD1e38lzVpQXzNj2fzYC/B6Nxz79FONxQ+NtJ5UONr1cLsL2m9vDEMn365
	+OIL5uDl3WmIfCbpAZF9AVbuYOGqkwHdMGOWoKPNDA2jHzW7OwTviKVxDvLn6aBku2qP6RiPQFz9s
	T3QwnUBw==;
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5PZZ-00000006OVz-3p8o
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 14:51:10 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1w5PZU-00050C-AD; Wed, 25 Mar 2026 15:51:00 +0100
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Wed, 25 Mar 2026 15:50:43 +0100
Subject: [PATCH v4 12/27] media: rockchip: rga: calculate x_div/y_div using
 v4l2_format_info
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260325-spu-rga3-v4-12-e90ec1c61354@pengutronix.de>
References: <20260325-spu-rga3-v4-0-e90ec1c61354@pengutronix.de>
In-Reply-To: <20260325-spu-rga3-v4-0-e90ec1c61354@pengutronix.de>
To: Jacob Chen <jacob-chen@iotwrt.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@pengutronix.de, nicolas@ndufresne.ca, 
 sebastian.reichel@collabora.com, 
 =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
X-Mailer: b4 0.15.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.pueschel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_145106_011732_12B42D4C 
X-CRM114-Status: GOOD (  15.32  )
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

Calculate the x_div and y_div variables with the information from
v4l2_format_info instead of storing these in the rga_fmt struct.

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
---
 drivers/media/platform/rockchip/rga/rga-hw.c | 45 +++++++---------------------
 drivers/media/platform/rockchip/rga/rga.h    |  2 --
 2 files changed, 11 insertions(+), 36 deletions(-)

diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c b/drivers/media/platform/rockchip/rga/rga-hw.c
index c0218a71fee04..7405355c334ad 100644
--- a/drivers/media/platform/rockchip/rga/rga-hw.c
+++ b/drivers/media/platform/rockchip/rga/rga-hw.c
@@ -42,6 +42,7 @@ rga_get_addr_offset(struct rga_frame *frm, struct rga_addr_offset *offset,
 {
 	struct rga_corners_addr_offset offsets;
 	struct rga_addr_offset *lt, *lb, *rt, *rb;
+	const struct v4l2_format_info *format_info;
 	unsigned int x_div = 0,
 		     y_div = 0, uv_stride = 0, pixel_width = 0;
 
@@ -50,8 +51,16 @@ rga_get_addr_offset(struct rga_frame *frm, struct rga_addr_offset *offset,
 	rt = &offsets.right_top;
 	rb = &offsets.right_bottom;
 
-	x_div = frm->fmt->x_div;
-	y_div = frm->fmt->y_div;
+	format_info = v4l2_format_info(frm->pix.pixelformat);
+	/* x_div is only used for the u/v planes.
+	 * When the format doesn't have these, use 1 to avoid a division by zero.
+	 */
+	if (format_info->bpp[1])
+		x_div = format_info->hdiv * format_info->bpp_div[1] /
+			format_info->bpp[1];
+	else
+		x_div = 1;
+	y_div = format_info->vdiv;
 	uv_stride = frm->stride / x_div;
 	pixel_width = frm->stride / frm->pix.width;
 
@@ -476,128 +485,96 @@ static struct rga_fmt formats[] = {
 		.color_swap = RGA_COLOR_ALPHA_SWAP,
 		.hw_format = RGA_COLOR_FMT_ABGR8888,
 		.depth = 32,
-		.y_div = 1,
-		.x_div = 1,
 	},
 	{
 		.fourcc = V4L2_PIX_FMT_ABGR32,
 		.color_swap = RGA_COLOR_RB_SWAP,
 		.hw_format = RGA_COLOR_FMT_ABGR8888,
 		.depth = 32,
-		.y_div = 1,
-		.x_div = 1,
 	},
 	{
 		.fourcc = V4L2_PIX_FMT_XBGR32,
 		.color_swap = RGA_COLOR_RB_SWAP,
 		.hw_format = RGA_COLOR_FMT_XBGR8888,
 		.depth = 32,
-		.y_div = 1,
-		.x_div = 1,
 	},
 	{
 		.fourcc = V4L2_PIX_FMT_RGB24,
 		.color_swap = RGA_COLOR_NONE_SWAP,
 		.hw_format = RGA_COLOR_FMT_RGB888,
 		.depth = 24,
-		.y_div = 1,
-		.x_div = 1,
 	},
 	{
 		.fourcc = V4L2_PIX_FMT_BGR24,
 		.color_swap = RGA_COLOR_RB_SWAP,
 		.hw_format = RGA_COLOR_FMT_RGB888,
 		.depth = 24,
-		.y_div = 1,
-		.x_div = 1,
 	},
 	{
 		.fourcc = V4L2_PIX_FMT_ARGB444,
 		.color_swap = RGA_COLOR_RB_SWAP,
 		.hw_format = RGA_COLOR_FMT_ABGR4444,
 		.depth = 16,
-		.y_div = 1,
-		.x_div = 1,
 	},
 	{
 		.fourcc = V4L2_PIX_FMT_ARGB555,
 		.color_swap = RGA_COLOR_RB_SWAP,
 		.hw_format = RGA_COLOR_FMT_ABGR1555,
 		.depth = 16,
-		.y_div = 1,
-		.x_div = 1,
 	},
 	{
 		.fourcc = V4L2_PIX_FMT_RGB565,
 		.color_swap = RGA_COLOR_RB_SWAP,
 		.hw_format = RGA_COLOR_FMT_BGR565,
 		.depth = 16,
-		.y_div = 1,
-		.x_div = 1,
 	},
 	{
 		.fourcc = V4L2_PIX_FMT_NV21,
 		.color_swap = RGA_COLOR_UV_SWAP,
 		.hw_format = RGA_COLOR_FMT_YUV420SP,
 		.depth = 12,
-		.y_div = 2,
-		.x_div = 1,
 	},
 	{
 		.fourcc = V4L2_PIX_FMT_NV61,
 		.color_swap = RGA_COLOR_UV_SWAP,
 		.hw_format = RGA_COLOR_FMT_YUV422SP,
 		.depth = 16,
-		.y_div = 1,
-		.x_div = 1,
 	},
 	{
 		.fourcc = V4L2_PIX_FMT_NV12,
 		.color_swap = RGA_COLOR_NONE_SWAP,
 		.hw_format = RGA_COLOR_FMT_YUV420SP,
 		.depth = 12,
-		.y_div = 2,
-		.x_div = 1,
 	},
 	{
 		.fourcc = V4L2_PIX_FMT_NV12M,
 		.color_swap = RGA_COLOR_NONE_SWAP,
 		.hw_format = RGA_COLOR_FMT_YUV420SP,
 		.depth = 12,
-		.y_div = 2,
-		.x_div = 1,
 	},
 	{
 		.fourcc = V4L2_PIX_FMT_NV16,
 		.color_swap = RGA_COLOR_NONE_SWAP,
 		.hw_format = RGA_COLOR_FMT_YUV422SP,
 		.depth = 16,
-		.y_div = 1,
-		.x_div = 1,
 	},
 	{
 		.fourcc = V4L2_PIX_FMT_YUV420,
 		.color_swap = RGA_COLOR_NONE_SWAP,
 		.hw_format = RGA_COLOR_FMT_YUV420P,
 		.depth = 12,
-		.y_div = 2,
-		.x_div = 2,
 	},
 	{
 		.fourcc = V4L2_PIX_FMT_YUV422P,
 		.color_swap = RGA_COLOR_NONE_SWAP,
 		.hw_format = RGA_COLOR_FMT_YUV422P,
 		.depth = 16,
-		.y_div = 1,
-		.x_div = 2,
 	},
 	{
 		.fourcc = V4L2_PIX_FMT_YVU420,
 		.color_swap = RGA_COLOR_UV_SWAP,
 		.hw_format = RGA_COLOR_FMT_YUV420P,
 		.depth = 12,
-		.y_div = 2,
-		.x_div = 2,
 	},
 };
 
diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/platform/rockchip/rga/rga.h
index 640e510285341..27b3c9b4f220c 100644
--- a/drivers/media/platform/rockchip/rga/rga.h
+++ b/drivers/media/platform/rockchip/rga/rga.h
@@ -20,8 +20,6 @@
 struct rga_fmt {
 	u32 fourcc;
 	int depth;
-	u8 y_div;
-	u8 x_div;
 	u8 color_swap;
 	u8 hw_format;
 };

-- 
2.53.0


