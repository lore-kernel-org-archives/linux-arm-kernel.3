Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AB29CD6E76
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 22:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JVCERJyYlNbM4M5p37cGWIsRNZm3GlxlX0G0Wh96q54=; b=Y18Xtbe3V/EaV7rIsT3p8ESWMF
	LTkk1NgPnUmDQnNLel55mjoRrhyHAauFMYKQz2oOBQQx/yxcCRsdAK/Aapku99+fRZkpHrwdSRjL6
	wb1GK87Qqr/o0qlKy8ppLxiSTAVJIjHoHhSXCzKPwNRA5zvbyfOpzu4nY3sVbEmuGLjuOO6w5pLsy
	3nF5QzvFB4tDbuEIzhhHwD/oqnSpd8Yl2jGyWidPfKoiJMMba6T4RGv9pNz8jLWJ4UbOWRPsEfxcA
	8d6f6WhMHBC/8ZJArWcttW04jURq391eLGLjA2K2fcs1jrsKYw8gjAa37w7Ndl7behveinCR1Tle5
	B1fJLFtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUBNv-0000000ByNr-3FFA;
	Mon, 01 Jun 2026 22:45:27 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUBNn-0000000By4J-0dKh;
	Mon, 01 Jun 2026 22:45:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1780353917;
	bh=D3WLI0/xqh09WqxG7OJ3t8fiOSfKDxrH6DTK/8B7zCk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=RwDyxlCNWPnXikCNbriDKEBPlsl0KcnHcyame3jfWh1AJToS0H5fYhr5YHDI/RpeD
	 tM39Z0MlhozOFgKj+xVQ5DUYLOE0pNEDVGwBhAKY3cTcG7WzdGhg7FlVeLgns4riH9
	 ZBwMMTQs3LeEd47Gupe9Wixaxkb3rYiOLEVAQ/2MBHilaN/Iw/KDKuxSpRfaO188C2
	 fRfdyhHJQ9Ui0yYfWpEqZ6zrEK8/al4mG8mlGDm36dVKn6j0/Fg1eR8k5X+MD7nnBJ
	 Pi11g3pXOYuMuahEooYvV2u6muofosdN4RqQLBPlb2eqfKY9kFzFgNH2vhX0/LIHqZ
	 L47rYYcFjbINw==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0AB7217E0D07;
	Tue,  2 Jun 2026 00:45:17 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 02 Jun 2026 01:44:09 +0300
Subject: [PATCH v7 09/30] drm/display: bridge_connector: Use cached
 connector status in .get_modes()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-dw-hdmi-qp-scramb-v7-9-445eb54ee1ed@collabora.com>
References: <20260602-dw-hdmi-qp-scramb-v7-0-445eb54ee1ed@collabora.com>
In-Reply-To: <20260602-dw-hdmi-qp-scramb-v7-0-445eb54ee1ed@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Daniel Stone <daniels@collabora.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_154519_527960_7FD60340 
X-CRM114-Status: GOOD (  12.03  )
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

Replace the active drm_bridge_connector_detect() call in get_modes()
with a read of the already-cached connector->status.

The .get_modes() callback is only invoked from
drm_helper_probe_single_connector_modes(), which has already retrieved
the connector status.  Calling detect again is redundant and triggers a
duplicate hotplug event.  This is also a prerequisite for switching to
the .detect_ctx() hook, which requires a drm_modeset_acquire_ctx not
available in the .get_modes() path.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index cafa498c3848..61c2a46edaf3 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -301,12 +301,10 @@ static const struct drm_connector_funcs drm_bridge_connector_funcs = {
 static int drm_bridge_connector_get_modes_edid(struct drm_connector *connector,
 					       struct drm_bridge *bridge)
 {
-	enum drm_connector_status status;
 	const struct drm_edid *drm_edid;
 	int n;
 
-	status = drm_bridge_connector_detect(connector, false);
-	if (status != connector_status_connected)
+	if (connector->status != connector_status_connected)
 		goto no_edid;
 
 	drm_edid = drm_bridge_edid_read(bridge, connector);

-- 
2.54.0


