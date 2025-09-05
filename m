Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89F44CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 19:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZhaC+ulaf1xOTD0OmHuMFDx2uPJN7rg7I4X0/WJ2j0s=; b=Ibgzd7eczYT2s7EI5Q9PFdPQ7A
	gTYtmBMgT3gBQtYlqM9mtB+m6PJVncE8VcbiYDsCtVOVDuIBjYugX5c51p+OfJO0tWDhgaqhaPzfB
	UWH9gbmdfyv+Aj7TqpHG2NMAVBO+LsEMPMqE5KD6pI4M77moju4h1p6NzytXtzygRE+msBOK37gTT
	d6pgJRtYBy3wxqkebBd8Sp3a4NvRh1MTujvaq2WFWCkLqjQihMclELKte4MoeNoJ0w5U5hvp8Di7p
	3hVwKDOIn3rfLMd/Eqchy3xVw/sv231GW5CcIxFbnPWlsUCSMzIqRAAh7O2/OlXmKmxh2obuKpBS3
	1E4mHefA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uucJE-00000004EC4-3LFE;
	Fri, 05 Sep 2025 19:41:20 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuZAl-000000033zR-3xjn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 16:20:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1757089223; bh=ZhaC+ulaf1xOTD0OmHuMFDx2uPJN7rg7I4X0/WJ2j0s=;
 b=RmG+bNRWdZFWQRXoZypcDvEE/v3BIGzqEq3NPsI8fw8p7IV0PbYNbnkpI5zagyCp4+Vybde1r
 GfzwL8IGZubBrUUckkZTbcyY6KgWKkxMr6XzZsr5c7fSa4cciM+p5jnd2SdcZi0yZQ/D3rOAFwb
 37UuTcrWBu8vb430gGxS6BxJk14s6HtZuI6amktOFag3QQtBccOS10ov3OeIV4lDEg21WwROtrQ
 LI962atX/Y+ayKmBPcCn0UGMQZDEeUXWFB7QH9XXMSwnpZmxLKN/jcI9I5KOA7iQazoPOtuqKiv
 RESHqOkpx3qevprCaPXa6PIemJSHVs2p8nsStjKxZo2g==
X-Forward-Email-ID: 68bb0dc290d039a4fd84d663
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
Subject: [PATCH v3 5/7] media: rkvdec: Disable QoS for HEVC and VP9 on RK3328
Date: Fri,  5 Sep 2025 16:19:23 +0000
Message-ID: <20250905161942.3759717-6-jonas@kwiboo.se>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250905161942.3759717-1-jonas@kwiboo.se>
References: <20250905161942.3759717-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_092024_031722_A98223A7 
X-CRM114-Status: GOOD (  16.25  )
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

From: Alex Bee <knaerzche@gmail.com>

The RK3328 VDEC has a HW quirk that require QoS to be disabled when HEVC
or VP9 is decoded, otherwise the decoded picture may become corrupted.

Add a RK3328 variant with a quirk flag to disable QoS when before
decoding is started.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
Changes in v3:
- Add rkvdec_quirks_disable_qos() helper to apply qos quirk
- Use quirks from rkvdec_variant
- Add num_regs field

Changes in v2:
- No change
---
 .../platform/rockchip/rkvdec/rkvdec-hevc.c    |  3 +++
 .../platform/rockchip/rkvdec/rkvdec-regs.h    |  2 ++
 .../platform/rockchip/rkvdec/rkvdec-vp9.c     |  4 ++++
 .../media/platform/rockchip/rkvdec/rkvdec.c   | 24 +++++++++++++++++++
 .../media/platform/rockchip/rkvdec/rkvdec.h   |  5 ++++
 5 files changed, 38 insertions(+)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
index 9b5cf70188db..fc7e6a260b0a 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
@@ -789,6 +789,9 @@ static int rkvdec_hevc_run(struct rkvdec_ctx *ctx)
 	writel(1, rkvdec->regs + RKVDEC_REG_PREF_LUMA_CACHE_COMMAND);
 	writel(1, rkvdec->regs + RKVDEC_REG_PREF_CHR_CACHE_COMMAND);
 
+	if (rkvdec->variant->quirks & RKVDEC_QUIRK_DISABLE_QOS)
+		rkvdec_quirks_disable_qos(ctx);
+
 	/* Start decoding! */
 	reg = (run.pps->flags & V4L2_HEVC_PPS_FLAG_TILES_ENABLED) ?
 		0 : RKVDEC_WR_DDR_ALIGN_EN;
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-regs.h b/drivers/media/platform/rockchip/rkvdec/rkvdec-regs.h
index 540c8bdf24e4..c627b6b6f53a 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-regs.h
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-regs.h
@@ -219,6 +219,8 @@
 #define RKVDEC_REG_H264_ERR_E				0x134
 #define RKVDEC_H264_ERR_EN_HIGHBITS(x)			((x) & 0x3fffffff)
 
