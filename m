Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 609AED74EFA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 16:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Zz9tOwE8YXJFkhUKv/SREBAFzg3OcfCRy/XQlSA2sB4=; b=Ur97qS0fkZIPwf
	VPbKalvgd37f/HiuyzXpmGLshNf6lid5mi3s/3FLe/+OLrEofXEvFzlYB6dwdoXLRtFVpfT+2lAFH
	ZYjGrwvdmuAmDdGk0PouZoxoffntNUffcYqFSi4Pby2hPLMYB0lwEpw8Sa3qY286JUDHLKcvjRilu
	TK382T8WzBAcdBh9wItX4hSI62PPaYOxE7RAsmZKuys5pJ/8mNrg96nMsHYB9qSaAMEfnjzpwVsRR
	k0kqrYSLMc7eqNk0VPl6i50tKe3LpIkwPMq5Y2GtO72voLI8b/3eYMnnrAtG9tGQPkb/ngfk7pFTa
	MUExEX+VmR2xL3aM8OnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjJm6-000000099RC-3hx8;
	Fri, 23 Jan 2026 16:12:42 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjJm4-000000099QW-0rQe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 16:12:42 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 098B94E42222;
	Fri, 23 Jan 2026 16:12:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B54DE6070A;
	Fri, 23 Jan 2026 16:12:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DBF33119A87A7;
	Fri, 23 Jan 2026 17:12:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769184754; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=Zz9tOwE8YXJFkhUKv/SREBAFzg3OcfCRy/XQlSA2sB4=;
	b=KL8KaoLE2xMoa9LKb2a2KfoWrUhaAGZIwlYs3ScimMu5cQCOliuLaI1oWVcDeTHv76fyJL
	sZDM2ViCxVI5u+KrEQNqsJhFNQ389EymZ4OgMliui0dE/oeoKPLBuYux2vW177e5CiHloD
	beewARNzo+YL/hnC2juoePilrEdwV+NKMyQn8pwm3p4kP9tpidqjvszBFdZpcnJ1302m0I
	U3Von6dFsU/3VSb34q9BxXWyoqOB6W/ZLeJrDjlin8K6KDU7u3BGyW7zx2FOZUBxogR5Rr
	stwpZLMGolXmkf3tMSObeHV+L9aacFYa3J0UROEqTVkrb6dHughJ46DEbuEoiw==
From: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
Subject: [PATCH v5 00/25] Clean and update tilcdc driver to support
 DRM_BRIDGE_ATTACH_NO_CONNECTOR
Date: Fri, 23 Jan 2026 17:12:18 +0100
Message-Id: <20260123-feature_tilcdc-v5-0-5a44d2aa3f6f@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAOKdc2kC/2XO3UoDMRCG4VspOTaSmUx3G4+8DxFJJhMbqBvJr
 otS9t5NK+JPDt8P5mHOapaaZVZ3u7OqsuY5l6nF/man+OinZ9E5tlZocA8GSCfxy1uVpyWfOLI
 eHUdyMowhOdWOXquk/H4FHx5bH/O8lPpx9Ve4rF8U4PCfWkEbTS44SSjWe3MfSllOebrl8qIu2
 Io/AAJ0ADYg0SF4thytlR6w38BgwPQf2Aa44KNJIyEM1AP0C4AeoAYgAyMCWXMY/wLbtn0COmI
 RNnEBAAA=
X-Change-ID: 20251014-feature_tilcdc-79cd49e67bf9
To: Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Tony Lindgren <tony@atomide.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Markus Schneider-Pargmann <msp@baylibre.com>, 
 Bajjuri Praneeth <praneeth@ti.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Miguel Gazquez <miguel.gazquez@bootlin.com>, 
 Herve Codina <herve.codina@bootlin.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
 "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_081240_376617_3403CAEA 
X-CRM114-Status: GOOD (  20.67  )
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

