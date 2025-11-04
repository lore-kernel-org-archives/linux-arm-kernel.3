Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2F02CCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 18:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ie7hWDcTxuQcquWuqifGQoLXnJlmFfjHvsfXK9+oj4E=; b=gZBRlN12CfHF1E9DQKRjlCn3G4
	xCJhQP22gnEMRwR/4zuDnyUQvApQV7fTGSBfooXDQdexwMQMsj2wKmWhFaVS9qj5nzeBCwwMZK83Z
	Svv14CpRQ9Y1eOEyrCW7l6BvHi3WJUTRv2aYCWJk9RlCzW/12h7BwMsSTv2Y7GqxTqcCStIfsXbkt
	UQN6hcHPIi7YtthjJfvg58As4lhzx7eMGvBvGMVOiQy2VF4x0G0BZx2TwtPxi4yj3ecIwxnyfScSE
	5967ew+LNc06y171aMc1I2x/BE7FrhGIifFE9odpXR5dDHHQetvl1xBd6vju94Tm/e+hTnb3+Jrhf
	gQQVwFdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGLUh-0000000CMI9-2VMt;
	Tue, 04 Nov 2025 18:10:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGLUM-0000000CLmD-1Atv
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 04 Nov 2025 18:10:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ie7hWDcTxuQcquWuqifGQoLXnJlmFfjHvsfXK9+oj4E=; b=hb/IURe6IqhNQTJvZ2xIp9eOfa
	Y5oUNavJ86BU4kJFrr2iBYtP++kzGRx5h7HeY9mtOc8uHcwqWbuUhEP+DgPDvM6hUMNNAGakj6Phn
	uRAe7+fVoEQKX75BzFDiyHNa5xDI7BJcPs8FRYn0j0TpfGMlJuKYt82jTdvOE7UHxtvgND0odeucG
	yZuzWOOMOCKUDpTs0WvS5bOiOXIQL6HJlAYtIxy/rg2q0bddpUT/g7Vwg0FhtybcZIt9Asyyv9sXW
	LIN+NKb4xJvRmDHp7P7r8yptzoHZbP1eCo11bUe1ZQ/5afg+gDf/xiGxzE33xaQzFd2tQLrmWxpu1
	qIvOHzPQ==;
Received: from mail-wm1-f54.google.com ([209.85.128.54])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGKca-00000000ap0-1nc1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 17:15:07 +0000
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47114a40161so10724285e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 10:10:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762279832; x=1762884632; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ie7hWDcTxuQcquWuqifGQoLXnJlmFfjHvsfXK9+oj4E=;
        b=RRq9iPeb6qV632IG2yzGzCi8R1IVfZe7ae7Z6LlVQ+XxKCzWh8XV9FJixmpJ7bgQxY
         2PQOW6E25yxdBCBOOiCPSgkBF6tML5Orcc25CVhWnLGcM4Ba7xgs+Kh7I5dMKsc+2e6o
         6Q7E0AJqUgdbzLhhAhQEEV+KMTN7sdnHHCS0A098CDrU2maIewRx+OtNxVUMk+KJARcz
         Ps15of7LHn6G8mREVxqJ6yRssUDSek1fGp62tjdLBZ+pcowc6hq+4O3znXBcdoSxlc5u
         1fU2K++N4uTnCVXFnZeRwfkhA3b7LYEKF3OTdeiBUNo5UHD5N3gD3RRMIYL1eF9eX7Fg
         powA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762279832; x=1762884632;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ie7hWDcTxuQcquWuqifGQoLXnJlmFfjHvsfXK9+oj4E=;
        b=saZcMW/XUfZ5IPv7TXH9qNottyIcgrHXDEhcWEMwDSCcODmqBJd0PrMTV/4u8NYJ5J
         28w59NLjvLwpcyquDiVTrAo7LlQgEoSavRNskv37QG1jTbuSI9dmsB3IsgTDw7OJf8bA
         xINJ/4heHFnCB80mDlhdpfZYxRyhEC6h9BMKF1vsnuZAYmhmPYgweMRym4+XaJ+yRp6q
         /tQ0nBFDRSp3KpkjbV1hxqk1VPeRDGgA+aClXO52Ykuj+7kKC1vlCvjV6MWd+dBichCb
         QAsthmiQwPsGpQloedCxoLYX+tpRJG08NFyl0tsc59GBxRSa9Z2o4igHOh+7gtri/JQd
         oXFg==
