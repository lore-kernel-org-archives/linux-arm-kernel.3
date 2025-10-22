Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACCBECCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 17:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=esWO8Vi+zfsSvg2KaUzev1lCO7+KKgmZtMCUDL9DIbs=; b=IczNWfeCCq9rUVqEe69cK00LZE
	hGkTuyOnHDFItlHMroeyVZR7LdwXH6lP/45uIpWs+EF/cI9K0qIcgFEwNCwteRy52rLDGuA2j0jOr
	YIIbX3OrBpqbRhiwm4DLUajdaLKLv3GlRysJyGtVdCLYAOYt2JqW1Szgu3/EaWhMiwu80hXYIAFIb
	ajL6/CCfE7AhbFD+zl3rl9yrZPNCxkq6F9UJVhcUeQ/gjN+SvymTqughWN6+23mECRw/eUlswffwU
	UVpOdK5Sh2P/30cxzCpjeT1lJM0Q/y0YtsOGvQRDFOxyajEiAnFUi+RObY5mQzLgYIb9FsoFOVVu7
	59U9a3Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBcuI-00000003rKh-1MXB;
	Wed, 22 Oct 2025 17:45:54 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBcu2-00000003qx4-18Tt;
	Wed, 22 Oct 2025 17:45:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1761155136;
	bh=5XepCE8oQ4CfIylcFNZHUx5cQS3sUUTvzh5DlZ/N4/Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Pjd5UL/jE+qXULPScTa9szBWU5Nc8DH8SlpMC2ScT0jl7N+ZH+jA+IaAToecuT1Bp
	 8FIHM/9AmtelGRvu2vDW8lkjebWJsRc0/azJSGiLIy4bDZZjeMW0VnFEpkmACD5Fuf
	 xv8nq5XuIquqomSJt/LrWRFv1BjH1dhJL1JD6Fc9cEai4QThpJK4Ej9uqLAzXOvi0E
	 yQmjxV4I4gfvckbCRzxOJwsLfUe5IU5WhBoksYbFfXftpqrtEzswkEahK8jciS1BbU
	 hn1CZ0EsAnHGdz+zWDfL40/rutKbXSIArRrllu/FFqU/KEQntqU9zBFvXojrJjBypX
	 24+nODKi52Myg==
