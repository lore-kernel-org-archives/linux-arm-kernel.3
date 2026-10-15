Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF439CC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 21:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3u/Wwfq4O359uWiEJsBsS49XBNpLbBfsGX6z5I3CMkU=; b=jnN0I4qL367Ci50loTZ1DJ1Nv2
	83gFYABqwBvYQRBoLVRRnwe67NB99oTKMYYNpKki5q4NtWqqqr+YVpwEqXzc+Ml5L+TBNg1RExT31
	yaPftIKnbFCcRv6YzxxsDNUwlZJ2pfsjWXjXfvWpbC7K4Wl46csiefSjidjEdMccRQ59IfZvy5uOK
	1PjNqAuvcAVCyshmK593CKCwR8JHbzju31XHRHyO7wtLFA27lVSdmGn/1t33HRK5fCZadMbfZ4MsU
	vkygAEtm0JlgWDYLVJ+R4KbpNBsfwQ3sey1JIW3dpLIqWNfds3kx2rnue8EYfLN3L49r4GUWeCAjE
	wRbCa7jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHRll-00000001IOt-1x7Y;
	Thu, 15 Oct 2026 20:09:41 +0000
Received: from mail-ej1-x646.google.com ([2a00:1450:4864:20::646])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHRlZ-00000001I8l-3QTM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 20:09:31 +0000
Received: by mail-ej1-x646.google.com with SMTP id a640c23a62f3a-c2e77b7742dso749111966b.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 13:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792094966; x=1792699766; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3u/Wwfq4O359uWiEJsBsS49XBNpLbBfsGX6z5I3CMkU=;
        b=ftLfkRo0k7H5EPNw/eeOX/VJwg8qY5IL0+QSZqfLNc8ZvmTTvrHM1WvjL6BuICBt87
         6qVBEbWeiUaIgW8Zuci1xi14YyqxFP1B65LIfQaWnC1LpSc/UK2QQvVerJP3gUwvARFk
         A5/IiOQUGjGqCQ3Ba61VgEeR/q4TRe3Nq2NikSqT23rvFyTLfRGF4Syowl5Y9UMax/f0
         5tcq3BXsEEkfu6ybN5HGy2T4uQ1iv7ZnbLkK/HPER5+rrAW3ZnQ98g6fA3xZFYFyAsAR
         TUS12E5nX1ROI9Sfh+/4RfTIUrL1hqMoBi+zQOak/sxu0eQoMyPEOSRGAj1rz72Iu8k/
         ZP2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792094966; x=1792699766;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3u/Wwfq4O359uWiEJsBsS49XBNpLbBfsGX6z5I3CMkU=;
        b=gur4otDGCaYzPktYEi1hw/vFis3tEIdF2DAvi6o4X9WlQ5svE4BI1d5oXgf7c7a8nr
         fWi2jScTndjQDsFtWUDV9iKywJU2eVTmfUL8RAxy6V8K5XcW7JIXqFDJ9Wj/13mex/Fo
         0Wlxa0Xs1BUFIjZMebIWK02lRvQRVzYtcVyUDSQYPhbqSb9D+74/82NN3CNrAcrBapIt
         XxQ2B8hqgjJkSBBaA4mDP4OWqr7tw1JPEP+f7ioM5X9vYnDPs1Pf+fzQFFRdlBIE1Twx
         GljMZUXmuXL2fRxc0/CjfHWIvUlwUa+cUyYmNZVfwkqFeTxJZx84CG7FWiHpK9xPm7v6
         wlHA==
X-Gm-Message-State: AFq9FYKf7YbLi0Ii+lXbjjKnx2nNXAy0He315SUvC322PhEXxxuVBQqD
	gupL/+YRg01wIrdo4nVnoN0svnSUT3OffwcoKu/V8n2WTH8UB5DTWpRkHvgkx/WfMOcX/BMGl4k
	V9rPezx9huXrNDv6FVCYa7mKn12PaMZccl6ayqVpuLYxpHqyS/GyUPE3tZMZgiBNBuq6MI17Ypc
	hfzVfHIB8he1NPZZxPS11VowLWCbApS1Q2sMOhgWxRLXKXNmXzQqSaXx4Fl1a5Qbu8Nw==
