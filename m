Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FD6CE77180
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 15:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PMyTiyNfmKdhDjVhUzsIJIaEqQor0TbKt2tHvDNxOCE=; b=fqM/ejlOSzWqQHzZPy6MrO1h9q
	WaBDhUpmMLc0ZnFwbjVeRde/9w/ft8wKDWu4EfdK+dv9oypeTD4FwOurXLDj1YbAp17K5mWwVKV6J
	MQTbIhBPVGv0P4jM9Ffpu/lnFzsZuJdEGqPGBeG9tC5F7IiQFLK90Q9D8NxR3UpaxEoDc5IdCmnPk
	Ng8FhKdogE0KRyvUvQjfZdKQS6xdA6sR57dMIUR5hawTe4iicCLOwP7YoZqcZtnzC8cO2CJ4MbtdP
	rU9KwwjJZl97wbJnMAVSHN+OKwT7wBkVGyV8ATuZVNCmo9IUNezTeEcMg5lQ5E4bkb7XpazgWkTRH
	HU5GA0+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL1vf-0000000BuGh-1uSW;
	Tue, 10 Dec 2024 15:13:39 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL1uZ-0000000Bu94-1XAx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 15:12:32 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-435b0df5dbdso40765e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Dec 2024 07:12:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733843550; x=1734448350; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PMyTiyNfmKdhDjVhUzsIJIaEqQor0TbKt2tHvDNxOCE=;
        b=oPhTl3LaqKhfGS1vNwZ32lyaMaqvW+65hM99UtUSNtRy5bLMaWG0dJMi4XUGo4h15k
         EHXorsuLlaTFr41G1QXuekOfs0uH7qT+eZj0e+uzzYtAlfjV+M672x1l9bdZQQ9kSRT8
         lb6wQ6s+ApxKg46CY3cEgV6LVTv+4ztXplw/d4f8XOAolgn+MIP2ZwcXd/82ppCAzkGS
         C79N+Y97SPcAeKdtMM90++e6On+pkpk0Dsm2sXHVMYT3dFq+zBkZT1H1AgaLQm0G8PYT
         tHGYrMo7PH+h5PuIW8fH95uhh4R0f5/JIe4VRa38Eu/TeIoWj0wQyaUD6XIjH8uVptf/
         yaLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733843550; x=1734448350;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PMyTiyNfmKdhDjVhUzsIJIaEqQor0TbKt2tHvDNxOCE=;
        b=EITNiE/ReZy+7E1egzEGeCxrGXbZ2d0kzkCRgWJf4oobEE/954yh92x9TKUpeEvvJm
         A1C8FpUHjuuzu1j/OHsj/1kcgcnskOkuK3lkz2qMXhOmH2LqWx4prLUMBB7b9M3fDns5
         9w1lB+Tw3vhCRWQDulNIuGJ5h6YtyF1h2RMs4DRAjQI+pHt2t1BkppM1JQTvZgyrUlIi
         9Csvu0d05jdtNhqIoAEq4CN7Bl9tFUE8/IJLABF/iviIqvWP6g/WyVLN0rCfmDqMtbsO
         jpKjiB4fpYOX3+wqdsO+ACET4MFSJUl5U0BJlB9d+r1hwkjgwHFVXHCwNaTfF511vMPv
         J5Gg==
X-Forwarded-Encrypted: i=1; AJvYcCUy5ZanPaZ4I5+ksomsdztdbmdlkw4hDLmXonBKMIU4ea02VRkqjfBr++5y9zbRarI+Zdl76W2nVw+vJDJ2iPvO@lists.infradead.org
X-Gm-Message-State: AOJu0YwvhUctujzMR4SqnsRKyr5snJVueQLXTzvX/G2I4p10QAE0LHj+
	a1xTZBGOJ6e1YJ/rIOtuq/KFZNsNQk/ueyLIeimGlVAQk4jQXOvU+SupG231I0v+LIccAkp5Nqh
	dRyrqDMv8oXqdaM+zzPxyw3Kp2VO1wT2sMRs+
