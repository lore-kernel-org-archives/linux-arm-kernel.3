Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1CC1C624D6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 18:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OXm2M9DNvJ99auIy9XohmbJRDNnWTj1OOy5cYsVWUhw=; b=BGt2f/yfm85dFPZWVZNpicmQ58
	t4JxroDcyuZYio2bAAAKYECvHA7ao8ulhSFMVFS/O2BFiR8jMmG1JHdKWW5PBrRbQg1+YQ3sfN5D1
	dTHpmRMESsRy37bguIjj5gq6PHaBN28awZDFApY5x1By91AMQuGUO/0Kyv0bpRS7JRGRL9HteC1uy
	+oRJS20b+nJUuMQhN6/tuLcrL4GS2oQEKH4rh1L3KklV7T42MHmjGhlVqO3LkjxjfckI4qgJGiUeg
	+qz+5VWN9u5TCyasgq5z6xol1J6Xj/sceFUi8WznEUE0hKPoDYRHA3H2za9Ex6Cep9QkY/pMYFwuK
	psSiB9PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1TaK-0000000D23U-04WJ;
	Tue, 01 Sep 2026 18:51:52 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1TZR-0000000D0k8-2nTJ;
	Tue, 01 Sep 2026 18:51:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788288653;
	bh=Zn+3yeN9Rme+fj1mMWRS/y1YS+3AEJGqzPP55xPQzUk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nehOE6mARkUsJttmQXp7DeJKRFQBJQTd0hcxP94Q/Kv459JsOVp5TamWIdkp0Pv2K
	 Xv3awKZHLGFGpX7u8M+ypuIQv5jK9hR8TPutGQfF5I1qMusRqmdOsYpBf1lImOPymj
	 WbiME8lphrkk8QqTpBaTnE42Ia2VQBleSakU+5Ei+hm2TSqQ2TjniLCO8akWLyNL5h
	 80aWUcAcIUr61ctJc7Ld4kLFlkbi+MVcpAi9bAmTDJ1eI6kz0PY5QJvqMl3EDkyN7p
	 pfDbJ2n6X0NHMOEuoGR8ukqNrW57ozmKb72km7Lax3jptpOg5OKtvrkJH1g6H7MdYU
	 t4jrdVn+CeoyA==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B77D417E373E;
	Tue, 01 Sep 2026 20:50:53 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 01 Sep 2026 21:50:41 +0300
Subject: [PATCH v11 17/74] drm/display: bridge_connector: Use cached
 connector status in .get_modes()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-dw-hdmi-qp-scramb-v11-17-bc12954a0688@collabora.com>
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
 linux-fbdev@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Maud Spierings <maud_spierings@hotmail.com>, 
 Diederik de Haas <diederik@cknow-tech.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_115057_907309_3E4280C0 
X-CRM114-Status: GOOD (  12.74  )
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
Tested-by: Maud Spierings <maud_spierings@hotmail.com>
Tested-by: Diederik de Haas <diederik@cknow-tech.com>  # NanoPC-T6 LTS, Rock 5B
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 63cdc6eab132..a73c177a3c10 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -328,12 +328,10 @@ static const struct drm_connector_funcs drm_bridge_connector_funcs = {
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
2.55.0


