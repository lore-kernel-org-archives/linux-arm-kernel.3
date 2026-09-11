Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BD74C88E45
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 15:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SFk2Z6Xi7d6Da3C0kQCSLnpvItVd8hZ6EBv2sHcLHBQ=; b=a7ndMZ+efDym+2DMz36RoefI46
	L/9/xCPjDM0+VYZe0v/n+ENUJY3xBpz57rZnOj+RsYHRNlbCrbS5Zs4rZGlNhHM3UMmuxkPIL8c13
	GvMtV5J7i1u7ftxCaG6yETOP6EXRK+GpubRGqq9UDHpjggOz2zdXMcebkdf554Er2y8/eDHUoJPKM
	XDBTyi2g0U1w94VLgICErPpk9OCV6CgRNHIA9ZgbXpbEZIZkvH9b1I+Qco7uMuPr8iCUZyJ+yU2R6
	mPl+iyk/8Wk7hZpdb/o1yCVX0jAziLeYGAaZ6kF4BL7Ec9yeV7uEef+xYVA3+ei2nz9lMNC+Rf+tA
	29ULSS5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x51et-0000000Gnsj-1HSM;
	Fri, 11 Sep 2026 13:51:15 +0000
Received: from mail-ed1-x546.google.com ([2a00:1450:4864:20::546])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x51en-0000000Gnmk-2ra3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 13:51:10 +0000
Received: by mail-ed1-x546.google.com with SMTP id 4fb4d7f45d1cf-6a9a69637eeso1253731a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 06:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789134666; x=1789739466; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SFk2Z6Xi7d6Da3C0kQCSLnpvItVd8hZ6EBv2sHcLHBQ=;
        b=NZ6ogbvdMqDdoVsVaLm3Ar4UVtVbm11K4ycWnyMnXC5N6gvJR9Us6fIRANYCZrwDZ/
         6rNBRzm1+85rvXG8t8FednbsBRWGF+4tWmv5plq8uzzxREWYAkDDFUbDZA0TOKNGqpKK
         xR158FnKqL8L2o20cvoxoiC0x0+klAw2rdnybIEE8eiTMMtaXo+YwNggBOYUt7mQdtkS
         jhvmhrCw9Znv06R66LBOKfageEBauhKlfe4p+dc+CvSwZ6hvQujfrn82bkXiHNwqFJmI
         sjpf8zJjBKlgprhgg0SCs3EOamd72bCwbUp10j7D8NLj0ZailcY8GP2ZOYVqf6UVMpL4
         AvfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789134666; x=1789739466;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SFk2Z6Xi7d6Da3C0kQCSLnpvItVd8hZ6EBv2sHcLHBQ=;
        b=m+kcPfZNNvWmIK204UlAW1Xggb3uJlsREjwbzXj/gaLOye/1SM1FNL+81tIX3C7Nb2
         dRgdBaEu9sw8GPS1vnuw/BF7bJrGf2q1oxPgy86zZYoI318VWYmmmJOJls3JJ4fa4yTI
         CKA3Mo7DvuEVtSScugF0WRjsunSIuYBp1ymwlEG/cUlESJWPfz+jvpll1P6dn/HLDwwv
         V6hnaoBsixzhTFNg6Em9YunUEfK8lcVXKNudR8eeFf5rOLRkc0nM/a24VrAwwf7TyOIA
         VaIesm+i+HX4+9fKpm/dLE42tcA7AsOzuQLCYA3VuODlk4USsjAc8848E/vI5LHKRxwv
         QKdw==
X-Forwarded-Encrypted: i=1; AKwUvBy/mkEq89VUyYcgfI5GG4YtB3mE3o0feS6uF6rpZlnLeY9ER/3GNqm2vCsqEABVupZ6cbW/X7EA5I60tYU/wArT@lists.infradead.org
X-Gm-Message-State: AFuF++nDSiphYtlPr99NtQOtF5gpeExGm/dLKhnZXICJQywqmuexDSXW
	46hU0SBo6YioG43ROb+886FYiXZ625pm7ildeF1KlZ/u6NXtlMMYLkHmK/ZgY6YvPClyJEefmPO
	1fK3PEADwbO/cQvQOdjxLRA==
X-Received: from edbdd4.prod.google.com ([2002:a05:6402:3124:b0:6a6:62f4:91a4])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:2546:b0:6a6:37a3:2b0f with SMTP id 4fb4d7f45d1cf-6a9b5606356mr1900256a12.8.1789134665990;
 Fri, 11 Sep 2026 06:51:05 -0700 (PDT)
Date: Fri, 11 Sep 2026 14:50:35 +0100
In-Reply-To: <20260911135053.146435-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260911135053.146435-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.1007.g17ff1f9808-goog
Message-ID: <20260911135053.146435-5-vdonnefort@google.com>
Subject: [PATCH v2 04/22] KVM: arm64: Use block-level annotations when setting
 up the host stage-2
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, 
	weilin.chang@arm.com, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_065109_787933_60A6120A 
