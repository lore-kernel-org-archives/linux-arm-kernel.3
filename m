Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CF3FE65D35
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 09:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+yuGfl/EBV1L9yZwllQ4z7rC0GCiUIVGF8V+6a/LgMU=; b=ms/4z6rJbMcOOi0DmAosN2w3Up
	WHn4TXLCLHAlpVOdFqXM9Zad/G9O9Cuj2WIRVSLc8nyCe78noE6YObOEL5abp7itJ62aVdTna3VLB
	6m/FVjluOlHpRqcY2gChsn19XZvhKgb+R8gjRvEmDyL806cUF5LDg14q0jhFDePOZx/zIpp/xXSkZ
	HXiUXUBhj9towsYxJ1FvkFKLN3klyS6++761XbUvwBZYShXQTE5k9C9JzaXZ8JXiSQVLxyqcAXndS
	NymUMP5uhqdVrdtF+GFd9MFFmXLJ8XtEj3lVbGKwJGCZc2xdgTpg+kARhObZsZwfbdr04oL/KPiuC
	opl+5dkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEPpU-000000023sb-1zl4;
	Fri, 22 Nov 2024 09:19:56 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEPjC-000000021i1-1ui6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Nov 2024 09:13:27 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-53da4fd084dso3071829e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Nov 2024 01:13:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732266804; x=1732871604; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+yuGfl/EBV1L9yZwllQ4z7rC0GCiUIVGF8V+6a/LgMU=;
        b=txR3ehGNqzjDQE8ytKQaG8zvz2sNPWiUjpKOVe9oVfqrnAcWPbIa9MmQA2EzGsACR2
         MzK3ZJ57PP2DaA9vkB52wE8nGr5voTwVY57V4bHahTxZ5Keakn1hqTzgRcQ+8IoL1cuJ
         b2vYEIy02OudZVQFxbL+jWX5bR0kwvGD97l3TKyPxqllg7zxOcS8dYavAQSJWk6EfSbn
         z5MG4JQMn8wwSv5RjszgefOFuSNAE3KcqO7yx1wonTqdmgcaBYPhaIgByIBCHkLU0n6k
         +L7IZcGU2FE8C9Lin+jCWeqk9exmg3T9VFhMpcBJTYMvokibyij2iievoD8m/yMJCBje
         XF2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732266804; x=1732871604;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+yuGfl/EBV1L9yZwllQ4z7rC0GCiUIVGF8V+6a/LgMU=;
        b=s8PlW7L4w7m2rmZAGf2mqWmkwEejWek8An1zPmWn5ZjbIzuBRkVSz1lif2SQ8yQOJT
         kR9NHqUemLb5ZW5PEwUqqJfaSbmM4fa6g1FdxvlF198h75Xm/8SYf8109gzwo+3aCoeo
         DhkqF1s++BvxdruHDGkEEbWuPQvwLe3Bqoy2aiKxq7APCCfIOCX7i6+5P+j3Gjk8wDbz
         3vrsPHxwWe4+Q/Meh7SzzVkQkunYXQcjfmP57AZx3lCH8PtglWpOyWdSa1oBmTh+jAhL
         bPN1aRGGyMl4u7SJq4k8F8dRrl62igrxcob+ks3zTbPAQ9QePWocLS+ueqGkXFsvc2Kk
         CTOw==
X-Forwarded-Encrypted: i=1; AJvYcCXn6dJH/PNUw5QNEZDmutt2f7Qhj+s+bYOsude35WqpyZjiWtZO7ZlFS4x9CdK5R7Y/LVRvoDgAGkQFuASziiF7@lists.infradead.org
X-Gm-Message-State: AOJu0YzyJ9TwcSqmFnG0qBBB31ez2ayr6iwOIA+voK0JzrS/xXeef0jD
	Z/sBC3eXdZ/om3tDWv+KyqY4KYbRRHUK16vVZErWVaTrKPeWqzLAw6+WVc7/iJM=
