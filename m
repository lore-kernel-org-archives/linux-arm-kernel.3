Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D39BD1A63D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 14:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=za7aSCoRfCKz3YRGbYQz8dYRco36U5ju30Hz02xGnNI=; b=XwIAgFaBwN00GyZoWBtcJW28rl
	H3y1z8lLBfT05Fd6AH+Kqvg1f7L2kP0lDS+ttpmWaTvmvY1bIR3FcJ3drQjqrpib5cDhZui/kZh8c
	JKwp6MlTMhlGpMEEplldzAHrjAjg749yD+pnju9nkr6Tnxx0dt8PV3AsUcGDGeftXOqRfP0jkFEk9
	PueEt5tzZFKfBFnxzaUhyygdaELypSoOsq0Bc+DD90NCp1touqWF3Q+S8Sw83ZdJHQ3szu0eK3bC4
	JYuQGqDVfxOmpc4TQeXm2mpfVNx07uOj0trp6tGEunGzdTzVG+4JZMwjtM+vsrt1YhchaVE+4IDQs
	x1xVHlJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veDvT-00000002RSO-01IH;
	Fri, 09 Jan 2026 14:57:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veDvR-00000002RS1-1BWb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 14:57:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4D00B60169;
	Fri,  9 Jan 2026 14:57:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD3F8C4CEF1;
	Fri,  9 Jan 2026 14:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767970636;
	bh=EgVOgppE0QVkNnPDXFr+N84SqaD4XzCNSJ8pyoYn0Dw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sZFDYhKCVm16J/cNJ7SPbLse1ZrRv9Mr8pks+0M//BKfDUx8bM6rEcgjSRxTnwKI5
	 VBVMEiKqV4tGWqTp5sHyQD7BcvOyK3xjAPyuX1DDkmjsBVByLRfxmi8XSAb5gpohgy
	 /Qhn0hQ47jj1JVEN5gykEuphvHJ1OWVoaqGUdfr3gbP5bSoSN/4HDLnrr1llshBPn1
	 +vixNttvCAK5ft2RdKWTqST37jJ5pptdwQ14SiQSaSfn0ngITj1vsZUdrfPyPG0+fF
	 jHkRkCdw9GMTV3d1BTHBCQJ+vlUaJglXXje/T7mf2xvJ/L8ptvkMeaL71Fghn10pkU
	 65BurgfnUJN4Q==
Date: Fri, 9 Jan 2026 14:57:10 +0000
From: Will Deacon <will@kernel.org>
To: Quentin Perret <qperret@google.com>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Fuad Tabba <tabba@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Mostafa Saleh <smostafa@google.com>
Subject: Re: [PATCH 22/30] KVM: arm64: Return -EFAULT from VCPU_RUN on access
 to a poisoned pte
Message-ID: <aWEXRgagcULlftqk@willie-the-truck>
References: <20260105154939.11041-1-will@kernel.org>
 <20260105154939.11041-23-will@kernel.org>
 <s4p2ximtz7pki3waw245jtbl5znuco2ijrzsddlmln5x6rgxee@qbek4vpwn3kl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s4p2ximtz7pki3waw245jtbl5znuco2ijrzsddlmln5x6rgxee@qbek4vpwn3kl>
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

On Tue, Jan 06, 2026 at 03:54:06PM +0000, Quentin Perret wrote:
> On Monday 05 Jan 2026 at 15:49:30 (+0000), Will Deacon wrote:
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
> > +	ipa = kvm_vcpu_get_fault_ipa(&hyp_vcpu->vcpu);
> > +	ipa |= kvm_vcpu_get_hfar(&hyp_vcpu->vcpu) & GENMASK(11, 0);
> 
> Why is all the above needed? Could we simplify by having the host pass
> the IPA to the hcall?

I was just a little nervous about exposing an oracle here if we take the
gfn as an argument as it would provide the host with a pretty easy
mechanism to monitor the page access pattern of a guest after the initial
donation had occurred.

> > +	guest_lock_component(vm);
> > +	ret = kvm_pgtable_get_leaf(&vm->pgt, ipa, &pte, &level);
> > +	if (ret)
> > +		goto unlock;
> > +
> > +	if (level != KVM_PGTABLE_LAST_LEVEL) {
> > +		ret = -EINVAL;
> > +		goto unlock;
> > +	}
> > +
> > +	ret = guest_pte_is_poisoned(pte);
> > +unlock:
> > +	guest_unlock_component(vm);
> > +	return ret;
> > +}
> > +
> >  int __pkvm_host_share_hyp(u64 pfn)
> >  {
> >  	u64 phys = hyp_pfn_to_phys(pfn);
> > diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
> > index d1926cb08c76..14865907610c 100644
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
> 
> It's not too bad, but it's a shame we now issue that every time we have
> such a race (which is frequent-ish). Could we perhaps only issue it if
> at least one page has been forcefully reclaimed since boot?

On the plus side, it avoids an unconditional walk from the fault path
at EL2 (which is what we have in Android!).

It's a bit fiddly to implement your idea in the host, since the forceful
reclaim happens in a really terrible context but I could track it at EL2
and make __pkvm_vcpu_in_poison_fault() return early instead? It's also
worth bearing in mind that we've already serialised the concurrent fault
and done a GUP by this point, so performance is somewhat of a lost
cause...

WDYT?

Will

