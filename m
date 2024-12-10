Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D662E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 14:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pdR2Nah9eSS1608JQ+7pYdwSPFrgUeYicsyPZ54iPZ8=; b=0rEe6Kt6xga3IKG/tF5Stasc2/
	rxWUSq48X0RuBvSnZVtzPz0gvcNprAC/Z3SyDLvFJtO2vcZxpdrSBOf+GvpqRtv7UXXRIbbkcEZW5
	RJ90/JHv0C9dkuIs91yX9IaGrK/4tAp2zzKJMZaM8YWys68q9PlsnJt+SAJ10mRREaxbUo5YrudaD
	9coKw1d0IyySWbCaisy69MrFB4GsWTRhN/uqLdhdS+3++M0ZFBtNH8t316eop8QnDpAkz7gtdJjEJ
	l7VXkVUocVgRRN/aRnYQrK2iQAFDr/IbDHOakWztpR4k2cUN+IT6nYtWUvQcz4dfV0Q3o9RpNfLO/
	F9ciRSAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL0mo-0000000BesM-2cyM;
	Tue, 10 Dec 2024 14:00:26 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL0lk-0000000Befo-3pTM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 13:59:22 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-434fa6bf6e4so38145e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Dec 2024 05:59:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733839159; x=1734443959; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pdR2Nah9eSS1608JQ+7pYdwSPFrgUeYicsyPZ54iPZ8=;
        b=zL0aPYgUNvtgdh3EVEUhH1CqxoMsRBKxz0TS6gj6xrek4j223QOxnD92XL+rMCvhwA
         +z0zHzY7M09YncDMh0hD2hE+BA9Kf8RAiPbm89LKLzwSQwrwdLNo/sRlCXDMP89Dprzy
         NMm3KnK/jh6IoUnUluQr24RcDFoKrzMZvh6WN6cVVt69tyllXqe0e8S6d8v5AETMI+tm
         I+/JDeAkBPUNzP0VCbDaezprkneHIjbt/dHo23As58FYUNw+r+ZV+5RWjud6lQHVkwpJ
         VruOKlftNeu0acHDreGrXytu4qBqZfa7dYG84sodU9OtnLpQ5FFW3HuVwEpFn+89KXQv
         QVcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733839159; x=1734443959;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pdR2Nah9eSS1608JQ+7pYdwSPFrgUeYicsyPZ54iPZ8=;
        b=GIRXk5U1nDf1pJoC0j/Jhuj232T/UqQpSrUOvKgIhphhsVtaWvUeqtaXf4Mms7ISXb
         TQULFolT0iV7Ezh3zgLPjUqwj76n2BJxrCsgg6XPl4Nm6MMgHxI3rXx/kBOIHy4x2VMk
         D8h164EJBHXU7HgZ70zfXWhhs7+jq4fTMKk4jM4hrtSX9sndcjyBy/AN28rwSAQnrqPq
         bpzDshOshIWs3pf3muPE/sXDsWSl06n/7z2cK1T69j1fL7quUr6KFiPZ1l9lAv92g0Ln
         Wc9xveV4+c8EcKTzopZTCTe/mtqHoxibU0ZsAoOl0tYm6dMuB4sHrTeY0Zi6ohKyw6U5
         z4TQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgjRbY7dqDyuOXMmA5kAr7dLtqFrhRKjmi/xUxW4FVUGl8iOW4afs1uN+REU6W4v0dlwxtsZvXf2SM2KvtENqo@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4li4VC38FKNNZp9He7CPFKMd83lV9szkO+Ar5PAfMDT98/+zj
	aJNR8qtd2sv89WAdlrEjn5uGKiI3G1vWZ/EmQN4QM8pL8FFQNYp1X70OZHqP5dd/fKf9dtwYqgK
	UXpQPp9NWaF3bJfeB/b1Clfz4waotVt72PTUx
X-Gm-Gg: ASbGncsyxgJtg3N/Q0KRcmQqIFyMEpYwEro7u1HxBB23zDsNzl0uV4PlBL/jgt22JOt
	Vyd7z6YQTFmW+JFnMZyyb6kvzeLBb5ncOuzSerlWViQH8m4XF6ohQG9ClfKFzXXd7