X-Forwarded-Encrypted: i=1; AJvYcCUUTbRh2hhws+Jaa9MEEYrc6B/mvqvimMN/Ol/wDWwQcUiqAn7n0Zd70RkjY0uTvdvcxc8y6CxFYbCgzWi0+uqp@lists.infradead.org
X-Gm-Message-State: AOJu0YzlLd2hvhup1Qf0Lkc/WjLOQocKOr0+gPj/5kgnCvzUhL36YgWu
	ISUrBF+panrySbtYOB97KfmtLm/bgR2xBtK7C9kT+F12UyoxlS+kXr3t
X-Gm-Gg: ASbGncsfZdZh5FxuRhYMfLTT/mzc3dgQWO/hydcNiHuYgZq/5soggp/pxT7IMN0xUp8
	mwAtvNeYwHALZsbawJp0kjcITq7GjvTV8Cr1DohwDfh/DJV4H4Dim8eshxWcUu58qn5XLZuk/aA
	bGcRmBkISgeumBbL4fJoo2Q3TMQ1ooaF9jhE64qh2Z3tZvL8CElfNbaxSSEm+qvjCIcyv3ZAeHN
	0YDVc2/BUqhzIFEP9sPoarpxdrw8sQTQRAwdtfZhFd3+kheoMjbDEiRnxF450Ycpd2697QSAgf0
	WoVgO3PntWANJ1W0jYMEv8j5ZUwJJ+zCIOFbmRCHnqYN02KRihBVqz/zK0cHC0oQMDwGfWxjnfB
	DZZ0E7I01fCNTWQO1foqUN0hljFQyz/deWfSpV8MoIXdriw4uUeyifaDTV05NYqvx8SxnBO7pcl
	4+wAcKl/zEcctn2cQGRg==
X-Google-Smtp-Source: AGHT+IEWn71DBw19df7j5vHe6/KdNSpZp9M6RzMXn87h8SZBHIPpRNzHDnrglGnelBkuvtMKpO/7HQ==
X-Received: by 2002:a05:600c:a00a:b0:475:d7b7:580c with SMTP id 5b1f17b1804b1-4775cdbfademr2635395e9.12.1762279832100;
        Tue, 04 Nov 2025 10:10:32 -0800 (PST)
