Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8587E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 14:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CPwwSGhVOWXHBjvSfy9QVGaBSD0H0DxOIeEJkupGNUU=; b=k2JTs5IxHJWw579D2ZRW4I6CrM
	mdUmH8NghvBjq0nNDHkDJxkmmKB397ZyA1rfEGqtmekiUmuehR77xiehUMLhClyMaKf0yvEqy8lKA
	PbqEvbcZ6+zwpEQAZhOjRm2ed3a2PEGQn+z/QziAGG07FZDJVJG5J8PuV4eWZ8GFiRwN9bI67kLkw
	EuN3muxpRU91SASLTDEDFNwr+S0FeNROfbeS6/QMfuBi+NMPUwy06h9JrfSbodOinnit8mD44jixv
	eEjZQ64ckhRIESOBfNL52K3AsFf563yi4MkNyFRTGU8PcPUAFJA4NJODIVXxdPbhK1Bi/0KbqsWwh
	yvYjQ6Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL1gO-0000000BsLM-2X7Z;
	Tue, 10 Dec 2024 14:57:52 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL1fI-0000000BsBq-3L8v
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 14:56:45 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-434f150e9b5so43065e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Dec 2024 06:56:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733842602; x=1734447402; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CPwwSGhVOWXHBjvSfy9QVGaBSD0H0DxOIeEJkupGNUU=;
        b=pOJe0HGU45a1WqFKfc6onLZ/hSKkMizZlkofgSyNzQZyyywOX9w/qCWerSs1Dsqzxm
         HAN/iqPde9nJPiIAoINCciLDr/n2esWasrfe9m4q7Yde2E8qrR9ocFzgvkZxjuP2imjl
         n1zlnF/51keft+ko6l9Qcb+r9w5JotIk1xy42xc0dn/OXBIX/OVdF2aqBIfUm/o+Rten
         /BoHrFqoX/mTlYik60wc4IUBDo3091pi2EwNmoaa3CRlruubrCzx9sctyA7tOWcUYvgi
         hl17tt6G4WYwJ35v+UcRbPAQ1WjC+3s6yXqP0mYw13EZXQstnFYQvd/i1TLUzXCd0gJI
         HfLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733842602; x=1734447402;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CPwwSGhVOWXHBjvSfy9QVGaBSD0H0DxOIeEJkupGNUU=;
        b=G/vlJmOC1TX3R5VaEqneLhTcTEYAflagib6BjhJh4IhjKcdTLKt8vLkTbHrnU+qfZJ
         MVvKkHZ2qQgGJ137ClByzg7D5t7Nh6ko+t0o8J/O4O2yIYNMo96jKJhnz0uZzbh2zT17
         svXx9lOlqa8NsKbhlj8f5uEg60OR9PoUIBTO4ND20XmHANof+Kl0va+Jn1AP3clAW9Am
         j5ZIdojY576gVS3gUCD5hRFiGB2CAZTLU7hhaBMXaEdfWR3mZ04+AXAA+o+uxR8kaWkX
         qI282P7IqQN0S97CXSjQ9NQGq4yneNWFmlB8RgdSd38gdWV3eCVaI/VLpfwduSOhGvqi
         wgdA==
X-Forwarded-Encrypted: i=1; AJvYcCV/p/rMfhhZojBJpPdfLVofit4K2VhMX297QIwbrvRHhrd5ZN+1vgUOC5amrgFj52qWEqhbuqQmz8Cr8uhes5uY@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5VPduBB8c6I+7Be/LOyK2+RfKut6etN4erk1bw4zb8gn+eD4m
	x4vWl9qEtziY+RloH+038dEAwa4copyhajIhE3EBzbCL+I/h6w/jLtVLTid0QO3o8RxiHTF4dpK
	rU8fr8NvAgbTrCsaLxfvDG7terceLuNxKO4ta
X-Gm-Gg: ASbGnctNuOtIwVUSurzMRSY0JC9iCGI4UKQuSJTRSBlBD0AQ5RW6ZGLItDpzRHpKo7Q
	q33leg+h/dXdbm2apaQECzfB3z0DHusz3VNd9Bu4AXwlXSKL5kjMDVEzsL8M5bOvo
X-Google-Smtp-Source: AGHT+IFrek7ZOXFjbieOK3Z+KiuRhmB/JQIfCUTikq2lGnXrH/9Y4kZOz9Oyane5oNuACjRRiOYBT3El9OhjG5oV6Sc=
X-Received: by 2002:a05:600c:898:b0:436:1811:a79c with SMTP id
 5b1f17b1804b1-4361811a993mr606625e9.5.1733842602227; Tue, 10 Dec 2024
 06:56:42 -0800 (PST)
MIME-Version: 1.0
References: <20241203103735.2267589-1-qperret@google.com> <20241203103735.2267589-13-qperret@google.com>
In-Reply-To: <20241203103735.2267589-13-qperret@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 10 Dec 2024 14:56:05 +0000
Message-ID: <CA+EHjTwNgf5fPuWMaPaN4mcdd5y4uydJsXi-zEBatFnbwoaLLQ@mail.gmail.com>
Subject: Re: [PATCH v2 12/18] KVM: arm64: Introduce __pkvm_host_relax_guest_perms()
To: Quentin Perret <qperret@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Vincent Donnefort <vdonnefort@google.com>, 
	Sebastian Ene <sebastianene@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_065644_838670_25D2AE25 
