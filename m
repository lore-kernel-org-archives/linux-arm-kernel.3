Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0321D132CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 13:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VRegJK0d/KTMFa1b8xxTA9sCjP756MDWGX2tZ8RiT/M=; b=zHYlcmM13raok9voXs+joMJjAc
	8lsyNpUJIIuippcQTquMXw/QcIwJd/8ZjmYlQ0tg6zO/rLw3TGq+5flZdP77LeO6x883eofs/uceu
	5ArukpHe0Z4mhKm8ikguC0/kWch7MZ28ip6cUD3CX/E+YM72B0MfUlfXaCu6ugOv015FbOO+N/r8O
	2SxgMRhH3jhj8yB4u142uSsn3BTUS6H9Cwoa0tqB+6OLSa4s4jb0BwWlfODdjnAOgthfRC0B/0nSN
	kRsyxsnBi1OTqt+NBsYcpKgG+Lh8Tvk7rEL+USHeEYT7L3TeBDx08ZG3JMTXGqO7kjCrylNWFhLVD
	cMjUfDcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7xcJ-0000000Dy8r-1Czp;
	Mon, 04 Nov 2024 13:59:39 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7xC8-0000000DsP0-1ZiA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 13:32:37 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-e2904d0cad0so7677696276.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Nov 2024 05:32:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730727155; x=1731331955; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=VRegJK0d/KTMFa1b8xxTA9sCjP756MDWGX2tZ8RiT/M=;
        b=SQexZvqd3scLH66iEeXtJhu9a2TtFZLEGuqUd0BodBDYnsBQPHGKRcRzWfXNtc2A9F
         2l1Gt4PjfJ1wTR7h6RuyZGii4SlpJXowm40EFfpbwC0AjhLC0dRBPxoRbhNNyLllUsws
         oU93GOg4PynT5/8aHoB1zUypjQE2N9sVfkNkXWPxTFbTcytZASDLh85I9KDS/VrS7Pjd
         3o+2ctVRCq9LT67vzGqgWT3kikYKn7cGVvx7BNvWGkq/bldiGz4ap4Dzk+wiZ86DfMNm
         wpED3Z2rDp2TuBwmxeZCzQwcoTf1YbdS62bOXOQLV/X+PBja/+oTRYkKbLvMhrUPeyIJ
         yKnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730727155; x=1731331955;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VRegJK0d/KTMFa1b8xxTA9sCjP756MDWGX2tZ8RiT/M=;
        b=bGXU2YDDc2mruEbRFQGcPnbj6gsB0yn2s6ZD1wGcyijCM22PQmTxRszot6axsqBYQn
         E51cYJ2Y3qqDU4UP/yUgnjZbnCIqVYRw7Gs8pssIXQqRBcWT4qW08JTQozqMMAvg3UW5
         BK/PlHtlkaZhRjVUV3oroUkU86iKyj+Eo2oPmMBlbLlZWirYf6OxEy3LVIBFECU2rCPS
         cJBP2Foma5CX7zr/3+1Mx374lJBPoEGBKNw0eyMkP/vcE8oKtBgc9RZKwhk9S4pQ5Gr+
         KKGDFykOfp0CuS47FPPPiuduY+lX41FehM91SV7b8jC0AEUNwPDiu4E5sRQc1+1v9EEv
         5n0g==
X-Forwarded-Encrypted: i=1; AJvYcCWHX7Y5l0dqfIUYx6HDb1gRo7ARqmYXLjGlZ/NclNwZma7VfJhB+1zZoCg1Ve7YVxzf1BX8polcX2YtRW285s4q@lists.infradead.org
X-Gm-Message-State: AOJu0YwF+8Bl5Sw6p9uyuRr4PK87M5KgF3jOKAxcS9Q08XqOzCptBwCV
	0KiLNvhTEVUmTosAgSxRdI66fbTsDbKAb5JgaUzcZ6fLa3HkALcSODHWwvxZZdYi8T+khrw6MK4
	QUsUErQ==
X-Google-Smtp-Source: AGHT+IGR8bsfJ02p9vHy+seXY+BmxTKO7YUK2HiE8eFkkm9wUjhjecldaQfmnnOt9C+IS5sr/2xmgAJlbcZ8
X-Received: from big-boi.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:129])
 (user=qperret job=sendgmr) by 2002:a25:c710:0:b0:e30:d61e:b110 with SMTP id
 3f1490d57ef6-e33025662cdmr10816276.5.1730727154895; Mon, 04 Nov 2024 05:32:34
 -0800 (PST)
