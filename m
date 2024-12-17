Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B845FE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 09:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A9mGOwcKJkPD0/hT208rpyXS4+JWLUF2rILHUVjXzsc=; b=bsTOjPja5pNk3Itd+UG6A64UfC
	IRJ4n5+uk7PAe8rAbAg5U3jvTAkwGrDnbohoJmKcYs25ZgBaaedNv7+WQo3DGYol1GXM9qmBvAFJO
	MULmIhCQJ05FlGHIGYlVvigVSjZGJtEw8cjgqvrUnE3FalgpEY2f/dU0VvC8AD9l/82pbGKSg40+y
	F4oAnyu71UihfLHBVUqycDJLSpHPm+tHGNr4uJnECb1H5Jq8yyJM9DCfeSn8LqOAbblRB+1i2OCPn
	ZMcD09VrNLfNykrqyCPv7byGbHjuhe9Oq7ZE5i2kEtRxmsCdri/TT7SmSZHIQbFUkNF9wqRSo7SVG
	r9zblSZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNTf2-0000000CrVn-1Dj5;
	Tue, 17 Dec 2024 09:14:36 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNTOu-0000000CnqY-06Lf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 08:57:57 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-435b0df5dbdso39695e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Dec 2024 00:57:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734425874; x=1735030674; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=A9mGOwcKJkPD0/hT208rpyXS4+JWLUF2rILHUVjXzsc=;
        b=De4lnx8Q0T2XPyhA7iwZ9yjJVThrO/Vf17fy51wvXKafKE889t377wk+pXSBXlpSKM
         tl5WxlryqUyXyKp2GNoAW0XuzkLqHU2FF7YAhWeiI7HEZ78a2n87OEQ3/8XCYqXv7IF4
         tJu7gxlzqMzh0RC86DNQpniPfo2n+bI94TDk+wvFDi3KNcN9KkVL+R0wnmllRMoIkHBp
         RfMZhCz4EamuPMN84URkJkbSemA9uFvWjeIV5+/Me2KqckJVOxQr9oQc/VJb5t4tuxv9
         +yqUQ7ecAQRSks4S5QtD3Cq2Qp+RBBYz24fvOzxyBNF3LIAMGP9nr8LhseumxgTuC4HD
         xbJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734425874; x=1735030674;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A9mGOwcKJkPD0/hT208rpyXS4+JWLUF2rILHUVjXzsc=;
        b=ebRab5qyNtKx/Gj4U66eohDP6rTyxyuagdM1J99RHBhB4yGp8RWA8tzZ6toSYYRyIg
         8qmBdecQr+rrJlkrPkFPZcm6KKheCgFb4iCRrqqF6sojzIstPJo8AgMNICVlGaUn6X0U
         sq8aTSxradsPOAOSMReV9kBIKGYVmie3Z+Z0AxGwotCq32qDRmm5QrkbxMWpw9y56Pr/
         7qkfGoruNRi3PP90AWs7gCQUY/fXyP4rzLLu96/cY6RpZwpIMdwFiZJu3CjXlRURuZwT
         2oXyMhqWV8jnGULOqeQMGDKXFxgWpXOIBUbHyXRHrsJNTY1qOEQVP5lgb/KvJjXUlXgK
         z33g==
X-Forwarded-Encrypted: i=1; AJvYcCUHbfxy+02kWtlIOyU4qrPuG/RWOpVZG/+ZCQr9nHIRp7YP3CknUJoMJQ9QKAMVe3cLd80kFZ45qTqLB40zzKO8@lists.infradead.org
X-Gm-Message-State: AOJu0YybLIf03Z2JACnKn8pSUnS5s3kaBIjeih+bYwg3bZUJtXaKfKsr
	WpUhxjsTSjGCjFlPgT6d1Gy5IwS/NN1CptZTYdqY+dpZ+g9GZ3ORuIAdo2iiLu8mwRNRI4+1f3G
	Rhglget+kpEcJHp/+0GfWU6L9GxCXLY+qyd3Z
X-Gm-Gg: ASbGncsMkiSPqgkYIZzvnkv9c4qHXyZoZKi8EsYrZ6Fa5MAdN01ncVCkEq8+UL6V81q
	Vx7HAlQVqSzmWNzoimDGzy+6utNlxkSTPJXlW0sh4Rt5dydPjE/BWjlkd5FVumWZ/OBk=
X-Google-Smtp-Source: AGHT+IEYjt67uUTelKuWfZAZMUFcRBjP36zX3A1L63lz75C+g/NuQwlwiqMKzdVpK/gkc3nId/dg69M2v0a1+rqPXqA=
X-Received: by 2002:a7b:cd88:0:b0:434:c967:e4b5 with SMTP id
 5b1f17b1804b1-4364ad490dbmr705545e9.1.1734425874443; Tue, 17 Dec 2024
 00:57:54 -0800 (PST)
MIME-Version: 1.0
References: <20241216175803.2716565-1-qperret@google.com> <20241216175803.2716565-13-qperret@google.com>
In-Reply-To: <20241216175803.2716565-13-qperret@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 17 Dec 2024 08:57:17 +0000
Message-ID: <CA+EHjTy-tzmmu0vNCkK_J614FG1QVO79WSfzV78hQRYqGhP7EQ@mail.gmail.com>
Subject: Re: [PATCH v3 12/18] KVM: arm64: Introduce __pkvm_host_relax_guest_perms()
To: Quentin Perret <qperret@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Vincent Donnefort <vdonnefort@google.com>, 
	Sebastian Ene <sebastianene@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_005756_067069_30792753 
