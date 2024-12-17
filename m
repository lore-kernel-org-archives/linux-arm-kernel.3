Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D344E7716A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 09:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2tNKY/TlgAJZwECcpDjiOAux1C82BMpjuzg6Q/icr8Q=; b=Ko4hOMLuNr/uBxrsTdaKDhPGQM
	85xpHC1lqjmy36PxHVy8gde9oJogS0l3wJT5gXVZREIcYJ2VtRVCwEzsimjmu5JBZsn5pFu/csPwF
	5RG9qaMcUNDNNclatZgEKAwsv1ZRxAbFT0jO01hOSuInEM/D2Ro4cpKVA1YCRdSuKMaKh9N45jLeG
	ZPYIAOmUG6+Xqg25T3igfHpOytSaMDPtvAtMdbgkZxHroSz/upwRIqEG4/cOCKynrSyirSR1MDsvy
	vaeepVmansJOYATQks/XNbxhtN28jgUhCPWo5aq7xfV4a7HD7DYLQ/otxQYMFZ3x3vRIAuKVDundV
	QqhR4TYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNTZk-0000000CqMO-0piR;
	Tue, 17 Dec 2024 09:09:08 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNTOJ-0000000Cnh2-00On
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 08:57:20 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-435b0df5dbdso39635e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Dec 2024 00:57:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734425837; x=1735030637; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2tNKY/TlgAJZwECcpDjiOAux1C82BMpjuzg6Q/icr8Q=;
        b=Hk5B2NZ1nXokb2iaGXAHE7IrQK0cNHfLyMne0mt68HGsRiOHATmk7i+pXXnZWWFgyz
         v/6bFP7LY4zF7Fhf//Sfkp5+MpPfU6yGkyLxlvdVmjN5FvjYw0+ZLsGisIy+TsS5JUGI
         px4/Q2glZudLYwVVxWqx4DTe5x4jdyPVKvmoilB7FJvJPPhQc9x6DCoNj8IXEFGcqQyl
         Hsc0k56WMPNEKpbxeSpdLYT94621RBWjcKCI0nhhlNs3qTeLJkohr4O8UmTCKovCKEym
         nYea7j1DG5gt8C5wLzH5f6ats3YUgFc62CeJ+ewxZ3VnEnyWNEBlbxEl3QNNYwFOIvC8
         7Tig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734425837; x=1735030637;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2tNKY/TlgAJZwECcpDjiOAux1C82BMpjuzg6Q/icr8Q=;
        b=diTfWcGoncokjVSBqLRpDh2g6K6SLARVgYtOegh30sXbWspfZ9aKYBzPh1kWjkSYwK
         2pwrBtuAjyqxdXHBiJ53bnJUg5k2UgkmO7iv0Q7C7LW+AKhJYMPjDv1UQeyCtwA13RTv
         RVb3mlE9lGvTcbb1zqWQ0t8AlWcm/WIfi9xJyaLhEdu0NsOvJMmvaPe1JtYPu6G7ms8p
         hoQ0FsralLowAP5dSdtuBGrMm1nKyyyV6dN+kpqol0RkyAD6XUh0rAOwIk/4aev9ZiiC
         XsibDz//ji35ZXId0go1mnVLT9yXRaK2+9Tuh0a5QhU+3zIRkEer6g5K+geVDMuGglxp
         +miA==
X-Forwarded-Encrypted: i=1; AJvYcCV/o+8Z21sFSvnjYpQhLmpgzOSKsh2eaM17+rYrWADnJYuztn4KfK5s92wCr1dvlTdiqxISG7RJdXUiARKZvBWF@lists.infradead.org
X-Gm-Message-State: AOJu0YwZJm6hz02ncpX2o+QuKJXyxdBUXl4w+alYq/MiTtVkJqoUCaly
	qEDH0GUfMWs+1OTHzvWwbyKZqHdGUiLo82V36NbTIhTn+UbACutsdEguyzT47wDLRDWNcVFckFo
	HarPOZmS1Rso0rmaJiqxCu3AmdXLIvS1tLJ8k
X-Gm-Gg: ASbGnctPCoWtYNxBwVNQVUygh2eci+DABWrD06UB9LT2UacgO9Okp3R5CFdOHxavXkQ
	MMQBaIpvkK+cXtRHfjQKcES8uUd9Z980XNixbzHSiBzjijOZWON9N7U6aZDPKUBfIDfA=
X-Google-Smtp-Source: AGHT+IHJFBzVsqBQ7C3d6yTsi/odA0JGrwK8w33gD0CPcudIBQqs7CYLPRRKl7DNZ+C9Q8RUdpCE/xYn1+Tolw0ZG1g=
X-Received: by 2002:a05:600c:258:b0:434:a0fd:95d9 with SMTP id
 5b1f17b1804b1-4364ad50a2bmr719945e9.5.1734425837197; Tue, 17 Dec 2024
 00:57:17 -0800 (PST)
MIME-Version: 1.0
References: <20241216175803.2716565-1-qperret@google.com> <20241216175803.2716565-14-qperret@google.com>
In-Reply-To: <20241216175803.2716565-14-qperret@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 17 Dec 2024 08:56:40 +0000
Message-ID: <CA+EHjTzMOOkcX7GRtUZNDT5cbH5uXbu1ATgAhRq5DZV_Ev5=sw@mail.gmail.com>
Subject: Re: [PATCH v3 13/18] KVM: arm64: Introduce __pkvm_host_wrprotect_guest()
To: Quentin Perret <qperret@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Vincent Donnefort <vdonnefort@google.com>, 
	Sebastian Ene <sebastianene@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_005719_039001_0AC98744 