+#define RKVDEC_REG_QOS_CTRL				0x18C
+
 #define RKVDEC_REG_PREF_LUMA_CACHE_COMMAND		0x410
 #define RKVDEC_REG_PREF_CHR_CACHE_COMMAND		0x450
 
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c
index 0e7e16f20eeb..b4bf01e839ef 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c
@@ -824,6 +824,10 @@ static int rkvdec_vp9_run(struct rkvdec_ctx *ctx)
 	writel(1, rkvdec->regs + RKVDEC_REG_PREF_CHR_CACHE_COMMAND);
 
 	writel(0xe, rkvdec->regs + RKVDEC_REG_STRMD_ERR_EN);
+
+	if (rkvdec->variant->quirks & RKVDEC_QUIRK_DISABLE_QOS)
+		rkvdec_quirks_disable_qos(ctx);
+
 	/* Start decoding! */
 	writel(RKVDEC_INTERRUPT_DEC_E | RKVDEC_CONFIG_DEC_CLK_GATE_E |
 	       RKVDEC_TIMEOUT_E | RKVDEC_BUF_EMPTY_E,
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index f8cbc7bcfa15..2d7d20653e4c 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
@@ -903,6 +903,18 @@ void rkvdec_run_postamble(struct rkvdec_ctx *ctx, struct rkvdec_run *run)
 		v4l2_ctrl_request_complete(src_req, &ctx->ctrl_hdl);
 }
 
+void rkvdec_quirks_disable_qos(struct rkvdec_ctx *ctx)
+{
+	struct rkvdec_dev *rkvdec = ctx->dev;
+	u32 reg;
+
+	/* Set undocumented swreg_block_gating_e field */
+	reg = readl(rkvdec->regs + RKVDEC_REG_QOS_CTRL);
+	reg &= GENMASK(31, 16);
+	reg |= 0xEFFF;
+	writel(reg, rkvdec->regs + RKVDEC_REG_QOS_CTRL);
+}
+
 static void rkvdec_device_run(void *priv)
 {
 	struct rkvdec_ctx *ctx = priv;
@@ -1226,6 +1238,14 @@ static const struct rkvdec_variant rk3288_rkvdec_variant = {
 	.capabilities = RKVDEC_CAPABILITY_HEVC,
 };
 
+static const struct rkvdec_variant rk3328_rkvdec_variant = {
+	.num_regs = 109,
+	.capabilities = RKVDEC_CAPABILITY_HEVC |
+			RKVDEC_CAPABILITY_H264 |
+			RKVDEC_CAPABILITY_VP9,
+	.quirks = RKVDEC_QUIRK_DISABLE_QOS,
+};
+
 static const struct rkvdec_variant rk3399_rkvdec_variant = {
 	.num_regs = 78,
 	.capabilities = RKVDEC_CAPABILITY_HEVC |
@@ -1238,6 +1258,10 @@ static const struct of_device_id of_rkvdec_match[] = {
 		.compatible = "rockchip,rk3288-vdec",
 		.data = &rk3288_rkvdec_variant,
 	},
+	{
+		.compatible = "rockchip,rk3328-vdec",
+		.data = &rk3328_rkvdec_variant,
+	},
 	{
 		.compatible = "rockchip,rk3399-vdec",
 		.data = &rk3399_rkvdec_variant,
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.h b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
index c47457c954e5..566e06fa2b1e 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.h
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
@@ -26,6 +26,8 @@
 #define RKVDEC_CAPABILITY_H264		BIT(1)
 #define RKVDEC_CAPABILITY_VP9		BIT(2)
 
+#define RKVDEC_QUIRK_DISABLE_QOS	BIT(0)
+
 struct rkvdec_ctx;
 
 struct rkvdec_ctrl_desc {
@@ -70,6 +72,7 @@ vb2_to_rkvdec_decoded_buf(struct vb2_buffer *buf)
 struct rkvdec_variant {
 	unsigned int num_regs;
 	unsigned int capabilities;
+	unsigned int quirks;
 };
 
 struct rkvdec_coded_fmt_ops {
@@ -149,6 +152,8 @@ struct rkvdec_aux_buf {
 void rkvdec_run_preamble(struct rkvdec_ctx *ctx, struct rkvdec_run *run);
 void rkvdec_run_postamble(struct rkvdec_ctx *ctx, struct rkvdec_run *run);
 
+void rkvdec_quirks_disable_qos(struct rkvdec_ctx *ctx);
+
 extern const struct rkvdec_coded_fmt_ops rkvdec_h264_fmt_ops;
 extern const struct rkvdec_coded_fmt_ops rkvdec_hevc_fmt_ops;
 extern const struct rkvdec_coded_fmt_ops rkvdec_vp9_fmt_ops;
-- 
2.51.0


