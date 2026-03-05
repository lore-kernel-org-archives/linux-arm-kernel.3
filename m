Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72EF3EDA697
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 09:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=putXP3nw9m8tOcwNkN9YYBaFsCXIW2SkOIo0UXEJ50E=; b=0Q+I63Rc1YVNIS
	8sb2411b1MS0XM0lSGen+oH0tJ/6OXogvMCR3LuW1TBnhm/sw2/rPhalXvnDZpDDedkv75aor5pxG
	zvOKHImutZ8V6KtmcvthSnapKgOSndiXco9jYjOI5mM/KX6i9Xl/ZgDNaSXsz3KWiEkD4BE0TTvqd
	iS/W2Lkv7GAxC2CkUH4j1t8QC5NnPW+Al8YjHGEPrjx7c8ORcvW9i96Z3qWRNUQtxw9Mt2KSOa/7f
	APDbfsKdyCC62cXhq+QZVK8srrkiOA2le7qA6x85M/qYPkkFe29gJrPW8J532jlhzFuEVFT3o/pxy
	gCjVfjNuG9keESvnignw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy4dn-00000001HEa-03RO;
	Thu, 05 Mar 2026 09:05:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy4dk-00000001HDy-2deo;
	Thu, 05 Mar 2026 09:05:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CEC2A41B4E;
	Thu,  5 Mar 2026 09:05:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B124C116C6;
	Thu,  5 Mar 2026 09:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772701503;
	bh=CCLpEYvlxoqg400L58JRWG0E8HGphV4/FeLFDSKOkYA=;
	h=From:Subject:Date:To:Cc:From;
	b=bc/kGKJZ0ibUi/NN9IxRD2uOMUgbhElzEWhdq7Y4QhXet3eELFJnQjV7FVnQcH9cu
	 Yig89dkNqgJewqPYmcYNRf2tGAJvH2Mh6uK3W28q9jIAnDQA9Qijxu1F0HYL8foRQd
	 V0qtN0rCewp335lvhThdcbZLjkDeqndIh2EcCt8tUq8NLzoCT/sNAAVjYfWlc0zPae
	 aNElAxT+P+IL2t319cj6xl6pm9VqgMqldnBbyZu36RxDrMa2l2MfjBzpX17heUJbk0
	 5WI0FB/Qn3w8HA14syv87Cuzu90uvLEqzwWQng/gA8q0MUQcBTgbgfZjAnLlnEiHtJ
	 L0VGn08pirZrA==
From: Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v3 00/14] drm: Create drm_output_color_format enum
Date: Thu, 05 Mar 2026 10:04:52 +0100
Message-Id: <20260305-drm-rework-color-formats-v3-0-f3935f6db579@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43NzQ6CMAzA8VchO1vDCgH05HsYD2MrsPAx05GpI
 by7g5NejL39m/TXRXhiS16ck0UwBeutm2Jkh0ToTk0tgTWxBaZYpIg5GB6B6eG4B+0Gx9A4HtX
 soUKj48hMSyni+Z2psc+dvt5id9bPjl/7pyC37R9okJBCTbUuiyLNlVGXnnii4ei4FZsa8FMqf
 0gYpao2WFaEqjmZL2ld1zdtajFPCwEAAA==
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
 linux-sunxi@lists.linux.dev, Jani Nikula <jani.nikula@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3940; i=mripard@kernel.org;
 h=from:subject:message-id; bh=CCLpEYvlxoqg400L58JRWG0E8HGphV4/FeLFDSKOkYA=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJkr3c1+T9owYXYw97NTTTkuk/c0eNgsWBrI47H5gpzlX
 0nbLebvOqayMAhzMsiKKbI8kQk7vbx9cZWD/cofMHNYmUCGMHBxCsBEkl4yNmxgXRFs7MjPe+za
 5SOvg3iCL7rHCLoY7bKNepXpGDhJrrl9gn/gfcc5XfennZzdWLNfm7HO8kFu1j3mpedmvJQ67C9
 guOHCImWNNP1X3uZXo4MFvvPfLfl96dV9lxvOczaYLtTLF0gDAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_010504_724773_4C4914E2 
X-CRM114-Status: GOOD (  11.12  )
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
Changes in v3:
- Update more documentation
- Rebase on drm-misc-next-2026-03-05
- Link to v2: https://lore.kernel.org/r/20260227-drm-rework-color-formats-v2-0-8bd278e2af9d@kernel.org

Changes in v2:
- Add missing conversion from HDMI_COLORSPACE to DRM_OUTPUT_COLOR
- Do an enum forward declaration instead of including a header
- Fix typos in doc
- Collect tags
- Rebase on drm-misc-next-2026-02-26
- Link to v1: https://lore.kernel.org/r/20260224-drm-rework-color-formats-v1-0-bebc76604ada@kernel.org

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
 drivers/gpu/drm/display/drm_bridge_connector.c     |   4 +-
 drivers/gpu/drm/display/drm_hdmi_helper.c          |   7 +-
 drivers/gpu/drm/display/drm_hdmi_state_helper.c    |  60 ++++---
 drivers/gpu/drm/drm_bridge.c                       |   2 +-
 drivers/gpu/drm/drm_connector.c                    |  16 +-
 drivers/gpu/drm/drm_edid.c                         |  18 +-
 drivers/gpu/drm/mediatek/mtk_dp.c                  |   4 +-
 drivers/gpu/drm/mediatek/mtk_hdmi_v2.c             |   8 +-
 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c    |   4 +-
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c             |   2 +-
 drivers/gpu/drm/tests/drm_connector_test.c         |  80 ++++-----
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 182 ++++++++++-----------
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |  18 +-
 drivers/gpu/drm/vc4/vc4_hdmi.h                     |   2 +-
 include/drm/bridge/dw_hdmi_qp.h                    |   2 +-
 include/drm/display/drm_hdmi_helper.h              |   3 +-
 include/drm/drm_bridge.h                           |   5 +-
 include/drm/drm_connector.h                        |  48 ++++--
 31 files changed, 334 insertions(+), 285 deletions(-)
---
base-commit: d2e20c8951e4bb5f4a828aed39813599980353b6
change-id: 20260224-drm-rework-color-formats-82dcccc13c11

Best regards,
-- 
Maxime Ripard <mripard@kernel.org>


