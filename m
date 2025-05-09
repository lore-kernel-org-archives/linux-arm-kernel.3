Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89AD1C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 14:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y89KpiuMEOxtubuMTpIdKZbHzHFigeuxmtNmFCn1YRw=; b=qaK1lKLLK7gmnz6tkKRJqerK2E
	ojfECN48bOMKudOTDh6F1VE1skFbbx61K0imUfGybob8N6kK8xxk6BkcN46eBKGUtegqJHhbPMj8c
	thtr5HH/gMNcNzHMy3Gh+70+YvBpIu7G7OFfoRQStGteyMTODijPJ/vReM2cqje9sjnTUP5m9/izy
	EzlJLsdfJd+28L++NmVMuKAUoLdhP8zi/cCT3ivH92EiUjqS+TwDOcVODSddBwRMGowdnN+B/LMYB
	RndHcsyqBfBTIhnUdbGvuFDkf6g8tpKtMNN5yMP3YwHixe+kOEaoOnerW0+ry4rgiAab44eM8/FN0
	sEsjvWkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDOnU-00000003xUs-08PZ;
	Fri, 09 May 2025 14:33:56 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDNbM-00000003izn-1cyA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 13:17:21 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-442d472cf7fso9801955e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 May 2025 06:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746796638; x=1747401438; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y89KpiuMEOxtubuMTpIdKZbHzHFigeuxmtNmFCn1YRw=;
        b=jIYe423s013MJnli7DGVZCClt/MtKPSqeXBxKE2UBSSpvrgcnDDkI8MO73otAkyah5
         R912fRc0C1z3VPCIKBkLswUwIUqxUG2P/t3jVpRGWFzEW4TQzUpPRQPrh/4yJetUJLcr
         0NY0pJWE8DQd9zVHsoQSnltMq14CrPw7XPZZITUdokQZENiczw4vuoJeAC1kYxzz3HSq
         oYyh0a8WDMKZzooE+KCVx84eCtD80O+k4lOFjo+dh9gF62Yt0ZxRON4U+RBe+rfSaXsF
         PoU1Dug074XRw52HY2Cdccczhv1sUOJXDBHIDRr/JSoIv0dboGmtHsSh61yAIjlOWdyC
         Om9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746796638; x=1747401438;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y89KpiuMEOxtubuMTpIdKZbHzHFigeuxmtNmFCn1YRw=;
        b=OtBKwLKqnfVb2i8k/h2QQoeFqDpFBTGqoThgrNxV56XUZQsnklwMpHgaYiyRvvXns+
         DJ314AU4Sf6i49Po5HlF1llLDnHIr8je9HXLiWXt/j38al4X660/Wv2ugVcDv402d8BC
         VTgL+Mhzc32WOR174pJ7TmE+3e9Ckal9FVHwaizVf+7JNd1rNpqqt4yb0TN8dFzl+9j1
         Q4n0nvicjDvt7m6WIdy6bF0KeuPJU1JO/lcxx6cBfQfq6blxhI4KOEMejbWa3qfIFJYF
         3OWap0BKm+SwehzWZsZei0XGEK7Uw3fYAIgpTOsBjfipn0a9W36Whf8a2ksEGejHfA0z
         QMqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNMeaBg9g1uI2E0mBku4vzooGqKxUKU25TGyZpE3fO+S7PEfFmu79RtrsZlYNEjIroDNR7AuMBLFIauqK01P0/@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8yxym1+WMbPLHVgSwvVBTDknpjAhqZOwJGa0IsvTXCPqG8kiT
	KeTVlrr0DfprbCEcct4aidKr/E1Ts8Ir0WwTCdsxxCZpDzJu1piWVbhNKVXS/E+yC+sF1u6JZFW
	025uh3hueK1FW+g8nCg==
X-Google-Smtp-Source: AGHT+IG0PFdA7tBxedgnr2V/gfd20+TBkPi+kPSsUQGO9pdlkgnf5jsutVLpvJ7X4gVCm/d6/ylRU+TZdpbjbrLs
X-Received: from wmbez7.prod.google.com ([2002:a05:600c:83c7:b0:442:cdb9:da41])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:46c3:b0:43c:fc04:6d35 with SMTP id 5b1f17b1804b1-442d6d0a9f6mr30262775e9.4.1746796638595;
 Fri, 09 May 2025 06:17:18 -0700 (PDT)
