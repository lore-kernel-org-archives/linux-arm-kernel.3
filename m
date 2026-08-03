Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7993BC55197
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 10:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jyZrV6w6YlGm0UnNpjoMeXqhY0E3ZYZeB6iMOvPDyME=; b=VJPshLA3EdN+1LQ4LBwRwdEcWF
	VpDnxr1r97TmVqdPSOP21If6Lw5ZulhIl4aCqT6aN2c23eCbPpesU+1BBa5wepFB00YfWEZ0SXUfE
	R5T4tWCzKr7cQyFECU9yzynYQkkSsAmh878PaculWlamid68t2vG6YjH1TYnwF3U/ZdD+OFLRiXKT
	GHmdusvGm7l99EjaAp6WYnbao1veVwDvVPzCx4HPRT2+lGPW7FxC/D3UVHLZECZxbRrZu1aOEIQeF
	P9bO5vhgDlEETrvp6dVzqZyTBqdhf6mczzBZ/aQDp8cYb337ppZvOWmCVi+RTUv7lFjyI/6VpQXdl
	xy0S6dSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqpdP-0000000Gmrv-1iuo;
	Mon, 03 Aug 2026 10:11:03 +0000
Received: from mail-wm1-x345.google.com ([2a00:1450:4864:20::345])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqpdM-0000000Gmno-3Jf3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 10:11:02 +0000
Received: by mail-wm1-x345.google.com with SMTP id 5b1f17b1804b1-4955fd77c18so11872655e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 03:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785751858; x=1786356658; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jyZrV6w6YlGm0UnNpjoMeXqhY0E3ZYZeB6iMOvPDyME=;
        b=H4r2p2rJpclxIa4f4F76cSRVLro2ZefVJTLe1d2DUUXkhIKlwDTwBducle9LjcIGyx
         7fKfWL8d9LS6+VkXri9M2FygJzsLDfyXbxQisUWSOtBw4X3q2SLMDDr3a9VbsL9Rh74E
         tuQaLRQSzVccIIpYPmah0k72DV62GOLdWHPCv4UA77pABFydJeheoXvyN/+FGl4ewiVK
         t6p5R0M2YowuhoWeehD0mSp8aANXxutcvoYlskkxBtb5nuoBiUQUT+mKUu63ZoHwCfcA
         D7tNQs1rh1EkWGuFoVbKnCY28kBg/0f6g5av/n3HxOBlSc2wzgjdg/mOthEOgkZcg323
         nj3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785751858; x=1786356658;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jyZrV6w6YlGm0UnNpjoMeXqhY0E3ZYZeB6iMOvPDyME=;
        b=NmB8XVsDKTaJwXrikukoRAG/YWWAYKAuXBzIWHy9WrbU/YfoIU1QcC2k3BoowNM8i6
         lwI0NJi7gKRKCDtyjogJSmI3ULu8tzRP8TMvq9qM8fq3b4kGxZ2oHNokktBL/nw9po0H
         /EGRKkym1Xxe1wIsaXSdvCI1EVlH5ZH5j2R4m6COKVfG/KYiOdoWbXs5jRhKz25QjotE
         gyXMe4vwawqtnlOznNHUCD5NFPwCnSrnxaWHBFMurX2GNwfOb1oEdtsZNJRbjrIrR6fi
         jlD+QV4uxeV90CsFBNTtMB5h+oopxowlYmDQtmbVgMKuBls9TuqIPhXgfBW1CnF5yw8H
         4Y1A==
X-Forwarded-Encrypted: i=1; AHgh+Rqm+f6Mw/OcB8rn8dVGPGjmObTrio2C4Uxmzr/i7L2d39wSzrZNou5cGGsNGci6BIWnvYJv5CXY+RBhiJe25+rM@lists.infradead.org
X-Gm-Message-State: AOJu0YyvRaX5vAo3Qm5neXGwsvToFrv0FFsXvwzqnW+T2aTunn94lRBk
	cdeZ9VdVhmOvwbTKU7iIwmrJXLfZ/LjjG+Lv2YO1R9yvPKAlAtn36yfXG/o6/FDKa1S8uBlkk/N
	mtWDGdaicZBbehY+UUlW5dQ==
X-Received: from wmlf13.prod.google.com ([2002:a7b:c8cd:0:b0:495:7a24:18e3])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4f4a:b0:495:6478:2dbc with SMTP id 5b1f17b1804b1-4980eea02e5mr194543065e9.6.1785751857674;
 Mon, 03 Aug 2026 03:10:57 -0700 (PDT)
Date: Mon,  3 Aug 2026 11:08:48 +0100
In-Reply-To: <20260803100904.3563942-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260803100904.3563942-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.508.g3f0d502094-goog
Message-ID: <20260803100904.3563942-5-vdonnefort@google.com>
Subject: [PATCH 04/20] KVM: arm64: Use block-level annotations when setting up
 the host stage-2
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, 
	keirf@google.com, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_031101_086180_F8109482 
X-CRM114-Status: GOOD (  20.66  )
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
index 4e329e39a695..3c3e0c3d66d1 100644
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
index 75b00c323310..d7beb2ccf1e1 100644
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
@@ -238,6 +234,78 @@ static int fix_host_ownership_walker(const struct kvm_pgtable_visit_ctx *ctx,
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
+	if (kvm_pte_valid(ctx->old))
+		prot = kvm_pgtable_hyp_pte_prot(ctx->old);
+
+	if (!prot) {
+		/* Unchanged region */
+		if (!data->prot)
+			return 0;
+
+		goto apply_ownership;
+	}
+
+	phys = kvm_pte_to_phys(ctx->old);
+	if (!addr_is_memory(phys))
+		return -EINVAL;
+
+	/* We already know phys is contiguous as we walk the linear map */
+
+	if (prot != data->prot)
+		goto apply_ownership;
+
+	/* Accumulate in the current region */
+	data->size += kvm_granule_size(ctx->level);
+
+	return 0;
+
+apply_ownership:
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
@@ -252,26 +320,6 @@ static int fix_hyp_pgtable_refcnt_walker(const struct kvm_pgtable_visit_ctx *ctx
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
2.55.0.508.g3f0d502094-goog


