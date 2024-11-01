Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88324E67492
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 00:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L5YSV0GHN6tODKa+I9kvPXfXQWz+eBBIeCxWrWSu71k=; b=F6EXROL3P9FMmPuKcfmI3BHPMD
	iCCWeN8zHV0T6ab29MK3f/BJMcavXDPgAqdyXJyNKGlj1wsIhLZQedwTCnnNe1TGsq3J29BqhiImY
	eZjZwrG0y0Rnwx0Ny/RX1jCmlmUTjjCMGE+4JVgCAi/5/VyKpB2pjC5Gkzui/pNRYa7/S/5wTfclz
	YjifH/6MVSlZ+8BEzY7HirciTBo+v81xJ00N6j4QtWPUqDaT6NtBQOAu/Si2FJRzwv7n6vYxOsTAM
	p1b5so3cZmMv7YVQ0Q6TypReK4GDtzqDWnrH9sSsHAFEygj3CQJlfSyfuzab/ucQS2h1trrbQU0cD
	pbaF2dvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6feo-00000005JjV-0M6t;
	Fri, 01 Nov 2024 00:36:54 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6fTe-00000005Ht4-432s
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 00:25:24 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-539ebb5a20aso1574413e87.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Oct 2024 17:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730420721; x=1731025521; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L5YSV0GHN6tODKa+I9kvPXfXQWz+eBBIeCxWrWSu71k=;
        b=CSE2p81nueSx+NhnLZqvdd7zE8C5OTYRavsWrZHrIUBoIdZP1hLoDgEU5r0HOc2WCy
         /TasN35DNgVR92XdigHP3CxjR9a8ATZ16PRmH/rn6fg5geDkAQgHd+ie0pgyb6KJBf3R
         AqfaLUCpEueMXv5BzikEnvsRm1IzKDs5PyWwo27FugKBgOYXQyB7DIT6Dpd5z5RQtdkd
         QeFroUUmCxk4fQt2YSLcMHajUs7EhyoXfIppelFR2CGXqg2e5V7TtGOFF1CR3XTPerfE
         /MzbjRjXywGKeNpfNVDemChmyYGPdYvFGEBi7hb8IdAeqtPcV5NyPvU7f5TKfMRVX/JR
         1SwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730420721; x=1731025521;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L5YSV0GHN6tODKa+I9kvPXfXQWz+eBBIeCxWrWSu71k=;
        b=wL0HAfZxG6p9J79q3Mna+me3324IiG5PIWFV8raekr09OJCPlM9Q1XDw6Dx/YC4dor
         17mdibn/8xHdT+UgFVXG9TTpk9zWCNLA5UHCQITjNq2w08F7/z6ZAr8AvFabbjsiY41v
         w6AcauWWnvbmp9cAuJE3jpfBC2Y12P2y2EzbFs6aDq2VgWciIMMtgnLsWPIfTHIe4NOl
         j/oBf+bWinx4qtGBrOxu2gKHEdKqi2ijozu5NFdU76XgbQEPQBcly+xFImM4gtuTOUXp
         wL220CVDmvqN+oZ8XPE+taLq+MTFWQoLlUvUmvVWfZxZuJgr6HUvVwV1sItcADnsH962
         tvWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrb9ebYpC/OZpWImmBCS1qrAh+Jn9t+I1J0q2Z+DNfrNz4atJDlGrrceeazxjhUiYfWXZEXzjZ5nMQvDsneHkG@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7D+qDEy4eL8Whm1XrRrz18JWUJ0UKCLTcaCCK0nBpfif+y6Ft
	ySfLUnuS1CxNZSHicd68hTsYAy52PCMhDnugOydTGeNj64Hqgq6mLASA6L1eUm8=
X-Google-Smtp-Source: AGHT+IH+Z352s483KbHjtU5VVJ6ZByUM9w51iqApUCzupb2q+5C0iuOE0kUGC7cK9WZXbJJqsjEwvg==
X-Received: by 2002:a05:6512:31cb:b0:539:e436:f1cd with SMTP id 2adb3069b0e04-53d65de60eamr1039132e87.16.1730420721328;
        Thu, 31 Oct 2024 17:25:21 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53c7bcce489sm371153e87.127.2024.10.31.17.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 17:25:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 01 Nov 2024 02:25:08 +0200
Subject: [PATCH v2 5/6] drm/bridge: lontium-lt9611: drop TMDS char rate
 check in mode_valid
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241101-hdmi-mode-valid-v2-5-a6478fd20fa6@linaro.org>
References: <20241101-hdmi-mode-valid-v2-0-a6478fd20fa6@linaro.org>
In-Reply-To: <20241101-hdmi-mode-valid-v2-0-a6478fd20fa6@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1344;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=2cAY9yTx7ywPgJgHfm9Yb5s7i+clqrcNRhwPtafGQxY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnJB/igzsmQyIppH1aHxewnBY4Uhlduz4k+yAau
 9lDSDvbvv6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZyQf4gAKCRCLPIo+Aiko
 1RyvB/9WSZ4mNeqd6GCGzKzlegONFJkuLiNKth6QBGTxQ//vKPOg3+AtwZwoekG8i/XcF3v32K4
 65STYUOFY1I/FgP221HjXjV3D9ECFQLDGGeKhm7aLPml3ejppcxSFCoSMIczoSfyYm5k1G2xoKr
 fCCE4IU+aSG01lp6cHyXCQG6y9YHZs864O0vGh0SgHH1N6SeLGRb4NG2Fe3MKhnXwjYwEcYpOyU
 J2lEr7q8KPfcvWjBZZzLDqwPmQ9c8C5h1xKOssI4DO3MY56kui4eN8trJfFkVfWm0Fg46xuPxrQ
 6aBgbPv0pAwW/CBUvWVI6roTVlburpPQoWsR3WuP+sPFeVDU
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_172523_061654_B30E479D 
X-CRM114-Status: GOOD (  12.34  )
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


