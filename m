Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28D35E67492
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 00:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YdWiUnW6vTgN40+31xk3R74ZtFvE1HPhsssihDLePE8=; b=nX7mWPL0XjimO2oukvOqCpVS3d
	hN4Q3/gQjctxl6at0w3BQI+KIQcFXAvYv3JZKNRoWAxiZqgGxAMYdVjUpOpLERd8fN+hiU9kDuk/8
	zLU4PYaxsHi6i3X/B0watUi9uAtzo5GAF2ZuN5wwiyztFkLYuORR/xNnMxEfKi4fzPhuGQRDdkPx+
	fyj2EGwW+GNblCOlp73SqQQZByxY0ILgJUAiUtvUr4HpYoO+/CFBlVFv1Ino7JH9q4WlTZsMFMJrc
	y6647GM6eUh71AvY1N0E0I2wmzkPIFYWbIdkbljR5IsuLUpSeJ6PKV/4sPFiBAwAHC+FHXN+wZdgA
	lA8DPnbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6fZq-00000005Ixf-2hND;
	Fri, 01 Nov 2024 00:31:46 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6fTX-00000005Hpb-23SM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 00:25:16 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-539fb49c64aso2208686e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Oct 2024 17:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730420713; x=1731025513; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YdWiUnW6vTgN40+31xk3R74ZtFvE1HPhsssihDLePE8=;
        b=BlKkrqoVFIsAM6WX1IS3sbSbUUYGtaxvUrnTAk6PBMfyDQFsua52gowk5VnoaKM9wK
         r2NExAN7Dkl6/wK3T2e22SBaPiXqupb8ryzmwHeeJW8Hk2oHLq3pVfQdIE6Uh8FvXmeq
         R81i7wff9G+4Mpgh7LEmvNdQaIgwV1joQXISEqF3n6rUmq+N/ySPrmj4+lc3PJvGagHj
         vDVY8nrJNm4mXjVSLNenbOmNGtyOGx2+ZNTHF5tvYHHwcrTC4NwvVoMkS5VPX1ZBJp0a
         oRS1sSaVBV9SMSkFMTNVTigHfgwvD9XhRHGH9Ec1au3o5MvOjkaY53WWaqA/kk2HnnyP
         J/wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730420713; x=1731025513;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YdWiUnW6vTgN40+31xk3R74ZtFvE1HPhsssihDLePE8=;
        b=sgmMAqnQ11J8qAMgjAVmD4XCVBl8x+hHiNfTPHega7LWao47uNpgR6wztydbqgxZl0
         4glbBDcS5DFdrfJ4EroH06EwzcDs161CmMthUi/w0nTgniXlMA7/koW5Jw9BaRt7KNv+
         dfFUUN5siXQXFMqRs4xi3/zMQuDxNKByC2Fq4ub/zHHSGT33D8ObF7tbE7FPyDK7nKp/
         E1bU3834XS+OPhOZq+Kq78KhD1kpSap2ue1f7seBoiuWlPFlB1ssLk1QCttynDby1XqV
         MWMHhYx9HVNid4D3py6wtX0p35+UFypOrPIQ3fQF097LXB7AiFLo3WDsCic1C2I2bPQO
         6S9w==
X-Forwarded-Encrypted: i=1; AJvYcCXviWazprr1uvlxSx/b6z94Ze7o/hx8yHLjTx4SUgryNGEB7LY1/YvIba9jnX0sBmLgBUAfddfj/g6fLl2dDYmK@lists.infradead.org
X-Gm-Message-State: AOJu0YzP3gDxbumH4V8lDwXdxy2D9cqpLSkdkQHyiEzEkZcZCTjCTll9
	Wn8diFLdvqtau3xikdW1U4SjwlWVomfrj+QB8D0hhr5t3rH7gi/gJW1/NfJsKtU=
X-Google-Smtp-Source: AGHT+IGbq8fCpRY1c1bmmg92095C0kqytUrIWwSrZUXkLxY5mzg2koxLARty7zdJQk9WrWqL2+9CxQ==
X-Received: by 2002:a05:6512:ba0:b0:53c:74a7:43de with SMTP id 2adb3069b0e04-53d65df2488mr1464938e87.29.1730420713436;
        Thu, 31 Oct 2024 17:25:13 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53c7bcce489sm371153e87.127.2024.10.31.17.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 17:25:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 01 Nov 2024 02:25:05 +0200
Subject: [PATCH v2 2/6] drm/sun4i: use drm_hdmi_connector_mode_valid()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241101-hdmi-mode-valid-v2-2-a6478fd20fa6@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1574;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=7WdeDK9PVMnPHS0xN6wrfKPJv4ESCzGwmvZnGPcMZ/4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnJB/hVs8ck2mIuOojDf5BsZyDpCAOCNbvDgTjB
 eEdeVyvSe6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZyQf4QAKCRCLPIo+Aiko
 1bLuB/9NYYP+2gWguXV7p7pxvci6OEsal/Vmy8LRfAO4mZDqwSPpZaLvK3tQVnCC2tplz45RV62
 KH7xpFWZe4L9XV8JIyduCPu3BEZe8cdEHSNio4pUw2nXKz8fuaj/73N0DEwpQF87bixbIKyB11p
 EjmlZKOFvHTJ7yeuUgUUiKM6X+RDLGiXX/Qof/VMIgQjhJT0Q4qmUg2B351WDikp1lpmyRxfTpd
 eX0xqtaokT6BLTm64axs7FFb8od8hvVrsfpfiH3FuPtsW6Ca6XVMAIb4t7YNGUs/h7Ob4NcwJJ8
 xbghQayNSZROF+m19E/pCBd8Dbmht0Ig9PpLzYlQ1LJDdDRt
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_172515_566569_29A602BE 
X-CRM114-Status: GOOD (  12.19  )
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


