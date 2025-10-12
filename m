Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29EC6CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Oct 2025 19:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NRrJwhH9ddhv+15LnO8TBX702Sbu4XiFGKBFd7hqCR4=; b=D6rmBJgCX6LHGX+wP0aqfL2ZDv
	/yPsDpiXBoB2chPizi9MjQUcCll0ilVmjp4vLifnSh/ZXkX5ON/Ck0nyJtVVL2Mm7X9fiGeXaIK2K
	EVH2vJA7gSY+JWEVz89/t32ZqqqQkfTFBJyiRNW67v1vJDNJ4Bsko88sk9V0lAxnO5TriN+ukh4LO
	m1tWh29aZD/45XsVPWo8mqfAB0wQvtyehBnnSgci0TTWM88qcBOAsD6bPy7BWNEEXAmQyJoAI1a7u
	5Mfq8XUznji35tBb56ntoG9/OT69O5EVMIVV//tBrlNpvFc75c0hFVNPVOL13KL1kehivyS+/nGRP
	bkdX6Mww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v81gg-0000000BhGH-3RB8;
	Sun, 12 Oct 2025 19:24:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v81gD-0000000BgSW-0K4R
	for linux-arm-kernel@bombadil.infradead.org;
	Sun, 12 Oct 2025 19:24:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=NRrJwhH9ddhv+15LnO8TBX702Sbu4XiFGKBFd7hqCR4=; b=Cckdq706Znj9Jo4vGDhJO/0dAh
	yCFwvc1Yw7EXpHYxU6N+wsgvRkY13NXiB0tNsCsp6jLKuMmETBG7Mv1emHyP0AoxeFS/jb8w9tiXh
	scIQgs6caYgKxAakYdskyDLEW1QbFmZYcezHrvybaYMCOIQ35c3rPds1G1uMk9xL1n6D8SBIUKOBQ
	jzp6rmotbwopwTT6o62pUnNefa62k4ZuuHCOQl7w8Rbv0v8+CjQlUodNV5xhXRvyegaYKbX4P/EI+
	Zwj4OLiwG/oQVT3+A88fIRrPJRPT6UI1KUTuRsHg/ZwHVG91PjP5Ktooa8EsYLqUbhinKV2SFaFxc
	HSVJTyaA==;
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v81g2-00000003nQJ-1jbH
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Oct 2025 19:24:22 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-b3d196b7eeeso558571966b.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Oct 2025 12:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760297055; x=1760901855; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NRrJwhH9ddhv+15LnO8TBX702Sbu4XiFGKBFd7hqCR4=;
        b=a+oN+BpWwQ9jROv5ou19wTaU05l7xfhq61g6y+g8fDC0hbxs/FmVoPM4EVlctqSOmo
         /kabtdBrTLrJ03G2T/YJ5GdaiqaWMg6GuTB08UkTGeCje/064nAwHXpPQnqUJ8XL68g/
         NJ62vea7FNVPRxuUm+do81jI+1KK7KbjxQhV+ECqKK5V5jxSIx2OsGPmwbnbdSj4SkCB
         OZmSIMvHM2MLsZRZduonojwI6sH6P1D3Xt9PB0eym5lR0Jid6ZaEO2TTl5KuVlTKBCxT
         kCRLOaM2Ru4SQNr/Dc31Ves92VTGsa41cd6nAhHqhfFrEKLgy7xzwIQNdAGefHhY8SKZ
         o21g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760297055; x=1760901855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NRrJwhH9ddhv+15LnO8TBX702Sbu4XiFGKBFd7hqCR4=;
        b=tws+Aa9nW7e2rTbHANljXaeKWwtwDzlN9XIGN91CklTN63yBcNt7xhfdBO0tJ2aWpj
         pOuUEcJ4OD6BzdI21wVHvd5vzl6d0giUpc4T9zO4Z0CKHj5oPYGUcj+RQ2qpzBETGKE8
         uC1zbGtY4uXk7m68al25mmNH3DNBQv0HJByl/7qLWTvyB+z9FObmmhOWJHZ/yUcuFqkp
         mp3QWtwwfNi8BbTCZzxo4jcbafRNoPwaLkkBXs2SDh2p0RJnW9ssMODpjbZ/y0qtO87a
         pFm2zYTqKN6C+3v1llsu3lGb2oaxqfvgUzzX+EHUgW8+UeAUkmWc7TGZNFFUmnAWY6V7
         0Ixg==
