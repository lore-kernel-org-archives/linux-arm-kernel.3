Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D201D10BE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Oct 2024 05:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1VqnAcW2Lr3Wy+fyPS6e7OxFPoaLSfYoH8W/e5CQq/w=; b=HbGuaVzmp7A/thkJ1++ICPV0hu
	QMe13rq0+ETOD268V/W6+upqgZqvk7iC0fLYlBmL/vrIVxKnzsU11CgvrzLd9a77KSwYef98htfn9
	yt6Qlg64BWEclb4Xn35Dly9ip3gCzWacFSDlxhPLZC6zggg9AkNH9zzT9Slq3HqIjJYmzq5TcKcX7
	t0l5bVHETfpi8FZi4qaLQCyl9XJrOQyp2ytztPnGkmu/RhJYUUa9bp+TbSKpPgY02A1TIqRZ8WMGr
	rgKHtxXhpujsSpAHfE8y/KcPimhk5S+7GfapjySk7VkVfqAoA80t6KZ6qpc2drp+yVoEGvfTQ4+Bt
	nD3kwODw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4ZTB-00000005yrW-2UgV;
	Sat, 26 Oct 2024 05:36:13 +0000
Received: from out-177.mta1.migadu.com ([95.215.58.177])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4ZRa-00000005yfP-0oAH
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Oct 2024 05:34:36 +0000
Date: Fri, 25 Oct 2024 22:34:23 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1729920870;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1VqnAcW2Lr3Wy+fyPS6e7OxFPoaLSfYoH8W/e5CQq/w=;
	b=uRotzDxY2ZOxA3MQsoJ6CvtuZFL9wN9G3BXCyfRTs1bHCvEDCGzBJDkL34TQiC8MIsw4AA
	eoPYjoe5fjfZ+arMREjDW4ItPBv5y93EQ/aSrzqvZNAX6zbc4jHitDCuRCClFTcVGyGTbz
	ev8wimyrZndrhZ0ewX0qLhBjjKA9jwQ=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Raghavendra Rao Ananta <rananta@google.com>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, stable@vger.kernel.org,
	syzbot <syzkaller@googlegroups.com>
Subject: Re: [PATCH] KVM: arm64: Mark the VM as dead for failed
 initializations
Message-ID: <Zxx_X9-MdmAFzHUO@linux.dev>
References: <20241025221220.2985227-1-rananta@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241025221220.2985227-1-rananta@google.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_223434_751185_FA2C76BA 
X-CRM114-Status: GOOD (  19.65  )
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

Hi Raghu,

Thanks for posting this fix.

On Fri, Oct 25, 2024 at 10:12:20PM +0000, Raghavendra Rao Ananta wrote:
> Syzbot hit the following WARN_ON() in kvm_timer_update_irq():
> 
> WARNING: CPU: 0 PID: 3281 at arch/arm64/kvm/arch_timer.c:459
> kvm_timer_update_irq+0x21c/0x394
> Call trace:
>   kvm_timer_update_irq+0x21c/0x394 arch/arm64/kvm/arch_timer.c:459
>   kvm_timer_vcpu_reset+0x158/0x684 arch/arm64/kvm/arch_timer.c:968
>   kvm_reset_vcpu+0x3b4/0x560 arch/arm64/kvm/reset.c:264
>   kvm_vcpu_set_target arch/arm64/kvm/arm.c:1553 [inline]
>   kvm_arch_vcpu_ioctl_vcpu_init arch/arm64/kvm/arm.c:1573 [inline]
>   kvm_arch_vcpu_ioctl+0x112c/0x1b3c arch/arm64/kvm/arm.c:1695
>   kvm_vcpu_ioctl+0x4ec/0xf74 virt/kvm/kvm_main.c:4658
>   vfs_ioctl fs/ioctl.c:51 [inline]
>   __do_sys_ioctl fs/ioctl.c:907 [inline]
>   __se_sys_ioctl fs/ioctl.c:893 [inline]
>   __arm64_sys_ioctl+0x108/0x184 fs/ioctl.c:893
>   __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
>   invoke_syscall+0x78/0x1b8 arch/arm64/kernel/syscall.c:49
>   el0_svc_common+0xe8/0x1b0 arch/arm64/kernel/syscall.c:132
>   do_el0_svc+0x40/0x50 arch/arm64/kernel/syscall.c:151
>   el0_svc+0x54/0x14c arch/arm64/kernel/entry-common.c:712
>   el0t_64_sync_handler+0x84/0xfc arch/arm64/kernel/entry-common.c:730
>   el0t_64_sync+0x190/0x194 arch/arm64/kernel/entry.S:598
> 
> The sequence that led to the report is when KVM_ARM_VCPU_INIT ioctl is
> invoked after a failed first KVM_RUN. In a general sense though, since
> kvm_arch_vcpu_run_pid_change() doesn't tear down any of the past
> initiatializations, it's possible that the VM's state could be left

typo: initializations

> half-baked. Any upcoming ioctls could behave erroneously because of
> this.

You may want to highlight a bit more strongly that, despite the name,
we do a lot of late *VM* state initialization in kvm_arch_vcpu_run_pid_change().

When that goes sideways we're left with few choices besides bugging the
VM or gracefully tearing down state, potentially w/ concurrent users.

> Since these late vCPU initializations is past the point of attributing
> the failures to any ioctl, instead of tearing down each of the previous
> setups, simply mark the VM as dead, gving an opportunity for the
> userspace to close and try again.
> 
> Cc: <stable@vger.kernel.org>
> Reported-by: syzbot <syzkaller@googlegroups.com>
> Suggested-by: Oliver Upton <oliver.upton@linux.dev>

I definitely recommended this to you, so blame *me* for imposing some
toil on you with the following.

> @@ -836,16 +836,16 @@ int kvm_arch_vcpu_run_pid_change(struct kvm_vcpu *vcpu)
>  
>  	ret = kvm_timer_enable(vcpu);
>  	if (ret)
> -		return ret;
> +		goto out_err;
>  
>  	ret = kvm_arm_pmu_v3_enable(vcpu);
>  	if (ret)
> -		return ret;
> +		goto out_err;
>  
>  	if (is_protected_kvm_enabled()) {
>  		ret = pkvm_create_hyp_vm(kvm);
>  		if (ret)
> -			return ret;
> +			goto out_err;
>  	}
>  
>  	if (!irqchip_in_kernel(kvm)) {
> @@ -869,6 +869,10 @@ int kvm_arch_vcpu_run_pid_change(struct kvm_vcpu *vcpu)
>  	mutex_unlock(&kvm->arch.config_lock);
>  
>  	return ret;
> +
> +out_err:
> +	kvm_vm_dead(kvm);
> +	return ret;
>  }

After rereading, I think we could benefit from a more distinct separation
of late VM vs. vCPU state initialization.

Bugging the VM is a big hammer, we should probably only resort to that
when the VM state is screwed up badly.

Otherwise, for screwed up vCPU state we could uninitialize the vCPU and
let userspace try again. An example of this is how we deal with VMs that
run 32 bit userspace when KVM tries to hide the feature.

WDYT?

-- 
Thanks,
Oliver

