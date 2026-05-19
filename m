Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B54F3CD5BA8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 09:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hbjz/P9EeqEKu7DkREpkbPhZkyHIegzkhrcMIfsHnmc=; b=QU3d8yvk3ObNWT9KaXVda/uvTr
	VOOA0MHPdt3pQOf7RMGOfbKEeekEjb9MOLxzHwSHSduShzTXJ+eMZRdhcvOOFftce7DNfn7JbZ0Sr
	lWPqCmyquHSYo9C/wGIRGJwK/ytx/+INL6djI+mujAsMzZW/Pnzn4oijwmFRuFUudebsXBLFjm84s
	erlsy3Szv5UemxpbpfYG6wlBVd5oAfNC+FRQk7pznSPOl8EV61ifnD4xuNfXiPWN2eOwF6u5PKcMk
	90tIn1wc9g11AV07uBX4mTmkmrOctILC0USOCBAQO7AAY3idXi1ShoHqz/lNDWIaZCfd2jpf2x/KN
	dK2S3IbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPGLF-00000000oA1-1kn0;
	Tue, 19 May 2026 09:02:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPGLC-00000000o7C-3sqs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 09:02:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5522F60212;
	Tue, 19 May 2026 09:02:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C8F1C2BCC9;
	Tue, 19 May 2026 09:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779181338;
	bh=fl6z0LfliVCc5jA4Pfmq25TAh8lEdW0hYIuxPKlSz3I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=B/6XRxVF+FpXQgL8BoJZOxX6PVLvnqXcsrd7aLXxExAs8GRPQ9CLlfcqbTGi1aZgw
	 ZvZS5+LjJmcy49xtL4NJDuxDbrfdkZQCaP4NpBripws3Lo2v5CC+w8MCKumU3pA3gU
	 HWW/YgYYSojKyLA9pgVrpfYADIGvQq0NUvmepK08wkARd5aJqMSHhbfvVNOHApvsiU
	 vS+iA3n8Tq7QHsiPuIPwvOpqJrVEDPsnV9QatXFBid7F8dtNcHA415gx/iZC/yfu55
	 c01zMxgDbOd5jARw+tkOAbMkolUJc6qWDGm92ntPCZpl9McMRmQeVpzSKul5yFSV+p
	 hd6gBghJJ2fyQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 19 May 2026 11:01:46 +0200
Subject: [PATCH v5 04/19] drm/atomic: Expand atomic_create_state
 expectations for drm_private_obj
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-drm-mode-config-init-v5-4-388b03321e38@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1304; i=mripard@kernel.org;
 h=from:subject:message-id; bh=fl6z0LfliVCc5jA4Pfmq25TAh8lEdW0hYIuxPKlSz3I=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFk8ar9MTkz7x6t9ZtrV2l9XAjkUQoTSGrxtGl4vmRXMZ
 SZeVazeMZWFQZiTQVZMkeWJTNjp5e2LqxzsV/6AmcPKBDKEgYtTACaimMhYX53Parrq6BOfv7fX
 Ktq2P53w6cuX+7pq+gr5kd+/WAifelDpoKAgICGme2belts22RJLGBs2W8owecovKa9rjDyWYT7
 37n2HyYtnlRe3P8y+teAOw5HMmO0PdisYf2brNO2+v3HdOjMA
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


