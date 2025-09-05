Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45F36CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 19:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jsQ9JGf1qPemLxXlWU5ctSTecIqZzqL5Gbd4uM4ZRNc=; b=SRIcz4PCRxjHvEcJHYslv312KV
	sA0lF9FEsIGUZx6lQw0k73Jn5bfrvaMWw58vzs/vuleHN1/E+FA9o017YfvKwmV1GdpQ+2vBF1ExY
	4VS6XTdZ2KeCXsaEdw2uOcWMaHz9+d7V5v96O6SMoxyHBIKhB6w4qBh/c+yUeoBHMxipwusR/RwvP
	MBmhu6Nt1iDkWbRW117HMvbuzW4Vfpv1pQsIbfuV3G2fCEXui/j0EHLJ38hX6Qkbw7PbhASmH+fPu
	vh6f2hhvOGDkHYXmlkGTvaNAoF6NgJzv1o0VEIQk4JcEIx5jR/oxLJy+42CLLrzVIL43KiZLxbdNv
	DljtRr7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uucAq-00000004BXh-18BJ;
	Fri, 05 Sep 2025 19:32:40 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuZAc-000000033ub-0V8t
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 16:20:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1757089213; bh=jsQ9JGf1qPemLxXlWU5ctSTecIqZzqL5Gbd4uM4ZRNc=;
 b=tVdPeGIK1sJaPla/BX0NUXp2fu7hgicQvmYowiQ1b++Qwd0sy5D7nCGOJvamLkn0bi3B7SVND
 QzVFuWtH8tA0T1wfVmAk3WolLYqlZ2nmpZJioIE21ogn2smYdpmYAAHlr7ZJzR3/6VQ/QtQD246
 KbNFHwS6khPBPxL5hg0i/HVNXXyvRwKWyy7kdhavjDm0879H7P4yPN23+TkZEA+jvQ5BRHxnCBp
 mKi23YzjEyQMHnvY8c9IY/1yJzmssEf9cXzWKGbaQTj2AJ8S5XDqhGKwQmnM0SxztzJpzAWdwVu
 B0yDq+7C2fAi4FVSJJ00aSXIDRvOEbKwBS98BHYQYBQQ==
X-Forward-Email-ID: 68bb0db890d039a4fd84d604
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 1.2.13
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Alex Bee <knaerzche@gmail.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH v3 3/7] media: rkvdec: Implement capability filtering
Date: Fri,  5 Sep 2025 16:19:21 +0000
Message-ID: <20250905161942.3759717-4-jonas@kwiboo.se>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250905161942.3759717-1-jonas@kwiboo.se>
References: <20250905161942.3759717-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_092014_193030_4C75BE0D 
X-CRM114-Status: GOOD (  17.60  )
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

Add filtering of coded formats and controls depending on a variant
capabilities.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
Changes in v3:
- Change to use file_to_rkvdec_ctx()
- Use capabilities from rkvdec_variant
- Collect r-b tag

Changes in v2:
- Adjust code style in rkvdec_enum_coded_fmt_desc()
---
 .../media/platform/rockchip/rkvdec/rkvdec.c   | 67 ++++++++++++++-----
 1 file changed, 49 insertions(+), 18 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index daf6d9ab2d1d..088ddfadf995 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
@@ -365,13 +365,36 @@ static const struct rkvdec_coded_fmt_desc rkvdec_coded_fmts[] = {
 	}
 };
 
+static bool rkvdec_is_capable(struct rkvdec_ctx *ctx, unsigned int capability)
+{
+	return (ctx->dev->variant->capabilities & capability) == capability;
+}
+
 static const struct rkvdec_coded_fmt_desc *
-rkvdec_find_coded_fmt_desc(u32 fourcc)
+rkvdec_enum_coded_fmt_desc(struct rkvdec_ctx *ctx, int index)
 {
+	int fmt_idx = -1;
 	unsigned int i;
 
 	for (i = 0; i < ARRAY_SIZE(rkvdec_coded_fmts); i++) {
-		if (rkvdec_coded_fmts[i].fourcc == fourcc)
+		if (!rkvdec_is_capable(ctx, rkvdec_coded_fmts[i].capability))
+			continue;
+		fmt_idx++;
+		if (index == fmt_idx)
+			return &rkvdec_coded_fmts[i];
+	}
+
+	return NULL;
+}
+
+static const struct rkvdec_coded_fmt_desc *
+rkvdec_find_coded_fmt_desc(struct rkvdec_ctx *ctx, u32 fourcc)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(rkvdec_coded_fmts); i++) {
+		if (rkvdec_is_capable(ctx, rkvdec_coded_fmts[i].capability) &&
+		    rkvdec_coded_fmts[i].fourcc == fourcc)
 			return &rkvdec_coded_fmts[i];
 	}
 
