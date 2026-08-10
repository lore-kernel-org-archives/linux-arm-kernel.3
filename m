Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE6B5C5B56D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 15:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RPpaa7v7czKDTs/GYzJ06dEEc1xejJLRTaMW4VOqtyo=; b=hxuBW1gafqHv3+WptaMkueiD3T
	7ztIqEXCWqOCn5vnY6LdaAFomHwEwsP+l1Ewhv6UI3vjCOoA5nYlTpODv1esR+l5vdwb3IyRZpl1c
	BdbqcERZFwW9ZX7tKPwEbDfS41y3QTc2tfNfjVmDb+SeGrS82KsfIsgP+iKbydNC02PJkjwNR8uKb
	EKMcgdXYUY2p89PpYpAGybECFU1FLmrcG6+J37HxZKLB9vxcfqqSPSDxrLx2DzDvz6h0MBH+nwGgY
	1a9KOM4iXlZWOZzm+HoAufai4RiyEHBHh5KVj3NLKdhk0GLg0dCIPEy8xNI2HxZnVoFOUNb8RNHto
	bKEu17wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtRpf-0000000CDOG-0lqi;
	Mon, 10 Aug 2026 15:22:31 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtRpb-0000000CDJU-1EpL;
	Mon, 10 Aug 2026 15:22:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1786375342;
	bh=e71GDVW7JWrMuo4GRQ4jmJJ53lTpZaHnnvO0b/ljVaw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ZXVL1KP3rmA4kk5VU4wUurorKVvcVqgkaybOifIOJRVRmQvPn43oXGe+IwOn3JKAC
	 q9+naFcgnzUj/cfisJelxbiVc30ZsgToGaWrduqq+B2dCPbTdudKwT/oLhO3R/+PQt
	 QpDpx/gW9kWjNlrJ0SsDGSxDvYCnUw+NAGArX6IijQ6tAWH/z2go/TbXMteBsvdJzK
	 ZnpjmB/zSPlA0YAkrqYwYV+2eA16808lueF3YuIIAlTsHVrHdZET9QIOJ9fPkpf7ro
	 Zo79o9M0aF1p9hOhGQfozw1FeZZdKbRu+lpz/l1TaAaH3zQod6jqIymVAva1FVKEwl
	 2IxcMKmlPPrsg==
