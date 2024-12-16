Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A311E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 18:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gDq9DwaPgsqNr2tHpW+bdhvyfIZgJqiuY6uN4axqGiQ=; b=REokS6obywqQ41YEB2JbigJV3C
	bxYqDYAjuK9o4wGX+VXUlYMyYiiRlXlws28GAhefnPHiYKkB91fG38gKpe3aIvOyIQ38l9o/nZgv1
	L1YPLtP4BJo7ty1dh8o78FvyFDB8JvxMWgPL2sUPTNBWCb8XmQ9XP+P5PbytpV1avHuxRzhA2uJS3
	+lxMceCzw/ehwinmE1r1kP+xDsy6A6I4ExGuR2RWnuAYqbr6X4+8Hr7Antnc4ILr+KZW0/jJcMcFV
	4lCzGS82Bdgb30NX9h+N7jLAZ5FzZRaw++pgnlcdkui5vPX3HFd5u57t12j185YVQqzuPZBb7Ak+a
	3utP6ODw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNFcb-0000000Avdx-2mQa;
	Mon, 16 Dec 2024 18:15:09 +0000
Received: from mail-ej1-x64a.google.com ([2a00:1450:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNFMZ-0000000Ar3A-0DbH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 17:58:36 +0000
Received: by mail-ej1-x64a.google.com with SMTP id a640c23a62f3a-aa66f6ce6bfso145504766b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Dec 2024 09:58:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734371913; x=1734976713; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=gDq9DwaPgsqNr2tHpW+bdhvyfIZgJqiuY6uN4axqGiQ=;
        b=TIoo7NxBe6yL+0QO5/0n7Po0v40kJpPbVEaeYcTsAn9mp2ovP1MHaOUiFADG59KRPc
         3tGPbwbsNFX0LBWnZPLh+ZywLuRw/52IQwWrWAqtVmxo3/SwHYftAP+RJbjBKUr/1sNm
         dPManPBT6vWxM3BTcCwf8o2l9w63P+wJ0Gsud4SNjwgWszEIcq8mh4NIhNgjN1+uS15i
         hdPrnkcXYh206gbYt4hKPhLp8udSRufWMD9H5+gZ01VYCpcBbo/P/OOIsp9zxmDCbfiC
         pXvj10LV9799p+wzbVdIKuIjf+Dq7XeMDNYuYut7AT90uT2+DhhRx9nrG19/eO7gqPRT
         tz4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734371913; x=1734976713;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gDq9DwaPgsqNr2tHpW+bdhvyfIZgJqiuY6uN4axqGiQ=;
        b=RsrmwstTd0schkWH75ogGg4JP8Ug1H3UJheTfItGEYkJnUrfhdlXjvQSX423+9f3iR
         WvawM5GsPMeqUkRgaHAohyB6emYrXuDBNuSt9OTZISR4dGAe9r94AGDNFmU5r3eM31+e
         frAt1CqIL9f8gjul0beq2ldeA6SQ/b4fsl3JulGTJ9AOSNQ4DSJppglzcW9ePSLoozen
         jHNtxa4qHy4qC3VLLTpVM2If5A4PXImWI5u/vVPVqdBw+THyRgcPlBfYCnlnqIan9ILr
         d5XgWhbGl8sZK6LEfiSJR3haFzyYGEu+hUhvJPE9U0ohfDlAgIxflZl6ruas4UgQ8Qfb
         CjAQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2LGvkvmsboJTS3NPISnkXtKUy43bHzK8HkvBhcbwUCl9Cdg58Yl+GESdbSfATT64MxQcfuz1Akpat8EBhvMAi@lists.infradead.org
X-Gm-Message-State: AOJu0YxLbuz5hCiwYL1CKmJwcCcFMIp4Cutg7Rprk9L23VbIEm9GN9Cg
	x13iJdVmOJJfhIXiBTmIrsBlY6WYp5RR3Kg0loief1sj0X+k0m4b9MwQP06wqk3Y60efVMo4HyV
	QLDTNXg==
X-Google-Smtp-Source: AGHT+IHI3UoYT3X+iYsCFbInDPhwRbeEU1+XXddDdVe8vSqsWTG70vyDHz/YcjLxXIwMarrVkYcdz5XXC6so
X-Received: from edaq23.prod.google.com ([2002:a05:6402:2497:b0:5d1:229d:1ee5])
 (user=qperret job=prod-delivery.src-stubby-dispatcher) by 2002:a17:906:311a:b0:aab:70d3:af43
 with SMTP id a640c23a62f3a-aab779aae4cmr1377079866b.27.1734371912986; Mon, 16
 Dec 2024 09:58:32 -0800 (PST)
Date: Mon, 16 Dec 2024 17:57:58 +0000
In-Reply-To: <20241216175803.2716565-1-qperret@google.com>
Mime-Version: 1.0
References: <20241216175803.2716565-1-qperret@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241216175803.2716565-14-qperret@google.com>
Subject: [PATCH v3 13/18] KVM: arm64: Introduce __pkvm_host_wrprotect_guest()
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
X-CRM114-CacheID: sfid-20241216_095835_090486_CBE6DDBC 
X-CRM114-Status: GOOD (  11.60  )
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

Introduce a new hypercall to remove the write permission from a
non-protected guest stage-2 mapping. This will be used for e.g. enabling
dirty logging.

Signed-off-by: Quentin Perret <qperret@google.com>
---
 arch/arm64/include/asm/kvm_asm.h              |  1 +
 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |  1 +
 arch/arm64/kvm/hyp/nvhe/hyp-main.c            | 21 +++++++++++++++++++
 arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 19 +++++++++++++++++
 4 files changed, 42 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
index 66ee8542dcc9..8663a588cf34 100644
--- a/arch/arm64/include/asm/kvm_asm.h
+++ b/arch/arm64/include/asm/kvm_asm.h
@@ -68,6 +68,7 @@ enum __kvm_host_smccc_func {
 	__KVM_HOST_SMCCC_FUNC___pkvm_host_share_guest,
 	__KVM_HOST_SMCCC_FUNC___pkvm_host_unshare_guest,
 	__KVM_HOST_SMCCC_FUNC___pkvm_host_relax_perms_guest,
+	__KVM_HOST_SMCCC_FUNC___pkvm_host_wrprotect_guest,
 	__KVM_HOST_SMCCC_FUNC___kvm_adjust_pc,
 	__KVM_HOST_SMCCC_FUNC___kvm_vcpu_run,
 	__KVM_HOST_SMCCC_FUNC___kvm_flush_vm_context,
diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
index a308dcd3b5b8..fc9fdd5b0a52 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
@@ -42,6 +42,7 @@ int __pkvm_host_unshare_ffa(u64 pfn, u64 nr_pages);
 int __pkvm_host_share_guest(u64 pfn, u64 gfn, struct pkvm_hyp_vcpu *vcpu, enum kvm_pgtable_prot prot);
 int __pkvm_host_unshare_guest(u64 gfn, struct pkvm_hyp_vm *hyp_vm);
 int __pkvm_host_relax_perms_guest(u64 gfn, struct pkvm_hyp_vcpu *vcpu, enum kvm_pgtable_prot prot);
+int __pkvm_host_wrprotect_guest(u64 gfn, struct pkvm_hyp_vm *hyp_vm);
 
 bool addr_is_memory(phys_addr_t phys);
 int host_stage2_idmap_locked(phys_addr_t addr, u64 size, enum kvm_pgtable_prot prot);
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 287e4ee93ef2..98d317735107 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -283,6 +283,26 @@ static void handle___pkvm_host_relax_perms_guest(struct kvm_cpu_context *host_ct
 	cpu_reg(host_ctxt, 1) = ret;
 }
 
+static void handle___pkvm_host_wrprotect_guest(struct kvm_cpu_context *host_ctxt)
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
+	ret = __pkvm_host_wrprotect_guest(gfn, hyp_vm);
+	put_pkvm_hyp_vm(hyp_vm);
+out:
+	cpu_reg(host_ctxt, 1) = ret;
+}
+
 static void handle___kvm_adjust_pc(struct kvm_cpu_context *host_ctxt)
 {
 	DECLARE_REG(struct kvm_vcpu *, vcpu, host_ctxt, 1);
@@ -495,6 +515,7 @@ static const hcall_t host_hcall[] = {
 	HANDLE_FUNC(__pkvm_host_share_guest),
 	HANDLE_FUNC(__pkvm_host_unshare_guest),
 	HANDLE_FUNC(__pkvm_host_relax_perms_guest),
+	HANDLE_FUNC(__pkvm_host_wrprotect_guest),
 	HANDLE_FUNC(__kvm_adjust_pc),
 	HANDLE_FUNC(__kvm_vcpu_run),
 	HANDLE_FUNC(__kvm_flush_vm_context),
diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index aa8e0408aebb..94e4251b5077 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -1511,3 +1511,22 @@ int __pkvm_host_relax_perms_guest(u64 gfn, struct pkvm_hyp_vcpu *vcpu, enum kvm_
 
 	return ret;
 }
+
+int __pkvm_host_wrprotect_guest(u64 gfn, struct pkvm_hyp_vm *vm)
+{
+	u64 ipa = hyp_pfn_to_phys(gfn);
+	u64 phys;
+	int ret;
+
+	host_lock_component();
+	guest_lock_component(vm);
+
+	ret = __check_host_shared_guest(vm, &phys, ipa);
+	if (!ret)
+		ret = kvm_pgtable_stage2_wrprotect(&vm->pgt, ipa, PAGE_SIZE);
+
+	guest_unlock_component(vm);
+	host_unlock_component();
+
+	return ret;
+}
-- 
2.47.1.613.gc27f4b7a9f-goog


