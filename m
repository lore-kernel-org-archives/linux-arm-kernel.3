Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D572FE77180
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 18:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oAsQTCVq1k5cQX4NrU1R+91jvUrFkU1qGqPwmUapmCQ=; b=kBvXF1SBeWxvUgkj2oVRjxN0Zu
	jzhpqPqXiqVhzWtMRVQWfsqrtC2ejkVOOP2/zpSJRPovH93OX5Y8VcnFNop7wyubcPR1sxDH+QyUB
	tk9ChqrVvvmxX7/DxNlz4Wyv8sMAaZCRcppU4DLVrw70whoPf/p1NioG9OQRIHGUPRobKBxueawP6
	1VmhY+r3B8JWGjcjSItuoMsEExm5qhVH3HnKsMM1ybSaRgC9R+2TONOGE14ROA9NjsPQ5uJpAum6q
	H1e0YuoOlxFNo034G4+pUG06HP2bYU4Xin/aimrHChHPqW+blh/WcJHkuZN9Pwa6s6F0l3JmHicn6
	n/d4w3Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLntU-00000001Pwq-2d6d;
	Thu, 12 Dec 2024 18:26:36 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLnYz-00000001Ji9-0weK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 18:05:26 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-3862a49fbdaso430752f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 10:05:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734026723; x=1734631523; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=oAsQTCVq1k5cQX4NrU1R+91jvUrFkU1qGqPwmUapmCQ=;
        b=4rjWgQpGh3gll6N1NCFR3jFIQquRaOpREf7LLfJPTNuAthN6dZLPgFMNH/apHO6sbW
         QbBTRCity4sU2LlzSlDVhZBx6SJaC2DIP+rxSuZhNwE/ZazGAdSItlWu577v+FwyXx6K
         vsNSAdI5+xvehLqGnlZkmFWJlWMz6PQtyXbVD5zgTonRMB8O3dbWuuQTF8b9HtF0987V
         X/r+f+jlegmyYVqecQH2ueMSEeLGe4nUiKyqjUiCQERXFjFsAGHJhcBjPwYPs9KwhQUT
         lP1s2DfHr0ZcQuc502DUhj9sfQPgGoylpzuSMKuCcX03g2/o5+1cLAFjUav4/U3nO95x
         8t+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734026723; x=1734631523;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oAsQTCVq1k5cQX4NrU1R+91jvUrFkU1qGqPwmUapmCQ=;
        b=rsxv/C5kn9lIiE8u5MmOZdPsgWKSfSB4v70MbnhRKGrEm3g8fmWcBrNWFtwtHqTN/N
         yjfwv6yNNoPsNyr89SqjOCFrHMmg8OnPm21yfYITDs/GwllSJaSYaLIDoOWzb5TzshGC
         pBRPwd+Nqe2FgFaoZ+dh30niMuhpApOqPLhyo53NyuaNkDZ6ic7iwVzYq5v/CmIM8EbO
         OS5rlUdsEhr1MRhmpVxMZCO3P7Hj8S0F/n33z6uS2e55Um5Sevd5jssKQjYmkj73WoGL
         IdMb5De/Lo3xZ9wIjofoNzLTaHeeH5Tl+zcooXay6pY77dNNqqsl3jLnXXuAzQS+JJ00
         y9KA==
X-Forwarded-Encrypted: i=1; AJvYcCWSm7wdQxqFKtrC/IryvGrnZW+XoWBItKiCJsudIZclLNA24xISMyoIz8leDF4wYaqQWvmPi9ivSNtXltUo/ubH@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6YUDZqsKZUHnLF6needaO5oXf2xJ82h8t90c1jhEToghaFbfB
	/HJnu9h4rbTkvPqm11bvGQDyMRploWBw0ZiXRyyxLNyJPtxFjjaTdaPc8jXwhDsCn0vRUZtaQKy
	JBmohaBAcdw==
X-Google-Smtp-Source: AGHT+IEK5984jXibFupy1tKIQcqayv18x11IpqLmg4k+VIF9btcstf/EJxCVy5RbSEtdnliqdjvouvMqk5ypZg==
X-Received: from wmej18.prod.google.com ([2002:a05:600c:42d2:b0:434:a1af:5d39])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:59ad:0:b0:385:fb2c:6021 with SMTP id ffacd0b85a97d-3864ce986camr4566052f8f.39.1734026723319;
 Thu, 12 Dec 2024 10:05:23 -0800 (PST)
Date: Thu, 12 Dec 2024 18:03:43 +0000
In-Reply-To: <20241212180423.1578358-1-smostafa@google.com>
Mime-Version: 1.0
References: <20241212180423.1578358-1-smostafa@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241212180423.1578358-20-smostafa@google.com>
Subject: [RFC PATCH v2 19/58] KVM: arm64: iommu: support iommu_iotlb_gather
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
X-CRM114-CacheID: sfid-20241212_100525_261247_9576983E 
X-CRM114-Status: GOOD (  18.17  )
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

To improve unmap performance, we can batch TLB invalidations at the
end of the unmap similarly to what the kernel.

We use the same data structure as the kernel and most of the same
code.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 arch/arm64/kvm/hyp/include/nvhe/iommu.h | 11 +++++++++--
 arch/arm64/kvm/hyp/nvhe/iommu/iommu.c   | 22 +++++++++++++++++++++-
 include/linux/iommu.h                   | 24 +++++++++++++-----------
 3 files changed, 43 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/kvm/hyp/include/nvhe/iommu.h b/arch/arm64/kvm/hyp/include/nvhe/iommu.h
