Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54090CD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 16:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4/rknBNr70r45if1QwPBArgyzcEF7A8MyP7dbsi2SYA=; b=h+fCFyL4/CGCQ30Zw0aMqNpmlr
	okXQn5r80POpHRCcMEO1AWog9jUVBgv4t9b3OGqsFaHAWoxvAZVV+3AQQJadQBbvHD/cz8TJikIWC
	2jY61KFNsOUYl+6rfR+L6O5rGjdJvwtADnonMhDYgR0qNUrnz1IjoVBLpJZQ3Iii+v53NDyV0x9rr
	sPNJ+VdcznWXRGs4fCP1mkjWgYlf273Vf9Qz8sZLTtOgyT3DRv3Kj0TgVjJmGvl0LsH3s4ziegWKY
	BpWPRqeunS6CNOQCMk/qivVL/BLtgun+Wc00jamwzu6AyUtl07f9k0ZuAYpUuW80hXlK5LmeRJlBP
	lYZwukyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRuvT-00000002ZAv-04W2;
	Tue, 26 May 2026 16:46:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRuvO-00000002Z5h-0IbQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 16:46:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A464B408C2;
	Tue, 26 May 2026 16:46:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5F1E1F00A3C;
	Tue, 26 May 2026 16:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779813997;
	bh=4/rknBNr70r45if1QwPBArgyzcEF7A8MyP7dbsi2SYA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=FKmn1x8yq/bfAFI7Fj7fiincoLAsfTL3wwRPaGECMnMXoy5wP47rCWjrZu2cJ2khM
	 KAlZPOyBZvQBAP/1tK75tnd9c80a4OHxBMqxkYRv4QpMLISI+A9/l7uXcR4f6evcKc
	 dfQNu6owihUzXsq1yNDbDMPqLbrcHzX420WiMBYQ65MciWBt42srQxMjw+LbPfvawL
	 u9ZQHZIjagKcgNzElR4iQViyKogmHeZneAEREbqNzpnYV9rykV+7G97G7VSATIba/1
	 2t5Mq6WHiE6SGtZAdkgQujSff2x3K0kgz/2VLPUyi0RsHF+DyVL3Mc4LMMlWpVU7Y5
	 XMe4+HgbjeDiA==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 26 May 2026 18:46:16 +0200
Subject: [PATCH v6 04/19] drm/atomic: Expand atomic_create_state
 expectations for drm_private_obj
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-drm-mode-config-init-v6-4-852346394200@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1358; i=mripard@kernel.org;
 h=from:subject:message-id; bh=n/67GQpj0Ru2mlwt0tlSurG9lxXxNQPovYWI32eOrM4=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFmi5yJ2tyjZc8RMj/+xfcGkDE1t70dzDrAuf7fnoJPqi
 UyRwvxFHVNZGIQ5GWTFFFmeyISdXt6+uMrBfuUPmDmsTCBDGLg4BWAi3fcYG/oiO/Ybtd/kTs/b
 +TQ3T/P0or5lp+Z9MUm9nVx3Js0joWP+XN2DVyRnv98TY3tQbJblQcaGF/u4//hcaLc3U1XjDAy
 y7Lh56fp5vYl2f28e4DP62cAYF1CWFOP7/ZWO5+a9VhtYw1gA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_094638_169522_D51E3858 
X-CRM114-Status: GOOD (  12.64  )
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

The atomic_create_state callback documentation for planes, CRTCs, and
connectors explicitly states the expected behaviour: the returned
state must not be assigned to the object's state pointer, and hardware
must not be touched.

The drm_private_state_funcs.atomic_create_state documentation is
missing this clarification. Add it for consistency.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 include/drm/drm_atomic.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index 1a80a8cdf269..88087910ab1a 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -263,11 +263,14 @@ struct drm_private_state;
 struct drm_private_state_funcs {
 	/**
 	 * @atomic_create_state:
 	 *
 	 * Allocates a pristine, initialized, state for the private
-	 * object and returns it.
+	 * object and returns it. This callback must have no side
+	 * effects: in particular, the returned state must not be
+	 * assigned to the object's state pointer and it must not affect
+	 * the hardware state.
 	 *
 	 * RETURNS:
 	 *
 	 * A new, pristine, private state instance or an error pointer
 	 * on failure.

-- 
2.54.0


