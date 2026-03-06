Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26C3DEFCE5B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 14:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B+HYtjlbkRRsULmqIMWL6+36I9njVaiGl+dbXdeyjSs=; b=lDPg2cqcdR5PpOujqWYmrYMAEu
	eIQPtn95JU/P/TZGX3qbdKGkqXmbJ13ZxJwMr3LOXwQmwLKcRojwGLxM6Em5evq4LKXj+FLdMGdmU
	P/uYCMafgrZ31DdZ9L0CoxizdYbQc71+MCCLNfS/NHZEc8ZKzPNTiZcoHo0OLM8KJrnL9jqKy4wTE
	JabWTwatTb+YerkbD9DoSehBRlGPURXDvBh9x8grUlVNkRcOnIj42arrqs0pwPnqK7/5nrDiV1UCW
	ghGJJK8h8BGqGuo1Xop1f/CsGrxVGxoOaoYyzyeRHvmQwx2pLPa/Z8ngp+zzdzlBsYd9H7+JC3dmy
	iTB/BpRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyVle-00000003qQv-0yKc;
	Fri, 06 Mar 2026 14:03:02 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyVlQ-00000003qAp-29q5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 14:02:49 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-4837246211bso120599485e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 06:02:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772805766; x=1773410566; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=B+HYtjlbkRRsULmqIMWL6+36I9njVaiGl+dbXdeyjSs=;
        b=13BscLK0fbvQ2J7MUKE/Up37Nlu/A2fYROFZiyVaW6JCSu4lANIxUzV7TXDn+pgvbC
         X+nvax8WaPLS8AXL1DwqHLv/qHsq8UL+ZjWiKkmCyL12dSFw2YS+rOg2OsE3RblZWmdY
         d8UvWxN57AO37tWV/yKfEWCoBnQWHli6dGE/cYrH3xKRZy2RymNxUzgHJwWZf04NIucA
         8QqoN/AK7Grbyzn0HjR3kYiNKP7o/PHmecSTcEJUVlMqBQgTShMqxLVxGAz7CSBFdQkL
         MmlkKBh6bAEGhONsl2qaEHFrshnAjXUSfEzHIuK36Ebh3ntVIRAVFtk+a1BFAapaXEUf
         tkvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772805766; x=1773410566;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B+HYtjlbkRRsULmqIMWL6+36I9njVaiGl+dbXdeyjSs=;
        b=EBpKpL2pil+/1oqAt6UUz72fDG99Z+zZKVh/GnwnxRtr0htiRZJeum5XtS2MWhctTe
         ULHKFP4PJVwoC0O+62Z1F0Pf9Ca3zxTrbeoxhdg8zU/79aj76Venc968cyqKWcMuMX/R
         XDdPaVTdOZSsUGFCfbiQRn3/LzdKKqfOFYGGpaO97z1RBlZGWDFwvFRB27Oexz2iibxV
         nMPCjlGUcEr8VYbcsAyHyjKqwJK+n2EzqYOqq+qZ0j0fP3P4zPXACzULigiTILMpFdlW
         M9flKNR7WHOIPCgbWVCO/lGPIyBUDNIOQ1L1IBEmL5SkTlrRPQhuGzYannSB2iZ8/krA
         S6tQ==
X-Forwarded-Encrypted: i=1; AJvYcCWt3e+eVbwPlaeSKwjVkkOBMxqGJxCay6IgoeuoK+dqG+sg3bJeDdKf+aoBl0PtBnaycEQgjCJKFxzu0o+IcKs7@lists.infradead.org
X-Gm-Message-State: AOJu0YxMnJVsCrGD2bS3G4aG58zlredB4fitr5sh9gdS7kqvimfw1KYI
	y/ay1ctnQcl8PympdhpT7Vll7Itf4mFru9TOrE21pNtr7g2JBJh+ICFywjic0mfwPAnNSHm9lA+
	zyQ==
X-Received: from wmgb17.prod.google.com ([2002:a05:600c:1511:b0:480:6b05:6b98])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:45d1:b0:477:7c7d:d9b2
 with SMTP id 5b1f17b1804b1-4852697844emr35672325e9.32.1772805766479; Fri, 06
 Mar 2026 06:02:46 -0800 (PST)
