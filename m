Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 378F4CCD185
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 08:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3SVooP3OTwJqusN7PvZBjmL4fugC43IjjozJrn+idiw=; b=eKBPJPmOWp3DRjPXQeESo5kCL4
	j5cgk5YUDxQdGU8H9VaBUcwqqvKhaVbBU/atl3br70uu/1QgOufVLY2qf8BfEztxfiBcHZF6yw+xO
	saGWpLSIRQkRwF59+dZp2G19tmrqgSxI+Vme6wszwt93+lds3RX834+jVv7STIMyl5ys93bU9rUmv
	u41tvLfxOLDEcrgR9BDLlxCN2jwxWCGjT+0Y2oiQzpyliPTRFAg5cu9r8DprhOR2uxL67FOyg1CUQ
	BGibDsbWyTBRipiEdH+zVIToR2e959x4TXyPAWykKpcCQ+cqQ1FRWXmE8g6p9pseMY10gUz601rs6
	7tfrFhlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v637y-00000001YST-1bxy;
	Tue, 07 Oct 2025 08:32:58 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v637s-00000001YLh-2phU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 08:32:54 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1v637r-0002Hb-4d; Tue, 07 Oct 2025 10:32:51 +0200
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Tue, 07 Oct 2025 10:31:57 +0200
Subject: [PATCH 04/16] media: rockchip: rga: move hw specific parts to a
 dedicated struct
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251007-spu-rga3-v1-4-36ad85570402@pengutronix.de>
References: <20251007-spu-rga3-v1-0-36ad85570402@pengutronix.de>
In-Reply-To: <20251007-spu-rga3-v1-0-36ad85570402@pengutronix.de>
To: Jacob Chen <jacob-chen@iotwrt.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@pengutronix.de, 
 =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.pueschel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_013253_052609_572FE1F2 
X-CRM114-Status: GOOD (  23.36  )
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

In preparation for the RGA3 unit, move RGA2 specific parts from rga.c
to rga-hw.c and create a struct to reference the RGA2 specific functions
and formats. This also allows to remove the rga-hw.h reference from the
include list of the rga driver.

Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
---
 drivers/media/platform/rockchip/rga/rga-hw.c | 183 ++++++++++++++++++++-
 drivers/media/platform/rockchip/rga/rga-hw.h |   3 -
 drivers/media/platform/rockchip/rga/rga.c    | 228 +++++----------------------
 drivers/media/platform/rockchip/rga/rga.h    |  23 ++-
 4 files changed, 242 insertions(+), 195 deletions(-)

diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c b/drivers/media/platform/rockchip/rga/rga-hw.c
index 43ed742a164929927001ef8e8925a29eb93615b2..871fe8c787c8d8dbd55c111c3fba3953d4debf02 100644
--- a/drivers/media/platform/rockchip/rga/rga-hw.c
+++ b/drivers/media/platform/rockchip/rga/rga-hw.c
@@ -437,8 +437,8 @@ static void rga_cmd_set(struct rga_ctx *ctx,
 		PAGE_SIZE, DMA_BIDIRECTIONAL);
 }
 
