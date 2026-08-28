Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19289C61DCD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 08:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fU2EHerhlIwxT2o5ahO4wxyga76HDhwM2gRiLj32KsU=; b=ZQRhrRxeceUXeI6jjPAunS4Sl2
	DV/5n0UmaCYnla0/hAw1Y+/37ObniEvzkdTCojGgyPnXTRe/1kGgWBKdb8SUEG6/18bmrggH20xq7
	z2aagLI9QJFYBvwSA7muM8msy4e+GkyGvZq8jpXTI7BQ25qXy7nyj2yvja7MPNN9YLYiO6zDlpKyb
	i2ivo7sq3bmdi67ai+rBeQw9L0N5qc0ycjXyci0PlJB6Km2+gwGOx6JGiJEfc7bWTnXFskmQl6XCI
	tRq6+05sEUooPQvBnAxf1UR1RZhgHwnPkWe4kWU4vMOXMYCPcL7cMz8n4XztkhZB4OcQ5+dWdKszt
	/CIjUueQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzsGU-00000005LD7-2tSg;
	Fri, 28 Aug 2026 08:48:46 +0000
Received: from smtpbg150.qq.com ([18.132.163.193])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzsGR-00000005LBg-0rp3;
	Fri, 28 Aug 2026 08:48:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1787906866;
	bh=fU2EHerhlIwxT2o5ahO4wxyga76HDhwM2gRiLj32KsU=;
	h=From:To:Subject:Date:Message-Id;
	b=rAEMia8/qC37dxyAeYkBUYqVtaRjKuNrQp/atAywRT/6WJfeO3oL5pRcvF8e8wFMF
	 oUC2+YxDPV7DIAl84fx5KgdiwYv3qJwFkUsTgGjL7MggLgo1oxx31oWvg/IRkgqZQD
	 kQsmUEf2S5YoYdOjO0v1/w+4xekTaIH/HJl4XN8k=
X-QQ-mid: zesmtpgz6t1787906864td0ccb54b
X-QQ-Originating-IP: rkT6K/MSciY2YH9oQfiA45bVQ3QMm0H3itZhu9mfyNk=
Received: from DESKTOP-8BT1A2O.localdomain ( [61.154.14.86])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 28 Aug 2026 16:47:40 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3426117217437372849
From: Chaoyi Chen <kernel@airkyi.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sandy Huang <hjc@rock-chips.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Vinod Koul <vkoul@kernel.org>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-phy@lists.infradead.org
Subject: [PATCH v7 0/7] drm/bridge: Implement generic USB Type-C DP HPD bridge
Date: Fri, 28 Aug 2026 16:47:30 +0800
Message-Id: <20260828084737.565-1-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: Mo8ayuSLF3j9OU6X1X94tph7LqJ0w/puq2OYVcCC0zgKdpWcybr2V4Qb
	h7rlizhBHmsOGjTaA8ph/t5LmLp/vLeOCwyIyY671n2UdP1uXExt71NdR3HY4JQxEOXdRYS
	wdOspEOartP9hgdi7qQjEocB9PafzR9jmiOekQSy2apWf3I+98w6Py4hlyXP1iYOV9XfLyJ
	IHL6N+WSz+dtFvMW9+WVKe0fPaJX3G/55f1lREE9hzIwB2Gb4nxRN7EKbxICnUp9flU+E0I
	/aFflPiGUZHtQPckZUoYFKnpKLy3E662hasE/zBcG+7Me3pSp1v3dMS6QnoTKzLGrRhJSrM
	04gZXpdrvrbGLpMQaq6IpZcEChJWVk1fLhjvxcmG79lHCw89MIDFKNhMGDSKPVMECIbfaH0
	3aUTSDkJDIzS+XkY8/yn+5IrWocr4EbbnQxwZUkOi1s4d0KWeRgIo0h9hS2dqane8XgQFGy
	s9NZ/RJs6hHHNAKrjHowIjwMjB9TWi9Jmctpo94Y+NeJseuALSXW1MF1MfGxQlrC1jpDJmH
	gBtTH01ZwVejlAoFfPcxg14mdgwhOmEoS7vgRZje6V/uXwXRn1u+Mo0MvdvSXy9EYekmqYi
	bpBF7p726LUeTsDNZ00tBU4ZyDztCb/ky7KZ0pYE0vMGklW8uYkuyk4fFOHzdQlbCyZnHWJ
	bioFmwXPMLeBv0NyLiEZVBBuSBo6oxjU8eo8epyCB+AwIrCfX7dk/SZ9njJbxVhdusVJaFh
	CTrfwGhty1yQOeOmrmO7HgTnlOl92o+BG9OPZAcxR9+vEjcl0I/yoXsDj/byKEl0yLRxaID
	V1jZEp57bLQVv4FSb0GKjVnYdCDUP6zspeBf290mDVWyAy0pRYOjn9pK0YPUHpioxizVJ31
	i++rLUHoXWORbhsUPCFR/Zx6r2aUerHEwRqhsJo/7j48hk/s7Wgqq1SmRxeOVNtIms3LsCJ
	jFzdvtT8jmhplNwb4aRHM/l7gkwm8QRPNxy8eSWgclDZCr4XVvdTVaDmjIYHTigkAIXsZjW
	NnQMBm5WSro+vKNVtX62A0bWFJQhE=
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_014843_772963_0E16A2E9 
X-CRM114-Status: GOOD (  11.91  )
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

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

