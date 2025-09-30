Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89B5FCCA468
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 11:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fpx73CJRn/sWvaoHWAsjaGP4FmNzxtMbywOlua2o54k=; b=M03TaUyKJQ+5d1IHivNUDrwzzw
	Cz3wGtYd/hmsIBA8nzyU94w3A/fCBnLgGWAMJAF+a1PFSbUi0LHJkFsD595ClbnNTj9PwW2ORFEl4
	Y/eHRTejKoLkOh8wqCzY/lcDLaKzVJN5Mfoq7gD+0d/GPEoIwmM4dCq4oJ3IuQJGn9Q0qXuXIRIkp
	FLcah1Hul6RSC0zE8ObSoT3vxDqHevh4jR7h2D//0LKN8byZ1EHJfSg1+ZaqHt8jM7DvGRkY/p6f/
	4Xzdh/4lFYUrD/nB8m9pBNabnGQbYDQyQnRdV9bT1jUJUsinbR/oCg3Jbb+2hTWf239msFv+GzY8b
	ngq1CmqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Y6K-000000054u2-2xgo;
	Tue, 30 Sep 2025 11:00:56 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Y6G-000000054sh-0DsC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 11:00:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 65E6F604CF;
	Tue, 30 Sep 2025 11:00:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5DF3C4CEF0;
	Tue, 30 Sep 2025 11:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759230051;
	bh=SDH3XnNi6v//uFU3KL8fb7Cra3gbK8Z2qIAy3fUoWpw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ckbEkHKdRyKCkmvA1vl1evYZTUDGNQUKA9SWe48qi7FG985YXmxCI8Pn3ydTJh5Gl
	 3p+uhSxzPeoCawpU6jOhKXx3GRjrK7Q4GzmChpruplb1Y9YrLftwoEVF93hHEHMWU6
	 gzFOu5osYba/J0GyzLtAq4eNEBW2BpruQsXHO/KL+sHV8junGqze45jN5C5opd7+7g
	 Lh9fXHP8O1zpqT59mUc859bnAy+Z4dViCZJnYSbo+6pDqz1Pcw7h4tI4WvAXJg50EI
	 kP9g14dKnbhgvMnKBO/NIQ3jRtDnrghshQfeCpMI2btnx7GHoszNvYLY4YLXkMneD2
	 vNnLe292dM7Jw==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 30 Sep 2025 12:59:31 +0200
Subject: [PATCH v5 16/39] drm/exynos: Switch to
 drm_atomic_get_new_crtc_state()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250930-drm-no-more-existing-state-v5-16-eeb9e1287907@kernel.org>
References: <20250930-drm-no-more-existing-state-v5-0-eeb9e1287907@kernel.org>
In-Reply-To: <20250930-drm-no-more-existing-state-v5-0-eeb9e1287907@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, 
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1787; i=mripard@kernel.org;
 h=from:subject:message-id; bh=SDH3XnNi6v//uFU3KL8fb7Cra3gbK8Z2qIAy3fUoWpw=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBm3d6hFuvRJzm5y/8zv23bKVyjC0dbqr2iafLv5VMvcC
 Zv/ryjqmMrCIMzJICumyPJEJuz08vbFVQ72K3/AzGFlAhnCwMUpABMpc2esT81UEI99YMgbEjyf
 PfTMluUbjVdHHXv3SDfnS/kcp0Ud1vZWZpt8rP3P/H5iEBxl8jaZsVZy5WSv49YtqQlFaWmnply
 p9+M4c2f/oZ9G3yq+JvAdf1S7jOt9sohgG/P8C0732EO1uwA=
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

The exynos atomic_check implementation uses the deprecated
drm_atomic_get_existing_crtc_state() helper.

This hook is called as part of the global atomic_check, thus before the
states are swapped. The existing state thus points to the new state, and
we can use drm_atomic_get_new_crtc_state() instead.

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
To: Inki Dae <inki.dae@samsung.com>
To: Seung-Woo Kim <sw0312.kim@samsung.com>
To: Kyungmin Park <kyungmin.park@samsung.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
---
 drivers/gpu/drm/exynos/exynos_drm_plane.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.c b/drivers/gpu/drm/exynos/exynos_drm_plane.c
index 7c3aa77186d3431d7020db4dec70332c0cfccb5d..6400070a4c9bcc00ecd0f21cbce1b5aafe1bff48 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_plane.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_plane.c
@@ -56,11 +56,11 @@ static int exynos_plane_get_size(int start, unsigned length, unsigned last)
 static void exynos_plane_mode_set(struct exynos_drm_plane_state *exynos_state)
 {
 	struct drm_plane_state *state = &exynos_state->base;
 	struct drm_crtc *crtc = state->crtc;
 	struct drm_crtc_state *crtc_state =
-			drm_atomic_get_existing_crtc_state(state->state, crtc);
+		drm_atomic_get_new_crtc_state(state->state, crtc);
 	struct drm_display_mode *mode = &crtc_state->adjusted_mode;
 	int crtc_x, crtc_y;
 	unsigned int crtc_w, crtc_h;
 	unsigned int src_x, src_y;
 	unsigned int src_w, src_h;

-- 
2.51.0


