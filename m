Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDFF7CCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 18:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZdGrKH1QE0kG7REtfLe4gBCoW5I7PDPHN1PH2jaotk0=; b=EoAy6TlWEGZTGXSuKr/zg+W2IO
	K2zsY8Z8E6IzwgDXfV0BB9mHq0rUJPsGKH2qJPE2RIYRFQY4yxe5atv6Bxkv20VTfxxzuQne5aZhz
	jitGVcHABbF6ztIsnwd/N2sEHhzNQo+c+fuuMNFfWNPOO+0N32NabiQ33qXydY1z4U8CCIISqu5/u
	gZRn23XSevR8Pq+DvPkDRCBj1oAx1ws4ovzwqOzbtjSj37ADISXxagQcoBB0BB4WUxYXQMeDYyD1d
	Ddxk5p0y03tUBwnBk53SAvu5NJbgLnkPBPw9ezmJJMRiQSdzaosP2oruJrYNB5hxZgK1/sGbalN0I
	wew1rI0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGLUu-0000000CMau-1Ur1;
	Tue, 04 Nov 2025 18:11:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGLUS-0000000CLvz-2Bbx
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 04 Nov 2025 18:10:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ZdGrKH1QE0kG7REtfLe4gBCoW5I7PDPHN1PH2jaotk0=; b=g++MpZ3EJw/Evtf8uL0M43IG1b
	qQtJPUWtSA8kqFEP8UHZttQo0H8O1ECYKuwOZ1cfe8uRLmvjXgChbjjxZ3d7v122FwTlYc07OiQDr
	/rkRH+2gBBF/uRqQREUN9ZQDE/Gz7zHB1OCdUWQI+cDQ2A6YjlsG99/jMaiuSZVu0Wpzyx14+Qw5L
	VKIuBz9G769V1SP+tosfSuYsae9HYGrAwDt0NdS6PmayUjoBjVWPLo+wmbOxMkYtmxmGMslj/K3Hw
	YZC4gVLHTRlJApQbM0aqjHPq9dPQjOiYcQu9yEDS9NNPLFS1I360YoTn7flseeZscs7BY5xIEjwxn
	9nL28d6g==;
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGKch-00000000at6-187l
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 17:15:13 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-475db4ad7e4so23047735e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 10:10:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762279838; x=1762884638; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZdGrKH1QE0kG7REtfLe4gBCoW5I7PDPHN1PH2jaotk0=;
        b=BmnBArKusNo1eIf3ZUvnujs36JpAxZSvdp2391rn1UeAwHNjTGZY2Oz7zn7uPDS3mk
         ePgId9u0q5drFhpH3SKj9EF5CsQxygfBUbb3RWVsZOvc/RR6+74Yzy8SX9L9Zx5L9CH5
         JRzo7AHWcuQJurPrxuEfkHGKdnxjKmPQXsdgF5GmcdH//13ziD5m+guW7V/kAv4JDKrs
         mKqATj+fugVXBRpv7LliNFCrqsYi0AI5B9NWhC6cyVN/zDUkCJXoikqUyqrGpIUZnXvS
         zb3AT9qPa/FR0y9zNnCkpcU6VZVUZufjeEKcsk0trqbHXw3v/waNfu1CLO3kgB/LvGLe
         gUIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762279838; x=1762884638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZdGrKH1QE0kG7REtfLe4gBCoW5I7PDPHN1PH2jaotk0=;
        b=Zos/XAjdarxjiBGd6jwjKPxmlBlL37sxBvI1D6AyKeHZOgkW3BkGlpc6bacwOsC35C
         uybI1g6Cc4DEsCNtgKTDNVFh7bR0yOwbEKR4HOv3dGJinAZln8usTp0nA5b/Cn9NmA+J
         JnFwazDty/tKvAh0Yra7ZfFnegHAstS95Q0wG1QiCSvOO9ISeNChifWLoScHARUb4CBb
         lOd4mHVCqaRzDcz8+HtbmflJAms+p6O66fJJaw5k58RRUiKuNi/5qZF9upEok5I21nxm
         gorSTC6GAMY0dnije5WtdPOAU1GSC9c0jwimSl1ny2BIKLEC8vbpmT4trZjTaar/Cbqf
         QV7w==
