Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3417C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 14:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MuUUPGUNlLgL3YW2d98D/HjXl/LhdxFI7FznSu/zXVs=; b=XPrNzvdNop2gf/yfKlDD7I8T77
	uu16fu4FA//j+uiGfB08ISIXgaYo1o+zgjU+FO/qpE4HLU2G2FJRRzCMGsf+Y+w+S6MBmbSD7DsWZ
	jnX0LieorL/IGTkZ8H4Y95I3EWNee4rZOpOtQg1ON8uWAfEty84L/OFrllLsr9v86gk4oc4K3AbHF
	pYiddRyYQCwpN5B+3TvMdhzx3/rS/VCTl/Uak2PNE/+rj6M1RFnSCRqJwg8CH/9mg3yDD3KpJVfbb
	aU28elyCLzv9syp+X3TCQZlT7l021uKVuDL6hHwHvKLest4TjL6HlFs60bEs3alNQxBuay1JGc+Nn
	7NGo/AdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDOjb-00000003wsY-2Snb;
	Fri, 09 May 2025 14:29:55 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDNbJ-00000003iz6-0Wqs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 13:17:18 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-43ce8f82e66so10037665e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 May 2025 06:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746796635; x=1747401435; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=MuUUPGUNlLgL3YW2d98D/HjXl/LhdxFI7FznSu/zXVs=;
        b=IsgAifNuDkVAxVI4wI2IqlWkrH1k+x3TdIZ/zlHzr6fj3KY/nX0I6wJGEGf8c8SW9K
         nejjya0jItenHqJnfi6lKu9LZSjMVqpphhOmyA6dttfdu4aBXjbf4Jr7ZlcKKmoF6o8Z
         NbUEKH0agXbrdfqaCzK4MQkVQY/xkUrCLMZpLSTvqmcDokrEMad+wXKpnUPdwImM26OH
         s//L3ZSCIxt1Vvq3j1Ne4Quxz6RD0H+QUjjPN3FuxjurQTphxmu3kQRmxShPntG7imI8
         c37M7M8fbv1F9Hqx3oKdF+CtBGVAWttQUA0xDVtXyMBfbTk4KuwhXgquxNj8PNdNdZgk
         8AAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746796635; x=1747401435;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MuUUPGUNlLgL3YW2d98D/HjXl/LhdxFI7FznSu/zXVs=;
        b=aGY3wPZTg9lYWlhRXNDodx07blbyUiE04/eYs1Kgz17558SsSBGI8ksWNjT28hrUUB
         1YuWpM33bDbzIYgQi+yu0UGGtSDfgo2y6MWud+79vQ8zkImprR30mI8R4p5QHwzVrbqU
         rk/gJyPsbhYVBYRw8YRZWGsxiGOb/sQ2rI/x3Erxbh+YwThEVghBLExFucmakX6aH1tH
         aigM352UF42aAOmI0f6J+Lx81y0uwXdhO1XJaVNoB5pZGIbCrZQncXwKLOIVpu5Qk3/L
         GXBBieYkZv+6yrNB53jGXZ51oT0e9Rbdim52Ou8OfTAICIeJ7N1YQf2B8PkMlWKcyRtR
         NAmw==
X-Forwarded-Encrypted: i=1; AJvYcCWzXvJgphemgmVzhC8zezrnbb+FN65x+WmUjS6JGoIBTzWFvmoQnMU7IrBMIiaApZt2d+EJTMUxDfwvk59q5A31@lists.infradead.org
X-Gm-Message-State: AOJu0YwqO/vYFy51Jp4HNT64XZHiktFrO99ZVJqticFmz9xIX7qELW68
	ok0MeH6ebVS710hLR3kXuG5HE0yc39TUmi244XISvUD6IYebDfmJSMJnMT3cTd/5u/gM/j3GyVy
	Jym0kaa0RBOCkhxtZFA==
X-Google-Smtp-Source: AGHT+IHr/LYMD6ZOv2XrHZsPTX950y7HhnTgMHB9cYGym0qmTnKEqfwNLxc6Z2FepzPjnmTq0Q2LQl1tmzVkxjk1
X-Received: from wmbfl14.prod.google.com ([2002:a05:600c:b8e:b0:440:58dd:3795])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:6488:b0:43c:fffc:786c with SMTP id 5b1f17b1804b1-442d6d6ace2mr32830755e9.19.1746796634979;
 Fri, 09 May 2025 06:17:14 -0700 (PDT)
Date: Fri,  9 May 2025 14:16:58 +0100
In-Reply-To: <20250509131706.2336138-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20250509131706.2336138-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.49.0.1015.ga840276032-goog
Message-ID: <20250509131706.2336138-3-vdonnefort@google.com>
Subject: [PATCH v4 02/10] KVM: arm64: Introduce for_each_hyp_page
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: qperret@google.com, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kernel-team@android.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_061717_166225_65B1B4AE 
X-CRM114-Status: GOOD (  15.00  )
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

