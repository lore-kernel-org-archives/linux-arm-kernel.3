Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D1E8CCA464
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 20:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l+MxF80V9nS6Nyq45ubbKvlA2fryYNHeqrMVD/2LTb0=; b=zbIBnBfV3r3nO/sKnsu9lAiNnb
	PlHQvtdTXfS0pPevlSCDjYOKi0Wm8PcifEq56vG/tAJMkk94nrJa0PMgKR9LuDu5xMit1PGZtZNst
	dVUz8OiyKhNED5gIs0AjDmT0xhIXFrhNwCcUikt72L5mmALnYOFh6A1yrO9viFOJKamoDm3x/VHyJ
	AVqi49ODc9L2OH3VJfZIeSDSUFXCBDemOCWIq//ZhR0fkOHFamIYLe9RqQSyQqHOImftg9d/pOVP0
	/m8zZrqDki/shaQSS1Cy/vfmfbKAJN5tJs9dk6KE7OuRN5FSC3NOpaWTsNp5OgXz25vhOfEGKOV5r
	FInvbAgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHRmu-00000001JhC-2803;
	Thu, 15 Oct 2026 20:10:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHRma-00000001JN3-48Za
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 15 Oct 2026 20:10:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=l+MxF80V9nS6Nyq45ubbKvlA2fryYNHeqrMVD/2LTb0=; b=E3moEJ4VjV8Z7jKeQbv/14e/4Z
	VbOTRoOSl9fT9cSW4JjluJ5j0CRArdt+NkS5SMaDQQgVxd+xM/ZfC1b/spjObaURQg6CRVTGkB7u7
	4Vz0p0eYdMP4sm8xT/YFWDTusYxBQnFLkTLYWtYjmgn1MIJyDexQyy9RdOuFs+sqQqyU+JEf9G2Xj
	WCPuGRqwndpnKYyhoUPVSHpYWzKcJLfNP4ShytVyayRQz3S342zsEWhY0rQQ3TGSPD9Jqrp0YGXYf
	MNo1R1dH0R6qkEsKWpw1NUaGUT2j0xmLEmUCVBBJ3q2EXBHLYqeJbpUeWyNUtPvd9zKFOj0pJSrwI
	IoYJV50g==;
Received: from mail-wr1-x446.google.com ([2a00:1450:4864:20::446])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHRlj-00000000ntJ-1rt4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 20:10:27 +0000
Received: by mail-wr1-x446.google.com with SMTP id ffacd0b85a97d-48dea677afcso208988f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 13:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792094977; x=1792699777; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l+MxF80V9nS6Nyq45ubbKvlA2fryYNHeqrMVD/2LTb0=;
        b=PvZs5UH8V6/GjvtVS/o1lexeTewM50wiMRTb13cwMIueF2MIhOkkDf0SQQPQnuHb+J
         swmqM2KKgxD6rgKpLDiuudDLHBMvww4NFBHV1p4g8xDGHkC1/1pYshmRppFaB85qq7en
         EDEQIbtNTFLvKy3DgYX4VY2L80T41bmFf4N2DDLrnpMPnhy0kfsDJIcPoqjaAPBxhpKX
         HilgPETrqxq8Iv53f5tV26hk8GWUvdvkkBkBbQ0MlWsWQh6s0lezauw0eYlFLkK1wXBK
         Q7hs1+0noAug3xu1PF5VEIJPCv3lAyagS5IuDtRSPi9MLbeXtlb3dtoYMGl96iigvonX
         xVSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792094977; x=1792699777;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l+MxF80V9nS6Nyq45ubbKvlA2fryYNHeqrMVD/2LTb0=;
        b=yqF97KreXd934vao0Ol3SIHqPHjzw9g3GKuqRvJST+kvrb311tu5URbslghTTR8aSj
         HYJWrMcyLyIiXx8uzr/+9C5t01y8K5aUB8DbOTC1BXLup0rXzDkZobShkW8zew97IG1c
         PH90xntfyTafJVi9QllAF36uK9xNQFNTPqpPJkTJFecbdWtrh6GGLt/IwOrxKYUhdATQ
         7nWlDEfBMMa7IZICIPGDbOo7/0WzcI8G5kjW7c0adwDVx+F6iuaEpm5/m9XnhC+CYQNP
         o+hL1CC5EhkXZPc+c/ady1FhTNNzmHOXiBOYit9SdiRbg6sESJp26UTN3qAxpTRW+QvM
         6/fA==
