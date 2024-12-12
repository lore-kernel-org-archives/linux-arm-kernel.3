Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCB0BE77185
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 19:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D/WH1qyYX+7rpIZva9xL+b2vQ8iEfpW50WvBw5yyV8M=; b=POTTvTj+PE1FGnJ++KKk/k8YqZ
	atGCAtlTxH1ciYxueDvmZAq4/8O7Rvr1UQlUW3S4zMgiVahVTGVl3GdUSBJzVIoDCVFOJ5JsjZB0X
	OAqK9aMthKpH9jLtfc/ryltdefLwN23ZamrvYlsHRDzg0kyl6drVnBk4I0ULDSbenW4BwNpn2phTO
	zfIYjn5vXVj5Y1rH9totSyKxJTwxf8Ss1ENkTKaAzbNFS1+HwItWaZP2WTT/6+YbmRxoc+NCGo1mH
	bywcXtUzc5g2SWttIpFub/ffNMthGfjalKoAmGvqJfEV3bGy3GMOtRs3SGMq0c2gAzcZaoUekz//p
	EeFEnj7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLofN-00000001aC0-060p;
	Thu, 12 Dec 2024 19:16:05 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLnaC-00000001KBQ-1RT6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 18:06:41 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-43628594d34so2699395e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 10:06:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734026799; x=1734631599; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=D/WH1qyYX+7rpIZva9xL+b2vQ8iEfpW50WvBw5yyV8M=;
        b=3LN2U4ojwko2gyTwrGUPwPNXmBEx8/nuW/0xnBQqEiWfLDq04/1XGipiwK/bizGUQ3
         /jd78AR4RCZnQKFdQ7A1RojPM4SfvMigj9vxOSfNTx8q/QRdf49DsP1pxLAr5LN0W5A8
         cnDENguYzTf5NviZ/m/b7V9Al5vM+5eEBkBy7LjPjRnQFSip5o280mZYclD8ZTY7eZpn
         /s+wcSKLMperUJEoTeBq/U4F8GQao1e1z8gHQNcdGDxwSUSbVpL7U6Au4U4oqSpn+U4Q
         YdVbSqAemqynls2E55uBzzQ8PP3N4J7QgsRQXKh6ABOWsgrtiSpKdTgww64KAiz29ZiD
         R9bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734026799; x=1734631599;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D/WH1qyYX+7rpIZva9xL+b2vQ8iEfpW50WvBw5yyV8M=;
        b=DcSSPWPmh/oa+BS1UQz5f3bK+LCeZHPBIzuG0s8WcNnNre3zmWjpc6cAkL0r08WbF9
         KwQTCCIcm6ra10J098oqDlUOgSXeEIXp7DqOVZ7ncbrZbrKBiKmFft5Ne2ulD+ZqA6Ai
         +ZVoztTWxT3jgkSz3o5dlO2py9uYAzPmn0+pB1KnZd/ovZsQ/RObAFC08yfDTtr8P96E
         pL+duu/t/1DBbcpcl1Bp+XsdoOEzQs/1ZmP6jAr0NB1um90o1ScZS46aRn53MUbCjdJm
         S+yVTe9m2rWwG+7n1YqZpnKJVcFuGSuP9l5CWGZPVIIQEGdgDhbDIj3hb9Q9cxKeUD9+
         /6Vw==
X-Forwarded-Encrypted: i=1; AJvYcCVwZEMDcF4kI1ICIBBNUmoKXWCqCXco3fo2rqCR2sF76TPGbpeD2YLxJohXFhi7Or/erwRTWEu5PqkdheH9v4yu@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2k2QvDW69+LT4aVBNLxRXsnhWoky0LGyocXmz6f7nOs63siyJ
	MG0l1jArEMiN/gtEYUwmjEnQJKejCtWYz8aiNmn/sMLasB48dXWd0DOJ1y1kACPkQ8uZ8ZHQCWv
	Y85xWxhqyTA==
