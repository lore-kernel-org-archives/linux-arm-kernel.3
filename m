Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EB5CC369BA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 16:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o7DwcRfwYwPR3lOoszfjZJQ8USmI21/b/JDlDzaI3Rk=; b=eqolSvN1i4BwTS7aqWrn6oSId2
	hjbiT//teuUt9BK3MdQ8uk7y7OIvvb2Mo26AcXhB//K1gXWHZKW1V0XEhxwcFi/Grw7L2dEIcyxYX
	Cwaom7l2RMJTZaJqNaEdp2aAt15/r4/9V/mPAapLaSOqQ+2SmPf09CyP5C5g8kzZe8ap6iwCs+FRG
	S19Ba6sRYgLxrMMV2JBFEWFcrpTxnrpthDGb5dYx5Hu1AlpmrBsHhQaPMhYy3hvIbUL2rk8DzVGco
	17RSNwZDsDp7NuQh85JI2Xnb0Z54u6fPSPQC2GThyEYimTtMK0QJ5A4I/i+cJsxjb+D9k4wXmo00a
	Dwur3LBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u55zW-0000000AKPJ-0Jbh;
	Wed, 16 Apr 2025 16:52:02 +0000
Received: from mail-ej1-x64a.google.com ([2a00:1450:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u55K6-0000000ABvl-3D2n
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 16:09:16 +0000
Received: by mail-ej1-x64a.google.com with SMTP id a640c23a62f3a-ac3d175fe71so474698366b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Apr 2025 09:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744819753; x=1745424553; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=o7DwcRfwYwPR3lOoszfjZJQ8USmI21/b/JDlDzaI3Rk=;
        b=XtUT53QtqafmIIpn0LMN1ArDPRXMWWTpCqNFlZTjbCFKh3evMs7AIzKxKxEcOpkDpF
         TZI5o9Q6Um09JwJUCnhem8KCexVSI3dxG4QhGD1XdCyFNJRXxvNjKY95HvuUz6J/7viL
         680x7IxsmXsphuJqLofLOZRD/jm0R2A4D1CDK+bZ1o1ZivetPMur/vz4HRW0COMehZa3
         sLhhtOoCtZZQK2S7blPpDu8TGP9Csr2iGcuRwtfORhtW2xGoL69SghGidp05uURKv6gu
         WRDgCz71gCTkOss6EpvEp5RIYvdO5Jh/60+s9RNxkStF0ajueT6r8BMV6X38DpcAUiaM
         MWXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744819753; x=1745424553;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o7DwcRfwYwPR3lOoszfjZJQ8USmI21/b/JDlDzaI3Rk=;
        b=PxRsTLOBkUj9juuRwTuWXdbxNu1xTIwVHwf4EUdmQwDsYgAWWSybHPH+WWNL7EwjAr
         OnY/KMGKCNG2RknL2NixB6P6XbACodMlF7QTfLXWTmuLd9lXOQzDF8GhJWt5bZhmRgGW
         9TUB4JTAuiNdZ4wWt2l7gnxpV6/qzMPQpRXlB3i82Rd9ojw/0HfyA/C+p66P/7Cfmcol
         Xcj6G2Up7FP5hOKSJOgzf3gYzwJuDjG9w7RMWGNE3r5bVUM/XsaChU4y+UpOm9qOgWEt
         nmLmTd+Go7tKCtL/9cGVQLjs3NpMd6MOSukL6jMrx56fuMLyAKbeJEjfU1TQ7Znnc5cG
         67Ew==
X-Forwarded-Encrypted: i=1; AJvYcCXF3ShDB6Y8f8T9iTr9ZAT5jwwl6w0CWVq44GR6I91zDhNJNbiARZvSmFu55145ElCxVvQ+/KveCdND1KrYc+tk@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0mv7z2hXrnnyHvm/1E1z89F5qLkZmv1Dg/yiYXgTbQ0thTzlI
	LymHxWmKOcsiuZUh5TMhR58dfVTrbDzRUivGm3YR9xsmIs2+Q19opDKcwV7ZiwvHg9+O1guBK7q
	sk2DtGQ==
X-Google-Smtp-Source: AGHT+IEwA7qflYoiDn9H27dpBiFGe6SdivaSu7w3Um8NapHX8djDr1ytd9Hav23fIHauqobhXm8GW66CUx/Y
X-Received: from ejbml21.prod.google.com ([2002:a17:906:cc15:b0:acb:205e:e0ad])
 (user=qperret job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:2da5:b0:ac2:e748:9f1c
 with SMTP id a640c23a62f3a-acb429e6f1cmr234278666b.33.1744819752696; Wed, 16
 Apr 2025 09:09:12 -0700 (PDT)
Date: Wed, 16 Apr 2025 16:09:00 +0000
In-Reply-To: <20250416160900.3078417-1-qperret@google.com>
Mime-Version: 1.0
References: <20250416160900.3078417-1-qperret@google.com>
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
Message-ID: <20250416160900.3078417-5-qperret@google.com>
Subject: [PATCH v3 4/4] KVM: arm64: Extend pKVM selftest for np-guests
From: Quentin Perret <qperret@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>
Cc: Quentin Perret <qperret@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_090914_809791_05716366 
X-CRM114-Status: GOOD (  20.14  )
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
index abd693ce5b93..d91bfcf2db56 100644
--- a/arch/arm64/include/asm/kvm_pkvm.h
+++ b/arch/arm64/include/asm/kvm_pkvm.h
@@ -135,6 +135,12 @@ static inline unsigned long host_s2_pgtable_pages(void)
 	return res;
 }
 
+#ifdef CONFIG_NVHE_EL2_DEBUG
+static inline unsigned long pkvm_selftest_pages(void) { return 32; }
+#else
+static inline unsigned long pkvm_selftest_pages(void) { return 0; }
+#endif
+
 #define KVM_FFA_MBOX_NR_PAGES	1
 
 static inline unsigned long hyp_ffa_proxy_pages(void)
diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
index 535722cd8417..26016eb9323f 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
@@ -69,8 +69,8 @@ static __always_inline void __load_host_stage2(void)
 }
 
 #ifdef CONFIG_NVHE_EL2_DEBUG
-void pkvm_ownership_selftest(void);
+void pkvm_ownership_selftest(void *base);
 #else
-static inline void pkvm_ownership_selftest(void) { }
+static inline void pkvm_ownership_selftest(void *base) { }
 #endif
 #endif /* __KVM_NVHE_MEM_PROTECT__ */
diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 1912cc22c987..31173c694695 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -1097,16 +1097,60 @@ int __pkvm_host_mkyoung_guest(u64 gfn, struct pkvm_hyp_vcpu *vcpu)
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
@@ -1115,6 +1159,11 @@ static void assert_page_state(void)
 	hyp_lock_component();
 	WARN_ON(__hyp_check_page_state_range(phys, size, selftest_state.hyp));
 	hyp_unlock_component();
+
+	guest_lock_component(&selftest_vm);
+	WARN_ON(__guest_check_page_state_range(vcpu, ipa[0], size, selftest_state.guest[0]));
+	WARN_ON(__guest_check_page_state_range(vcpu, ipa[1], size, selftest_state.guest[1]));
+	guest_unlock_component(&selftest_vm);
 }
 
 #define assert_transition_res(res, fn, ...)		\
