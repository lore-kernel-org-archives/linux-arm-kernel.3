Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01C29C55175
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 16:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9F/M0qnIe/Qp3VH/5GsEitNu2xy9kMLHOn2oSggZtX4=; b=mggL2BsUohQgbdVcpDSjrOo1/a
	764mF8FBOS4ogfmlaR8fUCZAzVUq+Z7Zw7tdy4tI8l4mpNtwuoIaWuKOBHh5isDpnt1yW23OdjdT+
	vOm4Z7akaDV8UGLoj1mbt0DdE0DR33iexNI/G9zeSdm4mYSWqXV/SzIuRQERd67V0pepmi6vcxOvL
	h1f8ZTgMKra9MyZwz5PJ6c1OFwOg9/Rt7TJaYzeH9jY6HKDG1ieBggqK0YesCvPUOY2stkyP23VTK
	1ozS9ts619EaU8qWYzKpe05m/TVUiBvKr3k5OJpUAkvjAiGwKpKwRi1BdPyvLEKE5PzjuIaRbM5Yr
	bmbcT+wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpq2d-0000000D5QU-4BVq;
	Fri, 31 Jul 2026 16:25:00 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wppxK-0000000Cytf-02FI;
	Fri, 31 Jul 2026 16:19:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785514766;
	bh=YSrshcvKlPJVkMkdkCHSWe2+F7O6yThKS89QqJLfJgU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NaZLp4vVwcpqBh2I//J0jNjl/gaTmNAKo7sXaQXj414VByKEmVIAhGtS2GPGy1krd
	 AJSavfMwpNoNYLrTYVEmsvLUOePL9x4pg4D3r6BMDZT80jRt6sulEtoB8YBRh3+qR1
	 w50ijZYK4VY88B3gCW0vfp4FZUxYiP+igRBXvl1ktH8ZyBFju5/x0JPTJj7B1asHCy
	 CA//5BAA1DIfVs8h3XOwB6BuTYIyGL0aDiK4bmWjGeCYsfCxcHXuiv6m9Y1yXA4C/B
	 ws1hJntQA9W/hD4xbyht7UejlFYDGVG7bY2nWGtpaSD3nW7nEmD1V8sCSOy7MsFTsE
	 kGy49S8XLqCgQ==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 464A817E0937;
	Fri, 31 Jul 2026 18:19:26 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 31 Jul 2026 19:19:23 +0300
Subject: [PATCH v10 16/69] drm/display: bridge_connector: Use cached
 connector status in .get_modes()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-dw-hdmi-qp-scramb-v10-16-294364b2cf15@collabora.com>
References: <20260731-dw-hdmi-qp-scramb-v10-0-294364b2cf15@collabora.com>
In-Reply-To: <20260731-dw-hdmi-qp-scramb-v10-0-294364b2cf15@collabora.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Algea Cao <algea.cao@rock-chips.com>, 
 Daniel Stone <daniels@collabora.com>, Liu Ying <victor.liu@nxp.com>, 
 Phong LE <ple@baylibre.com>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Maud Spierings <maud_spierings@hotmail.com>, 
 Diederik de Haas <diederik@cknow-tech.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_091930_208019_348A63D1 
X-CRM114-Status: GOOD (  12.34  )
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
index 9ad31e9df0ab..8a833c813101 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -325,12 +325,10 @@ static const struct drm_connector_funcs drm_bridge_connector_funcs = {
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


