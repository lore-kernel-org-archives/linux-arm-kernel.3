Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A0DACAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 14:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/NyK+nPmr00AYzfYGOkGmz+3prriYAmjQbkAtYltteQ=; b=nDB0gKbKIPzrwh680GRinhFdlh
	Qb7HD4kgFijfTy+WPqv81cOEMjfcRfnvvay4ljvx7KdhVdGG6r8ZLiDz2O3/WHV0f/ah9WA3F7TIz
	IhSrl3ll4+1TKaiIK63NhL+aswCxtwleTly0hao+kRLl9JLXW1xBYTH1R8panrTOSgG0lbbXnN/03
	U30VnZfd1ALRvD5iJgAHsoSWv7Wg/UnwPn1jPtMfqLXIaJ3UzjWSk5J8i+zpy8IXH6/5HZBLiKnsn
	Ham+Z8skqHMIUZR0qnK7vKkz/Yy0QVw7YNqQpguVZQdpD9lfITh7/2Ib2BuNm35Uof/GX0xaLqQnB
	sA67BW8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uytRR-0000000CNIu-0zK2;
	Wed, 17 Sep 2025 14:47:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uytRQ-0000000CNHr-0WE3;
	Wed, 17 Sep 2025 14:47:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8B6926023C;
	Wed, 17 Sep 2025 14:47:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D64ACC4CEE7;
	Wed, 17 Sep 2025 14:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758120447;
	bh=2PquY0VhsfYnlQnlGduztvw5rjnR1JXo4CdA9iXwMLk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=YinhiKIhYLoTEdIRav8S4QWMZwIAJPfMg7htfz7w/uFOFdt+SIHzHTYlHU1rNBioX
	 EroYfF5IMWWpKamKDEg1OMYhZb75Q/molcuiw6jH/mBbte8iIoQINI+B2uYvmnR8X4
	 YZIncYPDNYuvP0iMGAXHJdxrdteK8poQowvWeW01as74MMrbEdTncgGVtRB5pDBwTJ
	 9qzQi1EkBA0OBZML0xJZAJhEEXsaFKCF4/mnCqqyNSLxeW9lr51YDubULbeB1m3UHw
	 wS9Uni5E7rwfFoRGhOSsE0UHDiY0mq/KJji5AtMTMvCIVcMoKKs0RaG2s+GM2FeTCZ
	 /mCYPGzyLxY8g==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 17 Sep 2025 16:46:08 +0200
Subject: [PATCH v4 27/39] drm/rockchip: Switch to
 drm_atomic_get_new_crtc_state()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250917-drm-no-more-existing-state-v4-27-5d4b9889c3c8@kernel.org>
References: <20250917-drm-no-more-existing-state-v4-0-5d4b9889c3c8@kernel.org>
In-Reply-To: <20250917-drm-no-more-existing-state-v4-0-5d4b9889c3c8@kernel.org>
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
 h=from:subject:message-id; bh=2PquY0VhsfYnlQnlGduztvw5rjnR1JXo4CdA9iXwMLk=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBmnTq4u0s2ac3TlF6tpjtcTKsv3nz381/CQyOs1n2dOS
 Fn2/S7HwY6pLAzCnAyyYoosT2TCTi9vX1zlYL/yB8wcViaQIQxcnAIwkWnMjA3TQ3X1Y2t7hc5b
 xG8QtG49mu96N2qW1+b5CvG/DmvLn8/dYLXQZe7cEv/3Fyfd+LUapOPdXM8uLmV3f/EEoVmxdz6
 pKzW9bT7A23nrAKPF3vAzS1bP9ppfqKMScmXlNom8S6rGJwE=
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
2.50.1


