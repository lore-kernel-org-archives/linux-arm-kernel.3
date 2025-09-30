Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FD5DCCA470
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 11:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WgBAD4BSVUQA/mOhXTyw3Ue7EVky1vkwuo7h24ZdCdE=; b=US9MdwuYdkn2Fvddq5mwxAk2FH
	uYuLJi04iqS/5qh+v/NpXzQVi2IsXSqX6wAi3Fc5VOdn6TlTXgKF8fMfSSxp8CtfLof75RHM7YY55
	MMlbAcR+2fnzkOO5rYyIq7xoj/jldBb2XwJFNwo0AcvRugt7EkBh7i10IzSsdhXgcL17yPlhW7HYM
	GRcIMQCHAR9myY8HjfihProPS/QWxBA5VLo9Bgy7cHCGxbBT7miKVKEh7uwj1F71ErjzmqI7Ow/4Q
	BZmrKT49msv4Q2T/GSZ/8OIdSBxoGi07XgDTqwsh80bzT2pLbvV7wRGNZwLGmyqU9bAmU+TQ7B2RE
	4c7x5nRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Y6L-000000054uR-02Rg;
	Tue, 30 Sep 2025 11:00:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Y6I-000000054tV-1sFD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 11:00:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 22B04418B5;
	Tue, 30 Sep 2025 11:00:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99F03C4CEF0;
	Tue, 30 Sep 2025 11:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759230054;
	bh=mPLnr3ZEUiPa0Etu18m/cNVjSwFPhksFj4l1U6AHc38=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=bffwiXxY5zqFMlGe+XbkCu3qBvIz1hacx45nWI1AXhphapmaYaG183jteg96knrYj
	 s0IHQzo2XaLhApHq08P/ogwcTC8MeT+fQ1NRq1iSTSdN1WiikO4Y/udP2am4kZkPQ+
	 0UkrzRRbCXS4DVuFlDkyjN2U5TUQSeIUfpMYBUEvqNmYZkllmz14hpshO0y9OdY4WO
	 uNlsf4s7FUWACNI5idy9WVc0Qyq92h1L6+c/NN6+klqrERy5U5xlVBlIL+6E0SWtf8
	 fC480tOcsMdtvrUeJaOVa+DkVrlut52nGBnJTy++IaQ9rqsue5r0k5hmz3hgbaQegn
	 ReW9EOHXxjIBA==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 30 Sep 2025 12:59:32 +0200
Subject: [PATCH v5 17/39] drm/imx-dc: Switch to
 drm_atomic_get_new_crtc_state()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250930-drm-no-more-existing-state-v5-17-eeb9e1287907@kernel.org>
References: <20250930-drm-no-more-existing-state-v5-0-eeb9e1287907@kernel.org>
In-Reply-To: <20250930-drm-no-more-existing-state-v5-0-eeb9e1287907@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, 
 Liu Ying <victor.liu@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1640; i=mripard@kernel.org;
 h=from:subject:message-id; bh=mPLnr3ZEUiPa0Etu18m/cNVjSwFPhksFj4l1U6AHc38=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBm3d6jPqfj/84fFt/+R/eKtDmybBQ3vRmUF9hyz77UU3
 r5ueQZLx1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZjIbQHGevesNxz/qv8Yvbx9
 sHv/WTlH3xOSOw5crF9fZMzDpLvF3M9iSsMKa77nzpoLHy99E/VZirFW1NDx7D+R12yWno9evLv
 19+SpXaWhjdsvZs9m+ePa9nLlD1Hh+iXzH2elK256vcykVkARAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_040054_528351_7E8BADA8 
X-CRM114-Status: GOOD (  11.73  )
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

The imx-dc atomic_check implementation uses the deprecated
drm_atomic_get_existing_crtc_state() helper.

This hook is called as part of the global atomic_check, thus before the
states are swapped. The existing state thus points to the new state, and
we can use drm_atomic_get_new_crtc_state() instead.

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Reviewed-by: Liu Ying <victor.liu@nxp.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
To: Liu Ying <victor.liu@nxp.com>
To: Shawn Guo <shawnguo@kernel.org>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/gpu/drm/imx/dc/dc-plane.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/imx/dc/dc-plane.c b/drivers/gpu/drm/imx/dc/dc-plane.c
index d8b946fb90de638da2bf4667307f11b06f4e77f5..e40d5d66c5c1f0d579a7a1019c0f2e00489ce15e 100644
--- a/drivers/gpu/drm/imx/dc/dc-plane.c
+++ b/drivers/gpu/drm/imx/dc/dc-plane.c
@@ -104,11 +104,11 @@ dc_plane_atomic_check(struct drm_plane *plane, struct drm_atomic_state *state)
 		dc_plane_dbg(plane, "no CRTC in plane state\n");
 		return -EINVAL;
 	}
 
 	crtc_state =
-		drm_atomic_get_existing_crtc_state(state, plane_state->crtc);
+		drm_atomic_get_new_crtc_state(state, plane_state->crtc);
 	if (WARN_ON(!crtc_state))
 		return -EINVAL;
 
 	ret = drm_atomic_helper_check_plane_state(plane_state, crtc_state,
 						  DRM_PLANE_NO_SCALING,

-- 
2.51.0


