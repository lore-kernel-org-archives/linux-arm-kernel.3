Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C14F5FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 14:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6dapWbfdaH3qRNQs2tgvGaffgEEHsGjHti7EKce5ja8=; b=uU13qV6xzd40hk0BGbmBA+p468
	R4lKtDeL9/PvfoUegjqdBtGafWTbvlwOYexSBQhjVaj07bCyAsefzCZ589N7lUXerlk9mSrgnea7D
	gAimR9opZVHrjkzLgyMRvSoIaVkDwD+KdiO4cBtEyYRAgAzVQpcdRgUtMNGpMVbtSw+i0y8wqRUu4
	KDmStd/yj9pbgsTRT86WDOUg+txH4+xuL3xbosNA46OpG4k/P/DP3nSaJuHrNOlodcmFw34ke3GST
	+RCM235ZT5rHrkwNESTCe1u/rjQZeNh+4eJJV6IJIm/Mdnwl6+r2lMLqIzo9+YQChVrS2PPGdCMxC
	Us1SBNKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHjZ5-00000001fWe-0Kk7;
	Tue, 28 Apr 2026 14:37:31 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHjZ3-00000001fWJ-16fA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 14:37:30 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-50d6b393d60so86841cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 07:37:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777387047; cv=none;
        d=google.com; s=arc-20240605;
        b=j04dE/+e/i2jxIqysRYiDvr6Gkq3sKzP9juQgKEsdt4/43m86MBMDEo3HNVYFsEGjh
         aIW1yWv6ckAoQuPim4y0eXLf7J4zUtipEk8jczuguEQTcMWrQA4ushJfJLaG3dkeMS6K
         1cXopE4zL5Uv3RD1bmGEQ+75G8oTJ1S2Z5Q5bI5+D5obISLprF9YBS5et2oHAtZXrvR3
         UWFODX6H9RXOekJF8cjCYT9gZSZuXz85VKveIC2nw7jT/fAPC9jS9uYqJWlAbkPYvRRu
         ptSySd1WBMthWmobAuuwzqOFpIeuG0uo+h69QyYiXRU29Nu6TW63Z8SXflJ+CCsIXDVs
         aUVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6dapWbfdaH3qRNQs2tgvGaffgEEHsGjHti7EKce5ja8=;
        fh=YNlQnDY9Nj1EIGuGm0TmNOO+U1gqog0k7jBk9+Z2ex8=;
        b=Ueifz1/m6D4upyakGrHcxsHRO/sv04HNNieg41AmK3Rts1Mxqgd75GOQBGJAFS6dOq
         VGu/N78I8ugqJWBYUQdMe+2SZ2OeKXbmC+aCwx57qxCrZhxezKhyyQwHnS36m0tXpEd9
         BVJWBLRuWa1AladrtBKI3k1hh+DY+bauFVyYTfr5GNx0ZHrRfs0/MQSB5dSkzf7aDkkr
         fkE453EvC/amReJc1rEoOYfgKzwVq2B153qKZVjmhWWCXomn1qy4mHIed41ofMHvLT2O
         GhC8uEWPEIqiYf6H89LlrYgzgIo3xPMZYkA4qCPiNEZKskHtKbOIJi3UT/nzxsFXDMZU
         aVJw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777387047; x=1777991847; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6dapWbfdaH3qRNQs2tgvGaffgEEHsGjHti7EKce5ja8=;
        b=GNQtngnQsJMzG3UmarDDvahZI9ydtnVsSFAmpNVGBWhXH3foQ/QuJYIX+3jkmVx8ax
         +BESyIbJMAB+9HrEa0H4pMXfaystmFKIwEZ9y0+C2zPxyShqO3qFRzfLIPLrNmIgWBTv
         2pgKAbZMnNtBpe2ZXaN0EBI0Ajs1iB3Yf6FL3lfW4DQab6FcYuZ2Dzhyj7t2x58HnvwO
         ohBHZK8GVkLLj4v51ZdaTqd8nrxTTkjT0U4C+SdEXchEGh1JsnxZeGrbwsQmTVmC5iPl
         KUtiTOsW/NKflvXgBWVIby1tPQm5kseSHkiEZm7L/dx9tzXXBthreFM0zrUQ3Sab1hB1
         3YiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777387047; x=1777991847;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6dapWbfdaH3qRNQs2tgvGaffgEEHsGjHti7EKce5ja8=;
        b=ld7yof0ZMrPf409peVtEJJrZNgMdReR8lqoleKXR4oLevjRHkD11LynvyNebWAmpbs
         MTpJ3FKP40ubcAl1Pm4Rf3Jj3PutOwXBNCEW5KuKkdLbwTd+nhsTyxMUQm7f7E12WOXT
         9Z6TyxI88V2V4FEOkk3p612tjExuVyu6hGaTbOVOt/5AX1gS3z4EgZUxNMQLQpmsE12a
         p4H6oyUR9V8sDvhmbpeEAGM59krzAnCn1Lksx/tFe0ZNoxfnwG+eaiKi8Tjqe/Pxqd2k
         /SBQWi3pntvmTvTZ/dItxg1Sti47Jkg+yCDRX6/WB2fit6yUZGjxsk/8Cszk4bBvIkY+
         NUyQ==
