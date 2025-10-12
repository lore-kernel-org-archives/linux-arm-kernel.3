Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3A89CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Oct 2025 19:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GN8no7TuZPEE4ZrIoWOSDqFeNHwdwABVG2L9ibzW5CM=; b=Ug8q8KYSAX6EaIV0fASf0NDep1
	fcX3XCcGfhn2aEggU0+06yzN3a2g7nd+GhA5eW7oBAUFIgZaQgCyw91zwmtmoWGraPUqTrzObu3eP
	zCUruPpmTE4jo5dYyOxI+k2WTfEIlmvO9GPM+bIbqZgE1kUn3XF6+hXKLyHM2sVhFve9oWcZNhG4h
	stS2NhQevJ6XnpDkMA0AUgfU4y+h81BTQ89URaYf7CvLRjtQaucTLFok5i5KGE0QazM9nJcnznxwH
	3PCca5FhkCRiQGrnMkh1Get8Xznal/1rS9DVW7gw/Q7+xhEqHb/re+rgCF3zQCTFghyLF8kajP8sU
	k9vETSfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v81gW-0000000Bh1K-2HrZ;
	Sun, 12 Oct 2025 19:24:48 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v81g1-0000000BgC6-2aY9
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Oct 2025 19:24:20 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-634b774f135so5723527a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Oct 2025 12:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760297054; x=1760901854; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GN8no7TuZPEE4ZrIoWOSDqFeNHwdwABVG2L9ibzW5CM=;
        b=QYSNtGz+m3mPq51IRPLveboON1IxbXVrR/WAS4rO3vqdzBit4PO/YV/Lddxn8RF7C8
         jy66r24XceBB4LJKZiuOjNaXznopt3P3wSkWqGIHbcmaoxK1gTUei21n+kJbO4T6K9Au
         JFGUf2PJ5yw17TL8P8GoHp7WnmVan5GDryPQRHaiFSYk7fctW04IcPOdGH3hg+xgNpn3
         c6p+zF+jpECzFg/gc4x4GpwaBbAnLv6X9R6KA4D4szHZHs7X7wv4jeKMU8Trzavpfaop
         G0oDnaRgbG/AECsLSepL07SHs+lxuCYz4JidEXRDNu782kEcls+aEA8hWll5vdonDn+F
         lTlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760297054; x=1760901854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GN8no7TuZPEE4ZrIoWOSDqFeNHwdwABVG2L9ibzW5CM=;
        b=R9S+u4kKdshz3Te4uECmCdFWRhJLemwUEdKNYfs+05UY351SPhDPMFN2+p+j/axPXW
         RBbLy22Fcl6pSNYub2nGl22Q69xjXow2aSUthmAx2tclRmP2g24ZSSQVPuHKUAPEMalu
         giDYsNCMmGdwEHQ/zL2FeSBk7cKld/g9ywcso73vG/JNePgE0wSPYFAkx7p/aQRV1Kl5
         qCyu3oDtuFmgHZ+ghEafn4sgbloyP0waarIr/tq5KSdHkXUYDJEOlyR69XSaqtz2EiKU
         W2fWYduTsK+3p/5lRdR8y1rREwU+y7sOXdzpS7JPEi/h1ITgvzF1w9ZycsSlGHhmP0Nk
         pR3g==
X-Forwarded-Encrypted: i=1; AJvYcCUPcl4ax87vEkdpGdlmdwLCNmUt+uBHZJKPR7mBR2I4jmx3scvIZC6S0Lul1dFusSqjIwVl5zO7ks46TQVXv0r/@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+5hcqydNR8ojayiDjN/7j967+WeIKFajZaceJdhnsDaT7OKAe
	X7R8l+7z/JC6wsa9xyar099R2WtjzOlZ7SAQ1fAONRnEs6j/mh8iOe3z
X-Gm-Gg: ASbGnct0LuOfh8RfHUQIT51A+mqJM8dAW9dGxF9hCTD1F1QalYP5AOvDnfuc+Yq+zks
	iSACPvYX3Pv/irb7qUIrkI2wweMqT4WZ4fi+uGb2PxRJR/oZSpIJQJFDuhVqGISf/GXojvFwA3i
	uIcaivzTO51irPo2BP7sDwPGNT8KORhbnFOs32GJn5JxaoQCwDM5N7pSTu6XlN/FVcceoQCyGXR
	50w07jzHvsMpDyF6XQtyhft50PmGkeVcWDKl5h6+zy2WotSlxSmrRJZn7zEfk/Oi8l2yttuK6lh
	NsLDAgcCYsN60TFyo7LNZTKDuVD3T8RlKavGb8FkO0fLE4DabG4ObelUFXPgJ6K7tOqWRLt+mV8
	aW8psM82KY6D5lt3aMiu6vTbat/LmicQqvFmyNwW3JFPQta8SZWbzJaCozLPRvrC6oaxV80ilgv
	hdex9CpXmGuBkdtrrZEOFE
X-Google-Smtp-Source: AGHT+IGliGTnpTGRawNal6hhCfPRYBSBq/r1s8fnX2W1RihxLmu9ewXMj4AGe/8If5EcaR6rduNrqg==
X-Received: by 2002:a17:907:94d2:b0:afe:7b8c:a583 with SMTP id a640c23a62f3a-b50aa48cbb6mr1956645266b.13.1760297054099;
        Sun, 12 Oct 2025 12:24:14 -0700 (PDT)
Received: from jernej-laptop (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d67d8283sm760176466b.38.2025.10.12.12.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 12:24:13 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mripard@kernel.org,
	wens@csie.org
Cc: maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	samuel@sholland.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 29/30] drm/sun4i: vi_scaler: Find mixer from crtc
Date: Sun, 12 Oct 2025 21:23:29 +0200
Message-ID: <20251012192330.6903-30-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251012192330.6903-1-jernej.skrabec@gmail.com>
References: <20251012192330.6903-1-jernej.skrabec@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_122417_806359_9B724FC7 
X-CRM114-Status: GOOD (  11.61  )
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

With "floating" planes in DE33, mixer can't be stored in layer structure
anymore. Find mixer using currently bound crtc.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index afe38ea03beb..4534998af825 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -13,6 +13,7 @@
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_probe_helper.h>
 
+#include "sun4i_crtc.h"
 #include "sun8i_csc.h"
 #include "sun8i_mixer.h"
 #include "sun8i_vi_layer.h"
@@ -62,8 +63,9 @@ static void sun8i_vi_layer_update_coord(struct sun8i_layer *layer,
 					struct drm_plane *plane)
 {
 	struct drm_plane_state *state = plane->state;
+	struct sun4i_crtc *scrtc = drm_crtc_to_sun4i_crtc(state->crtc);
+	struct sun8i_mixer *mixer = engine_to_sun8i_mixer(scrtc->engine);
 	const struct drm_format_info *format = state->fb->format;
-	struct sun8i_mixer *mixer = layer->mixer;
 	u32 src_w, src_h, dst_w, dst_h;
 	u32 outsize, insize;
 	u32 hphase, vphase;
-- 
2.51.0


