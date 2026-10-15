Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30B36CCA464
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 20:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tp66Frxalg0sY1/x9PE5w46OtuySfbUHfMRz44KKCn8=; b=xxdqE6UhTD6YIdRvMpUiEReFtC
	MjSyTUQdyxmxcgXS3yYGzsaMlxOmqEJo0cbfmH2X5rXnnK4eTslgfJ0Wr36xVmhA/g22oYjqxlwYZ
	7S5ZRr6e5AP3WOcWRhyYbs9wNvmtnABenS4Pq5NdO94b7MUZ7+4gVSFhWRvPmc4YPclu56CN07FIH
	glfIuZ+M7CLYebnqqJ8jbGGrqVEwCTMXMwVeg9HSThFYTbyLCykR1oLNNBFBwR+MHWPbGICbmEcjy
	Y9TYodOZeQC+TBlXiXsgOOjbeTelQbCQSGmfd/vphHvPpZ9AG7eHF2Iu1b91MLXCPh64GKxQmXqPf
	G5Ieam/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHRlm-00000001IQ5-0oZE;
	Thu, 15 Oct 2026 20:09:42 +0000
Received: from mail-wm1-x347.google.com ([2a00:1450:4864:20::347])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHRlZ-00000001I9p-47u7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 20:09:31 +0000
Received: by mail-wm1-x347.google.com with SMTP id 5b1f17b1804b1-4a1721559b4so58751575e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 13:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792094968; x=1792699768; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tp66Frxalg0sY1/x9PE5w46OtuySfbUHfMRz44KKCn8=;
        b=hdrfidWRYU1zsqSGaOLgVIYwA59yNRbRD/E/cuuLmHVUY6gYXgct2V4b/slmB+TjTm
         rXhDcoT9wFvtLaPk0sO2X/atrIur+4h9wjp1gr0VV8BANBKBydjQzs7AkKvtekxHYlBn
         UrWzisNC6djnF3wtXF4XcvWGwyXw1w/Q6e24P0dguJuL6qJKm6XIda6nNwujtnCnfXT3
         FnoJurObvLK+3+GZQNDUVnCPkXDTKDK7hLJPRJvgpfoTxwEDCSXtXPYCtbNu5HiXIzLv
         Pzc2BPYkNnNtEudnGEmhg55esYjLSPWA89q4n1lJQ8/pyoFOUifE1iDtzYxqlLJD/hdx
         0+8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792094968; x=1792699768;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tp66Frxalg0sY1/x9PE5w46OtuySfbUHfMRz44KKCn8=;
        b=X55NHD3bzWgxz7z/reIdO7HHY+BsUCkBQX77KEaeDXoOA3bWQcGImE08EPuOIIcwvf
         bn8Fgqjmo0R3lijDP7/qDprzOp7aGP0uxWhz0SU30Ma9nLE0zpw6rQOmGZueL1ZTZrp8
         S6Ce9QpWJA1Hul7P1Hxp82EFFpUFS6/IeH0koHLFnx+fmvbme+x2912N6iegC7f8bpBs
         WYQ6WOI29cFsYYPyphdyin3/OAzKAtBy91RudLpNEVVet+Zdh5Lpi/cHvvI4hXjOYrB3
         4WUXjIBdRx2uFpOi0ICq9iMpDsHqRA4q5lYHYpu4A9ljBq5FSLmgOOqfcJXP+INhL73P
         LXfg==
X-Gm-Message-State: AFq9FYLVmKlpbcOgaP+prMAeE8G8Vq5soFJbOFJCVDDM962iKyt8FwOa
	gCBXHYXA3vR7eCQhmoWWRijB7lQvWSFB5fBgcVKHS8jx4vy0sF+h00/DCm+Frl21LLxgBcMANnu
	o//ceiutzWjl3T7CL2zsNSvJJIo7+hErYA6mKGxBh5wBtIK3QAzb8N4DJ2sqjZAhrJYiS+Wvz9C
	YAwJ0EmutNW8ewQg5g56fELzeverajGhznnNUu5v0S5ZzITq1eS47MpBLfPavpLEtPyw==
X-Received: from wmbz11.prod.google.com ([2002:a05:600c:c08b:b0:4a1:88e2:2dde])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4689:b0:4a0:1cfd:321 with SMTP id 5b1f17b1804b1-4a18e4a9b31mr433958165e9.12.1792094967596;
 Thu, 15 Oct 2026 13:09:27 -0700 (PDT)
Date: Thu, 15 Oct 2026 20:08:45 +0000
In-Reply-To: <20261015200903.2735565-1-smostafa@google.com>
Mime-Version: 1.0
References: <20261015200903.2735565-1-smostafa@google.com>
X-Mailer: git-send-email 2.56.0.176.g3575e65682-goog
Message-ID: <20261015200903.2735565-15-smostafa@google.com>
Subject: [PATCH v9 14/25] iommu/arm-smmu-v3-kvm: Shadow the command queue
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
X-CRM114-CacheID: sfid-20261015_130930_079109_5AC9A741 
X-CRM114-Status: GOOD (  30.76  )
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

