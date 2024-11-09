Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA1CFD5E369
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Nov 2024 12:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rhftGPVLtDhe2UTpRu1zgEjgWPv2gRVws0y4aDafrjo=; b=U20Vc3hXij4A636eNmwzw0BsZn
	XRJOroEn08tXfhyoujYQnMlt+QwPg8KOZPmh/tnparSPH5C9+56xYQvZOKct7wpapfe1PkRDf0lmU
	DxD7UHDQmzWTdxCjsKFbKJvVb3SL3UZh6kCft2dIDWN6CUj4WvD78HKBl+hZNJAil1Gw5htOTuDUy
	118K+Q2FRQ3oPZK8rQqTEyq9adKIxFwKl+ya0WvrVFJ4SOB+rRi88Qhx1Nl9JV6z+rtgF0WoLYda8
	YuZqJBsNCWJ3fNYTNFeExsyYxWFugOqofvf/Y+Tgfv3UtPpbotfLqoNwJji93/FvDCdG7BaL/SRS/
	wlBjT49w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9kqu-0000000DKlI-04hb;
	Sat, 09 Nov 2024 12:46:08 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9kgb-0000000DJ7K-1xUo
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 Nov 2024 12:35:31 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-539e4b7409fso3588439e87.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 09 Nov 2024 04:35:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731155727; x=1731760527; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rhftGPVLtDhe2UTpRu1zgEjgWPv2gRVws0y4aDafrjo=;
        b=cyR8a4tvNE5DgkOZ/2wBGEoHqgRbA8zG+C+VK/je9Lu9NUhrnjTld3vJFoL6xecNtE
         K6iG0NhoCDKW7rkS5hzYotRM7GIf7858EIX7NBMe99rneKBNh/fb3kHhlde4KaFA3EaD
         UV9nDjePI8Aovq3ur4akesfxh9Z4CkK6QUeJ2GHH4J1czA2cV6cHLpd3lu5XEnxSh9OZ
         lLjsgtKcCo1AlxzH//xXW4p/NiYBzf2TlvSK4LAn8J8gu4wTe5JvSuBxhVFrtE6eARvb
         Es8QVEWW20qE54DZXlMz9IB8D9T19UX1JVBGoP/fNhYYUWdUAWd8W8tPp4JNa+GStoqf
         waqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731155727; x=1731760527;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rhftGPVLtDhe2UTpRu1zgEjgWPv2gRVws0y4aDafrjo=;
        b=MP0ldM6bY6wk4RYd6pPu25TK1MipqANNW+ErznIF9aDQn1XPaLQeWcSKiAVcrHudES
         PIBB3v7RY4mNO8GGq+KbcUUhP/M1xbPZsgoHbL+f6BsrORx7a+Yz0OIgIzhrh5cklY1e
         FoqzKhWp75y2tam8jabJmeGskrxrkmdtlekPEzwbx8lmewNGUHgfHG1bspYJoiY9tIWs
         086YFFkMKZwn51y8Flayhq1qmzu5x0JrTnH58ObPDFAewMaL7DAR+8rdV9vV0frbboFC
         t+zH6EUZ7xSbDMyHyu9HLgyNMRZhJfrDfqABTRmMJGCrLOgJQfEniUC7brPhMZYBdKSy
         r3+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXsWWXSc+7XZiUAdvDS7pXZM/PnQO1R4WkEqxL4jn8JAwo8aWs48NlUvkqf5FA7s6LY2SURACXwwNSWPrxm85qw@lists.infradead.org
X-Gm-Message-State: AOJu0Yxklu0cA9vOQgBAK4V1zRgNnWHs/5QCuAvWf4BpGTQ1iQD2r5pQ
	/02Eh/Lqp8RA8+IgC3JhYr8B8xXA02QPY9TUjjiWIn6I+Upayp3YwsgRp//c2Ak=
X-Google-Smtp-Source: AGHT+IEigUfK1s5B1XhS9sfEmdo+maxC2U8AZO/uY92umN9wYkTsgVSKNmZyXdmp1QCMyrfV4W+TfA==
X-Received: by 2002:a05:6512:31cc:b0:539:e1a7:345d with SMTP id 2adb3069b0e04-53d866c94cbmr2232719e87.10.1731155727195;
        Sat, 09 Nov 2024 04:35:27 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53d826784dbsm922899e87.15.2024.11.09.04.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Nov 2024 04:35:25 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 09 Nov 2024 14:35:09 +0200
Subject: [PATCH v3 5/7] drm/bridge: lontium-lt9611: drop TMDS char rate
 check in mode_valid
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241109-hdmi-mode-valid-v3-5-5348c2368076@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1393;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=bVuetdndH1+H+sM8qub00TaR8PUlbIR46HTQjmQ2vjc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnL1b/ZfMsGkQ52uI+m656a0A3dgPEqlPCAieD6
 1QAsnoR/kuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZy9W/wAKCRCLPIo+Aiko
 1eNxB/wJULjX0l8Lz4aRPnuWR70dfZVJYrQkpc+zPAuribEC0F0j7hQNWkmczAezUyvVpgP+Fgh
 04j4uyP1p4ZjZjgOqT7vq+wr3pCtkA/QWAIopDvYotWFldcsgLXdYCtpZskcTOcaG5rGGFCyTyU
 eNJhP0NRQ+UKJrK/n9t+WRARtDE9xjju194IYz61poLEPBdhGQVMp2rdhYyF6My5hgikZ4N6oq+
 a4ut24LnuuY50GSMoRukcFdytXScvNZQgHpSrxvkTvQvMdx2jsx70hJE59nYLmCcQpNLcXQ3z4x
 JeLtLBiJCB09gw/tvJDQ6ZibiPFWU4BeltZf1zuT3eU5stU+
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241109_043529_571473_AD59C903 
X-CRM114-Status: GOOD (  12.17  )
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

Drop manual check of the TMDS char rate in the mode_valid callback. This
check is now being performed by the core.

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/lontium-lt9611.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index 1b31fdebe164063e6f3972fdf8a5801ef4c35c4e..b8ccffdf515ade6e3bf863edbedc41e6f2030f29 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -757,7 +757,6 @@ static enum drm_mode_status lt9611_bridge_mode_valid(struct drm_bridge *bridge,
 						     const struct drm_display_mode *mode)
 {
 	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
-	unsigned long long rate;
 
 	if (mode->hdisplay > 3840)
 		return MODE_BAD_HVALUE;
@@ -765,8 +764,7 @@ static enum drm_mode_status lt9611_bridge_mode_valid(struct drm_bridge *bridge,
 	if (mode->hdisplay > 2000 && !lt9611->dsi1_node)
 		return MODE_PANEL;
 
-	rate = drm_hdmi_compute_mode_clock(mode, 8, HDMI_COLORSPACE_RGB);
-	return bridge->funcs->hdmi_tmds_char_rate_valid(bridge, mode, rate);
+	return MODE_OK;
 }
 
 static int lt9611_bridge_atomic_check(struct drm_bridge *bridge,

-- 
2.39.5


