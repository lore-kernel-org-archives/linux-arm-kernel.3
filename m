Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB92DE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 15:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=46JcCD1FU52F31DPGJd2oqCDKaVkpmJWGNJI8dSnpAI=; b=srJUcV4eZpbuZqm6Gyg3GNiTUB
	Mpt/qfxr31xDmH9x8eWeQ2rHalOzHX3Plm5/qhxoR4YCWgdkrQzd3fqWFxynnWGteKl1TXxQp4TDw
	ZGw4TdoXNEXD37LwO8qgrnUQtthG+ph0ke8cS5e7cWupxjwt86Ifo3hEpJ6znSJ8p/VX/9sqKBUTc
	si8LFwn6f9eKepztNQskWt+nHL/2Aj8t3OREhpTJOlp93R0Zcg8BKW5xZRdc2wm0+1d0y6CliBV2s
	YamKkfDjcF/eS4CmFDR/52D4w+VfbNK723HO1dWVtPSx6IxQKMDnenbYAlOEbCW+MPHP9qhHATq87
	4uo3u/Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL2Na-0000000ByY0-1cW8;
	Tue, 10 Dec 2024 15:42:30 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL2MT-0000000ByM6-449d
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 15:41:23 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5cf6f804233so7219263a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Dec 2024 07:41:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733845280; x=1734450080; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=46JcCD1FU52F31DPGJd2oqCDKaVkpmJWGNJI8dSnpAI=;
        b=wPyaYmzwpMBekZsgJXsaP+Bbd32rhPOuQRrFohHA0jxByhAccbqIsHgxpvuLEOXvqc
         9CgY5iVDFYAdgLEg/Zq7RgOgI1tU70hIlnc/3WXY187HXDdei7VuUhvENH+EQ6WKgAOu
         +QV6T1hBYzGnFmbySTPyWJ5Hij2rRAChwwoKmT04RS3hZyLYvS2GprtDYKQsFl1QdKVK
         NYh1vhlLjDsPXAwVPXPKBYFyh/QkRsiD1NnofXwR0O2J/PNG8bMJvgSSnqMHkd7rY9be
         rwgnX+38O+Hci4SoPJp8zb80Xn47sbg8q8PhWou5IJqVju1IKuiOJST3zP2OnuJFwyVq
         LYgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733845280; x=1734450080;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=46JcCD1FU52F31DPGJd2oqCDKaVkpmJWGNJI8dSnpAI=;
        b=LfWeOurPArCXHz1MUhL3x3dUiju1bcrG63j7zWCB1A3Uc0b8OlT0eWjYZ4esGJbBXV
         jpbqFy5HBcwZfc0l5gOe9qVvTXfT6gq56xdMSN0VEtsB1gap9GdAYVovYUJd8ystxSVb
         ANvSZT3KEKzrAdzLxvQVEwVYHII2oi2/GFN5nwdrzlsXLkaMSyJUQK2jZR71gX5bsqt2
         PB9cTbQirpapIYaZ98ngNEfN6A5SeDm1wcCpiujvvUmG7/o5MQwtX8+4Qw+QfSoKesmh
         fcgOa+fNLvEOyugF4KnZPeGi9O/02wxSKfuK4daziIF8ioc+h2S50iERj70ZunXOMuFu
         KZCA==
X-Forwarded-Encrypted: i=1; AJvYcCWh+klgyV3N1OPtM1Zj9QFt7dZmY0LdA8bLyqMzVxPXmW51gbhAusiPr/iklG6opZ/NG+B7GOCod/qJ7cmvjBUj@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2XfBStgCPjPgxUh3m4sIlNUfDz+wlLWVjdBtOyQlpVElvYpF3
	mHG1UIGudL0PFbiEg20aob170mvn4OnMqvrBrT0Bs/XodBc72fmpbkwR7xeSYQ==
