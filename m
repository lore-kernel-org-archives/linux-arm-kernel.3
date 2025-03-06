Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA563C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 11:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Nk4OPygl6hlYnOAq4z2AVFwBU0df555iSROa6vHa3A=; b=gCX0CJDIj7HrlaM0G1yY+pqxgo
	t7mvwG0wIRJsfhaTXmSUXAnfvz5ZlHKbxU5I6uTtX7zGROE0M6AMfoF67goNo+thrVxi2Y+CaMSPS
	TDPEyfHnd06+0o7yqnLIIdF8SQnnUrIyqPFRk68nfF1dW/T6dCRCTG2GCyMpVCeujDS8+AaziZrPd
	Wv9oyu2658KEelpxHeacYs82LDSegEjxi/uPnztRB547XF6CR1xoxM3GbophhJ2HM7ZXzSz7fN1cV
	OE1iZSaeqtwd11TrUgkfsoITekK5fLBJC2bIZRCxtS5ZhpORdz2q/COKGGt+0VZGHVbPBJK/dm3L5
	M97h1PPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq92s-0000000AjJu-2r5i;
	Thu, 06 Mar 2025 11:05:42 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq8yB-0000000AiWO-0aBX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 11:00:52 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-43bd8fd03a2so2270935e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Mar 2025 03:00:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741258849; x=1741863649; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7Nk4OPygl6hlYnOAq4z2AVFwBU0df555iSROa6vHa3A=;
        b=wGUnpzXaQ+sE8+rI0sqjDz5cnGD3Zehyfl4xEico3LndxwE39pRc5ob9x6Xt9wclYA
         bzVuJO0Bd2BKOSxf4EQGdFQJB0YgsnwOOGr5mqiwGMZazdBNrbFkSsw9HIVe4XSvj4hp
         jZiZ10K/0mRPwyNZGKGIvFFK6N5zHi7LyMUblF7UCGI9Zt6Dly6jxA2L/F9rz9a7xD6e
         B8yQ0JrjrDFQMjrO1L+4OGsoQR9nYw1dKIqNUDH0Lmf/vjP+OSltEekyRXIxIO27z3WH
         pN6D5sBMkiB9PJ2/FDNR4qbJufQnzwp3VI+lRZ6jFxgzh8cOcx8K65zf7mF8yXPROS5e
         a5sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741258849; x=1741863649;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7Nk4OPygl6hlYnOAq4z2AVFwBU0df555iSROa6vHa3A=;
        b=SqQV1ogVNfbFIIchHEzISQ8sABr2JoxuFEMUqD+ZnFAobJz6YsDNI7MUfoJoe7S/s4
         cow2Vo80Y8LKbuTS6kxjrJEUOuwi2nZzinkRaUBvjPV43rZo8gZRX8O9wZdEgh+d3IAj
         vMKQVu1eUps0nm8Qaui9c8FWoa7/hlyDpwvYBXhO3HN6rae1RUEuxmtXVjwx0fGC4Ze+
         6euIwvbXlLUzErjAkjjANx0oG5PuRdWl9yQwoLh3VJw6EcYRDIHdM/0MmFrAxApakM5j
         MDtd3NBSSZQ3gDO0nseTkIofTyhI1rZnW4wb+401iFismFmVBJZg0g0HuhlHsxKHZSFb
         tAow==
X-Forwarded-Encrypted: i=1; AJvYcCVGr84akZtAI5J7otsx3qR/hhpTc8Yql9z5xyhRyawna1LkjLnQs8iS7ZKX5WmnunNa0VbNZtOe7xy8zmzuRsix@lists.infradead.org
X-Gm-Message-State: AOJu0Yyydn1J+gsv1YVc6Wdpj6ejC5KxKIkz3dRJi3vcr5j2zXaft8FW
	IXUNRtNfFHFMnKv2LfiGDhIwMsStsK58yaFAKHoI9cDwMFElVfCjw8PitjAP+WqoYALiy7EJO1h
	aSB5g2H6FnQU4Ml8Raw==
X-Google-Smtp-Source: AGHT+IHG431C9Dkqi/qIYLv2PsF4AG9wTnpdTRpS5AhCVpzGRU9pbxvoEXa2dp5chGFByPGXrjbUxl1WoPU70v1o
X-Received: from wmbfj12.prod.google.com ([2002:a05:600c:c8c:b0:43b:cdf0:8c03])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1988:b0:439:a1c7:7b2d with SMTP id 5b1f17b1804b1-43bd29272a3mr53453075e9.4.1741258849608;
 Thu, 06 Mar 2025 03:00:49 -0800 (PST)
