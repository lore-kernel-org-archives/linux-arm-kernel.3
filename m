Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE5E4606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 20:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jgs3wFky;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=MeLepSh2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=MZQux3Jpn+/KtJ7ZhOVOZlF+zjF+/1BvGRCOtT2ZllI=; b=jgs3wFkyAvlHtvmIHsc+r4/JLz
	2SyZwB/yNJYBxzz3b5bYQqFhJYNGP5iTcf7Dw42bcFgbqqMghWFwhTyIUPkE19f0LlCV4kAFHdASN
	kKLv8jezrwJDWK3OwYeP0P2kmQix7Q1faR9MKopUz5FZesySdczVAHo/rePlHxZHCSNlYG6TbXIwe
	8QiZZ8P7keb/ydXGUeOidYS5hivjPYS/Orrcih9SRQYlyo/Vu/8EbqlnKL8zYRMgp/0n0h6mMiFTx
	AMQ0ymVKHpd/on7wTBCbDteyavBXn+ROAtnWcgVDTbI3Wf4cEkoDciXBRH2oNdcQK2dc0OahWMkYT
	LOS4BQUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNyvt-00000000Nc2-3RlP;
	Mon, 02 Nov 2026 20:47:09 +0000
Received: from mail-wr1-x447.google.com ([2a00:1450:4864:20::447])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNyvr-00000000NXo-2wHt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 20:47:08 +0000
Received: by mail-wr1-x447.google.com with SMTP id ffacd0b85a97d-48e0af48c18so2553187f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 12:47:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793652425; x=1794257225; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MZQux3Jpn+/KtJ7ZhOVOZlF+zjF+/1BvGRCOtT2ZllI=;
        b=MeLepSh2KQocuIDiOT98710lI0K3jbSJTegQMPFB9AJJ53WwMAoe1exPIehzt4FLgE
         9dA6dExqV6gh9opabyCnRX/eua8tDBugGU2ddgy1Q9/iK0ZzhLNUe8BPfAcBOuQga3Nk
         7vpiNi4W1C/IDgbusSEKVlq/garOjdLQ4z1Uugu9PeD5RPiLKbatBkV6BfxgYnr+oNyN
         +YLIy7OOPzfAFcebpqFPbV854z0J1e4tBZD5Mjw20xTtWk91GyIcgJxOjvFLVd09okA4
         QIhXHk+XKoHvVISH2yprSkTz7Dd5Z2S4S6+j7gRMjENdlAa0h+/RMo3pi1PO8FNFy4Up
         Qe4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793652425; x=1794257225;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MZQux3Jpn+/KtJ7ZhOVOZlF+zjF+/1BvGRCOtT2ZllI=;
        b=dDiU1YKcgiI+KqpN9okCRXb0M+66I/pu/WauWaG39cKAXA2GwqS4GbpOGI27/es/DL
         wyOHgKWzIE6HvWtIu+gNj5zFx3tfC4a4Qqvg729jq4RjkdfkhrE5pUSmWVDpisxDSM8C
         19DSa9NkpSpC9B2XJXGYAKuY2cJH8ElD4JjKObnZ0aUXiNYrPpK36WRYblXiBf3G4UcG
         TJ8Ai1Fkfk2suJ6IJHJCCdjRBCqMFn0mFXNepTQHZwjJj14DXAH0/OtIc2fekuYl72/Y
         oBGVIzPXiRqUz4Ki5yIhwpn7Jae2jmn9lV7/+sBU5UqhV1wkgCiCO7NuO7CHyP2O10el
         jrzQ==
X-Forwarded-Encrypted: i=1; AKwUvByGJmY27QulqEOSXSnoaNNdpDBe29G+uspyujRMNdcSxvvKNI5PQ9OgVdYQfOa2h3nr3QMp/r4dPBlyGdCWxMIa@lists.infradead.org
X-Gm-Message-State: AFq9FYJhSaWg6uwHketLGrixia8xmXHYmrYvTh6qOQ0KI5uCuHb629Ci
	WWEJHujwy2tbC01urG9dN8gXiGljGcjW55KKdHDntjN5YCXZ8XxOXZZrivcBukJFYZKljDTGUlx
	ntJTJGbIRPDoMAMI9ek0caw==
X-Received: from wmbel6.prod.google.com ([2002:a05:600c:3e06:b0:4a1:7fbd:344d])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:6095:b0:4a3:7344:13b5 with SMTP id 5b1f17b1804b1-4ac182dcb98mr226181805e9.16.1793652425494;
 Mon, 02 Nov 2026 12:47:05 -0800 (PST)
Date: Mon,  2 Nov 2026 20:46:09 +0000
In-Reply-To: <20261102204628.401871-1-vdonnefort@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261102204628.401871-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261102204628.401871-5-vdonnefort@google.com>
Subject: [PATCH v3 04/23] KVM: arm64: Use block-level annotations when setting
 up the host stage-2
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_124707_780891_D318CB43 
X-CRM114-Status: GOOD (  21.61  )
X-Spam-Score: -9.5 (---------)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-26.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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
 arch/arm64/kvm/hyp/nvhe/setup.c          | 157 ++++++++++++++---------
 3 files changed, 104 insertions(+), 63 deletions(-)

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
index d4c332a91803..58094d52b8a2 100644
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
index 7bbc26b28faa..e72b7626799d 100644
--- a/arch/arm64/kvm/hyp/nvhe/setup.c
+++ b/arch/arm64/kvm/hyp/nvhe/setup.c
@@ -187,50 +187,46 @@ static void hpool_put_page(void *addr)
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
-		if (addr_is_hyp_text(phys)) {
+		for_each_hyp_page(page, data->phys, data->size) {
+			set_hyp_state(page, PKVM_PAGE_OWNED);
 			set_host_state(page, PKVM_NOPAGE);
-			return host_stage2_idmap_locked(phys, PAGE_SIZE, KVM_PGTABLE_PROT_R);
-		} else {
-			return host_stage2_set_owner_locked(phys, PAGE_SIZE, PKVM_ID_HYP);
 		}
+		/* hyp text is RO in the host stage-2 to be inspected on panic. */
+		if (addr_is_hyp_text(data->phys))
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
@@ -239,6 +235,81 @@ static int fix_host_ownership_walker(const struct kvm_pgtable_visit_ctx *ctx,
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
+	/* The stacks sit in the private VA range, not the linear map. */
+	for (i = 0; i < hyp_nr_cpus; i++) {
+		struct kvm_nvhe_init_params *params = per_cpu_ptr(&kvm_init_params, i);
+		u64 start = params->stack_hyp_va - NVHE_STACK_SIZE;
+
+		data = (struct fix_host_ownership_data){ 0 };
+		ret = kvm_pgtable_walk(&pkvm_pgtable, start, NVHE_STACK_SIZE, &walker);
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
@@ -253,36 +324,6 @@ static int fix_hyp_pgtable_refcnt_walker(const struct kvm_pgtable_visit_ctx *ctx
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
-	/* The stacks sit in the private VA range, not the linear map. */
-	for (i = 0; i < hyp_nr_cpus; i++) {
-		struct kvm_nvhe_init_params *params = per_cpu_ptr(&kvm_init_params, i);
-		u64 start = params->stack_hyp_va - NVHE_STACK_SIZE;
-
-		ret = kvm_pgtable_walk(&pkvm_pgtable, start, NVHE_STACK_SIZE, &walker);
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
2.56.0.385.gac671c819a-goog