X-Gm-Gg: ASbGnctLEqy9/exnY10Nq9rAOg/ljZeKIBbOyxgQ2YmNk4UgZjEgXsYiHTGXLf4omej
	+nXT/YnwlPopgbOxKp0PtFy/+JGO+6z5eNt1Rk/AksqtST0AGld+NmmJeVyfK23UXZEfKs3oA41
	gcUZrq+VTC270RR7wHCkvxhnbzvyKC7C0KuRSxUN5wl5FuvU+IJ8O6zA6lGpJ+JVIXCeAuX2ZZ+
	aXguptPEkAnIico8+2Iy7qQ6+bPpxj6EclHbnWcwJZyGlupyzWg0HHgH/cN5cfGKyvZJ48HSrNH
	VpUZtdlOI8jv
X-Google-Smtp-Source: AGHT+IFd2fS0c4aNKhVmWqn1O4x50wI/ObkXLOpUBJRXItQq6lrIDoii/Xko+BKKQfRgv1hUzcvzmQ==
X-Received: by 2002:a05:6402:28a6:b0:5d3:ce7f:abee with SMTP id 4fb4d7f45d1cf-5d41861313bmr5127220a12.25.1733845280257;
        Tue, 10 Dec 2024 07:41:20 -0800 (PST)
Received: from google.com (61.134.90.34.bc.googleusercontent.com. [34.90.134.61])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d3eb7722acsm4349946a12.3.2024.12.10.07.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 07:41:19 -0800 (PST)
Date: Tue, 10 Dec 2024 15:41:17 +0000
From: Quentin Perret <qperret@google.com>
To: Fuad Tabba <tabba@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Vincent Donnefort <vdonnefort@google.com>,
	Sebastian Ene <sebastianene@google.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 10/18] KVM: arm64: Introduce __pkvm_host_share_guest()
Message-ID: <Z1hhHRdpCZcLs046@google.com>
References: <20241203103735.2267589-1-qperret@google.com>
 <20241203103735.2267589-11-qperret@google.com>
 <CA+EHjTwHSyQ1FJc7axbLNuBxSWpRVE6brb34nO+F59=QRmfQEg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTwHSyQ1FJc7axbLNuBxSWpRVE6brb34nO+F59=QRmfQEg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_074122_011129_651DFE93 
X-CRM114-Status: GOOD (  37.94  )
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

