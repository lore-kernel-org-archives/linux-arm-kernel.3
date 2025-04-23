Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EBEAC369D3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 17:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GGrqrZmB62conU1lP8EeLK6rqDNFcTlb2LYRrVQHvKE=; b=1t4Y/o3+Lf1ef8hpbl6r1tg745
	m/jvlQvlDDarrY/8I+2MUyd44C1ow/jhZbgRz/PZrG4xVbRmzKOUdCMoUlPdQqXrLdQb2NpBCfJvg
	N8DMa1bwUmCxGviS7IxlStAfhKy0J49ohJ2AP7BFDhUk9Ig0V7yykx35mVGKFcwpYZsW4+1wddoUa
	Z2ZlEYDF0NWpFxivS/fXQlyqXx0xpkpaSTicpzTdnZDyFhrnm9FOIJtLKnG8mf/gjEk5qUf20K4/8
	HUaej9RFb1SGUzcz8rot6CtRMp4UqNeZH/R1sthysyIE7TjANPyRJPL4Fn1Atj5QLWzyewRIwRUBi
	AjkrjIrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7e8w-0000000BOG8-2GRh;
	Wed, 23 Apr 2025 17:44:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7dD3-0000000BAwH-2jcF;
	Wed, 23 Apr 2025 16:44:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BD2B549F8D;
	Wed, 23 Apr 2025 16:44:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E43FC4CEE2;
	Wed, 23 Apr 2025 16:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745426669;
	bh=FX/Vo6MgthKdRTi+CWkqnrzMpTD/YHg19LlWfAknldU=;
	h=From:To:Cc:Subject:Date:From;
	b=TLIO7yB9lKAb3xtqbawTI9uuH7U0buTQA287nqui8dXH5EcJZs9zQXzSUbb8PzWsy
	 RNWcexpB7kcsIemNT+mZa97uo1GZoNa2eSlZ2NWj7v4fwrY36cwTuRpIT4Sjj1X3wP
	 3HReIrVK6ck+ajc+V5gaae3eGR3NaAvgowNSm+upyMYOAyBfr2bchU8L3G9JXwFXZ6
	 bK/Sq1HnGegVngE9Vt7g9vVxQpKsyBo3Uv/3hLahw2M1asmtUDdHtP35QZf1rglrQb
	 5Qr9PrQSF/fZz87dmlYQwcYyUv1Wl/6vHDHO7nAzbLQfgLQ1X7HwSmx0r6AQyj/0p+
	 LBc9aJbWay+Gw==
From: Arnd Bergmann <arnd@kernel.org>
To: Sandy Huang <hjc@rock-chips.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	Damon Ding <damon.ding@rock-chips.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Heiko Stuebner <heiko.stuebner@cherry.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/rockchip: add CONFIG_OF dependency
Date: Wed, 23 Apr 2025 18:44:16 +0200
Message-Id: <20250423164422.2793634-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_094429_721797_7DA20F2A 
X-CRM114-Status: UNSURE (   9.37  )
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

From: Arnd Bergmann <arnd@arndb.de>

DRM_DISPLAY_DP_AUX_BUS cannot be selected when CONFIG_OF is disabled:

WARNING: unmet direct dependencies detected for DRM_DISPLAY_DP_AUX_BUS
  Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && OF [=n]
  Selected by [y]:
  - DRM_ROCKCHIP [=y] && HAS_IOMEM [=y] && DRM [=y] && ROCKCHIP_IOMMU [=y] && ROCKCHIP_ANALOGIX_DP [=y]

Rockchip platforms all depend on OF anyway, so add the dependency here
for compile testing.

Fixes: d7b4936b2bc0 ("drm/rockchip: analogix_dp: Add support to get panel from the DP AUX bus")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/rockchip/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/rockchip/Kconfig b/drivers/gpu/drm/rockchip/Kconfig
index caa251f91dd8..6b9f43c05148 100644
--- a/drivers/gpu/drm/rockchip/Kconfig
+++ b/drivers/gpu/drm/rockchip/Kconfig
@@ -2,6 +2,7 @@
 config DRM_ROCKCHIP
 	tristate "DRM Support for Rockchip"
 	depends on DRM && ROCKCHIP_IOMMU
+	depends on OF
 	select DRM_CLIENT_SELECTION
 	select DRM_GEM_DMA_HELPER
 	select DRM_KMS_HELPER
-- 
2.39.5


