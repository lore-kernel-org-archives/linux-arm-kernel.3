Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2612CCD190
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Oct 2025 19:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b/RwR7PkAt08sGqCqdeSYXHmOvdiEO3Sen57EH3VrWU=; b=towmdn4ZFTwuPfP1wfJ1ub3/H0
	0OcoLvq/AFsSZdwjq/rNLy1Qt/w8UP2rLzRzFqPRI+xnRo3qTcpCta3b1kkcMOdkvfJUgt8p/BXj+
	F7qQdBhOyvz05lEDVSRJr7PATmakbMFjRF067G07FcG+2DFhbAGVP4jPrAgufF/7d9CEyVmNifQrb
	LX4qWRePLV1JyRePWlH2vRhN22sn7An/DL8z0Nran3qGDvUBbGEEmKAFyAsMKh9CJPeaN+9DI/ey4
	bORgsq0WcvxUw4WjBUIoUA/J4T0zPiwGPR9fK1umdpXYkHXM8KAr5P0pKJ2dp8CqPUwXkLnWqtqG/
	R2I3HXCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v81fY-0000000BfYa-1Oxy;
	Sun, 12 Oct 2025 19:23:48 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v81fV-0000000BfW8-18Dr
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Oct 2025 19:23:46 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-b3b27b50090so653277566b.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Oct 2025 12:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760297023; x=1760901823; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b/RwR7PkAt08sGqCqdeSYXHmOvdiEO3Sen57EH3VrWU=;
        b=cexdkNrB/+/Le+SG6e5LV9Rmd3QY3ZNlK1yDalra5+w9/uNumkxAgBG75HOA0pWc1j
         DfRSxrrBs3xd7craKgo3CYtpfjVl+SZGd/gyyOJ/tu/8FbMgfs9yB8Ipa9UZ5+HdWBJj
         t4hCJVlbyem1wiWw0BIVHxws7BLxGcNhDONXTMXNPw4Vaqw0fQQgNi+5XhhFltXVrhYS
         g828wcCD649+1foDajRMKVqGAzHgswbDfZhP6BES+P3N8VLn+s175On671eJ6uGHyCvc
         +Nhlhj4+lkFraz4OS12FeYphOlumA3/0F+dbQYmGvdD/rSqaymoW8IFbjVnKltUszqIQ
         Nfqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760297023; x=1760901823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b/RwR7PkAt08sGqCqdeSYXHmOvdiEO3Sen57EH3VrWU=;
        b=cfgeqy52G6GpfYdpWjo3T8AjeB1MLOoLYYNBh9UCooBcJilAqrO8+WruCiL5DGavP0
         WZMuI9iy1pe/t4WdNSNdz3VcaCfhbk//JxixyWEfkbeDtPkXL4+bbAxBokhtAdn02hMm
         KDV2GDhKhRSW4z+W06mAqAK9MATo7ALdVZu1jHYfjr9VYa1RVjlnlkJR1q/KUeUJOZ0+
         pBISq99kkobZ2Jm88ouA1p7sUNYfVyZDKytOn7kUke0ofghd+trqQnF64bIA+wIC91cU
         DXGMVBIA7IcYVn/0yMkvk41r9fcpMypfgZjXu13pDFi++6F9iCEst/M996WLxjQ7YT/N
         AB6g==
X-Forwarded-Encrypted: i=1; AJvYcCVe/kl+sgqzXvf5d1zBU9uoBM49torjJ1FrVCorkvlvAhobYEQvzAWHHjRQpzx93GQC8jrEjqe/BN2X4BlsF76R@lists.infradead.org
X-Gm-Message-State: AOJu0YyFmbr0R8jgK3M1+G543IBsil+i+SgC/3F0tQJ2+5a6fAfYbbAL
	SFGDlVtKASvqx8sb1K36Oj2HW63uBAAftVQwKQwfrYny/KDLyD1uzev8
X-Gm-Gg: ASbGncvYgJaH2KJPrMfS9L6kCtc+h3h/k6af6WOsdqqxrIjcW1InjIkaUQUNvqtcyHI
	tGCt0ZB/FfLVdtx6ls9J2dnUeZ8hLvf6qYK4PiKqjFU6ORpXjLGXrmgbr1cV6lk/DVRrXn59BR9
	vuo8lLt/wmbTZHx8JcFcvM2u9BPEPURV+nVleMSpnggkXR/AvzLXRatyN9N3fVPj+gX9xLOCKtH
	CHKkjnoy7mXlrQME9aWhpBN6Y5AdZKLYLKea/g8oY6c8tiLigsUOGaBbMVPb0Yk/pj2M7Lujmho
	N7W9vW8oya0G1hHX+L8qJp3qOGgGMPYY6j67agnTW4B0yLx/TgmaWwz3Osgxxo1sJPoW7Gtfz9X
	GnTnzAYv4mt7bKYCnBlE3Fc1k0ggw1qFnGJOKD05ehvKGokoeYL+GR95BYNjozDyQjRY2qBDUPu
	ZYW/b+X3Bgr/Y7BjHwCw5ybM9CDeDTLF8=
X-Google-Smtp-Source: AGHT+IFr7DIU5+0XZbE3hR+c44DsyFKY1NvkxnYeQndJ+rW32FEQNP/zDp5N5Glq490y6QrN3W54Mw==
X-Received: by 2002:a17:907:c09:b0:b2b:63a9:223b with SMTP id a640c23a62f3a-b50ac1c5db0mr1978491866b.31.1760297023111;
        Sun, 12 Oct 2025 12:23:43 -0700 (PDT)
Received: from jernej-laptop (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d67d8283sm760176466b.38.2025.10.12.12.23.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 12:23:42 -0700 (PDT)
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
Subject: [PATCH 03/30] drm/sun4i: de2: Initialize layer fields earlier
Date: Sun, 12 Oct 2025 21:23:03 +0200
Message-ID: <20251012192330.6903-4-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251012192330.6903-1-jernej.skrabec@gmail.com>
References: <20251012192330.6903-1-jernej.skrabec@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_122345_365191_4BD45114 
X-CRM114-Status: GOOD (  11.60  )
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
2.51.0