X-Received: from edfz6.prod.google.com ([2002:a05:6402:a406:b0:6b1:b15e:791f])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:9720:b0:c26:337e:7e05 with SMTP id a640c23a62f3a-c31a9a29d50mr1794237266b.4.1792094966321;
 Thu, 15 Oct 2026 13:09:26 -0700 (PDT)
Date: Thu, 15 Oct 2026 20:08:44 +0000
In-Reply-To: <20261015200903.2735565-1-smostafa@google.com>
Mime-Version: 1.0
References: <20261015200903.2735565-1-smostafa@google.com>
X-Mailer: git-send-email 2.56.0.176.g3575e65682-goog
Message-ID: <20261015200903.2735565-14-smostafa@google.com>
Subject: [PATCH v9 13/25] iommu/arm-smmu-v3-kvm: Add MMIO emulation
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
X-CRM114-CacheID: sfid-20261015_130929_900453_D08291D7 
X-CRM114-Status: GOOD (  19.96  )
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

Add data abort handler for the SMMUs, at the moment most registers
are just passthrough.
In the next patches CMDQ/STE emulation will be added which inserts
logic to some register access.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 .../arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c    | 169 ++++++++++++++++++
 .../arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.h    |  18 ++
 2 files changed, 187 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c
index 2b4a0f961a66..d95b459a796a 100644
--- a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c
+++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c
@@ -9,6 +9,7 @@
 
 #include <nvhe/iommu.h>
 #include <nvhe/mem_protect.h>
+#include <nvhe/trap_handler.h>
 
 #include "arm-smmu-v3-hyp.h"
 #include "../arm-smmu-v3.h"
@@ -80,6 +81,9 @@ static int smmu_init_device(struct hyp_arm_smmu_v3_device *smmu)
 	if (!PAGE_ALIGNED(smmu->mmio_addr | smmu->mmio_size))
 		return -EINVAL;
 
+	hyp_spin_lock_init(&smmu->lock);
+	hyp_spin_lock_init(&smmu->hw_lock);
+
 	ret = __pkvm_host_donate_hyp_mmio(hyp_phys_to_pfn(smmu->mmio_addr),
 					  smmu->mmio_size >> PAGE_SHIFT, &haddr);
 	if (ret)
@@ -128,6 +132,170 @@ static int smmu_init(void)
 	return ret;
 }
 
