Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F6E0CD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 May 2026 07:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pZgZXDapD3/D+twZe7T4nhGsVyTA1P2sNWQ93wpwZx8=; b=ZtsQguUoy9fsiM6DYW/mx8LPi1
	75X72ilef8iqVKyIb97ul9thwLJDtaJFi/cdFIclzLXECufZmUvYPk+xO0k+7D7wEk3M3SEmduh97
	xCgu+15lzgr95gjdihTawM6IZom0DaBMKj8Xk/SfAwNzRmcoDWb0SsnmW35HZclENKtnE84ty1iza
	rGmXVxWQVy0yv0mPTEatFlHSSTXedhFwtOSnAqa6LQgDID5FJjyanSVWei7am9Q6jdpFtcNavw9j2
	YU38KMO3o1HVM0R7JISG6D3xe/mX/c4+uiTystwTNaU1lgEqsAsyTtBgjjFMIcs6JnhxUZK/3FLa6
	7MVdfZmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTask-00000009LBD-3hDS;
	Sun, 31 May 2026 07:46:50 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTash-00000009LAF-3nk0
	for linux-arm-kernel@lists.infradead.org;
	Sun, 31 May 2026 07:46:49 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-8423f236418so102927b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 31 May 2026 00:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780213607; x=1780818407; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pZgZXDapD3/D+twZe7T4nhGsVyTA1P2sNWQ93wpwZx8=;
        b=JJFTjj1QMYBNl2l62YRcNTUJUSEpJQTFXVZR9Vhnj4fqZ2KhkDSD0HWGjC9oCgfgxh
         C0mE7ruG9JXosvk2l0BiPW2G7hPykzLaPrs1pYUoLC8+/WT3dFAbCeny983/UHG9wWGq
         cLcnkmPoBRkzBSSrQJvXuDLjuGRcOphYCWLd9GgC9bAb17b1uBVirve95nZCK3HyEhAf
         TnOrG/hBoCLUSzZuhLKmZJ3tMEZyX18m98fxQNPzclvvrk+FCAnRVi1DZiOXIztW2CmU
         AVxlXhHVX1MvCAV/VjaXHnDQgel3ypvHYiZ/G9NomBLjtm1kcufGE0n8RDP2clPHI9C7
         x5Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780213607; x=1780818407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pZgZXDapD3/D+twZe7T4nhGsVyTA1P2sNWQ93wpwZx8=;
        b=JhF8qZ4RewN1twDnxVPsXNDtkIvaDNzRGhTnpd5KpxE1ZVpArSpgD53bj8f6xhsSR4
         LY3Tl5NEmTq4SfcCPhcI4CJRuKNZghxpb8z5vjpgmy9WlBqstVmu7kWU9Lm6wgv326Z5
         AZS6jFG6o6BjfdtDctahMHiJz3ZuDtKlHRi1NW4MT0mltLbY1BNoUX+pBWMfpHnRfD0u
         YJ8ZwkFTkCvNKbyhBQO8A5uo2JUZsawwKdOyflFWgFxiFjNGch9pgVe/VGdYADE3kQuA
         U3KuHtMgBioVnNZOPTgLp57Xd6InKOihIAHljPGHXxsdPzkh2O0lfAh9ZGYFpYy0halF
         zOyQ==
X-Forwarded-Encrypted: i=1; AFNElJ85CHLVQ3DQzTL/eLMiA0rus+ptc2U09i7a675UD/1e+ORMi+4TEDiAjl73T911sgxp4DIHMTurqN4deDO7KnNW@lists.infradead.org
X-Gm-Message-State: AOJu0YzNZuBUM8YBB/oab5fDy9WSa22TWYK16YCSl5G13ZHIiCVr4hPx
	cNKbNJEZL653wMM8UE/RAU2aH3dhRf+1lJI+Gtl/vwbQNTEdbUvq64zC
