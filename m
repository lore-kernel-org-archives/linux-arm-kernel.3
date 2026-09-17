Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 486ABC982D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 08:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WwuqijA5uNlk2wAlQ6PUNXgJqRDsKikQxqT1KiBmnQg=; b=RG3DFEpGf8eqW9PUyqs7jx2aGU
	wveqq7ndm1kJ2Dt2W7fqaAbMtIPl1ENxmks3q1ner6IWti2FeXuol0q5YRsogzaHSXFJ6Uh+Qv/hY
	m+1kpQd40nGlVcV3gJJzeLFSOxOrcCVDYJbHRUebv73FC3Bw6i63qsqr16PnhIMWx49qW92gKoscs
	vKghBeNuXBai2clzaf8OytNTg1nli21LK6hePQnIGSdsQAphuXuKNVB2I4X62UNSVi6NeJ21Zuppt
	hGh38rmAFVhyZi5QbKSDxcIl/5tFqBypDatqWKBdxP8es6QYxBjqUrJdFcsfJZ6PP+VrWsSM7eyRl
	Q2V2z8Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x77Qm-0000000AtFw-33Az;
	Thu, 17 Sep 2026 08:25:20 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x77Qk-0000000AtEj-1Fb4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 08:25:19 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-4843796e373so314459f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 01:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789633516; x=1790238316; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WwuqijA5uNlk2wAlQ6PUNXgJqRDsKikQxqT1KiBmnQg=;
        b=sk5lAFvATNG0g5c6vBTR57nm3/2DzBT7OPVwW2KcH2KvMesSfZrc0TF8yxjSi4f405
         VSWO3rfahb6cTuKYAxUyMaKPxJkNctVHdYIx/d+uA8FGGIGGnR7eAlqrGr+AjB2Jhbvu
         hKRXsQH9v0JL4EYCap+q+B82DZxrvjcczm8U5DdG3LyMDesMWxHJWUkStEcA1xG8m+av
         UkufJMbtyfpbFveVY5tl2C1Bu99xfR97sg975Wp439cbxwa2ZXpqzipqHCbsb78GJ7Ew
         emqZTra7kQ4+8wYg3qCBs4ZpRMFZIQTrJ8JyRB7sp3D+l16VCysmILWDjCU/cAmGXjN6
         OoQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789633516; x=1790238316;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WwuqijA5uNlk2wAlQ6PUNXgJqRDsKikQxqT1KiBmnQg=;
        b=Ml7dzpkxfdHUG7KA6qomhKpZGvfmXAqC9F5ndB4Ww8vurTms0ZnaMHtDP6cWbyqXWD
         sXB2KOyMnKLlIYedrP20oMlCdp8SvP7pguX34pPQ4tIqOwMlyyNQRPg75tCH+B4A0/9+
         cH+1XRaCo0rvORAypWLalFSeJVG+ADVQXUDdOr7x2flftge4BDvyJlTloTboOk8PjheH
         XXcPGa220P9j9prRESfWIt/ouv9Y3j+YNSB0Bz2NIrcmtekGqR4hE9bBgnMcOTiyg7rG
         kP9Sm6iA5s8At6Ee5lvAHrO+62AfWwceI3H+88McosrVKhD8SC/Fba9GHwZ8AbxZer07
         q9QQ==
X-Forwarded-Encrypted: i=1; AKwUvBwiJcKP8PKvOfdUD7wv4/qwIXOb8ucqK43yhIjUUCBAAzgJBLeorjlwyT2Zl4ZQMf2BeFBFQBmmF8ah2QLVUU2I@lists.infradead.org
X-Gm-Message-State: AFuF++m+hvHHnFmrIn4mhHFVYDUxc6iREORysUVjaWef1zXTdaFBKm/V
	xajjuGQEiTGzt9rwnJFzj3K0IbLa6KfI9YG5BMyFozzK8Ex8ppnZrvpVrD1DPGOpCg==
X-Gm-Gg: AYBFou0amUKAYhrXVTyg7fi/WfpmS25N4nLDrxmooEBpME05iDXpwuxrVgWNm1UocYm
	3QE3qRVJD+6YvClhRmWP3I7ZHOXLK+lP2/qJiMZd47omFRJrWW7VTOP7Kf9Y6ODeTMUFsxo54pt
	ND/+NWRxuMFIjkLkv+pYLM8Q71GqQFfChp7GMTlC3RB7HdxXYYcEVVns+x0+y7WTZSQiPlyK8pl
	3jrb52jKR/YVkY7tGspA1wKjemJXZGr2D9TnrYfllsXECLRZSJu+fmK696mxsbRVd6Ly3m2n0es
	6yxMinfeUXehNMUYJvTkZd/ucxVQePWjuS3u7cubd7SRw/qx08HOiZws5sXsyCXDdS7l0fOaQOZ
	p9wbAINEPztjCsZpJLQEnO+/+lk81p4AR/sfBq4i0CVGvXJ7W5xPNe4sXYSYMMFMTBizDeRFqBh
	w5TF+NXYIoRokAnT75DCa7FaQLR3KPKL9Xh7Czay3EydIwo+p9MMfNd5516JVyEUoCr6iYq+V1s
	LCgOqpH2wGqjHKmSTQUZfblVkRPzmbpGPmg/tGp+Hs=
