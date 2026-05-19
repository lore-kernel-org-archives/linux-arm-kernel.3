Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF475CD5BA9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 09:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RWXphynXEva1QU5MlNjAJspWGq7NF0t3Fti2JEJUh5c=; b=4+8DsZDwOzOtuPOSM+E4KP0Tal
	iAX9SEaejEO6/akPAaLRPKGIIbCzmfuBzxvXKdFImVMVuRwGTJeIbkxGmu0Cp3g8ngxxe561w1E2x
	z/VQbjq/+JPG2fNqQIkBarxWGaveyGlO6bm8GBFLuJoK8GgYnJduzYtN6ryDXa8zdNUQVpmiodFYF
	qgkaQJudyIkZSQjW2cibXflDspmYP9FL/MCP/IQdnySv8mi1OBc4apwaY7ztMduB7lRY75h4jEHup
	r6hL9GCpjRvtIO6tVIeaMfrn9BppYw4QrYm98HeudZkHeIAqeGzBCTP0/iBunRC0IrZZEj8jCWrVd
	Mp6SyiKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPGLU-00000000oMq-0HWR;
	Tue, 19 May 2026 09:02:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPGLI-00000000oDf-2ctg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 09:02:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4B681438E8;
	Tue, 19 May 2026 09:02:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68C59C2BCB3;
	Tue, 19 May 2026 09:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779181344;
	bh=+FwSG1hlg7MTNqbAOkk9ReNx69b57yw8164zI/GpPzc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GJJuESuuTJSD3Xy+RXwiOWIpi3eO79nEAXdWyS+c6Gd0LN0wvbuI+nayeQFi27vPl
	 5VEDlsje8AxDEB1stb7w3RMVZ3yX8ODw++5dyefJ+KNDil4+G3dcyp4UCmzZRfkJ3m
	 +mjgAfEo40bv7I0wUZxlVVN6HR4Sue4bNe5+0ihgOrj69WRq6kFAHrQ+NYecWBJyXq
	 FFgMk4gHsXCSy/S70Xvcv4m1K8LrPoznqORald8Ug/43mtkr+aRsxhtZUr9eqEei8x
	 3U61YjJZw9sRUhwJ1X0DgCv4awOO+Wo3nTY3wMxxXJLhoCq7NEoh1WuLq8XhAVY+mA
	 B5h64F+VMA93Q==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 19 May 2026 11:01:48 +0200
Subject: [PATCH v5 06/19] drm/colorop: Rename __drm_colorop_state_reset()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-drm-mode-config-init-v5-6-388b03321e38@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2371; i=mripard@kernel.org;
 h=from:subject:message-id; bh=+FwSG1hlg7MTNqbAOkk9ReNx69b57yw8164zI/GpPzc=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFk8ar9Z0xL2xTJ4iAZeOTrzXqhCw1lB6VucygsWujx+t
 HSNmMeijqksDMKcDLJiiixPZMJOL29fXOVgv/IHzBxWJpAhDFycAjCRpAeMDV+tXgtoPxBU5ZuV
 /MODZdqqkxsNGYqS72x6e8TXPEwvt/PO6yItv1NBPDf2Xf31IMw6hLFh4y990/LqttlfGaPeBmb
 q55zeFXb77B+OkxEhT+0qf52ZJCezo7DyKed8QwMTLeXTKpYA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_020224_736820_8D227C24 
X-CRM114-Status: GOOD (  12.66  )
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

__drm_colorop_state_reset() is used to initialize a newly allocated
drm_colorop_state, and is being typically called by drm_colorop_reset().

Since we want to consolidate DRM objects state allocation around the
atomic_create_state callback that will only allocate and initialize a
new drm_colorop_state instance, we will need to call
__drm_colorop_state_reset() from both the reset and atomic_create paths.

To avoid any confusion, we can thus rename __drm_colorop_state_reset()
to __drm_colorop_state_init().

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_colorop.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index 48d0b7ae3fc9..4c4d0a953e35 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -498,19 +498,19 @@ void drm_colorop_atomic_destroy_state(struct drm_colorop *colorop,
 	__drm_atomic_helper_colorop_destroy_state(state);
 	kfree(state);
 }
 
 /**
- * __drm_colorop_state_reset - resets colorop state to default values
+ * __drm_colorop_state_init - Initializes colorop state to default values
  * @colorop_state: atomic colorop state, must not be NULL
  * @colorop: colorop object, must not be NULL
  *
  * Initializes the newly allocated @colorop_state with default
  * values. This is useful for drivers that subclass the colorop state.
  */
-static void __drm_colorop_state_reset(struct drm_colorop_state *colorop_state,
-				      struct drm_colorop *colorop)
+static void __drm_colorop_state_init(struct drm_colorop_state *colorop_state,
+				     struct drm_colorop *colorop)
 {
 	u64 val;
 
 	colorop_state->colorop = colorop;
 	colorop_state->bypass = true;
@@ -537,11 +537,11 @@ static void __drm_colorop_state_reset(struct drm_colorop_state *colorop_state,
  */
 static void __drm_colorop_reset(struct drm_colorop *colorop,
 				struct drm_colorop_state *colorop_state)
 {
 	if (colorop_state)
-		__drm_colorop_state_reset(colorop_state, colorop);
+		__drm_colorop_state_init(colorop_state, colorop);
 
 	colorop->state = colorop_state;
 }
 
 void drm_colorop_reset(struct drm_colorop *colorop)

-- 
2.54.0


