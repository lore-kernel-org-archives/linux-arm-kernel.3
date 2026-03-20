Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B45F110987A6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 16:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qVW7aMdWSrQZk1o6CijExdma+sCs65ka0vaIz7FaBPM=; b=A5jUTwgYIFScnfMaSyGqjdBwYo
	K0BQgO+qRUETgOjpNe48gvhPyaAsiTIVHkhjQNpJwhuMdZuZwkKcQwVq9eoAhIN3Krb8k1trmTJgv
	tpwXpCYq4Ik+rt2pUYrVb3F4kZhrplXPnqJCQkQwF9fTV4Ob49PfCaIGvFLnd+Fq9ZbnDV1iOQ3Gw
	cE3awh54dQ6oPZYuaJ55XmS/4yQGCV3oAAbS27UenZjvF8bweWcFHBB70Z3xv6cyzh5OBscabIaTC
	UyNqRguLF7l+EBZZ4y7+sNRTzq7tso7WErKxbe39ptnfNcr/R3BaxCBZ/tRmSrbkdzMuvM7k8VrEA
	jWIURWyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3chD-0000000D7cj-1WxM;
	Fri, 20 Mar 2026 16:27:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3chC-0000000D7bm-0Tan
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 16:27:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3D6F861850;
	Fri, 20 Mar 2026 16:27:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 835B8C19425;
	Fri, 20 Mar 2026 16:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774024053;
	bh=H+nAyAHG7r+c++BxBGG12xBnveAJ4BFIOThMlPVrju4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=n+jGhnRW032yI4TUKZGdS9Ogindi4qhXgdcN8dCcLhblct54XXcPInAz7SUNUpt/c
	 BFTtx0Hqfpo6vyb0sjnuAmTpFfoEmMninyJvtFw2++5Meyd/Lk8gyPcG0GWPoe6xOB
	 SQwkFGOerwleCoL8tFvz2maLjl6hAlgD1qg2bjHGqo5kwC2bPjo0oSxzewHFqb1HNa
	 elgEIMFa2Nr4sre2tKv9z9Zv2P6G095/VgDUGUBQfPYvYn5+F09fjI/0u3ESDgDd8b
	 MR2cChEG65XL7Fd24g3Ek8o0pWYZijVzm1bELRjnnKm8Ioc+MGR8bkvMTROnvzxXky
	 VZJwKm9XguWAQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 20 Mar 2026 17:27:09 +0100
Subject: [PATCH v2 02/20] drm/atomic: Drop drm_private_state.obj assignment
 from create_state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-drm-mode-config-init-v2-2-c63f1134e76c@kernel.org>
References: <20260320-drm-mode-config-init-v2-0-c63f1134e76c@kernel.org>
In-Reply-To: <20260320-drm-mode-config-init-v2-0-c63f1134e76c@kernel.org>
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
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1530; i=mripard@kernel.org;
 h=from:subject:message-id; bh=H+nAyAHG7r+c++BxBGG12xBnveAJ4BFIOThMlPVrju4=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJl7S1P+Pu433BjQ+OdChu/T5++uBT/p+Png94+XizZZa
 /dO2Rlu1jGVhUGYk0FWTJHliUzY6eXti6sc7Ff+gJnDygQyhIGLUwAmktXDWB87WyvqzpTTF1Wk
 LX7oWMcZRpSYRB9oPWSiqLJrqU0Rl/6ylk1LFy/0VDx904tRqTWwhbFh3nNHz4Ruey9n3k29Npq
 Zlgf2iW/fe/aKWPWEy5N2sCjsrLH9cvRp0eHk63Fx07fsD9kKAA==
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

The initial intent of the atomic_create_state helper was to simply
allocate a proper drm_private_state and returning it, without any side
effect.

However, the __drm_atomic_helper_private_obj_create_state() introduces a
side effect by setting the drm_private_obj.state to the newly allocated
state.

This assignment defeats the purpose, but is also redundant since
the only caller, drm_atomic_private_obj_init(), will also set this
pointer to the newly allocated state.

Let's drop the assignment in __drm_atomic_helper_private_obj_create_state().

Fixes: e7be39ed1716 ("drm/atomic-helper: Add private_obj atomic_create_state helper")
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic_state_helper.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index 76746ad4a1bbb7142c067c93dd05fbec5d2f98eb..875149494b00e1eb7481e87d7d7038103b72b7e3 100644
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
2.53.0


