Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7373D262AD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 22:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nL28ERVcYZIpGoMOklaDHV+SEmwByF6jjONKEvLA+nk=; b=rFnYQy/d/fmkW2vnGY329v/b8w
	x9di9vj+3qs83VZj2Uly8Nnzi/Y6ABJob7sylFTz9Id+1DNSVqyTqOWIE0jPxkJn6+ZpiuI9/B/YA
	IGBUjQ1XGW7n+vp1CPzJ4wD+ZzlFIPRXECIDuqG8Kc3HwuWJodkOaFp9rvn+Bl3jLtZ1QW2zmWrwl
	HSaNHAXgXtZNZkNpTxAMSDgpoI+ngCT5rTBArplMAW0A+B3JcTj43vau4z3gDQ4FclAg5hB+GQ/Na
	1UA3G3NN3FqyKS4zJbDaZMn03hDn3ZOiYbWsXbQmkd/k/7rkXBtmtdHABgYLbK0wQCIEyOg3B+gZf
	ZS9TTlkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viK65-00000004XoI-3N8K;
	Tue, 20 Jan 2026 22:21:13 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viK5r-00000004XVq-2pMS;
	Tue, 20 Jan 2026 22:21:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1768947657;
	bh=WBGVUOqJUXT8swZrrQS5TCWpl1mwfEZtqmHfh7//hHw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=d4N2+WuYqfuCMivAN8CZgU1jZHdu+QHoWTkW7GhNCkED6FuDhcbe3dJQNW9UI5UzV
	 FhsTtfqDPYZBfgpPTqNp5BKJF9xMCC+sGo4LQSxH9ZNm4E+4Zmtdruc+BXiawsRFEW
	 QzBQ3eE4LSHUrTd1dJChr24lhNHQZ125Elr70ETfSYc71KAs8ef6CZDOOQhU+pR5Cx
	 H0JWtwNCzlCi4Gcm1/5N+0jqkO3ihb7If3xhfMVxG5hmuMK7HH2UWQ5ENC/VemeJ4M
	 N98oV4/R/deSiu3jCHJKArXLM1mn+6UpdWjv1NintsV0h87EHB9x2kXe4wp5c/a4+Z
	 pWFvFgDIuKPtg==