Date: Mon,  4 Nov 2024 13:31:57 +0000
In-Reply-To: <20241104133204.85208-1-qperret@google.com>
Mime-Version: 1.0
References: <20241104133204.85208-1-qperret@google.com>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
Message-ID: <20241104133204.85208-12-qperret@google.com>
Subject: [PATCH 11/18] KVM: arm64: Introduce __pkvm_host_unshare_guest()
From: Quentin Perret <qperret@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>
Cc: Fuad Tabba <tabba@google.com>, Vincent Donnefort <vdonnefort@google.com>, 
	Sebastian Ene <sebastianene@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_053236_440575_C0383B82 
X-CRM114-Status: GOOD (  13.64  )
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

In preparation for letting the host unmap pages from non-protected
guests, introduce a new hypercall implementing the host-unshare-guest
transition.

Signed-off-by: Quentin Perret <qperret@google.com>
---
 arch/arm64/include/asm/kvm_asm.h              |  1 +
 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |  1 +
 arch/arm64/kvm/hyp/include/nvhe/pkvm.h        |  5 ++
 arch/arm64/kvm/hyp/nvhe/hyp-main.c            | 24 ++++++
 arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 78 +++++++++++++++++++
 5 files changed, 109 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
index b69390108c5a..e67efee936b6 100644
--- a/arch/arm64/include/asm/kvm_asm.h
+++ b/arch/arm64/include/asm/kvm_asm.h
@@ -66,6 +66,7 @@ enum __kvm_host_smccc_func {
 	__KVM_HOST_SMCCC_FUNC___pkvm_host_share_hyp,
 	__KVM_HOST_SMCCC_FUNC___pkvm_host_unshare_hyp,
 	__KVM_HOST_SMCCC_FUNC___pkvm_host_share_guest,
+	__KVM_HOST_SMCCC_FUNC___pkvm_host_unshare_guest,
 	__KVM_HOST_SMCCC_FUNC___kvm_adjust_pc,
 	__KVM_HOST_SMCCC_FUNC___kvm_vcpu_run,
 	__KVM_HOST_SMCCC_FUNC___kvm_flush_vm_context,
diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
index a7976e50f556..e528a42ed60e 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
@@ -40,6 +40,7 @@ int __pkvm_hyp_donate_host(u64 pfn, u64 nr_pages);
 int __pkvm_host_share_ffa(u64 pfn, u64 nr_pages);
 int __pkvm_host_unshare_ffa(u64 pfn, u64 nr_pages);
 int __pkvm_host_share_guest(u64 pfn, u64 gfn, struct pkvm_hyp_vcpu *vcpu, enum kvm_pgtable_prot prot);
+int __pkvm_host_unshare_guest(u64 gfn, struct pkvm_hyp_vm *hyp_vm);
 
 bool addr_is_memory(phys_addr_t phys);
 int host_stage2_idmap_locked(phys_addr_t addr, u64 size, enum kvm_pgtable_prot prot);
diff --git a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
index be52c5b15e21..5dfc9ece9aa5 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
@@ -64,6 +64,11 @@ static inline bool pkvm_hyp_vcpu_is_protected(struct pkvm_hyp_vcpu *hyp_vcpu)
 	return vcpu_is_protected(&hyp_vcpu->vcpu);
 }
 
+static inline bool pkvm_hyp_vm_is_protected(struct pkvm_hyp_vm *hyp_vm)
+{
+	return kvm_vm_is_protected(&hyp_vm->kvm);
+}
+
 void pkvm_hyp_vm_table_init(void *tbl);
 
 int __pkvm_init_vm(struct kvm *host_kvm, unsigned long vm_hva,
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 32bdf6b27958..68bbef69d99a 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -242,6 +242,29 @@ static void handle___pkvm_host_share_guest(struct kvm_cpu_context *host_ctxt)
 	cpu_reg(host_ctxt, 1) =  ret;
 }
 
