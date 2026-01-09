Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50E06D26D6F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 17:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gdLMQN7nlydzaVPYboBXdv0N81Xep/7G1lCHqsGeP5w=; b=DppCCL0WS94ihfXxmivaVO2XVB
	jY1DFAbJXORG4bXCcXlnzP91oFK6/FBp/xvU36rSopYYAwpGygCm0tOp8+Cll1eR+nKdFs0AIPa+b
	NgQeo8cx+cP3cF8VziADSu4r7/Gj/foJ5oMLSbqNjFlXMrISrld0XG8hfmrmNQOy9kDVng/McCjjP
	BjTdpK+CVOyr07PHdfAIir0G9erCmqnuIP3CUBowbkJoVNVBij+jl66tx5R7NmZRJFz9hIheaZig7
	Y72E2nrcdZnqeaNE5Jo5OUm5PE94BFGHfkLtc1GHKUCk8qWzZzo/Lo+dc4jGs0j0ffSpozch0R3zh
	g5asD0gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veGOR-00000002qE6-1bdY;
	Fri, 09 Jan 2026 17:35:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veGOP-00000002qDw-3dqw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 17:35:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 43C61600B0;
	Fri,  9 Jan 2026 17:35:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F5D4C4CEF1;
	Fri,  9 Jan 2026 17:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767980121;
	bh=6AWsDeYymU1uIp2ik74l/pNTTqrSRlBKEBODIVwNn7Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Osfv6+a01A/EvgTnC3g5JXiMANFu2/qTGFvuY662F325idunISqC3XkkhXXjIrQ02
	 +RcyTn/oJf2kfeSW/6tOWjb3g1lqkf8O3xZP2FaTGxmFAQPuMK0wsQXlZeGMwr01l5
	 QTBjqiaXG5yrN8q27mQxacxEe5ytAn7xskwDKy3S+ZUzjRd8eP8rFAeI+4znXk4zkH
	 UzPMFu17PcEGaG0YS6OuFA34gPmRJFwbch4IpVHgjVzUBXVfnUlMoUrKWbp+A3abSq
	 OwyJGJVWbC2Y7SSyphCmoj8R2BQOziyoIvVQa7gzTVvKGLkjtLSpzPQB/avOor2ih6
	 vw1m795Ke8gXQ==
Date: Fri, 9 Jan 2026 17:35:15 +0000
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
Message-ID: <aWE8U2JsGozpYZCA@willie-the-truck>
References: <20260105154939.11041-1-will@kernel.org>
 <20260105154939.11041-23-will@kernel.org>
 <s4p2ximtz7pki3waw245jtbl5znuco2ijrzsddlmln5x6rgxee@qbek4vpwn3kl>
 <aWEXRgagcULlftqk@willie-the-truck>
 <vs26wb435olhc4p5b4owotm5zzwr2znwafsgfskkicymj25mbj@nllj54ubgtgl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <vs26wb435olhc4p5b4owotm5zzwr2znwafsgfskkicymj25mbj@nllj54ubgtgl>
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

On Fri, Jan 09, 2026 at 03:29:38PM +0000, Quentin Perret wrote:
> On Friday 09 Jan 2026 at 14:57:10 (+0000), Will Deacon wrote:
> > On Tue, Jan 06, 2026 at 03:54:06PM +0000, Quentin Perret wrote:
> > > On Monday 05 Jan 2026 at 15:49:30 (+0000), Will Deacon wrote:
> > > > +int __pkvm_vcpu_in_poison_fault(struct pkvm_hyp_vcpu *hyp_vcpu)
> > > > +{
> > > > +	struct pkvm_hyp_vm *vm = pkvm_hyp_vcpu_to_hyp_vm(hyp_vcpu);
> > > > +	kvm_pte_t pte;
> > > > +	s8 level;
> > > > +	u64 ipa;
> > > > +	int ret;
> > > > +
> > > > +	switch (kvm_vcpu_trap_get_class(&hyp_vcpu->vcpu)) {
> > > > +	case ESR_ELx_EC_DABT_LOW:
> > > > +	case ESR_ELx_EC_IABT_LOW:
> > > > +		if (kvm_vcpu_trap_is_translation_fault(&hyp_vcpu->vcpu))
> > > > +			break;
> > > > +		fallthrough;
> > > > +	default:
> > > > +		return -EINVAL;
> > > > +	}
> > > > +
> > > > +	ipa = kvm_vcpu_get_fault_ipa(&hyp_vcpu->vcpu);
> > > > +	ipa |= kvm_vcpu_get_hfar(&hyp_vcpu->vcpu) & GENMASK(11, 0);
> > > 
> > > Why is all the above needed? Could we simplify by having the host pass
> > > the IPA to the hcall?
> > 
> > I was just a little nervous about exposing an oracle here if we take the
> > gfn as an argument as it would provide the host with a pretty easy
> > mechanism to monitor the page access pattern of a guest after the initial
> > donation had occurred.
> 
> Aha, I see what you mean. I guess if we scope that hcall to only
> discover if a gfn is poisoned we're not exposing too much, but
> contextualizing the call to the fault also sounds good to me. Perhaps a
> small comment would help?

Good idea, I'll add something to the hypercall.

> > > > diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
> > > > index d1926cb08c76..14865907610c 100644
> > > > --- a/arch/arm64/kvm/pkvm.c
> > > > +++ b/arch/arm64/kvm/pkvm.c
> > > > @@ -417,10 +417,13 @@ int pkvm_pgtable_stage2_map(struct kvm_pgtable *pgt, u64 addr, u64 size,
> > > >  			return -EINVAL;
> > > >  
> > > >  		/*
> > > > -		 * We raced with another vCPU.
> > > > +		 * We either raced with another vCPU or the guest PTE
> > > > +		 * has been poisoned by an erroneous host access.
> > > >  		 */
> > > > -		if (mapping)
> > > > -			return -EAGAIN;
> > > > +		if (mapping) {
> > > > +			ret = kvm_call_hyp_nvhe(__pkvm_vcpu_in_poison_fault);
> > > 
> > > It's not too bad, but it's a shame we now issue that every time we have
> > > such a race (which is frequent-ish). Could we perhaps only issue it if
> > > at least one page has been forcefully reclaimed since boot?
> > 
> > On the plus side, it avoids an unconditional walk from the fault path
> > at EL2 (which is what we have in Android!).
> > 
> > It's a bit fiddly to implement your idea in the host, since the forceful
> > reclaim happens in a really terrible context but I could track it at EL2
> > and make __pkvm_vcpu_in_poison_fault() return early instead?
> 
> I guess EL2 could easily publish something in the host kvm struct as
> well if we really wanted to, it's pinned as shared with EL2 and
> accessible from the hyp_vm, which we retrieve in the force reclaim path.

Ah yeah, that sounds do-able.

> > It's also
> > worth bearing in mind that we've already serialised the concurrent fault
> > and done a GUP by this point, so performance is somewhat of a lost
> > cause...
> 
> That is very true, so happy to keep all these micro-optimization for
> later.

Sounds good to me. We'll have a bunch of performance work once the
functionality is there, so I'll leave this part as-is for now.

Will

