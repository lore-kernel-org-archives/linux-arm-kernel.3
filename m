Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E406CCCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 11:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9kXrhx388xhTRL3MvJdHy6WWnE8EmOsHEooLjon0268=; b=l8Iz+6oV8JIPszL8erDcg2I26r
	0t35z9IBKAeUfPvCnUSYMN7ZVKjMLVT6Rc0G8wRyvEiLGEePDcx1mDJA+SdHfY/clklwIWSM5Q3tV
	dlNtp2VQ/zvB+im+3S+P6Lv+jsfU2r0WhpjbeJti5jMMLQv2WvuJ8WRxWFI55eitwMpJTufg8R7/R
	PjteUSFcuz6diX2PwHaMpDzqrOF5gs7mM0UJKCnna2u93vnPgs/YmfxDx4qYQ7kQHAjElf+aKvn7X
	dMtI8D9io7MsveGRycfJCWpCu4janAi1sW/QdR5FwaKSasNuOrFPPdwX7KCOlrgwunN82+hj+j61G
	5hvX6S+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIluq-00000006coR-10vZ;
	Fri, 01 May 2026 11:20:16 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIluo-00000006cjw-1wVe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 11:20:15 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-488bd1ee9e7so20148815e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 May 2026 04:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777634412; x=1778239212; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=9kXrhx388xhTRL3MvJdHy6WWnE8EmOsHEooLjon0268=;
        b=gP7Nz+/2z3MZj+b4cRzLKwqhvuLq91G/q65Avw5BhCUXvlzU5/qnmddW+Gy4yHZ28h
         NGqUdHtOBmItJp4zO0P6hwkWGwX4h67dFJhZFpaRqZLch4jzX35n1otN2e183u5PFfyZ
         TrPqfvE8BOw2rAlWSUf4IZinQaDA9uWE7XzJNHqVg8Tb0Nk2wzWPBFpcag3FN67+7vtO
         5yx24iXCI9BbKvJEr2faHlUhTrogMx+XmJmRH7qSiRGFeAopl75cjc0I/Z8rpS6kSIff
         FxPm+WtcJdKJ0bVyAt/fmn86IDA3ZSoHAtef4r6hjZYt9deZvrvQJu9m4B0tQnBT3l7U
         7Fow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777634412; x=1778239212;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9kXrhx388xhTRL3MvJdHy6WWnE8EmOsHEooLjon0268=;
        b=M+HV+SBwfImC41Qr/AULkyEXCzqJZhZUSGIMlxLabk7pXm+ndRWgGLF/idRAd9kkmM
         m2LOHhVpu24HQENpZRZGbhHu0a9jlkqLoMUfyWcPpuFxQH7rR9EKd8gx2cyBF+lD6jg1
         BepuLfSZ04FccNefJJXi96TNs9X0hNykmMW60xoV4HJpp2EEhOIjrhd0gLtlbmIX1zog
         YbcAtJsaQ2bLPEq/71Z5ZesDnBwkI1sFu2/HNfBXx0cZ9ntEUTgCS1kg9oqR1dNlaAKT
         tIbQyNJOzkPQUpYSLz/2+6SujXGdiMUfKDvwRRJmyjX1T7puvTC1lIp/UY6N6gjHAvxO
         W6Jw==
X-Gm-Message-State: AOJu0YzKrYNpcIeDTDT3Em1SLf0m4UZ568NamXcY5+dkPIQYgmcbZsq1
	crIopT+NAL4mqmdh5+imkdxfcqe3Z8bh0IyJNK38KF4Mjkjy2WnNHArJx75AjpE6+sbXHVvhbEJ
	jWgashcrkwVWyENb4j/sYSop+bF83RfBnkhl1fAI4Mypo5KgpBmkOjjMEGm2tajUQo1opJtYiys
	6xHRUkUNSWDTIqUCjxcRE+90XKGiHBH6y7t/wrKStLSiAG2gcpWAOseBDj5dcFKDpkgQ==
X-Received: from wmat2.prod.google.com ([2002:a05:600c:6d02:b0:485:33e8:92af])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:c108:b0:485:40db:d40c with SMTP id 5b1f17b1804b1-48a8eb61ddfmr29338485e9.3.1777634412089;
 Fri, 01 May 2026 04:20:12 -0700 (PDT)
Date: Fri,  1 May 2026 11:19:12 +0000
In-Reply-To: <20260501111928.259252-1-smostafa@google.com>
Mime-Version: 1.0
References: <20260501111928.259252-1-smostafa@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260501111928.259252-11-smostafa@google.com>
Subject: [PATCH v6 10/25] KVM: arm64: iommu: Support DABT for IOMMU
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
X-CRM114-CacheID: sfid-20260501_042014_517100_DB94F701 
X-CRM114-Status: GOOD (  16.32  )
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

