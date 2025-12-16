Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C330AD5E13D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 18:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8PkmTgmquqdcxF6G5c67yqDXYmcbCyXSS/SGER/sdIk=; b=QSYJehxU8RiMb6absdi4JyK0HU
	eXVwC705GfNX5TCbg7Czoo9IDU/rwssX3XJDo43n97NkXic0KIgnKS08YRl0WQ9gvPOguzhgC4nKf
	wYbidkvmsVgx2SRmlkFEEsAyM9m2zMBW/bZloObYXzcawFNAP3ATjPIBnDYWu09I08pwyN2/A3VCu
	m+8AIoCE9/oWtEePm7KcfDhohdO2uIYd3vTvfAyMvcw6xPhwq/O2AV0+Vct7rZ1nX1hPi6/v3W8PD
	UUv9BYKcAKHuZ84TCQTdqJlbi2iYfo8ZAJHkXDl7ctcox9/wCIhCsR6mNeg9Gn8YOAY7Ljmixzxjl
	zCpa/0DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVZLV-00000005ecF-1YdJ;
	Tue, 16 Dec 2025 18:00:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVZLS-00000005eWj-3ldb
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 16 Dec 2025 18:00:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=8PkmTgmquqdcxF6G5c67yqDXYmcbCyXSS/SGER/sdIk=; b=oiU02PyrDDWz6Hp/G5Dd1ZYkFS
	eeCrJS1jHfA1BHtJXpiKkYBBSmh0a+a8YPXozKr+kbBc/4R6ynkylTfU7fOj+kmSaED0TSKUpzKGr
	kj3LvkHiuOY8jpRwXhj1hQb5H++64CVchgswqlwRtQSbQldwrbQzfIJSGIYt1vR1ATQJmS4fdVRSJ
	0SaMdq/04PiJAs44K3fhsGc+stbjtOd9AcufrJngikOykLlJVvMGGnyHJgFOD6WNmOdtljBYbqLqg
	J+QDs5K3IQ9ESVKodkB1zz8GltcUAdV+COUI22HYh94gQH0EY+D9JUcR13f/jJzLtNaIzriQhiZcd
	GFgtj0SA==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVYTu-00000005JcX-3Yea
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 17:05:05 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5911C1A2226;
	Tue, 16 Dec 2025 18:00:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2B52A6071C;
	Tue, 16 Dec 2025 18:00:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 017AD119A97E8;
	Tue, 16 Dec 2025 19:00:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765908015; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=8PkmTgmquqdcxF6G5c67yqDXYmcbCyXSS/SGER/sdIk=;
	b=qOkNMDesYpUKHvxRTl2FGlRCdyvjQOc5XBt7EIazgxDos1FA5lneUXtG0j4QCiFmR0gO+J
	wbLwsWIsOUZfybN4SRSYP7/ilE3uulgNnZGF/hSRWutAttsNN1khF7vVELOJI8rZXCjj6K
	HaXNAumta6a5SiTIrr8wEsdmbaIb1SfQUN0GzaPa/zVi02FDcHqvUz+lWjNXmEH6pGZEGt
	1DV92cYHduLjDn2uS53mUdinu7aeTkTxb1iZ+bRC+Rgpi4GTE1YXeYuudZue4IiSEOWx4p
	bIuc2YaOIDzXjA1PxX/EZOablFifq/Bzq0LPlWbCm7LD8uXRNECn5gtKEbgYLQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 16 Dec 2025 18:58:45 +0100
Subject: [PATCH v3 12/22] drm/meson: encoder_hdmi: get/put the next bridge
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-12-b5165fab8058@bootlin.com>
References: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-0-b5165fab8058@bootlin.com>
In-Reply-To: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-0-b5165fab8058@bootlin.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jonathan Corbet <corbet@lwn.net>, Alexey Brodkin <abrodkin@synopsys.com>, 
 Phong LE <ple@baylibre.com>, Liu Ying <victor.liu@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_170502_970301_1C51C081 
X-CRM114-Status: GOOD (  12.84  )
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

This driver obtains a bridge pointer from of_drm_find_bridge() in the probe
function and stores it until driver removal. of_drm_find_bridge() is
deprecated. Move to of_drm_find_and_get_bridge() for the bridge to be
refcounted and use bridge->next_bridge to put the reference on
deallocation.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/meson/meson_encoder_hdmi.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
index 8205ee56a691..dc4e23590a6e 100644
--- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
@@ -38,7 +38,6 @@
 struct meson_encoder_hdmi {
 	struct drm_encoder encoder;
 	struct drm_bridge bridge;
-	struct drm_bridge *next_bridge;
 	struct drm_connector *connector;
 	struct meson_drm *priv;
 	unsigned long output_bus_fmt;
@@ -54,7 +53,7 @@ static int meson_encoder_hdmi_attach(struct drm_bridge *bridge,
 {
 	struct meson_encoder_hdmi *encoder_hdmi = bridge_to_meson_encoder_hdmi(bridge);
 
-	return drm_bridge_attach(encoder, encoder_hdmi->next_bridge,
+	return drm_bridge_attach(encoder, encoder_hdmi->bridge.next_bridge,
 				 &encoder_hdmi->bridge, flags);
 }
 
@@ -334,7 +333,7 @@ static void meson_encoder_hdmi_hpd_notify(struct drm_bridge *bridge,
 		const struct drm_edid *drm_edid;
 		const struct edid *edid;
 
-		drm_edid = drm_bridge_edid_read(encoder_hdmi->next_bridge,
+		drm_edid = drm_bridge_edid_read(encoder_hdmi->bridge.next_bridge,
 						encoder_hdmi->connector);
 		if (!drm_edid)
 			return;
@@ -390,8 +389,8 @@ int meson_encoder_hdmi_probe(struct meson_drm *priv)
 		return 0;
 	}
 
-	meson_encoder_hdmi->next_bridge = of_drm_find_bridge(remote);
-	if (!meson_encoder_hdmi->next_bridge) {
+	meson_encoder_hdmi->bridge.next_bridge = of_drm_find_and_get_bridge(remote);
+	if (!meson_encoder_hdmi->bridge.next_bridge) {
 		ret = dev_err_probe(priv->dev, -EPROBE_DEFER,
 				    "Failed to find HDMI transceiver bridge\n");
 		goto err_put_node;

-- 
2.52.0


