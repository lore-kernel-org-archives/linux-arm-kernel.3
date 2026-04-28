Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83D84FF886C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 09:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jFrt9SrV4/xHV3t9W9tUYnaOe4YGP224Ni0I1KIQXP4=; b=wk1gg2x8UHb6pzKLL4T4ZAMF29
	MPT2N0E1pouJT2rT4D8BbAEGPTd6gckJzs96yGnKyUtJ+sDATnIgyn1YhzHL2dWZIx+epvTwOqKOt
	bDfzT2wupmKsTQ3iZl7XUK5BPVlnGhEHWs6graOLU307LYxmeqjZXBJs3ICgBTkaZpS26AmnEJPm8
	8zFLJFeMACBBAQhnxINaWPh4k78Z0/MOdQkYPLoyxGZWk0e6pl5xAA08+PqxwMOhdGEKVV8H38P/B
	CqJ39lAoy390iE8MQWd3ZYBnoyOi48UB/W8HMiUQPAov1x0bCzM+62EvA0o2a8L/GYBN5vzieHR8p
	39jOWGlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHeL2-00000000zC4-2x7k;
	Tue, 28 Apr 2026 09:02:40 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHeJw-00000000xne-0hij
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 09:01:44 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1wHeJG-0004Lz-9x; Tue, 28 Apr 2026 11:00:50 +0200
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Tue, 28 Apr 2026 11:00:51 +0200
Subject: [PATCH v5 16/29] media: rockchip: rga: split flip and rotate into
 separate function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260428-spu-rga3-v5-16-eb7f5d019d86@pengutronix.de>
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
 =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
X-Mailer: b4 0.15.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.pueschel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_020132_209700_2D332309 
X-CRM114-Status: GOOD (  12.65  )
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

Split the flip and rotate command configuration into a separate
function in preparation of filling the command stream at streamon.
As the userspace can change the flipping and rotation controls while
streaming, we have to update them with each new frame to prevent the
user being unable to change them while streaming.

Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
---
 drivers/media/platform/rockchip/rga/rga-hw.c | 57 +++++++++++++++++-----------
 1 file changed, 34 insertions(+), 23 deletions(-)

diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c b/drivers/media/platform/rockchip/rga/rga-hw.c
index dac3cb6aa17d3..6c1956b04f6ba 100644
--- a/drivers/media/platform/rockchip/rga/rga-hw.c
+++ b/drivers/media/platform/rockchip/rga/rga-hw.c
@@ -156,7 +156,38 @@ static void rga_cmd_set_dst_addr(struct rga_ctx *ctx, dma_addr_t dma_addr)
 	dest[reg >> 2] |= 0x7 << 8;
 }
 
-static void rga_cmd_set_trans_info(struct rga_ctx *ctx)
+static void rga_cmd_set_flip_rotate_info(struct rga_ctx *ctx)
+{
+	u32 *dest = ctx->cmdbuf_virt;
+	union rga_src_info src_info;
+
+	src_info.val = dest[(RGA_SRC_INFO - RGA_MODE_BASE_REG) >> 2];
+
+	if (ctx->vflip)
+		src_info.data.mir_mode |= RGA_SRC_MIRR_MODE_X;
+
+	if (ctx->hflip)
+		src_info.data.mir_mode |= RGA_SRC_MIRR_MODE_Y;
+
+	switch (ctx->rotate) {
+	case 90:
+		src_info.data.rot_mode = RGA_SRC_ROT_MODE_90_DEGREE;
+		break;
+	case 180:
+		src_info.data.rot_mode = RGA_SRC_ROT_MODE_180_DEGREE;
+		break;
+	case 270:
+		src_info.data.rot_mode = RGA_SRC_ROT_MODE_270_DEGREE;
+		break;
+	default:
+		src_info.data.rot_mode = RGA_SRC_ROT_MODE_0_DEGREE;
+		break;
+	}
+
+	dest[(RGA_SRC_INFO - RGA_MODE_BASE_REG) >> 2] = src_info.val;
+}
+
+static void rga_cmd_set_format_scale_info(struct rga_ctx *ctx)
 {
 	struct rockchip_rga *rga = ctx->rga;
 	u32 *dest = ctx->cmdbuf_virt;
@@ -219,27 +250,6 @@ static void rga_cmd_set_trans_info(struct rga_ctx *ctx)
 		}
 	}
 
-	if (ctx->vflip)
-		src_info.data.mir_mode |= RGA_SRC_MIRR_MODE_X;
-
-	if (ctx->hflip)
-		src_info.data.mir_mode |= RGA_SRC_MIRR_MODE_Y;
-
-	switch (ctx->rotate) {
-	case 90:
-		src_info.data.rot_mode = RGA_SRC_ROT_MODE_90_DEGREE;
-		break;
-	case 180:
-		src_info.data.rot_mode = RGA_SRC_ROT_MODE_180_DEGREE;
-		break;
-	case 270:
-		src_info.data.rot_mode = RGA_SRC_ROT_MODE_270_DEGREE;
-		break;
-	default:
-		src_info.data.rot_mode = RGA_SRC_ROT_MODE_0_DEGREE;
-		break;
-	}
-
 	/*
 	 * Calculate the up/down scaling mode/factor.
 	 *
@@ -431,7 +441,8 @@ static void rga_cmd_set(struct rga_ctx *ctx,
 
 	rga_cmd_set_src_info(ctx, &src->offset);
 	rga_cmd_set_dst_info(ctx, &dst->offset);
-	rga_cmd_set_trans_info(ctx);
+	rga_cmd_set_format_scale_info(ctx);
+	rga_cmd_set_flip_rotate_info(ctx);
 
 	rga_write(rga, RGA_CMD_BASE, ctx->cmdbuf_phy);
 

-- 
2.54.0