X-Google-Smtp-Source: AGHT+IHo7wmBmLTPy0XiRrrgBETwIuBRTOBnsQtf6QtHUwUE60Tx6ltVM6P9M60Uqtp3lgGDJwn8Dzv+JpaDLg==
X-Received: from wmph6.prod.google.com ([2002:a05:600c:4986:b0:434:e96f:86b0])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3b94:b0:434:fdaf:af2d with SMTP id 5b1f17b1804b1-4361c441f23mr72295225e9.30.1734026798776;
 Thu, 12 Dec 2024 10:06:38 -0800 (PST)
Date: Thu, 12 Dec 2024 18:04:19 +0000
In-Reply-To: <20241212180423.1578358-1-smostafa@google.com>
Mime-Version: 1.0
References: <20241212180423.1578358-1-smostafa@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241212180423.1578358-56-smostafa@google.com>
Subject: [RFC PATCH v2 55/58] drivers/iommu: Add deferred map_sg operations
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
X-CRM114-CacheID: sfid-20241212_100640_383068_84423E8E 
X-CRM114-Status: GOOD (  23.20  )
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

With pKVM SMMUv3 driver which para-virtualizes the IOMMU in the
hypervisor, has an extra overhead with map_sg, as it loops over
iommu_map, and for each map requires context switching, disabling
interrupts...

Instead, add an new domain operations:
- alloc_cookie_sg: Allocate a new sg deferred cookie
- add_deferred_map_sg: Add a mapping to the cookie
- consume_deferred_map_sg: Consume and release the cookie

Alternativly, we can pass the sg list as is. However, this would
duplicate some of the logic and it would make more sense to
conolidate all the sg list parsing for IOMMU drivers in one place.

virtio-iommu is another IOMMU that can benfit from this, but it
would need to have a new operation that standerdize passing
an sglist based on these ops.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 drivers/iommu/iommu.c | 53 +++++++++++++++++++++++++++++++++++++++++--
 include/linux/iommu.h | 19 ++++++++++++++++
 2 files changed, 70 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 83c8e617a2c5..3a3c48631dd6 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -2608,6 +2608,37 @@ size_t iommu_unmap_fast(struct iommu_domain *domain,
 }
 EXPORT_SYMBOL_GPL(iommu_unmap_fast);
 
+static int __iommu_add_sg(struct iommu_map_cookie_sg *cookie_sg,
+			  unsigned long iova, phys_addr_t paddr, size_t size)
+{
+	struct iommu_domain *domain = cookie_sg->domain;
+	const struct iommu_domain_ops *ops = domain->ops;
+	unsigned int min_pagesz;
+	size_t pgsize, count;
+
+	if (unlikely(!(domain->type & __IOMMU_DOMAIN_PAGING)))
+		return -EINVAL;
+
+	if (WARN_ON(domain->pgsize_bitmap == 0UL))
+		return -ENODEV;
+
+	/* find out the minimum page size supported */
+	min_pagesz = 1 << __ffs(domain->pgsize_bitmap);
+
+	/*
+	 * both the virtual address and the physical one, as well as
+	 * the size of the mapping, must be aligned (at least) to the
+	 * size of the smallest page supported by the hardware
+	 */
+	if (!IS_ALIGNED(iova | paddr | size, min_pagesz)) {
+		pr_err("unaligned: iova 0x%lx pa %pa size 0x%zx min_pagesz 0x%x\n",
+		       iova, &paddr, size, min_pagesz);
+		return -EINVAL;
+	}
+	pgsize = iommu_pgsize(domain, iova, paddr, size, &count);
+	return ops->add_deferred_map_sg(cookie_sg, paddr, pgsize, count);
+}
+
 ssize_t iommu_map_sg(struct iommu_domain *domain, unsigned long iova,
 		     struct scatterlist *sg, unsigned int nents, int prot,
 		     gfp_t gfp)
