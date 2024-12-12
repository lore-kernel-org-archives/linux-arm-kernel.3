Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56E28E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 18:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r96D7jtEo6iMT7XaPgJfnXzgjFVNWq31bg+JNNbd33c=; b=z8eh1awXZhFKZK4DnETrhLvIcS
	4vGwrnYmmrNqvugkFCp0VVmfwooRMySKFXoHodpxpLTyAB6ESBDiWqcgZ1UxudA+B1VywxLg5fvhO
	ekeixstSGZb//3XDsGZxvit4AXbV+2XeOYV/QEfjA3/2fdCcAL9j6FI/slADsB0ES8ZWycQSbvkIQ
	tuiARCB/zXgq6sp6yAJ87PvccdqGADpNqyKpxGTzQWkDSkl4M+/4oiXS/YC+4lKhi4dhtpOhaqV6p
	SdQdl5ao341jGQGEu8OGBwdSACgMvSBLvYLGWb/OMB18K7f3HyRukCeHjjmuv3TeEirpMtzEaFl6I
	CwWTIJ0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLnrP-00000001PRv-1VTa;
	Thu, 12 Dec 2024 18:24:27 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLnYu-00000001Jgz-3mEm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 18:05:21 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-4361f371908so8307665e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 10:05:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734026719; x=1734631519; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=r96D7jtEo6iMT7XaPgJfnXzgjFVNWq31bg+JNNbd33c=;
        b=cvCkbXBUe6b+g/03m6H26HcnitsRT5TkC1iZI9c5un2LChtlvefTMRuoFKoi9ugamz
         EC+LuBrC4J86y1Hn7UJRv1ktYHEjM9wsVM07zJid5pAcBPiUqBO5qeY354D+hjeUSatu
         Ayu6PpJrT2hrdub5ZW85GIjTI3IwxpOpPlydjJvwi06+mcyw/FPVKY6n7BJ0z4fxqsKb
         tfCqof33UEVfvcUCLnntD29oxPpLdkIU9al9ySVxbaVd2iVxy4sqBwjkwaHETxmssVBc
         /Xk7WeTku9XNl2MCOvm4ZSlkf8WwXzTRnA2NACmmVhHgGHQD9Irnw7t/BN0RDbBhR5y9
         Qj/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734026719; x=1734631519;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r96D7jtEo6iMT7XaPgJfnXzgjFVNWq31bg+JNNbd33c=;
        b=jrKfDcCfJgjUFy6rSkq7ImDOPLjOOTqpkUiQshHZpkPntSXD/YQmwwjWqKoeknvVHB
         qr1jDzxNKBJlzZnCLnISPEnQ2wH4+YYLOm+F+JWnVD+X2oxXyrqFqWWpSuWqYHBD/lp3
         TNlzLer/KLcf2v5Gbbs+5cGkBgWsJDTb5J9yC8FepC/dXDk/qMc3LLC2qFm2+eWSgy1/
         0lPsZuceDUXuJge8+dHPGYtq83vt5n1zrsS9DyQU2g63XcrSy29RE9EgogOvGeodkT9+
         3sgnckUO2n5uGK5U4z+STvJUHBdXFv1EJNCSM7pLk30zCZf21unxhVZfZj0/qpntWWtT
         2mHw==
X-Forwarded-Encrypted: i=1; AJvYcCUAkuOkJcOju69ol9oP0YMz92o/FihNNejwX8hlLyvypM/EBHVpcZdUU7Ayih3E0TFjHWw1QSlOUihH92879/XC@lists.infradead.org
X-Gm-Message-State: AOJu0YxMQEovUZnt+F6vh9/ixd6AIOiO/XBaBUReFhbNtI6XCKP6iZoc
	3Nu5KATuWIr+lzcwBKUH+q3Kb2dduGtEo2+0COGleOf/zCL+sKw4I2MWuDd9wmqyZ7JszpU9iIE
	mlvvwwW+ayg==
