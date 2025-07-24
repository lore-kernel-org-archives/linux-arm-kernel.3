Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFF8FC87FC5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 08:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/a3ZH/e6MX3cQWLnQo0XUfQLEK6LM5ZgF2VvUtU43P0=; b=ouibXLR8n4i/qolxZ3QZBmRuES
	7e74SZeqhs/HJ68qwi/e5iRhLTsQxgKnGQ3ebsgPY1Am/xoF5eiBLGZCoAATjJcMtLPNuHGLb0/7a
	LEVpW0x1P3p9lR56SpdTVGAhf7hF6lm8diNHnXmr+lKlMrMcD35nmBtzJSS7x84RFutNAMlhykz3j
	Myn6TZ1z1/lQLiC0XivqNSVPcmrgRkBzc19lj2Y7/VorKXspb73uQfF5PrmrCP2XJ67xC7jEVoFBo
	piqVDw2btJDpqS0PmBZct8SKyUdvMlAADpjP/lKyfOJzhB7jDJEQxI6mk/w11yX5H83tCj6r+95tZ
	Ja2Bpi3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uerFg-00000006qsE-0LM0;
	Thu, 24 Jul 2025 08:24:32 +0000
Received: from mail-m3282.qiye.163.com ([220.197.32.82])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueqvF-00000006mib-0jh1;
	Thu, 24 Jul 2025 08:03:27 +0000
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1d1c34377;
	Thu, 24 Jul 2025 16:03:14 +0800 (GMT+08:00)
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
	jingoohan1@gmail.com,
	inki.dae@samsung.com,
	sw0312.kim@samsung.com,
	kyungmin.park@samsung.com,
	krzk@kernel.org,
	alim.akhtar@samsung.com,
	hjc@rock-chips.com,
	heiko@sntech.de,
	andy.yan@rock-chips.com,
	dmitry.baryshkov@oss.qualcomm.com,
	l.stach@pengutronix.de,
	dianders@chromium.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v3 00/14] Apply drm_bridge_connector and panel_bridge helper for the Analogix DP driver
Date: Thu, 24 Jul 2025 16:02:50 +0800
Message-Id: <20250724080304.3572457-1-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a983b75378603a3kunmbbba7af29cef
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGU1KTVZKH0JKSkhPQkkfSE9WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=aE5wZPbtuRrtIKfTtfH1/ikI4T3SwqKfYIQFQF0cJgKNHKPMw5hIHuZnyzme+bRPAfqFFVFvp6NN8I7ysZI2sy6CpvDBGLi2k3yp8xSSpOhh6MEiXP7iKv6qUoIs5OJ9Xj//5OYtjK95hW+TofDYLNMxGpYuH9pcHBjhQi0YroE=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=/a3ZH/e6MX3cQWLnQo0XUfQLEK6LM5ZgF2VvUtU43P0=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_010325_653021_F62B6858 
X-CRM114-Status: UNSURE (   6.10  )
X-CRM114-Notice: Please train this message.
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
PATCH 3 is to apply a better API for the encoder initialization.
PATCH 4-7 are preparations for apply drm_bridge_connector helper.
PATCH 8 is to apply the drm_bridge_connector helper.
PATCH 9-11 are to move the panel/bridge parsing to the Analogix side.
PATCH 12-13 are preparations for apply panel_bridge helper.
PATCH 14 is to apply the panel_bridge helper.

Damon Ding (14):
  drm/bridge: analogix_dp: Formalize the struct analogix_dp_device
  drm/bridge: analogix_dp: Move &drm_bridge_funcs.mode_set to
    &drm_bridge_funcs.atomic_enable
  drm/rockchip: analogix_dp: Apply drmm_encoder_init() instead of
    drm_simple_encoder_init()
  drm/bridge: analogix_dp: Add &analogix_dp_plat_data.bridge
  drm/exynos: exynos_dp: Remove &exynos_dp_device.ptn_bridge
  drm/bridge: exynos_dp: Remove unused &exynos_dp_device.connector
  drm/bridge: analogix_dp: Remove redundant
    &analogix_dp_plat_data.skip_connector
  drm/bridge: analogix_dp: Apply drm_bridge_connector helper
  drm/bridge: analogix_dp: Add support to find panel or bridge
  drm/rockchip: analogix_dp: Apply analogix_dp_find_panel_or_bridge()
  drm/exynos: exynos_dp: Apply analogix_dp_find_panel_or_bridge()
  drm/bridge: analogix_dp: Remove panel disabling and enabling in
    analogix_dp_set_bridge()
  drm/bridge: analogix_dp: Remove bridge disabing and panel unpreparing
    in analogix_dp_unbind()
  drm/bridge: analogix_dp: Apply panel_bridge helper

 .../drm/bridge/analogix/analogix_dp_core.c    | 383 ++++++++++--------
 .../drm/bridge/analogix/analogix_dp_core.h    |   5 +-
 drivers/gpu/drm/exynos/exynos_dp.c            |  48 +--
 .../gpu/drm/rockchip/analogix_dp-rockchip.c   |  53 +--
 include/drm/bridge/analogix_dp.h              |   7 +-
 5 files changed, 248 insertions(+), 248 deletions(-)

-- 
2.34.1


