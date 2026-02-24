Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9AD3E9B24E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 10:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=05GwOPE+TwagajvVDZl61IoGEi686yCEFx8rDqoaFG8=; b=4LBWDmxDaTtO4K19kt7jnTK6/7
	ZM6WIaDKC5eed1VkYKAkJpdk9j0EdBYdBu3vj6DOjuUQx+2yuJ+Sq/BoloxpIQ+/FeZm0d1+6y1R+
	nTIDXMytk8Bfgw2pRQYClqRA1hf66bO+NL5/f8SsAUJfUD3OxPLybSB9/oCzGo4AXUZV0tYEYEhb1
	xik16rU/jUt8FnKGO2S7Xhw0P0tZT8s35HQw7AGSokXVTgNsKSmMgSNuMPr2z65yrMD/jP8+Hv3cs
	Zt5/LOKRl9D86BwPR1GPVcE5G6Lss/76zDnYppL5dkH3VenwuyHc0rsJely3Zbq65xzClhGgQxjnL
	pW+Hn0rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuq8i-00000001uhh-1LG8;
	Tue, 24 Feb 2026 10:59:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuq8a-00000001uVB-2Zzq;
	Tue, 24 Feb 2026 10:59:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DBBFC61335;
	Tue, 24 Feb 2026 10:59:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06592C19422;
	Tue, 24 Feb 2026 10:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771930771;
	bh=la4FpxSv0KFWeFdgmjOWIalqSK0c99WldBgX55snvvc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Q4D3LJBAvHafk96/PNZtz/MiwnaNUjfo6qw8UoBnu/IK7+gXC/m3JZ/bZaKHgb3kq
	 VN0c03OzB+nrVEfKWxhsEnrX8Q+Uq8/8TGLvCoa3EMNVhFVROhAx5gNnIxaEAo5y01
	 1i77TF36vM4ibvc8RZ26403EZcwOSl20avxvS97h8RHoair2I42oJfzU7AJtOuARtJ
	 qEOEilJfKxLtgGu54sTvEPN+XtoC4nSppia+/IXF5dh97OqqjpP+RTKs9O73HKuGIV
	 FY2ZSFhITGm3j4k3Lcwm9C3QvihOt191GMfPV+IxXRrVPchqzelF8izMQZ/vP8F/17
	 DQKtdFfU/8tUA==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 24 Feb 2026 11:58:52 +0100
Subject: [PATCH 13/14] drm/connector: Remove DRM_COLOR_FORMAT defines
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260224-drm-rework-color-formats-v1-13-bebc76604ada@kernel.org>
References: <20260224-drm-rework-color-formats-v1-0-bebc76604ada@kernel.org>
In-Reply-To: <20260224-drm-rework-color-formats-v1-0-bebc76604ada@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1273; i=mripard@kernel.org;
 h=from:subject:message-id; bh=la4FpxSv0KFWeFdgmjOWIalqSK0c99WldBgX55snvvc=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJlzWzJuzo9bf+1HZ8Pbd877rk7eNvv1w5yJ148Z8M+9a
 PNk2QwZo46pLAzCnAyyYoosT2TCTi9vX1zlYL/yB8wcViaQIQxcnAIwkUtnGRvO39nIELNy/cLI
 564MEgwpz+Kdj6Slsb1N3mlepyFVP32PR+nh7YfvaNl1xlz0W/bn6TLGek/vpTa/PomINfamvOT
 ulmq8Y3CAd6ZUVc3teUtcmcXvBP/aGf/p97+asPMC2q7azsx+AA==
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

Now that all users of DRM_COLOR_FORMAT_* defines have been converted to
the new enum, we can get rid of those defines.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 include/drm/drm_connector.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index c67539708f636ae3905bb8424c63799bd1811f28..e97c8a209ef5c96ecf4bcb5f0b1b5f1bc0f35b3c 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -722,15 +722,10 @@ struct drm_display_info {
 	/**
 	 * @subpixel_order: Subpixel order of LCD panels.
 	 */
 	enum subpixel_order subpixel_order;
 
-#define DRM_COLOR_FORMAT_RGB444		(1 << DRM_OUTPUT_COLOR_FORMAT_RGB444)
-#define DRM_COLOR_FORMAT_YCBCR444	(1 << DRM_OUTPUT_COLOR_FORMAT_YCBCR444)
-#define DRM_COLOR_FORMAT_YCBCR422	(1 << DRM_OUTPUT_COLOR_FORMAT_YCBCR422)
-#define DRM_COLOR_FORMAT_YCBCR420	(1 << DRM_OUTPUT_COLOR_FORMAT_YCBCR420)
-
 	/**
 	 * @panel_orientation: Read only connector property for built-in panels,
 	 * indicating the orientation of the panel vs the device's casing.
 	 * drm_connector_init() sets this to DRM_MODE_PANEL_ORIENTATION_UNKNOWN.
 	 * When not UNKNOWN this gets used by the drm_fb_helpers to rotate the

-- 
2.52.0