X-Gm-Message-State: AFq9FYKH5D0vTr/rJjOrz4V7/GXh2/VBTMhdEOT2bWz1w6i2MhcwuQhc
	hb0s6OaKqWOu24ecOww55qSStt+e0IH2aV94oI0Vl1aChgr/yqBAy3d5W8rjgW0o6sw+fefHECm
	kJQ8fbmURfIhry8ijRRdmvuDXaiTSdFFjTd3LS68xEDA6pzaLUFyLnMEX7lseQeGBP78LxDn9tr
	2NmZhUnJVpSIPHBsBKTAqhpCrNwsXJXHRA+UaDp5065Tsc2IGiU+WYaFiqQxB0uOEFHA==
X-Received: from wrzh2.prod.google.com ([2002:a5d:6e02:0:b0:48d:f498:dec8])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:6292:0:b0:48c:6756:dab3 with SMTP id ffacd0b85a97d-48dfacf53famr2128690f8f.3.1792094976702;
 Thu, 15 Oct 2026 13:09:36 -0700 (PDT)
Date: Thu, 15 Oct 2026 20:08:52 +0000
In-Reply-To: <20261015200903.2735565-1-smostafa@google.com>
Mime-Version: 1.0
References: <20261015200903.2735565-1-smostafa@google.com>
X-Mailer: git-send-email 2.56.0.176.g3575e65682-goog
Message-ID: <20261015200903.2735565-22-smostafa@google.com>
Subject: [PATCH v9 21/25] iommu/io-pgtable-arm: Support io-pgtable-arm in the hypervisor
From: Mostafa Saleh <smostafa@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, iommu@lists.linux.dev
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, joro@8bytes.org, jgg@ziepe.ca, mark.rutland@arm.com, 
	qperret@google.com, tabba@google.com, vdonnefort@google.com, 
	nicolinc@nvidia.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_210941_130309_F699F289 
X-CRM114-Status: GOOD (  20.35  )
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

To be able to populate the shadow stage-2 in the hypervisor, compile
io-pgtable-arm object for the hypervisor.

That requires the hypervisor to provide the iommu-pages allocator,
redefine the address conversion helpers, and stub out the DMA API.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 arch/arm64/kvm/hyp/nvhe/Makefile              |  3 +-
 .../arm/arm-smmu-v3/pkvm/io-pgtable-arm-hyp.h | 88 +++++++++++++++++++
 drivers/iommu/io-pgtable-arm.c                | 14 +--
 drivers/iommu/io-pgtable-arm.h                |  9 ++
 4 files changed, 106 insertions(+), 8 deletions(-)
 create mode 100644 drivers/iommu/arm/arm-smmu-v3/pkvm/io-pgtable-arm-hyp.h

diff --git a/arch/arm64/kvm/hyp/nvhe/Makefile b/arch/arm64/kvm/hyp/nvhe/Makefile
index ee86e4b3436f..08da05ddda5d 100644
--- a/arch/arm64/kvm/hyp/nvhe/Makefile
+++ b/arch/arm64/kvm/hyp/nvhe/Makefile
@@ -36,7 +36,8 @@ hyp-obj-y += $(lib-objs)
 HYP_SMMU_V3_DRV_PATH := ../../../../../drivers/iommu/arm/arm-smmu-v3
 
 hyp-obj-$(CONFIG_ARM_SMMU_V3_PKVM) += $(HYP_SMMU_V3_DRV_PATH)/pkvm/arm-smmu-v3-hyp.o \
