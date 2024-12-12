Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61507E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 18:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZW1+nydU55G8nQ9hrqIcRZ7rSjcAUC8BJY9QSeiwFSI=; b=uERgbmCMWar4Euolz6LY2cf1eH
	yRcRVH4G2oJ96siH1FkLWcDQCFpyhNuW+XEEKpJT6OLH7gIPEvhklUIXVOIXG9wM/o1qI/0jbg5th
	h6zKOxc/iQW3JcLerbqM0SDj1wK1MfAPRi/Dk5NHrCrbAGXPfNYMMKQ88JREQaJSOLGnwRm+sJ78a
	J6H0mQN7s6KXtOXUFC3Zn7EDnb2rgxK5TLyoQtCaME4n2lM5neKZJTyoUwpNM4jkPcWNqEJPtxTJF
	Cj4aU41oi/CgeAuH6zxZn4NWzDByOZjttLnPt3rqPh5INOXzKB95ZSVtiZFCTIh+D3jByEjfsOvAt
	Ve7z3v2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLnsS-00000001Piu-00gb;
	Thu, 12 Dec 2024 18:25:32 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLnYx-00000001JhX-2HuL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 18:05:24 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-4359eb032c9so7198005e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 10:05:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734026721; x=1734631521; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZW1+nydU55G8nQ9hrqIcRZ7rSjcAUC8BJY9QSeiwFSI=;
        b=0+PUhYBrXMQfTdrkYJjCrneOoKlyckA5kYQp2/ytrdU2CkHfKqq0GQ5mq1aMR3yQNJ
         IMGP8n9paIXc+rLxZDbqKQ/Bq01UVG62RU8C5n9URsjLQ/uoqoDe1m2LWvFGj3/LirZb
         NYtJQgWcM2GvlG8rRTLtdwYtIccdCvI06Xp/V1tKDidDogXr+Q+4ZWmuju/xGClRxqC6
         44UiAwKPNt3H+QK65t7myFFrgpImcieYPvgvCvQnk4yeSCyZ1be9QkepcL7arS7cq67J
         +PKoKKzDmTrBtHRb/SOZjdldcg2X0F+6bA8aDhax9U20PBsKYEXB4eyqIzu+hsZpdFQc
         XuOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734026721; x=1734631521;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZW1+nydU55G8nQ9hrqIcRZ7rSjcAUC8BJY9QSeiwFSI=;
        b=H62RaBvzN9GGfzzb1FwzZgWwf63BOEDZS2lgR3zgdHthu//Rh2YBUNbrSQmFIeIopm
         sprf/re4vzIutZadYVzA6GAkfnXIITh/+8sc/lBdgNIQZ6kLF8qDP5QlyvrP84uWfPJP
         ZlOyG3OZ5Pby6jA2nFP43pa7bXGfZHc80HY+94yHLcUYnuYz9cf45msAAnAiuIEmKB4m
         AcUc+d1W1pD6buvZVH3YeWYUZbOYy/Zmj8OED/6lUNrAooKPG+w0FjdCX2cu0ZqrNehy
         X/CFYXWgjYyPePsVqNqY4yVLeMohZEc0iamXyyD3WKRGaq4U3JRL98Dz3yogPBLyC7hK
         FeVw==
X-Forwarded-Encrypted: i=1; AJvYcCUEc3nXej7Qvpd9YP+ej78p4ihKr8J0A3GN/uPdtvADPrA5msefr178nwAM0dgeh6jvfC/75b2IDdxI8Wm1rY9G@lists.infradead.org
X-Gm-Message-State: AOJu0YxH5AO3Q1xaroNSEEXzg/VQfhKfvarHlrx3+gEnJ6vUmsyRnnzL
	UsFUJ2KEN3RR2/0kS8GI/dp4vAOJ8zG+zEgnRem6RjusUo7m78CEb6yJemXX0e+3W+eCyEVOMxE
	2OnFf31CPIQ==
X-Google-Smtp-Source: AGHT+IF/eVrE/BNFHjZA31UXBb9BGDdvQQjzrDNU0uCStoSMr927atSRKA4GQ6BWli6UKC37YTy5oYGnkZ5VOA==
X-Received: from wmpl36.prod.google.com ([2002:a05:600c:8a4:b0:434:f0d4:cbaf])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:19ca:b0:434:a75b:5f59 with SMTP id 5b1f17b1804b1-43622823a73mr44642205e9.3.1734026721375;
 Thu, 12 Dec 2024 10:05:21 -0800 (PST)
Date: Thu, 12 Dec 2024 18:03:42 +0000
In-Reply-To: <20241212180423.1578358-1-smostafa@google.com>
Mime-Version: 1.0
References: <20241212180423.1578358-1-smostafa@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241212180423.1578358-19-smostafa@google.com>
Subject: [RFC PATCH v2 18/58] KVM: arm64: iommu: Add map/unmap() operations
From: Mostafa Saleh <smostafa@google.com>
To: iommu@lists.linux.dev, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, robdclark@gmail.com, joro@8bytes.org, 
	robin.murphy@arm.com, jean-philippe@linaro.org, jgg@ziepe.ca, 
	nicolinc@nvidia.com, vdonnefort@google.com, qperret@google.com, 
	tabba@google.com, danielmentz@google.com, tzukui@google.com, 
	Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_100523_586214_50BEF2DC 
X-CRM114-Status: GOOD (  18.89  )
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

Handle map(), unmap() and iova_to_phys() hypercalls.

In addition to map/unmap, the hypervisor has to ensure that all
mapped pages are tracked, so be before each map()
__pkvm_host_use_dma() would be called to ensure that.

Similarly, on unmap() we need to decrement the refcount using
__pkvm_host_unuse_dma().

