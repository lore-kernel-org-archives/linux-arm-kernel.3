Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72CD0C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 15:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jC9QV0bJcgZgqHHH3SUMbf/vptPD4PQ0vRL1kkv5HIw=; b=LgGhIGu6QpyN6eVRS9KDw75a3D
	ZHQ3MvRZw0ttjM2vqRVltkBTyKLbPuiLnryZ++apA/Utx1M9jmiR8vyWfavcGlGv7UODff7JLv1yV
	dL8VBuSI/Qx/OxEsr3iUvF8dvBC/TI78dYh7i7wCsORfsj4/oyC/G3jCNzVJplu0minGwQRWin3Xe
	+ERx4H+TlVgBK7NRtUwRreMtLIp355V5m/TBo5PnUrvBoOG/nNiYXJOsh5mQoKbLJPM1Mutlm3D6U
	dtNmyefMMp+p7Y2G4XHaT1UgCtFohYMoxBtrXJL1UyvdMgA71LSv+d/A4lqSaJ4EOKgdSiFCcWmLy
	vuJU8jVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tixKi-0000000FFp8-1rw1;
	Fri, 14 Feb 2025 15:10:24 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tixG9-0000000FF4B-3Cls
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 15:05:42 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5de63846e56so4016297a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Feb 2025 07:05:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1739545539; x=1740150339; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jC9QV0bJcgZgqHHH3SUMbf/vptPD4PQ0vRL1kkv5HIw=;
        b=Sdg27580wI69Ru/F1K+LtqE86bIZoYOHlRripX014MBU+Itt7pn6knbjsZ3BTt3wai
         /JyN9Ch3E/xVEdwaXJSJkY5BUR4ViiYG8d70cRPPV3avgzHKv0mZHpJQO2MbDYjj/uzB
         9zulIUuEzfR22PBIm8g+XrulSBPoHx6xT9R+4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739545539; x=1740150339;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jC9QV0bJcgZgqHHH3SUMbf/vptPD4PQ0vRL1kkv5HIw=;
        b=TtfWmzcp4RLqDl9MRf2gl6cUDdGk4PfDVDU5vsHBbwvRZOOpp/SalQWwX3ypSEKlT1
         9q5q1ya9UPPJdMklUPnY6i6+nqyybJ3IqcWVXQsFWJKyaL6N+CUzrXiTI2WkFJz01Ohj
         TKMVhO8FLiZnXs0BxKN7u0kOBsy8YfeCZ6cBALZa/JoFtseeY+GAiuHwLBU8qME+H/5b
         oVQyfmT5n0i0rEgU5EPnQjKg7NJYXYJOOkXceznAlAU3LTq4OheCas88KSmtQQiTmSZ2
         /1dvLHiPoXe6HUET9JahvzmBVRbM2vp7Jy7JqAtObOrcnVQcv+NtuIVFTp2R5VVyohv5
         Fbug==
X-Forwarded-Encrypted: i=1; AJvYcCVIvTsb2kChjS8aL5+blhBrWzSI5EEWVhuHAqN8/jvxv10WLZmAnh000LWAaoqFmGTi+eIAklCbGV9xdE78//SZ@lists.infradead.org
X-Gm-Message-State: AOJu0YyNpK8mqDY2RYMKxrKhXgG86bmzgNUvzF3NbXJknbGeHtUH+RAS
	v4SIiwkwLxEgNjOoE5JMNg3TacQMmO64+GBLNR2ApOtQSiGh0LurROkUsbnf/sU=
X-Gm-Gg: ASbGncunVV86dkxOXd2BN1yIX1jYN+KWfBSaT6/jUur0siEgE/RMgHNU4Ct12XTPext
	L25EsT8REZolGuYp46pMOhmbCT15KoVF1peg8938NmTea7XyIhgcvVVTcJk+sr5gHda0IJDv/+4
	fCMA7+fJm37q4YAduL3VWeOEmXnVSf1BcgBlKkrLvyNeg6KA/xNV9qvBIoOfSZ1kDe0PiZLNou6
	05IMC8/jZKowBteF4wkOrC76IhV9fd1BK9JS/zOud/1wUXeJ3IFi5Z5T+eNgn9O08ckN2avKdgQ
	8H4UhfgS5d3Yf9xv/rjkQ/epR5HPhDuGCpbOiseO6fLCR8H1eGx9prIB
X-Google-Smtp-Source: AGHT+IFZ+c7+go5Wo3r0b5Kv+36ob4O06Y3nn1YLZvsFSFjUvUi9yBoXLR53Qg4HfytiBB896uYB9A==
X-Received: by 2002:a17:907:2cc5:b0:ab7:d179:24a2 with SMTP id a640c23a62f3a-ab7f37149dbmr1273515166b.1.1739545530075;
        Fri, 14 Feb 2025 07:05:30 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([176.201.8.20])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dedddd5b82sm1421906a12.30.2025.02.14.07.05.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 07:05:29 -0800 (PST)
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
Date: Fri, 14 Feb 2025 16:05:19 +0100
Message-ID: <20250214150525.1505210-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_070541_821238_985BCAB7 
X-CRM114-Status: GOOD (  13.25  )
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


