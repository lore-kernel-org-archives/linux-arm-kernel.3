Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBA8ACD6E51
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 May 2026 07:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jKPe1TO+FoogghrC8LGLLeXq7GSJc49agxpkGaHZqpM=; b=Md6y+PpsZ0QjiMLzplGP8MWBdE
	X1hAENGxChy1i7gJtdyNPdStL5i/V4qSeTsWAhCeprEpWcTFJOsQP/ABZR6KuvCBOH9kHfLDed9sg
	sGPqik+THnXzoTX4fTNJu7loVr/RRvl0eCzITkBv+bB0wBQUTxodU51Kjt21mci4RrARqBqeCGDNm
	f8zjp244tzFFy3sp7Nmix1RkTPVWL/gQOKW+cQnfxr8hdmtzSVBz+dkEQDUXNv3dwc9JaVg8RpM6R
	ZebeIsjW9eCR8k5tvWdpJqKfi+cjZ01lOuBCr8CrMDxGs0MOr/UMWU/XFeaQNzhDMU8f7Aps2M6FC
	ycAV/smA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTaiw-00000009KRk-2RFW;
	Sun, 31 May 2026 07:36:42 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTait-00000009KQP-2pSk
	for linux-arm-kernel@lists.infradead.org;
	Sun, 31 May 2026 07:36:41 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-8423f1d8902so48666b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 31 May 2026 00:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780212999; x=1780817799; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jKPe1TO+FoogghrC8LGLLeXq7GSJc49agxpkGaHZqpM=;
        b=d7pHjL59QR2tdWNgqa+tnzZQMygIZB4fSHa9zEQe7V3kZ+v0iY0pXk3mRjoEpyynxB
         IsrWT/VTxLEqfkBHlioVcdUOGe+tjOHKCbqMmJipr8oY6Cejjxk4wc2+cM4WziC3866B
         q3RPqV+km2wrkWKQZUoRs93C00M6pqvqjo3h6iMMES9VO69NFvTYs0C4/XeZs5l8u8UK
         C1CqQVvSIbwgej3Fluf1kRvnzgoSiy21Kkmhl7UO6cSSRpoz28PShBu3KufSPFrgtqCU
         l4HC8GF2Yvr0NeejD5TJKxwjxagnwoGW3EFzO6t/SxTSBTXZsWz+0cQHN54fL5vO6tkr
         M2RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780212999; x=1780817799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jKPe1TO+FoogghrC8LGLLeXq7GSJc49agxpkGaHZqpM=;
        b=LjoSA871M2EZlrkz/N8zVCm90u4i+PmGht/AgWrOBrkmAqEOx4rmpO9kJ9X7hX4g7k
         LnaIv14k0b9yFSfT2FvejP2AhWo39M4P5sPBWeTaW1Kg7oE8CMUvU+2AEQDG5MTrVKk1
         nrvdJM/1TMi2eNKC6Vy/K8Ake0PvNtPko67hyYb5fkHpVRo63V9WCsm3S4k9Qz/STVNt
         M6giOC253EjoPeACVlfDm0EbJENU22olR/IFmVMrnh2IHEDChqh6T2L3vqok4uJxOddQ
         GBYSprpiN90n06eQWNxMlxT8O2lRnaZKQJWSc7FQo/X6iKG1nozPya6AWytmOJOgbz4T
         lIBg==
X-Forwarded-Encrypted: i=1; AFNElJ8I5XfDhY2bBX9v2LUk5biFkvmY4Ud67LhxhwB6mub0E0W2ICP/zoSBJz3plIuOeW0Uhhu31HubM2NfGiLSSwfI@lists.infradead.org
X-Gm-Message-State: AOJu0Yyxa7T1mUP5eW3Si5V1vcSyk8yWpbKsyP+tZCrDOsaxU+G/6wc8
	hO3zm6tPo7McydLdH7yPdicgt4Ba2czirzuoHr3xwy9BSM+HgiQN4dLO
