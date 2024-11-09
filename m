Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65469D5E369
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Nov 2024 12:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YdWiUnW6vTgN40+31xk3R74ZtFvE1HPhsssihDLePE8=; b=NJ5wcJ36BE2fQo2ExWpgn4h+hD
	2nvG+XnfwgMCRB7NqAvFPhGwKVeQHcCX3FQ5lIpazmivAKyb1gFYRwKjCV95TXK4mL6MqDTScEBaa
	6mItZLyGXtY7sSTajVa51zSmNFRLx61b4xiI2xJJrr3e2MccDKUAbHTMDGSQzfs0Zu7OACObZ3ALT
	iSxb/8cjeBuhYsCQztsUmqXbN4wXVJhMUCu6sECr+0RqBHtnscSOVw2GbZ0aRcpoITM2HicSQCeCO
	QYN76Ub6d25QzRCftV7LCNZk9wjotwiT5hQ0aGRP/0FicPCCyPNysbNp0jpHE5rxB6OpS45q55u7b
	xLCJGk5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9klh-0000000DK19-2Cah;
	Sat, 09 Nov 2024 12:40:45 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9kgT-0000000DJ2r-2L1y
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 Nov 2024 12:35:22 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-539e6c754bdso3119476e87.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 09 Nov 2024 04:35:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731155719; x=1731760519; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YdWiUnW6vTgN40+31xk3R74ZtFvE1HPhsssihDLePE8=;
        b=CtJnzSXQv5xDjwk8zWAZXBgtjJkFHeh26D06cooAti0qlImNY029ENvqrsnv2KVhjl
         mwul3uq4mnzZTcB/B7yRbO/YewMrYkccTfd9qbXjYFbfirgNVY0XznJauyEtEpj1tSJZ
         RObamwVIGQrc6018X3jjZS9xJexyK3joj/dheDyGGT3nW7tHCEwrlQx3Ew+RPQezL6x2
         Q7ANGt+qL3h7hUTgzsEYvmqdqblGoQWH2ld2hfHtcMJGPjkcsYM6xlPb/Dny2XW/U1Xl
         NmIE9bPM2TI5KBfKBkWFOvjbjSlMl6l2w3frYtea6bE5o0JfyYmkuXu97JY1LxjUp0Lm
         eHEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731155719; x=1731760519;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YdWiUnW6vTgN40+31xk3R74ZtFvE1HPhsssihDLePE8=;
        b=mylGJQE3jfs5OrZiO/pBWvAprXFRZWpD09pONfMfXgPUdTrUFB8BZ/iyNUszVNFN0Y
         Zd2ZjwXVXxzlv6qVwA6Xj5/keYD/SiyytHgbcSI1cceUInJwQk5t5MHNLMHBeDVpp9uU
         cD6EW/A1ANStFFehJ2qPrRMZQD49KgZ5pZ5B7IQAkimZh83WcLWB61N5J6wK3A/5mk2C
         aT2A/byYYd6hzNF/ILgzLdPX6DYTXPr766v31sdANTJOvpyd6QhyeVlhI3Y47yBIX4Hc
         WS2hvBk4wv9KHo62ozZYrSF8zfSdPv/eZRZ+3EAQQvNddsMExuuOQlhhogH9gK/1d+r2
         f5zA==
X-Forwarded-Encrypted: i=1; AJvYcCVqzKhT3kbv6Ei7135K/19FZDcnMSYjmx7I0sNsFJ7ozfTCl4Da6TvK/FvxQq6iW9TjxwA+qPCI7suR3DHMHcRN@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7Rg5yLpjCg5A9mfAOvRRLYlNdVqGdTRRBJX/EOhrcLaHvEugp
	Zxk0vwtwSEdnfILLAq0/+4Lq/zgRdkSAJkZssCjaqOz3K1srNfzjngOqmvbxneo=
X-Google-Smtp-Source: AGHT+IHHe97HVWISV0xTKEguhhmngXwM9bLbhKLyVT/NAPLE3XO/6gkuiT5st4Y4ibTD6FfB3h0HDw==
X-Received: by 2002:a05:6512:3e1b:b0:539:f7ab:e161 with SMTP id 2adb3069b0e04-53d8626c957mr3117386e87.45.1731155719467;
        Sat, 09 Nov 2024 04:35:19 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53d826784dbsm922899e87.15.2024.11.09.04.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Nov 2024 04:35:18 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 09 Nov 2024 14:35:06 +0200
Subject: [PATCH v3 2/7] drm/sun4i: use drm_hdmi_connector_mode_valid()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241109-hdmi-mode-valid-v3-2-5348c2368076@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1574;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=7WdeDK9PVMnPHS0xN6wrfKPJv4ESCzGwmvZnGPcMZ/4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnL1b+FmOS76qswUke0aQoU7K0ppHTbndFvzZI6
 MVoqTsyvKOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZy9W/gAKCRCLPIo+Aiko
 1aR2B/4roqe2QGJN9o0utoGfn7qwXfuYWUFrCpESIf0EXmVpBVMUfNKMEQ901DyyYMa07vGh9sn
 +syhOWO4HrB8RfdT01cQmwKSSSN/AO7aYYYR4wflgexekMnpd5MYCONI8J8OubpJFAs5BK0Qhic
 rzUP3emr5T3rHYkxTNjg3uIE5RV0OGNR/H4BtdIlMfVvPPEeQQtRRSjV2bl1y4C8SFCTQVUcqg7
 OkAARZXrgEfv4AtOtHjIBY0tsHxg98BaVOY0T74qxX313GFfUSTD8IyJiF0vxudbOq14KYEtHng
 lq+8K2cePPLztOfA876jNFsQpFGyIDb/AVfVxOCSHr6+qdVY
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241109_043521_633479_2C2F7DD1 
X-CRM114-Status: GOOD (  11.85  )
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


