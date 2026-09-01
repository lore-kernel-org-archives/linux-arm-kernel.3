Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AD12C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 18:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pK0YHLDrv7GoPwlqVHaucscGEg72G4t/JhLFQp4XQNk=; b=LAuQlQCw5jKATyW8VDCT/UouNE
	shrNBRapcjvThKngpGqfVAkJNAJqLujqUDEZhgbGAp69XKAAOMGWhuS/cii4+UanzjDI/B7amWxY3
	oQjKDgSHJn1oSVvdFsgUYIZ/kv8m1NG3+7YClrN+35cfkIT3qyBRA/qb01HbLAAS5Ay59sCJBvwLB
	LxRrj2AYYxi6GJwulzRwVh9rtCBgl2+0TUrkmCDo05vi9ocnFKlfRU8UwpFINi6mXiluYCqmiX2id
	s3HhO70wBWwzOj2/rHghDgWQZ7+hhrkXYiG9wIGKha/W1Nl4PkP4U2Hb/vpgrsygb0iRwHP2NbxL5
	+6J9dWwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1TbB-0000000D3mA-20zy;
	Tue, 01 Sep 2026 18:52:45 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1TZW-0000000D0rW-1GbD;
	Tue, 01 Sep 2026 18:51:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788288658;
	bh=dHIKdEC5RHVqcHq82GjtYHGUUOJHjjeCBOpp724uoac=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ACW+ziuWAPd7zQm+209nems4I5iTQK8DxQhfTlIXHAZiHsFxLg+JqCna8mjW0HOHN
	 9oRrZAu3JtYTlX3chmx8L5lRyVfKDJ4tedh4UDnomz7Z4HGRGJKJa5A43vFlyVsXv/
	 vycrj6aiyTRjt+Ma0ToXjajA6HX6rGIme9LyvDu8Kp5+VSNbCpQIN5a4zfiNV5mZ6q
	 zFpBFLN1tNBMGnKm9AN+7aAcRv3xpxFheSMR+zKCIZQw6bAdCULapugytg0YfuNyk2
	 bFL3CtQHBlrTx1c1/d+SLHBsR7Dau2rqZ/MIlk75FrSmfC3ud9//gOm2Gq9OhGh1zs
	 zN5/R+JjtaJGA==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3137C17E38DC;
	Tue, 01 Sep 2026 20:50:58 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 01 Sep 2026 21:50:47 +0300
Subject: [PATCH v11 23/74] drm/display: hdmi-state-helper: Sync SCDC state
 on hotplug
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-dw-hdmi-qp-scramb-v11-23-bc12954a0688@collabora.com>
References: <20260901-dw-hdmi-qp-scramb-v11-0-bc12954a0688@collabora.com>
In-Reply-To: <20260901-dw-hdmi-qp-scramb-v11-0-bc12954a0688@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Algea Cao <algea.cao@rock-chips.com>, 
 Daniel Stone <daniels@collabora.com>, Liu Ying <victor.liu@nxp.com>, 
 Phong LE <ple@baylibre.com>, Helge Deller <deller@gmx.de>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org, 
 linux-fbdev@vger.kernel.org, Maud Spierings <maud_spierings@hotmail.com>, 
 Diederik de Haas <diederik@cknow-tech.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_115102_592936_EC0BF7ED 
X-CRM114-Status: GOOD (  13.46  )
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

drm_atomic_helper_connector_hdmi_hotplug() does not currently
synchronize SCDC status on hotplug events, leaving the scrambler state
potentially inconsistent after (re)connect.

Hook drm_connector_hdmi_sync_scdc() into both the connect and disconnect
paths, replacing the existing TODOs around missing scrambler handling.
Note that per .detect_ctx() contract, implementations shall return a
drm_connector_status value or -EDEADLK, nothing else.  Therefore, handle
deadlocks and just report any other errors.  For consistency, also
report the errors from drm_edid_connector_update().

Tested-by: Maud Spierings <maud_spierings@hotmail.com>
Tested-by: Diederik de Haas <diederik@cknow-tech.com>  # NanoPC-T6 LTS, Rock 5B
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 34 ++++++++++++++++++++++---
 1 file changed, 31 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index 8045b1d17d6e..1e269b203b98 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -1362,12 +1362,29 @@ drm_atomic_helper_connector_hdmi_update(struct drm_connector *connector,
 					enum drm_connector_status status)
 {
 	const struct drm_edid *drm_edid;
+	int ret;
 
 	if (status == connector_status_disconnected) {
-		// TODO: also handle scramber, HDMI sink disconnected.
+		/*
+		 * .detect_ctx() can only ever return a drm_connector_status or
+		 * -EDEADLK. Handle deadlocks, and report any !EDEADLK error.
+		 */
+		ret = drm_connector_hdmi_sync_scdc(connector, false, ctx);
+		if (ret) {
+			if (ret == -EDEADLK)
+				return ret;
+
+			drm_warn(connector->dev, "Ignored SCDC sync error: %d\n", ret);
+		}
+
 		drm_connector_hdmi_audio_plugged_notify(connector, false);
-		drm_edid_connector_update(connector, NULL);
+
+		ret = drm_edid_connector_update(connector, NULL);
+		if (ret)
+			drm_warn(connector->dev, "Ignored EDID update error: %d\n", ret);
+
 		drm_connector_cec_phys_addr_invalidate(connector);
+
 		return 0;
 	}
 
@@ -1381,7 +1398,18 @@ drm_atomic_helper_connector_hdmi_update(struct drm_connector *connector,
 	drm_edid_free(drm_edid);
 
 	if (status == connector_status_connected) {
-		// TODO: also handle scramber, HDMI sink is now connected.
+		/*
+		 * .detect_ctx() can only ever return a drm_connector_status or
+		 * -EDEADLK. Handle deadlocks, and report any !EDEADLK error.
+		 */
+		ret = drm_connector_hdmi_sync_scdc(connector, true, ctx);
+		if (ret) {
+			if (ret == -EDEADLK)
+				return ret;
+
+			drm_warn(connector->dev, "Ignored SCDC sync error: %d\n", ret);
+		}
+
 		drm_connector_hdmi_audio_plugged_notify(connector, true);
 		drm_connector_cec_phys_addr_set(connector);
 	}

-- 
2.55.0


