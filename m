Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2026D185C6
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 11:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:Mime-Version:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=h+PD5I1T9SWnu5gQJxf6wuZ/2pTtA653VoNBiXR/ZCw=; b=JL4ZiaXgVwRl1CzD8Yy2ABPmCw
	iFYbLYgBr0FWape0dJ6jx6k9KpYrReSgiFDmguTxq0JukiouiUx8LA7kr8rHcvcc7vxHI7Gcdb24l
	hCuDd0dj+8h9rWtIzHZASTPk1PU9hvStzGic9snOKWAknCJGYQCDT0viFcf3kyBg6OmOgKzKDuzCq
	OaE2W6veEaMtN8TiVtDhvTX4gVTG7DPvrfS9ZNN2IVubhtRFo/GZ7SaWbM5MWSeQbT6+CPzIyEJP4
	lMBZ4XICXctVNybsb4owAYGhPXiLXnWs+ZRzhzgulTfEBnwcshIULr4bEXZUoH4aWe3IInvPvLk1V
	0gLVjdEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdoLw-0000000GsMs-2s84;
	Thu, 08 Jan 2026 11:38:56 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdoLu-0000000GsLt-15BP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 11:38:55 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-47918084ac1so33853595e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Jan 2026 03:38:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767872331; x=1768477131; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=h+PD5I1T9SWnu5gQJxf6wuZ/2pTtA653VoNBiXR/ZCw=;
        b=t/CSF1YWyI15aMSoMC5+RldxoYoLFNp8FTNmOHmou0XSIzGfZoQNpucrfvwkbmKUxv
         moIi2Keir5hO3RZBOTKcjTdj/LWNxdwkfw6YelIIeB/uBCoGCkFmkHAnpDU7smLa1O7S
         4pHClL/6zU3+8MFfRp0BM+ZNZBLd1davxPEANUvyPX+RTNUeVTJO/6oBSih9eaOm8Rar
         Nc2wWhlECbm5e4r6mKnOZVzbxgHkVLpuDDS6F7ZHEPmBO+Dnp5JThOjwJ+tA8nBVt3s4
         01yQq84c/xoT52m91ZFmQyTm5avxuB38XJ3do2zewYwmbNseCzgT9+LBsdUmjhLuzHLS
         U4Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767872331; x=1768477131;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h+PD5I1T9SWnu5gQJxf6wuZ/2pTtA653VoNBiXR/ZCw=;
        b=dmnOKa6wbstob+Six1S7CEo5mGVIUBFwZ6iCd+G/DZ7/6O5I1bOUMZvLvINU+H9ys6
         UMcUZyUCxlCHtk4ixrL+AbHssrlcq7IMjSVIGfX/8Rwso89XWzL3NleXm1mD1MYC1R5h
         aV7iZgmpoBAXisMP9PgWyDWyuinhpc3sIiFxye0s84mGIUC175/caVJRIO7Q4KVGe9Ej
         0nMrug3aSSLRlLzLskbI/F/OeTTN1ngctVgVMiLTRN4xaKih516JESThkjjqTa2KIKn0
         BRwotvzmFoadTPIMAScjDR+LTQT/KxwF9ahukZslxYvPhkj1VStXC6uHT6E302NMk02I
         UvHg==
X-Forwarded-Encrypted: i=1; AJvYcCU6D3x+PZIKFuV9dtnqVBTIVAruZD8x42XIgp1z1yi8n2XrM/hdEKzzNSeSs9Zr3PDRoBwCMsSrP9ESHbnOiM8n@lists.infradead.org
X-Gm-Message-State: AOJu0YyOF21PuHyY8HPJYZuatnXZjHqh8wgB7dg8PE6tMT4LYHE2xKSs
	DHfknSuMOaMyuf4uyvH0B3QrvHg/8qhZlB9wxNEEt2PdRPeCBJhkYH+YdxPZJ5mzXmd/SS1ixR/
	3h05bi+l1lR9HUA==
X-Google-Smtp-Source: AGHT+IGr16gVlj0tGy6ZbPOm8QxP8OJb1ECy1Lx+gySYdlsvpdFscKv8yCc/e9t5dZ5OMMD/GUP08duGuCyGKw==
X-Received: from wrbfs2.prod.google.com ([2002:a05:6000:25c2:b0:430:f5a3:57c8])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4e51:b0:477:7af8:c8ad with SMTP id 5b1f17b1804b1-47d84b39850mr75537675e9.31.1767872331602;
 Thu, 08 Jan 2026 03:38:51 -0800 (PST)
Date: Thu,  8 Jan 2026 11:38:46 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.52.0.351.gbe84eed79e-goog
Message-ID: <20260108113846.56179-1-smostafa@google.com>
Subject: [PATCH] iommu/io-pgtable-arm: Drop DMA API usage for CMOs
From: Mostafa Saleh <smostafa@google.com>
To: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Cc: robin.murphy@arm.com, will@kernel.org, joro@8bytes.org, 
	Mostafa Saleh <smostafa@google.com>, Jason Gunthorpe <jgg@ziepe.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_033854_316735_800978F5 
X-CRM114-Status: GOOD (  20.60  )
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

