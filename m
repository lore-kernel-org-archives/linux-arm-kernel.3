Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A94DDCAC582
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/qnelg+iyuYOHhMdwesPiRlG/MAvA9ItSMebyHKzKBI=; b=0y9K5Hai7hJEBOxuOx6s9erhPo
	XBQwZWIBd+BPDAaDlES9IJNoYzYtAyPGXas4OHxJeJ/pxV4c+RN2S/AGouabDsowaAfBSGF3QEBZd
	7zbL06tL37R3B8FLK1MWzAPm3NSGEJ4xKM80kSy5Mm6y9w/1LVzFu7NOxzqbsTdXgopac+wvRzJRW
	l2CvBVPbJnPk3jP2ryCn62glXQo1y4NRS53stBwsTicpGepaa723xuHUnAm497U4moXHO7Q0itmbA
	plQYDMjWGKIcgnXbtNKfAMkLNSykUJS1ySjv9vrb7qBdaE14I7OzBIM3abfKwLuu4EHecVXwuN28x
	ttN6FLsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1wY-00000008oh3-3HTy;
	Tue, 09 Sep 2025 17:15:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvwWc-00000006jjn-1bzq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 11:28:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1CE9043212;
	Tue,  9 Sep 2025 11:28:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BE04C4CEF5;
	Tue,  9 Sep 2025 11:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757417318;
	bh=Xt9GN+/xZKOUgTMtYp5d8PS7tZ+kMJnz05B0hpJDY60=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=e2/1HPXWnQvVclWQCL2eZF/q8pXOnAwqwS6NlyDKxRjTBcJyh6gP0uBhJQ8RAqSew
	 v2YZVgc1Lw/hR2FGTz+UtSJdHtIomcRAPzVAjqCpdhmQxKZliuW8m3ofR/TZNQsMhh
	 bdvES6HGlRHDcYezxg220cY7D0sJ3vW4JBKIue5/bySqQhbUbjTcHx1X3H5L8RtoOJ
	 0LSBbU4yfSM5Sizg1fH4/0WwzR6LDYLZHCeGKF/K8qqr+wLTj44Cs4or2+LtyqqqN0
	 jsrN7u7R9a4wBK/430pPfk/zGoGt/uTWab6TwFe7KImfbUM3WLvARJMKgjgQyRZc65
	 0g4sUWulXDSsQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 09 Sep 2025 13:27:36 +0200
Subject: [PATCH v3 17/39] drm/imx-dc: Switch to
 drm_atomic_get_new_crtc_state()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250909-drm-no-more-existing-state-v3-17-1c7a7d960c33@kernel.org>
References: <20250909-drm-no-more-existing-state-v3-0-1c7a7d960c33@kernel.org>
In-Reply-To: <20250909-drm-no-more-existing-state-v3-0-1c7a7d960c33@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1596; i=mripard@kernel.org;
 h=from:subject:message-id; bh=Xt9GN+/xZKOUgTMtYp5d8PS7tZ+kMJnz05B0hpJDY60=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBkH+DUPpa/LZVKzMTT5X5z39enilfeiOX/+ZlUP9LIxs
 c0Pfs/XMZWFQZiTQVZMkeWJTNjp5e2LqxzsV/6AmcPKBDKEgYtTACZy1ZuxPrvObdNai5lb9Kyl
 3apry96Uua22r7o5KaPuywWZ2jTlZ9YqwvlsWt+1orVfWCd6zpnI2LDxi0aj6YbXH2YoVHwXPh7
 FOHPrp6xvn3hWvjDd39rBobDXvKYwOGniTFPv928dAjJyFgAA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_042838_472242_5B27E02B 
X-CRM114-Status: GOOD (  12.05  )
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
2.50.1


