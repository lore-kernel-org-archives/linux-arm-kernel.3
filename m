Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E67F9C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Aug 2025 20:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VpGHpaMtgx6YShuSWbWMJsKzhqLpiklAitiWFWbGHnE=; b=iIEuZoYUPM6+qN3r/CPCaSD2Tu
	5Kkp9KKX/gNIvMVOZeb0lneu/cOzZ9OyT9OZR50B3e9E9vUONhze4fZ4UW7b56oqWHnRdcuguuslJ
	TJpGzoPikv8EBcNvoE8uPhF7YMe5DO7k1KnRyUaRXMtj5N1579cE2QyCVA44gJOGl+q0Y6kaPlQe6
	ppqfZfY5v89G90Do6SK14u2aDO72MMSMi7v0smx9Kq0BAdBjtIZDrFzduwyfh1b5Br54jjPXSkOfP
	XRkHD8blFEcnSkWAP1mQnGSmg2Tw9U9GwHh2W11niIQMX2TMCmSY1OB2YYq9tMADTxpFgbOStAmfW
	GRcJH98w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukTYi-00000003bxV-3nVP;
	Fri, 08 Aug 2025 20:19:24 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukTJk-00000003a6s-1VNN;
	Fri, 08 Aug 2025 20:03:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754683435;
	bh=UZOwAHNTJe+4Lf5Fv80dzrhgTqLUx5Y3CWAEL+Z3Gnk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Zq3cE/tbh45sP9Ayvz0gMjYR3FpP3YJRfN4Br/hFdkUJffvJC9P3SYokD0dCk6G60
	 xHnV/BrDo8R1nWzWvrBH2bLdeqNJXJcO7d4HgWU6KLk5VmyAQcqDe933RDrN6AOZUA
	 /mI1YgeX9l+kDwlSxXfT4VWL618s68AeDugOJ9qwrdIZAxvrXmbM8uFRPNdEmcbQ8Y
	 VREUGkb4rWDGz30UvC7sNLbBU4QIfru1gMivRcg3bd/CYEgMcIZfJkVJkj3mvEOvXq
	 6S27BO+ITkgjADWcGWLFATy0gAmJh23BspPErbndgDFECK4vt6pMu/FVaTsGPWdcIL
	 /Sd0nn/GCwX0w==
