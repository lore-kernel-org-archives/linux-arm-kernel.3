Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0C30C87FDA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Aug 2025 12:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=02XO1JiFBnfy17hmAkH181EI4OZJ+ZjtQSArDeOfw7s=; b=FC5xXGbY/tBCEogprHCSFjLI01
	gW1g7ZwrKTLt/yqzww9mAmzcmyFbWFasqUM00E1Az9de3aYSYSh6bxkDAJ9U0bYvHGN75La2jrHri
	jxCrMt8v33KZ1ah8mrjNsCI+DgDLP3qeTn0zc3lvekhrKX5CjQwxWAOY/em1iVlbepIBrEQm9Q8la
	Lcq/2r88CC3n6MVj9OITQtR7JKw2zEwi8L+thrdGdO8RQzegB3/vWlH2MvB8uXx0mo3g2dAmydZ3Y
	Au+JYO3cqY8pDpgvLBsQMl835Cgz23TKNJEIZ1Yr4anPN0oJnOLl/Fa4zB09hfYJKl/tzsn/ygjBV
	420/jiEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukMaG-00000002qVS-2eNf;
	Fri, 08 Aug 2025 12:52:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukMNU-00000002pI3-47XE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Aug 2025 12:39:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 55B1B5C6636;
	Fri,  8 Aug 2025 12:39:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFC1CC4CEED;
	Fri,  8 Aug 2025 12:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754656760;
	bh=fxN/UNwxz65cx0FSNpWc9Z0w/3Jj5dkmHxHveIdtRuc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NEEJQq6G4RLRPFMxZhYJ6qScAZgCdMlINlBIfl4xVKT1Sxh+xl8i/lw2teUloJRtc
	 VTqz5L716c46yoBGb6db7b6xavYyp6i3dcGZ5nJc2nGq+x0Y59DJlx5joE7APSYsmE
	 EFtXUbb2d6IVQPHk9RRJxXhgR9HiZQ6DhHCKaZ2Ff7TIu8fSur2Z/NW8FN3IzAqWVk
	 NWt+kn8qF2pxp6QmUgiIbDCC6hT6e4DAXoIdXrIfiInKUw4sC0pptcwPFk3JBqddxt
	 dlIgOTUAvGXEzrWwV/RkSI9/5k62/VNmo5MVCnWApM5a8JiXqWyVXsm7KB84uTbZnD
	 EbxSMHjMQV8Rw==
Date: Fri, 8 Aug 2025 13:39:13 +0100
From: Will Deacon <will@kernel.org>
To: perlarsen@google.com
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, ahomescu@google.com,
	armellel@google.com, arve@android.com, ayrton@google.com,
	qperret@google.com, sebastianene@google.com, qwandor@google.com
Subject: Re: [PATCH v9 2/6] KVM: arm64: Use SMCCC 1.2 for FF-A initialization
 and in host handler
Message-ID: <aJXv8YXSbV1UFanw@willie-the-truck>
References: <20250730-virtio-msg-ffa-v9-0-7f1b55c8d149@google.com>
 <20250730-virtio-msg-ffa-v9-2-7f1b55c8d149@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250730-virtio-msg-ffa-v9-2-7f1b55c8d149@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_053921_100348_30387A58 
X-CRM114-Status: GOOD (  27.10  )
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

