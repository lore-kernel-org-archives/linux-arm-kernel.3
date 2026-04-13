Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDEB5F34C49
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 13:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u39osi0FrTmDq8b2Q+Mf4wlUP8VzUc0EcToCfTrJANE=; b=SV2fW0lj6hWMkOk3iyFXlaBgDC
	pmDEwlksdIHXJyjIiro7GFqjj2x+Q9LVPWxjCldoZ93qhhX04ufptxbTNqRvSvMhu4IDEQKJkkmwO
	9znpQUA1DbgRQwoqh6aqN0e7DE5YtpVFejBzOOimKHKcnh+AYD8afLtITQadNcSbOO8nosQiWjIpo
	LqgBKKEfeldf4XxnVHFVA3kJJz24tUW7lwPM6/Xc+4ygN2Ldq91tfkU1kMR7jSEuc5uK1Sz98BoP/
	pn2GBbj3G2d5T4LsxF3RMjv67RHvW/6JG0IPg/q0fWn11HoDW3XEgdNs4NDIH8k7Lgp75CuSHFbsK
	dCAGUueA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCHpC-0000000FoE3-3cab;
	Mon, 13 Apr 2026 13:59:38 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCHpB-0000000FoBL-0FrD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 13:59:38 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A50361A31E4;
	Mon, 13 Apr 2026 13:59:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 777DA5FFB9;
	Mon, 13 Apr 2026 13:59:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 88AA7104513C6;
	Mon, 13 Apr 2026 15:59:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776088773; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=u39osi0FrTmDq8b2Q+Mf4wlUP8VzUc0EcToCfTrJANE=;
	b=zbhhQrkp/ihGYCh9Lyowd305aQ4oFnv58MPrPzlBClojh1vqoJEi084R4cWyGQMncl3iXM
	TXW5AhSbbqfPVokBaOJfTBvitr+PeD0zHvjVqkrImcoA0le5Vaiq2pD5ST+jbNsFr9lw/F
	EETEEnh7WGgLbLCfU5/PqSatXoD0XMTH/ZpCSC3GBTVSC81JI5qVuo/sj00BODKPJuKJ1v
	7el9fOa+X7HDKHR4aRG52VqHdEDsGPrBaoi5y8e+A98QLzCDU0BhCA3XmIu3JWX5ImOTTK
	aDF9kI/n2drjec49AEXi5qcHRGOU9zNYKQ4vY1lUiapvGqpc7qZyXlkSi2bymA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Mon, 13 Apr 2026 15:58:42 +0200
Subject: [PATCH 10/10] drm: of: forbid bridge-only calls to
 drm_of_find_panel_or_bridge()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260413-drm-bridge-alloc-getput-panel_or_bridge-v1-10-acd01cd79a1f@bootlin.com>
References: <20260413-drm-bridge-alloc-getput-panel_or_bridge-v1-0-acd01cd79a1f@bootlin.com>
In-Reply-To: <20260413-drm-bridge-alloc-getput-panel_or_bridge-v1-0-acd01cd79a1f@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Xinliang Liu <xinliang.liu@linaro.org>, Tian Tao <tiantao6@hisilicon.com>, 
 Xinwei Kong <kong.kongxinwei@hisilicon.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Yongqin Liu <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.15.1
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_065937_240125_F0D6BFE1 
X-CRM114-Status: GOOD (  14.69  )
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

Up to now drm_of_find_panel_or_bridge() can be called with a bridge pointer
only, a panel pointer only, or both a bridge and a panel pointers. The
logic to handle all the three cases is somewhat complex to read however.

Now all bridge-only callers have been converted to
of_drm_get_bridge_by_endpoint(), which is simpler and handles bridge
refcounting. So forbid new bridge-only users by mandating a non-NULL panel
pointer in the docs and in the sanity checks along with a warning.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/drm_of.c | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
index 4f65ce729a47..25568e0c3ffb 100644
--- a/drivers/gpu/drm/drm_of.c
+++ b/drivers/gpu/drm/drm_of.c
@@ -225,15 +225,15 @@ EXPORT_SYMBOL_GPL(drm_of_encoder_active_endpoint);
  * @np: device tree node containing encoder output ports
  * @port: port in the device tree node
  * @endpoint: endpoint in the device tree node
- * @panel: pointer to hold returned drm_panel
+ * @panel: pointer to hold returned drm_panel, must not be NULL
  * @bridge: pointer to hold returned drm_bridge
  *
  * Given a DT node's port and endpoint number, find the connected node and
- * return either the associated struct drm_panel or drm_bridge device. Either
- * @panel or @bridge must not be NULL.
+ * return either the associated struct drm_panel or drm_bridge device.
  *
  * This function is deprecated and should not be used in new drivers. Use
- * devm_drm_of_get_bridge() instead.
+ * of_drm_get_bridge_by_endpoint() instead when not looking for a panel, or
+ * devm_drm_of_get_bridge() otherwise.
  *
  * Returns zero if successful, or one of the standard error codes if it fails.
  */
@@ -245,10 +245,10 @@ int drm_of_find_panel_or_bridge(const struct device_node *np,
 	int ret = -EPROBE_DEFER;
 	struct device_node *remote;
 
-	if (!panel && !bridge)
+	if (WARN_ON(!panel))
 		return -EINVAL;
-	if (panel)
-		*panel = NULL;
+
+	*panel = NULL;
 
 	/*
 	 * of_graph_get_remote_node() produces a noisy error message if port
@@ -263,13 +263,11 @@ int drm_of_find_panel_or_bridge(const struct device_node *np,
 	if (!remote)
 		return -ENODEV;
 
-	if (panel) {
-		*panel = of_drm_find_panel(remote);
-		if (!IS_ERR(*panel))
-			ret = 0;
-		else
-			*panel = NULL;
-	}
+	*panel = of_drm_find_panel(remote);
+	if (!IS_ERR(*panel))
+		ret = 0;
+	else
+		*panel = NULL;
 
 	if (bridge) {
 		if (ret) {

-- 
2.53.0


