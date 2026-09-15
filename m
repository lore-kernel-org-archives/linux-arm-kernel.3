Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0516DC88E7D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 16:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=r7ws2yNGxCu99b9kREC/qBBkTq3Kz8mFcYPsCXy1MLk=; b=dWFFG8kAIxWpfs
	8mm6e6MQjJ95dB/A2lkUVnJIoler+boyeG2Mb0j7wV1chrG4VRQwTJxdoo0vCLXnG1zQtAxwjoLLx
	lAjtiXglKAWWcjofQ0R1tZDI7Nddm4LufKM0L+6bkqTu4KtEW0W90JJP7tQbXgpUHb/4EiI67V9m5
	U0gPdqQK3lIqdx4ThsiZ5S4CmjReahg6Y7VR9bvgxMG7H4ieZEWpS+KXLQv7UHFfGiiSJd59FU79h
	uHi1b5CzBYMHYswCkQcvFQprlKDmlbp6gKMroliixzZq903BpWl3NsbQqpvWgV4vqRAMmUBigs1jp
	JxuSyUbN3star1ER8O1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6WJ3-00000007T1a-2O3p;
	Tue, 15 Sep 2026 16:46:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6WJ0-00000007T0L-1dov
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 15 Sep 2026 16:46:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=r7ws2yNGxCu99b9kREC/qBBkTq3Kz8mFcYPsCXy1MLk=; b=Qt8UoZnb39BT18xH5xbA1kBEzw
	Kf2J+QgL7Bukb8Lm4jNMX9YYC2hJGfLk25ocHhMbv8oft5eZP+p+IomOwNsGPRBe+3Cx+lwuRIOIs
	B4iFxEdcjU5S7yUGLHBHsiI3bJ+lJ/H1PNhXQ1W8HZUhwoUAppRtVixy5t4IOkn3LTaIGkHDW+fGE
	CoMLY6r0he4OHsuz9ywK9CsqAT/wsQoSVdpdA5HxG9pULwuniqsG5yTweinrOBpHYyYY/K7GWjbnW
	7Hsepi98v9VF3aoC2uWSf1QMR9y3Nay5nwcTPvmz4i+g9uwZfDvwxnXB2jDKZJ0Oks7O8vLFuPq3+
	v0KCMEjQ==;
Received: from smtpout-04.galae.net ([185.171.202.116])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6WIw-000000072bP-1Msu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 16:46:49 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 4DB0DC5CD49;
	Tue, 15 Sep 2026 16:47:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 847F2602B0;
	Tue, 15 Sep 2026 16:46:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3617911C7B005;
	Tue, 15 Sep 2026 18:46:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789490800; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=r7ws2yNGxCu99b9kREC/qBBkTq3Kz8mFcYPsCXy1MLk=;
	b=WkFbKeuQSkU4PhcQNzSuI3zOKkdFlsLI1oHzH68fWp95mQq5fomdyXjlEOXzt5+vSgCsJI
	AtMoFCHX4zt8FlnZerWJJJQITtUBRaTdzcGgZYc00Y0vqeCniX4AKhVgTX7wbEEYl9sXFr
	uXROuhcYgphRUWvIS50aMf+AxIMPU9bVg/6nusqyUIw99F2Sr4i812+afVojnETAsYjO/f
	oGW50T3ig+4llPLVugYjuSlV1oi+QcOxFxlbZG4fw1iYydCSgiDmh1kqFxkJUvU0axVEk0
	Qky4CXQN44Z1nue8YRQiwnGpTJZuizO5u0PEsqSNpBvcho8rpBoUMwNiZjPTzA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH v4 0/9] drm/bridge: Kconfig: cleanup DRM_PANEL usage
Date: Tue, 15 Sep 2026 18:46:13 +0200
Message-Id: <20260915-drm-bridge-drm_panel-cleanup-v4-0-30401d9406f3@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43NyQ6CMBQF0F8hXVvTgaG48j+MMR0eUgMtaZFoD
 P9u0Y3GBe7ezbs594EiBAsR7bIHCjDZaL1LId9kSLfSnQFbkzJihJVEUIZN6LEK1qRPOk+DdNB
 h3YF01wGTGkyhNSV1LlAihgCNvb34w/Gd41VdQI+LuTRaG0cf7q/9iS69P6cmigkmRpQVz6EmQ
 u6V92Nn3Vb7Hi1jE/vgWLHCscTpUguhZNU0hv1y/IPjdIXjiSsINEbQUigO39w8z08KrmP+egE
 AAA==
X-Change-ID: 20260812-drm-bridge-drm_panel-cleanup-09ed5cc10948
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, Marek Vasut <marex@denx.de>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Christopher Vollo <chris@renewoutreach.org>, 
 Sean Paul <seanpaul@chromium.org>, Vincent Palatin <vpalatin@chromium.org>, 
 Tony Lindgren <tony@atomide.com>, Michael Walle <mwalle@kernel.org>, 
 Vinay Simha BN <simhavcs@gmail.com>, Maoyi Xie <maoyixie.tju@gmail.com>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Andrey Gusakov <andrey.gusakov@cogentembedded.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Peter Ujfalusi <peter.ujfalusi@ti.com>, 
 Svyatoslav Ryhel <clamor95@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 sashiko-bot@kernel.org
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_174646_510952_61AAA9A0 
X-CRM114-Status: GOOD (  11.48  )
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

