Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 106EACA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 13:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1ZqIknf6Hma9EYbP+iTbt0PAC3yYeQPy0vP28ynE7Eo=; b=CTKDvZCgauvu8LhKipOz46DCH5
	V0kNOhJLZ+dqjo/ArPXExmouUD2fA6Le653rQv/s4fmSVBJl+CHAh2FHm7UFCvAb+SJk/F9cLUNT/
	v2StReVtK7FGl19vQP5yY9wNFet5SytkChBmQuLEAYAc7NQXVdBPiqsNbgz5LF7VswM3QaNJJHm2S
	9V5E4dvz7JylMMxmemMfsWFqhOgimMI6CFxvILf4I9xgfXtQuc2WmyT+B3d1efIWddL9DI+5osnio
	8fdTcFVfP0JW1PWDydNDh06VQa5dJacO3Pmw5OCwfPth7EXMuLmbVg269rGEbiAklWQGpCPaBr3lM
	CwJZf1sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoMZB-0000000Acbh-00WQ;
	Tue, 19 Aug 2025 13:39:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoJr6-0000000AAo7-0tbd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 10:46:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DA65843BB0;
	Tue, 19 Aug 2025 10:46:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BD96C4CEF1;
	Tue, 19 Aug 2025 10:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755600375;
	bh=JfTBbv8jpNK14cUe0jQzor4Nu6VNU6jXNCwErFbJEAM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FEMPtvzGqBTk2bcuops306HDF1FUx7bqXIVqJgVtzhxivOnvZxP1I3a3hdf7Vxo57
	 3Y5J72y0V4eMio1aoZyMXqMSnvRAqjb3xBhxL7gEOBJlXhwrzpN4wPKFs2L3VeLKB/
	 lM3YRFSn9KfHzQ2cS8YuhGtWM4H7UDGRtockprpgOLvd9KIOxJeJ9SDTzFq+aE6ISe
	 o5i84yhscZG1eOIVOlnGsbpfekv5hIaWdL0NQEiuSVy3SvF2CoUESvXsot7uSQg77q
	 NMGExXcaJmdO7jasmxBayCvYicRC2Z7nu0CiA332ydy55BkVUUc0PBNAIp1hKEWqM/
	 rVo11aaOtmz4A==
Date: Tue, 19 Aug 2025 11:46:08 +0100
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
Subject: Re: [PATCH v10 2/6] KVM: arm64: Use SMCCC 1.2 for FF-A
 initialization and in host handler
Message-ID: <aKRV8FEuO5ZOcEfn@willie-the-truck>
References: <20250809-virtio-msg-ffa-v10-0-189eeecf8ae8@google.com>
 <20250809-virtio-msg-ffa-v10-2-189eeecf8ae8@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250809-virtio-msg-ffa-v10-2-189eeecf8ae8@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_034616_317027_98EB55C4 
X-CRM114-Status: GOOD (  30.68  )
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

On Sat, Aug 09, 2025 at 02:33:20AM +0000, Per Larsen via B4 Relay wrote:
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
> SMCCC 1.2 requires that SMC32/HVC32 from aarch64 mode preserves x8-x30
> but given that there is no reliable way to distinguish 32-bit/64-bit
> calls, we assume SMC64 unconditionally. This has the benefit of being
> consistent with the handling of calls that are passed through, i.e., not
> proxied. (A cleaner solution will become available in FF-A 1.3.)
> 
> Update the FF-A initialization and host handler code to use SMCCC 1.2.
> 
> Signed-off-by: Per Larsen <perlarsen@google.com>
> ---
>  arch/arm64/kvm/hyp/nvhe/Makefile |   1 +
>  arch/arm64/kvm/hyp/nvhe/ffa.c    | 188 +++++++++++++++++++++++++--------------
>  2 files changed, 120 insertions(+), 69 deletions(-)
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
> index 2c199d40811efb5bfae199c4a67d8ae3d9307357..19239f133a1cfb86db1b85251035709481cdef5b 100644
> --- a/arch/arm64/kvm/hyp/nvhe/ffa.c
> +++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
> @@ -71,36 +71,63 @@ static u32 hyp_ffa_version;
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
> +	 * In FF-A 1.2, we cannot rely on the function ID sent by the caller to
> +	 * deteect 32-bit calls as there are cases where a 32-bit interface can

typo: deteect

> +	 * have a 64-bit response 1.2 (e.g. FFA_MSG_WAIT or FFA_RUN). This will
> +	 * be addressed in FF-A 1.3. We also cannot rely on function IDs in the
> +	 * response.

Do you know what the FF-A 1.3 update is likely to say? It would be nice
to get an idea of what the code might need to do in future in case this
approach is going in a completely different direction.

> @@ -666,17 +703,21 @@ static bool do_ffa_features(struct arm_smccc_res *res,
>  static int hyp_ffa_post_init(void)
>  {
>  	size_t min_rxtx_sz;
> -	struct arm_smccc_res res;
> +	struct arm_smccc_1_2_regs res;
>  
> -	arm_smccc_1_1_smc(FFA_ID_GET, 0, 0, 0, 0, 0, 0, 0, &res);
> +	arm_smccc_1_2_smc(&(struct arm_smccc_1_2_regs){
> +		.a0 = FFA_ID_GET,
> +	}, &res);

Regardless of the problems with the spec, it's really nice to get rid
of all those zero arguments that come with the arm_smccc_1_1_smc()
macro.

Will

