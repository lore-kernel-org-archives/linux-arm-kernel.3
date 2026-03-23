Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCC87F46137
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 14:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=abMc/+RpRXqb6A157XT9WeH6XIAGt3sWmMtm4v19n84=; b=f9Yt5eKPtv3rg89JD2RnSjaTgC
	uOvamPmZOEFPqH3NCPD5ZUlb3iF+kUQPJRMZbmBXcG/ZlN/f5o3tVMC5HDRGzODV5eSKbMRVsdC95
	59XONvCSl8WuAlD6p9OP1yrcAxybPQ+XJqX6kYOpTq+HZLMSjI6KXHk3rRk83k3qho1XTckNJDt0c
	ZNrfGtr9se5bJEf+3N/LUAK+Zdmf3DkYAS4CzF7GltalWrEP0RUi+oYBtODvH1uvhHU8m0j2NyKUd
	Qa/EfKf3bIWzkDEIQi1TacX6WBi/RZ95ZikEKvLF5RsuEBPCUMpvmN10K6JmYXkBww/5T9XxzEMRe
	FdNiJ6Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4gkF-0000000Gxud-2RyZ;
	Mon, 23 Mar 2026 14:59:07 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4gkA-0000000Gxts-3tpv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 14:59:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7799B43698;
	Mon, 23 Mar 2026 14:59:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2356C2BCB1;
	Mon, 23 Mar 2026 14:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774277942;
	bh=LPRdzg8aaZAuXnZ8jK5A6DbpFDyp7diOg/t+NXwG7Pc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hxJjPJ8WCX9THBHg3LzrpsZaffD1n/kXXOubCDQCFgtZFmgPhAPGxNWHRjVWggDv5
	 OGxsoiLUPjcmNckiTBLEpTPuO2OTvlHCjAHW385ln2fMbRsxwe66wjo0+44H5W5afp
	 h8pBRCH2zhGkYTPBBznBAe9Bhrmj14pqSuxt6SU+poedO6U9y0eLewkYqNfHU4qhu9
	 2xnLbaSDyx4Diq4tM940y2kaVr2QsDV7+jGgIye7AasTUGS7Ka6nsohP8nZdLeBzaX
	 8KuukZJkmbvIZ1o+bG9YC+Z0VEH7oTfFVtcVPQwp661GewzXXt4EplJlcOEtghcKZN
	 fS5UisRxtWXpA==
Date: Mon, 23 Mar 2026 14:58:56 +0000
From: Will Deacon <will@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Quentin Perret <qperret@google.com>, Fuad Tabba <tabba@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Mostafa Saleh <smostafa@google.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>
Subject: Re: [PATCH v3 26/36] KVM: arm64: Return -EFAULT from VCPU_RUN on
 access to a poisoned pte
Message-ID: <acFVMCb0pMY7r46_@willie-the-truck>
References: <20260305144351.17071-1-will@kernel.org>
 <20260305144351.17071-27-will@kernel.org>
 <86341u5uhr.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86341u5uhr.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_075903_031159_12704707 
X-CRM114-Status: GOOD (  31.64  )
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

On Fri, Mar 20, 2026 at 04:35:44PM +0000, Marc Zyngier wrote:
> On Thu, 05 Mar 2026 14:43:39 +0000,
> Will Deacon <will@kernel.org> wrote:
> > diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > index 4ff31947579b..7f705f662c40 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > @@ -890,6 +890,49 @@ static int get_valid_guest_pte(struct pkvm_hyp_vm *vm, u64 ipa, kvm_pte_t *ptep,
> >  	return 0;
> >  }
> >  
> > +int __pkvm_vcpu_in_poison_fault(struct pkvm_hyp_vcpu *hyp_vcpu)
> > +{
> > +	struct pkvm_hyp_vm *vm = pkvm_hyp_vcpu_to_hyp_vm(hyp_vcpu);
> > +	kvm_pte_t pte;
> > +	s8 level;
> > +	u64 ipa;
> > +	int ret;
> > +
> > +	switch (kvm_vcpu_trap_get_class(&hyp_vcpu->vcpu)) {
> > +	case ESR_ELx_EC_DABT_LOW:
> > +	case ESR_ELx_EC_IABT_LOW:
> > +		if (kvm_vcpu_trap_is_translation_fault(&hyp_vcpu->vcpu))
> > +			break;
> > +		fallthrough;
> > +	default:
> > +		return -EINVAL;
> > +	}
> > +
> > +	/*
> > +	 * The host has the faulting IPA when it calls us from the guest
> > +	 * fault handler but we retrieve it ourselves from the FAR so as
> > +	 * to avoid exposing an "oracle" that could reveal data access
> > +	 * patterns of the guest after initial donation of its pages.
> > +	 */
> > +	ipa = kvm_vcpu_get_fault_ipa(&hyp_vcpu->vcpu);
> > +	ipa |= kvm_vcpu_get_hfar(&hyp_vcpu->vcpu) & GENMASK(11, 0);
> 
> nit: we now have FAR_TO_FIPA_OFFSET() for this.

Neat, I'll use that. Thanks.

> > diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
> > index 32294bd21dde..da0a45dab203 100644
> > --- a/arch/arm64/kvm/pkvm.c
> > +++ b/arch/arm64/kvm/pkvm.c
> > @@ -417,10 +417,13 @@ int pkvm_pgtable_stage2_map(struct kvm_pgtable *pgt, u64 addr, u64 size,
> >  			return -EINVAL;
> >  
> >  		/*
> > -		 * We raced with another vCPU.
> > +		 * We either raced with another vCPU or the guest PTE
> > +		 * has been poisoned by an erroneous host access.
> >  		 */
> > -		if (mapping)
> > -			return -EAGAIN;
> > +		if (mapping) {
> > +			ret = kvm_call_hyp_nvhe(__pkvm_vcpu_in_poison_fault);
> > +			return ret ? -EFAULT : -EAGAIN;
> > +		}
> 
> I guess this considers that racing against another vcpu is an unlikely
> situation, because calling back into EL2 and walking the PTs isn't
> exactly cheap.

Yeah, I wanted to avoid walking the stage-2 page-table at EL2 on every
fault, so it ends up being deferred to here in the case that we find an
existing mapping for the faulting IPA.

> I wonder if there is a mechanism we could use to directly return this
> information to the host at the point of the guest fault. The only
> things I can figure out would require the PTE to be valid (access or
> permission faults, for example), and that'd break the "full PTE
> dedicated to annotations"...

Oh, I see what you mean... using the fault type as a proxy feels like it
probably won't scale so well if we ever want to use those faults for
anything else.

If we want to optimise the common case, perhaps I could set a flag in
the host kvm structure (from EL2) when the page is poisoned in
__pkvm_host_force_reclaim_page_guest() and then check that here? In that
case, only VMs that have had a page forcefully-reclaimed will issue the
hypercall. There's a race, but I think it's ok because we'll get -EAGAIN
and pick up the flag the next time around.

WDYT? It might be premature optimisation, but it also feels do-able?

Will