Received: from earth.mtl.collabora.ca (mtl.collabora.ca [66.171.169.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E9B4817E1298;
	Fri,  8 Aug 2025 22:03:53 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Detlev Casanova <detlev.casanova@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v2 05/12] media: rkvdec: Add per variant configuration
Date: Fri,  8 Aug 2025 16:03:27 -0400
Message-ID: <20250808200340.156393-6-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250808200340.156393-1-detlev.casanova@collabora.com>
References: <20250808200340.156393-1-detlev.casanova@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_130356_556747_C88E9CE5 
X-CRM114-Status: GOOD (  19.63  )
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

This is to prepare for adding different variants of the decoder and
support specific formats and ops.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 .../media/platform/rockchip/rkvdec/rkvdec.c   | 50 ++++++++++++-------
 .../media/platform/rockchip/rkvdec/rkvdec.h   |  6 +++
 2 files changed, 39 insertions(+), 17 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index a71837103b71d..28585522523c7 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
@@ -286,13 +286,14 @@ static const struct rkvdec_coded_fmt_desc rkvdec_coded_fmts[] = {
 };
 
 static const struct rkvdec_coded_fmt_desc *
-rkvdec_find_coded_fmt_desc(u32 fourcc)
+rkvdec_find_coded_fmt_desc(struct rkvdec_ctx *ctx, u32 fourcc)
 {
+	struct rkvdec_config *cfg = ctx->dev->config;
 	unsigned int i;
 
-	for (i = 0; i < ARRAY_SIZE(rkvdec_coded_fmts); i++) {
-		if (rkvdec_coded_fmts[i].fourcc == fourcc)
-			return &rkvdec_coded_fmts[i];
+	for (i = 0; i < cfg->coded_fmts_num; i++) {
+		if (cfg->coded_fmts[i].fourcc == fourcc)
+			return &cfg->coded_fmts[i];
 	}
 
 	return NULL;
@@ -300,9 +301,10 @@ rkvdec_find_coded_fmt_desc(u32 fourcc)
 
 static void rkvdec_reset_coded_fmt(struct rkvdec_ctx *ctx)
 {
+	struct rkvdec_config *cfg = ctx->dev->config;
 	struct v4l2_format *f = &ctx->coded_fmt;
 
-	ctx->coded_fmt_desc = &rkvdec_coded_fmts[0];
+	ctx->coded_fmt_desc = &cfg->coded_fmts[0];
 	rkvdec_reset_fmt(ctx, f, ctx->coded_fmt_desc->fourcc);
 
 	f->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
@@ -316,12 +318,13 @@ static void rkvdec_reset_coded_fmt(struct rkvdec_ctx *ctx)
 static int rkvdec_enum_framesizes(struct file *file, void *priv,
 				  struct v4l2_frmsizeenum *fsize)
 {
+	struct rkvdec_ctx *ctx = fh_to_rkvdec_ctx(priv);
 	const struct rkvdec_coded_fmt_desc *fmt;
 
 	if (fsize->index != 0)
 		return -EINVAL;
 
-	fmt = rkvdec_find_coded_fmt_desc(fsize->pixel_format);
+	fmt = rkvdec_find_coded_fmt_desc(ctx, fsize->pixel_format);
 	if (!fmt)
 		return -EINVAL;
 
@@ -388,12 +391,13 @@ static int rkvdec_try_output_fmt(struct file *file, void *priv,
 {
 	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
 	struct rkvdec_ctx *ctx = fh_to_rkvdec_ctx(priv);
+	struct rkvdec_config *cfg = ctx->dev->config;
 	const struct rkvdec_coded_fmt_desc *desc;
 
-	desc = rkvdec_find_coded_fmt_desc(pix_mp->pixelformat);
+	desc = rkvdec_find_coded_fmt_desc(ctx, pix_mp->pixelformat);
 	if (!desc) {
-		pix_mp->pixelformat = rkvdec_coded_fmts[0].fourcc;
-		desc = &rkvdec_coded_fmts[0];
+		pix_mp->pixelformat = cfg->coded_fmts[0].fourcc;
+		desc = &cfg->coded_fmts[0];
 	}
 
 	v4l2_apply_frmsize_constraints(&pix_mp->width,
@@ -470,7 +474,7 @@ static int rkvdec_s_output_fmt(struct file *file, void *priv,
 	if (ret)
 		return ret;
 
-	desc = rkvdec_find_coded_fmt_desc(f->fmt.pix_mp.pixelformat);
+	desc = rkvdec_find_coded_fmt_desc(ctx, f->fmt.pix_mp.pixelformat);
 	if (!desc)
 		return -EINVAL;
 	ctx->coded_fmt_desc = desc;
@@ -522,10 +526,13 @@ static int rkvdec_g_capture_fmt(struct file *file, void *priv,
 static int rkvdec_enum_output_fmt(struct file *file, void *priv,
 				  struct v4l2_fmtdesc *f)
 {
-	if (f->index >= ARRAY_SIZE(rkvdec_coded_fmts))
+	struct rkvdec_ctx *ctx = fh_to_rkvdec_ctx(priv);
+	struct rkvdec_config *cfg = ctx->dev->config;
+
+	if (f->index >= cfg->coded_fmts_num)
 		return -EINVAL;
 
-	f->pixelformat = rkvdec_coded_fmts[f->index].fourcc;
+	f->pixelformat = cfg->coded_fmts[f->index].fourcc;
 	return 0;
 }
 
@@ -895,16 +902,17 @@ static int rkvdec_add_ctrls(struct rkvdec_ctx *ctx,
 
 static int rkvdec_init_ctrls(struct rkvdec_ctx *ctx)
 {
+	struct rkvdec_config *cfg = ctx->dev->config;
 	unsigned int i, nctrls = 0;
 	int ret;
 
-	for (i = 0; i < ARRAY_SIZE(rkvdec_coded_fmts); i++)
-		nctrls += rkvdec_coded_fmts[i].ctrls->num_ctrls;
+	for (i = 0; i < cfg->coded_fmts_num; i++)
+		nctrls += cfg->coded_fmts[i].ctrls->num_ctrls;
 
 	v4l2_ctrl_handler_init(&ctx->ctrl_hdl, nctrls);
 
-	for (i = 0; i < ARRAY_SIZE(rkvdec_coded_fmts); i++) {
-		ret = rkvdec_add_ctrls(ctx, rkvdec_coded_fmts[i].ctrls);
+	for (i = 0; i < cfg->coded_fmts_num; i++) {
+		ret = rkvdec_add_ctrls(ctx, cfg->coded_fmts[i].ctrls);
 		if (ret)
 			goto err_free_handler;
 	}
@@ -1119,8 +1127,13 @@ static void rkvdec_watchdog_func(struct work_struct *work)
 	}
 }
 
+const struct rkvdec_config config_rkvdec = {
+	.coded_fmts = (struct rkvdec_coded_fmt_desc *)rkvdec_coded_fmts,
+	.coded_fmts_num = ARRAY_SIZE(rkvdec_coded_fmts),
+};
+
 static const struct of_device_id of_rkvdec_match[] = {
-	{ .compatible = "rockchip,rk3399-vdec" },
+	{ .compatible = "rockchip,rk3399-vdec", .data = &config_rkvdec },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, of_rkvdec_match);
@@ -1144,6 +1157,9 @@ static int rkvdec_probe(struct platform_device *pdev)
 	mutex_init(&rkvdec->vdev_lock);
 	INIT_DELAYED_WORK(&rkvdec->watchdog_work, rkvdec_watchdog_func);
 
+	rkvdec->config =
+		(struct rkvdec_config *)of_device_get_match_data(rkvdec->dev);
+
 	rkvdec->clocks = devm_kcalloc(&pdev->dev, ARRAY_SIZE(rkvdec_clk_names),
 				      sizeof(*rkvdec->clocks), GFP_KERNEL);
 	if (!rkvdec->clocks)
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.h b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
index 3451c4bf7cb75..14717c646c665 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.h
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
@@ -100,6 +100,11 @@ struct rkvdec_coded_fmt_desc {
 	u32 subsystem_flags;
 };
 
+struct rkvdec_config {
+	struct rkvdec_coded_fmt_desc *coded_fmts;
+	size_t coded_fmts_num;
+};
+
 struct rkvdec_dev {
 	struct v4l2_device v4l2_dev;
 	struct media_device mdev;
@@ -111,6 +116,7 @@ struct rkvdec_dev {
 	struct mutex vdev_lock; /* serializes ioctls */
 	struct delayed_work watchdog_work;
 	struct iommu_domain *empty_domain;
+	struct rkvdec_config *config;
 };
 
 struct rkvdec_ctx {
-- 
2.50.1


