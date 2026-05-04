Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4312BFF886F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 12:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PZFwKQCzFDeKBEEx0s8dTkXKr01dndAPiIRslPFEQHw=; b=i/pdWAs+YniVet6G2hTYMR4Wck
	svnzEz90LtC+k1HGMmczV/EfO1mfG4aXfCIxBvNhgrvZe+l+m3wkMe4RS6It2VmOxgCW2l+Xqofqx
	mk9S/NeeJFwBjqdXtPWZtxnnFs2s1F2j4bi29n8m2g2dstJlEztaqo/4gNtMXVR/j1ImWnZGYxDGF
	BJlqMC2YhZ8zq7McVigff87IPZivADkqIJ01/qLEBrsWrdBUZxIeAHOCrdgfJlGTs4K5Sz+9VSf5Y
	x1iToff5yVJeJcJUckV1yTCNDE95Dme9TZZaFyQkW45nyM22L7W5XvqaVWKo2bCA/9U4py6ZRcfO+
	nJ7sperg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJsH5-0000000D8n1-3eNk;
	Mon, 04 May 2026 12:19:48 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJsH2-0000000D8mI-3dKK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 12:19:46 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-488940ccfa6so170805e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 May 2026 05:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777897183; x=1778501983; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PZFwKQCzFDeKBEEx0s8dTkXKr01dndAPiIRslPFEQHw=;
        b=q1uNZDKiffcdRKo/rH4pOYqkGBeLshENPhYwG5tdsLmARcqjbRe6kahIhTgBZG7YSI
         ZSXeZ5G8WLXleI/bH0ZnqdJTJbNgGH/8m7/EGXBdhC5e4/2wVfh8Zw+/dJl4oBG9KRI7
         Yx0WgbPQ76oW2M2IOCfAygMViNSY0Lw/uc/R9U6qS1gjMOzi8djxY5fuw8c0u9OTzcXc
         dxlbvjagOm+hJZvD9zzG3qeH21wFd3b6PFkW6nNsT3U12p8cxnYLZpdRwc+MwlW2T/Bh
         cmXMhdafpZ64tQ1iv0iOOHlbFzOX7t94AvvSGkwxZxJva8PPFYi+dnrBrSKRYOVBv0fd
         77Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777897183; x=1778501983;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PZFwKQCzFDeKBEEx0s8dTkXKr01dndAPiIRslPFEQHw=;
        b=qnnD8JvC1gjU72xOlNohSI1YJR4oGIzhORMcJMej8BHPQsIroKvvzZi1WDuWaVBXmb
         tfJzJdc/pAB9NBXLLp50DSBKroZZea7i42P8e4W6Os1xXVDDVUlzugzQ3YIySw5VbLoo
         2dMOmVkyrD9vniOvj2EZGeMHDwO5z47eQZaY10lXETodbDPTyLN0CVKsPzIaYz29jRj+
         6SL2JpxL9boJQsW27ULvc9NQn5hiLG2K4UrSRE5h2KPvn6jbXgE6Xv7aIkxtVkbmwkpD
         WMQAjGUN6L6kNJj1Yxr3xdO3c73sYmsOhuPGe3EgqOmaGr7VXEMjJolnl+qqPbO1WclX
         wxWw==
X-Gm-Message-State: AOJu0YyB4oFeZOuf5tNpU2DwUOM/nd6tceljoDxUDlpU8k7f9VMuv60+
	GGIlkqsCZDARk+LY06MwaxE1eP05x+7CkKUzZMTs4e+Kmd2Y3ZrTTPMLp8tYnkWCeQ==
