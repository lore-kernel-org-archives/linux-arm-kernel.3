Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 842B8E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 15:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/5ZtRjw8dpmQ1elEprrvLW2MOsxcGpgWmlHcpBGqqms=; b=pPkXxFEIWWYmZZNhRYGiLcC882
	6SdX4ukk8Z/OxOX4WzlgNKB10RBZFIJlJUtIYeZkaKeVTQBB0hiT2B6BLbsHaHwWWIqR5CQO/PWw0
	cHf4OsZLcppDT/Mo/CLrLxOzU7/AnQTrVHkG6r6d/UNXkLhU/cuiJB7iptf0FiKj2yCbBvfNBqKcy
	vNJqIg0e5Gd7nAusblclRYus6fiGxb3j1WMqnV3vfaugae5wR00qiXUiDmsvtvddL97/cLf0Tk8oK
	1QWJmIO3LjjJ2hxcPaBUH0LYPRRhdvLTuROcaQtvqGNGP39YcSlwEI0vNk6/pkrsLA06f6NOsOWQ/
	I+by26wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL2XU-0000000Bzlw-1hkN;
	Tue, 10 Dec 2024 15:52:44 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL2WR-0000000BzeK-2EQL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 15:51:40 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-434fa6bf6e4so47015e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Dec 2024 07:51:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733845898; x=1734450698; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/5ZtRjw8dpmQ1elEprrvLW2MOsxcGpgWmlHcpBGqqms=;
        b=TgoQSNJH+SFl1TkRMgP6c71DFB4aaHXVj1NKoudorXJQoHxkvg0Y8HxrbRe6sp4mtb
         0zImxw5RrjY66E7E/nqprLoumEPirE1tWJmLeYC/KiHP1+eV3zBfs0nvmpgf8femkZG0
         T+VFQX4mA6IYbtSejT7G0/rmS4x5i9o/0WedjUsb7RblfLnOfBBjmaJJoBBkhZwx8Ir1
         DxPjqMfA6Inxinc4P02se2xiMXeNqaG/BdXfqhlaVqiNMLcbjGkH1md3E1pqwCmbcGWq
         Q09M+c+bFNHQu1zUBggl33CHGWH0JVQk/P/AapkTa1M0lThNWzZ/cFKBwEGWB+HmYf24
         O5wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733845898; x=1734450698;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/5ZtRjw8dpmQ1elEprrvLW2MOsxcGpgWmlHcpBGqqms=;
        b=dYPTs0h1B9K2me8U7BsE3+u1ywVleu597hjWVJiHIb/LmvYxUDBNFk+lQ7+E2NIVaf
         +2Ngd8FXUXN4V4EpI9/bVLIVgVtqWnUgEdAQZpElMsaGsNVI0pCK0f0RhXtUH/tpbGJB
         /ydFmpRg1+RFZD70a8oaBQxoaXeuqexvxPJF+Up4sfdtb0Av0lOt8yzbhyeeRHxPfj3E
         fseE6tHSaEAql8vvCpbGCqjn7BEnUf0GUrAwiBmEqFcZTtwrdh8UaKimdQwkf9jCGJYe
         JlsIs7xmex783emySJifPyyKT8WJdP2beJv0WakolscNR49McrLZagQV84J0xGnir6IV
         Vc0g==
X-Forwarded-Encrypted: i=1; AJvYcCXXx2uhRt0hPHDmpZ9g+0PnuHbU6Cz0cOu+g9NdWHdXd/hir320tOIEMcAEXzVZ/kVg3JWg0uS63Xazv25Whz/+@lists.infradead.org
X-Gm-Message-State: AOJu0YxCzK/8OC9Uji1XqIjh+B8xw+7KWTgv/AqShTHiNRRHw9PnTbYD
	u4hHNFDRjk65cBHiXq6kzov6WmJZ/6t0nNpHg3InfSGTT9XfBBd3VDIyUq5huNLymtqGHge+rGd
	+f4yOiik4dNQfyqCYMc9qlvkNCt/cEcVMmOe0
