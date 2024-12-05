Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E1C9E7716C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 16:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Q+EB++J/yowUMrD7IvepBqWDVig6KUMpfQ1WpjD4ens=; b=01/4uwIPSF9Ty5yf6P0KWDFdLf
	S3o1bubr7pMvnMn9ZLW2XLE7bvXsXE3Y1d8Qwo9OP9np48rztceUbWR6+L46SCI/bWXXI053mIszR
	jeq2i/cJMs4A6hFan+96OPqpC1aWVckWV2ZljK+cBsQE4tWnE7LbQAJYIxx1lfwaNVVFbOAf4Slwm
	Wne6dsKzFHOwTt343hed/RM3pBPcLQ5HMhrLjW++NxgT6w0opSv73AJNijTmRs0/mXyOpppo6fTpk
	7Nf2WLXKeybcyw3gjAdlYWsgkBD/U32j5tkv32LCx7dqhD74pyfrJ4hJ/A9b/mCBq21wCC5P0JunV
	hLNhnRSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJEfd-0000000GjvP-1FFp;
	Thu, 05 Dec 2024 16:25:41 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJEeb-0000000GjiV-2J6n
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 16:24:38 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-a9f1c590ecdso26453366b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Dec 2024 08:24:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1733415875; x=1734020675; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q+EB++J/yowUMrD7IvepBqWDVig6KUMpfQ1WpjD4ens=;
        b=oLLSVyALyetFqaMlPmxCkpALz2jgEDKMnJsk2erusAhejSxZw02X2rZkSbbgLCIMS+
         9SlBgNqTRKm7H7rPlSRBaM3+OjvSCn09NEBSLzJVTBYJkHkrPd/3yiGamQNSzWo7rgxM
         B7kl8SzCw5t/3I9xUUOxFXGG1A7WaHKaB4sZs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733415875; x=1734020675;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q+EB++J/yowUMrD7IvepBqWDVig6KUMpfQ1WpjD4ens=;
        b=Y0+aH3P63bL5rffyzBsWNeY/VhBnN0wA0DrLRoEkv4z/yxqVCJU7LmGkaHc23wy/AB
         WkTDtcrJsnzS7rgBnRNoyF1CmqJYNsWUCkv6g/mF3AvyZcMMr8Zedhemg4JXcqWN1mVJ
         KvKWBsuQ+n3B7VIZ4S7MOlf9mKD+ZfTSVCC/Al/YUPJ3ZYGOVqnN5ZVp4G3CQJhSikio
         lJr6dMXEloX/Y5vQyBbEd93jAYxB4Rx/ep+QPoFSkW2ktPTYssuO4bM2nb3QWf9LVAjx
         6HzEgqQ9Wo5TmhSNTA3svAdyBibzf+IQNq+AUCMxD6KJ5L7iDLP2qlIRShmCuNQyI9/H
         5LAg==
X-Forwarded-Encrypted: i=1; AJvYcCW57KIlKaE5doJU99mgmAqHjWYjZNrMNrttGJHhw+llTclPQ9bvU2vSMy1znw/R7DtvtJ0arZQlqXaR7wfxm6CB@lists.infradead.org
X-Gm-Message-State: AOJu0YyfPOo2cSwZ9ckIYvKERQS5rqYE/GShco7OZo73d8StiYkvADMw
	fTiUYSo9PfpMY3P1IRjnzNkFyIl0dVrBi4JkbCWoMI9saRMVD40J4N2crAalJrg=
X-Gm-Gg: ASbGnctotcB4F/VLRUSF2igoQGIpMJ8USy9/mfsyk3SWOW0YbedfQGiuFTvQR/5MR0r
	fl5u+H1FvzdKNAxNsunfFOp+SpTXkqvYEeQFyuIpGvGB2mmI9dRtrmjosMY4wcfkE9McsLuejkK
	3cwUTx1P0cdFb9J7A5mpe7+nphsRUAGeEjVomTw657P2YVVpySn4VI3ONxDFjwplQi6ieI/Hwbc
	VARTRgIQhLQgUupzjCst/13WGeTwifNpKlkeBlh5mENb51x0Lu9yMGtrrdq4eTPd23xsMBgXAZO
	309fzv2SHQyryUc/lqfp7yHSZlVVz2Y4r+KeBJwsMHFRHg==
X-Google-Smtp-Source: AGHT+IGADqZ1DS4WW7fjZME67XfYyJ9/Ms38VwzFpIjDiSj4wLXET1zw9ysNdFxbGcj293rTqfarbw==
X-Received: by 2002:a17:906:9c0f:b0:aa6:24a2:697b with SMTP id a640c23a62f3a-aa624a27056mr315906766b.27.1733415875558;
        Thu, 05 Dec 2024 08:24:35 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2001:b07:6474:ebbf:61a1:9bc8:52c6:3c2d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625e4dee6sm112286566b.32.2024.12.05.08.24.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 08:24:35 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Michael Trimarchi <michael@amarulasolutions.com>,
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
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [RESEND PATCH v2] drm/mxsfb: Remove generic DRM drivers in probe function
Date: Thu,  5 Dec 2024 17:24:23 +0100
Message-ID: <20241205162432.1803869-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_082437_640077_64DBFEFF 
X-CRM114-Status: GOOD (  12.47  )
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

---

Changes in v2:
- Use aperture_remove_all_conflicting_devices() instead of
  drm_aperture_remove_framebuffers().

 drivers/gpu/drm/mxsfb/mxsfb_drv.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
index 6b95e4eb3e4e..10da8b54f4c6 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
@@ -8,6 +8,7 @@
  * Copyright (C) 2008 Embedded Alley Solutions, Inc All Rights Reserved.
  */
 
+#include <linux/aperture.h>
 #include <linux/clk.h>
 #include <linux/dma-mapping.h>
 #include <linux/io.h>
@@ -362,6 +363,15 @@ static int mxsfb_probe(struct platform_device *pdev)
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


