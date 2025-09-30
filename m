Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B607CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 11:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hco+lhcMVuAZCLIi1YcjERiB4+Ko5JZLE2mI9aOnth0=; b=I5TFhJmN6Y4HBJmk1R1yKSQSiY
	8+V2yXa6LYtBsFx4AR67+MWor+xKXSl55TLmMTKynm5NY2z/sLpQP2IwpNh6POgQNMmkSpsiAVsn8
	F+AINQjiNYNKaHJsjNwkh5YqK5V8/sQ3QNIsYSakvqKfve32dODz1Q6g1m1HrZixJdT3FePpYEwhG
	q5IBqPpUbT0KvwvPsXmIOvDtDASVtxIQGyH4jt+XVFNCQdDopaF5UokkNKcFbwkpFAo7riUTlTO7a
	yQeb0otctG6QmH61ULqKtbHWiStx5gDZlBhtVE86JsWn23j0/lVfGHs1YK5o/w7g/50aJ8f79bo7E
	EsQZhTYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Y6p-000000055H6-07pE;
	Tue, 30 Sep 2025 11:01:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Y6l-000000055CW-2ZCT;
	Tue, 30 Sep 2025 11:01:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 46294409F5;
	Tue, 30 Sep 2025 11:01:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE35AC113D0;
	Tue, 30 Sep 2025 11:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759230083;
	bh=nzca54txRU4/xK0WHqk5gKnewNmgSPUG52f0NiOEoPU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VZvspM1z7uuDgdiW3/k65d1qLBfydAFaSmMXNvIs5yIPIR5KLpU1rWuSfMlD7BdRJ
	 pdN84ef71KcXVV9EQZ8F+alcadMnbN5FtR8i7z0bV2Wu62FCCbKwgSFJD4uThzxh3L
	 CwMesEdruC3iHQoz53nKfIz5mrXwdNJSfxdt5SjjGo18HGQYYb9vYowZkVOPCE2ASp
	 UaNQ83kJ6wPm83BEYp2vN3q5ZKK+1ZQ2xzbK4nv7tMx/Rg6GqxUiXk4gYOuFbmyNg2
	 gktpLyv2pJU0Ruw1r6H/YA6RfJBRYDXOUIgDSGs8fr0Tqvy9bjEvpMOxohxqgyS5AQ
	 FR6iIVshcUYYw==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 30 Sep 2025 12:59:42 +0200
Subject: [PATCH v5 27/39] drm/rockchip: Switch to
 drm_atomic_get_new_crtc_state()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250930-drm-no-more-existing-state-v5-27-eeb9e1287907@kernel.org>
References: <20250930-drm-no-more-existing-state-v5-0-eeb9e1287907@kernel.org>
In-Reply-To: <20250930-drm-no-more-existing-state-v5-0-eeb9e1287907@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2811; i=mripard@kernel.org;
 h=from:subject:message-id; bh=nzca54txRU4/xK0WHqk5gKnewNmgSPUG52f0NiOEoPU=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBm3d2hHzNmTHN/5//CZ2TeLG1SkZAMPcfWumHkiJOQT+
 7Oe19vDOqayMAhzMsiKKbI8kQk7vbx9cZWD/cofMHNYmUCGMHBxCsBELm5jrNOXeRqv8WqBubpQ
 1VepGxWl5zlCJub/Cu3czFVb3mOzZ0fQytwZtk/Tpkc6xn4MVXq4hrE+/ZLUZS0Lo5b9J0s/H1r
 staZ1ppq6cn/rgUlmT/e+q/ts+/REeZ2afHJ+kkjg7Tend3gAAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_040123_827428_711A6B90 
X-CRM114-Status: GOOD (  12.23  )
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

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
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
index 186f6452a7d359f079662bc580850929632ea8fe..d83111815191d1694455ed3100e624fa0a81866d 100644
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
2.51.0


