Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB718CD4F26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 14:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8zhw41Wj4vCH2abThiXQujr4lQRlosy+XBXOYfxLors=; b=FuGE07YWA7zRbhR5+MStSwLphy
	uRAbEeKxZnsdteqjpINilXtleCwfV2f6utPGQlnzAqNUxNRYWymVyIL3POcmTVDdsnKsinmHmWRLl
	vYGSD4ibmmZYXvdaLqQf+gp7sD3e747fHuei2w/eRBpVr+sTNUaHGRHnYemKihAGT2WYkuRmTrdIC
	3Xj49XPHghHj5WpYFH6j/zwgqSVt6m97fySUewLcOLGL4PMWmoWLZwPAy9F3vy8RJ0juUZTL9ImGq
	75Srqxtm+lEteKcJe2tz4r4ZMcQpNIiKrev8LGhkaOwud75sV3vWEs14Qm6JJgN7Pk83YSyqwu5Xj
	+zV2v6eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waZuF-00000002XPq-01HY;
	Fri, 19 Jun 2026 14:09:15 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waZu9-00000002XGI-0is2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 14:09:10 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 4C47FC06CDC;
	Fri, 19 Jun 2026 14:09:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6EBE8601AD;
	Fri, 19 Jun 2026 14:09:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9A510106C88A8;
	Fri, 19 Jun 2026 16:09:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781878145; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=8zhw41Wj4vCH2abThiXQujr4lQRlosy+XBXOYfxLors=;
	b=kiZ2AHRxwemniL/axdXQpGWkQMO6tJUJDELCW+DFK9ZKkXXaQdxEqkFNGLXDrm2ox3/Cxu
	9mHtWNKn+nOv/H/8SvKQdP2m/0J7WgRYfuLktXZCWylmWZ94LHnDRjf6a2sDHelmMKcyzM
	pnxZprH1bJKxX7zlAx1THNyAD9dVwpwZzEa8iLXjTSn1Qu0zcEBaHTpiMbWeEUCoAAJIks
	CMuE8ArmR6M3bq+VLJpPsRQ9QMuUl7U0pXwz9KXle582cGhXXsXzSwotkaU697KUVLjnU3
	f/35RBhBdw4uhl45nMlhCCeEE8Eraq/+1zFAJHEGSPLNjobb8OAhDvlvnoenSg==
From: Kory Maincent <kory.maincent@bootlin.com>
Date: Fri, 19 Jun 2026 16:08:46 +0200
Subject: [PATCH RFC v2 4/4] drm/mediatek: Use dp_connector helpers to
 report link training state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260619-feat_link_cap-v2-4-a3dec4c02ad9@bootlin.com>
References: <20260619-feat_link_cap-v2-0-a3dec4c02ad9@bootlin.com>
In-Reply-To: <20260619-feat_link_cap-v2-0-a3dec4c02ad9@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Daniel Stone <daniels@collabora.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mark Yacoub <markyacoub@google.com>, Sean Paul <seanpaul@google.com>, 
 Manasi Navare <navaremanasi@google.com>, 
 Drew Davenport <ddavenport@google.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Kory Maincent <kory.maincent@bootlin.com>
X-Mailer: b4 0.15.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_070909_543387_1A71FB29 
X-CRM114-Status: GOOD (  15.59  )
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

Set DRM_BRIDGE_OP_DP and populate dp_link_train_caps with the supported
link rates, lane counts, voltage swing and pre-emphasis levels so the
bridge connector uses drmm_connector_dp_init() and exposes the link
training state properties to userspace.

Store per-lane voltage swing and pre-emphasis values in
mtk_dp_train_info and report the negotiated link parameters via
drm_connector_dp_set_link_train_properties() on training completion.
Clear them via drm_connector_dp_reset_link_train_properties() when a
disconnect is detected in the HPD event thread.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---

This patch has still not been tested. I am in the process of finding the
hardware for that.

Changes in v2:
- Remove voltage swing and pre emphasis properties.
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index eefbc7e0f9c8d..c1e7086104116 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -1789,6 +1789,8 @@ static int mtk_dp_parse_capabilities(struct mtk_dp *mtk_dp)
 		}
 	}
 
+	drm_dp_sink_set_link_caps(mtk_dp->conn, &mtk_dp->aux);
+
 	return 0;
 }
 
@@ -1812,6 +1814,17 @@ static void mtk_dp_train_change_mode(struct mtk_dp *mtk_dp)
 	mtk_dp_reset_swing_pre_emphasis(mtk_dp);
 }
 
+static void mtk_dp_report_link_train(struct mtk_dp *mtk_dp)
+{
+	u32 rate, nlanes;
+
+	rate = drm_dp_bw_code_to_link_rate(mtk_dp->train_info.link_rate);
+	nlanes = mtk_dp->train_info.lane_count;
+
+	drm_dp_set_cur_link_params(mtk_dp->conn, rate, nlanes, false);
+	drm_dp_set_max_link_params(mtk_dp->conn, rate, nlanes);
+}
+
 static int mtk_dp_training(struct mtk_dp *mtk_dp)
 {
 	int ret;
@@ -1892,6 +1905,7 @@ static int mtk_dp_training(struct mtk_dp *mtk_dp)
 	mtk_dp_training_set_scramble(mtk_dp, true);
 	mtk_dp_set_enhanced_frame_mode(mtk_dp);
 
+	mtk_dp_report_link_train(mtk_dp);
 	return 0;
 }
 
@@ -2004,6 +2018,7 @@ static irqreturn_t mtk_dp_hpd_event_thread(int hpd, void *dev)
 			mtk_dp->need_debounce = false;
 			mod_timer(&mtk_dp->debounce_timer,
 				  jiffies + msecs_to_jiffies(100) - 1);
+			drm_dp_sink_reset_link_caps(mtk_dp->conn);
 		} else {
 			mtk_dp_aux_panel_poweron(mtk_dp, true);
 
@@ -2742,6 +2757,12 @@ static int mtk_dp_edp_link_panel(struct drm_dp_aux *mtk_aux)
 
 static int mtk_dp_probe(struct platform_device *pdev)
 {
+	static const u32 dp_rates[] = {162000, 270000, 540000, 810000};
+	static const struct drm_connector_dp_link_caps dp_link_caps = {
+		.nlanes = 4,
+		.nlink_rates = ARRAY_SIZE(dp_rates),
+		.link_rates = dp_rates,
+	};
 	struct mtk_dp *mtk_dp;
 	struct device *dev = &pdev->dev;
 	int ret;
@@ -2809,6 +2830,8 @@ static int mtk_dp_probe(struct platform_device *pdev)
 
 	mtk_dp->bridge.of_node = dev->of_node;
 	mtk_dp->bridge.type = mtk_dp->data->bridge_type;
+	mtk_dp->bridge.dp_link_caps = &dp_link_caps;
+	mtk_dp->bridge.ops = DRM_BRIDGE_OP_DP;
 
 	if (mtk_dp->bridge.type == DRM_MODE_CONNECTOR_eDP) {
 		/*

-- 
2.43.0


