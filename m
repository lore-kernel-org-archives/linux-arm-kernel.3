Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18C98E77180
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 18:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jZNgwB6X8v5j4gzxppU/t/fZqzqcDrO7o9YkYVnh2wA=; b=Oe3QOJG+xW3/7S4bZI6vmZW4Bq
	IZ03yj5eaQplfzg/O0MudimjXxhUo5TxG/o6WGWAxM4BGVz2TvqykzQrQceR4v0gNNeL6U2FtFTSR
	YFn1h9QJXxQKbuU5sL9tMnlF464aM9Kcr2kM5eTEX4bGmO8+2Qbtj861XiFJUFZdeMZ2sf7PwWMob
	9zPMrB8si+PxMrc5qAHQdTTLpo4HtG30RkYnDk/Wvi5X0Crsmf3x5Zbz/pRtO/rCysAfvXgn78YlR
	Ua29H6RaFHAS1fFod6Kpi/UKMr7BtBFiQCA7Fmer5PDbSsY0UouQxpnb4x3khyGswe0Pxj6Z/A02T
	zixj1e2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLnyi-00000001Qpb-3b1h;
	Thu, 12 Dec 2024 18:32:00 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLnZ9-00000001Jn8-3TxX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 18:05:36 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-43628594d34so2694125e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 10:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734026734; x=1734631534; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=jZNgwB6X8v5j4gzxppU/t/fZqzqcDrO7o9YkYVnh2wA=;
        b=IoUHxl3qfjZXh0B214GbyDv60bFFebS94Y4nQv0zgXhi0b2gjl4+/ne2QZOePRIwna
         bjrXop/SYrTn/XY+m73g0lVENM6fY+FGD4t2+CbZ/Wo/dVg0tO8Qnh+2+bmn3RmgeKLt
         9lRLOhzhelKEDdhsZ3iOyWLRKEA7J7fo0qw+biG/BEw0Ekbgvx0mkFq7KWuJgeMKq9qe
         rM6B76RqV9tibgOhZq9nyiUxeWTmZnQhK9nbh5huobbCdv7PLIgvhAG2gp9HA5hGKxxt
         UHSS+KxpHIi9eK0KegeYhlFGug4ktUm0CPrJFCjd4SJNTzFn9JXHS5TwKPhaimnxRrwf
         /bgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734026734; x=1734631534;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jZNgwB6X8v5j4gzxppU/t/fZqzqcDrO7o9YkYVnh2wA=;
        b=M/LrSc5KKqHCY6CBOgodvP2/nQ4cuiIa6gAYq1naBdXGQyEFyS8QX8cl0P51UEe9md
         emMCZc+pWrtJojr+ziYODGboDNctJg27Lgl1sRssALc5Kq0MyasLMJk7ig1HRNbn78qp
         NwkGrVm+/FyZDO1WyXZXbRqZnP2WK7MGx3ZzJl4jVk+aOLnRCRxaltisdQvTGjrvhaHp
         iGCLDRvZi+IyXGPmrZ7EZOP9hNQkZdmzAJlYsw/mCnCR5Az4dCC175xmqBO0bsMrr9Kw
         e5rNKBH4OPR78W5R71SwBalAEf3OMitUSS3gp5eUECLF/pw7ZTONv8OBQPat0h/itO2w
         847g==
X-Forwarded-Encrypted: i=1; AJvYcCWKswIJMlQPdePBStbrpZV/rSfRW2eKvhEUNESjvq2/Yr2ZCzwLgncanXaHuckdrYph46kpMS9uWV5/wn56LQkx@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2haBMgUKrlR/BXf5eKSNaFCmy+5IAdzIhXTx1RIrSPoxyefSB
	aJiJl4rMHhKjvqGZqsP1GHXMgB5OFPaoxz4xrH4vUGzOmWMo02VR655LDIP9Jnaf63jeh87XHAq
	IFYDLOCPtmA==
X-Google-Smtp-Source: AGHT+IFU5A2xYG/aIaT/yYE5/fNPeYIneyer4lpXo+usrcm3VGdKeb0NPMFh6orkypYDcbhz8IOsQoPR+yxjUA==
X-Received: from wmmu14.prod.google.com ([2002:a05:600c:ce:b0:434:f0a3:7876])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3593:b0:434:f297:8e85 with SMTP id 5b1f17b1804b1-4361c3aaeeemr77507485e9.10.1734026733780;
 Thu, 12 Dec 2024 10:05:33 -0800 (PST)
Date: Thu, 12 Dec 2024 18:03:48 +0000
In-Reply-To: <20241212180423.1578358-1-smostafa@google.com>
Mime-Version: 1.0
References: <20241212180423.1578358-1-smostafa@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241212180423.1578358-25-smostafa@google.com>
Subject: [RFC PATCH v2 24/58] KVM: arm64: iommu: Support DABT for IOMMU
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
X-CRM114-CacheID: sfid-20241212_100535_867469_E543A58D 
X-CRM114-Status: GOOD (  18.36  )
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

Soon, SMMUv3 driver would be added and it would need to emulate
access to some of its MMIO space.

