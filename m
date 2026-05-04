Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CED9DCD342C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 10:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T2up0nNcnVaU0yQbv4uPCscdyC0ZWVrNHuUZWb1EmZw=; b=bfZBZJil5wHdBdj6Hsj8UjNhBB
	5qbyKlUTEZJdvoDXpw/3blF0QqRcbKHp/ttcQCOS+W1BiBiUHW+R795CyTRggWmh9O1flO/YHljBY
	RSgtPn1kARqYuEg5K/lQuS8f2ILUf9NI2NCmHeL0/gHjgn2+I7VpsnimMZ0r0D8TOBZp7MFZP8lez
	+Y1VY0NrmFw2RMzNH8az+03ejyfpXNZA3O+uIIgkf0dYfQAO10bVBzIEI31MtXZ0LpSURBMO8jmbA
	9l21WBlQq/7E9/vXK06hQOOaI6GMohBXG5vHbQwENzaW7OHuSNuXdi5GskgN27F96wRAyBU53j7Cg
	ZX3fZC8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJqoE-0000000Cxox-419i;
	Mon, 04 May 2026 10:45:54 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJqoC-0000000CxlY-2YfL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 10:45:53 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 31B1C4E42BBC;
	Mon,  4 May 2026 10:45:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 05EDB5FD5F;
	Mon,  4 May 2026 10:45:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 75DCD11AD25EC;
	Mon,  4 May 2026 12:45:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777891549; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=T2up0nNcnVaU0yQbv4uPCscdyC0ZWVrNHuUZWb1EmZw=;
	b=mM0iOGf7EAqLT6L2rvdBnDbzDeddR3CJkQhKK5GXWZuZahcsUiKmIAXZdihsAph11yaJsc
	A3WL32f8sLEuM5yJt0wXhhrGP+lcRFnPxrG/uSeAJ7WyaPLdjkASzCeO+2t+2wBDmPq5mz
	ZSOx43+DSjDy+/AyMp/WyPgKuaGnFmn3TYVbKCodH4AAwyNGPBEvyOG0hJjb3LHIlzsX8F
	FnkvWTKi2wl7GNKn3Q7ZLlHl4TT9DdYsrPlqzCddmbpB38o3p5ocso59UHbn1p76Kg5TpN
	wO5hY1sv4oDUpgd9zxGJ5nWTCwZ+Cn8kjxxCqmc6nuc/HS1e/JAwaTeC3mV5+g==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Mon, 04 May 2026 12:45:10 +0200
Subject: [PATCH v4 07/11] drm/bridge: lt9611: switch to
 of_drm_get_bridge_by_endpoint()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-drm-bridge-alloc-getput-panel_or_bridge-v4-7-b578c3daaf10@bootlin.com>
References: <20260504-drm-bridge-alloc-getput-panel_or_bridge-v4-0-b578c3daaf10@bootlin.com>
In-Reply-To: <20260504-drm-bridge-alloc-getput-panel_or_bridge-v4-0-b578c3daaf10@bootlin.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Sumit Semwal <sumit.semwal@linaro.org>, John Stultz <jstultz@google.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_034552_781053_1B4676D6 
X-CRM114-Status: GOOD (  12.17  )
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

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/lontium-lt9611.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index 4517aee83332..4b4418cc83bf 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -37,7 +37,6 @@
 struct lt9611 {
 	struct device *dev;
 	struct drm_bridge bridge;
-	struct drm_bridge *next_bridge;
 
 	struct regmap *regmap;
 
@@ -761,7 +760,7 @@ static int lt9611_bridge_attach(struct drm_bridge *bridge,
 {
 	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
 
-	return drm_bridge_attach(encoder, lt9611->next_bridge,
+	return drm_bridge_attach(encoder, lt9611->bridge.next_bridge,
 				 bridge, flags);
 }
 
@@ -1058,7 +1057,11 @@ static int lt9611_parse_dt(struct device *dev,
 
 	lt9611->ac_mode = of_property_read_bool(dev->of_node, "lt,ac-mode");
 
-	return drm_of_find_panel_or_bridge(dev->of_node, 2, -1, NULL, &lt9611->next_bridge);
+	lt9611->bridge.next_bridge = of_drm_get_bridge_by_endpoint(dev->of_node, 2, -1);
+	if (IS_ERR(lt9611->bridge.next_bridge))
+		return PTR_ERR(lt9611->bridge.next_bridge);
+
+	return 0;
 }
 
 static int lt9611_gpio_init(struct lt9611 *lt9611)

-- 
2.53.0


