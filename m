Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8B6FCCA470
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 11:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9rZzIhmUINX+6r7vzXoPgwZB+28HSp1mrZaIAdmFAb4=; b=griCCYRHUT6F+xv0flV3XMYBh4
	EEEB95GYt6wHtLA0pvi9dDkLMjogmz+GztWoFYm2ybDLEUpkrKs6FAG4zHSiPW5xWRqJWnFc2rvCg
	GE9zHUYEq7iAaVnhdIfApI+obabFyQnAoXZuBdZwUT5IyEFr/is3xVsVzNp6MNpN99VQNPPAemOtq
	b1zESPCjQgbewLj+QTJxv6oZ77CtEeMO2uRyaXukraRzhpfKgYOHuDEBkZhj7OCFniCbgDjMlT5+l
	b4AHEBTqUwjv+5pogP+2iJR5C7taqp2OUvPNdC/s4m+ayEQzanIn08GGcAubkOQF0wP1ULk+e5DRL
	RiaPuKOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Y6t-000000055LU-34pu;
	Tue, 30 Sep 2025 11:01:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Y6q-000000055IX-0H8O
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 11:01:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 250654188C;
	Tue, 30 Sep 2025 11:01:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E664C4CEF0;
	Tue, 30 Sep 2025 11:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759230086;
	bh=gngwj7kF8pArqtb8nuySJzzwxV0Gy2AND/UvRSwqInc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mlfATGlYGaiMycFuMPsN2DSxtU3+j4e41bdssv+KKh7YEbforZ2OVz7xU8DSHgLtT
	 bo+LSmsycWpDMW+oPYvR2jmsOTI34vQey0xjAqmOPfx6WXXHP5jjA42qdy6g0Iq7wF
	 96hOnpFxSeH5Fk/eYUWfs3gc0ckHMYbOk0ntRrlGLSZ1sHXoLv5wfqgvv8qQrobmLn
	 gRzr0I6BINB5kEXohW/kYTVftC1sqgyFR83g7PPzqWAkcXjrvVJ0zlgqpW4LyehS4N
	 KN5qo0cmecMARdZcuZVGhR4jx7O/TnbT4PtD1yYT+VvXfGtmkPU7kKIN3+t5iuPYz8
	 o9YtGDgPuFWHg==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 30 Sep 2025 12:59:43 +0200
Subject: [PATCH v5 28/39] drm/sun4i: Switch to
 drm_atomic_get_new_crtc_state()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250930-drm-no-more-existing-state-v5-28-eeb9e1287907@kernel.org>
References: <20250930-drm-no-more-existing-state-v5-0-eeb9e1287907@kernel.org>
In-Reply-To: <20250930-drm-no-more-existing-state-v5-0-eeb9e1287907@kernel.org>
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
 h=from:subject:message-id; bh=gngwj7kF8pArqtb8nuySJzzwxV0Gy2AND/UvRSwqInc=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBm3d2iXvpTc46J47dNEF8uSp5ffzauud9XxWXKsqvmk+
 KYWk7bgjqksDMKcDLJiiixPZMJOL29fXOVgv/IHzBxWJpAhDFycAjARAwXGhrWBGu8nX4rnuN/m
 WZ7reHpZ9Npm1gjtkNrIKRNvNHsUl50+5tzQeWNTmOa/fbFKeq8vM9ZKpx1NWNxV4Z79PfqI79w
 teyzOLRPSFQ27GvLUy9tWRjDNxfdcJk/V5wuOuxZcuJCzdTsA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_040128_146582_D99D0C9D 
X-CRM114-Status: GOOD (  13.02  )
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
2.51.0


