Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D16C2C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 15:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MSzvORr/gVZ7jSN0HABhiXm3spnKfDLNDT+Dp/cd+n0=; b=CI3qyYBs1FVQ7D7x86ROSP8nm/
	sTUcXZU5VCZYA81wr/dkZc1jsku2Qyd1ViVv0yWqSBMHXQoRvyBOTdykVH/p7X3O/Xk6darlxHJlB
	9zOw/dDRV4Ri60/WJu2Ib9nDO/CRVsVjOnIwQNf51ukimTLtSGG4e0tazIm8yb+vgo0THMTo3XehQ
	c1SGOYY4NSD+TPV6G0CBPl7s9zS7t5hmPbKOxBg/Dd0cNrWH+E8Pw5vrkgeY1SbWk9bbPRImgRBGe
	GfLTifCzfap16Gl4X1F9XsOQIST08at96hZVTDOqYoYbp/Z8mtPGhk5xQzT9ULdU8jzN93b1+d5Jc
	M3qC9bEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCJot-0000000CQVg-0gy4;
	Tue, 06 May 2025 15:02:55 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCGze-0000000Bpvj-3lJG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 12:01:52 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-43cf3192d8bso42525e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 05:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746532909; x=1747137709; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MSzvORr/gVZ7jSN0HABhiXm3spnKfDLNDT+Dp/cd+n0=;
        b=YyTBlN+Q4CwoyFNJfDu4x7CjqBrrWM3LUOZG4+/BdRQ8WiJuTHxBwLROCU/Djp0kST
         ELGKvzCJ8g6JRtjq61TVH7n71V1uQLJ/wl9ME44Gjr4vn+qCHjxK+p22iTIJazmQLlFD
         4FOBQ629pwMiZnMjhwzlSCnegeSjHzYHUqhD7M6Q4PWNBBKiUBfInkyJJz2yrh9aeJUM
         t5guat7K9yiYWkIydeA47FHDXLSyEryrczHiHzgqGRTQf3izlPdthJZeNum4Ob9GYNil
         1ihmokou8JCxa5FcBT+ujXvCVf2ScLHFXP63n7sEJhiO5/WjfCw+nPzc1eyKLOs61eSu
         BHng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746532909; x=1747137709;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MSzvORr/gVZ7jSN0HABhiXm3spnKfDLNDT+Dp/cd+n0=;
        b=oUAVmBHajUNmIqkNlCQoyuKB/uhzK0kpHyKhjyMcr7pqQFqsCjtk5a0tKtSuaSz0Xq
         kitoDoqyySQrFOjeQPcZjbwWTkqDgkYCz6gFB2tC0B/1hr1JTBG17IdPIOP8G1gaC6oa
         6vwtszShpVrlNDL0Ot8qU78zTS2Qjo18uqxlFI1D5k9KIGtGWJ3ZxW/QG9VEKE9AhM+b
         oG1lryQMVfoJWIQOONlTTTNzcJtmPaAgEoXD68SfWHF/88Efze8QaOqFiXaEwdRdFhm0
         9BAsW7TRBXXGST7AkHXBXhXJJJzRdU7HqExaWZR0AlOSb6cN+rPC6OWV8UB2pAzG/rtw
         3I1g==
X-Forwarded-Encrypted: i=1; AJvYcCUSOuCA7z8e7xW9CBfMKCFi6zCSLkYM3+E70dvxA1+gqOPgRC9L/xWDj2odUHxKID2kqNEGHx73Qddhk/elXigy@lists.infradead.org
X-Gm-Message-State: AOJu0YzmoW3L6YJ08qAHiRWrhZLkSTXSTRkiHjEjZO5qa1YeBapfqCbQ
	4Rio3Mkh63I8kQEEK37UUQF8WL5pShMKdoG/l1Enu/80/e/bRqgGiNORUD3RSQ==
