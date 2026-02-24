Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED682E9B249
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 10:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GannWozerX1HHAUfq/eJ0P3BNuaUNGiGmo5QnH0LUvk=; b=NvpT+Ly63Vw2g6
	bXZUH0hSWMc8jQjnZKITzt+w90joD99Hafcam5oIHPiBMgZpKXhq/uiIGEeSgQg2RHOvO0LXZU/Vq
	jwX30RbBAhPIluyh2+v8+l1jgnyZwA4A2U/gbMOvKgD4O7JPlYqbxI5Tt6xZiaa39vWDbYFUBF7F1
	bG9PT16F6zgnWmCK8xRowdvq/bsrtLHVLt2m6DC5LY7M8pV14HlXSs/1vnREI1R+/cwn5dmQa/+yh
	8gw5+t48Y7aY3BO4cb7eipIsIU0zapat7GF8o/XISGmO8Sok4ILjWW1bfeDa+kT2kWAMBxt7eNO4F
	JIIgb/gx06SWaAyg3aLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuq7y-00000001tf2-0T4p;
	Tue, 24 Feb 2026 10:58:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuq7x-00000001tej-25mP;
	Tue, 24 Feb 2026 10:58:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4EF376132D;
	Tue, 24 Feb 2026 10:58:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BDBEC116D0;
	Tue, 24 Feb 2026 10:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771930732;
	bh=4lUO/V6PMTwBVuKtBzHhWs/9Z6o8abbgH7ftoV2jBig=;
	h=From:Subject:Date:To:Cc:From;
	b=Mq5EemhtxP4fdcnHfwI6OPiBN1gV0ecp0xd5f2KaC09It8FK32pITZ1xHILSp51C6
	 YSaWpuQYY6HhCHr1MPzfOb6w9UXIbx4/Z35HAq/g8gK/kPb1TfUj+eIw5kfWpIksn8
	 T+ataYqh5wLl+NMyxJ45rRvqFJe0KXBGpoGPDbatkTon3oE5/9faLHnIG2/j9VaGct
	 /GIasKVO33Y2yrnXXY1DM6fxhSl/7lLU9IkFD+vdGqLWsAP664+xa4qsoCAcEgih6h
	 SATWacBLav7lvkNRDE99gvw4oXTI1TRFqiO6PKk3OW1BzMuQyKvHX8vRQWb47dGt36
	 Krdz57DzbwK1g==
From: Maxime Ripard <mripard@kernel.org>
Subject: [PATCH 00/14] drm: Create drm_output_color_format enum
Date: Tue, 24 Feb 2026 11:58:39 +0100
Message-Id: <20260224-drm-rework-color-formats-v1-0-bebc76604ada@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MQQqDMBAAvxL23IVkW0T6ldKDJKsummzZFBXEv
 zd0bnOYOaGyCVd4uhOMN6mipUm4OYjzUCZGSc2BPHWe6IHJMhrvagtGXdVwVMvDt2JPKTbCPYY
 ALf8Yj3L816/3df0AC+cZM2oAAAA=
X-Change-ID: 20260224-drm-rework-color-formats-82dcccc13c11
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Andy Yan <andy.yan@rock-chips.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Liu Ying <victor.liu@nxp.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 amd-gfx@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-sunxi@lists.linux.dev
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3233; i=mripard@kernel.org;
 h=from:subject:message-id; bh=4lUO/V6PMTwBVuKtBzHhWs/9Z6o8abbgH7ftoV2jBig=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJlzW5JkRFb27W20sL9ZF2ngdULgz41fK/Yvd8qrkaw/8
 eaZh29Ax1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZhIqh9jQ2/6Z9UFAqost5nu
 N/4wnZ62KYzp5+s9bfm8Jmu94jlEP8TtY5P/ZWVVkj5r4i2j7G3ejA0vX/zKdV75/mUMT+LBOP0
 tHm9Lb70MZuetVWm3P+7OwqJtfHEhY0/xhXWiMW9bZGyiVgMA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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

Hi,

This series creates an enum to represent the output color format as an
enum instead of a bitmask, and consolidate the HDMI helpers to use the
new enum.

This should make Nicolas' work easier.

It has been build tested, and passes kunit tests.

Let me know what you think,
Maxime

---
Maxime Ripard (14):
      drm/connector: Introduce drm_output_color_format enum
      drm/edid: Convert to drm_output_color_format enum
      drm/display: hdmi: Convert to drm_output_color_format
      drm/amdgpu: display: Convert to drm_output_color_format
      drm/bridge: adv7511: Convert to drm_output_color_format
      drm/bridge: analogix: Convert to drm_output_color_format
      drm/bridge: cadence: Convert to drm_output_color_format
      drm/bridge: synopsys: dw-dp: Convert to drm_output_color_format
      drm/bridge: synopsys: dw-hdmi: Convert to drm_output_color_format
      drm/arm: komeda: Convert to drm_output_color_format
      drm/mediatek: dp: Convert to drm_output_color_format
      drm/rockchip: analogix: Convert to drm_output_color_format
      drm/connector: Remove DRM_COLOR_FORMAT defines
      drm/display: hdmi: Use drm_output_color_format instead of hdmi_colorspace

 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   4 +-
 .../gpu/drm/arm/display/komeda/d71/d71_component.c |  14 +-
 drivers/gpu/drm/arm/display/komeda/komeda_crtc.c   |   2 +-
 .../gpu/drm/arm/display/komeda/komeda_pipeline.h   |   5 +-
 .../drm/arm/display/komeda/komeda_pipeline_state.c |   2 +-
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c       |   2 +-
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c |   4 +-
 .../gpu/drm/bridge/cadence/cdns-mhdp8546-core.c    |  24 +--
 .../gpu/drm/bridge/cadence/cdns-mhdp8546-core.h    |   2 +-
 drivers/gpu/drm/bridge/inno-hdmi.c                 |   6 +-
 drivers/gpu/drm/bridge/ite-it6263.c                |   2 +-
 drivers/gpu/drm/bridge/synopsys/dw-dp.c            |  71 ++++----
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c          |  16 +-
 drivers/gpu/drm/display/drm_hdmi_helper.c          |   7 +-
 drivers/gpu/drm/display/drm_hdmi_state_helper.c    |  60 ++++---
 drivers/gpu/drm/drm_bridge.c                       |   2 +-
 drivers/gpu/drm/drm_connector.c                    |  14 +-
 drivers/gpu/drm/drm_edid.c                         |  18 +-
 drivers/gpu/drm/mediatek/mtk_dp.c                  |   4 +-
 drivers/gpu/drm/mediatek/mtk_hdmi_v2.c             |   8 +-
 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c    |   4 +-
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c             |   2 +-
 drivers/gpu/drm/tests/drm_connector_test.c         |  80 ++++-----
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 182 ++++++++++-----------
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |  18 +-
 drivers/gpu/drm/vc4/vc4_hdmi.h                     |   2 +-
 include/drm/display/drm_hdmi_helper.h              |   3 +-
 include/drm/drm_connector.h                        |  46 ++++--
 28 files changed, 326 insertions(+), 278 deletions(-)
---
base-commit: 3a2ffb469faa8240fe87e7d5f3533d14fdcc69f3
change-id: 20260224-drm-rework-color-formats-82dcccc13c11

Best regards,
-- 
Maxime Ripard <mripard@kernel.org>


