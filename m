Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42B3CCA1009
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 12:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b2Bu45EMptKaV6Iz+WzxMyHdjezkzfoMs78rWYricvI=; b=BLZCDamh2lHVDiPqKoR4gJt2fj
	yRC22QiLHNExz4lkW2CmWgc2XxjNEvXKRsbaM2p98lQfYToSqT4OBS22V/WUj84Gt7/xwxVbm2sfY
	/acaBLrg0ZMB0eQxcNtEW+JgqLDG7+vTDLZUWbfY/fR5VnN0HfNIYJuwiy4fFdeC+OMlmR74bBtKa
	PmzfzTsoJpr5n8c5MvhGC1QO9XJV4xhAqpyB9mQTRkjRTQ8mKEjf4qTwgDWN1K1hJ4U1CSzBAp3Ah
	MT7mWX1VyMNbOSdNnQB+dwhf8nHL7pTuM4cKV3li5+zBjEpYdGGrXynoBcZ2AmEWB1mlGeKZscIXG
	QR+9dCQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utQ8u-0000000HGsX-1iqU;
	Tue, 02 Sep 2025 12:29:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utNQy-0000000GQC8-0xLz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 09:36:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A42D96020A;
	Tue,  2 Sep 2025 09:36:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0975AC4CEF9;
	Tue,  2 Sep 2025 09:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756805771;
	bh=hPhAjWEc+3mn3zIUCeAwRlMFSA1u2GmJtj3ldi3xpVc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mU7R7Foh1322i7dUQjowaFQHdNVeALdYQdWJMsjRa+g8Vzejt1J03iyeVb+r2HbLv
	 KcEkMNws3+JaIa+Azxj+zr7YHk35Ywq2wRxYvqVHcIKAzrdDGUHXNHrjSL12j4HLg1
	 2X61sSc1oSss4itOh21My8B4ZjS73BuwVViR6TjXRSg4HndwDVd/exzbeFx5vC1Ucr
	 rBxskWW6HRzOdKtEZ2DO+IFnd7DiZ62+PWmV06W+bOM3pLFzbYUFMNry7/0eFsdi33
	 LEGvObMensGKEjvafStWIqgjIeDWsknMSGyqOYtON1TJmvuPXkGFaaKnCkR8eySXMq
	 7bhahbre75Vzg==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 02 Sep 2025 11:35:16 +0200
Subject: [PATCH v2 17/37] drm/imx-dcss: Switch to
 drm_atomic_get_new_crtc_state()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-drm-no-more-existing-state-v2-17-de98fc5f6d66@kernel.org>
References: <20250902-drm-no-more-existing-state-v2-0-de98fc5f6d66@kernel.org>
In-Reply-To: <20250902-drm-no-more-existing-state-v2-0-de98fc5f6d66@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Lucas Stach <l.stach@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1666; i=mripard@kernel.org;
 h=from:subject:message-id; bh=hPhAjWEc+3mn3zIUCeAwRlMFSA1u2GmJtj3ldi3xpVc=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBnbdgXf4PKPL9h8LCEo7a4804e1IY5qS558+P6zL9/t0
 ekzf/YwdExlYRDmZJAVU2R5IhN2enn74ioH+5U/YOawMoEMYeDiFICJzDVnbDhyYF6WEtsiFjb+
 f9WrY4RtTjrdyJ//e1OHyhHdBxOThOTW9acl/7GZ5d4f56+1+X62EWPDTPcSdbOYr9bcUwM8b35
 6ayQ+aWpDxM0i7gollv1Cr63sEio+7FiuHhcsVOyTtfT/1igA
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

The imx-dcss atomic_check implementation uses the deprecated
drm_atomic_get_existing_crtc_state() helper.

This hook is called as part of the global atomic_check, thus before the
states are swapped. The existing state thus points to the new state, and
we can use drm_atomic_get_new_crtc_state() instead.

Signed-off-by: Maxime Ripard <mripard@kernel.org>

---
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Shawn Guo <shawnguo@kernel.org>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/gpu/drm/imx/dcss/dcss-plane.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/imx/dcss/dcss-plane.c b/drivers/gpu/drm/imx/dcss/dcss-plane.c
index ab6d32bad756d080e1c56d7574403febceff94f4..3a063a53c8dfa6bc5bbbf9afc7ff6519199c2f19 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-plane.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-plane.c
@@ -157,12 +157,12 @@ static int dcss_plane_atomic_check(struct drm_plane *plane,
 		return 0;
 
 	dma_obj = drm_fb_dma_get_gem_obj(fb, 0);
 	WARN_ON(!dma_obj);
 
-	crtc_state = drm_atomic_get_existing_crtc_state(state,
-							new_plane_state->crtc);
+	crtc_state = drm_atomic_get_new_crtc_state(state,
+						   new_plane_state->crtc);
 
 	hdisplay = crtc_state->adjusted_mode.hdisplay;
 	vdisplay = crtc_state->adjusted_mode.vdisplay;
 
 	if (!dcss_plane_is_source_size_allowed(new_plane_state->src_w >> 16,

-- 
2.50.1