X-Gm-Gg: ASbGnctNaj8BtX81lSqe/UjfYnAUVm3YzCUioxKJ8nFtEf1EAPxOQYjoLE21mWapGz5
	3H4nFZbk0NbgUO7wN8nIaPFB21Cz3VWxDaVfMRuigw6KahTrRJ/yMjZYr8+uM1xk42KYAvyL200
	0/ePSbHSg/0FCfYnxoEzaaLTRBS9J8UwQynjXAKtIJolJGmcJqWhpTegfopIBQCFgfD6Tc2eZEw
	1LCBmCQpJOXLMei/iDeYVkEh6ljAXry6KEmlY6DXcaSYNsVE5On6Fk5zaqCTYbYUhVpabmxsGhk
	alMkijSInjI106ny6xDkjkC5hjVLPwFrU02q3unxOVLZEBdxtSxRg0gb+JgUAmieL06npnFUFB/
	z05fgRw==
X-Google-Smtp-Source: AGHT+IFBpEtiuzrhdK03rKZqJG6PwBucCmCJtiJ6cB8NuTFy5G+tiPNJu5pB483uNv06dEHDGi/VFw==
X-Received: by 2002:a05:600c:4657:b0:43b:c2cc:5075 with SMTP id 5b1f17b1804b1-441d123f608mr713235e9.5.1746532909129;
        Tue, 06 May 2025 05:01:49 -0700 (PDT)
Received: from google.com (207.57.78.34.bc.googleusercontent.com. [34.78.57.207])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae831esm13723056f8f.57.2025.05.06.05.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 05:01:48 -0700 (PDT)
Date: Tue, 6 May 2025 12:01:42 +0000
From: Sebastian Ene <sebastianene@google.com>
To: Per Larsen <perl@immunant.com>
Cc: linux-kernel@vger.kernel.org, catalin.marinas@arm.com,
	james.morse@arm.com, jean-philippe@linaro.org,
	kernel-team@android.com, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, lpieralisi@kernel.org,
	maz@kernel.org, oliver.upton@linux.dev, qperret@google.com,
	qwandor@google.com, sudeep.holla@arm.com, suzuki.poulose@arm.com,
	tabba@google.com, will@kernel.org, yuzenghui@huawei.com,
	armellel@google.com, arve@android.com, ahomescu@google.com,
	Per Larsen <perlarsen@google.com>, Ayrton Munoz <ayrton@google.com>
Subject: Re: [PATCH 2/3] KVM: arm64: Bump the supported version of FF-A to 1.2
Message-ID: <aBn6JlRUoA9hKdZd@google.com>
References: <20250502092108.3224341-1-perl@immunant.com>
 <20250502092108.3224341-3-perl@immunant.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250502092108.3224341-3-perl@immunant.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_050150_954871_38EE5171 
X-CRM114-Status: GOOD (  36.66  )
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