X-Forwarded-Encrypted: i=1; AFNElJ8y8qkiNh//JtwogDG3QERqwVaQppONB5yU/Nzbah6V4i8VP6uChtPrLCkeJ27/TTmtmKHUkRp6SkCaqnL1UwoM@lists.infradead.org
X-Gm-Message-State: AOJu0YxFV73nLRzWwJehthTRaAJ9tSRfIXAaEcdx1kv9sN5SocaMlMny
	yQSGprJvhUmPvmzk/bJC2sS5jHzdIsASs1Bx6iFg1LDF+n9X6fHupAmUTm3BjFMeA7fBnRpjeuF
	xPjs5rLOCQqmix+xuNcWLgxPxkpROtyrqBrRo+yZM
X-Gm-Gg: AeBDieuW0LEh6+f0BsSviaraVSwLiRK9d3WbKsnL4o28+SMEtbWIMREwgxMXrQKFuTU
	IK5rOg4FOk2PmYq7LnQXoQh8GOjIEqSyXw7EOJqefotpbKWVEZQ3G4XJVemabiDrNFoVrZx2cqY
	CoBA4I1nb700wRFFbn15PpniqqiRlsv6rShNieOUPltK35jUlZSu6wu10vr2LjCtH9E9k2v967z
	17U+eeLWmOKi9+B4BScwvM1CfwTG4oDqxwpKg9UBfwZPXag848+gWbuWHj9VpuS/RKEG4AZe052
	tdRBUOlW7qoVkyxHWppr8UliwIz+vx7x+3a4asDfU7a7C2NkDFANlL7h8m9tUQs=
X-Received: by 2002:ac8:5d52:0:b0:509:174d:3224 with SMTP id
 d75a77b69052e-5100ddadccdmr13763831cf.11.1777387040604; Tue, 28 Apr 2026
 07:37:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260428103008.696141-1-tabba@google.com> <20260428103008.696141-7-tabba@google.com>
 <afC5_jrTEVRfJ77x@willie-the-truck>
In-Reply-To: <afC5_jrTEVRfJ77x@willie-the-truck>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 28 Apr 2026 15:36:43 +0100
X-Gm-Features: AVHnY4KUvLQVQvqOYoHKFrGRxCQZYRY1ccfXZN-JSVf8ghDHejXfq6Fa9ThLlXs
Message-ID: <CA+EHjTyTy2qLm=CbOOYR6rmjg5tH38PifAV+qAhbZxidY5szxQ@mail.gmail.com>
Subject: Re: [PATCH 6/8] KVM: arm64: Propagate stage-2 map failure on
 host->guest donation
