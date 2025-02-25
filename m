Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2975FC021A4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 02:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m7dZmTdaF5BfvE12HLbTKAM/qU/qgzQacpIdfJS89lM=; b=Wd9XYMlDADKDnw+cOst1jCRvwu
	Jrvoy+XgYR4gV2Ku1ikOrcSFOmXqGH8GdWhujOvjelmpjAg6yzg+/i6+0vIpUJ0UjLy+bAr7E0IRM
	XIV+Quuog0hiMxrgMX1z6ShqBBXky8zzFXelwcQw+XOyfW5Bkk6ig4bBSOHCgwudHQkLlNR1m5U/I
	mlGxbjNFhxTystEek2o5I2SzBAfUSfApud+OUm0ohRmsfcW4HTfuBPseOpodWxlj7iCQ7V0kA0+3R
	XxpgChiB1Ud/xJxTG8XDeAZh8RBOaAG8wrKqUEk9EorzcXFBDfly/WxAbajdwm7ag1V53xUs7ikgS
	MB7V81/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmkG2-0000000Fl4X-1HOT;
	Tue, 25 Feb 2025 02:01:14 +0000
Received: from mail-ed1-x54a.google.com ([2a00:1450:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmk8i-0000000FkIj-2p6c
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 01:53:41 +0000
Received: by mail-ed1-x54a.google.com with SMTP id 4fb4d7f45d1cf-5e0bff433cbso2983487a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Feb 2025 17:53:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740448418; x=1741053218; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=m7dZmTdaF5BfvE12HLbTKAM/qU/qgzQacpIdfJS89lM=;
        b=rN0nAcLvDNG34zFZJkXXF0x9959yAdv6A/4E3kIoUzi4HgI5zEnR5dm1v3CRGfmSMB
         NELNl74lfb7sPuZO/nnCwo+bwMr+DBcFSej98YZPdlbEi1MzkW8D91IQw9HC8PivK9BB
         gYKpYDCaFUdqu091Lii84oHKZEcm4wd1upiIZrztY2/PPd+VOpO/hq3xJ4OZTugQlB66
         f3xrOAgP3Hw3JJUFqusWED/vWvlAcUO48bWo95Zgi1e2OnDqodmk5kLHegKH/+sX9qx4
         E0Ji+4lciPEJVYlsfMb/57HLtFA3g3PW44/3QejRAAZ9anilmOmzq35kaGVrn3BxaXwH
         dAHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740448418; x=1741053218;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m7dZmTdaF5BfvE12HLbTKAM/qU/qgzQacpIdfJS89lM=;
        b=Hy/Raa5wopvk0unvPI0UrS1HFJYMP9ch/pg8Q5rs/imRvnFpE5rZ6EnQGtnq7p3RQN
         07e2qpTSVXC/fFj1Qqj5kiA6/zBnCCioPuCx42SG0RmCT104IY0uNeQtonI4PXloKvcz
         6lC5chNlggKZePidbgl42F9BfhYncM64RSg0/BkmaRs/Pklw6BlpAAVRg5oqNkwVOq9I
         cLzgUQwLUlQsi4fNVIaQWYBGffruuFjABfdr07jh6oYLofmBoeVzNti/58DhHwKJgSS3
         afIASG1m2WYkShcz9x3ngW3ShtxfUGPJwGJ2unU0O4/8o5CbzcSKRzVgKIMzV/7+Eg6S
         ISkQ==
X-Gm-Message-State: AOJu0YwLu3BLJYLiPVj9GD+yBxMs2GqeAwm9XP58WHGrqIHvrHcZP4DA
	1nNUYNbMPMFsuw9LORYR5U7jTzsu24BDRoJ5reoUwEn7xWbmPdVx0sWznwOWxX6rgIWdbleFvBc
	OqowZNQ==
X-Google-Smtp-Source: AGHT+IGwggas76Qq6nVnBY8hQptDHcF9hAdQuXod8zicSSA+dENSbfVyJVzhiJxQLNjNL2CSji69tgz9i4oD
X-Received: from edbig12.prod.google.com ([2002:a05:6402:458c:b0:5de:6e72:c13b])
 (user=qperret job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:42c5:b0:5e0:87fb:72fb
 with SMTP id 4fb4d7f45d1cf-5e0b70b707dmr17770196a12.6.1740448418641; Mon, 24
 Feb 2025 17:53:38 -0800 (PST)
Date: Tue, 25 Feb 2025 01:53:27 +0000
In-Reply-To: <20250225015327.3708420-1-qperret@google.com>
Mime-Version: 1.0
References: <20250225015327.3708420-1-qperret@google.com>
X-Mailer: git-send-email 2.48.1.658.g4767266eb4-goog
Message-ID: <20250225015327.3708420-5-qperret@google.com>
Subject: [PATCH v2 4/4] KVM: arm64: Extend pKVM selftest for np-guests
From: Quentin Perret <qperret@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, qperret@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_175340_716362_FE8D6398 
X-CRM114-Status: GOOD (  20.49  )
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

The pKVM selftest intends to test as many memory 'transitions' as
possible, so extend it to cover sharing pages with non-protected guests,
including in the case of multi-sharing.

Signed-off-by: Quentin Perret <qperret@google.com>
---
 arch/arm64/include/asm/kvm_pkvm.h             |  6 ++
 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |  4 +-
 arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 90 ++++++++++++++++++-
 arch/arm64/kvm/hyp/nvhe/setup.c               |  8 +-
 arch/arm64/kvm/pkvm.c                         |  1 +
 5 files changed, 104 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
index eb65f12e81d9..104b6b5ab6f5 100644
--- a/arch/arm64/include/asm/kvm_pkvm.h
+++ b/arch/arm64/include/asm/kvm_pkvm.h
@@ -134,6 +134,12 @@ static inline unsigned long host_s2_pgtable_pages(void)
 	return res;
 }
 
+#ifdef CONFIG_PKVM_SELFTESTS
+static inline unsigned long pkvm_selftest_pages(void) { return 32; }
+#else
+static inline unsigned long pkvm_selftest_pages(void) { return 0; }
+#endif
+
 #define KVM_FFA_MBOX_NR_PAGES	1
 
 static inline unsigned long hyp_ffa_proxy_pages(void)
diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
index 31a3f2cdf242..dd53af947a58 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
@@ -69,8 +69,8 @@ static __always_inline void __load_host_stage2(void)
 }
 
 #ifdef CONFIG_PKVM_SELFTESTS
-void pkvm_ownership_selftest(void);
+void pkvm_ownership_selftest(void *base);
 #else
-static inline void pkvm_ownership_selftest(void) { }
+static inline void pkvm_ownership_selftest(void *base) { }
 #endif
 #endif /* __KVM_NVHE_MEM_PROTECT__ */
diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 46f3f4aeecc5..a03a2665e234 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -1088,16 +1088,60 @@ int __pkvm_host_mkyoung_guest(u64 gfn, struct pkvm_hyp_vcpu *vcpu)
 struct pkvm_expected_state {
 	enum pkvm_page_state host;
 	enum pkvm_page_state hyp;
+	enum pkvm_page_state guest[2]; /* [ gfn, gfn + 1 ] */
 };
 
 static struct pkvm_expected_state selftest_state;
 static struct hyp_page *selftest_page;
 
+static struct pkvm_hyp_vm selftest_vm = {
+	.kvm = {
+		.arch = {
+			.mmu = {
+				.arch = &selftest_vm.kvm.arch,
+				.pgt = &selftest_vm.pgt,
+			},
+		},
+	},
+};
+
+static struct pkvm_hyp_vcpu selftest_vcpu = {
+	.vcpu = {
+		.arch = {
+			.hw_mmu = &selftest_vm.kvm.arch.mmu,
+		},
+		.kvm = &selftest_vm.kvm,
+	},
+};
+
+static void init_selftest_vm(void *virt)
+{
+	struct hyp_page *p = hyp_virt_to_page(virt);
+	int i;
+
+	selftest_vm.kvm.arch.mmu.vtcr = host_mmu.arch.mmu.vtcr;
+	WARN_ON(kvm_guest_prepare_stage2(&selftest_vm, virt));
+
+	for (i = 0; i < pkvm_selftest_pages(); i++) {
+		if (p[i].refcount)
+			continue;
+		p[i].refcount = 1;
+		hyp_put_page(&selftest_vm.pool, hyp_page_to_virt(&p[i]));
+	}
+}
+
+static u64 selftest_ipa(void)
+{
+	return BIT(selftest_vm.pgt.ia_bits - 1);
+}
+
 static void assert_page_state(void)
 {
 	void *virt = hyp_page_to_virt(selftest_page);
 	u64 size = PAGE_SIZE << selftest_page->order;
+	struct pkvm_hyp_vcpu *vcpu = &selftest_vcpu;
 	u64 phys = hyp_virt_to_phys(virt);
+	u64 ipa[2] = { selftest_ipa(), selftest_ipa() + PAGE_SIZE };
 
 	host_lock_component();
 	WARN_ON(__host_check_page_state_range(phys, size, selftest_state.host));
@@ -1106,6 +1150,11 @@ static void assert_page_state(void)
 	hyp_lock_component();
 	WARN_ON(__hyp_check_page_state_range((u64)virt, size, selftest_state.hyp));
 	hyp_unlock_component();
+
+	guest_lock_component(&selftest_vm);
+	WARN_ON(__guest_check_page_state_range(vcpu, ipa[0], size, selftest_state.guest[0]));
+	WARN_ON(__guest_check_page_state_range(vcpu, ipa[1], size, selftest_state.guest[1]));
+	guest_unlock_component(&selftest_vm);
 }
 
 #define assert_transition_res(res, fn, ...)		\
@@ -1114,21 +1163,27 @@ static void assert_page_state(void)
 		assert_page_state();			\
 	} while (0)
 
