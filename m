Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B1C6CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 18:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dL+KOGGetvWAx0akok8/ovUlD3VF5A+umltWwuLE0k8=; b=Ot4i/wqPzoJW0FxoMp8QQyRayB
	3ucY/RjTPbAwwtRjfZ1z3K0HNznRrcLX+LeEoiuVRpOLWNaPWDA6LbTyAg5SqTRGCJaC7ootaLdJI
	3GY1T/1PEDlweeDH7r0ghhO/Llrbp8uh9c1jCmRoGR2TQiQwXmPVjIY/LNWLkujzUQNTvSfHlLTpl
	y8brAEXvrDkQBARgwZ1gmnlXJsZe7C+FIts8S2Xm5UthOEWWwr9T21haS3iikBQidjtF6em74N6bn
	D0H28Bbxs6gyOQYLEUqMCSVfCenV+T3pSczqBNdPLtOmqjBYzWZE2Oi2KY96hqEz59adWb0x9KYFg
	GaCF0xRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGLTv-0000000CLE8-1dyu;
	Tue, 04 Nov 2025 18:10:11 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGLTr-0000000CLAT-1pYT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 18:10:08 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-47112a73785so38743105e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 10:10:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762279805; x=1762884605; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dL+KOGGetvWAx0akok8/ovUlD3VF5A+umltWwuLE0k8=;
        b=Dh//Jr/ePZ2FDdnFaaufJ8Vl6jrfgrnlPOGtD29t551xp6qkKdiisTofqWS1UeaaZn
         qhlB4s2W/SQJMSPiWATCHuIydlNEl29ujYH3BpvCRIK4mLvEGiPJR74paLXJD9EkkAER
         ZiDpJw+Jg1WJoUmIrXKq9jMkT95v2B7azWdM75UpzgK3opOGJE4ZaV/J0gG3p3i9HCtT
         iVlob8e/o3k3Rw9mvwQBi4PdYEHPOrKFq0lPQdXyuRvGuFNtVR0jTlzUC+kAx9FBt+YC
         ouhvmk92pXqHZYD9esbsj/NgXuC0dnT+BAZqIaUkMJTwDXYly38f2AivvPRqpnfXDnuY
         rwGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762279805; x=1762884605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dL+KOGGetvWAx0akok8/ovUlD3VF5A+umltWwuLE0k8=;
        b=p6ni3byvGsy6y6rBW7EM47/rfe391LDzL9GE/67wYejZnsSnJx8qatdrxISGziBi+B
         l37nFBnclV9e+YNg1B3Xd8nzzrZsZIuAmmhZ3miHssEiiVmFYogosMtNuoP/BKeqUV3i
         zjZzBMklK42sIRQXfayKEe1FJdxA0Hj+jf8FNLycEly2QVcaBZiTiMjZv1PHynH3X3EE
         bo/9B7trmHu4oEydmVm6rjaas5QjQwUskOGKr5x1UujXXBh1ygl1CeanLF621LK+zzus
         9erv/Ivj9t2UP70le2/V3EcG65AUBoWDLzHQONRbXqPLj4kcnYg18OrKe570FFgyPDON
         y93g==
X-Forwarded-Encrypted: i=1; AJvYcCX2oWMoAtUZqtmNLkSTyiXcDFJ7TnYuVTFwXEEadk0jCqlYwO/r4DkxH+9w0LKoXn7HAu/kG25uhpJA88W9EiEi@lists.infradead.org
X-Gm-Message-State: AOJu0Ywz6kx7pF+iHUfqfjpvc2n5YOYv9diklHem8nfNzXrgNSGPaJvs
	y8kmtrMq4BVBOwhRYldOkkAj1uG+dl9r9OtuHepXPtIxsGoUfMSLnOr0
