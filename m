Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03D6CE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 18:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L+LjFzCv5XYw4tM5gP6caUnlYbp8EBUjRNr5pJmRWzY=; b=NseCc3z/Fnpci4mBauyjzrOOdk
	Ic/AkuN++/KEvVDiNcKIFdsZC8AaX62MNG4/jY1+uYU8scJ6PBL3ZRbwn9bceUQ/r0+AQDK1U4A6O
	8kRxICljSdwoGFNucH8GaFNwkrHXhGYk/EEAY/SkT7oM0wPQjSyFvsajvrACw5Apv1bFJzfruAxid
	tfJfnaif0Tc1N1hv1j/hbkx8XuVnmA8ZtxBHVle/Gv7L/A4KOapcLSxrChSf4H0JLMSWBdn5+WEF4
	cQwUaDhUUq6fWynoBnhv96sgYEb6yvsKgIj6XggJN66OH/MJnoIVxZ+ItTjqLnIiYJwqtUWwZfm7Q
	5xyubo5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNFaQ-0000000Av8h-3WwS;
	Mon, 16 Dec 2024 18:12:54 +0000
Received: from mail-ed1-x549.google.com ([2a00:1450:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNFMU-0000000Ar1x-1f4j
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 17:58:31 +0000
Received: by mail-ed1-x549.google.com with SMTP id 4fb4d7f45d1cf-5d3c284eba0so6275784a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Dec 2024 09:58:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734371909; x=1734976709; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=L+LjFzCv5XYw4tM5gP6caUnlYbp8EBUjRNr5pJmRWzY=;
        b=PEgHBThpH4eq6NF8J5/SfdviKcdi7N4d69xCutZNSmFGdu6FtlljEoTL5qLfo3cBDY
         Yxx8DIJNXrTkfhcMqwyVBKAqsK1MtLK5glHn7nlWRy9JocoIbcMIOaBUCJ1iMHWgSnCF
         mdQA54YIyBL44V1iBxDl3SVgJ183YY8cLHm81bby5JmtKClegaPLEFgdYwFxwnVDSRL6
         RUAFUO191nucE6RMuujItfIlYi1jmRemUfJfvYh25xJlFT+5mEHA8v858IHmVDsIrb5L
         NlFhVJxn95mHKvkMKcqqixMeYYQZG2qdr1I4aBoBLGkbc7VDOhwzks2PDx4xHwicmSZF
         xLaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734371909; x=1734976709;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L+LjFzCv5XYw4tM5gP6caUnlYbp8EBUjRNr5pJmRWzY=;
        b=J+gL8p+DVPoXESL3AFu8CU2RY67FsNkj7qCe/QZDWyQkKaMbaFX8E5uH4Rx2j7+BOq
         zxHwtoio0JxWU311aS5BNNXsaO1NF3NItnwXqHyEdzI+iLdLtzNn3bsWF37n9Uc5O6bh
         GEIcQ1XRnNLZC/veFBNzliOl2Qc5eYSYCZRF+SYWEU2mjzp3zlzuwgJcjkOAMjiSoRzH
         szcj0SPVpStL55Q+PivOgc66ROLRCC+j8AN7PswSEm2u1EE/N3s29T4T29NCDxLrFewG
         wRRzAMXq3R79dCxKmQ2lRHv01JcTON1r24xw5GUrbOp9DeTs13EFIGmFCYwU5274UjS+
         cx7g==
X-Forwarded-Encrypted: i=1; AJvYcCXACKWvm/7rlkWNmSHDGcrHb8PW9mZkuMzgV8w9T1vzaB/eIqoh1MAtmAX5oBWEcHdvvRWoHYgyXFy3CX5g4Pxx@lists.infradead.org
X-Gm-Message-State: AOJu0YzBppJx7dBc3aSjkSMHSWaDaa1Hawgp71b7udlsstMs0oX67tbd
	5u3aNNwLlyYDR/Hjfk7K6VBJ/k3eneiNSgyzmyYPc3w2TFB+FyMv+IjukIN5Cd41U1HG7jZ6mr/
	wM+C1hA==
X-Google-Smtp-Source: AGHT+IHCZhqHC8extjwLovPgFG/ljnTta5VOSeafMIM6PQ2NYnnk/wOQzU+5RyPYu2VdpKxPmvEc7HcAA2bA
X-Received: from edben9.prod.google.com ([2002:a05:6402:5289:b0:5cf:dcd3:49a1])
 (user=qperret job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:13ce:b0:5d3:ba42:ea03
 with SMTP id 4fb4d7f45d1cf-5d63c30ad8emr13380104a12.8.1734371908844; Mon, 16
 Dec 2024 09:58:28 -0800 (PST)
Date: Mon, 16 Dec 2024 17:57:56 +0000
In-Reply-To: <20241216175803.2716565-1-qperret@google.com>
Mime-Version: 1.0
References: <20241216175803.2716565-1-qperret@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241216175803.2716565-12-qperret@google.com>
Subject: [PATCH v3 11/18] KVM: arm64: Introduce __pkvm_host_unshare_guest()
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
X-CRM114-CacheID: sfid-20241216_095830_445534_002B2CD9 
X-CRM114-Status: GOOD (  14.45  )
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
 arch/arm64/kvm/hyp/include/nvhe/pkvm.h        |  6 ++
 arch/arm64/kvm/hyp/nvhe/hyp-main.c            | 21 ++++++
 arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 67 +++++++++++++++++++
 arch/arm64/kvm/hyp/nvhe/pkvm.c                | 12 ++++
 6 files changed, 108 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
index 449337f5b2a3..0b6c4d325134 100644
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
index be52c5b15e21..0cc2a429f1fb 100644
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
@@ -78,6 +83,7 @@ void pkvm_put_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu);
 struct pkvm_hyp_vcpu *pkvm_get_loaded_hyp_vcpu(void);
 
 struct pkvm_hyp_vm *get_pkvm_hyp_vm(pkvm_handle_t handle);
+struct pkvm_hyp_vm *get_np_pkvm_hyp_vm(pkvm_handle_t handle);
 void put_pkvm_hyp_vm(struct pkvm_hyp_vm *hyp_vm);
 
 #endif /* __ARM64_KVM_NVHE_PKVM_H__ */
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index d659462fbf5d..3c3a27c985a2 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -244,6 +244,26 @@ static void handle___pkvm_host_share_guest(struct kvm_cpu_context *host_ctxt)
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
+	hyp_vm = get_np_pkvm_hyp_vm(handle);
+	if (!hyp_vm)
+		goto out;
+
+	ret = __pkvm_host_unshare_guest(gfn, hyp_vm);
+	put_pkvm_hyp_vm(hyp_vm);
+out:
+	cpu_reg(host_ctxt, 1) =  ret;
+}
+
 static void handle___kvm_adjust_pc(struct kvm_cpu_context *host_ctxt)
 {
 	DECLARE_REG(struct kvm_vcpu *, vcpu, host_ctxt, 1);
@@ -454,6 +474,7 @@ static const hcall_t host_hcall[] = {
 	HANDLE_FUNC(__pkvm_host_share_hyp),
 	HANDLE_FUNC(__pkvm_host_unshare_hyp),
 	HANDLE_FUNC(__pkvm_host_share_guest),
+	HANDLE_FUNC(__pkvm_host_unshare_guest),
 	HANDLE_FUNC(__kvm_adjust_pc),
 	HANDLE_FUNC(__kvm_vcpu_run),
 	HANDLE_FUNC(__kvm_flush_vm_context),
diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index fb9592e721cf..30243b7922f1 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -1421,3 +1421,70 @@ int __pkvm_host_share_guest(u64 pfn, u64 gfn, struct pkvm_hyp_vcpu *vcpu,
 
 	return ret;
 }
+
+static int __check_host_shared_guest(struct pkvm_hyp_vm *vm, u64 *__phys, u64 ipa)
+{
+	enum pkvm_page_state state;
+	struct hyp_page *page;
+	kvm_pte_t pte;
+	u64 phys;
+	s8 level;
+	int ret;
+
+	ret = kvm_pgtable_get_leaf(&vm->pgt, ipa, &pte, &level);
+	if (ret)
+		return ret;
+	if (level != KVM_PGTABLE_LAST_LEVEL)
+		return -E2BIG;
+	if (!kvm_pte_valid(pte))
+		return -ENOENT;
+
+	state = guest_get_page_state(pte, ipa);
+	if (state != PKVM_PAGE_SHARED_BORROWED)
+		return -EPERM;
+
+	phys = kvm_pte_to_phys(pte);
+	ret = check_range_allowed_memory(phys, phys + PAGE_SIZE);
+	if (WARN_ON(ret))
+		return ret;
+
+	page = hyp_phys_to_page(phys);
+	if (page->host_state != PKVM_PAGE_SHARED_OWNED)
+		return -EPERM;
+	if (WARN_ON(!page->host_share_guest_count))
+		return -EINVAL;
+
+	*__phys = phys;
+
+	return 0;
+}
+
+int __pkvm_host_unshare_guest(u64 gfn, struct pkvm_hyp_vm *vm)
+{
+	u64 ipa = hyp_pfn_to_phys(gfn);
+	struct hyp_page *page;
+	u64 phys;
+	int ret;
+
+	host_lock_component();
+	guest_lock_component(vm);
+
+	ret = __check_host_shared_guest(vm, &phys, ipa);
+	if (ret)
+		goto unlock;
+
+	ret = kvm_pgtable_stage2_unmap(&vm->pgt, ipa, PAGE_SIZE);
+	if (ret)
+		goto unlock;
+
+	page = hyp_phys_to_page(phys);
+	page->host_share_guest_count--;
+	if (!page->host_share_guest_count)
+		WARN_ON(__host_set_page_state_range(phys, PAGE_SIZE, PKVM_PAGE_OWNED));
+
+unlock:
+	guest_unlock_component(vm);
+	host_unlock_component();
+
+	return ret;
+}
diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index f2e363fe6b84..1b0982fa5ba8 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -376,6 +376,18 @@ void put_pkvm_hyp_vm(struct pkvm_hyp_vm *hyp_vm)
 	hyp_spin_unlock(&vm_table_lock);
 }
 
+struct pkvm_hyp_vm *get_np_pkvm_hyp_vm(pkvm_handle_t handle)
+{
+	struct pkvm_hyp_vm *hyp_vm = get_pkvm_hyp_vm(handle);
+
+	if (hyp_vm && pkvm_hyp_vm_is_protected(hyp_vm)) {
+		put_pkvm_hyp_vm(hyp_vm);
+		hyp_vm = NULL;
+	}
+
+	return hyp_vm;
+}
+
 static void pkvm_init_features_from_host(struct pkvm_hyp_vm *hyp_vm, const struct kvm *host_kvm)
 {
 	struct kvm *kvm = &hyp_vm->kvm;
-- 
2.47.1.613.gc27f4b7a9f-goog


