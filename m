Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47292C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 13:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X5HS1MTADtzk13DQ0X8VV2YLbKPpc9rF/EQ2n6h7rrc=; b=ckG1o7mkHIA5oc+8Fl4BERa1kA
	Ys9sEx69m1ZfigjkkXNow4shOAxt/af3aklAAusHcoABiLEyptdPscNvK1z+oMHgyNnmNsUgFlT7N
	yeI63IeNeVJNnRMMt1QsOQKxbXJLqf2DewKeu3qnVG4H/kxiYXhGJ81hENZV3+sqf6ySg31vwMm0V
	eisx22+lkqEsLMdrYw8lx5Jy5AjlVc4eUA1T+4vNeAbDV8budu6qpaROOdv/U6m6JeIRNHsb9rQah
	8Ycs2oOWS6KGclStjQ1aQuccUKBP91VWllknsz9+HIRwLNI1mhqRxFpkfG8NXAIBWabO+605efl1e
	jdcjF8zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHjCp-0000000Ft7w-0brg;
	Wed, 21 May 2025 13:09:59 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHiuo-0000000Fpgc-1O4F
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 May 2025 12:51:23 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-3a371fb826cso1581778f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 May 2025 05:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747831880; x=1748436680; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=X5HS1MTADtzk13DQ0X8VV2YLbKPpc9rF/EQ2n6h7rrc=;
        b=TqRApzDj1zikXW0nvkDoAJ0jJ+h6oG/xt1zxU/43I8Y0gOEV8YTvyURYlnOiiiI0XT
         HMoefZoyeVyft7b9ezgNcaxFsVD8N1tK1dUmMMVBSdToa+0h4PsOHi4a5BsHkYnXwTEl
         qNCBEAcg4A4+cK9NNzM4yeK5oBXW6PnQKcPBo+fyThVZfccxwn8DPgd4xgszRGyCBCET
         G6x/ZiK20xYvJc8eYvHyJ8U4d/U1BcWPK/FAy2yz1uGhdmGm6F8tgMMUNsfhLHxqD7zy
         lEX+fiGbWWEi0kX6SLw/aTJFpbrm3oOP34Fv/gI0NptAY38XwYTNLsTFHEHn3OnpMZ/+
         1iCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747831880; x=1748436680;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X5HS1MTADtzk13DQ0X8VV2YLbKPpc9rF/EQ2n6h7rrc=;
        b=Uk4EaCQbxezk5KviBTMNV8eA+UXN8EReWY4UDyP9fG3Up1+4/GvrpTLZ7gSbKdWZIf
         ZVX/jEGdIuHW8fFTNOQvQnmzH4sGCeY8Fv5pl4AHZ68FSA5xWCDyh33SB2Uz7XREgjJj
         KgesOcsgOkFS5g9rJwHwTedb1SQUBoGzj1VuoteD4Ex1vzYMR9wt7FwC4OuZlto1Lo+8
         ONiQlPR4ERmDaZ9jktwxHKR3j8PTumfEyk0HuVfw/MG1YGVP79TFsJXHzx7eNdD7757O
         x2ooRLMo7XC79V4hzVPKY2XNVSVuE0MvC6IDmeJzNxhItowYIwf1POdkF9KpJI0ASFLs
         Ja/w==
X-Forwarded-Encrypted: i=1; AJvYcCWq0dSMxtF72z6s3+2OwSUK+6lhNjZzBfY2XEUmoIpega3lWnrupJJa7DNxILAXIeHbPNHRFg7bAmmnqZyPVBLj@lists.infradead.org
X-Gm-Message-State: AOJu0YyMmt9QkD+GVKX7AftS6u1OmWbtEkpitF9o9xheel9O0dYPZ+JP
	A7BlveYYJcwGz5kcczJdptHhE1bzX2737/AC+vRxWOfPqphdPbKh/fApcXtbuATvQ37eBwsXvu4
	4Q7CxiWA12CdSG/eXRjIALg==
X-Google-Smtp-Source: AGHT+IFn3AYms1bLCqgZr1MLXfsCQOa84rpC6sI4FufTfMFtyP2s5auBVEIM75SbnJC+p900vsvf1E3FCH0tA9RV
X-Received: from wrbei2.prod.google.com ([2002:a05:6000:4182:b0:3a3:6d1d:3837])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:186d:b0:3a3:6b0c:a8a3 with SMTP id ffacd0b85a97d-3a36b0ca9b1mr11358542f8f.17.1747831880271;
 Wed, 21 May 2025 05:51:20 -0700 (PDT)
