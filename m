Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28609CD6E54
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 May 2026 14:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=anUI5MHtMvkBC0GL+1Qn0sotBdjMvdd5vMopFShCozU=; b=wvJMRsIilwmCjxFYTdRCzzQ4IC
	xIXgmh/htx21Ug+6KXW3SA8U1krMuDJvS1pLkfvIAxEh6eJ059PdW8iIFUMd1penZZOtW97zHlmpZ
	acQupOSwI3cnwWzLz0sKTTSHxWrJrP++5tyW2Z94LCbTD/8LphWNlFHYmHKhplytjx4PiOit+Kulm
	kOA8+G1SRwTwsQgUloKWlH2BQLVmemrKFVOyYz4RjDLFA9iueZ8Ckiav8MDdnZ6zyfFsHX+5+QBSD
	YMjWCPj25JkLQKaIKCE/RH7EBg9bTZ+1qLpc3vwq/VBMbluTPTUSwTv9niGvOFAnkPv/mLrZYsaR8
	mLnOdAjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTKGl-00000008nVb-0XtP;
	Sat, 30 May 2026 14:02:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTKGX-00000008nNA-44Kb;
	Sat, 30 May 2026 14:02:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A6F2B40B5B;
	Sat, 30 May 2026 14:02:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17DD21F00893;
	Sat, 30 May 2026 14:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780149737;
	bh=anUI5MHtMvkBC0GL+1Qn0sotBdjMvdd5vMopFShCozU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=BTGwTSqn1YIJlYcFjkkHQw7OXJBQb14speUP2S4DboKN/QpnYqooblg6XkrxHo1qn
	 LNdk4pZqNVw3DRbKROF/6RyRvEwbcRLHqVioagNXRLeQ5LPU0ozDE0lPl7dBlNEqyu
	 dkZ1tIC1ZCwJsm8zwuJtFjH1jtXSJJGcFe/z2sUg3+10XXQeaoSw0eLVp0g4sO+Kv1
	 HiVfMVcE7o9CrmwBcmWwked/M2BwMFwO1rXPC7JJ+zENAxdeBnqDB+E6MZFUH8wWHc
	 KRjFIQ3j/cYgprB5Oe1c3PoaFEXkzXYYEcv+i3YszvkWvB53+XibWZYxAJtkNAg2/1
	 2V5iVz/B+qdmg==
From: Maxime Ripard <mripard@kernel.org>
Date: Sat, 30 May 2026 15:59:58 +0200
Subject: [PATCH 53/76] drm/meson: encoder_dsi: Switch to
 atomic_create_state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260530-drm-no-more-bridge-reset-v1-53-875d828d31bc@kernel.org>
References: <20260530-drm-no-more-bridge-reset-v1-0-875d828d31bc@kernel.org>
In-Reply-To: <20260530-drm-no-more-bridge-reset-v1-0-875d828d31bc@kernel.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: Dmitry Baryshkov <lumag@kernel.org>, dri-devel@lists.freedesktop.org, 
 Maxime Ripard <mripard@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1556; i=mripard@kernel.org;
 h=from:subject:message-id; bh=W3FfOYycKu4FyFarZzDHjkwqPdWFu1t0icXPJHTdty8=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFlSb33E/91m9p163Gpv94VbVuYFcgZ3j+xUUPx7eWrTE
 olr8b8rOqayMAhzMsiKKbI8kQk7vbx9cZWD/cofMHNYmUCGMHBxCsBEivgZ6z1ul574yvi0b80i
 hV0fTjY+XLtZo82ngf+fabFX3aO/Qn/3JiZq+QrfYuX9cKV6hUj1Jsb6vJMl7TmT3E6kcog9PHB
 B9+QmPikz7rhXretebLljfIrpiOIP7ofCEzm/8STxrVI+qPoZAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260530_070218_053567_A2FF7851 
X-CRM114-Status: GOOD (  10.80  )
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

The drm_bridge_funcs.atomic_reset callback and its
drm_atomic_helper_bridge_reset() helper are deprecated.

Switch to the atomic_create_state callback and its
drm_atomic_helper_bridge_create_state() counterpart.

Signed-off-by: Maxime Ripard <mripard@kernel.org>

---
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/gpu/drm/meson/meson_encoder_dsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/meson/meson_encoder_dsi.c b/drivers/gpu/drm/meson/meson_encoder_dsi.c
index c1f4685073bb..3e422b612f74 100644
--- a/drivers/gpu/drm/meson/meson_encoder_dsi.c
+++ b/drivers/gpu/drm/meson/meson_encoder_dsi.c
@@ -94,11 +94,11 @@ static const struct drm_bridge_funcs meson_encoder_dsi_bridge_funcs = {
 	.attach	= meson_encoder_dsi_attach,
 	.atomic_enable = meson_encoder_dsi_atomic_enable,
 	.atomic_disable	= meson_encoder_dsi_atomic_disable,
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
-	.atomic_reset = drm_atomic_helper_bridge_reset,
+	.atomic_create_state = drm_atomic_helper_bridge_create_state,
 };
 
 int meson_encoder_dsi_probe(struct meson_drm *priv)
 {
 	struct meson_encoder_dsi *meson_encoder_dsi;

-- 
2.54.0


