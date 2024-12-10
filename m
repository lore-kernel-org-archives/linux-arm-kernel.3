Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65E96E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 14:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5fIIWMp7qjjozw0r8pKMUPB5DziYW5td3dF2oKjVLsg=; b=of5UjZXeOmMfm4TE4FPGdpaloj
	O07+2OVEg2R06slRyAi2Iq3CHDHUeNf4STy/bn3D5HdP3QkiRdWLcLOexFTSaFPrmdSwnkjxkRzDU
	/mM2oO9usQW3zjfDy6370bCP2SMxrUsOA8/jyIj+ApfkX7026+jHLdgwMOtBC4rwXPwFookz1ZRTy
	3/e2PMu97kIMEM8Ko83EOxoEzWTRiuQ3Q3URj/cNbHFlFzIhLoikiIj9G692+XcWtWkj7RfpuQFe7
	d7WU7kerivgmIZmzMstQevEXf07awDecxL3kxCIf4E8RDCzz3zf34Bn/m/u/v7RQUNi92uAwKzg0m
	sc4EF8CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL1TB-0000000BpNb-21TY;
	Tue, 10 Dec 2024 14:44:13 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL1Qs-0000000BoYj-3N3q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 14:41:52 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-434e5e71a08so42045e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Dec 2024 06:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733841709; x=1734446509; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5fIIWMp7qjjozw0r8pKMUPB5DziYW5td3dF2oKjVLsg=;
        b=wHGVT4oCZjvaaPYu1vXoUMcRaA7rQxMsr/jvGuQrlmBbVO5Na6mEdtM0qPF092s3vK
         eJr4KLnsIYSG6vMZuxFvVsRA6Dy6fXHSzZK73PFeq0/9/AUy9SsIgriWVnYsCi25SK+i
         11MCEZEMbOcQSwbyfv0Yk4UaOVY8IfOHWjBSwLG/Ny+JlTlwVcNvqUVcWJUYjT4MN0Ts
         i7Fo2ZVthUirE7ftl18hGBkSN8YL94+u8atSLcGOUONg6YwgEJH5V/aigmvAWD5flKcJ
         tYzplDi6e8Ez24QmypNFiqsYooWnjsYZJlGXBh1jO4IXdGNMOTv8A4291MF0JGZMJFP2
         XmBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733841709; x=1734446509;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5fIIWMp7qjjozw0r8pKMUPB5DziYW5td3dF2oKjVLsg=;
        b=eQmxv5c/lRqFZnd2FJZwubAXmulocgqL+5DaYZkYbZpnkh2aIjXwB2Q+OWsommxn5+
         EE0JNMeZk9TcEZYkIhPIdk2TxYVbxeq5x11Uog1XHGNmCIeiz3k3B/VvrmSJdvmz1fmx
         E5nlnwgLcjQNRt3zSGAPNYSzffISnqjsuRKt4uY62mRfZ5kXPry7BW8vFvK914mQEicb
         ILKzdfAO0KVMgM2ltvpHylBEPaJNmj1sa9RyjuEKpcMmAhGVNZLHjKRYSM2uuovkSkYR
         IX62OOMOgtJy2u50OyxddTQNNRKFdMrci7c4ThzxLU6FjiOE4HtfiBIwPu3aW95Z9NnH
         fcOA==
X-Forwarded-Encrypted: i=1; AJvYcCUnAVO7rm/TMouDVa4wdR8bEZzSq3Dbj2ZJHhv6A2GsJK16LL5RPNt955r8Bf6quYocVGodYD+tqQ0dKJboFymx@lists.infradead.org
X-Gm-Message-State: AOJu0Yzz//luQ4/Zm2GPPZbga+UxnWQefHbRa0VjIItLEF5k7RCbhxrb
	UKAFTuFaXgJGGiY1omSCsX5Grle/dzRSqHIfuGyX21j/Bgz1JeFaYpbBR3pIsCW+DxyaHtJs+f+
	LVVs1DE5NbDAFK6/Y+ZBDCbT7ox7t+41IWRiP
X-Gm-Gg: ASbGncvPAQAl8UlSesti2USuj61CX9SjatrcvOYqZ531xbolM0tfpPoCV4UVfnEvBMl
	+vB/R0O9NNneBd1LKrz2BnBo5TLDIsJzt9IUGSsTOi+zNIp8JA/ZXmEx7m4Fgn8IT