On Tuesday 10 Dec 2024 at 13:58:42 (+0000), Fuad Tabba wrote:
> Hi Quentin,
> 
> On Tue, 3 Dec 2024 at 10:37, Quentin Perret <qperret@google.com> wrote:
> >
> > In preparation for handling guest stage-2 mappings at EL2, introduce a
> > new pKVM hypercall allowing to share pages with non-protected guests.
> >
> > Signed-off-by: Quentin Perret <qperret@google.com>
> > ---
> >  arch/arm64/include/asm/kvm_asm.h              |  1 +
> >  arch/arm64/include/asm/kvm_host.h             |  3 +
> >  arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |  1 +
> >  arch/arm64/kvm/hyp/include/nvhe/memory.h      |  2 +
> >  arch/arm64/kvm/hyp/nvhe/hyp-main.c            | 34 +++++++++
> >  arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 70 +++++++++++++++++++
> >  arch/arm64/kvm/hyp/nvhe/pkvm.c                |  7 ++
> >  7 files changed, 118 insertions(+)
> >
> > diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
> > index 89c0fac69551..449337f5b2a3 100644
> > --- a/arch/arm64/include/asm/kvm_asm.h
> > +++ b/arch/arm64/include/asm/kvm_asm.h
> > @@ -65,6 +65,7 @@ enum __kvm_host_smccc_func {
> >         /* Hypercalls available after pKVM finalisation */
> >         __KVM_HOST_SMCCC_FUNC___pkvm_host_share_hyp,
> >         __KVM_HOST_SMCCC_FUNC___pkvm_host_unshare_hyp,
> > +       __KVM_HOST_SMCCC_FUNC___pkvm_host_share_guest,
> >         __KVM_HOST_SMCCC_FUNC___kvm_adjust_pc,
> >         __KVM_HOST_SMCCC_FUNC___kvm_vcpu_run,
> >         __KVM_HOST_SMCCC_FUNC___kvm_flush_vm_context,
> > diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> > index e18e9244d17a..f75988e3515b 100644
> > --- a/arch/arm64/include/asm/kvm_host.h
> > +++ b/arch/arm64/include/asm/kvm_host.h
> > @@ -771,6 +771,9 @@ struct kvm_vcpu_arch {
> >         /* Cache some mmu pages needed inside spinlock regions */
> >         struct kvm_mmu_memory_cache mmu_page_cache;
> >
> > +       /* Pages to be donated to pkvm/EL2 if it runs out */
> 
> Runs out of what? :) I'm being facetious, it's just that the comment
> is a bit unclear.

	/* Pages to top-up the pKVM/EL2 guest pool */

Is that any better?

> > +       struct kvm_hyp_memcache pkvm_memcache;
> > +
> >         /* Virtual SError ESR to restore when HCR_EL2.VSE is set */
> >         u64 vsesr_el2;
> >
> > diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> > index 25038ac705d8..a7976e50f556 100644
> > --- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> > +++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> > @@ -39,6 +39,7 @@ int __pkvm_host_donate_hyp(u64 pfn, u64 nr_pages);
> >  int __pkvm_hyp_donate_host(u64 pfn, u64 nr_pages);
> >  int __pkvm_host_share_ffa(u64 pfn, u64 nr_pages);
> >  int __pkvm_host_unshare_ffa(u64 pfn, u64 nr_pages);
> > +int __pkvm_host_share_guest(u64 pfn, u64 gfn, struct pkvm_hyp_vcpu *vcpu, enum kvm_pgtable_prot prot);
> >
> >  bool addr_is_memory(phys_addr_t phys);
> >  int host_stage2_idmap_locked(phys_addr_t addr, u64 size, enum kvm_pgtable_prot prot);
> > diff --git a/arch/arm64/kvm/hyp/include/nvhe/memory.h b/arch/arm64/kvm/hyp/include/nvhe/memory.h
> > index 08f3a0416d4c..457318215155 100644
> > --- a/arch/arm64/kvm/hyp/include/nvhe/memory.h
> > +++ b/arch/arm64/kvm/hyp/include/nvhe/memory.h
> > @@ -47,6 +47,8 @@ struct hyp_page {
> >
> >         /* Host (non-meta) state. Guarded by the host stage-2 lock. */
> >         enum pkvm_page_state host_state : 8;
> > +
> > +       u32 host_share_guest_count;
> >  };
> >
> >  extern u64 __hyp_vmemmap;
> > diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > index 95d78db315b3..d659462fbf5d 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > @@ -211,6 +211,39 @@ static void handle___kvm_vcpu_run(struct kvm_cpu_context *host_ctxt)
> >         cpu_reg(host_ctxt, 1) =  ret;
> >  }
> >
> > +static int pkvm_refill_memcache(struct pkvm_hyp_vcpu *hyp_vcpu)
> > +{
> > +       struct kvm_vcpu *host_vcpu = hyp_vcpu->host_vcpu;
> > +
> > +       return refill_memcache(&hyp_vcpu->vcpu.arch.pkvm_memcache,
> > +                              host_vcpu->arch.pkvm_memcache.nr_pages,
> > +                              &host_vcpu->arch.pkvm_memcache);
> > +}
> > +
> > +static void handle___pkvm_host_share_guest(struct kvm_cpu_context *host_ctxt)
> > +{
> > +       DECLARE_REG(u64, pfn, host_ctxt, 1);
> > +       DECLARE_REG(u64, gfn, host_ctxt, 2);
> > +       DECLARE_REG(enum kvm_pgtable_prot, prot, host_ctxt, 3);
> > +       struct pkvm_hyp_vcpu *hyp_vcpu;
> > +       int ret = -EINVAL;
> > +
> > +       if (!is_protected_kvm_enabled())
> > +               goto out;
> > +
> > +       hyp_vcpu = pkvm_get_loaded_hyp_vcpu();
> > +       if (!hyp_vcpu || pkvm_hyp_vcpu_is_protected(hyp_vcpu))
> > +               goto out;
> > +
> > +       ret = pkvm_refill_memcache(hyp_vcpu);
> > +       if (ret)
> > +               goto out;
> > +
> > +       ret = __pkvm_host_share_guest(pfn, gfn, hyp_vcpu, prot);
> > +out:
> > +       cpu_reg(host_ctxt, 1) =  ret;
> > +}
> > +
> >  static void handle___kvm_adjust_pc(struct kvm_cpu_context *host_ctxt)
> >  {
> >         DECLARE_REG(struct kvm_vcpu *, vcpu, host_ctxt, 1);
> > @@ -420,6 +453,7 @@ static const hcall_t host_hcall[] = {
> >
> >         HANDLE_FUNC(__pkvm_host_share_hyp),
> >         HANDLE_FUNC(__pkvm_host_unshare_hyp),
> > +       HANDLE_FUNC(__pkvm_host_share_guest),
> >         HANDLE_FUNC(__kvm_adjust_pc),
> >         HANDLE_FUNC(__kvm_vcpu_run),
> >         HANDLE_FUNC(__kvm_flush_vm_context),
> > diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > index 1595081c4f6b..a69d7212b64c 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > @@ -861,6 +861,27 @@ static int hyp_complete_donation(u64 addr,
> >         return pkvm_create_mappings_locked(start, end, prot);
> >  }
> >
> > +static enum pkvm_page_state guest_get_page_state(kvm_pte_t pte, u64 addr)
> > +{
> > +       if (!kvm_pte_valid(pte))
> > +               return PKVM_NOPAGE;
> > +
> > +       return pkvm_getstate(kvm_pgtable_stage2_pte_prot(pte));
> > +}
> > +
> > +static int __guest_check_page_state_range(struct pkvm_hyp_vcpu *vcpu, u64 addr,
> > +                                         u64 size, enum pkvm_page_state state)
> > +{
> > +       struct pkvm_hyp_vm *vm = pkvm_hyp_vcpu_to_hyp_vm(vcpu);
> > +       struct check_walk_data d = {
> > +               .desired        = state,
> > +               .get_page_state = guest_get_page_state,
> > +       };
> > +
> > +       hyp_assert_lock_held(&vm->lock);
> > +       return check_page_state_range(&vm->pgt, addr, size, &d);
> > +}
> > +
> >  static int check_share(struct pkvm_mem_share *share)
> >  {
> >         const struct pkvm_mem_transition *tx = &share->tx;
> > @@ -1343,3 +1364,52 @@ int __pkvm_host_unshare_ffa(u64 pfn, u64 nr_pages)
> >
> >         return ret;
> >  }
> > +
> > +int __pkvm_host_share_guest(u64 pfn, u64 gfn, struct pkvm_hyp_vcpu *vcpu,
> > +                           enum kvm_pgtable_prot prot)
> > +{
> > +       struct pkvm_hyp_vm *vm = pkvm_hyp_vcpu_to_hyp_vm(vcpu);
> > +       u64 phys = hyp_pfn_to_phys(pfn);
> > +       u64 ipa = hyp_pfn_to_phys(gfn);
> > +       struct hyp_page *page;
> > +       int ret;
> > +
> > +       if (prot & ~KVM_PGTABLE_PROT_RWX)
> > +               return -EINVAL;
> > +
> > +       ret = range_is_allowed_memory(phys, phys + PAGE_SIZE);
> > +       if (ret)
> > +               return ret;
> > +
> > +       host_lock_component();
> > +       guest_lock_component(vm);
> > +
> > +       ret = __guest_check_page_state_range(vcpu, ipa, PAGE_SIZE, PKVM_NOPAGE);
> > +       if (ret)
> > +               goto unlock;
> > +
> > +       page = hyp_phys_to_page(phys);
> > +       switch (page->host_state) {
> > +       case PKVM_PAGE_OWNED:
> > +               WARN_ON(__host_set_page_state_range(phys, PAGE_SIZE, PKVM_PAGE_SHARED_OWNED));
> > +               break;
> > +       case PKVM_PAGE_SHARED_OWNED:
> > +               /* Only host to np-guest multi-sharing is tolerated */
> 
> Initially I thought the comment was related to the warning below,
> which confused me.

It actually is about the warning below :-)

> Now I think what you're trying to say is that we'll
> allow the share, and the (unrelated to the comment) warning is to
> ensure that the PKVM_PAGE_SHARED_OWNED is consistent with the share
> count.

So, the only case where the host should ever attempt do use
__pkvm_host_share_guest() on a page that is already shared is for a page
already shared *with an np-guest*. The page->host_share_guest_count being
elevated is the easiest way to check that the page is indeed in that
state, hence the warning.

If for example the host was trying to share with an np-guest a page that
is currently shared with the hypervisor, that check would fail. We can
discuss whether or not we would want to allow it, but for now there is
strictly no need for it so I went with the restrictive option. We can
relax that constraint later if need be.

> I think what you should have here, which would work better with the
> comment, is something like:
> 
>                 /* Only host to np-guest multi-sharing is tolerated */
> +               if (pkvm_hyp_vcpu_is_protected(vcpu))
> +                       return -EPERM;
> 
> That would even make the comment unnecessary.

I would prefer not adding this here, handle___pkvm_host_share_guest() in
hyp-main.c already does that for us.

> 
> > +               WARN_ON(!page->host_share_guest_count);
> > +               break;
> > +       default:
> > +               ret = -EPERM;
> > +               goto unlock;
> > +       }
> > +
> > +       WARN_ON(kvm_pgtable_stage2_map(&vm->pgt, ipa, PAGE_SIZE, phys,
> > +                                      pkvm_mkstate(prot, PKVM_PAGE_SHARED_BORROWED),
> > +                                      &vcpu->vcpu.arch.pkvm_memcache, 0));
> > +       page->host_share_guest_count++;
> > +
> > +unlock:
> > +       guest_unlock_component(vm);
> > +       host_unlock_component();
> > +
> > +       return ret;
> > +}
> > diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> > index d5c23449a64c..d6c61a5e7b6e 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> > @@ -795,6 +795,13 @@ int __pkvm_teardown_vm(pkvm_handle_t handle)
> >         /* Push the metadata pages to the teardown memcache */
> >         for (idx = 0; idx < hyp_vm->nr_vcpus; ++idx) {
> >                 struct pkvm_hyp_vcpu *hyp_vcpu = hyp_vm->vcpus[idx];
> > +               struct kvm_hyp_memcache *vcpu_mc = &hyp_vcpu->vcpu.arch.pkvm_memcache;
> > +
> > +               while (vcpu_mc->nr_pages) {
> > +                       void *addr = pop_hyp_memcache(vcpu_mc, hyp_phys_to_virt);
> 
> nit: newline
> 
> Cheers,
> /fuad
> 
> 
> 
> > +                       push_hyp_memcache(mc, addr, hyp_virt_to_phys);
> > +                       unmap_donated_memory_noclear(addr, PAGE_SIZE);
> > +               }
> >
> >                 teardown_donated_memory(mc, hyp_vcpu, sizeof(*hyp_vcpu));
> >         }
> > --
> > 2.47.0.338.g60cca15819-goog
> >