X-Gm-Gg: ASbGncs/WLhTZDGJUvjVgr+7dsVn7E5OOm8tKPndnc2ouZDIHm8kFwxpqHXbz6kgc2s
	pK2WzJHyIy61V7GhCGhiWOd2oWDU3RLH0HPkfFTqzqh8UpnL9w0bCD2UO0Z55JZrFY6kkBOPgT7
	cwHZ7QfYeetvve4FGIuYuGlmYxTTmHkDXi8UrzeE0xeMnAH2aQ+gdDXAZZP9GOCr296uBW82YjL
	F0/5VP4ER3onws758uM8hPNJ173BmAZMQmeefLPrVK11BB5tS/JARLW7Gjf6JDJhjiS4e24BKdx
	TksF1jwl1q0PROMA8fQYkM73zc2LPV+2ph0sYGzSci2Rh42BM9Qg8zZ+v3DDtsK0QhToJBhcMxK
	Ax5JrgUbcOME5d2NGE5vgXvrVMFI6wG9S4NXMB5g+gBKqXJvkC/Ser4BT8FvhQWb/raXjOfPrtJ
	eDVamm4/D3wdbHSxFmXQ==
X-Google-Smtp-Source: AGHT+IFE1Vnf7zp2knUPF6yAEnxj56xkN0ItjqfzEh1DT7fbSwSU9DzT/Mss/kHxDSruSnpGcPcZVA==
X-Received: by 2002:a05:600c:699a:b0:46e:32f7:98fc with SMTP id 5b1f17b1804b1-4775cdf46b2mr2500505e9.21.1762279805418;
        Tue, 04 Nov 2025 10:10:05 -0800 (PST)
Received: from jernej-laptop ([178.79.73.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477558c1a03sm24688685e9.2.2025.11.04.10.10.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 10:10:05 -0800 (PST)
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
	Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH v2 03/30] drm/sun4i: de2: Initialize layer fields earlier
Date: Tue,  4 Nov 2025 19:09:15 +0100
Message-ID: <20251104180942.61538-4-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251104180942.61538-1-jernej.skrabec@gmail.com>
References: <20251104180942.61538-1-jernej.skrabec@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_101007_511625_25775129 
X-CRM114-Status: GOOD (  12.31  )
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

drm_universal_plane_init() can already call some callbacks, like
format_mod_supported, during initialization. Because of that, fields
should be initialized beforehand.

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
Tested-by: Ryan Walklin <ryan@testtoast.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 9 +++++----
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 9 +++++----
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index f97be0040aab..9b786e5c7f3c 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -304,6 +304,11 @@ struct sun8i_layer *sun8i_ui_layer_init_one(struct drm_device *drm,
 	if (!layer)
 		return ERR_PTR(-ENOMEM);
 
+	layer->mixer = mixer;
+	layer->type = SUN8I_LAYER_TYPE_UI;
+	layer->channel = channel;
+	layer->overlay = 0;
+
 	if (index == 0)
 		type = DRM_PLANE_TYPE_PRIMARY;
 
@@ -334,10 +339,6 @@ struct sun8i_layer *sun8i_ui_layer_init_one(struct drm_device *drm,
 	}
 
 	drm_plane_helper_add(&layer->plane, &sun8i_ui_layer_helper_funcs);
-	layer->mixer = mixer;
-	layer->type = SUN8I_LAYER_TYPE_UI;
-	layer->channel = channel;
-	layer->overlay = 0;
 
 	return layer;
 }
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index a09ee4097537..bd6c7915bbc4 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -485,6 +485,11 @@ struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 	if (!layer)
 		return ERR_PTR(-ENOMEM);
 
+	layer->mixer = mixer;
+	layer->type = SUN8I_LAYER_TYPE_VI;
+	layer->channel = index;
+	layer->overlay = 0;
+
 	if (mixer->cfg->de_type >= SUN8I_MIXER_DE3) {
 		formats = sun8i_vi_layer_de3_formats;
 		format_count = ARRAY_SIZE(sun8i_vi_layer_de3_formats);
@@ -543,10 +548,6 @@ struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 	}
 
 	drm_plane_helper_add(&layer->plane, &sun8i_vi_layer_helper_funcs);
-	layer->mixer = mixer;
-	layer->type = SUN8I_LAYER_TYPE_VI;
-	layer->channel = index;
-	layer->overlay = 0;
 
 	return layer;
 }
-- 
2.51.2


