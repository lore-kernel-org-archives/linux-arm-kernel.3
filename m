Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0F60CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i7JcBXJKPzD5YzchzEc4bFqQZ/ArXd9U5zzJmOulHWA=; b=y7I38KOoCxvPiPNxlLCNLEvnjU
	sT7yhaRrd17wJbk6Ll4okO1k7ml/uH16ZgAk9ZtGxSo0CuOUaU5fFu7S71MVRgSofa1zGSgwo2wUL
	OikPTBjHuOEJeqgP3GKBRVE6vptq/VXYY42l1m6Fy3mIL1orfFKHiXJu5Gj4h1vw+h0gC8icUYXrL
	YrtCgzO8NOK52DOlLzQtiDjI9BenWUtJDzPaSCGNTM2jXIeZmqNqOIXaVq/dXGinXP+eDTqxc1D9y
	yVHllLAV5j9LMd1PM6Qh020rc3Vw8WHsZV+tg39Ucz3jgpY3Yb9ch5UQZiszVebvU5XbYJtmF/XpO
	a3uMtE6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1wb-00000008okY-2xpj;
	Tue, 09 Sep 2025 17:15:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvwWf-00000006jlX-2HmC
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 09 Sep 2025 11:28:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=i7JcBXJKPzD5YzchzEc4bFqQZ/ArXd9U5zzJmOulHWA=; b=mtSQap/yPOqQ5PmJBklVtzICDu
	FT1Ou9zQdpIYZ3HLDwIze928Gy3Oy8T8JpSxoG3GJtro3q396Hl6cUwf78R5VE+E8oxb20f2UjeJk
	G/uZ3hyuGL/zUI/JAQMSlHBZ8C8MhdtEznnwVmdpgis3hXh/xhJYN7ZWTQIx8bPpDB6rjk7BHZI+7
	iQXftYsSrA7S45iIMFlEctFxtZKgvx6yGvslVZbDdFfTyRyCT3ej7P/Q45b9v9Rw/6nJB34HUJ3kw
	uT3SXfMe6bKsOO38ol3Z8JIwrDh+E6OY1M+NYSY0AaVgGg+zPCYpMZt/W7NEZK8/YqecEFgYkAZXI
	Qj1HUixg==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvwWc-00000005JYc-2RaJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 11:28:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 91B8B4342B;
	Tue,  9 Sep 2025 11:28:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8C68C4CEF4;
	Tue,  9 Sep 2025 11:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757417315;
	bh=RhV3vKNoJmITjtgf6bFTsa7XOh0uqQKzGR+gqpl6FiQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SWRl/WYY8KR/IItKPqWeV32AozQM9I17L7JqXpGh2FcVBLyUjAZ8i6QmkH1xsSKWI
	 0KrjMpWfbZdMikQjxAqtuoQJ/5f7AActcwvCWvzWwgfadkk4vHi5PzQQDR2NZNIIjw
	 qhKrVJrGimqtiwCOZi5xEg+Np15NUm7kHW51M4E40Ty8ffzIxLfo39UlyIoIWyQmd0
	 +1Y+ALqESetDK59w4vPdwIOgNIZfh2E47mR1Devdn18hNDHbyZJKwYjc4f59FUBfYN
	 PLPk8/noTaYqAxgYy55U/nfiJwP6L6f4IVitQPfs0ff+EZsSMJvVah9eqGYjIINPdN
	 hPudR0DYQG4aA==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 09 Sep 2025 13:27:35 +0200
Subject: [PATCH v3 16/39] drm/exynos: Switch to
 drm_atomic_get_new_crtc_state()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250909-drm-no-more-existing-state-v3-16-1c7a7d960c33@kernel.org>
References: <20250909-drm-no-more-existing-state-v3-0-1c7a7d960c33@kernel.org>
In-Reply-To: <20250909-drm-no-more-existing-state-v3-0-1c7a7d960c33@kernel.org>
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
 h=from:subject:message-id; bh=RhV3vKNoJmITjtgf6bFTsa7XOh0uqQKzGR+gqpl6FiQ=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBkH+DVvVfxXX/GRk/fuhPayvKPTeaafk/o/W5zn+ORm7
 eUrvRf1dExlYRDmZJAVU2R5IhN2enn74ioH+5U/YOawMoEMYeDiFICJcJozNkw752Tf35ZoxPh+
 j+uthvWzUr8n77s7yTAhndW+LkZfZ7l3YkxLzTQrBpfXJWU7TMrEGesrAxeef++1xeTi+rmPf7E
 4r6jV03xllvZ237zprGntkdVT3/6Q2i4a2509+XmDnurngs8A
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_122839_010965_FB0EA0AE 
X-CRM114-Status: GOOD (  13.55  )
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
2.50.1