X-Forwarded-Encrypted: i=1; AJvYcCUi6psQALYkLYWaQg1A8KoHSmWSRt6EFsP/wJdndNwOUtROZV2oy5hUCsxMePl7i1TtfQr0OjCN5iVd9kPB5G4E@lists.infradead.org
X-Gm-Message-State: AOJu0YzIu86UH1Mq9+FejszFfHZLDPOZCo0gRdJVrHCY4ZcjpssXTyWm
	JOiujjaRR7dFbWNh5RJcnKH61lcZMWNhKbX4Fhr+KXm+WzM7yFXCPpRj
X-Gm-Gg: ASbGncsyw24PDtGCT9DfeCcfWdfEDL2XYlyoXlIrGtQ0C1gv0RGKbRslskHjR9szOS4
	pulCfiKRz1Rn5Tj1xpPN+cZdWm5gwJSJLnFvu6ksOA2+VXbhHWg4YIGkTplW8pO866DIeA5fKSb
	g4HBxO6mK76XHTaj2tzv/4KqVg3dvLeKwa7clcqu6Som6q9mSJ8yKkK7hdsekOgTiaFPA2pjYtX
	X1AlfXl9YZsenkbvjGX6vaY/rrSvZucnH52PK6Ep+qi/CZWRYWy3tZmlmcdyokz2XkevekOgVk6
	FY0xN5AmAtk98/5wZ2i6u8toPCmQuoa7MeAOyH7IW/nrYvCDbsQzDcFfPButcuzOmKC9ge7sRsn
	MaHkG38RFADewV62hPLe5KMzIMl5D5aPuRSybDLAct6MAPNTdtamMieOSuxI30Qa5B/La+arfI2
	U83ORzNkwCxjcziEL7Ma2H
X-Google-Smtp-Source: AGHT+IHJQrrQMxeS8oZx8uyeW6QR9xFsch3rBeFPh8aSvtGAg80UGkiRC2h+N6V1nwsHDzVkAOCO0g==
X-Received: by 2002:a17:906:c113:b0:b29:e717:f0b0 with SMTP id a640c23a62f3a-b50ac4d3497mr2029519966b.59.1760297055250;
        Sun, 12 Oct 2025 12:24:15 -0700 (PDT)