Date: Fri,  9 May 2025 14:17:00 +0100
In-Reply-To: <20250509131706.2336138-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20250509131706.2336138-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.49.0.1015.ga840276032-goog
Message-ID: <20250509131706.2336138-5-vdonnefort@google.com>
Subject: [PATCH v4 04/10] KVM: arm64: Add a range to __pkvm_host_unshare_guest()
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: qperret@google.com, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kernel-team@android.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_061720_426469_DD6D3CE3 
X-CRM114-Status: GOOD (  13.29  )
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

In preparation for supporting stage-2 huge mappings for np-guest. Add a
nr_pages argument to the __pkvm_host_unshare_guest hypercall. This range
supports only two values: 1 or PMD_SIZE / PAGE_SIZE (that is 512 on a
4K-pages system).

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
index 47aa7b01114f..19671edbe18f 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
@@ -41,7 +41,7 @@ int __pkvm_host_share_ffa(u64 pfn, u64 nr_pages);
 int __pkvm_host_unshare_ffa(u64 pfn, u64 nr_pages);
 int __pkvm_host_share_guest(u64 pfn, u64 gfn, u64 nr_pages, struct pkvm_hyp_vcpu *vcpu,
 			    enum kvm_pgtable_prot prot);
-int __pkvm_host_unshare_guest(u64 gfn, struct pkvm_hyp_vm *hyp_vm);
+int __pkvm_host_unshare_guest(u64 gfn, u64 nr_pages, struct pkvm_hyp_vm *hyp_vm);
 int __pkvm_host_relax_perms_guest(u64 gfn, struct pkvm_hyp_vcpu *vcpu, enum kvm_pgtable_prot prot);
 int __pkvm_host_wrprotect_guest(u64 gfn, struct pkvm_hyp_vm *hyp_vm);
 int __pkvm_host_test_clear_young_guest(u64 gfn, bool mkold, struct pkvm_hyp_vm *vm);
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 4d3d215955c3..5c03bd1db873 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -270,6 +270,7 @@ static void handle___pkvm_host_unshare_guest(struct kvm_cpu_context *host_ctxt)
 {
 	DECLARE_REG(pkvm_handle_t, handle, host_ctxt, 1);
 	DECLARE_REG(u64, gfn, host_ctxt, 2);
+	DECLARE_REG(u64, nr_pages, host_ctxt, 3);
 	struct pkvm_hyp_vm *hyp_vm;
 	int ret = -EINVAL;
 
@@ -280,7 +281,7 @@ static void handle___pkvm_host_unshare_guest(struct kvm_cpu_context *host_ctxt)
 	if (!hyp_vm)
 		goto out;
 
-	ret = __pkvm_host_unshare_guest(gfn, hyp_vm);
+	ret = __pkvm_host_unshare_guest(gfn, nr_pages, hyp_vm);
 	put_pkvm_hyp_vm(hyp_vm);
 out:
 	cpu_reg(host_ctxt, 1) =  ret;
diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index f0f7c6f83e57..ae9a91a21a61 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -990,7 +990,7 @@ int __pkvm_host_share_guest(u64 pfn, u64 gfn, u64 nr_pages, struct pkvm_hyp_vcpu
 	return ret;
 }
 
-static int __check_host_shared_guest(struct pkvm_hyp_vm *vm, u64 *__phys, u64 ipa)
+static int __check_host_shared_guest(struct pkvm_hyp_vm *vm, u64 *__phys, u64 ipa, u64 size)
 {
 	enum pkvm_page_state state;
 	struct hyp_page *page;
@@ -1004,7 +1004,7 @@ static int __check_host_shared_guest(struct pkvm_hyp_vm *vm, u64 *__phys, u64 ip
 		return ret;
 	if (!kvm_pte_valid(pte))
 		return -ENOENT;
-	if (level != KVM_PGTABLE_LAST_LEVEL)
+	if (kvm_granule_size(level) != size)
 		return -E2BIG;
 
 	state = guest_get_page_state(pte, ipa);
@@ -1012,43 +1012,50 @@ static int __check_host_shared_guest(struct pkvm_hyp_vm *vm, u64 *__phys, u64 ip
 		return -EPERM;
 
 	phys = kvm_pte_to_phys(pte);
-	ret = check_range_allowed_memory(phys, phys + PAGE_SIZE);
+	ret = check_range_allowed_memory(phys, phys + size);
 	if (WARN_ON(ret))
 		return ret;
 
-	page = hyp_phys_to_page(phys);
-	if (get_host_state(page) != PKVM_PAGE_SHARED_OWNED)
-		return -EPERM;
-	if (WARN_ON(!page->host_share_guest_count))
-		return -EINVAL;
+	for_each_hyp_page(phys, size, page) {
+		if (get_host_state(page) != PKVM_PAGE_SHARED_OWNED)
+			return -EPERM;
+		if (WARN_ON(!page->host_share_guest_count))
+			return -EINVAL;
+	}
 
 	*__phys = phys;
 
 	return 0;
 }
 
-int __pkvm_host_unshare_guest(u64 gfn, struct pkvm_hyp_vm *vm)
+int __pkvm_host_unshare_guest(u64 gfn, u64 nr_pages, struct pkvm_hyp_vm *vm)
 {
 	u64 ipa = hyp_pfn_to_phys(gfn);
 	struct hyp_page *page;
-	u64 phys;
+	u64 size, phys;
 	int ret;
 
+	ret = __guest_check_transition_size(0, ipa, nr_pages, &size);
+	if (ret)
+		return ret;
+
 	host_lock_component();
 	guest_lock_component(vm);
 
-	ret = __check_host_shared_guest(vm, &phys, ipa);
+	ret = __check_host_shared_guest(vm, &phys, ipa, size);
 	if (ret)
 		goto unlock;
 
-	ret = kvm_pgtable_stage2_unmap(&vm->pgt, ipa, PAGE_SIZE);
+	ret = kvm_pgtable_stage2_unmap(&vm->pgt, ipa, size);
 	if (ret)
 		goto unlock;
 
-	page = hyp_phys_to_page(phys);
-	page->host_share_guest_count--;
-	if (!page->host_share_guest_count)
-		WARN_ON(__host_set_page_state_range(phys, PAGE_SIZE, PKVM_PAGE_OWNED));
+	for_each_hyp_page(phys, size, page) {
+		/* __check_host_shared_guest() protects against underflow */
+		page->host_share_guest_count--;
+		if (!page->host_share_guest_count)
+			set_host_state(page, PKVM_PAGE_OWNED);
+	}
 
 unlock:
 	guest_unlock_component(vm);
@@ -1068,7 +1075,7 @@ static void assert_host_shared_guest(struct pkvm_hyp_vm *vm, u64 ipa)
 	host_lock_component();
 	guest_lock_component(vm);
 
-	ret = __check_host_shared_guest(vm, &phys, ipa);
+	ret = __check_host_shared_guest(vm, &phys, ipa, PAGE_SIZE);
 
 	guest_unlock_component(vm);
 	host_unlock_component();
@@ -1255,7 +1262,7 @@ void pkvm_ownership_selftest(void *base)
 	assert_transition_res(-EPERM,	__pkvm_host_unshare_ffa, pfn, 1);
 	assert_transition_res(-EPERM,	hyp_pin_shared_mem, virt, virt + size);
 	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, 1, vcpu, prot);
-	assert_transition_res(-ENOENT,	__pkvm_host_unshare_guest, gfn, vm);
+	assert_transition_res(-ENOENT,	__pkvm_host_unshare_guest, gfn, 1, vm);
 
 	selftest_state.host = PKVM_PAGE_OWNED;
 	selftest_state.hyp = PKVM_NOPAGE;
@@ -1263,7 +1270,7 @@ void pkvm_ownership_selftest(void *base)
 	assert_transition_res(-EPERM,	__pkvm_hyp_donate_host, pfn, 1);
 	assert_transition_res(-EPERM,	__pkvm_host_unshare_hyp, pfn);
 	assert_transition_res(-EPERM,	__pkvm_host_unshare_ffa, pfn, 1);
-	assert_transition_res(-ENOENT,	__pkvm_host_unshare_guest, gfn, vm);
+	assert_transition_res(-ENOENT,	__pkvm_host_unshare_guest, gfn, 1, vm);
 	assert_transition_res(-EPERM,	hyp_pin_shared_mem, virt, virt + size);
 
 	selftest_state.host = PKVM_PAGE_SHARED_OWNED;
@@ -1274,7 +1281,7 @@ void pkvm_ownership_selftest(void *base)
 	assert_transition_res(-EPERM,	__pkvm_host_share_ffa, pfn, 1);
 	assert_transition_res(-EPERM,	__pkvm_hyp_donate_host, pfn, 1);
 	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, 1, vcpu, prot);
-	assert_transition_res(-ENOENT,	__pkvm_host_unshare_guest, gfn, vm);
+	assert_transition_res(-ENOENT,	__pkvm_host_unshare_guest, gfn, 1, vm);
 
 	assert_transition_res(0,	hyp_pin_shared_mem, virt, virt + size);
 	assert_transition_res(0,	hyp_pin_shared_mem, virt, virt + size);
@@ -1286,7 +1293,7 @@ void pkvm_ownership_selftest(void *base)
 	assert_transition_res(-EPERM,	__pkvm_host_share_ffa, pfn, 1);
 	assert_transition_res(-EPERM,	__pkvm_hyp_donate_host, pfn, 1);
 	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, 1, vcpu, prot);
-	assert_transition_res(-ENOENT,	__pkvm_host_unshare_guest, gfn, vm);
+	assert_transition_res(-ENOENT,	__pkvm_host_unshare_guest, gfn, 1, vm);
 
 	hyp_unpin_shared_mem(virt, virt + size);
 	assert_page_state();
@@ -1305,7 +1312,7 @@ void pkvm_ownership_selftest(void *base)
 	assert_transition_res(-EPERM,	__pkvm_host_unshare_hyp, pfn);
 	assert_transition_res(-EPERM,	__pkvm_hyp_donate_host, pfn, 1);
 	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, 1, vcpu, prot);