X-Gm-Gg: ASbGncuCzPu632efXRHabKuAexW7QVlf2+JPS1yt5XMpr+OwhuiLCwUthJgTCgnVRNO
	cQSIuKh2lozAvY3wQXUXsZ9QvM4PLwbFWNqERiRdYN7osHR6SdDKvMD6tXAnZITI=
X-Google-Smtp-Source: AGHT+IG6nRSYR4cad9Jq/EKiLYzlmi/rBd9oike3yrjEW/0ELMD7DAWluxCMhksYS3Mn1ekR//nxyidNJvgQjdhF6ww=
X-Received: by 2002:a05:600c:12c3:b0:434:9d0b:bd7c with SMTP id
 5b1f17b1804b1-43539dcf4a4mr1249075e9.3.1733845897727; Tue, 10 Dec 2024
 07:51:37 -0800 (PST)
MIME-Version: 1.0
References: <20241203103735.2267589-1-qperret@google.com> <20241203103735.2267589-11-qperret@google.com>
 <CA+EHjTwHSyQ1FJc7axbLNuBxSWpRVE6brb34nO+F59=QRmfQEg@mail.gmail.com> <Z1hhHRdpCZcLs046@google.com>
In-Reply-To: <Z1hhHRdpCZcLs046@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 10 Dec 2024 15:51:01 +0000
Message-ID: <CA+EHjTw4GX3j_ssN-tWnf780xkvyKO5mBN6fnvXeWvQcBDmcNg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20241210_075139_575824_5463D312 
X-CRM114-Status: GOOD (  42.43  )
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

