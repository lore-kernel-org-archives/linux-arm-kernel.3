Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C6C5CEBF9A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 18:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UGnO/Bwz/Bdpjz8RxXVYUEJKHIK5XJgWwQocmBNRacI=; b=gkqnF0rjtfkj3vUObRRiCOBPAB
	0VdsL5B/pQ7pCirmKD+x91ya0ZBXCssKjkt+U2PkLsRakpevoo/XzOABRzJ4mkD96mIetw9539yUW
	WSGD/XmisWPf7CiUvdCYEO8MpaGrouAzfVhdOm9+FdVstQVeNAchtRndEChoCA9lOamNoKZ+1ricZ
	HZQ3iSVFF7JQfLYJyCdVGtoqP+QEpASaMIpBqIb7zVVcd7JZXedn10EDAaYALSNVqJuW4xz7hXWx+
	dO88f/SfzjsMDYMSuuRU3IE+mipsB5+rKhXvxBhuR1qBqhSv/QeJWm3+b/juzSi9EzNfRrKMwNjKS
	ZfIudqbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL4HW-0000000Gdlb-20aE;
	Mon, 17 Nov 2025 18:48:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL4HL-0000000GdYb-04qe
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 17 Nov 2025 18:48:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=UGnO/Bwz/Bdpjz8RxXVYUEJKHIK5XJgWwQocmBNRacI=; b=RdmUiOP7xUoZ44az4FINXbYG6H
	CUoiSakNfLqBnchbYY1cpEx6kTtJf9CdMdwQw2G76Hiwj2cwyM3k1Kq4j48fuMPdNW3PmmuWRvWEA
	YWeUSlsawb5OC+l4Tgi9KqLSYvcKSTs1x51JGnQ9d67AvCobTwgTnfEr7MXLsEDGLoZ7oOd5rTMO+
	da4U//AduOmkILQFOpLsDJPUss/mPJTN/UgcBeWudbLio0+DieaC8goxFoHEbtZ5j90cyeZ/mNZ7D
	MfUfFnQgO6S27lTdeI7vUSqWu2FVyt9ytceZgkj/VxKthGX/M1uRF9amBQUTecT3KJpMByWv+zFh5
	G5GpmtIA==;
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL3Pd-00000007wae-0tgw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 17:53:16 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-4779b3749a8so3691295e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 10:48:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763405317; x=1764010117; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=UGnO/Bwz/Bdpjz8RxXVYUEJKHIK5XJgWwQocmBNRacI=;
        b=Uc8nMw+Nb9Ylkt7BeakldcwNpwRlxX+AZbAzCDieg3EWLcZAUA6P1BiC8kyJ9bnFSA
         nhI3aEnwxHXrJFwZwcN7nmzK/fN5tJwzHrrxlKi4mjBdvJMxoKyVx2toedSE0GXcTplr
         Yq223lFefOS9O5vLWSXg/YREqtk3yMMoYwzD1wMUrQJ1snwchjNIsSS/hkdWK3go25Br
         JNz3H0gBasVA9rcqemtM9cn2FHSJ9QTYhJZF8gP44WsOp81OSiOZgmQlUXkgKuV7btEp
         VqDJzpghdGMxdDq4ju5U8zdeiZYdnL1kWYyOt2Ju+REyKDPWet8GG79T1oOM20SqVAYf
         Xfbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763405317; x=1764010117;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UGnO/Bwz/Bdpjz8RxXVYUEJKHIK5XJgWwQocmBNRacI=;
        b=TrDulCCC3IqUIFAL41FFdthaPzmT8x0JCivkBJZCII8sxgtJtcBKiKa0cfuoFrkDUP
         epNPTzAZ8+MridfyhxXcLTgt5pyqZXVGDZ6WsSyBk06OyTDaad8etLcPUkovqOsAKk0/
         fouu0VwNQMFV5Zfr6lsu61NVEH3GPm/V424D+45dVOJJuUEEruhHwyMbUaVN/QyDK/qU
         kQHQSTekG9pNUuCk06WMgaoh2OjP8dPjwYy/kuhAokFStAJALvvEoMOQGS7dNei4i6Wq
         vduUgjpEfjfiMccHiZlq8fX0F2b2QV4xT2ophcwcFIXa/q2RsMH2JkAiJWL4hEJGp1rb
         bmSA==
X-Gm-Message-State: AOJu0YxEq9n/RvT6ul6gDBXDieO+3hSUroXqzzZrkWFtyExBCt7EC+K7
	gDRxx+276jsaR3kfo/waAoBlvmZDBQZu4Ng1Ix/OGmzwKvDh5tly3+6GlSHaPbtbUUDYxKc3FTF
	yRDhCIWHA61ZIvWaOYsVK1XeKXJ9oXk/EOC5cMxytv72XEWvwViSn7K1KaVxUjdIeMajVtdoIRF
	c+acYit2VVKDffW2kw7u6/rOO77AgjNSMxpWw1Jdp5indNkt0mdXMS2MMjJ5zjyh6J6g==