X-Gm-Gg: Acq92OGDCZ6x5QMlhGZQqe+WjObYeaZPKVb4r9CgDqUtMjGw8NRCqrvCZo4Q7eWJl/I
	ZS6z7uHtNaaZZLXG77qPLJsno7YXc7iuoj/ji8B/HqTc5wE7EbTJcVacN9ABpP6UhCxBamfG9pD
	6DSALnVTpJy+wbLLyfzy/XCGCiExM0mZp9eLoI2uXoPfdEihXrk4gpILlTF0a5HYbkzuDMSB13H
	RD+ixOjGyy2neLeEBwhuGB4DwyhE7m5evrMRPRnkbk7qxoZGOEpcTb1dD+ARl8zH5BywheoatYg
	qf4j8GsVaXHov4SlTOycaJWNP/WKc8WTS9zXZgnPocGuGYBM680QTEvDkrHPTTzqQ9dFYy6gi1r
	+Q18040RZ5pLPPPVKvpwVH54/EX35NiDMLGFPiETNO+l2HyZHKUlT9lJrZ199f/yM/KEDTLCkGQ
	GxEephEhucky8uUZLFGq+s5oRhIUkvQcJQUeO+Tue8BA==
X-Received: by 2002:a05:6a00:1a05:b0:842:3373:f662 with SMTP id d2e1a72fcca58-8423374104dmr2845469b3a.11.1780212998783;
        Sun, 31 May 2026 00:36:38 -0700 (PDT)
Received: from Naman.Naman ([2401:4900:1f39:4c4a:1e56:d301:ce43:ac25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8422e712309sm3760709b3a.59.2026.05.31.00.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 00:36:38 -0700 (PDT)
From: Naman Arora <namanarora029@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: tzimmermann@suse.de,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	stefan@agner.ch,
	alison.wang@nxp.com,
	jyri.sarha@iki.fi,
	tomi.valkeinen@ideasonboard.com,
	kraxel@redhat.com,
	dmitry.osipenko@collabora.com,
	neil.armstrong@linaro.org,
	khilman@baylibre.com,
	linux-kernel@vger.kernel.org,
	virtualization@lists.linux.dev,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Naman Arora <namanarora029@gmail.com>
Subject: [PATCH 1/6] drm/fsl-dcu: Open-code drm_simple_encoder_init()
Date: Sun, 31 May 2026 13:05:27 +0530
Message-Id: <20260531073532.8609-2-namanarora029@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20260531073532.8609-1-namanarora029@gmail.com>
References: <20260531073532.8609-1-namanarora029@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_003639_715050_8DE85163 
X-CRM114-Status: GOOD (  11.52  )
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
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c
index 84eff7519..a16c6013e 100644
--- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c
+++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c
@@ -14,11 +14,14 @@
 #include <drm/drm_of.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 
 #include "fsl_dcu_drm_drv.h"
 #include "fsl_tcon.h"
 
+static const struct drm_encoder_funcs fsl_dcu_drm_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 int fsl_dcu_drm_encoder_create(struct fsl_dcu_drm_device *fsl_dev,
 			       struct drm_crtc *crtc)
 {
@@ -31,8 +34,9 @@ int fsl_dcu_drm_encoder_create(struct fsl_dcu_drm_device *fsl_dev,
 	if (fsl_dev->tcon)
 		fsl_tcon_bypass_enable(fsl_dev->tcon);
 
-	ret = drm_simple_encoder_init(fsl_dev->drm, encoder,
-				      DRM_MODE_ENCODER_LVDS);
+	ret = drm_encoder_init(fsl_dev->drm, encoder,
+			       &fsl_dcu_drm_encoder_funcs,
+			       DRM_MODE_ENCODER_LVDS, NULL);
 	if (ret < 0)
 		return ret;
 
-- 
2.20.1


