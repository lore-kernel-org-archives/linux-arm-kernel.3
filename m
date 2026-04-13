Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C4CDF34C4E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 13:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kyqLbsIF4J3i/WeGxaDtEjARw/tyTVImHH71Ui8/dSc=; b=TbPfw07V1dy0J+jBImiUwcylcq
	9zBpauwJbxvN5Ott/PovtZxzkz/rVKHT71KpOQu7dQvBckeSPRphCH6zIm5bevHUiAhw9TekL5Xco
	Q9Y9EkgW58Yz0NX20+94oie8LyT04Fkp/95gsSjHwCYEBv41sBszYGWxqF1fX5szeb/jBPIOGe0xe
	QMwfrnQ2+4ui/Re51oZMZBATmJtB9mhJioG9XYbR2F6841kjA4+s/LcCZHQaNbOtJl0kd0STfPhz7
	oRkfbzcokGsXMSvEisJ871SsfDo+aR9r+cZ3ojWjTR3XZNC+GCrc/stoGhh2fxocIRmZe/oOT2RYM
	bR3aZd4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCHp1-0000000Fo28-1Wks;
	Mon, 13 Apr 2026 13:59:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCHoz-0000000Fo0g-3TfA
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 13 Apr 2026 13:59:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=kyqLbsIF4J3i/WeGxaDtEjARw/tyTVImHH71Ui8/dSc=; b=LiYiGi+hNGxxWSRxlIq5KOT1CP
	bAGueQff/hqCWh7CXeR5u6Cgm0VpgLqePT6UlZcf2j2nbFQXgl+dYXqMrW7a+kE3tdoT8Rj3oq+pP
	7E+gCqIj4khs9S8sIYRBz/l6WN+ax/MaGKcaJHynJ6w0DtqM2MeBTO/shfLb+xKtUy1npQ/AASK9n
	0+yxIwEWt3kiRQINwU2ekg3b5Nm7E0o+prUab1rVS1whFztHNHYiCN4G5sDzMHitM99H90K5XT+Nd
	E6GNv82y3UdP6js6WpxSdeF3+DO8qMINPB/W19vJj5i1n0FmnIsP5eUOSQ3hrQzT3hVgIzWgMit9s
	aFG7mjFQ==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCHow-0000000GtZM-48OD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 13:59:24 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id EA5DB4E429EA;
	Mon, 13 Apr 2026 13:59:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BE95F5FFB9;
	Mon, 13 Apr 2026 13:59:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6A87B10450084;
	Mon, 13 Apr 2026 15:59:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776088760; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=kyqLbsIF4J3i/WeGxaDtEjARw/tyTVImHH71Ui8/dSc=;
	b=szUK6RQJRH0c3MATXBcO5zhrx4N95w6Ej4G7RQb+oflIMocTG7t0A2rK1S9qQJcizD7rl/
	DAiRxjzmW8iCp8bctPeO1L+bKMPXoSUFr4ePN8jR7g/gw34Y3hAbeuW9Q7Rex1qPCBU2UE
	T/8EaJEy7m2YRcjoMEw4UEU2G95xNQn4r2hiw9ADjL2UcKVxESLy/4tnn8vYWPRSQO9nqB
	+QobA9/as4JoLtWcMTk0zTvqnJWEGCbEUkdkiLdbngmRXGWx65ku4zBptvWYJ7avmxA2Cl
	KeBdEtjHRsHPLNSZn99kVW4FZX7vImdbYpM/ztT6wV+rnJWqL0cBkSKQtr3Ikg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Mon, 13 Apr 2026 15:58:39 +0200
Subject: [PATCH 07/10] drm/bridge: adv7511: switch to
 of_drm_get_bridge_by_endpoint()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260413-drm-bridge-alloc-getput-panel_or_bridge-v1-7-acd01cd79a1f@bootlin.com>
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
X-CRM114-CacheID: sfid-20260413_145923_247779_C2ED5E0D 
X-CRM114-Status: GOOD (  12.35  )
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

This driver calls drm_of_find_panel_or_bridge() with a NULL pointer in the
@panel parameter, thus using a reduced feature set of that function.
Replace this call with the simpler of_drm_get_bridge_by_endpoint().

Since of_drm_get_bridge_by_endpoint() increases the refcount of the
returned bridge, ensure it is put on removal. To achieve this, instead of
adding an explicit drm_bridge_put(), migrate to the bridge::next_bridge
pointer which is automatically put when the bridge is eventually freed.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/adv7511/adv7511.h     | 1 -
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 8 ++++----
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511.h b/drivers/gpu/drm/bridge/adv7511/adv7511.h
index 8be7266fd4f4..12c95198d9a4 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511.h
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511.h
@@ -354,7 +354,6 @@ struct adv7511 {
 	enum drm_connector_status status;
 	bool powered;
 
-	struct drm_bridge *next_bridge;
 	struct drm_display_mode curr_mode;
 
 	unsigned int f_tmds;
diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index 6bd76c1fb007..6d2923a2ef19 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -851,8 +851,8 @@ static int adv7511_bridge_attach(struct drm_bridge *bridge,
 	struct adv7511 *adv = bridge_to_adv7511(bridge);
 	int ret = 0;
 
-	if (adv->next_bridge) {
-		ret = drm_bridge_attach(encoder, adv->next_bridge, bridge,
+	if (adv->bridge.next_bridge) {
+		ret = drm_bridge_attach(encoder, adv->bridge.next_bridge, bridge,
 					flags | DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 		if (ret)
 			return ret;
@@ -1251,8 +1251,8 @@ static int adv7511_probe(struct i2c_client *i2c)
 
 	memset(&link_config, 0, sizeof(link_config));
 
-	ret = drm_of_find_panel_or_bridge(dev->of_node, 1, -1, NULL,
-					  &adv7511->next_bridge);
+	ret = of_drm_get_bridge_by_endpoint(dev->of_node, 1, -1,
+					    &adv7511->bridge.next_bridge);
 	if (ret && ret != -ENODEV)
 		return ret;
 

-- 
2.53.0


