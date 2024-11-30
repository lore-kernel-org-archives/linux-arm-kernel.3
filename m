Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA24AD735EA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Nov 2024 02:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z1lXYCxrn128DpMjUx/X3ynnQZTeAwK/ttm0jSS1k6c=; b=JmyjcdgTfCMV/w96FqbtTAcDs4
	aFdXZ4BT+1a+o7HA2HI/E+MUIpc1nDbGa5u3OIPPJ/5sPQq/vWjiY3n1DMBRCH0AMFo0IF48fvk5q
	0SE3t4LinmOK63vHwcO5ZPSFxd0/hYbOK1QJLc8KQjwbsGhkztJCnEVg6bEElX9BLaSurayQBl+md
	sL7rjltdaozDnOG66CPnlq4lqpNppwnqGyzbyYWUP0dVJ//Ag8LfJaKrizw5PjPn/Bvhjbf8flqYM
	eiUEw92yjbzHGL5uj7NSNwC0S7jkOJtTz3WCfBahfd2ile0hEsE0cpazTFdn/Cqcm63HtYskDKogT
	+Qqp24QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHCpV-00000001IA5-1DHi;
	Sat, 30 Nov 2024 02:03:29 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHCfN-00000001Ga3-2miW
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Nov 2024 01:53:02 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-53df7f6a133so2580689e87.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 Nov 2024 17:53:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732931580; x=1733536380; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z1lXYCxrn128DpMjUx/X3ynnQZTeAwK/ttm0jSS1k6c=;
        b=bxz9ijLUqviKdsKGsMTYT/x7LvqFIa3M6Jifcl4wgpWIyWDK9EPbQDsu6DFXyOkLVg
         N0XHI0GMStNf+6zhheMarmRYgThLBvWXKZQXZhOS9xoQDTHVrUcsJQh/go6KtP/nbtbK
         gwr3DwcRQdtLNQsocVv3BQnWnltsxZOxz4L/MjArtTRCeHKjzf22I8y42nJf+L/bIKtb
         IrVTvULWg085IqhXZExJzdtC/SmSrm2FvPE5DP22Xmh8rCjYafMdkXsfv346tiS4ttfD
         B1zXci/qZLz0o1rSea3xD2FLBIFlnbAgOOwhPYBrpty/08xSS8BEc3wizfans8ZJi6r6
         rCxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732931580; x=1733536380;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z1lXYCxrn128DpMjUx/X3ynnQZTeAwK/ttm0jSS1k6c=;
        b=Lt1pH/tbpnhZ8eSGyKbE3ApaRfVrKRdrQvhNWKPpyRcB/Pfafp+WbsONMR6K6W08Y6
         oMdYj4qz/1Oj+jPMXAjM5IkU5OY76E0D8TWkpRynMz+M+3b31LfmjC6bzHF1qVfxyIj1
         GeCzvJxfoYrztmEzaTgVK/8YV5aMCKNuf7om55ElDo4RBFEgy+XPzoQ45AOsSsjNBs8j
         i6+oEPQFcp5Tl0oHz7WV2eHqWlRkGdVQWb9PI5HYNouc5tYksmbqUQT8n6eAHDfwI07R
         nPRJvdSLJmSRM/gannDLfYNqcVkfjZmNWEvc8sBwAfXq+IqMilVCKQblT3OamgdTAl/p
         NWbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWRqpyCrZzybd7tk3bnht53eXrnisjXJufiNwNzgDugAhGJblIgJcf5JvTtQdxA8MY5Ip+sTKJ6/kYGV3oOOm4s@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0WU4fIIHkQVRuedCQKqx5Aw2kfISgKaCxMFlz67fo7VYhZejZ
	jNCwbBVsuLGPJB7uegp4lIF584zHnhaMiz7KB7g9e1BwdRwq4kVfl9wBmk+LK5o=
X-Gm-Gg: ASbGnctcEXpogYGFrzCCqIpmQPcW49iIw0nAsYa91m1IevQ+zkrXBEua2guZcrn0EC+
	HxJtZ8xiiQdvKaobJElNsO0uwB61/NYQ/I92WBW1WW0qmVB4w4B7QuSbDE2UBwj6BnzbTlpK7NG
	cSnPC3YQm/HeNbWRgwC+0ErvzCBq7BqbcYDu1vWO0VdCU4dfH5i51FvzqwoninYWK5QhRjl6HA9
	lpA+rquCgMKBszfuGSSY3PV84aIAvunPKuDrIMd85bRRpQ2pLqJLvg3ZQ==