-void rga_hw_start(struct rockchip_rga *rga,
-		  struct rga_vb_buffer *src, struct rga_vb_buffer *dst)
+static void rga_hw_start(struct rockchip_rga *rga,
+			 struct rga_vb_buffer *src,  struct rga_vb_buffer *dst)
 {
 	struct rga_ctx *ctx = rga->curr;
 
@@ -452,3 +452,182 @@ void rga_hw_start(struct rockchip_rga *rga,
 
 	rga_write(rga, RGA_CMD_CTRL, 0x1);
 }
+
+static bool rga_handle_irq(struct rockchip_rga *rga)
+{
+	int intr;
+
+	intr = rga_read(rga, RGA_INT) & 0xf;
+
+	rga_mod(rga, RGA_INT, intr << 4, 0xf << 4);
+
+	return intr & 0x04;
+}
+
+static void rga_get_version(struct rockchip_rga *rga)
+{
+	rga->version.major = (rga_read(rga, RGA_VERSION_INFO) >> 24) & 0xFF;
+	rga->version.minor = (rga_read(rga, RGA_VERSION_INFO) >> 20) & 0x0F;
+}
+
+static struct rga_fmt formats[] = {
+	{
+		.fourcc = V4L2_PIX_FMT_ARGB32,
+		.color_swap = RGA_COLOR_ALPHA_SWAP,
+		.hw_format = RGA_COLOR_FMT_ABGR8888,
+		.depth = 32,
+		.uv_factor = 1,
+		.y_div = 1,
+		.x_div = 1,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_ABGR32,
+		.color_swap = RGA_COLOR_RB_SWAP,
+		.hw_format = RGA_COLOR_FMT_ABGR8888,
+		.depth = 32,
+		.uv_factor = 1,
+		.y_div = 1,
+		.x_div = 1,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_XBGR32,
+		.color_swap = RGA_COLOR_RB_SWAP,
+		.hw_format = RGA_COLOR_FMT_XBGR8888,
+		.depth = 32,
+		.uv_factor = 1,
+		.y_div = 1,
+		.x_div = 1,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_RGB24,
+		.color_swap = RGA_COLOR_NONE_SWAP,
+		.hw_format = RGA_COLOR_FMT_RGB888,
+		.depth = 24,
+		.uv_factor = 1,
+		.y_div = 1,
+		.x_div = 1,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_BGR24,
+		.color_swap = RGA_COLOR_RB_SWAP,
+		.hw_format = RGA_COLOR_FMT_RGB888,
+		.depth = 24,
+		.uv_factor = 1,
+		.y_div = 1,
+		.x_div = 1,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_ARGB444,
+		.color_swap = RGA_COLOR_RB_SWAP,
+		.hw_format = RGA_COLOR_FMT_ABGR4444,
+		.depth = 16,
+		.uv_factor = 1,
+		.y_div = 1,
+		.x_div = 1,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_ARGB555,
+		.color_swap = RGA_COLOR_RB_SWAP,
+		.hw_format = RGA_COLOR_FMT_ABGR1555,
+		.depth = 16,
+		.uv_factor = 1,
+		.y_div = 1,
+		.x_div = 1,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_RGB565,
+		.color_swap = RGA_COLOR_RB_SWAP,
+		.hw_format = RGA_COLOR_FMT_BGR565,
+		.depth = 16,
+		.uv_factor = 1,
+		.y_div = 1,
+		.x_div = 1,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_NV21,
+		.color_swap = RGA_COLOR_UV_SWAP,
+		.hw_format = RGA_COLOR_FMT_YUV420SP,
+		.depth = 12,
+		.uv_factor = 4,
+		.y_div = 2,
+		.x_div = 1,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_NV61,
+		.color_swap = RGA_COLOR_UV_SWAP,
+		.hw_format = RGA_COLOR_FMT_YUV422SP,
+		.depth = 16,
+		.uv_factor = 2,
+		.y_div = 1,
+		.x_div = 1,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_NV12,
+		.color_swap = RGA_COLOR_NONE_SWAP,
+		.hw_format = RGA_COLOR_FMT_YUV420SP,
+		.depth = 12,
+		.uv_factor = 4,
+		.y_div = 2,
+		.x_div = 1,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_NV12M,
+		.color_swap = RGA_COLOR_NONE_SWAP,
+		.hw_format = RGA_COLOR_FMT_YUV420SP,
+		.depth = 12,
+		.uv_factor = 4,
+		.y_div = 2,
+		.x_div = 1,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_NV16,
+		.color_swap = RGA_COLOR_NONE_SWAP,
+		.hw_format = RGA_COLOR_FMT_YUV422SP,
+		.depth = 16,
+		.uv_factor = 2,
+		.y_div = 1,
+		.x_div = 1,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_YUV420,
+		.color_swap = RGA_COLOR_NONE_SWAP,
+		.hw_format = RGA_COLOR_FMT_YUV420P,
+		.depth = 12,
+		.uv_factor = 4,
+		.y_div = 2,
+		.x_div = 2,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_YUV422P,
+		.color_swap = RGA_COLOR_NONE_SWAP,
+		.hw_format = RGA_COLOR_FMT_YUV422P,
+
+		.depth = 16,
+		.uv_factor = 2,
+		.y_div = 1,
+		.x_div = 2,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_YVU420,
+		.color_swap = RGA_COLOR_UV_SWAP,
+		.hw_format = RGA_COLOR_FMT_YUV420P,
+		.depth = 12,
+		.uv_factor = 4,
+		.y_div = 2,
+		.x_div = 2,
+	},
+};
+
+const struct rga_hw rga2_hw = {
+	.formats = formats,
+	.num_formats = ARRAY_SIZE(formats),
+	.cmdbuf_size = RGA_CMDBUF_SIZE,
+	.min_width = MIN_WIDTH,
+	.max_width = MAX_WIDTH,
+	.min_height = MIN_HEIGHT,
+	.max_height = MAX_HEIGHT,
+
+	.start = rga_hw_start,
+	.handle_irq = rga_handle_irq,
+	.get_version = rga_get_version,
+};
diff --git a/drivers/media/platform/rockchip/rga/rga-hw.h b/drivers/media/platform/rockchip/rga/rga-hw.h
index cc6bd7f5b0300364948fd15109c643199d94e5de..1f52fbfad5fb3b8b773f7f03be0603170c5189f6 100644
--- a/drivers/media/platform/rockchip/rga/rga-hw.h
+++ b/drivers/media/platform/rockchip/rga/rga-hw.h
@@ -15,9 +15,6 @@
 #define MIN_WIDTH 34
 #define MIN_HEIGHT 34
 
-#define DEFAULT_WIDTH 100
-#define DEFAULT_HEIGHT 100
-
 #define RGA_TIMEOUT 500
 
 /* Registers address */
diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index 3cb7ce470c47e39d694e8176875a75fad2717f96..32d24cdf17e9db38541d2b1615c6337def9362c6 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -25,7 +25,6 @@
 #include <media/videobuf2-dma-sg.h>
 #include <media/videobuf2-v4l2.h>
 
-#include "rga-hw.h"
 #include "rga.h"
 
 static int debug;
@@ -47,7 +46,7 @@ static void device_run(void *prv)
 
 	dst = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
 
-	rga_hw_start(rga, vb_to_rga(src), vb_to_rga(dst));
+	rga->hw->start(rga, vb_to_rga(src), vb_to_rga(dst));
 
 	spin_unlock_irqrestore(&rga->ctrl_lock, flags);
 }