Date: Thu,  6 Mar 2025 11:00:31 +0000
In-Reply-To: <20250306110038.3733649-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20250306110038.3733649-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <20250306110038.3733649-3-vdonnefort@google.com>
Subject: [PATCH v2 2/9] KVM: arm64: Add a range to __pkvm_host_share_guest()
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: qperret@google.com, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kernel-team@android.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_030051_181596_FFDD0A64 
X-CRM114-Status: GOOD (  17.29  )
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
nr_pages argument to the __pkvm_host_share_guest hypercall. This range
supports only two values: 1 or PMD_SIZE / PAGE_SIZE (that is 512 on a
4K-pages system).

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
index 978f38c386ee..1abbab5e2ff8 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
@@ -39,7 +39,7 @@ int __pkvm_host_donate_hyp(u64 pfn, u64 nr_pages);
 int __pkvm_hyp_donate_host(u64 pfn, u64 nr_pages);
 int __pkvm_host_share_ffa(u64 pfn, u64 nr_pages);
 int __pkvm_host_unshare_ffa(u64 pfn, u64 nr_pages);
-int __pkvm_host_share_guest(u64 pfn, u64 gfn, struct pkvm_hyp_vcpu *vcpu,
+int __pkvm_host_share_guest(u64 pfn, u64 gfn, u64 nr_pages, struct pkvm_hyp_vcpu *vcpu,
 			    enum kvm_pgtable_prot prot);
 int __pkvm_host_unshare_guest(u64 gfn, struct pkvm_hyp_vm *hyp_vm);
 int __pkvm_host_relax_perms_guest(u64 gfn, struct pkvm_hyp_vcpu *vcpu, enum kvm_pgtable_prot prot);
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 2c37680d954c..e71601746935 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -249,7 +249,8 @@ static void handle___pkvm_host_share_guest(struct kvm_cpu_context *host_ctxt)
 {
 	DECLARE_REG(u64, pfn, host_ctxt, 1);
 	DECLARE_REG(u64, gfn, host_ctxt, 2);
-	DECLARE_REG(enum kvm_pgtable_prot, prot, host_ctxt, 3);
+	DECLARE_REG(u64, nr_pages, host_ctxt, 3);
+	DECLARE_REG(enum kvm_pgtable_prot, prot, host_ctxt, 4);
 	struct pkvm_hyp_vcpu *hyp_vcpu;
 	int ret = -EINVAL;
 
@@ -264,7 +265,7 @@ static void handle___pkvm_host_share_guest(struct kvm_cpu_context *host_ctxt)
 	if (ret)
 		goto out;
 
-	ret = __pkvm_host_share_guest(pfn, gfn, hyp_vcpu, prot);
+	ret = __pkvm_host_share_guest(pfn, gfn, nr_pages, hyp_vcpu, prot);
 out:
 	cpu_reg(host_ctxt, 1) =  ret;
 }
diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 63968c7740c3..7e3a249149a0 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -60,6 +60,9 @@ static void hyp_unlock_component(void)
 	hyp_spin_unlock(&pkvm_pgd_lock);
 }
 
