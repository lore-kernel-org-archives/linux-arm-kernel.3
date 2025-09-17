Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57CCDCAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 14:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i7JcBXJKPzD5YzchzEc4bFqQZ/ArXd9U5zzJmOulHWA=; b=pKjLdLcRkQUdc30yrW5mXTLGGd
	l9A69fB9/zBABqqOJv2hnOr6i+fumG0obY8AXcg0LV2uff1uYZ+8PjujGdaYY5jlKWGz2xhP47Tla
	35s/8OVSVqc5zbvblT9DLxkWDKdpgh2ZTy05rRfvHC0kNmfKeKcGzy4Y/HlQOWBQfcUh9j6S/kJ3M
	QbJ282qeDaiXpXf04rLbhRfMpYhkPyc5+rWElajU7S26NRE9gDGs4Pj31OdMUwamJOUMMn/+ijkf6
	9AVVU/II06u4ostUsUIH1rXrAF3EhIo0rCDNOAsVMgto0s8sCXXI/jeqodlpfri790SBRwyppJfM3
	iTofiADg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uytQy-0000000CMpo-1a9o;
	Wed, 17 Sep 2025 14:47:00 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uytQu-0000000CMmr-4C8g
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 14:46:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5E3496024C;
	Wed, 17 Sep 2025 14:46:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A785DC4CEF7;
	Wed, 17 Sep 2025 14:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758120416;
	bh=RhV3vKNoJmITjtgf6bFTsa7XOh0uqQKzGR+gqpl6FiQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=OV2M8jAp6LZHANWZfPjwbgb+t8rkDbEV3iggOvJrLwgeDmo4oWVRKcKprh++pxGEz
	 9FMo8OwhFk+VR9zUnp5lWhRcIsAG1i//cTRgChPYPnYBzu4z6F8FKNoTNCwPgyZEVP
	 S49q+IbBBaazA+l9tLr5TYM+XuRHLI87YWWiuggU8DXUoBlwm+uBGb4H6F6bDPYeVj
	 JI+THlsmoK7V6oDC9TKqcTLBCt/HIyAe602o8wpUvU3ZB2fFwNO6B23lm1B613oQzG
	 aG88mS7uzQ3NYjYONPGA6CfFVuWN/seWEfwDmMptEgE/Dug5y0FRsGJWunJVHY8EbG
	 DqxL9wGm+jomA==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 17 Sep 2025 16:45:57 +0200
Subject: [PATCH v4 16/39] drm/exynos: Switch to
 drm_atomic_get_new_crtc_state()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250917-drm-no-more-existing-state-v4-16-5d4b9889c3c8@kernel.org>
References: <20250917-drm-no-more-existing-state-v4-0-5d4b9889c3c8@kernel.org>
In-Reply-To: <20250917-drm-no-more-existing-state-v4-0-5d4b9889c3c8@kernel.org>
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
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBmnTi7TUfx2UeSS2NYr3Jq/em9ls325sTStPWdCwZStH
 zgLlWa3dkxlYRDmZJAVU2R5IhN2enn74ioH+5U/YOawMoEMYeDiFICJZIkz1temP/DJzu4LL225
 Yij3Ue2t89/06LnRhXNXMbs5Kijt/BnJlGWU97qx49DUjimy6dsuMzYsiNNdNsugieEu54yzry6
 87Fc/3bWfV7E72qTZ5ZSo5AJ3Tce9tTuyKspP/xBdFBVrcREA
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
2.50.1