On Tue, 10 Dec 2024 at 15:41, Quentin Perret <qperret@google.com> wrote:
>
> On Tuesday 10 Dec 2024 at 13:58:42 (+0000), Fuad Tabba wrote:
> > Hi Quentin,
> >
> > On Tue, 3 Dec 2024 at 10:37, Quentin Perret <qperret@google.com> wrote:
> > >
> > > In preparation for handling guest stage-2 mappings at EL2, introduce a
> > > new pKVM hypercall allowing to share pages with non-protected guests.
> > >
> > > Signed-off-by: Quentin Perret <qperret@google.com>
> > > ---
> > >  arch/arm64/include/asm/kvm_asm.h              |  1 +
> > >  arch/arm64/include/asm/kvm_host.h             |  3 +
> > >  arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |  1 +
> > >  arch/arm64/kvm/hyp/include/nvhe/memory.h      |  2 +
> > >  arch/arm64/kvm/hyp/nvhe/hyp-main.c            | 34 +++++++++
> > >  arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 70 +++++++++++++++++++
> > >  arch/arm64/kvm/hyp/nvhe/pkvm.c                |  7 ++
> > >  7 files changed, 118 insertions(+)
> > >
> > > diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
> > > index 89c0fac69551..449337f5b2a3 100644
> > > --- a/arch/arm64/include/asm/kvm_asm.h
> > > +++ b/arch/arm64/include/asm/kvm_asm.h
> > > @@ -65,6 +65,7 @@ enum __kvm_host_smccc_func {
> > >         /* Hypercalls available after pKVM finalisation */
> > >         __KVM_HOST_SMCCC_FUNC___pkvm_host_share_hyp,
> > >         __KVM_HOST_SMCCC_FUNC___pkvm_host_unshare_hyp,
> > > +       __KVM_HOST_SMCCC_FUNC___pkvm_host_share_guest,
> > >         __KVM_HOST_SMCCC_FUNC___kvm_adjust_pc,
> > >         __KVM_HOST_SMCCC_FUNC___kvm_vcpu_run,
> > >         __KVM_HOST_SMCCC_FUNC___kvm_flush_vm_context,
> > > diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> > > index e18e9244d17a..f75988e3515b 100644
> > > --- a/arch/arm64/include/asm/kvm_host.h
> > > +++ b/arch/arm64/include/asm/kvm_host.h
> > > @@ -771,6 +771,9 @@ struct kvm_vcpu_arch {
> > >         /* Cache some mmu pages needed inside spinlock regions */
> > >         struct kvm_mmu_memory_cache mmu_page_cache;
> > >
> > > +       /* Pages to be donated to pkvm/EL2 if it runs out */
> >
> > Runs out of what? :) I'm being facetious, it's just that the comment
> > is a bit unclear.
>
>         /* Pages to top-up the pKVM/EL2 guest pool */
>
> Is that any better?
>
> > > +       struct kvm_hyp_memcache pkvm_memcache;
> > > +
> > >         /* Virtual SError ESR to restore when HCR_EL2.VSE is set */
> > >         u64 vsesr_el2;
> > >
> > > diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> > > index 25038ac705d8..a7976e50f556 100644
> > > --- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> > > +++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> > > @@ -39,6 +39,7 @@ int __pkvm_host_donate_hyp(u64 pfn, u64 nr_pages);
> > >  int __pkvm_hyp_donate_host(u64 pfn, u64 nr_pages);
> > >  int __pkvm_host_share_ffa(u64 pfn, u64 nr_pages);
> > >  int __pkvm_host_unshare_ffa(u64 pfn, u64 nr_pages);
> > > +int __pkvm_host_share_guest(u64 pfn, u64 gfn, struct pkvm_hyp_vcpu *vcpu, enum kvm_pgtable_prot prot);
> > >
> > >  bool addr_is_memory(phys_addr_t phys);
> > >  int host_stage2_idmap_locked(phys_addr_t addr, u64 size, enum kvm_pgtable_prot prot);
> > > diff --git a/arch/arm64/kvm/hyp/include/nvhe/memory.h b/arch/arm64/kvm/hyp/include/nvhe/memory.h
> > > index 08f3a0416d4c..457318215155 100644
> > > --- a/arch/arm64/kvm/hyp/include/nvhe/memory.h
> > > +++ b/arch/arm64/kvm/hyp/include/nvhe/memory.h
> > > @@ -47,6 +47,8 @@ struct hyp_page {
> > >
> > >         /* Host (non-meta) state. Guarded by the host stage-2 lock. */
> > >         enum pkvm_page_state host_state : 8;
> > > +
> > > +       u32 host_share_guest_count;
> > >  };
> > >
> > >  extern u64 __hyp_vmemmap;
> > > diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > > index 95d78db315b3..d659462fbf5d 100644
> > > --- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > > +++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > > @@ -211,6 +211,39 @@ static void handle___kvm_vcpu_run(struct kvm_cpu_context *host_ctxt)
> > >         cpu_reg(host_ctxt, 1) =  ret;
> > >  }
> > >
> > > +static int pkvm_refill_memcache(struct pkvm_hyp_vcpu *hyp_vcpu)
> > > +{
> > > +       struct kvm_vcpu *host_vcpu = hyp_vcpu->host_vcpu;
> > > +
> > > +       return refill_memcache(&hyp_vcpu->vcpu.arch.pkvm_memcache,
> > > +                              host_vcpu->arch.pkvm_memcache.nr_pages,
> > > +                              &host_vcpu->arch.pkvm_memcache);
> > > +}
> > > +
> > > +static void handle___pkvm_host_share_guest(struct kvm_cpu_context *host_ctxt)
> > > +{
> > > +       DECLARE_REG(u64, pfn, host_ctxt, 1);
> > > +       DECLARE_REG(u64, gfn, host_ctxt, 2);
> > > +       DECLARE_REG(enum kvm_pgtable_prot, prot, host_ctxt, 3);
> > > +       struct pkvm_hyp_vcpu *hyp_vcpu;
> > > +       int ret = -EINVAL;
> > > +
> > > +       if (!is_protected_kvm_enabled())
> > > +               goto out;
> > > +
> > > +       hyp_vcpu = pkvm_get_loaded_hyp_vcpu();
> > > +       if (!hyp_vcpu || pkvm_hyp_vcpu_is_protected(hyp_vcpu))
> > > +               goto out;
> > > +
> > > +       ret = pkvm_refill_memcache(hyp_vcpu);
> > > +       if (ret)
> > > +               goto out;
> > > +
> > > +       ret = __pkvm_host_share_guest(pfn, gfn, hyp_vcpu, prot);
> > > +out:
> > > +       cpu_reg(host_ctxt, 1) =  ret;
> > > +}
> > > +
> > >  static void handle___kvm_adjust_pc(struct kvm_cpu_context *host_ctxt)
> > >  {
> > >         DECLARE_REG(struct kvm_vcpu *, vcpu, host_ctxt, 1);
> > > @@ -420,6 +453,7 @@ static const hcall_t host_hcall[] = {
> > >
> > >         HANDLE_FUNC(__pkvm_host_share_hyp),
> > >         HANDLE_FUNC(__pkvm_host_unshare_hyp),
> > > +       HANDLE_FUNC(__pkvm_host_share_guest),
> > >         HANDLE_FUNC(__kvm_adjust_pc),
> > >         HANDLE_FUNC(__kvm_vcpu_run),
> > >         HANDLE_FUNC(__kvm_flush_vm_context),
> > > diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > > index 1595081c4f6b..a69d7212b64c 100644
> > > --- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > > +++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > > @@ -861,6 +861,27 @@ static int hyp_complete_donation(u64 addr,
> > >         return pkvm_create_mappings_locked(start, end, prot);
> > >  }
> > >
> > > +static enum pkvm_page_state guest_get_page_state(kvm_pte_t pte, u64 addr)
> > > +{
> > > +       if (!kvm_pte_valid(pte))
> > > +               return PKVM_NOPAGE;
> > > +
> > > +       return pkvm_getstate(kvm_pgtable_stage2_pte_prot(pte));
> > > +}
> > > +
> > > +static int __guest_check_page_state_range(struct pkvm_hyp_vcpu *vcpu, u64 addr,
> > > +                                         u64 size, enum pkvm_page_state state)
> > > +{
> > > +       struct pkvm_hyp_vm *vm = pkvm_hyp_vcpu_to_hyp_vm(vcpu);
> > > +       struct check_walk_data d = {
> > > +               .desired        = state,
> > > +               .get_page_state = guest_get_page_state,
> > > +       };
> > > +
> > > +       hyp_assert_lock_held(&vm->lock);
> > > +       return check_page_state_range(&vm->pgt, addr, size, &d);
> > > +}
> > > +
> > >  static int check_share(struct pkvm_mem_share *share)
> > >  {
> > >         const struct pkvm_mem_transition *tx = &share->tx;
> > > @@ -1343,3 +1364,52 @@ int __pkvm_host_unshare_ffa(u64 pfn, u64 nr_pages)
> > >
> > >         return ret;
> > >  }
> > > +
> > > +int __pkvm_host_share_guest(u64 pfn, u64 gfn, struct pkvm_hyp_vcpu *vcpu,
> > > +                           enum kvm_pgtable_prot prot)
> > > +{
> > > +       struct pkvm_hyp_vm *vm = pkvm_hyp_vcpu_to_hyp_vm(vcpu);
> > > +       u64 phys = hyp_pfn_to_phys(pfn);
> > > +       u64 ipa = hyp_pfn_to_phys(gfn);
> > > +       struct hyp_page *page;
> > > +       int ret;
> > > +
> > > +       if (prot & ~KVM_PGTABLE_PROT_RWX)
> > > +               return -EINVAL;
> > > +
> > > +       ret = range_is_allowed_memory(phys, phys + PAGE_SIZE);
> > > +       if (ret)
> > > +               return ret;
> > > +
> > > +       host_lock_component();
> > > +       guest_lock_component(vm);
> > > +
> > > +       ret = __guest_check_page_state_range(vcpu, ipa, PAGE_SIZE, PKVM_NOPAGE);
> > > +       if (ret)
> > > +               goto unlock;
> > > +
> > > +       page = hyp_phys_to_page(phys);
> > > +       switch (page->host_state) {
> > > +       case PKVM_PAGE_OWNED:
> > > +               WARN_ON(__host_set_page_state_range(phys, PAGE_SIZE, PKVM_PAGE_SHARED_OWNED));
> > > +               break;
> > > +       case PKVM_PAGE_SHARED_OWNED:
> > > +               /* Only host to np-guest multi-sharing is tolerated */
> >
> > Initially I thought the comment was related to the warning below,
> > which confused me.
>
> It actually is about the warning below :-)
>
> > Now I think what you're trying to say is that we'll
> > allow the share, and the (unrelated to the comment) warning is to
> > ensure that the PKVM_PAGE_SHARED_OWNED is consistent with the share
> > count.
>
> So, the only case where the host should ever attempt do use
> __pkvm_host_share_guest() on a page that is already shared is for a page
> already shared *with an np-guest*. The page->host_share_guest_count being
> elevated is the easiest way to check that the page is indeed in that
> state, hence the warning.
>
> If for example the host was trying to share with an np-guest a page that
> is currently shared with the hypervisor, that check would fail. We can
> discuss whether or not we would want to allow it, but for now there is
> strictly no need for it so I went with the restrictive option. We can
> relax that constraint later if need be.
>
> > I think what you should have here, which would work better with the
> > comment, is something like:
> >
> >                 /* Only host to np-guest multi-sharing is tolerated */
> > +               if (pkvm_hyp_vcpu_is_protected(vcpu))
> > +                       return -EPERM;
> >
> > That would even make the comment unnecessary.
>
> I would prefer not adding this here, handle___pkvm_host_share_guest() in
> hyp-main.c already does that for us.

I understand now, and I agree that an additional check isn't
necessary. Could you clarify the comment though? It's the word "only"
that threw me off, since to me it implied that the check was enforcing
the word "only". Maybe:

>                 /* Tolerate host to np-guest multi-sharing. */


Thanks,
/fuad

> >
> > > +               WARN_ON(!page->host_share_guest_count);
> > > +               break;
> > > +       default:
> > > +               ret = -EPERM;
> > > +               goto unlock;
> > > +       }
> > > +
> > > +       WARN_ON(kvm_pgtable_stage2_map(&vm->pgt, ipa, PAGE_SIZE, phys,
> > > +                                      pkvm_mkstate(prot, PKVM_PAGE_SHARED_BORROWED),
> > > +                                      &vcpu->vcpu.arch.pkvm_memcache, 0));
> > > +       page->host_share_guest_count++;
> > > +
> > > +unlock:
> > > +       guest_unlock_component(vm);
> > > +       host_unlock_component();
> > > +
> > > +       return ret;
> > > +}
> > > diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> > > index d5c23449a64c..d6c61a5e7b6e 100644
> > > --- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
> > > +++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> > > @@ -795,6 +795,13 @@ int __pkvm_teardown_vm(pkvm_handle_t handle)
> > >         /* Push the metadata pages to the teardown memcache */
> > >         for (idx = 0; idx < hyp_vm->nr_vcpus; ++idx) {
> > >                 struct pkvm_hyp_vcpu *hyp_vcpu = hyp_vm->vcpus[idx];
> > > +               struct kvm_hyp_memcache *vcpu_mc = &hyp_vcpu->vcpu.arch.pkvm_memcache;
> > > +
> > > +               while (vcpu_mc->nr_pages) {
> > > +                       void *addr = pop_hyp_memcache(vcpu_mc, hyp_phys_to_virt);
> >
> > nit: newline
> >
> > Cheers,
> > /fuad
> >
> >
> >
> > > +                       push_hyp_memcache(mc, addr, hyp_virt_to_phys);
> > > +                       unmap_donated_memory_noclear(addr, PAGE_SIZE);
> > > +               }
> > >
> > >                 teardown_donated_memory(mc, hyp_vcpu, sizeof(*hyp_vcpu));
> > >         }
> > > --
> > > 2.47.0.338.g60cca15819-goog
> > >

