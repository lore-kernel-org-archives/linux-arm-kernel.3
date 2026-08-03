Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8F4AC55175
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 10:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rqEfGWhU7R8NUUfSOVHZHyp4onru3PNEM/Cx10yVXlY=; b=nRtHlXM5FNd/UYYFPq0lh4/Qw3
	vUPKrjKsRWnZJrDQfc0GwwMKXmpxQRH3YwCwuNQeuHdQHP0+6DNOBcotcsJimXMfuxeDKmCTrpVsZ
	2KIAJAc9wYu9d2E6GU5QY+961MwdB32P3fQMQGUQwErQUTKaicL+oIt6fYYgwxaNW3TNcoDiONrA1
	sVdO/gYJTrxp+EjIQ6MkRthUeHYvaTLwQpthhF6v2Few2V2QlfQ78rk6h/DnK+O6HvsZptqbUS879
	LguxKE0r27boz3VyqZO+H6OAiK/5URrKYhbCLKms30Gkf9qFaXal3BwaHhEIor+ri+JfVeQzk+UCq
	OilcXqlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqpdW-0000000Gn20-2L1V;
	Mon, 03 Aug 2026 10:11:10 +0000
Received: from mail-wm1-x345.google.com ([2a00:1450:4864:20::345])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqpdU-0000000Gmwh-3aQB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 10:11:10 +0000
Received: by mail-wm1-x345.google.com with SMTP id 5b1f17b1804b1-493bfc3b84aso10146835e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 03:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785751866; x=1786356666; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rqEfGWhU7R8NUUfSOVHZHyp4onru3PNEM/Cx10yVXlY=;
        b=s2Qj9WkGU8WqyY9G4+eydnLxdBeyJX67HIPPDToDp4ry//oPerVcqGQBRQhUaBK8Wx
         aa6m8OkRAb9ABkJPD9j53moZEpieGMGSmixRJvCj/8qfP2M6qET//ikpqEe8VgBmT5H3
         8M8Ln40qZWcFiQknAdCpdOnf2ndRAVgDFhqkLWiSk9vlAwVb+rhADfszrXSBTq+v/axD
         fGZj2zZvY15Pxa/4O81c5Y7y3KKYlwfPIrRvhTpcr6qLjNsxDERB4Hh5v+mewV3ap7nt
         eEDJalIFyKP5h5K67ZnCdjR2ip2f4hPkrgmgYF4KeRbcXyJ+rnCicW62N4vd++uPjXYw
         lbbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785751866; x=1786356666;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rqEfGWhU7R8NUUfSOVHZHyp4onru3PNEM/Cx10yVXlY=;
        b=F+Q/ZbR/+n16VtOUiVhDr2GWTpDTeJnBt43zEGFgxA1GemcuZ3zekruJ2vBkqrGptB
         UIcUjMvBVHa8fFKI7VAnL0qEnPbLwEY5Gqz5CJDrfgzID00veeekglCgPFFO34aThBkc
         lTfcDw841D+Ps8dulg9cSM23WlUFrf2NgDoDbExQHDD3sVaBZcKNjRjaBrNYz9ZCIxVo
         VNEUJDSufblyKiv2BW4uXwoODl7PTiV0I2J+VW2UWsXy6Z3q4aFmYN5jOKZ5C2ejQaJI
         9ubWHV9CjZYI8MJJvOERjZxMjuu+9ZB0z86sNm9Rj7PEBYQpezHrD36Lr4oEaiCORsJU
         EGVA==
X-Forwarded-Encrypted: i=1; AHgh+Rqno2StBWBUYNEW2b1QeAyyGJhc2UBnq8mY2D6cgXhv44jmLUG6qkQd8xilcR03q3OECI4oMyphh3rO7go+ij50@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6pMZ22HAr+0eUEWNnZJn6wTEHXMEL7GocYfJ64VcUtctzn8AK
	oOUy6xtIP4tXrdUe9nBjZ1SCkb9N0FWTYgr2I2YfyToP0COEpfR7Z70VPgVuZpRZ3P8RSbH8g56
	uCsoJRWLEe0fdyGFOe0H7PQ==
X-Received: from wmph34.prod.google.com ([2002:a05:600c:49a2:b0:495:5890:8f69])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:468e:b0:495:4b42:8677 with SMTP id 5b1f17b1804b1-4980c6a2268mr187471275e9.18.1785751866342;
 Mon, 03 Aug 2026 03:11:06 -0700 (PDT)
Date: Mon,  3 Aug 2026 11:08:54 +0100
In-Reply-To: <20260803100904.3563942-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260803100904.3563942-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.508.g3f0d502094-goog
Message-ID: <20260803100904.3563942-11-vdonnefort@google.com>
Subject: [PATCH 10/20] KVM: arm64: Add a range to __pkvm_guest_unshare_host()
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, 
	keirf@google.com, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_031108_929690_E16FA33D 
X-CRM114-Status: GOOD (  11.93  )
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