X-Google-Smtp-Source: AGHT+IF1zZCeJZP0c56HDhB3dZvzfBBbMK+T1fbyelhZdZGvyXwekGQxsUf0KFWRtcl6qeCukozDbg==
X-Received: by 2002:a05:6512:3ba2:b0:53d:ab21:4e17 with SMTP id 2adb3069b0e04-53df010e3dcmr8347283e87.55.1732931580177;
        Fri, 29 Nov 2024 17:53:00 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df6443172sm636408e87.84.2024.11.29.17.52.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2024 17:52:58 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 30 Nov 2024 03:52:35 +0200
Subject: [PATCH v5 10/10] drm/sun4i: use
 drm_atomic_helper_connector_hdmi_check()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241130-hdmi-mode-valid-v5-10-742644ec3b1f@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2060;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=tt33sNy4EHSANTDHQAExXai1314OqzFqkWnpPj2YPOw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnSm/hEd3SJUPYNRrY3fgh17VdYvds7f7Q168Zy
 EaL3JawgciJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ0pv4QAKCRCLPIo+Aiko
 1X26CACq+Vplt9h/bOf8vjWm6vdUiW7JOHiBTGnHe70WgxSHu/ZuvlCePWg1uh99nqgs2ima6WF
 a9lLDOxqI+EJiL4HXVW/9rMgRI9+kPpvRo4ZpFhSzWDzSDLhXw69MnpuoryWhAMHZUyDDqAaP6O
 eiqfS2m9WWGLc9eup/Hiiuc2DkZeZRIUpCxUytQsfiM08yjPmolqxG1B6UJFaoNBNQnoAiB6NKV
 6yENKHrcdPICm1HbAhl90zh1cQYxOeCxuPr/++Vj6Lb/96pS3lioxQ+HZxLy35xyxCP5nSvsOIB
 IF09MJu53IVZkYd6054wQHgHWjrTHeEygEM+tXSOP4m5zQ6Z
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241129_175301_703745_95D888C8 
X-CRM114-Status: GOOD (  11.89  )
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

Replace sun4i_hdmi_connector_atomic_check(), which performs just TMDS
char rate check, with drm_atomic_helper_connector_hdmi_check(), which
performs additional checks basing on the HDMI Connector's state.

Suggested-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c | 20 +-------------------
 1 file changed, 1 insertion(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
index 54b72fe220afacc208b3fd48d5160031127ea14a..b05fd77870b00aac97d003f3fb9c2b98cb73abc0 100644
--- a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
+++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
@@ -187,24 +187,6 @@ sun4i_hdmi_connector_clock_valid(const struct drm_connector *connector,
 	return MODE_NOCLOCK;
 }
 
-static int sun4i_hdmi_connector_atomic_check(struct drm_connector *connector,
-					     struct drm_atomic_state *state)
-{
-	struct drm_connector_state *conn_state =
-		drm_atomic_get_new_connector_state(state, connector);
-	struct drm_crtc *crtc = conn_state->crtc;
-	struct drm_crtc_state *crtc_state = crtc->state;
-	struct drm_display_mode *mode = &crtc_state->adjusted_mode;
-	enum drm_mode_status status;
-
-	status = sun4i_hdmi_connector_clock_valid(connector, mode,
-						  conn_state->hdmi.tmds_char_rate);
-	if (status != MODE_OK)
-		return -EINVAL;
-
-	return 0;
-}
-
 static int sun4i_hdmi_get_modes(struct drm_connector *connector)
 {
 	struct sun4i_hdmi *hdmi = drm_connector_to_sun4i_hdmi(connector);
@@ -258,7 +240,7 @@ static const struct drm_connector_hdmi_funcs sun4i_hdmi_hdmi_connector_funcs = {
 };
 
 static const struct drm_connector_helper_funcs sun4i_hdmi_connector_helper_funcs = {
-	.atomic_check	= sun4i_hdmi_connector_atomic_check,
+	.atomic_check	= drm_atomic_helper_connector_hdmi_check,
 	.mode_valid	= drm_hdmi_connector_mode_valid,
 	.get_modes	= sun4i_hdmi_get_modes,
 };

-- 
2.39.5


