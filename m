Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32113C44507
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 11:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nojqcuetD+/ikKOr3q9aYEmPsN9V6B5kzgOM/WeBKUw=; b=FWtbqN9izgzaDlU+zW2QNWYbs+
	d0Vy18Tu4OoJu9wc0KuOIeGMtXA6b5k5hd6EPEt5YbR7ij5FPxXNGeT0gu+W+sPK4+FUkmprHuOf7
	6mvm8IpEgmKhgUNj8QfpUjvhjXDvVTv4rpDd4OPTnZL8qi7K7W6dUoTBHi/LGhDp3FtddjrTs8C1v
	44TyWzToBM8pt7Fjb0LEfLGjwi0wROnZ5VQGeLsXUIupoG1JDLJPzQnXx0wfFvl2MMqHol1Vam3S6
	t1EEYR7Sfpe1ag4g7pJq6i9vKh82po3vHNFdumBQkFjg+v8G6YZiC9UKOf7Me0TdGDA+piltECGEj
	NS2EbslQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjyGx-0000000EfA8-1F0V;
	Wed, 15 Jul 2026 11:59:31 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjyGt-0000000Ef3l-0EsS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 11:59:28 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-493c55d5ce5so29689595e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 04:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784116764; x=1784721564; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nojqcuetD+/ikKOr3q9aYEmPsN9V6B5kzgOM/WeBKUw=;
        b=D/5J0ImmWYavumKlUNFIlXxmby7nZ0lrOY20bS67F6NEVQQ+pvPSOufUmdqbyGBkaQ
         xKbP7qkmHujw1vb1+Qe7qpPrV9S1bfTT5tL+olyUqa3RqYDPtvKLux++F2JK5+fR4adK
         RbbFrRG0ZIM+4vX8djwVloTWOC1/mybowV+kvgzybTcVDtQiP2nKDH2JfB7QQMqcFZOk
         LY7XWnhkoOg7xRYUsrzdPTp2WEHkvAt4MGfm04pdjla2Ork/VgizFEtVVJahZFPtW8Y7
         PrNEkYYS1xiS6Q+mXVdMR+c3zE9GntjioXnJG0vkeb5ZvRxAM3SZWY3qUxHmKPzu8fJs
         0Cyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784116764; x=1784721564;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nojqcuetD+/ikKOr3q9aYEmPsN9V6B5kzgOM/WeBKUw=;
        b=okrYJlLymeLAX5w+Gpt8Zar3F6DsmC28738cDGXUIS3g7aszq4KPclqNUSJ1otqlBH
         WhVGkZxRmzFsR+GducOydkS9YcuP1CfK4YbPftH5hg67qj6O8r1ip6aThDpX+THbHctD
         ai6Op1CZX1fzRTmY5VFMB0M4Bk7BYeckXC4+cXhqIuSB114JwP5/Dq08aQoaBAtOH4zy
         CrBP4nuSgWwXvCmiDpBCniN42b3TP7kMUl1n0CX/0SbeDNQgFt/MfWQYX0T9LtCLngcL
         /Wy1e1vqcblxwM+L9rtpFZDS3rmcvcAbykEnPEfTujxLkqzN3DsU1qpNBdSj18ftgsry
         FtpQ==
X-Gm-Message-State: AOJu0YwP+oHdJx0z3yN441e30wfo5/kWV+LPcWNW3dUPgloh4l5vZwZy
	PzHGp+Hd3sOMXGsBW60TDJ9W1ZGx1ZFnj8pI/fvV3DvcRTmOnko8JLfxV/Qvw03vJww1Fqq6KGI
	RZHvECrLosj/Wd+afstQtvpkjU/xF3ogn6jc5jgSiOPQ0weUZ5O8Qpz3X2kiDKZtNkLfhzwClQe
	M7fmsWWDOyGl/Ql92qqBpoO9S9UBesQw4MeMTGMnJNZS3wd8fSfUk5EeqeJkN3n+qFhQ==
