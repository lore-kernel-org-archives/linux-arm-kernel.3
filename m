Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B45EC2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 12:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=plMFgSGJhN3aobtGanbzGcqM69WCQayfYelFMBRo2Js=; b=zWA0dTsMWWSMXLdfMOVIikRgKy
	ICECvpE1U7AqIDSMW7PAb9q3uclkh3WkdfZfkrp148+E8wEWhOj2WV4YOnVuxG3BxJ8ODgzb05iHu
	bnUTBHEwPKQOZfzMXM72K1tnN78egGCr4psKdqjkHoApn+UVTJeDqFsUQ9jqYrAcdN97obqze2Nt+
	9nemvjXbjFqvfJ6a6P8UWbPnJxoJpv+8AvrmPr3ZgUdur85lxW8EfczbJ+39n8j4S6U4qGIl+H3nk
	r7ZcCAtKvhwNbWL4zsGs9c0cwN9hEKqXd9Q512xYH7KeeFD3v/u2nJi5p4YeWP9T1dozmXJuxQNuu
	gLoCcxpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHj0f-0000000FquI-3MvK;
	Wed, 21 May 2025 12:57:25 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHiua-0000000FpbY-2Xmg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 May 2025 12:51:09 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-3a3660a9096so1855714f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 May 2025 05:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747831867; x=1748436667; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=plMFgSGJhN3aobtGanbzGcqM69WCQayfYelFMBRo2Js=;
        b=AKFHeuzTzHH4bNRFh7i5Q1PWGU5kWoX9Abz+6klDYkuGK+grYjB5HUDvS0UNA++cXm
         zwTemA28nZGlVea9KaxErbO+LfvgcULqo5SYd925juxtd2p3B0kPuL/RtZShzZYyjEOw
         NPgfyTMYuMDQjZtzYv3Y061oJkL9T9nKT9rf3WDXZ2tTq7ccNHyyEBs/M25IGIKxTRFe
         oBslKntUlRpvYoS3A/n5sdoY0gJ9f1Jgn8bEZW2fYOcoEd4LWElnKP3/cxMaw33d9sTV
         /MKilT01CwgdAGe6xwvuFkmjWcga7W5uWMttzkunRwirXg0NrM4/BNFXkYH0EMd3vif9
         bm5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747831867; x=1748436667;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=plMFgSGJhN3aobtGanbzGcqM69WCQayfYelFMBRo2Js=;
        b=sknZgihuq3LmA7KAslZYcWxxrMAaBTQHqgznNWknLTp1FLXTpGFezwDj5Y3ZuNx77D
         NqxP6iFM1io1Xllq2rCTy5k4ScTEIjlpQu+admxyiFB3QCtLMwdHyq8Qwt5HFYMLDxfz
         sdDeKKjqQ8KuaFoIfNc86GoLEhryCE2G5z8t2diNlvh7mYrM/UOJF9vLQJJ5shfZweIK
         Siyb/hdXSIYT7JNo1Fo0aJed0BliF684GvEYDluNTMIjnAxwOw5OibQ6CO4mWLbjM1VW
         KJfooPuC020cYYf66SydQ27ZQ0r8I4ndwM3jgCrZ1OyQQr+oN3mEkCc043vnrjiZkTe1
         84Ow==
X-Forwarded-Encrypted: i=1; AJvYcCXFi7LVHIPdEv17WcO8pUxLnAZi5tJxput+rBetufjSos3ZMbQKvNhFPQArrYIk0sRmVqCopQWZqzKjj+r0usVX@lists.infradead.org
X-Gm-Message-State: AOJu0Yym+xBVxn1Z4GAj4fBsykPK67fa3J5UX+Ri3pMV6GqE82CwvzQY
	tPgYRUH5GH4kUguUXTPVmnnjP/dSD/lbGF4L/r0LJ7ikriAjHjK1L9Ce3baFKCB/bCEWf/unQtH
	IdkKsJMp3XWJeqbby9jsX0w==
X-Google-Smtp-Source: AGHT+IGUJ63iSzGU9Dvi29HCEISiLcJX+9ayQfyUSIkAJKvRnN6Pz7ziGCcGzjc9QNZmRMp/cFiAga+uxL4Qvxfo
X-Received: from wro21.prod.google.com ([2002:a05:6000:41d5:b0:3a3:6593:a846])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:64ee:0:b0:3a0:8291:20d0 with SMTP id ffacd0b85a97d-3a35c83f19bmr19075001f8f.29.1747831866928;
 Wed, 21 May 2025 05:51:06 -0700 (PDT)
Date: Wed, 21 May 2025 13:48:26 +0100
In-Reply-To: <20250521124834.1070650-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20250521124834.1070650-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.49.0.1112.g889b7c5bd8-goog
Message-ID: <20250521124834.1070650-3-vdonnefort@google.com>
Subject: [PATCH v6 02/10] KVM: arm64: Introduce for_each_hyp_page
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: qperret@google.com, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kernel-team@android.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_055108_644961_72D182ED 
X-CRM114-Status: GOOD (  15.18  )
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
index eb0c2ebd1743..dee1a406b0c2 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/memory.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/memory.h
@@ -96,24 +96,24 @@ static inline struct hyp_page *hyp_phys_to_page(phys_addr_t phys)
 #define hyp_page_to_virt(page)	__hyp_va(hyp_page_to_phys(page))
 #define hyp_page_to_pool(page)	(((struct hyp_page *)page)->pool)
 
