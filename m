Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75FA0CD4F24
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 13:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hbjz/P9EeqEKu7DkREpkbPhZkyHIegzkhrcMIfsHnmc=; b=fwEEoDGheNRY6waLuTlmrGLYEf
	PrFnZkooJKhj2mryyhMUzIASlcVRG3hC2gxSOK7Qh32LqRBOWBLHBbeWghWXwsaiU9i6ACMAoDjjg
	uW+z55nwxJnH2at0wF2GbLizLYzg6oyGXMwk4D4PIGAzulLXJs+Kc+rxFk0uwIPdociaI6c0etn4n
	b4vpq+u0hp5qF5285UmlKNMqbRlaQbAWtMUVYxe62UedW+ydvZsCxRrMYqsNKieFBeKSYPoQ09MO9
	itsl9R6cQMFhuINDkkLqtcFSyeMOJylHWWG+t+Yy04O/wILc4jkM0yK3leGWzcD2Gfe3XaXMYMUoS
	52DJUBIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMmof-0000000GkbL-00Pt;
	Tue, 12 May 2026 13:06:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMmoc-0000000GkZZ-1JF6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 13:06:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0C9D94434D;
	Tue, 12 May 2026 13:06:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62E40C2BCFA;
	Tue, 12 May 2026 13:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778591185;
	bh=fl6z0LfliVCc5jA4Pfmq25TAh8lEdW0hYIuxPKlSz3I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pwp2Y9xGBuhGo9kicy3s6VhcvSpicrT6FhoprL8oh65mlR2LmlqZpCWuDnFFSSOc9
	 Go6SQc+gIB7LikhaIsxRGvbS6rHbrsE9p6JsLFKHUjqd5Tt8wcKWgP0mTKLHWshmwl
	 quq/Ez08YX2hKAE7tIaBZZcqG5AQEtbm0gCIvMiY3SMxs1vtWTOX0bd8WNP3X6VIUg
	 SpFNUgcKwG0QExf8lYOZq1/8CwizJTTE4KyxVHHR03Hwhrxe4Xwqty7dN0T9nepMk5
	 ixdP+7KvXpDUk93UwzTv8pxUjbNLbZ6Pl7Nb8GrVqddz7Nbouu7rHjpXEq4TpTUhsN
	 CJjfE8Cg/Glzw==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 12 May 2026 15:06:02 +0200
Subject: [PATCH v4 04/20] drm/atomic: Expand atomic_create_state
 expectations for drm_private_obj
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-drm-mode-config-init-v4-4-591dfdcc1bf9@kernel.org>
References: <20260512-drm-mode-config-init-v4-0-591dfdcc1bf9@kernel.org>
In-Reply-To: <20260512-drm-mode-config-init-v4-0-591dfdcc1bf9@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1304; i=mripard@kernel.org;
 h=from:subject:message-id; bh=fl6z0LfliVCc5jA4Pfmq25TAh8lEdW0hYIuxPKlSz3I=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFnMqrubt0rsU7siusStsmW6wf+EOktr9bkqIelMf6/Pb
 Yu8sSO8YyoLgzAng6yYIssTmbDTy9sXVznYr/wBM4eVCWQIAxenAExENZyxPuN35dHzT/J3fpAu
 LgiPPXFJ6iIX37SHG+R/7pyQWsm67pru1YzSk2X+jXFrPjMX+STuYWzYZlbcp3cwJjmo+XhRbH2
 Q/Oky9Suu4T2fuEt3HZDbceR+rJrc+oo9XHbXfk3vfbQqYCsA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_060626_394664_5A7B355F 
X-CRM114-Status: GOOD (  12.41  )
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


