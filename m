Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAAD3CCD18A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Oct 2025 19:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FWJm6Ru2WyONf5Yro6jfwB0WobfTQWEzjnSYauNm30E=; b=iynSuB5n+MvosmgsPKIQXXa+BD
	7/owgk6mhKRcNNjMgyWYpfQlHCKyYMdMCKFoNsAFjHR/Co7Baxy7Z67g/zJ4vOlq1VRWwIvSG+20D
	5y6sbjB3/hYY2HIm4FYZFXlDoZ6fDzDy2jJz6c1O59jzlSBOE47uFDQ13KZ1Em32TySl+RW4XKD8z
	1SOb8mGlLu5ZcO4m90hNA3kBpXtMMAeZDhQzESq3GguibuorGyA/cvSj03WRE8LGDxV594OmmRjI3
	S3Lq6WRfVaikrm8w7iIiUvFeq6UxKO78JKahzNgjVgU58Tg09Z4DpfMbpZbdckLWQ4BYol4ZSWTDz
	Sav3H1DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v81gA-0000000BgR9-3DzJ;
	Sun, 12 Oct 2025 19:24:26 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v81fn-0000000BfrT-3VCX
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Oct 2025 19:24:06 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-b3ee18913c0so549775266b.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Oct 2025 12:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760297041; x=1760901841; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FWJm6Ru2WyONf5Yro6jfwB0WobfTQWEzjnSYauNm30E=;
        b=mQUdXLBIiqbtw2Ngw88aUVVEzsi+fk9ANyfwk6cZw9vmaN+RLqPGWL79T/+Kgq+G/X
         zaYIAlEl/ghV8M0eGRufHrf7NX5ZwKOIqH80udju0fhBZiABMeJZBUjrcdZ/FosOUJt6
         07NdD755gfiyIKVxRY/QWQCW5Pln+9HnNs+gXQqRuqO0cvCU9ZLKql9ryaLceqTDxDIG
         B5ZyMuJhcjphIGiA0/cf7NJd+8VeAVwlc3XjfZw1kpU5VVimJHfXBh67PSqZw+NllfmR
         oOhc2a7RQZmdF3OeXvuvy1amq2Fx77MUwa6Pp4JVt6DE0z3bIT/p1id2Kb+9JqMvRQxd
         ee8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760297041; x=1760901841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FWJm6Ru2WyONf5Yro6jfwB0WobfTQWEzjnSYauNm30E=;
        b=ruyUTUin2CfW0pl8Z83IPE1zxin4cPKBkl7EtfkwGLXcD9IyaF6VRHEwDF/6eWlccp
         kXr0PWJeOvnUOfm2qXE6L058cbYd6F7fddKBN4c4MlTJ3PYcu7mfluRtTcmkM9tlHoBs
         gKvTvNrP9uN3D2CsjYneGBhMafmUWJiq5SZcm/xRUfOOZe7gqtmVL0hLzYGOoTb0OA+j
         m8sNex60xZ5JrbnK5GH753uGOGDf1kOxCY80q3LxaRZP4WPsP9oJoRzmO0ovGlstGvD/
         Kyar8tF9ajiR+T2vBLrkuADYfLj2JV1os8sZ3EWi2gWBoz/pCf9Cx4VXr5KSO5RwrBnm
         0FOA==
X-Forwarded-Encrypted: i=1; AJvYcCV459yn3Zc8S9X+kyYa9Y/QoQ0EAUtz9yZL0cHKjw+RFSKFf3BVeFABQVBGIhvEAvq6XfrMJFsLJyBisF7JHTSo@lists.infradead.org
X-Gm-Message-State: AOJu0Yya5Wv6IK5BYXY6Q+e1asR30buu9ZbNcskcXacE18jtu0aYP4/q
	+yz8cRUupZhNM7qMMCawF0bakPDjQ+V8CUQVJq5R1OFTfIbc2Bdvj86x
X-Gm-Gg: ASbGncu1p0R22MaDzYFMDnx7CrEa1fPb6b0LDHOFuySUlXD8oCZ4E5uYYhgwvHcaNhL
	+rhMYypfoXh6K76d7JpyJP8BySCnu6fO7viBd1XyAeaiu+Yn2srhVwQZd/i4gIE6VFs0euownjt
	dZt/IYesdi+HASoblgqlQSqJ17DhQXw/eKLC5Cmz5rYivg8qontBFDSvBH3wXtqplbtpOXDeNSU
	qSciNpJXuSc9kkeE50Ask34pIrbnMXiVVR5NIWhIU4aXoVlfReZlXeu9kUG7rP2eucLTjtta3SO
	A2LePhINwKZ8wSteUPwpjHF90VOsH80+vV6A2LDkiaIB4xkDbSGAi+u5jDdJoqAWpcNuoV5sY+J
	vlRzEHU30N4kKPe/w4joNJc0AI0yjkTl43pHIH/TsQ1sUtZax8LbkmrLEwYEWqJnkVIUROwDHls
	9mNtuSt2K2ne9xvkKIHezR
X-Google-Smtp-Source: AGHT+IFB2WPpLvhhyF6jFh1SDHHRriNhPzMUznraEeE598jcJE65TAjpsOVtaGxdtE1HPt1fjYbNLA==
X-Received: by 2002:a17:906:7312:b0:b57:78fa:db40 with SMTP id a640c23a62f3a-b5778fae354mr614837566b.46.1760297041514;
        Sun, 12 Oct 2025 12:24:01 -0700 (PDT)
