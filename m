Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9546C55184
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 10:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=reLJB9mcLy59APOd1H3LrMYSyYzRkBhNQ7m/o5SPKAo=; b=mB8DpRAx2+9vufpn5X4buF01OS
	5CJ+bwn6F2bmCxL++S/BrZVvWh+KmTokGSV1861ft3HbOTrBk99Q0otmiTimnrk4XgDcaEeXmLrE2
	wsg7IfbTvVRIiQN53FUq2GJB1Zo23RcR9u5Lk3ULcbKfm2Budw+oC6bo1gO8fwoeXW8Xrr8F5G6B7
	Ebi8hSk+nQYbq/ZeZJwUDBLI3+a8OcNlq9bowR5QvhWZgNczbqstkxTQHL8FXascNCST/CGb4o0w/
	lKX5n2FD/CexdWCVYb8BFL1JFtuNBNDffB0hMTcbLBTTva5KSkGrQaw5IB0gM3PT2KLRXJm/XO5vR
	kFqQZhUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqpda-0000000Gn7f-0CzM;
	Mon, 03 Aug 2026 10:11:14 +0000
Received: from mail-wm1-x348.google.com ([2a00:1450:4864:20::348])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqpdW-0000000Gn0d-3zLx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 10:11:12 +0000
Received: by mail-wm1-x348.google.com with SMTP id 5b1f17b1804b1-4955b84e25eso13267875e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 03:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785751869; x=1786356669; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=reLJB9mcLy59APOd1H3LrMYSyYzRkBhNQ7m/o5SPKAo=;
        b=WMScZzqJ9Wwo3OwdwLEnzi8Xbf5k/PO3Qyku7y+LkkGz9W73Gummz/h+ss0UanW9x+
         QwF9dDDjR5DPACt08SoPkStnudqBIVPfb4RSe72kwAW2noIbH5ZfoprSXodKDikrhlGN
         B5kvGtE5B3fsfmUMbtQF9E3cGKdyrD+lw8kqDLAaZsULaSgd7AXCaprChSs5B/MiApfF
         9YBuglZidswhfg0czt9PpF4HAK/2CLM6Wni8/Qv57DVESsiVC2SppIw1nnkNojPcyGyI
         tRv9Ub+jhlTcfH+ElTHMFK7IRCfTn3W72YZz3bECA9lPWfmlPUee4ElBx2wE0vMu0yRl
         r5hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785751869; x=1786356669;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=reLJB9mcLy59APOd1H3LrMYSyYzRkBhNQ7m/o5SPKAo=;
        b=RRW8Ucyi2o6aYYvV11xwPXnlWUTSZBN1y0P2rdyzMX4Tm1lJsceGymvsgoxyNDBGuu
         2ONwgcqsmFhORiR1qlSRSK1CyfIwBEFrzjTGY6bS7IXsHBami4rVyyo+Ervkq0BEkAl6
         1l7JgzRy2n3qYX5x40K6DFP2GTEfm0Y+A/TAFr4YY9sSdr/xILb+vRZ+vxNGMOW480Qu
         o0d93ofA8w6Qjnz+T7Q4TirXsqytjccZedUJ9ntZYxS7RIyaEXADNTh3zrRO8lor0od3
         R4ERNTAVXLVXPbBilZepqqDSeYtJYUeM1feMVLNQ6Sd3KwAcNL4DQpTHAE+pDEJITHfN
         XGyQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr1rHvVC0rcFOHCDAarajFP/+0MVYhQhteygT/xxg+rSThUgQ3AimtWXhgYJRDTdVskmgU7F9oTodBwUOD8k3e5@lists.infradead.org
X-Gm-Message-State: AOJu0Ywx7HTkx/zKp6OFT0soSq6K7xGe4oHWCpKvF5KcdsS/zRJwJ8Yc
	qaYoZ9B2g/CtLU6nIZTelgzK6qXjzSdW/eGuzGnYy4atPy+tKH0k5EMBo4F9P9UTywx5Y3v6SDB
	UUBA9uPWq8Mzi4X/lN1V4WQ==
X-Received: from wmfu14.prod.google.com ([2002:a05:600c:138e:b0:493:fb57:3896])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4454:b0:493:bd2a:93bb with SMTP id 5b1f17b1804b1-4980c64b6cdmr210376905e9.3.1785751868662;
 Mon, 03 Aug 2026 03:11:08 -0700 (PDT)
Date: Mon,  3 Aug 2026 11:08:56 +0100
In-Reply-To: <20260803100904.3563942-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260803100904.3563942-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.508.g3f0d502094-goog
Message-ID: <20260803100904.3563942-13-vdonnefort@google.com>
Subject: [PATCH 12/20] KVM: arm64: Handle huge mappings in __pkvm_host_force_reclaim_page_guest()
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, 
	keirf@google.com, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_031111_009553_334493F6 
X-CRM114-Status: GOOD (  16.76  )
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

