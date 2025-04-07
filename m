Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEF0FC36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 08:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FRbmnXi/kMVYfkZ+DJBP7bhEsGPG5CEmYLC9waH1gHc=; b=kV36Z3cc2KuCczHVPNKvTK4NWB
	NugNDPIud3IbzKE+awCfZ4RZrv5gXhdzNmpQBH5LNHRxOINSN8Gkb6szZzSEnmhbrPzB+VHQ4QXop
	5AXx7qloGt9hnazW30Nh0MWMaL6TXUwjISVEfBoQLQ2h+ec8/Ndo76BSW5Cq9DDrMFVY+NMG2yoN+
	aWdYokB2UmHmHqfWTS9sXvUtgbUrAjDHO8nt7yQDSFiAFk33qSE9n0ZCXQwBgHtX3C1eK41AXHpcJ
	aFj12s/Y5yQUOMCRR8gmPb00qD8fkvaGq1sJZfmj6xn8P78TSnyNTHcv4JTOaqIrRRPqWmNStJJjc
	TSgW4oXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1i5D-0000000H3WY-2UUa;
	Mon, 07 Apr 2025 08:43:55 +0000
Received: from mail-wm1-f73.google.com ([209.85.128.73])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1hpc-0000000H00b-1ezH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 08:27:49 +0000
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43cec217977so26175325e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Apr 2025 01:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744014466; x=1744619266; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=FRbmnXi/kMVYfkZ+DJBP7bhEsGPG5CEmYLC9waH1gHc=;
        b=IZK10n6YswS6+sMvC+V6T1JynFA3et3JpRZjHzsZSzwctRTtMhQHyOkiuwCSaLORoa
         GxyDb/ty4ulm6Mf9IMTZ05LIXAZT6NSykrl9NsHcRNAr2WoaBNL+yjbhWI399ALHu0wp
         RYRzweecLpfgGdiV+gARUA669xWk8HUo2i6r70r8+weNT/3S6V6CyaC/DTn76Iltb4av
         Vzmx0F07zbRrxcB0uFnS8QMpjSB3Pc38PKit9MG53O+8o2YgtM7Mlwe9sFZx/xJOe75u
         8ZV23PjWJEJyHZ1QvBRpqgsSy/jo0J6eg4FfueEJKi7M742GZApI8Xt0fm1a+tSgEW9z
         Tp0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744014466; x=1744619266;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FRbmnXi/kMVYfkZ+DJBP7bhEsGPG5CEmYLC9waH1gHc=;
        b=mY1OoTy7ByrkT4hlNTyTTVKCGPytxY26waLG398neeBs5Uu2WU+wd6Kh0AFUDMeHuM
         Vnal2tsQ8Q1sZCHjz6RequsgSsZ99wfFSEwinFhxm5RoqXbi347C7uHhNeg5QL3wC7Bi
         W43G3DPKCzMQ9qOsQqxWtNhZpE62sgPxfY7K8BxQC2372NeJDQ3mMZ1r45R4kJhhoI/6
         sLO8JhsxCD18VOUnMeaNcn4m5ijOUP5qzcvbPL1kKVy/DQrr6TOmyY9w92qOqbL6jN2y
         si3eGHOHbJUyRdH7AZKLEFqg3wxph4EjRRclF9azDYrGsDDberGRRAhIFW5cDpo6co3X
         H4rQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4xQMcqARk2FuM/Ddf1SkX3LQbRIpl5ZVU7r/Z4k+Umnk7xVZQnpaC8xBnKn3c9MG0o5aIO9s0PRown4xQd9+Q@lists.infradead.org
X-Gm-Message-State: AOJu0YznLVVOHJREjezjVNoeT2PrFTve/N9pnMzN8gbnDMhvCAYjpC1B
	gLErHRk2fdGen/SHKKhYM8CLrYEfeey+Bi/y8yDCRofCfqVzf7ptq55e8ClEaQiPh0XwZpTmY5A
	Qb7qQzvLQc3gZXXr7Aw==
X-Google-Smtp-Source: AGHT+IEic6OXLHFjJFcSMjX6yW+diABGg79TavoXgMJoLPcFtBwYVwRi0D0qAEBQti0q9fFPcQTMJ2BeP0VaFbsn
X-Received: from wmqe6.prod.google.com ([2002:a05:600c:4e46:b0:43b:c914:a2d9])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:500c:b0:43d:bb9:ad00 with SMTP id 5b1f17b1804b1-43ecf8cf6b2mr129812945e9.15.1744014466013;
 Mon, 07 Apr 2025 01:27:46 -0700 (PDT)
Date: Mon,  7 Apr 2025 09:27:05 +0100
In-Reply-To: <20250407082706.1239603-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20250407082706.1239603-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250407082706.1239603-9-vdonnefort@google.com>
Subject: [PATCH v3 8/9] KVM: arm64: Stage-2 huge mappings for np-guests
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: qperret@google.com, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kernel-team@android.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_012748_432263_195A7765 
X-CRM114-Status: GOOD (  10.55  )
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
index ad14b79a32e2..da82d554ff88 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -167,7 +167,7 @@ int kvm_host_prepare_stage2(void *pgt_pool_base)
 static bool guest_stage2_force_pte_cb(u64 addr, u64 end,
 				      enum kvm_pgtable_prot prot)
 {
-	return true;
+	return false;
 }
 
 static void *guest_s2_zalloc_pages_exact(size_t size)
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 2feb6c6b63af..b1479e607a9b 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1537,7 +1537,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	 * logging_active is guaranteed to never be true for VM_PFNMAP
 	 * memslots.
 	 */
-	if (logging_active || is_protected_kvm_enabled()) {
+	if (logging_active) {
 		force_pte = true;
 		vma_shift = PAGE_SHIFT;
 	} else {
@@ -1547,7 +1547,8 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	switch (vma_shift) {
 #ifndef __PAGETABLE_PMD_FOLDED
 	case PUD_SHIFT:
-		if (fault_supports_stage2_huge_mapping(memslot, hva, PUD_SIZE))
+		if (!is_protected_kvm_enabled() &&
+		    fault_supports_stage2_huge_mapping(memslot, hva, PUD_SIZE))
 			break;
 		fallthrough;
 #endif
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index 97ce9ca68143..18dfaee3143e 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -345,7 +345,7 @@ int pkvm_pgtable_stage2_map(struct kvm_pgtable *pgt, u64 addr, u64 size,
 	u64 pfn = phys >> PAGE_SHIFT;
 	int ret;
 
-	if (size != PAGE_SIZE)
+	if (size != PAGE_SIZE && size != PMD_SIZE)
 		return -EINVAL;
 
 	lockdep_assert_held_write(&kvm->mmu_lock);
-- 
2.49.0.504.g3bcea36a83-goog