As part of the KVM SMMUv3 series[1], we are trying to factor out
the kernel specific code from io-pgtable-arm so it can also compile
for the hypervisor.

Jason pointed out that the DMA-API calls are not really needed [2].

Looking more into this. Initially, the io-pgtable API let drivers
do the CMOs using tlb::flush_pgtable() where drivers were using the
DMA API (map/unmap_single) only to do CMOs as the low-level cache
functions won=E2=80=99t be available for modules.

This was later moved to the core code [3], with possibility to
convert it to full blown DMA-API code if there was a use case.

However, no such use case appeared, and we can simplify the code
slightly by doing CMO directly instead of going through the DMA-API
functions just for CMOs.

Although HTTU is not used at the moment, leave the
arch_sync_dma_for_cpu() in __arm_lpae_free_pages() as this is not a
hot path.

Removing the DMA-API will also remove some extra checks ensuring that
the IOMMU can deal with physical addrs. we can add those check at
page table creation time (Something as use_dma_iommu/is_swiotlb_active
However, that seemed a little too much as Linux doesn't support such
topologies anyways.

[1] https://lore.kernel.org/linux-iommu/20251117184815.1027271-1-smostafa@g=
oogle.com/
[2] https://lore.kernel.org/linux-iommu/20251216005834.GC31492@ziepe.ca/
[3] https://lore.kernel.org/linux-iommu/7c5584d3efa61ee6b0b87efb72f24f32852=
aafb7.1438195011.git.robin.murphy@arm.com/

Suggested-by: Jason Gunthorpe <jgg@ziepe.ca>
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 drivers/iommu/io-pgtable-arm.c | 39 +++++++---------------------------
 1 file changed, 8 insertions(+), 31 deletions(-)

diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.=
c
index e6626004b323..0da9195155ec 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -15,7 +15,7 @@
 #include <linux/sizes.h>
 #include <linux/slab.h>
 #include <linux/types.h>
-#include <linux/dma-mapping.h>
+#include <linux/dma-map-ops.h>
=20
 #include <asm/barrier.h>
=20
@@ -254,7 +254,6 @@ static void *__arm_lpae_alloc_pages(size_t size, gfp_t =
gfp,
 {
 	struct device *dev =3D cfg->iommu_dev;
 	size_t alloc_size;
-	dma_addr_t dma;
 	void *pages;
=20
 	/*
@@ -271,32 +270,10 @@ static void *__arm_lpae_alloc_pages(size_t size, gfp_=
t gfp,
 	if (!pages)
 		return NULL;
=20
-	if (!cfg->coherent_walk) {
-		dma =3D dma_map_single(dev, pages, size, DMA_TO_DEVICE);
-		if (dma_mapping_error(dev, dma))
-			goto out_free;
-		/*
-		 * We depend on the IOMMU being able to work with any physical
-		 * address directly, so if the DMA layer suggests otherwise by
-		 * translating or truncating them, that bodes very badly...
-		 */
-		if (dma !=3D virt_to_phys(pages))
-			goto out_unmap;
-	}
-
+	if (!cfg->coherent_walk)
+		arch_sync_dma_for_device(__arm_lpae_dma_addr(pages), size,
+					 DMA_TO_DEVICE);
 	return pages;
-
-out_unmap:
-	dev_err(dev, "Cannot accommodate DMA translation for IOMMU page tables\n"=
);
-	dma_unmap_single(dev, dma, size, DMA_TO_DEVICE);
-
-out_free:
-	if (cfg->free)
-		cfg->free(cookie, pages, size);
-	else
-		iommu_free_pages(pages);
-
-	return NULL;
 }
=20
 static void __arm_lpae_free_pages(void *pages, size_t size,
@@ -304,8 +281,8 @@ static void __arm_lpae_free_pages(void *pages, size_t s=
ize,
 				  void *cookie)
 {
 	if (!cfg->coherent_walk)
-		dma_unmap_single(cfg->iommu_dev, __arm_lpae_dma_addr(pages),
-				 size, DMA_TO_DEVICE);
+		arch_sync_dma_for_cpu(__arm_lpae_dma_addr(pages),
+				      size, DMA_TO_DEVICE);
=20
 	if (cfg->free)
 		cfg->free(cookie, pages, size);
@@ -316,8 +293,8 @@ static void __arm_lpae_free_pages(void *pages, size_t s=
ize,
 static void __arm_lpae_sync_pte(arm_lpae_iopte *ptep, int num_entries,
 				struct io_pgtable_cfg *cfg)
 {
-	dma_sync_single_for_device(cfg->iommu_dev, __arm_lpae_dma_addr(ptep),
-				   sizeof(*ptep) * num_entries, DMA_TO_DEVICE);
+	arch_sync_dma_for_device(__arm_lpae_dma_addr(ptep),
+				 sizeof(*ptep) * num_entries, DMA_TO_DEVICE);
 }
=20
 static void __arm_lpae_clear_pte(arm_lpae_iopte *ptep, struct io_pgtable_c=
fg *cfg, int num_entries)
--=20
2.52.0.351.gbe84eed79e-goog


