Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1C78CA0FFE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 12:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8h8VAqu7HM3ssZRtCgrCLk9wV7jEl+x6WJQmAoxLtpI=; b=WfDPEgZAkGepPonyuGrmmk7lRg
	8pXv87gReGIMf703e9RNoslX+o6q2SKetdrfv0KTdfgI87Gkvk3yXdauv3s8p1dRQ+jquZg05Le8W
	eL/ZQUcmT+ToOgaxiSCrHfSk6MkLoDZkXRc4NMmNELtrO08dB8Dtj2zYUkqETNIslzJqT9qroP0jM
	P86RfHdOcnPrsp7Xlz0otoHKF8A6BYD7yxJwh1T939OGxG5w4p5uGskWDqftXZ0vYD/Wh/Qwq4Z/K
	81w8i5tIuNrDkq3iKY3+SAxvU3BceY9wHPtnHENxAfD/zgSsrEmO24ssR+ZB9vJZazJKPLkCTbxuk
	T2Sqeymw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utQ8o-0000000HGkX-3cxx;
	Tue, 02 Sep 2025 12:29:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utNQs-0000000GQ7j-3Teh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 09:36:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 37EEF4330D;
	Tue,  2 Sep 2025 09:36:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDE64C4CEED;
	Tue,  2 Sep 2025 09:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756805766;
	bh=FNDZEgKpAurvm9H/hOI1FSXXhYJAHB6zWHdsRjnZZJc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pYKxUkk/nTxbAenQ6HTEXLKdkJpalCuD0IxtGxEjYAhZB1AkQVhiAZR642Rj3EkpX
	 Ft0MjlmGuFtVrihMBbbXguA7qZmL5WMT99073nSm4++EChcITzBimVfRPv8zRShLKV
	 fIk6CjwmoPIuo/rnW3xsw+9x6U/Qq5l1MUUxtP5ntd9ncLezJmQ2qje+e8fv5P2VhG
	 OSfC+H+h8V8/SRGHbMF4UOn+VQJBYNllAg9/CRVasav/cCnNQ+j6P2LQTbDtKsffuy
	 PBJTd/4UOBRwRES3AwnhtkGxNGhQs5quCzd6sCtJP9FKN/yKto89LQRuPIcKT1R2iN
	 1WBzQlsBQWr1Q==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 02 Sep 2025 11:35:14 +0200
Subject: [PATCH v2 15/37] drm/exynos: Switch to
 drm_atomic_get_new_crtc_state()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-drm-no-more-existing-state-v2-15-de98fc5f6d66@kernel.org>
References: <20250902-drm-no-more-existing-state-v2-0-de98fc5f6d66@kernel.org>
In-Reply-To: <20250902-drm-no-more-existing-state-v2-0-de98fc5f6d66@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1727; i=mripard@kernel.org;
 h=from:subject:message-id; bh=FNDZEgKpAurvm9H/hOI1FSXXhYJAHB6zWHdsRjnZZJc=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBnbdgWdnNsqlvqE52FOSlnR+oy/R8rfmJTYh7lU/8rg2
 M4zSc+yYyoLgzAng6yYIssTmbDTy9sXVznYr/wBM4eVCWQIAxenAExkYhpjwwse/ZvBdnna/pdu
 L5WRCb2wbt7OR4HhAbqhtxjsropZTvjwae3c12IVrdwylx4wbOVsZWxoW8SZKrJ4TW7XPu7P8T9
 7UzwnT1y87GiApoRQxMJnr8tTbS69meCvEb5g68X8CbwX15gDAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_023606_913156_33319E9B 
X-CRM114-Status: GOOD (  14.08  )
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


