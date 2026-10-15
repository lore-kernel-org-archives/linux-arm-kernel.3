Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C047CC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 20:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=laM6+wZiNuYMQDtQzAoP4s+131ogUMmRLEJwdwwKDsc=; b=bbxSARAYG/nXrO1NrfphPUYYu4
	2IpL/ES5hrgkLN192oHW4D5gk162hooGq+sJ2STA6edl72nk98xKIMhUn9bq1V+vtjqEsqrEnOVsC
	qPGx6u31nZlRtOeWr0m+m+xTl1L0/MKNkGLnGM/qMlafEGWmWTWX0PJ7WaPUl8liYGQKUZcdUk0ij
	hnux5dQr8Htxp4xuk6vGA7Y99O4CHTjmlvRkiZbbmKCxhe/tJjkPZSdZcQirzx2birtcIT+5E5lxN
	iBSDHvzdxzr4+rWDtnr8dcWeQEl4kPLSOPOWwCP7/q6DSCmoy/01/MzO8j6LFMsXsquHsLUNZreCV
	nBn+Vyww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHRlj-00000001ILT-1oaI;
	Thu, 15 Oct 2026 20:09:39 +0000
Received: from mail-wm1-x346.google.com ([2a00:1450:4864:20::346])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHRlU-00000001I46-1D7l
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 20:09:25 +0000
Received: by mail-wm1-x346.google.com with SMTP id 5b1f17b1804b1-4a01d1fb07bso28035175e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 13:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792094962; x=1792699762; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=laM6+wZiNuYMQDtQzAoP4s+131ogUMmRLEJwdwwKDsc=;
        b=iVUC/tWNDKHcUCxnLn83CSmPa+gbuicj4G/8m6UE/hnD6GSYaPAvsoTtXPlBeB6IBk
         m5kTSWgxTfo+g2dBaH26vjD/AogQ2Hc79jkqYoZ0hFe+93ATsYuNw4n1JJm4eHyGIbtZ
         4lnWZQgWB1tEYZBpWx7aWqW5nGAqVzPT6ivU+3JJgPxqCIYHEnK6VUX6bTFRbCXEBHsq
         DOBxdoefOpO2gf/I9Ohzf20+QoQUI4KSu0eWJHVAuH7aBzNuPAyz1i3/tl08eu7LOAot
         uEYhTcvZfDaUzrLmFgi8X+dsKkUrFQqNHf8tGOa6r4CxM6kBqsgR+EvvcNo10eQn0oNV
         Y/XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792094962; x=1792699762;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=laM6+wZiNuYMQDtQzAoP4s+131ogUMmRLEJwdwwKDsc=;
        b=2AIMBeBkfc0YrvDWj6vcAsKgZUTAcg5FwLYL05jhgRfPpFKxIjgYODLIbpqmwFGUNM
         rn9Epya0HANaTmR5OkRmBgRvc9W6azX3QPj0/6lGoKVvwwO13nO17Bg3VEU7qm1um8ZM
         7hmuNXUyR2QAlZ5Z4M/2AiA3pDV4jhI4/p3fY5qjziPHciBsXjT5WNFxtn1JnNZ9DXoX
         c5IJnvu3Svvgg+afXMxhKuqreQUfmSnPk0InWsgcg/chiNtc9rSzF5raqi6MTzkxBzxz
         va6IyrvJjHHuYnA2PMwFIj0SHswc1PQ+1lul9A5fRkUCTo0WBiUq6YGKrl8VT5jXmmIM
         BKlQ==
X-Gm-Message-State: AFq9FYKkQHFsNSz1+SGEjRFxKl1NGtBhitpVNDYzkDF8MHfeSSLdpMQZ
	Yq18408i/pwY1EPJhZooOhs/731T4hDi3JAPXh+HtbA213JrW+PnKs9vAFVZr4QvomZqLmPoG8g
	eBBSpE8cHjLI6MUpWKEzwjCIbLz0nPr6biZEOckdHq+OJ2w/4j5LLkS/7suRTJDKRneN4B5XYZs
	z/DCo1Ks4u8iPpUURnCKbnBaLaRW0GEMU42TmdnDU0862has70RO0bA/lxliJe/xTH/w==
X-Received: from wmbd8.prod.google.com ([2002:a05:600c:58c8:b0:4a1:8444:ff6d])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4e4a:b0:4a1:ac66:6ac8 with SMTP id 5b1f17b1804b1-4a1c7fa065fmr12093425e9.4.1792094961525;
 Thu, 15 Oct 2026 13:09:21 -0700 (PDT)
Date: Thu, 15 Oct 2026 20:08:40 +0000
In-Reply-To: <20261015200903.2735565-1-smostafa@google.com>
Mime-Version: 1.0
References: <20261015200903.2735565-1-smostafa@google.com>
X-Mailer: git-send-email 2.56.0.176.g3575e65682-goog
Message-ID: <20261015200903.2735565-10-smostafa@google.com>
Subject: [PATCH v9 09/25] KVM: arm64: iommu: Support DABT for IOMMU
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
X-CRM114-CacheID: sfid-20261015_130924_412599_366C8B83 
X-CRM114-Status: GOOD (  17.47  )
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

