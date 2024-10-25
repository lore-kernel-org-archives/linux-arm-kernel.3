Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF6CDD149C0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 16:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GN13PFFztO+RVXylp070AHdpchWjZze0aJo+onIOSo0=; b=n/uj0tyRVk5mlXFzU9t+KRaDD4
	lFCOYfmEtIzLQnZIG7Ox+Qc7tPYRAnA/UWLnrKyYh5G7Sef43Djjz9FQSo8KmsRaSuwjFJIRoFliL
	kwatv+AzoqQKC7vPyTlJTFzkbuEqBphNo9WE7UbM+xZY9Euad7dwQF4ZqyF18w40kJHXxI0dr81sb
	rxGY83rUDHOtsqZp3cx7yRzNR+O8BwL0N4Ak0Wl1gLd9G1A99jZQDjb0DWki7xd86EBglo04M6tdf
	IPJ178Ko4Ss3CWQx2PYnH0rI+VEJ7gUxqXbPbSOemarJFx4qzRhmMi1iFWrS5f64HMDRDa/lxLSi/
	wnb3XVKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4MzU-00000004O1R-1Tqb;
	Fri, 25 Oct 2024 16:16:44 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Mxi-00000004NRI-1L0Z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 16:14:55 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-539f8490856so2184030e87.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 09:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1729872892; x=1730477692; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GN13PFFztO+RVXylp070AHdpchWjZze0aJo+onIOSo0=;
        b=jb4BU3DoPooaQJGAgyjcBBORDCyqv98ewun5jj+SYBSnkxguKhxIVlqJHIaq5Yjm0t
         qsfAC+uHYz+m9Yhr7CVg0A+vIijryAlJOKQSZshn7bl9qrP//sFOss95/Lv2q3tm6Mkf
         Ka0mhNDzfO3aBlI5WhVJWSVOot6lVU2Y9Ge+c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729872892; x=1730477692;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GN13PFFztO+RVXylp070AHdpchWjZze0aJo+onIOSo0=;
        b=uC+mLj/14VW/W1PIul4ooqJ0bCjAKn0z3v72l/uCJ3L54HasMleaHR/1S8LZWJhqK6
         S6nc4hqsbVTw4HHbnLVTeBr88GUExVAyx/GbzrUE/4wmffuBtESAeWpDjvXDAymo5lvr
         0sCy6f9BUpKy5oYzivUyVWlxt10qJ3NRRCYMH8A+uN/MDQwVhVSwXaCc8ZdUYm8bl6Di
         4BD1GH5Itr5TDXw3fSPiTVjTZKtA17MXFXqpjSwkCyNGhLmw78nz5+0lbTWhYWtWnDxN
         ty1qTcrpnrTwGuxdRoO8msTEEu3/oJ5Thl9E5Zd6Wl887iZfVOkGokA4Puj6xpZ8vZ3s
         wf5w==
X-Forwarded-Encrypted: i=1; AJvYcCWVwpEn0vbpkjuz3UD6KjWopCBtr5DKTxE5N501tz14dDLv2sqml6+U0MbTqRUTgNHlZKgMGCPwTivEBkwnAKFN@lists.infradead.org
X-Gm-Message-State: AOJu0YzM2onEIj+65U6m4NnpeigAjlEtCSHsMhn/SFth1kA7546VJ/Gn
	eHzRP/6cR0et3CJU6csutxsc+aR0CRPKJzCjtRIW9rfUtKpvK5PhLtw0FKmPQM0=
X-Google-Smtp-Source: AGHT+IG7Ko0ZaVVixb42kGSXnwInD9+MTWs4okp1RbVG6KUd/qf/uSPa2qcn+su4qqA0sbbCFTHNBw==
X-Received: by 2002:a05:6512:3054:b0:535:6992:f2cb with SMTP id 2adb3069b0e04-53b1a36c6f3mr6404231e87.42.1729872892194;
        Fri, 25 Oct 2024 09:14:52 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.43.251])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4318b579613sm51759005e9.38.2024.10.25.09.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 09:14:51 -0700 (PDT)
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
Subject: [PATCH v2] drm/mxsfb: Remove generic DRM drivers in probe function
Date: Fri, 25 Oct 2024 18:14:25 +0200
Message-ID: <20241025161435.4114877-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_091454_388466_B5AF0F15 
X-CRM114-Status: GOOD (  13.22  )
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
index cb5ce4e81fc7..d140984923fd 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
@@ -8,6 +8,7 @@
  * Copyright (C) 2008 Embedded Alley Solutions, Inc All Rights Reserved.
  */
 
+#include <linux/aperture.h>
 #include <linux/clk.h>
 #include <linux/dma-mapping.h>
 #include <linux/io.h>
@@ -360,6 +361,15 @@ static int mxsfb_probe(struct platform_device *pdev)
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


