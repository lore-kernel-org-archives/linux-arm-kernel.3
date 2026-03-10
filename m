Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55898FCC9B3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 03:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9DNho1J2CisM3xAD9Y1bBejtF+SOOT6CZm5ayFQyPks=; b=pxETeVZAcTNVMGe5Rvbh00Zi6M
	szPYBkwC9VPVnrpWYRf0noOD6Od9EC7dHqN2Wa5AUgfSj83qFouKYWZCiwNG/YmnMmBsz5/hLYt3v
	xwd8Z5wGS8bg6IT+tCCgbpKvvYqArzWIhgRjKy5XwOZBDDrKKnsml+8v3N0OixaI2oIVxkSkTSbNA
	D+o86rOAIM49I+o4jvPSUvMws3UbodqwWx39QyhOoxLgbhen4aL+fCzZ0FFW9CBHP2s/sKe14SIQh
	c0c+AA72UMtpxFawWRuLVumMsKpM7X43ylK983xdbQIFZbD4Afjd9qebXuCCovm2t/t9UyzsXQMy+
	T0ZuEoEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vznjE-00000008eFt-3G3r;
	Tue, 10 Mar 2026 03:25:53 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vznjB-00000008eDR-0mPT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 03:25:50 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2ae4988e039so60249015ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 20:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773113148; x=1773717948; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9DNho1J2CisM3xAD9Y1bBejtF+SOOT6CZm5ayFQyPks=;
        b=JmskACW6StPKHr2n4ompnQwA52k1ukteKHVFTjs+cmDIze4LMUIih2YHiOT1/EelbZ
         xbCXh7JxLnrINypL6IRQI9J7vcWFg6srlnrT4xgXGgXO8WAJdds7A+kbPNLgJRnlVeqy
         Cdt4cBTpAfAUrTsBAXmQIPxM1KQ+5xxAJm/sY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773113148; x=1773717948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9DNho1J2CisM3xAD9Y1bBejtF+SOOT6CZm5ayFQyPks=;
        b=qp6lloMONka1XBNaI18M5B1G1tUd6M/Tc9ycypHJCuamvZsit4av3pcN/PGx7RruQt
         O9mCi8gP9ZJVIMAu4/q2w/rKcKMLRi2hEEmx0hqG6/DA2BxlMsWWQJw+efmvftBvtGC+
         6JqKjBwxalVIvZw9csBJAj27FyMLhA/YnwONO8wTBzvig1NXFn2X46zyI9MgTkMs9v3C
         rSr2YS+5PTaAQ1K89e9E0MOgm6MTDN473XV+QI9BQT2rku5eCiNFzUMCyOu51UVMGn2v
         OKDen2zyCfq42riOWb8SCMoZ4RNDX3TYISjNRryu2qZY0pbuKrv0FnmwCwAjLei247xO
         C0FQ==
X-Forwarded-Encrypted: i=1; AJvYcCUuFCSG0A0m9xIkNvbvffHQtOAhmDLCYk9vl3H9R9sI3spdMwSm3JOQGHkmp+SDEDxMEkuivnw6UJyr7Y6pXmGT@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+s9Nj9r/pmOKAzulT2B0OCHlZ2XfZMA76i88F6l46gC4dsLVP
	egbx1+bylvQwaApwFxIj6lTP8ujm4uY3Kl7DyTrP/29IgydF5m3ba8Txfld4mxLOjA==
X-Gm-Gg: ATEYQzy8n1j4qYQBUNTHMuEZr9/8vyag2fNRYURYc/f6QyML1KqEEaZjacwwqU685uH
	kACM6zE9z69dzrd2QaP6L2dEjfXPKYu30Fw+eQkDbBFBYt6TgSllxDMcxXS4ibvCnufN6uv1VrH
	eak5aOkjcFtGK8Cdt4DPrdJ6PSZ0u/AjrOS2xJaWHWD6wZ8l3vNsWQhc1vWgRFo1b1jxyBWT0ap
	DnORGVJuHBwRB3/NI5Fqm9Wl7/Uf5vpWkJWQNayD2Idekyu0aqcFSI3io1jdgopklLYBTw1f8yr
	bxhbtNG5dxN7dZEPdJhKDzr8YAu4vmaz8Pv9hl2UgGkYZ3NOEfjU7zfaYDjpPh75cuKAooryghK
	mqe7cYEjb8/8UYW+zDGwqHQQsvjxc0EwRzRoZT7YRuP4fDot8sCtVcJ6Pml1iKCtGaQzdHfMDoT
	CxvchaaW/KC0yGaWbpTF7KvSSUVRrrHuQJJBZfhN0jai8rvTqWoZ6pki0S3AiVc7t5R8G7tgj0s
	7QiMGUMzzsz6gujma8=
X-Received: by 2002:a17:902:da2d:b0:2a7:aac1:7201 with SMTP id d9443c01a7336-2aea197b887mr18842765ad.3.1773113148339;
        Mon, 09 Mar 2026 20:25:48 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:ee38:e01e:e888:6900])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83e575e6sm126695095ad.5.2026.03.09.20.25.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 20:25:47 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-sunxi@lists.linux.dev,
	Paul Kocialkowski <paulk@sys-base.io>,
	linux-mediatek@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 2/4] drm/gem-dma: Support dedicated DMA device for allocation and mapping