Received: from trenzalore (unknown [23.233.251.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9235F17E02B0;
	Wed, 22 Oct 2025 19:45:33 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Heiko Stuebner <heiko@sntech.de>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Yunke Cao <yunkec@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	James Cowgill <james.cowgill@blaize.com>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Diederik de Haas <didi.debian@cknow.org>
Subject: [PATCH v4 08/15] media: rkvdec: Add generic configuration for variants
Date: Wed, 22 Oct 2025 13:45:00 -0400
Message-ID: <20251022174508.284929-9-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.51.1.dirty
In-Reply-To: <20251022174508.284929-1-detlev.casanova@collabora.com>
References: <20251022174508.284929-1-detlev.casanova@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_104538_691970_159B1F52 
X-CRM114-Status: GOOD (  16.53  )
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

This is to prepare for adding new versions of the decoder and
support specific formats and ops per version.

Different rkvdec_variant instances will be able to share generic
decoder configs.

Tested-by: Diederik de Haas <didi.debian@cknow.org>  # Rock 5B
Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 .../media/platform/rockchip/rkvdec/rkvdec.c   | 37 ++++++++++++-------
 .../media/platform/rockchip/rkvdec/rkvdec.h   |  6 +++
 2 files changed, 30 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index 776149f871b0..a7af1e3fdebd 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
@@ -373,15 +373,16 @@ static bool rkvdec_is_capable(struct rkvdec_ctx *ctx, unsigned int capability)
 static const struct rkvdec_coded_fmt_desc *
 rkvdec_enum_coded_fmt_desc(struct rkvdec_ctx *ctx, int index)
 {
+	const struct rkvdec_config *cfg = ctx->dev->variant->config;
 	int fmt_idx = -1;
 	unsigned int i;
 
-	for (i = 0; i < ARRAY_SIZE(rkvdec_coded_fmts); i++) {
-		if (!rkvdec_is_capable(ctx, rkvdec_coded_fmts[i].capability))
+	for (i = 0; i < cfg->coded_fmts_num; i++) {
+		if (!rkvdec_is_capable(ctx, cfg->coded_fmts[i].capability))
 			continue;
 		fmt_idx++;
 		if (index == fmt_idx)
-			return &rkvdec_coded_fmts[i];
+			return &cfg->coded_fmts[i];
 	}
 
 	return NULL;
@@ -390,12 +391,13 @@ rkvdec_enum_coded_fmt_desc(struct rkvdec_ctx *ctx, int index)
 static const struct rkvdec_coded_fmt_desc *
 rkvdec_find_coded_fmt_desc(struct rkvdec_ctx *ctx, u32 fourcc)
 {
+	const struct rkvdec_config *cfg = ctx->dev->variant->config;
 	unsigned int i;
 
-	for (i = 0; i < ARRAY_SIZE(rkvdec_coded_fmts); i++) {
-		if (rkvdec_is_capable(ctx, rkvdec_coded_fmts[i].capability) &&
-		    rkvdec_coded_fmts[i].fourcc == fourcc)
-			return &rkvdec_coded_fmts[i];
+	for (i = 0; i < cfg->coded_fmts_num; i++) {
+		if (rkvdec_is_capable(ctx, cfg->coded_fmts[i].capability) &&
+		    cfg->coded_fmts[i].fourcc == fourcc)
+			return &cfg->coded_fmts[i];
 	}
 
 	return NULL;
@@ -1014,18 +1016,19 @@ static int rkvdec_add_ctrls(struct rkvdec_ctx *ctx,
 
 static int rkvdec_init_ctrls(struct rkvdec_ctx *ctx)
 {
+	const struct rkvdec_config *cfg = ctx->dev->variant->config;
 	unsigned int i, nctrls = 0;
 	int ret;
 
-	for (i = 0; i < ARRAY_SIZE(rkvdec_coded_fmts); i++)
-		if (rkvdec_is_capable(ctx, rkvdec_coded_fmts[i].capability))
-			nctrls += rkvdec_coded_fmts[i].ctrls->num_ctrls;
+	for (i = 0; i < cfg->coded_fmts_num; i++)
+		if (rkvdec_is_capable(ctx, cfg->coded_fmts[i].capability))
+			nctrls += cfg->coded_fmts[i].ctrls->num_ctrls;
 
 	v4l2_ctrl_handler_init(&ctx->ctrl_hdl, nctrls);
 
-	for (i = 0; i < ARRAY_SIZE(rkvdec_coded_fmts); i++) {
-		if (rkvdec_is_capable(ctx, rkvdec_coded_fmts[i].capability)) {
-			ret = rkvdec_add_ctrls(ctx, rkvdec_coded_fmts[i].ctrls);
+	for (i = 0; i < cfg->coded_fmts_num; i++) {
+		if (rkvdec_is_capable(ctx, cfg->coded_fmts[i].capability)) {
+			ret = rkvdec_add_ctrls(ctx, cfg->coded_fmts[i].ctrls);
 			if (ret)
 				goto err_free_handler;
 		}
@@ -1240,13 +1243,20 @@ static void rkvdec_watchdog_func(struct work_struct *work)
 	}
 }
 
+static const struct rkvdec_config config_rkvdec = {
+	.coded_fmts = rkvdec_coded_fmts,
+	.coded_fmts_num = ARRAY_SIZE(rkvdec_coded_fmts),
+};
+
 static const struct rkvdec_variant rk3288_rkvdec_variant = {
 	.num_regs = 68,
+	.config = &config_rkvdec,
 	.capabilities = RKVDEC_CAPABILITY_HEVC,
 };
 
 static const struct rkvdec_variant rk3328_rkvdec_variant = {
 	.num_regs = 109,
+	.config = &config_rkvdec,
 	.capabilities = RKVDEC_CAPABILITY_HEVC |
 			RKVDEC_CAPABILITY_H264 |
 			RKVDEC_CAPABILITY_VP9,
@@ -1255,6 +1265,7 @@ static const struct rkvdec_variant rk3328_rkvdec_variant = {
 
 static const struct rkvdec_variant rk3399_rkvdec_variant = {
 	.num_regs = 78,
+	.config = &config_rkvdec,
 	.capabilities = RKVDEC_CAPABILITY_HEVC |
 			RKVDEC_CAPABILITY_H264 |
 			RKVDEC_CAPABILITY_VP9,
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.h b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
index f35f6e80ea2e..3b1cc511412e 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.h
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
@@ -71,6 +71,7 @@ vb2_to_rkvdec_decoded_buf(struct vb2_buffer *buf)
 
 struct rkvdec_variant {
 	unsigned int num_regs;
+	const struct rkvdec_config *config;
 	unsigned int capabilities;
 	unsigned int quirks;
 };
@@ -113,6 +114,11 @@ struct rkvdec_coded_fmt_desc {
 	unsigned int capability;
 };
 
+struct rkvdec_config {
+	const struct rkvdec_coded_fmt_desc *coded_fmts;
+	size_t coded_fmts_num;
+};
+
 struct rkvdec_dev {
 	struct v4l2_device v4l2_dev;
 	struct media_device mdev;
-- 
2.51.1.dirty