Date: Fri,  6 Mar 2026 14:02:29 +0000
In-Reply-To: <20260306140232.2193802-1-tabba@google.com>
Mime-Version: 1.0
References: <20260306140232.2193802-1-tabba@google.com>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
Message-ID: <20260306140232.2193802-11-tabba@google.com>
Subject: [PATCH v1 10/13] KVM: arm64: Initialize struct kvm_s2_fault
 completely at declaration
From: Fuad Tabba <tabba@google.com>
To: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, qperret@google.com, vdonnefort@google.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_060248_613144_786AFDCA 
X-CRM114-Status: GOOD (  15.64  )
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

Simplify the initialization of struct kvm_s2_fault in user_mem_abort().

Instead of partially initializing the struct via designated initializers
and then sequentially assigning the remaining fields (like write_fault
and topup_memcache) further down the function, evaluate those
dependencies upfront.

This allows the entire struct to be fully initialized at declaration. It
also eliminates the need for the intermediate fault_data variable and
its associated fault pointer, reducing boilerplate.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/mmu.c | 34 ++++++++++++++++------------------
 1 file changed, 16 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 35bcacba5800..2d6e749c1756 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1962,8 +1962,9 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 			  struct kvm_memory_slot *memslot, unsigned long hva,
 			  bool fault_is_perm)
 {
-	int ret = 0;
-	struct kvm_s2_fault fault_data = {
+	bool write_fault = kvm_is_write_fault(vcpu);
+	bool logging_active = memslot_is_logging(memslot);
+	struct kvm_s2_fault fault = {
 		.vcpu = vcpu,
 		.fault_ipa = fault_ipa,
 		.nested = nested,
@@ -1971,19 +1972,18 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 		.hva = hva,
 		.fault_is_perm = fault_is_perm,
 		.ipa = fault_ipa,
-		.logging_active = memslot_is_logging(memslot),
-		.force_pte = memslot_is_logging(memslot),
-		.s2_force_noncacheable = false,
+		.logging_active = logging_active,
+		.force_pte = logging_active,
 		.prot = KVM_PGTABLE_PROT_R,
+		.fault_granule = fault_is_perm ? kvm_vcpu_trap_get_perm_fault_granule(vcpu) : 0,
+		.write_fault = write_fault,
+		.exec_fault = kvm_vcpu_trap_is_exec_fault(vcpu),
+		.topup_memcache = !fault_is_perm || (logging_active && write_fault),
 	};
-	struct kvm_s2_fault *fault = &fault_data;
 	void *memcache;
+	int ret;
 
-	if (fault->fault_is_perm)
-		fault->fault_granule = kvm_vcpu_trap_get_perm_fault_granule(fault->vcpu);
-	fault->write_fault = kvm_is_write_fault(fault->vcpu);
-	fault->exec_fault = kvm_vcpu_trap_is_exec_fault(fault->vcpu);
-	VM_WARN_ON_ONCE(fault->write_fault && fault->exec_fault);
+	VM_WARN_ON_ONCE(fault.write_fault && fault.exec_fault);
 
 	/*
 	 * Permission faults just need to update the existing leaf entry,
@@ -1991,9 +1991,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	 * only exception to this is when dirty logging is enabled at runtime
 	 * and a write fault needs to collapse a block entry into a table.
 	 */
-	fault->topup_memcache = !fault->fault_is_perm ||
-				(fault->logging_active && fault->write_fault);
-	ret = prepare_mmu_memcache(fault->vcpu, fault->topup_memcache, &memcache);
+	ret = prepare_mmu_memcache(vcpu, fault.topup_memcache, &memcache);
 	if (ret)
 		return ret;
 
@@ -2001,17 +1999,17 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	 * Let's check if we will get back a huge fault->page backed by hugetlbfs, or
 	 * get block mapping for device MMIO region.
 	 */
-	ret = kvm_s2_fault_pin_pfn(fault);
+	ret = kvm_s2_fault_pin_pfn(&fault);
 	if (ret != 1)
 		return ret;
 
-	ret = kvm_s2_fault_compute_prot(fault);
+	ret = kvm_s2_fault_compute_prot(&fault);
 	if (ret) {
-		kvm_release_page_unused(fault->page);
+		kvm_release_page_unused(fault.page);
 		return ret;
 	}
 
-	return kvm_s2_fault_map(fault, memcache);
+	return kvm_s2_fault_map(&fault, memcache);
 }
 
 /* Resolve the access fault by making the page young again. */
-- 
2.53.0.473.g4a7958ca14-goog


