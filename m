Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64117CCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 18:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4tlXBSuCi9KYqEnYaWJPbYjWr/O8PttsygtENhT9s58=; b=F/639+dcF4bFktm3RfTR8eKpCp
	0XwQ5pcBf7sV5/gSIxow4OSfPDXeLRNdO0E99SaQmm7v6g7n7vm0RelFt7bw4g+r45qhIAYUa/YVf
	KXti5ezVAmnY4srMOQtOdJPLO3IMOORaQgsX++7+rxwZdKf1WRVVHjRRoHWP220cJK6Bq1GWF58te
	4PE6n6RGV6gDypJ/WS11RoSOuo5rn6w8vqdiSCN6Uz3yvaqpFAwzcMJD8RAsiPtuFreWsaIwm7W1w
	sLV/rHENLzqb9xMSXiBcflJ99lRuqzhHrT1ETBtOScFOHkfvjLxLuktLyQ57Xcq1G+Krx7pEphASY
	4NxP5Zzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGLUM-0000000CLnx-1eAa;
	Tue, 04 Nov 2025 18:10:38 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGLUA-0000000CLVv-24j6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 18:10:28 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4710022571cso54540045e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 10:10:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762279825; x=1762884625; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4tlXBSuCi9KYqEnYaWJPbYjWr/O8PttsygtENhT9s58=;
        b=ADvzG2FEhB73dT+mBc6PmGNq/N1TD3H7rPVq9M7iaCWSRspXL5rPGQDLn4fAiI8V4Z
         p0hLB8MumTj7HEeLD5HOUw1Uv5cQJ35uDa1Lu8GarG8BvSmhwhJg5Nm4xELoLkEudCBH
         KpqVsZ5d6HdNrbcfr+HTIVlMOmOUK8ggCoQR7YX1YqVQ88nHy7JqxAQ+MEs4AaA/i59o
         rHX7RSRPqUUOJB9FgdFzE2iXaW4tYaXDF0AUk4/hieHhdqFhE3mAqRtUqISJiShx3o1X
         MW03mMO+CP2GuD2bK3u4IWPwoDazNTc7izX0dl+GSFUUN5+RpYYzYsrVzzlrm7jJeQuY
         OLiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762279825; x=1762884625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4tlXBSuCi9KYqEnYaWJPbYjWr/O8PttsygtENhT9s58=;
        b=cs4PBgm2fLBNXsGJUe877NWCHIH8g4OFvTbO6Q1IxDZ0MlBYW1VN/iVSU19E2MSsmT
         6cbh2vsmakBvQDPKNw7iNNNjrwY12X01prj2Ol6lQzKPEWsFa+RLZXilWDw+xB3hrltO
         OirxWZvGuq9ILEJJYT22FCDbaEPfqXDPZ8cyLuytjHkbYO+a1k4qn8FDGe7GGH+LP1zp
         Gwwe7PRuuY8i706M8dEnAhrukUtYSOvlaS+lDi7jamNR9R/40AxNSEQbidK63+oQFwan
         zZZRY3e2kRbQ2vFSkM+r/tIvxgvOUsieoX4SDZBo1WJl9nDSE9JR3swRPYjGwsthPFYv
         xdiw==
X-Forwarded-Encrypted: i=1; AJvYcCX23y56CQYFshYrPTpT95MMqRIeNDAa6hcrIyDPIhZgRiynX1HmhXPAiPv4sVgLA7Zv+diHagJe54aQp2V814Va@lists.infradead.org
X-Gm-Message-State: AOJu0YwV5yodBZ/9YfCrFgf2WsgTDU55xSPUclvQgDaRJUBrh948KIb3
	Yts2F8zkbcSmkcDCTcPIas4A5o8YFYDtBblZMpQ/j4Q/aC/mlKdG15BD
X-Gm-Gg: ASbGncs1WGMVauHv2A2T9ipxIYjkfftOkhmRJPmp1+kQ+nTP2cAYXBZ7Hqqj98OAWeG
	N86nvQzucmKeZtGhIsFCmkFXQL/e7LZBdxNe/V5NHjjGjcdCYItUlEPNr+vDYHWmX3dZzzGR/y2
	cJbVFvjwE298Mc/z0EGhxotsI0iE17Sej7wA80Ayr+dDEcKtBlrYhrPZqgJlZJs6woyv8BSS9hp
	f/Qank8/gdk7olsjR4DhZpGxuQB0wABCtUd1hBTyi3Mpfb73Ts3GxsLHalp1QgRhzifN1iUF3bT
	CX2YSfCAMkbXYyGPpvnYLLsBiJwpIoDGQuKWTSjwRFxavRaMbpWFg1m2Y82R2nM39/MKbjxh2tD
	38LEU5HidhJfYMb/g1qmUq5gufSa5Fu5TVKonf/DD2m/OQbZiBPzbcyALtXEcO2Eetr1z8XYjKD
	pHpLNo/DW1whdZQbIMRg==
X-Google-Smtp-Source: AGHT+IHm1TAQjaSzwnbLWrmSeHCsVmHtk5JoxXFn6C5ye+q9ij6rKyMSLmT96AnudZeM+B1bys7ikA==
X-Received: by 2002:a05:600c:34d5:b0:471:1306:aa0f with SMTP id 5b1f17b1804b1-4775ce8df34mr2008325e9.38.1762279824672;
        Tue, 04 Nov 2025 10:10:24 -0800 (PST)
Received: from jernej-laptop ([178.79.73.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477558c1a03sm24688685e9.2.2025.11.04.10.10.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 10:10:24 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: wens@csie.org
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	samuel@sholland.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH v2 18/30] drm/sun4i: ui_scaler: use layer instead of mixer for args
Date: Tue,  4 Nov 2025 19:09:30 +0100
Message-ID: <20251104180942.61538-19-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251104180942.61538-1-jernej.skrabec@gmail.com>
References: <20251104180942.61538-1-jernej.skrabec@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_101026_796171_CFE54390 
X-CRM114-Status: GOOD (  13.57  )
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

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Tested-by: Ryan Walklin <ryan@testtoast.com>
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
2.51.2