-void pkvm_ownership_selftest(void)
+void pkvm_ownership_selftest(void *base)
 {
+	enum kvm_pgtable_prot prot = KVM_PGTABLE_PROT_RWX;
 	void *virt = hyp_alloc_pages(&host_s2_pool, 0);
-	u64 phys, size, pfn;
+	struct pkvm_hyp_vcpu *vcpu = &selftest_vcpu;
+	struct pkvm_hyp_vm *vm = &selftest_vm;
+	u64 phys, size, pfn, gfn;
 
 	WARN_ON(!virt);
 	selftest_page = hyp_virt_to_page(virt);
 	selftest_page->refcount = 0;
+	init_selftest_vm(base);
 
 	size = PAGE_SIZE << selftest_page->order;
 	phys = hyp_virt_to_phys(virt);
 	pfn = hyp_phys_to_pfn(phys);
+	gfn = hyp_phys_to_pfn(selftest_ipa());
 
 	selftest_state.host = PKVM_NOPAGE;
 	selftest_state.hyp = PKVM_PAGE_OWNED;
+	selftest_state.guest[0] = selftest_state.guest[1] = PKVM_NOPAGE;
 	assert_page_state();
 	assert_transition_res(-EPERM,	__pkvm_host_donate_hyp, pfn, 1);
 	assert_transition_res(-EPERM,	__pkvm_host_share_hyp, pfn);
@@ -1136,6 +1191,8 @@ void pkvm_ownership_selftest(void)
 	assert_transition_res(-EPERM,	__pkvm_host_share_ffa, pfn, 1);
 	assert_transition_res(-EPERM,	__pkvm_host_unshare_ffa, pfn, 1);
 	assert_transition_res(-EPERM,	hyp_pin_shared_mem, virt, virt + size);
+	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, vcpu, prot);
+	assert_transition_res(-ENOENT,	__pkvm_host_unshare_guest, gfn, vm);
 
 	selftest_state.host = PKVM_PAGE_OWNED;
 	selftest_state.hyp = PKVM_NOPAGE;
