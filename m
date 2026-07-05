Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38A25C44500
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jul 2026 16:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=inqQYC9Nnuk7LQATOBE0fYD9nNEE+MN3hpNMd5FAQ58=; b=Eo9gRU+XWtZxuhXFUcZZ5WZgCP
	NrjPP8YKnQlvzMCM4uLuaeDDJt6vXzviAgqcBVgOapiYJUbNvk6nqnWYgQ3IoeV6HPD41Vr4tf9H+
	mTd9mQlbM9arolaQ1QZ9MIpkomdiH5yIwgQJtJMHWn2Mljh3npSPaMCo8YpJuD6Sqg7coEBz9O1Oe
	1gsHOaGgLaUWvHiEOooiZ6ZVeUCqMoFXI5sS/WPU6m8WgPdrWqNG9KPysqgl/TOgDOzNRrVy6o1oj
	AuqYxIABykz/amM0WVus6jtVHfZvwu5F6E6lyOHvT4WGi5zMKY9QK22E7fLQukqEVsEp2y4iUFotY
	QdpZbWvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgPp4-00000009U0q-15Fw;
	Sun, 05 Jul 2026 16:36:02 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgPp2-00000009U06-0NpC
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jul 2026 16:36:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=inqQYC9Nnuk7LQ
	ATOBE0fYD9nNEE+MN3hpNMd5FAQ58=; b=CLKxkZdirAzgQDWRv6H5kqkMdzhwNn
	KH8nqC0WhBGR8Ol64Z29kLIY+itzhQ2wWubMmLv2U9OaKQRyp3J/u1sbqeyhxrDl
	aBgupDQ+i9gPlq3+M9Vs5JT3CZhIbYOtQHetdLHNRYHJxW6QwA51787pCxMAgC76
	dk6fbZeQAkofZ3k4nZD4a6hFl0iySi1wUWUheKP7xSQOefaP+wh7b1VTdJUy4ZNZ
	AsbBVnj7/5om3yq8QQ3ZGldVXlV+dH/h0rBnDfaYx4XBCxB4nh44HwvSyTwgeGxQ
	D/+5kVeyer65C6NYCZs2QE4qQDGGDQRtKNrccXny0bYcl5tC5fDsikfw==
Received: (qmail 2287250 invoked from network); 5 Jul 2026 18:35:57 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Jul 2026 18:35:57 +0200
X-UD-Smtp-Session: l3s3148p1@w1yXwN9Vp0ZtKjFj
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-kernel@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	David Airlie <airlied@gmail.com>,
	dri-devel@lists.freedesktop.org,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	imx@lists.linux.dev,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Liu Ying <victor.liu@nxp.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Robert Foss <rfoss@kernel.org>,
	Sandy Huang <hjc@rock-chips.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/3] drm: remove unneeded 'fast_io' parameter in regmap_config
Date: Sun,  5 Jul 2026 18:35:35 +0200
Message-ID: <20260705163536.1850-5-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_093600_427254_C632BDD4 
X-CRM114-Status: UNSURE (   7.14  )
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

When using MMIO with regmap, fast_io is implied. No need to set it
again. No dependencies, can be applied directly to the subsystem tree.
Buildbot is happy, too.


Wolfram Sang (3):
  drm/bridge: remove unneeded 'fast_io' parameter in regmap_config
  drm/imx: remove unneeded 'fast_io' parameter in regmap_config
  drm/rockchip: remove unneeded 'fast_io' parameter in regmap_config

 drivers/gpu/drm/bridge/synopsys/dw-dp.c          | 1 -
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c   | 1 -
 drivers/gpu/drm/imx/dc/dc-cf.c                   | 1 -
 drivers/gpu/drm/imx/dc/dc-de.c                   | 1 -
 drivers/gpu/drm/imx/dc/dc-ed.c                   | 2 --
 drivers/gpu/drm/imx/dc/dc-fg.c                   | 1 -
 drivers/gpu/drm/imx/dc/dc-fl.c                   | 1 -
 drivers/gpu/drm/imx/dc/dc-fw.c                   | 2 --
 drivers/gpu/drm/imx/dc/dc-ic.c                   | 1 -
 drivers/gpu/drm/imx/dc/dc-lb.c                   | 2 --
 drivers/gpu/drm/imx/dc/dc-tc.c                   | 1 -
 drivers/gpu/drm/imx/ipuv3/imx-tve.c              | 2 --
 drivers/gpu/drm/rockchip/dw-mipi-dsi2-rockchip.c | 1 -
 13 files changed, 17 deletions(-)

-- 
2.51.0