+static bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
+			     struct user_pt_regs *regs,
+			     u64 esr, u32 off)
+{
+	bool is_write = esr & ESR_ELx_WNR;
+	unsigned int len = BIT((esr & ESR_ELx_SAS) >> ESR_ELx_SAS_SHIFT);
+	int rd = (esr & ESR_ELx_SRT_MASK) >> ESR_ELx_SRT_SHIFT;
+	const u64 read_write = -1ULL;
+	const u64 no_access = 0;
+	u64 mask = no_access;
+	const u64 read_only = is_write ? no_access : read_write;
+	bool is_xzr = (rd == 31);
+	u64 val = is_xzr ? 0 : regs->regs[rd];
+
+	switch (off) {
+	case ARM_SMMU_IDR0:
+		if (len != sizeof(u32))
+			break;
+		/*
+		 * Clear stage-2 support, hide MSI to avoid write back to cmdq,
+		 * and hide ATS as it is not emulated or handled in TLB invalidation.
+		 */
+		mask = read_only & ~(IDR0_S2P | IDR0_VMID16 | IDR0_MSI | IDR0_HYP | IDR0_ATS);
+		break;
+	/* Passthrough the register access for bisectability, handled later */
+	case ARM_SMMU_CMDQ_BASE:
+	case ARM_SMMU_CMDQ_PROD:
+	case ARM_SMMU_CMDQ_CONS:
+	case ARM_SMMU_STRTAB_BASE:
+	case ARM_SMMU_STRTAB_BASE_CFG:
+	case ARM_SMMU_GBPA:
+		mask = read_write;
+		break;
+	case ARM_SMMU_CR0:
+		if (len != sizeof(u32))
+			break;
+
+		if (is_write) {
+			/* Enforce ATS checks. */
+			if (smmu->features & ARM_SMMU_FEAT_ATS)
+				val |= CR0_ATSCHK;
+			mask = read_write;
+		} else {
+			mask = read_write & ~CR0_ATSCHK;
+		}
+		break;
+	case ARM_SMMU_CR0ACK:
+		if (len != sizeof(u32))
+			break;
+		mask = read_only & ~CR0_ATSCHK;
+		break;
+	case ARM_SMMU_CR1:
+		if (len != sizeof(u32))
+			break;
+		/* Don't mess with shareability/cacheability. */
+		if (is_write &&
+		    (val != (FIELD_PREP(CR1_TABLE_SH, ARM_SMMU_SH_ISH) |
+			     FIELD_PREP(CR1_TABLE_OC, CR1_CACHE_WB) |
+			     FIELD_PREP(CR1_TABLE_IC, CR1_CACHE_WB) |
+			     FIELD_PREP(CR1_QUEUE_SH, ARM_SMMU_SH_ISH) |
+			     FIELD_PREP(CR1_QUEUE_OC, CR1_CACHE_WB) |
+			     FIELD_PREP(CR1_QUEUE_IC, CR1_CACHE_WB))))
+			break;
+
+		mask = read_write;
+		break;
+	/* Allowed 32 bit registers. */
+	case ARM_SMMU_EVTQ_IRQ_CFG1:
+	case ARM_SMMU_EVTQ_IRQ_CFG2:
+	case ARM_SMMU_GERROR_IRQ_CFG1:
+	case ARM_SMMU_GERROR_IRQ_CFG2:
+	case ARM_SMMU_PRIQ_IRQ_CFG1:
+	case ARM_SMMU_PRIQ_IRQ_CFG2:
+		/* These are RES0 as MSI support is hidden. */
+		val = 0;
+		if (!is_write)
+			goto out_update_regs;
+		fallthrough;
+	case ARM_SMMU_EVTQ_PROD + SZ_64K:
+	case ARM_SMMU_EVTQ_CONS + SZ_64K:
+	case ARM_SMMU_PRIQ_PROD + SZ_64K:
+	case ARM_SMMU_PRIQ_CONS + SZ_64K:
+	case ARM_SMMU_GERRORN:
+	case ARM_SMMU_IRQ_CTRL:
+	case ARM_SMMU_CR2:
+		if (len != sizeof(u32))
+			break;
+		mask = read_write;
+		break;
+	/* Allowed 64 bit registers. */
+	case ARM_SMMU_EVTQ_IRQ_CFG0:
+	case ARM_SMMU_PRIQ_IRQ_CFG0:
+	case ARM_SMMU_GERROR_IRQ_CFG0:
+		/* These are RES0 as MSI support is hidden. */
+		val = 0;
+		if (!is_write)
+			goto out_update_regs;
+		fallthrough;
+	case ARM_SMMU_EVTQ_BASE:
+	case ARM_SMMU_PRIQ_BASE:
+		if (len != sizeof(u64))
+			break;
+		mask = read_write;
+		break;
+	/* Allowed RO 32 bit registers. */
+	case ARM_SMMU_IIDR:
+	case ARM_SMMU_IDR5:
+	case ARM_SMMU_IDR3:
+	case ARM_SMMU_IDR1:
+	case ARM_SMMU_IRQ_CTRLACK:
+	case ARM_SMMU_GERROR:
+		if (len != sizeof(u32))
+			break;
+		mask = read_only;
+		break;
+	}
+
+	if (WARN_ON(!mask))
+		goto out_ret;
+
+	hyp_spin_lock(&smmu->hw_lock);
+	if (is_write) {
+		if (len == sizeof(u64))
+			writeq_relaxed(val & mask, smmu->base + off);
+		else
+			writel_relaxed(val & mask, smmu->base + off);
+
+		hyp_spin_unlock(&smmu->hw_lock);
+		return true;
+	}
+
+	if (len == sizeof(u64))
+		val = readq_relaxed(smmu->base + off) & mask;
+	else
+		val = readl_relaxed(smmu->base + off) & mask;
+	hyp_spin_unlock(&smmu->hw_lock);
+out_update_regs:
+	/*
+	 * Device might be read sensitive, so do it but ignore writing
+	 * back for xzr.
+	 */
+	if (!is_xzr)
+		regs->regs[rd] = val;
+
+out_ret:
+	return true;
+}
+
+static bool smmu_dabt_handler(struct user_pt_regs *regs, u64 esr, u64 addr)
+{
+	struct hyp_arm_smmu_v3_device *smmu;
+	bool ret;
+
+	for_each_smmu(smmu) {
+		if (addr < smmu->mmio_addr || addr >= smmu->mmio_addr + smmu->mmio_size)
+			continue;
+		hyp_spin_lock(&smmu->lock);
+		ret = smmu_dabt_device(smmu, regs, esr, addr - smmu->mmio_addr);
+		hyp_spin_unlock(&smmu->lock);
+		return ret;
+	}
+	return false;
+}
+
 static int smmu_host_stage2_idmap(phys_addr_t start, phys_addr_t end, int prot)
 {
 	return 0;
@@ -137,4 +305,5 @@ static int smmu_host_stage2_idmap(phys_addr_t start, phys_addr_t end, int prot)
 struct pkvm_iommu_ops smmu_ops = {
 	.init				= smmu_init,
 	.host_stage2_idmap		= smmu_host_stage2_idmap,
+	.dabt_handler			= smmu_dabt_handler,
 };
diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.h b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.h
index c2630397f57a..afc3ca791583 100644
--- a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.h
+++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.h
@@ -4,6 +4,10 @@
 
 #include <asm/kvm_asm.h>
 
+#ifdef __KVM_NVHE_HYPERVISOR__
+#include <nvhe/spinlock.h>
+#endif
+
 /**
  * struct hyp_arm_smmu_v3_device - SMMUv3 instance owned by the hypervisor
  * @mmio_addr:		Physical address of the SMMU registers
@@ -14,6 +18,9 @@
  * @oas:		Output address size
  * @pgsize_bitmap:	Supported page sizes
  * @sid_bits:		Number of StreamID bits
+ * @lock:		Lock to protect SMMU emulation
+ * @hw_lock:		Lock to protect SMMU HW (e.g. CMDQ)
+ *			Order smmu.lock => host_mmu.lock => smmu.hw_lock
  *
  * @mmio_addr, @mmio_size and ARM_SMMU_FEAT_COHERENCY are filled by the host
  * before de-privilege, the rest by the hypervisor driver.
@@ -27,8 +34,19 @@ struct hyp_arm_smmu_v3_device {
 	unsigned long		oas;
 	unsigned long		pgsize_bitmap;
 	unsigned int		sid_bits;
+#ifdef __KVM_NVHE_HYPERVISOR__
+	hyp_spinlock_t		lock;
+	hyp_spinlock_t		hw_lock;
+#else
+	u32			lock;
+	u32			hw_lock;
+#endif
 };
 
+#ifdef __KVM_NVHE_HYPERVISOR__
+static_assert(sizeof(hyp_spinlock_t) == sizeof(u32));
+#endif
+
 extern size_t kvm_nvhe_sym(kvm_hyp_arm_smmu_v3_count);
 #define kvm_hyp_arm_smmu_v3_count kvm_nvhe_sym(kvm_hyp_arm_smmu_v3_count)
 
-- 
2.56.0.176.g3575e65682-goog


