Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AB1BC3ABCC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 15:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cDB8Q+NJqh5XcD5z/y1l811LRsy8GAKoSfZhlkVOw14=; b=IhZ055A+qFLbONS90KptGQiUUz
	hMd62yfv/PigWG5+1yG1zpOt7II8fLmyZkZ+S3vUVohRwCcb99WGDh+HuqsOv2zUSz4r5B9XiSgdf
	nA50j8PRlkimgnxgI7/ByIu5fWkuzIvCP1+BERx3D1jtTM92y+OOt962+RNjkZaUeL69ejz0TLNOR
	p1Dq3hrgOxlj+/LvwHp/osIDgX2aDpoPzOs3+aSWKxVlB+HXNbOyrYXk6aTcfL8kCQyEPv2pA33e4
	GoHjFJjMzpj6TmTmbJYgJa63S81kYtU0H0JazcA2ndYHPMl00aZWHP9V6yMITf1ZxgJTZknC5k9Ed
	4aiEvjCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEr8E-0000000ChOf-0arq;
	Tue, 13 May 2025 15:01:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEr3t-0000000CgWT-0vDk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 14:56:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4211A4A252;
	Tue, 13 May 2025 14:56:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 278EFC4CEED;
	Tue, 13 May 2025 14:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747148211;
	bh=G1gp9yONhEgvkHR26g6lrD7nBU87I9WeFbqJ/fmG4bY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jcCAYwHdhaFrw+Gn8jiJizJKLVeV0gO4ocCUx3g+Hwv+8CosvaMLV7TC2CAKI/6EO
	 fSc/OV3II0JPzham4cs4rIH+hZPLkDaF9BN1TPcyThCsMz7tGfi3edua94ypbSUtRq
	 hwj7UoClWZViULMB5qJrvWWx0npF+XS2fyHk2yHDVPUxavzNLoNO61yHkAq05U9b6E
	 pM+ZlJuxFcYp9ESPpc97xFVsJATNVravn3rz49dDxUrT068eJ2rQBad9o16Y81MBdT
	 mDsCbtKl9pwQMd3L/k1zfLHoX+7KQC6VkC9cUS+fZpIdy09oDOiGUjMCbfpoPM7QQe
	 kLu7L07+jHUXA==
Date: Tue, 13 May 2025 15:56:43 +0100
From: Will Deacon <will@kernel.org>
To: perlarsen@google.com
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, sebastianene@google.com,
	lpieralisi@kernel.org, arve@android.com, qwandor@google.com,
	kernel-team@android.com, armellel@google.com, perl@immunant.com,
	jean-philippe@linaro.org, ahomescu@google.com, tabba@google.com,
	qperret@google.com, james.morse@arm.com,
	Ayrton Munoz <ayrton@google.com>
Subject: Re: [PATCH v3 2/3] KVM: arm64: Bump the supported version of FF-A to
 1.2
Message-ID: <20250513145642.GB9443@willie-the-truck>
References: <20250513-virtio-msg-ffa-v3-0-d66c76ff1b2c@google.com>
 <20250513-virtio-msg-ffa-v3-2-d66c76ff1b2c@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250513-virtio-msg-ffa-v3-2-d66c76ff1b2c@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_075653_309924_4B6A1112 
X-CRM114-Status: GOOD (  28.99  )
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

On Tue, May 13, 2025 at 06:28:31AM +0000, Per Larsen via B4 Relay wrote:
> From: Per Larsen <perlarsen@google.com>
> 
> FF-A version 1.2 introduces the DIRECT_REQ2 ABI. Bump the FF-A version
> preferred by the hypervisor as a precursor to implementing the 1.2-only
> FFA_MSG_SEND_DIRECT_REQ2 and FFA_MSG_SEND_RESP2 messaging interfaces.
> 
> We must also use SMCCC 1.2 for 64-bit SMCs if hypervisor negotiated FF-A
> 1.2, so ffa_set_retval is updated and a new function to call 64-bit smcs
> using SMCCC 1.2 with fallback to SMCCC 1.1 is introduced.
> 
> Update deny-list in ffa_call_supported to mark FFA_NOTIFICATION_* and
> interfaces added in FF-A 1.2 as unsupported lest they get forwarded.
> 
> Co-developed-by: Ayrton Munoz <ayrton@google.com>
> Signed-off-by: Ayrton Munoz <ayrton@google.com>
> Signed-off-by: Per Larsen <perlarsen@google.com>
> Signed-off-by: Per Larsen <perl@immunant.com>
> ---
>  arch/arm64/kvm/hyp/include/nvhe/ffa.h |  1 +
>  arch/arm64/kvm/hyp/nvhe/Makefile      |  1 +
>  arch/arm64/kvm/hyp/nvhe/ffa.c         | 88 ++++++++++++++++++++++++++++++++---
>  include/linux/arm_ffa.h               |  1 +
>  4 files changed, 85 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/kvm/hyp/include/nvhe/ffa.h b/arch/arm64/kvm/hyp/include/nvhe/ffa.h
> index 146e0aebfa1c7c9834c75a9a29bf87eb6f94f436..02def6fe51f5079b12c168585e12f862211c4c91 100644
> --- a/arch/arm64/kvm/hyp/include/nvhe/ffa.h
> +++ b/arch/arm64/kvm/hyp/include/nvhe/ffa.h
> @@ -13,5 +13,6 @@
>  
>  int hyp_ffa_init(void *pages);
>  bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id);
> +u32 ffa_get_hypervisor_version(void);

