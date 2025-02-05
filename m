Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8F93C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 15:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jC9QV0bJcgZgqHHH3SUMbf/vptPD4PQ0vRL1kkv5HIw=; b=stRmc3HqwCJEt8BPlJ1vwGtwM2
	Q4VEYqDU9WGnqnKpJIDzQuB2Z6tbsTAOxyxkLBJzmR/erX63wJWJcqyMf3A63qIoHClL8TxkJIXRb
	M6K9WYB53DuP9aQuQRO+2vFlx6LOI2/AF1xm7r/TI41c5Yr3za+zt0k8p//GOv83PvjXhbuEiDxGf
	AqCxqOhKUdY4d+1r4fb4UHE2btSUR7d8z0QQainJXD7u7d7UftkRkB0oLf43n+6zgW7rUrrcRwKxT
	5DigcQHkZkflpByrsnLaElGEiDx6FVLIyJWHdoVPI677w3POWrvD2Fvy79Td4G0kiV7itHBRXlOmy
	WqIVriPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfhWS-00000003oUJ-0127;
	Wed, 05 Feb 2025 15:41:04 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfhLY-00000003lpa-1vG5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 15:29:49 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-38db0146117so979063f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Feb 2025 07:29:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1738769387; x=1739374187; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jC9QV0bJcgZgqHHH3SUMbf/vptPD4PQ0vRL1kkv5HIw=;
        b=XerbbnrqaOyBgJ1SEZgaQrAFeXu/3Fo6BsM/5IOY+rNuzcOBLzwVKdQssuj+64FJMp
         nh8kwGoVflbeLr0MLDS1y5qi73UQyH/WZQUid8EcN7/M7/B5BX4yP39Y5AaHVbuMI+l5
         gG0EkdbpWH6xs8jXyUdSOP0Ku+C6XrjFISKyA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738769387; x=1739374187;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jC9QV0bJcgZgqHHH3SUMbf/vptPD4PQ0vRL1kkv5HIw=;
        b=YciNI02ZxKPaifGphkKcJCWponvxOR8eHdKJjvBuoFW+4lMAD8G0ZbqNw0vWBeHHrR
         mHJsGpTu4m6BKFsoCI2ahyrfukNKBLkPSFbB4nDtJx5CZDgoryQ9hzPzNolCIWJ8M64l
         P/an14TN+VV5kuDtKDkmcpdFFHFlSYstG8CQm8+5aC3rjPwp0qfi2KCg/oO1+tHGODTf
         aA5MWia7TPL6um8njJGiKJaHItu+apS9YHEJ8M7hJoCKHG5VShLMgiA5bqze/8hOl06G
         uJSMGJRUEOe6uUButZYrKNc0HxxbP/MS8NRaalWNFkGKq0wYYTUJW1BgKlpG5LTNBfsS
         Bucw==
X-Forwarded-Encrypted: i=1; AJvYcCWokkwTZ7Oh6IxJVx8CqlcgtQDfXzIU3ZLOugS7UjZjHPxbyXL9YreRtmRdkv9YNX6KQXfMYYPn0k/kDXwOanGh@lists.infradead.org
X-Gm-Message-State: AOJu0YwDJSaVNp5DiN8ipLGmJsfPETF84sz44ah8Sb3FDERzEC3se9MP
	cgqQFFvHpQPGgAgHCUB9Wqtv6SYu43nvRt5GPv0VdN9TqPFbaMpXX+BRTm0tuww=
X-Gm-Gg: ASbGncuNvCO1XxpnoMmyyygLTaMg/VrP700wBWNcDNmhOq0lO01t67ikOXc/XzjxPfJ
	zPG8YJ1N9CSrF4ro1uKf4yTJC5SLPAsstD8ux3Z/5N+hD0Nt20Kt9ZUlAJQxkUR1alOZCVzjCDt
	4Ff3uyZQO4Ciip55LETuLMtnPginrPnVtBVkN2qafEirq56cTQeeRHSWiUUnMN6AZh7C5N0Ux9K
	LZUYANxC8IL3XiYhMerk/8csyQcfNo6diSboGbF2J+RoadC40lk4Z7mjTYGqNlr55g45fPRIaaH
	YmBy2O2nm0HmGsYmEnoUeUWFeNYipjfUygB/7nxiWsjbJBLs8kTjzJ6K
X-Google-Smtp-Source: AGHT+IHUegMKoF3Uu+JDrnonpKTLGgAqfUbpAC5vcQvzwsUpc+CNMtcSoxp8JpOvJyhpCCI3zm2NQA==
X-Received: by 2002:a05:6000:1868:b0:38a:4184:151a with SMTP id ffacd0b85a97d-38db48fdf85mr2428469f8f.37.1738769386468;
        Wed, 05 Feb 2025 07:29:46 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.42.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38daf999747sm4475386f8f.19.2025.02.05.07.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 07:29:46 -0800 (PST)
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
Subject: [PATCH v3] drm/mxsfb: Remove generic DRM drivers in probe function
Date: Wed,  5 Feb 2025 16:29:36 +0100
Message-ID: <20250205152942.954381-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_072948_510930_7FBFCA54 
X-CRM114-Status: GOOD (  13.29  )
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