X-Forwarded-Encrypted: i=1; AJvYcCUFwwX3h1NmF5j3TsR0BnZspD1VaTBkFV6L0XM0fKscmV7dByT5DQLN8r7HFi0dJLkuopwxBMEEB6B2N1Yqbupo@lists.infradead.org
X-Gm-Message-State: AOJu0YyuCAJm5GLY/jvt1h3S0j0NRiq5IiFDtIvIEGR8yJMANWGXRUmo
	L8PnESVHBu7PHrUi5a39tGs3PiSgHU2kBJfhxZ9plOj3y/PBPoiA58mo
X-Gm-Gg: ASbGncvwRNIFYZUJ5FCgWgrW04gfQ4mERw3lTXR1FkZd9jK4SBxz6XHfmVLh2y1RNW7
	dsyJknQv7Ace6q0iX/82EtaGraCxO0eeKqxDCMrzdoiI+pqIjKPVt8zn239WDFsebXhACoIboiJ
	ayK1zfnkcjsrPRcLPS35aPD1RISEEEZEBP/TniuRE8rijnazFv6HXMxh7qk+cxxY0xGBICIi0U8
	zVO094wEJLGawRFKicWmnZP1BqUbAuYBH4qMVaodBqDW5DmO6uSi16BkNv38eOdfK3hh9BbHSBd
	3l8P0yZDPQFuAhk5Cf1bJ01jq7UsMcJZhFgIxqfvguUnB/DEM4Ds3oCQyDlcdicd8hZZRC5ot88
	rHHKLXY+Zh27ITxZtNcNfYe/YNnKL6bWQF6hU+qTie7dyE36AM3HQOUwjZ0dHt5KuhVsZL8yUng
	oIKfjQL+lSjWF6n7apkg==
X-Google-Smtp-Source: AGHT+IE6YV6xR2I6/+NCWHLkg0DglaeA9v7PSL0SkiyT31i7Bh4LMca9EcGx6brDtSF2nS0sWtPQUg==
X-Received: by 2002:a05:600c:620d:b0:475:f16b:bcbf with SMTP id 5b1f17b1804b1-4775cdc148dmr2023655e9.14.1762279838428;
        Tue, 04 Nov 2025 10:10:38 -0800 (PST)
Received: from jernej-laptop ([178.79.73.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477558c1a03sm24688685e9.2.2025.11.04.10.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 10:10:38 -0800 (PST)
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
Subject: [PATCH v2 29/30] drm/sun4i: vi_scaler: Find mixer from crtc
Date: Tue,  4 Nov 2025 19:09:41 +0100
Message-ID: <20251104180942.61538-30-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251104180942.61538-1-jernej.skrabec@gmail.com>
References: <20251104180942.61538-1-jernej.skrabec@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_171511_442853_EDF62FD0 
X-CRM114-Status: GOOD (  12.45  )
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

With "floating" planes in DE33, mixer can't be stored in layer structure
anymore. Find mixer using currently bound crtc.

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Tested-by: Ryan Walklin <ryan@testtoast.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index afe38ea03beb..4534998af825 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -13,6 +13,7 @@
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_probe_helper.h>
 
+#include "sun4i_crtc.h"
 #include "sun8i_csc.h"
 #include "sun8i_mixer.h"
 #include "sun8i_vi_layer.h"
@@ -62,8 +63,9 @@ static void sun8i_vi_layer_update_coord(struct sun8i_layer *layer,
 					struct drm_plane *plane)
 {
 	struct drm_plane_state *state = plane->state;
+	struct sun4i_crtc *scrtc = drm_crtc_to_sun4i_crtc(state->crtc);
+	struct sun8i_mixer *mixer = engine_to_sun8i_mixer(scrtc->engine);
 	const struct drm_format_info *format = state->fb->format;
-	struct sun8i_mixer *mixer = layer->mixer;
 	u32 src_w, src_h, dst_w, dst_h;
 	u32 outsize, insize;
 	u32 hphase, vphase;
-- 
2.51.2


