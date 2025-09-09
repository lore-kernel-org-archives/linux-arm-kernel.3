Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FDA7CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xdzMewHPxt+AhPGdNNKdahj+Cs93RokZh483ei+i/DU=; b=DOdy97E2RAjL+HO/pmVZC+G0Tg
	yDDV8vKMwiDCjdA/I3w+LO9sjhrlGdEUYM0JUO8YiCNETjI0h+Zb50vt3Os+dhajKXUfbar9lW+fv
	4dqDg9pdRI+WJtnEchHUIIC2I5mE14EURgmtV+6OoqipBvsH48nSNwWK7z6oS231xSJXCKTpAADG0
	12cALlal0TN7G47/eC77rsuAdkb3HF5ohOxOkaN0KneaDgh9cbc3rIc3YNTax9dbW5DXXkvhL4jcp
	xX1yjAJYwr2H0s2WdJ7oiD8UvnvSgkOqyXxNGIVcP88WbuwUWB1Q8igU227LojIpiyYOut/FkQCzl
	tgo0EQYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1wj-00000008oyk-0Qwn;
	Tue, 09 Sep 2025 17:15:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvwXB-00000006k7K-042e
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 09 Sep 2025 11:29:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=xdzMewHPxt+AhPGdNNKdahj+Cs93RokZh483ei+i/DU=; b=AHpZQU+DWI2srXF/UG75jh1pM4
	+EDzSv7p7//R9igY+Ar5miQXSz+EfUR7F6aZd4YKOojOkOsAzlz+snCAozdN0rp3kP/3Ozsr4TVnQ
	FQsey8x8TS6JlG9vUwIIKTOMe6RxiXjvH2xDGx/igAIIL2dGjeMWPmfK4asugdL8QEdIWIGB4Zkjm
	7RCPRP8RK7SgWRzsqPGXbCFsZEtigGU4ColEqw4q5Sf4x1YDukAd4/P0IsU/yGKWhRTyv5kQvNQqg
	wFvWFKOlYuR/7XqqUCrgnLt6sPVWxo+at3dGq5WrQ521tstEvVGwo9Wstp1dndRAU/wEx8VuH4N5c
	JFq1KNbQ==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvwX7-00000005JbS-3rmV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 11:29:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7FB25442BD;
	Tue,  9 Sep 2025 11:29:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A351C4CEF4;
	Tue,  9 Sep 2025 11:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757417348;
	bh=UsvqM3BvXaxvpr7HcsqbbmUjuygpPNM05UVXcP+zk6M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JfGhZbUXLGpgm8rpE3DoAq1yWTgRZRTgHJPTRLXqaWMw5x+NPjdxYaU5ueXbro99R
	 DeQptjkBcM7N4w8tArpGzS/0muKochPMZEQNfW5FVQYb5pbJMh5DyWXdUfYB+ljnwN
	 t6Z64i4LIvmuUIsrbroo9IT//wPzeophVos2Nfs3jAgfYhc5ATzYDWNKbJqFVRTW+m
	 BnccXopkxy8pwW7BThJqbWwZkB9+X3CVYQ9bblgC2yt4hKLtu7wzB1JayObQMOIFuX
	 CE5dszNFhaSyZufKOD31e+LNPmeaqTQEPytWYGov1K5OdP2iY41xeUb1PXWXfpWWH0
	 aUVQ+H8MUWVqA==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 09 Sep 2025 13:27:47 +0200
Subject: [PATCH v3 28/39] drm/sun4i: Switch to
 drm_atomic_get_new_crtc_state()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250909-drm-no-more-existing-state-v3-28-1c7a7d960c33@kernel.org>
References: <20250909-drm-no-more-existing-state-v3-0-1c7a7d960c33@kernel.org>
In-Reply-To: <20250909-drm-no-more-existing-state-v3-0-1c7a7d960c33@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2306; i=mripard@kernel.org;
 h=from:subject:message-id; bh=UsvqM3BvXaxvpr7HcsqbbmUjuygpPNM05UVXcP+zk6M=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBkH+PVW//rAxfWsP6XwVd5VZZ4XFodK3DlFEw79sZ20q
 e7d1Z+7OqayMAhzMsiKKbI8kQk7vbx9cZWD/cofMHNYmUCGMHBxCsBElkgyNmwNPC992y1tDldQ
 39wwuXlV/H3y36JsupPczXg+3JoauNvJuEq6UXR9l0vGpk0m8nPLGOs07QxnpKyMv5GveSdJs+0
 /48LMc5+m1T/e9O4Z0y2B3TMeePe0rzyyc/WqbtsOtmezQ04BAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_122910_375143_1C1941F4 
X-CRM114-Status: GOOD (  13.19  )
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

The sun4i atomic_check implementation uses the deprecated
drm_atomic_get_existing_crtc_state() helper.

This hook is called as part of the global atomic_check, thus before the
states are swapped. The existing state thus points to the new state, and
we can use drm_atomic_get_new_crtc_state() instead.

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
To: Maxime Ripard <mripard@kernel.org>
To: Chen-Yu Tsai <wens@csie.org>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Samuel Holland <samuel@sholland.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-sunxi@lists.linux.dev
---
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 3 +--
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index f97be0040aab29cb4e138fcceb20e90c72db0252..94ac6ad6f30688a048e594811d2ae72aaa44376d 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -204,12 +204,11 @@ static int sun8i_ui_layer_atomic_check(struct drm_plane *plane,
 	int min_scale, max_scale;
 
 	if (!crtc)
 		return 0;
 
-	crtc_state = drm_atomic_get_existing_crtc_state(state,
-							crtc);
+	crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
 	if (WARN_ON(!crtc_state))
 		return -EINVAL;
 
 	min_scale = DRM_PLANE_NO_SCALING;
 	max_scale = DRM_PLANE_NO_SCALING;
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index a09ee4097537fca8b653f34a833b36b69e343ea5..1f77e1d2984548e746805f8323f537f3b4d93198 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -325,12 +325,11 @@ static int sun8i_vi_layer_atomic_check(struct drm_plane *plane,
 	int min_scale, max_scale;
 
 	if (!crtc)
 		return 0;
 
-	crtc_state = drm_atomic_get_existing_crtc_state(state,
-							crtc);
+	crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
 	if (WARN_ON(!crtc_state))
 		return -EINVAL;
 
 	min_scale = DRM_PLANE_NO_SCALING;
 	max_scale = DRM_PLANE_NO_SCALING;

-- 
2.50.1


