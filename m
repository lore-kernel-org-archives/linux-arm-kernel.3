Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31171E67488
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 21:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qKFJMALNUJxy+K52N5OoWGpav88DkFPxeSQGU+lIc8I=; b=cSnJFfRXQUQmvmDmYB58rqZkxG
	KjlNwKwczIZcjJjpHTpBQ0zoQ8DxdAVFljCC/Tf+68iDK3ki+x2CSFPODUv7qFhfja3VZ1uzh3PTe
	8vlCj4FdDj5b0R388dCOTZEfxWpgDK4j2RHQbdCxGjkWlJxhwuVzzBb+VOIqleGCpJqsA7uAj26tB
	w73Uj8Ex/7jYXLugBmTg5jkfBhO8U+c2VptDAisZU0r7Fj0aKF6eW0kaLTYizTofWkAr1XXzeN0He
	wwa6A3vm7xiK4vniSPIl2x330yeCKG5a0ELOoJlMlwniVU/A5uMWQxD4UDLrYC/ciP3OeiqqWJy2d
	gwrFPuSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6d1v-00000004zLG-0g7f;
	Thu, 31 Oct 2024 21:48:35 +0000
Received: from out-181.mta0.migadu.com ([2001:41d0:1004:224b::b5])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6d0F-00000004z9E-2pn0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 21:46:53 +0000
Date: Thu, 31 Oct 2024 21:46:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1730411207;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qKFJMALNUJxy+K52N5OoWGpav88DkFPxeSQGU+lIc8I=;
	b=iQvPfPlRSmHoLgWtQ4dqbKGiyqPjjygOZ0vhrb5q6vMCULJZOJ3neinrycnRGcQj7QYJz3
	MsQ0fceu5GLOLWz02s2otVx9So1/4Ppbpz0K4KTI58SWO6DI0EfFBI9Ye9S0hHVjFqJCRM
	1CrjS6CT2UnxJWEoChZ4DA+kWlNeuXU=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Jiaqi Yan <jiaqiyan@google.com>
Cc: maz@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org,
	pbonzini@redhat.com, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, duenwen@google.com,
	rananta@google.com
Subject: Re: [RFC PATCH v1] KVM: arm64: Introduce KVM_CAP_ARM_SIGBUS_ON_SEA
Message-ID: <ZyP6whdv4bmsI13x@linux.dev>
References: <20241031212104.1429609-1-jiaqiyan@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241031212104.1429609-1-jiaqiyan@google.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_144652_023603_BF3A08B7 
X-CRM114-Status: GOOD (  28.86  )
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

Hi Jiaqi,

Thank you for sending this out.

On Thu, Oct 31, 2024 at 09:21:04PM +0000, Jiaqi Yan wrote:
> Currently KVM handles SEA in guest by injecting async SError into
> guest directly, bypassing VMM, usually results in guest kernel panic.
> 
> One major situation of guest SEA is when vCPU consumes uncorrectable
> memory error on the physical memory. Although SError and guest kernel
> panic effectively stops the propagation of corrupted memory, it is not
> easy for VMM and guest to recover from memory error in a more graceful
> manner.
> 
> Alternatively KVM can send a SIGBUS BUS_OBJERR to VMM/vCPU, just like
> how core kernel signals SIGBUS BUS_OBJERR to the poison consuming
> thread.
> In addition to the benifit that KVM's handling for SEA becomes aligned
> with core kernel behavior
> - The blast radius in VM can be limited to only the consuming thread
>   in guest, instead of entire guest kernel, unless the consumption is
>   from guest kernel.
> - VMM now has the chance to do its duties to stop the VM from repeatedly
>   consuming corrupted data. For example, VMM can unmap the guest page
>   from stage-2 table to intercept forseen memory poison consumption,
>   and for every consumption injects SEA to EL1 with synthetic memory
>   error CPER.
> 
> Introduce a new KVM ARM capability KVM_CAP_ARM_SIGBUS_ON_SEA. VMM
> can opt in this new capability if it prefers SIGBUS than SError
> injection during VM init. Now SEA handling in KVM works as follows:

I'm somewhat tempted to force the new behavior on userspace
unconditionally. Working back from an unexpected SError in the VM to the
KVM SEA handler is a bit of a mess, and can be annoying if the operator
can't access console logs of the VM.

As it stands today, UAPI expectations around SEAs are platform
dependent. If APEI claims the SEA and decides to offline a page, the
user will get a SIGBUS.

So sending a SIGBUS for the case that firmware _doesn't_ claim the SEA
seems like a good move from a consistency PoV. But it is a decently-sized
change to do without explicit buy-in from userspace so let's see what
others think.

> 1. Delegate to APEI/GHES to see if SEA can be claimed by them.
> 2. If APEI failed to claim the SEA and KVM_CAP_ARM_SIGBUS_ON_SEA is
>    enabled for the VM, and the SEA is NOT about translation table,
>    send SIGBUS BUS_OBJERR signal with host virtual address.
> 3. Otherwise directly inject async SError to guest.

The other reason I'm a bit lukewarm on user buy in is the UAPI suffers
from the same issue we do today: it depends on the platform. If the SEA
is claimed by APEI/GHES then the cap does nothing.

> +static int kvm_delegate_guest_sea(phys_addr_t addr, u64 esr)
> +{
> +	/* apei_claim_sea(NULL) expects to mask interrupts itself */
> +	lockdep_assert_irqs_enabled();
> +	return apei_claim_sea(NULL);
> +}

Consider dropping parameters from this since they're unused.

> +void kvm_handle_guest_sea(struct kvm_vcpu *vcpu)
> +{
> +	bool sigbus_on_sea;
> +	int idx;
> +	u64 vcpu_esr = kvm_vcpu_get_esr(vcpu);
> +	u8 fsc = kvm_vcpu_trap_get_fault(vcpu);
> +	phys_addr_t fault_ipa = kvm_vcpu_get_fault_ipa(vcpu);
> +	gfn_t gfn = fault_ipa >> PAGE_SHIFT;
> +	/* When FnV is set, send 0 as si_addr like what do_sea() does. */
> +	unsigned long hva = 0UL;
> +
> +	/*
> +	 * For RAS the host kernel may handle this abort.
> +	 * There is no need to SIGBUS VMM, or pass the error into the guest.
> +	 */
> +	if (kvm_delegate_guest_sea(fault_ipa, vcpu_esr) == 0)
> +		return;
> +
> +	sigbus_on_sea = test_bit(KVM_ARCH_FLAG_SIGBUS_ON_SEA,
> +				 &(vcpu->kvm->arch.flags));
> +
> +	/*
> +	 * In addition to userspace opt-in, SIGBUS only makes sense if the
> +	 * abort is NOT about translation table walk and NOT about hardware
> +	 * update of translation table.
> +	 */
> +	sigbus_on_sea &= (fsc == ESR_ELx_FSC_EXTABT || fsc == ESR_ELx_FSC_SECC);

Is this because we potentially can't determine a valid HVA for the
fault? Maybe these should go out to userspace still with si_addr = 0.

-- 
Thanks,
Oliver