-static inline enum pkvm_page_state get_host_state(phys_addr_t phys)
+static inline enum pkvm_page_state get_host_state(struct hyp_page *p)
 {
-	return (enum pkvm_page_state)hyp_phys_to_page(phys)->__host_state;
+	return p->__host_state;
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
index c18d4f691d2b..53bb029698c8 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -60,6 +60,11 @@ static void hyp_unlock_component(void)
 	hyp_spin_unlock(&pkvm_pgd_lock);
 }
 
+#define for_each_hyp_page(__p, __st, __sz)				\
+	for (struct hyp_page *__p = hyp_phys_to_page(__st),		\
+			     *__e = __p + ((__sz) >> PAGE_SHIFT);	\
+	     __p < __e; __p++)
+
 static void *host_s2_zalloc_pages_exact(size_t size)
 {
 	void *addr = hyp_alloc_pages(&host_s2_pool, get_order(size));
@@ -485,7 +490,8 @@ static int host_stage2_adjust_range(u64 addr, struct kvm_mem_range *range)
 		return -EAGAIN;
 
 	if (pte) {
-		WARN_ON(addr_is_memory(addr) && get_host_state(addr) != PKVM_NOPAGE);
+		WARN_ON(addr_is_memory(addr) &&
+			get_host_state(hyp_phys_to_page(addr)) != PKVM_NOPAGE);
 		return -EPERM;
 	}
 
@@ -511,10 +517,8 @@ int host_stage2_idmap_locked(phys_addr_t addr, u64 size,
 
 static void __host_update_page_state(phys_addr_t addr, u64 size, enum pkvm_page_state state)
 {
-	phys_addr_t end = addr + size;
-
-	for (; addr < end; addr += PAGE_SIZE)
-		set_host_state(addr, state);
+	for_each_hyp_page(page, addr, size)
+		set_host_state(page, state);
 }
 
 int host_stage2_set_owner_locked(phys_addr_t addr, u64 size, u8 owner_id)
@@ -636,16 +640,16 @@ static int check_page_state_range(struct kvm_pgtable *pgt, u64 addr, u64 size,
 static int __host_check_page_state_range(u64 addr, u64 size,
 					 enum pkvm_page_state state)
 {
-	u64 end = addr + size;
 	int ret;
 
-	ret = check_range_allowed_memory(addr, end);
+	ret = check_range_allowed_memory(addr, addr + size);
 	if (ret)
 		return ret;
 
 	hyp_assert_lock_held(&host_mmu.lock);
-	for (; addr < end; addr += PAGE_SIZE) {
-		if (get_host_state(addr) != state)
+
+	for_each_hyp_page(page, addr, size) {
+		if (get_host_state(page) != state)
 			return -EPERM;
 	}
 
@@ -655,7 +659,7 @@ static int __host_check_page_state_range(u64 addr, u64 size,
 static int __host_set_page_state_range(u64 addr, u64 size,
 				       enum pkvm_page_state state)
 {
-	if (get_host_state(addr) == PKVM_NOPAGE) {
+	if (get_host_state(hyp_phys_to_page(addr)) == PKVM_NOPAGE) {
 		int ret = host_stage2_idmap_locked(addr, size, PKVM_HOST_MEM_PROT);
 
 		if (ret)
@@ -669,18 +673,14 @@ static int __host_set_page_state_range(u64 addr, u64 size,
 
 static void __hyp_set_page_state_range(phys_addr_t phys, u64 size, enum pkvm_page_state state)
 {
-	phys_addr_t end = phys + size;
-
-	for (; phys < end; phys += PAGE_SIZE)
-		set_hyp_state(phys, state);
+	for_each_hyp_page(page, phys, size)
+		set_hyp_state(page, state);
 }
 
 static int __hyp_check_page_state_range(phys_addr_t phys, u64 size, enum pkvm_page_state state)
 {
-	phys_addr_t end = phys + size;
-
-	for (; phys < end; phys += PAGE_SIZE) {
-		if (get_hyp_state(phys) != state)
+	for_each_hyp_page(page, phys, size) {
+		if (get_hyp_state(page) != state)
 			return -EPERM;
 	}
 
@@ -931,7 +931,7 @@ int __pkvm_host_share_guest(u64 pfn, u64 gfn, struct pkvm_hyp_vcpu *vcpu,
 		goto unlock;
 
 	page = hyp_phys_to_page(phys);
-	switch (get_host_state(phys)) {
+	switch (get_host_state(page)) {
 	case PKVM_PAGE_OWNED:
 		WARN_ON(__host_set_page_state_range(phys, PAGE_SIZE, PKVM_PAGE_SHARED_OWNED));
 		break;
@@ -983,9 +983,9 @@ static int __check_host_shared_guest(struct pkvm_hyp_vm *vm, u64 *__phys, u64 ip
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
2.49.0.1112.g889b7c5bd8-goog