Received: from jernej-laptop (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d67d8283sm760176466b.38.2025.10.12.12.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 12:24:01 -0700 (PDT)
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
Subject: [PATCH 18/30] drm/sun4i: ui_scaler: use layer instead of mixer for args
Date: Sun, 12 Oct 2025 21:23:18 +0200
Message-ID: <20251012192330.6903-19-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251012192330.6903-1-jernej.skrabec@gmail.com>
References: <20251012192330.6903-1-jernej.skrabec@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_122403_956066_801FA839 
X-CRM114-Status: GOOD (  12.66  )
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

Layer related peripherals should take layer struct as a input. This
looks cleaner and also necessary for proper DE33 support later.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c  |  9 ++++-----
 drivers/gpu/drm/sun4i/sun8i_ui_scaler.c | 14 ++++++++------
 drivers/gpu/drm/sun4i/sun8i_ui_scaler.h |  4 ++--
 3 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index d5b7241acdea..9b938e3dae9c 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -109,17 +109,16 @@ static void sun8i_ui_layer_update_coord(struct sun8i_layer *layer,
 					      state->fb->format);
 			sun8i_vi_scaler_enable(mixer, layer->channel, true);
 		} else {
-			sun8i_ui_scaler_setup(mixer, layer->channel, src_w, src_h,
-					      dst_w, dst_h, hscale, vscale,
-					      hphase, vphase);
-			sun8i_ui_scaler_enable(mixer, layer->channel, true);
+			sun8i_ui_scaler_setup(layer, src_w, src_h, dst_w, dst_h,
+					      hscale, vscale, hphase, vphase);
+			sun8i_ui_scaler_enable(layer, true);
 		}
 	} else {
 		DRM_DEBUG_DRIVER("HW scaling is not needed\n");
 		if (mixer->cfg->de_type == SUN8I_MIXER_DE33)
 			sun8i_vi_scaler_enable(mixer, layer->channel, false);
 		else
-			sun8i_ui_scaler_enable(mixer, layer->channel, false);
+			sun8i_ui_scaler_enable(layer, false);
 	}
 }
 
diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_scaler.c b/drivers/gpu/drm/sun4i/sun8i_ui_scaler.c
index 8b7a58e27517..fcd72c4fd49a 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_scaler.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_scaler.c
@@ -127,14 +127,15 @@ static int sun8i_ui_scaler_coef_index(unsigned int step)
 	}
 }
 
-void sun8i_ui_scaler_enable(struct sun8i_mixer *mixer, int layer, bool enable)
+void sun8i_ui_scaler_enable(struct sun8i_layer *layer, bool enable)
 {
+	struct sun8i_mixer *mixer = layer->mixer;
 	u32 val, base;
 
-	if (WARN_ON(layer < mixer->cfg->vi_num))
+	if (WARN_ON(layer->channel < mixer->cfg->vi_num))
 		return;
 
-	base = sun8i_ui_scaler_base(mixer, layer);
+	base = sun8i_ui_scaler_base(mixer, layer->channel);
 
 	if (enable)
 		val = SUN8I_SCALER_GSU_CTRL_EN |
@@ -145,18 +146,19 @@ void sun8i_ui_scaler_enable(struct sun8i_mixer *mixer, int layer, bool enable)
 	regmap_write(mixer->engine.regs, SUN8I_SCALER_GSU_CTRL(base), val);
 }
 
-void sun8i_ui_scaler_setup(struct sun8i_mixer *mixer, int layer,
+void sun8i_ui_scaler_setup(struct sun8i_layer *layer,
 			   u32 src_w, u32 src_h, u32 dst_w, u32 dst_h,
 			   u32 hscale, u32 vscale, u32 hphase, u32 vphase)
 {
+	struct sun8i_mixer *mixer = layer->mixer;
 	u32 insize, outsize;
 	int i, offset;
 	u32 base;
 
-	if (WARN_ON(layer < mixer->cfg->vi_num))
+	if (WARN_ON(layer->channel < mixer->cfg->vi_num))
 		return;
 
-	base = sun8i_ui_scaler_base(mixer, layer);
+	base = sun8i_ui_scaler_base(mixer, layer->channel);
 
 	hphase <<= SUN8I_UI_SCALER_PHASE_FRAC - 16;
 	vphase <<= SUN8I_UI_SCALER_PHASE_FRAC - 16;
diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_scaler.h b/drivers/gpu/drm/sun4i/sun8i_ui_scaler.h
index 1ef4bd6f2718..872d88a58e7e 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_scaler.h
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_scaler.h
@@ -35,8 +35,8 @@
 #define SUN8I_SCALER_GSU_CTRL_EN		BIT(0)
 #define SUN8I_SCALER_GSU_CTRL_COEFF_RDY		BIT(4)
 
-void sun8i_ui_scaler_enable(struct sun8i_mixer *mixer, int layer, bool enable);
-void sun8i_ui_scaler_setup(struct sun8i_mixer *mixer, int layer,
+void sun8i_ui_scaler_enable(struct sun8i_layer *layer, bool enable);
+void sun8i_ui_scaler_setup(struct sun8i_layer *layer,
 			   u32 src_w, u32 src_h, u32 dst_w, u32 dst_h,
 			   u32 hscale, u32 vscale, u32 hphase, u32 vphase);
 
-- 
2.51.0