Received: from jernej-laptop (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d67d8283sm760176466b.38.2025.10.12.12.24.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 12:24:14 -0700 (PDT)
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
Subject: [PATCH 30/30] drm/sun4i: Nuke mixer pointer from layer code
Date: Sun, 12 Oct 2025 21:23:30 +0200
Message-ID: <20251012192330.6903-31-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251012192330.6903-1-jernej.skrabec@gmail.com>
References: <20251012192330.6903-1-jernej.skrabec@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_202418_932346_6F416139 
X-CRM114-Status: GOOD (  13.62  )
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

It's not used anymore, so remove it. This allows trully independent
layer state from mixer.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_mixer.c    | 12 +++++-------
 drivers/gpu/drm/sun4i/sun8i_mixer.h    |  1 -
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c |  2 --
 drivers/gpu/drm/sun4i/sun8i_ui_layer.h |  1 -
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c |  2 --
 drivers/gpu/drm/sun4i/sun8i_vi_layer.h |  1 -
 6 files changed, 5 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index 10e40ec9a67a..5de68cbb6060 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -268,7 +268,7 @@ static void sun8i_mixer_commit(struct sunxi_engine *engine,
 		int w, h, x, y, zpos;
 		bool enable;
 
-		if (!(plane->possible_crtcs & drm_crtc_mask(crtc)) || layer->mixer != mixer)
+		if (!(plane->possible_crtcs & drm_crtc_mask(crtc)))
 			continue;
 
 		plane_state = drm_atomic_get_new_plane_state(state, plane);
@@ -336,9 +336,8 @@ static struct drm_plane **sun8i_layers_init(struct drm_device *drm,
 		if (mixer->cfg->de_type == SUN8I_MIXER_DE33)
 			phy_index = mixer->cfg->map[i];
 
-		layer = sun8i_vi_layer_init_one(drm, mixer, type,
-						mixer->engine.regs, i,
-						phy_index, plane_cnt,
+		layer = sun8i_vi_layer_init_one(drm, type, mixer->engine.regs,
+						i, phy_index, plane_cnt,
 						&mixer->cfg->lay_cfg);
 		if (IS_ERR(layer)) {
 			dev_err(drm->dev,
@@ -362,9 +361,8 @@ static struct drm_plane **sun8i_layers_init(struct drm_device *drm,
 		if (mixer->cfg->de_type == SUN8I_MIXER_DE33)
 			phy_index = mixer->cfg->map[index];
 
-		layer = sun8i_ui_layer_init_one(drm, mixer, type,
-						mixer->engine.regs, index,
-						phy_index, plane_cnt,
+		layer = sun8i_ui_layer_init_one(drm, type, mixer->engine.regs,
+						index, phy_index, plane_cnt,
 						&mixer->cfg->lay_cfg);
 		if (IS_ERR(layer)) {
 			dev_err(drm->dev, "Couldn't initialize %s plane\n",
diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h b/drivers/gpu/drm/sun4i/sun8i_mixer.h
index 52d1b40ab71e..6b59c52ba4d5 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
@@ -225,7 +225,6 @@ enum {
 
 struct sun8i_layer {
 	struct drm_plane		plane;
-	struct sun8i_mixer		*mixer;
 	int				type;
 	int				index;
 	int				channel;
diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index dc4298590024..185e4ae8a11a 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -258,7 +258,6 @@ static const uint64_t sun8i_layer_modifiers[] = {
 };
 
 struct sun8i_layer *sun8i_ui_layer_init_one(struct drm_device *drm,
-					    struct sun8i_mixer *mixer,
 					    enum drm_plane_type type,
 					    struct regmap *regs,
 					    int index, int phy_index,
@@ -272,7 +271,6 @@ struct sun8i_layer *sun8i_ui_layer_init_one(struct drm_device *drm,
 	if (!layer)
 		return ERR_PTR(-ENOMEM);
 
-	layer->mixer = mixer;
 	layer->type = SUN8I_LAYER_TYPE_UI;
 	layer->index = index;
 	layer->channel = phy_index;
diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.h b/drivers/gpu/drm/sun4i/sun8i_ui_layer.h
index c357b39999ff..1581ffc6d4e5 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.h
@@ -50,7 +50,6 @@ struct sun8i_mixer;
 struct sun8i_layer;
 
 struct sun8i_layer *sun8i_ui_layer_init_one(struct drm_device *drm,
-					    struct sun8i_mixer *mixer,
 					    enum drm_plane_type type,
 					    struct regmap *regs,
 					    int index, int phy_index,
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index 4534998af825..40008c38003d 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -409,7 +409,6 @@ static const uint64_t sun8i_layer_modifiers[] = {
 };
 
 struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
-					    struct sun8i_mixer *mixer,
 					    enum drm_plane_type type,
 					    struct regmap *regs,
 					    int index, int phy_index,
@@ -426,7 +425,6 @@ struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 	if (!layer)
 		return ERR_PTR(-ENOMEM);
 
-	layer->mixer = mixer;
 	layer->type = SUN8I_LAYER_TYPE_VI;
 	layer->index = index;
 	layer->channel = phy_index;
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.h b/drivers/gpu/drm/sun4i/sun8i_vi_layer.h
index 6ec68baa2409..29cc5573691f 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.h
@@ -55,7 +55,6 @@ struct sun8i_mixer;
 struct sun8i_layer;
 
 struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
-					    struct sun8i_mixer *mixer,
 					    enum drm_plane_type type,
 					    struct regmap *regs,
 					    int index, int phy_index,
-- 
2.51.0


