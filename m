Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D452DE67492
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 00:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oz8IVPHbbVKsM7ENVrxAMUhoPK6SMfJXrPI8pxkC7X8=; b=R5Ns/xI7PL1dxRJgZ0KJXp9sY7
	BF5Nxm56braHrKayMO0aDo/cbjAsFFGNGzBkeDayVQiPhXcHVFAJcJHkmg7giycGKpozmK51BJudp
	L9hRIY18ZXpoapSmJMBEPtMb3Hp6jqwz0MFyc4fQ5zQay937eLGnc5O51nEJFRUy8xwSCxMkL3g+C
	7AqxHVTj8FwiWjWIfwxX5tkIc2CQHbT9OPok+hncWb2PaMz3e+fOOZj/y1le/YHYQzMo/42ofxnLZ
	oqFQVt41IZaJi6s3nh4a9fdKqk0n7ZxM+HLg8DMeU7OCtO282UCGJYgekVynVzdjjwiVJ1wolC68Q
	/twiQ9+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6fbS-00000005JAH-0uDc;
	Fri, 01 Nov 2024 00:33:26 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6fTa-00000005Hqu-08wo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 00:25:19 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-53c73f01284so1825940e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Oct 2024 17:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730420716; x=1731025516; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Oz8IVPHbbVKsM7ENVrxAMUhoPK6SMfJXrPI8pxkC7X8=;
        b=Sm2AWshOvEutMc5ftjzmMigyhPv6o/VIYwxoAzsgtKk+eo387AUk5jBzYJf4jRctOR
         fmDmyFC78ybJycqFFYR/nc5Hj95383XzNpmj2WWac30M+c06tPs8WWPLjxxF1QrtCN4C
         UFw/FfDd+ti37pls6CmsYWCv7QJa/w82thSIIs2wVfiaKtCiW6mXW33oTMvjPZroVc/U
         w0XnB/vi6WzPY0r0+eqch/9+zpe8AzmeNSPgIdpFNqvfg4OYYozFFTE30FTH0AmCmYaS
         Xd88vpoVt1xcAdFeOXbjUXRTer8aNwHMK6w0fiTGOjlpYs4Rs2lqo1ZsJsEmXjOWQ71m
         j3/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730420716; x=1731025516;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Oz8IVPHbbVKsM7ENVrxAMUhoPK6SMfJXrPI8pxkC7X8=;
        b=AOK7GXqsscnJYzmI8019z4iam3AHtmirMj7nodhzOZTSotfWtVk6+5pfekNe+VZH7I
         8kFq9cc87ngUn3ZE2+l5xae+Lv0OywzX4FBzs/HSTJqDuirT/OPRLC12wuoZHnhgNdGY
         Z0RcAbVMwHqPMjqLIN5/vFEIkC5Eu+Rj96/BZ18DFw28116TQNa1V/b0ALeUEl8g/8zN
         eSraBhFuzFPUoZFAJdjF2u80OHFowjZE8+rmDeNBy7eeY9J9yvpjRjy5YQwJewIkgtrz
         /z2LhP2oxmn9GHirGzT5zSidGNJzcZ8rBwoiLegmOre893R364/UKCruPUvxfILJOb3X
         F8qA==
X-Forwarded-Encrypted: i=1; AJvYcCXL33xO8S3p3UXzajPIiH5hxW2mfEmZiHUtu6ttOmu/sPN2ci4BfW8XIx3f9f4amCIdsJ1ROnDM81ZpYfzWGIUV@lists.infradead.org
X-Gm-Message-State: AOJu0YyL/mcfT7TPJVeQxdHSYYnuAg0cBEyn4XofS2LgXLnoOd+0RBGr
	GRkmB2IDxqFQxNR1M5k+WUlFJuARmvE2re54OBggr0jhC+NfheUt6vUihjnwqek=
X-Google-Smtp-Source: AGHT+IHcnRqxSLmcfcXWYuLKSdTWcQFnoMfz9gg3tI8jWHEyOYxomQLugov09w4G+e8FKbd9IggEGQ==
X-Received: by 2002:a05:6512:2214:b0:539:fb49:c489 with SMTP id 2adb3069b0e04-53c79e16c2emr2460125e87.9.1730420716030;
        Thu, 31 Oct 2024 17:25:16 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53c7bcce489sm371153e87.127.2024.10.31.17.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 17:25:14 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 01 Nov 2024 02:25:06 +0200
Subject: [PATCH v2 3/6] drm/vc4: use drm_hdmi_connector_mode_valid()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241101-hdmi-mode-valid-v2-3-a6478fd20fa6@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1347;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=j8Ztg9arYN1ELRagVfF2elNxB8pJWUt6BffPwIK5vkY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnJB/hBB9KzuzMuq6rZPVIIyhq0/H5DKznjnvjc
 mWPqbE1GVqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZyQf4QAKCRCLPIo+Aiko
 1SHmB/wLX9KwONfQBArsPgo8Qz/Mgw1Z4L54OL1ZshkDnVR+j6A1CHLrTiAn9haUM9+bgg1kAdT
 mJ5lQ2iexzQSb+vqQ6TPriswRPmiJPhsRJ8Hrt/j7l7zjpf00cpdDUCc0xX4hq2FGgi2OnwrGH9
 8t/FOZqEZsmzrkkDf5Brms3bEZHmxOsYdt9C3Cr+6DGf/B41PgSXAgbp4X64iQN1BlkEly/Otaj
 vLINazwB3mxY9sN4JmhaZfrTWHNbe/39wV4Y7rA7ZCZ696ZvbGQULrGumY5jceHeqNseiYK8cB1
 UvP4ZZBU5mNKzwSAMaXF0LHzTr5DeBG8s4VVaM5S3ylORuQO
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_172518_184959_61BE326F 
X-CRM114-Status: GOOD (  11.19  )
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
 drivers/gpu/drm/vc4/vc4_hdmi.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 62b82b1eeb3694d1685969c49b2760cbbddc840e..486e513b898d7f761e8615f2afc193ca44b23200 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1752,7 +1752,6 @@ vc4_hdmi_encoder_mode_valid(struct drm_encoder *encoder,
 			    const struct drm_display_mode *mode)
 {
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
-	unsigned long long rate;
 
 	if (vc4_hdmi->variant->unsupported_odd_h_timings &&
 	    !(mode->flags & DRM_MODE_FLAG_DBLCLK) &&
@@ -1760,8 +1759,7 @@ vc4_hdmi_encoder_mode_valid(struct drm_encoder *encoder,
 	     (mode->hsync_end % 2) || (mode->htotal % 2)))
 		return MODE_H_ILLEGAL;
 
-	rate = drm_hdmi_compute_mode_clock(mode, 8, HDMI_COLORSPACE_RGB);
-	return vc4_hdmi_connector_clock_valid(&vc4_hdmi->connector, mode, rate);
+	return drm_hdmi_connector_mode_valid(&vc4_hdmi->connector, mode);
 }
 
 static const struct drm_encoder_helper_funcs vc4_hdmi_encoder_helper_funcs = {

-- 
2.39.5