Received: from [192.168.0.15] (unknown [100.64.0.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5B34D17E080A;
	Mon, 10 Aug 2026 17:22:21 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
Date: Mon, 10 Aug 2026 11:22:11 -0400
Subject: [PATCH v2 1/5] media: rkvdec: Keep RCB to the correct size
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-rkvdec-multicore-v2-1-986f89d22cdc@collabora.com>
References: <20260810-rkvdec-multicore-v2-0-986f89d22cdc@collabora.com>
In-Reply-To: <20260810-rkvdec-multicore-v2-0-986f89d22cdc@collabora.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, Jonas Karlman <jonas@kwiboo.se>
Cc: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>, 
 kernel@collabora.com, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Detlev Casanova <detlev.casanova@collabora.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_082227_490374_AC9F6B9D 
X-CRM114-Status: GOOD (  17.40  )
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

Currently, if a video changes resolution, the RCB size might be too small
and the HW could try to write out of the allocated buffer.

To fix that, make sure that the RCB size is validated for each run and
increase the buffer size when needed.

Fixes: e5640dbb991c ("media: rkvdec: Add RCB and SRAM support")
Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 .../media/platform/rockchip/rkvdec/rkvdec-rcb.c    | 26 +++++++++++++++---
 .../media/platform/rockchip/rkvdec/rkvdec-rcb.h    |  3 ++-
 drivers/media/platform/rockchip/rkvdec/rkvdec.c    | 31 +++++++++++-----------
 3 files changed, 40 insertions(+), 20 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.c
index fdcf1f177379..191f78278c01 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.c
@@ -17,6 +17,8 @@
 struct rkvdec_rcb_config {
 	struct rkvdec_aux_buf *rcb_bufs;
 	size_t rcb_count;
+	u32 width;
+	u32 height;
 };
 
 static size_t rkvdec_rcb_size(const struct rcb_size_info *size_info,
@@ -40,6 +42,21 @@ int rkvdec_rcb_buf_count(struct rkvdec_ctx *ctx)
 	return ctx->rcb_config->rcb_count;
 }
 
+bool rkvdec_rcb_buf_validate_size(struct rkvdec_ctx *ctx)
+{
+	struct rkvdec_rcb_config *cfg = ctx->rcb_config;
+
+	bool ret = cfg && cfg->height >= ctx->decoded_fmt.fmt.pix_mp.height &&
+		   cfg->width >= ctx->decoded_fmt.fmt.pix_mp.width;
+
+	if (!ret && cfg) {
+		dev_dbg(ctx->dev->dev, "RCB size %ux%u -> %ux%u\n", cfg->width, cfg->height,
+			ctx->decoded_fmt.fmt.pix_mp.width, ctx->decoded_fmt.fmt.pix_mp.height);
+	}
+
+	return ret;
+}
+
 void rkvdec_free_rcb(struct rkvdec_ctx *ctx)
 {
 	struct rkvdec_dev *dev = ctx->dev;
@@ -77,14 +94,15 @@ void rkvdec_free_rcb(struct rkvdec_ctx *ctx)
 		devm_kfree(dev->dev, cfg->rcb_bufs);
 
 	devm_kfree(dev->dev, cfg);
+
+	ctx->rcb_config = NULL;
 }
 
-int rkvdec_allocate_rcb(struct rkvdec_ctx *ctx,
+int rkvdec_allocate_rcb(struct rkvdec_ctx *ctx, u32 width, u32 height,
 			const struct rcb_size_info *size_info,
 			size_t rcb_count)
 {
 	int ret, i;
-	u32 width, height;
 	struct rkvdec_dev *rkvdec = ctx->dev;
 	struct rkvdec_rcb_config *cfg;
 
@@ -105,8 +123,8 @@ int rkvdec_allocate_rcb(struct rkvdec_ctx *ctx,
 		goto err_alloc;
 	}
 
-	width = ctx->decoded_fmt.fmt.pix_mp.width;
-	height = ctx->decoded_fmt.fmt.pix_mp.height;
+	cfg->width = width;
+	cfg->height = height;
 
 	for (i = 0; i < rcb_count; i++) {
 		void *cpu = NULL;
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.h b/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.h
index 30e8002555c8..0662a4359bdf 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.h
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.h
@@ -20,10 +20,11 @@ struct rcb_size_info {
 	enum rcb_axis axis;
 };
 
-int rkvdec_allocate_rcb(struct rkvdec_ctx *ctx,
+int rkvdec_allocate_rcb(struct rkvdec_ctx *ctx, u32 width, u32 height,
 			const struct rcb_size_info *size_info,
 			size_t rcb_count);
 dma_addr_t rkvdec_rcb_buf_dma_addr(struct rkvdec_ctx *ctx, int id);
 size_t rkvdec_rcb_buf_size(struct rkvdec_ctx *ctx, int id);
 int rkvdec_rcb_buf_count(struct rkvdec_ctx *ctx);
+bool rkvdec_rcb_buf_validate_size(struct rkvdec_ctx *ctx);
 void rkvdec_free_rcb(struct rkvdec_ctx *ctx);
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index 1d1e9bfef8e9..31ddfcc58894 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
@@ -978,8 +978,7 @@ static int rkvdec_start_streaming(struct vb2_queue *q, unsigned int count)
 {
 	struct rkvdec_ctx *ctx = vb2_get_drv_priv(q);
 	const struct rkvdec_coded_fmt_desc *desc;
-	const struct rkvdec_variant *variant = ctx->dev->variant;
-	int ret;
+	int ret = 0;
 
 	if (V4L2_TYPE_IS_CAPTURE(q->type))
 		return 0;
@@ -988,20 +987,8 @@ static int rkvdec_start_streaming(struct vb2_queue *q, unsigned int count)
 	if (WARN_ON(!desc))
 		return -EINVAL;
 
-	ret = rkvdec_allocate_rcb(ctx, variant->rcb_sizes, variant->num_rcb_sizes);
-	if (ret)
-		return ret;
-
-	if (desc->ops->start) {
+	if (desc->ops->start)
 		ret = desc->ops->start(ctx);
-		if (ret)
-			goto err_ops_start;
-	}
-
-	return 0;
-
-err_ops_start:
-	rkvdec_free_rcb(ctx);
 
 	return ret;
 }
@@ -1174,6 +1161,20 @@ static void rkvdec_device_run(void *priv)
 		return;
 	}
 
+	if (!rkvdec_rcb_buf_validate_size(ctx)) {
+		rkvdec_free_rcb(ctx);
+
+		ret = rkvdec_allocate_rcb(ctx,
+					  ctx->decoded_fmt.fmt.pix_mp.width,
+					  ctx->decoded_fmt.fmt.pix_mp.height,
+					  ctx->dev->variant->rcb_sizes,
+					  ctx->dev->variant->num_rcb_sizes);
+		if (ret) {
+			rkvdec_job_finish(ctx, VB2_BUF_STATE_ERROR);
+			return;
+		}
+	}
+
 	ret = desc->ops->run(ctx);
 	if (ret)
 		rkvdec_job_finish(ctx, VB2_BUF_STATE_ERROR);

-- 
2.55.0