On Wed, Jul 30, 2025 at 09:15:05PM +0000, Per Larsen via B4 Relay wrote:
> From: Per Larsen <perlarsen@google.com>
> 
> SMCCC 1.1 and prior allows four registers to be sent back as a result
> of an FF-A interface. SMCCC 1.2 increases the number of results that can
> be sent back to 8 and 16 for 32-bit and 64-bit SMC/HVCs respectively.
> 
> FF-A 1.0 references SMCCC 1.2 (reference [4] on page xi) and FF-A 1.2
> explicitly requires SMCCC 1.2 so it should be safe to use this version
> unconditionally. Moreover, it is simpler to implement FF-A features
> without having to worry about compatibility with SMCCC 1.1 and older.
> 
> Update the FF-A initialization and host handler code to use SMCCC 1.2.
> 
> Signed-off-by: Per Larsen <perlarsen@google.com>
> ---
>  arch/arm64/kvm/hyp/nvhe/Makefile |   1 +
>  arch/arm64/kvm/hyp/nvhe/ffa.c    | 189 +++++++++++++++++++++++++--------------
>  2 files changed, 121 insertions(+), 69 deletions(-)
> 
> diff --git a/arch/arm64/kvm/hyp/nvhe/Makefile b/arch/arm64/kvm/hyp/nvhe/Makefile
> index 0b0a68b663d4bd202a7036384bf8a1748cc97ca5..a244ec25f8c5bd0a744f7791102265323ecc681c 100644
> --- a/arch/arm64/kvm/hyp/nvhe/Makefile
> +++ b/arch/arm64/kvm/hyp/nvhe/Makefile
> @@ -27,6 +27,7 @@ hyp-obj-y := timer-sr.o sysreg-sr.o debug-sr.o switch.o tlb.o hyp-init.o host.o
>  	 cache.o setup.o mm.o mem_protect.o sys_regs.o pkvm.o stacktrace.o ffa.o
>  hyp-obj-y += ../vgic-v3-sr.o ../aarch32.o ../vgic-v2-cpuif-proxy.o ../entry.o \
>  	 ../fpsimd.o ../hyp-entry.o ../exception.o ../pgtable.o
> +hyp-obj-y += ../../../kernel/smccc-call.o
>  hyp-obj-$(CONFIG_LIST_HARDENED) += list_debug.o
>  hyp-obj-y += $(lib-objs)
>  
> diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
> index 2c199d40811efb5bfae199c4a67d8ae3d9307357..e66149d40c967c14742087d9b45970435d3f2c75 100644
> --- a/arch/arm64/kvm/hyp/nvhe/ffa.c
> +++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
> @@ -71,36 +71,64 @@ static u32 hyp_ffa_version;
>  static bool has_version_negotiated;
>  static hyp_spinlock_t version_lock;
>  
> -static void ffa_to_smccc_error(struct arm_smccc_res *res, u64 ffa_errno)
> +static void ffa_to_smccc_error(struct arm_smccc_1_2_regs *res, u64 ffa_errno)
>  {
> -	*res = (struct arm_smccc_res) {
> +	*res = (struct arm_smccc_1_2_regs) {
>  		.a0	= FFA_ERROR,
>  		.a2	= ffa_errno,
>  	};
>  }
>  
> -static void ffa_to_smccc_res_prop(struct arm_smccc_res *res, int ret, u64 prop)
> +static void ffa_to_smccc_res_prop(struct arm_smccc_1_2_regs *res, int ret, u64 prop)
>  {
>  	if (ret == FFA_RET_SUCCESS) {
> -		*res = (struct arm_smccc_res) { .a0 = FFA_SUCCESS,
> -						.a2 = prop };
> +		*res = (struct arm_smccc_1_2_regs) { .a0 = FFA_SUCCESS,
> +						      .a2 = prop };
>  	} else {
>  		ffa_to_smccc_error(res, ret);
>  	}
>  }
>  
> -static void ffa_to_smccc_res(struct arm_smccc_res *res, int ret)
> +static void ffa_to_smccc_res(struct arm_smccc_1_2_regs *res, int ret)
>  {
>  	ffa_to_smccc_res_prop(res, ret, 0);
>  }
>  
>  static void ffa_set_retval(struct kvm_cpu_context *ctxt,
> -			   struct arm_smccc_res *res)
> +			   struct arm_smccc_1_2_regs *res)
>  {
> +	DECLARE_REG(u64, func_id, ctxt, 0);
>  	cpu_reg(ctxt, 0) = res->a0;
>  	cpu_reg(ctxt, 1) = res->a1;
>  	cpu_reg(ctxt, 2) = res->a2;
>  	cpu_reg(ctxt, 3) = res->a3;
> +	cpu_reg(ctxt, 4) = res->a4;
> +	cpu_reg(ctxt, 5) = res->a5;
> +	cpu_reg(ctxt, 6) = res->a6;
> +	cpu_reg(ctxt, 7) = res->a7;
> +
> +	/*
> +	 * DEN0028C 2.6: SMC32/HVC32 call from aarch64 must preserve x8-x30.
> +	 *
> +	 * We rely on the function ID sent by the caller. Note that there
> +	 * are cases where a 32-bit interface can have a 64-bit response in FF-A
> +	 * 1.2 (e.g. FFA_MSG_WAIT or FFA_RUN). This will be addressed in a future
> +	 * version of the FF-A spec. Moreover, these corner cases are not relevant
> +	 * on this code path (FFA_RUN is passed through [not proxied] by the
> +	 * hypervisor and FFA_MSG_WAIT calls are made from the secure partition).
> +	 */
> +	if (ARM_SMCCC_IS_64(func_id)) {
> +		cpu_reg(ctxt, 8) = res->a8;
> +		cpu_reg(ctxt, 9) = res->a9;
> +		cpu_reg(ctxt, 10) = res->a10;
> +		cpu_reg(ctxt, 11) = res->a11;
> +		cpu_reg(ctxt, 12) = res->a12;
> +		cpu_reg(ctxt, 13) = res->a13;
> +		cpu_reg(ctxt, 14) = res->a14;
> +		cpu_reg(ctxt, 15) = res->a15;
> +		cpu_reg(ctxt, 16) = res->a16;
> +		cpu_reg(ctxt, 17) = res->a17;
> +	}

As discussed previously:

https://lore.kernel.org/all/aH-0cx9YhdWRe2nq@willie-the-truck/

I think we should just do this unconditionally. We know that looking at
the function ID isn't correct and so my vote is for compatability with
with the SMC proxy code.

Will