@@ -1143,6 +1200,7 @@ void pkvm_ownership_selftest(void)
 	assert_transition_res(-EPERM,	__pkvm_hyp_donate_host, pfn, 1);
 	assert_transition_res(-EPERM,	__pkvm_host_unshare_hyp, pfn);
 	assert_transition_res(-EPERM,	__pkvm_host_unshare_ffa, pfn, 1);
+	assert_transition_res(-ENOENT,	__pkvm_host_unshare_guest, gfn, vm);
 	assert_transition_res(-EPERM,	hyp_pin_shared_mem, virt, virt + size);
 
 	selftest_state.host = PKVM_PAGE_SHARED_OWNED;
@@ -1152,6 +1210,8 @@ void pkvm_ownership_selftest(void)
 	assert_transition_res(-EPERM,	__pkvm_host_donate_hyp, pfn, 1);
 	assert_transition_res(-EPERM,	__pkvm_host_share_ffa, pfn, 1);
 	assert_transition_res(-EPERM,	__pkvm_hyp_donate_host, pfn, 1);
+	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, vcpu, prot);
+	assert_transition_res(-ENOENT,	__pkvm_host_unshare_guest, gfn, vm);
 
 	assert_transition_res(0,	hyp_pin_shared_mem, virt, virt + size);
 	assert_transition_res(0,	hyp_pin_shared_mem, virt, virt + size);
@@ -1162,6 +1222,8 @@ void pkvm_ownership_selftest(void)
 	assert_transition_res(-EPERM,	__pkvm_host_donate_hyp, pfn, 1);
 	assert_transition_res(-EPERM,	__pkvm_host_share_ffa, pfn, 1);
 	assert_transition_res(-EPERM,	__pkvm_hyp_donate_host, pfn, 1);
+	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, vcpu, prot);
+	assert_transition_res(-ENOENT,	__pkvm_host_unshare_guest, gfn, vm);
 
 	hyp_unpin_shared_mem(virt, virt + size);
 	assert_page_state();
@@ -1179,6 +1241,8 @@ void pkvm_ownership_selftest(void)
 	assert_transition_res(-EPERM,	__pkvm_host_share_hyp, pfn);
 	assert_transition_res(-EPERM,	__pkvm_host_unshare_hyp, pfn);
 	assert_transition_res(-EPERM,	__pkvm_hyp_donate_host, pfn, 1);