-	assert_transition_res(-ENOENT,	__pkvm_host_unshare_guest, gfn, vm);
+	assert_transition_res(-ENOENT,	__pkvm_host_unshare_guest, gfn, 1, vm);
 	assert_transition_res(-EPERM,	hyp_pin_shared_mem, virt, virt + size);
 
 	selftest_state.host = PKVM_PAGE_OWNED;
@@ -1329,11 +1336,11 @@ void pkvm_ownership_selftest(void *base)
 	WARN_ON(hyp_virt_to_page(virt)->host_share_guest_count != 2);
 
 	selftest_state.guest[0] = PKVM_NOPAGE;
-	assert_transition_res(0,	__pkvm_host_unshare_guest, gfn, vm);
+	assert_transition_res(0,	__pkvm_host_unshare_guest, gfn, 1, vm);
 
 	selftest_state.guest[1] = PKVM_NOPAGE;
 	selftest_state.host = PKVM_PAGE_OWNED;
-	assert_transition_res(0,	__pkvm_host_unshare_guest, gfn + 1, vm);
+	assert_transition_res(0,	__pkvm_host_unshare_guest, gfn + 1, 1, vm);
 
 	selftest_state.host = PKVM_NOPAGE;
 	selftest_state.hyp = PKVM_PAGE_OWNED;
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index 0285e2cd2e7f..f77c5157a8d7 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -371,7 +371,7 @@ int pkvm_pgtable_stage2_unmap(struct kvm_pgtable *pgt, u64 addr, u64 size)
 
 	lockdep_assert_held_write(&kvm->mmu_lock);
 	for_each_mapping_in_range_safe(pgt, addr, addr + size, mapping) {
-		ret = kvm_call_hyp_nvhe(__pkvm_host_unshare_guest, handle, mapping->gfn);
+		ret = kvm_call_hyp_nvhe(__pkvm_host_unshare_guest, handle, mapping->gfn, 1);
 		if (WARN_ON(ret))
 			break;
 		rb_erase(&mapping->node, &pgt->pkvm_mappings);
-- 
2.49.0.1015.ga840276032-goog