The pKVM SMMUv3 driver emulates the SMMU registers for the host: the
MMIO is donated to the hypervisor so that host accesses trap, and the
hypervisor performs or rejects each access on the host's behalf.

Add a dabt_handler op and call it from the host data abort path for
aborts with a valid instruction syndrome on non-memory addresses. If
the driver emulates the access, skip the faulting instruction,
otherwise take the normal path, where hyp-owned MMIO is denied.

Only aborts with a valid instruction syndrome can be emulated, so the
host must access emulated registers with single-register loads and
stores (readl/writel and friends).

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 arch/arm64/kvm/hyp/include/nvhe/iommu.h |  9 +++++++++
 arch/arm64/kvm/hyp/nvhe/iommu.c         |  6 ++++++
 arch/arm64/kvm/hyp/nvhe/mem_protect.c   | 17 +++++++++++++++++
 3 files changed, 32 insertions(+)

diff --git a/arch/arm64/kvm/hyp/include/nvhe/iommu.h b/arch/arm64/kvm/hyp/include/nvhe/iommu.h
index acd5058ef3ed..bd6604f194b5 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/iommu.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/iommu.h
@@ -13,6 +13,13 @@ struct pkvm_iommu_ops {
 	 * with the same @prot, which must succeed.
 	 */
 	int (*host_stage2_idmap)(phys_addr_t start, phys_addr_t end, int prot);
+	/*
+	 * Emulate a host data abort on MMIO @addr
+	 * @esr has a valid instruction syndrome and @regs holds the host x0-x30,
+	 * SRT 31 is the zero register. Return true if the access was emulated,
+	 * which would skip the instruction.
+	 */
+	bool (*dabt_handler)(struct user_pt_regs *regs, u64 esr, u64 addr);
 };
 
 int pkvm_iommu_init(void *pool_base, unsigned int nr_pages);
@@ -25,4 +32,6 @@ void *pkvm_iommu_alloc_pages(u8 order);
 /* Free pages from pkvm_iommu_alloc_pages(). */
 void pkvm_iommu_free_pages(void *ptr);
 
+bool pkvm_iommu_host_dabt_handler(struct user_pt_regs *regs, u64 esr, u64 addr);
+
 #endif /* __ARM64_KVM_NVHE_IOMMU_H__ */
diff --git a/arch/arm64/kvm/hyp/nvhe/iommu.c b/arch/arm64/kvm/hyp/nvhe/iommu.c
index 36432bd46c78..cdf6e87bb68e 100644
--- a/arch/arm64/kvm/hyp/nvhe/iommu.c
+++ b/arch/arm64/kvm/hyp/nvhe/iommu.c
@@ -149,3 +149,9 @@ void pkvm_iommu_free_pages(void *ptr)
 {
 	hyp_put_page(&iommu_pages_pool, ptr);
 }
+
+bool pkvm_iommu_host_dabt_handler(struct user_pt_regs *regs, u64 esr, u64 addr)
+{
+	return pkvm_iommu_ops && pkvm_iommu_ops->dabt_handler &&
+	       pkvm_iommu_ops->dabt_handler(regs, esr, addr);
+}
diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index c14af6a4877c..523bb6bd793b 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -13,6 +13,7 @@
 #include <asm/kvm_pkvm.h>
 #include <asm/stage2_pgtable.h>
 
+#include <hyp/adjust_pc.h>
 #include <hyp/fault.h>
 
 #include <nvhe/arm-smccc.h>
@@ -778,6 +779,12 @@ static void host_inject_mem_abort(struct kvm_cpu_context *host_ctxt)
 	inject_host_exception(esr);
 }
 
+static bool is_dabt_with_isv(u64 esr)
+{
+	return (ESR_ELx_EC(esr) == ESR_ELx_EC_DABT_LOW) &&
+		(esr & ESR_ELx_ISV);
+}
+
 void handle_host_mem_abort(struct kvm_cpu_context *host_ctxt)
 {
 	struct kvm_vcpu_fault_info fault;
@@ -800,6 +807,16 @@ void handle_host_mem_abort(struct kvm_cpu_context *host_ctxt)
 	BUG_ON(!(fault.hpfar_el2 & HPFAR_EL2_NS));
 	addr = FIELD_GET(HPFAR_EL2_FIPA, fault.hpfar_el2) << 12;
 
+	/*
+	 * Let the IOMMU driver emulate accesses to its MMIO.
+	 */
+	if (is_dabt_with_isv(esr) && !addr_is_memory(addr) &&
+	    pkvm_iommu_host_dabt_handler(&host_ctxt->regs, esr,
+					 addr | FAR_TO_FIPA_OFFSET(fault.far_el2))) {
+		kvm_skip_host_instr();
+		return;
+	}
+
 	switch (host_stage2_idmap(addr)) {
 	case -EPERM:
 		host_inject_mem_abort(host_ctxt);
-- 
2.56.0.176.g3575e65682-goog


