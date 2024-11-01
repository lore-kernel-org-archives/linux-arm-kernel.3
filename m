Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F0A5E67490
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 00:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hv2lxmvcj3iHqVSo1vO+GpyATUEKN5RREgLh1lW/pKI=; b=ViXLG1PRQn2+LoY2WMdGdtBrKe
	+4DacCdEjHeyLU1vGIs9ayYAB5xGtMd2DP0LueEPxAUzz22QjHq7FmusvqFasGHo6xj3E6bOTPGO2
	MO5sDM8fK6dQr/2ySK7MDHWGAjwviGGGhI2ZxqPL5INuqF/5t/h1FyAaf3HlaTDYgZ8d691kRGm0t
	aiCFP6IlMLQh94AW4SZm7WuqrbESe4D4a86E/kSwKgZAdXEMKp0nGDAA7eUg0s/FzpX60jmQGX7YB
	pTCZFCazz1r0Fw+NNHZf94+brqS+w7wN6YWhIV4tUQLcbt6jG9msxBL4w0XkYRb9FaY3YsV2PlIqS
	LlrQY62Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6fgQ-00000005Juj-2HKh;
	Fri, 01 Nov 2024 00:38:34 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6fTi-00000005Hus-03qv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 00:25:27 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-539f76a6f0dso1431522e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Oct 2024 17:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730420724; x=1731025524; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hv2lxmvcj3iHqVSo1vO+GpyATUEKN5RREgLh1lW/pKI=;
        b=bh8hxeRCB/Dj/DvR+Kda7YKk2ZFPyL9zNCPgj+YcsS8xyyseyRwoLC+yPlPQzuyCr+
         9gPpiRCPxkxsUQfDwXbWZ8jipD2cSNwA4Mi5cdHP7PyqlFpNvbpE/Y8Jr1X9L5H2sDl0
         0+qaaa3cqXV7I+urMYv7MVS+cNXd0WGCAr5/Mc74q2XBzcuxObIeqxyG10NWMIw77kPU
         hSNwVUWL2/h+tHAJpnGE5U8W8JDEHTxzpSYiBlLFBq2532qLLvIyZvbb/WrJR93EDUyS
         3emzQHHBnRwBhZzWjPvxVm7eef2cpOF1bZipHgfFYAS8g/+jkJfLL8L+eh51Etzmiuiz
         GbYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730420724; x=1731025524;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hv2lxmvcj3iHqVSo1vO+GpyATUEKN5RREgLh1lW/pKI=;
        b=sRwocqnwLc3lH/h3nqIRlpr544soL4x7Vm5wg+my8qfylTcDlWN1O2bgi/XSYyLCqX
         ILY/9i8DABS2RVOfbZ7/5HzTOSXT0jUqeboJCwaNYdsfqIEMbNRDy+s/+8dSCzDLWd4Z
         iLRdlmzQwX9JH9Q0onfZxc4c2pXnc4nIJt3/9bv2EDD0aQ5EKaZ9vWMbCCD3CL6BI/5W
         QPOAoU3sSc/J7JDxZdImn1KaqmmJVphF1/xkyoVXr1mcFuQdF001Q2tEpgtGTB9adJa/
         axxwrVtwcSqt3LHxJ93ZV561DooaaCXL5gCQfYnXMSCt/gJP1O68nPlFASgU8S8vB4TY
         WYfw==
X-Forwarded-Encrypted: i=1; AJvYcCWMmWgPxHSqZd878dM75j5L/JGhb3WbVpPXWpULgvOnN7q1h6in2R3WaPoZMzRj3XURixLfcQeWryvzNiBSqs6+@lists.infradead.org
X-Gm-Message-State: AOJu0Yzvw8Eab7gLDP8MoY9roc1zHGqdSH+jssy3l4rFT0Wnm6kKu4FW
	P4fRqKhQ7A7NAI3aVKxf0k8tzrKOg8z3BNEd9/8L+GNZhhWslrFN5S9BReX6Ki4=
