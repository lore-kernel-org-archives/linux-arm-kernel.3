Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A476AD5E369
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Nov 2024 12:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L+pN3XKvVFmetq3YJbHAkykp748W6pEN5H4vcdcbZbk=; b=oAOsvK7ehykwf25cPLWChWVVMi
	fmpKMJttka1RDGcE8lEoAKuVs5lmVT+a2LvE2HeEpYci/+gD3rkuDiIFh+0L4b5Y0ulPk2hUIdZra
	peXtxtancMnabziIrpwM1jj6SVC81UMGrYew61bfVAD+/moScsTTULChDoGnOYTrGyjuGBEIsRwz6
	t7+natjhl3kJg22HdG3aTePp0R1XW15NSNyYzu7QEazNZhtqzJwGA7XfMW+b41Or5CNbWaXfnbNa5
	35ISA3xG7mZWtaSuW9ZbSSy6G1wYOzjZt4tLwf110ns2fDW3hhk9hw618TGMGQ7RJaJRL1M1r31KN
	++klYV9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9kuY-0000000DLR5-08F0;
	Sat, 09 Nov 2024 12:49:54 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9kgg-0000000DJBJ-0pJQ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 Nov 2024 12:35:36 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-539e13375d3so3656334e87.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 09 Nov 2024 04:35:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731155733; x=1731760533; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L+pN3XKvVFmetq3YJbHAkykp748W6pEN5H4vcdcbZbk=;
        b=Y0iUcy3IVBUWYbkbCoCD7qYKdA9oLOJqtMCYE+KVlkt1DNu3P0ScbOloLvLOJTLh2R
         zYP3+JSUNmGx4u7JQ0V2RizrJPf6QZPlvG3XufDndhLV1jBW0aegaZEY5SRcW6FEC7Mo
         d1pSS3P6vZal+Zgz/ZXk5x6yyqm8G0UFTBNFDFPoLq+uxjwUyu9O/YGDDPMcDL8HmHL3
         P9kf7Pd5qCrL/7heLdPmNo9P/jxSuHMGl6V7GWBPX9mRPZPBFJMivZBA0PJw7jh3I8OK
         goFdp6ZhId0wRI91zgvR1mbnWKSeYRihkm86hIEIHyB9LY7V/qIUzgnJGELeTA+5/NtH
         roVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731155733; x=1731760533;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L+pN3XKvVFmetq3YJbHAkykp748W6pEN5H4vcdcbZbk=;
        b=vLgjZ1mw2Gvn7Z+wVYx1eiqlZDfUd1IBEAz+71EsE7z/Gny9M6DZ7VYPM9Z4UrOtsp
         P83wBq6mbtQZoXPShjJO6xgvyU69ZNOoC5TxKUxCrP7uEAKl8ijA/vDIEcrahv72IWKP
         txQ18uxTyX2YZhvBPK84dZvvfOJViyi5n3vSVrIdtaJVPV2q5ugy3JD1l3nIiTbBkuXY
         05F91liOPPd4OFbwHXY+jRSfHZOxd8W3ekiYYnBOjCY1Mx5JBwQdANHHR91lyYJ0hLw/
         NnaEbuh9QLwRt5oI074lx6hJ0DAgk/iyqPgGSJufudXZFv5lunNq7vXYfQ+ILaK8gqQC
         lc9g==
X-Forwarded-Encrypted: i=1; AJvYcCVhmR/VaponaHGFymLLrZtt/bkHGSxN8kgEHM0SMtg0lz/8X9dXu7TNYC7M116TdghIW6/DA02QazEY+OXb8uko@lists.infradead.org
X-Gm-Message-State: AOJu0Yxe3kTKx1nSLFwbSJ79msTHfRN8bq9EOnl6wiJBZePy4Gcj+TRa
	bKDIIOHctzkpBQC1e0FBY6MG0ZHsqpQUqJYGsDRMzo+GiDbpizSOn2n7jcrRWok=
X-Google-Smtp-Source: AGHT+IHYy8a0Jl0t4eXfYO7d1FqKeWB0bC8cvUQRPjyNFzEV2jihfF3Am0WWkBzVwoqL1QUMEqIP1A==
X-Received: by 2002:a05:6512:3f16:b0:539:d9e2:9d15 with SMTP id 2adb3069b0e04-53d8623fffcmr3082722e87.29.1731155732594;
        Sat, 09 Nov 2024 04:35:32 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53d826784dbsm922899e87.15.2024.11.09.04.35.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Nov 2024 04:35:31 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 09 Nov 2024 14:35:11 +0200
Subject: [PATCH v3 7/7] drm/sun4i: use
 drm_atomic_helper_connector_hdmi_check()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241109-hdmi-mode-valid-v3-7-5348c2368076@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2011;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=NRpLumrdDZhSXCJcusWkwzHsBkwvkTsOwVSCIyGYQBU=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ7p+2P/UnAP/1lS+cTe5zqq05k8zk9jJ3/kFf9hFefyer
 PvILuvWyWjMwsDIxSArpsjiU9AyNWZTctiHHVPrYQaxMoFMYeDiFICJ3H/JwTBByj1Gq3qN6AeP
 o7aBh83EfpQelbE2PxPHwSrQtOXuzpWWAdPL7V20fHnmPSgJPae4eu0jF4EvzSKi1hf6GBqMq/4
 eeLB96THGoJQfpepc7ku0Iy8Ei4RpMyhoFiceTbF5wJibpHuC37Nlnvn6xLlRhfOuScz40LdLMj
 vuZ1muq9PZ27M9+CN3C812ttdTdP+R/3jN9uAWG57HW0rPH+E1e3pukty3ZXZbUv4ylJ2/dyD3X
 MeLJPnAnaIOsusKL33yPnrZioPv9o+bP3ZYrlLsjS+/aRWZ2L1002uP9vgHx24wz2hv6qjrv/ih
 oTtM/MHPrSUulTmRUXP+1LEGMK7ck3dy07HdEs8aPB04AQ==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241109_043534_332409_8E783E2F 
X-CRM114-Status: GOOD (  12.04  )
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


