Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D05A1C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 13:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kXio9q3HXbV99t7QvdKbUG1SAfPkxiR4UmV0lVPZQhU=; b=rMMb0gclnaF2HuIE6SDixrcEd1
	wxJtNsDnjGBaIxCAzjmPWWIJ9n9P27AEOZIbqthwDDpuvHlVpb4EeGG0pjmh1E6vlZdoXzS6zzaZo
	zLEDGrR+f42MXCG3R/RXPWykyZo1zXG1Wu3Yyv35R897y0akaJVMK7+e1WekaY3i6zOuKiM3Y/sCK
	PrXPbcsz7YkcW4y59P0s33ZlcT6QFk2lJvBxCxUiKQpRzxz3lYW8W913Lhaa9nruXM4D8G1YBWhNQ
	34MMxDwrY1G7JDH/+UDb/O8rW0YJNWwkB+gGa7SbGMntPLwgW1d+MSZPG2mIUdejIT1+te+Ecb7Gl
	0pxNaxFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x90Jf-00000005ScZ-2GsF;
	Tue, 22 Sep 2026 13:13:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x90JI-00000005SKK-3tu1
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 22 Sep 2026 13:13:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=kXio9q3HXbV99t7QvdKbUG1SAfPkxiR4UmV0lVPZQhU=; b=Atb+mxRgJX8dv0YKXygqCPVoq8
	NM9hl3cJcHA+Kvi8QCOP0h068RIbzdBVTs4p9UrUmeQtCYujTX+13p1xKcwNGb9iF47xQ4d+x0p6h
	jtclSDgd9i7txlyIqAdPLhCeH7Tl2jonlrYy6aZXeFaIIl4GJQJ8qUqu2Q6VM1l2oe77HRuheJtiq
	q6zX4TeuzZ7BuVvnKmK/+XHJmFfjNikI/poy88xki2GNDD1cYsla4dUm4Wttzp2qlA+OEjq+Tw0BX
	qJ+rgKFy4/ZVS5K7121qN5QbcZ0ZRenpeCt48NMmd43nN3cf0ja/9n175cJPdAxaQ5RilopCbb5o+
	WciGFXBA==;
Received: from mail-wm1-x345.google.com ([2a00:1450:4864:20::345])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x90JF-0000000Dbbf-32p6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 13:13:23 +0000
Received: by mail-wm1-x345.google.com with SMTP id 5b1f17b1804b1-49fcc575709so32646175e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 06:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790082800; x=1790687600; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kXio9q3HXbV99t7QvdKbUG1SAfPkxiR4UmV0lVPZQhU=;
        b=mMIVzIhs5MvT4YDo9dZ+RgmA8bO/7E9E4+IM691yodXOjksOrZPyLqG2rqrUpIBJC7
         XuJg7oQuhfZfvCvZ/lhh34/uqWLcPHsQL+yAOc8lLCU/f75QFqZqcV9jOT/Przbi374H
         izvK5zmwwK50nnVqi5/xxGWNsjHOz8+OAWrzI8IAPDP08H2X4F/hehlRCZhTmBUiX88H
         47w01ZxBpjd1Xiyv3xgZNjn/oL15iKJyHb2IAQJfxQqSI2GDk7HO8EhQXW+DdtgVIldS
         Pzg61Q56eJ0SpYRHXdb5AG2mZCBERn3sMVymAmGTsKk9CS8DhDsUiel10a0U+FomqcyN
         +yqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790082800; x=1790687600;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kXio9q3HXbV99t7QvdKbUG1SAfPkxiR4UmV0lVPZQhU=;
        b=lkNw3olCvzzOf2MzKqdZzPwsz7iHhAOhHk8N6ph2JosSMWoRwSb0gd2F8icwUe3QlG
         zNE+2SbCzaHaamZJlXa7GKUca0+pbPzTKBG2EjcJdW98QplCg1pS/YgVd9HPifOhs7UY
         7v7vLWTJ4pnKBXS0sIsOj5v634F23scnexlcw8HJYgtQDc/1UlwUrztGE+JdoHseAyBy
         dZgd2lJrGNkpNaHe9Xfi5qalvkMcPegIPQHKZPqXPHJIpu8achJ2Ayutrv5tgxOB7TDO
         DjKqSLCEPkrokw7TF9uRmUaPQx3vNvGke1DH0cP2Lv9SKbMIDypLqAA6yKbWWOpotF/4
         sErA==
