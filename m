Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DF72CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 00:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=toyaVjkpPinuAEIPOarMwJdLvd9BQ2PV4RPd1E3oP4E=; b=x9P+mBM3NO9lROD8WQo258MAeH
	0YqtlwjUDB+JSF9uisLAaKGvnO2newyzj7nrVo4TGjjpOMSVHf1xyulkZMrUbSpiJTveo6aoMToSK
	zs9GN3+aAp9U86Va64e14GjhMBVd1vMFw2sTyPM8vfSgrT/E2c3ZmGQGVaVzZTvWxvzIj9JnQWDOc
	4gs41W9DCJkyVKIjGym5CEw+5au088XhvLDZTN6mWVL7d9kMPevYhr7CkgXmd6OBZh7DtlRntUZYC
	ga6zHwdqlfhm3qbWhKFE3/74aGMiznQS5k9HFKRPTb8pOMw77q5INrCsM0Pk/B7CxfhvMtVE2sZb7
	2wNt/QxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Od4-00000003jsz-12vL;
	Tue, 30 Sep 2025 00:54:06 +0000
Received: from out-180.mta1.migadu.com ([95.215.58.180])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Od1-00000003jsV-3Whk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 00:54:05 +0000
Date: Mon, 29 Sep 2025 17:53:54 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1759193641;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=toyaVjkpPinuAEIPOarMwJdLvd9BQ2PV4RPd1E3oP4E=;
	b=hr3jsrtQsxW72gNjOEPsv4iQ9v/0A7cW0vmawVGdX45ydnDFq1yMF5QgeZ9N/xChHdvNoK
	Q2AZGZuaDA9FmsTsSVXcIfSWlxrVeJ5PHu9hSCZTH96pzMRGRi9tqXCCqeZI7AM9YipJjr
	qqFqGtGAkzNNTPCMu9EbjZd7HufUbP4=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: "Thomson, Jack" <jackabt.amazon@gmail.com>
Cc: maz@kernel.org, pbonzini@redhat.com, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, shuah@kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	isaku.yamahata@intel.com, roypat@amazon.co.uk,
	kalyazin@amazon.co.uk, jackabt@amazon.com
Subject: Re: [PATCH 3/6] KVM: arm64: Add pre_fault_memory implementation
Message-ID: <aNsqIsbYyROCjShQ@linux.dev>
References: <20250911134648.58945-1-jackabt.amazon@gmail.com>
 <20250911134648.58945-4-jackabt.amazon@gmail.com>
 <aMMYKqWsAZ4y0WI7@linux.dev>
 <7d109638-3d26-443a-b24d-eb7a0059b80f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7d109638-3d26-443a-b24d-eb7a0059b80f@gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_175404_088982_467DFA2F 
X-CRM114-Status: GOOD (  26.04  )
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

