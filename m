Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0622AD26D6A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 15:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zPBnskPpYnDrBKJagTKqMfwyx58rk4gEgkXSmBAM15I=; b=O/6xg3OOlHu8Hq6tdPHCVyzG9X
	g189zhaYPY9ydZN8hqTmSg8ZgsOgZOo+oUoL7QXS4hdPBb0poYwFbJuwHWV+r667+2vc7Cz9m9PuT
	1/P/sXB3iA1nac5jxWNlhrdLSXW/W34CsqiPrLsn5PE+WbTQFFZiKYw4qOS920uw+0/jIByP7/bBA
	5bjUfLDt6Xge+EbfuZgPFZrczzu+4WHgNNuK6il6quVSU4z+CCI/HfGFQl9hyV3I6mSSe0iinARcE
	6pQQ0W8KqrefzLOojmpxAsh2ON8y6ownZy8Egsc5e8gevOVMdvVIbeCzA+3qRxYcNe6ceHuhdZ/7O
	Osf7u9Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veEQv-00000002Ul9-2XVS;
	Fri, 09 Jan 2026 15:29:49 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veEQr-00000002Ufw-3DYx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 15:29:48 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-382f0732612so24182141fa.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Jan 2026 07:29:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767972583; x=1768577383; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zPBnskPpYnDrBKJagTKqMfwyx58rk4gEgkXSmBAM15I=;
        b=JIcMcHGArNI1Xiy9BfDPMV6OxgtH1U8F1padY00z9D+NKyNaS6kxZfMlXddB06vgzv
         /yHvh+zUlFLvKRwrEnWexbEe8KjbWk0eIrin5E0sy7cYBbN8pny9hVV01LbTnFvmMZsR
         YyaRc+jpHjzenJIW9H63XbHLxc5BLT1dM/Y+2/vopX1Mfazzzw73hBjVpc5IHoEs0/gy
         HhVWN1aAkMZRKRaxoADOapAlcXs9uew8khPPZftJlSJsRhRylrjCTvUN1NRaltq2ci3e
         arsNulpOuBfttomPtm4oOfe8dhMb3eqCYHihSl2rc20UgT+dgg6ofBoYWQ5oVCQ0SuQj
         p/mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767972583; x=1768577383;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zPBnskPpYnDrBKJagTKqMfwyx58rk4gEgkXSmBAM15I=;
        b=EfVprfCHPfn1Q7WTs2TT6anfd0EEZyUICXZiBIT3Wi6KHOYZBXRF2TLavV6px28sEY
         lU2Jln3ZjkHphGK80tEgQQkXlJCFMnlpiKUDe1dMaiINg8EaMuZdpE0UDcoe2W0LdeMI
         /gzXmDBCxk05+Ane9V0q+MX3yM7PVOU0KTUCnxzGUbeXC4qP+SFdPDUa7IkUMPX+UsxD
         8MtuUqEZyE8Ya6l4G8Fmb8ssv4VZ7MXlrZxoy3y6Yb8a7jlWnYHvgVklX0wXe6gG1/Sv
         HLbpCdkGPodFV9sHeuevgoxDh9AKjKXDFO72vzfemu2zAFn15cTfuiHpgs+U2ZNxf6oh
         T9ZA==
X-Forwarded-Encrypted: i=1; AJvYcCXcKj8qXPQ266E10tE6oxIczsVPNNjlFPPUe5penXp4GPxZ0EtwaaNnCkPceQ2DF6Vm01fwSZOtYi4R1qFkXY7E@lists.infradead.org
X-Gm-Message-State: AOJu0YyaNZgYgw5VFbwtApjbPocBLkKenWvTGUFw8q+eNiwCATslgEow
	FSZkcWcp4FLuSX8a4g095C1uJlqymxMBi3zZowdWUx/TQdv9og47sw7nMuibhUYiqg==
X-Gm-Gg: AY/fxX5i9rrMkly3t4tCnhkim2kSi0AUZm6ywR2JX+U/BviaZ71HhSrMiQmqKfStg8i
	Tj0yob7JC8f5xAOPe9uaDUZ+HQiZ3D6y4dzP3llBnaOgILupe+iL15v3qyvqfmJyFccczkXf9Fy
	Cg9cowzOmx0fAzysPjeQ04v0ndFPgSPlQfG9OrVkytHQw83/AD77TcdOz2vthZUrZ1CyEaPn7Zk
	uM+LLCj5SS7vKVwPyG3n1NTYfXV4vr0xTAK2Idvyk/OKDihbIJ0bFQ6YDH6EF7pksBJ6TpCYfAC
	WehY2x82YD1nzLwVuFbg7ZBiJTEhC7Z4erUyP8J50+BN2/qJXMp2glqLLYbsSof1/wuVp1HII7f
	7oDca3vieiD8WQ8d97Dn7ooC7bRy5NGWGB8zW69DR57BIncuWKYysYwIK6a/sAqGBASCfKP9FC0
	SNwgdIhDs0oipI+Ffi/qv+u0oYne6uR1+guk7n9hyITCv1ca3M
X-Google-Smtp-Source: AGHT+IH+8WmaJO0kxfCWQE2RPwoBlC27rMLx+Y0gqPcFuf286nwSQ2Sl5j9cfWQe1J0V1YWWD8+BUw==
X-Received: by 2002:a05:651c:a07:b0:37a:2d8c:c0a8 with SMTP id 38308e7fff4ca-382ff841fd7mr29287061fa.34.1767972582971;
        Fri, 09 Jan 2026 07:29:42 -0800 (PST)
