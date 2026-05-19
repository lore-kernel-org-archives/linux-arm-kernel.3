Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 959FCCD4F57
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 09:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GRd96EXhOSoBXp1q9HwyqWH08BwhlsDix7/jEXz9dPg=; b=DmxL44y/sWDYQt5K8itsKCfYOr
	0vngKBuMKmrUk+WzVNRDne9m76rWluPqg+LFY9I0j0nzlrWPzw5StbZFfEnEsa6+KB+hlRP8Pb+GE
	AvfJ/ZHPi+S1/Aau1H9hoMhJmIksj/aXWnBMwLxEtGsNogz94Tpk1n9wBaQwBLDaGCnPPLcJaXkoZ
	rv6ufe36OMT15WyBvxjNv7YX4SM20bG/B0aaES4fpECUy5n88nIPuwIh13iKvaw11BrufidA1WPjm
	rlHXfW8XGAI2sJQlCDK6d2oHGSk7UZD2HpgfaTuae519U6spwWa20Lg1AVfvRvHwP+rkGnxwb3VLa
	S2FNyaVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPGLF-00000000o9h-1E6m;
	Tue, 19 May 2026 09:02:21 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPGLA-00000000o5f-0ceY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 09:02:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7703660221;
	Tue, 19 May 2026 09:02:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D2BBC2BCF5;
	Tue, 19 May 2026 09:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779181335;
	bh=8gKR8nH9fdwkklOxC1orkJLxbt3pf9ySjt3LJ0StlRk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=RCdZ6qWgczr9dtq+2SjsDchNxEuvhhSfHUYAWOl/VQZeUnZiuHMV//qLrp2iCS6Fx
	 X82N74LJqGTZ6QMlK9Et4b2MSMcl+1BuxoAQyI8Ns8iujfQlJ+w6FVyrU+IQpAloG0
	 3o0oda4ixqW8X+PchhhqBakBq5m4CPOUR73ooMSIaxP8mfAMBDoN/gTbw3pLaqntFu
	 9bRcRCN8q3DXLwUlLwkBDOclaslXcODv7obK/Ij/TnduCkAM6uNOd2V68saM6OJ5DP
	 wrcaTqB3L9/e2PRHwRNLgRH1usJWwDNmIfNRwE98f7VfCxMkROYtscsIiBJArMQsTn
	 jhlh42DHf/8Rw==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 19 May 2026 11:01:45 +0200
Subject: [PATCH v5 03/19] drm/atomic: Drop drm_private_obj.state assignment
 from create_state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-drm-mode-config-init-v5-3-388b03321e38@kernel.org>
References: <20260519-drm-mode-config-init-v5-0-388b03321e38@kernel.org>
In-Reply-To: <20260519-drm-mode-config-init-v5-0-388b03321e38@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1621; i=mripard@kernel.org;
 h=from:subject:message-id; bh=8gKR8nH9fdwkklOxC1orkJLxbt3pf9ySjt3LJ0StlRk=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFk8ar/i5iW5bI8RdJHYE79ik8CcL5mW7etsg/9Ps/p6Y
 cO1EpaojqksDMKcDLJiiixPZMJOL29fXOVgv/IHzBxWJpAhDFycAjARzSuMDfvCS7I3FVbu8j7l
 n5F+1MJl8cqiRx0HZgY8WOH58CDPxBmLmybc4HYRiY07zdkee1plDmPDskS/ukKVTjZ9njRB9im
 KTrUh9it/3EzJWGp7SuIS4+Kc+vNiNkwfnln/f7dkfs62SycA
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