X-CRM114-Status: GOOD (  18.64  )
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
> Introduce a new hypercall allowing the host to relax the stage-2
> permissions of mappings in a non-protected guest page-table. It will be
> used later once we start allowing RO memslots and dirty logging.
>
> Signed-off-by: Quentin Perret <qperret@google.com>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

> ---
>  arch/arm64/include/asm/kvm_asm.h              |  1 +
>  arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |  1 +
>  arch/arm64/kvm/hyp/nvhe/hyp-main.c            | 20 ++++++++++++++++
>  arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 23 +++++++++++++++++++
>  4 files changed, 45 insertions(+)
>
> diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
> index 0b6c4d325134..66ee8542dcc9 100644
> --- a/arch/arm64/include/asm/kvm_asm.h
> +++ b/arch/arm64/include/asm/kvm_asm.h
> @@ -67,6 +67,7 @@ enum __kvm_host_smccc_func {
>         __KVM_HOST_SMCCC_FUNC___pkvm_host_unshare_hyp,
>         __KVM_HOST_SMCCC_FUNC___pkvm_host_share_guest,
>         __KVM_HOST_SMCCC_FUNC___pkvm_host_unshare_guest,
> +       __KVM_HOST_SMCCC_FUNC___pkvm_host_relax_perms_guest,
>         __KVM_HOST_SMCCC_FUNC___kvm_adjust_pc,
>         __KVM_HOST_SMCCC_FUNC___kvm_vcpu_run,
>         __KVM_HOST_SMCCC_FUNC___kvm_flush_vm_context,
> diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> index e528a42ed60e..a308dcd3b5b8 100644
> --- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> +++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> @@ -41,6 +41,7 @@ int __pkvm_host_share_ffa(u64 pfn, u64 nr_pages);
>  int __pkvm_host_unshare_ffa(u64 pfn, u64 nr_pages);
>  int __pkvm_host_share_guest(u64 pfn, u64 gfn, struct pkvm_hyp_vcpu *vcpu, enum kvm_pgtable_prot prot);
>  int __pkvm_host_unshare_guest(u64 gfn, struct pkvm_hyp_vm *hyp_vm);
> +int __pkvm_host_relax_perms_guest(u64 gfn, struct pkvm_hyp_vcpu *vcpu, enum kvm_pgtable_prot prot);
>
>  bool addr_is_memory(phys_addr_t phys);
>  int host_stage2_idmap_locked(phys_addr_t addr, u64 size, enum kvm_pgtable_prot prot);
> diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> index 3c3a27c985a2..287e4ee93ef2 100644
> --- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> +++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> @@ -264,6 +264,25 @@ static void handle___pkvm_host_unshare_guest(struct kvm_cpu_context *host_ctxt)
>         cpu_reg(host_ctxt, 1) =  ret;
>  }
>
> +static void handle___pkvm_host_relax_perms_guest(struct kvm_cpu_context *host_ctxt)
> +{
> +       DECLARE_REG(u64, gfn, host_ctxt, 1);
> +       DECLARE_REG(enum kvm_pgtable_prot, prot, host_ctxt, 2);
> +       struct pkvm_hyp_vcpu *hyp_vcpu;
> +       int ret = -EINVAL;
> +
> +       if (!is_protected_kvm_enabled())
> +               goto out;
> +
> +       hyp_vcpu = pkvm_get_loaded_hyp_vcpu();
> +       if (!hyp_vcpu || pkvm_hyp_vcpu_is_protected(hyp_vcpu))
> +               goto out;
> +
> +       ret = __pkvm_host_relax_perms_guest(gfn, hyp_vcpu, prot);
> +out:
> +       cpu_reg(host_ctxt, 1) = ret;
> +}
> +
>  static void handle___kvm_adjust_pc(struct kvm_cpu_context *host_ctxt)
>  {
>         DECLARE_REG(struct kvm_vcpu *, vcpu, host_ctxt, 1);
> @@ -475,6 +494,7 @@ static const hcall_t host_hcall[] = {
>         HANDLE_FUNC(__pkvm_host_unshare_hyp),
>         HANDLE_FUNC(__pkvm_host_share_guest),
>         HANDLE_FUNC(__pkvm_host_unshare_guest),
> +       HANDLE_FUNC(__pkvm_host_relax_perms_guest),
>         HANDLE_FUNC(__kvm_adjust_pc),
>         HANDLE_FUNC(__kvm_vcpu_run),
>         HANDLE_FUNC(__kvm_flush_vm_context),
> diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> index 30243b7922f1..aa8e0408aebb 100644
> --- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> +++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> @@ -1488,3 +1488,26 @@ int __pkvm_host_unshare_guest(u64 gfn, struct pkvm_hyp_vm *vm)
>
>         return ret;
>  }
> +
> +int __pkvm_host_relax_perms_guest(u64 gfn, struct pkvm_hyp_vcpu *vcpu, enum kvm_pgtable_prot prot)
> +{
> +       struct pkvm_hyp_vm *vm = pkvm_hyp_vcpu_to_hyp_vm(vcpu);
> +       u64 ipa = hyp_pfn_to_phys(gfn);
> +       u64 phys;
> +       int ret;
> +
> +       if (prot & ~KVM_PGTABLE_PROT_RWX)
> +               return -EINVAL;
> +
> +       host_lock_component();
> +       guest_lock_component(vm);
> +
> +       ret = __check_host_shared_guest(vm, &phys, ipa);
> +       if (!ret)
> +               ret = kvm_pgtable_stage2_relax_perms(&vm->pgt, ipa, prot, 0);
> +
> +       guest_unlock_component(vm);
> +       host_unlock_component();
> +
> +       return ret;
> +}
> --
> 2.47.1.613.gc27f4b7a9f-goog
>

