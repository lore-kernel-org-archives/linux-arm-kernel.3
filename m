Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D619C3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 09:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0qnoZeCyJg3ALVmFHMjFJfi4uCu0wBz7RX/Yio9mY38=; b=T8USPhcUS0nGllbfKgMkP1hhpm
	GdIdiLgXntna2OpM3lz72ijXn7KjG4+0RRkTmyIh1we8qwcDo6xcWYg4koOYR8SKGl9iuDwP1IZCx
	uCLazDapbLRzulAc9LrKpLas53xBO0SdlQlJPiynBznlmox/cx2y6OFEyRIFBUuPojYML7eSUqRPB
	XBHsoomWWjv/7OhDq8GQ4AzsIERr1PXP67dG+9XKUVTB1fB1Y35G3mvcn/dIraRqUr8iBePDngvVD
	CcBgyJXjV9Q145TDrX4Hg9Uv7CMhiREn7A4IMAELSumn07QCeYzGJYYaUkqh6aFMOD774SIX7i6ZQ
	JVyDCH4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHJil-0000000CGeE-3xvP;
	Tue, 20 May 2025 09:57:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHJOp-0000000CDR6-11qU
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 20 May 2025 09:36:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=0qnoZeCyJg3ALVmFHMjFJfi4uCu0wBz7RX/Yio9mY38=; b=hQO9F/NWMIOmZPz5mYbNvINtk5
	wycKQp65wNorJgVmWnjsPx7vHlKryVR6SetVUmDJvAFnuBDcsiE/kltmhAShqbRwh6FUKotkrMbzz
	DbGR+/Cc7LVfmj6X1U3GYwsMEzxC8UA7qvowH7mfDqINTCjiPRjXloyEHuNfIN823l2qSIiYEVevR
	iKVfKw+GY+McVdu6XNKR1AiadYJ08TiyKFSaj+m/uHXdvI91KyjZJ+2RipbSvccVoWkYV40y9mBMm
	mJ86CP/0FWraAmifAnfNqiAMiU50HKd/vwhmBKxX8DSSXb8GqPcPkCFoOvueS+qdBnNI2GdRwWxmi
	kKedi44g==;
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uHIii-00000000jon-38It
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 08:53:47 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-43efa869b19so43571215e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 May 2025 01:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747731187; x=1748335987; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=0qnoZeCyJg3ALVmFHMjFJfi4uCu0wBz7RX/Yio9mY38=;
        b=zsxUfn0aQWvYuAnTqDy7E+//UW+UyDilUgAfXlg4/zCa7EKnS1YWbkSM3q5qfUesec
         qLl4ejQtfgbZy2z9J8CNuNC4F5FrIKqcTbculVo5Ys/XwivcvLldy6d9mbNzqIMLFKCO
         fi4JbLoJdEQOP/GZq65lUapuDt+Tx5oz2Wl7AxxUhIWkevGJkERd2auuvsTFBYtjIJSH
         umufvKZb2+333vUlykb9rESMVHor1kmvFynKecDl4ebohDyQK7xTHODBnfz1FvdEE9Fj
         ZWdMzFpMXqaDw9iL6/xLfpNA4V9qegvfvsErEpY5k1pdpLGi5RALf8nW5/jOYXUtcKOv
         imIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747731187; x=1748335987;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0qnoZeCyJg3ALVmFHMjFJfi4uCu0wBz7RX/Yio9mY38=;
        b=u7fcQ48ye+5d82kIBGTCgOfRRnS3LgP/1elor9WAmwsLYWEN4X2556IIiiv4zuaxBq
         C1LLYqqpSHMExzorFP6K4DlCj3xxfC1tH0lOgFDOhS8Vg5Q2ZI3GDlPiwWGPH9yUL+de
         UefGXvc47vmihofzTgg7ltmhy0Z2R0yRNFJK7ti4cKOUZOF4Q+UJpsAb2f+EE3jWSw9G
         WnYGzQ22BjYOcARLXbBoPvs+8OlxbiAREza5PEBVVIj4P3pptF+Sw6fIaF0ekHB5uwSq
         Zptz2U6xe9oBrs+4q2GyKZ2PpeybhVwecgRMYQUUpf4uAEuhYCb3bCi57TRDsTMTFD7u
         AgHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRLWnKRUpaOGUxFMPUiQ52oQ0H+Wul9vpWIj14BU2MnFf6gEhKSXcBNSOgcX7zk2iUBvn9D+Y1W9bay1aHB7vM@lists.infradead.org