X-Gm-Gg: Acq92OEZzuGz9Z7+HwSHEe5dnSyalVaCflymaKMs0iqWiEHF9ePjCeHwyfAcfCZ3xpb
	LHTA7hQkzW7L95gKP4h7nKie+2sJaKV8+SafEWacCjoh0vGbm9Xj6QDmvvEil0pMoYyRfHaG55p
	yEpM79v8HICHQC23c9DJswVMh7PUIbm//JquyD+C1W0vqc3sBHzobK/o6GlbF0H33xoJDDnpNz5
	0H7vfdEFy7ivVF/HaOYzm0mah9BxP5STSA7E2cRAqc6MqeOdcMmDx6Ixh/cgtKVJmCLUD1mvhXh
	eaqWBFXtIPiq/sURNTl4Bw6z19vBKC8DOLi+qJCsKexskqTKRH7GENsTH3oCoSHQqMmf7Nn1feh
	jnrBOWX2Tc0VepyLxOPaXaAkqLY0sA5ItqWMLBcbOgm+P0Uy372wRKuErNKmrgbPmf619GDxXwU
	yWl0c5DgMUyr5HaZ/69yTQ+lZCMGbhDA6arL4VqOqLCw==
X-Received: by 2002:a05:6a00:4f93:b0:842:432e:b802 with SMTP id d2e1a72fcca58-842432ecadfmr1408991b3a.16.1780213606915;
        Sun, 31 May 2026 00:46:46 -0700 (PDT)
Received: from Naman.Naman ([2401:4900:1f39:4c4a:1e56:d301:ce43:ac25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84246844780sm933636b3a.30.2026.05.31.00.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 00:46:46 -0700 (PDT)
From: Naman Arora <namanarora029@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: tzimmermann@suse.de,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	neil.armstrong@linaro.org,
	khilman@baylibre.com,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Naman Arora <namanarora029@gmail.com>
Subject: [PATCH 4/6] drm/meson: Open-code drm_simple_encoder_init() in encoder_cvbs
Date: Sun, 31 May 2026 13:16:25 +0530
Message-Id: <20260531074627.8936-1-namanarora029@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20260531073532.8609-1-namanarora029@gmail.com>
References: <20260531073532.8609-1-namanarora029@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_004647_947106_CF3C354A 
X-CRM114-Status: GOOD (  12.14  )
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

The helper drm_simple_encoder_init() is a thin wrapper around
drm_encoder_init() with a simple destroy-only encoder funcs struct.
Remove the dependency on drm_simple_kms_helper by open-coding the
encoder initialization directly in the driver.

Signed-off-by: Naman Arora <namanarora029@gmail.com>
---
 drivers/gpu/drm/meson/meson_encoder_cvbs.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_encoder_cvbs.c b/drivers/gpu/drm/meson/meson_encoder_cvbs.c
index 41071d6e0..496100ba2 100644
--- a/drivers/gpu/drm/meson/meson_encoder_cvbs.c
+++ b/drivers/gpu/drm/meson/meson_encoder_cvbs.c
@@ -18,7 +18,6 @@
 #include <drm/drm_device.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 
 #include "meson_registers.h"
 #include "meson_vclk.h"
@@ -218,6 +217,10 @@ static const struct drm_bridge_funcs meson_encoder_cvbs_bridge_funcs = {
 	.atomic_reset = drm_atomic_helper_bridge_reset,
 };
 
+static const struct drm_encoder_funcs meson_encoder_cvbs_drm_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 int meson_encoder_cvbs_probe(struct meson_drm *priv)
 {
 	struct drm_device *drm = priv->drm;
@@ -257,8 +260,9 @@ int meson_encoder_cvbs_probe(struct meson_drm *priv)
 	meson_encoder_cvbs->priv = priv;
 
 	/* Encoder */
-	ret = drm_simple_encoder_init(priv->drm, &meson_encoder_cvbs->encoder,
-				      DRM_MODE_ENCODER_TVDAC);
+	ret = drm_encoder_init(priv->drm, &meson_encoder_cvbs->encoder,
+			       &meson_encoder_cvbs_drm_encoder_funcs,
+			       DRM_MODE_ENCODER_TVDAC, NULL);
 	if (ret)
 		return dev_err_probe(priv->dev, ret,
 				     "Failed to init CVBS encoder\n");
-- 
2.20.1