@@ -1123,21 +1172,27 @@ static void assert_page_state(void)
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
@@ -1145,6 +1200,8 @@ void pkvm_ownership_selftest(void)
 	assert_transition_res(-EPERM,	__pkvm_host_share_ffa, pfn, 1);
 	assert_transition_res(-EPERM,	__pkvm_host_unshare_ffa, pfn, 1);
 	assert_transition_res(-EPERM,	hyp_pin_shared_mem, virt, virt + size);
+	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, vcpu, prot);
+	assert_transition_res(-ENOENT,	__pkvm_host_unshare_guest, gfn, vm);
 
 	selftest_state.host = PKVM_PAGE_OWNED;
 	selftest_state.hyp = PKVM_NOPAGE;
@@ -1152,6 +1209,7 @@ void pkvm_ownership_selftest(void)
 	assert_transition_res(-EPERM,	__pkvm_hyp_donate_host, pfn, 1);
 	assert_transition_res(-EPERM,	__pkvm_host_unshare_hyp, pfn);
 	assert_transition_res(-EPERM,	__pkvm_host_unshare_ffa, pfn, 1);
+	assert_transition_res(-ENOENT,	__pkvm_host_unshare_guest, gfn, vm);
 	assert_transition_res(-EPERM,	hyp_pin_shared_mem, virt, virt + size);
 
 	selftest_state.host = PKVM_PAGE_SHARED_OWNED;
@@ -1161,6 +1219,8 @@ void pkvm_ownership_selftest(void)
 	assert_transition_res(-EPERM,	__pkvm_host_donate_hyp, pfn, 1);
 	assert_transition_res(-EPERM,	__pkvm_host_share_ffa, pfn, 1);
 	assert_transition_res(-EPERM,	__pkvm_hyp_donate_host, pfn, 1);
+	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, vcpu, prot);
+	assert_transition_res(-ENOENT,	__pkvm_host_unshare_guest, gfn, vm);
 
 	assert_transition_res(0,	hyp_pin_shared_mem, virt, virt + size);
 	assert_transition_res(0,	hyp_pin_shared_mem, virt, virt + size);
@@ -1171,6 +1231,8 @@ void pkvm_ownership_selftest(void)
 	assert_transition_res(-EPERM,	__pkvm_host_donate_hyp, pfn, 1);
 	assert_transition_res(-EPERM,	__pkvm_host_share_ffa, pfn, 1);
 	assert_transition_res(-EPERM,	__pkvm_hyp_donate_host, pfn, 1);
+	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, vcpu, prot);
+	assert_transition_res(-ENOENT,	__pkvm_host_unshare_guest, gfn, vm);
 
 	hyp_unpin_shared_mem(virt, virt + size);
 	assert_page_state();
@@ -1188,6 +1250,8 @@ void pkvm_ownership_selftest(void)
 	assert_transition_res(-EPERM,	__pkvm_host_share_hyp, pfn);
 	assert_transition_res(-EPERM,	__pkvm_host_unshare_hyp, pfn);
 	assert_transition_res(-EPERM,	__pkvm_hyp_donate_host, pfn, 1);
+	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, vcpu, prot);
+	assert_transition_res(-ENOENT,	__pkvm_host_unshare_guest, gfn, vm);
 	assert_transition_res(-EPERM,	hyp_pin_shared_mem, virt, virt + size);
 
 	selftest_state.host = PKVM_PAGE_OWNED;
@@ -1195,6 +1259,28 @@ void pkvm_ownership_selftest(void)
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
index 47294134cf1b..6d513a4b3763 100644
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
@@ -313,7 +319,7 @@ void __noreturn __pkvm_init_finalise(void)
 
 	pkvm_hyp_vm_table_init(vm_table_base);
 
-	pkvm_ownership_selftest();
+	pkvm_ownership_selftest(selftest_base);
 out:
 	/*
 	 * We tail-called to here from handle___pkvm_init() and will not return,
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index c462140e640a..f4761a479280 100644
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
2.49.0.604.gff1f9ca942-goog


