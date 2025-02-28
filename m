Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A01AEC19776
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 10:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8zWSnyntzQ7MpNLtBXWTtAnb7hKIjHG4nXvkifYINGs=; b=Qw5YNSaBIspPXSe/80/IxA09QQ
	jfTNXbljvte/INnckGsSPPSWaCRQXBchmsHXWdw1UFCqnTVjbjvcCTF3Hs22WcFVaOLRIq+nvUZJ2
	PrhbZMPIjIftKjtMlQmh7tWJsWUiJMuyZU1BUCUTmMagB1h62/M0DmTfzOlHaTVnpyVXmVW6Iynrm
	/IoRQcUi25fBh3XbjxQ0t5Tv+kojrXcZx7GJJ85X7iyWRA0UbJ7KYJXirjN/LrQuP62onzYDGufcR
	lSJnZj5M6/tnmJKvnTVN81X68TYkC2ksp80S/51lDrImeKg570mD56p2aA/OjPScfRr4H8r8VQnUy
	q/UXRLGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnxrv-0000000Adqb-1z1p;
	Fri, 28 Feb 2025 10:45:23 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnxZ7-0000000AaU3-2sH3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 10:25:58 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-4394c747c72so8299925e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Feb 2025 02:25:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740738356; x=1741343156; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8zWSnyntzQ7MpNLtBXWTtAnb7hKIjHG4nXvkifYINGs=;
        b=ozC94j3Kw9q2Gt1Ib+ya3978Pg0OSe6yRqQK00NGBDAPENvjym4KDc4xEvz1O4Ju/f
         vepPajoEs/JTZSzsotr7gVNkZQ/9OKiV9dkBsE8TlDqbwHiB8pASnpgck/HCpXbKN6UT
         brJqzx77Fqi3ioCMhQVVbBrSQqJdXODjiTPvXw/jAqi7rtxgTluLtxGQar8ybnGN/Z6/
         0S1vWUoJpLb3gylE1j6KJLjadDUDFgYE/DzzrrTWjqh9FC08XSAZhViCZIYt+WPak2LN
         KQp04gVe7vmGoO4aPyx4QinwD325/ESh+GzEhv5W6brE6pFNDGHtzfUM0euPtzNH0j31
         JN8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740738356; x=1741343156;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8zWSnyntzQ7MpNLtBXWTtAnb7hKIjHG4nXvkifYINGs=;
        b=NxZ/bo+LfJ9vJacuEptSvBt5lerjOyk56uCcG4oqrffMn3Ky2Yl4Gzoc5hn8Oq88rU
         3UdkvA7kdd2QNRkHZMVG+LliKRU4NNlVPUojMXo9582oHfdqesHuJW/Jh7OEkncl9kgA
         wzTj060In1P4eqpK+OgZDVcxFUErTQXqCcvmo0CmBrNPpbSISo2sO1sAXHXcL2/I4+Mr
         ZMeJgYThPLiebENSOdsQqXH8cU1lYIJRFkgl4gN4iyB78kBc3Rnb67DQwnprkPooNBs0
         /nJ5GUfpWrUvi5jR8b8nrK81YDdbkax+lXE20eJntyb7ks066WaurkJwe7H3i9soVdRl
         3lqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGwbJUKxsZH8fwEqRRaXBrM/D0XwN7vxTs0HtkbblqJSqyCzco8Y+vU+OnCs3zx8pP2abX3A2zn8VHuLxAwnmI@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0CltaYn2wg2PuKUYZsoZcjLI1jnSYf87RMGrY6lCa5rG+S8A6
	G4yfKyK/9jPG/j2tnIUOry5WE2oX8ZZylOxQQbe73YSaEwHk2eRt9wnshi8rJRwVF4yYDjRii9A
	jxdRaMS1VkWqF/p5SAw==
X-Google-Smtp-Source: AGHT+IGFfXZf9aSaeJPV477b4zEwtmOKtPxpHM8dC1bwi3UuUWA6YfdIpTZg2yxh9oaFGqD0evxL8K6AQkOEvAO4
X-Received: from wmbfl25.prod.google.com ([2002:a05:600c:b99:b0:439:98eb:28cd])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:35cb:b0:439:98b0:f911 with SMTP id 5b1f17b1804b1-43ba66e6d13mr21948505e9.10.1740738355942;
 Fri, 28 Feb 2025 02:25:55 -0800 (PST)
