Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0B7DD735E4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Nov 2024 01:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YdWiUnW6vTgN40+31xk3R74ZtFvE1HPhsssihDLePE8=; b=VyyzSBMG1eNpmQbUuKpWKFUa1k
	shPdGaLvDa4YJnbpjkQMMk2Jbfu1WjsuZUC9KIoc2t8R5OHs1rcOcmOTQoDtMNr8VjSBKkuzalLb1
	9miEk/3dQsrbecle+FLBBgkpR6kqN+z0h2oHJVBLPg0aNAy7zXCbzqlT3UM0W8GgNX18PvgtWbTc/
	MqYj+iibU+q/T8UGnhR5gUPYsrXYckzQwOOL05rX716LIObYkjMara6XeobHwIk6W/KuQA3ARr1Gk
	rI4VsvAkjQxpLvUc/qfqYFNPoOutmOIaJf9H6mMQF5YnK8nutPO586W/+kCXC+Pfvd5XPVsfB03jy
	M7NT7yyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHCkk-00000001HdQ-3blE;
	Sat, 30 Nov 2024 01:58:34 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHCfC-00000001GTt-0CQg
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Nov 2024 01:52:51 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-53de035ea13so2446651e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 Nov 2024 17:52:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732931568; x=1733536368; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YdWiUnW6vTgN40+31xk3R74ZtFvE1HPhsssihDLePE8=;
        b=I955RPpCdKeDD+z+KOuHBfmR0yLToArHt74cWrZ/9VcYOMwZRlqrRC9MQeLr6WIGV5
         jCH2gaVBKcvpJQwb79/O9j3DwwXo+uSyfhPeqXpQTg69XmWbkb9ZsC3CdscEU+Ekd/VM
         m3wwwyQcnl8ZKAWxkOgX7BnQeuaWNGO9b+wGBSTnwtBtVOkfVITCY8EZwp2hKIpQEvfH
         T1XahPhv7jul8T+Gza3pg0LtSvVpmEjtGRInmpH25xITyLmDi8VLLAPvw5dixKQq1lbc
         3PaxhPK0GxsKewexqURh3C77jdvUnYB/LrMeXIEXu6KFY33dDJpebUergdgdLay4TC9y
         qKaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732931568; x=1733536368;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YdWiUnW6vTgN40+31xk3R74ZtFvE1HPhsssihDLePE8=;
        b=tGE4eqvWWQDx0cCFN4rPzQ/dMyLg/snKvstkIJhhKAtkannAWZbXPRkJEHoK0cuLaM
         /nEAxGwA7NfTTK0m9uI98jQ7W1L9lZWyWG8khkQ7hY7/+Esw8XyM43+KbJQUOttHf04f
         inTCZw6hfC4Sv7skb7bO3ydLmWm8tiaIwCIPNvsT2pLT7g/SC6ZhU9LHRQhWywTebioD
         rz83k0X5nQrEJRAuUwyGwkO4vYyH0VTzFFd3LOwpdOOiJbqHYlfTh0vibqsn0RdIMW1r
         oj691VUZjy4gDTwIimQroCjuVg66x97ExyY6VBTLDK24L4SV0MmgxrhW/c332CBeybNz
         nJZg==
X-Forwarded-Encrypted: i=1; AJvYcCWw8TXEqpOyItlYEZkQMQRoX3lu/nEP9/OrFZfq7QNFmk+y7haOXMH8JLuzFmVrGGeuao8Bveyot2kkaIRWXmFs@lists.infradead.org
X-Gm-Message-State: AOJu0YysA0GNW9NIYdTRr4V4oUfzyl01Xpvm0LXG9DxCBIX2jXb7yZMP
	NBXVP3gjGGMvm9kivO9KFm/DjP3PGJbFHDqx/dQQ4QKj0HvLChTLzvn8shKWhTk=
X-Gm-Gg: ASbGncsxx6ZGTz9uGHLEq5/mEvbA6jnWSEpEuTAEddz+BKw2c7DlvQmcE2sbJXFiLpS
	6xZjCsoL9HB41IuHdz4wh0quiLMAAb+sv0Wsu2fIiR3DaH6Ix+9/sxxOKJQ/MqMmJ0siQR2xQ6g
	avzWKD/qR+CNAgJlQ6XpFa0JkwNPywFMsAjcXSMVEZ6mBB4ZTheqJtYCBTEyrOH2Fq85zzSTHC3
	T9AzXaLqFpVdApKJHkUorHc1bZ9BjJxWJmdzg9h4k+syxfKF8xAiXCrqQ==
X-Google-Smtp-Source: AGHT+IHetZrvEByn4fAHRWKEq7LSlZrnAwfYhcjJyaHf3aEdtAmIagniVhOW57dJZppA3z77RAF6Dg==
X-Received: by 2002:a05:6512:1247:b0:53d:e5c0:b9b6 with SMTP id 2adb3069b0e04-53df0106d34mr8877433e87.44.1732931568173;
        Fri, 29 Nov 2024 17:52:48 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df6443172sm636408e87.84.2024.11.29.17.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2024 17:52:46 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 30 Nov 2024 03:52:30 +0200
Subject: [PATCH v5 05/10] drm/sun4i: use drm_hdmi_connector_mode_valid()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241130-hdmi-mode-valid-v5-5-742644ec3b1f@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1574;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=7WdeDK9PVMnPHS0xN6wrfKPJv4ESCzGwmvZnGPcMZ/4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnSm/gM3s8fwgp7qQxHuLKIwkRxeHDxfAODq0bs
 8MwPp9YbZKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ0pv4AAKCRCLPIo+Aiko
 1bIIB/4p8mwZtQM6b7rWJ6f/3RrJdOFSVD/lB0+qokriHsrz+a1eIjtwS5cFImZWoTfABbjChFG
 9bL3aHhp153Z6qRmB0jjz74wbZ0tim+a8QACdm70DR0qaxs4/HmpfPx399A0ZxyT24MreEgH6GT
 SIq6n5AETnEoWTkEcfkowDDKtLWggZQ1t8C9j1FkKDqPZx7h+bRIoX+PGcwIDcVLd5cC4hNGvGo
 am6B8uZXEeOE6xZdG45hkGyPog/MQ3pw19KTMqs9BjjoRcYkufrdv1X+Zy1tA6GGE1tfQ+iEDoF
 COYRba5H+tZGXE0G2E/PFi//GWn2JG40uSHj31ythluMJMYH
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241129_175250_086774_41A4BC8C 
X-CRM114-Status: GOOD (  11.87  )
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