-	$(HYP_SMMU_V3_DRV_PATH)/arm-smmu-v3-common-lib.o ../../../../../lib/hweight.o
+	$(HYP_SMMU_V3_DRV_PATH)/arm-smmu-v3-common-lib.o ../../../../../lib/hweight.o \
+	$(HYP_SMMU_V3_DRV_PATH)/../../io-pgtable-arm.o
 
 # Path to simple_ring_buffer.c
 CFLAGS_trace.nvhe.o += -I$(srctree)/kernel/trace/
diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/io-pgtable-arm-hyp.h b/drivers/iommu/arm/arm-smmu-v3/pkvm/io-pgtable-arm-hyp.h
new file mode 100644
index 000000000000..d278c6788fb1
--- /dev/null
+++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/io-pgtable-arm-hyp.h
@@ -0,0 +1,88 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef IO_PGTABLE_ARM_HYP_H_
+#define IO_PGTABLE_ARM_HYP_H_
+
+#include <nvhe/memory.h>
+#include <nvhe/iommu.h>
+
+#undef WARN_ONCE
+#define WARN_ONCE(condition, format...) WARN_ON(condition)
+
+static inline void *iommu_alloc_pages_node_sz(int nid, gfp_t gfp, size_t size)
+{
+	return pkvm_iommu_alloc_pages(get_order(size));
+}
+
+static inline void iommu_free_pages(void *virt)
+{
+	pkvm_iommu_free_pages(virt);
+}
+
+#define arm_lpae_alloc_data(obj)	pkvm_iommu_alloc_pages(get_order(sizeof(obj)))
+#define arm_lpae_free_data(p)		pkvm_iommu_free_pages(p)
+
+#undef phys_to_virt
+#define phys_to_virt(x)		hyp_phys_to_virt(x)
+
+#undef virt_to_phys
+#define virt_to_phys(x)		hyp_virt_to_phys(x)
+
+/* Stubs used by io-pgtable-arm but no relevant for hypervisor object. */
+#undef dma_map_single
+#define dma_map_single(d, p, s, dir) \
+	({ (void)(d); (void)(s); (void)(dir); virt_to_phys(p); })
+
+#undef dma_unmap_single
+#define dma_unmap_single(d, a, s, r) \
+	do { (void)(d); (void)(a); (void)(s); (void)(r); } while (0)
+
+#define dma_sync_single_for_device(d, a, s, r) \
+	do { (void)(d); (void)(a); (void)(s); (void)(r); } while (0)
+
+#undef dma_mapping_error
+#define dma_mapping_error(...) (0)
+
+#undef dev_err
+#define dev_err(dev, format, ...) \
+	({ (void)(dev); no_printk(format, ##__VA_ARGS__); })
+
+#undef iommu_dirty_bitmap_record
+#define iommu_dirty_bitmap_record(d, i, l) \
+	do { (void)(d); (void)(i); (void)(l); } while (0)
+
+static inline int iommu_pages_start_incoherent(void *virt, struct device *dma_dev)
+{
+	return 0;
+}
+
+static inline void iommu_pages_free_incoherent(void *virt,
+					       struct device *dma_dev)
+{
+}
+
+static inline void iommu_pages_flush_incoherent(struct device *dma_dev,
+						void *virt, size_t offset,
+						size_t len)
+{
+}
+
+static inline struct io_pgtable_ops *pkvm_alloc_io_pgtable_ops(enum io_pgtable_fmt fmt,
+							       struct io_pgtable_cfg *cfg,
+							       void *cookie)
+{
+	struct io_pgtable *iop;
+
+	if (fmt != ARM_64_LPAE_S2)
+		return NULL;
+
+	iop = io_pgtable_arm_64_lpae_s2_init_fns.alloc(cfg, cookie);
+	if (!iop)
+		return NULL;
+
+	iop->fmt	= fmt;
+	iop->cookie	= cookie;
+	iop->cfg	= *cfg;
+
+	return &iop->ops;
+}
+#endif /* IO_PGTABLE_ARM_HYP_H_ */
diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index 476c0e25631a..6b2668c2ef44 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -20,7 +20,6 @@
 #include <asm/barrier.h>
 
 #include "io-pgtable-arm.h"
-#include "iommu-pages.h"
 
 #define ARM_LPAE_MAX_ADDR_BITS		52
 #define ARM_LPAE_S2_MAX_CONCAT_PAGES	16
@@ -301,6 +300,7 @@ static void *__arm_lpae_alloc_pages(size_t size, gfp_t gfp,
 {
 	struct device *dev = cfg->iommu_dev;
 	void *pages;
+	int nid = dev ? dev_to_node(dev) : NUMA_NO_NODE;
 
 	/*
 	 * For very small starting-level translation tables the HW requires a
@@ -311,7 +311,7 @@ static void *__arm_lpae_alloc_pages(size_t size, gfp_t gfp,
 	if (cfg->alloc)
 		return __arm_lpae_cfg_alloc(size, gfp, cfg, cookie);
 
-	pages = iommu_alloc_pages_node_sz(dev_to_node(dev), gfp, size);
+	pages = iommu_alloc_pages_node_sz(nid, gfp, size);
 	if (!pages)
 		return NULL;
 
@@ -650,7 +650,7 @@ static void arm_lpae_free_pgtable(struct io_pgtable *iop)
 	struct arm_lpae_io_pgtable *data = io_pgtable_to_data(iop);
 
 	__arm_lpae_free_pgtable(data, data->start_level, data->pgd);
-	kfree(data);
+	arm_lpae_free_data(data);
 }
 
 static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
@@ -964,7 +964,7 @@ arm_lpae_alloc_pgtable(struct io_pgtable_cfg *cfg)
 	if (cfg->oas > ARM_LPAE_MAX_ADDR_BITS)
 		return NULL;
 
-	data = kmalloc_obj(*data);
+	data = arm_lpae_alloc_data(*data);
 	if (!data)
 		return NULL;
 
@@ -1091,7 +1091,7 @@ arm_64_lpae_alloc_pgtable_s1(struct io_pgtable_cfg *cfg, void *cookie)
 	return &data->iop;
 
 out_free_data:
-	kfree(data);
+	arm_lpae_free_data(data);
 	return NULL;
 }
 
@@ -1187,7 +1187,7 @@ arm_64_lpae_alloc_pgtable_s2(struct io_pgtable_cfg *cfg, void *cookie)
 	return &data->iop;
 
 out_free_data:
-	kfree(data);
+	arm_lpae_free_data(data);
 	return NULL;
 }
 
@@ -1266,7 +1266,7 @@ arm_mali_lpae_alloc_pgtable(struct io_pgtable_cfg *cfg, void *cookie)
 	return &data->iop;
 
 out_free_data:
-	kfree(data);
+	arm_lpae_free_data(data);
 	return NULL;
 }
 
diff --git a/drivers/iommu/io-pgtable-arm.h b/drivers/iommu/io-pgtable-arm.h
index ba7cfdf7afa0..4278da41e406 100644
--- a/drivers/iommu/io-pgtable-arm.h
+++ b/drivers/iommu/io-pgtable-arm.h
@@ -27,4 +27,13 @@
 #define ARM_LPAE_TCR_PS_48_BIT		0x5ULL
 #define ARM_LPAE_TCR_PS_52_BIT		0x6ULL
 
+#ifndef __KVM_NVHE_HYPERVISOR__
+#include "iommu-pages.h"
+#define arm_lpae_alloc_data(obj)	kmalloc_obj(obj)
+#define arm_lpae_free_data(p)		kfree(p)
+
+#else
+#include "arm/arm-smmu-v3/pkvm/io-pgtable-arm-hyp.h"
+#endif
+
 #endif /* IO_PGTABLE_ARM_H_ */
-- 
2.56.0.176.g3575e65682-goog


