Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30A8EE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 19:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FlfJ2RoRGMYx/VEn6wy5+97mQsVAl5qyYx+2pIE2d8k=; b=t0s7ZUGE5vxllt98KpRyfoqEWa
	pZ8NWGvc1vpk9NNU8xzbg6qZIyIT/nNn4brI/Ukx9am4RKDuV0d0rsAEcX/m0wQvhEaWfpqDlhi9a
	aMGax9A8ejrh2iNCZQ1K5wAzGn4MGtHeCrUAYT2KIaWL36M4L5oEwyCq29XwEy8e4vZd1wlSK3pti
	VFris8OvJNqhUDeK1kMiafq66Gjtsc1Bu/2+hj0r7QEbwkfEg+bAC2DxXcFyJmgDrpoNmpSYCw307
	rC8y0demhZ6tUFVpnx/S6aKegH3wZa5V0D+1OddsXYOK45MF8kgTNb28cl06rVxkvZJA5E4Z113dO
	mV0Wj/nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLoPw-00000001XqN-0frY;
	Thu, 12 Dec 2024 19:00:08 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLna1-00000001K7a-3wYV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 18:06:31 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-385e3cbf308so426257f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 10:06:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734026788; x=1734631588; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=FlfJ2RoRGMYx/VEn6wy5+97mQsVAl5qyYx+2pIE2d8k=;
        b=oOj9nlc1TFjYEaN2XEkb2lfgmOVB4kq4Cjb76BLTHtmtCP/BVp1bqQtD2jkH3iEQi/
         np0kLOg7rg/DXkEYiIM7cV8eHazQ1nfC/fL5ABYJpAPfAYN41UTYI7WuHc+ATx+hiAfD
         lsJvN/cggil/NvFv/7yKENLXaHs1+dlASbIUD2mtCoQdkr3lfVGhWE3Blnv18NiRV//P
         LqPwH5gi3vO4iPH6SGyw4jeOaKNDCe2yR9gisV10l+6rPGdabZwZ5BYKffpFPhmDCWHV
         HBPe6jkRejwwCJM+nX9tQzYRsGU0dHcgknAj+eUbueWLB8KU7jZVo4RKbjdAWRVNmEbC
         ifRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734026788; x=1734631588;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FlfJ2RoRGMYx/VEn6wy5+97mQsVAl5qyYx+2pIE2d8k=;
        b=ahq7ZP3BD4eO5yLY8FYCRXoebY0nJD9pjkHc5nhB0HREgzjLmT+xwo4XlP9gmGw5oU
         +tWMfQiVQXgu3I/KShSY2LDcufFpMgJpw+3oFZfYKsLkPLntyTdpMQj1PLbGn+IHb0VH
         piqylGJ6LTurnfX5MkjVOT0Q97d+J+C0mKNWU3b2UhhE1sB6hfYKBrwPNUAhrEsGwvRJ
         EMPBXMA5gALjtV3meEFUDgOfXqp14lpkaB5mM3ofM37vlTb4gpfaE4DyNDadnIkq2xNC
         Ntw9Apbs1B3HLvBwknp2e5p/eB5//6Dk0GDo548iBaYdfQ5BkscbLJ5SmbH9OYIGFieu
         Mbaw==
X-Forwarded-Encrypted: i=1; AJvYcCXGtPLesz7IfHlTw+55kv03LP4rd+M+h7qayhDSPIskOTyqLyFwW+1m1p/CEJUo/Rly7oLgZEcs8lbVaZHQjKhJ@lists.infradead.org
X-Gm-Message-State: AOJu0YxRWjk//tl+sG87OyGY+EGffXAq65ESYcy+yPm3ZfBkGWn1sDyc
	bkr+5jgadc8eqbQx5Hk65iQ6V3MvZRV8gML+91mak/SCW4puw0RJX1b+FBGZ2HN1T9cime/Qa+T
	MeWctWIpKdA==
X-Google-Smtp-Source: AGHT+IGJYqzxLBeZXH8b4nITiRWycPugiMNUuQieYr7f4NE4ezaD/pAg6hUBcibKZ+vgqVmM+kM3IYkR8ouErw==
X-Received: from wmmu14.prod.google.com ([2002:a05:600c:ce:b0:434:f0a3:7876])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:154a:b0:385:ef2f:92ad with SMTP id ffacd0b85a97d-3864ce86a7fmr7352121f8f.10.1734026788086;
 Thu, 12 Dec 2024 10:06:28 -0800 (PST)
