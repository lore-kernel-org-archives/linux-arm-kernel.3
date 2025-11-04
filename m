Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8993BCCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 18:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=clITce3FS5MOzvHgr4+g3DvGcjeJNYVgPXmRoIAMUA4=; b=WPwM43S87IM2D+HGg+XbRxQOnI
	bN+mqTjmei2THeERmPEHb6mrwhTn/jOxhYkEMtlrT4MtUkt+Xc0TOTjo44XxCB6uX7Nsga2qFb5fk
	/7j0/HIP7Qf9eNVBIimUF72yShtT5+nxIJp/S2C1ET8G4AsWx1SdcDCuKvEi1lfJSUmTpziFmJPTe
	yzIBbU3gKtCxmlIHbqKQqC1w/CH/OFGeqPbzbKB5Vo0wGvJb/7/sQzcnyfyBJ5v1J5QTwstSxfHB2
	SaZ09lh0gpwZ+HqmMNQbWmyVatCMNPg98hk/CMIVkFIF3C6IaKcAeh2l+BopvyUs0OngPglSDt50q
	fY70bCjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGLUL-0000000CLm6-2atW;
	Tue, 04 Nov 2025 18:10:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGLUB-0000000CLW1-1WpV
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 04 Nov 2025 18:10:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=clITce3FS5MOzvHgr4+g3DvGcjeJNYVgPXmRoIAMUA4=; b=QDnjiGMjpY8wSmTOOUhYOvw0UP
	vQFxg6h0xkjf0KK8qDDPbRzcA8rS6FvIJcJknk46EkXVKtN0GHjq6V/sa8TvzEHGIto/eBFp2ISog
	/ZT4206XKnBGmcb3AYdTYNIF03UqlGH0UA2GVx1eufoSoxI8OWdW021oVoCVK8coM6u6hHd4y00m2
	LJUrawaJOIII9c/GFP6iPVVtD6qstIU7CBoto6iTu7j4No3+CZZKQwyLKZqDe8VEHS8tdFpo0hBX9
	yjcmlIR1DVv88Ai6ESLCumLg850F6IGed0zpkd+SEKBPFCV487Hfs2jLuJfgiUILJ/y2k/OJ3lwfq
	DJfqUGQw==;
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGKcP-00000000ah9-3sLV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 17:14:56 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-477563bcaacso7270205e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 10:10:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762279821; x=1762884621; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=clITce3FS5MOzvHgr4+g3DvGcjeJNYVgPXmRoIAMUA4=;
        b=l6wfNpMYMddcKvFy0nKkF2Wj6dvO+RXMrZmjmP9ugemFeXLBgkxkBAT0kMN9OzIyo6
         TWOlmoTTpJFSnRBNIm0xybhmv4FQYjjaqazgFJqo6kChRY/OIkE5Nk7xfognZ93WzvPB
         ihOtsO8MV5pC32edDoukvPVzhAqxcQ8+AkKSb503sPTHRsmaU4FvItxyiCI48xuR4Qdk
         Q0jWKPigtcq6mOzEMlOfPqqMK1aZN/NKzVTDsvXaV5NDF6RpkGzw0Jlbq7r2cAKLrdZm
         ZEN4VOfk3Z4GyZwVrUvzueqjdUb8oWHmhcwDMtXGOnlwUN7yRYRmzwJOjPqYczIoUpyg
         ewxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762279821; x=1762884621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=clITce3FS5MOzvHgr4+g3DvGcjeJNYVgPXmRoIAMUA4=;
        b=SIHrquldmOWUyEeFf4cXaM4OiY7rd1bL32zmXPAzQp4vZLM5Gz4dpyRMWGosJbmJ7s
         OANoCv7V9tNUc7FQUO9HeW+rJj+jWVLXAmjKLkd7oFBjg9oHdC0AbhQRDegReJMkAAaN
         vVP5sZ6gy9mdVi4LJg+GhOq+o3YWjsOx/Ejqv6/h4BaPYtJcpjpoTJstWBKwEbmJK+4R
         WG9EfBNdCv0El9OkanieGWP6O0cVHGISXKcO/br8l0bLtOBrB/G05B9TcK724oKJU5qd
         OM1+/emIMiRTjDN4Stx671C/o5rQU/NdMzewv8IzZNn0tSaW5PV5ixLWcKoDNqu5ahu6
         cK9w==
