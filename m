Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35D80D5E368
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Nov 2024 12:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bi+JDxO7zFRVUVNShSHXAVY8nfszGwV4/oGBGiyAqww=; b=zq9e6zGXzxRLs8eZHNDTVOJuHR
	fOOzWm+DDk5eUE0weB+JP5eYMlsxiPafQVvjQ3bk8FJW+ZHTKyAL2OJ6s4MTYF+d9qfypEqVt6awC
	V94LmAJJgzPbeXMQX0C0vFTwhOD9j7rv/VpdR8xBCFUxLtq/9rEZ2lkmh5WBSQk7DitiQT3zA6ZZM
	QTwCjmF26gAA4PTLtDUgrTalMRpD8JRBRhVoKvD32RoX/6ta0lX3z420kCbHbahFoxZCvPLe7B443
	LmmlfhjCNXYkze2UrLLOd2hK8DlOQzkoyyu3qT4Bszp0ka1G+KGAVinW/cYhE5J9AqGXYkN/hgeVs
	U9whHHdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9kp9-0000000DKOP-25I9;
	Sat, 09 Nov 2024 12:44:19 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9kgY-0000000DJ5c-0ZKp
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 Nov 2024 12:35:28 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-53c73f01284so3728323e87.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 09 Nov 2024 04:35:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731155725; x=1731760525; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bi+JDxO7zFRVUVNShSHXAVY8nfszGwV4/oGBGiyAqww=;
        b=DoyXiZXzvokLHM7yv+xQGoy0qvlC7WEvttOEb831qNZMX/8Bfrj8dIyqKJWHe+ese2
         LVIrkH/jJMaYbJ4VYk5b2IbmpoPgN9rFb6WkvjuV/Tp4/9G/fKK68pLPAETr9pN1DMpf
         NPJ8sqZY34ykgHjcmnAO9PXAVf7Xto0RdiPmIjm3+gTQTzzvwuejPDTdb3yQwKgWDH8W
         nwYB6VEJh2RJYHl+AyWVuWGU5lYJeRQYm4BlUbjmLpyEqcIWEXHEjtD521W0xUvb8s8t
         Pu5JII1BnVm3MB3po4XcOrDfD6XkKRTEh71bYJvsjrOK0Zil799fd5LkVsGqVqq6gPQH
         csnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731155725; x=1731760525;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bi+JDxO7zFRVUVNShSHXAVY8nfszGwV4/oGBGiyAqww=;
        b=eqlzbDgmJR5MZs8nXCysym5H5i3N1YMsJCOFvMsr8jHSBNFuWD6u2LVJKwmdUoXgMx
         o4Nrb3FAa4RK66OQK9+SiMQj4D4JKRdm5nG+34hKiKmIJxutar3wzFYqjAC2CW8X+bok
         HQXJHaKAAFIur+vepGGHdSnVhiizGXXv/Y2wkUXW+pm/1ASUgoSutt9B70vQSlwCZM9E
         CPnm+rtB6yV1L+epFZl8jWT1gMFSfPKPu1ONmQtubnNWIN6sfYxd2GrQ+yIx2z+w1CMD
         yymiD/HvvmLcjBHSMXOouhA3dj2Zc2Wdk+/+LkWnGzzguQi94tjXRIK/hV0lwgz8H7vX
         kbVg==
X-Forwarded-Encrypted: i=1; AJvYcCX87nyCMqJcIx860WVpeYRvU4RWreOd8lbmGMwbNl7tlELKiEn94w+fvPnDwx/gVfb5/210jJRCfsSGgGzP6XaY@lists.infradead.org
X-Gm-Message-State: AOJu0Yzk9Aoo8J0RjwFKyz9UB19Aip8Exxmat0qQMj+0/Lpc5Pw+fw16
	z+f9DSuoKNwGQzXdAb9HsZSpi1JqevxQxbVlzM5pkFRL8BLWUCD1MEpHGeV/YHk=
X-Google-Smtp-Source: AGHT+IG2mF9zXCA/y3y0kG03UAbkXGpNVLSwpOM/qt6TF2Y6MK5K8/eQXGRo4a4HPRqLDiFR1eFg0A==
X-Received: by 2002:a05:6512:1592:b0:539:f51e:2465 with SMTP id 2adb3069b0e04-53d8628a83dmr3060627e87.22.1731155724584;
        Sat, 09 Nov 2024 04:35:24 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53d826784dbsm922899e87.15.2024.11.09.04.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Nov 2024 04:35:23 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 09 Nov 2024 14:35:08 +0200
Subject: [PATCH v3 4/7] drm/display: bridge_connector: use
 drm_bridge_connector_mode_valid()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241109-hdmi-mode-valid-v3-4-5348c2368076@linaro.org>
References: <20241109-hdmi-mode-valid-v3-0-5348c2368076@linaro.org>
In-Reply-To: <20241109-hdmi-mode-valid-v3-0-5348c2368076@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1872;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=V6uHu+T4+xW+xwMuVx/apScXj6PwN9KdCvTiBY/zzqA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnL1b/KHIaludY1+1CnUBh/lq0s+PtcC5v0NONs
 Pv90ths6RCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZy9W/wAKCRCLPIo+Aiko
 1c5rB/95XEPGSJ2I/WYRUC9L7roQJ7z8kswhRTv6gT+rta7yHL8pZMMbulp8JmYNT6Rk6+a0XTK
 Z46yGeFYciY49oWjdprjny4+rAL4woYLtKm7yJFmib4najumMWlTV+Pj0JggMJqKwSTFZebEbZr
 xPGfugM6N8F456I3/6sjXptKWIF+VOVGk2tCwSDNlK5K3gX5l2adzR5ldrIquHhJWkh4ySTeUnU
 lJro1JwucnZoQ3+bJ4VWkPpcN4sZUWiMd8Or9Zknb6b9gLWnpIaANiowZHGh3Q1FHVaMUvnezMy
 lUGU0SiMa9kFJBSSehYWwauSlUUfkAEePIgEdIJPy/WCafW3
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241109_043526_220712_E0EF1994 
X-CRM114-Status: GOOD (  14.17  )
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

Use new drm_bridge_connector_mode_valid() helper if there is a HDMI
bridge in the bridge chain. This removes the need to perform TMDS char
rate check manually in the bridge driver.

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 320c297008aaa8b6ef5b1f4c71928849b202e8ac..512ced87ea18c74e182a558a686ddd83de891814 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -18,6 +18,7 @@
 #include <drm/drm_managed.h>
 #include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_probe_helper.h>
+#include <drm/display/drm_hdmi_helper.h>
 #include <drm/display/drm_hdmi_state_helper.h>
 
 /**
@@ -299,9 +300,22 @@ static int drm_bridge_connector_get_modes(struct drm_connector *connector)
 	return 0;
 }
 
+static enum drm_mode_status
+drm_bridge_connector_mode_valid(struct drm_connector *connector,
+				struct drm_display_mode *mode)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+
+	if (bridge_connector->bridge_hdmi)
+		return drm_hdmi_connector_mode_valid(connector, mode);
+
+	return MODE_OK;
+}
+
 static const struct drm_connector_helper_funcs drm_bridge_connector_helper_funcs = {
 	.get_modes = drm_bridge_connector_get_modes,
-	/* No need for .mode_valid(), the bridges are checked by the core. */
+	.mode_valid = drm_bridge_connector_mode_valid,
 	.enable_hpd = drm_bridge_connector_enable_hpd,
 	.disable_hpd = drm_bridge_connector_disable_hpd,
 };

-- 
2.39.5


