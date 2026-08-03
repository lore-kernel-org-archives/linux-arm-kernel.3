Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB663C55179
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 11:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=I6Kz68yYAXo6+FxgCcZ8xt2d27kzI8ELfLUFCtIDH5c=; b=SOsRyrqDbW485Ky8mzcZov1/8q
	UTqtDPGhmSSA6ro7qodPlXwsiLAbA9AGoXO12pRWiz/J5vHC1xoEYfcAgRoIjmWLRGO/HZn6OZSsu
	xlwP4tijyWMFw9wqHStAN2EgOWaxF3F9naz6C8oasa0UR34R0XZ7EZ0xFfN48qaTsL7VdukF1eneh
	0dhCo6NqtL2pZsggZdpYWAWxegz9IfUILsvZcs6e7ZliWTEQUiLPQFlQa5W5lJbX46V7E8lEutZX7
	HL41UaqIsQdvgRgP++SuNUO74bW6Y7AnSsw6sWWIN6mfHilt+s8vqWaM/IlHhxpOYpDaTo+RT2QQ/
	Uurnw/ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqqbw-0000000GvPN-0zjd;
	Mon, 03 Aug 2026 11:13:36 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqqbt-0000000GvOl-0WjF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 11:13:34 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2cc97653887so34139915ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 04:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785755611; x=1786360411; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=I6Kz68yYAXo6+FxgCcZ8xt2d27kzI8ELfLUFCtIDH5c=;
        b=ms1PpdbV7a+H8kltfDHzgQ4hTf6SajED2TJLtRJGnhQLbePbX18aY8IlN3Aw+c+z5g
         2XVXq7/6aZbqK6Ld9IQM8Aq2X5CTrliRl6hZkMGM6zOGnkUB6lhPT1QpCnXU8XkaX2gB
         MKnqH2kWBMBZhRwzqzWLKM99/V+3zwTj+Ac4g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785755611; x=1786360411;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I6Kz68yYAXo6+FxgCcZ8xt2d27kzI8ELfLUFCtIDH5c=;
        b=QF5h8dNCb5bxgOBfY4Od17szGOwRydTP7kWYgeolsno66gfXOwp0qgZ3xSkKZAnoUO
         kzJtZhUPTLrdJ0mwoqAt9wgt0HhblwUwNDT+UwMcCRtMOVHZ1O88c6sxNGsG8T1tfysS
         dAbpkyw40XqloDzp9yfMaDl+Jaj6EpObuQF4porETOPUThE2xJ206LoRXC4bZjzp0Fsu
         K4vclHkBdWws1DXP7EKp8iGE5D94oAsGXLS0MfFfQYEK/3F1eApa96x/ypvXPUuWu4GA
         qvS95rkXSX75Dd8mmxYY0UbaAcDafy+nkabrBd3XsLXZ5F66x4JZT0zPn4oeNfe6julp
         w2Uw==
X-Forwarded-Encrypted: i=1; AHgh+RoBfPj0Xjy9q/JIBri9CI3p3Rcw4iHBqO7a4V1W1zL8+1kdidTmSuvJRJyn2q70JbFo3FVyDtLbdtYhZsF0x6Cs@lists.infradead.org
X-Gm-Message-State: AOJu0YwIgt1QtdGYBYeVem276DXBzzaN/e5iTd4rR9qmHRNPnq7Ys0vV
	CiUm6/FlzX3hGP07PhI6MOK10ZcDSs0FyintPCSGvRN31FNbfDU/dU6/7tRstXlePQ==