X-Forwarded-Encrypted: i=1; AJvYcCVmg3Z4mjY5eUSAuCDw1p2A70LYP4wfIP4i4rzzC4r8iFM2gJfV1IubZVTQ3KUOCHmuWZLOtMY0fD2rymriKDvs@lists.infradead.org
X-Gm-Message-State: AOJu0YzvXqyDEeduUWu6WO0G16+y5+eqPagNQtwLTSaBgU8vRZ0qM1FJ
	r0+wRzzIpqV9CnBO4OI/jO0KTrD5wunJqDw9+jFUteAILAqN9Mx4J3eQ
X-Gm-Gg: ASbGnctXGz+DD4U0bh2Pr11hKvgfoYrji86w2B9U+XxbT1SfJdnIVomcYAn1p1KhdST
	xmZjYp4W0rt+/N3/JetdEe6Ea1yfF9OdD/qABRD40PzJGw5XllPl84WQUSVmvKTrMhrmBbsctvX
	tcddS+Vb2xJ4i734a6GiHQDHN/NToKE5s4M2z4KvkBABsScGXiUrb2/j+Kf6s7Zq98F8nFHUUpF
	Lpht1fkGaplsXSF1AhgAZDNAsdbTu+O4NcVw0a4xUhwZ1KGNt1JErLEM8peDy4kNImMHX9S3TYm
	63Q4MEdNlV1kZ6LhLDw+iTlP2dWT7kBtOXELe7UQxE48c6y+Xo2vC78+sVmo/kO/Lbd8JRF5NCf
	VsrxQ2EXHEj6r26WJBSqzuELtd38N8QDrRKx45wzUz0AY4ZzhT4gHz5YBV9+JqRAg5XNvErTz+Y
	yoMfHIjyOja63BjDYVxw==
X-Google-Smtp-Source: AGHT+IEpdaIz/ZPa95URReRW4HZDMqPLVxE4VqmgVrqWeDCwzW1Bh5UB6FP8v4QdEMy5HSG3J/kMpg==
X-Received: by 2002:a05:600c:1994:b0:475:dd59:d8d8 with SMTP id 5b1f17b1804b1-4775ce9ba5cmr1916885e9.8.1762279821052;
        Tue, 04 Nov 2025 10:10:21 -0800 (PST)