X-Gm-Gg: AeBDieuFvdHvd8DL56E3A+E0TAjY48ScE7E1iCRVif/YsRCdY1vEgA9/NAanb/I161O
	yhyUQddRG0tpc10qu0nOS4M2T9MY3h4Q4+UWs6FbmdJy36N84r8vZsGHpxEaX/qUpPRv3Bjd/v6
	W6KLso1tYITABjHqyPpQ0FuJCKEZZm+JXw4GcnwkfAeK5+Z3WoxgDFbUSm9RXZcrIfvEzGvF2MU
	OGaTPj6SiLFlZs1eP9yotKxW/Fjge5idYT55g7Pgp9T/oJpGgiCJhPr2z8YKFXIEkTTCltMp0BW
	HO2/VcjpKjcgHlglf/ac/aytL0Q2TklhjivUKMWobu+9MfhvgO7MQOaG+3Ejki0ZUwNpvdMmENU
	mYWWnb2TCYj6CUuCUGE4Vrd6nfYkJdRHw2hXalX6FnWkOsuOnbLeCDdllehgtLLWwHQIup65Bae
	UQG4oyYleLMubi8rcsWeyimYF1H0rtk6U3qW9qzA8qpXSUvqdVtmRR2bsh+WaMF96tsfvcvmJC3
	wt/Vg==
X-Received: by 2002:a05:600c:6089:b0:488:960f:60b8 with SMTP id 5b1f17b1804b1-48a9852d054mr1083545e9.6.1777897182533;
        Mon, 04 May 2026 05:19:42 -0700 (PDT)