However, doing this in standard way as mentioned in the comments is
challenging, so we leave that to the driver.

Also, the hypervisor only guarantees that there are no races
between alloc/free domain operations using the domain refcount to
avoid using extra locks.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 arch/arm64/kvm/hyp/include/nvhe/iommu.h |  7 +++
 arch/arm64/kvm/hyp/nvhe/iommu/iommu.c   | 80 ++++++++++++++++++++++++-
 2 files changed, 84 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/hyp/include/nvhe/iommu.h b/arch/arm64/kvm/hyp/include/nvhe/iommu.h
index d6d7447fbac8..17f24a8eb1b9 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/iommu.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/iommu.h
@@ -40,6 +40,13 @@ struct kvm_iommu_ops {
 			  u32 endpoint_id, u32 pasid, u32 pasid_bits);
 	int (*detach_dev)(struct kvm_hyp_iommu *iommu, struct kvm_hyp_iommu_domain *domain,
 			  u32 endpoint_id, u32 pasid);
+	int (*map_pages)(struct kvm_hyp_iommu_domain *domain, unsigned long iova,
+			 phys_addr_t paddr, size_t pgsize,
+			 size_t pgcount, int prot, size_t *total_mapped);
+	size_t (*unmap_pages)(struct kvm_hyp_iommu_domain *domain, unsigned long iova,
+			      size_t pgsize, size_t pgcount);
+	phys_addr_t (*iova_to_phys)(struct kvm_hyp_iommu_domain *domain, unsigned long iova);
+
 };
 
 int kvm_iommu_init(void);
diff --git a/arch/arm64/kvm/hyp/nvhe/iommu/iommu.c b/arch/arm64/kvm/hyp/nvhe/iommu/iommu.c
index df2dbe4c0121..83321cc5f466 100644
--- a/arch/arm64/kvm/hyp/nvhe/iommu/iommu.c
+++ b/arch/arm64/kvm/hyp/nvhe/iommu/iommu.c
@@ -263,22 +263,96 @@ int kvm_iommu_detach_dev(pkvm_handle_t iommu_id, pkvm_handle_t domain_id,
 	return ret;
 }
 
+#define IOMMU_PROT_MASK (IOMMU_READ | IOMMU_WRITE | IOMMU_CACHE |\
+			 IOMMU_NOEXEC | IOMMU_MMIO | IOMMU_PRIV)
+
 size_t kvm_iommu_map_pages(pkvm_handle_t domain_id,
 			   unsigned long iova, phys_addr_t paddr, size_t pgsize,
 			   size_t pgcount, int prot)
 {
-	return 0;
+	size_t size;
+	int ret;
+	size_t total_mapped = 0;
+	struct kvm_hyp_iommu_domain *domain;
+
+	if (prot & ~IOMMU_PROT_MASK)
+		return 0;
+
+	if (__builtin_mul_overflow(pgsize, pgcount, &size) ||
+	    iova + size < iova || paddr + size < paddr)
+		return 0;
+
+	domain = handle_to_domain(domain_id);
+	if (!domain || domain_get(domain))
+		return 0;
+
+	ret = __pkvm_host_use_dma(paddr, size);
+	if (ret)
+		return 0;
+
+	kvm_iommu_ops->map_pages(domain, iova, paddr, pgsize, pgcount, prot, &total_mapped);
+
+	pgcount -= total_mapped / pgsize;
+	/*
+	 * unuse the bits that haven't been mapped yet. The host calls back
+	 * either to continue mapping, or to unmap and unuse what's been done
+	 * so far.
+	 */
+	if (pgcount)
+		__pkvm_host_unuse_dma(paddr + total_mapped, pgcount * pgsize);
+
+	domain_put(domain);
+	return total_mapped;
 }
 
 size_t kvm_iommu_unmap_pages(pkvm_handle_t domain_id, unsigned long iova,
 			     size_t pgsize, size_t pgcount)
 {
-	return 0;
+	size_t size;
+	size_t unmapped;
+	struct kvm_hyp_iommu_domain *domain;
+
+	if (!pgsize || !pgcount)
+		return 0;
+
+	if (__builtin_mul_overflow(pgsize, pgcount, &size) ||
+	    iova + size < iova)
+		return 0;
+
+	domain = handle_to_domain(domain_id);
+	if (!domain || domain_get(domain))
+		return 0;
+
+	/*
+	 * Unlike map, the common code doesn't call the __pkvm_host_unuse_dma,
+	 * because this means that we need either walk the table using iova_to_phys
+	 * similar to VFIO then unmap and call this function, or unmap leaf (page or
+	 * block) at a time, where both might be suboptimal.
+	 * For some IOMMU, we can do 2 walks where one only invalidate the pages
+	 * and the other decrement the refcount.
+	 * As, semantics for this might differ between IOMMUs and it's hard to
+	 * standardized, we leave that to the driver.
+	 */
+	unmapped = kvm_iommu_ops->unmap_pages(domain, iova, pgsize,
+						pgcount);
+
+	domain_put(domain);
+	return unmapped;
 }
 
 phys_addr_t kvm_iommu_iova_to_phys(pkvm_handle_t domain_id, unsigned long iova)
 {
-	return 0;
+	phys_addr_t phys = 0;
+	struct kvm_hyp_iommu_domain *domain;
+
+	domain = handle_to_domain( domain_id);
+
+	if (!domain || domain_get(domain))
+		return 0;
+
+	phys = kvm_iommu_ops->iova_to_phys(domain, iova);
+	domain_put(domain);
+	return phys;
 }
 
 /* Must be called from the IOMMU driver per IOMMU */
-- 
2.47.0.338.g60cca15819-goog


