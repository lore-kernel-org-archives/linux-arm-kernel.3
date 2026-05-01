Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F6CDCCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 11:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TWp0aeThUsgvfFBxJWuWRQdGQ3dxhvfuaZARmJjLR/k=; b=L3xjCHyxmecZTn0+vm148Zg4EL
	xoE5dt5CPswjWPuPe9zXMpJ6s0ZJrdO5+4xGK9o+V/EAzezFiSEx5bVSnEtzHZ7VsN8J9YyDeZbxA
	urnv0JBbOUcGcWnmyJ4obnZco8903M3EdAJPH13bkZA6UzJYCKY7RJ6SGBWsoEOCLASmLRmdsAPsq
	CvJ+87mCRENkImIris/Plfb2Qw0iUarg5bD+++Z2nEB4BbpLjE1UWYYtZJM0FeeoOIr3BCC2R1NBW
	pFRx68v0sMOBTsgyyKX+sCPPa81VIQ5fcjOzkGl6X7jQaZSIjD2tKFKL1fyLAM5e7u9BFsecchUUo
	1Rh1BR2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIluy-00000006d1M-0QS3;
	Fri, 01 May 2026 11:20:24 +0000
Received: from mail-ej1-x649.google.com ([2a00:1450:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIluu-00000006csZ-14rE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 11:20:22 +0000
Received: by mail-ej1-x649.google.com with SMTP id a640c23a62f3a-ba5520bee9dso151834566b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 May 2026 04:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777634418; x=1778239218; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=TWp0aeThUsgvfFBxJWuWRQdGQ3dxhvfuaZARmJjLR/k=;
        b=TGI2kNnVhyC6IQXmtSugSuQLN2iltICs0OQiPTFtZ4re9PgX24v+iORr9/7mNtUqEO
         UfksNK+ZtJl9lSGBA5zHPCsXhCyrmfyTsKb8piFeB5vA4bLRU9CZSxbhFOf6XcXwaekR
         +6MGx/gB/B9qytaNoIS6p20Zz1aPr2KX7F+/JuUQVTcE0jopbHUwpibUxZosoX5YLJtq
         KHU1DpF4NjFdUW7Xlr7n6PiWOLei10jIn4ti2cCcZKZcTwXC5qrmATUParoIWJXkltID
         2TKf+2NL9v5jlX9Frn1qbKP1Xd4JgCS8U3jVutW1ytvxqWtuQ6LQzIgitlcu8UhU4fyk
         y04A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777634418; x=1778239218;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TWp0aeThUsgvfFBxJWuWRQdGQ3dxhvfuaZARmJjLR/k=;
        b=EGdt+kYo9sWtYwiHvVoxxN1cBvIo7FrH1C7Bv8/qY2p5m0DngMZSdNZsHvwwddTWf5
         vbrXlv0M1i99IG1rKnGvLgxdzdkhLgOEgUgapAO8lKHrwnY3G4OrD0aEhKyxuqj39ZrA
         PwixKS1e446tck87E+ktG8+oM4EzGk+fhhZ8/iNWli87urt3BBkC6EbAS4NZE9OSA7lV
         JDho+Kr3+xRQ4U1XZ6yl0lrtHqq6TpBEva8206eqzP7a1tqS4zg4G24Hn+BFsXfqf5G4
         8QzsI8pgNtS2S+XegkYU89VtvQCB1ctEUeZq1Xt5sOMLWvD6U1oCcvDZIhysMGzrhBhi
         g7Ow==
X-Gm-Message-State: AOJu0YwTPtfgAzfDdCl/OabrKS3Jrx3tsE1UXBNuiTEsJj5/cyLs25qf
	59qgAcHcOjOZtOsnSU/TATOzPzGI+XjNbxWZBqfctoO+VsbZXWwDMU/kaIdB3qyQq7DFtEVfmDE
	t/bwCK1mmdafXy8WF7NbiP02SOADJh3uLx1cxO4a+pgaANtwu2bSJNSu+aPPSz/jfDUS4Kr/4Gk
	dP5GRMxfJFSI/pybCsXGO2ADavuLfC3DvJTsqL6yIPuogTyMI6BGIrGoTYP9iht0b3Aw==
X-Received: from ejcjs18.prod.google.com ([2002:a17:907:97d2:b0:b97:b7aa:b4])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:72d1:b0:ba5:2f0a:2f40 with SMTP id a640c23a62f3a-bbac4bd9fa1mr416440366b.4.1777634417769;
 Fri, 01 May 2026 04:20:17 -0700 (PDT)
Date: Fri,  1 May 2026 11:19:16 +0000
In-Reply-To: <20260501111928.259252-1-smostafa@google.com>
Mime-Version: 1.0
References: <20260501111928.259252-1-smostafa@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260501111928.259252-15-smostafa@google.com>
Subject: [PATCH v6 14/25] iommu/arm-smmu-v3-kvm: Add MMIO emulation
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
X-CRM114-CacheID: sfid-20260501_042020_405053_3F505466 
X-CRM114-Status: GOOD (  19.54  )
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
 .../iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c  | 143 ++++++++++++++++++
 .../iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h  |  10 ++
 2 files changed, 153 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
index d9945db9e102..cce5a51b4656 100644
--- a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
@@ -8,6 +8,7 @@
 
 #include <nvhe/iommu.h>
 #include <nvhe/mem_protect.h>
+#include <nvhe/trap_handler.h>
 
 #include "arm_smmu_v3.h"
 #include "../arm-smmu-v3.h"
@@ -106,6 +107,7 @@ static int smmu_init_device(struct hyp_arm_smmu_v3_device *smmu)
 	if (!PAGE_ALIGNED(smmu->mmio_addr | smmu->mmio_size))
 		return -EINVAL;
 
+	hyp_spin_lock_init(&smmu->lock);
 	ret = __pkvm_host_donate_hyp_mmio(smmu->mmio_addr, smmu->mmio_size, &haddr);
 	if (ret)
 		return ret;
@@ -144,6 +146,8 @@ static int smmu_init(void)
 			goto out_reclaim_smmu;
 	}
 
+	BUILD_BUG_ON(sizeof(hyp_spinlock_t) != sizeof(u32));
+
 	return 0;
 
 out_reclaim_smmu:
@@ -153,6 +157,144 @@ static int smmu_init(void)
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
+		/* Clear stage-2 support, hide MSI to avoid write back to cmdq */
+		mask = read_only & ~(IDR0_S2P | IDR0_VMID16 | IDR0_MSI | IDR0_HYP);
+		break;
+	/* Passthrough the register access for bisectiblity, handled later */
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
+		mask = read_write;
+		break;
+	case ARM_SMMU_CR1: {
+		/* Based on Linux implementation */
+		u64 cr1_template = FIELD_PREP(CR1_TABLE_SH, ARM_SMMU_SH_ISH) |
+				FIELD_PREP(CR1_TABLE_OC, CR1_CACHE_WB) |
+				FIELD_PREP(CR1_TABLE_IC, CR1_CACHE_WB) |
+				FIELD_PREP(CR1_QUEUE_SH, ARM_SMMU_SH_ISH) |
+				FIELD_PREP(CR1_QUEUE_OC, CR1_CACHE_WB) |
+				FIELD_PREP(CR1_QUEUE_IC, CR1_CACHE_WB);
+		if (len != sizeof(u32))
+			break;
+		/* Don't mess with shareability/cacheability. */
+		if (is_write) {
+			WARN_ON(val != cr1_template);
+			val = cr1_template;
+		}
+		mask = read_write;
+		break;
+	}
+
+	/* Allowed 32 bit registers. */
+	case ARM_SMMU_EVTQ_PROD + SZ_64K:
+	case ARM_SMMU_EVTQ_CONS + SZ_64K:
+	case ARM_SMMU_EVTQ_IRQ_CFG1:
+	case ARM_SMMU_EVTQ_IRQ_CFG2:
+	case ARM_SMMU_PRIQ_PROD + SZ_64K:
+	case ARM_SMMU_PRIQ_CONS + SZ_64K:
+	case ARM_SMMU_PRIQ_IRQ_CFG1:
+	case ARM_SMMU_PRIQ_IRQ_CFG2:
+	case ARM_SMMU_GERRORN:
+	case ARM_SMMU_GERROR_IRQ_CFG1:
+	case ARM_SMMU_GERROR_IRQ_CFG2:
+	case ARM_SMMU_IRQ_CTRLACK:
+	case ARM_SMMU_IRQ_CTRL:
+	case ARM_SMMU_CR0ACK:
+	case ARM_SMMU_CR2:
+		if (len != sizeof(u32))
+			break;
+		mask = read_write;
+		break;
+	/* Allowed 64 bit registers. */
+	case ARM_SMMU_EVTQ_BASE:
+	case ARM_SMMU_EVTQ_IRQ_CFG0:
+	case ARM_SMMU_PRIQ_BASE:
+	case ARM_SMMU_PRIQ_IRQ_CFG0:
+	case ARM_SMMU_GERROR_IRQ_CFG0:
+		if (len != sizeof(u64))
+			break;
+		mask = read_write;
+		break;
+	/* Allowed RO 32 bit registers. */
+	case ARM_SMMU_IIDR:
+	case ARM_SMMU_IDR5:
+	case ARM_SMMU_IDR3:
+	case ARM_SMMU_IDR1:
+	case ARM_SMMU_GERROR:
+		if (len != sizeof(u32))
+			break;
+		mask = read_only;
+	};
+
+	if (WARN_ON(!mask))
+		goto out_ret;
+
+	if (is_write) {
+		if (len == sizeof(u64))
+			writeq_relaxed(val & mask, smmu->base + off);
+		else
+			writel_relaxed(val & mask, smmu->base + off);
+
+		return true;
+	}
+
+	if (len == sizeof(u64))
+		val = readq_relaxed(smmu->base + off) & mask;
+	else
+		val = readl_relaxed(smmu->base + off) & mask;
+	/*
+	 * Device might be read senstive, so do it but ignore writing
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
@@ -162,4 +304,5 @@ static int smmu_host_stage2_idmap(phys_addr_t start, phys_addr_t end, int prot)
 struct kvm_iommu_ops smmu_ops = {
 	.init				= smmu_init,
 	.host_stage2_idmap		= smmu_host_stage2_idmap,
+	.dabt_handler			= smmu_dabt_handler,
 };
diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h
index 82b84673e85b..263b0fef262d 100644
--- a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h
@@ -4,6 +4,10 @@
 
 #include <asm/kvm_asm.h>
 
+#ifdef __KVM_NVHE_HYPERVISOR__
+#include <nvhe/spinlock.h>
+#endif
+
 /*
  * Parameters from the trusted host:
  * @mmio_addr		base address of the SMMU registers
@@ -15,6 +19,7 @@
  * @oas			PA size
  * @pgsize_bitmap	Supported page sizes
  * @sid_bits		Max number of SID bits supported
+ * @lock		Lock to protect SMMU
  */
 struct hyp_arm_smmu_v3_device {
 	phys_addr_t		mmio_addr;
@@ -24,6 +29,11 @@ struct hyp_arm_smmu_v3_device {
 	unsigned long		oas;
 	unsigned long		pgsize_bitmap;
 	unsigned int		sid_bits;
+#ifdef __KVM_NVHE_HYPERVISOR__
+	hyp_spinlock_t		lock;
+#else
+	u32			lock;
+#endif
 };
 
 extern size_t kvm_nvhe_sym(kvm_hyp_arm_smmu_v3_count);
-- 
2.54.0.545.g6539524ca2-goog