X-Received: by 2002:a05:600c:4691:b0:49c:fc6e:a3da with SMTP id 5b1f17b1804b1-49eb733cb1amr69230185e9.25.1789633515867;
        Thu, 17 Sep 2026 01:25:15 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbda77d6fsm39883065e9.0.2026.09.17.01.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 01:25:15 -0700 (PDT)
Date: Thu, 17 Sep 2026 09:25:11 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com,
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, kernel-team@android.com,
	qperret@google.com
Subject: Re: [PATCH v3] KVM: arm64: Fix protected VM fault on system with
 pages larger than 4K
Message-ID: <aquj55DPnqs-AUwM@google.com>
References: <20260915091606.2111217-1-vdonnefort@google.com>
 <CA+EHjTz_c5BS3XgFuv61AtwgxD7WWELwuWZ3crd7_7RMvGA2Gw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTz_c5BS3XgFuv61AtwgxD7WWELwuWZ3crd7_7RMvGA2Gw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_012518_399185_C63F5E54 
X-CRM114-Status: GOOD (  41.61  )
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

On Tue, Sep 15, 2026 at 12:17:21PM +0100, Fuad Tabba wrote:
> Hi Vincent,
> 
> On Tue, 15 Sept 2026 at 10:16, 'Vincent Donnefort' via kernel-team
> <kernel-team@android.com> wrote:
> >
> > Just like commit 08f97454b7fa ("KVM: arm64: Fix protected mode handling
> > of pages larger than 4kB") fixed the boot of non-protected VMs on system
> > larger than 4K pages, align the fault IPA down to the page-size for
> > protected VMs.
> >
> > To paraphrase Marc, pkvm_pgtable_stage2_map() assumes the address passed
> > as a parameter is aligned to the size of the intended mapping, while
> > HPFAR_EL2 gives the IPA minus the bottom 12 bits, regardless of the
> > system page size configuration.
> >
> > Add a check at the start of pkvm_pgtable_stage2_map() as we do not
> > support !PAGE_ALIGNED arguments and ensure callers pass a page-aligned
> > IPA.
> 
> The fix is correct, and I can reproduce the bug. On a 16K-page host an
> unpatched v7.3-rc2 never gets a pVM to a prompt: no guest console
> output at all, a core pegged at 100% when I sampled it a minute in,
> killed at the 120s timeout. A guest_memfd-backed non-protected VM
> times out the same way, while one without guest_memfd boots fine,
> which puts the failure on the two paths you fix. With the patch all
> three boot clean, and 4K still boots both. That is QEMU with kvmtool
> guests; the same three 16K legs also pass on an M4 running pKVM at EL2
> on the silicon.
> 
> Tested-by: Fuad Tabba <fuad.tabba@linux.dev>
> 
> > Fixes: ea03466e806f ("KVM: arm64: Handle aborts from protected VMs")
> 
> A second Fixes: for the gmem_abort() half? a7b57e099592 ("KVM: arm64:
> Handle guest_memfd-backed guest page faults") added that call site,
> and the ranges differ: ea03466e806f is in v7.1, a7b57e099592 in v6.18.
> 
> Should this carry Cc: stable@vger.kernel.org? 08f97454b7fa, the fix
> this one follows, did, and 16K-page hosts are a shipping Android
> configuration.
> 
> > Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
> > ---
> >  arch/arm64/kvm/mmu.c  | 12 +++++++-----
> >  arch/arm64/kvm/pkvm.c |  3 +++
> >  2 files changed, 10 insertions(+), 5 deletions(-)
> >
> > Changelog:
> >
> > v3:
> >   - Fix nested case in gmem_abort() (Sashiko)
> >
> > v2: https://lore.kernel.org/all/20260914075839.4019904-1-vdonnefort@google.com/
> >
> >   - Use gfn_to_gpa(gfn)
> >   - Drop "phys" from the PAGE_ALIGNED check, it isn't a requirement.
> >   - Fix gmem_abort() as well (Sashiko)
> >
> > v1: https://lore.kernel.org/all/20260913173516.3122436-1-vdonnefort@google.com/
> >
> > diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> > index 9ba86450fe4a..e199dd339583 100644
> > --- a/arch/arm64/kvm/mmu.c
> > +++ b/arch/arm64/kvm/mmu.c
> > @@ -1610,6 +1610,7 @@ static int gmem_abort(const struct kvm_s2_fault_desc *s2fd)
> >         bool write_fault, exec_fault;
> >         bool perm_fault = kvm_vcpu_trap_is_permission_fault(s2fd->vcpu);
> >         enum kvm_pgtable_walk_flags flags = KVM_PGTABLE_WALK_SHARED;
> > +       phys_addr_t ipa = ALIGN_DOWN(s2fd->fault_ipa, PAGE_SIZE);
> >         enum kvm_pgtable_prot prot = KVM_PGTABLE_PROT_R;
> >         struct kvm_pgtable *pgt = s2fd->vcpu->arch.hw_mmu->pgt;
> >         unsigned long mmu_seq;
> 
> One more in gmem_abort(): the memory fault exit at mmu.c:1647 still
> reports the unaligned address, and that one is userspace-visible.
> 
>     kvm_prepare_memory_fault_exit(s2fd->vcpu, s2fd->fault_ipa, PAGE_SIZE,
>          write_fault, exec_fault, false);
> 
> api.rst defines the range as [gpa, gpa + size), so on a 16K host it
> starts mid-page. gfn_to_gpa(gfn) is the one to use: gfn is what
> kvm_gmem_get_pfn() failed on, and the L1 IPA in the nested case. x86
> passes fault->gfn << PAGE_SHIFT.
> 
> > @@ -1672,12 +1673,12 @@ static int gmem_abort(const struct kvm_s2_fault_desc *s2fd)
> >                  * PTE, which will be preserved.
> >                  */
> >                 prot &= ~KVM_NV_GUEST_MAP_SZ;
> > -               ret = KVM_PGT_FN(kvm_pgtable_stage2_relax_perms)(pgt, s2fd->fault_ipa,
> > +               ret = KVM_PGT_FN(kvm_pgtable_stage2_relax_perms)(pgt, ipa,
> >                                                                  prot, flags);
> >         } else {
> > -               ret = KVM_PGT_FN(kvm_pgtable_stage2_map)(pgt, s2fd->fault_ipa, PAGE_SIZE,
> > -                                                        __pfn_to_phys(pfn), prot,
> > -                                                        memcache, flags);
> > +               ret = KVM_PGT_FN(kvm_pgtable_stage2_map)(pgt, ipa, PAGE_SIZE,
> > +                                                        __pfn_to_phys(pfn),
> > +                                                        prot, memcache, flags);
> >         }
> >
> >  out_unlock:
> > @@ -1710,6 +1711,7 @@ static int pkvm_mem_abort(const struct kvm_s2_fault_desc *s2fd)
> >         unsigned int flags = FOLL_HWPOISON | FOLL_LONGTERM | FOLL_WRITE;
> >         struct kvm_vcpu *vcpu = s2fd->vcpu;
> >         struct kvm_pgtable *pgt = vcpu->arch.hw_mmu->pgt;
> > +       gfn_t gfn = gpa_to_gfn(s2fd->fault_ipa);
> >         struct mm_struct *mm = current->mm;
> >         struct kvm *kvm = vcpu->kvm;
> >         void *hyp_memcache;
> > @@ -1756,7 +1758,7 @@ static int pkvm_mem_abort(const struct kvm_s2_fault_desc *s2fd)
> >         }
> >
> >         write_lock(&kvm->mmu_lock);
> > -       ret = pkvm_pgtable_stage2_map(pgt, s2fd->fault_ipa, PAGE_SIZE,
> > +       ret = pkvm_pgtable_stage2_map(pgt, gfn_to_gpa(gfn), PAGE_SIZE,
> >                                       page_to_phys(page), KVM_PGTABLE_PROT_RWX,
> >                                       hyp_memcache, 0);
> >         write_unlock(&kvm->mmu_lock);
> > diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
> > index 8e4c6e4bec12..b7340c430ed6 100644
> > --- a/arch/arm64/kvm/pkvm.c
> > +++ b/arch/arm64/kvm/pkvm.c
> > @@ -414,6 +414,9 @@ int pkvm_pgtable_stage2_map(struct kvm_pgtable *pgt, u64 addr, u64 size,
> >         u64 end = addr + size;
> >         int ret;
> >
> > +       if (!PAGE_ALIGNED(addr | size))
> > +               return -EINVAL;
> > +
> 
> Could this be if (WARN_ON_ONCE(!PAGE_ALIGNED(addr | size)))? The three
> checks just below WARN on the same class of caller bug, and this one
> runs first, so a bad size now returns -EINVAL with no splat.
> 
> With the memory fault exit fixed:
> Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
> 
> Cheers,
> /fuad

Thanks Fuad,

I'll modify that. Although in the new respin I will also add support for
kvm_s2_fault_vma_info(), which should naturally fix that issue, just like Marc
suggested [1]


[1] https://lore.kernel.org/all/864ifs6xn4.wl-maz@kernel.org/

-- 
Vincent

> 
> >         lockdep_assert_held_write(&kvm->mmu_lock);
> >         mapping = pkvm_mapping_iter_first(&pgt->pkvm_mappings, addr, end - 1);
> >
> >
> > base-commit: df2908090cda368b01ff43709f51890076c56157
> > --
> > 2.55.0.1032.g73a4cd73de-goog
> >
> > To unsubscribe from this group and stop receiving emails from it, send an email to kernel-team+unsubscribe@android.com.
> >
> 
> To unsubscribe from this group and stop receiving emails from it, send an email to kernel-team+unsubscribe@android.com.
> 

