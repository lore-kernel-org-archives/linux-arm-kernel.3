Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34C59EFCE5B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 14:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZJF5wl0idW47D9GCd6ULDgMs+egUo0RLejd/z4xiKdQ=; b=SxMR+Z5jj7sKe7NlkT33lTILXH
	Aoy4QlmfUpcaKGHpCwPDbNzrMl/bS8aPCsX/ZGnijEDnPy51xqYOnZ5Ycq0+M8OdLsFe7mdumhcvp
	gJJUDjJxPp6VKqqiqeg8CU+2mE2bKGonTg1Iul/pliiPAENUdlGryMb2MraRP61mINQcryevUhQre
	cVFSjZ5y8TLR/T+9C759wXWSyX48TZAM5UXcdFV6/sHvCQo8hhayCyigGMd2HudxyaUhWHspHiI61
	vJO+9FPQCIU6H4VSB7//KoAIoXyfRrFmtY7kMsu3GdZ5FEZm1SkM+G5BxozGGd2ahm3KbM4BQZh1C
	uRSzqUZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyVlP-00000003qBj-3mXm;
	Fri, 06 Mar 2026 14:02:48 +0000
Received: from mail-ed1-x54a.google.com ([2a00:1450:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyVlK-00000003q55-29uT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 14:02:44 +0000
Received: by mail-ed1-x54a.google.com with SMTP id 4fb4d7f45d1cf-661aff85c3eso1245554a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 06:02:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772805759; x=1773410559; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZJF5wl0idW47D9GCd6ULDgMs+egUo0RLejd/z4xiKdQ=;
        b=K+m81/wi5f4nRnQL2cW/qe+hUobgBtZcI6lBF2jSvEyZD6fJhx1yWOTM++Lth/eseE
         l+3eDo9Ghchm9d4lqyee8FCprEF1nG+18TSGIirp0kGMhcG3evJRrrrIVGhisDaL2uNP
         95OwfbTi6FsknQOPDsXiXAH7WjLh4clga51u/hdBi6VOSRwRtaUwOqNDWCX7ppDPvPyZ
         DqzQJPfQLiTLTUxPcyjnioMGEjCphd9aBEZk3szG7MqjqYaGDoH7/9wFNUGXToRHoAil
         se5JowV1QW4oECszeY1nUro8FygGyKyMF9N9utfoEMLDZvKL1tDrCuuU/d+IKrMV8EIz
         PGBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772805759; x=1773410559;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZJF5wl0idW47D9GCd6ULDgMs+egUo0RLejd/z4xiKdQ=;
        b=hduQouEpOL8myYK6e4V8FIItC6OQcMX7GBC6sZg1pu+OaN0i7ExRSvdOJXwSHV5KCd
         3GS7Naj9DZdfdfFgUCG4sEtzXkOKZvnrpGBZmuPCpiBMclzXhSJunvZGAgWem3t1UL+/
         whU11lIpqj349J2xkPnB/1PxqoCQaJkS3yz+h7zorDNMZ3bgI/OtupBWb7hAXuIYhVpc
         IfZEYy7cwGUI+Fu0UPprc9EAZP6aUogcUUZdEcilS4gag6i3O48g63KU8DrImH/01Ftq
         vZKr+PWU/rzUW099k/YRwq/GKc6zwNYIqfJYFxrL+zT8/lmh5tY1cK/wHW5trgR5zzXr
         n/Ow==
X-Forwarded-Encrypted: i=1; AJvYcCW80zz2aD6GIyLzjQCRi+m+kAYvsESR4mmjtLbHAEgOtvU/GG33wCMqhcCkgPyhEj4oNAD3k0pPAaCuh290r6YD@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+XQFEoX9mN0wQhNvczgMw5IBhrL0uPx/nmq4VksTAaqXFHGUb
	Jlj74QeydOlQoei6UKSI7Q293scMLSyX66p6irZCOfb1e6YLlMycyueTCYcu6gk9ZOeJMo2haHu
	nbQ==
X-Received: from edai24.prod.google.com ([2002:a05:6402:f18:b0:660:af3b:aad3])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:4303:b0:65a:3526:50e0
 with SMTP id 4fb4d7f45d1cf-6619d4ff435mr1156859a12.30.1772805757678; Fri, 06
 Mar 2026 06:02:37 -0800 (PST)
Date: Fri,  6 Mar 2026 14:02:22 +0000
In-Reply-To: <20260306140232.2193802-1-tabba@google.com>
Mime-Version: 1.0
References: <20260306140232.2193802-1-tabba@google.com>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
Message-ID: <20260306140232.2193802-4-tabba@google.com>
Subject: [PATCH v1 03/13] KVM: arm64: Extract PFN resolution in user_mem_abort()
From: Fuad Tabba <tabba@google.com>
To: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, qperret@google.com, vdonnefort@google.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_060242_621882_AB7F4143 
X-CRM114-Status: GOOD (  20.94  )
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

Extract the section of code responsible for pinning the physical page
frame number (PFN) backing the faulting IPA into a new helper,
kvm_s2_fault_pin_pfn().

This helper encapsulates the critical section where the mmap_read_lock
is held, the VMA is looked up, the mmu invalidate sequence is sampled,
and the PFN is ultimately resolved via __kvm_faultin_pfn(). It also
handles the early exits for hardware poisoned pages and noslot PFNs.

By isolating this region, we can begin to organize the state variables
required for PFN resolution into the kvm_s2_fault struct, clearing out
a significant amount of local variable clutter from user_mem_abort().

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/mmu.c | 105 ++++++++++++++++++++++++-------------------
 1 file changed, 59 insertions(+), 46 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 419b793c5891..d56c6422ca5f 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1740,55 +1740,11 @@ struct kvm_s2_fault {
 	vm_flags_t vm_flags;
 };
 
-static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
-			  struct kvm_s2_trans *nested,
-			  struct kvm_memory_slot *memslot, unsigned long hva,
-			  bool fault_is_perm)
+static int kvm_s2_fault_pin_pfn(struct kvm_s2_fault *fault)
 {
-	int ret = 0;
-	struct kvm_s2_fault fault_data = {
-		.vcpu = vcpu,
-		.fault_ipa = fault_ipa,
-		.nested = nested,
-		.memslot = memslot,
-		.hva = hva,
-		.fault_is_perm = fault_is_perm,
-		.ipa = fault_ipa,
-		.logging_active = memslot_is_logging(memslot),
-		.force_pte = memslot_is_logging(memslot),
-		.s2_force_noncacheable = false,
-		.vfio_allow_any_uc = false,
-		.prot = KVM_PGTABLE_PROT_R,
-	};
-	struct kvm_s2_fault *fault = &fault_data;
-	struct kvm *kvm = vcpu->kvm;
 	struct vm_area_struct *vma;
-	void *memcache;
-	struct kvm_pgtable *pgt;
-	enum kvm_pgtable_walk_flags flags = KVM_PGTABLE_WALK_SHARED;
+	struct kvm *kvm = fault->vcpu->kvm;
 
-	if (fault->fault_is_perm)
-		fault->fault_granule = kvm_vcpu_trap_get_perm_fault_granule(fault->vcpu);
-	fault->write_fault = kvm_is_write_fault(fault->vcpu);
-	fault->exec_fault = kvm_vcpu_trap_is_exec_fault(fault->vcpu);
-	VM_WARN_ON_ONCE(fault->write_fault && fault->exec_fault);
-
-	/*
-	 * Permission faults just need to update the existing leaf entry,
-	 * and so normally don't require allocations from the memcache. The
-	 * only exception to this is when dirty logging is enabled at runtime
-	 * and a write fault needs to collapse a block entry into a table.
-	 */
-	fault->topup_memcache = !fault->fault_is_perm ||
-				(fault->logging_active && fault->write_fault);
-	ret = prepare_mmu_memcache(fault->vcpu, fault->topup_memcache, &memcache);
-	if (ret)
-		return ret;
-
-	/*
-	 * Let's check if we will get back a huge fault->page backed by hugetlbfs, or
-	 * get block mapping for device MMIO region.
-	 */
 	mmap_read_lock(current->mm);
 	vma = vma_lookup(current->mm, fault->hva);
 	if (unlikely(!vma)) {
@@ -1842,6 +1798,63 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	if (is_error_noslot_pfn(fault->pfn))
 		return -EFAULT;
 
+	return 1;
+}
+
+static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
+			  struct kvm_s2_trans *nested,
+			  struct kvm_memory_slot *memslot, unsigned long hva,
+			  bool fault_is_perm)
+{
+	int ret = 0;
+	struct kvm_s2_fault fault_data = {
+		.vcpu = vcpu,
+		.fault_ipa = fault_ipa,
+		.nested = nested,
+		.memslot = memslot,
+		.hva = hva,
+		.fault_is_perm = fault_is_perm,
+		.ipa = fault_ipa,
+		.logging_active = memslot_is_logging(memslot),
+		.force_pte = memslot_is_logging(memslot),
+		.s2_force_noncacheable = false,
+		.vfio_allow_any_uc = false,
+		.prot = KVM_PGTABLE_PROT_R,
+	};
+	struct kvm_s2_fault *fault = &fault_data;
+	struct kvm *kvm = vcpu->kvm;
+	void *memcache;
+	struct kvm_pgtable *pgt;
+	enum kvm_pgtable_walk_flags flags = KVM_PGTABLE_WALK_SHARED;
+
+	if (fault->fault_is_perm)
+		fault->fault_granule = kvm_vcpu_trap_get_perm_fault_granule(fault->vcpu);
+	fault->write_fault = kvm_is_write_fault(fault->vcpu);
+	fault->exec_fault = kvm_vcpu_trap_is_exec_fault(fault->vcpu);
+	VM_WARN_ON_ONCE(fault->write_fault && fault->exec_fault);
+
+	/*
+	 * Permission faults just need to update the existing leaf entry,
+	 * and so normally don't require allocations from the memcache. The
+	 * only exception to this is when dirty logging is enabled at runtime
+	 * and a write fault needs to collapse a block entry into a table.
+	 */
+	fault->topup_memcache = !fault->fault_is_perm ||
+				(fault->logging_active && fault->write_fault);
+	ret = prepare_mmu_memcache(fault->vcpu, fault->topup_memcache, &memcache);
+	if (ret)
+		return ret;
+
+	/*
+	 * Let's check if we will get back a huge fault->page backed by hugetlbfs, or
+	 * get block mapping for device MMIO region.
+	 */
+	ret = kvm_s2_fault_pin_pfn(fault);
+	if (ret != 1)
+		return ret;
+
+	ret = 0;
+
 	/*
 	 * Check if this is non-struct fault->page memory PFN, and cannot support
 	 * CMOs. It could potentially be unsafe to access as cacheable.
-- 
2.53.0.473.g4a7958ca14-goog


