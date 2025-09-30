Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFAD3CAC5B9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 09:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ovc33eB7wSLHPez3uqwzpvXJejZ0kZtOPk8MV/jKdXE=; b=RBnwDy0TqL4R8dRjoX1I3cy1ST
	QKDcXMDCpEswVlE1afgyJcMEF3LRFCoqekUKUxrSpJ4tY998g6ZJQ8esyxI0Ag9k8sT1kDkylFzNL
	Tlx51TlLBNYaWuPDFB3dSlqDRg0bPTznW6Ab85efP5wvq84mWsJSoYwIkS2h7Yy3LDH2p3Nk6FQWe
	rmTxJZkL1BvSr6zho4/gEzdDaSfIRR3E7pBifyxleJ/aRqyEcfCFU5qvyndOaKMf+5bJEElmpIvy5
	r5wiIpBxRpQuz2XXhXoSXgAbQXzFOIcil3E49BCBe7NJyz6SXXT8tfd6Y0Gmm1mhOTSBymu3Xoqvu
	QsOphD9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3WRF-00000004l1l-1k1Q;
	Tue, 30 Sep 2025 09:14:25 +0000
Received: from mail-m15580.qiye.163.com ([101.71.155.80])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3WRB-00000004kwu-2644;
	Tue, 30 Sep 2025 09:14:23 +0000
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2493eb107;
	Tue, 30 Sep 2025 17:14:09 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org
Cc: Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	inki.dae@samsung.com,
	sw0312.kim@samsung.com,
	kyungmin.park@samsung.com,
	krzk@kernel.org,
	alim.akhtar@samsung.com,
	jingoohan1@gmail.com,
	p.zabel@pengutronix.de,
	hjc@rock-chips.com,
	heiko@sntech.de,
	andy.yan@rock-chips.com,
	dmitry.baryshkov@oss.qualcomm.com,
	dianders@chromium.org,
	m.szyprowski@samsung.com,
	luca.ceresoli@bootlin.com,
	jani.nikula@intel.com,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v6 00/18] Apply drm_bridge_connector and panel_bridge helper for the Analogix DP driver
Date: Tue, 30 Sep 2025 17:09:02 +0800
Message-Id: <20250930090920.131094-1-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9999e6960e03a3kunmd96de74a43b9a5
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGhgeSlZDQk9NThlPSx9LHxpWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
	1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=XmLXrMvrN6lC3eAZZK8KA2PbUGORqKt/cvBVnRP1VQsigWRaYg78tmxvxinCLPS2pjK+TLvXPdAIuXpZ/MUeanTuOGZ2GzbfILHBDWfvaxthOtETnXR0NrBYJV2HzVzoruL6ytDh4Wj8Zozoe3WN8FLIXuKybLumk9Tw898l1AM=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=Ovc33eB7wSLHPez3uqwzpvXJejZ0kZtOPk8MV/jKdXE=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_021422_064788_C858A23D 
X-CRM114-Status: GOOD (  16.47  )
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

PATCH 1 is a small format optimization for struct analogid_dp_device.
PATCH 2 is to perform mode setting in &drm_bridge_funcs.atomic_enable.
PATCH 3 is to add a new parameter to store the point of next bridge.
PATCH 4 is to make legacy bridge driver more universal.
PATCH 5-10 are preparations for apply drm_bridge_connector helper.
PATCH 11 is to ensure last bridge determines OP_EDID/OP_MODES capabilities.
PATCH 12 is to apply the drm_bridge_connector helper.
PATCH 13-15 are to move the panel/bridge parsing to the Analogix side.
PATCH 16 is to attach the next bridge on Analogix side uniformly.
PATCH 17-18 are to apply the panel_bridge helper.