X-Gm-Gg: ASbGncvTto+y6yghbnneSrq9pPB40lzqTbPg72hL1YgJ0C/jQZt2zI8f6mm2qTeA4jK
	/h0p9xV1nDM9HsgXSJ8OnZwYta55ZXsTq7hNcAojvAj9IPtk3wmgL2wyoNf4Cdq2w
X-Google-Smtp-Source: AGHT+IFHeRD8jtlR7tKAgJUTx/0YJEujzi94LrDfE3Tbouy+VcFbttMaIzZI3qcxqGjKUaoNiPtT/88hZA1vV3f/nHA=
X-Received: by 2002:a05:600c:4907:b0:434:f7fc:1b18 with SMTP id
 5b1f17b1804b1-435028ac13amr1349455e9.4.1733843549772; Tue, 10 Dec 2024
 07:12:29 -0800 (PST)
MIME-Version: 1.0
References: <20241203103735.2267589-1-qperret@google.com> <20241203103735.2267589-15-qperret@google.com>
In-Reply-To: <20241203103735.2267589-15-qperret@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 10 Dec 2024 15:11:53 +0000
Message-ID: <CA+EHjTwV2mXOXMF7u+pVaSqvJ2c-iPGMxPBhrj7oZrm+oaAi3A@mail.gmail.com>
Subject: Re: [PATCH v2 14/18] KVM: arm64: Introduce __pkvm_host_test_clear_young_guest()
To: Quentin Perret <qperret@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Vincent Donnefort <vdonnefort@google.com>, 
	Sebastian Ene <sebastianene@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_071231_405019_D10CCFEC 
X-CRM114-Status: GOOD (  19.87  )
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

Hi Quentin,