Date: Thu, 12 Dec 2024 18:04:14 +0000
In-Reply-To: <20241212180423.1578358-1-smostafa@google.com>
Mime-Version: 1.0
References: <20241212180423.1578358-1-smostafa@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241212180423.1578358-51-smostafa@google.com>
Subject: [RFC PATCH v2 50/58] iommu/arm-smmu-v3-kvm: Add map, unmap and
 iova_to_phys operations
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
X-CRM114-CacheID: sfid-20241212_100629_977139_D5C0BA7D 
X-CRM114-Status: GOOD (  14.87  )
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

Add map, unmap and iova_to_phys, which are forwarded to the
hypervisor.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 .../iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c   | 72 +++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c
index 071743f5acf9..82f0191b222c 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c
@@ -331,6 +331,75 @@ static bool kvm_arm_smmu_capable(struct device *dev, enum iommu_cap cap)
 	}
 }
 
+static int kvm_arm_smmu_map_pages(struct iommu_domain *domain,
+				  unsigned long iova, phys_addr_t paddr,
+				  size_t pgsize, size_t pgcount, int prot,
+				  gfp_t gfp, size_t *total_mapped)
+{
+	size_t mapped;
+	size_t size = pgsize * pgcount;
+	struct kvm_arm_smmu_domain *kvm_smmu_domain = to_kvm_smmu_domain(domain);
+	struct arm_smccc_res res;
+
+	do {
+		res = kvm_call_hyp_nvhe_smccc(__pkvm_host_iommu_map_pages,
+					      kvm_smmu_domain->id,
+					      iova, paddr, pgsize, pgcount, prot);
+		mapped = res.a1;
+		iova += mapped;
+		paddr += mapped;
+		WARN_ON(mapped % pgsize);
+		WARN_ON(mapped > pgcount * pgsize);
+		pgcount -= mapped / pgsize;
+		*total_mapped += mapped;
+	} while (*total_mapped < size && !kvm_arm_smmu_topup_memcache(&res, gfp));
+	if (*total_mapped < size)
+		return -EINVAL;
+
+	return 0;
+}
+
+static size_t kvm_arm_smmu_unmap_pages(struct iommu_domain *domain,
+				       unsigned long iova, size_t pgsize,
+				       size_t pgcount,
+				       struct iommu_iotlb_gather *iotlb_gather)
+{
+	size_t unmapped;
+	size_t total_unmapped = 0;
+	size_t size = pgsize * pgcount;
+	struct kvm_arm_smmu_domain *kvm_smmu_domain = to_kvm_smmu_domain(domain);
+	struct arm_smccc_res res;
+
+	do {
+		res = kvm_call_hyp_nvhe_smccc(__pkvm_host_iommu_unmap_pages,
+					      kvm_smmu_domain->id,
+					      iova, pgsize, pgcount);
+		unmapped = res.a1;
+		total_unmapped += unmapped;
+		iova += unmapped;
+		WARN_ON(unmapped % pgsize);
+		pgcount -= unmapped / pgsize;
+
+		/*
+		 * The page table driver can unmap less than we asked for. If it
+		 * didn't unmap anything at all, then it either reached the end
+		 * of the range, or it needs a page in the memcache to break a
+		 * block mapping.
+		 */
+	} while (total_unmapped < size &&
+		 (unmapped || !kvm_arm_smmu_topup_memcache(&res, GFP_ATOMIC)));
+
+	return total_unmapped;
+}
+
+static phys_addr_t kvm_arm_smmu_iova_to_phys(struct iommu_domain *domain,
+					     dma_addr_t iova)
+{
+	struct kvm_arm_smmu_domain *kvm_smmu_domain = to_kvm_smmu_domain(domain);
+
+	return kvm_call_hyp_nvhe(__pkvm_host_iommu_iova_to_phys, kvm_smmu_domain->id, iova);
+}
+
 static struct iommu_ops kvm_arm_smmu_ops = {
 	.capable		= kvm_arm_smmu_capable,
 	.device_group		= arm_smmu_device_group,
@@ -344,6 +413,9 @@ static struct iommu_ops kvm_arm_smmu_ops = {
 	.default_domain_ops = &(const struct iommu_domain_ops) {
 		.attach_dev	= kvm_arm_smmu_attach_dev,
 		.free		= kvm_arm_smmu_domain_free,
+		.map_pages	= kvm_arm_smmu_map_pages,
+		.unmap_pages	= kvm_arm_smmu_unmap_pages,
+		.iova_to_phys	= kvm_arm_smmu_iova_to_phys,
 	}
 };
 
-- 
2.47.0.338.g60cca15819-goog


