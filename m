Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1110EC3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 14:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6yuHW7fO9guEdseTjh5mJX8CrpFDcnv9f002SgzFAmQ=; b=W0tFEWYJ4/SI+bSnoaDIKYr5vQ
	pm1Dz3w8fyv4QtsxAh7fjPU2CsRKn8PR/a0Co6JBGRCBm1PSAFid7Po2rzMqbP6YzHc8Mk3xDf1rG
	a51L4AfNczM9l/IQJHMgEGMCVPdxDzCPLKchxgbRRT/8sA16VkTrGYYMKaztH+vrurHsHyC+qGP+D
	NjGcEh57vgALGs+Q3bUjPF1CeaPSvPwAId6KdkAkEzS8uikfWuyNMg3ehYFe7GsEZ0nT+edkIcQlT
	Ecb+DHQEwW3mYzYp1/ixevNznehpyoZBfY+oEyoHxPF7g2V9BGoPlKdtx2yUcIOIBlZPLAH6OXR3k
	SErKdxhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFwJ1-00000003hvM-1sR7;
	Fri, 16 May 2025 14:44:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFvbZ-00000003bEh-0UUO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 14:00:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3284962A01;
	Fri, 16 May 2025 14:00:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9BD9C4CEED;
	Fri, 16 May 2025 14:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747404003;
	bh=BvTzr413V6VBxtMA82ZSx+N0EIx/GNeVC6zTvua2xLo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JZFYVSq7ATDSktvpGBHE8mAJThrw46Bb0fWjBMvnv19GsxTp4CmFa3YWRguMsxOe2
	 TCFXekBFpJu5UFtvW8g7RPiH4g978YWFGzyfn9qW4krrzD80MD/XvWcHaEmzQPXkmU
	 J9n+bbp2S1l/fp4yfEGwruHU5FwpTGJUjm5ROVn91XPIm9lfzeHs09jRLYZry1ktUJ
	 70KmoBr+CYjrBvduMkEA7ty3mCJvr8oFhog02M+XFNm2s2biQc4ZOcCbqwbR4apbYD
	 7kZnMbhBWfYY+lOOwWLW+DxB3W2lJnkOGb6Hn9ATVh6Zkpg0qeQXLD9yecVu3SR5hH
	 P1ZOgr9cdp0Fw==
Date: Fri, 16 May 2025 14:59:59 +0100
From: Will Deacon <will@kernel.org>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64/ptrace: Make user_hwdebug_state.dbg_regs[] array
 size as ARM_MAX_BRP
Message-ID: <20250516135958.GA13612@willie-the-truck>
References: <20250421055212.123774-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250421055212.123774-1-anshuman.khandual@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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

On Mon, Apr 21, 2025 at 11:22:12AM +0530, Anshuman Khandual wrote:
> Array elements inside 'struct user_hwdebug_state.dbg_regs[]' are inherently
> coupled with maximum breakpoints or watchpoints which could be present on a
> platform and which are defined with macros ARM_MAX_[BRP|WRP].
> 
> Rather than explicitly trying to keep the array elements in sync with these
> macros and then adding a BUILD_BUG_ON() just to ensure continued compliance
> , move these two macros into the uapi ptrace header itself thus making them
> available both for user space and kernel.
> 
> While here also ensure that ARM_MAX_BRP and ARM_MAX_WRP are always the same
> via a new BUILD_BUG_ON(). This helps in making sure that user_hwdebug_state
> structure remains usable both for breakpoint and watchpoint registers set
> via ptrace() system call interface.
> 
> Cc: Will Deacon <will@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-perf-users@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
> This patch applies on v6.15-rc3
> 
>  arch/arm64/include/asm/hw_breakpoint.h |  7 -------
>  arch/arm64/include/uapi/asm/ptrace.h   | 10 +++++++++-
>  arch/arm64/kernel/hw_breakpoint.c      |  9 +++++++++
>  3 files changed, 18 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/hw_breakpoint.h b/arch/arm64/include/asm/hw_breakpoint.h
> index bd81cf17744a..63c21b515647 100644
> --- a/arch/arm64/include/asm/hw_breakpoint.h
> +++ b/arch/arm64/include/asm/hw_breakpoint.h
> @@ -75,13 +75,6 @@ static inline void decode_ctrl_reg(u32 reg,
>  #define ARM_KERNEL_STEP_ACTIVE	1
>  #define ARM_KERNEL_STEP_SUSPEND	2
>  
> -/*
> - * Limits.
> - * Changing these will require modifications to the register accessors.
> - */
> -#define ARM_MAX_BRP		16
> -#define ARM_MAX_WRP		16
> -
>  /* Virtual debug register bases. */
>  #define AARCH64_DBG_REG_BVR	0
>  #define AARCH64_DBG_REG_BCR	(AARCH64_DBG_REG_BVR + ARM_MAX_BRP)
> diff --git a/arch/arm64/include/uapi/asm/ptrace.h b/arch/arm64/include/uapi/asm/ptrace.h
> index 0f39ba4f3efd..8683f541a467 100644
> --- a/arch/arm64/include/uapi/asm/ptrace.h
> +++ b/arch/arm64/include/uapi/asm/ptrace.h
> @@ -99,6 +99,14 @@ struct user_fpsimd_state {
>  	__u32		__reserved[2];
>  };
>  
> +/*
> + * Maximum number of breakpoint and watchpoint registers
> + * on the platform. These macros get used both in kernel
> + * and user space as well.
> + */
> +#define ARM_MAX_BRP		16
> +#define ARM_MAX_WRP		16
> +
>  struct user_hwdebug_state {
>  	__u32		dbg_info;
>  	__u32		pad;
> @@ -106,7 +114,7 @@ struct user_hwdebug_state {
>  		__u64	addr;
>  		__u32	ctrl;
>  		__u32	pad;
> -	}		dbg_regs[16];
> +	}		dbg_regs[ARM_MAX_BRP];	/* Or ARM_MAX_WRP */
>  };
>  
>  /* SVE/FP/SIMD state (NT_ARM_SVE & NT_ARM_SSVE) */
> diff --git a/arch/arm64/kernel/hw_breakpoint.c b/arch/arm64/kernel/hw_breakpoint.c
> index 722ac45f9f7b..9bc51682713d 100644
> --- a/arch/arm64/kernel/hw_breakpoint.c
> +++ b/arch/arm64/kernel/hw_breakpoint.c
> @@ -981,6 +981,15 @@ static int __init arch_hw_breakpoint_init(void)
>  {
>  	int ret;
>  
> +	/*
> +	 * Maximum supported breakpoint and watchpoint registers must
> +	 * always be the same - regardless of actual register numbers
> +	 * found on a given platform. This is because the user facing
> +	 * ptrace structure 'user_hwdebug_state' actually depends on
> +	 * these macros to be the same.
> +	 */
> +	BUILD_BUG_ON(ARM_MAX_BRP != ARM_MAX_WRP);

Sorry, but I don't understand why this patch is an improvement over what
we have.

Will