X-CRM114-Status: GOOD (  20.86  )
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

During pKVM initialisation, fix_host_ownership() configures the host
stage-2 mappings to match the hypervisor stage-1. Previously this was
done page-by-page. Now that the host stage-2 supports block-level
annotations, refactor the walker to apply the ownership state to an
entire range at once.

This reduces host stage-2 page-table fragmentation and memory usage by
avoiding allocation of intermediate page-table pages.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/kvm/hyp/include/nvhe/memory.h |   5 +
 arch/arm64/kvm/hyp/nvhe/mem_protect.c    |   5 -
 arch/arm64/kvm/hyp/nvhe/setup.c          | 132 ++++++++++++++---------
 3 files changed, 89 insertions(+), 53 deletions(-)

diff --git a/arch/arm64/kvm/hyp/include/nvhe/memory.h b/arch/arm64/kvm/hyp/include/nvhe/memory.h
index b50712d47f6d..86a51cf1d590 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/memory.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/memory.h
@@ -122,6 +122,11 @@ static inline void set_hyp_state(struct hyp_page *p, enum pkvm_page_state state)
 	p->__hyp_state_comp = state ^ PKVM_PAGE_STATE_VMEMMAP_MASK;
 }
 
+#define for_each_hyp_page(__p, __st, __sz)				\
+	for (struct hyp_page *__p = hyp_phys_to_page(__st),		\
+			     *__e = __p + ((__sz) >> PAGE_SHIFT);	\
+	     __p < __e; __p++)
+
 /*
  * Refcounting for 'struct hyp_page'.
  * hyp_pool::lock must be held if atomic access to the refcount is required.
diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 39aa8911f62c..c3676243fddc 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -76,11 +76,6 @@ static void hyp_unlock_component(void)
 	hyp_spin_unlock(&pkvm_pgd_lock);
 }
 
-#define for_each_hyp_page(__p, __st, __sz)				\
-	for (struct hyp_page *__p = hyp_phys_to_page(__st),		\
-			     *__e = __p + ((__sz) >> PAGE_SHIFT);	\
-	     __p < __e; __p++)
-
 static void *host_s2_zalloc_pages_exact(size_t size)
 {
 	void *addr = hyp_alloc_pages(&host_s2_pool, get_order(size));
diff --git a/arch/arm64/kvm/hyp/nvhe/setup.c b/arch/arm64/kvm/hyp/nvhe/setup.c
index 75b00c323310..22200bb50990 100644
--- a/arch/arm64/kvm/hyp/nvhe/setup.c
+++ b/arch/arm64/kvm/hyp/nvhe/setup.c
@@ -186,50 +186,46 @@ static void hpool_put_page(void *addr)
 	hyp_put_page(&hpool, addr);
 }
 
-static int fix_host_ownership_walker(const struct kvm_pgtable_visit_ctx *ctx,
-				     enum kvm_pgtable_walk_flags visit)
+struct fix_host_ownership_data {
+	phys_addr_t		phys;
+	size_t			size;
+	enum kvm_pgtable_prot	prot;
+};
+
+static int __fix_host_ownership(const struct fix_host_ownership_data *data)
 {
-	enum pkvm_page_state state;
-	struct hyp_page *page;
-	phys_addr_t phys;
-	enum kvm_pgtable_prot prot;
+	enum pkvm_page_state state = pkvm_getstate(data->prot);
 
-	if (!kvm_pte_valid(ctx->old))
+	if (!data->prot)
 		return 0;
 
-	if (ctx->level != KVM_PGTABLE_LAST_LEVEL)
-		return -EINVAL;
-
-	phys = kvm_pte_to_phys(ctx->old);
-	if (!addr_is_memory(phys))
-		return -EINVAL;
-
-	page = hyp_phys_to_page(phys);
-
 	/*
 	 * Adjust the host stage-2 mappings to match the ownership attributes
 	 * configured in the hypervisor stage-1, and make sure to propagate them
 	 * to the hyp_vmemmap state.
 	 */
