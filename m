Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21DF1107526B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 07:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4FLQr6j/Ajnpl8vXUNdSOalw+cZmz8SRafApCLOp0JE=; b=Yn9b8LXHR2qhXpPvgZkbv2Y6cJ
	u/u4POJXA76mjrMIob+TXEV9pH4VvfbfnEDZBD9LYb+5vPwTPavG+dbDm3RlGg2jcP4JEMT8TgiPq
	0KnkXckSH39kH7yXsrjlJCXfhuR9LyHpWqtA0D4lwNzkt6lYO19K9lEE9wPowgBjicDTiYy6H41Rf
	/UjyYJmAH4yiXlHQhpAgLU1wmdHKUwV9+Zrv7CzL5/logYnsVXPpwVjTD3v+4pPRJHkrUUwye/aov
	tX68QV08lFuUBTcT622bl/y2qWzSY1hFo9I0Um9h+uDAetIXREmB+r8+8qsVgy1OVU8nyjWOAp1uN
	3wKh770Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w37bG-0000000A75R-3lY7;
	Thu, 19 Mar 2026 07:15:22 +0000
Received: from mail-m19731111.qiye.163.com ([220.197.31.111])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w37bD-0000000A71p-0yzj;
	Thu, 19 Mar 2026 07:15:21 +0000
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3788743a2;
	Thu, 19 Mar 2026 15:15:08 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	victor.liu@nxp.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	inki.dae@samsung.com,
	sw0312.kim@samsung.com,
	kyungmin.park@samsung.com,
	krzk@kernel.org,
	jingoohan1@gmail.com,
	p.zabel@pengutronix.de,
	hjc@rock-chips.com,
	heiko@sntech.de,
	andy.yan@rock-chips.com
Cc: Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	kernel@pengutronix.de,
	festevam@gmail.com,
	alim.akhtar@samsung.com,
	dmitry.baryshkov@oss.qualcomm.com,
	luca.ceresoli@bootlin.com,
	nicolas.frattaroli@collabora.com,
	dianders@chromium.org,
	m.szyprowski@samsung.com,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v11 00/17] Apply drm_bridge_connector and panel_bridge helper for the Analogix DP driver
Date: Thu, 19 Mar 2026 15:14:35 +0800
Message-Id: <20260319071452.1961274-1-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9d04f2b6d303a3kunm86e540ee39645d
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGR4eSlZCQkhDHUMfSU0aTk1WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
	1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=DA7fnBF2iAkyrOqc9pFahXM0CBqxghhulqoSaWPjroufxECElPEyARs/MJv9Npot89NHSt9kG3gzx4LGe66RDq6KCCrw7oL6xRH+K9RFO2W1NOK5GKZDZU50Kw5fcAOAmY3fKAfi6Z+sxACDsTK+khqB1m/KGEYaq69yFX0hY1I=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=4FLQr6j/Ajnpl8vXUNdSOalw+cZmz8SRafApCLOp0JE=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_001519_810527_FDC78299 
X-CRM114-Status: GOOD (  17.08  )
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

PATCH 1 is to add a new parameter to store the point of next bridge.
PATCH 2 is to make legacy bridge driver more universal.
PATCH 3-10 are preparations for apply drm_bridge_connector helper.
PATCH 11 is to apply the drm_bridge_connector helper.
PATCH 12-14 are to move the panel/bridge parsing to the Analogix side.
PATCH 15 is to attach the next bridge on Analogix side uniformly.
PATCH 16-17 are to apply the panel_bridge helper.

The following reviewed commits, which to make codes more concise, are
rebased to the front of this patch series:

https://lore.kernel.org/all/20251110085823.1197472-1-damon.ding@rock-chips.com/
https://lore.kernel.org/all/20251111022103.1350183-1-damon.ding@rock-chips.com/

