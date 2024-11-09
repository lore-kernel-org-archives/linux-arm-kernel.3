Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5A61D5E369
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Nov 2024 12:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n9wxCYXwjuFpbEm8J6hnlc7LqgHEUz/bPD6SI90IVR0=; b=hq8auTGaRoM4OHheeeGaUluHY1
	YZkq7waACm6hoqYYZE8FjH2SnRBiEYb3FmL/PGzUUNnrEaSfdvzKMfcE3KdEGBLmIVTuoWyHmeMy7
	Dc0w58aBzM0vX2RmzIsXYVEGz5o3nFUqiCf/9riNOQorX0m5M9ntoH+ksSpzjLiRfULDAHT/ZP7PX
	e8WEnvF47xnSKb8uyBzR3FFRkHvKdTxl9tvne462d+qdyJEWT0Gvc6Jhafy7OoCYBUH9BqGXB3w4I
	OXTxfHDEuDOhUfCQVjvAivV+N8wEx1zyLb0LX0Ow20luhpv8alxl2CcPe2ijQuYKxAcVC8imTHsQS
	d01fAW/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9ksc-0000000DKup-3lr4;
	Sat, 09 Nov 2024 12:47:54 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9kgd-0000000DJ9p-24ZH
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 Nov 2024 12:35:32 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-539ebb5a20aso3461407e87.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 09 Nov 2024 04:35:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731155730; x=1731760530; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n9wxCYXwjuFpbEm8J6hnlc7LqgHEUz/bPD6SI90IVR0=;
        b=H4M7FOm7Fj3M0SvzcOE3R9SJPfc45tF6rp2fXzU5Edb5ICchfB+9z7Let85EIDdRHf
         EoGaSzZy66qArcsdLz/eJl3qiR6XWNh4GUBw525GXxVpSA1SEKYjp0ZuS+o4EndHV3L3
         plqe+oRS2WH0afHBuSXAPIJgas9FzZ4T9JUs1ciX0RVMWzFHjW3vMU0dq2/F/Gbm/dht
         tzsPPWvv+RIjbHiue+EvgrpAZj+9lTpjajhBfQlt1py04QzKaCssMSsSKw9TFmcHS5A/
         8mCGdIuTiSEU2FlT4SA+43vR5FTUrEMmD4GVHXkOCzXi7BGAyvHGT+IoQ2rdzmETm2z3
         OCxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731155730; x=1731760530;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n9wxCYXwjuFpbEm8J6hnlc7LqgHEUz/bPD6SI90IVR0=;
        b=sBqWjQ/yx/xz6HvtKXE7p1NYv7YL5d8aw/76Rp7ry8codnmfH0jrcyGQAk9IgeUFOV
         XskyabsrmNdc727WrJQIRKj14gy6kYZ8sR70m2UH+/h/C0qRolj2TwYHEsLlZYvdBpWY
         6uxRudsBtpj35boY0dxZ0M2rFrq9CNE7bQI5aPGDOMNtYINR7lPCHEoogjjdrmz/f/Ta
         PCqhM/ShfQi5rxOcZI0LfS2iZbt3zFoumGy/3//LveMkAUq9O2Z6FYgF1PTomgZrcuZF
         iyPOsVwovr9rQ4j0f+7/+7ugPxCwPHge9xWPSSsaPCkOgSQZNlcvuVXpkXqGMjrP09Pa
         Lw3A==
X-Forwarded-Encrypted: i=1; AJvYcCWPp2DKXOD8gl4GgS3+E8nYfoCL0MD4N1+qDT26HeJR1yGq2VjF1pG1CT7R13kAP2RHxvlJ5jeon7QWoxNryvXc@lists.infradead.org
X-Gm-Message-State: AOJu0YwrkT/9czE+l/GHo/bbu9ZM93EaJqQ66UBetANavI+pB3PL/xzy
	VznSdoyT8kK/6aUxCDhfyqPinhUsTN1JN8MwM/o+/mwAyeYdbvwjd3msWG1s+Tg=
X-Google-Smtp-Source: AGHT+IExWCGWwweJ3/2iRfeNRk4AonxFSRBohmS9iN1pZjqL1Hm83HHjYVjbPTXo/ZRFzwelKC8tdQ==
X-Received: by 2002:ac2:4c4f:0:b0:539:8a9a:4e63 with SMTP id 2adb3069b0e04-53d862fded1mr3117421e87.42.1731155729899;
        Sat, 09 Nov 2024 04:35:29 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53d826784dbsm922899e87.15.2024.11.09.04.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Nov 2024 04:35:28 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 09 Nov 2024 14:35:10 +0200
Subject: [PATCH v3 6/7] drm/bridge: dw-hdmi-qp: replace mode_valid with
 tmds_char_rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241109-hdmi-mode-valid-v3-6-5348c2368076@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2092;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=UjNMLqX51SwfyB+kbUbjnJt95fAbmRoKvLYOPQ8ek9c=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnL1b/mNQQcFqCkzuMTFi21MgL+ClfX6zdxYmOE
 WDmYH96sASJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZy9W/wAKCRCLPIo+Aiko
 1b1cB/4saVmbA16c6Z2bnXMNH/2b3oJllF/7OUdQvKCnntWfx23Ah8wjwzFSaoqoFc+jrad4IuM
 GUO4DHOvHv2lRiN/dW3NjaYzf/4Fs6FTemzc2Tetv9JJ6dc6DKLv0dHR+kawu93qS4TSwCbpduz
 bQJDOP0pZK/UbBjbJl2jUUGcMHS8CWn2EgZc0Y+aej2d1R87ogJebwR3Yik2NciCNDbX4INzayI
 AjmNHAq/LOOrLHcgLBbd15aEsGcw8q47AiX1jSh39Q7NHyX78ZfMpSIOQ68OnoI84bRbaz8Mx2S
 zjDUhci0ay3ohdizDU96iTYRPo+tGSq9Sxzlpty6qOenFpKs
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241109_043531_618817_0E0F5F04 
X-CRM114-Status: GOOD (  12.75  )
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
Reviewed-by: Maxime Ripard <mripard@kernel.org>
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