X-CRM114-Status: GOOD (  21.82  )
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
> Introduce a new hypercall allowing the host to relax the stage-2
> permissions of mappings in a non-protected guest page-table. It will be
> used later once we start allowing RO memslots and dirty logging.
>
> Signed-off-by: Quentin Perret <qperret@google.com>
> ---
>  arch/arm64/include/asm/kvm_asm.h              |  1 +
>  arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |  1 +
>  arch/arm64/kvm/hyp/nvhe/hyp-main.c            | 20 ++++++++++++++++
>  arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 23 +++++++++++++++++++
>  4 files changed, 45 insertions(+)
>
> diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
> index 0b6c4d325134..5d51933e44fb 100644
> --- a/arch/arm64/include/asm/kvm_asm.h
> +++ b/arch/arm64/include/asm/kvm_asm.h
> @@ -67,6 +67,7 @@ enum __kvm_host_smccc_func {
>         __KVM_HOST_SMCCC_FUNC___pkvm_host_unshare_hyp,
>         __KVM_HOST_SMCCC_FUNC___pkvm_host_share_guest,
>         __KVM_HOST_SMCCC_FUNC___pkvm_host_unshare_guest,
> +       __KVM_HOST_SMCCC_FUNC___pkvm_host_relax_guest_perms,
>         __KVM_HOST_SMCCC_FUNC___kvm_adjust_pc,
>         __KVM_HOST_SMCCC_FUNC___kvm_vcpu_run,
>         __KVM_HOST_SMCCC_FUNC___kvm_flush_vm_context,
> diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> index e528a42ed60e..db0dd83c2457 100644
> --- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> +++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> @@ -41,6 +41,7 @@ int __pkvm_host_share_ffa(u64 pfn, u64 nr_pages);
>  int __pkvm_host_unshare_ffa(u64 pfn, u64 nr_pages);
>  int __pkvm_host_share_guest(u64 pfn, u64 gfn, struct pkvm_hyp_vcpu *vcpu, enum kvm_pgtable_prot prot);
>  int __pkvm_host_unshare_guest(u64 gfn, struct pkvm_hyp_vm *hyp_vm);
> +int __pkvm_host_relax_guest_perms(u64 gfn, enum kvm_pgtable_prot prot, struct pkvm_hyp_vcpu *vcpu);

The parameters are the same as __pkvm_host_share_guest, but in a
different order. I looked ahead at later patches in the series, and similar
issues regarding parameter type and ordering, so I won't mention it
for the later patches.


>  bool addr_is_memory(phys_addr_t phys);
>  int host_stage2_idmap_locked(phys_addr_t addr, u64 size, enum kvm_pgtable_prot prot);
> diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> index 04a9053ae1d5..60dd56bbd743 100644
> --- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> +++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> @@ -267,6 +267,25 @@ static void handle___pkvm_host_unshare_guest(struct kvm_cpu_context *host_ctxt)
>         cpu_reg(host_ctxt, 1) =  ret;
>  }
>
> +static void handle___pkvm_host_relax_guest_perms(struct kvm_cpu_context *host_ctxt)
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
> +       ret = __pkvm_host_relax_guest_perms(gfn, prot, hyp_vcpu);
> +out:
> +       cpu_reg(host_ctxt, 1) = ret;
> +}
> +
>  static void handle___kvm_adjust_pc(struct kvm_cpu_context *host_ctxt)
>  {
>         DECLARE_REG(struct kvm_vcpu *, vcpu, host_ctxt, 1);
> @@ -478,6 +497,7 @@ static const hcall_t host_hcall[] = {
>         HANDLE_FUNC(__pkvm_host_unshare_hyp),
>         HANDLE_FUNC(__pkvm_host_share_guest),
>         HANDLE_FUNC(__pkvm_host_unshare_guest),
> +       HANDLE_FUNC(__pkvm_host_relax_guest_perms),
>         HANDLE_FUNC(__kvm_adjust_pc),
>         HANDLE_FUNC(__kvm_vcpu_run),
>         HANDLE_FUNC(__kvm_flush_vm_context),
> diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> index aa27a3e42e5e..d4b28e93e790 100644
> --- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> +++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> @@ -1480,3 +1480,26 @@ int __pkvm_host_unshare_guest(u64 gfn, struct pkvm_hyp_vm *hyp_vm)
>
>         return ret;
>  }
> +
> +int __pkvm_host_relax_guest_perms(u64 gfn, enum kvm_pgtable_prot prot, struct pkvm_hyp_vcpu *vcpu)
> +{
> +       struct pkvm_hyp_vm *vm = pkvm_hyp_vcpu_to_hyp_vm(vcpu);
> +       u64 ipa = hyp_pfn_to_phys(gfn);
> +       u64 phys;
> +       int ret;
> +
> +       if ((prot & KVM_PGTABLE_PROT_RWX) != prot)
> +               return -EPERM;

Why not

+       if (prot & ~KVM_PGTABLE_PROT_RWX)

Simpler and consistent with similar checks in the file (e.g.,
__pkvm_host_share_guest)

Cheers,
/fuad


> +
> +       host_lock_component();
> +       guest_lock_component(vm);
> +
> +       ret = __check_host_unshare_guest(vm, &phys, ipa);
> +       if (!ret)
> +               ret = kvm_pgtable_stage2_relax_perms(&vm->pgt, ipa, prot, 0);
> +
> +       guest_unlock_component(vm);
> +       host_unlock_component();
> +
> +       return ret;
> +}
> --
> 2.47.0.338.g60cca15819-goog
>

