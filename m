Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79052D5E368
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Nov 2024 12:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=42exLch29KQ7aLIpxUbDK7QotO8PsN7YchUut2Ri5WY=; b=z5T3wJUXHJt4pY8L7YO5JgAKYT
	hoL5wqSF5THedDhc/uJfQ/Km/Tx7IbCuCKlmQwUN1D7mqz6hdzlIV/sGcXmOQumXBJLT1D940kYO+
	a9ZiQVWpBNZ0+7agA6lNGK9JEKoafo4e+Vlg4VW0hgwzeVDDJZcIcCfdYhPqZJRto5gijiuEZCy7r
	HD0/cvItAGei8mfhm5SOD9tgVDigC3+mXzBeKXVjWedZHPahcVyFZ8hrZ2HerZMyRK19xmB3rQkyr
	oLdP7hfQZ6wzmxjdVBJNZjq2gXZR9KPXpJEhY2ArYGjbLv6WuLbG+D7OrHGCWyr8umYCtCXKZ/yTn
	tsH3Q14Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9knR-0000000DKDh-0vQh;
	Sat, 09 Nov 2024 12:42:33 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9kgW-0000000DJ3n-08qH
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 Nov 2024 12:35:25 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-539e4b7409fso3588382e87.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 09 Nov 2024 04:35:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731155722; x=1731760522; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=42exLch29KQ7aLIpxUbDK7QotO8PsN7YchUut2Ri5WY=;
        b=x2atpNHaprGaG8Wr3eUa4sKnk+H0fkQSFDHXfuHR0nt69RiMYyIxJQaaYjwLW0a3q5
         IL4a8HZMIxV1kdR3Y2kDTcw4YuGI10VMcGfqVNst91j1mB3cWUCelY+cojT2tCQb0G6a
         Hx8ryjocGRcPT2r4nhNVz2aBWaxCK8rU/yhzeJZRtgKGY9vZoSfx51aezcdRB+Zi2cxT
         VO55fcdHcrcqF5CSs3rsfRW8vxD9vmGqp8tyjbe76TzaUYyFg96Q9OkOAwczZ9mCTxhP
         TPJ/JqWWSK6GuXBqCxU1qIqF/tgSiJmV+Y4Ee27IVT94uND5K9lr4wqyTPxUgf/hM2eu
         eXrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731155722; x=1731760522;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=42exLch29KQ7aLIpxUbDK7QotO8PsN7YchUut2Ri5WY=;
        b=YgFWDePsBf5PkwrcM7jx3ZKJl67EcFClllGejBL4pO5AGyIbIlJHCY/diQVbKcMgaT
         n3HgqqTs2kVrj6hYq1xA95nipR2iIu6PuijD0LegGx6UbIOcQ2YJ6m8SJqWBPXiuwn33
         fY0nwTA0OY36mUhqVoDlpsxa+p7lEe2HRA5ErRcHofPMje13zsjR3f9eIQUw2Opv7XMh
         RJgUkeTZnFj0eg87nTwLZ/psL9D0mUi65wpTnjvm+/IYOs4ErPBC1ZQ6vjlI+5r/hIOr
         hmKH6Q62xMfWByfcze2NZxj4R1u4ElYwx4r/drue477QqfNvtwRAIbALotByiFIaU3wV
         ouyg==
X-Forwarded-Encrypted: i=1; AJvYcCVHc3IVH3PwH8zdLpVDVLU/82mvzgF1VU/U1c/KRpHG14LurqVjtmJNaLFbb8PHAiMAKi1QTu4wuHIO/pt/qGfS@lists.infradead.org
X-Gm-Message-State: AOJu0YyAEyx+tKv+4NjA+YHfX5f/pVRMPXmZMCTKt5I7FT2vtj/vVMhQ
	hkcwuy9qIVTnj+oHmfzJCq8EFD8UKFkqu1vX37b5oRINBn4plEIFvu8pW03PdKU=
X-Google-Smtp-Source: AGHT+IF4/eBJh19k7QgFTqtYdnnffmTFfXf5+J78TQkqLjRVT/odItDWynAUIGAavfq6S1uNQ3S3Rg==
X-Received: by 2002:a05:6512:3b0f:b0:539:e2cc:d37c with SMTP id 2adb3069b0e04-53d866b20c5mr2162656e87.3.1731155722003;
        Sat, 09 Nov 2024 04:35:22 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53d826784dbsm922899e87.15.2024.11.09.04.35.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Nov 2024 04:35:20 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 09 Nov 2024 14:35:07 +0200
Subject: [PATCH v3 3/7] drm/vc4: use drm_hdmi_connector_mode_valid()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241109-hdmi-mode-valid-v3-3-5348c2368076@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1406;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=HrGaJ3EnGO039JV3w0anWuEujv8ijZYE/SL4efGrI0s=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ7p+2D8f9f3f02SmxcyeF2ex7K28O/vzlAxeRaO7cXPNW
 zsuJYd3MhqzMDByMciKKbL4FLRMjdmUHPZhx9R6mEGsTCBTGLg4BWAi8XvZ/wepedeVGdUY/a45
 FTO/7Xv1pfz//KulXi+rvn++ruXV9J7NOxLtmRcxvg+wZrRovKntYX/l455LjPp/mY6/slNL/Pl
 IWeDX/SKHQ1IhgnO3qBnVF8wtvslfkSapYrigQPV1aors4rk70zwbriaaeRQcdeXdbrUik+9iTr
 3y4uDFNV95Qi329Ra9ez75iaVqFrfO4Q+ODGlq+7zjND5K1GcfK5y1cIpR3I81f1Sq0lZ9fjpv4
 h1f7px11wK7Fdc86Finv+NEnaX9fp3ZGteNPzDPa2jUMjdrizhkZfb2yw+FlWWPjxf++GQuHhh1
 QN72G+PP935pvX3m6Ws0Pt6+XhQ/dbleqv5FzZ6UOZXSAA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241109_043524_224602_CBF8E7B0 
X-CRM114-Status: GOOD (  10.92  )
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

Use new drm_hdmi_connector_mode_valid() helper instead of a
module-specific copy.

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
Acked-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 62b82b1eeb3694d1685969c49b2760cbbddc840e..486e513b898d7f761e8615f2afc193ca44b23200 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1752,7 +1752,6 @@ vc4_hdmi_encoder_mode_valid(struct drm_encoder *encoder,
 			    const struct drm_display_mode *mode)
 {
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
-	unsigned long long rate;
 
 	if (vc4_hdmi->variant->unsupported_odd_h_timings &&
 	    !(mode->flags & DRM_MODE_FLAG_DBLCLK) &&
@@ -1760,8 +1759,7 @@ vc4_hdmi_encoder_mode_valid(struct drm_encoder *encoder,
 	     (mode->hsync_end % 2) || (mode->htotal % 2)))
 		return MODE_H_ILLEGAL;
 
-	rate = drm_hdmi_compute_mode_clock(mode, 8, HDMI_COLORSPACE_RGB);
-	return vc4_hdmi_connector_clock_valid(&vc4_hdmi->connector, mode, rate);
+	return drm_hdmi_connector_mode_valid(&vc4_hdmi->connector, mode);
 }
 
 static const struct drm_encoder_helper_funcs vc4_hdmi_encoder_helper_funcs = {

-- 
2.39.5


