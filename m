Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15223C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 14:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jC9QV0bJcgZgqHHH3SUMbf/vptPD4PQ0vRL1kkv5HIw=; b=E6yUYHtPVqGEB+5y02WfYd3Wj3
	USRLq7JicZsA+2jlN+vhogcn8r3lOvOuwBZA8PgPMBOwD9E0T94MXBo0FiXfJdm17kvbEtXdOYbP8
	zf1ex/IvdQCkfu+U+JQ/l5TwbmsQIyDNQNW9e0Zrdy0qPW57YnjIirf01CIv/Pksv7kYdaSXsQkdr
	avJ7Z4s1jH5bboGt62takBaS0isfjlbSiL8PmJ096lSIOQFfQJwG+/shyAWiXcE2k0Qye+cplvBNa
	LroIMRHWblL3172TWhIO7khm0KYPHeRxmBfC74zy67ezW+lG7AHeNQCNpr719+h85o+pwkaerRzJ4
	6azbmwTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tppSv-00000008IQi-3g05;
	Wed, 05 Mar 2025 14:11:17 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tppRH-00000008IJP-0rij
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 14:09:36 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-43bcbdf79cdso13343075e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Mar 2025 06:09:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1741183773; x=1741788573; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jC9QV0bJcgZgqHHH3SUMbf/vptPD4PQ0vRL1kkv5HIw=;
        b=MuqT8Y30UX2kGNQ83qNjd/aIt13B09rSA3E2HRo5UgVJNajX1B/b5KS3sE8tt8MpK8
         WWaJTaLNLE+5RYvUsiYjXvgMCZZ62a0ECdjsLR2EnIOP9khayVvpanC4vfzbXc/zo1sB
         sEDIkbQJfL40Zm0jW408qH9fN71pnN1YgB+KM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741183773; x=1741788573;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jC9QV0bJcgZgqHHH3SUMbf/vptPD4PQ0vRL1kkv5HIw=;
        b=TyeKU4WUv9bHOnDSlqbTJ97UvC33Lr+Tra7domgWFYP5J6km2i4I8SPdx8unMb8cHU
         qv+ZQpxMicVklRURM1GIHLmIg98RZokkTdPUxdW+UsrPArJFelZJC5E7WoFMkxq+Tw59
         nTh2r76KclPxHQ3f8ZnHp8IhewTrY9unVCdFjIXOOJBUWCJq9FxGsRSNvRKyCH4Gdf9A
         NnJs/n96N5BT5Jb3ne888BevT2mswxnUaTqvCr1IQg6A3JEFRM8WYV/FNsRSCbkk8evk
         oSnztt5uKlodtqSWA5r+GpYYW9O/4NdcLEtrZKE8CiDZBQ61qLR8nCOM0AQpfg2nShHf
         s70w==
X-Forwarded-Encrypted: i=1; AJvYcCVCg/TSzgXv4JX6t+Y8kvxf0d+0gYpStnq52QEZ6V0cqwRdgTplpxM0a8Ub6WhnyDjJfv2FTmuYq6yiSF/yxRKc@lists.infradead.org
X-Gm-Message-State: AOJu0YxVby1eANBGYmhR31TQ559vj/o3fpyn8A1/e4M3I/z+0ypWc2dZ
	Bo+gBXtlVklVber2uRo7Lq+Jl6IvX+i5mNMf73lNFWOSqD1opZVN6FUPcI7GP1s=
X-Gm-Gg: ASbGncvIibqNwwzI1XqfqNpw+XPgznOJ8dkUaZ9xiRXpg2QItpVf4x4lNAlIaLPk2Rk
	uls3jA7R+R1myEjDuSeNUWcBRWsy6li9YANIGBD9WPQis5VV8Vss81zuKL3cV5u8UqK5fHsxgB2
	V4Etsg67DSOe1behLdjr3vVHahRpdFOWQwSCzTUABw8h+eD+0R4Tf7QAOWjUL2dvHALSMQ7X5Np
	3zI8NqAuaLlYJt/sPWfYpWoaRaqcARJ1prDBVJsekQ6Ma+XhbgDrjOQr2hZEy+Huj6Bl63PGzq5
	zfCP0SIZwE3R/p4MaIQlIG5yqZe/edgECpfBS62QMKurLx9fSzZ3lRBigToPY5umdbLZ+wG1Moc
	kZO4k
X-Google-Smtp-Source: AGHT+IHdccH4w20LAtL5Tnt1zvD+qT2oMJLO3EagpAUtyRarROFNC3ETwO4Ig2JSfhHI6IHFm6KeuA==
X-Received: by 2002:a05:6000:1546:b0:390:df02:47f0 with SMTP id ffacd0b85a97d-3911f7bb461mr2279778f8f.42.1741183772882;
        Wed, 05 Mar 2025 06:09:32 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:334:5d7f:7a52:9e84])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e4847e62sm21374802f8f.67.2025.03.05.06.09.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 06:09:32 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Michael Trimarchi <michael@amarulasolutions.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Marek Vasut <marex@denx.de>,
	Maxime Ripard <mripard@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Stefan Agner <stefan@agner.ch>,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [RESEND PATCH v3] drm/mxsfb: Remove generic DRM drivers in probe function
Date: Wed,  5 Mar 2025 15:09:16 +0100
Message-ID: <20250305140929.174398-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_060935_263630_76DB7D9F 
X-CRM114-Status: GOOD (  13.76  )
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

Use aperture helpers to remove all generic graphics drivers before
loading mxsfb. Makes mxsfb compatible with simpledrm.

Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

---

Changes in v3:
- Add 'Reviewed-by' of  Thomas Zimmermann

Changes in v2:
- Use aperture_remove_all_conflicting_devices() instead of
  drm_aperture_remove_framebuffers().

 drivers/gpu/drm/mxsfb/mxsfb_drv.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
index 59020862cf65..e5eb644b54ae 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
@@ -8,6 +8,7 @@
  * Copyright (C) 2008 Embedded Alley Solutions, Inc All Rights Reserved.
  */
 
+#include <linux/aperture.h>
 #include <linux/clk.h>
 #include <linux/dma-mapping.h>
 #include <linux/io.h>
@@ -361,6 +362,15 @@ static int mxsfb_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_free;
 
+	/*
+	 * Remove early framebuffers (ie. simplefb). The framebuffer can be
+	 * located anywhere in RAM
+	 */
+	ret = aperture_remove_all_conflicting_devices(mxsfb_driver.name);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "can't kick out existing framebuffers\n");
+
 	ret = drm_dev_register(drm, 0);
 	if (ret)
 		goto err_unload;
-- 
2.43.0