X-Google-Smtp-Source: AGHT+IHOlQVhqOBCLyKRJBicSu0YdgpRP9Z8cEsxdD6v5Zy8WYvPT3uz4gGoRc3GnnVzZTWZ+pU892qsZdg7uQ==
X-Received: from wmhj22.prod.google.com ([2002:a05:600c:3016:b0:434:fe74:1bd5])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3593:b0:435:294:f1c8 with SMTP id 5b1f17b1804b1-43622883637mr32346155e9.28.1734026719225;
 Thu, 12 Dec 2024 10:05:19 -0800 (PST)
Date: Thu, 12 Dec 2024 18:03:41 +0000
In-Reply-To: <20241212180423.1578358-1-smostafa@google.com>
Mime-Version: 1.0
References: <20241212180423.1578358-1-smostafa@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241212180423.1578358-18-smostafa@google.com>
Subject: [RFC PATCH v2 17/58] KVM: arm64: iommu: Add {attach, detach}_dev
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
X-CRM114-CacheID: sfid-20241212_100520_940454_B024D5D1 
X-CRM114-Status: GOOD (  18.77  )
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

Add attach/detach dev operations which are forwarded to the driver.

To avoid racing between alloc/free domain and attach/detach dev,
the refcount is used.

Although, as IOMMU attach/detach are per-IOMMU and would require
some sort of locking, nothing in the IOMMU core code need the lock
so delegate that to the driver to use locks when needed and the
hypervisor only guarantees no races between alloc/free domain.

Also, add a new function kvm_iommu_init_device() to initialise common
fields of the IOMMU struct, which is only the lock at the moment.
The IOMMU core code will need to use the lock next for power
management.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 arch/arm64/kvm/hyp/include/nvhe/iommu.h | 29 +++++++++++++
 arch/arm64/kvm/hyp/nvhe/iommu/iommu.c   | 56 ++++++++++++++++++++++++-
 include/kvm/iommu.h                     |  8 ++++
 3 files changed, 91 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/hyp/include/nvhe/iommu.h b/arch/arm64/kvm/hyp/include/nvhe/iommu.h
index 8f619f415d1f..d6d7447fbac8 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/iommu.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/iommu.h
@@ -35,10 +35,39 @@ struct kvm_iommu_ops {
 	int (*init)(void);
 	int (*alloc_domain)(struct kvm_hyp_iommu_domain *domain, int type);
 	void (*free_domain)(struct kvm_hyp_iommu_domain *domain);
+	struct kvm_hyp_iommu *(*get_iommu_by_id)(pkvm_handle_t iommu_id);
+	int (*attach_dev)(struct kvm_hyp_iommu *iommu, struct kvm_hyp_iommu_domain *domain,
+			  u32 endpoint_id, u32 pasid, u32 pasid_bits);
+	int (*detach_dev)(struct kvm_hyp_iommu *iommu, struct kvm_hyp_iommu_domain *domain,
+			  u32 endpoint_id, u32 pasid);
 };
 
 int kvm_iommu_init(void);
 
+int kvm_iommu_init_device(struct kvm_hyp_iommu *iommu);
+
+static inline hyp_spinlock_t *kvm_iommu_get_lock(struct kvm_hyp_iommu *iommu)
+{
+	/* See struct kvm_hyp_iommu */
+	BUILD_BUG_ON(sizeof(iommu->lock) != sizeof(hyp_spinlock_t));
+	return (hyp_spinlock_t *)(&iommu->lock);
+}
+
+static inline void kvm_iommu_lock_init(struct kvm_hyp_iommu *iommu)
+{
+	hyp_spin_lock_init(kvm_iommu_get_lock(iommu));
+}
+
+static inline void kvm_iommu_lock(struct kvm_hyp_iommu *iommu)
+{
+	hyp_spin_lock(kvm_iommu_get_lock(iommu));
+}
+
+static inline void kvm_iommu_unlock(struct kvm_hyp_iommu *iommu)
+{
+	hyp_spin_unlock(kvm_iommu_get_lock(iommu));
+}
+
 extern struct hyp_mgt_allocator_ops kvm_iommu_allocator_ops;
 
 #endif /* __ARM64_KVM_NVHE_IOMMU_H__ */