Date: Fri, 28 Feb 2025 10:25:21 +0000
In-Reply-To: <20250228102530.1229089-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20250228102530.1229089-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <20250228102530.1229089-6-vdonnefort@google.com>
Subject: [PATCH 3/9] KVM: arm64: Add range to __pkvm_host_unshare_guest()
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: qperret@google.com, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kernel-team@android.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_022557_724245_2BF5E63A 
X-CRM114-Status: GOOD (  11.40  )
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
nr_pages argument to the __pkvm_host_unshare_guest hypercall.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
index 1abbab5e2ff8..343569e4bdeb 100644
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
index e71601746935..7f22d104c1f1 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -274,6 +274,7 @@ static void handle___pkvm_host_unshare_guest(struct kvm_cpu_context *host_ctxt)
 {
 	DECLARE_REG(pkvm_handle_t, handle, host_ctxt, 1);
 	DECLARE_REG(u64, gfn, host_ctxt, 2);
+	DECLARE_REG(u64, nr_pages, host_ctxt, 3);
 	struct pkvm_hyp_vm *hyp_vm;
 	int ret = -EINVAL;
 
@@ -284,7 +285,7 @@ static void handle___pkvm_host_unshare_guest(struct kvm_cpu_context *host_ctxt)
 	if (!hyp_vm)
 		goto out;
 
-	ret = __pkvm_host_unshare_guest(gfn, hyp_vm);
+	ret = __pkvm_host_unshare_guest(gfn, nr_pages, hyp_vm);
 	put_pkvm_hyp_vm(hyp_vm);
 out:
 	cpu_reg(host_ctxt, 1) =  ret;
diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 2e49bd6e4ae8..ad45f5eaa1fd 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -984,13 +984,12 @@ int __pkvm_host_share_guest(u64 pfn, u64 gfn, u64 nr_pages, struct pkvm_hyp_vcpu
 	return ret;
 }
 
-static int __check_host_shared_guest(struct pkvm_hyp_vm *vm, u64 *__phys, u64 ipa)
+static int __check_host_shared_guest(struct pkvm_hyp_vm *vm, u64 *__phys, u64 ipa, u64 size)
 {
-	enum pkvm_page_state state;
 	struct hyp_page *page;
 	kvm_pte_t pte;
-	u64 phys;
 	s8 level;
+	u64 phys;
 	int ret;
 
 	ret = kvm_pgtable_get_leaf(&vm->pgt, ipa, &pte, &level);
@@ -998,51 +997,52 @@ static int __check_host_shared_guest(struct pkvm_hyp_vm *vm, u64 *__phys, u64 ip
 		return ret;
 	if (!kvm_pte_valid(pte))
 		return -ENOENT;
-	if (level != KVM_PGTABLE_LAST_LEVEL)
+	if (kvm_granule_size(level) != size)
 		return -E2BIG;
 
-	state = guest_get_page_state(pte, ipa);
-	if (state != PKVM_PAGE_SHARED_BORROWED)
-		return -EPERM;
+	ret = __guest_check_page_state_range(vm, ipa, size, PKVM_PAGE_SHARED_BORROWED);
+	if (ret)
+		return ret;
 
 	phys = kvm_pte_to_phys(pte);
-	ret = check_range_allowed_memory(phys, phys + PAGE_SIZE);
+	ret = check_range_allowed_memory(phys, phys + size);
 	if (WARN_ON(ret))
 		return ret;
 
-	page = hyp_phys_to_page(phys);
-	if (page->host_state != PKVM_PAGE_SHARED_OWNED)
-		return -EPERM;
-	if (WARN_ON(!page->host_share_guest_count))
-		return -EINVAL;
+	for_each_hyp_page(phys, size, page) {
+		if (page->host_state != PKVM_PAGE_SHARED_OWNED)
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
-	struct hyp_page *page;
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
+	__host_update_share_guest_count(phys, size, false);
 
 unlock:
 	guest_unlock_component(vm);
@@ -1062,7 +1062,7 @@ static void assert_host_shared_guest(struct pkvm_hyp_vm *vm, u64 ipa)
 	host_lock_component();
 	guest_lock_component(vm);
 
-	ret = __check_host_shared_guest(vm, &phys, ipa);
+	ret = __check_host_shared_guest(vm, &phys, ipa, PAGE_SIZE);
 
 	guest_unlock_component(vm);
 	host_unlock_component();
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index 00fd9a524bf7..b65fcf245fc9 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -385,7 +385,7 @@ int pkvm_pgtable_stage2_unmap(struct kvm_pgtable *pgt, u64 addr, u64 size)
 
 	lockdep_assert_held_write(&kvm->mmu_lock);
 	for_each_mapping_in_range_safe(pgt, addr, addr + size, mapping) {
-		ret = kvm_call_hyp_nvhe(__pkvm_host_unshare_guest, handle, mapping->gfn);
+		ret = kvm_call_hyp_nvhe(__pkvm_host_unshare_guest, handle, mapping->gfn, 1);
 		if (WARN_ON(ret))
 			break;
 		rb_erase(&mapping->node, &pgt->pkvm_mappings);
-- 
2.48.1.711.g2feabab25a-goog


