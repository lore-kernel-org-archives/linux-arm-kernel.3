Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B014C369BA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 16:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+H4roSy0ETO2xvleEvsVdzxRkBxmddA29rKMSpiaoY8=; b=njBsWFRV5WagmJ9snjgLxrhmgQ
	DxF0qUq1Tty9npgWbIBcEiD55R32UaVTokAwI6iKGMhB6IAqcvVNzWdO+f1sIia6o2spkBWLpF91E
	LMoPrG4nJlprlgEtX2Al2VaYAIJCaP+YLON56+bY31Hort37sb5tnrKW5bz805MxDMQPTOxSvZ/q8
	LANj3IFAYreLt8yRKnZIhc/enkVys44HfvYaLVn1uI74AkXpVyw9jHuLMcqnZWz+bhoY1Tb6eawY9
	f2yhICqRx2ZrG+boa4IuaQV2JcTwjakabkb/jba6DJYf2X1MCJ5+5xv5c0Hg6Rc9KAiWVbP3JxOIm
	BtKERZ/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u55Sl-0000000ADXW-26nU;
	Wed, 16 Apr 2025 16:18:11 +0000
Received: from mail-ed1-x54a.google.com ([2a00:1450:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u54fI-0000000A4U5-1AOk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 15:27:05 +0000
Received: by mail-ed1-x54a.google.com with SMTP id 4fb4d7f45d1cf-5e6b2b8339fso7113541a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Apr 2025 08:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744817222; x=1745422022; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+H4roSy0ETO2xvleEvsVdzxRkBxmddA29rKMSpiaoY8=;
        b=JsgMWLCSMDWJ0ZDYGZj7SMubUs4tXG0FndT288sMD0aTIGM4KVqTPDprAFaGeNTa8B
         aiT4oCefkJ8yi8h1xB3MxJQRQLmNB7pnPfLZNHqD1fl+3MC/AMw1SH7jnU+nDpreqkXk
         L2Ga7EnA11vz2rD0iOFFqTGId0QbS/SbI74NAFZAC/iWE935m3xAHR+NwCBNEo4ifj5J
         Npl/2MMpIPSy9rVFcFaVpb5XBrW24erA49jqrBajaf1q0V0omj62Fis6MMvMSe31KK7B
         lxQnjyG6mxv/Mb4d1NvRf3oEoRUqYyBuijFtvM067hXsq8D3XKcRhuYcRevosR7k20VS
         x97g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744817222; x=1745422022;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+H4roSy0ETO2xvleEvsVdzxRkBxmddA29rKMSpiaoY8=;
        b=joH5+tO2eCQlGK1dPm/q7/xbuP0M9ZSM3z3BgU1cxkNmFUw9XVZgClRYnlLR3sWxiO
         cY4631mr3qW/+/nO/ZUuECfpc8n3HsA4T/itDxanyy5nBiIJo8QEjzXXf5u8BDQse6EN
         hnQcywWIuRGib//YA41whVl1WB+4AALmBblN1M8yX1LWCqszWrlKRVPL0kcfuJWyv1du
         vMtROGUSr4cDYeRqLc+NN5Jtf8SwclHhKwknj/wvvHnXpdJryvcrYZBevIUUto6zloEM
         NJDcq+RLhR7OKg4j51EmxjgN9aAUodvh3IZHTp5yP0BzLyMerXAV5PzWlT40uZhUdqMd
         KSig==
X-Forwarded-Encrypted: i=1; AJvYcCWZpSE4WcLpQWtbZxqWQhmditERUJKdkSyxpThBLRigY18MAg76WKSDnVGBt/ULmj9SU5j1T9dmg18EN8ky9aBA@lists.infradead.org
X-Gm-Message-State: AOJu0YwcK/oE9VPFvEi9Zie7SSb7BFQv76tWQa6L9qJITdx8Rk9rjfh5
	2G26Q2xE2JRNcOJxXe2rNskR5nzDxHMFa3CyGgsnzV9FkgnJatj9Z5M58O8UD554SnkW6f1ycJc
	SJmdkSg==
X-Google-Smtp-Source: AGHT+IE3AJ5+KNd/wrKE6Yh8WQPTsdymaFnGvYhcC6y9WjjslUVSUYFVwO0K57lR6F2n9q3uVegAXV72ChYn
X-Received: from ediq14.prod.google.com ([2002:a50:cc8e:0:b0:5e5:cbc8:77b7])
 (user=qperret job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:3486:b0:5e8:c092:7a6
 with SMTP id 4fb4d7f45d1cf-5f4b75d848cmr2056666a12.21.1744817222246; Wed, 16
 Apr 2025 08:27:02 -0700 (PDT)
Date: Wed, 16 Apr 2025 15:26:45 +0000
In-Reply-To: <20250416152648.2982950-1-qperret@google.com>
Mime-Version: 1.0
References: <20250416152648.2982950-1-qperret@google.com>
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
Message-ID: <20250416152648.2982950-6-qperret@google.com>
Subject: [PATCH v2 5/7] KVM: arm64: Move hyp state to hyp_vmemmap
From: Quentin Perret <qperret@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>
Cc: Vincent Donnefort <vdonnefort@google.com>, Fuad Tabba <tabba@google.com>, 
	Quentin Perret <qperret@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_082704_320473_7829B720 
X-CRM114-Status: GOOD (  21.48  )
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

Tracking the hypervisor's ownership state into struct hyp_page has
several benefits, including allowing far more efficient lookups (no
page-table walk needed) and de-corelating the state from the presence
of a mapping. This will later allow to map pages into EL2 stage-1 less
proactively which is generally a good thing for security. And in the
future this will help with tracking the state of pages mapped into the
hypervisor's private range without requiring an alias into the 'linear
map' range.

Reviewed-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Quentin Perret <qperret@google.com>
---
 arch/arm64/kvm/hyp/include/nvhe/memory.h | 29 +++++++++++---
 arch/arm64/kvm/hyp/nvhe/mem_protect.c    | 51 ++++++++++++------------
 arch/arm64/kvm/hyp/nvhe/setup.c          |  6 ++-
 3 files changed, 53 insertions(+), 33 deletions(-)

diff --git a/arch/arm64/kvm/hyp/include/nvhe/memory.h b/arch/arm64/kvm/hyp/include/nvhe/memory.h
index a1754aecf8f8..eb0c2ebd1743 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/memory.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/memory.h
@@ -16,8 +16,7 @@
  *       accessible by another component;
  *   10: The page is accessible but not owned by the component;
  * The storage of this state depends on the component: either in the
- * hyp_vmemmap for the host state or in PTE software bits for the hypervisor
- * and guests.
+ * hyp_vmemmap for the host and hyp states or in PTE software bits for guests.
  */
 enum pkvm_page_state {
 	PKVM_PAGE_OWNED			= 0ULL,
@@ -25,13 +24,14 @@ enum pkvm_page_state {
 	PKVM_PAGE_SHARED_BORROWED	= BIT(1),
 
 	/*
-	 * 'Meta-states' are not stored directly in PTE SW bits for hyp and
-	 * guest states, but inferred from the context (e.g. invalid PTE
-	 * entries). For the host, meta-states are stored directly in the
+	 * 'Meta-states' are not stored directly in PTE SW bits for guest
+	 * states, but inferred from the context (e.g. invalid PTE entries).
+	 * For the host and hyp, meta-states are stored directly in the
 	 * struct hyp_page.
 	 */
 	PKVM_NOPAGE			= BIT(0) | BIT(1),
 };
+#define PKVM_PAGE_STATE_MASK		(BIT(0) | BIT(1))
 
 #define PKVM_PAGE_STATE_PROT_MASK	(KVM_PGTABLE_PROT_SW0 | KVM_PGTABLE_PROT_SW1)
 static inline enum kvm_pgtable_prot pkvm_mkstate(enum kvm_pgtable_prot prot,
@@ -52,7 +52,14 @@ struct hyp_page {
 	u8 order;
 
 	/* Host state. Guarded by the host stage-2 lock. */
-	unsigned __host_state : 8;
+	unsigned __host_state : 4;
+
+	/*
+	 * Complement of the hyp state. Guarded by the hyp stage-1 lock. We use
+	 * the complement so that the initial 0 in __hyp_state_comp (due to the
+	 * entire vmemmap starting off zeroed) encodes PKVM_NOPAGE.
+	 */
+	unsigned __hyp_state_comp : 4;
 
 	u32 host_share_guest_count;
 };
@@ -99,6 +106,16 @@ static inline void set_host_state(phys_addr_t phys, enum pkvm_page_state state)
 	hyp_phys_to_page(phys)->__host_state = state;
 }
 
+static inline enum pkvm_page_state get_hyp_state(phys_addr_t phys)
+{
+	return hyp_phys_to_page(phys)->__hyp_state_comp ^ PKVM_PAGE_STATE_MASK;
+}
+
+static inline void set_hyp_state(phys_addr_t phys, enum pkvm_page_state state)
+{
+	hyp_phys_to_page(phys)->__hyp_state_comp = state ^ PKVM_PAGE_STATE_MASK;
+}
+
 /*
  * Refcounting for 'struct hyp_page'.
  * hyp_pool::lock must be held if atomic access to the refcount is required.
diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index e9060e6205cb..25ff84c053c1 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -649,24 +649,24 @@ static int __host_set_page_state_range(u64 addr, u64 size,
 	return 0;
 }
 
-static enum pkvm_page_state hyp_get_page_state(kvm_pte_t pte, u64 addr)
+static void __hyp_set_page_state_range(phys_addr_t phys, u64 size, enum pkvm_page_state state)
 {
-	if (!kvm_pte_valid(pte))
-		return PKVM_NOPAGE;
+	phys_addr_t end = phys + size;
 
-	return pkvm_getstate(kvm_pgtable_hyp_pte_prot(pte));
+	for (; phys < end; phys += PAGE_SIZE)
+		set_hyp_state(phys, state);
 }
 
-static int __hyp_check_page_state_range(u64 addr, u64 size,
-					enum pkvm_page_state state)
+static int __hyp_check_page_state_range(phys_addr_t phys, u64 size, enum pkvm_page_state state)
 {
-	struct check_walk_data d = {
-		.desired	= state,
-		.get_page_state	= hyp_get_page_state,
-	};
+	phys_addr_t end = phys + size;
+
+	for (; phys < end; phys += PAGE_SIZE) {
+		if (get_hyp_state(phys) != state)
+			return -EPERM;
+	}
 
-	hyp_assert_lock_held(&pkvm_pgd_lock);
-	return check_page_state_range(&pkvm_pgtable, addr, size, &d);
+	return 0;
 }
 
 static enum pkvm_page_state guest_get_page_state(kvm_pte_t pte, u64 addr)
@@ -694,7 +694,6 @@ int __pkvm_host_share_hyp(u64 pfn)
 {
 	u64 phys = hyp_pfn_to_phys(pfn);
 	void *virt = __hyp_va(phys);
-	enum kvm_pgtable_prot prot;
 	u64 size = PAGE_SIZE;
 	int ret;
 
@@ -705,13 +704,13 @@ int __pkvm_host_share_hyp(u64 pfn)
 	if (ret)
 		goto unlock;
 	if (IS_ENABLED(CONFIG_NVHE_EL2_DEBUG)) {
-		ret = __hyp_check_page_state_range((u64)virt, size, PKVM_NOPAGE);
+		ret = __hyp_check_page_state_range(phys, size, PKVM_NOPAGE);
 		if (ret)
 			goto unlock;
 	}
 
-	prot = pkvm_mkstate(PAGE_HYP, PKVM_PAGE_SHARED_BORROWED);
-	WARN_ON(pkvm_create_mappings_locked(virt, virt + size, prot));
+	__hyp_set_page_state_range(phys, size, PKVM_PAGE_SHARED_BORROWED);
+	WARN_ON(pkvm_create_mappings_locked(virt, virt + size, PAGE_HYP));
 	WARN_ON(__host_set_page_state_range(phys, size, PKVM_PAGE_SHARED_OWNED));
 
 unlock:
@@ -734,7 +733,7 @@ int __pkvm_host_unshare_hyp(u64 pfn)
 	ret = __host_check_page_state_range(phys, size, PKVM_PAGE_SHARED_OWNED);
 	if (ret)
 		goto unlock;
-	ret = __hyp_check_page_state_range(virt, size, PKVM_PAGE_SHARED_BORROWED);
+	ret = __hyp_check_page_state_range(phys, size, PKVM_PAGE_SHARED_BORROWED);
 	if (ret)
 		goto unlock;
 	if (hyp_page_count((void *)virt)) {
@@ -742,6 +741,7 @@ int __pkvm_host_unshare_hyp(u64 pfn)
 		goto unlock;
 	}
 
+	__hyp_set_page_state_range(phys, size, PKVM_NOPAGE);
 	WARN_ON(kvm_pgtable_hyp_unmap(&pkvm_pgtable, virt, size) != size);
 	WARN_ON(__host_set_page_state_range(phys, size, PKVM_PAGE_OWNED));
 
@@ -757,7 +757,6 @@ int __pkvm_host_donate_hyp(u64 pfn, u64 nr_pages)
 	u64 phys = hyp_pfn_to_phys(pfn);
 	u64 size = PAGE_SIZE * nr_pages;
 	void *virt = __hyp_va(phys);
-	enum kvm_pgtable_prot prot;
 	int ret;
 
 	host_lock_component();
@@ -767,13 +766,13 @@ int __pkvm_host_donate_hyp(u64 pfn, u64 nr_pages)
 	if (ret)
 		goto unlock;
 	if (IS_ENABLED(CONFIG_NVHE_EL2_DEBUG)) {
-		ret = __hyp_check_page_state_range((u64)virt, size, PKVM_NOPAGE);
+		ret = __hyp_check_page_state_range(phys, size, PKVM_NOPAGE);
 		if (ret)
 			goto unlock;
 	}
 
-	prot = pkvm_mkstate(PAGE_HYP, PKVM_PAGE_OWNED);
-	WARN_ON(pkvm_create_mappings_locked(virt, virt + size, prot));
+	__hyp_set_page_state_range(phys, size, PKVM_PAGE_OWNED);
+	WARN_ON(pkvm_create_mappings_locked(virt, virt + size, PAGE_HYP));
 	WARN_ON(host_stage2_set_owner_locked(phys, size, PKVM_ID_HYP));
 
 unlock:
@@ -793,7 +792,7 @@ int __pkvm_hyp_donate_host(u64 pfn, u64 nr_pages)
 	host_lock_component();
 	hyp_lock_component();
 
-	ret = __hyp_check_page_state_range(virt, size, PKVM_PAGE_OWNED);
+	ret = __hyp_check_page_state_range(phys, size, PKVM_PAGE_OWNED);
 	if (ret)
 		goto unlock;
 	if (IS_ENABLED(CONFIG_NVHE_EL2_DEBUG)) {
@@ -802,6 +801,7 @@ int __pkvm_hyp_donate_host(u64 pfn, u64 nr_pages)
 			goto unlock;
 	}
 
+	__hyp_set_page_state_range(phys, size, PKVM_NOPAGE);
 	WARN_ON(kvm_pgtable_hyp_unmap(&pkvm_pgtable, virt, size) != size);
 	WARN_ON(host_stage2_set_owner_locked(phys, size, PKVM_ID_HOST));
 
@@ -816,19 +816,18 @@ int hyp_pin_shared_mem(void *from, void *to)
 {
 	u64 cur, start = ALIGN_DOWN((u64)from, PAGE_SIZE);
 	u64 end = PAGE_ALIGN((u64)to);
+	u64 phys = __hyp_pa(start);
 	u64 size = end - start;
 	int ret;
 
 	host_lock_component();
 	hyp_lock_component();
 
-	ret = __host_check_page_state_range(__hyp_pa(start), size,
-					    PKVM_PAGE_SHARED_OWNED);
+	ret = __host_check_page_state_range(phys, size, PKVM_PAGE_SHARED_OWNED);
 	if (ret)
 		goto unlock;
 
-	ret = __hyp_check_page_state_range(start, size,
-					   PKVM_PAGE_SHARED_BORROWED);
+	ret = __hyp_check_page_state_range(phys, size, PKVM_PAGE_SHARED_BORROWED);
 	if (ret)
 		goto unlock;
 
diff --git a/arch/arm64/kvm/hyp/nvhe/setup.c b/arch/arm64/kvm/hyp/nvhe/setup.c
index 1a414288fe8c..955c431af5d0 100644
--- a/arch/arm64/kvm/hyp/nvhe/setup.c
+++ b/arch/arm64/kvm/hyp/nvhe/setup.c
@@ -194,16 +194,20 @@ static int fix_host_ownership_walker(const struct kvm_pgtable_visit_ctx *ctx,
 
 	/*
 	 * Adjust the host stage-2 mappings to match the ownership attributes
-	 * configured in the hypervisor stage-1.
+	 * configured in the hypervisor stage-1, and make sure to propagate them
+	 * to the hyp_vmemmap state.
 	 */
 	state = pkvm_getstate(kvm_pgtable_hyp_pte_prot(ctx->old));
 	switch (state) {
 	case PKVM_PAGE_OWNED:
+		set_hyp_state(phys, PKVM_PAGE_OWNED);
 		return host_stage2_set_owner_locked(phys, PAGE_SIZE, PKVM_ID_HYP);
 	case PKVM_PAGE_SHARED_OWNED:
+		set_hyp_state(phys, PKVM_PAGE_SHARED_OWNED);
 		set_host_state(phys, PKVM_PAGE_SHARED_BORROWED);
 		break;
 	case PKVM_PAGE_SHARED_BORROWED:
+		set_hyp_state(phys, PKVM_PAGE_SHARED_BORROWED);
 		set_host_state(phys, PKVM_PAGE_SHARED_OWNED);
 		break;
 	default:
-- 
2.49.0.604.gff1f9ca942-goog


