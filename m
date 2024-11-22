Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E85FCE65D3A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 09:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n9wxCYXwjuFpbEm8J6hnlc7LqgHEUz/bPD6SI90IVR0=; b=Uu0zdDvrp6dbrWINNxvJOiMq7/
	Ka2nztUmPJo/Fb6PLoWeIfc9I8eUvf5dwqG6a6spP2DHi8uyKhhGVorWUkhdMJD0fjfeIjB7F564m
	bauBI5PDEehNisrIy0DvtddERjt6OHaJKrYRlkz8XQw4BpHP4jqKLznd+xSBzwBLqUlDFPlxToQQH
	6CZLhG2xJKBdU3GT0H0gMmV3nLQgpqPjI0fOoiqG4WL51Y9KR99glzKprGG/9gvUGA9EKvx+0JNRO
	OKfqxC5PwlyDJFw582WzBPkO/YJ7zBF44zgEpYhVeqSch6TB1rQMlPCuqBcxGeYbgnE6T7bch2pH2
	d+yuYipA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEPsH-0000000257h-1vJ5;
	Fri, 22 Nov 2024 09:22:49 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEPjJ-000000021np-3dui
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Nov 2024 09:13:35 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-53dd668c5easo216076e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Nov 2024 01:13:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732266812; x=1732871612; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n9wxCYXwjuFpbEm8J6hnlc7LqgHEUz/bPD6SI90IVR0=;
        b=nDjx+zwwpMfioidIkwRledp0EcF+hljIVJaLe1sRiRx5Ntddj+PD3/q51vZUatR8IB
         GKMRZi8SNiIdL5Tr/EhLmRGTdcAv8e9iuIhvR1j2F48rqJ/Zq/I24Xf3L8uJHYHkSTuz
         T1AmlRUU7yT+V3MdHwL637O7iOIHM7EiJTKJ4+gXIIy6uDUqg16szyA/pWVjGQ1IOR5Q
         4WTI6QuDHAKS1q4DcrX2Ev1kLlBgWZEyd5gVpLrLUphpMyPJYKreiv3ahL3+7tG82ULi
         pw6QD+vEGNeEP27q7SUHU8dj1oP8KwTS4HKgOCqRovmaS/3j/DXx2E6K6A0TFc3WeCyl
         6X5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732266812; x=1732871612;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n9wxCYXwjuFpbEm8J6hnlc7LqgHEUz/bPD6SI90IVR0=;
        b=P/mIBQasVvA701BEOQvbK7xlcPuevnje6LBr9vTu0jTbJ2F8we3y9c4IiqZyx6VUOG
         tTibMshhQeqGUbNkeVEzT7yLl5isE+s/V+4HF6B+Wv7ljFhh34CTYxM8ogo6FqH7dl8G
         nTKb0ahRAgDBvj+OOOfU8ogxpcRY+vMgNADTjLqS7rMAy2fgbH1j2+YaBOp+h7UWlpg9
         1aVPMWYLw2hTaWHShFKLy1tmsnvRPLC+HWdews2YAl1S18PQkSOVQ9exl2fPMkxw317j
         BipoWARw90vcG9AfFJZ37s8uOYyLrmOgXQnhTDw4iRFrJ67w+c8X/SinopJvMz5eNX0S
         ZfjQ==
X-Forwarded-Encrypted: i=1; AJvYcCXeROEjfPI8Q3UTv5Rz1ky/+KQoUkxm2l35cs6n05fvBE2ejDmBJQBbwr24cIY5coNNZ7r52Qe6MjCiXH2bSGo/@lists.infradead.org
X-Gm-Message-State: AOJu0YwdiW/WmsvMjq3jir261i0GK3txIIIO0tVA7xo3Ya/3ifH9fRer
	MYlc/SCgJ5ppbecbTZQMswOh63Y47/HNpUoMUNGvfSKlSAZq2W2fR5qm7MP2h/c=
X-Gm-Gg: ASbGncsJsa5ladJ6uvLQx/PV92P9q40vq9Eq5d3sxfful6m+LmJ8aiXN9zgC9AqAuik
	Brz9cK/QOJcLFmLY9rGz8pLK8bvWVJr0hdZLuBLS/Gdj8fR8AW77EdauX6bcKThGloj1+E3pWuw
	Nil0ARCuGMjc2JdJlDJn4098QwOPq+iJ4eBoIKOR4CPkRuLPTqdcCtKJkYpFdOtglBJMWY3fSgf
	ihaHadtBkjKaH7KqTg+Z8CBqQ7pc9OdW43GyJICOwaRnCoS4COavrn0zQ==
X-Google-Smtp-Source: AGHT+IGDeNFqG4MBKTEb+7vEM0EHIe+kSHIzZU4cqUcGBYdZXfjh6XYO9X/0YkMh3CxsrBHQKu0dXQ==
X-Received: by 2002:a05:6512:ea2:b0:53d:c9ae:a978 with SMTP id 2adb3069b0e04-53dd29c2410mr650169e87.4.1732266811943;
        Fri, 22 Nov 2024 01:13:31 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dd2451386sm299530e87.77.2024.11.22.01.13.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 01:13:30 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 22 Nov 2024 11:13:05 +0200
Subject: [PATCH v4 09/10] drm/bridge: dw-hdmi-qp: replace mode_valid with
 tmds_char_rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241122-hdmi-mode-valid-v4-9-2fee4a83ab79@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2092;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=UjNMLqX51SwfyB+kbUbjnJt95fAbmRoKvLYOPQ8ek9c=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnQEsinpLwtf2P+iapQrUkEDkXySbQ1SEGNPG+E
 yMN1AXKzKeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ0BLIgAKCRCLPIo+Aiko
 1UAWB/wNkyuzaaWNjb3TQ3pzTEcHC7B/Rpy9L6BOjIvOeuTqTWll9d3zLo9QEE1PDxJLav2S509
 /GcNdsoEza+Au8Yx2/cJRv0J8J0BcqhPP6v01atHSxQ/lQESAhnjtbezigKj5F6augKx4qn+hBU
 05oVtI6caS1lItX/bI51kj0LEdFXBhJhBE6wQ8+jdC/YQiN6kTW7lFsat02wgdaeNGebhcNB3x5
 S4eJMeHGa15XNxAzBSWFbFzktMTFpbMpPra4zPxZpisIFGPMIpdwOSUiRLCP8Z24s4vpMhROld2
 EsX+4FEudWGB4pshKsMVn0Zbj+v8pVuawOqXGg9LMIj+ZYLn
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_011333_908242_660F2A41 
X-CRM114-Status: GOOD (  12.69  )
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