X-Gm-Message-State: AFuF++mwpMNtamvLm13PDb4toaZSkDet2pPcNhrigaU7Fae/8dwe6ETl
	xgfSWdujDdLuIeXmSAxSXKS6362OJ6M/BAI6ZeLc8Ol8+bMU6nP5h3cfTxmeXAJKiVTObRq7y/m
	9dVfqH/jhvEAFyb5ng8pdvsa709YV6RTqVLbEwpHIJSdXnDMh19GJ3UuEZDlxjfipT3raq31ufE
	olgLHVEYHjC9FfZc+8a/kdfUotHdAhmHsMfmVXb6WUVDhxO/VBs+nvoZ2EA0OkmLDEww==
X-Received: from wmhf5.prod.google.com ([2002:a7b:cc05:0:b0:49d:e4a3:4a99])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1548:b0:49e:6ac4:b76e with SMTP id 5b1f17b1804b1-49fc574eed4mr206100225e9.30.1790082799463;
 Tue, 22 Sep 2026 06:13:19 -0700 (PDT)
Date: Tue, 22 Sep 2026 13:12:47 +0000
In-Reply-To: <20260922131259.2975334-1-smostafa@google.com>
Mime-Version: 1.0
References: <20260922131259.2975334-1-smostafa@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260922131259.2975334-15-smostafa@google.com>
Subject: [PATCH v8 14/25] iommu/arm-smmu-v3-kvm: Shadow the command queue
From: Mostafa Saleh <smostafa@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, iommu@lists.linux.dev
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, joro@8bytes.org, jgg@ziepe.ca, mark.rutland@arm.com, 
	qperret@google.com, tabba@google.com, vdonnefort@google.com, 
	sebastianene@google.com, keirf@google.com, 
	Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_141322_309246_769E4ABD 
X-CRM114-Status: GOOD (  29.77  )
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
 .../iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c   |  25 ++++
 .../arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.h    |  10 ++
 .../iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c  | 124 ++++++++++++++++++
 3 files changed, 159 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c
index 9947d3a44304..28f8b1fba8f7 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c
@@ -15,6 +15,8 @@
 #include "arm-smmu-v3.h"
 #include "pkvm/arm-smmu-v3-hyp.h"
 
+#define SMMU_KVM_CMDQ_ORDER		get_order(MAX(SZ_64K, PAGE_SIZE))
+
 extern struct pkvm_iommu_ops kvm_nvhe_sym(smmu_ops);
 
 static size_t				kvm_arm_smmu_count;
@@ -24,6 +26,15 @@ static size_t				kvm_arm_smmu_cur;
 static void kvm_arm_smmu_array_free(void)
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
@@ -70,6 +81,7 @@ static int smmuv3_nesting_probe(struct platform_device *pdev)
 	struct hyp_arm_smmu_v3_device *smmu = &kvm_arm_smmu_array[kvm_arm_smmu_cur];
 	struct device *dev = &pdev->dev;
 	struct resource *res;
+	void *cmdq_base;
 
 	/* Only device tree, ACPI not supported. */
 	if (!dev->of_node)
@@ -92,6 +104,19 @@ static int smmuv3_nesting_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
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
 
diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.h b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.h
index 58fa14c239e3..39afdeffcd63 100644
--- a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.h
+++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.h
@@ -8,6 +8,8 @@
 #include <nvhe/spinlock.h>
 #endif
 
