Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15CDFC83F03
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 09:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+bjluHkW3SFP0xqLuvonF0izTiZCHO6le07wELtphZs=; b=j56m9KZx0DmXKZxpvWbZPQAtBh
	/CRE7sYWGLiQX7ZQF8zmvofgI21R1FDjnvf2GsMN2p1nId1U8veYclWvpwxP/AyMMS512QBVNYjUS
	Ny3eDtff3ZNkeW9y2j37MX6/GK/L+z4CG4zMNBN3R6e5PWmJsklwyjp+cfZEZLAabpVWzwxN4/RXX
	Cu4EqbfkpqSX8FmwAlRAEjrBXnJcOs+bC83KlOp30yPmB2RwW/pIf+rD5ABUujoTvZmvFKcAj2uDO
	5KYmAncNpJ8Vw/8HuLdOBYenjYJS1TFJ1NhEJBSoeIdqhhwrTUIe7W5iyblp/axBbm+P0xNzrM00D
	N4MnRy2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZR9F-000000088xX-21du;
	Wed, 09 Jul 2025 09:31:29 +0000
Received: from mail-m32117.qiye.163.com ([220.197.32.117])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZOox-00000007kYE-38mm;
	Wed, 09 Jul 2025 07:02:25 +0000
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1b69b799a;
	Wed, 9 Jul 2025 15:02:16 +0800 (GMT+08:00)
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
Subject: [PATCH v2 00/12] Apply drm_bridge_connector helper for the Analogix DP driver
Date: Wed,  9 Jul 2025 15:01:27 +0800
Message-Id: <20250709070139.3130635-1-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGh8dTlYeS04YHR9IGE8fHhlWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpPSE
	xVSktLVUpCS0tZBg++
X-HM-Tid: 0a97edfe02a503a3kunm3a7bcd50c83882
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MyI6Lww*KjEzQi8rFRVMI0oR
	NjxPCTdVSlVKTE5JS09PTkhDTE9MVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFJQ0NNNwY+
DKIM-Signature: a=rsa-sha256;
	b=ZwK7Ywp5C+VjGI7jFlKvgIwk+1+l+e/7zKTo8xfobMIrnOsi7a2QU8ONWp4yynusrFZ+sJtHriTtrdJb38/HUkENYELRlSR7UJ2qy0bHUH2/KbsrnLVkLn+olHV8VIYm7s9U/838ajb8N3TGCodnJVASttHPQ/4vD0LCe9WOzJY=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=+bjluHkW3SFP0xqLuvonF0izTiZCHO6le07wELtphZs=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_000224_314716_FA560647 
X-CRM114-Status: UNSURE (   6.21  )
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
PATCH 3-8 are preparations for the movement of the panel/bridge parsing.
PATCH 9 is to apply a better API for the encoder initialization.
PATCH 10-11 are to apply the newly added API to find panel or bridge.
PATCH 12 is to apply the drm_bridge_connector helper.

Damon Ding (12):
  drm/bridge: analogix_dp: Formalize the struct analogix_dp_device
  drm/bridge: analogix_dp: Move &drm_bridge_funcs.mode_set to
    &drm_bridge_funcs.atomic_enable
  drm/bridge: analogix_dp: Add &analogix_dp_plat_data.bridge
  drm/exynos: exynos_dp: Remove &exynos_dp_device.ptn_bridge
  drm/exynos: exynos_dp: Remove redundant
    &analogix_dp_plat_data.skip_connector
  drm/bridge: analogix_dp: Remove redundant
    &analogix_dp_plat_data.skip_connector
  drm/bridge: analogix_dp: Add support to find panel or bridge
  drm/rockchip: analogix_dp: Apply drmm_encoder_init() instead of
    drm_simple_encoder_init()
  drm/rockchip: analogix_dp: Apply analogix_dp_find_panel_or_bridge()
  drm/exynos: exynos_dp: Apply analogix_dp_find_panel_or_bridge()
  drm/bridge: analogix_dp: Remove unused APIs for AUX bus
  drm/bridge: analogix_dp: Apply drm_bridge_connector helper

 .../drm/bridge/analogix/analogix_dp_core.c    | 370 ++++++++++--------
 .../drm/bridge/analogix/analogix_dp_core.h    |   8 +-
 drivers/gpu/drm/exynos/exynos_dp.c            |  27 +-
 .../gpu/drm/rockchip/analogix_dp-rockchip.c   |  42 +-
 include/drm/bridge/analogix_dp.h              |   6 +-
 5 files changed, 217 insertions(+), 236 deletions(-)

-- 
2.34.1