X-Received: from wmbdx5.prod.google.com ([2002:a05:600c:63c5:b0:493:f781:b52f])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:5656:b0:493:c77c:108a with SMTP id 5b1f17b1804b1-4953c2897b9mr17716955e9.36.1784116763927;
 Wed, 15 Jul 2026 04:59:23 -0700 (PDT)
Date: Wed, 15 Jul 2026 11:58:50 +0000
In-Reply-To: <20260715115906.2664882-1-smostafa@google.com>
Mime-Version: 1.0
References: <20260715115906.2664882-1-smostafa@google.com>
X-Mailer: git-send-email 2.55.0.141.g00534a21ce-goog
Message-ID: <20260715115906.2664882-10-smostafa@google.com>
Subject: [PATCH v7 09/24] KVM: arm64: iommu: Support DABT for IOMMU
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
X-CRM114-CacheID: sfid-20260715_045927_124858_7DEBDED0 
X-CRM114-Status: GOOD (  16.80  )
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
 arch/arm64/kvm/hyp/nvhe/iommu.c         | 15 +++++++++++++++
 arch/arm64/kvm/hyp/nvhe/mem_protect.c   | 15 +++++++++++++++
 3 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/include/nvhe/iommu.h b/arch/arm64/kvm/hyp/include/nvhe/iommu.h
index 028e89a3448d..8b7521135792 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/iommu.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/iommu.h
@@ -8,6 +8,7 @@
 struct pkvm_iommu_ops {
 	int (*init)(void);
 	int (*host_stage2_idmap)(phys_addr_t start, phys_addr_t end, int prot);
+	bool (*dabt_handler)(struct user_pt_regs *regs, u64 esr, u64 addr);
 };
 
 int pkvm_iommu_init(void *pool_base, unsigned int nr_pages);
@@ -19,5 +20,5 @@ int pkvm_iommu_host_stage2_idmap(phys_addr_t start, phys_addr_t end,
 void *pkvm_iommu_donate_pages(u8 order);
 /* Free pages from pkvm_iommu_donate_pages(). Must use same size */
 void pkvm_iommu_reclaim_pages(void *ptr);
-
+bool pkvm_iommu_host_dabt_handler(struct user_pt_regs *regs, u64 esr, u64 addr);
 #endif /* __ARM64_KVM_NVHE_IOMMU_H__ */
diff --git a/arch/arm64/kvm/hyp/nvhe/iommu.c b/arch/arm64/kvm/hyp/nvhe/iommu.c
index 8891cb7920c4..8ea9c8c23985 100644
--- a/arch/arm64/kvm/hyp/nvhe/iommu.c
+++ b/arch/arm64/kvm/hyp/nvhe/iommu.c
@@ -4,6 +4,10 @@
  *
  * Copyright (C) 2022 Linaro Ltd.
  */
+#include <asm/kvm_hyp.h>
+
+#include <hyp/adjust_pc.h>
+
 #include <linux/iommu.h>
 #include <asm/kvm_pkvm.h>
 
@@ -157,3 +161,14 @@ void pkvm_iommu_reclaim_pages(void *ptr)
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
index ce610274bda0..b798a36e0ddb 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -751,6 +751,12 @@ static void host_inject_mem_abort(struct kvm_cpu_context *host_ctxt)
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
@@ -773,6 +779,15 @@ void handle_host_mem_abort(struct kvm_cpu_context *host_ctxt)
 	BUG_ON(!(fault.hpfar_el2 & HPFAR_EL2_NS));
 	addr = FIELD_GET(HPFAR_EL2_FIPA, fault.hpfar_el2) << 12;
 
+	/*
+	 * Emulate data aborts for IOMMU drivers, other access will be denied
+	 * by host_stage2_adjust_range()
+	 */
+	if (is_mmio_dabt(esr) && !addr_is_memory(addr) &&
+	    pkvm_iommu_host_dabt_handler(&host_ctxt->regs,
+					 esr, addr | FAR_TO_FIPA_OFFSET(fault.far_el2)))
+		return;
+
 	switch (host_stage2_idmap(addr)) {
 	case -EPERM:
 		host_inject_mem_abort(host_ctxt);
-- 
2.55.0.141.g00534a21ce-goog