The starting point for this work was adding support for the HDMI cape:
https://www.seeedstudio.com/Seeed-Studio-BeagleBone-Green-HDMI-Cape.html
This will be sent in a later series.

Initially, Miguel proposed modifying the ite-it66121 bridge to support
the legacy behavior without the DRM_BRIDGE_ATTACH_NO_CONNECTOR flag:
https://lore.kernel.org/lkml/20250909-it66121-fix-v1-1-bc79ca83df17@bootlin.com/
This patch was NAK'd as we don't want to add more legacy code. Maxime
requested that the tilcdc driver be updated to use
DRM_BRIDGE_ATTACH_NO_CONNECTOR instead.

While working on this update, I discovered that the tilcdc driver
contained significant amounts of legacy code that needed cleaning.
Since this driver was developed alongside the tda998x driver for
several AM335x boards, the tda998x driver also required cleanup and
support for the DRM_BRIDGE_ATTACH_NO_CONNECTOR flag.

A new tilcdc_panel_legacy driver replaces the old tilcdc_panel driver.
It modifies the devicetree at boot time to properly bind the tilcdc driver
with the standard panel-simple driver.

This series is based on the tilcdc fix sent to mainline:
https://lore.kernel.org/lkml/20251125090546.137193-1-kory.maincent@bootlin.com/

This series has been tested on:
- BeagleBone Black (tilcdc + tda998x bridge)
- BeagleBone Black with LCD cape (tilcdc + ti,tilcdc,panel binding)
- BeagleBone Green Eco with HDMI cape (tilcdc + it66121 bridge)

The following mainline devicetrees still use ti,tilcdc,panel binding.
I believe this series maintains compatibility, but I cannot test without
hardware:
- da850-evm.dts
- am335x-guardian.dts
- am335x-pdu001.dts
- am335x-pepper.dts
- am335x-sbc-t335.dts
- am335x-sl50.dts

Patches 1-2: Convert tilcdc binding to YAML and set the ti,tilcdc,panel
	     sub-binding as legacy.
Patches 3-6: Replace tilcdc_panel driver to the new tilcdc_panel_legacy
	     driver which is tweaking the devicetree at boot time.
Patches 7-20: Clean up tilcdc driver.
Patches 21-23: Clean up tda998x driver.
Patch 24: Add DRM_BRIDGE_ATTACH_NO_CONNECTOR support for tda998x driver.
Patch 25: Add DRM_BRIDGE_ATTACH_NO_CONNECTOR support for tilcdc driver.

Changes in v5:
- Fix a missing cleanup path.
- Link to v4: https://lore.kernel.org/r/20260116-feature_tilcdc-v4-0-2c1c22143087@bootlin.com

Changes in v4:
- Use device_get_match_data instead of of_match_node.
- Convert the driver to use DRM managed resources to avoid lifetime
  resources issue.
- Add a patch to convert to drm_device-based logging helpers.
- Replace drm_of_find_panel_or_bridge() with the newer
  devm_drm_of_get_bridge() helper.
- Link to v3: https://lore.kernel.org/r/20260106-feature_tilcdc-v3-0-9bad0f742164@bootlin.com

Changes in v3:
- Split patch 13 and patch 14 into two for better readability and git
  history clarity.
- Update patch 5 to use OF changeset and __free() macro. Made also few
  small improvements as requested by Luca.
- Rename binding file to ti,am33xx-tilcdc.yaml, use generic node name and
  drop unused label.
- Link to v2: https://lore.kernel.org/r/20251211-feature_tilcdc-v2-0-f48bac3cd33e@bootlin.com

Changes in v2:
- Remove patch 2 that add fifo-threshold property. Use FIFO threshold
  value from SoC id instead.
- Remove the part that breaks DTB compatibility.
- Add tilcdc_panel_legacy to modify the devicetree at boot time to properly
  bind the tilcdc driver with the standard panel-simple driver.