Received: from google.com (8.181.38.34.bc.googleusercontent.com. [34.38.181.8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8fea7de6sm78783785e9.12.2026.05.04.05.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 05:19:41 -0700 (PDT)
Date: Mon, 4 May 2026 12:19:37 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jean-philippe@linaro.org,
	mark.rutland@arm.com, qperret@google.com, tabba@google.com,
	vdonnefort@google.com, sebastianene@google.com, keirf@google.com
Subject: Re: [PATCH v6 06/25] iommu/io-pgtable-arm: Rework to use the
 iommu-pages API
Message-ID: <afiO2WL4ILGfmUui@google.com>
References: <20260501111928.259252-1-smostafa@google.com>
 <20260501111928.259252-7-smostafa@google.com>
 <20260501122424.GA6912@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260501122424.GA6912@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_051944_945109_4E96EB26 
X-CRM114-Status: GOOD (  35.80  )
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

On Fri, May 01, 2026 at 09:24:24AM -0300, Jason Gunthorpe wrote:
> On Fri, May 01, 2026 at 11:19:08AM +0000, Mostafa Saleh wrote:
> > To prepare for supporting io-pgtable-arm in the pKVM hypervisor,
> > we need to abstract away standard kernel allocations, frees, virt/phys
> > conversions, and DMA API mapping.
> > 
> > This patch introduces a set of generic wrappers in iommu-pages.h:
> > - iommu_alloc_data
> > - iommu_free_data
> > - iommu_virt_to_phys
> > - iommu_phys_to_virt
> > - iommu_pages_dma_map
> > - iommu_pages_dma_mapping_error
> > - iommu_pages_dma_unmap
> 
> Wah? This has nothing to do with iommu pages? This just leaking
> everything iommu pages abstracted out :(
> 
> When I said to use iommu-pages, I meant to use the existing API, not a
> completely different one.
> 
> From an iommu-pages perspective the issue is this code open codes
> dma_map_single()/etc instead of using the API surface
> iommu_pages_start_incoherent()
> 
> This is annoying to fix beacuse the external allocator messes it up,
> but I think with some #ifdef you can probably fix it up.
> 
> So.. I suggest you update it to use the iommu_pages API, #ifdef out
> the allocator so the pkvm pkvm doesn't need to deal with it. Then
> compile a special iommu-pages for the pkvm side presenting the same
> API.

I see, we still need to leave the DMA-API calls for the custom config,
as I am not sure if it can use pages not backed by the vmemmap, I
pushed that into a separate function so it’s easily compiled out.

Without this patch, now it looks like:

diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index 0208e5897c29..1583b9916b09 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -248,26 +248,15 @@ static dma_addr_t __arm_lpae_dma_addr(void *pages)
 	return (dma_addr_t)virt_to_phys(pages);
 }

-static void *__arm_lpae_alloc_pages(size_t size, gfp_t gfp,
-				    struct io_pgtable_cfg *cfg,
-				    void *cookie)
+static void *__arm_lpae_cfg_alloc(size_t size, gfp_t gfp,
+				  struct io_pgtable_cfg *cfg,
+				  void *cookie)
 {
 	struct device *dev = cfg->iommu_dev;
-	size_t alloc_size;
 	dma_addr_t dma;
 	void *pages;

-	/*
-	 * For very small starting-level translation tables the HW requires a
-	 * minimum alignment of at least 64 to cover all cases.
-	 */
-	alloc_size = max(size, 64);
-	if (cfg->alloc)
-		pages = cfg->alloc(cookie, alloc_size, gfp);
-	else
-		pages = iommu_alloc_pages_node_sz(dev_to_node(dev), gfp,
-						  alloc_size);
-
+	pages = cfg->alloc(cookie, size, gfp);
 	if (!pages)
 		return NULL;

@@ -289,26 +278,67 @@ static void *__arm_lpae_alloc_pages(size_t size, gfp_t gfp,
 out_unmap:
 	dev_err(dev, "Cannot accommodate DMA translation for IOMMU page tables\n");
 	dma_unmap_single(dev, dma, size, DMA_TO_DEVICE);
-
 out_free:
-	if (cfg->free)
-		cfg->free(cookie, pages, size);
-	else
-		iommu_free_pages(pages);
-
+	cfg->free(cookie, pages, size);
 	return NULL;
 }

-static void __arm_lpae_free_pages(void *pages, size_t size,
-				  struct io_pgtable_cfg *cfg,
-				  void *cookie)
+static void __arm_lpae_cfg_free(void *pages, size_t size,
+				struct io_pgtable_cfg *cfg,
+				void *cookie)
 {
 	if (!cfg->coherent_walk)
 		dma_unmap_single(cfg->iommu_dev, __arm_lpae_dma_addr(pages),
 				 size, DMA_TO_DEVICE);

-	if (cfg->free)
-		cfg->free(cookie, pages, size);
+	cfg->free(cookie, pages, size);
+}
+
+static void *__arm_lpae_alloc_pages(size_t size, gfp_t gfp,
+				    struct io_pgtable_cfg *cfg,
+				    void *cookie)
+{
+	struct device *dev = cfg->iommu_dev;
+	size_t alloc_size;
+	void *pages;
+
+	/*
+	 * For very small starting-level translation tables the HW requires a
+	 * minimum alignment of at least 64 to cover all cases.
+	 */
+	alloc_size = max(size, 64);
+	if (cfg->alloc)
+		return __arm_lpae_cfg_alloc(alloc_size, gfp, cfg, cookie);
+
+	pages = iommu_alloc_pages_node_sz(dev_to_node(dev), gfp, alloc_size);
+	if (!pages)
+		return NULL;
+
+	if (!cfg->coherent_walk) {
+		int ret = iommu_pages_start_incoherent(pages, dev);
+
+		if (ret) {
+			if (ret == -EOPNOTSUPP)
+				dev_err(dev, "Cannot accommodate DMA translation for IOMMU page tables\n");
+			iommu_free_pages(pages);
+			return NULL;
+		}
+	}
+
+	return pages;
+}
+
+static void __arm_lpae_free_pages(void *pages, size_t size,
+				  struct io_pgtable_cfg *cfg,
+				  void *cookie)
+{
+	if (cfg->free) {
+		__arm_lpae_cfg_free(pages, size, cfg, cookie);
+		return;
+	}
+
+	if (!cfg->coherent_walk)
+		iommu_pages_free_incoherent(pages, cfg->iommu_dev);
 	else
 		iommu_free_pages(pages);
 }


Thanks,
Mostafa

> 
> You should have a pkvm shim header that provides
> kmalloc/kfree/virt_to_phys in the normal way and just #include that in
> io-pgtable when doing a pkvm build instead of hacking up all the code.

Ok, I can do that in another change, but I believe it's better to
change the usage in this file to arm_lpae_*(virt_to_phys...) so it's
clear which parts are intended for that.

Thanks,
Mostafa

> 
> Jason

