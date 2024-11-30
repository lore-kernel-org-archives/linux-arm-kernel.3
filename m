Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ED48D735E4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Nov 2024 02:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bi+JDxO7zFRVUVNShSHXAVY8nfszGwV4/oGBGiyAqww=; b=3z6hZbYHXcxKFdEpWKM2iL8Qsn
	VJojzgIz6ZRqLUWHx/37TPDBgW9buCGYk/cK9ipdCnrJvNydyhxNnT/Jf8xxiGaCQuQTuI0IotUrt
	e0zLGtOFcGu4xTTcB5vPMJvAXLV8zn4rjtD4U22YkXVyf6PoQ7ZzMF1DK1Xi4ZICE1nlHQBEt11R/
	nBKHSjd492sShlV3PjMq1LQV0hIGYJ9SHCJfkptadPuRfJqTqRwugIZuWXy77bVMugCm/xPrqclr4
	vvDEhIC68tD4PmKSKLYhhmgiriyxp1YfnKpSeEVmv9fCPzCPlROrQwpQS/Y2VupyF7892FQ171ANz
	zBhMAFAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHCmf-00000001HpX-0plU;
	Sat, 30 Nov 2024 02:00:33 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHCfG-00000001GWN-2IZ7
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Nov 2024 01:52:55 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-53df1d1b726so2909613e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 Nov 2024 17:52:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732931573; x=1733536373; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bi+JDxO7zFRVUVNShSHXAVY8nfszGwV4/oGBGiyAqww=;
        b=UzIedcNNsStE6HjVnr2z29JD1UMtqZaqFam5kjzj1d7BMUIKs05Q+GAjCtV8lq84Px
         MBY4jGGwvNXMqG8XEM82CpiOCyP7EVdp7h9FcYpH6Qt93h35RZ8kOLuOvXhwPgvXsYui
         M30erzJ+pZR49FrL1urQ9sek/pPg5ArnMDHFldpuyZsUgt2kpA4AP76g+mQFIMnkuU8F
         f9WN11rCkKASEJg8PfpZbyEdPinxJkNXNejaktyxQ3L6IoLWSRWVhn9mavnlvkkv+787
         oljIaUWfPADxaReS1Zz40nJcykkAEmKeKSKjWrNU3i/N4OZ++8EITaKJ/iOTNzWgSS9w
         CZ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732931573; x=1733536373;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bi+JDxO7zFRVUVNShSHXAVY8nfszGwV4/oGBGiyAqww=;
        b=bKjnag5d2yuEbA407drno7ZVEg1lvzaS8u+Eoub9mmPV9Lv2CGEqYwdbk2heuFDdlO
         ZH4VQutlguZ2iE+SNsnj5B+2j2O2O+1oSQdBjZfW7Sr4eeseXNd6PnQu82lkCRCAQvFV
         wMjGj5SqSzbam/5FsTF+/crd2RGMd4FE3T4SckngHI3M9xNtJe2tveXEMwjpaG5je7GS
         eYLW0J75ughfFqJCK4Dn9sgi3LbttRkQnxDXYC+LQJ+J521G5zDrM4mBZa9doxVodHXX
         gcfsLRWfOTWG4E5WwUvtLGmDYE55/4nCelmUhwnH8Gz89dIRBBmkJtTVRuoGaggbzY48
         0/Sg==
X-Forwarded-Encrypted: i=1; AJvYcCVXkPSjqUQAUm4DvxpqazRCCygi3l9EP/BXldtWSqXLHXxxNSOSN8u1MAAfUEf4/3QvR1nSFQmcB28OCcUc5Ni0@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/2TF3zaAdVm/AD4BEMehkNH4i5z39WHSFXUD4Pc/m+XJns0oT
	sXQF9PjbwqWLMo028aot7O59avYGj7QkMYBOAlGF+lGAUd13THQ2TyE8pi5cELU=
X-Gm-Gg: ASbGncuD565eSZ+p3/UHwNfUB4875XZ2suWssOekajRgUkO55cior45xPyyYdhmj4ee
	/zKAa27FFMYJBxay2xuu1tU59u7qkNL6y2sWNC3ohdxAgjIZxYvgGVWqN6sf6Y31hHfV/MvyUqc
	rYJkmhmXQBwVWGnYKhbuebMWhvTQBF9Gu10j5KG+XqVMStoJcBozI1+b/8Pdi2hxBrRXl+adn31
	4nDFPRxb9ZZ2cd+Lg7mC/mDlWj2V/a5qgHvhmTBKqIPR6z5y18NPnM55w==
X-Google-Smtp-Source: AGHT+IHEYj74nFURYbWP3Egy7gi3UHFs7eYCLy23sHhESjuboylGOmyFITklL7Me2c+2Ybp446w/LA==
X-Received: by 2002:a05:6512:2309:b0:539:8a9a:4e63 with SMTP id 2adb3069b0e04-53df01046eamr8488039e87.42.1732931573080;
        Fri, 29 Nov 2024 17:52:53 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df6443172sm636408e87.84.2024.11.29.17.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2024 17:52:51 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 30 Nov 2024 03:52:32 +0200
Subject: [PATCH v5 07/10] drm/display: bridge_connector: use
 drm_bridge_connector_mode_valid()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241130-hdmi-mode-valid-v5-7-742644ec3b1f@linaro.org>
References: <20241130-hdmi-mode-valid-v5-0-742644ec3b1f@linaro.org>
In-Reply-To: <20241130-hdmi-mode-valid-v5-0-742644ec3b1f@linaro.org>
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
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ7pX/oMCB23f3Dl28T72F5rnzAu3MnESPs7t7BUhWRXw9
 1Lk0aJORmMWBkYuBlkxRRafgpapMZuSwz7smFoPM4iVCWQKAxenAExEYR77/zqjCu2Eb83GP2fZ
 /I0qDXeMSL5+ZYbQYbd19606OYpCjUwuXJVSWeoa81rz0QYu07WsVn16WVMTGYueu147XR13uNh
 T6nVdSniXWePDn3mXvlrKHK50mhW0c3t02pUchYWCVXP7qrKitdadmLXiWI+o8cfyYlXF02Eyly
 7cTX1bkJGqtlrte/5e5WlWG9zv7gkRnvf55p2Lfx++Pbnlt5WNd9oMfjsnb9ajO+81VjS/XP3dY
 SrHTqfmxbM9vTmF2xI8hFOWLHGOvlCeUKheLD/vQJrwwT1xHc6L65eUXfbzuar8Yva7pbNVep+6
 KVt/9+9yTnXT9hR+d2mlSIHMxvcmVV+3q8leDvuV/cYaAA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241129_175254_592234_08FBFF05 
X-CRM114-Status: GOOD (  14.11  )
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