- Link to v1: https://lore.kernel.org/r/20251126-feature_tilcdc-v1-0-49b9ef2e3aa0@bootlin.com

Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
---
Kory Maincent (TI.com) (25):
      dt-bindings: display: tilcdc: Convert to DT schema
      dt-bindings: display: tilcdc: Mark panel binding as deprecated
      drm/tilcdc: Remove simulate_vesa_sync flag
      drm/tilcdc: Add support for DRM bus flags and simplify panel config
      drm/tilcdc: Convert legacy panel binding via DT overlay at boot time
      drm/tilcdc: Remove tilcdc panel driver
      drm/tilcdc: Remove component framework support
      drm/tilcdc: Remove tilcdc_panel_info structure
      drm/tilcdc: Remove redundant #endif/#ifdef in debugfs code
      drm/tilcdc: Remove unused encoder and connector tracking arrays
      drm/tilcdc: Rename external_encoder and external_connector to encoder and connector
      drm/tilcdc: Rename tilcdc_external to tilcdc_encoder
      drm/tilcdc: Remove the useless module list support
      drm/tilcdc: Use drm_module_platform_driver() helper
      drm/tilcdc: Move tilcdc_init/fini closer to probe/remove
      drm/tilcdc: Modernize driver initialization and cleanup paths
      drm/tilcdc: Remove the use of drm_device private_data
      drm/tilcdc: Convert to DRM managed resources
      drm/tilcdc: Convert to drm_device-based logging helpers
      drm/tilcdc: Use devm_drm_of_get_bridge() helper
      drm/bridge: tda998x: Remove component support
      drm/bridge: tda998x: Move tda998x_create/destroy into probe and remove
      drm/bridge: tda998x: Remove useless tda998x_connector_destroy wrapper
      drm/bridge: tda998x: Add support for DRM_BRIDGE_ATTACH_NO_CONNECTOR
      drm/tilcdc: Add support for DRM_BRIDGE_ATTACH_NO_CONNECTOR

 .../devicetree/bindings/display/tilcdc/panel.txt   |   1 +
 .../bindings/display/tilcdc/ti,am33xx-tilcdc.yaml  | 100 +++++
 .../devicetree/bindings/display/tilcdc/tilcdc.txt  |  82 ----
 drivers/gpu/drm/bridge/tda998x_drv.c               | 251 +++++------
 drivers/gpu/drm/tilcdc/Kconfig                     |  18 +
 drivers/gpu/drm/tilcdc/Makefile                    |   5 +-
 drivers/gpu/drm/tilcdc/tilcdc_crtc.c               | 192 +++-----
 drivers/gpu/drm/tilcdc/tilcdc_drv.c                | 486 ++++++++-------------
 drivers/gpu/drm/tilcdc/tilcdc_drv.h                |  99 +----
 drivers/gpu/drm/tilcdc/tilcdc_encoder.c            |  69 +++
 .../tilcdc/{tilcdc_external.h => tilcdc_encoder.h} |   5 +-
 drivers/gpu/drm/tilcdc/tilcdc_external.c           | 179 --------
 drivers/gpu/drm/tilcdc/tilcdc_panel.c              | 408 -----------------
 drivers/gpu/drm/tilcdc/tilcdc_panel.h              |  15 -
 drivers/gpu/drm/tilcdc/tilcdc_panel_legacy.c       | 185 ++++++++
 drivers/gpu/drm/tilcdc/tilcdc_panel_legacy.dtso    |  29 ++
 drivers/gpu/drm/tilcdc/tilcdc_plane.c              |  37 +-
 drivers/gpu/drm/tilcdc/tilcdc_regs.h               |   8 +-
 18 files changed, 812 insertions(+), 1357 deletions(-)
---
base-commit: a3158f3710111bbd4bfba3bc0883449efde10a0b
change-id: 20251014-feature_tilcdc-79cd49e67bf9

Best regards,
--  
Köry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com