X-Google-Smtp-Source: AGHT+IGt3oMRotBPgAwrwV/rrRSOvtwIdVWe57J7beeBt9bYDDljWajSERju3lMmJnq6Z9ZrG8XVFNSEZ9oxYokNtW0=
X-Received: by 2002:a05:600c:350b:b0:435:921b:3535 with SMTP id
 5b1f17b1804b1-435921b360amr969545e9.3.1733841708454; Tue, 10 Dec 2024
 06:41:48 -0800 (PST)
MIME-Version: 1.0
References: <20241203103735.2267589-1-qperret@google.com> <20241203103735.2267589-12-qperret@google.com>
In-Reply-To: <20241203103735.2267589-12-qperret@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 10 Dec 2024 14:41:12 +0000
Message-ID: <CA+EHjTw48LTFt=sKtPwS1rmA=ma6Sj9O-D=17FXoMybqZ7+g5g@mail.gmail.com>
Subject: Re: [PATCH v2 11/18] KVM: arm64: Introduce __pkvm_host_unshare_guest()
To: Quentin Perret <qperret@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Vincent Donnefort <vdonnefort@google.com>, 
	Sebastian Ene <sebastianene@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_064150_845365_8919BE93 
X-CRM114-Status: GOOD (  22.46  )
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
> In preparation for letting the host unmap pages from non-protected
> guests, introduce a new hypercall implementing the host-unshare-guest
> transition.
>
> Signed-off-by: Quentin Perret <qperret@google.com>
> ---
>  arch/arm64/include/asm/kvm_asm.h              |  1 +
>  arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |  1 +
>  arch/arm64/kvm/hyp/include/nvhe/pkvm.h        |  5 ++
>  arch/arm64/kvm/hyp/nvhe/hyp-main.c            | 24 +++++++
>  arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 67 +++++++++++++++++++
>  5 files changed, 98 insertions(+)
>
> diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
> index 449337f5b2a3..0b6c4d325134 100644
> --- a/arch/arm64/include/asm/kvm_asm.h
> +++ b/arch/arm64/include/asm/kvm_asm.h
> @@ -66,6 +66,7 @@ enum __kvm_host_smccc_func {
>         __KVM_HOST_SMCCC_FUNC___pkvm_host_share_hyp,
>         __KVM_HOST_SMCCC_FUNC___pkvm_host_unshare_hyp,
>         __KVM_HOST_SMCCC_FUNC___pkvm_host_share_guest,
> +       __KVM_HOST_SMCCC_FUNC___pkvm_host_unshare_guest,
>         __KVM_HOST_SMCCC_FUNC___kvm_adjust_pc,
>         __KVM_HOST_SMCCC_FUNC___kvm_vcpu_run,
>         __KVM_HOST_SMCCC_FUNC___kvm_flush_vm_context,
> diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> index a7976e50f556..e528a42ed60e 100644
> --- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> +++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> @@ -40,6 +40,7 @@ int __pkvm_hyp_donate_host(u64 pfn, u64 nr_pages);
>  int __pkvm_host_share_ffa(u64 pfn, u64 nr_pages);
>  int __pkvm_host_unshare_ffa(u64 pfn, u64 nr_pages);
>  int __pkvm_host_share_guest(u64 pfn, u64 gfn, struct pkvm_hyp_vcpu *vcpu, enum kvm_pgtable_prot prot);
> +int __pkvm_host_unshare_guest(u64 gfn, struct pkvm_hyp_vm *hyp_vm);

The parameters of share_guest and unshare_guest are quite different. I
think that the unshare makes more sense, that it uses the hyp_vm as
opposed to the hyp_vcpu. Still, I think that one of the two should
change.

>  bool addr_is_memory(phys_addr_t phys);
>  int host_stage2_idmap_locked(phys_addr_t addr, u64 size, enum kvm_pgtable_prot prot);
> diff --git a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
> index be52c5b15e21..5dfc9ece9aa5 100644
> --- a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
> +++ b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
> @@ -64,6 +64,11 @@ static inline bool pkvm_hyp_vcpu_is_protected(struct pkvm_hyp_vcpu *hyp_vcpu)
>         return vcpu_is_protected(&hyp_vcpu->vcpu);
>  }
>
> +static inline bool pkvm_hyp_vm_is_protected(struct pkvm_hyp_vm *hyp_vm)
> +{
> +       return kvm_vm_is_protected(&hyp_vm->kvm);
> +}
> +
>  void pkvm_hyp_vm_table_init(void *tbl);
>
>  int __pkvm_init_vm(struct kvm *host_kvm, unsigned long vm_hva,
> diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> index d659462fbf5d..04a9053ae1d5 100644
> --- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> +++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> @@ -244,6 +244,29 @@ static void handle___pkvm_host_share_guest(struct kvm_cpu_context *host_ctxt)
>         cpu_reg(host_ctxt, 1) =  ret;
>  }
>
> +static void handle___pkvm_host_unshare_guest(struct kvm_cpu_context *host_ctxt)
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

