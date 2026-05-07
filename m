Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 488EBCD3427
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 11:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=L8mmMYhd2Qz8HUb7Zez/BcP9TjD96jd9KOG0FVT+BhQ=; b=NL8diYRKY8dFsbs+IDM2oEwCMR
	+762/5W+77kdw0i8XkhItT36AJzkMjsx/u5jRmwgkWfVLsGkD5VWGPqOqY59+sImxmIg87XZsze7n
	V/Wu4ULTWWpd5q4l2IWpdtKF6AiuJDilc4rPYBgOU4V4X+y0/bHMhZfeTjOlA3PoEEM228kQepe2y
	+lBvoRDbU4UHg9lldJFqacLlLPU7c5HDcLhKOpGwPZ2BKc9KlbSbEExLGQwakS+IpR8F6kMEWKOIB
	Mo8kQbnYTEpUC6P3pLe0ZGVB0s61rcoAA1K0Ay7Suj1Ju/6MRvQH5dr56+qDbPQb7Df7FWhWw8Thn
	XT0EB4lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKx0W-00000003dX8-41am;
	Thu, 07 May 2026 11:35:08 +0000
Received: from mail-m49204.qiye.163.com ([45.254.49.204])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKx0T-00000003dUq-3AgJ;
	Thu, 07 May 2026 11:35:07 +0000
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3d7b63a30;
	Thu, 7 May 2026 19:29:53 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: hjc@rock-chips.com,
	heiko@sntech.de,
	andy.yan@rock-chips.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org
Cc: Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	nicolas.frattaroli@collabora.com,
	cristian.ciocaltea@collabora.com,
	sebastian.reichel@collabora.com,
	dmitry.baryshkov@oss.qualcomm.com,
	luca.ceresoli@bootlin.com,
	dianders@chromium.org,
	m.szyprowski@samsung.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v3 00/10] Add eDP support for RK3576
Date: Thu,  7 May 2026 19:29:38 +0800
Message-Id: <20260507112948.1115003-1-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9e02338d3103a3kunm4d1cbcd72689
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCTkpLVhlLHU9CGR5KSkNNT1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=ZIuzAIlAolMqMGr27yBPoCxQb/2V2KxVu0WeVG1JwWJlIYWvSU7oK3J14ahCuGDgrhibSDAVIeoGEeNVifzB4Wgz73DbAejvUVz55dlInK1yii1vZC5q7xKqxeqSkF5n8ceoAt7w7O5Eu6YP73FSfB2ir7yzdTzbTIJc6Byph7c=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=L8mmMYhd2Qz8HUb7Zez/BcP9TjD96jd9KOG0FVT+BhQ=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_043505_973489_40D2C177 
X-CRM114-Status: UNSURE (   9.29  )
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

Patch 1-5 are to add missing clock "hclk" for RK3588 eDP nodes.
Patch 6-7 are to add the RK3576 eDP node.
Patch 8~10 are to support the RK3576 Analogix DP controller.

This series is followed by the [0] series.

[0] https://lore.kernel.org/all/20260409065301.446670-1-damon.ding@rock-chips.com/

Damon Ding (10):
  dt-bindings: display: rockchip: analogix-dp: Expand clock-names "hclk"
    for the third clock
  dt-bindings: display: rockchip: analogix-dp: Add descriptions for
    clocks
  arm64: dts: rockchip: Add missing clock "hclk" for RK3588 eDP0 nodes.
  arm64: dts: rockchip: Add missing clock "hclk" for RK3588 eDP1 nodes.
  drm/rockchip: analogix_dp: Enable clock "hclk" for RK3588
  dt-bindings: display: rockchip: analogix-dp: Add support for RK3576
  arm64: dts: rockchip: Add eDP node for RK3576
  drm/bridge: analogix_dp: Rename and simplify is_rockchip()
  drm/bridge: analogix_dp: Add support for RK3576
  drm/rockchip: analogix_dp: Add support for RK3576

 .../rockchip/rockchip,analogix-dp.yaml        | 11 ++++++--
 arch/arm64/boot/dts/rockchip/rk3576.dtsi      | 28 +++++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi |  4 +--
 .../arm64/boot/dts/rockchip/rk3588-extra.dtsi |  4 +--
 .../drm/bridge/analogix/analogix_dp_core.c    |  3 +-
 .../gpu/drm/bridge/analogix/analogix_dp_reg.c | 18 ++++++------
 .../gpu/drm/rockchip/analogix_dp-rockchip.c   | 15 ++++++++++
 include/drm/bridge/analogix_dp.h              | 13 +++++++--
 8 files changed, 78 insertions(+), 18 deletions(-)

---

Changes in v2:
- Split out separate patches to add the "hclk" clock reference.
- Split out separate patches to enable the "hclk" clock.
- Add Reviewed-by tag.

Changes in v3:
- Add a patch to expand descriptions for clocks of the eDP node.
- Add Reviewed-by tag.

-- 
2.34.1