On Fri, May 02, 2025 at 02:21:07AM -0700, Per Larsen wrote:
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
> Co-Developed-by: Ayrton Munoz <ayrton@google.com>
> Signed-off-by: Per Larsen <perlarsen@google.com>
> Signed-off-by: Per Larsen <perl@immunant.com>
> ---
>  arch/arm64/kvm/hyp/nvhe/Makefile |   1 +
>  arch/arm64/kvm/hyp/nvhe/ffa.c    | 109 ++++++++++++++++++++++++++-----
>  2 files changed, 94 insertions(+), 16 deletions(-)
> 
> diff --git a/arch/arm64/kvm/hyp/nvhe/Makefile b/arch/arm64/kvm/hyp/nvhe/Makefile
> index b43426a493df..95404ff16dac 100644
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
> index 10e88207b78e..8102dd6a19f7 100644
> --- a/arch/arm64/kvm/hyp/nvhe/ffa.c
> +++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
> @@ -94,13 +94,57 @@ static void ffa_to_smccc_res(struct arm_smccc_res *res, int ret)
>  	ffa_to_smccc_res_prop(res, ret, 0);
>  }
>  
> -static void ffa_set_retval(struct kvm_cpu_context *ctxt,
> +static void ffa_set_retval(u64 func_id,
> +			   struct kvm_cpu_context *ctxt,
>  			   struct arm_smccc_res *res)
>  {
>  	cpu_reg(ctxt, 0) = res->a0;
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
> +
> +	/* Per DEN0077A v1.2, x8-x17 must be zero for SMC64/HVC64 results*/
> +	if (ARM_SMCCC_IS_64(func_id) && hyp_ffa_version >= FFA_VERSION_1_2) {

We don't currently handle SMC32 so ARM_SMCCC_IS_64(func_id) should not
be needed and we can also drop the func_id argument.
Also hyp_ffa_version should be accessed with a lock.

> +		cpu_reg(ctxt, 8) = 0;
> +		cpu_reg(ctxt, 9) = 0;
> +		cpu_reg(ctxt, 10) = 0;
> +		cpu_reg(ctxt, 11) = 0;
> +		cpu_reg(ctxt, 12) = 0;
> +		cpu_reg(ctxt, 13) = 0;
> +		cpu_reg(ctxt, 14) = 0;
> +		cpu_reg(ctxt, 15) = 0;
> +		cpu_reg(ctxt, 16) = 0;
> +		cpu_reg(ctxt, 17) = 0;

How can we know from the hypervisor(which is the caller) whether these registers are
used or not by the calee ? IMO this should be TZ responsibility to mitigate the
risk of leaking information through register if these are not used.

> +	}
> +}
> +
> +/* Call SMC64 using SMCCC 1.2 if hyp negotiated FF-A 1.2 falling back to 1.1 */
> +static void arm_smccc_1_2_smc_fallback(u64 func_id, u64 a1, u64 a2, u64 a3,

Should we rename this to arm_smccc_1_x_smc to keep the same name format
?

> +				       u64 a4, u64 a5, u64 a6, u64 a7,
> +				       struct arm_smccc_res *res)
> +{
> +	struct arm_smccc_1_2_regs args, regs;

Initialize regs with {0} to prevent leakaging the hypervisor
stack values in case the callee doesn't make use of it.

> +
> +	/* SMC64 only as SMC32 must preserve x8-x30 per DEN0028 1.6G Sec 2.6 */
> +	if (ARM_SMCCC_IS_64(func_id) && hyp_ffa_version >= FFA_VERSION_1_2) {
> +		args = (struct arm_smccc_1_2_regs) { func_id, a1, a2, a3, a4,
> +						     a5, a6, a7 };
> +		arm_smccc_1_2_smc(&args, &regs);
> +		*res = (struct arm_smccc_res) { .a0 = regs.a0, .a1 = regs.a1,
> +						.a2 = regs.a2, .a3 = regs.a3 };
> +		return;
> +	}
> +
> +	arm_smccc_1_1_smc(func_id, a1, a2, a3, a4, a5, a6, a7, res);
>  }
>  
>  static bool is_ffa_call(u64 func_id)
> @@ -115,12 +159,12 @@ static int ffa_map_hyp_buffers(u64 ffa_page_count)
>  {
>  	struct arm_smccc_res res;
>  
> -	arm_smccc_1_1_smc(FFA_FN64_RXTX_MAP,
> -			  hyp_virt_to_phys(hyp_buffers.tx),
> -			  hyp_virt_to_phys(hyp_buffers.rx),
> -			  ffa_page_count,
> -			  0, 0, 0, 0,
> -			  &res);
> +	arm_smccc_1_2_smc_fallback(FFA_FN64_RXTX_MAP,
> +				   hyp_virt_to_phys(hyp_buffers.tx),
> +				   hyp_virt_to_phys(hyp_buffers.rx),
> +				   ffa_page_count,
> +				   0, 0, 0, 0,
> +				   &res);
>  
>  	return res.a0 == FFA_SUCCESS ? FFA_RET_SUCCESS : res.a2;
>  }
> @@ -174,10 +218,10 @@ static void ffa_mem_reclaim(struct arm_smccc_res *res, u32 handle_lo,
>  
>  static void ffa_retrieve_req(struct arm_smccc_res *res, u32 len)
>  {
> -	arm_smccc_1_1_smc(FFA_FN64_MEM_RETRIEVE_REQ,
> -			  len, len,
> -			  0, 0, 0, 0, 0,
> -			  res);
> +	arm_smccc_1_2_smc_fallback(FFA_FN64_MEM_RETRIEVE_REQ,
> +				   len, len,
> +				   0, 0, 0, 0, 0,
> +				   res);
>  }
>  
>  static void ffa_rx_release(struct arm_smccc_res *res)
> @@ -628,6 +672,37 @@ static bool ffa_call_supported(u64 func_id)
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
> +	/* Unimplemented interfaces added in FF-A 1.2 */
> +	case FFA_MSG_SEND_DIRECT_REQ2:
> +
> +	/*
> +	 * FFA_MSG_SEND_DIRECT_RESP2 is not meant to be invoked by the host or
> +	 * a guest VM because pkvm does not support communication between VMs
> +	 * via FF-A. Direct messages can only be sent from a non-secure sender
> +	 * endpoint to a secure receiver endpoint. Only receiver endpoints are
> +	 * expected to invoke FFA_MSG_SEND_DIRECT_RESP2.
> +	 */
> +	case FFA_MSG_SEND_DIRECT_RESP2:
> +
> +	/* Reserved for secure endpoints per DEN0077A 1.2 REL0 Table 13.53. */

I don't know if the comment is relevant to the upstream code, should we
drop it ? The same with the previous one and few after this.

> +	case FFA_CONSOLE_LOG:
> +
> +	/*
> +	 * Mandatory for secure endpoints per DEN0077A 1.2 REL0 Table 13.1 and
> +	 * optional for non-secure endpoints according to Table 13.38.
> +	 */
> +	case FFA_PARTITION_INFO_GET_REGS:
> +
> +	/* Reserved for secure endpoints per DEN0077A 1.2 REL0 Table 17.2. */
> +	case FFA_EL3_INTR_HANDLE:
>  		return false;
>  	}
>  
> @@ -680,7 +755,8 @@ static int hyp_ffa_post_init(void)
>  	if (res.a0 != FFA_SUCCESS)
>  		return -EOPNOTSUPP;
>  
> -	switch (res.a2) {
> +	/* Bit[0:1] holds minimum buffer size and alignment boundary */
> +	switch (res.a2 & 0x3) {

What is 0x3 ? Can you please define the mask for it ?

>  	case FFA_FEAT_RXTX_MIN_SZ_4K:
>  		min_rxtx_sz = SZ_4K;
>  		break;
> @@ -871,7 +947,7 @@ bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
>  
>  	ffa_to_smccc_error(&res, FFA_RET_NOT_SUPPORTED);
>  out_handled:
> -	ffa_set_retval(host_ctxt, &res);
> +	ffa_set_retval(func_id, host_ctxt, &res);
>  	return true;
>  }
>  
> @@ -883,7 +959,7 @@ int hyp_ffa_init(void *pages)
>  	if (kvm_host_psci_config.smccc_version < ARM_SMCCC_VERSION_1_2)
>  		return 0;
>  
> -	arm_smccc_1_1_smc(FFA_VERSION, FFA_VERSION_1_1, 0, 0, 0, 0, 0, 0, &res);
> +	arm_smccc_1_1_smc(FFA_VERSION, FFA_VERSION_1_2, 0, 0, 0, 0, 0, 0, &res);
>  	if (res.a0 == FFA_RET_NOT_SUPPORTED)
>  		return 0;
>  
> @@ -903,10 +979,11 @@ int hyp_ffa_init(void *pages)
>  	if (FFA_MAJOR_VERSION(res.a0) != 1)
>  		return -EOPNOTSUPP;
>  
> -	if (FFA_MINOR_VERSION(res.a0) < FFA_MINOR_VERSION(FFA_VERSION_1_1))
> +	/* See do_ffa_guest_version before bumping maximum supported version. */
> +	if (FFA_MINOR_VERSION(res.a0) < FFA_MINOR_VERSION(FFA_VERSION_1_2))
>  		hyp_ffa_version = res.a0;
>  	else
> -		hyp_ffa_version = FFA_VERSION_1_1;
> +		hyp_ffa_version = FFA_VERSION_1_2;
>  
>  	tx = pages;
>  	pages += KVM_FFA_MBOX_NR_PAGES * PAGE_SIZE;
> -- 
> 2.49.0
> 