+	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, vcpu, prot);
+	assert_transition_res(-ENOENT,	__pkvm_host_unshare_guest, gfn, vm);
 	assert_transition_res(-EPERM,	hyp_pin_shared_mem, virt, virt + size);
 
 	selftest_state.host = PKVM_PAGE_OWNED;
@@ -1186,6 +1250,28 @@ void pkvm_ownership_selftest(void)
 	assert_transition_res(0,	__pkvm_host_unshare_ffa, pfn, 1);
 	assert_transition_res(-EPERM,	__pkvm_host_unshare_ffa, pfn, 1);
 
+	selftest_state.host = PKVM_PAGE_SHARED_OWNED;
+	selftest_state.guest[0] = PKVM_PAGE_SHARED_BORROWED;
+	assert_transition_res(0,	__pkvm_host_share_guest, pfn, gfn, vcpu, prot);
+	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, vcpu, prot);
+	assert_transition_res(-EPERM,	__pkvm_host_share_ffa, pfn, 1);
+	assert_transition_res(-EPERM,	__pkvm_host_donate_hyp, pfn, 1);
+	assert_transition_res(-EPERM,	__pkvm_host_share_hyp, pfn);
+	assert_transition_res(-EPERM,	__pkvm_host_unshare_hyp, pfn);
+	assert_transition_res(-EPERM,	__pkvm_hyp_donate_host, pfn, 1);
+	assert_transition_res(-EPERM,	hyp_pin_shared_mem, virt, virt + size);
+
+	selftest_state.guest[1] = PKVM_PAGE_SHARED_BORROWED;
+	assert_transition_res(0,	__pkvm_host_share_guest, pfn, gfn + 1, vcpu, prot);
+	WARN_ON(hyp_virt_to_page(virt)->host_share_guest_count != 2);
+
+	selftest_state.guest[0] = PKVM_NOPAGE;
+	assert_transition_res(0,	__pkvm_host_unshare_guest, gfn, vm);
+
+	selftest_state.guest[1] = PKVM_NOPAGE;
+	selftest_state.host = PKVM_PAGE_OWNED;
+	assert_transition_res(0,	__pkvm_host_unshare_guest, gfn + 1, vm);
+
 	selftest_state.host = PKVM_NOPAGE;
 	selftest_state.hyp = PKVM_PAGE_OWNED;
 	assert_transition_res(0,	__pkvm_host_donate_hyp, pfn, 1);
diff --git a/arch/arm64/kvm/hyp/nvhe/setup.c b/arch/arm64/kvm/hyp/nvhe/setup.c
index 54006f959e1b..814548134a83 100644
--- a/arch/arm64/kvm/hyp/nvhe/setup.c
+++ b/arch/arm64/kvm/hyp/nvhe/setup.c
@@ -28,6 +28,7 @@ static void *vmemmap_base;
 static void *vm_table_base;
 static void *hyp_pgt_base;
 static void *host_s2_pgt_base;
+static void *selftest_base;
 static void *ffa_proxy_pages;
 static struct kvm_pgtable_mm_ops pkvm_pgtable_mm_ops;
 static struct hyp_pool hpool;
@@ -38,6 +39,11 @@ static int divide_memory_pool(void *virt, unsigned long size)
 
 	hyp_early_alloc_init(virt, size);
 
+	nr_pages = pkvm_selftest_pages();
+	selftest_base = hyp_early_alloc_contig(nr_pages);
+	if (nr_pages && !selftest_base)
+		return -ENOMEM;
+
 	nr_pages = hyp_vmemmap_pages(sizeof(struct hyp_page));
 	vmemmap_base = hyp_early_alloc_contig(nr_pages);
 	if (!vmemmap_base)
@@ -309,7 +315,7 @@ void __noreturn __pkvm_init_finalise(void)
 
 	pkvm_hyp_vm_table_init(vm_table_base);
 
-	pkvm_ownership_selftest();
+	pkvm_ownership_selftest(selftest_base);
 out:
 	/*
 	 * We tail-called to here from handle___pkvm_init() and will not return,
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index 5a75f9554e57..728ae5f44da3 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -79,6 +79,7 @@ void __init kvm_hyp_reserve(void)
 	hyp_mem_pages += host_s2_pgtable_pages();
 	hyp_mem_pages += hyp_vm_table_pages();
 	hyp_mem_pages += hyp_vmemmap_pages(STRUCT_HYP_PAGE_SIZE);
+	hyp_mem_pages += pkvm_selftest_pages();
 	hyp_mem_pages += hyp_ffa_proxy_pages();
 
 	/*
-- 
2.48.1.658.g4767266eb4-goog


