Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FA40CAC583
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CK/2IOeJIqNd2zpLdnAnzcmL52wprfxzpcul7E2EVVM=; b=sZUk2RXPiG7T9sCBP7G4GoN08h
	CBLuhlSOdWIPU8fliB9Z8xcMg3R6KYp/tAcp7sH7tUTXOYVNhFBz6wgKQWEvC2kSCox9tiNFK+fHD
	6CQhihOlPH6/WvCj5j66uaVgcSKJrHKWvhMI6xWYB3svlbWwhEMKbMsxI2CsIV92GB3QVRVaJ3mgc
	ZeflXCItUKj5vQOatrd0PQj7tXilQcs6volRXapolKLtotjB1CEiJ1frlqPfKfMRh13ewBO1r7ZIx
	4NYnw1XWycAgrBX6YwPbbCw/ovngH656POt25qMkF6lJ5X6VF6iEGXWWQqXBGnSMGS6pJnu2y/Gd2
	/Rqy2IlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1wh-00000008ouR-0u22;
	Tue, 09 Sep 2025 17:15:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvwWw-00000006jw3-0iFD;
	Tue, 09 Sep 2025 11:28:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 909976022C;
	Tue,  9 Sep 2025 11:28:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8ECCC4CEF7;
	Tue,  9 Sep 2025 11:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757417337;
	bh=Egw7h0VZpXs5tgL5vzoN8ns5makVBNBrNokzbdRQY4s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=dmodOF5CRBsUowJYyvBF7Rl5d0dMoS4w9lQosU6NaAmAnlUkAPLqP7CTgn+R1IkQm
	 Y4jH4wDOD/q97SKkqakLlH5lgCZt70GqyHm0A0XRH6mC0zbIcChzR7rdNZxH+Qy7Ky
	 HZ6ZfUvLg7rG3CSR2+AaX+R0dH+vNCWPC6IWMti+62S+46xVrCafM2Ou1Sjb2m6FGk
	 LBc9j0/mVT2OWzCca0YS6FuLtOAFlEL/UV+invbrWccRwAO7boygmZ2fwT06ClsZug
	 QxYxA5Pfx/W1TfNav+xCyobizXYfMtSMYMvVEbKF8zCsl70KwtXad3VipKEUb3z+vC
	 IeH1qSVLT8eWw==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 09 Sep 2025 13:27:43 +0200
Subject: [PATCH v3 24/39] drm/mediatek: Switch to
 drm_atomic_get_new_crtc_state()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250909-drm-no-more-existing-state-v3-24-1c7a7d960c33@kernel.org>
References: <20250909-drm-no-more-existing-state-v3-0-1c7a7d960c33@kernel.org>
In-Reply-To: <20250909-drm-no-more-existing-state-v3-0-1c7a7d960c33@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1747; i=mripard@kernel.org;
 h=from:subject:message-id; bh=Egw7h0VZpXs5tgL5vzoN8ns5makVBNBrNokzbdRQY4s=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBkH+HUqU3i/bM45HMOb3/izYaNgp5Mx61n3h3Z/GhPld
 v2673m1YyoLgzAng6yYIssTmbDTy9sXVznYr/wBM4eVCWQIAxenAExEL4Sx4YLQmvt+bz9w9Zoc
 Svwvd28OQ1Jv4as9/6ebrtaoiIn6df3Mh7tTlLhzdHmLFobM3j3nNGPDqtWnn7t5rHzM1fKb94B
 A9Ql7gWuGd7+6ebnXBz86P3P+rtdOf07w+U9Id9kkU8zrlOUMAA==
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

The mediatek atomic_check implementation uses the deprecated
drm_atomic_get_existing_crtc_state() helper.

This hook is called as part of the global atomic_check, thus before the
states are swapped. The existing state thus points to the new state, and
we can use drm_atomic_get_new_crtc_state() instead.

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
To: Matthias Brugger <matthias.bgg@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-mediatek@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/gpu/drm/mediatek/mtk_plane.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_plane.c b/drivers/gpu/drm/mediatek/mtk_plane.c
index cbc4f37da8ba81ff9c8b3b58f66363837ffc21ec..d4486a63a6e01f02b6777522440dee8e39d51bf1 100644
--- a/drivers/gpu/drm/mediatek/mtk_plane.c
+++ b/drivers/gpu/drm/mediatek/mtk_plane.c
@@ -120,11 +120,12 @@ static int mtk_plane_atomic_async_check(struct drm_plane *plane,
 	ret = mtk_crtc_plane_check(new_plane_state->crtc, plane,
 				   to_mtk_plane_state(new_plane_state));
 	if (ret)
 		return ret;
 
-	crtc_state = drm_atomic_get_existing_crtc_state(state, new_plane_state->crtc);
+	crtc_state = drm_atomic_get_new_crtc_state(state,
+						   new_plane_state->crtc);
 
 	return drm_atomic_helper_check_plane_state(plane->state, crtc_state,
 						   DRM_PLANE_NO_SCALING,
 						   DRM_PLANE_NO_SCALING,
 						   true, true);

-- 
2.50.1