X-CRM114-Status: GOOD (  17.50  )
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

On Mon, 16 Dec 2024 at 17:58, Quentin Perret <qperret@google.com> wrote:
>
> Introduce a new hypercall to remove the write permission from a
> non-protected guest stage-2 mapping. This will be used for e.g. enabling
> dirty logging.
>
> Signed-off-by: Quentin Perret <qperret@google.com>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad


> ---
>  arch/arm64/include/asm/kvm_asm.h              |  1 +
>  arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |  1 +
>  arch/arm64/kvm/hyp/nvhe/hyp-main.c            | 21 +++++++++++++++++++
>  arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 19 +++++++++++++++++
>  4 files changed, 42 insertions(+)
>
> diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
> index 66ee8542dcc9..8663a588cf34 100644
> --- a/arch/arm64/include/asm/kvm_asm.h
> +++ b/arch/arm64/include/asm/kvm_asm.h
> @@ -68,6 +68,7 @@ enum __kvm_host_smccc_func {
>         __KVM_HOST_SMCCC_FUNC___pkvm_host_share_guest,
>         __KVM_HOST_SMCCC_FUNC___pkvm_host_unshare_guest,
>         __KVM_HOST_SMCCC_FUNC___pkvm_host_relax_perms_guest,
> +       __KVM_HOST_SMCCC_FUNC___pkvm_host_wrprotect_guest,
>         __KVM_HOST_SMCCC_FUNC___kvm_adjust_pc,
>         __KVM_HOST_SMCCC_FUNC___kvm_vcpu_run,
>         __KVM_HOST_SMCCC_FUNC___kvm_flush_vm_context,
> diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> index a308dcd3b5b8..fc9fdd5b0a52 100644
> --- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> +++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> @@ -42,6 +42,7 @@ int __pkvm_host_unshare_ffa(u64 pfn, u64 nr_pages);
>  int __pkvm_host_share_guest(u64 pfn, u64 gfn, struct pkvm_hyp_vcpu *vcpu, enum kvm_pgtable_prot prot);
>  int __pkvm_host_unshare_guest(u64 gfn, struct pkvm_hyp_vm *hyp_vm);
>  int __pkvm_host_relax_perms_guest(u64 gfn, struct pkvm_hyp_vcpu *vcpu, enum kvm_pgtable_prot prot);
> +int __pkvm_host_wrprotect_guest(u64 gfn, struct pkvm_hyp_vm *hyp_vm);
>
>  bool addr_is_memory(phys_addr_t phys);
>  int host_stage2_idmap_locked(phys_addr_t addr, u64 size, enum kvm_pgtable_prot prot);
> diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> index 287e4ee93ef2..98d317735107 100644
> --- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> +++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> @@ -283,6 +283,26 @@ static void handle___pkvm_host_relax_perms_guest(struct kvm_cpu_context *host_ct
>         cpu_reg(host_ctxt, 1) = ret;
>  }
>
> +static void handle___pkvm_host_wrprotect_guest(struct kvm_cpu_context *host_ctxt)
> +{
> +       DECLARE_REG(pkvm_handle_t, handle, host_ctxt, 1);
> +       DECLARE_REG(u64, gfn, host_ctxt, 2);
> +       struct pkvm_hyp_vm *hyp_vm;
> +       int ret = -EINVAL;
> +
> +       if (!is_protected_kvm_enabled())
> +               goto out;
> +
> +       hyp_vm = get_np_pkvm_hyp_vm(handle);
> +       if (!hyp_vm)
> +               goto out;
> +
> +       ret = __pkvm_host_wrprotect_guest(gfn, hyp_vm);
> +       put_pkvm_hyp_vm(hyp_vm);
> +out:
> +       cpu_reg(host_ctxt, 1) = ret;
> +}
> +
>  static void handle___kvm_adjust_pc(struct kvm_cpu_context *host_ctxt)
>  {
>         DECLARE_REG(struct kvm_vcpu *, vcpu, host_ctxt, 1);
> @@ -495,6 +515,7 @@ static const hcall_t host_hcall[] = {
>         HANDLE_FUNC(__pkvm_host_share_guest),
>         HANDLE_FUNC(__pkvm_host_unshare_guest),
>         HANDLE_FUNC(__pkvm_host_relax_perms_guest),
> +       HANDLE_FUNC(__pkvm_host_wrprotect_guest),
>         HANDLE_FUNC(__kvm_adjust_pc),
>         HANDLE_FUNC(__kvm_vcpu_run),
>         HANDLE_FUNC(__kvm_flush_vm_context),
> diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> index aa8e0408aebb..94e4251b5077 100644
> --- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> +++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> @@ -1511,3 +1511,22 @@ int __pkvm_host_relax_perms_guest(u64 gfn, struct pkvm_hyp_vcpu *vcpu, enum kvm_
>
>         return ret;
>  }
> +
> +int __pkvm_host_wrprotect_guest(u64 gfn, struct pkvm_hyp_vm *vm)
> +{
> +       u64 ipa = hyp_pfn_to_phys(gfn);
> +       u64 phys;
> +       int ret;
> +
> +       host_lock_component();
> +       guest_lock_component(vm);
> +
> +       ret = __check_host_shared_guest(vm, &phys, ipa);
> +       if (!ret)
> +               ret = kvm_pgtable_stage2_wrprotect(&vm->pgt, ipa, PAGE_SIZE);
> +
> +       guest_unlock_component(vm);
> +       host_unlock_component();
> +
> +       return ret;
> +}
> --
> 2.47.1.613.gc27f4b7a9f-goog
>

