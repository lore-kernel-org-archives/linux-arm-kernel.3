Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79851E65D36
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 09:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+hHECBYEofE1LVFfISufmiOFENr43Xg+pptUAkUKUyA=; b=Q27Gxvr+H0cv2nTDDWuKJfYpph
	QKgc5/eHdfVM7TElwBUWuNc7wbCRtBR73dtpNLij9MyoLqktfpJP597GJw1QKT+r8TjMCL14QZAA4
	DwnTwjZRaNjiAdV1KVuGK29UL8qvTlBDgNLDn03ai/ar7YZT76IXUqdASEvrG37/23SVZ8fIPGS5B
	kORzLwudFAgY9SLphPzJcBB6+Bqz//8PbROCSyS9Mgtkaekfmj0M2Vtyqcish1wovghO815XSB86F
	mNvAFZQog269kjt7VX68i0vOCmFUw+aec2IDSsIBQSW49WIqtVUBhJy/KyR4xuq3kubfHmI+mfTrr
	gsQ8bubg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEPrL-000000024uU-3Eii;
	Fri, 22 Nov 2024 09:21:51 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEPjH-000000021lm-1JmG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Nov 2024 09:13:32 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-53da209492cso2433808e87.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Nov 2024 01:13:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732266809; x=1732871609; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+hHECBYEofE1LVFfISufmiOFENr43Xg+pptUAkUKUyA=;
        b=uiC7TJacYlw8InJqnd4AjDwpf7vnrDSxaAlWYikTDvPIFRM7Sge+7Wp0+XKdvvSlkG
         VWyHXQ29USRKJxpkpy3WrQzvY7LUVQpBEZUeD1sMF4Wh7G+StlDMuvjLwyq0imcLmPNI
         s0TqYTYEvdZ2rfmuHWbBzlXkvVpswJi/kRWgzs9Nqzx5zisjkDYIY4AJig1XwK+7cICr
         aJQTYTc3QVJKOmphlCTYjfyLRC3vJ+LbhFRKXD57I+UgRGaX1QNArfGFi4gsnC+oiN9C
         WceVmUdzEKMUyoEulBwt+KCCochXNEgbn0a8cDuubGfbgNvStjeJEUIEzfvJlWcI+58e
         Z/VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732266809; x=1732871609;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+hHECBYEofE1LVFfISufmiOFENr43Xg+pptUAkUKUyA=;
        b=CFZdkmhqdzxR30oAN+hwfF7m6JIoMPY10rVKBtqXTrxMYscjMKsxVUeuszzIAzAOw5
         nh9S0lZyil0udTBWw0srub2CdMwAoaKEXZ9E7lRRtS847XWYkH+453N+caW/k8/Cudah
         +91zx1hO4FAYwSD+yr3xbFPEdv0bt6GldusLEVSO2ySjtu8CjbuPyLmP1dePDPEejbJb
         VwT5nxOMEpIyz/ws7HiCtHrvSzsAC6pE9d1dbNY6nAcAm8r/oDI/+QDL63AcLkPeMBsb
         IDF1DPz2AKv21izHljVMQsCncx+Sf32xBu0gYuJUp4tDatp3VG5KI/SVzmYLgCQhQUvf
         P+HA==
X-Forwarded-Encrypted: i=1; AJvYcCUpxiBo8TQd2+dTr9IQ7+x1N9v/eD94VzrNwwOoPKhEphVguQWX0o+nZu7O51kNd3wthcAyYb5GphFTiOdaFMh/@lists.infradead.org
X-Gm-Message-State: AOJu0YwH9ZBJosA1kMfl/PHqq/ZF+2f7WjFB/21PZuAznjMhfLMimAXn
	7/g/JyEzhHXVc2FurbtZ4mzKivh2BseOU2X758943Kx3nBh2OLMjFZGwQRTm/bI=
X-Gm-Gg: ASbGnctOuNe8EopdMSoWhMngrXuiwnYZXRIdW+f2uMan3/O3ImINzm3GUfR6Le3ATwd
	soCnQ2rG3TjE5iwAPX8XSiWk2DzfPCPujeXbsrmTJnkffa6UjRuFLDdaF3MdfQ/Qm9CR9h0Adwn
	t0FwTUFqKiP+HbcsxMTVEX2Yx5Z+jjImgXdmuhkU9OvAfUgG4SZpUCMt02OUaPYvs3EeTJbrB0e
	/NTRa9oRpHFqV+P+f9CcbXuo8DHwmI9Tuc1tygevNBqFD5Mh0B2nO5qLQ==
X-Google-Smtp-Source: AGHT+IEacF2R7IM1WOXDiiyEZw72yOQOODx70vgQAIsHBOvrbaiI7+vacg+XzA2nbeGhQv/5FVkoNw==
X-Received: by 2002:a05:6512:33d1:b0:53d:d661:ada with SMTP id 2adb3069b0e04-53dd6610bdcmr495351e87.8.1732266809396;
        Fri, 22 Nov 2024 01:13:29 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dd2451386sm299530e87.77.2024.11.22.01.13.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 01:13:28 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 22 Nov 2024 11:13:04 +0200
Subject: [PATCH v4 08/10] drm/bridge: lontium-lt9611: drop TMDS char rate
 check in mode_valid
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241122-hdmi-mode-valid-v4-8-2fee4a83ab79@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1393;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=CHPPIcbOk/4oF+oFDkgVgA19LBW1SDNLoLgjIjG3wi4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnQEsiedj1vWQXgZXcLJ02DcFxwDE5gszj18sAt
 X34dCGJZmKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ0BLIgAKCRCLPIo+Aiko
 1bSCB/9slyF05dGTP/R8bS3bpgFrC80+3aCli/HGX/hh9ZecB7M0/4Gtv1SuBYM+KdZhbrux6LE
 pczE2VQiA9zmyEtW0G5wbp1FeQvVBM8ruyAQIhmvjHQQTlnjC8Upiw/vuPynB4nUVZWHfhhYQmL
 zAEr0NKRnfHyVcsBRwxOdxyoVLnAqyl4aW9Ms616ITIiIb8MXaArqLlDxULPZrDRxxX17OEl0V6
 PCmq7Qc1dmPgMoaJfFSHCVIrgBet7swGVQ7Bft4pgEsIeljuwq+YPquR/XJM8bitfAaIpRNn1BX
 frUWcluAbmUtixwbfjgPP6l9mfVYq5tjcrdl+FwRNElIvckp
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_011331_355366_C9DD04A5 
X-CRM114-Status: GOOD (  11.91  )
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
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/lontium-lt9611.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index 8f25b338a8d8f95dc0691735ac6343675098f7f7..1ffbe473e4103dfc315a8cd3571e9407bf518797 100644
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


