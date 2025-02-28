Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D92FC19776
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 10:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=woexeE9czyXYmcShP359qQQ+UyXxB2V/SfwPim+kvA4=; b=GdniingZls4rBwT0Wn4j97vl1G
	84gBw3W7DycF5WE56IN5JdVJ6oLRzaEl55dsH3qWHrvuFzkymAdflk9ZJLAfNskAB4gFss5mXB8Vd
	CN3XO58rBsUDPCf+3WcYb4K6zF7LHoyaBDT4yJ8crtJlVtSh1JxhP9rpdJU4jDHcBWAuXdDBNkWiJ
	PDZBf3LPCv4W2vUQi6tMFeWdZ81nHunUa8dzBo+Ht6Zykj03Z24LgIU3Wu5Dy+cGcB0BLywgHTLlz
	HKqRulY7DmoHzJy7aBCIF5sXPIOjqU7WxNqoGH4korjMg1OB2NRsZQU9xW5QtlsE14//5O0EkcTdz
	9x4AkCIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnxlo-0000000Ad4h-1YeZ;
	Fri, 28 Feb 2025 10:39:04 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnxZ0-0000000AaSL-0uhl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 10:25:51 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-4388eee7073so13509715e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Feb 2025 02:25:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740738348; x=1741343148; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=woexeE9czyXYmcShP359qQQ+UyXxB2V/SfwPim+kvA4=;
        b=r5t8eMceDLVA8jB9D8UjW/RSami4Uvqcu70nW5EmwLLVfU5HcqHV2UsXJ+iv7ltHSu
         Wo9tH5askOerUWDllPW8X0+/BDuTN08ExN4bYYgl9XO91fmZP/x27HhAtMnuBlXakcKO
         xkVz/Ea+LD9KpA6ujKYcN6rpGz1KAj2skJDq+Ty/cVG61Bbzfa8lNMu5mPkbWZkmtuIJ
         sv3zQKkiaYBlmhlboTqfdY1pqF92Gh74hBGkBvkKFhvS0NteqL/G97E+tIH4PPiRd6RJ
         lDjxR4y/XzX6jnHkxdPED1iFn+VVq/8YlCK7kFdcciCnSh+LYUi71GvAMOO2Uq1hFiaK
         Z15w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740738348; x=1741343148;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=woexeE9czyXYmcShP359qQQ+UyXxB2V/SfwPim+kvA4=;
        b=kc1npyWO369NuSE8ERdBCqmOLxaZScdl7AipbOuTSSmeA5W74X5YICIBje1kTTiXtk
         hmm8ZIPdbUnuSnq46T7om60tZd+Rii8efbLCwQGbSdU1RUE58OzDIDUB4iZ0cmwM0lbd
         VLHxFDc9IwJ6SgH+GDt/SfsQp5aH8ItVaDQ6Nzw8tMlMCouI9/2LgI8bTzwNDxDsSZcA
         LeMleDxibsVjCWqNiQmmiJhb+ZG3Wl60gJFK4dVt1GXNpyqlhOdnwgYziBRO4no0+AEc
         MfK6nAO9c+xfCvPlSUYHCkBQ7XIvzfkw6uPM4vxIcU67yYxT78AN/rgscLHbJNhss/Vw
         DM4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVMxWynaVAbHULN0ka2j2JMd75YCmOH/y1qTgqJVV2UOv/IQVptadsbXFFHAsqqcKcUI3RGiDXiQkYJ4trgfAkk@lists.infradead.org
X-Gm-Message-State: AOJu0YyN1uviRhC+WCDDPAkG77QNeFS4GBrVCb8Ea5d4vdrZayCWaOgh
	jDEZa67punpCZz3oL2Pj+rqBJ+3RZGeJRg0TkqXieT5YU8SyaaooGFAYzOBSacjVi0eXlPQts0p
	9lHErvKiB+qXB9ljs0g==
X-Google-Smtp-Source: AGHT+IHc3ncN6k+2sm0Vab1oQPDzwV4k07eVX5WNpjt/D15gKXa33kx3e8bUSpOfh0E2+Ri4/HEFpe1b3cCIm0UN
X-Received: from wmbec10.prod.google.com ([2002:a05:600c:610a:b0:439:804a:4a89])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3549:b0:436:1b86:f05 with SMTP id 5b1f17b1804b1-43ba62901admr21902365e9.11.1740738348312;
 Fri, 28 Feb 2025 02:25:48 -0800 (PST)
Date: Fri, 28 Feb 2025 10:25:18 +0000
In-Reply-To: <20250228102530.1229089-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20250228102530.1229089-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <20250228102530.1229089-3-vdonnefort@google.com>
Subject: [PATCH 2/9] KVM: arm64: Add a range to __pkvm_host_share_guest()
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: qperret@google.com, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kernel-team@android.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_022550_257888_2793C924 
X-CRM114-Status: GOOD (  17.34  )
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
index a796e257c41f..2e49bd6e4ae8 100644
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
@@ -503,10 +506,25 @@ int host_stage2_idmap_locked(phys_addr_t addr, u64 size,
 
 static void __host_update_page_state(phys_addr_t addr, u64 size, enum pkvm_page_state state)
 {
-	phys_addr_t end = addr + size;
+	struct hyp_page *page;
+
+	for_each_hyp_page(addr, size, page)
+		page->host_state = state;
+}
+
+static void __host_update_share_guest_count(u64 phys, u64 size, bool inc)
+{
+	struct hyp_page *page;
 
-	for (; addr < end; addr += PAGE_SIZE)
-		hyp_phys_to_page(addr)->host_state = state;
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
@@ -621,16 +639,16 @@ static int check_page_state_range(struct kvm_pgtable *pgt, u64 addr, u64 size,
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
 
@@ -680,10 +698,9 @@ static enum pkvm_page_state guest_get_page_state(kvm_pte_t pte, u64 addr)
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
@@ -890,49 +907,75 @@ int __pkvm_host_unshare_ffa(u64 pfn, u64 nr_pages)
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
 	struct hyp_page *page;
+	u64 size;
 	int ret;
 
 	if (prot & ~KVM_PGTABLE_PROT_RWX)
 		return -EINVAL;
 
-	ret = check_range_allowed_memory(phys, phys + PAGE_SIZE);
+	ret = __guest_check_transition_size(phys, ipa, nr_pages, &size);
 	if (ret)
 		return ret;
 
 	host_lock_component();
 	guest_lock_component(vm);
 
-	ret = __guest_check_page_state_range(vcpu, ipa, PAGE_SIZE, PKVM_NOPAGE);
+	ret = __guest_check_page_state_range(vm, ipa, size, PKVM_NOPAGE);
 	if (ret)
 		goto unlock;
 
 	page = hyp_phys_to_page(phys);
+	ret = __host_check_page_state_range(phys, size, page->host_state);
+	if (ret)
+		goto unlock;
+
 	switch (page->host_state) {
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