In preparation for supporting stage-2 huge mappings for protected VMs, allow
__pkvm_host_force_reclaim_page_guest() to work with PMD_SIZE mappings.
As this HVC is called from a non-preemptible context, it is not possible
to rely on the host pkvm_mappings tree to get the mapping size. Instead,
use the actual host stage-2 mapping size and compare it with the guest
stage-2.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index d5ee079a5d70..47c5c6b4869e 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -1292,11 +1292,9 @@ static int __guest_check_transition_size(u64 phys, u64 ipa, u64 nr_pages, u64 *s
 	return 0;
 }
 
-static void hyp_poison_page(phys_addr_t phys)
+static void __hyp_poison_page(void *addr, size_t size)
 {
-	void *addr = hyp_fixmap_map(phys);
-
-	memset(addr, 0, PAGE_SIZE);
+	memset(addr, 0, size);
 	/*
 	 * Prefer kvm_flush_dcache_to_poc() over __clean_dcache_guest_page()
 	 * here as the latter may elide the CMO under the assumption that FWB
@@ -1304,19 +1302,15 @@ static void hyp_poison_page(phys_addr_t phys)
 	 * host stage-2 and would otherwise lead to a malicious host potentially
 	 * being able to read the contents of newly reclaimed guest pages.
 	 */
-	kvm_flush_dcache_to_poc(addr, PAGE_SIZE);
-	hyp_fixmap_unmap();
+	kvm_flush_dcache_to_poc(addr, size);
 }
 
 static void hyp_poison_range(phys_addr_t phys, u64 size)
 {
-	u64 offset;
-
-	for (offset = 0; offset < size; offset += PAGE_SIZE)
-		hyp_poison_page(phys + offset);
+	__apply_guest_page(__hyp_va(phys), size, __hyp_poison_page);
 }
 
-static int host_stage2_get_guest_info(phys_addr_t phys, struct pkvm_hyp_vm **vm,
+static int host_stage2_get_guest_info(phys_addr_t phys, u64 *size, struct pkvm_hyp_vm **vm,
 				      u64 *gfn)
 {
 	enum pkvm_page_state state;
@@ -1344,34 +1338,43 @@ static int host_stage2_get_guest_info(phys_addr_t phys, struct pkvm_hyp_vm **vm,
 	if (ret)
 		return ret;
 
-	if (WARN_ON(level != KVM_PGTABLE_LAST_LEVEL))
-		return -EINVAL;
+	/* We only support either PAGE_SIZE or PMD_SIZE */
+	if (level < KVM_PGTABLE_LAST_LEVEL - 1)
+		return -E2BIG;
 
-	return host_stage2_decode_gfn_meta(pte, vm, gfn);
+	ret = host_stage2_decode_gfn_meta(pte, vm, gfn);
+	if (ret)
+		return ret;
+
+	*size = kvm_granule_size(level);
+
+	return 0;
 }
 
 int __pkvm_host_force_reclaim_page_guest(phys_addr_t phys)
 {
+	u64 gfn, ipa, pa, size;
 	struct pkvm_hyp_vm *vm;
-	u64 gfn, ipa, pa;
 	kvm_pte_t pte;
 	int ret;
 
-	phys &= PAGE_MASK;
-
 	hyp_spin_lock(&vm_table_lock);
 	host_lock_component();
 
-	ret = host_stage2_get_guest_info(phys, &vm, &gfn);
+	ret = host_stage2_get_guest_info(phys, &size, &vm, &gfn);
 	if (ret)
 		goto unlock_host;
 
 	ipa = hyp_pfn_to_phys(gfn);
+
 	guest_lock_component(vm);
-	ret = get_valid_guest_pte(vm, ipa, PAGE_SIZE, &pte, &pa);
+	ret = get_valid_guest_pte(vm, ipa, size, &pte, &pa);
 	if (ret)
 		goto unlock_guest;
 
+	phys = ALIGN_DOWN(phys, size);
+	pa = ALIGN_DOWN(pa, size);
+
 	WARN_ON(pa != phys);
 	if (guest_get_page_state(pte, ipa) != PKVM_PAGE_OWNED) {
 		ret = -EPERM;
@@ -1379,14 +1382,14 @@ int __pkvm_host_force_reclaim_page_guest(phys_addr_t phys)
 	}
 
 	/* We really shouldn't be allocating, so don't pass a memcache */
-	ret = kvm_pgtable_stage2_annotate(&vm->pgt, ipa, PAGE_SIZE, NULL,
+	ret = kvm_pgtable_stage2_annotate(&vm->pgt, ipa, size, NULL,
 					  KVM_GUEST_INVALID_PTE_TYPE_POISONED,
 					  0);
 	if (ret)
 		goto unlock_guest;
 
-	hyp_poison_page(phys);
-	WARN_ON(host_stage2_set_owner_locked(phys, PAGE_SIZE, PKVM_ID_HOST));
+	hyp_poison_range(phys, size);
+	WARN_ON(host_stage2_set_owner_locked(phys, size, PKVM_ID_HOST));
 unlock_guest:
 	guest_unlock_component(vm);
 unlock_host:
-- 
2.55.0.508.g3f0d502094-goog