The pKVM SMMUv3 driver needs to trap and emulate access to the MMIO
space of the SMMUv3 to provide emulation for the kernel driver.

Add a handler for DABTs for IOMMU drivers to be able to do so.
In case the host causes a data abort, check if it's part of IOMMU
emulation first.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 arch/arm64/kvm/hyp/include/nvhe/iommu.h |  3 ++-
 arch/arm64/kvm/hyp/nvhe/iommu/iommu.c   | 15 +++++++++++++++
 arch/arm64/kvm/hyp/nvhe/mem_protect.c   | 15 +++++++++++++++
 3 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/include/nvhe/iommu.h b/arch/arm64/kvm/hyp/include/nvhe/iommu.h
index eba94b4f6050..e1b6f16391cc 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/iommu.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/iommu.h
@@ -8,6 +8,7 @@
 struct kvm_iommu_ops {
 	int (*init)(void);
 	int (*host_stage2_idmap)(phys_addr_t start, phys_addr_t end, int prot);
+	bool (*dabt_handler)(struct user_pt_regs *regs, u64 esr, u64 addr);
 };
 
 int kvm_iommu_init(void *pool_base, unsigned int nr_pages);
@@ -18,5 +19,5 @@ int kvm_iommu_host_stage2_idmap(phys_addr_t start, phys_addr_t end,
 /* Returns zeroed memory. */
 void *kvm_iommu_donate_pages(u8 order);
 void kvm_iommu_reclaim_pages(void *ptr);
-
+bool kvm_iommu_host_dabt_handler(struct user_pt_regs *regs, u64 esr, u64 addr);
 #endif /* __ARM64_KVM_NVHE_IOMMU_H__ */
diff --git a/arch/arm64/kvm/hyp/nvhe/iommu/iommu.c b/arch/arm64/kvm/hyp/nvhe/iommu/iommu.c
index 53cb5e4b0aac..b1474db016e5 100644
--- a/arch/arm64/kvm/hyp/nvhe/iommu/iommu.c
+++ b/arch/arm64/kvm/hyp/nvhe/iommu/iommu.c
@@ -4,6 +4,10 @@
  *
  * Copyright (C) 2022 Linaro Ltd.
  */
+#include <asm/kvm_hyp.h>
+
+#include <hyp/adjust_pc.h>
+
 #include <linux/iommu.h>
 
 #include <nvhe/iommu.h>
@@ -139,3 +143,14 @@ void kvm_iommu_reclaim_pages(void *ptr)
 {
 	hyp_put_page(&iommu_pages_pool, ptr);
 }
+
+bool kvm_iommu_host_dabt_handler(struct user_pt_regs *regs, u64 esr, u64 addr)
+{
+	if (kvm_iommu_ops && kvm_iommu_ops->dabt_handler &&
+	    kvm_iommu_ops->dabt_handler(regs, esr, addr)) {
+		/* DABT handled by the driver, skip to next instruction. */
+		kvm_skip_host_instr();
+		return true;
+	}
+	return false;
+}
diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index b54cb72ed88c..5c64007dba4d 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -788,6 +788,12 @@ static void host_inject_mem_abort(struct kvm_cpu_context *host_ctxt)
 	inject_host_exception(esr);
 }
 
+static bool is_mmio_dabt(u64 esr)
+{
+	return (ESR_ELx_EC(esr) == ESR_ELx_EC_DABT_LOW) &&
+		(esr & ESR_ELx_ISV);
+}
+
 void handle_host_mem_abort(struct kvm_cpu_context *host_ctxt)
 {
 	struct kvm_vcpu_fault_info fault;
@@ -810,6 +816,15 @@ void handle_host_mem_abort(struct kvm_cpu_context *host_ctxt)
 	BUG_ON(!(fault.hpfar_el2 & HPFAR_EL2_NS));
 	addr = FIELD_GET(HPFAR_EL2_FIPA, fault.hpfar_el2) << 12;
 
+	/*
+	 * Emulate data aborts for IOMMU drivers, other access will be denied
+	 * by host_stage2_adjust_range()
+	 */
+	if (is_mmio_dabt(esr) && !addr_is_memory(addr) &&
+	    kvm_iommu_host_dabt_handler(&host_ctxt->regs,
+					esr, addr | FAR_TO_FIPA_OFFSET(fault.far_el2)))
+		return;
+
 	switch (host_stage2_idmap(addr)) {
 	case -EPERM:
 		host_inject_mem_abort(host_ctxt);
-- 
2.54.0.545.g6539524ca2-goog