Add a helper to iterate over the hypervisor vmemmap. This will be
particularly handy with the introduction of huge mapping support
for the np-guest stage-2.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/kvm/hyp/include/nvhe/memory.h b/arch/arm64/kvm/hyp/include/nvhe/memory.h
index eb0c2ebd1743..676a0a13c741 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/memory.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/memory.h
@@ -96,24 +96,24 @@ static inline struct hyp_page *hyp_phys_to_page(phys_addr_t phys)
 #define hyp_page_to_virt(page)	__hyp_va(hyp_page_to_phys(page))
 #define hyp_page_to_pool(page)	(((struct hyp_page *)page)->pool)
 
-static inline enum pkvm_page_state get_host_state(phys_addr_t phys)
+static inline enum pkvm_page_state get_host_state(struct hyp_page *p)
 {
-	return (enum pkvm_page_state)hyp_phys_to_page(phys)->__host_state;
+	return (enum pkvm_page_state)p->__host_state;
 }
 
-static inline void set_host_state(phys_addr_t phys, enum pkvm_page_state state)
+static inline void set_host_state(struct hyp_page *p, enum pkvm_page_state state)
 {
-	hyp_phys_to_page(phys)->__host_state = state;
+	p->__host_state = state;
 }
 
-static inline enum pkvm_page_state get_hyp_state(phys_addr_t phys)
+static inline enum pkvm_page_state get_hyp_state(struct hyp_page *p)
 {
-	return hyp_phys_to_page(phys)->__hyp_state_comp ^ PKVM_PAGE_STATE_MASK;
+	return p->__hyp_state_comp ^ PKVM_PAGE_STATE_MASK;
 }
 