@@ -2617,6 +2648,9 @@ ssize_t iommu_map_sg(struct iommu_domain *domain, unsigned long iova,
 	phys_addr_t start;
 	unsigned int i = 0;
 	int ret;
+	bool deferred_sg = ops->alloc_cookie_sg && ops->add_deferred_map_sg &&
+			   ops->consume_deferred_map_sg;
+	struct iommu_map_cookie_sg *cookie_sg;
 
 	might_sleep_if(gfpflags_allow_blocking(gfp));
 
@@ -2625,12 +2659,24 @@ ssize_t iommu_map_sg(struct iommu_domain *domain, unsigned long iova,
 				__GFP_HIGHMEM)))
 		return -EINVAL;
 
+	if (deferred_sg) {
+		cookie_sg = ops->alloc_cookie_sg(iova, prot, nents, gfp);
+		if (!cookie_sg) {
+			pr_err("iommu: failed alloc cookie\n");
+			return -ENOMEM;
+		}
+		cookie_sg->domain = domain;
+	}
+
 	while (i <= nents) {
 		phys_addr_t s_phys = sg_phys(sg);
 
 		if (len && s_phys != start + len) {
-			ret = __iommu_map(domain, iova + mapped, start,
-					len, prot, gfp);
+			if (deferred_sg)
+				ret = __iommu_add_sg(cookie_sg, iova + mapped, start, len);
+			else
+				ret = __iommu_map(domain, iova + mapped, start,
+						  len, prot, gfp);
 
 			if (ret)
 				goto out_err;
@@ -2654,6 +2700,9 @@ ssize_t iommu_map_sg(struct iommu_domain *domain, unsigned long iova,
 			sg = sg_next(sg);
 	}
 
+	if (deferred_sg)
+		ops->consume_deferred_map_sg(cookie_sg);
+
 	if (ops->iotlb_sync_map) {
 		ret = ops->iotlb_sync_map(domain, iova, mapped);
 		if (ret)
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index c75877044185..5e60ac349228 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -601,6 +601,14 @@ struct iommu_ops {
 	u8 user_pasid_table:1;
 };
 
+/**
+ * struct iommu_map_cookie_sg - Cookie for a deferred map sg
+ * @domain: Domain for the sg lit
+ */
+struct iommu_map_cookie_sg {
+	struct iommu_domain *domain;
+};
+
 /**
  * struct iommu_domain_ops - domain specific operations
  * @attach_dev: attach an iommu domain to a device
@@ -638,6 +646,11 @@ struct iommu_ops {
  * @enable_nesting: Enable nesting
  * @set_pgtable_quirks: Set io page table quirks (IO_PGTABLE_QUIRK_*)
  * @free: Release the domain after use.
+ * @alloc_cookie_sg: Allocate a cookie that would be used to create
+ *		     a sg list, filled from the next functions
+ * @add_deferred_map_sg: Add a mapping to a cookie of a sg list.
+ * @consume_deferred_map_sg: Consume the sg list as now all mappings are added,
+ *			     it should also release the cookie as it's not used.
  */
 struct iommu_domain_ops {
 	int (*attach_dev)(struct iommu_domain *domain, struct device *dev);
@@ -668,6 +681,12 @@ struct iommu_domain_ops {
 				  unsigned long quirks);
 
 	void (*free)(struct iommu_domain *domain);
+
+	struct iommu_map_cookie_sg *(*alloc_cookie_sg)(unsigned long iova, int prot,
+						       unsigned int nents, gfp_t gfp);
+	int (*add_deferred_map_sg)(struct iommu_map_cookie_sg *cookie,
+				   phys_addr_t paddr, size_t pgsize, size_t pgcount);
+	int (*consume_deferred_map_sg)(struct iommu_map_cookie_sg *cookie);
 };
 
 /**
-- 
2.47.0.338.g60cca15819-goog