Received: from jernej-laptop ([178.79.73.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477558c1a03sm24688685e9.2.2025.11.04.10.10.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 10:10:31 -0800 (PST)
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
Subject: [PATCH v2 24/30] drm/sun4i: mixer: Convert heuristics to quirk
Date: Tue,  4 Nov 2025 19:09:36 +0100
Message-ID: <20251104180942.61538-25-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251104180942.61538-1-jernej.skrabec@gmail.com>
References: <20251104180942.61538-1-jernej.skrabec@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_171504_544102_696A9A5C 
X-CRM114-Status: GOOD (  15.74  )
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

Determination if FCC unit can be used for VI layer alpha depends on
number of VI channels. This info won't be available anymore in future
to VI layer driver because of DE33 way of allocating planes from same
pool to different mixers.

While order is slightly changed, it doesn't affect anything due to
double buffering of registers. New order keeps related registers
together and quirk separate.

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Tested-by: Ryan Walklin <ryan@testtoast.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
Changes in v2:
- updated commit message

 drivers/gpu/drm/sun4i/sun8i_mixer.c    |  9 +++++++++
 drivers/gpu/drm/sun4i/sun8i_mixer.h    |  3 +++
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 12 +++++++-----
 3 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index 267a6f75feb2..78bbfbe62833 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -707,6 +707,7 @@ static const struct sun8i_mixer_cfg sun8i_a83t_mixer0_cfg = {
 	.de_type	= SUN8I_MIXER_DE2,
 	.scaler_mask	= 0xf,
 	.scanline_yuv	= 2048,
+	.de2_fcc_alpha	= 1,
 	.ui_num		= 3,
 	.vi_num		= 1,
 };
@@ -716,6 +717,7 @@ static const struct sun8i_mixer_cfg sun8i_a83t_mixer1_cfg = {
 	.de_type	= SUN8I_MIXER_DE2,
 	.scaler_mask	= 0x3,
 	.scanline_yuv	= 2048,
+	.de2_fcc_alpha	= 1,
 	.ui_num		= 1,
 	.vi_num		= 1,
 };
@@ -726,6 +728,7 @@ static const struct sun8i_mixer_cfg sun8i_h3_mixer0_cfg = {
 	.mod_rate	= 432000000,
 	.scaler_mask	= 0xf,
 	.scanline_yuv	= 2048,
+	.de2_fcc_alpha	= 1,
 	.ui_num		= 3,
 	.vi_num		= 1,
 };
@@ -736,6 +739,7 @@ static const struct sun8i_mixer_cfg sun8i_r40_mixer0_cfg = {
 	.mod_rate	= 297000000,
 	.scaler_mask	= 0xf,
 	.scanline_yuv	= 2048,
+	.de2_fcc_alpha	= 1,
 	.ui_num		= 3,
 	.vi_num		= 1,
 };
@@ -746,6 +750,7 @@ static const struct sun8i_mixer_cfg sun8i_r40_mixer1_cfg = {
 	.mod_rate	= 297000000,
 	.scaler_mask	= 0x3,
 	.scanline_yuv	= 2048,
+	.de2_fcc_alpha	= 1,
 	.ui_num		= 1,
 	.vi_num		= 1,
 };
@@ -766,6 +771,7 @@ static const struct sun8i_mixer_cfg sun20i_d1_mixer0_cfg = {
 	.mod_rate	= 297000000,
 	.scaler_mask	= 0x3,
 	.scanline_yuv	= 2048,
+	.de2_fcc_alpha	= 1,
 	.ui_num		= 1,
 	.vi_num		= 1,
 };
@@ -776,6 +782,7 @@ static const struct sun8i_mixer_cfg sun20i_d1_mixer1_cfg = {
 	.mod_rate	= 297000000,
 	.scaler_mask	= 0x1,
 	.scanline_yuv	= 1024,
+	.de2_fcc_alpha	= 1,
 	.ui_num		= 0,
 	.vi_num		= 1,
 };
@@ -786,6 +793,7 @@ static const struct sun8i_mixer_cfg sun50i_a64_mixer0_cfg = {
 	.mod_rate	= 297000000,
 	.scaler_mask	= 0xf,
 	.scanline_yuv	= 4096,
+	.de2_fcc_alpha	= 1,
 	.ui_num		= 3,
 	.vi_num		= 1,
 };
@@ -796,6 +804,7 @@ static const struct sun8i_mixer_cfg sun50i_a64_mixer1_cfg = {
 	.mod_rate	= 297000000,
 	.scaler_mask	= 0x3,
 	.scanline_yuv	= 2048,
+	.de2_fcc_alpha	= 1,
 	.ui_num		= 1,
 	.vi_num		= 1,
 };
diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h b/drivers/gpu/drm/sun4i/sun8i_mixer.h
index d14188cdfab3..def07afd37e1 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
@@ -176,6 +176,8 @@ enum sun8i_mixer_type {
  *	a functional block.
  * @de_type: sun8i_mixer_type enum representing the display engine generation.
  * @scaline_yuv: size of a scanline for VI scaler for YUV formats.
+ * @de2_fcc_alpha: use FCC for missing DE2 VI alpha capability
+ *	Most DE2 cores has FCC. If number of VI planes is one, enable this.
  * @map: channel map for DE variants processing YUV separately (DE33)
  */
 struct sun8i_mixer_cfg {
@@ -186,6 +188,7 @@ struct sun8i_mixer_cfg {
 	unsigned long	mod_rate;
 	unsigned int	de_type;
 	unsigned int	scanline_yuv;
+	unsigned int	de2_fcc_alpha : 1;
 	unsigned int	map[6];
 };
 
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index 44e699910b70..8eb3f167e664 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -48,14 +48,16 @@ static void sun8i_vi_layer_update_attributes(struct sun8i_layer *layer,
 		val |= (state->alpha == DRM_BLEND_ALPHA_OPAQUE) ?
 			SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA_MODE_PIXEL :
 			SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA_MODE_COMBINED;
-	} else if (mixer->cfg->vi_num == 1) {
+	}
+
+	regmap_write(layer->regs,
+		     SUN8I_MIXER_CHAN_VI_LAYER_ATTR(ch_base, layer->overlay), val);
+
+	if (mixer->cfg->de2_fcc_alpha) {
 		regmap_write(layer->regs,
 			     SUN8I_MIXER_FCC_GLOBAL_ALPHA_REG,
 			     SUN8I_MIXER_FCC_GLOBAL_ALPHA(state->alpha >> 8));
 	}
-
-	regmap_write(layer->regs,
-		     SUN8I_MIXER_CHAN_VI_LAYER_ATTR(ch_base, layer->overlay), val);
 }
 
 static void sun8i_vi_layer_update_coord(struct sun8i_layer *layer,
@@ -450,7 +452,7 @@ struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 		return ERR_PTR(ret);
 	}
 
-	if (mixer->cfg->vi_num == 1 || mixer->cfg->de_type >= SUN8I_MIXER_DE3) {
+	if (mixer->cfg->de2_fcc_alpha || mixer->cfg->de_type >= SUN8I_MIXER_DE3) {
 		ret = drm_plane_create_alpha_property(&layer->plane);
 		if (ret) {
 			dev_err(drm->dev, "Couldn't add alpha property\n");
-- 
2.51.2