Received: from earth.mtl.collabora.ca (mtl.collabora.ca [66.171.169.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3629517E0DB7;
	Tue, 20 Jan 2026 23:20:54 +0100 (CET)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Heiko Stuebner <heiko@sntech.de>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Yunke Cao <yunkec@google.com>,
	Hans de Goede <hansg@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Pavan Bobba <opensource206@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	James Cowgill <james.cowgill@blaize.com>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	Jonas Karlman <jonas@kwiboo.se>,
	Diederik de Haas <didi.debian@cknow.org>
Subject: [PATCH v9 09/17] media: rkvdec: Add variant specific coded formats list
Date: Tue, 20 Jan 2026 17:20:09 -0500
Message-ID: <20260120222018.404741-10-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260120222018.404741-1-detlev.casanova@collabora.com>
References: <20260120222018.404741-1-detlev.casanova@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_142059_908374_D383F556 
X-CRM114-Status: GOOD (  18.67  )
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

Prepare for adding new variants of the decoder and support specific
formats and format ops per variant.

This removes the need of capability flags for variants, so remove them.

Tested-by: Diederik de Haas <didi.debian@cknow.org>  # Rock 5B
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 .../media/platform/rockchip/rkvdec/rkvdec.c   | 68 ++++++++++---------
 .../media/platform/rockchip/rkvdec/rkvdec.h   |  8 +--
 2 files changed, 39 insertions(+), 37 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index 776149f871b09..92b1c7b62bd20 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
@@ -328,7 +328,6 @@ static const struct rkvdec_coded_fmt_desc rkvdec_coded_fmts[] = {
 		.ops = &rkvdec_hevc_fmt_ops,
 		.num_decoded_fmts = ARRAY_SIZE(rkvdec_hevc_decoded_fmts),
 		.decoded_fmts = rkvdec_hevc_decoded_fmts,
-		.capability = RKVDEC_CAPABILITY_HEVC,
 	},
 	{
 		.fourcc = V4L2_PIX_FMT_H264_SLICE,
@@ -345,7 +344,6 @@ static const struct rkvdec_coded_fmt_desc rkvdec_coded_fmts[] = {
 		.num_decoded_fmts = ARRAY_SIZE(rkvdec_h264_decoded_fmts),
 		.decoded_fmts = rkvdec_h264_decoded_fmts,
 		.subsystem_flags = VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF,
-		.capability = RKVDEC_CAPABILITY_H264,
 	},
 	{
 		.fourcc = V4L2_PIX_FMT_VP9_FRAME,
@@ -361,27 +359,38 @@ static const struct rkvdec_coded_fmt_desc rkvdec_coded_fmts[] = {
 		.ops = &rkvdec_vp9_fmt_ops,
 		.num_decoded_fmts = ARRAY_SIZE(rkvdec_vp9_decoded_fmts),
 		.decoded_fmts = rkvdec_vp9_decoded_fmts,
-		.capability = RKVDEC_CAPABILITY_VP9,
 	}
 };
 
-static bool rkvdec_is_capable(struct rkvdec_ctx *ctx, unsigned int capability)
-{
-	return (ctx->dev->variant->capabilities & capability) == capability;
-}
+static const struct rkvdec_coded_fmt_desc rk3288_coded_fmts[] = {
+	{
+		.fourcc = V4L2_PIX_FMT_HEVC_SLICE,
+		.frmsize = {
+			.min_width = 64,
+			.max_width = 4096,
+			.step_width = 64,
+			.min_height = 64,
+			.max_height = 2304,
+			.step_height = 16,
+		},
+		.ctrls = &rkvdec_hevc_ctrls,
+		.ops = &rkvdec_hevc_fmt_ops,
+		.num_decoded_fmts = ARRAY_SIZE(rkvdec_hevc_decoded_fmts),
+		.decoded_fmts = rkvdec_hevc_decoded_fmts,
+	}
+};
 
 static const struct rkvdec_coded_fmt_desc *
 rkvdec_enum_coded_fmt_desc(struct rkvdec_ctx *ctx, int index)
 {
+	const struct rkvdec_variant *variant = ctx->dev->variant;
 	int fmt_idx = -1;
 	unsigned int i;
 
-	for (i = 0; i < ARRAY_SIZE(rkvdec_coded_fmts); i++) {
-		if (!rkvdec_is_capable(ctx, rkvdec_coded_fmts[i].capability))
-			continue;
+	for (i = 0; i < variant->num_coded_fmts; i++) {
 		fmt_idx++;
 		if (index == fmt_idx)
-			return &rkvdec_coded_fmts[i];
+			return &variant->coded_fmts[i];
 	}
 
 	return NULL;
@@ -390,12 +399,12 @@ rkvdec_enum_coded_fmt_desc(struct rkvdec_ctx *ctx, int index)
 static const struct rkvdec_coded_fmt_desc *
 rkvdec_find_coded_fmt_desc(struct rkvdec_ctx *ctx, u32 fourcc)
 {
+	const struct rkvdec_variant *variant = ctx->dev->variant;
 	unsigned int i;
 
-	for (i = 0; i < ARRAY_SIZE(rkvdec_coded_fmts); i++) {
-		if (rkvdec_is_capable(ctx, rkvdec_coded_fmts[i].capability) &&
-		    rkvdec_coded_fmts[i].fourcc == fourcc)
-			return &rkvdec_coded_fmts[i];
+	for (i = 0; i < variant->num_coded_fmts; i++) {
+		if (variant->coded_fmts[i].fourcc == fourcc)
+			return &variant->coded_fmts[i];
 	}
 
 	return NULL;
@@ -1014,21 +1023,19 @@ static int rkvdec_add_ctrls(struct rkvdec_ctx *ctx,
 
 static int rkvdec_init_ctrls(struct rkvdec_ctx *ctx)
 {
+	const struct rkvdec_variant *variant = ctx->dev->variant;
 	unsigned int i, nctrls = 0;
 	int ret;
 
-	for (i = 0; i < ARRAY_SIZE(rkvdec_coded_fmts); i++)
-		if (rkvdec_is_capable(ctx, rkvdec_coded_fmts[i].capability))
-			nctrls += rkvdec_coded_fmts[i].ctrls->num_ctrls;
+	for (i = 0; i < variant->num_coded_fmts; i++)
+		nctrls += variant->coded_fmts[i].ctrls->num_ctrls;
 
 	v4l2_ctrl_handler_init(&ctx->ctrl_hdl, nctrls);
 
-	for (i = 0; i < ARRAY_SIZE(rkvdec_coded_fmts); i++) {
-		if (rkvdec_is_capable(ctx, rkvdec_coded_fmts[i].capability)) {
-			ret = rkvdec_add_ctrls(ctx, rkvdec_coded_fmts[i].ctrls);
-			if (ret)
-				goto err_free_handler;
-		}
+	for (i = 0; i < variant->num_coded_fmts; i++) {
+		ret = rkvdec_add_ctrls(ctx, variant->coded_fmts[i].ctrls);
+		if (ret)
+			goto err_free_handler;
 	}
 
 	ret = v4l2_ctrl_handler_setup(&ctx->ctrl_hdl);
@@ -1242,22 +1249,21 @@ static void rkvdec_watchdog_func(struct work_struct *work)
 
 static const struct rkvdec_variant rk3288_rkvdec_variant = {
 	.num_regs = 68,
-	.capabilities = RKVDEC_CAPABILITY_HEVC,
+	.coded_fmts = rk3288_coded_fmts,
+	.num_coded_fmts = ARRAY_SIZE(rk3288_coded_fmts),
 };
 
 static const struct rkvdec_variant rk3328_rkvdec_variant = {
 	.num_regs = 109,
-	.capabilities = RKVDEC_CAPABILITY_HEVC |
-			RKVDEC_CAPABILITY_H264 |
-			RKVDEC_CAPABILITY_VP9,
+	.coded_fmts = rkvdec_coded_fmts,
+	.num_coded_fmts = ARRAY_SIZE(rkvdec_coded_fmts),
 	.quirks = RKVDEC_QUIRK_DISABLE_QOS,
 };
 
 static const struct rkvdec_variant rk3399_rkvdec_variant = {
 	.num_regs = 78,
-	.capabilities = RKVDEC_CAPABILITY_HEVC |
-			RKVDEC_CAPABILITY_H264 |
-			RKVDEC_CAPABILITY_VP9,
+	.coded_fmts = rkvdec_coded_fmts,
+	.num_coded_fmts = ARRAY_SIZE(rkvdec_coded_fmts),
 };
 
 static const struct of_device_id of_rkvdec_match[] = {
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.h b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
index f35f6e80ea2e3..8c4f96ba5cdea 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.h
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
@@ -22,10 +22,6 @@
 #include <media/videobuf2-core.h>
 #include <media/videobuf2-dma-contig.h>
 
-#define RKVDEC_CAPABILITY_HEVC		BIT(0)
-#define RKVDEC_CAPABILITY_H264		BIT(1)
-#define RKVDEC_CAPABILITY_VP9		BIT(2)
-
 #define RKVDEC_QUIRK_DISABLE_QOS	BIT(0)
 
 struct rkvdec_ctx;
@@ -71,7 +67,8 @@ vb2_to_rkvdec_decoded_buf(struct vb2_buffer *buf)
 
 struct rkvdec_variant {
 	unsigned int num_regs;
-	unsigned int capabilities;
+	const struct rkvdec_coded_fmt_desc *coded_fmts;
+	size_t num_coded_fmts;
 	unsigned int quirks;
 };
 
@@ -110,7 +107,6 @@ struct rkvdec_coded_fmt_desc {
 	unsigned int num_decoded_fmts;
 	const struct rkvdec_decoded_fmt_desc *decoded_fmts;
 	u32 subsystem_flags;
-	unsigned int capability;
 };
 
 struct rkvdec_dev {
-- 
2.52.0


