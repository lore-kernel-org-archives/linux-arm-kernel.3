Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B236E65D17
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 09:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YdWiUnW6vTgN40+31xk3R74ZtFvE1HPhsssihDLePE8=; b=Af7g/bFqNczDrJVp/OJJ961yCf
	lpoXkJ/Mmtvm71LnOL++MkzbYqHbV6AU1xLCUBbxbqmpUdUb+idxrjQViDQ1etFKfVC+GF7vFeDkt
	kGAeil0cT1yD8j8J8WEJpalJyI+7kZ0eZdujMu7uSZhRCF6RmdWlukDuezYoOkxl4tXq22wyKFjxe
	F3pgcTAo51gknTJGsuj9juea5NEn2iq7Fz53NVonRHi29Nja2UkWF0HeUSSdgfNE2xShm1gXYZSDw
	57Ts0x5wLGQj7kGuXfeMkP9Uq6wd5ST9TFkKuSzHP7vNEdPNOuTIK4mRvLHvHs8pToyoQByL5WASQ
	wTfdG6Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEPoZ-000000023dQ-2qfg;
	Fri, 22 Nov 2024 09:18:59 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEPj9-000000021h5-3tvt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Nov 2024 09:13:25 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-53dd8a528feso117791e87.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Nov 2024 01:13:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732266802; x=1732871602; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YdWiUnW6vTgN40+31xk3R74ZtFvE1HPhsssihDLePE8=;
        b=OUPTEWLDmRILgVMhR40Gje4ch06sPFcv1b0X3s7gOFYBgnXIWBfmCfPo85b3zLUbFJ
         5Yki2ypRXxWQnilKFJFHa9cE1ny31RvE+2lAfK3dEo0o8A355ucTp7ECRSLnnx+uGBdL
         BMG6ZMT1ChR+sCnAkzQuH8rNgQoSdCgaw61wzabw/Wz8QZqXZ+GJ3lLMbEO1Eol7gkkD
         ac0d7MkrD3cHsi+KOqgDKk+A5uEasjbXUAm4C8S0FacvyfcfF48gs/u9jx8nJOKDTp/S
         zjlEugzXs140kHAbBcBGjKUKmRmQ76cciiLaVCgbh4hN3Tyf7crcSiVxfMkQcecCJLHm
         xoMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732266802; x=1732871602;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YdWiUnW6vTgN40+31xk3R74ZtFvE1HPhsssihDLePE8=;
        b=bf4liWFXNMzkXS/YcChHV3OMVVnlDp0lhRUMGCd6ZA+A7XDQMugP86MQ0b9lGb2B07
         i7umJ+1lwOMU7lUNgZMCguzNckC2p6fbv9DKjewVKCJPjmaGgAWo0Cg9DTs9BeBy85mT
         Z9Sd36o3YfcgYdBAnR2cG7LL5mMjO5AEkMfXpg9CjhKTCYBPCMwK7uTDVgHN3q0+cLaS
         395+1eZ9V7Sw9XU7KTeYuWtL2fpPVQuRUTli02xHvE8OmUPXTCbxyul4F5RShlvi/wiK
         f1quexy+89ZI//NHUwqZYokEs9mmb8J9snTX8xH5pHM1IMvywvxWQ5M1zSZiGtlyeKIF
         USAA==
X-Forwarded-Encrypted: i=1; AJvYcCXIjsn37GfjOwfpzaCjBRsP76xyaDUekq0ZdhNrXD4R4pODkX7GA7BGFlZa2vcrXaHdy/QeQ1zfi+w9eGeaHy/J@lists.infradead.org
X-Gm-Message-State: AOJu0Yxhmeaz5l+JE7Bb3lvak5CHVxaI3vKRV3Sz0Jl2FftI+C4rox9y
	jzZsPxRj0P/vPGz2YOWDX/+Wy+QFw0cu9tJ5Iz6cOzRYrZ5WsvfCrlPDk55uWYw=
