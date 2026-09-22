Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78319C982FF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 13:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q7lwUocssBorXppr+cuEfwSHFlo2ooUh5GMt4e7kXAU=; b=xl6Ex7+erK1hm0dc+fKh/l8oK9
	Owl9vbuzIAfkPGfol3Dzjb9tHOLDNfExIcpNmGp9e4/CnAHcxc8s+O8xSwy+/AJrKoqRw173gyakO
	F0JrfPJDtTANbtHALkqElBnYZMr3Jntxpr+gjMgqyO0/0AeziD5jRBJ1/KWWtpi1+PB8u/LZCAH3j
	1xGVI32kRaQaHNzeNMHEROsBXAPgkehj+eSocpSjwmsWw+HGl4p5d0ksl42mgsT2LuJ4AEvibbKsY
	d3d+ion+jOwloOVubxdgpWLtDOlpIAPSa+5V7u02kaEKBwuj5T9QdFK182ALt1Kq4lYtx7HmRhA8n
	fFUSYV2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x90Je-00000005SZk-1EuR;
	Tue, 22 Sep 2026 13:13:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x90JB-00000005SEA-3m93
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 22 Sep 2026 13:13:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Q7lwUocssBorXppr+cuEfwSHFlo2ooUh5GMt4e7kXAU=; b=nlbg6zyajiYjI7VJ2JmKIeINaB
	xdGPeXL9dHyRC9/Uvanfu6wgR1IbpRneTss445MVjZZsOJAHbi/Olk1FPDJIVK70u3nef6+PFntQ7
	rbFttiVe4wYQ4d0tWNxUKaeOTHZdRO+mIKPe1RWQ5l7oGlqBnWSjjRexL94lZFyffqIatYdrPOVoU
	/FNdppGqAXRvh8mLwYADQ+9ppmbVd5eKkrVf0qAUVk9ZOAy4HLuNxQ3BGHA1ZHMjUGqPtgzXZ82m3
	o31sKqGSIowV6LPZ4cr9e2OUksI/6Fd5qp7xC4t/T50jzaRrK2mGCnMiVfYAJeIt7sZozVGq79ukI
	zd+YvRag==;
Received: from mail-wm1-x348.google.com ([2a00:1450:4864:20::348])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x90J9-0000000DbZo-0KBR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 13:13:16 +0000
Received: by mail-wm1-x348.google.com with SMTP id 5b1f17b1804b1-490a767c7dcso31188315e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 06:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790082793; x=1790687593; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q7lwUocssBorXppr+cuEfwSHFlo2ooUh5GMt4e7kXAU=;
        b=b/Yl3OU0Bfcks41yQHEacHHoPUqwSthtAgGbUGfggQZxukhCa7C8MOJj+aL//nJbVm
         L4HaM399Xo1zvAA7G4TzWRrn1Umlb4wiPOBgYSvxbBXSdRfCHWZEsMkJwZGxplpwju2n
         6sBxJ5r1zMXpvp70w/T1BR/993Gqn0HAt8gMLsidGBPBeIXRNKMTOAb0KwLlT0RfWKIz
         qIhIoUq3NoLK4e98HG7MwomWNGBvpd01tBj6R949Z4UzWPPVipMKbQE/YRnflIwG/k5b
         Dn1CPL8MXvJujWrJBak0yw2BLeshz8CdttZzgNXL1C9IcMEjLZmrLWetr+W04aB5jTGj
         zznA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790082793; x=1790687593;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q7lwUocssBorXppr+cuEfwSHFlo2ooUh5GMt4e7kXAU=;
        b=RPVB7UD+RqY7TfMFm84jYMQnIpxB2IjGJqn7TwGvJabCWwMnXZiPnAE+fy3KoTocW0
         /xDCISQIimRPIDN0cqmdNAfMfA2QzmlF+Knhommq0NNrsah/DI81VFwVFJhKXcq2y4ok
         IJjIX7GEOS0AI61tBrcoHbeV9wjrVzC+USo2hRX04aZGGnVBOVP78fF7v3qwNbBxbu0i
         2ZyGjaJkyesHFRse5NF3kYDFMZF/hEiNbu1CE+qdxM/0wWPvwl5OIN9ZqlEAdp80WQLg
         6YZIt6gpYyFRm7/BSj7lXNyuwG/4uWKymuRno9HvURxx6Ov3ooHlBnjoxFae/FW6u4J/
         DNpA==
X-Gm-Message-State: AFuF++n4/AvXb3qiDljd2njixxO4KV25ebAx4PV2n1v/+MEHElKGjA8c
	yO1aQOv7P5su0SIA0bxY/d+hiG7PBz7GYUX1nMsKBG/KKmaSwzpcMEq4Kh9P7RvD9TH2re6Ax8Y
	zXKUpIDhmdAWJ54xht67JSmFj8mHYtOjudqenq5PxLMp9xapflcANow8VBlgv3ZFJESZlH67MVL
	v8caOVVf3bxZz66npJQEmTegkwCdzCHTO+USIug4NEQuiX1mRuP9TTKBr+l1mWhHCiBA==
