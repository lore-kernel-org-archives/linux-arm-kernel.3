Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E82C1049523
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 09:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jtkXXLPioyWW3Nha1qMzs0mPGG4eok73ub81lNtbqSo=; b=eL0wxEWTLxeXhT1ZRR8kCWWSpL
	ckzkrVQ5C75rAE0YcK3SuCquNrCYjkDxe3TA4z+wCygdafrRN8SARfftlCZDziSrvIOQJh1VVRXuY
	Q5FfvAHBapEThFGEAar9lwz8IL0QE+t+XNgKA0sVAt0F2VbT4+H7R9GXDXs1GzciRsF7NMZTFk9Ya
	+vxvhq8aweYVI59TccwaZ6cjhrBTotOXJElj5pwNyWMt3b7VlMCIgK3bGLeXflz1y5XSa/tiCindz
	cGnc9DjidpsBC3I1ieQpiUuURTVj/FgiC1Ud1VIFriS5w5+MfsshkP4tcamqUmTOfpgXX39ofuSso
	hy8mP/vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0GCe-0000000BJne-40oA;
	Wed, 11 Mar 2026 09:50:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0GCd-0000000BJml-2Tg9
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 11 Mar 2026 09:50:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=jtkXXLPioyWW3Nha1qMzs0mPGG4eok73ub81lNtbqSo=; b=HmqLd4VWqOJ8XZnMKh5AS4xpbP
	0wUoBShj7s3kEPF0l3NlRbmEXSXVVYH+kBid/TP6uIFBPgj2cpgCwLSwq/18RFV8t8SNa3sHmXM97
	JOQXL0UumCZqtTnVqMW3o04eLCEluG0ws5SHy349aXI+9mvC1mcea6rhMkvV9JLrync3twZQMdwSD
	33zB9pNrpFs7h44qwCxr/IQ8bOSeQBqjg2+jeRm1uAlUHAN6PUjUHCimVzrGesXet4Mul0ot5AsOp
	jgfm4f5azOmYPwVrw8rDr3FgpAst4qN5+RjPAckPIiimSSrNzHxmFcVleld6xPjFJucy6IziTGnwv
	NubzDK1A==;
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0GCa-0000000GbhL-2vyC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 09:50:06 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-82980945556so2703917b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 02:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773222603; x=1773827403; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jtkXXLPioyWW3Nha1qMzs0mPGG4eok73ub81lNtbqSo=;
        b=Rztxc30wRr+9QwGxPWOZWRJk5V3CptaNlorWMJ7JJXjmW0dgLjSU+Mc3uuJOe36klf
         zadHxMGYwnjaD7o5aPwGgbyaLE/LVo64UHRgs0Cmfe7K7uEuL5+oz0UNJfHxEiRLI6uu
         a3KV8ugUX5xsgKHz7XHcJ4dxjGtfe1upIr0Fs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773222603; x=1773827403;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jtkXXLPioyWW3Nha1qMzs0mPGG4eok73ub81lNtbqSo=;
        b=vOKXxLm5S9L7ETEXWUASBltxX0MmiophtoZILmeX9P1XItH44p12dUGIkMUKtaA+52
         wmQ/lf1udPe8BMf87b/K5G/ljFFedDflGVPAjgdYcXEjC1TE3PLmKz86ODl3CtW2el1k
         VEv/tUtviimBmosI/IDsG1vKeH/7jBdLiclZcakFEGas3r7sfLnQcy2Uo7ID+qAm4JLL
         aow5rpyxILf9g7avPE/YMevfglQs8rm13ZofBGSX+AEK9f+dqa0f1P9FMjL7kdJ8swT9
         7+W5jjQ6ftJX5yiEGW48wi+pg+mtm4pcyanJ7a2NpFddV6WU4nK42MOzsVg6ts+JSxOU
         ITnA==
X-Forwarded-Encrypted: i=1; AJvYcCVrfAhFfLmZzw8t2kBlS36x4qrviziV3WJOqKe/O8OFu2GMva8WNiixj7Lo5PDI05wHoI7qiBfXg7V4w3mjta9t@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+Y3U6SqFFzrCF8Hi9fOjhy9NReMJlP5SN39SO7VeYI8iSd2Fg
	GFAYQQzA8XA6L2IIICim20c5/F0missri1nYA6la1OoewevNgVYrP9+yuoNcYWTwwQ==
X-Gm-Gg: ATEYQzy1T1p6XjJnIu/gWGMDRSrc65GFlvrPsMV0hlqaX+19Fexp/vo0oMEK/drpEdy
	uMdunOcZL7+sQLvfOKrXy0NPnYmQhwuoRYzlfX5qpSLSr4cJM9eCAh3m+eLEeXaD5KcKNctS+DO
	41DJPTKy8GUUfPJC6A7ou9IdK29K+Hl49jFOQAHutXN4xmwpM79t7SuOaKfIY2B/fS3oivLFq8y
	RIHIWcO0DrDZX/dR+rgnQu30FoPpDdl/MR8zzYYVut6em05HxyxrIczTNttuAp06BMizz8KDhsZ
	XBWWmNdYkXFisDv9IZbzuJDF53k+2eOaGohVEi2y5yVKM5bWVREYuLKL3Jdn8N5g6iDYzGvBx2y
	u8tpjNAvS1xk8euVYCEGhWeDANjerLU78KOHaxaTxiVTIzdhhm7VlKqPGvqSctLZM2Wbo9/c+Ai
	Zr0KrZMWreFSVnSovYDqrLFCXjyLBurZ8VmD1Fco8eqeS4cdOf2nyfFRLtSWCBbkoZ9Qx7MiHSI
	bnB/zX0
X-Received: by 2002:a05:6a00:3006:b0:81f:9b0a:812a with SMTP id d2e1a72fcca58-829f70af1ebmr1872729b3a.14.1773222602308;
        Wed, 11 Mar 2026 02:50:02 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:805b:14e9:f783:bcae])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6e22f85sm1887598b3a.27.2026.03.11.02.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 02:50:00 -0700 (PDT)
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
Subject: [PATCH v2 2/4] drm/gem-dma: Support dedicated DMA device for allocation and mapping
Date: Wed, 11 Mar 2026 17:49:26 +0800
Message-ID: <20260311094929.3393338-3-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
In-Reply-To: <20260311094929.3393338-1-wenst@chromium.org>
References: <20260311094929.3393338-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_095004_838534_3C0259A7 
X-CRM114-Status: GOOD (  18.78  )
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

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
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