X-Google-Smtp-Source: AGHT+IF4x286LsTWFdiAcln9DVxYku4Zh8GMWeAmxfnCKtWgmpy5Npqzo9xC8vyBUc50ELL4I2PYhOBwkjRB7UTXebM=
X-Received: by 2002:a05:600c:35cb:b0:436:1868:b29f with SMTP id
 5b1f17b1804b1-4361868b697mr502665e9.6.1733839159010; Tue, 10 Dec 2024
 05:59:19 -0800 (PST)
MIME-Version: 1.0
References: <20241203103735.2267589-1-qperret@google.com> <20241203103735.2267589-11-qperret@google.com>
In-Reply-To: <20241203103735.2267589-11-qperret@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 10 Dec 2024 13:58:42 +0000
Message-ID: <CA+EHjTwHSyQ1FJc7axbLNuBxSWpRVE6brb34nO+F59=QRmfQEg@mail.gmail.com>
Subject: Re: [PATCH v2 10/18] KVM: arm64: Introduce __pkvm_host_share_guest()
To: Quentin Perret <qperret@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Vincent Donnefort <vdonnefort@google.com>, 
	Sebastian Ene <sebastianene@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_055920_952034_14689215 
X-CRM114-Status: GOOD (  27.66  )
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

On Tue, 3 Dec 2024 at 10:37, Quentin Perret <qperret@google.com> wrote:
>
> In preparation for handling guest stage-2 mappings at EL2, introduce a
> new pKVM hypercall allowing to share pages with non-protected guests.
>
> Signed-off-by: Quentin Perret <qperret@google.com>
> ---
>  arch/arm64/include/asm/kvm_asm.h              |  1 +
>  arch/arm64/include/asm/kvm_host.h             |  3 +
>  arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |  1 +
>  arch/arm64/kvm/hyp/include/nvhe/memory.h      |  2 +
>  arch/arm64/kvm/hyp/nvhe/hyp-main.c            | 34 +++++++++
>  arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 70 +++++++++++++++++++
>  arch/arm64/kvm/hyp/nvhe/pkvm.c                |  7 ++
>  7 files changed, 118 insertions(+)
>
> diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
> index 89c0fac69551..449337f5b2a3 100644
> --- a/arch/arm64/include/asm/kvm_asm.h
> +++ b/arch/arm64/include/asm/kvm_asm.h
> @@ -65,6 +65,7 @@ enum __kvm_host_smccc_func {
>         /* Hypercalls available after pKVM finalisation */
>         __KVM_HOST_SMCCC_FUNC___pkvm_host_share_hyp,
>         __KVM_HOST_SMCCC_FUNC___pkvm_host_unshare_hyp,
> +       __KVM_HOST_SMCCC_FUNC___pkvm_host_share_guest,
>         __KVM_HOST_SMCCC_FUNC___kvm_adjust_pc,
>         __KVM_HOST_SMCCC_FUNC___kvm_vcpu_run,
>         __KVM_HOST_SMCCC_FUNC___kvm_flush_vm_context,
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index e18e9244d17a..f75988e3515b 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -771,6 +771,9 @@ struct kvm_vcpu_arch {
>         /* Cache some mmu pages needed inside spinlock regions */
>         struct kvm_mmu_memory_cache mmu_page_cache;
>
> +       /* Pages to be donated to pkvm/EL2 if it runs out */

Runs out of what? :) I'm being facetious, it's just that the comment
is a bit unclear.

> +       struct kvm_hyp_memcache pkvm_memcache;
> +
>         /* Virtual SError ESR to restore when HCR_EL2.VSE is set */
>         u64 vsesr_el2;
>
> diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> index 25038ac705d8..a7976e50f556 100644
> --- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> +++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> @@ -39,6 +39,7 @@ int __pkvm_host_donate_hyp(u64 pfn, u64 nr_pages);
>  int __pkvm_hyp_donate_host(u64 pfn, u64 nr_pages);
>  int __pkvm_host_share_ffa(u64 pfn, u64 nr_pages);
>  int __pkvm_host_unshare_ffa(u64 pfn, u64 nr_pages);
> +int __pkvm_host_share_guest(u64 pfn, u64 gfn, struct pkvm_hyp_vcpu *vcpu, enum kvm_pgtable_prot prot);
>
>  bool addr_is_memory(phys_addr_t phys);
>  int host_stage2_idmap_locked(phys_addr_t addr, u64 size, enum kvm_pgtable_prot prot);
> diff --git a/arch/arm64/kvm/hyp/include/nvhe/memory.h b/arch/arm64/kvm/hyp/include/nvhe/memory.h
> index 08f3a0416d4c..457318215155 100644
> --- a/arch/arm64/kvm/hyp/include/nvhe/memory.h
> +++ b/arch/arm64/kvm/hyp/include/nvhe/memory.h
> @@ -47,6 +47,8 @@ struct hyp_page {
>
>         /* Host (non-meta) state. Guarded by the host stage-2 lock. */
>         enum pkvm_page_state host_state : 8;
> +
> +       u32 host_share_guest_count;
>  };
>
>  extern u64 __hyp_vmemmap;
> diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> index 95d78db315b3..d659462fbf5d 100644
> --- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> +++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> @@ -211,6 +211,39 @@ static void handle___kvm_vcpu_run(struct kvm_cpu_context *host_ctxt)
>         cpu_reg(host_ctxt, 1) =  ret;
>  }
>
> +static int pkvm_refill_memcache(struct pkvm_hyp_vcpu *hyp_vcpu)
> +{
> +       struct kvm_vcpu *host_vcpu = hyp_vcpu->host_vcpu;
> +
> +       return refill_memcache(&hyp_vcpu->vcpu.arch.pkvm_memcache,
> +                              host_vcpu->arch.pkvm_memcache.nr_pages,
> +                              &host_vcpu->arch.pkvm_memcache);
> +}
> +
> +static void handle___pkvm_host_share_guest(struct kvm_cpu_context *host_ctxt)
> +{
> +       DECLARE_REG(u64, pfn, host_ctxt, 1);
> +       DECLARE_REG(u64, gfn, host_ctxt, 2);
> +       DECLARE_REG(enum kvm_pgtable_prot, prot, host_ctxt, 3);
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
> +       ret = pkvm_refill_memcache(hyp_vcpu);
> +       if (ret)
> +               goto out;
> +
> +       ret = __pkvm_host_share_guest(pfn, gfn, hyp_vcpu, prot);
> +out:
> +       cpu_reg(host_ctxt, 1) =  ret;
> +}
> +
>  static void handle___kvm_adjust_pc(struct kvm_cpu_context *host_ctxt)
>  {
>         DECLARE_REG(struct kvm_vcpu *, vcpu, host_ctxt, 1);
> @@ -420,6 +453,7 @@ static const hcall_t host_hcall[] = {
>
>         HANDLE_FUNC(__pkvm_host_share_hyp),
>         HANDLE_FUNC(__pkvm_host_unshare_hyp),
> +       HANDLE_FUNC(__pkvm_host_share_guest),
>         HANDLE_FUNC(__kvm_adjust_pc),
>         HANDLE_FUNC(__kvm_vcpu_run),
>         HANDLE_FUNC(__kvm_flush_vm_context),
> diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> index 1595081c4f6b..a69d7212b64c 100644
> --- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> +++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> @@ -861,6 +861,27 @@ static int hyp_complete_donation(u64 addr,
>         return pkvm_create_mappings_locked(start, end, prot);
>  }
>
> +static enum pkvm_page_state guest_get_page_state(kvm_pte_t pte, u64 addr)
> +{
> +       if (!kvm_pte_valid(pte))
> +               return PKVM_NOPAGE;
> +
> +       return pkvm_getstate(kvm_pgtable_stage2_pte_prot(pte));
> +}
> +
> +static int __guest_check_page_state_range(struct pkvm_hyp_vcpu *vcpu, u64 addr,
> +                                         u64 size, enum pkvm_page_state state)
> +{
> +       struct pkvm_hyp_vm *vm = pkvm_hyp_vcpu_to_hyp_vm(vcpu);
> +       struct check_walk_data d = {
> +               .desired        = state,
> +               .get_page_state = guest_get_page_state,
> +       };
> +
> +       hyp_assert_lock_held(&vm->lock);
> +       return check_page_state_range(&vm->pgt, addr, size, &d);
> +}
> +
>  static int check_share(struct pkvm_mem_share *share)
>  {
>         const struct pkvm_mem_transition *tx = &share->tx;
> @@ -1343,3 +1364,52 @@ int __pkvm_host_unshare_ffa(u64 pfn, u64 nr_pages)
>
>         return ret;
>  }
> +
> +int __pkvm_host_share_guest(u64 pfn, u64 gfn, struct pkvm_hyp_vcpu *vcpu,
> +                           enum kvm_pgtable_prot prot)
> +{
> +       struct pkvm_hyp_vm *vm = pkvm_hyp_vcpu_to_hyp_vm(vcpu);
> +       u64 phys = hyp_pfn_to_phys(pfn);
> +       u64 ipa = hyp_pfn_to_phys(gfn);
> +       struct hyp_page *page;
> +       int ret;
> +
> +       if (prot & ~KVM_PGTABLE_PROT_RWX)
> +               return -EINVAL;
> +
> +       ret = range_is_allowed_memory(phys, phys + PAGE_SIZE);
> +       if (ret)
> +               return ret;
> +
> +       host_lock_component();
> +       guest_lock_component(vm);
> +
> +       ret = __guest_check_page_state_range(vcpu, ipa, PAGE_SIZE, PKVM_NOPAGE);
> +       if (ret)
> +               goto unlock;
> +
> +       page = hyp_phys_to_page(phys);
> +       switch (page->host_state) {
> +       case PKVM_PAGE_OWNED:
> +               WARN_ON(__host_set_page_state_range(phys, PAGE_SIZE, PKVM_PAGE_SHARED_OWNED));
> +               break;
> +       case PKVM_PAGE_SHARED_OWNED:
> +               /* Only host to np-guest multi-sharing is tolerated */

Initially I thought the comment was related to the warning below,
which confused me. Now I think what you're trying to say is that we'll
allow the share, and the (unrelated to the comment) warning is to
ensure that the PKVM_PAGE_SHARED_OWNED is consistent with the share
count.

I think what you should have here, which would work better with the
comment, is something like:

                /* Only host to np-guest multi-sharing is tolerated */
+               if (pkvm_hyp_vcpu_is_protected(vcpu))
+                       return -EPERM;

That would even make the comment unnecessary.


> +               WARN_ON(!page->host_share_guest_count);
> +               break;
> +       default:
> +               ret = -EPERM;
> +               goto unlock;
> +       }
> +
> +       WARN_ON(kvm_pgtable_stage2_map(&vm->pgt, ipa, PAGE_SIZE, phys,
> +                                      pkvm_mkstate(prot, PKVM_PAGE_SHARED_BORROWED),
> +                                      &vcpu->vcpu.arch.pkvm_memcache, 0));
> +       page->host_share_guest_count++;
> +
> +unlock:
> +       guest_unlock_component(vm);
> +       host_unlock_component();
> +
> +       return ret;
> +}
> diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> index d5c23449a64c..d6c61a5e7b6e 100644
> --- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
> +++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> @@ -795,6 +795,13 @@ int __pkvm_teardown_vm(pkvm_handle_t handle)
>         /* Push the metadata pages to the teardown memcache */
>         for (idx = 0; idx < hyp_vm->nr_vcpus; ++idx) {
>                 struct pkvm_hyp_vcpu *hyp_vcpu = hyp_vm->vcpus[idx];
> +               struct kvm_hyp_memcache *vcpu_mc = &hyp_vcpu->vcpu.arch.pkvm_memcache;
> +
> +               while (vcpu_mc->nr_pages) {
> +                       void *addr = pop_hyp_memcache(vcpu_mc, hyp_phys_to_virt);

nit: newline

Cheers,
/fuad



> +                       push_hyp_memcache(mc, addr, hyp_virt_to_phys);
> +                       unmap_donated_memory_noclear(addr, PAGE_SIZE);
> +               }
>
>                 teardown_donated_memory(mc, hyp_vcpu, sizeof(*hyp_vcpu));
>         }
> --
> 2.47.0.338.g60cca15819-goog
>