@@ -382,7 +405,7 @@ static void rkvdec_reset_coded_fmt(struct rkvdec_ctx *ctx)
 {
 	struct v4l2_format *f = &ctx->coded_fmt;
 
-	ctx->coded_fmt_desc = &rkvdec_coded_fmts[0];
+	ctx->coded_fmt_desc = rkvdec_enum_coded_fmt_desc(ctx, 0);
 	rkvdec_reset_fmt(ctx, f, ctx->coded_fmt_desc->fourcc);
 
 	f->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
@@ -396,21 +419,22 @@ static void rkvdec_reset_coded_fmt(struct rkvdec_ctx *ctx)
 static int rkvdec_enum_framesizes(struct file *file, void *priv,
 				  struct v4l2_frmsizeenum *fsize)
 {
-	const struct rkvdec_coded_fmt_desc *fmt;
+	struct rkvdec_ctx *ctx = file_to_rkvdec_ctx(file);
+	const struct rkvdec_coded_fmt_desc *desc;
 
 	if (fsize->index != 0)
 		return -EINVAL;
 
-	fmt = rkvdec_find_coded_fmt_desc(fsize->pixel_format);
-	if (!fmt)
+	desc = rkvdec_find_coded_fmt_desc(ctx, fsize->pixel_format);
+	if (!desc)
 		return -EINVAL;
 
 	fsize->type = V4L2_FRMSIZE_TYPE_CONTINUOUS;
 	fsize->stepwise.min_width = 1;
-	fsize->stepwise.max_width = fmt->frmsize.max_width;
+	fsize->stepwise.max_width = desc->frmsize.max_width;
 	fsize->stepwise.step_width = 1;
 	fsize->stepwise.min_height = 1;
-	fsize->stepwise.max_height = fmt->frmsize.max_height;
+	fsize->stepwise.max_height = desc->frmsize.max_height;
 	fsize->stepwise.step_height = 1;
 
 	return 0;
@@ -470,10 +494,10 @@ static int rkvdec_try_output_fmt(struct file *file, void *priv,
 	struct rkvdec_ctx *ctx = file_to_rkvdec_ctx(file);
 	const struct rkvdec_coded_fmt_desc *desc;
 
-	desc = rkvdec_find_coded_fmt_desc(pix_mp->pixelformat);
+	desc = rkvdec_find_coded_fmt_desc(ctx, pix_mp->pixelformat);
 	if (!desc) {
-		pix_mp->pixelformat = rkvdec_coded_fmts[0].fourcc;
-		desc = &rkvdec_coded_fmts[0];
+		desc = rkvdec_enum_coded_fmt_desc(ctx, 0);
+		pix_mp->pixelformat = desc->fourcc;
 	}
 
 	v4l2_apply_frmsize_constraints(&pix_mp->width,
@@ -550,7 +574,7 @@ static int rkvdec_s_output_fmt(struct file *file, void *priv,
 	if (ret)
 		return ret;
 
-	desc = rkvdec_find_coded_fmt_desc(f->fmt.pix_mp.pixelformat);
+	desc = rkvdec_find_coded_fmt_desc(ctx, f->fmt.pix_mp.pixelformat);
 	if (!desc)
 		return -EINVAL;
 	ctx->coded_fmt_desc = desc;
@@ -602,10 +626,14 @@ static int rkvdec_g_capture_fmt(struct file *file, void *priv,
 static int rkvdec_enum_output_fmt(struct file *file, void *priv,
 				  struct v4l2_fmtdesc *f)
 {
-	if (f->index >= ARRAY_SIZE(rkvdec_coded_fmts))
+	struct rkvdec_ctx *ctx = file_to_rkvdec_ctx(file);
+	const struct rkvdec_coded_fmt_desc *desc;
+
+	desc = rkvdec_enum_coded_fmt_desc(ctx, f->index);
+	if (!desc)
 		return -EINVAL;
 
-	f->pixelformat = rkvdec_coded_fmts[f->index].fourcc;
+	f->pixelformat = desc->fourcc;
 	return 0;
 }
 
@@ -970,14 +998,17 @@ static int rkvdec_init_ctrls(struct rkvdec_ctx *ctx)
 	int ret;
 
 	for (i = 0; i < ARRAY_SIZE(rkvdec_coded_fmts); i++)
-		nctrls += rkvdec_coded_fmts[i].ctrls->num_ctrls;
+		if (rkvdec_is_capable(ctx, rkvdec_coded_fmts[i].capability))
+			nctrls += rkvdec_coded_fmts[i].ctrls->num_ctrls;
 
 	v4l2_ctrl_handler_init(&ctx->ctrl_hdl, nctrls);
 
 	for (i = 0; i < ARRAY_SIZE(rkvdec_coded_fmts); i++) {
-		ret = rkvdec_add_ctrls(ctx, rkvdec_coded_fmts[i].ctrls);
-		if (ret)
-			goto err_free_handler;
+		if (rkvdec_is_capable(ctx, rkvdec_coded_fmts[i].capability)) {
+			ret = rkvdec_add_ctrls(ctx, rkvdec_coded_fmts[i].ctrls);
+			if (ret)
+				goto err_free_handler;
+		}
 	}
 
 	ret = v4l2_ctrl_handler_setup(&ctx->ctrl_hdl);
-- 
2.51.0


