Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C9B7CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 11:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yTbFP/vzGSoWzHV54z7Mcha0ge1NRm8j7joYQ/l7s4Q=; b=Rf84Efejjx3pTc6AXOKtxqB4I9
	J52a2sYNdTcyxPoPflo7IeKBkhIhfOrMdd5NCYfm6EYQ6iFoWwilCk8MGvw5NZkHvDzAoHHLr7GPB
	FFBP3cpseQwqJL/bSvjraAc5wXvBUmyWt3cFnXEYPtjoSK2hSSS60CJ59KMH7B6iKOHVvoeRy5jmd
	1xSzfOeRDKxcD++xmdT5k630xhIv8UrtRxrhs4iZtVoY/NBw7TL+fIm0hFzRP6Lze5d0uvdu4QBZO
	fJmPcGJZXlrsJH0PcR0nCsOyJtu/8ZVF+WsDjR4DrY7IYCdfx7uXHz8rf46S2SMY4Y+vT5Kr67G5b
	09LCW4hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIlvE-00000006dTS-3a3e;
	Fri, 01 May 2026 11:20:40 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIlv6-00000006dDL-3HER
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 11:20:34 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-449b2a183d3so966163f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 May 2026 04:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777634430; x=1778239230; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=yTbFP/vzGSoWzHV54z7Mcha0ge1NRm8j7joYQ/l7s4Q=;
        b=rg+uA8dZGC9z4F1ir79R9LbYz05fWnZo8CstZEeAn5cUDoMSqaoXIHllpt5sUA/h0u
         0YE+8arNnJdppX8ZdT7MMtclq5eAtA+j8WZc1qtHlTnELBp4Ft2K9ol7svCREmK7jjQ5
         ZgMSlGfq+T2LVNl6MmlrMFoIqyUe2fdQLaMGBXSsRKeot6b9POaO+pJPjr3bvEiPie/M
         0I3oSjwrxgx5NLPsTjB9Io2JEOBwu2PBLYs4TEsx0J1eX5+2UtFCBf1nMOTuUW/JCISx
         08+C8tvY0eFNNxbgznIT4saBdyaPhnomlYf8FGKN2cW7y5W23Cy9qJSMjv8REXq3Jihh
         cYYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777634430; x=1778239230;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yTbFP/vzGSoWzHV54z7Mcha0ge1NRm8j7joYQ/l7s4Q=;
        b=NGHnarflP7SUTlVVaJppNFZfY9IPLqOP9SvCfoudeQXkaosRWSKNSuFIQLDThTHUe3
         v2trES7UqbCGWsIiKQ+Akg0Bt2XPGIWqDZcxJC9PYPJHyBOwh1JijMHqvQI8F4LPElaC
         qDxucOoUIH8t6TjPV70o+hddU74VeR1nOfHKGeGLm/WKtYvPAx93sm57fJ9b5TGiZnB5
         vjXr5RgDS8nWibXkZl8ADNsHcylmMfFSMnvUOhSLdq0w7hjBSbiF3AEyni4DaHKCyqCS
         KrQnCjm6voNOte9bkJRzQK8kMwMmSk+Z9ihVAiPT7rskOfgVWpbyMl0R0gN7SLyTK+9t
         6Tvw==
X-Gm-Message-State: AOJu0YziwWWxmTrXFnNianIO9a4Ry0VzeBTJSi5+R7mCkOsNDzrmZYOo
	dDWVnID1SU3g2o+fqn2kyoaPCB5IirS3b87rQuRGrRGRhG/78opHzK6Mk5ccxpmf5oNVSxhjZbq
	yqY5U7zE5sl3wsCp4Xa+e9KLZjV6olBDMRUNQrR+GtH4yYes+lZjEVTsnL8HWWwH6g3/CZuWyYk
	tUvFbbz2uyDCaGMoqVT7WPSTinh9ui38T1KXB13htkO/d7YRD16C94Sx5Du0XBbXQxQg==
X-Received: from wrxp8.prod.google.com ([2002:a05:6000:188:b0:449:9a82:a60d])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:1862:b0:43d:779e:afa8 with SMTP id ffacd0b85a97d-4494f9a1430mr11063527f8f.16.1777634430023;
 Fri, 01 May 2026 04:20:30 -0700 (PDT)