X-Gm-Gg: ASbGncuQKDVT1xCAVGVLMXQ3UQq31mJokMoqvjnAxqgbOMT9T/GImd6AMokEPTiO88m
	qF7nHsX/Pl/Xhi7V7JfH0yokDPlxCP2tZ+tVb0yx99ZL9N+qb6tCnOzEnEhYsGSmaIxAnSTbdrC
	M8KtkqD7m+E9BjBR7jlwkcLIfrk8vUSXfHVDIm8QnxlnEezKPi5tfEQcc6HFm0SUcplCzDwxNYZ
	I/nkhNq03dqYTY4MrCb7hB2CkBYwmHv++A8u3kFKEGGLGRqriBaXQjyNw==
X-Google-Smtp-Source: AGHT+IGGtUj/UQVAqhj71L/+WsqH4TByvBEbJYS9Kr4E80g55FT15j0av7rsnKtHopezihZc5TlJsg==
X-Received: by 2002:a05:6512:114f:b0:53d:d5be:4bda with SMTP id 2adb3069b0e04-53dd5be4be0mr678315e87.17.1732266802045;
        Fri, 22 Nov 2024 01:13:22 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dd2451386sm299530e87.77.2024.11.22.01.13.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 01:13:20 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 22 Nov 2024 11:13:01 +0200
Subject: [PATCH v4 05/10] drm/sun4i: use drm_hdmi_connector_mode_valid()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241122-hdmi-mode-valid-v4-5-2fee4a83ab79@linaro.org>
References: <20241122-hdmi-mode-valid-v4-0-2fee4a83ab79@linaro.org>
In-Reply-To: <20241122-hdmi-mode-valid-v4-0-2fee4a83ab79@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1574;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=7WdeDK9PVMnPHS0xN6wrfKPJv4ESCzGwmvZnGPcMZ/4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnQEshvg15KlERBUKq4lR2p/TSqtj5mXXjddQL8
 zndDKhDnu6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ0BLIQAKCRCLPIo+Aiko
 1UswB/oDlMjmP0dYXrp0SYxKvIUkgl6MY851PyW708IlMOZOJbH5lo0GCNkGsMmCV16kq0l1ais
 KIus1wfQ1xA0lwo8KtUJJeX6gPpLRN0nWs5AbJm2S53M1m+XwFjW11vOEZYe5BEyvuq6cTNrqOf
 SP5rwIdTIFJYNqC/T/oVX3emjSYFRHp0mS6piDuxv9io3UFM5M9xGCDSP9ZsYwVCe0uwtI7lOx4
 VwYEaqqRz+m3DbfRHe6M2eQAtAMGgLCsyo+Rom/69e0SKJkKkWncfEMwKQez9slaQ8GeIXaA4E9
 KsJ/lbh1VelTpjfb+9nV77MboAKh3hm26Msd2x+zXcDXq7U0
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_011323_969888_5D43937E 
X-CRM114-Status: GOOD (  11.69  )
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
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
index b3649449de3026784ae2f3466906403a0b6e3b47..54b72fe220afacc208b3fd48d5160031127ea14a 100644
--- a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
+++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
@@ -205,16 +205,6 @@ static int sun4i_hdmi_connector_atomic_check(struct drm_connector *connector,
 	return 0;
 }
 
-static enum drm_mode_status
-sun4i_hdmi_connector_mode_valid(struct drm_connector *connector,
-				struct drm_display_mode *mode)
-{
-	unsigned long long rate = drm_hdmi_compute_mode_clock(mode, 8,
-							      HDMI_COLORSPACE_RGB);
-
-	return sun4i_hdmi_connector_clock_valid(connector, mode, rate);
-}
-
 static int sun4i_hdmi_get_modes(struct drm_connector *connector)
 {
 	struct sun4i_hdmi *hdmi = drm_connector_to_sun4i_hdmi(connector);
@@ -269,7 +259,7 @@ static const struct drm_connector_hdmi_funcs sun4i_hdmi_hdmi_connector_funcs = {
 
 static const struct drm_connector_helper_funcs sun4i_hdmi_connector_helper_funcs = {
 	.atomic_check	= sun4i_hdmi_connector_atomic_check,
-	.mode_valid	= sun4i_hdmi_connector_mode_valid,
+	.mode_valid	= drm_hdmi_connector_mode_valid,
 	.get_modes	= sun4i_hdmi_get_modes,
 };
 

-- 
2.39.5


