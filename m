Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DC92FEFB4F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 14:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O3m+ZBfQr6KmPEhxpy7eMNYP1AMMqlCKAQGv3MS7448=; b=MBSfMj76i6FcrBHNb8Z1dwdjyj
	egAosS4bNs1MyAILVRZyqRfFW6/S3fii1D40bclJE6r+gkGPZMosIpHu5eE/pIul5Mq/hw1ZhJnY2
	CeoEzRIFgtwoVc2qMYg8t/HZ4Iy2lfnkCBUXrUdMAQyHFvvv2k8Vnb+9CA7MwvVmVAPUqJkVI/ffV
	h4WuPsiW2JfxRdBN2CcKrtfcHwM29xQNJ5AA4C1QOTZrhu4QooeiKIynwjzWXbXBLk87SdaIko9Q3
	pjTUvF9FG1eKzSF1BkfhKMk9ql5Tf7WGyICOY9Sr6qlgzjurRPIQSosCxechQ6pOj3QP7x2b3tE/7
	9knSmiAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvyOH-00000008Qsa-0dLK;
	Fri, 27 Feb 2026 14:00:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvyO7-00000008QhN-3YMP;
	Fri, 27 Feb 2026 14:00:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C1B43600AA;
	Fri, 27 Feb 2026 14:00:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D499C19423;
	Fri, 27 Feb 2026 14:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772200813;
	bh=sIOpPbGND5afLcivkJfIxu5waFc041nLNjD3trLHArs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ZaB0syc3xQ5/A6LmXj7XJiGhCoiS+mpgxvMUOcUceDVOCrZSiALXSNoLBViC7wXfj
	 WpEWrQBkbh6dBHZAAkVJ27/ZGjYCyplOBC7t+XwuzkmZvF5XkEBvMKXFx+YgjjnKHk
	 7rSgBNvLi0l8Q1Y7GkbWhl2JvRPtpmiQPzSzL61VTPqZF7x2TpoGgO4c4ngp/M6j/p
	 TOonihCjIftpmNj5KKtlZmX4mSZLa9OXPAWJaCPVrqpNGCPCy2dlC5JQwppEy72+uU
	 cWkQpyNGUsICWiqNiGfG0kUDg5c0fmJXhm8RHbBWl6Z/PhFsv8NYjXCWUL1sG7fmZ6
	 4LJ7w4zBnga3w==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 27 Feb 2026 14:59:50 +0100
Subject: [PATCH v2 06/14] drm/bridge: analogix: Convert to
 drm_output_color_format
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260227-drm-rework-color-formats-v2-6-8bd278e2af9d@kernel.org>
References: <20260227-drm-rework-color-formats-v2-0-8bd278e2af9d@kernel.org>
In-Reply-To: <20260227-drm-rework-color-formats-v2-0-8bd278e2af9d@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1747; i=mripard@kernel.org;
 h=from:subject:message-id; bh=sIOpPbGND5afLcivkJfIxu5waFc041nLNjD3trLHArs=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJkLF4deE1qudF+YZ2HK64yjMbenfI744mvYuidyvb051
 6ll7+fs75jKwiDMySArpsjyRCbs9PL2xVUO9it/wMxhZQIZwsDFKQAT4ZrAWF998MdjzYqkOOVj
 ObaHuyLDcpr++baGZicpVTrb3+4vjimcb8979bBZ65TdS7e+jZVOZmyYtIvvvovKrY/nDq62EJq
 zudSYiaPWxVL7bLmr5sn6p5/exEpyvNsZ/nXTrmne0n+vT0sCAA==
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

Now that we introduced a new drm_output_color_format enum to represent
what DRM_COLOR_FORMAT_* bits were representing, we can switch to the new
enum.

The main difference is that while DRM_COLOR_FORMAT_ was a bitmask,
drm_output_color_format is a proper enum. However, the enum was done is
such a way than DRM_COLOR_FORMAT_X = BIT(DRM_OUTPUT_COLOR_FORMAT_X) so
the transitition is easier.

The only thing we need to consider is if the original code meant to use
that value as a bitmask, in which case we do need to keep the bit shift,
or as a discriminant in which case we don't.

Acked-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index b1687a4aa04739fa53f1039376da649ddcea7f41..1dd194bf49cd8f94a2b48f1f32baa262e5e5dbf9 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1221,13 +1221,13 @@ static void analogix_dp_bridge_mode_set(struct drm_bridge *bridge,
 		break;
 	default:
 		video->color_depth = COLOR_8;
 		break;
 	}
-	if (display_info->color_formats & DRM_COLOR_FORMAT_YCBCR444)
+	if (display_info->color_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR444))
 		video->color_space = COLOR_YCBCR444;
-	else if (display_info->color_formats & DRM_COLOR_FORMAT_YCBCR422)
+	else if (display_info->color_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR422))
 		video->color_space = COLOR_YCBCR422;
 	else
 		video->color_space = COLOR_RGB;
 
 	/*

-- 
2.53.0