X-Received: from wmco6.prod.google.com ([2002:a05:600c:a306:b0:49d:3263:b3be])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1989:b0:49c:e42b:a4ac with SMTP id 5b1f17b1804b1-49fc5714d14mr205647445e9.11.1790082793037;
 Tue, 22 Sep 2026 06:13:13 -0700 (PDT)
Date: Tue, 22 Sep 2026 13:12:42 +0000
In-Reply-To: <20260922131259.2975334-1-smostafa@google.com>
Mime-Version: 1.0
References: <20260922131259.2975334-1-smostafa@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260922131259.2975334-10-smostafa@google.com>
Subject: [PATCH v8 09/25] KVM: arm64: iommu: Support DABT for IOMMU
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
X-CRM114-CacheID: sfid-20260922_141315_304479_F64ED7E6 
X-CRM114-Status: GOOD (  16.34  )
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
 arch/arm64/kvm/hyp/include/nvhe/iommu.h |  2 ++
 arch/arm64/kvm/hyp/nvhe/iommu.c         | 14 ++++++++++++++
 arch/arm64/kvm/hyp/nvhe/mem_protect.c   | 15 +++++++++++++++
 3 files changed, 31 insertions(+)

diff --git a/arch/arm64/kvm/hyp/include/nvhe/iommu.h b/arch/arm64/kvm/hyp/include/nvhe/iommu.h
index 1fa728ab47d4..3f16879b5fa7 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/iommu.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/iommu.h
@@ -7,6 +7,7 @@
 struct pkvm_iommu_ops {
 	int (*init)(void);
 	int (*host_stage2_idmap)(phys_addr_t start, phys_addr_t end, int prot);
+	bool (*dabt_handler)(struct user_pt_regs *regs, u64 esr, u64 addr);
 };
 
 int pkvm_iommu_init(void *pool_base, unsigned int nr_pages);
@@ -18,5 +19,6 @@ int pkvm_iommu_host_stage2_idmap(phys_addr_t start, phys_addr_t end,
 void *pkvm_iommu_alloc_pages(u8 order);
 /* Free pages from pkvm_iommu_alloc_pages(). */
 void pkvm_iommu_free_pages(void *ptr);
+bool pkvm_iommu_host_dabt_handler(struct user_pt_regs *regs, u64 esr, u64 addr);
 
 #endif /* __ARM64_KVM_NVHE_IOMMU_H__ */
diff --git a/arch/arm64/kvm/hyp/nvhe/iommu.c b/arch/arm64/kvm/hyp/nvhe/iommu.c
index cacab0dc462a..b7b11f6616cd 100644
--- a/arch/arm64/kvm/hyp/nvhe/iommu.c
+++ b/arch/arm64/kvm/hyp/nvhe/iommu.c
@@ -5,8 +5,11 @@
  * Copyright (C) 2022 Linaro Ltd.
  */
 #include <linux/iommu.h>
+#include <asm/kvm_hyp.h>
 #include <asm/kvm_pkvm.h>
 
+#include <hyp/adjust_pc.h>
+
 #include <nvhe/iommu.h>
 #include <nvhe/mem_protect.h>
 #include <nvhe/spinlock.h>
@@ -158,3 +161,14 @@ void pkvm_iommu_free_pages(void *ptr)
 {
 	hyp_put_page(&iommu_pages_pool, ptr);
 }
+
+bool pkvm_iommu_host_dabt_handler(struct user_pt_regs *regs, u64 esr, u64 addr)
+{
+	if (pkvm_iommu_ops && pkvm_iommu_ops->dabt_handler &&
+	    pkvm_iommu_ops->dabt_handler(regs, esr, addr)) {
+		/* DABT handled by the driver, skip to next instruction. */
+		kvm_skip_host_instr();
+		return true;
+	}
+	return false;
+}
diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index da5014e4e96b..863c571e47e4 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -758,6 +758,12 @@ static void host_inject_mem_abort(struct kvm_cpu_context *host_ctxt)
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
@@ -780,6 +786,15 @@ void handle_host_mem_abort(struct kvm_cpu_context *host_ctxt)
 	BUG_ON(!(fault.hpfar_el2 & HPFAR_EL2_NS));
 	addr = FIELD_GET(HPFAR_EL2_FIPA, fault.hpfar_el2) << 12;
 
+	/*
+	 * Emulate data aborts for IOMMU drivers, other access will be denied
+	 * by host_stage2_adjust_range()
+	 */
+	if (is_dabt_with_isv(esr) && !addr_is_memory(addr) &&
+	    pkvm_iommu_host_dabt_handler(&host_ctxt->regs,
+					 esr, addr | FAR_TO_FIPA_OFFSET(fault.far_el2)))
+		return;
+
 	switch (host_stage2_idmap(addr)) {
 	case -EPERM:
 		host_inject_mem_abort(host_ctxt);
-- 
2.55.0.1082.g2b9226bbc0-goog


