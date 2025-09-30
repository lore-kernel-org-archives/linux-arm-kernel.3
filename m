Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6DB8CCA468
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 11:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Aw+JBK5MLq5KlMuiEXiOxx1AF8Q3p71aD58ycmh823Y=; b=qDBzgwmNU00I5LfRXZIFlVYC86
	o99suguw0ft+FlFQEUUVesZDLaJpOi3Cu/QC9jJdRnxJzPQ9QOkLa/xjitUD5/3DJyZnbqfF7JjlI
	WHtsgLkPLb/jrqqKeEINLWCZ2PCcXJMN/c5KEla2XPB68be2Ad6hcKDJxaTqQqWXIWyikVn8YQBYn
	sAlM4+M67Pzd5mmtCka91z0lSe9boSvOYjgsEap220b2VgwFe79gy4K4d552eLzMED8jZblPDW31v
	ykdeRiJwJlFeUaW/o+G14Dc/jOG6CvgSB3ZXab9daKm42Yojb7Dmiwr9Pmgn58Q6XK5ByPE1RhEGc
	6PWgbUyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Y6W-0000000550w-2dVH;
	Tue, 30 Sep 2025 11:01:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Y6O-000000054xo-1Pfw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 11:01:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0A946445CC;
	Tue, 30 Sep 2025 11:01:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77823C116D0;
	Tue, 30 Sep 2025 11:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759230059;
	bh=86mQn5KQe4ZAdKQShvgUTY8ioShLlRJo5ZDwJwJLDnY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=hkPxGgv9XKQyGIQrHR5U76l4LiNVqX6VT67/nHMJ8D1CKE+it5A+oethPO8whWdup
	 UevNc7J49kmrS5V6GW52/WJDWFdsOo6A3CpaXOXKzarP6nCCufyaZBjbYgoJuzMiqq
	 LDyAWQulxoTJazxP8Zb6b+jIlNUG9qv+kPjQUm0MLaGnEiv6xYt3bLI6+lwCecP2Rs
	 5pNOaMqSyCkE7EvSys8gGX7jH0ye4bc8e95FYa17YFGR/p9uVfeo/2f5aXfihOEChI
	 MtH/r61AscuajfE0dQNLZUjMKpYMav3rO7Leb51yoCW+islwXtmWSewO18CI28ALlT
	 KgA2OetYicFpQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 30 Sep 2025 12:59:34 +0200
Subject: [PATCH v5 19/39] drm/imx-ipuv3: Switch to
 drm_atomic_get_new_crtc_state()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250930-drm-no-more-existing-state-v5-19-eeb9e1287907@kernel.org>
References: <20250930-drm-no-more-existing-state-v5-0-eeb9e1287907@kernel.org>
In-Reply-To: <20250930-drm-no-more-existing-state-v5-0-eeb9e1287907@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1604; i=mripard@kernel.org;
 h=from:subject:message-id; bh=86mQn5KQe4ZAdKQShvgUTY8ioShLlRJo5ZDwJwJLDnY=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBm3d6jLlM4X8EvKfJFd/11rsih7kN3iI4u3/GdI0pjDe
 PvNsbSajqksDMKcDLJiiixPZMJOL29fXOVgv/IHzBxWJpAhDFycAjCROn7Ghhufud2f8J4uet+b
 VZbxKO3ZcZZTS1aLnRYSVug69mqx569+41uXlIpvMxmsT/60Rkr+J2N9vEViqUw2b2WG4ss6i3u
 TJh2bx+Y9Oc67N/4hl7vul29nYxmaM5MvGx5rl90QbBVkvhQA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_040100_416281_B2FEBD58 
X-CRM114-Status: GOOD (  11.45  )
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

The imx-ipuv3 atomic_check implementation uses the deprecated
drm_atomic_get_existing_crtc_state() helper.

This hook is called as part of the global atomic_check, thus before the
states are swapped. The existing state thus points to the new state, and
we can use drm_atomic_get_new_crtc_state() instead.

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
To: Philipp Zabel <p.zabel@pengutronix.de>
To: Shawn Guo <shawnguo@kernel.org>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c b/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c
index 704c549750f950c3f0ce5d6c6f637d9d7b53fb69..df19560e41b4f5b0dce97ae03947abeaf99e0883 100644
--- a/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c
+++ b/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c
@@ -384,12 +384,11 @@ static int ipu_plane_atomic_check(struct drm_plane *plane,
 
 	if (WARN_ON(!new_state->crtc))
 		return -EINVAL;
 
 	crtc_state =
-		drm_atomic_get_existing_crtc_state(state,
-						   new_state->crtc);
+		drm_atomic_get_new_crtc_state(state, new_state->crtc);
 	if (WARN_ON(!crtc_state))
 		return -EINVAL;
 
 	ret = drm_atomic_helper_check_plane_state(new_state, crtc_state,
 						  DRM_PLANE_NO_SCALING,

-- 
2.51.0


