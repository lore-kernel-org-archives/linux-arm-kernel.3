Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A609ACCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 23:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R6iz603Ixy9otU3EnpLkGcQzhNkPS8mytXZb1tXmjtc=; b=VRhSFnBNdgQwSKjXJXjhlDFdxA
	oqEZOLA44iD0l0OTPUlWbm+9CxFtINrZYhLF096ZiHmFSRtc6k2AXIK3ABFtHUlRydEox6gzk67Qe
	42+2dy0gQNm7DJlxe4kHiRrX4bwSWLQauSnTLjIhE8ACDFii4uCEQmHdlZG1HSqsPrL3xH9RqKcTp
	9pGa3WQvKNROp5wW/kaexg3AT+N76DWzHXYf/L9cxBMeGgQMVxF9odznQmvzF7YcZTufK3Tm1eDSx
	CEV8PWS9/aqiUmqV3z0rodZUD6EhBbKbdNy8VMnWIB/lhIphLfU8X/wnOfORanKNBdkwWoUb45a7s
	sHz5+D7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHVlo-00000001Vzx-2KkJ;
	Fri, 07 Nov 2025 23:21:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHVlm-00000001VzS-3SX1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 23:21:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 47D1D40142;
	Fri,  7 Nov 2025 23:21:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0162BC4CEF7;
	Fri,  7 Nov 2025 23:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762557686;
	bh=CUUuS8pprmMGGLz7wegIQEujEfE4Gb2O/WZVgS7MqME=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OPTGRFWALroD5xLQ6hlpiA6i+i3394e6x06fYD1XpQhJr8O7BFLj6IYEm5ZqKxN4N
	 p76Qch5FEKXd4URov25mOvc/30EBxn+CRXK5r0ZeMrnIpKC3C9MN5AfWU54/eq6XcI
	 3MrhR4IJpXnBiah1CbvBR9SEJOduw9MlCIEZZ712lAGMIyPcoc27N3HUo9pwPt9rjA
	 CFd1I3L1ntgcfXLxhP0jnnXFIVOjX5hbmVfAg53tWQSqUOjelvfujIwZKw+gooHwWI
	 c5kghsRDGSStWstPRyUyjFvdOXRQmDUfXcg7XLR96aw8WRnFHTIxOI36/Gnyd7VIBT
	 kHFCHO7D5agRA==
Date: Fri, 7 Nov 2025 15:21:24 -0800
From: Oliver Upton <oupton@kernel.org>
To: Fuad Tabba <tabba@google.com>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	maz@kernel.org, oliver.upton@linux.dev, will@kernel.org,
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, vladimir.murzin@arm.com
Subject: Re: [PATCH v2 4/5] KVM: arm64: Prevent host from managing timer
 offsets for protected VMs
Message-ID: <aQ5-9PsBl3z9UxOS@kernel.org>
References: <20251106144418.2847443-1-tabba@google.com>
 <20251106144418.2847443-5-tabba@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251106144418.2847443-5-tabba@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_152126_905453_D3D159DA 
X-CRM114-Status: GOOD (  23.66  )
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

On Thu, Nov 06, 2025 at 02:44:16PM +0000, Fuad Tabba wrote:
> For protected VMs, the guest's timer offset state is private and must
> not be controlled by the host. Protected VMs must always run with a
> virtual counter offset of 0.
> 
> The existing timer logic allowed the host to set and manage the timer
> counter offsets (voffset and poffset) for protected VMs.
> 
> This patch disables all host-side management of timer offsets for
> protected VMs by adding checks in the relevant code paths.

"This patch ..." is generally discouraged in changelogs, just state what
you're doing in an imperative tone.