On Tue, 3 Dec 2024 at 10:38, Quentin Perret <qperret@google.com> wrote:
>
> Plumb the kvm_stage2_test_clear_young() callback into pKVM for
> non-protected guest. It will be later be called from MMU notifiers.
>
> Signed-off-by: Quentin Perret <qperret@google.com>
> ---
>  arch/arm64/include/asm/kvm_asm.h              |  1 +
>  arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |  1 +
>  arch/arm64/kvm/hyp/nvhe/hyp-main.c            | 25 +++++++++++++++++++
>  arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 19 ++++++++++++++
>  4 files changed, 46 insertions(+)
>
> diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
> index 4d7d20ea03df..cb676017d591 100644
> --- a/arch/arm64/include/asm/kvm_asm.h
> +++ b/arch/arm64/include/asm/kvm_asm.h
> @@ -69,6 +69,7 @@ enum __kvm_host_smccc_func {
>         __KVM_HOST_SMCCC_FUNC___pkvm_host_unshare_guest,
>         __KVM_HOST_SMCCC_FUNC___pkvm_host_relax_guest_perms,
>         __KVM_HOST_SMCCC_FUNC___pkvm_host_wrprotect_guest,
> +       __KVM_HOST_SMCCC_FUNC___pkvm_host_test_clear_young_guest,
>         __KVM_HOST_SMCCC_FUNC___kvm_adjust_pc,
>         __KVM_HOST_SMCCC_FUNC___kvm_vcpu_run,
>         __KVM_HOST_SMCCC_FUNC___kvm_flush_vm_context,
> diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> index 8658b5932473..554ce31882e6 100644
> --- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> +++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> @@ -43,6 +43,7 @@ int __pkvm_host_share_guest(u64 pfn, u64 gfn, struct pkvm_hyp_vcpu *vcpu, enum k
>  int __pkvm_host_unshare_guest(u64 gfn, struct pkvm_hyp_vm *hyp_vm);
>  int __pkvm_host_relax_guest_perms(u64 gfn, enum kvm_pgtable_prot prot, struct pkvm_hyp_vcpu *vcpu);
>  int __pkvm_host_wrprotect_guest(u64 gfn, struct pkvm_hyp_vm *hyp_vm);
> +int __pkvm_host_test_clear_young_guest(u64 gfn, bool mkold, struct pkvm_hyp_vm *vm);

While I'm piling on the function names/parameters, some functions have
_guest as a postfix at the end (e.g., this one), others have it in the
middle (__pkvm_host_relax_guest_perms). I guess
__pkvm_host_relax_guest_perms is the odd one out. Could you rename it?

Cheers,
/fuad


>  bool addr_is_memory(phys_addr_t phys);
>  int host_stage2_idmap_locked(phys_addr_t addr, u64 size, enum kvm_pgtable_prot prot);
> diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> index 3feaf2119e51..67cb6e284180 100644
> --- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> +++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> @@ -309,6 +309,30 @@ static void handle___pkvm_host_wrprotect_guest(struct kvm_cpu_context *host_ctxt
>         cpu_reg(host_ctxt, 1) = ret;
>  }
>
> +static void handle___pkvm_host_test_clear_young_guest(struct kvm_cpu_context *host_ctxt)
> +{
> +       DECLARE_REG(pkvm_handle_t, handle, host_ctxt, 1);
> +       DECLARE_REG(u64, gfn, host_ctxt, 2);
> +       DECLARE_REG(bool, mkold, host_ctxt, 3);
> +       struct pkvm_hyp_vm *hyp_vm;
> +       int ret = -EINVAL;
> +
> +       if (!is_protected_kvm_enabled())
> +               goto out;
> +
> +       hyp_vm = get_pkvm_hyp_vm(handle);
> +       if (!hyp_vm)
> +               goto out;
> +       if (pkvm_hyp_vm_is_protected(hyp_vm))
> +               goto put_hyp_vm;
> +
> +       ret = __pkvm_host_test_clear_young_guest(gfn, mkold, hyp_vm);
> +put_hyp_vm:
> +       put_pkvm_hyp_vm(hyp_vm);
> +out:
> +       cpu_reg(host_ctxt, 1) = ret;
> +}
> +
>  static void handle___kvm_adjust_pc(struct kvm_cpu_context *host_ctxt)
>  {
>         DECLARE_REG(struct kvm_vcpu *, vcpu, host_ctxt, 1);
> @@ -522,6 +546,7 @@ static const hcall_t host_hcall[] = {
>         HANDLE_FUNC(__pkvm_host_unshare_guest),
>         HANDLE_FUNC(__pkvm_host_relax_guest_perms),
>         HANDLE_FUNC(__pkvm_host_wrprotect_guest),
> +       HANDLE_FUNC(__pkvm_host_test_clear_young_guest),
>         HANDLE_FUNC(__kvm_adjust_pc),
>         HANDLE_FUNC(__kvm_vcpu_run),
>         HANDLE_FUNC(__kvm_flush_vm_context),
> diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> index 89312d7cde2a..0e064a7ed7c4 100644
> --- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> +++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> @@ -1522,3 +1522,22 @@ int __pkvm_host_wrprotect_guest(u64 gfn, struct pkvm_hyp_vm *vm)
>
>         return ret;
>  }
> +
> +int __pkvm_host_test_clear_young_guest(u64 gfn, bool mkold, struct pkvm_hyp_vm *vm)
> +{
> +       u64 ipa = hyp_pfn_to_phys(gfn);
> +       u64 phys;
> +       int ret;
> +
> +       host_lock_component();
> +       guest_lock_component(vm);
> +
> +       ret = __check_host_unshare_guest(vm, &phys, ipa);
> +       if (!ret)
> +               ret = kvm_pgtable_stage2_test_clear_young(&vm->pgt, ipa, PAGE_SIZE, mkold);
> +
> +       guest_unlock_component(vm);
> +       host_unlock_component();
> +
> +       return ret;
> +}
> --
> 2.47.0.338.g60cca15819-goog
>