At boot, allocate a command queue per SMMU which is used as a shadow
by the hypervisor.

The command queue size is 64K which is more than enough, as the
hypervisor would consume all the entries per a command queue prod
write, which means it can handle up to 4096 at a time.

Then, the host command queue needs to be pinned in a shared state, so
it can't be donated to VMs, and avoid tricking the hypervisor into
accessing them. This is done each time the command queue is enabled,
and undone each time the command queue is disabled.
The hypervisor won't access the host command queue when it is disabled
from the host.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 .../arm/arm-smmu-v3/arm-smmu-v3-pkvm-init.c   |  25 ++++
 .../arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c    | 127 +++++++++++++++++-
 .../arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.h    |  11 +-
 3 files changed, 161 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-pkvm-init.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-pkvm-init.c
index 5c5f0ff455e3..d7f2e73add7f 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-pkvm-init.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-pkvm-init.c
@@ -16,6 +16,8 @@
 #include "arm-smmu-v3.h"
 #include "pkvm/arm-smmu-v3-hyp.h"
 
+#define SMMU_KVM_CMDQ_ORDER		get_order(MAX(SZ_64K, PAGE_SIZE))
+
 static size_t kvm_arm_smmu_count;
 static struct hyp_arm_smmu_v3_device *kvm_arm_smmu_array;
 static size_t kvm_arm_smmu_cur;
@@ -23,6 +25,15 @@ static size_t kvm_arm_smmu_cur;
 static void __init kvm_arm_smmu_array_free(void)
 {
 	int order;
+	int i;
+
+	for (i = 0 ; i < kvm_arm_smmu_cur ; ++i) {
+		struct hyp_arm_smmu_v3_device *smmu = &kvm_arm_smmu_array[i];
+
+		if (smmu->cmdq.base_dma)
+			free_pages((unsigned long)phys_to_virt(smmu->cmdq.base_dma),
+				   SMMU_KVM_CMDQ_ORDER);
+	}
 
 	order = get_order(kvm_arm_smmu_count * sizeof(*kvm_arm_smmu_array));
 	free_pages((unsigned long)kvm_arm_smmu_array, order);
@@ -67,6 +78,7 @@ static int __init smmuv3_nesting_probe(struct platform_device *pdev)
 	struct hyp_arm_smmu_v3_device *smmu;
 	struct device *dev = &pdev->dev;
 	struct resource *res;
+	void *cmdq_base;
 
 	/* Only device tree, ACPI not supported. */
 	if (!dev->of_node)
@@ -94,6 +106,19 @@ static int __init smmuv3_nesting_probe(struct platform_device *pdev)
 	smmu->mmio_addr = res->start;
 	smmu->mmio_size = resource_size(res);
 
+	/*
+	 * Allocate the shadow command queue, it doesn't have to be the same
+	 * size as the host.
+	 * Only populate base_dma and llq.max_n_shift, the hypervisor will init
+	 * the rest.
+	 */
+	cmdq_base = (void *)__get_free_pages(GFP_KERNEL | __GFP_ZERO, SMMU_KVM_CMDQ_ORDER);
+	if (!cmdq_base)
+		return -ENOMEM;
+
+	smmu->cmdq.base_dma = virt_to_phys(cmdq_base);
+	smmu->cmdq.llq.max_n_shift = SMMU_KVM_CMDQ_ORDER + PAGE_SHIFT - CMDQ_ENT_SZ_SHIFT;
+
 	if (of_dma_is_coherent(dev->of_node))
 		smmu->features |= ARM_SMMU_FEAT_COHERENCY;
 
diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c
index d95b459a796a..02e7c6175832 100644
--- a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c
+++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c
@@ -23,12 +23,69 @@ struct hyp_arm_smmu_v3_device *kvm_hyp_arm_smmu_v3_smmus;
 	     (smmu) != &kvm_hyp_arm_smmu_v3_smmus[kvm_hyp_arm_smmu_v3_count]; \
 	     (smmu)++)
 
