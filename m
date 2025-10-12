Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD4B3CCD187
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Oct 2025 19:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=08VhihKvGZOzCvy6uNWRiLafS0nfxwn+0WLCtxZhCew=; b=FReglVPpfdSn5lQVraJAxcNF9z
	gYHp0Dx6O3/H+4Alic2CVPhPftrz2yUEyzSvAGc0kkLaVAaUxQ7vZ6dd/vTRSuoqzj40nFtFrgCnv
	dVjm0JX+f4VpZtoqQX7YDOc0aLgtgFL27Z/+qwzgiVAhE9HMqNO/ZTKSFjmeni9C+LkuZHM3lBS5b
	c6UqfeKN1YB4hYuslngnqfXcOPkURZVkrmGIlO4teVxIidWyUrHWHxJTfoFHTf4qE+fwC/y8xMw29
	LiaXvZNgYYl1+JAy3uz8GsodmvZZE8vhVlWX4eudwSNewv4NrtMJ7lnKXt7fQsvrjlZr/yPnkshtR
	EnJ/RkHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v81gM-0000000BgiU-41sx;
	Sun, 12 Oct 2025 19:24:39 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v81fr-0000000BfxD-1GO0
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Oct 2025 19:24:09 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-b3da3b34950so600189966b.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Oct 2025 12:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760297045; x=1760901845; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=08VhihKvGZOzCvy6uNWRiLafS0nfxwn+0WLCtxZhCew=;
        b=H06FFhRGzniHjyk0/IBvsf/hBTuSsCf22AqRVFNsMbS2RxDlALHDEtKS25Nt0fS6+N
         O1T+V8lkSd22bZGhCkRQEmvvzCYqp5gLMTaLXfJZL4yebMOsxASDanur4MXTJbclLgTF
         uzfOQRa1+V91Ci5SysnRPpyXIHyLW73huyytcAfkbV2mbp1Mfvrf5MdOYGPSl4gHqSuG
         4bVa/Yt8N+S+CoFTAGRp/k4+bY7AVYeAC8hbx2apytUwpd/DvkRFN6D2tuR2oBdvlpaT
         igMdezdqnrGxE6885VdCRN2aEXo1tXcZxgu2uwiWkpCv/3FH7yzwMLrAZoJDyul58oa6
         dkfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760297045; x=1760901845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=08VhihKvGZOzCvy6uNWRiLafS0nfxwn+0WLCtxZhCew=;
        b=K8Ehu2xt11z/ML/6DbAzIK3qXlBK0bvMF8OOH76QCbwDa6tBtx8yR+wGjSVWDrfdW9
         Nzjn4i9NessihX9MjXXE4uQ5s9qPNHVcK8RHFWdbqJ9Du8RVo6jU+OwNA1UIbF//aWjo
         BsykTkaXKAeYUIjh6XsBhFG1Dk/qBjCF1u96eix5D45MKIAwN6k+F3geOnAbsEGWm2F2
         wWv501Ov0Yjlh5ptbkXlaqxyb9umoIBraih3U48hpKSrQ47IM3SmQ2nafDCi3KTtTjFz
         eCCc497Q1mW7/fVvPtSwk+L8OQJ+GmNTNy9BXbAoO+EaRCoy4fAQA5E44HeREN5YJArw
         y2+Q==
X-Forwarded-Encrypted: i=1; AJvYcCX6Xx7OiWuXaJqwDjv+7awZ2b7TzNl1MnbQz7Y6MuB20rIvTZZJKtMgGvQmvWMNZ9XXkzmzYAI53z+UhZGl94a2@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3p0FMxfogcD1otskUJWa7YVwbOvrteocQRBJsZ248eiqgnuDx
	l8jnwNzfRh2Lvn/umQhVJs4mgXmwXJJicvq+25SwwX+yfiyeIMDfDoOB
X-Gm-Gg: ASbGncskebo7naMBwl8mvahHw1NisocJR8lsE/xiSA3rlACvp/P5iFMLAM5nM1TQJiF
	/A+HZSyMrtCDKzjQMZ9XJKgtTFXxL3f5XauWilkB+oO0YXVTPR77bg5dm1xzS9eCEj5l4vA4Ptf
	c/ct+6i1aMWz3qARlZgtzXzaqsfm/zi6pbnOUJIlOlEbNhakN/BpuX9Y7N1dxPmPSXNh4SeUX6K
	Xwq/LTciWPHNtP4YkFDYsxLQwkkEHbthIhLaTe9QsQPStn1az6gkFguyFmShE8XRceMw3ooPS2b
	cqkpAvYoZJdm7U7gN+547F0IJExKg/NTnjcPATlt8616DfSnAIwTe3GQYyWXSbAdk58MNjAOcei
	ufgHPDGhrAMixDQ9TJyYMp9hf7dxRKUE1Bbi+bBMyhZ5lA6m60f+Qm+K1gH2tz3MHlUvIz5agPO
	Jp8gM9PMyllrvighAfL94mTzbjVp5Vbe0=