X-Gm-Gg: ASbGncvBTyfyXQaINUOn3CpX5zMnTwvJ0KoTufUjIy+9dcoojYNxJBx9V919pzaLoCU
	YOpEQZqtN6HlJziYu9IROeGWkaBvq9N++YqV7+mHUlvos8Sge4SHPuPRFZoRSDdSHCKNvoRg49c
	iI91ozEzRi1wkFVk459NaxbJbLcdYKzpEqmm7tcqm7kGqTu3rrinexpBol0JQFf1YNDH9NDm1bK
	mOuA4FZkPOrh+QLtMHK7OHtbv60Ps6SROF/Tn8T5IJSxp+5RTYJ5oSWsA==
X-Google-Smtp-Source: AGHT+IFLvHEAOMFsbgXw0Dwjm3ehikp3aJtpuOLNAA/Ny7NGqmxqJedFV/QSTgM4ejrUuhK9ANir2A==
X-Received: by 2002:a05:6512:3c8a:b0:539:fd75:2b6c with SMTP id 2adb3069b0e04-53dc618307bmr1957531e87.21.1732266804495;
        Fri, 22 Nov 2024 01:13:24 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dd2451386sm299530e87.77.2024.11.22.01.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 01:13:23 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 22 Nov 2024 11:13:02 +0200
Subject: [PATCH v4 06/10] drm/vc4: use drm_hdmi_connector_mode_valid()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241122-hdmi-mode-valid-v4-6-2fee4a83ab79@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1740;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=V4oVcdTHVT3mKFPFYYqaTi+sHqWjzKg7CIWwA7qtBbc=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ7qDt5JRalysFtfhpV3XJx9r4HUI7Mk6MKsr+cPD+3Hfb
 Jbz8vN1MhqzMDByMciKKbL4FLRMjdmUHPZhx9R6mEGsTCBTGLg4BWAiGk84GPqERKMOmjLumLjD
 MnKKz41Pm3N+pJ9/n8z0rvuN6cMZVyc75WV+fMW/4fbSA2vvrrVpMe45G3ww+9aP3vVvnz98rSu
 4O/isbPYRnyflj5ydRXks1ul3emxm9fvxfFpOelVarJm2RHEYa/6RS44puVXrtA+wmssZ5c0uzJ
 ygVmJ9LPPTud7Y0PcL77Sd/xHW+ob7VvMR38uiHV0XZA79iVnTJeCicc++kzU/JSzJ6oPkpn6nn
 mvqh9ltP5Y1VQhNcD2W0HDzreEji7nuNWpRnX37Lrr1bVsfapB0u+3tivnhToYGkh6Ov7Pn7ivy
 U2d2yzm0/xyn4Lp0CR2pL0vk/PYt+hT85/Dzhto1cnINAA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_011326_503822_2760D421 
X-CRM114-Status: GOOD (  11.67  )
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
Acked-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 62b82b1eeb3694d1685969c49b2760cbbddc840e..2fecaac0df0acd865186ee928cf26449799fc7ba 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -580,6 +580,7 @@ static const struct drm_connector_helper_funcs vc4_hdmi_connector_helper_funcs =
 	.detect_ctx = vc4_hdmi_connector_detect_ctx,
 	.get_modes = vc4_hdmi_connector_get_modes,
 	.atomic_check = vc4_hdmi_connector_atomic_check,
+	.mode_valid = drm_hdmi_connector_mode_valid,
 };
 
 static const struct drm_connector_hdmi_funcs vc4_hdmi_hdmi_connector_funcs;
@@ -1752,7 +1753,6 @@ vc4_hdmi_encoder_mode_valid(struct drm_encoder *encoder,
 			    const struct drm_display_mode *mode)
 {
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
-	unsigned long long rate;
 
 	if (vc4_hdmi->variant->unsupported_odd_h_timings &&
 	    !(mode->flags & DRM_MODE_FLAG_DBLCLK) &&
@@ -1760,8 +1760,7 @@ vc4_hdmi_encoder_mode_valid(struct drm_encoder *encoder,
 	     (mode->hsync_end % 2) || (mode->htotal % 2)))
 		return MODE_H_ILLEGAL;
 
-	rate = drm_hdmi_compute_mode_clock(mode, 8, HDMI_COLORSPACE_RGB);
-	return vc4_hdmi_connector_clock_valid(&vc4_hdmi->connector, mode, rate);
+	return MODE_OK;
 }
 
 static const struct drm_encoder_helper_funcs vc4_hdmi_encoder_helper_funcs = {

-- 
2.39.5