X-Google-Smtp-Source: AGHT+IFrvnE51rjqhZgZikSAId4eBRwM0rBdtcUofGQG56OV6eJr8JyqvovBQ6X7CtmMQHN+xu1fxfhfh3qxIg==
X-Received: from wmbgz10.prod.google.com ([2002:a05:600c:888a:b0:477:afa:d217])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8b23:b0:477:7bd2:693f with SMTP id 5b1f17b1804b1-4778fe60615mr126251305e9.6.1763405317263;
 Mon, 17 Nov 2025 10:48:37 -0800 (PST)
Date: Mon, 17 Nov 2025 18:47:58 +0000
In-Reply-To: <20251117184815.1027271-1-smostafa@google.com>
Mime-Version: 1.0
References: <20251117184815.1027271-1-smostafa@google.com>
X-Mailer: git-send-email 2.52.0.rc1.455.g30608eb744-goog
Message-ID: <20251117184815.1027271-12-smostafa@google.com>
Subject: [PATCH v5 11/27] KVM: arm64: iommu: Support DABT for IOMMU
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
X-CRM114-CacheID: sfid-20251117_175313_331652_DABBD39B 
X-CRM114-Status: GOOD (  16.14  )
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

SMMUv3 driver need to trap and emulate access to the MMIO space
to provide emulation for the kernel.

Add a handler for DABTs for IOMMU drivers to be able to do so, in
case the host fault in page, check if it's part of IOMMU emulation
first.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 arch/arm64/include/asm/kvm_arm.h        |  2 ++
 arch/arm64/kvm/hyp/include/nvhe/iommu.h |  3 ++-
 arch/arm64/kvm/hyp/nvhe/iommu/iommu.c   | 15 +++++++++++++++
 arch/arm64/kvm/hyp/nvhe/mem_protect.c   | 10 ++++++++++
 4 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/kvm_arm.h b/arch/arm64/include/asm/kvm_arm.h
index 1da290aeedce..8d63308ccd5c 100644
--- a/arch/arm64/include/asm/kvm_arm.h
+++ b/arch/arm64/include/asm/kvm_arm.h
@@ -331,6 +331,8 @@
 
 /* Hyp Prefetch Fault Address Register (HPFAR/HDFAR) */
 #define HPFAR_MASK	(~UL(0xf))
+
+#define FAR_MASK GENMASK_ULL(11, 0)
 /*
  * We have
  *	PAR	[PA_Shift - 1	: 12] = PA	[PA_Shift - 1 : 12]
diff --git a/arch/arm64/kvm/hyp/include/nvhe/iommu.h b/arch/arm64/kvm/hyp/include/nvhe/iommu.h
index 9f4906c6dcc9..10fe4fbf7424 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/iommu.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/iommu.h
@@ -8,6 +8,7 @@
 struct kvm_iommu_ops {
 	int (*init)(void);
 	void (*host_stage2_idmap)(phys_addr_t start, phys_addr_t end, int prot);
+	bool (*dabt_handler)(struct user_pt_regs *regs, u64 esr, u64 addr);
 };
 
 int kvm_iommu_init(void *pool_base, size_t nr_pages);
@@ -16,5 +17,5 @@ void kvm_iommu_host_stage2_idmap(phys_addr_t start, phys_addr_t end,
 				 enum kvm_pgtable_prot prot);
 void *kvm_iommu_donate_pages(u8 order);
 void kvm_iommu_reclaim_pages(void *ptr);
-
+bool kvm_iommu_host_dabt_handler(struct user_pt_regs *regs, u64 esr, u64 addr);
 #endif /* __ARM64_KVM_NVHE_IOMMU_H__ */
diff --git a/arch/arm64/kvm/hyp/nvhe/iommu/iommu.c b/arch/arm64/kvm/hyp/nvhe/iommu/iommu.c
index a0df34ecf6b0..c9f2103a25fe 100644
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
@@ -113,3 +117,14 @@ void kvm_iommu_reclaim_pages(void *ptr)
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
index f60acfb868d0..4c47df895579 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -595,6 +595,11 @@ static int host_stage2_idmap(u64 addr)
 	return ret;
 }
 
+static bool is_dabt(u64 esr)
+{
+	return ESR_ELx_EC(esr) == ESR_ELx_EC_DABT_LOW;
+}
+
 void handle_host_mem_abort(struct kvm_cpu_context *host_ctxt)
 {
 	struct kvm_vcpu_fault_info fault;
@@ -617,6 +622,11 @@ void handle_host_mem_abort(struct kvm_cpu_context *host_ctxt)
 	 */
 	BUG_ON(!(fault.hpfar_el2 & HPFAR_EL2_NS));
 	addr = FIELD_GET(HPFAR_EL2_FIPA, fault.hpfar_el2) << 12;
+	addr |= fault.far_el2 & FAR_MASK;
+
+	if (is_dabt(esr) && !addr_is_memory(addr) &&
+	    kvm_iommu_host_dabt_handler(&host_ctxt->regs, esr, addr))
+		return;
 
 	ret = host_stage2_idmap(addr);
 	BUG_ON(ret && ret != -EAGAIN);
-- 
2.52.0.rc1.455.g30608eb744-goog