diff --git a/arch/arm64/kvm/hyp/nvhe/iommu/iommu.c b/arch/arm64/kvm/hyp/nvhe/iommu/iommu.c
index ba2aed52a74f..df2dbe4c0121 100644
--- a/arch/arm64/kvm/hyp/nvhe/iommu/iommu.c
+++ b/arch/arm64/kvm/hyp/nvhe/iommu/iommu.c
@@ -127,6 +127,19 @@ handle_to_domain(pkvm_handle_t domain_id)
 	return &domains[domain_id % KVM_IOMMU_DOMAINS_PER_PAGE];
 }
 
+static int domain_get(struct kvm_hyp_iommu_domain *domain)
+{
+	int old = atomic_fetch_inc_acquire(&domain->refs);
+
+	BUG_ON(!old || (old + 1 < 0));
+	return 0;
+}
+
+static void domain_put(struct kvm_hyp_iommu_domain *domain)
+{
+	BUG_ON(!atomic_dec_return_release(&domain->refs));
+}
+
 int kvm_iommu_init(void)
 {
 	int ret;
@@ -210,13 +223,44 @@ int kvm_iommu_free_domain(pkvm_handle_t domain_id)
 int kvm_iommu_attach_dev(pkvm_handle_t iommu_id, pkvm_handle_t domain_id,
 			 u32 endpoint_id, u32 pasid, u32 pasid_bits)
 {
-	return -ENODEV;
+	int ret;
+	struct kvm_hyp_iommu *iommu;
+	struct kvm_hyp_iommu_domain *domain;
+
+	iommu = kvm_iommu_ops->get_iommu_by_id(iommu_id);
+	if (!iommu)
+		return -EINVAL;
+
+	domain = handle_to_domain(domain_id);
+	if (!domain || domain_get(domain))
+		return -EINVAL;
+
+	ret = kvm_iommu_ops->attach_dev(iommu, domain, endpoint_id, pasid, pasid_bits);
+	if (ret)
+		domain_put(domain);
+	return ret;
 }
 
 int kvm_iommu_detach_dev(pkvm_handle_t iommu_id, pkvm_handle_t domain_id,
 			 u32 endpoint_id, u32 pasid)
 {
-	return -ENODEV;
+	int ret;
+	struct kvm_hyp_iommu *iommu;
+	struct kvm_hyp_iommu_domain *domain;
+
+	iommu = kvm_iommu_ops->get_iommu_by_id(iommu_id);
+	if (!iommu)
+		return -EINVAL;
+
+	domain = handle_to_domain(domain_id);
+	if (!domain || atomic_read(&domain->refs) <= 1)
+		return -EINVAL;
+
+	ret = kvm_iommu_ops->detach_dev(iommu, domain, endpoint_id, pasid);
+	if (ret)
+		return ret;
+	domain_put(domain);
+	return ret;
 }
 
 size_t kvm_iommu_map_pages(pkvm_handle_t domain_id,
@@ -236,3 +280,11 @@ phys_addr_t kvm_iommu_iova_to_phys(pkvm_handle_t domain_id, unsigned long iova)
 {
 	return 0;
 }
+
+/* Must be called from the IOMMU driver per IOMMU */
+int kvm_iommu_init_device(struct kvm_hyp_iommu *iommu)
+{
+	kvm_iommu_lock_init(iommu);
+
+	return 0;
+}
diff --git a/include/kvm/iommu.h b/include/kvm/iommu.h
index 10ecaae0f6a3..6ff78d766466 100644
--- a/include/kvm/iommu.h
+++ b/include/kvm/iommu.h
@@ -45,4 +45,12 @@ extern void **kvm_nvhe_sym(kvm_hyp_iommu_domains);
 #define KVM_IOMMU_DOMAINS_ROOT_ORDER_NR	\
 	(1 << get_order(KVM_IOMMU_DOMAINS_ROOT_SIZE))
 
+struct kvm_hyp_iommu {
+#ifdef __KVM_NVHE_HYPERVISOR__
+	hyp_spinlock_t			lock;
+#else
+	u32				unused;
+#endif
+};
+
 #endif /* __KVM_IOMMU_H */
-- 
2.47.0.338.g60cca15819-goog