> Signed-off-by: Fuad Tabba <tabba@google.com>
> ---
>  arch/arm64/kvm/arch_timer.c | 18 +++++++++++++-----
>  arch/arm64/kvm/sys_regs.c   |  6 ++++--
>  2 files changed, 17 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm64/kvm/arch_timer.c b/arch/arm64/kvm/arch_timer.c
> index 3f675875abea..69f5631ebf84 100644
> --- a/arch/arm64/kvm/arch_timer.c
> +++ b/arch/arm64/kvm/arch_timer.c
> @@ -1056,10 +1056,14 @@ static void timer_context_init(struct kvm_vcpu *vcpu, int timerid)
>  
>  	ctxt->timer_id = timerid;
>  
> -	if (timerid == TIMER_VTIMER)
> -		ctxt->offset.vm_offset = &kvm->arch.timer_data.voffset;
> -	else
> -		ctxt->offset.vm_offset = &kvm->arch.timer_data.poffset;
> +	if (!kvm_vm_is_protected(vcpu->kvm)) {
> +		if (timerid == TIMER_VTIMER)
> +			ctxt->offset.vm_offset = &kvm->arch.timer_data.voffset;
> +		else
> +			ctxt->offset.vm_offset = &kvm->arch.timer_data.poffset;
> +	} else {
> +		ctxt->offset.vm_offset = NULL;
> +	}
>  
>  	hrtimer_setup(&ctxt->hrtimer, kvm_hrtimer_expire, CLOCK_MONOTONIC, HRTIMER_MODE_ABS_HARD);
>  
> @@ -1083,7 +1087,8 @@ void kvm_timer_vcpu_init(struct kvm_vcpu *vcpu)
>  		timer_context_init(vcpu, i);
>  
>  	/* Synchronize offsets across timers of a VM if not already provided */
> -	if (!test_bit(KVM_ARCH_FLAG_VM_COUNTER_OFFSET, &vcpu->kvm->arch.flags)) {
> +	if (!vcpu_is_protected(vcpu) &&
> +	    !test_bit(KVM_ARCH_FLAG_VM_COUNTER_OFFSET, &vcpu->kvm->arch.flags)) {
>  		timer_set_offset(vcpu_vtimer(vcpu), kvm_phys_timer_read());
>  		timer_set_offset(vcpu_ptimer(vcpu), 0);
>  	}
> @@ -1687,6 +1692,9 @@ int kvm_vm_ioctl_set_counter_offset(struct kvm *kvm,
>  	if (offset->reserved)
>  		return -EINVAL;
>  
> +	if (kvm_vm_is_protected(kvm))
> +		return -EBUSY;
> +

This should be -EINVAL as pVMs do not even advertise the capability.

Since we already have a generic helper for filtering KVM_CAPs, I'd
prefer that we have a similar thing for enforcing ioctl limitations too.

For example, you could maintain the ioctl => KVM_CAP mapping in a table
and use kvm_pvm_ext_allowed() as the source of truth.

>  	mutex_lock(&kvm->lock);
>  
>  	if (!kvm_trylock_all_vcpus(kvm)) {
> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
> index e67eb39ddc11..3329a8f03436 100644
> --- a/arch/arm64/kvm/sys_regs.c
> +++ b/arch/arm64/kvm/sys_regs.c
> @@ -1606,11 +1606,13 @@ static int arch_timer_set_user(struct kvm_vcpu *vcpu,
>  		val &= ~ARCH_TIMER_CTRL_IT_STAT;
>  		break;
>  	case SYS_CNTVCT_EL0:
> -		if (!test_bit(KVM_ARCH_FLAG_VM_COUNTER_OFFSET, &vcpu->kvm->arch.flags))
> +		if (!vcpu_is_protected(vcpu) &&
> +		    !test_bit(KVM_ARCH_FLAG_VM_COUNTER_OFFSET, &vcpu->kvm->arch.flags))
>  			timer_set_offset(vcpu_vtimer(vcpu), kvm_phys_timer_read() - val);
>  		return 0;
>  	case SYS_CNTPCT_EL0:
> -		if (!test_bit(KVM_ARCH_FLAG_VM_COUNTER_OFFSET, &vcpu->kvm->arch.flags))
> +		if (!vcpu_is_protected(vcpu) &&
> +		    !test_bit(KVM_ARCH_FLAG_VM_COUNTER_OFFSET, &vcpu->kvm->arch.flags))
>  			timer_set_offset(vcpu_ptimer(vcpu), kvm_phys_timer_read() - val);

Isn't there a general expectation that userspace not have access to the
vCPU state of a pVM? That should be the mechanism of enforcement instead
of special-casing these registers.

Thanks,
Oliver