On Mon, Sep 29, 2025 at 02:59:35PM +0100, Thomson, Jack wrote:
> Hi Oliver,
> 
> Thanks for reviewing!
> 
> On 11/09/2025 7:42 pm, Oliver Upton wrote:
> > On Thu, Sep 11, 2025 at 02:46:45PM +0100, Jack Thomson wrote:
> > > @@ -1607,7 +1611,7 @@ static int __user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
> > >   			    struct kvm_s2_trans *nested,
> > >   			    struct kvm_memory_slot *memslot,
> > >   			    long *page_size, unsigned long hva,
> > > -			    bool fault_is_perm)
> > > +			    bool fault_is_perm, bool pre_fault)
> > >   {
> > >   	int ret = 0;
> > >   	bool topup_memcache;
> > > @@ -1631,10 +1635,13 @@ static int __user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
> > >   	vm_flags_t vm_flags;
> > >   	enum kvm_pgtable_walk_flags flags = KVM_PGTABLE_WALK_MEMABORT_FLAGS;
> > > +	if (pre_fault)
> > > +		flags |= KVM_PGTABLE_WALK_PRE_FAULT;
> > > +
> > >   	if (fault_is_perm)
> > >   		fault_granule = kvm_vcpu_trap_get_perm_fault_granule(vcpu);
> > > -	write_fault = kvm_is_write_fault(vcpu);
> > > -	exec_fault = kvm_vcpu_trap_is_exec_fault(vcpu);
> > > +	write_fault = !pre_fault && kvm_is_write_fault(vcpu);
> > > +	exec_fault = !pre_fault && kvm_vcpu_trap_is_exec_fault(vcpu);
> > 
> > I'm not a fan of this. While user_mem_abort() is already a sloppy mess,
> > one thing we could reliably assume is the presence of a valid fault
> > context. Now we need to remember to special-case our interpretation of a
> > fault on whether or not we're getting invoked for a pre-fault.
> > 
> > I'd rather see the pre-fault infrastructure compose a synthetic fault
> > context (HPFAR_EL2, ESR_EL2, etc.). It places the complexity where it
> > belongs and the rest of the abort handling code should 'just work'.
> > 
> 
> Agreed, it looks much better with the synthetic abort. Is this the
> approach you had in mind?

Pretty much. Thanks for taking a moment to fiddle with it.

> +long kvm_arch_vcpu_pre_fault_memory(struct kvm_vcpu *vcpu,
> +				    struct kvm_pre_fault_memory *range)
> +{
> +	int ret, idx;
> +	hva_t hva;
> +	phys_addr_t end;
> +	u64 esr, hpfar;
> +	struct kvm_memory_slot *memslot;
> +	struct kvm_vcpu_fault_info *fault_info;
> +
> +	long page_size = PAGE_SIZE;
> +	phys_addr_t ipa = range->gpa;
> +	gfn_t gfn = gpa_to_gfn(range->gpa);
> +
> +	idx = srcu_read_lock(&vcpu->kvm->srcu);
> +
> +	if (ipa >= kvm_phys_size(vcpu->arch.hw_mmu)) {
> +		ret = -ENOENT;
> +		goto out_unlock;
> +	}
> +
> +	memslot = gfn_to_memslot(vcpu->kvm, gfn);
> +	if (!memslot) {
> +		ret = -ENOENT;
> +		goto out_unlock;
> +	}
> +
> +	fault_info = &vcpu->arch.fault;
> +
> +	esr = fault_info->esr_el2;
> +	hpfar = fault_info->hpfar_el2;

nit: Just snapshot the entire struct, makes this forward-compatible with
new fields showing up.

> +
> +	fault_info->esr_el2 = ESR_ELx_FSC_ACCESS_L(KVM_PGTABLE_LAST_LEVEL);

A translation fault would be a more accurate representation what you're
trying to do Access flag faults aren't expected in user_mem_abort() and
instead handled in handle_access_fault().

You're also missing the rest of the ESR fields that are relevant here,
such as ESR_ELx.EC which would actually indicate a data abort. I think
you'd also want to communicate this as a nISV fault (i.e.
ESR_ELx.ISV=0).

> +	fault_info->hpfar_el2 = HPFAR_EL2_NS |
> +		((ipa >> (12 - HPFAR_EL2_FIPA_SHIFT)) & HPFAR_EL2_FIPA_MASK);

FIELD_PREP()?

> +
> +	if (kvm_slot_has_gmem(memslot)) {
> +		ret = gmem_abort(vcpu, ipa, NULL, memslot, false);
> +	} else {
> +		hva = gfn_to_hva_memslot_prot(memslot, gfn, NULL);
> +		if (kvm_is_error_hva(hva)) {
> +			ret = -EFAULT;
> +			goto out;
> +		}
> +		ret = user_mem_abort(vcpu, ipa, NULL, memslot, &page_size, hva,
> +				     false);
> +	}
> +
> +	if (ret < 0)
> +		goto out;
> +
> +	end = (range->gpa & ~(page_size - 1)) + page_size;
> +	ret = min(range->size, end - range->gpa);
> +
> +out:
> +	fault_info->esr_el2 = esr;
> +	fault_info->hpfar_el2 = hpfar;
> +out_unlock:
> +	srcu_read_unlock(&vcpu->kvm->srcu, idx);
> +	return ret;
> +}

Thanks,
Oliver