This series is split from the v15 "Add Type-C DP support for RK3399 EVB
IND board" series [1]. It focuses on the DRM bridge and Rockchip
platform CDN-DP controller changes.

[1] https://lore.kernel.org/all/20260304094152.92-1-kernel@airkyi.com/

====
1. Generic Type-C DP HPD bridge

Currently, several USB-C controller drivers register their own DP HPD
bridge via aux-hpd-bridge.c, each duplicating the same logic. For
devicetree based platforms, the USB-C controller may vary across boards,
and not every USB-C controller driver implements this feature. Patch 1
implements a generic DP HPD bridge that monitors Type-C bus events and
automatically creates an HPD bridge when a Type-C port device with DP
SVID is registered.

2. Multiple bridge model for CDN-DP

The RK3399 has two USB/DP combo PHY and one CDN-DP controller. Patch 5
introduces a multi-bridge model where each PHY port gets a separate
encoder and bridge, allowing flexible selection of the output PHY port.
This is based on the DRM AUX HPD bridge rather than extcon.

====
Patch 1 adds new API to check whether a DisplayPort HPD bridge has
	already been registered(Sebastian).
Patch 2 adds generic USB Type-C DP HPD bridge (Dmitry, Heikki).
Patch 3 adds module soft depend for USB Type-C DP HPD bridge(Sebastian).
Patch 4 adds new API drm_aux_bridge_register_from_node() (Neil).
Patch 5 adds DRM AUX bridge support for RK3399 USBDP PHY (Neil).
Patch 6 drops CDN-DP's extcon dependency when Type-C is present (Dmitry).
Patch 7 adds multiple bridges to support PHY port selection (Dmitry, Luca).

Changes in v7:
- Link to v6: https://lore.kernel.org/all/20260804070730.68-1-kernel@airkyi.com/
- Fix extcon HPD detection by checking lanes in cdn_dp_connected_port() (sashiko).
- Bound endpoint count by PHY ports to avoid overflow and uninitialized reads (sashiko).
- Use drm_bridge_clear_and_put() to clear next_bridge_list pointers (sashiko).
- Clear EDID cache pointers after free in unbind() (sashiko).

Changes in v6:
- Link to v5: https://lore.kernel.org/all/20260730013349.51-1-kernel@airkyi.com/
- Avoid duplicate registration of the same DisplayPort HPD bridge.

Changes in v5:
- Link to v4: https://lore.kernel.org/all/20260727064408.101-1-kernel@airkyi.com/
- Add module soft depend for USB Type-C DP HPD bridge.

Changes in v4:
- Link to v3: https://lore.kernel.org/all/20260717072323.96-1-kernel@airkyi.com/
- Scan the entire typec_bus and attempt to register the hpd bridge,
  so as not to miss devices that were already added during initialization.

Changes in v3:
- Link to v2: https://lore.kernel.org/all/20260608070805.88-1-kernel@airkyi.com/
  (Sorry, I forgot to add the "v2" title, so it looks like v1.)
- Remove now-redundant call to drm_connector_attach_encoder()
- Rebase to v7.2-rc2

Changes in v2:
- Link to v1: https://lore.kernel.org/all/20260521032854.103-1-kernel@airkyi.com/
- Add copyright text.
- Remove useless goto.
- Fix incorrect function names in the documentation comments.
- Fix the check logic for dp->active_port (0 is valid).
- Fix the uninitialized prev_port.
- Remove duplicate logic from cdn_dp_switch_port().
- Fix the prototype of cdn_dp_bridge_hpd_notify().
- Properly release connector->fwnode.
- Properly release next_bridge.

Chaoyi Chen (7):
  drm/bridge: aux-hpd-bridge: Add drm_dev_has_dp_hpd_bridge()
  drm/bridge: Implement generic USB Type-C DP HPD bridge
  drm/display: Add soft depend for aux-hpd-typec-dp-bridge module
  drm/bridge: aux: Add drm_aux_bridge_register_from_node()
  phy: rockchip: phy-rockchip-typec: Add DRM AUX bridge
  drm/rockchip: cdn-dp: Support handle lane info without extcon
  drm/rockchip: cdn-dp: Add multiple bridges to support PHY port
    selection

 drivers/gpu/drm/bridge/Kconfig                |  10 +
 drivers/gpu/drm/bridge/Makefile               |   1 +
 drivers/gpu/drm/bridge/aux-bridge.c           |  26 +-
 drivers/gpu/drm/bridge/aux-hpd-bridge.c       |  42 +-
 .../gpu/drm/bridge/aux-hpd-typec-dp-bridge.c  |  67 ++++
 .../gpu/drm/display/drm_display_helper_mod.c  |   1 +
 drivers/gpu/drm/rockchip/Kconfig              |   1 +
 drivers/gpu/drm/rockchip/cdn-dp-core.c        | 365 +++++++++++++++---
 drivers/gpu/drm/rockchip/cdn-dp-core.h        |  18 +-
 drivers/phy/rockchip/Kconfig                  |   2 +
 drivers/phy/rockchip/phy-rockchip-typec.c     |  13 +-
 include/drm/bridge/aux-bridge.h               |  12 +
 12 files changed, 486 insertions(+), 72 deletions(-)
 create mode 100644 drivers/gpu/drm/bridge/aux-hpd-typec-dp-bridge.c

-- 
2.53.0


