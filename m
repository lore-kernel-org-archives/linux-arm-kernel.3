Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A17A8CD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 16:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7G0AvhnldznKjlOkg6oJndKDwtDSJwo/+5wcviSKhb0=; b=4cmlZ8hfFP/tle6Sey3h4V4s1n
	Ib46f8hPtMllwkKbdzTP6h5FEuLsm+74CoWVvXGrVvUSGhmx+vicSgdgEprfjeSAbx7ILEjBFj6Ap
	ExXbZVF8x/B7Bd3417+EtI6fTV7DrXMtYIaLPJ2z1JqoXes9ld6ATljt1cvnVUzDreUJCXgmmyybo
	TuNw+t53z88M8P/Fy/OtU3bafLBDj+CB3MQwFMep+Ss/JF8fd3M8ngeqxH1fNqnxv4MJwbf9bAZGE
	01kN99568GG+EAykpm9AWBFzTbghKqJCZ+mCEAWZ6+TycyjQ/It04w2JhTs9ui/nFb0PfFz4xemGV
	X0o2fxVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRuvP-00000002Z7Y-3LQh;
	Tue, 26 May 2026 16:46:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRuvL-00000002Z4q-2UfL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 16:46:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0D9BD600B0;
	Tue, 26 May 2026 16:46:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CE721F00A3A;
	Tue, 26 May 2026 16:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779813994;
	bh=7G0AvhnldznKjlOkg6oJndKDwtDSJwo/+5wcviSKhb0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=DVrVj7lbOQdEd3pO6dhrQAFwfkj63ibCFZ5MR9wHykOKdFO8YY/d6iPHimL+SfFku
	 mEZmfGzj7IHHugR73kZUmQkWhP6O4Br5xk52iR+cxTUruVtZ+5hseOHeepBpreKuGN
	 w6ES52oWhL1z85e44LmYnqrdaZ6zmg5AqZ7iumjlR1NJcFsL8JlQDw3DT6hf6+omxL
	 2y9JgtWenDtqtyPcaYZAWUjnCXZJQel+5dOLKz7x8oPHNZhadWmZBJO3l23eD7zE6i
	 rG6FYwBp2JZgMIQkYIcBPiyFv9CB98oHj2++w2BuwEVFsfRsiS00KNwKS/NSVlNSsh
	 lN0uMT8Q6y/Vw==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 26 May 2026 18:46:15 +0200
Subject: [PATCH v6 03/19] drm/atomic: Drop drm_private_obj.state assignment
 from create_state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-drm-mode-config-init-v6-3-852346394200@kernel.org>
References: <20260526-drm-mode-config-init-v6-0-852346394200@kernel.org>
In-Reply-To: <20260526-drm-mode-config-init-v6-0-852346394200@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Simon Ser <contact@emersion.fr>, Harry Wentland <harry.wentland@amd.com>, 
 Melissa Wen <mwen@igalia.com>, Sebastian Wick <sebastian.wick@redhat.com>, 
 Alex Hung <alex.hung@amd.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Chen-Yu Tsai <wens@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Daniel Stone <daniels@collabora.com>, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 Maxime Ripard <mripard@kernel.org>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1675; i=mripard@kernel.org;
 h=from:subject:message-id; bh=u5HTzQX3tbGR+9Qa/HlwJij4QSF7J0Dnsbadygh24+g=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFmi58Lfzo24yJ29TJ5t2QSWQ4vkPGe/V/hwrcs8N+zqv
 iurco77dExlYRDmZJAVU2R5IhN2enn74ioH+5U/YOawMoEMYeDiFICJlEsxNmxpXMwz/7fl+7On
 1718fcJtx2Rfj5kHNyd0LLHlmuJw0+xH2PluRoEM9qf/7jVHHdS+N5+x4cn6HZZMtbLaRp0PAzi
 upCxkrZGZrd8/ocruEof355WvVINyPqW5lHpV/zVjO/J8/iZ9AA==
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

The initial intent of the atomic_create_state hook was to simply
allocate a proper drm_private_state and return it, without any side
effect.

However, __drm_atomic_helper_private_obj_create_state(), which most
atomic_create_state implementations call, introduces a side effect by
setting drm_private_obj.state to the newly allocated state.

This assignment defeats the purpose, but is also redundant since
drm_atomic_private_obj_init(), the only call site for the
atomic_create_state hook, will also set this pointer to the newly
allocated state.

Drop the assignment in __drm_atomic_helper_private_obj_create_state().

Fixes: e7be39ed1716 ("drm/atomic-helper: Add private_obj atomic_create_state helper")
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic_state_helper.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index cc70508d4fdb..a82568d87e4f 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -729,12 +729,10 @@ EXPORT_SYMBOL(drm_atomic_helper_connector_destroy_state);
 void __drm_atomic_helper_private_obj_create_state(struct drm_private_obj *obj,
 						  struct drm_private_state *state)
 {
 	if (state)
 		state->obj = obj;
-
-	obj->state = state;
 }
 EXPORT_SYMBOL(__drm_atomic_helper_private_obj_create_state);
 
 /**
  * __drm_atomic_helper_private_obj_duplicate_state - copy atomic private state

-- 
2.54.0