Date: Tue, 10 Mar 2026 11:25:07 +0800
Message-ID: <20260310032511.2545500-3-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
In-Reply-To: <20260310032511.2545500-1-wenst@chromium.org>
References: <20260310032511.2545500-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_202549_238153_560239EC 
X-CRM114-Status: GOOD (  18.50  )
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

Support for a dedicated DMA device for prime imports was added in commit
143ec8d3f939 ("drm/prime: Support dedicated DMA device for dma-buf imports").
This allowed the DRM driver to provide a dedicated DMA device when its
own underlying device was not capable of DMA, for example when it is a
USB device (the original target) or a virtual device. The latter case is
common on embedded SoCs, on which the display pipeline is composed of
various fixed function blocks, and the DRM device is simply a made-up
device, an address space managing the routing between the blocks, or
whichever block the implementor thought made sense at the time. The
point is that the chosen device is often not the actual device doing
the DMA. Various drivers have used workarounds or reimplemented the
GEM DMA helpers to get the DMA addresses and IOMMUs to work correctly.

Add support for the dedicated DMA device to the GEM DMA helpers.

No existing driver currently uses the GEM DMA helpers and calls
drm_dev_set_dma_dev() to set a dedicated DMA device, so no existing
users should be affected.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/gpu/drm/drm_gem_dma_helper.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_dma_helper.c b/drivers/gpu/drm/drm_gem_dma_helper.c
index ecb9746f4da8..70f83e464476 100644
--- a/drivers/gpu/drm/drm_gem_dma_helper.c
+++ b/drivers/gpu/drm/drm_gem_dma_helper.c
@@ -146,12 +146,13 @@ struct drm_gem_dma_object *drm_gem_dma_create(struct drm_device *drm,
 		return dma_obj;
 
 	if (dma_obj->map_noncoherent) {
-		dma_obj->vaddr = dma_alloc_noncoherent(drm->dev, size,
+		dma_obj->vaddr = dma_alloc_noncoherent(drm_dev_dma_dev(drm),
+						       size,
 						       &dma_obj->dma_addr,
 						       DMA_TO_DEVICE,
 						       GFP_KERNEL | __GFP_NOWARN);
 	} else {
-		dma_obj->vaddr = dma_alloc_wc(drm->dev, size,
+		dma_obj->vaddr = dma_alloc_wc(drm_dev_dma_dev(drm), size,
 					      &dma_obj->dma_addr,
 					      GFP_KERNEL | __GFP_NOWARN);
 	}
@@ -236,12 +237,14 @@ void drm_gem_dma_free(struct drm_gem_dma_object *dma_obj)
 		drm_prime_gem_destroy(gem_obj, dma_obj->sgt);
 	} else if (dma_obj->vaddr) {
 		if (dma_obj->map_noncoherent)
-			dma_free_noncoherent(gem_obj->dev->dev, dma_obj->base.size,
+			dma_free_noncoherent(drm_dev_dma_dev(gem_obj->dev),
+					     dma_obj->base.size,
 					     dma_obj->vaddr, dma_obj->dma_addr,
 					     DMA_TO_DEVICE);
 		else
-			dma_free_wc(gem_obj->dev->dev, dma_obj->base.size,
-				    dma_obj->vaddr, dma_obj->dma_addr);
+			dma_free_wc(drm_dev_dma_dev(gem_obj->dev),
+				    dma_obj->base.size, dma_obj->vaddr,
+				    dma_obj->dma_addr);
 	}
 
 	drm_gem_object_release(gem_obj);
@@ -432,7 +435,7 @@ struct sg_table *drm_gem_dma_get_sg_table(struct drm_gem_dma_object *dma_obj)
 	if (!sgt)
 		return ERR_PTR(-ENOMEM);
 
-	ret = dma_get_sgtable(obj->dev->dev, sgt, dma_obj->vaddr,
+	ret = dma_get_sgtable(drm_dev_dma_dev(obj->dev), sgt, dma_obj->vaddr,
 			      dma_obj->dma_addr, obj->size);
 	if (ret < 0)
 		goto out;
@@ -539,12 +542,12 @@ int drm_gem_dma_mmap(struct drm_gem_dma_object *dma_obj, struct vm_area_struct *
 	if (dma_obj->map_noncoherent) {
 		vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
 
-		ret = dma_mmap_pages(dma_obj->base.dev->dev,
+		ret = dma_mmap_pages(drm_dev_dma_dev(dma_obj->base.dev),
 				     vma, vma->vm_end - vma->vm_start,
 				     virt_to_page(dma_obj->vaddr));
 	} else {
-		ret = dma_mmap_wc(dma_obj->base.dev->dev, vma, dma_obj->vaddr,
-				  dma_obj->dma_addr,
+		ret = dma_mmap_wc(drm_dev_dma_dev(dma_obj->base.dev), vma,
+				  dma_obj->vaddr, dma_obj->dma_addr,
 				  vma->vm_end - vma->vm_start);
 	}
 	if (ret)
-- 
2.53.0.473.g4a7958ca14-goog