+#include "../arm-smmu-v3.h"
+
 /*
  * Parameters from the trusted host:
  * @mmio_addr		base address of the SMMU registers
@@ -21,6 +23,10 @@
  * @lock		Lock to protect SMMU emulation
  * @hw_lock		Lock to protect SMMU HW (as CMDQ)
  *			Order smmu.lock => host_mmu.lock => smmu.hw_lock
+ * @cmdq		CMDQ as observed by HW
+ * @cmdq_host		Host view of the CMDQ, only q_base and llq used.
+ * @cmdq_max_shift	Max shift for the CMDQ probed from HW.
+ * @cr0			Last value of CR0
  */
 struct hyp_arm_smmu_v3_device {
 	phys_addr_t		mmio_addr;
@@ -38,6 +44,10 @@ struct hyp_arm_smmu_v3_device {
 	u32			lock;
 	u32			hw_lock;
 #endif
+	struct arm_smmu_queue	cmdq;
+	struct arm_smmu_queue	cmdq_host;
+	u32			cmdq_max_shift;
+	u32			cr0;
 };
 
 extern size_t kvm_nvhe_sym(kvm_hyp_arm_smmu_v3_count);
diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
index 7a51cb70205f..b26c21b595b4 100644
--- a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
@@ -22,11 +22,68 @@ struct hyp_arm_smmu_v3_device *kvm_hyp_arm_smmu_v3_smmus;
 	     (smmu) != &kvm_hyp_arm_smmu_v3_smmus[kvm_hyp_arm_smmu_v3_count]; \
 	     (smmu)++)
 
+#define cmdq_size(cmdq)	((1 << ((cmdq)->llq.max_n_shift)) * CMDQ_ENT_DWORDS * 8)
+
+static bool is_cmdq_enabled(struct hyp_arm_smmu_v3_device *smmu)
+{
+	return FIELD_GET(CR0_CMDQEN, smmu->cr0);
+}
+
+/*
+ * CMDQ, STE host copies are accessed by the hypervisor, we share them to
+ * - Prevent the host from passing protected VM memory.
+ * - Having them mapped in the hyp page table.
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
 					    smmu->mmio_size >> PAGE_SHIFT));
+	if (smmu->cmdq.base)
+		WARN_ON(__pkvm_hyp_donate_host(smmu->cmdq.base_dma >> PAGE_SHIFT,
+					       PAGE_ALIGN(cmdq_size(&smmu->cmdq)) >> PAGE_SHIFT));
 	smmu->base = NULL;
 }
 
@@ -53,6 +110,7 @@ static int smmu_probe(struct hyp_arm_smmu_v3_device *smmu)
 		return -EINVAL;
 
 	smmu->sid_bits = FIELD_GET(IDR1_SIDSIZE, reg);
+	smmu->cmdq_max_shift = FIELD_GET(IDR1_CMDQS, reg);
 	/* Follows the kernel logic */
 	if (smmu->sid_bits <= STRTAB_SPLIT)
 		smmu->features &= ~ARM_SMMU_FEAT_2_LVL_STRTAB;
@@ -71,6 +129,33 @@ static int smmu_probe(struct hyp_arm_smmu_v3_device *smmu)
 	return 0;
 }
 
+/*
+ * The kernel part of the driver will allocate the shadow cmdq,
+ * and zero it. This function only donates it.
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
@@ -92,7 +177,12 @@ static int smmu_init_device(struct hyp_arm_smmu_v3_device *smmu)
 	if (ret)
 		goto out_ret;
 
+	ret = smmu_init_cmdq(smmu);
+	if (ret)
+		goto out_ret;
+
 	return 0;
+
 out_ret:
 	smmu_deinit_device(smmu);
 	return ret;
@@ -132,6 +222,23 @@ static int smmu_init(void)
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
@@ -158,6 +265,14 @@ static bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
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
@@ -168,6 +283,15 @@ static bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
 	case ARM_SMMU_CR0:
 		if (len != sizeof(u32))
 			break;
+		if (is_write) {
+			bool last_cmdq_en = is_cmdq_enabled(smmu);
+
+			smmu->cr0 = val;
+			if (!last_cmdq_en && is_cmdq_enabled(smmu))
+				smmu_emulate_cmdq_enable(smmu);
+			else if (last_cmdq_en && !is_cmdq_enabled(smmu))
+				smmu_emulate_cmdq_disable(smmu);
+		}
 		mask = read_write;
 		break;
 	case ARM_SMMU_CR1:
-- 
2.55.0.1082.g2b9226bbc0-goog