bikeshedding: is -EINVAL the best return value, or might -EPERM be
better if the VM is protected?

> +
> +       ret = __pkvm_host_unshare_guest(gfn, hyp_vm);
> +put_hyp_vm:
> +       put_pkvm_hyp_vm(hyp_vm);
> +out:
> +       cpu_reg(host_ctxt, 1) =  ret;
> +}
> +
>  static void handle___kvm_adjust_pc(struct kvm_cpu_context *host_ctxt)
>  {
>         DECLARE_REG(struct kvm_vcpu *, vcpu, host_ctxt, 1);
> @@ -454,6 +477,7 @@ static const hcall_t host_hcall[] = {
>         HANDLE_FUNC(__pkvm_host_share_hyp),
>         HANDLE_FUNC(__pkvm_host_unshare_hyp),
>         HANDLE_FUNC(__pkvm_host_share_guest),
> +       HANDLE_FUNC(__pkvm_host_unshare_guest),
>         HANDLE_FUNC(__kvm_adjust_pc),
>         HANDLE_FUNC(__kvm_vcpu_run),
>         HANDLE_FUNC(__kvm_flush_vm_context),
> diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> index a69d7212b64c..aa27a3e42e5e 100644
> --- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> +++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> @@ -1413,3 +1413,70 @@ int __pkvm_host_share_guest(u64 pfn, u64 gfn, struct pkvm_hyp_vcpu *vcpu,
>
>         return ret;
>  }
> +
> +static int __check_host_unshare_guest(struct pkvm_hyp_vm *vm, u64 *__phys, u64 ipa)

nit: sometimes (in this and other patches) you use vm to refer to
pkvm_hyp_vm, and other times you use hyp_vm. Makes grepping/searching
a bit more tricky.

Cheers,
/fuad


> +{
> +       enum pkvm_page_state state;
> +       struct hyp_page *page;
> +       kvm_pte_t pte;
> +       u64 phys;
> +       s8 level;
> +       int ret;
> +
> +       ret = kvm_pgtable_get_leaf(&vm->pgt, ipa, &pte, &level);
> +       if (ret)
> +               return ret;
> +       if (level != KVM_PGTABLE_LAST_LEVEL)
> +               return -E2BIG;
> +       if (!kvm_pte_valid(pte))
> +               return -ENOENT;
> +
> +       state = guest_get_page_state(pte, ipa);
> +       if (state != PKVM_PAGE_SHARED_BORROWED)
> +               return -EPERM;
> +
> +       phys = kvm_pte_to_phys(pte);
> +       ret = range_is_allowed_memory(phys, phys + PAGE_SIZE);
> +       if (WARN_ON(ret))
> +               return ret;
> +
> +       page = hyp_phys_to_page(phys);
> +       if (page->host_state != PKVM_PAGE_SHARED_OWNED)
> +               return -EPERM;
> +       if (WARN_ON(!page->host_share_guest_count))
> +               return -EINVAL;
> +
> +       *__phys = phys;
> +
> +       return 0;
> +}
> +
> +int __pkvm_host_unshare_guest(u64 gfn, struct pkvm_hyp_vm *hyp_vm)
> +{
> +       u64 ipa = hyp_pfn_to_phys(gfn);
> +       struct hyp_page *page;
> +       u64 phys;
> +       int ret;
> +
> +       host_lock_component();
> +       guest_lock_component(hyp_vm);
> +
> +       ret = __check_host_unshare_guest(hyp_vm, &phys, ipa);
> +       if (ret)
> +               goto unlock;
> +
> +       ret = kvm_pgtable_stage2_unmap(&hyp_vm->pgt, ipa, PAGE_SIZE);
> +       if (ret)
> +               goto unlock;
> +
> +       page = hyp_phys_to_page(phys);
> +       page->host_share_guest_count--;
> +       if (!page->host_share_guest_count)
> +               WARN_ON(__host_set_page_state_range(phys, PAGE_SIZE, PKVM_PAGE_OWNED));
> +
> +unlock:
> +       guest_unlock_component(hyp_vm);
> +       host_unlock_component();
> +
> +       return ret;
> +}
> --
> 2.47.0.338.g60cca15819-goog
>