Add a handler for DABTs for IOMMU drivers to be able to do so.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 arch/arm64/kvm/hyp/include/nvhe/iommu.h |  2 ++
 arch/arm64/kvm/hyp/nvhe/iommu/iommu.c   | 17 +++++++++++++++++
 arch/arm64/kvm/hyp/nvhe/mem_protect.c   | 19 +++++++++++++++++--
 3 files changed, 36 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/hyp/include/nvhe/iommu.h b/arch/arm64/kvm/hyp/include/nvhe/iommu.h
index 06d12b35fa3e..cff75d67d807 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/iommu.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/iommu.h
@@ -21,6 +21,7 @@ size_t kvm_iommu_map_pages(pkvm_handle_t domain_id,
 size_t kvm_iommu_unmap_pages(pkvm_handle_t domain_id, unsigned long iova,
 			     size_t pgsize, size_t pgcount);
 phys_addr_t kvm_iommu_iova_to_phys(pkvm_handle_t domain_id, unsigned long iova);
+bool kvm_iommu_host_dabt_handler(struct kvm_cpu_context *host_ctxt, u64 esr, u64 addr);
 
 /* Flags for memory allocation for IOMMU drivers */
 #define IOMMU_PAGE_NOCACHE				BIT(0)
@@ -49,6 +50,7 @@ struct kvm_iommu_ops {
 	phys_addr_t (*iova_to_phys)(struct kvm_hyp_iommu_domain *domain, unsigned long iova);
 	void (*iotlb_sync)(struct kvm_hyp_iommu_domain *domain,
 			   struct iommu_iotlb_gather *gather);
+	bool (*dabt_handler)(struct kvm_cpu_context *host_ctxt, u64 esr, u64 addr);
 };
 
 int kvm_iommu_init(void);
diff --git a/arch/arm64/kvm/hyp/nvhe/iommu/iommu.c b/arch/arm64/kvm/hyp/nvhe/iommu/iommu.c
index fbab335d3490..e45dadd0c4aa 100644
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
 #include <kvm/iommu.h>
 
 #include <nvhe/iommu.h>
@@ -375,6 +379,19 @@ phys_addr_t kvm_iommu_iova_to_phys(pkvm_handle_t domain_id, unsigned long iova)
 	return phys;
 }
 
+bool kvm_iommu_host_dabt_handler(struct kvm_cpu_context *host_ctxt, u64 esr, u64 addr)
+{
+	bool ret = false;
+
+	if (kvm_iommu_ops && kvm_iommu_ops->dabt_handler)
+		ret = kvm_iommu_ops->dabt_handler(host_ctxt, esr, addr);
+
+	if (ret)
+		kvm_skip_host_instr();
+
+	return ret;
+}
+
 static int iommu_power_on(struct kvm_power_domain *pd)
 {
 	struct kvm_hyp_iommu *iommu = container_of(pd, struct kvm_hyp_iommu,
diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index a428ad9ca871..0fae651107db 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -16,6 +16,7 @@
 #include <hyp/fault.h>
 
 #include <nvhe/gfp.h>
+#include <nvhe/iommu.h>
 #include <nvhe/memory.h>
 #include <nvhe/mem_protect.h>
 #include <nvhe/mm.h>
@@ -799,11 +800,16 @@ static int handle_host_perm_fault(struct kvm_cpu_context *host_ctxt, u64 esr, u6
 	return handled ? 0 : -EPERM;
 }
 
+static bool is_dabt(u64 esr)
+{
+	return ESR_ELx_EC(esr) == ESR_ELx_EC_DABT_LOW;
+}
+
 void handle_host_mem_abort(struct kvm_cpu_context *host_ctxt)
 {
 	struct kvm_vcpu_fault_info fault;
 	u64 esr, addr;
-	int ret = 0;
+	int ret = -EPERM;
 
 	esr = read_sysreg_el2(SYS_ESR);
 	if (!__get_fault_info(esr, &fault)) {
@@ -817,7 +823,15 @@ void handle_host_mem_abort(struct kvm_cpu_context *host_ctxt)
 	}
 
 	addr = (fault.hpfar_el2 & HPFAR_MASK) << 8;
-	ret = host_stage2_idmap(addr);
+	addr |= fault.far_el2 & FAR_MASK;
+
+	if (is_dabt(esr) && !addr_is_memory(addr) &&
+	    kvm_iommu_host_dabt_handler(host_ctxt, esr, addr))
+		goto return_to_host;
+
+	/* If not handled, attempt to map the page. */
+	if (ret == -EPERM)
+		ret = host_stage2_idmap(addr);
 
 	if ((esr & ESR_ELx_FSC_TYPE) == ESR_ELx_FSC_PERM)
 		ret = handle_host_perm_fault(host_ctxt, esr, addr);
@@ -827,6 +841,7 @@ void handle_host_mem_abort(struct kvm_cpu_context *host_ctxt)
 	else
 		BUG_ON(ret && ret != -EAGAIN);
 
+return_to_host:
 	trace_host_mem_abort(esr, addr);
 }
 
-- 
2.47.0.338.g60cca15819-goog