+#define for_each_hyp_page(start, size, page)	\
+	for (page = hyp_phys_to_page(start); page < hyp_phys_to_page((start) + (size)); page++)
+
 static void *host_s2_zalloc_pages_exact(size_t size)
 {
 	void *addr = hyp_alloc_pages(&host_s2_pool, get_order(size));
@@ -509,10 +512,25 @@ int host_stage2_idmap_locked(phys_addr_t addr, u64 size,
 
 static void __host_update_page_state(phys_addr_t addr, u64 size, enum pkvm_page_state state)
 {
-	phys_addr_t end = addr + size;
+	struct hyp_page *page;
 
-	for (; addr < end; addr += PAGE_SIZE)
-		hyp_phys_to_page(addr)->host_state = state;
+	for_each_hyp_page(addr, size, page)
+		page->host_state = state;
+}
+
+static void __host_update_share_guest_count(u64 phys, u64 size, bool inc)
+{
+	struct hyp_page *page;
+
+	for_each_hyp_page(phys, size, page) {
+		if (inc) {
+			WARN_ON(page->host_share_guest_count++ == U32_MAX);
+		} else {
+			WARN_ON(!page->host_share_guest_count--);
+			if (!page->host_share_guest_count)
+				page->host_state = PKVM_PAGE_OWNED;
+		}
+	}
 }
 
 int host_stage2_set_owner_locked(phys_addr_t addr, u64 size, u8 owner_id)
@@ -627,16 +645,16 @@ static int check_page_state_range(struct kvm_pgtable *pgt, u64 addr, u64 size,
 static int __host_check_page_state_range(u64 addr, u64 size,
 					 enum pkvm_page_state state)
 {
-	u64 end = addr + size;
+	struct hyp_page *page;
 	int ret;
 
-	ret = check_range_allowed_memory(addr, end);
+	ret = check_range_allowed_memory(addr, addr + size);
 	if (ret)
 		return ret;
 
 	hyp_assert_lock_held(&host_mmu.lock);
-	for (; addr < end; addr += PAGE_SIZE) {
-		if (hyp_phys_to_page(addr)->host_state != state)
+	for_each_hyp_page(addr, size, page) {
+		if (page->host_state != state)
 			return -EPERM;
 	}
 
@@ -686,10 +704,9 @@ static enum pkvm_page_state guest_get_page_state(kvm_pte_t pte, u64 addr)
 	return pkvm_getstate(kvm_pgtable_stage2_pte_prot(pte));
 }
 
-static int __guest_check_page_state_range(struct pkvm_hyp_vcpu *vcpu, u64 addr,
+static int __guest_check_page_state_range(struct pkvm_hyp_vm *vm, u64 addr,
 					  u64 size, enum pkvm_page_state state)
 {
-	struct pkvm_hyp_vm *vm = pkvm_hyp_vcpu_to_hyp_vm(vcpu);
 	struct check_walk_data d = {
 		.desired	= state,
 		.get_page_state	= guest_get_page_state,
@@ -896,49 +913,83 @@ int __pkvm_host_unshare_ffa(u64 pfn, u64 nr_pages)
 	return ret;
 }
 
-int __pkvm_host_share_guest(u64 pfn, u64 gfn, struct pkvm_hyp_vcpu *vcpu,
+static int __guest_check_transition_size(u64 phys, u64 ipa, u64 nr_pages, u64 *size)
+{
+	if (nr_pages == 1) {
+		*size = PAGE_SIZE;
+		return 0;
+	}
+
+	/* We solely support PMD_SIZE huge-pages */
+	if (nr_pages != (1 << (PMD_SHIFT - PAGE_SHIFT)))
+		return -EINVAL;
+
+	if (!IS_ALIGNED(phys | ipa, PMD_SIZE))
+		return -EINVAL;
+
+	*size = PMD_SIZE;
+	return 0;
+}
+
+int __pkvm_host_share_guest(u64 pfn, u64 gfn, u64 nr_pages, struct pkvm_hyp_vcpu *vcpu,
 			    enum kvm_pgtable_prot prot)
 {
 	struct pkvm_hyp_vm *vm = pkvm_hyp_vcpu_to_hyp_vm(vcpu);
 	u64 phys = hyp_pfn_to_phys(pfn);
 	u64 ipa = hyp_pfn_to_phys(gfn);
+	enum pkvm_page_state state;
 	struct hyp_page *page;
+	u64 size;
 	int ret;
 
 	if (prot & ~KVM_PGTABLE_PROT_RWX)
 		return -EINVAL;
 
-	ret = check_range_allowed_memory(phys, phys + PAGE_SIZE);
+	ret = __guest_check_transition_size(phys, ipa, nr_pages, &size);
+	if (ret)
+		return ret;
+
+	ret = check_range_allowed_memory(phys, phys + size);
 	if (ret)
 		return ret;
 
 	host_lock_component();
 	guest_lock_component(vm);
 
-	ret = __guest_check_page_state_range(vcpu, ipa, PAGE_SIZE, PKVM_NOPAGE);
+	ret = __guest_check_page_state_range(vm, ipa, size, PKVM_NOPAGE);
 	if (ret)
 		goto unlock;
 
-	page = hyp_phys_to_page(phys);
-	switch (page->host_state) {
+	state = hyp_phys_to_page(phys)->host_state;
+	for_each_hyp_page(phys, size, page) {
+		if (page->host_state != state) {
+			ret = -EPERM;
+			goto unlock;
+		}
+	}
+
+	switch (state) {
 	case PKVM_PAGE_OWNED:
-		WARN_ON(__host_set_page_state_range(phys, PAGE_SIZE, PKVM_PAGE_SHARED_OWNED));
+		WARN_ON(__host_set_page_state_range(phys, size, PKVM_PAGE_SHARED_OWNED));
 		break;
 	case PKVM_PAGE_SHARED_OWNED:
-		if (page->host_share_guest_count)
-			break;
-		/* Only host to np-guest multi-sharing is tolerated */
-		WARN_ON(1);
-		fallthrough;
+		for_each_hyp_page(phys, size, page) {
+			/* Only host to np-guest multi-sharing is tolerated */
+			if (WARN_ON(!page->host_share_guest_count)) {
+				ret = -EPERM;
+				goto unlock;
+			}
+		}
+		break;
 	default:
 		ret = -EPERM;
 		goto unlock;
 	}
 
-	WARN_ON(kvm_pgtable_stage2_map(&vm->pgt, ipa, PAGE_SIZE, phys,
+	WARN_ON(kvm_pgtable_stage2_map(&vm->pgt, ipa, size, phys,
 				       pkvm_mkstate(prot, PKVM_PAGE_SHARED_BORROWED),
 				       &vcpu->vcpu.arch.pkvm_memcache, 0));
-	page->host_share_guest_count++;
+	__host_update_share_guest_count(phys, size, true);
 
 unlock:
 	guest_unlock_component(vm);
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index 930b677eb9b0..00fd9a524bf7 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -361,7 +361,7 @@ int pkvm_pgtable_stage2_map(struct kvm_pgtable *pgt, u64 addr, u64 size,
 		return -EINVAL;
 
 	lockdep_assert_held_write(&kvm->mmu_lock);
-	ret = kvm_call_hyp_nvhe(__pkvm_host_share_guest, pfn, gfn, prot);
+	ret = kvm_call_hyp_nvhe(__pkvm_host_share_guest, pfn, gfn, 1, prot);
 	if (ret) {
 		/* Is the gfn already mapped due to a racing vCPU? */
 		if (ret == -EPERM)
-- 
2.48.1.711.g2feabab25a-goog


