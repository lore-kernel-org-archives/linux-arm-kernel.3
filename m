Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 246A9E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 15:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tmhmaaJdV6eQOFANMqIcIt0l8XrMzMUTFt9zdpoB/Zc=; b=DKiEAIVnKuUgNRzj9Rt+ltk+cE
	wmGp51/i4SaAH3Mqgto8yuTLI4yYaCLPopAIGcfFbVuJuej2gbjkJTG8vCCB1yfH7uSXrPNs+tyNN
	S9ZoLoQsOL+0IqKqJnG+TV+TPJXn+Wl69hqQiCr4eCVrWxw2vG5I/59wZ5/8c6O0nm6epkXZvk7jZ
	A5BUll1xIFPdO5BRRgjO+ziPdY14YUn/TFCfDo9IuH3OiH1+tlGpLSy7qstKAu7y+ETRrvCfAunJp
	X+euxXmzh8qMwdTbbuHXzqTtXACaRA/2nMpf21axMLhgnmsp5r0lSuZubdJR7HtjlK6xqzUeLYN7o
	c7IjuUPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL1qq-0000000Btn4-47Ol;
	Tue, 10 Dec 2024 15:08:40 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL1pk-0000000Bthp-0Mvm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 15:07:33 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-435b0df5dbdso40305e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Dec 2024 07:07:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733843250; x=1734448050; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tmhmaaJdV6eQOFANMqIcIt0l8XrMzMUTFt9zdpoB/Zc=;
        b=C7Q/RPF3QwR4xnwwUZrcUJta314dn9dDS61jxlVddsK0iSv0oZ8RsrMHOdZgvkTYxK
         V6MlcWcjp4R2BgOBxhNxLVu/0dBqmEezS4PuJ5T2r1SexkBv4PanxStkH0pedoWErUCn
         zi2X8NTI/emJnpeezr6jIFKh1uLsZrF2tpytCjzLdFLofrVOxoUWYXaB/HD5LOocdFUJ
         8rEw39rlqeLGogquVMttAP0OF7vFFDfz657BYP4HsLtv2o7s2vLFf6ZE1AZ/ILvLTxr3
         NcPBEhwVlRR9Q8+fDacZKD1xPRCPbxrAyL0YLskZxZ9PsRFRC6XymCv1rbFw/Ty0VVBf
         fVEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733843250; x=1734448050;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tmhmaaJdV6eQOFANMqIcIt0l8XrMzMUTFt9zdpoB/Zc=;
        b=S5bAAEOfIHpJBEpNWUA9+JO2sqqr4nGGlNpd7MdEktvSJ0Y35uYX5eC8Up263r8sN1
         9Wuz8fKnwNQPDL9v7OkM/luqiWVzpZEK277uAuHwT4ULydZe0p+J249uGkRcUQdZhr8I
         OH9JPpVWBAI+Au1wsPFyy/oGP1xGjPLpCxdEFmZmBOlET8HeGcgzoffA9NGKYhJEPQE2
         Ic4Icc8eOJjbDpjA45JGqFtSPQnxJRxqqNJ9OoXq7B7g5pwuewFAua/kJLkk+ezINpOw
         Kg7oPa5J9NX4ftJKMQ/HTrtvAPXnX0CzkZL0k51/vgWDMtt2cX6VTWdlffCVBOkEHGNi
         ZWZA==
X-Forwarded-Encrypted: i=1; AJvYcCUZd2BNQJBr3yUuW4rDu1x2tztKYgVu3qy+27m+trUdmlwYcUF5NiBR2L6dUp6qbV+N+s3SfQMNUFpC+0Jv05wT@lists.infradead.org
X-Gm-Message-State: AOJu0YxWdDfy4cq9bAPKhmbnfllT25BX7IOBwPu9DVUr1m/Q73KE5EOA
	Fb4lLyM1HXmzuK9t0rbWhYb3/5NLpoICkOE2eSW0QP/VdxdcU/nscV51YahpYWGkYIS4U39fETg
	5TZyqGKPUQXbtAMvD2bbdIc4k0LyDE9ASQV1vtcpDliGZ6PUT4A==
X-Gm-Gg: ASbGncu0As5buacOJqva0tgtrxR3FFA2QGUspBnPL7G1rfXHEmJdR2GRHTVBqSUR3a9
	7eiS5N195ZuO6dhLfg3pgzOeNfwBQnQAaiAusRWtVVW70coCb5GIgrZO8tDyP8PLG
X-Google-Smtp-Source: AGHT+IF0v/8FkIfUp8V2WvAH5E1CeHZD7x+qAjIRtMSeRZsWGkiFZVc6N2lek4jfdw4f++/UM2MaP8BhSMOlA5+0cTs=
X-Received: by 2002:a05:600c:4595:b0:434:a0fd:95d9 with SMTP id
 5b1f17b1804b1-43539dd9c68mr1171885e9.5.1733843249949; Tue, 10 Dec 2024
 07:07:29 -0800 (PST)