Damon Ding (17):
  drm/bridge: analogix_dp: Add &analogix_dp_plat_data.next_bridge
  drm/bridge: Move legacy bridge driver out of imx directory for
    multi-platform use
  drm/exynos: exynos_dp: Remove &exynos_dp_device.ptn_bridge
  drm/exynos: exynos_dp: Remove unused &exynos_dp_device.connector
  drm/exynos: exynos_dp: Apply of-display-mode-bridge to parse the
    display-timings node
  drm/bridge: analogix_dp: Remove redundant
    &analogix_dp_plat_data.skip_connector
  drm/bridge: analogix_dp: Move the color format check to
    .atomic_check() for Rockchip platforms
  drm/bridge: analogix_dp: Remove unused
    &analogix_dp_plat_data.get_modes()
  drm/bridge: analogix_dp: Remove unused struct drm_connector* for
    &analogix_dp_plat_data.attach()
  drm/bridge: analogix_dp: Pass struct drm_atomic_state* for
    analogix_dp_bridge_mode_set()
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
 .../drm/bridge/analogix/analogix_dp_core.c    | 236 +++++++++---------
 .../drm/bridge/analogix/analogix_dp_core.h    |   1 -
 drivers/gpu/drm/bridge/imx/Kconfig            |  10 -
 drivers/gpu/drm/bridge/imx/Makefile           |   1 -
 .../gpu/drm/bridge/imx/imx-legacy-bridge.c    |  91 -------
 .../gpu/drm/bridge/of-display-mode-bridge.c   |  93 +++++++
 drivers/gpu/drm/exynos/Kconfig                |   1 +
 drivers/gpu/drm/exynos/exynos_dp.c            | 110 ++------
 drivers/gpu/drm/imx/ipuv3/Kconfig             |   4 +-
 drivers/gpu/drm/imx/ipuv3/imx-ldb.c           |   6 +-
 drivers/gpu/drm/imx/ipuv3/parallel-display.c  |   5 +-
 .../gpu/drm/rockchip/analogix_dp-rockchip.c   |  67 +----
 include/drm/bridge/analogix_dp.h              |   8 +-
 include/drm/bridge/imx.h                      |  17 --
 include/drm/bridge/of-display-mode-bridge.h   |  17 ++
 18 files changed, 293 insertions(+), 386 deletions(-)
 delete mode 100644 drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c
 create mode 100644 drivers/gpu/drm/bridge/of-display-mode-bridge.c
 delete mode 100644 include/drm/bridge/imx.h
 create mode 100644 include/drm/bridge/of-display-mode-bridge.h

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

Changes in v7:
- As Luca suggested, simplify the code and related comment for bridge_connector
  modifications. Additionally, move the commit related to bridge_connector to
  the top of this patch series.
- Rename legacy-bridge driver to of-display-mode-bridge driver.
- Remove unnecessary API drm_bridge_is_legacy() and apply a temporary flag
  &exynos_dp_device.has_of_bridge instead, which will be removed finally.
- Remove exynos_dp_legacy_bridge_init() and inline API
  devm_drm_of_display_mode_bridge().

Changes in v8:
- Adapt the related modifications to the newest bridge_connector driver.

Changes in v9:
- Fix the Kconfig help text for CONFIG_DRM_OF_DISPLAY_MODE_BRIDGE.
- Add Tested-by tag from Heiko.

Changes in v10:
- Fix to use dev_err_probe() in newly added API analogix_dp_finish_probe().
- Expaned commit message for [PATCH v9 9/15] and [PATCH v9 10/15].
- Split [PATCH v9 9/15] into serval smaller commits.
- Add Reviewed-by tags from Luca.

Changes in v11:
- Merge [PATCH v10 12/18] into [PATCH v10 11/18].
- Fix the bridge flag to 'flags | DRM_BRIDGE_ATTACH_NO_CONNECTOR' in
  [PATCH v10 11/18].
- Add Reviewed-by tags from Luca.

-- 
2.34.1


