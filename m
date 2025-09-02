Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FDE4CA1005
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 12:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jeSfAerqkdb9T2XPNTZgfAHrKCdkwaeBMYAWN8hsIWg=; b=k8WM4O+tO1nsTfymYH7hbiPf/U
	AmRvEJghIWQw1BNc9+ib68b6EBrOeDcAEQhDwHi6RMsFzHzVo5jfssf/yRjy6Xw0mdEPMuqfZrDau
	PI1YvCosBp5jfb8FmSESz8CFFr2eI+TScTfJQT1tP57UTAIKgnHCtQXBx6+6gUzgpgjU3XDCyugnA
	JtLIPN/BqlfBCEYA2aCi88QQmJyWM2s+0ydKjcJ6sNN8oeSBhXT6aw83U5RpXO01UyjiD3rsVhlLG
	Eej5CPwH+mwJyQhLdo1zjKBVIBnwAS/5M6aRFKkFeKwcC1m1lmKB8Kb+5/3ET9MQ4mvY+OO1/F8Yd
	hubqb5MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utQ98-0000000HH94-41N2;
	Tue, 02 Sep 2025 12:29:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utNRL-0000000GQPC-3Ctd;
	Tue, 02 Sep 2025 09:36:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 355DD6020B;
	Tue,  2 Sep 2025 09:36:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 906F1C4CEED;
	Tue,  2 Sep 2025 09:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756805794;
	bh=PvBQ83pIJH9X6bIfeKb5X2sWvdiNzva+hjf4dO1I8gA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=l0aC4Ri/EotrPZFuyMfOocn7y1DI2u+ABo2VjQfFsnB+imfxyOFeLPNLg3Zsd/xl1
	 XDolZ87IzExVDqOprgoIvUiDdEbKgB+S1zqttXyrUIUR3zF6TTP95a9i7YnUGvjHcF
	 GP4b89n0QP7vwlrqlQkdMqquGWBwmZ9yEN0rh/XzdcjbNLkH5Ev9S8qbiwl5tD2HdO
	 eAmvT2nU24VGo6XCX2ug58elj4TXdnDU8AAvpwSq/lCSIiu2Ri8vWJDM6qzkTrviqG
	 ugxBgJwZ4tu73WpWJnWOPU2MgK89Qlwe627caqs+SL4xaqT6tRPqmx4jUtuTbQEcbC
	 MtP2yuTUkg35Q==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 02 Sep 2025 11:35:25 +0200
Subject: [PATCH v2 26/37] drm/rockchip: Switch to
 drm_atomic_get_new_crtc_state()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250902-drm-no-more-existing-state-v2-26-de98fc5f6d66@kernel.org>
References: <20250902-drm-no-more-existing-state-v2-0-de98fc5f6d66@kernel.org>
In-Reply-To: <20250902-drm-no-more-existing-state-v2-0-de98fc5f6d66@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2751; i=mripard@kernel.org;
 h=from:subject:message-id; bh=PvBQ83pIJH9X6bIfeKb5X2sWvdiNzva+hjf4dO1I8gA=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBnbdoXrN3y/fsHL+4ttWbrA2ovCrX3Br8vENd9uEzu+6
 ndw+tdFHVNZGIQ5GWTFFFmeyISdXt6+uMrBfuUPmDmsTCBDGLg4BWAiPl6MDS/nr/k0XW5BSe/X
 x4/bPA77bxfacmz6+dfafZVrc7+8z7jrsiKgXeaN/K9NXi582Wb2yxjr3QwCvSJSFhnk3F9cWWz
 B2+mmwy63o+Fjbmuube6vrymVr2W66pw81Zv2+VY9k7Zn4wcA
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

The rockchip atomic_check implementation uses the deprecated
drm_atomic_get_existing_crtc_state() helper.

This hook is called as part of the global atomic_check, thus before the
states are swapped. The existing state thus points to the new state, and
we can use drm_atomic_get_new_crtc_state() instead.

Signed-off-by: Maxime Ripard <mripard@kernel.org>

---
To: Sandy Huang <hjc@rock-chips.com>
To: "Heiko Stübner" <heiko@sntech.de>
To: Andy Yan <andy.yan@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c  | 6 +++---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
index ba6b0528d1e5a493cdef85dd1ea258e70c31ccd5..5369b77ea434c794ed7d509802fa29c39d2bfa7a 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
@@ -824,12 +824,11 @@ static int vop_plane_atomic_check(struct drm_plane *plane,
 					DRM_PLANE_NO_SCALING;
 
 	if (!crtc || WARN_ON(!fb))
 		return 0;
 
-	crtc_state = drm_atomic_get_existing_crtc_state(state,
-							crtc);
+	crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
 	if (WARN_ON(!crtc_state))
 		return -EINVAL;
 
 	ret = drm_atomic_helper_check_plane_state(new_plane_state, crtc_state,
 						  min_scale, max_scale,
@@ -1090,11 +1089,12 @@ static int vop_plane_atomic_async_check(struct drm_plane *plane,
 		return -EINVAL;
 
 	if (!plane->state->fb)
 		return -EINVAL;
 
-	crtc_state = drm_atomic_get_existing_crtc_state(state, new_plane_state->crtc);
+	crtc_state = drm_atomic_get_new_crtc_state(state,
+						   new_plane_state->crtc);
 
 	/* Special case for asynchronous cursor updates. */
 	if (!crtc_state)
 		crtc_state = plane->crtc->state;
 
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index b50927a824b4020a7ffd57974070ed202cd8b838..4556cf7a33641529c673b8d7842115dc739dede2 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -1011,11 +1011,11 @@ static int vop2_plane_atomic_check(struct drm_plane *plane,
 
 	vp = to_vop2_video_port(crtc);
 	vop2 = vp->vop2;
 	vop2_data = vop2->data;
 
-	cstate = drm_atomic_get_existing_crtc_state(pstate->state, crtc);
+	cstate = drm_atomic_get_new_crtc_state(pstate->state, crtc);
 	if (WARN_ON(!cstate))
 		return -EINVAL;
 
 	ret = drm_atomic_helper_check_plane_state(pstate, cstate,
 						  min_scale, max_scale,

-- 
2.50.1