X-Gm-Message-State: AOJu0YwEZ1RmyGuh4QDGjxah/04tkJJoHcWe1F/5hKBxkQQXRIhJVXUs
	11G8I7vvdOU+Piz6XczY8TMx9WKQYJ+5GTxsFuxKidUTF5SPPyKzGQ5y+YF94ZFLCZghytvx/ms
	cOa772fiLbiwiSfwMHS6++A==
X-Google-Smtp-Source: AGHT+IEpcnPZ2ofMn+yji7Z+XgSt5iwLOb91LYysxKgZe0xq+lvgP12pvdNLF1SqkBuLey6BH72CI9pPRzVZ9+5E
X-Received: from wmbbe8.prod.google.com ([2002:a05:600c:1e88:b0:43b:bf16:d6be])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1d8c:b0:442:e109:3032 with SMTP id 5b1f17b1804b1-445917d2a0amr66079815e9.24.1747731187551;
 Tue, 20 May 2025 01:53:07 -0700 (PDT)
Date: Tue, 20 May 2025 09:51:55 +0100
In-Reply-To: <20250520085201.3059786-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20250520085201.3059786-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.49.0.1143.g0be31eac6b-goog
Message-ID: <20250520085201.3059786-5-vdonnefort@google.com>
Subject: [PATCH v5 04/10] KVM: arm64: Add a range to __pkvm_host_unshare_guest()
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: qperret@google.com, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kernel-team@android.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_095309_295543_BE76113F 
X-CRM114-Status: GOOD (  13.13  )
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
index 8e0847aa090d..884e2316aa48 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -980,10 +980,9 @@ int __pkvm_host_share_guest(u64 pfn, u64 gfn, u64 nr_pages, struct pkvm_hyp_vcpu
 	return ret;
 }
 
