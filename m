Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06310CCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 18:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oZvB8XQL4XH/MG4JrDvft0iLE7MCAIYhxytBa3l55Ko=; b=MB39Xsm66m5e96ncIUbcjhGtf7
	2bobWhpm/YAGtcDOqBAGsPTFA9YTVzy8sD20OHlrhawVx3sceLcYzGfqmOorODZ5zwIqoXv7RFXce
	Jeky6L8M0rJx9rtYM+ARo+trN8U1T75pDOB9FeKjXtWKmLGlFUSSEsyfmPdfHpdXId3B3SbQgnaAe
	HGYd4uF4/EtaTZ19PGSXAes+HsiMuMSw1bc9kTNCtFBvRmPGQqoCty8RW0NzjKGu4b+5LbwcvuOHh
	RN++NNZZoJt1MxvLnyLfI798cZawiUMqOFI8KhBvThyZIlcWOAvsJJ2P0MVdZyzb6Tll6ebn/vOGu
	JE0/unDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGLUl-0000000CMMe-1akM;
	Tue, 04 Nov 2025 18:11:03 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGLUM-0000000CLkG-0DCc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 18:10:39 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-471191ac79dso64633975e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 10:10:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762279836; x=1762884636; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oZvB8XQL4XH/MG4JrDvft0iLE7MCAIYhxytBa3l55Ko=;
        b=T+BF7O2DQ7jb4OGzlu3Gbklck2+RntjY/NN1zE9OuCVVFF18Nvk1Zp3MEXKurfwu8f
         gfiDRd9oDtSkPMiVVdQK6B5VwsYZttJMJeA4JIB3qy07IvkARQkxy+9Jc3zJ4NSjQ2xt
         sFN+wj79mEvqwuxUB0vKchl9rf0H2OMZaz1GFksOzePS3JPR44AyREslqtyz4MG5Al12
         nPFpE7AmALJDSDZ0eXk1ez7+tejREhBQDAqwYRhMyuAQBjNu8OWbGJsUUmGPu5yOtDEm
         78zL2Y/gxhO94ppKllCiw2EEso2Vhab/hfeLSC33y1MwTDgKNFv7uu8USMe95Lp6D+Ss
         D9pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762279836; x=1762884636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oZvB8XQL4XH/MG4JrDvft0iLE7MCAIYhxytBa3l55Ko=;
        b=r6g4vK1Ke8+T1wEsArgEAvd6+CJPry54GdgTRu8WF6RpRtFrEzm34CObIE3d6RHI2G
         laQbl9zciRQ8E9ZQh2rBWBtBFRd/yI6mOkQueEpa3Ipsc52R+EbLuTFyOnJSmaoQ659T
         fwRSyjmJN0cIJ/erztyX8WX1ErhjK9tJHLpZffQZBEjbA2bWR5Fj4aooW8yWySRw2zDO
         F5Z1pQdjY46yQKAAj781joKQX6Q76ynLXvcd96edP6R3gzvvw3Gq6xO5rNkGPk++3ilR
         sxoZNWu5SjflgyayCxaa8MtExh9X6ijXPVSC2gJqwn2IEsN4000DGhHvv9jJQnafecdX
         CTQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbECOJMgublkKo8irMUGV1j1Ddk6I25sAQVCmUBoGsFuTeMR97ch8EZ1vw8tsCXI5OmqdXAFf2pLK8tkmKy2OP@lists.infradead.org
X-Gm-Message-State: AOJu0YyuwYLplfuFCiOK43Fk4XluaWv8jRcNENlSdgHXb4B2eZcAUTV1
	P5LoClFm/wp2QFMtAGymdaei4v0wKoEw3dH5e8ZhbEgndqxxFvk0O/jr