+static void handle___pkvm_host_unshare_guest(struct kvm_cpu_context *host_ctxt)
+{
+	DECLARE_REG(pkvm_handle_t, handle, host_ctxt, 1);
+	DECLARE_REG(u64, gfn, host_ctxt, 2);
+	struct pkvm_hyp_vm *hyp_vm;
+	int ret = -EINVAL;
+
+	if (!is_protected_kvm_enabled())
+		goto out;
+
+	hyp_vm = get_pkvm_hyp_vm(handle);
+	if (!hyp_vm)
+		goto out;
+	if (pkvm_hyp_vm_is_protected(hyp_vm))
+		goto put_hyp_vm;
+
+	ret = __pkvm_host_unshare_guest(gfn, hyp_vm);
+put_hyp_vm:
+	put_pkvm_hyp_vm(hyp_vm);
+out:
+	cpu_reg(host_ctxt, 1) =  ret;
+}
+
 static void handle___kvm_adjust_pc(struct kvm_cpu_context *host_ctxt)
 {
 	DECLARE_REG(struct kvm_vcpu *, vcpu, host_ctxt, 1);
@@ -459,6 +482,7 @@ static const hcall_t host_hcall[] = {
 	HANDLE_FUNC(__pkvm_host_share_hyp),
 	HANDLE_FUNC(__pkvm_host_unshare_hyp),
 	HANDLE_FUNC(__pkvm_host_share_guest),
+	HANDLE_FUNC(__pkvm_host_unshare_guest),
 	HANDLE_FUNC(__kvm_adjust_pc),
 	HANDLE_FUNC(__kvm_vcpu_run),
 	HANDLE_FUNC(__kvm_flush_vm_context),
diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index a69d7212b64c..f7476a29e1a9 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -1413,3 +1413,81 @@ int __pkvm_host_share_guest(u64 pfn, u64 gfn, struct pkvm_hyp_vcpu *vcpu,
 
 	return ret;
 }
+
+static int guest_get_valid_pte(struct pkvm_hyp_vm *vm, u64 *phys, u64 ipa, u8 order, kvm_pte_t *pte)
+{
+	size_t size = PAGE_SIZE << order;
+	s8 level;
+
+	if (order && size != PMD_SIZE)
+		return -EINVAL;
+
+	WARN_ON(kvm_pgtable_get_leaf(&vm->pgt, ipa, pte, &level));
+
+	if (kvm_granule_size(level) != size)
+		return -E2BIG;
+
+	if (!kvm_pte_valid(*pte))
+		return -ENOENT;
+
+	*phys = kvm_pte_to_phys(*pte);
+
+	return 0;
+}
+
+static int __check_host_unshare_guest(struct pkvm_hyp_vm *vm, u64 *phys, u64 ipa)
+{
+	enum pkvm_page_state state;
+	struct hyp_page *page;
+	kvm_pte_t pte;
+	int ret;
+
+	ret = guest_get_valid_pte(vm, phys, ipa, 0, &pte);
+	if (ret)
+		return ret;
+
+	state = guest_get_page_state(pte, ipa);
+	if (state != PKVM_PAGE_SHARED_BORROWED)
+		return -EPERM;
+
+	ret = range_is_allowed_memory(*phys, *phys + PAGE_SIZE);
+	if (ret)
+		return ret;
+
+	page = hyp_phys_to_page(*phys);
+	if (page->host_state != PKVM_PAGE_SHARED_OWNED)
+		return -EPERM;
+	WARN_ON(!page->host_share_guest_count);
+
+	return 0;
+}
+
+int __pkvm_host_unshare_guest(u64 gfn, struct pkvm_hyp_vm *hyp_vm)
+{
+	u64 ipa = hyp_pfn_to_phys(gfn);
+	struct hyp_page *page;
+	u64 phys;
+	int ret;
+
+	host_lock_component();
+	guest_lock_component(hyp_vm);
+
+	ret = __check_host_unshare_guest(hyp_vm, &phys, ipa);
+	if (ret)
+		goto unlock;
+
+	ret = kvm_pgtable_stage2_unmap(&hyp_vm->pgt, ipa, PAGE_SIZE);
+	if (ret)
+		goto unlock;
+
+	page = hyp_phys_to_page(phys);
+	page->host_share_guest_count--;
+	if (!page->host_share_guest_count)
+		WARN_ON(__host_set_page_state_range(phys, PAGE_SIZE, PKVM_PAGE_OWNED));
+
+unlock:
+	guest_unlock_component(hyp_vm);
+	host_unlock_component();
+
+	return ret;
+}
-- 
2.47.0.163.g1226f6d8fa-goog


