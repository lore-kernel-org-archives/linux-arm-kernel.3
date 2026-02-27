Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2C65FEFB53
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 14:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dYrI1IV+AVW9ANNtOJwLUFp1oSOgUAnAbvJ53Y/tu6c=; b=fGTe7SqoyZi+ubB1Xp65FAxSkS
	7GvpA3VmxE1PTt0UPo76AkN866NsTmBqh3N3UKMgPX2zGop/l/i/75uaWpoywUcmaId7X0hj+Cu2G
	BQnrk90iLSveyKM4Ily1zlkkdYe0A4OcO0QBkz+pYhN8BI3oNhqj3/LDodq8aQssAEb9DF6hHKutk
	w5UZv41vLfdaYKt6AlRj+pzWaj3BJ+Ql5wr0VOLdSr4I/+gRdMXRVYxmzcvFU2L6h8lqRQBQoIaTb
	T3XxBCsprqe/GvJTApbREXJ47GxX8evfiaDSnzJsrBCPyvBuMLNV0cWwUlBsO2FYe4fzt+2Uy4ooV
	Um+c7PhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvyOq-00000008RfN-2t3k;
	Fri, 27 Feb 2026 14:01:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvyOP-00000008R60-20cw;
	Fri, 27 Feb 2026 14:00:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DA55144574;
	Fri, 27 Feb 2026 14:00:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FD67C19425;
	Fri, 27 Feb 2026 14:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772200832;
	bh=YVQvpGLZ5wA3mAnHs4fX4YhU+wAN3umweSoHZOXTpbw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ITVEy0SsJyKTpL/ORMk5qp3PfBoxVUBtV25w4T22cWYan2OH4z/q4Tgr50VXYXT9/
	 Ek3xP6PGxTvjoPIl9nI9DVtMUo6B/vKQsTb9mKZrfxvnECP/HJdHNQp0vsWHNAM/bT
	 yymBEJhLN72Xk3TmoSjkaZecwpbzmFG+gc0oQuVm0sUiIV69ugT1z88PzVvBOSlSPC
	 GG6WLUwXD/Ua5CkiPeFFJQTfRmNQO6InMRj/pEnyxY5rlCVP2Qj4LMXJPvui6G4JL9
	 krNQ/UoGp9KkUgrl+lcSk1Ky9VW97Jd7Pf1ShbUvdsPm3a0H1Q3BPC0RJb3MBh6AZX
	 j5KXn2oRDp3uQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 27 Feb 2026 14:59:57 +0100
Subject: [PATCH v2 13/14] drm/connector: Remove DRM_COLOR_FORMAT defines
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260227-drm-rework-color-formats-v2-13-8bd278e2af9d@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1320; i=mripard@kernel.org;
 h=from:subject:message-id; bh=YVQvpGLZ5wA3mAnHs4fX4YhU+wAN3umweSoHZOXTpbw=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJkLF0d4TpkVErTi0775E/s0i1qd1/cazCl9WfTSUPjk6
 ftle0w4OqayMAhzMsiKKbI8kQk7vbx9cZWD/cofMHNYmUCGMHBxCsBEVmgzNlz5rsXs79HSZzZT
 lX9FqJ5gIavqHp89EQvtdVVNPL6dO1/cL+nLuFN3ikvbpzvODEpXGeuzXm9+tm9qa2IVs4VneKC
 nd6bfZ8XWDufvXW/YyoNOMQXacf38WXZ51frsPR/47h6dIAYA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_060033_617393_5B7BD2A3 
X-CRM114-Status: UNSURE (   9.07  )
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

Now that all users of DRM_COLOR_FORMAT_* defines have been converted to
the new enum, we can get rid of those defines.

Acked-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 include/drm/drm_connector.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 227f6190438679104f5336be088a73f4529c15fa..562f6da90facdacc98307c50177792e26f2dece6 100644
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
2.53.0