X-Gm-Gg: ASbGncsl+3Ugma7XOF6pzDmtmIpsw/65kmWW0uGfCKSAwZUrAP0z0dHwQ51CeCKGuzE
	RllkYk0iIx+XA4m8QdSzufmZYdf/jyqxUzGieoRqOX9ILbtHjca2QTWE9UH7G8DMJEaHKLei5ri
	XVOO+PP5EEhaTgnJ7EzUp45LO4AQtzoQMxvvoPLSJMv1oKt1U0r0yisZoZwihammJ/UQENevhXA
	JA1PvahwE9SS34EnoxYVGVpRB0KnjEorTCEnnkf0gKfM2nSZ6p9TRj3qpAb0W7HElb4cpzToKG6
	tw6PH/ZSPWuat/zzOHdS8TJYfS+CHLMJMnWbtL71Xs+7//PPA6QfgpJIewMm9r8dTG0Y6ayRf6y
	IzqfchzPGz6v7oHJpxR5+S99ADpZhQ6hK2+fYP5tDtrmk7sWPIwWPO026CMPNtFbP9GZMXdN7Zu
	T+Q06uAjjMU25yHH71KaRqsTPW+EmG
X-Google-Smtp-Source: AGHT+IGmzxfk1x8fnehx5VWjAyq7IZc2z//0VTUwWlUQBtF4GSFWekOx3YeV0AJtLvY7p2RmMGNybQ==
X-Received: by 2002:a05:600c:3110:b0:46e:7247:cbc0 with SMTP id 5b1f17b1804b1-4775cdcfb32mr2222405e9.18.1762279835799;
        Tue, 04 Nov 2025 10:10:35 -0800 (PST)