As a cleanup in preparation for making every drm_panel embed a drm_bridge,
fix missing or unnecessary usage of DRM_PANEL and DRM_PANEL_BRIDGE in
drivers/gpu/drm/bridge/Kconfig.

== Grand plan

This is part of the work to support hotplug of DRM bridges. The grand plan
was discussed in [0].

Here's the work breakdown (➜ marks the current series):

 1. ➜ add refcounting to DRM bridges struct drm_bridge,
      based on devm_drm_bridge_alloc()
    A. ✔ add new alloc API and refcounting (v6.16)
    B. ✔ convert all bridge drivers to new API (v6.17)
    C. ✔ kunit tests (v6.17)
    D. ✔ add get/put to drm_bridge_add/remove() + attach/detach()
         and warn on old allocation pattern (v6.17)
    E. ➜ add get/put on drm_bridge accessors
       1. ✔ drm_bridge_chain_get_first_bridge(), add cleanup action (v6.18)
       2. ✔ drm_bridge_get_prev_bridge() (v6.18)
       3. ✔ drm_bridge_get_next_bridge() (v6.19)
       4. ✔ drm_for_each_bridge_in_chain() (v6.19)
       5. ✔ drm_bridge_connector_init (v6.19)
       6. ✔ protect encoder bridge chain with a mutex (v7.2)
       7. ✔ of_drm_find_bridge
          a. ✔ add of_drm_get_bridge() (v7.0),
               convert basic direct users (v7.0-v7.1)
          b. ✔ convert direct of_drm_get_bridge() users, part 2 (v7.0)
          c. ✔ convert direct of_drm_get_bridge() users, part 3 (v7.0)
          d. ✔ convert direct of_drm_get_bridge() users, part 4 (v7.1-v7.2)
          e. ✔ bridge-only drm_of_find_panel_or_bridge() users (v7.2)
       8. ➜ panel_bridge lifetime
          a. ➜ cleanup DRM_PANEL in bridge drivers
	  b. … embed a drm_bridge in every drm_panel
       9. ✔ enforce drm_bridge_add before drm_bridge_attach (v6.19)
    F. ✔ debugfs improvements
       1. ✔ add top-level 'bridges' file (v6.16)
       2. ✔ show refcount and list lingering bridges (v6.19)
 2. ✔ handle gracefully atomic updates during bridge removal
    A. ✔ Add drm_bridge_enter/exit() to protect device resources (v7.0)
    B. ✔ Add drm_bridge_clear_and_put() (v7.1)
 3. … DSI host-device driver interaction
 4. ✔ removing the need for the "always-disconnected" connector
 5. ✔ Migrate i.MX LCDIF driver to bridge-connector (v7.2)
 6. … DRM bridge hotplug
    A. … Bridge hotplug management in the DRM core
       1. ✔ bridge-connector: attach encoder to the connector (v7.2)
       2. … drm bridge hotplug
    B.   Device tree description

[0] https://lore.kernel.org/lkml/20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com/#t

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
Changes in v4:
- Removed 4 patches now upstream
- Fixed commit message of the tc358767 patch
- Link to v3: https://patch.msgid.link/20260831-drm-bridge-drm_panel-cleanup-v3-0-50efd8168b3e@bootlin.com

Changes in v3:
- Fixed a few patches which incorrectly removed 'select DRM_BRIDGE'
- Added missing 'select DRM_PANEL_BRIDGE' to some patches where
  devm_drm_of_get_bridge() is used (thanks Doug)
- Added patch 13 for tc358764
- Removed boucing address spanda@codeaurora.org from Cc list
- Link to v2: https://patch.msgid.link/20260825-drm-bridge-drm_panel-cleanup-v2-0-c6c88ba7ffd2@bootlin.com

Changes in v2:
- Added maintainers and recent authors to per-patch Cc list (these are not
  added automatically by get-maintainers because the patches touch only the
  Kconfig file)
- Added review trailer
- No changes to commit messages and patch content
- Link to v1: https://patch.msgid.link/20260812-drm-bridge-drm_panel-cleanup-v1-0-0d86734e908a@bootlin.com

---
Luca Ceresoli (9):
      drm/bridge: tc358764: don't select unused DRM_PANEL
      drm/bridge: ti-dlpc3433: don't depend on DRM_PANEL, select DRM_PANEL_BRIDGE
      drm/bridge: nxp-ptn3460: select DRM_PANEL_BRIDGE, not DRM_PANEL
      drm/bridge: parade-ps8622: select DRM_PANEL_BRIDGE, not DRM_PANEL
      drm/bridge: tc358775: select DRM_PANEL_BRIDGE, not DRM_PANEL
      drm/bridge: tc358767: select DRM_PANEL_BRIDGE
      drm/bridge: tc358768: select DRM_PANEL_BRIDGE
      drm/bridge: ssd2825: select DRM_PANEL_BRIDGE
      drm/bridge: tc358764: select DRM_PANEL_BRIDGE

 drivers/gpu/drm/bridge/Kconfig | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)
---
base-commit: 2d70e1401dbbfc559b6a5d1ba8275d5282d71c2c
change-id: 20260812-drm-bridge-drm_panel-cleanup-09ed5cc10948

Best regards,
--  
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


