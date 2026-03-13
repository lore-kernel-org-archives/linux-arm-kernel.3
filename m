Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE63C105F7AF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 14:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Aqyh/sAMkkwDqVg6Wbp//L7arrpk5uQicrBycYyrKtM=; b=YWfcIvoO1L+t8eWJSqUQdEOVIS
	I6WoAamMdYFnEedGG/N7SiauL7NhjFJU9Wzug7fvWwNpGVYQ4fehI7v0onda+5O/EE1L3dV5YFW/Y
	L2Q5EydHYX3lFWzz8lFBUO0jVSn3/Vtbgt02vvlW58B1L3Oi5cvSwI+bd0TgtVy7QrU/zAxYqW4qv
	6ScrXHOIZv6uf9E7P7M44vUxUXFIvZe7Uz0nBYq6GZoMHV5X4JpTmBq7QC7QKMmx0lp7K7fO6TQqN
	RN6tD/ylTCgTzf2HIeO51895hvgT+E8g+Hw8hDpI0+tudFMCwyKxYAprf7dYsx9Y4C05cxke3JA8k
	JajJPOfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w13X8-00000000OQd-1uLs;
	Fri, 13 Mar 2026 14:30:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w13X2-00000000OOO-304n
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 14:30:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A91E5165C;
	Fri, 13 Mar 2026 07:30:18 -0700 (PDT)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E4AA23F7BD;
	Fri, 13 Mar 2026 07:30:23 -0700 (PDT)
Date: Fri, 13 Mar 2026 14:30:19 +0000
From: Joey Gouly <joey.gouly@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: Discard PC update state on vcpu reset
Message-ID: <20260313143019.GA3369094@e124191.cambridge.arm.com>
References: <20260312140850.822968-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312140850.822968-1-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_073028_809287_DAA9877D 
X-CRM114-Status: GOOD (  26.21  )
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

On Thu, Mar 12, 2026 at 02:08:50PM +0000, Marc Zyngier wrote:
> Our vcpu reset suffers from a particularly interesting flaw, as it
> does not correctly deal with state that will have an effect on the
> execution flow out of reset.
> 
> Take the following completely random example, never seen in the wild
> and that never resulted in a couple of sleepless nights: /s
> 
> - vcpu-A issues a PSCI_CPU_OFF using the SMC conduit
> 
> - SMC being a trapped instruction (as opposed to HVC which is always
>   normally executed), we annotate the vcpu as needing to skip the
>   next instruction, which is the SMC itself
> 
> - vcpu-A is now safely off
> 
> - vcpu-B issues a PSCI_CPU_ON for vcpu-A, providing a starting PC
> 
> - vcpu-A gets reset, get the new PC, and is sent on its merry way
> 
> - right at the point of entering the guest, we notice that a PC
>   increment is pending (remember the earlier SMC?)
> 
> - vcpu-A skips its first instruction...
> 
> What could possibly go wrong?
> 
> Well, I'm glad you asked. For pKVM as a NV guest, that first instruction
> is extremely significant, as it indicates whether the CPU is booting
> or resuming. Having skipped that instruction, nothing makes any sense
> anymore, and CPU hotplugging fails.

Would the normal method of offlining/onlining via sysfs also be affected?

> 
> This is all caused by the decoupling of PC update from the handling
> of an exception that triggers such update, making it non-obvious
> what affects what when.
> 
> Fix this train wreck by discarding all the PC-affecting state on
> vcpu reset.

Good job on tracking it down.. makes you wonder why the DSB "fixed" things!

> 
> Fixes: f5e30680616ab ("KVM: arm64: Move __adjust_pc out of line")
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> Cc: stable@vger.kernel.org
> ---
>  arch/arm64/kvm/reset.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/kvm/reset.c b/arch/arm64/kvm/reset.c
> index 959532422d3a3..b963fd975aaca 100644
> --- a/arch/arm64/kvm/reset.c
> +++ b/arch/arm64/kvm/reset.c
> @@ -247,6 +247,20 @@ void kvm_reset_vcpu(struct kvm_vcpu *vcpu)
>  			kvm_vcpu_set_be(vcpu);
>  
>  		*vcpu_pc(vcpu) = target_pc;
> +
> +		/*
> +		 * We may come from a state where either a PC update was
> +		 * pending (SMC call resulting in PC being increpented to
                                                           incremented
> +		 * skip the SMC) or a pending exception. Make sure we get
> +		 * rid of all that, as this cannot be valid out of reset.
> +		 *
> +		 * Note that clearing the exception mask also clears PC
> +		 * updates, but that's an implementation detail, and we
> +		 * really want to make it explicit.
> +		 */
> +		vcpu_clear_flag(vcpu, PENDING_EXCEPTION);
> +		vcpu_clear_flag(vcpu, EXCEPT_MASK);
> +		vcpu_clear_flag(vcpu, INCREMENT_PC);
>  		vcpu_set_reg(vcpu, 0, reset_state.r0);
>  	}
>  

Reviewed-by: Joey Gouly <joey.gouly@arm.com>

Thanks,
Joey