Received: from jernej-laptop ([178.79.73.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477558c1a03sm24688685e9.2.2025.11.04.10.10.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 10:10:20 -0800 (PST)
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
Subject: [PATCH v2 15/30] drm/sun4i: layer: move num of planes calc out of layer code
Date: Tue,  4 Nov 2025 19:09:27 +0100
Message-ID: <20251104180942.61538-16-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251104180942.61538-1-jernej.skrabec@gmail.com>
References: <20251104180942.61538-1-jernej.skrabec@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_171454_022466_3B84E67C 
X-CRM114-Status: GOOD (  14.94  )
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

With DE33, number of planes no longer depends on mixer because layers
are shared between all mixers.

Get this value via parameter, so DE specific code can fill in proper
value.

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Tested-by: Ryan Walklin <ryan@testtoast.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_mixer.c    | 10 +++++-----
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c |  6 ++----
 drivers/gpu/drm/sun4i/sun8i_ui_layer.h |  3 ++-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c |  7 +++----
 drivers/gpu/drm/sun4i/sun8i_vi_layer.h |  3 ++-
 5 files changed, 14 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index 17c0ab5860b5..18dd998364ae 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -315,12 +315,11 @@ static struct drm_plane **sun8i_layers_init(struct drm_device *drm,
 {
 	struct drm_plane **planes;
 	struct sun8i_mixer *mixer = engine_to_sun8i_mixer(engine);
+	int plane_cnt = mixer->cfg->ui_num + mixer->cfg->vi_num;
 	enum drm_plane_type type;
 	int i;
 
-	planes = devm_kcalloc(drm->dev,
-			      mixer->cfg->vi_num + mixer->cfg->ui_num + 1,
-			      sizeof(*planes), GFP_KERNEL);
+	planes = devm_kcalloc(drm->dev, plane_cnt, sizeof(*planes), GFP_KERNEL);
 	if (!planes)
 		return ERR_PTR(-ENOMEM);
 
@@ -332,7 +331,7 @@ static struct drm_plane **sun8i_layers_init(struct drm_device *drm,
 		else
 			type = DRM_PLANE_TYPE_OVERLAY;
 
-		layer = sun8i_vi_layer_init_one(drm, mixer, type, i);
+		layer = sun8i_vi_layer_init_one(drm, mixer, type, i, plane_cnt);
 		if (IS_ERR(layer)) {
 			dev_err(drm->dev,
 				"Couldn't initialize overlay plane\n");
@@ -351,7 +350,8 @@ static struct drm_plane **sun8i_layers_init(struct drm_device *drm,
 		else
 			type = DRM_PLANE_TYPE_OVERLAY;
 
-		layer = sun8i_ui_layer_init_one(drm, mixer, type, index);
+		layer = sun8i_ui_layer_init_one(drm, mixer, type, index,
+						plane_cnt);
 		if (IS_ERR(layer)) {
 			dev_err(drm->dev, "Couldn't initialize %s plane\n",
 				i ? "overlay" : "primary");
diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index 4f6c8b0acba6..8f6fcdfcf52a 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -268,10 +268,10 @@ static const uint64_t sun8i_layer_modifiers[] = {
 struct sun8i_layer *sun8i_ui_layer_init_one(struct drm_device *drm,
 					    struct sun8i_mixer *mixer,
 					    enum drm_plane_type type,
-					    int index)
+					    int index,
+					    int plane_cnt)
 {
 	struct sun8i_layer *layer;
-	unsigned int plane_cnt;
 	int ret;
 
 	layer = devm_kzalloc(drm->dev, sizeof(*layer), GFP_KERNEL);
@@ -294,8 +294,6 @@ struct sun8i_layer *sun8i_ui_layer_init_one(struct drm_device *drm,
 		return ERR_PTR(ret);
 	}
 
-	plane_cnt = mixer->cfg->ui_num + mixer->cfg->vi_num;
-
 	ret = drm_plane_create_alpha_property(&layer->plane);
 	if (ret) {
 		dev_err(drm->dev, "Couldn't add alpha property\n");
diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.h b/drivers/gpu/drm/sun4i/sun8i_ui_layer.h
index 7745aec32d76..0613b34d36e0 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.h
@@ -52,5 +52,6 @@ struct sun8i_layer;
 struct sun8i_layer *sun8i_ui_layer_init_one(struct drm_device *drm,
 					    struct sun8i_mixer *mixer,
 					    enum drm_plane_type type,
-					    int index);
+					    int index,
+					    int plane_cnt);
 #endif /* _SUN8I_UI_LAYER_H_ */
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index 1192b17726d1..805db4ea714b 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -413,10 +413,11 @@ static const uint64_t sun8i_layer_modifiers[] = {
 struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 					    struct sun8i_mixer *mixer,
 					    enum drm_plane_type type,
-					    int index)
+					    int index,
+					    int plane_cnt)
 {
 	u32 supported_encodings, supported_ranges;
-	unsigned int plane_cnt, format_count;
+	unsigned int format_count;
 	struct sun8i_layer *layer;
 	const u32 *formats;
 	int ret;
@@ -449,8 +450,6 @@ struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 		return ERR_PTR(ret);
 	}
 
-	plane_cnt = mixer->cfg->ui_num + mixer->cfg->vi_num;
-
 	if (mixer->cfg->vi_num == 1 || mixer->cfg->de_type >= SUN8I_MIXER_DE3) {
 		ret = drm_plane_create_alpha_property(&layer->plane);
 		if (ret) {
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.h b/drivers/gpu/drm/sun4i/sun8i_vi_layer.h
index fc22b9a6bd8d..a568e1db1e19 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.h
@@ -57,5 +57,6 @@ struct sun8i_layer;
 struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 					    struct sun8i_mixer *mixer,
 					    enum drm_plane_type type,
-					    int index);
+					    int index,
+					    int plane_cnt);
 #endif /* _SUN8I_VI_LAYER_H_ */
-- 
2.51.2


