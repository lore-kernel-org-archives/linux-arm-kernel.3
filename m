Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DDDFD0BB5C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 10:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=f9ybzaQqZA8Pvjk1KH4zw/EHpgyxOggbtBG60Qj3t28=; b=Dou70NJ9Bip++L5ykUWWrY4gBM
	YvjjwKXfVvXdEWFHMYVHMdJ3usk651kSAeyp2/0bOB7bmvswwHzkFR9DHSqtNjIQ0OZqRi8DqSKLS
	fTH7WB7s7TC5X3+bKZc0TYD4b81t4vDuYPsejoXHSWseAp4UEiTrdu7azzrLpoACWaAKNoUNBR1JH
	TWWWDhW7niB/prT2nO8FsJdPjLfrfWEMolj+89bE32uHKfpCl6uwJC2zphMnPWTl98/zdlPDjpDM+
	oampyTNiDDw7Kis1w62WXKqiaF9oxo/v1EZU4Dak/fAigSxQGIJw7HNQOh/INxLCcz1mDkYB8Z0rw
	OoTgtSNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3vZ4-0000000094w-0F0M;
	Thu, 24 Oct 2024 10:59:38 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3vMx-000000007Ad-10WF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 10:47:08 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5c9709c9b0cso980521a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Oct 2024 03:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1729766825; x=1730371625; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f9ybzaQqZA8Pvjk1KH4zw/EHpgyxOggbtBG60Qj3t28=;
        b=CZ2Y0ODBRNZB53DkcwpdAX+GXw2/rmBnSgc001OCxKcDzal+9lieJK7Q6fSmnRRJTZ
         Jud44EhqOIgyBUhlx9Fq+CLpFjwor8+YTaQX8IviwySduCqemhIh+DUgITw4lQu6IiNH
         R+gSWvOQ2Ahhn3xzLX1mNy8SW9Da8cTwGnvD4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729766825; x=1730371625;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f9ybzaQqZA8Pvjk1KH4zw/EHpgyxOggbtBG60Qj3t28=;
        b=NiZ9PMpXthXFtG80fGn64F6NERSLbsn/ZIViYpVfdvnr5YSzRK2eNAS04iUqqE6l7H
         wzGykYcdi1fEd0JnUBivxBzaYvncJHAs1+TUG9F5Vizj4uCtnL5CIAuI+aoft4cs5lAS
         zcAaaxFYEBaMJWyh6DBjyeRi90iRpEhr+VsuTTSUP/hIzk0AQhPVIUsOjytFvKVmdDnV
         WXTy7qdKQINBUn0ZQaLb2qT0M+IPSdh3/rKwL/YPNmXeJsv1FAqGh/GclLp7PRC5UYy8
         Yg3oYns1/i2rrzyB15vt93cyR/YMTAsN4hVxwGJC5o3s/dgRtJMWOXChpqIG3qZYW3nn
         xhlg==
X-Forwarded-Encrypted: i=1; AJvYcCWnUeJN6IT7+f2jTuRKWNpQI5gTwLAMLqPukQZF+igoMOt1u3AmX/TmZ/tXKVvtncOUAQI2Do7Szoz/aG6XNAvh@lists.infradead.org
X-Gm-Message-State: AOJu0Yzi2q5qoxn3ePz2mfhlkYwSnDgFlPSmhKJSzf3ldiZSG/58xt4L
	E/Z3PIBgCfRZMFCmmFBjb/RWbY1d7MJ4CwRQxRZado6o8ipxDa/DnUPCChbQRUs=
X-Google-Smtp-Source: AGHT+IGhRRSH+oniiEMk6gBxA1VDr8hXYtyBVOVbECHZq5NiyEASc4rpB50zkmMNgG6T0wMWjBuJiA==
X-Received: by 2002:a05:6402:278c:b0:5c9:709c:247f with SMTP id 4fb4d7f45d1cf-5cb8ac380damr4405184a12.2.1729766825261;
        Thu, 24 Oct 2024 03:47:05 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:f79d:49dd:b804:3f48])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cb66c72866sm5525261a12.95.2024.10.24.03.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 03:47:04 -0700 (PDT)
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
Subject: [PATCH] drm/mxsfb: Remove generic DRM drivers in probe function
Date: Thu, 24 Oct 2024 12:46:49 +0200
Message-ID: <20241024104654.3483125-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_034707_305976_ABAA36B4 
X-CRM114-Status: GOOD (  12.64  )
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

 drivers/gpu/drm/mxsfb/mxsfb_drv.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
index cb5ce4e81fc7..a8d6dffcd02c 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
@@ -17,6 +17,7 @@
 #include <linux/property.h>
 #include <linux/pm_runtime.h>
 
+#include <drm/drm_aperture.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_connector.h>
@@ -360,6 +361,15 @@ static int mxsfb_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_free;
 
+	/*
+	 * Remove early framebuffers (ie. simplefb). The framebuffer can be
+	 * located anywhere in RAM
+	 */
+	ret = drm_aperture_remove_framebuffers(&mxsfb_driver);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "can't kick out existing framebuffers\n");
+
 	ret = drm_dev_register(drm, 0);
 	if (ret)
 		goto err_unload;
-- 
2.43.0