Date: Wed, 21 May 2025 13:48:33 +0100
In-Reply-To: <20250521124834.1070650-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20250521124834.1070650-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.49.0.1112.g889b7c5bd8-goog
Message-ID: <20250521124834.1070650-10-vdonnefort@google.com>
Subject: [PATCH v6 09/10] KVM: arm64: Stage-2 huge mappings for np-guests
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: qperret@google.com, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kernel-team@android.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_055122_368378_63168962 
X-CRM114-Status: GOOD (  13.21  )
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

Now np-guests hypercalls with range are supported, we can let the
hypervisor to install block mappings whenever the Stage-1 allows it,
that is when backed by either Hugetlbfs or THPs. The size of those block
mappings is limited to PMD_SIZE.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index e08c735206e0..1c18fca82209 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -166,12 +166,6 @@ int kvm_host_prepare_stage2(void *pgt_pool_base)
 	return 0;
 }
 
-static bool guest_stage2_force_pte_cb(u64 addr, u64 end,
-				      enum kvm_pgtable_prot prot)
-{
-	return true;
-}
-
 static void *guest_s2_zalloc_pages_exact(size_t size)
 {
 	void *addr = hyp_alloc_pages(&current_vm->pool, get_order(size));
@@ -278,8 +272,7 @@ int kvm_guest_prepare_stage2(struct pkvm_hyp_vm *vm, void *pgd)
 	};
 
 	guest_lock_component(vm);
-	ret = __kvm_pgtable_stage2_init(mmu->pgt, mmu, &vm->mm_ops, 0,
-					guest_stage2_force_pte_cb);
+	ret = __kvm_pgtable_stage2_init(mmu->pgt, mmu, &vm->mm_ops, 0, NULL);
 	guest_unlock_component(vm);
 	if (ret)
 		return ret;
@@ -908,12 +901,24 @@ int __pkvm_host_unshare_ffa(u64 pfn, u64 nr_pages)
 
 static int __guest_check_transition_size(u64 phys, u64 ipa, u64 nr_pages, u64 *size)
 {
+	size_t block_size;
+
 	if (nr_pages == 1) {
 		*size = PAGE_SIZE;
 		return 0;
 	}
 
-	return -EINVAL;
+	/* We solely support second to last level huge mapping */
+	block_size = kvm_granule_size(KVM_PGTABLE_LAST_LEVEL - 1);
+
+	if (nr_pages != block_size >> PAGE_SHIFT)
+		return -EINVAL;
+
+	if (!IS_ALIGNED(phys | ipa, block_size))
+		return -EINVAL;
+
+	*size = block_size;
+	return 0;
 }
 
 int __pkvm_host_share_guest(u64 pfn, u64 gfn, u64 nr_pages, struct pkvm_hyp_vcpu *vcpu,
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 754f2fe0cc67..e445db2cb4a4 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1304,6 +1304,10 @@ static bool fault_supports_stage2_huge_mapping(struct kvm_memory_slot *memslot,
 	if (map_size == PAGE_SIZE)
 		return true;
 
+	/* pKVM only supports PMD_SIZE huge-mappings */
+	if (is_protected_kvm_enabled() && map_size != PMD_SIZE)
+		return false;
+
 	size = memslot->npages * PAGE_SIZE;
 
 	gpa_start = memslot->base_gfn << PAGE_SHIFT;
@@ -1537,7 +1541,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	 * logging_active is guaranteed to never be true for VM_PFNMAP
 	 * memslots.
 	 */
-	if (logging_active || is_protected_kvm_enabled()) {
+	if (logging_active) {
 		force_pte = true;
 		vma_shift = PAGE_SHIFT;
 	} else {
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index b1a65f50c02a..fcd70bfe44fb 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -332,7 +332,7 @@ int pkvm_pgtable_stage2_map(struct kvm_pgtable *pgt, u64 addr, u64 size,
 	u64 pfn = phys >> PAGE_SHIFT;
 	int ret;
 
-	if (size != PAGE_SIZE)
+	if (size != PAGE_SIZE && size != PMD_SIZE)
 		return -EINVAL;
 
 	lockdep_assert_held_write(&kvm->mmu_lock);
-- 
2.49.0.1112.g889b7c5bd8-goog