@@ -55,13 +54,8 @@ static void device_run(void *prv)
 static irqreturn_t rga_isr(int irq, void *prv)
 {
 	struct rockchip_rga *rga = prv;
-	int intr;
 
-	intr = rga_read(rga, RGA_INT) & 0xf;
-
-	rga_mod(rga, RGA_INT, intr << 4, 0xf << 4);
-
-	if (intr & 0x04) {
+	if (rga->hw->handle_irq(rga)) {
 		struct vb2_v4l2_buffer *src, *dst;
 		struct rga_ctx *ctx = rga->curr;
 
@@ -184,177 +178,17 @@ static int rga_setup_ctrls(struct rga_ctx *ctx)
 	return 0;
 }
 
-static struct rga_fmt formats[] = {
-	{
-		.fourcc = V4L2_PIX_FMT_ARGB32,
-		.color_swap = RGA_COLOR_ALPHA_SWAP,
-		.hw_format = RGA_COLOR_FMT_ABGR8888,
-		.depth = 32,
-		.uv_factor = 1,
-		.y_div = 1,
-		.x_div = 1,
-	},
-	{
-		.fourcc = V4L2_PIX_FMT_ABGR32,
-		.color_swap = RGA_COLOR_RB_SWAP,
-		.hw_format = RGA_COLOR_FMT_ABGR8888,
-		.depth = 32,
-		.uv_factor = 1,
-		.y_div = 1,
-		.x_div = 1,
-	},
-	{
-		.fourcc = V4L2_PIX_FMT_XBGR32,
-		.color_swap = RGA_COLOR_RB_SWAP,
-		.hw_format = RGA_COLOR_FMT_XBGR8888,
-		.depth = 32,
-		.uv_factor = 1,
-		.y_div = 1,
-		.x_div = 1,
-	},
-	{
-		.fourcc = V4L2_PIX_FMT_RGB24,
-		.color_swap = RGA_COLOR_NONE_SWAP,
-		.hw_format = RGA_COLOR_FMT_RGB888,
-		.depth = 24,
-		.uv_factor = 1,
-		.y_div = 1,
-		.x_div = 1,
-	},
-	{
-		.fourcc = V4L2_PIX_FMT_BGR24,
-		.color_swap = RGA_COLOR_RB_SWAP,
-		.hw_format = RGA_COLOR_FMT_RGB888,
-		.depth = 24,
-		.uv_factor = 1,
-		.y_div = 1,
-		.x_div = 1,
-	},
-	{
-		.fourcc = V4L2_PIX_FMT_ARGB444,
-		.color_swap = RGA_COLOR_RB_SWAP,
-		.hw_format = RGA_COLOR_FMT_ABGR4444,
-		.depth = 16,
-		.uv_factor = 1,
-		.y_div = 1,
-		.x_div = 1,
-	},
-	{
-		.fourcc = V4L2_PIX_FMT_ARGB555,
-		.color_swap = RGA_COLOR_RB_SWAP,
-		.hw_format = RGA_COLOR_FMT_ABGR1555,
-		.depth = 16,
-		.uv_factor = 1,
-		.y_div = 1,
-		.x_div = 1,
-	},
-	{
-		.fourcc = V4L2_PIX_FMT_RGB565,
-		.color_swap = RGA_COLOR_RB_SWAP,
-		.hw_format = RGA_COLOR_FMT_BGR565,
-		.depth = 16,
-		.uv_factor = 1,
-		.y_div = 1,
-		.x_div = 1,
-	},
-	{
-		.fourcc = V4L2_PIX_FMT_NV21,
-		.color_swap = RGA_COLOR_UV_SWAP,
-		.hw_format = RGA_COLOR_FMT_YUV420SP,
-		.depth = 12,
-		.uv_factor = 4,
-		.y_div = 2,
-		.x_div = 1,
-	},
-	{
-		.fourcc = V4L2_PIX_FMT_NV61,
-		.color_swap = RGA_COLOR_UV_SWAP,
-		.hw_format = RGA_COLOR_FMT_YUV422SP,
-		.depth = 16,
-		.uv_factor = 2,
-		.y_div = 1,
-		.x_div = 1,
-	},
-	{
-		.fourcc = V4L2_PIX_FMT_NV12,
-		.color_swap = RGA_COLOR_NONE_SWAP,
-		.hw_format = RGA_COLOR_FMT_YUV420SP,
-		.depth = 12,
-		.uv_factor = 4,
-		.y_div = 2,
-		.x_div = 1,
-	},
-	{
-		.fourcc = V4L2_PIX_FMT_NV12M,
-		.color_swap = RGA_COLOR_NONE_SWAP,
-		.hw_format = RGA_COLOR_FMT_YUV420SP,
-		.depth = 12,
-		.uv_factor = 4,
-		.y_div = 2,
-		.x_div = 1,
-	},
-	{
-		.fourcc = V4L2_PIX_FMT_NV16,
-		.color_swap = RGA_COLOR_NONE_SWAP,
-		.hw_format = RGA_COLOR_FMT_YUV422SP,
-		.depth = 16,
-		.uv_factor = 2,
-		.y_div = 1,
-		.x_div = 1,
-	},
-	{
-		.fourcc = V4L2_PIX_FMT_YUV420,
-		.color_swap = RGA_COLOR_NONE_SWAP,
-		.hw_format = RGA_COLOR_FMT_YUV420P,
-		.depth = 12,
-		.uv_factor = 4,
-		.y_div = 2,
-		.x_div = 2,
-	},
-	{
-		.fourcc = V4L2_PIX_FMT_YUV422P,
-		.color_swap = RGA_COLOR_NONE_SWAP,
-		.hw_format = RGA_COLOR_FMT_YUV422P,
-		.depth = 16,
-		.uv_factor = 2,
-		.y_div = 1,
-		.x_div = 2,
-	},
-	{
-		.fourcc = V4L2_PIX_FMT_YVU420,
-		.color_swap = RGA_COLOR_UV_SWAP,
-		.hw_format = RGA_COLOR_FMT_YUV420P,
-		.depth = 12,
-		.uv_factor = 4,
-		.y_div = 2,
-		.x_div = 2,
-	},
-};
-
-#define NUM_FORMATS ARRAY_SIZE(formats)
-
-static struct rga_fmt *rga_fmt_find(u32 pixelformat)
+static struct rga_fmt *rga_fmt_find(struct rockchip_rga *rga, u32 pixelformat)
 {
 	unsigned int i;
 
-	for (i = 0; i < NUM_FORMATS; i++) {
-		if (formats[i].fourcc == pixelformat)
-			return &formats[i];
+	for (i = 0; i < rga->hw->num_formats; i++) {
+		if (rga->hw->formats[i].fourcc == pixelformat)
+			return &rga->hw->formats[i];
 	}
 	return NULL;
 }
 
-static struct rga_frame def_frame = {
-	.width = DEFAULT_WIDTH,
-	.height = DEFAULT_HEIGHT,
-	.colorspace = V4L2_COLORSPACE_DEFAULT,
-	.crop.left = 0,
-	.crop.top = 0,
-	.crop.width = DEFAULT_WIDTH,
-	.crop.height = DEFAULT_HEIGHT,
-	.fmt = &formats[0],
-};
-
 struct rga_frame *rga_get_frame(struct rga_ctx *ctx, enum v4l2_buf_type type)
 {
 	if (V4L2_TYPE_IS_OUTPUT(type))
@@ -369,6 +203,19 @@ static int rga_open(struct file *file)
 	struct rockchip_rga *rga = video_drvdata(file);
 	struct rga_ctx *ctx = NULL;
 	int ret = 0;
+	struct rga_frame def_frame = {
+		.width = clamp(DEFAULT_WIDTH, rga->hw->min_width, rga->hw->max_width),
+		.height = clamp(DEFAULT_HEIGHT, rga->hw->min_height, rga->hw->max_height),
+		.colorspace = V4L2_COLORSPACE_DEFAULT,
+		.crop.left = 0,
+		.crop.top = 0,
+		.crop.width = clamp(DEFAULT_WIDTH, rga->hw->min_width, rga->hw->max_width),
+		.crop.height = clamp(DEFAULT_HEIGHT, rga->hw->min_height, rga->hw->max_height),
+		.fmt = &rga->hw->formats[0],
+	};
+
+	def_frame.stride = (def_frame.width * def_frame.fmt->depth) >> 3;
+	def_frame.size = def_frame.stride * def_frame.height;
 
 	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
 	if (!ctx)
@@ -448,12 +295,13 @@ vidioc_querycap(struct file *file, void *priv, struct v4l2_capability *cap)
 
 static int vidioc_enum_fmt(struct file *file, void *priv, struct v4l2_fmtdesc *f)
 {
+	struct rockchip_rga *rga = video_drvdata(file);
 	struct rga_fmt *fmt;
 
-	if (f->index >= NUM_FORMATS)
+	if (f->index >= rga->hw->num_formats)
 		return -EINVAL;
 
-	fmt = &formats[f->index];
+	fmt = &rga->hw->formats[f->index];
 	f->pixelformat = fmt->fourcc;
 
 	return 0;
@@ -504,16 +352,18 @@ static int vidioc_g_fmt(struct file *file, void *priv, struct v4l2_format *f)
 static int vidioc_try_fmt(struct file *file, void *priv, struct v4l2_format *f)
 {
 	struct v4l2_pix_format_mplane *pix_fmt = &f->fmt.pix_mp;
+	struct rockchip_rga *rga = video_drvdata(file);
+	const struct rga_hw *hw = rga->hw;
 	struct rga_fmt *fmt;
 
-	fmt = rga_fmt_find(pix_fmt->pixelformat);
+	fmt = rga_fmt_find(rga, pix_fmt->pixelformat);
 	if (!fmt)
-		fmt = &formats[0];
+		fmt = &hw->formats[0];
 
 	pix_fmt->width = clamp(pix_fmt->width,
-			       (u32)MIN_WIDTH, (u32)MAX_WIDTH);
+			       hw->min_width, hw->max_width);
 	pix_fmt->height = clamp(pix_fmt->height,
-				(u32)MIN_HEIGHT, (u32)MAX_HEIGHT);
+				hw->min_height, hw->max_height);
 
 	v4l2_fill_pixfmt_mp(pix_fmt, fmt->fourcc, pix_fmt->width, pix_fmt->height);
 	align_pixfmt(pix_fmt);
@@ -551,7 +401,7 @@ static int vidioc_s_fmt(struct file *file, void *priv, struct v4l2_format *f)
 	frm->size = 0;
 	for (i = 0; i < pix_fmt->num_planes; i++)
 		frm->size += pix_fmt->plane_fmt[i].sizeimage;
-	frm->fmt = rga_fmt_find(pix_fmt->pixelformat);
+	frm->fmt = rga_fmt_find(rga, pix_fmt->pixelformat);
 	frm->stride = pix_fmt->plane_fmt[0].bytesperline;
 	frm->colorspace = pix_fmt->colorspace;
 
@@ -672,7 +522,7 @@ static int vidioc_s_selection(struct file *file, void *priv,
 
 	if (s->r.left + s->r.width > f->width ||
 	    s->r.top + s->r.height > f->height ||
-	    s->r.width < MIN_WIDTH || s->r.height < MIN_HEIGHT) {
+	    s->r.width < rga->hw->min_width || s->r.height < rga->hw->min_height) {
 		v4l2_dbg(debug, 1, &rga->v4l2_dev, "unsupported crop value.\n");
 		return -EINVAL;
 	}
@@ -781,6 +631,10 @@ static int rga_probe(struct platform_device *pdev)
 	if (!rga)
 		return -ENOMEM;
 
+	rga->hw = of_device_get_match_data(&pdev->dev);
+	if (!rga->hw)
+		return dev_err_probe(&pdev->dev, -ENODEV, "failed to get match data\n");
+
 	rga->dev = &pdev->dev;
 	spin_lock_init(&rga->ctrl_lock);
 	mutex_init(&rga->mutex);
@@ -844,8 +698,7 @@ static int rga_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto rel_m2m;
 
-	rga->version.major = (rga_read(rga, RGA_VERSION_INFO) >> 24) & 0xFF;
-	rga->version.minor = (rga_read(rga, RGA_VERSION_INFO) >> 20) & 0x0F;
+	rga->hw->get_version(rga);
 
 	v4l2_info(&rga->v4l2_dev, "HW Version: 0x%02x.%02x\n",
 		  rga->version.major, rga->version.minor);
@@ -853,7 +706,7 @@ static int rga_probe(struct platform_device *pdev)
 	pm_runtime_put(rga->dev);
 
 	/* Create CMD buffer */
-	rga->cmdbuf_virt = dma_alloc_attrs(rga->dev, RGA_CMDBUF_SIZE,
+	rga->cmdbuf_virt = dma_alloc_attrs(rga->dev, rga->hw->cmdbuf_size,
 					   &rga->cmdbuf_phy, GFP_KERNEL,
 					   DMA_ATTR_WRITE_COMBINE);
 	if (!rga->cmdbuf_virt) {
@@ -861,9 +714,6 @@ static int rga_probe(struct platform_device *pdev)
 		goto rel_m2m;
 	}
 
-	def_frame.stride = (def_frame.width * def_frame.fmt->depth) >> 3;
-	def_frame.size = def_frame.stride * def_frame.height;
-
 	ret = video_register_device(vfd, VFL_TYPE_VIDEO, -1);
 	if (ret) {
 		v4l2_err(&rga->v4l2_dev, "Failed to register video device\n");
@@ -876,7 +726,7 @@ static int rga_probe(struct platform_device *pdev)
 	return 0;
 
 free_dma:
-	dma_free_attrs(rga->dev, RGA_CMDBUF_SIZE, rga->cmdbuf_virt,
+	dma_free_attrs(rga->dev, rga->hw->cmdbuf_size, rga->cmdbuf_virt,
 		       rga->cmdbuf_phy, DMA_ATTR_WRITE_COMBINE);
 rel_m2m:
 	v4l2_m2m_release(rga->m2m_dev);
@@ -894,7 +744,7 @@ static void rga_remove(struct platform_device *pdev)
 {
 	struct rockchip_rga *rga = platform_get_drvdata(pdev);
 
-	dma_free_attrs(rga->dev, RGA_CMDBUF_SIZE, rga->cmdbuf_virt,
+	dma_free_attrs(rga->dev, rga->hw->cmdbuf_size, rga->cmdbuf_virt,
 		       rga->cmdbuf_phy, DMA_ATTR_WRITE_COMBINE);
 
 	v4l2_info(&rga->v4l2_dev, "Removing\n");
@@ -930,9 +780,11 @@ static const struct dev_pm_ops rga_pm = {
 static const struct of_device_id rockchip_rga_match[] = {
 	{
 		.compatible = "rockchip,rk3288-rga",
+		.data = &rga2_hw,
 	},
 	{
 		.compatible = "rockchip,rk3399-rga",
+		.data = &rga2_hw,
 	},
 	{},
 };
diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/platform/rockchip/rga/rga.h
index a922fac0c01a3627f5149c78a1560341428a4fc1..61a00f56ce9b31968881e22bef873612b62e21d9 100644
--- a/drivers/media/platform/rockchip/rga/rga.h
+++ b/drivers/media/platform/rockchip/rga/rga.h
@@ -14,6 +14,9 @@
 
 #define RGA_NAME "rockchip-rga"
 
+#define DEFAULT_WIDTH 100
+#define DEFAULT_HEIGHT 100
+
 struct rga_fmt {
 	u32 fourcc;
 	int depth;
@@ -74,6 +77,8 @@ static inline struct rga_ctx *file_to_rga_ctx(struct file *filp)
 	return container_of(file_to_v4l2_fh(filp), struct rga_ctx, fh);
 }
 
+struct rga_hw;
+
 struct rockchip_rga {
 	struct v4l2_device v4l2_dev;
 	struct v4l2_m2m_dev *m2m_dev;
@@ -93,6 +98,8 @@ struct rockchip_rga {
 	struct rga_ctx *curr;
 	dma_addr_t cmdbuf_phy;
 	void *cmdbuf_virt;
+
+	const struct rga_hw *hw;
 };
 
 struct rga_addr_offset {
@@ -143,7 +150,19 @@ static inline void rga_mod(struct rockchip_rga *rga, u32 reg, u32 val, u32 mask)
 	rga_write(rga, reg, temp);
 };
 
-void rga_hw_start(struct rockchip_rga *rga,
-		  struct rga_vb_buffer *src, struct rga_vb_buffer *dst);
+struct rga_hw {
+	struct rga_fmt *formats;
+	u32 num_formats;
+	size_t cmdbuf_size;
+	u32 min_width, min_height;
+	u32 max_width, max_height;
+
+	void (*start)(struct rockchip_rga *rga,
+		      struct rga_vb_buffer *src, struct rga_vb_buffer *dst);
+	bool (*handle_irq)(struct rockchip_rga *rga);
+	void (*get_version)(struct rockchip_rga *rga);
+};
+
+extern const struct rga_hw rga2_hw;
 
 #endif

-- 
2.51.0


