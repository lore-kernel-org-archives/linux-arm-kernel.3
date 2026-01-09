Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFBA8D167FD
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 10:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/SEnvILKis2K8TQc2e0J/EfZp0VkAsieLSYp0vPG558=; b=fcvdsiyl22RCtFzhGt/VylRFIL
	JJPtI6W8Hi9oW0SGygMjq4QL90KKx1Tl50dZqrA+7K2D+kfwqYNOU7C3NuFV1kH8PZvHMeKJUDrnj
	c4HmmCostQkmIh2dwNxrWmZansDaZZtPNQEYxe8jSBiv7xl5B8t4gXIlhDJ+K1iB1tunUlK1UrPPk
	tjzTicF/qOiNJtPiEQrtoTUiAktJ8iujFfE3fXdmwGAgMQLaCblbB5BSx75uSijSg+VFi/QeTivbV
	Xd9VZPz8Vd8AqE+VJxkTPhtCBsNFqWk9twJ/kEjngOv6mVNuGbjPAvwLc07VG0UvWjO8TMbdLTAja
	U0sE0oZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve9LM-000000025Yh-2IIV;
	Fri, 09 Jan 2026 10:03:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve9LL-000000025W0-0n7v
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 09 Jan 2026 10:03:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=/SEnvILKis2K8TQc2e0J/EfZp0VkAsieLSYp0vPG558=; b=jQzG6LFb/DWhWoGTi6mY1vZbIS
	Jvx9UJiZoULZQnuD5vVayZeyQH2VPaeMGX6dGtjAhp1pn4RSi12+dfbFsmq8njJFPkJYyD4rzV6Qo
	F1+pdFoZQM1ZRsAAYOFf52KNCCdvH4YUASGjKqlPgMlK49Bf/aTeT4NRH8cr4OARdc/+uOCONNcry
	y5KDG31V92DHwqmw+CrYG9nlUo9z2vwPb9/CYZ4verpWC8BTErlTn7CU9ieGyOBN/Av0/Rr7HGw74
	mNFXVoNlRYYlT2E99JXOBa76io+kHiBAN5qLePG37oxdDddQsqdRBHXSFMP0uySaqoVee6CilW8w7
	o0mRe9ww==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve9LG-0000000Exk3-3aRd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 10:03:41 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 415704E4201C;
	Fri,  9 Jan 2026 10:03:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 11C9560734;
	Fri,  9 Jan 2026 10:03:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 83744103C88D2;
	Fri,  9 Jan 2026 11:03:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767953015; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=/SEnvILKis2K8TQc2e0J/EfZp0VkAsieLSYp0vPG558=;
	b=QMd2Dhf8C7VDVY3winTShkqSbLELJJwFtbNxwjnPdCYsv8g1PpxVZh24c+Bq48qPKiXjVN
	kSMcnUO28jl24PrPhnxMhrXlYUL/hSZvaikbjBD4V7SpAUWGNvApTykY97V3vh6kTOM/2/
	b/o6NEpKo5enWj0jrpimRtal1LjRDf4V+075vvDB3FF+7JmNeXv2asPqmmpp/H9n5G+MHN
	V7DkWGe7zaeGxohbnHgc1y/FtBrzWeOGidIdUinCMJKjHZyXOYu8LxNdhkQMDrZJ9Mygog
	I3oOefYg2q/VCnl08Xa8KStJ+I4utKEc0cXNLT6gEf+A/hnsFuBVVSC5yc6PRQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 09 Jan 2026 11:02:53 +0100
Subject: [PATCH v2 4/6] drm/mediatek: mtk_hdmi*: convert to
 of_drm_find_and_get_bridge()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-3-v2-4-8d7a3dbacdf4@bootlin.com>
References: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-3-v2-0-8d7a3dbacdf4@bootlin.com>
In-Reply-To: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-3-v2-0-8d7a3dbacdf4@bootlin.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, 
 Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 imx@lists.linux.dev, linux-mediatek@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_100339_003391_9E60CB5A 
X-CRM114-Status: GOOD (  14.31  )
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

of_drm_find_bridge() is deprecated. Move to its replacement
of_drm_find_and_get_bridge() which gets a bridge reference, and ensure it
is put when done by using the drm_bridge::next_bridge pointer.

Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c        | 4 ++--
 drivers/gpu/drm/mediatek/mtk_hdmi_common.c | 4 ++--
 drivers/gpu/drm/mediatek/mtk_hdmi_common.h | 1 -
 drivers/gpu/drm/mediatek/mtk_hdmi_v2.c     | 4 ++--
 4 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 0face4dcaa36..1ea259854780 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -986,8 +986,8 @@ static int mtk_hdmi_bridge_attach(struct drm_bridge *bridge,
 		return -EINVAL;
 	}
 
-	if (hdmi->next_bridge) {
-		ret = drm_bridge_attach(encoder, hdmi->next_bridge,
+	if (hdmi->bridge.next_bridge) {
+		ret = drm_bridge_attach(encoder, hdmi->bridge.next_bridge,
 					bridge, flags);
 		if (ret)
 			return ret;
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
index e78eb0876f16..40ded86dbea3 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
@@ -315,8 +315,8 @@ static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi, struct platform_device
 		return -EINVAL;
 
 	if (!of_device_is_compatible(remote, "hdmi-connector")) {
-		hdmi->next_bridge = of_drm_find_bridge(remote);
-		if (!hdmi->next_bridge) {
+		hdmi->bridge.next_bridge = of_drm_find_and_get_bridge(remote);
+		if (!hdmi->bridge.next_bridge) {
 			dev_err(dev, "Waiting for external bridge\n");
 			of_node_put(remote);
 			return -EPROBE_DEFER;
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_common.h b/drivers/gpu/drm/mediatek/mtk_hdmi_common.h
index de5e064585f8..cace3c5dc067 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_common.h
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_common.h
@@ -150,7 +150,6 @@ struct mtk_hdmi_conf {
 
 struct mtk_hdmi {
 	struct drm_bridge bridge;
-	struct drm_bridge *next_bridge;
 	struct drm_connector *curr_conn;/* current connector (only valid when 'enabled') */
 	struct device *dev;
 	const struct mtk_hdmi_conf *conf;
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c b/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
index c272e1e74b7d..2adeece499b6 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
@@ -940,8 +940,8 @@ static int mtk_hdmi_v2_bridge_attach(struct drm_bridge *bridge,
 		DRM_ERROR("The flag DRM_BRIDGE_ATTACH_NO_CONNECTOR must be supplied\n");
 		return -EINVAL;
 	}
-	if (hdmi->next_bridge) {
-		ret = drm_bridge_attach(encoder, hdmi->next_bridge, bridge, flags);
+	if (hdmi->bridge.next_bridge) {
+		ret = drm_bridge_attach(encoder, hdmi->bridge.next_bridge, bridge, flags);
 		if (ret)
 			return ret;
 	}

-- 
2.52.0