-static inline void set_hyp_state(phys_addr_t phys, enum pkvm_page_state state)
+static inline void set_hyp_state(struct hyp_page *p, enum pkvm_page_state state)
 {
-	hyp_phys_to_page(phys)->__hyp_state_comp = state ^ PKVM_PAGE_STATE_MASK;
+	p->__hyp_state_comp = state ^ PKVM_PAGE_STATE_MASK;
 }
 
 /*
diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 23544928a637..4d269210dae0 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -60,6 +60,9 @@ static void hyp_unlock_component(void)
 	hyp_spin_unlock(&pkvm_pgd_lock);
 }
 
+#define for_each_hyp_page(start, size, page)   \
+	for (page = hyp_phys_to_page(start); page < hyp_phys_to_page((start) + (size)); page++)
+
 static void *host_s2_zalloc_pages_exact(size_t size)
 {
 	void *addr = hyp_alloc_pages(&host_s2_pool, get_order(size));
@@ -481,7 +484,8 @@ static int host_stage2_adjust_range(u64 addr, struct kvm_mem_range *range)
 		return -EAGAIN;
 
 	if (pte) {
-		WARN_ON(addr_is_memory(addr) && get_host_state(addr) != PKVM_NOPAGE);
+		WARN_ON(addr_is_memory(addr) &&
+			get_host_state(hyp_phys_to_page(addr)) != PKVM_NOPAGE);
 		return -EPERM;
 	}
 
@@ -507,10 +511,10 @@ int host_stage2_idmap_locked(phys_addr_t addr, u64 size,
 
 static void __host_update_page_state(phys_addr_t addr, u64 size, enum pkvm_page_state state)
 {
-	phys_addr_t end = addr + size;
+	struct hyp_page *page;
 
-	for (; addr < end; addr += PAGE_SIZE)
-		set_host_state(addr, state);
+	for_each_hyp_page(addr, size, page)
+		set_host_state(page, state);
 }
 
 int host_stage2_set_owner_locked(phys_addr_t addr, u64 size, u8 owner_id)
@@ -632,16 +636,17 @@ static int check_page_state_range(struct kvm_pgtable *pgt, u64 addr, u64 size,
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
-		if (get_host_state(addr) != state)
+
+	for_each_hyp_page(addr, size, page) {
+		if (get_host_state(page) != state)
 			return -EPERM;
 	}
 
@@ -651,7 +656,7 @@ static int __host_check_page_state_range(u64 addr, u64 size,
 static int __host_set_page_state_range(u64 addr, u64 size,
 				       enum pkvm_page_state state)
 {
-	if (get_host_state(addr) == PKVM_NOPAGE) {
+	if (get_host_state(hyp_phys_to_page(addr)) == PKVM_NOPAGE) {
 		int ret = host_stage2_idmap_locked(addr, size, PKVM_HOST_MEM_PROT);
 
 		if (ret)
@@ -665,18 +670,18 @@ static int __host_set_page_state_range(u64 addr, u64 size,
 
 static void __hyp_set_page_state_range(phys_addr_t phys, u64 size, enum pkvm_page_state state)
 {
-	phys_addr_t end = phys + size;
+	struct hyp_page *page;
 
-	for (; phys < end; phys += PAGE_SIZE)
-		set_hyp_state(phys, state);
+	for_each_hyp_page(phys, size, page)
+		set_hyp_state(page, state);
 }
 
 static int __hyp_check_page_state_range(phys_addr_t phys, u64 size, enum pkvm_page_state state)
 {
-	phys_addr_t end = phys + size;
+	struct hyp_page *page;
 
-	for (; phys < end; phys += PAGE_SIZE) {
-		if (get_hyp_state(phys) != state)
+	for_each_hyp_page(phys, size, page) {
+		if (get_hyp_state(page) != state)
 			return -EPERM;
 	}
 
@@ -927,7 +932,7 @@ int __pkvm_host_share_guest(u64 pfn, u64 gfn, struct pkvm_hyp_vcpu *vcpu,
 		goto unlock;
 
 	page = hyp_phys_to_page(phys);
-	switch (get_host_state(phys)) {
+	switch (get_host_state(page)) {
 	case PKVM_PAGE_OWNED:
 		WARN_ON(__host_set_page_state_range(phys, PAGE_SIZE, PKVM_PAGE_SHARED_OWNED));
 		break;
@@ -979,9 +984,9 @@ static int __check_host_shared_guest(struct pkvm_hyp_vm *vm, u64 *__phys, u64 ip
 	if (WARN_ON(ret))
 		return ret;
 
-	if (get_host_state(phys) != PKVM_PAGE_SHARED_OWNED)
-		return -EPERM;
 	page = hyp_phys_to_page(phys);
+	if (get_host_state(page) != PKVM_PAGE_SHARED_OWNED)
+		return -EPERM;
 	if (WARN_ON(!page->host_share_guest_count))
 		return -EINVAL;
 
diff --git a/arch/arm64/kvm/hyp/nvhe/setup.c b/arch/arm64/kvm/hyp/nvhe/setup.c
index 6d513a4b3763..c19860fc8183 100644
--- a/arch/arm64/kvm/hyp/nvhe/setup.c
+++ b/arch/arm64/kvm/hyp/nvhe/setup.c
@@ -190,6 +190,7 @@ static int fix_host_ownership_walker(const struct kvm_pgtable_visit_ctx *ctx,
 				     enum kvm_pgtable_walk_flags visit)
 {
 	enum pkvm_page_state state;
+	struct hyp_page *page;
 	phys_addr_t phys;
 
 	if (!kvm_pte_valid(ctx->old))
@@ -202,6 +203,8 @@ static int fix_host_ownership_walker(const struct kvm_pgtable_visit_ctx *ctx,
 	if (!addr_is_memory(phys))
 		return -EINVAL;
 
+	page = hyp_phys_to_page(phys);
+
 	/*
 	 * Adjust the host stage-2 mappings to match the ownership attributes
 	 * configured in the hypervisor stage-1, and make sure to propagate them
@@ -210,15 +213,15 @@ static int fix_host_ownership_walker(const struct kvm_pgtable_visit_ctx *ctx,
 	state = pkvm_getstate(kvm_pgtable_hyp_pte_prot(ctx->old));
 	switch (state) {
 	case PKVM_PAGE_OWNED:
-		set_hyp_state(phys, PKVM_PAGE_OWNED);
+		set_hyp_state(page, PKVM_PAGE_OWNED);
 		return host_stage2_set_owner_locked(phys, PAGE_SIZE, PKVM_ID_HYP);
 	case PKVM_PAGE_SHARED_OWNED:
-		set_hyp_state(phys, PKVM_PAGE_SHARED_OWNED);
-		set_host_state(phys, PKVM_PAGE_SHARED_BORROWED);
+		set_hyp_state(page, PKVM_PAGE_SHARED_OWNED);
+		set_host_state(page, PKVM_PAGE_SHARED_BORROWED);
 		break;
 	case PKVM_PAGE_SHARED_BORROWED:
-		set_hyp_state(phys, PKVM_PAGE_SHARED_BORROWED);
-		set_host_state(phys, PKVM_PAGE_SHARED_OWNED);
+		set_hyp_state(page, PKVM_PAGE_SHARED_BORROWED);
+		set_host_state(page, PKVM_PAGE_SHARED_OWNED);
 		break;
 	default:
 		return -EINVAL;
-- 
2.49.0.1015.ga840276032-goog