Date: Fri,  1 May 2026 11:19:24 +0000
In-Reply-To: <20260501111928.259252-1-smostafa@google.com>
Mime-Version: 1.0
References: <20260501111928.259252-1-smostafa@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260501111928.259252-23-smostafa@google.com>
Subject: [PATCH v6 22/25] iommu/io-pgtable-arm: Support io-pgtable-arm in the hypervisor
From: Mostafa Saleh <smostafa@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, iommu@lists.linux.dev
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, joro@8bytes.org, jean-philippe@linaro.org, jgg@ziepe.ca, 
	mark.rutland@arm.com, qperret@google.com, tabba@google.com, 
	vdonnefort@google.com, sebastianene@google.com, keirf@google.com, 
	Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_042032_962388_A8B90131 
X-CRM114-Status: GOOD (  18.37  )
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

To support DMA isolation in pKVM through SMMUv3 nested trap and
emulate, io-pgtable-arm needs to be compiled for the hypervisor
to create the SMMUs page tables.

Instead of factoring out the kernel-specific code and providing
parallel implementations for the hypervisor, we directly utilize
and abstract the differences within the iommu-pages API.

This introduces a set of hypervisor-specific wrappers in iommu-pages.h
when compiled under __KVM_NVHE_HYPERVISOR__, routing allocations,
frees, virt/phys conversions, and DMA API mapping to the appropriate
pKVM hypervisor functions (kvm_iommu_donate_pages, etc). The generic
kernel definitions are now appropriately excluded in this case.

It also introduces kvm_alloc_io_pgtable_ops at the end of
io-pgtable-arm.c to instantiate the page table for pKVM and adds
the io-pgtable-arm.o object to the hypervisor Makefile.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 arch/arm64/kvm/hyp/nvhe/Makefile |  3 +-
 drivers/iommu/io-pgtable-arm.c   | 31 +++++++++++++++-
 drivers/iommu/io-pgtable-arm.h   |  6 +++
 drivers/iommu/iommu-pages.h      | 63 ++++++++++++++++++++++++++++++++
 4 files changed, 100 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/Makefile b/arch/arm64/kvm/hyp/nvhe/Makefile
index 8a75739db947..4e9e0f1ed2b5 100644
--- a/arch/arm64/kvm/hyp/nvhe/Makefile
+++ b/arch/arm64/kvm/hyp/nvhe/Makefile
@@ -36,7 +36,8 @@ hyp-obj-y += $(lib-objs)
 HYP_SMMU_V3_DRV_PATH = ../../../../../drivers/iommu/arm/arm-smmu-v3
 
 hyp-obj-$(CONFIG_ARM_SMMU_V3_PKVM) += $(HYP_SMMU_V3_DRV_PATH)/pkvm/arm-smmu-v3.o \
-	$(HYP_SMMU_V3_DRV_PATH)/arm-smmu-v3-common-lib.o
+	$(HYP_SMMU_V3_DRV_PATH)/arm-smmu-v3-common-lib.o \
+	$(HYP_SMMU_V3_DRV_PATH)/../../io-pgtable-arm.o
 
 # Path to simple_ring_buffer.c
 CFLAGS_trace.nvhe.o += -I$(srctree)/kernel/trace/
diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index e765021308f9..8a0ffea3ae2c 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -252,10 +252,14 @@ static void *__arm_lpae_alloc_pages(size_t size, gfp_t gfp,
 				    void *cookie)
 {
 	struct device *dev = cfg->iommu_dev;
+	int nid = NUMA_NO_NODE;
 	size_t alloc_size;
 	dma_addr_t dma;
 	void *pages;
 
+	if (dev)
+		nid = dev_to_node(dev);
+
 	/*
 	 * For very small starting-level translation tables the HW requires a
 	 * minimum alignment of at least 64 to cover all cases.
@@ -264,8 +268,7 @@ static void *__arm_lpae_alloc_pages(size_t size, gfp_t gfp,
 	if (cfg->alloc)
 		pages = cfg->alloc(cookie, alloc_size, gfp);
 	else
-		pages = iommu_alloc_pages_node_sz(dev_to_node(dev), gfp,
-						  alloc_size);
+		pages = iommu_alloc_pages_node_sz(nid, gfp, alloc_size);
 
 	if (!pages)
 		return NULL;
@@ -1262,3 +1265,27 @@ struct io_pgtable_init_fns io_pgtable_arm_mali_lpae_init_fns = {
 	.alloc	= arm_mali_lpae_alloc_pgtable,
 	.free	= arm_lpae_free_pgtable,
 };
+
+#ifdef __KVM_NVHE_HYPERVISOR__
+#include <nvhe/iommu.h>
+
+struct io_pgtable_ops *kvm_alloc_io_pgtable_ops(enum io_pgtable_fmt fmt,
+						struct io_pgtable_cfg *cfg,
+						void *cookie)
+{
+	struct io_pgtable *iop;
+
+	if (fmt != ARM_64_LPAE_S2)
+		return NULL;
+
+	iop = arm_64_lpae_alloc_pgtable_s2(cfg, cookie);
+	if (!iop)
+		return NULL;
+
+	iop->fmt        = fmt;
+	iop->cookie     = cookie;
+	iop->cfg        = *cfg;
+
+	return &iop->ops;
+}
+#endif
diff --git a/drivers/iommu/io-pgtable-arm.h b/drivers/iommu/io-pgtable-arm.h
index ba7cfdf7afa0..af3a3f1e765e 100644
--- a/drivers/iommu/io-pgtable-arm.h
+++ b/drivers/iommu/io-pgtable-arm.h
@@ -27,4 +27,10 @@
 #define ARM_LPAE_TCR_PS_48_BIT		0x5ULL
 #define ARM_LPAE_TCR_PS_52_BIT		0x6ULL
 
+#ifdef __KVM_NVHE_HYPERVISOR__
+struct io_pgtable_ops *kvm_alloc_io_pgtable_ops(enum io_pgtable_fmt fmt,
+						struct io_pgtable_cfg *cfg,
+						void *cookie);
+#endif
+
 #endif /* IO_PGTABLE_ARM_H_ */
diff --git a/drivers/iommu/iommu-pages.h b/drivers/iommu/iommu-pages.h
index e1945193ad7f..749f0f4f870c 100644
--- a/drivers/iommu/iommu-pages.h
+++ b/drivers/iommu/iommu-pages.h
@@ -10,6 +10,7 @@
 #include <linux/dma-mapping.h>
 #include <linux/iommu.h>
 
+#ifndef __KVM_NVHE_HYPERVISOR__
 /**
  * struct ioptdesc - Memory descriptor for IOMMU page tables
  * @iopt_freelist_elm: List element for a struct iommu_pages_list
@@ -181,4 +182,66 @@ static inline void iommu_pages_dma_unmap(struct device *dev, dma_addr_t dma, siz
 	dma_unmap_single(dev, dma, size, DMA_TO_DEVICE);
 }
 
+#else /* __KVM_NVHE_HYPERVISOR__ */
+
+#include <nvhe/memory.h>
+#include <nvhe/iommu.h>
+
+static inline void *iommu_alloc_pages_node_sz(int nid, gfp_t gfp, size_t size)
+{
+	return kvm_iommu_donate_pages(get_order(size));
+}
+
+static inline void iommu_free_pages(void *virt)
+{
+	kvm_iommu_reclaim_pages(virt);
+}
+
+static inline void *iommu_alloc_data(size_t size, gfp_t gfp)
+{
+	return kvm_iommu_donate_pages(get_order(size));
+}
+
+static inline void iommu_free_data(void *p)
+{
+	kvm_iommu_reclaim_pages(p);
+}
+
+#undef WARN_ONCE
+#define WARN_ONCE(condition, format...) WARN_ON(condition)
+
+static inline phys_addr_t iommu_virt_to_phys(void *virt)
+{
+	return hyp_virt_to_phys(virt);
+}
+
+static inline void *iommu_phys_to_virt(phys_addr_t phys)
+{
+	return hyp_phys_to_virt(phys);
+}
+
+static inline void iommu_pages_flush_incoherent(struct device *dma_dev,
+						void *virt, size_t offset,
+						size_t len)
+{
+	kvm_flush_dcache_to_poc(virt + offset, len);
+}
+
+static inline dma_addr_t iommu_pages_dma_map(struct device *dev, void *virt, size_t size)
+{
+	kvm_flush_dcache_to_poc(virt, size);
+	return (dma_addr_t)hyp_virt_to_phys(virt);
+}
+
+static inline int iommu_pages_dma_mapping_error(struct device *dev, dma_addr_t dma)
+{
+	return 0;
+}
+
+static inline void iommu_pages_dma_unmap(struct device *dev, dma_addr_t dma, size_t size)
+{
+}
+
+#endif /* __KVM_NVHE_HYPERVISOR__ */
+
 #endif /* __IOMMU_PAGES_H */
-- 
2.54.0.545.g6539524ca2-goog


