Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8748CEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 18:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p3xOR8x6QzbVlWlZrKYLBDo4QOwlksJXf7F4qOhAA+w=; b=lhfks2kW9dRvXXmE0YV+dn8iU/
	qt4HBbPX9SSVZvFRts0N3zDC8k6pHRKnVhEjge4VY8CKkioWrTQ+rBAISVYikdSu9i5FAhWU5kofH
	XUMQYfpv/FZgsfu4z8Yrjcxs7YX8UrEof8xw5zEU6xwdWeaZ7Ud1LjyMcbXaKMso65prIbpS8lb5+
	7XBduAGN2Oekji0mzmqCB0/7E6CNFsxLtftypqQNRvqJtbgLtCPeceDs8csQt7DQCGNtRO6fS7bZu
	8TYFdUjROQwo1JLfcWWU8ZK8/1yG4hWwXoErs4xkwsimBEFuXWKP9+seOcx1itoof2vFDnqdb6iw3
	3LWn9hBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL4Ha-0000000Gdsu-3xPj;
	Mon, 17 Nov 2025 18:48:58 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL4HO-0000000Gdah-2PLT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 18:48:47 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-429cd1d0d98so3273763f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 10:48:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763405324; x=1764010124; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=p3xOR8x6QzbVlWlZrKYLBDo4QOwlksJXf7F4qOhAA+w=;
        b=X/lVUFZd3/HcUIWm4XKll1gr6vZ06xcZzDuAFM2EaemvFqk2vC2kNGPUYOcYR90Bqe
         Q0af2jd8EYVR5THMBCpsQ1A/le61S5TwHQ7GRK38lOJW8jPl50veQSL/bwRF91I+xKe9
         hOoVUnZp1Ffhw7hVd3S1iwz4EKqaMaScep79E+cbH9Pc2vGfvaOuYdzQMrkvrDi51zRO
         BFuMkS4WBa0vY+lSR7oQMX/PI/W6650xwv2M54mOYrwkD4bHJmzZGrK7ehsOKXUq9oqx
         ytrMT7cIOOLJUim2TrkAHjQ34g2XE6GIciodan4P/Gy/sW1g8iVl4/HqKMtRILeNHO52
         zjPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763405324; x=1764010124;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p3xOR8x6QzbVlWlZrKYLBDo4QOwlksJXf7F4qOhAA+w=;
        b=AhLBq6VDaw73RJ/yiM7U39RCJRwhqork8/E76PFLC5xfrOK3cFEfXysluMHsHj3Wem
         SnuhgQAN1jUmtH68hwt6oFU9IvEfVBVUejXO93baTpqqt12i9bsmAEQ2qJt2joc1ti5E
         EufRIcWBn+Y0BWRutB2T5jxQ5NL8h0+fQ+CnJazoYioEokx1ZJtdKJ0TjqQyAlYp+EvS
         fPbYyXtC3kuequuFkDP0LhBiJkXXXVXq9pjSBRzvMpTE3oM5FiVoYq5ZhYnhAOAWcc4t
         sNUTEI1XqjMmpVOMyIEqnx/A8usLQF0Aa2xwaSbfXdpU5z2ziudtVdZe50oAVDY3JDi2
         5hgA==
X-Gm-Message-State: AOJu0Yx0RylPUq2B1WNE0oXgxNfdIH00eKJIAxJfo/g3OKSkSPJo0CyN
	wGR3OQX9Ksg2fPByj1X6Lymg/HufMNXmc6k0lr0r8YuhECPNu62vskXQXdmJ4nBKjIroUPS5PfW
	T/iVGeQK2lxhaGMft+rZEDayj67ufOLrUbUH0mjnNycqQ2JEPfYUZf8RnjGl4rPb7t8HRv/F6iw
	YT5H5deJBG4GYE4KZT5Hu0ui3VjZb/pxWrSY6jDVZHHR1gDqho0FrL5NDzo5cO9LvDXA==
X-Google-Smtp-Source: AGHT+IHCWbQlr8o940tPX5ysnGCiRUYmATJoia86/TFJSTwquzFFs3l4nOHlPBVKTiqXidY7DwnVkD6YGitCIA==
X-Received: from wrio1.prod.google.com ([2002:a5d:6481:0:b0:429:bf18:9f1])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:230d:b0:42b:2e94:5a8f with SMTP id ffacd0b85a97d-42b5939dc13mr12310824f8f.52.1763405324058;
 Mon, 17 Nov 2025 10:48:44 -0800 (PST)
Date: Mon, 17 Nov 2025 18:48:05 +0000
In-Reply-To: <20251117184815.1027271-1-smostafa@google.com>
Mime-Version: 1.0
References: <20251117184815.1027271-1-smostafa@google.com>
X-Mailer: git-send-email 2.52.0.rc1.455.g30608eb744-goog
Message-ID: <20251117184815.1027271-19-smostafa@google.com>
Subject: [PATCH v5 18/27] iommu/arm-smmu-v3-kvm: Add MMIO emulation
From: Mostafa Saleh <smostafa@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, iommu@lists.linux.dev
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, joro@8bytes.org, jean-philippe@linaro.org, jgg@ziepe.ca, 
	praan@google.com, danielmentz@google.com, mark.rutland@arm.com, 
	qperret@google.com, tabba@google.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_104846_664497_F63F3006 
