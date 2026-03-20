Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50B1610987A9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 16:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1ncWjtePz5IChn9vF5qzSnz7CbIj+dHoGVghozVsKMw=; b=gx0iW6MWYxtVOAnjWnuo4EsCTa
	vSzvIkJHT/m8SrXrr32Oiq/Ty62/jw+bd6QlmMrtt8Ret+M+0H+c4x6FO+ZwRr542JCHi+m7B+0sI
	u5dQ2SNndGN9K8o4rj6mwsrg3a+VzWZd9R26hOqt7oXPk+spK3JnCO4o+StWhkxLcOtJe7GAMwskT
	tvfJlBVYrB8N+SitpLW978nmMpNvP5rTohFo089QZi4V0Ng3UFN794Nt7SeWk2SbazrxStQcQVJTl
	x3wFCay+GguFwqvZqur1ZVhA29Osdip+l1JadXo8TcCv5vO30bLcj0Bz93kwSX04jrRs4ODkrL5ry
	ZAZ2rjKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3chW-0000000D7qm-0e7V;
	Fri, 20 Mar 2026 16:27:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3chN-0000000D7kd-29Rk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 16:27:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D2C046014B;
	Fri, 20 Mar 2026 16:27:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06D8DC4CEF7;
	Fri, 20 Mar 2026 16:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774024064;
	bh=wmAxCcdTkxlbN84+RtEwdgkpAvIMXguvvyonVXL/Njc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jR0Mh/puC65e/v0ntb6R6WiiwEWxRTUgn1ArGBfT0h4ySeEdYZf3+5e3/J+8QB0GP
	 XmEpgypJtNUiVu5DS8cobgjVr+Z1bgW9QWuV6zF5BUK544gs/p3l9vqyMe6y1EB5JJ
	 F2i4D2n1P33Qypgg/IKHmXAXkCpiz4U1M+wYIhK0zDoDubMixrZODL74rBRjNaNBKW
	 T40/hkUbNY4nWO2GaOpOjglXoiYstPq18b/WTXA/ysZI5hg7rrEr8sKcw/PBeh5xuH
	 aSW+4BmrNWo1v/LSbrZSxY+FWCMSD7Jgq2iMmEvsJ2nBGyLjsYRVlmi1KI1gEVFzpg
	 SHsr/GMuVEiMw==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 20 Mar 2026 17:27:13 +0100
Subject: [PATCH v2 06/20] drm/atomic-state-helper: Fix
 __drm_atomic_helper_plane_reset() doc typo
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-drm-mode-config-init-v2-6-c63f1134e76c@kernel.org>
References: <20260320-drm-mode-config-init-v2-0-c63f1134e76c@kernel.org>
In-Reply-To: <20260320-drm-mode-config-init-v2-0-c63f1134e76c@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Simon Ser <contact@emersion.fr>, Harry Wentland <harry.wentland@amd.com>, 
 Melissa Wen <mwen@igalia.com>, Sebastian Wick <sebastian.wick@redhat.com>, 
 Alex Hung <alex.hung@amd.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Chen-Yu Tsai <wens@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Daniel Stone <daniels@collabora.com>, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 Maxime Ripard <mripard@kernel.org>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1367; i=mripard@kernel.org;
 h=from:subject:message-id; bh=wmAxCcdTkxlbN84+RtEwdgkpAvIMXguvvyonVXL/Njc=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJl7S9M8LjcfcYg2ZBQtCeP6+YvzafG2VTXMer6yS+Ju+
 Aafe3S1YyoLgzAng6yYIssTmbDTy9sXVznYr/wBM4eVCWQIAxenAExEU4SxvjrgLcPO2wKXQ77H
 7nze/VfN1WaVXKa96LtLmlFl/B2Bs1z3iU617brt0KydUHFT3UyXsYb7d+YfzujYE1rFJm9F387
 TuVvSupMpblGccsMiz0WT09VUV7p3WjZvXvs8YxvzQ++7bgA=
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

A typo has slipped through in the __drm_atomic_helper_plane_reset()
documentation, probably due to copy and paste. It will not assign
drm_crtc state pointer, but rather the drm_plane's.

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic_state_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index 875149494b00e1eb7481e87d7d7038103b72b7e3..e1f3d05ad3470154a6be01423979a4deb8617441 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -303,11 +303,11 @@ EXPORT_SYMBOL(__drm_atomic_helper_plane_state_reset);
  * __drm_atomic_helper_plane_reset - reset state on plane
  * @plane: drm plane
  * @plane_state: plane state to assign
  *
  * Initializes the newly allocated @plane_state and assigns it to
- * the &drm_crtc->state pointer of @plane, usually required when
+ * the &drm_plane->state pointer of @plane, usually required when
  * initializing the drivers or when called from the &drm_plane_funcs.reset
  * hook.
  *
  * This is useful for drivers that subclass the plane state.
  */

-- 
2.53.0


