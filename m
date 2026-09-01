Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ED73C624D3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 18:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZAOqi3WqLxy9vwWetxufeAV9yWI+Th74WQRPn9JfAMY=; b=bY9vins3uQsCDXNfXzUzJ8OJS6
	ESPmpX8gZ4gfXlphEn16agZyJ6WloxA7jAm4EQ5Bo86pkmxR5A0xzSFwEb4P+vjOwDwxcvv7i1cT8
	UtvwdGER5Am50nUr5/lrsC55BYI5bAb92uEPSs42sAqkRq8CD/8Yr9cIn8L+JG6K03PmwZq72Qe1D
	ABAmxY+qKWSL5i976o/WaRh6KP5mVMKLmBIsxZUoNIVtDHBt60uze3ylKhcq32mbNHxN36iMJMIQr
	1W8HCf+++4BeuwrV+T2wSgBYImH43hTlURmVqmWuYp8meZCSxo/SYFwNSkDrqq9kJsfqy+UrjOfS5
	03K+ROPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1TaE-0000000D1qP-00mS;
	Tue, 01 Sep 2026 18:51:46 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1TZM-0000000D0gG-3pez;
	Tue, 01 Sep 2026 18:50:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788288645;
	bh=h0V25zxz4Vl87NWaPh4AVmL3vJCh/OsyUBtJsgXHKjA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VVIlGq2G1gfF5iBGWcy8CRCW6w2xA1e80Fev1L3P0du+t3a/0dPl7ggLiFI/p+Awx
	 tWrl5pPuGV6ny9AtTrpMkk8WRz1cRu0UJabzP2kyM/FGFmGDvp2Z3cA1fqLcCZCJAo
	 RmkPzUliNRl6KkRoVnMqIxX4sCb9DvN7RgpnsVn0SJSWewRccGb+EJvxjdou7SBmZv
	 4g9k+Q4KDv8fWQHgj3O75qvzxC3WxJPZ3V5iSUYxGggQOfQlijktB1tsnJZW8q1bm3
	 GDfMWKKVt00+dvQCrvPM9WivGOIwj9/cnoSThyJm+ei7ROiBS2Xyk1I+GjOAtFmNQB
	 dZyjPAX8WXJMg==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8D38217E10BE;
	Tue, 01 Sep 2026 20:50:45 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 01 Sep 2026 21:50:30 +0300
Subject: [PATCH v11 06/74] drm/probe-helper: Introduce .force_ctx()
 connector callback
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-dw-hdmi-qp-scramb-v11-6-bc12954a0688@collabora.com>
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
 linux-fbdev@vger.kernel.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_115056_072222_C7BA9EF4 
X-CRM114-Status: GOOD (  20.27  )
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

The .force() connector callback is invoked by
drm_helper_probe_single_connector_modes() while the modeset acquire
context it created is live, but the hook signature provides no way to
pass it down, e.g. to support implementations needing to lock further
objects.

Add a .force_ctx() variant to drm_connector_helper_funcs, taking the
acquire context and returning an error code, so that -EDEADLK propagates
into the existing retry path.  When provided, it takes precedence over
drm_connector_funcs' .force(), which is kept for existing users.

This is a prerequisite for SCDC status synchronization in the HDMI
connector framework.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/drm_probe_helper.c       | 15 ++++++++++++++-
 include/drm/drm_connector.h              |  6 ++++++
 include/drm/drm_modeset_helper_vtables.h | 28 ++++++++++++++++++++++++++++
 3 files changed, 48 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
index e26ead5b5e58..856b40fdaac4 100644
--- a/drivers/gpu/drm/drm_probe_helper.c
+++ b/drivers/gpu/drm/drm_probe_helper.c
@@ -559,6 +559,7 @@ static int __drm_helper_update_and_validate(struct drm_connector *connector,
 int drm_helper_probe_single_connector_modes(struct drm_connector *connector,
 					    uint32_t maxX, uint32_t maxY)
 {
+	const struct drm_connector_helper_funcs *funcs = connector->helper_private;
 	struct drm_device *dev = connector->dev;
 	struct drm_display_mode *mode;
 	int count = 0, ret;
@@ -592,8 +593,20 @@ int drm_helper_probe_single_connector_modes(struct drm_connector *connector,
 			connector->status = connector_status_connected;
 		else
 			connector->status = connector_status_disconnected;
-		if (connector->funcs->force)
+
+		if (funcs && funcs->force_ctx) {
+			ret = funcs->force_ctx(connector, &ctx);
+			if (ret == -EDEADLK) {
+				connector->status = old_status;
+				drm_modeset_backoff(&ctx);
+				goto retry;
+			} else if (ret < 0) {
+				drm_dbg_kms(dev, "[CONNECTOR:%d:%s] force_ctx failed: %d\n",
+					    connector->base.id, connector->name, ret);
+			}
+		} else if (connector->funcs->force) {
 			connector->funcs->force(connector);
+		}
 	} else {
 		ret = drm_helper_probe_detect(connector, &ctx, true);
 
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index be51265e8e26..f2be06f12b1a 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1670,6 +1670,12 @@ struct drm_connector_funcs {
 	 * the sysfs interfaces or on the kernel cmdline. In that case the
 	 * @detect callback isn't called.
 	 *
+	 * New drivers should implement
+	 * &drm_connector_helper_funcs.force_ctx instead, which gets passed
+	 * the modeset acquire context and thus allows taking additional
+	 * locks.  It takes precedence over this callback when both are
+	 * implemented.
+	 *
 	 * FIXME:
 	 *
 	 * Note that this hook is only called by the probe helper. It's not in
diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/drm_modeset_helper_vtables.h
index ca6268945c28..cf5fe5ba2b18 100644
--- a/include/drm/drm_modeset_helper_vtables.h
+++ b/include/drm/drm_modeset_helper_vtables.h
@@ -921,6 +921,34 @@ struct drm_connector_helper_funcs {
 			  struct drm_modeset_acquire_ctx *ctx,
 			  bool force);
 
+	/**
+	 * @force_ctx:
+	 *
+	 * This function is called to update internal encoder state when the
+	 * connector is forced to a certain state by userspace, either through
+	 * the sysfs interfaces or on the kernel cmdline. In that case the
+	 * @detect_ctx callback isn't called.
+	 *
+	 * This is the atomic version of &drm_connector_funcs.force.  When
+	 * both are implemented, this one takes precedence and
+	 * &drm_connector_funcs.force is not called.
+	 *
+	 * To avoid races against concurrent connector state updates, the
+	 * helper libraries always call this with ctx set to a valid context,
+	 * and &drm_mode_config.connection_mutex will always be locked with
+	 * the ctx parameter set to this ctx. This allows taking additional
+	 * locks as required.
+	 *
+	 * RETURNS:
+	 *
+	 * Zero on success, or a negative error code otherwise.  This includes
+	 * -EDEADLK when a lock acquisition needs to be restarted, in which
+	 * case the helpers take care of backing off and calling this function
+	 * again.
+	 */
+	int (*force_ctx)(struct drm_connector *connector,
+			 struct drm_modeset_acquire_ctx *ctx);
+
 	/**
 	 * @mode_valid:
 	 *

-- 
2.55.0