X-CRM114-Status: GOOD (  19.81  )
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

At the moment most registers are just passthrough, then in the next
patches CMDQ/STE emulation will be added which inserts logic to some
register access.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 .../iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c  | 126 ++++++++++++++++++
 .../iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h  |  10 ++
 2 files changed, 136 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
index e45b4e50b1e4..f0dae94daf89 100644
--- a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
@@ -8,6 +8,7 @@
 
 #include <nvhe/iommu.h>
 #include <nvhe/mem_protect.h>
+#include <nvhe/trap_handler.h>
 
 #include "arm_smmu_v3.h"
 #include "../arm-smmu-v3.h"
@@ -115,6 +116,7 @@ static int smmu_init_device(struct hyp_arm_smmu_v3_device *smmu)
 	ret = smmu_probe(smmu);
 	if (ret)
 		goto out_ret;
+	hyp_spin_lock_init(&smmu->lock);
 	return 0;
 out_ret:
 	smmu_deinit_device(smmu);
@@ -140,6 +142,8 @@ static int smmu_init(void)
 			goto out_reclaim_smmu;
 	}
 
+	BUILD_BUG_ON(sizeof(hyp_spinlock_t) != sizeof(u32));
+
 	return 0;
 
 out_reclaim_smmu:
@@ -150,6 +154,127 @@ static int smmu_init(void)
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
+	u64 val = regs->regs[rd];
+
+	switch (off) {
+	case ARM_SMMU_IDR0:
+		/* Clear stage-2 support, hide MSI to avoid write back to cmdq */
+		mask = read_only & ~(IDR0_S2P | IDR0_VMID16 | IDR0_MSI | IDR0_HYP);
+		WARN_ON(len != sizeof(u32));
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
+		mask = read_write;
+		WARN_ON(len != sizeof(u32));
+		break;
+	case ARM_SMMU_CR1: {
+		/* Based on Linux implementation */
+		u64 cr2_template = FIELD_PREP(CR1_TABLE_SH, ARM_SMMU_SH_ISH) |
+				FIELD_PREP(CR1_TABLE_OC, CR1_CACHE_WB) |
+				FIELD_PREP(CR1_TABLE_IC, CR1_CACHE_WB) |
+				FIELD_PREP(CR1_QUEUE_SH, ARM_SMMU_SH_ISH) |
+				FIELD_PREP(CR1_QUEUE_OC, CR1_CACHE_WB) |
+				FIELD_PREP(CR1_QUEUE_IC, CR1_CACHE_WB);
+		/* Don't mess with shareability/cacheability. */
+		if (is_write)
+			WARN_ON(val != cr2_template);
+		mask = read_write;
+		WARN_ON(len != sizeof(u32));
+		break;
+	}
+	/*
+	 * These should be safe, just enforce RO or RW and size according to architecture.
+	 * There are some other registers that are not used by Linux as IDR2, IDR4
+	 * that won't be allowed.
+	 */
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
+		/* These are 32 bit registers. */
+		WARN_ON(len != sizeof(u32));
+		fallthrough;
+	case ARM_SMMU_EVTQ_BASE:
+	case ARM_SMMU_EVTQ_IRQ_CFG0:
+	case ARM_SMMU_PRIQ_BASE:
+	case ARM_SMMU_PRIQ_IRQ_CFG0:
+	case ARM_SMMU_GERROR_IRQ_CFG0:
+		mask = read_write;
+		break;
+	case ARM_SMMU_IIDR:
+	case ARM_SMMU_IDR5:
+	case ARM_SMMU_IDR3:
+	case ARM_SMMU_IDR1:
+	case ARM_SMMU_GERROR:
+		WARN_ON(len != sizeof(u32));
+		mask = read_only;
+	};
+
+	if (WARN_ON(!mask))
+		goto out_ret;
+
+	if (is_write) {
+		if (len == sizeof(u64))
+			writeq_relaxed(regs->regs[rd] & mask, smmu->base + off);
+		else
+			writel_relaxed(regs->regs[rd] & mask, smmu->base + off);
+	} else {
+		if (len == sizeof(u64))
+			regs->regs[rd] = readq_relaxed(smmu->base + off) & mask;
+		else
+			regs->regs[rd] = readl_relaxed(smmu->base + off) & mask;
+	}
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
 static void smmu_host_stage2_idmap(phys_addr_t start, phys_addr_t end, int prot)
 {
 }
@@ -158,4 +283,5 @@ static void smmu_host_stage2_idmap(phys_addr_t start, phys_addr_t end, int prot)
 struct kvm_iommu_ops smmu_ops = {
 	.init				= smmu_init,
 	.host_stage2_idmap		= smmu_host_stage2_idmap,
+	.dabt_handler			= smmu_dabt_handler,
 };
diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h
index 3550fa695539..dfeaed728982 100644
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
@@ -16,6 +20,7 @@
  * @oas			PA size
  * @pgsize_bitmap	Supported page sizes
  * @sid_bits		Max number of SID bits supported
+ * @lock		Lock to protect SMMU
  */
 struct hyp_arm_smmu_v3_device {
 	phys_addr_t		mmio_addr;
@@ -26,6 +31,11 @@ struct hyp_arm_smmu_v3_device {
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
2.52.0.rc1.455.g30608eb744-goog