To: Will Deacon <will@kernel.org>
Cc: maz@kernel.org, oliver.upton@linux.dev, james.morse@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, qperret@google.com, 
	vdonnefort@google.com, catalin.marinas@arm.com, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_073729_327772_BC23E0E1 
X-CRM114-Status: GOOD (  44.65  )
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

Hi Will,

On Tue, 28 Apr 2026 at 14:45, Will Deacon <will@kernel.org> wrote:
>
> On Tue, Apr 28, 2026 at 11:30:06AM +0100, Fuad Tabba wrote:
> > __pkvm_host_donate_guest() flips the host stage-2 PTE for the donated
> > page to a non-valid annotation (KVM_HOST_INVALID_PTE_TYPE_DONATION,
> > owner =3D PKVM_ID_GUEST) via host_stage2_set_owner_metadata_locked()
> > and then calls kvm_pgtable_stage2_map() to install the matching guest
> > stage-2 mapping. The map's return value was wrapped in WARN_ON() and
> > otherwise discarded.
> >
> > At EL2 in nVHE/pKVM, WARN_ON() is not warn-and-continue: it expands
> > to a BRK that enters the invalid-host-el2 vector and branches to
> > hyp_panic(), declared __noreturn. WARN_ON of a reachable failure at
> > EL2 is a panic primitive, not a debug aid.
> >
> > kvm_pgtable_stage2_map() can fail in reachable ways even at PAGE_SIZE
> > granularity: __pkvm_host_donate_guest() verifies PKVM_NOPAGE for the
> > guest IPA before the map, meaning no valid stage-2 entry exists. The
> > walker must allocate new page-table pages from the vcpu memcache to
> > install the mapping, returning -ENOMEM if exhausted. The host
> > controls the vcpu memcache via the topup interface, so an
> > under-provisioned donation request converts a recoverable error into
> > a fatal hyp panic.
> >
> > Capture the stage-2 map return value and propagate it. The walker
> > may have installed partial leaf entries for the IPA before failing,
> > so unmap the range to clear them; otherwise the guest would retain
> > stage-2 access to a page the host is about to reclaim as
> > PKVM_PAGE_OWNED. Then roll back the host stage-2 mutation: the only
> > forward mutation is host_stage2_set_owner_metadata_locked() flipping
> > the host vmemmap from PKVM_PAGE_OWNED to PKVM_NOPAGE and the host
> > stage-2 PTE from idmap to invalid+annotation.
> > host_stage2_set_owner_locked(_, _, PKVM_ID_HOST) restores both.
> >
> > The rollback calls host_stage2_set_owner_locked() under WARN_ON.
> > This is the correct use: host_stage2_set_owner_metadata_locked()
> > just wrote the host leaf PTE as an invalid+annotation entry, so the
> > reverse idmap rewrite cannot require new page-table allocation =E2=80=
=94 it
> > rewrites the leaf in-place. The WARN_ON asserts an impossible state
> > under correct EL2 execution, semantically distinct from the misuse
> > being fixed.
> >
> > Fixes: 1e579adca177 ("KVM: arm64: Introduce __pkvm_host_donate_guest()"=
)
> > Signed-off-by: Fuad Tabba <tabba@google.com>
> > ---
> >  arch/arm64/kvm/hyp/nvhe/mem_protect.c | 27 ++++++++++++++++++++++++---
> >  1 file changed, 24 insertions(+), 3 deletions(-)
> >
> > diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp=
/nvhe/mem_protect.c
> > index 7044913a0758..b8c57a95e9bf 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > @@ -1391,9 +1391,30 @@ int __pkvm_host_donate_guest(u64 pfn, u64 gfn, s=
truct pkvm_hyp_vcpu *vcpu)
> >       meta =3D host_stage2_encode_gfn_meta(vm, gfn);
> >       WARN_ON(host_stage2_set_owner_metadata_locked(phys, PAGE_SIZE,
> >                                                     PKVM_ID_GUEST, meta=
));
> > -     WARN_ON(kvm_pgtable_stage2_map(&vm->pgt, ipa, PAGE_SIZE, phys,
> > -                                    pkvm_mkstate(KVM_PGTABLE_PROT_RWX,=
 PKVM_PAGE_OWNED),
> > -                                    &vcpu->vcpu.arch.pkvm_memcache, 0)=
);
> > +     ret =3D kvm_pgtable_stage2_map(&vm->pgt, ipa, PAGE_SIZE, phys,
> > +                                  pkvm_mkstate(KVM_PGTABLE_PROT_RWX, P=
KVM_PAGE_OWNED),
> > +                                  &vcpu->vcpu.arch.pkvm_memcache, 0);
> > +     if (ret) {
> > +             /*
> > +              * Stage-2 map can fail mid-walk (e.g. -ENOMEM from the
> > +              * memcache), leaving partial leaf entries installed in t=
he
> > +              * guest stage-2. Tear them down before rolling back the =
host
> > +              * stage-2; otherwise the guest would retain access to a =
page
> > +              * the host is about to reclaim as PKVM_PAGE_OWNED.
> > +              */
> > +             kvm_pgtable_stage2_unmap(&vm->pgt, ipa, PAGE_SIZE);
>
> Whoa, whoa, whoa.
>
> First of all, this is mapping a single page, so the comment talking about
> "leaf entries" (plural) is bogus. If an operation to map a single page
> fails, then it makes no sense to try unmapping the mapping which we
> failed to create. What do you expect it to do?
>
> On the other hand, if we extend this to handle ranges in future (which
> presumably we'll want as part of the THP support) then wouldn't this
> mean that a concurrent vCPU could have transiently written to the pages
> that _did_ get mapped, and now we're going to give those back to the
> host? That's really not ok! We're relying on these WARN_ON()s being
> fatal and they shouldn't fail because we perform all the permission
> checks first, in a separate pass.
>
> If you want to improve this, then I think the options are either:
>
>   1. Check that the the memcache is topped up first
>   2. Poison the page (similar to the forced-reclaim path)
>   3. Tell the host about the pages it's lost and maybe it can leak them
>
> (I vote for (1))
>
> But we absolutely cannot do the simple rollback for the ownership
> changes; that's why the code is written to do the checks up-front. Your
> other patches at the end of this series have different flavours of the
> same issue.
>
> If it's just about keeping the LLM happy, then either fix the LLM or
> make these BUG_ON() (in conjunction with (1) above).

You're right, and no, it's not just about keeping em happy :D

The "leaf entries" comment on the single-page donate path is wrong, and
more importantly the rollback model is unsound. The right fix is to tighten
the precondition, not to handle a failure that shouldn't be reachable.

V2 will drop two patches (in addition to the HCR_EL2 one), and will be
as follows:

1. host->guest share and host->guest donate (kept, rewritten): add a
   memcache-sufficiency check during the existing pre-check pass
   (option 1) and return -ENOMEM cleanly without touching any state.
   Restore the WARN_ON() on the subsequent kvm_pgtable_stage2_map() =E2=80=
=94
   with the topup precheck it asserts an established invariant rather
   than ignoring a reachable error.

   For the single-page donate, "topped up" is
   KVM_PGTABLE_LAST_LEVEL - vm->pgt.start_level (mirroring host EL1's
   kvm_mmu_cache_min_pages). For multi-page share I plan to use the
   conservative nr_pages * (LAST_LEVEL - start_level) bound and flag it
   as conservative in the commit message; happy to compute a tighter
   alignment-aware bound if you'd prefer.

2. guest->host share and guest->host unshare (dropped): on reflection
   these shouldn't have been in V1 at all. As I did note in the commit
   message, failure path is not reachable. Again, too eager to make
   use of the new prompts.

I'll repost this as V2 if you agree.

Cheers,
/fuad

>
> Will