X-Gm-Gg: AR+sD13mqXLBwGzydQcCZDC/AWRop6BmFnxPtG3CxH9l1GBd+P1f4GxtJGhW3P6Ukyn
	htFkIERMJF0dnsKKfSUdGlwxU43I/FwMMnbfGU651XQNTQvAgKt19smyGCklK6t5hgQR2RfAMf0
	++ZGPFm2FWUENa+6Vvk6qntAA/q1cOAbY6CErEnXG2U/fPhyRbhkeJuKZ6xBzbLUn0rgps2PjZB
	ZiYHyEoh5z7yE1uCKlnLqmeyw0EpNkmV04UfCN80XzbasWLXbLYtCediGEyaYKvjkKFZh37WDmo
	EAedYZkK/dTeFhY+zkqDanTYKqpwyZ6i0g6rSnsJJ4Fw7G2ug1RdnI3ej/qrKGOJ/G04XFGQ+r/
	T8gHDUkzO1vVcS0/KuZ5LiZ9tiFqfypnk4jLMnF49DPFL2ZyGpx2En1RGkDxHu2mT0O1wk4uPHK
	Qk4onK9TbyOGdkNL8vrmLTH4DIo2XCN9DoAD8ns1ELevH41MjHPQo7Nfeek/+yNgIx7q5vvDrOE
	BJkwsoyibwBlUPEiZwZuMJZEoMGVdvtuZvBOz48IQXIzw==
X-Received: by 2002:a17:903:1b50:b0:2ca:17e2:2acc with SMTP id d9443c01a7336-2d052297a68mr94429995ad.21.1785755611549;
        Mon, 03 Aug 2026 04:13:31 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:1c0b:57ba:92e2:e178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04b11e69asm36171805ad.56.2026.08.03.04.13.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 04:13:30 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-sunxi@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/sun4i: framebuffer: Set mode_config.normalize_zpos
Date: Mon,  3 Aug 2026 19:13:18 +0800
Message-ID: <20260803111319.2836240-1-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.571.g244d577d93-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_041333_200955_8F0207CD 
X-CRM114-Status: GOOD (  13.20  )
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

Back when support for zpos was added in commit 47a05f4a68f9 ("drm/sun4i:
backend: Add support for zpos"), a custom atomic_check callback was also
added in commit b8f1230dd3bf ("drm/sun4i: framebuffer: Add a custom
atomic_check") to have a place to call drm_atomic_normalize_zpos().

Commit 49efffc7fbd4 ("drm: Add drm_mode_config->normalize_zpos boolean")
added drm_atomic_normalize_zpos() to the standard atomic_check function.

Set mode_config.normalize_zpos and drop the custom atomic_check
implementation, which at this point is just a simplified copy of the
standard one. The standard one also checks whether async updates are
valid and updates the self refresh state, but neither feature is
supported by this driver.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/gpu/drm/sun4i/sun4i_framebuffer.c | 19 ++-----------------
 1 file changed, 2 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_framebuffer.c b/drivers/gpu/drm/sun4i/sun4i_framebuffer.c
index 9c8ef927d929..fc822bc2c62b 100644
--- a/drivers/gpu/drm/sun4i/sun4i_framebuffer.c
+++ b/drivers/gpu/drm/sun4i/sun4i_framebuffer.c
@@ -14,24 +14,8 @@
 #include "sun4i_drv.h"
 #include "sun4i_framebuffer.h"
 
-static int sun4i_de_atomic_check(struct drm_device *dev,
-				 struct drm_atomic_commit *state)
-{
-	int ret;
-
-	ret = drm_atomic_helper_check_modeset(dev, state);
-	if (ret)
-		return ret;
-
-	ret = drm_atomic_normalize_zpos(dev, state);
-	if (ret)
-		return ret;
-
-	return drm_atomic_helper_check_planes(dev, state);
-}
-
 static const struct drm_mode_config_funcs sun4i_de_mode_config_funcs = {
-	.atomic_check		= sun4i_de_atomic_check,
+	.atomic_check		= drm_atomic_helper_check,
 	.atomic_commit		= drm_atomic_helper_commit,
 	.fb_create		= drm_gem_fb_create,
 };
@@ -46,6 +30,7 @@ void sun4i_framebuffer_init(struct drm_device *drm)
 
 	drm->mode_config.max_width = 8192;
 	drm->mode_config.max_height = 8192;
+	drm->mode_config.normalize_zpos = true;
 
 	drm->mode_config.funcs = &sun4i_de_mode_config_funcs;
 	drm->mode_config.helper_private = &sun4i_de_mode_config_helpers;
-- 
2.55.0.571.g244d577d93-goog