+#define cmdq_size(cmdq)	((1UL << ((cmdq)->llq.max_n_shift)) * CMDQ_ENT_DWORDS * 8)
+
+static bool is_cmdq_enabled(struct hyp_arm_smmu_v3_device *smmu)
+{
+	return FIELD_GET(CR0_CMDQEN, smmu->cr0);
+}
+
+/*
+ * Host structures the hypervisor reads (CMDQ, STE) are shared and pinned:
+ * - Prevent the host from donating this memory.
+ * - Map them in the hypervisor s1 page tables.
+ */
+static int smmu_share_pages(phys_addr_t addr, size_t size)
+{
+	size_t nr_pages = PAGE_ALIGN(size + (addr & ~PAGE_MASK)) >> PAGE_SHIFT;
+	phys_addr_t base = addr & PAGE_MASK;
+	int i, ret;
+
+	for (i = 0; i < nr_pages; ++i) {
+		if (__pkvm_host_share_hyp((base + i * PAGE_SIZE) >> PAGE_SHIFT)) {
+			while (i--)
+				__pkvm_host_unshare_hyp((base + i * PAGE_SIZE) >> PAGE_SHIFT);
+			return -EPERM;
+		}
+	}
+
+	ret = hyp_pin_shared_mem(hyp_phys_to_virt(base),
+				 hyp_phys_to_virt(base + nr_pages * PAGE_SIZE));
+	if (ret) {
+		for (i = 0; i < nr_pages; ++i)
+			__pkvm_host_unshare_hyp((base + i * PAGE_SIZE) >> PAGE_SHIFT);
+	}
+
+	return ret;
+}
+
+static int smmu_unshare_pages(phys_addr_t addr, size_t size)
+{
+	size_t nr_pages = PAGE_ALIGN(size + (addr & ~PAGE_MASK)) >> PAGE_SHIFT;
+	phys_addr_t base = addr & PAGE_MASK;
+	int i, ret;
+
+	hyp_unpin_shared_mem(hyp_phys_to_virt(base),
+			     hyp_phys_to_virt(base + nr_pages * PAGE_SIZE));
+
+	for (i = 0; i < nr_pages; ++i) {
+		ret = __pkvm_host_unshare_hyp((base + i * PAGE_SIZE) >> PAGE_SHIFT);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 /* Put the device in a state that can be probed by the host driver. */
 static void smmu_deinit_device(struct hyp_arm_smmu_v3_device *smmu)
 {
 	WARN_ON(__pkvm_hyp_donate_host_mmio(hyp_phys_to_pfn(smmu->mmio_addr),
 					    smmu->mmio_size >> PAGE_SHIFT,
 					    (unsigned long)smmu->base));
+	if (smmu->cmdq.base)
+		WARN_ON(__pkvm_hyp_donate_host(smmu->cmdq.base_dma >> PAGE_SHIFT,
+					       PAGE_ALIGN(cmdq_size(&smmu->cmdq)) >> PAGE_SHIFT));
 	smmu->base = NULL;
 }
 
@@ -62,6 +119,7 @@ static int smmu_probe(struct hyp_arm_smmu_v3_device *smmu)
 	ret = arm_smmu_device_idr1_probe(smmu, &reg);
 	if (ret)
 		return ret;
+	smmu->cmdq_max_shift = FIELD_GET(IDR1_CMDQS, reg);
 
 	arm_smmu_device_idr3_probe(smmu);
 	arm_smmu_device_idr5_probe(smmu);
@@ -73,6 +131,33 @@ static int smmu_probe(struct hyp_arm_smmu_v3_device *smmu)
 	return 0;
 }
 
+/*
+ * The kernel part of the driver allocates and zeroes the shadow cmdq. Take
+ * ownership of it and program it into the hardware.
+ */
+static int smmu_init_cmdq(struct hyp_arm_smmu_v3_device *smmu)
+{
+	size_t cmdq_nr_pages;
+	int ret;
+
+	smmu->cmdq.llq.max_n_shift = min(smmu->cmdq.llq.max_n_shift, smmu->cmdq_max_shift);
+	cmdq_nr_pages = PAGE_ALIGN(cmdq_size(&smmu->cmdq)) >> PAGE_SHIFT;
+	ret = __pkvm_host_donate_hyp(smmu->cmdq.base_dma >> PAGE_SHIFT, cmdq_nr_pages);
+	if (ret)
+		return ret;
+
+	smmu->cmdq.base = hyp_phys_to_virt(smmu->cmdq.base_dma);
+	smmu->cmdq.prod_reg = smmu->base + ARM_SMMU_CMDQ_PROD;
+	smmu->cmdq.cons_reg = smmu->base + ARM_SMMU_CMDQ_CONS;
+	smmu->cmdq.q_base = smmu->cmdq.base_dma |
+			    FIELD_PREP(Q_BASE_LOG2SIZE, smmu->cmdq.llq.max_n_shift);
+	smmu->cmdq.ent_dwords = CMDQ_ENT_DWORDS;
+	writel_relaxed(0, smmu->cmdq.prod_reg);
+	writel_relaxed(0, smmu->cmdq.cons_reg);
+	writeq_relaxed(smmu->cmdq.q_base, smmu->base + ARM_SMMU_CMDQ_BASE);
+	return 0;
+}
+
 static int smmu_init_device(struct hyp_arm_smmu_v3_device *smmu)
 {
 	unsigned long haddr;
@@ -92,8 +177,16 @@ static int smmu_init_device(struct hyp_arm_smmu_v3_device *smmu)
 	smmu->base = (void __iomem *)haddr;
 	ret = smmu_probe(smmu);
 	if (ret)
-		smmu_deinit_device(smmu);
+		goto out_deinit;
 
+	ret = smmu_init_cmdq(smmu);
+	if (ret)
+		goto out_deinit;
+
+	return 0;
+
+out_deinit:
+	smmu_deinit_device(smmu);
 	return ret;
 }
 
@@ -132,6 +225,23 @@ static int smmu_init(void)
 	return ret;
 }
 