Received: from jernej-laptop ([178.79.73.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477558c1a03sm24688685e9.2.2025.11.04.10.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 10:10:35 -0800 (PST)
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
Subject: [PATCH v2 27/30] drm/sun4i: mixer: split out layer config
Date: Tue,  4 Nov 2025 19:09:39 +0100
Message-ID: <20251104180942.61538-28-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251104180942.61538-1-jernej.skrabec@gmail.com>
References: <20251104180942.61538-1-jernej.skrabec@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_101038_169422_9F1ACC19 
X-CRM114-Status: GOOD (  21.52  )
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

Later special plane only driver for DE33 will provide separate
configuration. This change will also help layer driver migrate away from
mixer structure.

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Tested-by: Ryan Walklin <ryan@testtoast.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
Changes in v2:
- added missing .de_type kerneldoc

 drivers/gpu/drm/sun4i/sun8i_csc.c       |   2 +-
 drivers/gpu/drm/sun4i/sun8i_mixer.c     | 152 +++++++++++++++---------
 drivers/gpu/drm/sun4i/sun8i_mixer.h     |  33 +++--
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c  |   2 +-
 drivers/gpu/drm/sun4i/sun8i_ui_scaler.c |   2 +-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c  |   8 +-
 6 files changed, 123 insertions(+), 76 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_csc.c b/drivers/gpu/drm/sun4i/sun8i_csc.c
index c371e94b95bd..30779db2f9b2 100644
--- a/drivers/gpu/drm/sun4i/sun8i_csc.c
+++ b/drivers/gpu/drm/sun4i/sun8i_csc.c
@@ -240,7 +240,7 @@ void sun8i_csc_config(struct sun8i_layer *layer,
 		return;
 	}
 
-	base = ccsc_base[layer->mixer->cfg->ccsc][layer->channel];
+	base = ccsc_base[layer->mixer->cfg->lay_cfg.ccsc][layer->channel];
 
 	sun8i_csc_setup(layer->regs, base,
 			mode, state->color_encoding,
diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index da3148f42646..4559e959a32d 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -703,137 +703,173 @@ static void sun8i_mixer_remove(struct platform_device *pdev)
 }
 
 static const struct sun8i_mixer_cfg sun8i_a83t_mixer0_cfg = {
-	.ccsc		= CCSC_MIXER0_LAYOUT,
+	.lay_cfg = {
+		.ccsc		= CCSC_MIXER0_LAYOUT,
+		.de_type	= SUN8I_MIXER_DE2,
+		.vi_scaler_num	= 1,
+		.scaler_mask	= 0xf,
+		.scanline_yuv	= 2048,
+		.de2_fcc_alpha	= 1,
+	},
 	.de_type	= SUN8I_MIXER_DE2,
-	.vi_scaler_num	= 1,
-	.scaler_mask	= 0xf,
-	.scanline_yuv	= 2048,
-	.de2_fcc_alpha	= 1,
 	.ui_num		= 3,
 	.vi_num		= 1,
 };
 
 static const struct sun8i_mixer_cfg sun8i_a83t_mixer1_cfg = {
-	.ccsc		= CCSC_MIXER1_LAYOUT,
+	.lay_cfg = {
+		.ccsc		= CCSC_MIXER1_LAYOUT,
+		.de_type	= SUN8I_MIXER_DE2,
+		.vi_scaler_num	= 1,
+		.scaler_mask	= 0x3,
+		.scanline_yuv	= 2048,
+		.de2_fcc_alpha	= 1,
+	},
 	.de_type	= SUN8I_MIXER_DE2,
-	.vi_scaler_num	= 1,
-	.scaler_mask	= 0x3,
-	.scanline_yuv	= 2048,
-	.de2_fcc_alpha	= 1,
 	.ui_num		= 1,
 	.vi_num		= 1,
 };
 
 static const struct sun8i_mixer_cfg sun8i_h3_mixer0_cfg = {
-	.ccsc		= CCSC_MIXER0_LAYOUT,
+	.lay_cfg = {
+		.ccsc		= CCSC_MIXER0_LAYOUT,
+		.de_type	= SUN8I_MIXER_DE2,
+		.vi_scaler_num	= 1,
+		.scaler_mask	= 0xf,
+		.scanline_yuv	= 2048,
+		.de2_fcc_alpha	= 1,
+	},
 	.de_type	= SUN8I_MIXER_DE2,
 	.mod_rate	= 432000000,
-	.vi_scaler_num	= 1,
-	.scaler_mask	= 0xf,
-	.scanline_yuv	= 2048,
-	.de2_fcc_alpha	= 1,
 	.ui_num		= 3,
 	.vi_num		= 1,
 };
 
 static const struct sun8i_mixer_cfg sun8i_r40_mixer0_cfg = {
-	.ccsc		= CCSC_MIXER0_LAYOUT,
+	.lay_cfg = {
+		.ccsc		= CCSC_MIXER0_LAYOUT,
+		.de_type	= SUN8I_MIXER_DE2,
+		.vi_scaler_num	= 1,
+		.scaler_mask	= 0xf,
+		.scanline_yuv	= 2048,
+		.de2_fcc_alpha	= 1,
+	},
 	.de_type	= SUN8I_MIXER_DE2,
 	.mod_rate	= 297000000,
-	.vi_scaler_num	= 1,
-	.scaler_mask	= 0xf,
-	.scanline_yuv	= 2048,
-	.de2_fcc_alpha	= 1,
 	.ui_num		= 3,
 	.vi_num		= 1,
 };
 
 static const struct sun8i_mixer_cfg sun8i_r40_mixer1_cfg = {
-	.ccsc		= CCSC_MIXER1_LAYOUT,
+	.lay_cfg = {
+		.ccsc		= CCSC_MIXER1_LAYOUT,
+		.de_type	= SUN8I_MIXER_DE2,
+		.vi_scaler_num	= 1,
+		.scaler_mask	= 0x3,
+		.scanline_yuv	= 2048,
+		.de2_fcc_alpha	= 1,
+	},
 	.de_type	= SUN8I_MIXER_DE2,
 	.mod_rate	= 297000000,
-	.vi_scaler_num	= 1,
-	.scaler_mask	= 0x3,
-	.scanline_yuv	= 2048,
-	.de2_fcc_alpha	= 1,
 	.ui_num		= 1,
 	.vi_num		= 1,
 };
 
 static const struct sun8i_mixer_cfg sun8i_v3s_mixer_cfg = {
-	.de_type = SUN8I_MIXER_DE2,
-	.vi_num = 2,
-	.ui_num = 1,
-	.vi_scaler_num	= 2,
-	.scaler_mask = 0x3,
-	.scanline_yuv = 2048,
-	.ccsc = CCSC_MIXER0_LAYOUT,
-	.mod_rate = 150000000,
+	.lay_cfg = {
+		.ccsc		= CCSC_MIXER0_LAYOUT,
+		.de_type	= SUN8I_MIXER_DE2,
+		.vi_scaler_num	= 2,
+		.scaler_mask	= 0x3,
+		.scanline_yuv	= 2048,
+	},
+	.de_type	= SUN8I_MIXER_DE2,
+	.mod_rate	= 150000000,
+	.vi_num		= 2,
+	.ui_num		= 1,
 };
 
 static const struct sun8i_mixer_cfg sun20i_d1_mixer0_cfg = {
-	.ccsc		= CCSC_D1_MIXER0_LAYOUT,
+	.lay_cfg = {
+		.ccsc		= CCSC_D1_MIXER0_LAYOUT,
+		.de_type	= SUN8I_MIXER_DE2,
+		.vi_scaler_num	= 1,
+		.scaler_mask	= 0x3,
+		.scanline_yuv	= 2048,
+		.de2_fcc_alpha	= 1,
+	},
 	.de_type	= SUN8I_MIXER_DE2,
 	.mod_rate	= 297000000,
-	.vi_scaler_num	= 1,
-	.scaler_mask	= 0x3,
-	.scanline_yuv	= 2048,
-	.de2_fcc_alpha	= 1,
 	.ui_num		= 1,
 	.vi_num		= 1,
 };
 
 static const struct sun8i_mixer_cfg sun20i_d1_mixer1_cfg = {
-	.ccsc		= CCSC_MIXER1_LAYOUT,
+	.lay_cfg = {
+		.ccsc		= CCSC_MIXER1_LAYOUT,
+		.de_type	= SUN8I_MIXER_DE2,
+		.vi_scaler_num	= 1,
+		.scaler_mask	= 0x1,
+		.scanline_yuv	= 1024,
+		.de2_fcc_alpha	= 1,
+	},
 	.de_type	= SUN8I_MIXER_DE2,
 	.mod_rate	= 297000000,
-	.vi_scaler_num	= 1,
-	.scaler_mask	= 0x1,
-	.scanline_yuv	= 1024,
-	.de2_fcc_alpha	= 1,
 	.ui_num		= 0,
 	.vi_num		= 1,
 };
 
 static const struct sun8i_mixer_cfg sun50i_a64_mixer0_cfg = {
-	.ccsc		= CCSC_MIXER0_LAYOUT,
+	.lay_cfg = {
+		.ccsc		= CCSC_MIXER0_LAYOUT,
+		.de_type	= SUN8I_MIXER_DE2,
+		.vi_scaler_num	= 1,
+		.scaler_mask	= 0xf,
+		.scanline_yuv	= 4096,
+		.de2_fcc_alpha	= 1,
+	},
 	.de_type	= SUN8I_MIXER_DE2,
 	.mod_rate	= 297000000,
-	.vi_scaler_num	= 1,
-	.scaler_mask	= 0xf,
-	.scanline_yuv	= 4096,
-	.de2_fcc_alpha	= 1,
 	.ui_num		= 3,
 	.vi_num		= 1,
 };
 
 static const struct sun8i_mixer_cfg sun50i_a64_mixer1_cfg = {
-	.ccsc		= CCSC_MIXER1_LAYOUT,
+	.lay_cfg = {
+		.ccsc		= CCSC_MIXER1_LAYOUT,
+		.de_type	= SUN8I_MIXER_DE2,
+		.vi_scaler_num	= 1,
+		.scaler_mask	= 0x3,
+		.scanline_yuv	= 2048,
+		.de2_fcc_alpha	= 1,
+	},
 	.de_type	= SUN8I_MIXER_DE2,
 	.mod_rate	= 297000000,
-	.vi_scaler_num	= 1,
-	.scaler_mask	= 0x3,
-	.scanline_yuv	= 2048,
-	.de2_fcc_alpha	= 1,
 	.ui_num		= 1,
 	.vi_num		= 1,
 };
 
 static const struct sun8i_mixer_cfg sun50i_h6_mixer0_cfg = {
+	.lay_cfg = {
+		.de_type	= SUN8I_MIXER_DE3,
+		.vi_scaler_num	= 1,
+		.scaler_mask	= 0xf,
+		.scanline_yuv	= 4096,
+	},
 	.de_type	= SUN8I_MIXER_DE3,
 	.mod_rate	= 600000000,
-	.vi_scaler_num	= 1,
-	.scaler_mask	= 0xf,
-	.scanline_yuv	= 4096,
 	.ui_num		= 3,
 	.vi_num		= 1,
 };
 
 static const struct sun8i_mixer_cfg sun50i_h616_mixer0_cfg = {
+	.lay_cfg = {
+		.de_type	= SUN8I_MIXER_DE33,
+		.scaler_mask	= 0xf,
+		.scanline_yuv	= 4096,
+	},
 	.de_type	= SUN8I_MIXER_DE33,
 	.mod_rate	= 600000000,
-	.scaler_mask	= 0xf,
-	.scanline_yuv	= 4096,
 	.ui_num		= 3,
 	.vi_num		= 1,
 	.map		= {0, 6, 7, 8},
diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h b/drivers/gpu/drm/sun4i/sun8i_mixer.h
index 8c2e8005fc5b..5b6068755ad1 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
@@ -164,34 +164,45 @@ enum sun8i_mixer_type {
 };
 
 /**
- * struct sun8i_mixer_cfg - mixer HW configuration
- * @vi_num: number of VI channels
- * @ui_num: number of UI channels
+ * struct sun8i_layer_cfg - layer configuration
  * @vi_scaler_num: Number of VI scalers. Used on DE2 and DE3.
  * @scaler_mask: bitmask which tells which channel supports scaling
  *	First, scaler supports for VI channels is defined and after that, scaler
  *	support for UI channels. For example, if mixer has 2 VI channels without
  *	scaler and 2 UI channels with scaler, bitmask would be 0xC.
  * @ccsc: select set of CCSC base addresses from the enumeration above.
- * @mod_rate: module clock rate that needs to be set in order to have
- *	a functional block.
  * @de_type: sun8i_mixer_type enum representing the display engine generation.
  * @scaline_yuv: size of a scanline for VI scaler for YUV formats.
  * @de2_fcc_alpha: use FCC for missing DE2 VI alpha capability
  *	Most DE2 cores has FCC. If number of VI planes is one, enable this.
- * @map: channel map for DE variants processing YUV separately (DE33)
  */
-struct sun8i_mixer_cfg {
-	int		vi_num;
-	int		ui_num;
+struct sun8i_layer_cfg {
 	unsigned int	vi_scaler_num;
 	int		scaler_mask;
 	int		ccsc;
-	unsigned long	mod_rate;
 	unsigned int	de_type;
 	unsigned int	scanline_yuv;
 	unsigned int	de2_fcc_alpha : 1;
-	unsigned int	map[6];
+};
+
+/**
+ * struct sun8i_mixer_cfg - mixer HW configuration
+ * @lay_cfg: layer configuration
+ * @vi_num: number of VI channels
+ * @ui_num: number of UI channels
+ * @de_type: sun8i_mixer_type enum representing the display engine generation.
+ * @mod_rate: module clock rate that needs to be set in order to have
+ *	a functional block.
+ * @map: channel map for DE variants processing YUV separately (DE33)
+ */
+
+struct sun8i_mixer_cfg {
+	struct sun8i_layer_cfg	lay_cfg;
+	int			vi_num;
+	int			ui_num;
+	unsigned int		de_type;
+	unsigned long		mod_rate;
+	unsigned int		map[6];
 };
 
 struct sun8i_mixer {
diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index e65dc313c87d..f71f5a8d0427 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -190,7 +190,7 @@ static int sun8i_ui_layer_atomic_check(struct drm_plane *plane,
 	min_scale = DRM_PLANE_NO_SCALING;
 	max_scale = DRM_PLANE_NO_SCALING;
 
-	if (layer->mixer->cfg->scaler_mask & BIT(layer->channel)) {
+	if (layer->mixer->cfg->lay_cfg.scaler_mask & BIT(layer->channel)) {
 		min_scale = SUN8I_UI_SCALER_SCALE_MIN;
 		max_scale = SUN8I_UI_SCALER_SCALE_MAX;
 	}
diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_scaler.c b/drivers/gpu/drm/sun4i/sun8i_ui_scaler.c
index 0ba1482688d7..4d06c366de7f 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_scaler.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_scaler.c
@@ -91,7 +91,7 @@ static const u32 lan2coefftab16[240] = {
 
 static u32 sun8i_ui_scaler_base(struct sun8i_mixer *mixer, int channel)
 {
-	int offset = mixer->cfg->vi_scaler_num;
+	int offset = mixer->cfg->lay_cfg.vi_scaler_num;
 
 	if (mixer->cfg->de_type == SUN8I_MIXER_DE3)
 		return DE3_VI_SCALER_UNIT_BASE +
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index 8eb3f167e664..0286e7322612 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -53,7 +53,7 @@ static void sun8i_vi_layer_update_attributes(struct sun8i_layer *layer,
 	regmap_write(layer->regs,
 		     SUN8I_MIXER_CHAN_VI_LAYER_ATTR(ch_base, layer->overlay), val);
 
-	if (mixer->cfg->de2_fcc_alpha) {
+	if (mixer->cfg->lay_cfg.de2_fcc_alpha) {
 		regmap_write(layer->regs,
 			     SUN8I_MIXER_FCC_GLOBAL_ALPHA_REG,
 			     SUN8I_MIXER_FCC_GLOBAL_ALPHA(state->alpha >> 8));
@@ -152,7 +152,7 @@ static void sun8i_vi_layer_update_coord(struct sun8i_layer *layer,
 		}
 
 		/* it seems that every RGB scaler has buffer for 2048 pixels */
-		scanline = subsampled ? mixer->cfg->scanline_yuv : 2048;
+		scanline = subsampled ? mixer->cfg->lay_cfg.scanline_yuv : 2048;
 
 		if (src_w > scanline) {
 			DRM_DEBUG_DRIVER("Using horizontal coarse scaling\n");
@@ -278,7 +278,7 @@ static int sun8i_vi_layer_atomic_check(struct drm_plane *plane,
 	min_scale = DRM_PLANE_NO_SCALING;
 	max_scale = DRM_PLANE_NO_SCALING;
 
-	if (layer->mixer->cfg->scaler_mask & BIT(layer->channel)) {
+	if (layer->mixer->cfg->lay_cfg.scaler_mask & BIT(layer->channel)) {
 		min_scale = SUN8I_VI_SCALER_SCALE_MIN;
 		max_scale = SUN8I_VI_SCALER_SCALE_MAX;
 	}
@@ -452,7 +452,7 @@ struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 		return ERR_PTR(ret);
 	}
 
-	if (mixer->cfg->de2_fcc_alpha || mixer->cfg->de_type >= SUN8I_MIXER_DE3) {
+	if (mixer->cfg->lay_cfg.de2_fcc_alpha || mixer->cfg->de_type >= SUN8I_MIXER_DE3) {
 		ret = drm_plane_create_alpha_property(&layer->plane);
 		if (ret) {
 			dev_err(drm->dev, "Couldn't add alpha property\n");
-- 
2.51.2