MIME-Version: 1.0
References: <20241203103735.2267589-1-qperret@google.com> <20241203103735.2267589-14-qperret@google.com>
In-Reply-To: <20241203103735.2267589-14-qperret@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 10 Dec 2024 15:06:53 +0000
Message-ID: <CA+EHjTx-MZHKwkGYPU+yN-CDkNh1kxTXN8FWTeaPfM95OSkjcQ@mail.gmail.com>
Subject: Re: [PATCH v2 13/18] KVM: arm64: Introduce __pkvm_host_wrprotect_guest()
To: Quentin Perret <qperret@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Vincent Donnefort <vdonnefort@google.com>, 
	Sebastian Ene <sebastianene@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_070732_146981_934DEB51 
X-CRM114-Status: GOOD (  19.27  )
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
> Introduce a new hypercall to remove the write permission from a
> non-protected guest stage-2 mapping. This will be used for e.g. enabling
> dirty logging.
>
> Signed-off-by: Quentin Perret <qperret@google.com>
> ---
>  arch/arm64/include/asm/kvm_asm.h              |  1 +
>  arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |  1 +
>  arch/arm64/kvm/hyp/nvhe/hyp-main.c            | 24 +++++++++++++++++++
>  arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 19 +++++++++++++++
>  4 files changed, 45 insertions(+)
>
> diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
> index 5d51933e44fb..4d7d20ea03df 100644
> --- a/arch/arm64/include/asm/kvm_asm.h
> +++ b/arch/arm64/include/asm/kvm_asm.h
> @@ -68,6 +68,7 @@ enum __kvm_host_smccc_func {
>         __KVM_HOST_SMCCC_FUNC___pkvm_host_share_guest,
>         __KVM_HOST_SMCCC_FUNC___pkvm_host_unshare_guest,
>         __KVM_HOST_SMCCC_FUNC___pkvm_host_relax_guest_perms,
> +       __KVM_HOST_SMCCC_FUNC___pkvm_host_wrprotect_guest,
>         __KVM_HOST_SMCCC_FUNC___kvm_adjust_pc,
>         __KVM_HOST_SMCCC_FUNC___kvm_vcpu_run,
>         __KVM_HOST_SMCCC_FUNC___kvm_flush_vm_context,
> diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> index db0dd83c2457..8658b5932473 100644
> --- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> +++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> @@ -42,6 +42,7 @@ int __pkvm_host_unshare_ffa(u64 pfn, u64 nr_pages);
>  int __pkvm_host_share_guest(u64 pfn, u64 gfn, struct pkvm_hyp_vcpu *vcpu, enum kvm_pgtable_prot prot);
>  int __pkvm_host_unshare_guest(u64 gfn, struct pkvm_hyp_vm *hyp_vm);
>  int __pkvm_host_relax_guest_perms(u64 gfn, enum kvm_pgtable_prot prot, struct pkvm_hyp_vcpu *vcpu);
> +int __pkvm_host_wrprotect_guest(u64 gfn, struct pkvm_hyp_vm *hyp_vm);
>
>  bool addr_is_memory(phys_addr_t phys);
>  int host_stage2_idmap_locked(phys_addr_t addr, u64 size, enum kvm_pgtable_prot prot);
> diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> index 60dd56bbd743..3feaf2119e51 100644
> --- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> +++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> @@ -286,6 +286,29 @@ static void handle___pkvm_host_relax_guest_perms(struct kvm_cpu_context *host_ct
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
> +       hyp_vm = get_pkvm_hyp_vm(handle);
> +       if (!hyp_vm)
> +               goto out;
> +       if (pkvm_hyp_vm_is_protected(hyp_vm))
> +               goto put_hyp_vm;

These checks are (unsurprisingly) the same for all these functions.
Does it make sense to have a helper do these checks?

Cheers,
/fuad

> +       ret = __pkvm_host_wrprotect_guest(gfn, hyp_vm);
> +put_hyp_vm:
> +       put_pkvm_hyp_vm(hyp_vm);
> +out:
> +       cpu_reg(host_ctxt, 1) = ret;
> +}
> +
>  static void handle___kvm_adjust_pc(struct kvm_cpu_context *host_ctxt)
>  {
>         DECLARE_REG(struct kvm_vcpu *, vcpu, host_ctxt, 1);
> @@ -498,6 +521,7 @@ static const hcall_t host_hcall[] = {
>         HANDLE_FUNC(__pkvm_host_share_guest),
>         HANDLE_FUNC(__pkvm_host_unshare_guest),
>         HANDLE_FUNC(__pkvm_host_relax_guest_perms),
> +       HANDLE_FUNC(__pkvm_host_wrprotect_guest),
>         HANDLE_FUNC(__kvm_adjust_pc),
>         HANDLE_FUNC(__kvm_vcpu_run),
>         HANDLE_FUNC(__kvm_flush_vm_context),
> diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> index d4b28e93e790..89312d7cde2a 100644
> --- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> +++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> @@ -1503,3 +1503,22 @@ int __pkvm_host_relax_guest_perms(u64 gfn, enum kvm_pgtable_prot prot, struct pk
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
> +       ret = __check_host_unshare_guest(vm, &phys, ipa);
> +       if (!ret)
> +               ret = kvm_pgtable_stage2_wrprotect(&vm->pgt, ipa, PAGE_SIZE);
> +
> +       guest_unlock_component(vm);
> +       host_unlock_component();
> +
> +       return ret;
> +}
> --
> 2.47.0.338.g60cca15819-goog
>