Damon Ding (18):
  drm/bridge: analogix_dp: Formalize the struct analogix_dp_device
  drm/bridge: analogix_dp: Move &drm_bridge_funcs.mode_set to
    &drm_bridge_funcs.atomic_enable
  drm/bridge: analogix_dp: Add &analogix_dp_plat_data.next_bridge
  drm/bridge: Move legacy bridge driver out of imx directory for
    multi-platform use
  drm/exynos: exynos_dp: Remove &exynos_dp_device.ptn_bridge
  drm/exynos: exynos_dp: Remove unused &exynos_dp_device.connector
  drm/exynos: exynos_dp: Apply legacy bridge to parse the
    display-timings node
  drm/bridge: analogix_dp: Remove redundant
    &analogix_dp_plat_data.skip_connector
  drm/bridge: analogix_dp: Move the color format check to
    .atomic_check() for Rockchip platforms
  drm/bridge: analogix_dp: Remove unused
    &analogix_dp_plat_data.get_modes()
  drm/display: bridge_connector: Ensure last bridge determines
    EDID/modes detection capabilities
  drm/bridge: analogix_dp: Apply drm_bridge_connector helper
  drm/bridge: analogix_dp: Add new API analogix_dp_finish_probe()
  drm/rockchip: analogix_dp: Apply analogix_dp_finish_probe()
  drm/exynos: exynos_dp: Apply analogix_dp_finish_probe()
  drm/bridge: analogix_dp: Attach the next bridge in
    analogix_dp_bridge_attach()
  drm/bridge: analogix_dp: Remove bridge disabing and panel unpreparing
    in analogix_dp_unbind()
  drm/bridge: analogix_dp: Apply panel_bridge helper

 drivers/gpu/drm/bridge/Kconfig                |  10 +
 drivers/gpu/drm/bridge/Makefile               |   1 +
 drivers/gpu/drm/bridge/analogix/Kconfig       |   1 +
 .../drm/bridge/analogix/analogix_dp_core.c    | 395 +++++++++---------
 .../drm/bridge/analogix/analogix_dp_core.h    |   5 +-
 drivers/gpu/drm/bridge/imx/Kconfig            |  10 -
 drivers/gpu/drm/bridge/imx/Makefile           |   1 -
 .../gpu/drm/bridge/imx/imx-legacy-bridge.c    |  91 ----
 drivers/gpu/drm/bridge/legacy-bridge.c        |  99 +++++
 .../gpu/drm/display/drm_bridge_connector.c    |  42 ++
 drivers/gpu/drm/exynos/Kconfig                |   2 +
 drivers/gpu/drm/exynos/exynos_dp.c            | 117 ++----
 drivers/gpu/drm/imx/ipuv3/Kconfig             |   4 +-
 drivers/gpu/drm/imx/ipuv3/imx-ldb.c           |   6 +-
 drivers/gpu/drm/imx/ipuv3/parallel-display.c  |   4 +-
 drivers/gpu/drm/rockchip/Kconfig              |   1 +
 .../gpu/drm/rockchip/analogix_dp-rockchip.c   |  67 +--
 include/drm/bridge/analogix_dp.h              |   8 +-
 include/drm/bridge/imx.h                      |  17 -
 include/drm/bridge/legacy-bridge.h            |  18 +
 20 files changed, 433 insertions(+), 466 deletions(-)
 delete mode 100644 drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c
 create mode 100644 drivers/gpu/drm/bridge/legacy-bridge.c
 delete mode 100644 include/drm/bridge/imx.h
 create mode 100644 include/drm/bridge/legacy-bridge.h

---

Changes in v2:
- Update Exynos DP driver synchronously.
- Move the panel/bridge parsing to the Analogix side.

Changes in v3:
- Rebase for the existing devm_drm_bridge_alloc() applying commit.
- Fix the typographical error of panel/bridge check in exynos_dp_bind().
- Squash all commits related to skip_connector deletion in both Exynos and
  Analogix code into one.
- Apply panel_bridge helper to make the codes more concise.
- Fix the handing of bridge in analogix_dp_bridge_get_modes().
- Remove unnecessary parameter struct drm_connector* for callback
  &analogix_dp_plat_data.attach().
- In order to decouple the connector driver and the bridge driver, move
  the bridge connector initilization to the Rockchip and Exynos sides.

Changes in v4:
- Rebase for the applied &drm_bridge_funcs.detect() modification commit.
- Rename analogix_dp_find_panel_or_bridge() to analogix_dp_finish_probe().
- Drop the drmm_encoder_init() modification commit.
- Rename the &analogix_dp_plat_data.bridge to
  &analogix_dp_plat_data.next_bridge.

Changes in v5:
- Add legacy bridge to parse the display-timings node under the dp node
  for Exynos side.
- Move color format check to &drm_connector_helper_funcs.atomic_check()
  in order to get rid of &analogix_dp_plat_data.get_modes().
- Remove unused callback &analogix_dp_plat_data.get_modes().
- Distinguish the &drm_bridge->ops of Analogix bridge based on whether
  the downstream device is a panel, a bridge or neither.
- Select DRM_DISPLAY_DP_AUX_BUS for DRM_ANALOGIX_DP, and remove it for
  ROCKCHIP_ANALOGIX_DP.
- Apply rockchip_dp_attach() to support the next bridge attachment for
  the Rockchip side.
- Move next_bridge attachment from Analogix side to Rockchip/Exynos sides.

Changes in v6:
- Move legacy bridge driver out of imx directory for multi-platform use.
- Apply DRM legacy bridge to parse display timings intead of implementing
  the same codes only for Exynos DP.
- Ensure last bridge determines EDID/modes detection capabilities in DRM
  bridge_connector driver.
- Remove unnecessary drm_bridge_get_modes() in
  analogix_dp_bridge_get_modes().
- Simplify analogix_dp_bridge_edid_read().
- If the next is a bridge, set DRM_BRIDGE_OP_DETECT and return
  connector_status_connected in analogix_dp_bridge_detect().
- Set flag DRM_BRIDGE_ATTACH_NO_CONNECTOR for bridge attachment while
  binding. Meanwhile, make DRM_BRIDGE_ATTACH_NO_CONNECTOR unsuppported
  in analogix_dp_bridge_attach().
- Move the next bridge attachment to the Analogix side rather than
  scattered on Rockchip and Exynos sides.
- Remove the unnecessary analogix_dp_bridge_get_modes().
- Squash [PATCH v5 15/17] into [PATCH v5 17/17].
- Fix the &drm_bridge->ops to DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_DETECT.

-- 
2.34.1