X-Google-Smtp-Source: AGHT+IEAG9yn1GIhE2YrHT9rrcbTzRT2YsspXsGtFKg4MG2x8/7FF58dsirEGqVuW26T1ugiJs7GKw==
X-Received: by 2002:a05:6512:1106:b0:539:8b49:8939 with SMTP id 2adb3069b0e04-53c79e913efmr2851992e87.41.1730420723969;
        Thu, 31 Oct 2024 17:25:23 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53c7bcce489sm371153e87.127.2024.10.31.17.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 17:25:22 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 01 Nov 2024 02:25:09 +0200
Subject: [PATCH v2 6/6] drm/bridge: dw-hdmi-qp: replace mode_valid with
 tmds_char_rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241101-hdmi-mode-valid-v2-6-a6478fd20fa6@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2043;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=rnWWDnvK/2UdwmliNMd8qjy7ZbPEcXVWLie22T2NTNE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnJB/iyyoKxhJ9ymVIF5jZKxhY4Q/llakDKMFQT
 BEjedUrIaeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZyQf4gAKCRCLPIo+Aiko
 1URAB/0Q+lN9KyT42dXskzxxSyFiafqSlV1SV+VcON3MjaaEaECIjnFoHbPKEDxvle6Xicl7vHs
 h46RF3lrs7ptPTroESb/pvPY/Jj5EK9/dqatVhqiLYq2adABTz85k64UaLF9WIvj1pF54o1lMJJ
 0R4OFGKZEAjC02s31dNE4fIMUbhsnc8JNoP15YRKxjq6AvslRKkkh+qCN5QhotWa9AUe6/FuS3d
 S7bNUR5mrFzDH3QH2n196BQPAJqsuELq2I2VbXoJuXeBSoQHuH5Dlli1/25UfCBLmbABtstMdis
 ux9EbzgijZfuFg2ndroerRXzSm8rHmu9np1KtZBbhZYdo8ju
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_172526_110678_2FB6751A 
X-CRM114-Status: GOOD (  12.83  )
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

Replace .mode_valid() callback with .hdmi_tmds_char_rate_valid(). It is
more generic and is used in other mode validation paths. The rate
validation for .mode_valid() will be performed by the
drm_bridge_connector code.

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
index 181c5164b23192f0b557624d73c6223032b90ec6..c686671e4850a1af75b82995185ffc3cbb22a447 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
@@ -442,16 +442,14 @@ dw_hdmi_qp_bridge_edid_read(struct drm_bridge *bridge,
 }
 
 static enum drm_mode_status
-dw_hdmi_qp_bridge_mode_valid(struct drm_bridge *bridge,
-			     const struct drm_display_info *info,
-			     const struct drm_display_mode *mode)
+dw_hdmi_qp_bridge_tmds_char_rate_valid(const struct drm_bridge *bridge,
+				       const struct drm_display_mode *mode,
+				       unsigned long long rate)
 {
 	struct dw_hdmi_qp *hdmi = bridge->driver_private;
-	unsigned long long rate;
 
-	rate = drm_hdmi_compute_mode_clock(mode, 8, HDMI_COLORSPACE_RGB);
 	if (rate > HDMI14_MAX_TMDSCLK) {
-		dev_dbg(hdmi->dev, "Unsupported mode clock: %d\n", mode->clock);
+		dev_dbg(hdmi->dev, "Unsupported TMDS char rate: %lld\n", rate);
 		return MODE_CLOCK_HIGH;
 	}
 
@@ -510,7 +508,7 @@ static const struct drm_bridge_funcs dw_hdmi_qp_bridge_funcs = {
 	.atomic_disable = dw_hdmi_qp_bridge_atomic_disable,
 	.detect = dw_hdmi_qp_bridge_detect,
 	.edid_read = dw_hdmi_qp_bridge_edid_read,
-	.mode_valid = dw_hdmi_qp_bridge_mode_valid,
+	.hdmi_tmds_char_rate_valid = dw_hdmi_qp_bridge_tmds_char_rate_valid,
 	.hdmi_clear_infoframe = dw_hdmi_qp_bridge_clear_infoframe,
 	.hdmi_write_infoframe = dw_hdmi_qp_bridge_write_infoframe,
 };

-- 
2.39.5


