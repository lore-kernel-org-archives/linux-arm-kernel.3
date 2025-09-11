Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43E65CAC58E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 18:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JKfsBIjjBs8pCarTDYZ380mGeD1i48PO8H8V6haIuBY=; b=pDJBDu1fx700ssPHb6yj2BH4pu
	Yr/p6TAZAAV/utIVxLG9PBu/ydsng9V9BgbOZmjEi2hdiJAdAHqP1x0qTI3ujjSC9xdBpINvg0BiJ
	3AtA+KwDzRY4K9+cWQPXmmQsF5TDabYuoPAo1Jf4GlE4I/rxxJulFqVNdbzW73q+7dnlnGc1H85NH
	FzcZIx5f8YGKBlgDYggdSrNRbo+yXXBTGuTpvxhhj4jUjAlbvES6Tq+9+bwFO01pqqf04h/ug2h3B
	PRAKetjaZY84tbjMxj8D0HlSdEPksk52OzfvSwn5mlO140Mkw0UfVlgi65vDoKRAujQlE8sKNnrSQ
	Vd4LKhDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwmG7-00000004ne9-1fQr;
	Thu, 11 Sep 2025 18:43:03 +0000
Received: from out-170.mta1.migadu.com ([95.215.58.170])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwmG4-00000004ndP-2lK7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 18:43:02 +0000
Date: Thu, 11 Sep 2025 11:42:50 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1757616177;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JKfsBIjjBs8pCarTDYZ380mGeD1i48PO8H8V6haIuBY=;
	b=XXxdyqbW2SGskkdgZ/rJMJue/1nScUY19rrTLrPPz4OVLJMvxhMn67kkpt+DVXOfnxcXwP
	rUi/hBVVpalMpFcdyXaIbMKbPeSzQCr05n2lwybhV8Vz3naZLTMdx2HAubQSlBd6dF78Ti
	0kjk/i9g408ssx6NGLP8uPpZ436EaWs=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Jack Thomson <jackabt.amazon@gmail.com>
Cc: maz@kernel.org, pbonzini@redhat.com, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, shuah@kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	isaku.yamahata@intel.com, roypat@amazon.co.uk,
	kalyazin@amazon.co.uk, jackabt@amazon.com
Subject: Re: [PATCH 3/6] KVM: arm64: Add pre_fault_memory implementation
Message-ID: <aMMYKqWsAZ4y0WI7@linux.dev>
References: <20250911134648.58945-1-jackabt.amazon@gmail.com>
 <20250911134648.58945-4-jackabt.amazon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250911134648.58945-4-jackabt.amazon@gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_114300_909058_51C8936B 
X-CRM114-Status: GOOD (  14.83  )
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

On Thu, Sep 11, 2025 at 02:46:45PM +0100, Jack Thomson wrote:
> @@ -1607,7 +1611,7 @@ static int __user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>  			    struct kvm_s2_trans *nested,
>  			    struct kvm_memory_slot *memslot,
>  			    long *page_size, unsigned long hva,
> -			    bool fault_is_perm)
> +			    bool fault_is_perm, bool pre_fault)
>  {
>  	int ret = 0;
>  	bool topup_memcache;
> @@ -1631,10 +1635,13 @@ static int __user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>  	vm_flags_t vm_flags;
>  	enum kvm_pgtable_walk_flags flags = KVM_PGTABLE_WALK_MEMABORT_FLAGS;
>  
> +	if (pre_fault)
> +		flags |= KVM_PGTABLE_WALK_PRE_FAULT;
> +
>  	if (fault_is_perm)
>  		fault_granule = kvm_vcpu_trap_get_perm_fault_granule(vcpu);
> -	write_fault = kvm_is_write_fault(vcpu);
> -	exec_fault = kvm_vcpu_trap_is_exec_fault(vcpu);
> +	write_fault = !pre_fault && kvm_is_write_fault(vcpu);
> +	exec_fault = !pre_fault && kvm_vcpu_trap_is_exec_fault(vcpu);

I'm not a fan of this. While user_mem_abort() is already a sloppy mess,
one thing we could reliably assume is the presence of a valid fault
context. Now we need to remember to special-case our interpretation of a
fault on whether or not we're getting invoked for a pre-fault.

I'd rather see the pre-fault infrastructure compose a synthetic fault
context (HPFAR_EL2, ESR_EL2, etc.). It places the complexity where it
belongs and the rest of the abort handling code should 'just work'.

> +long kvm_arch_vcpu_pre_fault_memory(struct kvm_vcpu *vcpu,
> +				    struct kvm_pre_fault_memory *range)
> +{
> +	int r;
> +	hva_t hva;
> +	phys_addr_t end;
> +	long page_size;
> +	struct kvm_memory_slot *memslot;
> +	phys_addr_t ipa = range->gpa;
> +	gfn_t gfn = gpa_to_gfn(range->gpa);
> +
> +	while (true) {
> +		page_size = PAGE_SIZE;
> +		memslot = gfn_to_memslot(vcpu->kvm, gfn);
> +		if (!memslot)
> +			return -ENOENT;
> +
> +		if (kvm_slot_has_gmem(memslot)) {
> +			r = __gmem_abort(vcpu, ipa, NULL, memslot, false, true);
> +		} else {
> +			hva = gfn_to_hva_memslot_prot(memslot, gfn, NULL);
> +			if (kvm_is_error_hva(hva))
> +				return -EFAULT;
> +			r = __user_mem_abort(vcpu, ipa, NULL, memslot, &page_size, hva, false,
> +					     true);
> +		}
> +
> +		if (r != -EAGAIN)
> +			break;
> +
> +		if (signal_pending(current))
> +			return -EINTR;
> +
> +		if (kvm_check_request(KVM_REQ_VM_DEAD, vcpu))
> +			return -EIO;
> +
> +		cond_resched();
> +	};

Why do we need another retry loop? Looks like we've already got one in
the arch-generic code.

Thanks,
Oliver