index 17f24a8eb1b9..06d12b35fa3e 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/iommu.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/iommu.h
@@ -44,15 +44,22 @@ struct kvm_iommu_ops {
 			 phys_addr_t paddr, size_t pgsize,
 			 size_t pgcount, int prot, size_t *total_mapped);
 	size_t (*unmap_pages)(struct kvm_hyp_iommu_domain *domain, unsigned long iova,
-			      size_t pgsize, size_t pgcount);
+			      size_t pgsize, size_t pgcount,
+			      struct iommu_iotlb_gather *gather);
 	phys_addr_t (*iova_to_phys)(struct kvm_hyp_iommu_domain *domain, unsigned long iova);
-
+	void (*iotlb_sync)(struct kvm_hyp_iommu_domain *domain,
+			   struct iommu_iotlb_gather *gather);
 };
 
 int kvm_iommu_init(void);
 
 int kvm_iommu_init_device(struct kvm_hyp_iommu *iommu);
 
+void kvm_iommu_iotlb_gather_add_page(struct kvm_hyp_iommu_domain *domain,
+				     struct iommu_iotlb_gather *gather,
+				     unsigned long iova,
+				     size_t size);
+
 static inline hyp_spinlock_t *kvm_iommu_get_lock(struct kvm_hyp_iommu *iommu)
 {
 	/* See struct kvm_hyp_iommu */
diff --git a/arch/arm64/kvm/hyp/nvhe/iommu/iommu.c b/arch/arm64/kvm/hyp/nvhe/iommu/iommu.c
index 83321cc5f466..a6e0f3634756 100644
--- a/arch/arm64/kvm/hyp/nvhe/iommu/iommu.c
+++ b/arch/arm64/kvm/hyp/nvhe/iommu/iommu.c
@@ -305,12 +305,30 @@ size_t kvm_iommu_map_pages(pkvm_handle_t domain_id,
 	return total_mapped;
 }
 
+static inline void kvm_iommu_iotlb_sync(struct kvm_hyp_iommu_domain *domain,
+					struct iommu_iotlb_gather *iotlb_gather)
+{
+	if (kvm_iommu_ops->iotlb_sync)
+		kvm_iommu_ops->iotlb_sync(domain, iotlb_gather);
+
+	iommu_iotlb_gather_init(iotlb_gather);
+}
+
+void kvm_iommu_iotlb_gather_add_page(struct kvm_hyp_iommu_domain *domain,
+				     struct iommu_iotlb_gather *gather,
+				     unsigned long iova,
+				     size_t size)
+{
+	_iommu_iotlb_add_page(domain, gather, iova, size, kvm_iommu_iotlb_sync);
+}
+
 size_t kvm_iommu_unmap_pages(pkvm_handle_t domain_id, unsigned long iova,
 			     size_t pgsize, size_t pgcount)
 {
 	size_t size;
 	size_t unmapped;
 	struct kvm_hyp_iommu_domain *domain;
+	struct iommu_iotlb_gather iotlb_gather;
 
 	if (!pgsize || !pgcount)
 		return 0;
@@ -323,6 +341,7 @@ size_t kvm_iommu_unmap_pages(pkvm_handle_t domain_id, unsigned long iova,
 	if (!domain || domain_get(domain))
 		return 0;
 
+	iommu_iotlb_gather_init(&iotlb_gather);
 	/*
 	 * Unlike map, the common code doesn't call the __pkvm_host_unuse_dma,
 	 * because this means that we need either walk the table using iova_to_phys
@@ -334,7 +353,8 @@ size_t kvm_iommu_unmap_pages(pkvm_handle_t domain_id, unsigned long iova,
 	 * standardized, we leave that to the driver.
 	 */
 	unmapped = kvm_iommu_ops->unmap_pages(domain, iova, pgsize,
-						pgcount);
+						pgcount, &iotlb_gather);
+	kvm_iommu_iotlb_sync(domain, &iotlb_gather);
 
 	domain_put(domain);
 	return unmapped;
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index bd722f473635..c75877044185 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -911,6 +911,18 @@ static inline void iommu_iotlb_gather_add_range(struct iommu_iotlb_gather *gathe
 		gather->end = end;
 }
 
+/*
+ * If the new page is disjoint from the current range or is mapped at
+ * a different granularity, then sync the TLB so that the gather
+ * structure can be rewritten.
+ */
+#define _iommu_iotlb_add_page(domain, gather, iova, size, sync)		\
+	if (((gather)->pgsize && (gather)->pgsize != (size)) ||		\
+	    iommu_iotlb_gather_is_disjoint((gather), (iova), (size)))	\
+		sync((domain), (gather));				\
+	(gather)->pgsize = (size);					\
+	iommu_iotlb_gather_add_range((gather), (iova), (size))
+
 /**
  * iommu_iotlb_gather_add_page - Gather for page-based TLB invalidation
  * @domain: IOMMU domain to be invalidated
@@ -926,17 +938,7 @@ static inline void iommu_iotlb_gather_add_page(struct iommu_domain *domain,
 					       struct iommu_iotlb_gather *gather,
 					       unsigned long iova, size_t size)
 {
-	/*
-	 * If the new page is disjoint from the current range or is mapped at
-	 * a different granularity, then sync the TLB so that the gather
-	 * structure can be rewritten.
-	 */
-	if ((gather->pgsize && gather->pgsize != size) ||
-	    iommu_iotlb_gather_is_disjoint(gather, iova, size))
-		iommu_iotlb_sync(domain, gather);
-
-	gather->pgsize = size;
-	iommu_iotlb_gather_add_range(gather, iova, size);
+	_iommu_iotlb_add_page(domain, gather, iova, size, iommu_iotlb_sync);
 }
 
 static inline bool iommu_iotlb_gather_queued(struct iommu_iotlb_gather *gather)
-- 
2.47.0.338.g60cca15819-goog


