Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AC62CD4F57
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 09:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WdaviV+O7Bjo5RQa97oOXR2ECAgeFLrWLNJ+lsCgFqA=; b=KfOv96oP1WvVyP3vETFSfwDTIl
	SZ1xZnyTeUbTNcZqDeDZ9csWV2jxWkvliBrHfVzpRsZHAcAbL6D6Tnh9XbvkWt1BLOEDJnzLNdFXk
	wmbAA+Jo49Lo5C7Zy1hztQa/FOGdi6eeB+9lYeR0+26D3mVD29h1wfACErN4Pjv/+FDB/Ck3G0MDr
	YwEHqmEOYKg1a8Z8s7Tt2zasiWfOcgrCGJrVcCUPQWkBDT+0EluKrkQkCbsMn1NoHpViK2HhOYh4X
	CzARnabIQVJQzVjVP8mvITWlggjUbWwn6jgS8nHFEgYfWOEKPx9E29DFVa+FZlui7uoS6pKTwzRwO
	SdvB+jhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPGL8-00000000o3v-0ArH;
	Tue, 19 May 2026 09:02:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPGL1-00000000o0b-3xuN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 09:02:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 57A8960126;
	Tue, 19 May 2026 09:02:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AEB4C2BCC6;
	Tue, 19 May 2026 09:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779181327;
	bh=0OYumzFDqexo1pjs+gvzZZRkn4Y7gOK0JvJLauSsQbg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=REjXKBIJQ+ansyM59AqnN0Qca1t7NPkogpLrXuY5UDdZDcVEzLJB4SaZPP1mhQMqz
	 i3iQL6JA85QRaTTdfhoou9tZJl1nVm6NJYLKMug6Taw2Hgkrx1wMDpjUBDK//IMcsi
	 fd75DUm5J0pkAvXxb6kB+iLEunPTX05aiez3pXg2LADpwZxrNM3gVAW4yHQJxPg10M
	 G61isNgerrAaTPHsDJNBHa7rQgzflVOiBceRz3dkdmHuYxXslhLbVncnSEh6eoHqnz
	 Fa5PCZPXluhlWRr0uUJncKgpj9s8NpTIXKB5EQiPjvYI2cg8MZnTqAbX4FayoaXkem
	 CuITPpYHyhGVw==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 19 May 2026 11:01:43 +0200
Subject: [PATCH v5 01/19] drm/atomic: Document atomic commit lifetime
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-drm-mode-config-init-v5-1-388b03321e38@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4499; i=mripard@kernel.org;
 h=from:subject:message-id; bh=0OYumzFDqexo1pjs+gvzZZRkn4Y7gOK0JvJLauSsQbg=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFk8aj9PzeYx/LLLU05Cu5aR+Xu5WYnMMv2G8lUsJf8tf
 /0X2rO/YyoLgzAng6yYIssTmbDTy9sXVznYr/wBM4eVCWQIAxenAEzkSARjDY9Fb4LSd7fJ3pX3
 LFw2uAg0Jvb1VJfuv6m3+6zE9SPRpb4VhtnT3zs2Cks/XLSRe/JVxvq6gtuW207ucnho8pJb9rb
 2oh1Ns+M4dA/l7be9whp05Ya00Kzu2NtqDDO6172oy5i+5iEA
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

How drm_atomic_commit and the various entity structures are allocated
and freed isn't really trivial. Document it.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 Documentation/gpu/drm-kms.rst |  6 +++++
 drivers/gpu/drm/drm_atomic.c  | 58 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 64 insertions(+)

diff --git a/Documentation/gpu/drm-kms.rst b/Documentation/gpu/drm-kms.rst
index d22817fdf9aa..36d76e391074 100644
--- a/Documentation/gpu/drm-kms.rst
+++ b/Documentation/gpu/drm-kms.rst
@@ -282,10 +282,16 @@ structure, ordering of committing state changes to hardware is sequenced using
 :c:type:`struct drm_crtc_commit <drm_crtc_commit>`.
 
 Read on in this chapter, and also in :ref:`drm_atomic_helper` for more detailed
 coverage of specific topics.
 
+Atomic State Lifetime
+---------------------
+
+.. kernel-doc:: drivers/gpu/drm/drm_atomic.c
+   :doc: state lifetime
+
 Handling Driver Private State
 -----------------------------
 
 .. kernel-doc:: drivers/gpu/drm/drm_atomic.c
    :doc: handling driver private state
diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 170de30c28ae..d98586d89bbe 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -45,10 +45,68 @@
 #include <drm/drm_colorop.h>
 
 #include "drm_crtc_internal.h"
 #include "drm_internal.h"
 
+/**
+ * DOC: state lifetime
+ *
+ * &struct drm_atomic_commit represents an update to video pipeline
+ * state. It's a transient object that holds a state update as a
+ * collection of pointers to individual objects' states. &struct
+ * drm_atomic_commit has a much shorter lifetime than the objects'
+ * states, since it's only allocated while preparing, checking or
+ * committing the update, while object states are allocated when
+ * preparing the update and kept alive as long as they are active in the
+ * device.
+ *
+ * Their respective lifetimes are:
+ *
+ * - at reset time, the object reset implementation will allocate a new
+ *   default state and will store it in the object state pointer.
+ *
+ * - whenever a new update is needed:
+ *
+ *   + A new &struct drm_atomic_commit is allocated using
+ *     drm_atomic_commit_alloc().
+ *
+ *   + The current active state of all entities affected by the update
+ *     is copied into this new &struct drm_atomic_commit using
+ *     drm_atomic_get_plane_state(), drm_atomic_get_crtc_state(),
+ *     drm_atomic_get_connector_state(), or
+ *     drm_atomic_get_private_obj_state(). This new state can then be
+ *     modified.
+ *
+ *     At that point, &struct drm_atomic_commit stores three state
+ *     pointers for any affected entity: the "old" and "new" states, and
+ *     state_to_destroy. The old state is the state currently active in
+ *     the hardware, which is either the one initialized by reset() or a
+ *     newer one if a commit has been made. The new state is the state
+ *     we just allocated and we might eventually commit to the hardware.
+ *     The state_to_destroy points to the state we'll eventually have to
+ *     free when the drm_atomic_commit will be destroyed, and points to
+ *     the new state for now since the old state is still the active
+ *     state.
+ *
+ *   + After the state is populated, it is checked. If the check is
+ *     successful, the update is committed. Part of the commit is a call
+ *     to drm_atomic_helper_swap_state() which will turn the new states
+ *     into the active states. Doing so involves updating the object's
+ *     state pointer (&drm_crtc.state or similar) to point to the new
+ *     state, and state_to_destroy will now point to the old states,
+ *     that used to be active but aren't anymore.
+ *
+ *   + When the commit is done, and when all references to our &struct
+ *     drm_atomic_commit are put, __drm_atomic_commit_free() is called.
+ *     It will, in turn, call drm_atomic_commit_clear() that will free
+ *     all state_to_destroy (ie. old states), and finally free &struct
+ *     drm_atomic_commit instance.
+ *
+ *   + Now, we don't have any active &struct drm_atomic_commit anymore,
+ *     and only the entity active states remain allocated.
+ */
+
 void __drm_crtc_commit_free(struct kref *kref)
 {
 	struct drm_crtc_commit *commit =
 		container_of(kref, struct drm_crtc_commit, ref);
 

-- 
2.54.0