Received: from google.com (228.231.88.34.bc.googleusercontent.com. [34.88.231.228])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-382ff00220esm16720351fa.24.2026.01.09.07.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 07:29:42 -0800 (PST)
Date: Fri, 9 Jan 2026 15:29:38 +0000
From: Quentin Perret <qperret@google.com>
To: Will Deacon <will@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Fuad Tabba <tabba@google.com>, Vincent Donnefort <vdonnefort@google.com>, 
	Mostafa Saleh <smostafa@google.com>
Subject: Re: [PATCH 22/30] KVM: arm64: Return -EFAULT from VCPU_RUN on access
 to a poisoned pte
Message-ID: <vs26wb435olhc4p5b4owotm5zzwr2znwafsgfskkicymj25mbj@nllj54ubgtgl>
References: <20260105154939.11041-1-will@kernel.org>
 <20260105154939.11041-23-will@kernel.org>
 <s4p2ximtz7pki3waw245jtbl5znuco2ijrzsddlmln5x6rgxee@qbek4vpwn3kl>
 <aWEXRgagcULlftqk@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aWEXRgagcULlftqk@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_072945_888258_1C5305C5 
X-CRM114-Status: GOOD (  31.56  )
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

On Friday 09 Jan 2026 at 14:57:10 (+0000), Will Deacon wrote:
> On Tue, Jan 06, 2026 at 03:54:06PM +0000, Quentin Perret wrote:
> > On Monday 05 Jan 2026 at 15:49:30 (+0000), Will Deacon wrote:
> > > +int __pkvm_vcpu_in_poison_fault(struct pkvm_hyp_vcpu *hyp_vcpu)
> > > +{
> > > +	struct pkvm_hyp_vm *vm = pkvm_hyp_vcpu_to_hyp_vm(hyp_vcpu);
> > > +	kvm_pte_t pte;
> > > +	s8 level;
> > > +	u64 ipa;
> > > +	int ret;
> > > +
> > > +	switch (kvm_vcpu_trap_get_class(&hyp_vcpu->vcpu)) {
> > > +	case ESR_ELx_EC_DABT_LOW:
> > > +	case ESR_ELx_EC_IABT_LOW:
> > > +		if (kvm_vcpu_trap_is_translation_fault(&hyp_vcpu->vcpu))
> > > +			break;
> > > +		fallthrough;
> > > +	default:
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	ipa = kvm_vcpu_get_fault_ipa(&hyp_vcpu->vcpu);
> > > +	ipa |= kvm_vcpu_get_hfar(&hyp_vcpu->vcpu) & GENMASK(11, 0);
> > 
> > Why is all the above needed? Could we simplify by having the host pass
> > the IPA to the hcall?
> 
> I was just a little nervous about exposing an oracle here if we take the
> gfn as an argument as it would provide the host with a pretty easy
> mechanism to monitor the page access pattern of a guest after the initial
> donation had occurred.

Aha, I see what you mean. I guess if we scope that hcall to only
discover if a gfn is poisoned we're not exposing too much, but
contextualizing the call to the fault also sounds good to me. Perhaps a
small comment would help?

> > > +	guest_lock_component(vm);
> > > +	ret = kvm_pgtable_get_leaf(&vm->pgt, ipa, &pte, &level);
> > > +	if (ret)
> > > +		goto unlock;
> > > +
> > > +	if (level != KVM_PGTABLE_LAST_LEVEL) {
> > > +		ret = -EINVAL;
> > > +		goto unlock;
> > > +	}
> > > +
> > > +	ret = guest_pte_is_poisoned(pte);
> > > +unlock:
> > > +	guest_unlock_component(vm);
> > > +	return ret;
> > > +}
> > > +
> > >  int __pkvm_host_share_hyp(u64 pfn)
> > >  {
> > >  	u64 phys = hyp_pfn_to_phys(pfn);
> > > diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
> > > index d1926cb08c76..14865907610c 100644
> > > --- a/arch/arm64/kvm/pkvm.c
> > > +++ b/arch/arm64/kvm/pkvm.c
> > > @@ -417,10 +417,13 @@ int pkvm_pgtable_stage2_map(struct kvm_pgtable *pgt, u64 addr, u64 size,
> > >  			return -EINVAL;
> > >  
> > >  		/*
> > > -		 * We raced with another vCPU.
> > > +		 * We either raced with another vCPU or the guest PTE
> > > +		 * has been poisoned by an erroneous host access.
> > >  		 */
> > > -		if (mapping)
> > > -			return -EAGAIN;
> > > +		if (mapping) {
> > > +			ret = kvm_call_hyp_nvhe(__pkvm_vcpu_in_poison_fault);
> > 
> > It's not too bad, but it's a shame we now issue that every time we have
> > such a race (which is frequent-ish). Could we perhaps only issue it if
> > at least one page has been forcefully reclaimed since boot?
> 
> On the plus side, it avoids an unconditional walk from the fault path
> at EL2 (which is what we have in Android!).
> 
> It's a bit fiddly to implement your idea in the host, since the forceful
> reclaim happens in a really terrible context but I could track it at EL2
> and make __pkvm_vcpu_in_poison_fault() return early instead?

I guess EL2 could easily publish something in the host kvm struct as
well if we really wanted to, it's pinned as shared with EL2 and
accessible from the hyp_vm, which we retrieve in the force reclaim path.

> It's also
> worth bearing in mind that we've already serialised the concurrent fault
> and done a GUP by this point, so performance is somewhat of a lost
> cause...

That is very true, so happy to keep all these micro-optimization for
later.

Thanks,
Quentin