In preparation for supporting stage-2 huge mappings for protected VMs, add a
nr_pages argument to the __pkvm_guest_unshare_host() hypercall. This
range supports only two values: 1 or PMD_SIZE / PAGE_SIZE (that is 512
on a 4K-pages system).

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
index 7fdfe3f22c5a..3426fbb25a4c 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
@@ -33,7 +33,7 @@ enum pkvm_component_id {
 int __pkvm_prot_finalize(void);
 int __pkvm_host_share_hyp(u64 pfn, u64 nr_pages);
 int __pkvm_guest_share_host(struct pkvm_hyp_vcpu *vcpu, u64 gfn, u64 nr_pages);
-int __pkvm_guest_unshare_host(struct pkvm_hyp_vcpu *vcpu, u64 gfn);
+int __pkvm_guest_unshare_host(struct pkvm_hyp_vcpu *vcpu, u64 gfn, u64 nr_pages);
 int __pkvm_host_unshare_hyp(u64 pfn, u64 nr_pages);
 int __pkvm_host_donate_hyp(u64 pfn, u64 nr_pages);
 int __pkvm_hyp_donate_host(u64 pfn, u64 nr_pages);
diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 53c48cea5f0e..a53600c853d4 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -1042,31 +1042,35 @@ int __pkvm_guest_share_host(struct pkvm_hyp_vcpu *vcpu, u64 gfn, u64 nr_pages)
 	return ret;
 }
 
-int __pkvm_guest_unshare_host(struct pkvm_hyp_vcpu *vcpu, u64 gfn)
+int __pkvm_guest_unshare_host(struct pkvm_hyp_vcpu *vcpu, u64 gfn, u64 nr_pages)
 {
 	struct pkvm_hyp_vm *vm = pkvm_hyp_vcpu_to_hyp_vm(vcpu);
-	u64 meta, phys, ipa = hyp_pfn_to_phys(gfn);
+	u64 size, meta, phys, ipa = hyp_pfn_to_phys(gfn);
 	kvm_pte_t pte;
 	int ret;
 
+	ret = __guest_check_transition_size(0, ipa, nr_pages, &size);
+	if (ret)
+		return ret;
+
 	host_lock_component();
 	guest_lock_component(vm);
 
-	ret = get_valid_guest_pte(vm, ipa, PAGE_SIZE, &pte, &phys);
+	ret = get_valid_guest_pte(vm, ipa, size, &pte, &phys);
 	if (ret)
 		goto unlock;
 
 	ret = -EPERM;
 	if (pkvm_getstate(kvm_pgtable_stage2_pte_prot(pte)) != PKVM_PAGE_SHARED_OWNED)
 		goto unlock;
-	if (__host_check_page_state_range(phys, PAGE_SIZE, PKVM_PAGE_SHARED_BORROWED))
+	if (__host_check_page_state_range(phys, size, PKVM_PAGE_SHARED_BORROWED))
 		goto unlock;
 
 	ret = 0;
 	meta = host_stage2_encode_gfn_meta(vm, gfn);
-	WARN_ON(host_stage2_set_owner_metadata_locked(phys, PAGE_SIZE,
+	WARN_ON(host_stage2_set_owner_metadata_locked(phys, size,
 						      PKVM_ID_GUEST, meta));
-	WARN_ON(kvm_pgtable_stage2_map(&vm->pgt, ipa, PAGE_SIZE, phys,
+	WARN_ON(kvm_pgtable_stage2_map(&vm->pgt, ipa, size, phys,
 				       pkvm_mkstate(KVM_PGTABLE_PROT_RWX, PKVM_PAGE_OWNED),
 				       &vcpu->vcpu.arch.pkvm_memcache, 0));
 unlock:
@@ -1937,8 +1941,8 @@ int __pkvm_ownership_selftest(u64 pfn, u64 pgtable_pfn, unsigned long pgtable_nr
 
 	selftest_state.host = PKVM_NOPAGE;
 	selftest_state.guest[0] = PKVM_PAGE_OWNED;
-	assert_transition_res(0,	__pkvm_guest_unshare_host, vcpu, gfn);
-	assert_transition_res(-EPERM,	__pkvm_guest_unshare_host, vcpu, gfn);
+	assert_transition_res(0,	__pkvm_guest_unshare_host, vcpu, gfn, 1);
+	assert_transition_res(-EPERM,	__pkvm_guest_unshare_host, vcpu, gfn, 1);
 	assert_transition_res(-EPERM,	__pkvm_host_donate_guest, pfn, gfn, 1, vcpu);
 	assert_transition_res(-EPERM,	__pkvm_host_donate_guest, pfn, gfn + 1, 1, vcpu);
 	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, 1, vcpu, prot);
@@ -1955,7 +1959,7 @@ int __pkvm_ownership_selftest(u64 pfn, u64 pgtable_pfn, unsigned long pgtable_nr
 	assert_transition_res(-EPERM,	__pkvm_host_donate_guest, pfn, gfn, 1, vcpu);
 	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, 1, vcpu, prot);
 	assert_transition_res(-EHWPOISON, __pkvm_guest_share_host, vcpu, gfn, 1);
-	assert_transition_res(-EHWPOISON, __pkvm_guest_unshare_host, vcpu, gfn);
+	assert_transition_res(-EHWPOISON, __pkvm_guest_unshare_host, vcpu, gfn, 1);
 
 	selftest_state.host = PKVM_NOPAGE;
 	selftest_state.guest[1] = PKVM_PAGE_OWNED;
diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index f8e2618c78e3..3b8e95b83bf4 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -1119,7 +1119,7 @@ static void pkvm_memunshare_call(u64 *ret, struct kvm_vcpu *vcpu)
 		return;
 
 	hyp_vcpu = container_of(vcpu, struct pkvm_hyp_vcpu, vcpu);
-	if (!__pkvm_guest_unshare_host(hyp_vcpu, hyp_phys_to_pfn(ipa)))
+	if (!__pkvm_guest_unshare_host(hyp_vcpu, hyp_phys_to_pfn(ipa), 1))
 		ret[0] = SMCCC_RET_SUCCESS;
 }
 
-- 
2.55.0.508.g3f0d502094-goog