X-Google-Smtp-Source: AGHT+IHvhXW73NXWnN/w1+a157WT7XVAMC9an0CwaQWq1dgdtB3ecG7lOa+m5GizVxeaSFFM+lpHgA==
X-Received: by 2002:a17:906:dc90:b0:b41:873d:e21f with SMTP id a640c23a62f3a-b50aa292f1bmr2074832566b.18.1760297045043;
        Sun, 12 Oct 2025 12:24:05 -0700 (PDT)
Received: from jernej-laptop (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d67d8283sm760176466b.38.2025.10.12.12.24.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 12:24:04 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mripard@kernel.org,
	wens@csie.org
Cc: maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	samuel@sholland.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 21/30] drm/sun4i: csc: use layer arg instead of mixer
Date: Sun, 12 Oct 2025 21:23:21 +0200
Message-ID: <20251012192330.6903-22-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251012192330.6903-1-jernej.skrabec@gmail.com>
References: <20251012192330.6903-1-jernej.skrabec@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_122408_292047_0FE06869 
X-CRM114-Status: GOOD (  13.94  )
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

Layer will be more universal, due to DE33 support.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_csc.c      | 10 +++++-----
 drivers/gpu/drm/sun4i/sun8i_csc.h      |  4 ++--
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c |  2 +-
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_csc.c b/drivers/gpu/drm/sun4i/sun8i_csc.c
index ac7b62adc7df..c371e94b95bd 100644
--- a/drivers/gpu/drm/sun4i/sun8i_csc.c
+++ b/drivers/gpu/drm/sun4i/sun8i_csc.c
@@ -227,22 +227,22 @@ static u32 sun8i_csc_get_mode(struct drm_plane_state *state)
 	}
 }
 
-void sun8i_csc_config(struct sun8i_mixer *mixer, int layer,
+void sun8i_csc_config(struct sun8i_layer *layer,
 		      struct drm_plane_state *state)
 {
 	u32 mode = sun8i_csc_get_mode(state);
 	u32 base;
 
-	if (mixer->cfg->de_type == SUN8I_MIXER_DE3) {
-		sun8i_de3_ccsc_setup(mixer->engine.regs, layer,
+	if (layer->mixer->cfg->de_type == SUN8I_MIXER_DE3) {
+		sun8i_de3_ccsc_setup(layer->regs, layer->channel,
 				     mode, state->color_encoding,
 				     state->color_range);
 		return;
 	}
 
-	base = ccsc_base[mixer->cfg->ccsc][layer];
+	base = ccsc_base[layer->mixer->cfg->ccsc][layer->channel];
 
-	sun8i_csc_setup(mixer->engine.regs, base,
+	sun8i_csc_setup(layer->regs, base,
 			mode, state->color_encoding,
 			state->color_range);
 }
diff --git a/drivers/gpu/drm/sun4i/sun8i_csc.h b/drivers/gpu/drm/sun4i/sun8i_csc.h
index ce921521aaca..2a4b79599610 100644
--- a/drivers/gpu/drm/sun4i/sun8i_csc.h
+++ b/drivers/gpu/drm/sun4i/sun8i_csc.h
@@ -9,7 +9,7 @@
 #include <drm/drm_color_mgmt.h>
 
 struct drm_plane_state;
-struct sun8i_mixer;
+struct sun8i_layer;
 
 /* VI channel CSC units offsets */
 #define CCSC00_OFFSET 0xAA050
@@ -23,7 +23,7 @@ struct sun8i_mixer;
 
 #define SUN8I_CSC_CTRL_EN		BIT(0)
 
-void sun8i_csc_config(struct sun8i_mixer *mixer, int layer,
+void sun8i_csc_config(struct sun8i_layer *layer,
 		      struct drm_plane_state *state);
 
 #endif
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index 2290c983e177..4f0c929faf36 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -301,7 +301,7 @@ static void sun8i_vi_layer_atomic_update(struct drm_plane *plane,
 
 	sun8i_vi_layer_update_attributes(layer, plane);
 	sun8i_vi_layer_update_coord(layer, plane);
-	sun8i_csc_config(layer->mixer, layer->channel, new_state);
+	sun8i_csc_config(layer, new_state);
 	sun8i_vi_layer_update_buffer(layer, plane);
 }
 
-- 
2.51.0