-	prot = kvm_pgtable_hyp_pte_prot(ctx->old);
-	state = pkvm_getstate(prot);
 	switch (state) {
 	case PKVM_PAGE_OWNED:
-		set_hyp_state(page, PKVM_PAGE_OWNED);
-		/* hyp text is RO in the host stage-2 to be inspected on panic. */
-		if (prot == PAGE_HYP_EXEC) {
+		for_each_hyp_page(page, data->phys, data->size) {
+			set_hyp_state(page, PKVM_PAGE_OWNED);
 			set_host_state(page, PKVM_NOPAGE);
-			return host_stage2_idmap_locked(phys, PAGE_SIZE, KVM_PGTABLE_PROT_R);
-		} else {
-			return host_stage2_set_owner_locked(phys, PAGE_SIZE, PKVM_ID_HYP);
 		}
+		/* hyp text is RO in the host stage-2 to be inspected on panic. */
+		if (data->prot == PAGE_HYP_EXEC)
+			return host_stage2_idmap_locked(data->phys, data->size, KVM_PGTABLE_PROT_R);
+		else
+			return host_stage2_set_owner_locked(data->phys, data->size, PKVM_ID_HYP);
 	case PKVM_PAGE_SHARED_OWNED:
-		set_hyp_state(page, PKVM_PAGE_SHARED_OWNED);
-		set_host_state(page, PKVM_PAGE_SHARED_BORROWED);
+		for_each_hyp_page(page, data->phys, data->size) {
+			set_hyp_state(page, PKVM_PAGE_SHARED_OWNED);
+			set_host_state(page, PKVM_PAGE_SHARED_BORROWED);
+		}
 		break;
 	case PKVM_PAGE_SHARED_BORROWED:
-		set_hyp_state(page, PKVM_PAGE_SHARED_BORROWED);
-		set_host_state(page, PKVM_PAGE_SHARED_OWNED);
+		for_each_hyp_page(page, data->phys, data->size) {
+			set_hyp_state(page, PKVM_PAGE_SHARED_BORROWED);
+			set_host_state(page, PKVM_PAGE_SHARED_OWNED);
+		}
 		break;
 	default:
 		return -EINVAL;
@@ -238,6 +234,66 @@ static int fix_host_ownership_walker(const struct kvm_pgtable_visit_ctx *ctx,
 	return 0;
 }
 
+static int fix_host_ownership_walker(const struct kvm_pgtable_visit_ctx *ctx,
+				     enum kvm_pgtable_walk_flags visit)
+{
+	struct fix_host_ownership_data *data = ctx->arg;
+	enum kvm_pgtable_prot prot = 0;
+	phys_addr_t phys = 0;
+	int ret;
+
+	if (kvm_pte_valid(ctx->old)) {
+		prot = kvm_pgtable_hyp_pte_prot(ctx->old);
+		phys = kvm_pte_to_phys(ctx->old);
+		if (!addr_is_memory(phys))
+			return -EINVAL;
+	}
+
+	if (prot == data->prot &&
+	    phys == data->phys + data->size) {
+		data->size += kvm_granule_size(ctx->level);
+
+		return 0;
+	}
+
+	ret = __fix_host_ownership(data);
+	if (ret)
+		return ret;
+
+	data->phys = phys;
+	data->size = kvm_granule_size(ctx->level);
+	data->prot = prot;
+
+	return 0;
+}
+
+static int fix_host_ownership(void)
+{
+	struct fix_host_ownership_data data;
+	struct kvm_pgtable_walker walker = {
+		.cb	= fix_host_ownership_walker,
+		.flags	= KVM_PGTABLE_WALK_LEAF,
+		.arg	= &data,
+	};
+	int i, ret;
+
+	for (i = 0; i < hyp_memblock_nr; i++) {
+		struct memblock_region *reg = &hyp_memory[i];
+		u64 start = (u64)hyp_phys_to_virt(reg->base);
+
+		data = (struct fix_host_ownership_data){ 0 };
+		ret = kvm_pgtable_walk(&pkvm_pgtable, start, reg->size, &walker);
+		if (ret)
+			return ret;
+
+		ret = __fix_host_ownership(&data);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 static int fix_hyp_pgtable_refcnt_walker(const struct kvm_pgtable_visit_ctx *ctx,
 					 enum kvm_pgtable_walk_flags visit)
 {
@@ -252,26 +308,6 @@ static int fix_hyp_pgtable_refcnt_walker(const struct kvm_pgtable_visit_ctx *ctx
 	return 0;
 }
 
-static int fix_host_ownership(void)
-{
-	struct kvm_pgtable_walker walker = {
-		.cb	= fix_host_ownership_walker,
-		.flags	= KVM_PGTABLE_WALK_LEAF,
-	};
-	int i, ret;
-
-	for (i = 0; i < hyp_memblock_nr; i++) {
-		struct memblock_region *reg = &hyp_memory[i];
-		u64 start = (u64)hyp_phys_to_virt(reg->base);
-
-		ret = kvm_pgtable_walk(&pkvm_pgtable, start, reg->size, &walker);
-		if (ret)
-			return ret;
-	}
-
-	return 0;
-}
-
 static int fix_hyp_pgtable_refcnt(void)
 {
 	struct kvm_pgtable_walker walker = {
-- 
2.55.0.1007.g17ff1f9808-goog