No need to expose this outside of ffa.c (i.e. we can make the function
definition 'static').

>  #endif /* __KVM_HYP_FFA_H */
> diff --git a/arch/arm64/kvm/hyp/nvhe/Makefile b/arch/arm64/kvm/hyp/nvhe/Makefile
> index b43426a493df5a388caa920e259cc8c54d118a1b..95404ff16dac0389f45a3ee2c13a93b3ebebaf6d 100644
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
> index 2c199d40811efb5bfae199c4a67d8ae3d9307357..403fde6ca4d6ec49566ef60709cedbaef9f04592 100644
> --- a/arch/arm64/kvm/hyp/nvhe/ffa.c
> +++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
> @@ -101,6 +101,55 @@ static void ffa_set_retval(struct kvm_cpu_context *ctxt,
>  	cpu_reg(ctxt, 1) = res->a1;
>  	cpu_reg(ctxt, 2) = res->a2;
>  	cpu_reg(ctxt, 3) = res->a3;
> +
> +	/*
> +	 * Other result registers must be zero per DEN0077A but SMC32/HVC32 must
> +	 * preserve x8-x30 per DEN0028.
> +	 */
> +	cpu_reg(ctxt, 4) = 0;
> +	cpu_reg(ctxt, 5) = 0;
> +	cpu_reg(ctxt, 6) = 0;
> +	cpu_reg(ctxt, 7) = 0;

I don't think it's safe to zero these registers unconditionally. AFAICT,
R4-R7 were only allocated as result registers in SMCCC v1.2 and the
definition of 'struct arm_smccc_res' reflects that. If we blindly zero
these registers in the calling CPU context, we could end up corrupting
state that the compiler expects the asm containing the SMC instruction
to preserve.

> @@ -628,6 +677,20 @@ static bool ffa_call_supported(u64 func_id)
>  	case FFA_RXTX_MAP:
>  	case FFA_MEM_DONATE:
>  	case FFA_MEM_RETRIEVE_REQ:
> +	/* Optional notification interfaces added in FF-A 1.1 */
> +	case FFA_NOTIFICATION_BITMAP_CREATE:
> +	case FFA_NOTIFICATION_BITMAP_DESTROY:
> +	case FFA_NOTIFICATION_BIND:
> +	case FFA_NOTIFICATION_UNBIND:
> +	case FFA_NOTIFICATION_SET:
> +	case FFA_NOTIFICATION_GET:
> +	case FFA_NOTIFICATION_INFO_GET:

Please can you send this part as a separate patch? I think we'll be
passing these FFA_NOTIFICATION_ calls straight through to TZ as it
stands, which could result in unpleasant behaviours and might be
something we want to plug in the stable kernels irrespective of support
for v1.2.

> +	/* Unimplemented interfaces added in FF-A 1.2 */
> +	case FFA_MSG_SEND_DIRECT_REQ2:
> +	case FFA_MSG_SEND_DIRECT_RESP2:
> +	case FFA_CONSOLE_LOG:
> +	case FFA_PARTITION_INFO_GET_REGS:
> +	case FFA_EL3_INTR_HANDLE:
>  		return false;
>  	}
>  
> @@ -680,7 +743,7 @@ static int hyp_ffa_post_init(void)
>  	if (res.a0 != FFA_SUCCESS)
>  		return -EOPNOTSUPP;
>  
> -	switch (res.a2) {
> +	switch (res.a2 & FFA_FEAT_RXTX_MIN_SZ_MASK) {
>  	case FFA_FEAT_RXTX_MIN_SZ_4K:
>  		min_rxtx_sz = SZ_4K;
>  		break;
> @@ -861,6 +924,18 @@ bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
>  	return true;
>  }
>  
> +u32 ffa_get_hypervisor_version(void)

As above, this can be static.

> +{
> +	u32 version = 0;
> +
> +	hyp_spin_lock(&version_lock);
> +	if (has_version_negotiated)

This looks a bit weird to me. We should just be able to use
'hyp_ffa_version' directly because kvm_host_ffa_handler() checks
'has_version_negotiated' already (with smp_load_acquire()).

The weird case is when negotiation has _not_ completed:


        if (func_id != FFA_VERSION &&
            !smp_load_acquire(&has_version_negotiated)) {
                ffa_to_smccc_error(&res, FFA_RET_INVALID_PARAMETERS);
                goto out_handled;
        }

	...
out_handled:
	ffa_set_retval(host_ctxt, &res);


This is odd because we're now trying to return an error due to the
version not being negotiated, but we need the version to return the
error. How are we supposed to handle that per the spec?

Will

