Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21F6BCCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 18:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YhWx9NyFnSAm1+R2uJGg2k+MOsOqirwBc3PWmOrvwX4=; b=DoJfnlUhAwrQSVVNhFNO67sOaX
	qNeMYOF44LAJTsMhvi6dHJHzBVqMp1HlWSFDefsHtIIFqNhZ9u8STXncP2CB92/aC+AZdRQZ0bcuu
	tr7WCW0+V87y3rJ3p+mXABjqjLsh8i79W9TOp4JPkA8ZgWAG97E8PYGsUDCNbpvkmtc42VO8LSm9+
	gnx1ja52ty+E1H/VCokBN7Fc5aVgpC/o3M4xJdaQZ0DzOCPBU7njve4Pf7uitvNiCCimEScYkR+la
	slyhV+X8hi3CUxBHDB8e1cNgx0venqeA9UZpLOUR2xOj2anEHNxwu7tyVwCXleJ8c9z372LxqH49H
	MyJFNcwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGLUw-0000000CMeJ-0hQT;
	Tue, 04 Nov 2025 18:11:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGLUT-0000000CLxi-3lFK
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 04 Nov 2025 18:10:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=YhWx9NyFnSAm1+R2uJGg2k+MOsOqirwBc3PWmOrvwX4=; b=dvO7ozfmw0+08waY7f+yGh1hxy
	GruDAjqQs2SrBzVUmMpTcUwSxAT03VPWmYBNvn3dPhmo0dGQ19Acw+jH2M80KrcYb5lc8mAWYq694
	u9yPZEDGxSrCwO6FvUh0Ck8YFAijKYJFa0PDBiibYk9ezrxosabOXZFWH/4tCAuJ0W1fPtf+1bw5K
	H5buMAM58+EVfN9HyUa9bUw8rS18geDfD8HxM77XD3FyPBq2bo8DtjGZ2DYiRqBDRoILz/8KOwboC
	detsD78Lydh8PKynGTske2jE0b2uAff51Vvc0wdSIBPx3+ATD4gzOHcISZCCoCujxuNK2lHB82e48
	bC72GtZQ==;
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGKci-00000000au6-0FMA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 17:15:15 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4775895d69cso4842855e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 10:10:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762279840; x=1762884640; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YhWx9NyFnSAm1+R2uJGg2k+MOsOqirwBc3PWmOrvwX4=;
        b=a+VufVGaeL7wIl7HnkCmBv/PNHu87sfF9nwmIzlSKNXIBu4hIqgiRRF8sGIO//yUIi
         LWl2/l+VqoyoSPA50jQaU1WTsrPkYR4kwK/Q6laku/vbjlutOtVGUoEKMLR+Fq2Xtj55
         5XBHsm/0S3PCHbNyayp24LlzZ69VtB/ZFM4zxN94DY5zSAjuWPkESIfO0wAqFbZ/5pHO
         YMmnmHjRO1xZAvk/lgbFwiraXV68sMvSVBA6C9Z9V3jgH1oLut6VEjOYp0e3nq+ilm8B
         89H630aVwLf6TuxVFn5weMcGfG/jfVk7aJBg1Da5rI4d5MplvpIsgwGtc8Mjbe5kURlm
         rw0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762279840; x=1762884640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YhWx9NyFnSAm1+R2uJGg2k+MOsOqirwBc3PWmOrvwX4=;
        b=K096LQF29Kz4HAqR9G9lqpTy6oHGG7omjeJMxEuLlIiUPAvGGf8bcOYSn5TP5b1bVx
         1IXAWD3LQHSi7zhC8RzBu8yjbK8DH/HuvopfCr2P0StnQUk0UpVNwp1y1kxbEl0Q8soZ
         Y3p/BP9ojUXFs5Lvg/P8MzFtVzBH/pj/mw0399Hr/1i49vQl9APixAsTE7sjB0vp4snH
         s33k62v82OxmP4aqNg7noOcZtSxttxKkA4dVt+7WOrr55Iu3st1QxJTiMQObVf4u7L1o
         CQn7VXYlX8ZMuV2T0Tzoq1subKeBd8Vldslq67koNPGx7Qs1xdtl87L/L4kUmgGG+VJm
         QsLw==
X-Forwarded-Encrypted: i=1; AJvYcCWONdpmjVTFBun4t0ljE0JZ5a1z9u3tNK0vSBTphb6yJsZUyLv0FwbUjgDOM8G595PnyKxKmtXcZfPx2ELWkVIt@lists.infradead.org
X-Gm-Message-State: AOJu0YzzyTYut9obD4KKGABbh66LT4RXzWuxZpgVN38nkwfRL6atkBda
	LnuNJP+/2UvUgQbROXhO+BV4OFbvTK3xyta0adZtoFQJPE2YB510zRrx
X-Gm-Gg: ASbGncts0OlpA/wkW9QdkYXG0uue+D9ggJcvBwKTa0+KPGRqBbB69aQBLuFXKOK7wXX
	sY2S5AT84Le+Y7cGkJbc/WKY4tolyUXrejM1dU82P+U3A1puIz+tFWVDNFGVEJKwaCFS3PbP3Cz
	p6RHRdHaq6szLY0LlCjMnuOprNkOY00dTEUM0s2JFGI6qtSWzc+WoZeP51HLVVes4vTRThs7uBl
	VOEeo7Zu55EfBbbCjuYl43joH8xQm0fQ0At2W21H82vNNo/8k5IwB6sW+xv3igeFZIVxTgQSBQG
	/xnmHrKWjV+VqrUp+88sW7DEs5CaYBXY1ylwAOY7yG65b4xVpklLjIcSsemwclDu0krjYAjAAiv
	nFoeCGu4/NFwREK9OxHFIAAampJJODJFbifpFez7xg4pijbMFcK/8heGg4fT9b0A+AxrZJp9aQe
	Tl8DDJoFxQ8ACzK0M79w==
X-Google-Smtp-Source: AGHT+IGiymh/TsRqhwN6N3A97NvG3Bqul+I8b68ZoyUR344zIADNYxpVaPkfS3GzPbVwVEx24Kp+Fg==
X-Received: by 2002:a05:600c:6388:b0:458:a7fa:211d with SMTP id 5b1f17b1804b1-4775ce1874bmr2424725e9.29.1762279839699;
        Tue, 04 Nov 2025 10:10:39 -0800 (PST)
Received: from jernej-laptop ([178.79.73.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477558c1a03sm24688685e9.2.2025.11.04.10.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 10:10:39 -0800 (PST)
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
Subject: [PATCH v2 30/30] drm/sun4i: Nuke mixer pointer from layer code
Date: Tue,  4 Nov 2025 19:09:42 +0100
Message-ID: <20251104180942.61538-31-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251104180942.61538-1-jernej.skrabec@gmail.com>
References: <20251104180942.61538-1-jernej.skrabec@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_171513_811335_D77DD212 
X-CRM114-Status: GOOD (  14.59  )
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

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Tested-by: Ryan Walklin <ryan@testtoast.com>
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
index 50fc20100c90..fde3b677e925 100644
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
index 3948023e095b..e2f83301aae8 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
@@ -226,7 +226,6 @@ enum {
 
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
2.51.2