-static int __check_host_shared_guest(struct pkvm_hyp_vm *vm, u64 *__phys, u64 ipa)
+static int __check_host_shared_guest(struct pkvm_hyp_vm *vm, u64 *__phys, u64 ipa, u64 size)
 {
 	enum pkvm_page_state state;
-	struct hyp_page *page;
 	kvm_pte_t pte;
 	u64 phys;
 	s8 level;
@@ -994,7 +993,7 @@ static int __check_host_shared_guest(struct pkvm_hyp_vm *vm, u64 *__phys, u64 ip
 		return ret;
 	if (!kvm_pte_valid(pte))
 		return -ENOENT;
-	if (level != KVM_PGTABLE_LAST_LEVEL)
+	if (kvm_granule_size(level) != size)
 		return -E2BIG;
 
 	state = guest_get_page_state(pte, ipa);
@@ -1002,43 +1001,49 @@ static int __check_host_shared_guest(struct pkvm_hyp_vm *vm, u64 *__phys, u64 ip
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
+	for_each_hyp_page(page, phys, size) {
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
+	for_each_hyp_page(page, phys, size) {
+		/* __check_host_shared_guest() protects against underflow */
+		page->host_share_guest_count--;
+		if (!page->host_share_guest_count)
+			set_host_state(page, PKVM_PAGE_OWNED);
+	}
 
 unlock:
 	guest_unlock_component(vm);
@@ -1058,7 +1063,7 @@ static void assert_host_shared_guest(struct pkvm_hyp_vm *vm, u64 ipa)
 	host_lock_component();
 	guest_lock_component(vm);
 
-	ret = __check_host_shared_guest(vm, &phys, ipa);
+	ret = __check_host_shared_guest(vm, &phys, ipa, PAGE_SIZE);
 
 	guest_unlock_component(vm);
 	host_unlock_component();
@@ -1245,7 +1250,7 @@ void pkvm_ownership_selftest(void *base)
 	assert_transition_res(-EPERM,	__pkvm_host_unshare_ffa, pfn, 1);
 	assert_transition_res(-EPERM,	hyp_pin_shared_mem, virt, virt + size);
 	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, 1, vcpu, prot);
-	assert_transition_res(-ENOENT,	__pkvm_host_unshare_guest, gfn, vm);
+	assert_transition_res(-ENOENT,	__pkvm_host_unshare_guest, gfn, 1, vm);
 
 	selftest_state.host = PKVM_PAGE_OWNED;
 	selftest_state.hyp = PKVM_NOPAGE;
@@ -1253,7 +1258,7 @@ void pkvm_ownership_selftest(void *base)
 	assert_transition_res(-EPERM,	__pkvm_hyp_donate_host, pfn, 1);
 	assert_transition_res(-EPERM,	__pkvm_host_unshare_hyp, pfn);
 	assert_transition_res(-EPERM,	__pkvm_host_unshare_ffa, pfn, 1);
-	assert_transition_res(-ENOENT,	__pkvm_host_unshare_guest, gfn, vm);
+	assert_transition_res(-ENOENT,	__pkvm_host_unshare_guest, gfn, 1, vm);
 	assert_transition_res(-EPERM,	hyp_pin_shared_mem, virt, virt + size);
 
 	selftest_state.host = PKVM_PAGE_SHARED_OWNED;
@@ -1264,7 +1269,7 @@ void pkvm_ownership_selftest(void *base)
 	assert_transition_res(-EPERM,	__pkvm_host_share_ffa, pfn, 1);
 	assert_transition_res(-EPERM,	__pkvm_hyp_donate_host, pfn, 1);
 	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, 1, vcpu, prot);
-	assert_transition_res(-ENOENT,	__pkvm_host_unshare_guest, gfn, vm);
+	assert_transition_res(-ENOENT,	__pkvm_host_unshare_guest, gfn, 1, vm);
 
 	assert_transition_res(0,	hyp_pin_shared_mem, virt, virt + size);
 	assert_transition_res(0,	hyp_pin_shared_mem, virt, virt + size);
@@ -1276,7 +1281,7 @@ void pkvm_ownership_selftest(void *base)
 	assert_transition_res(-EPERM,	__pkvm_host_share_ffa, pfn, 1);
 	assert_transition_res(-EPERM,	__pkvm_hyp_donate_host, pfn, 1);
 	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, 1, vcpu, prot);
-	assert_transition_res(-ENOENT,	__pkvm_host_unshare_guest, gfn, vm);
+	assert_transition_res(-ENOENT,	__pkvm_host_unshare_guest, gfn, 1, vm);
 
 	hyp_unpin_shared_mem(virt, virt + size);
 	assert_page_state();
@@ -1295,7 +1300,7 @@ void pkvm_ownership_selftest(void *base)
 	assert_transition_res(-EPERM,	__pkvm_host_unshare_hyp, pfn);
 	assert_transition_res(-EPERM,	__pkvm_hyp_donate_host, pfn, 1);
 	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, 1, vcpu, prot);
-	assert_transition_res(-ENOENT,	__pkvm_host_unshare_guest, gfn, vm);
+	assert_transition_res(-ENOENT,	__pkvm_host_unshare_guest, gfn, 1, vm);
 	assert_transition_res(-EPERM,	hyp_pin_shared_mem, virt, virt + size);
 
 	selftest_state.host = PKVM_PAGE_OWNED;
@@ -1319,11 +1324,11 @@ void pkvm_ownership_selftest(void *base)
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
2.49.0.1143.g0be31eac6b-goog