+static void smmu_emulate_cmdq_enable(struct hyp_arm_smmu_v3_device *smmu)
+{
+	u32 shift = smmu->cmdq_host.q_base & Q_BASE_LOG2SIZE;
+
+	smmu->cmdq_host.llq.max_n_shift = min(shift, smmu->cmdq_max_shift);
+	smmu->cmdq_host.base_dma = smmu->cmdq_host.q_base & Q_BASE_ADDR_MASK;
+	smmu->cmdq_host.base_dma &= ~(cmdq_size(&smmu->cmdq_host) - 1);
+	WARN_ON(smmu_share_pages(smmu->cmdq_host.base_dma,
+				 cmdq_size(&smmu->cmdq_host)));
+}
+
+static void smmu_emulate_cmdq_disable(struct hyp_arm_smmu_v3_device *smmu)
+{
+	WARN_ON(smmu_unshare_pages(smmu->cmdq_host.base_dma,
+				   cmdq_size(&smmu->cmdq_host)));
+}
+
 static bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
 			     struct user_pt_regs *regs,
 			     u64 esr, u32 off)
@@ -158,6 +268,14 @@ static bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
 		break;
 	/* Passthrough the register access for bisectability, handled later */
 	case ARM_SMMU_CMDQ_BASE:
+		if (is_write) {
+			/* Not allowed by the architecture */
+			if (is_cmdq_enabled(smmu))
+				break;
+			smmu->cmdq_host.q_base = val;
+		}
+		mask = read_write;
+		break;
 	case ARM_SMMU_CMDQ_PROD:
 	case ARM_SMMU_CMDQ_CONS:
 	case ARM_SMMU_STRTAB_BASE:
@@ -170,9 +288,16 @@ static bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
 			break;
 
 		if (is_write) {
+			bool last_cmdq_en = is_cmdq_enabled(smmu);
+
 			/* Enforce ATS checks. */
 			if (smmu->features & ARM_SMMU_FEAT_ATS)
 				val |= CR0_ATSCHK;
+			smmu->cr0 = val;
+			if (!last_cmdq_en && is_cmdq_enabled(smmu))
+				smmu_emulate_cmdq_enable(smmu);
+			else if (last_cmdq_en && !is_cmdq_enabled(smmu))
+				smmu_emulate_cmdq_disable(smmu);
 			mask = read_write;
 		} else {
 			mask = read_write & ~CR0_ATSCHK;
diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.h b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.h
index afc3ca791583..3903ae358555 100644
--- a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.h
+++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.h
@@ -8,6 +8,8 @@
 #include <nvhe/spinlock.h>
 #endif
 
+#include "../arm-smmu-v3.h"
+
 /**
  * struct hyp_arm_smmu_v3_device - SMMUv3 instance owned by the hypervisor
  * @mmio_addr:		Physical address of the SMMU registers
@@ -21,7 +23,10 @@
  * @lock:		Lock to protect SMMU emulation
  * @hw_lock:		Lock to protect SMMU HW (e.g. CMDQ)
  *			Order smmu.lock => host_mmu.lock => smmu.hw_lock
- *
+ * @cmdq:		CMDQ as observed by HW
+ * @cmdq_host:		Host view of the CMDQ, only q_base, base_dma and llq used
+ * @cmdq_max_shift:	Max shift for the CMDQ probed from HW
+ * @cr0:		Last value of CR0
  * @mmio_addr, @mmio_size and ARM_SMMU_FEAT_COHERENCY are filled by the host
  * before de-privilege, the rest by the hypervisor driver.
  */
@@ -41,6 +46,10 @@ struct hyp_arm_smmu_v3_device {
 	u32			lock;
 	u32			hw_lock;
 #endif
+	struct arm_smmu_queue	cmdq;
+	struct arm_smmu_queue	cmdq_host;
+	u32			cmdq_max_shift;
+	u32			cr0;
 };
 
 #ifdef __KVM_NVHE_HYPERVISOR__
-- 
2.56.0.176.g3575e65682-goog


