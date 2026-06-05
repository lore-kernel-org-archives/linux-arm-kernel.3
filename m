Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6DFACD6E7B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 09:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=27IyGzXryO4mCf3HcYxb8pG4aADIiP9FcTwQAI/ZmA8=; b=keGPm3xi3AW+S6Xwk5HcrCHux/
	azNx0a7NJBkSf/95F+afb/dQwH9wHteVGn58I9MJs1fWXhaNkmqEhsEwMHxsv6PLYDbaiItrYQekL
	up+wgF36H7GqwCY6zRLKP+96GYSE9AXRvTWHxDe8pScnrctCRvBZadM48l5DE0B2eHLivEbu6dFL3
	UNrL8R5icxWTorT/poZVdmQOvqKaiY6fqLHrE/2cAeknhE4/uqqTlMCbHSakFgF6Ap+J+YIo/Pxd4
	XaLepQHnrHX3cCcsvRtWQymeMHK+i8rgIAHElVqfktFftAHDIiSCz+5S4tf2MocGPMJb0X13OJ2qz
	pQt5Wltw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVQp1-00000000Ohm-1oSZ;
	Fri, 05 Jun 2026 09:26:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVQoy-00000000OhH-2Z4x
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 09:26:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3294A4AB3;
	Fri,  5 Jun 2026 02:26:26 -0700 (PDT)
Received: from [10.1.34.147] (e121487-lin.cambridge.arm.com [10.1.34.147])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 633473F86F;
	Fri,  5 Jun 2026 02:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780651591; bh=qLDVMzsp0gU9ZT+OeIVYdQXL4O9nCAvlhg1NGB8/Z/Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pc5HFOIJNGJddjic9h4Z3nHCCDTS1usEWCoRtTBJzuDeWeiskdxV6/pmk2pZ97P9B
	 fAxd3MOD7j5ElA+q+JwOWz0ndXxVCL8Fd0aFrgvdNPDffVFIwnqbMXaUt4UQauq2zt
	 LAz2BgrhZktIkxYJj2Xfg3flDBBRC3Sz2N5AAksQ=
Message-ID: <fd729256-07e8-46eb-8473-74ae6ec3a07e@arm.com>
Date: Fri, 5 Jun 2026 10:26:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: errata: Workaround NVIDIA Olympus device
 store/load ordering erratum
To: Shanker Donthineni <sdonthineni@nvidia.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Vikram Sethi <vsethi@nvidia.com>,
 Jason Sequeira <jsequeira@nvidia.com>
References: <20260604231254.1904988-1-sdonthineni@nvidia.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <20260604231254.1904988-1-sdonthineni@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_022633_116456_E4F75201 
X-CRM114-Status: GOOD (  37.27  )
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

On 6/5/26 00:12, Shanker Donthineni wrote:
> On systems with NVIDIA Olympus cores, a Device-nGnR* load can be
> observed by a peripheral before an older, non-overlapping Device-nGnR*
> store to the same peripheral. This breaks the program-order guarantee
> that software expects for Device-nGnR* accesses and can leave a
> peripheral in an incorrect state, as a load is observed before an
> earlier store takes effect.
> 
> The erratum can occur only when all of the following apply:
> 
>   - A PE executes a Device-nGnR* store followed by a younger
>     Device-nGnR* load.
>   - The store is not a store-release.
>   - The accesses target the same peripheral and do not overlap in bytes.
>   - There is at most one intervening Device-nGnR* store in program
>     order, and there are no intervening Device-nGnR* loads.
>   - There is no DSB, and no DMB that orders loads, between the store and
>     the load.
>   - Specific micro-architectural and timing conditions occur.
> 
> Two ways to restore ordering: insert a barrier (any DSB, or a DMB that
> orders loads) between the store and the load, or make the store a
> store-release. A load-acquire on the load side would not help, because
> acquire semantics do not prevent a load from being observed ahead of an
> older store; only the store side (release or a barrier) closes the
> window.
> 
> Promote the raw MMIO store helpers (__raw_writeb/w/l/q) from plain str*
> to stlr* (Store-Release), which removes the "store is not a
> store-release" condition for every device write the kernel issues.
> Because writel() and writel_relaxed() are both built on __raw_writel()
> in asm-generic/io.h, patching the raw variants covers both the
> non-relaxed and relaxed APIs without touching the higher layers. Note
> that writel()'s own barrier sits before the store, so it does not order
> the store against a subsequent readl(); the store-release promotion is
> what provides that ordering.
> 
> Like ARM64_ERRATUM_832075 on the load side, the change is gated on a new
> ARM64_WORKAROUND_DEVICE_STORE_RELEASE capability and only activated on
> parts that match MIDR_NVIDIA_OLYMPUS, so unaffected CPUs continue to use
> the plain str* sequence.
> 
> Co-developed-by: Vikram Sethi <vsethi@nvidia.com>
> Signed-off-by: Vikram Sethi <vsethi@nvidia.com>
> Signed-off-by: Shanker Donthineni <sdonthineni@nvidia.com>
> ---
>  Documentation/arch/arm64/silicon-errata.rst |  2 ++
>  arch/arm64/Kconfig                          | 23 ++++++++++++++++++++
>  arch/arm64/include/asm/io.h                 | 24 ++++++++++++++-------
>  arch/arm64/kernel/cpu_errata.c              |  8 +++++++
>  arch/arm64/tools/cpucaps                    |  1 +
>  5 files changed, 50 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
> index 211119ce7adc..899bed3908bb 100644
> --- a/Documentation/arch/arm64/silicon-errata.rst
> +++ b/Documentation/arch/arm64/silicon-errata.rst
> @@ -256,6 +256,8 @@ stable kernels.
>  +----------------+-----------------+-----------------+-----------------------------+
>  | NVIDIA         | Carmel Core     | N/A             | NVIDIA_CARMEL_CNP_ERRATUM   |
>  +----------------+-----------------+-----------------+-----------------------------+
> +| NVIDIA         | Olympus core    | T410-OLY-1027   | NVIDIA_OLYMPUS_1027_ERRATUM |
> ++----------------+-----------------+-----------------+-----------------------------+
>  | NVIDIA         | T241 GICv3/4.x  | T241-FABRIC-4   | N/A                         |
>  +----------------+-----------------+-----------------+-----------------------------+
>  | NVIDIA         | T241 MPAM       | T241-MPAM-1     | N/A                         |
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index fe60738e5943..a6bac84b05a1 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -564,6 +564,29 @@ config ARM64_ERRATUM_832075
>  
>  	  If unsure, say Y.
>  
> +config NVIDIA_OLYMPUS_1027_ERRATUM
> +	bool "NVIDIA Olympus: device store/load ordering erratum"
> +	default y
> +	help
> +	  This option adds an alternative code sequence to work around an
> +	  NVIDIA Olympus core erratum where a Device-nGnR* store can be
> +	  observed by a peripheral after a younger Device-nGnR* load to the
> +	  same peripheral. This breaks the program order that drivers rely
> +	  on for MMIO and can leave a device in an incorrect state.
> +
> +	  The workaround promotes the raw MMIO store helpers
> +	  (__raw_writeb/w/l/q) to Store-Release (STLR), which restores the
> +	  required ordering. Because writel() and writel_relaxed() are built
> +	  on __raw_writel(), both are covered without changes to the higher
> +	  layers.
> +
> +	  The fix is applied through the alternatives framework, so enabling
> +	  this option does not by itself activate the workaround: it is
> +	  patched in only when an affected CPU is detected, and is a no-op on
> +	  unaffected CPUs.
> +
> +	  If unsure, say Y.
> +
>  config ARM64_ERRATUM_834220
>  	bool "Cortex-A57: 834220: Stage 2 translation fault might be incorrectly reported in presence of a Stage 1 fault (rare)"
>  	depends on KVM
> diff --git a/arch/arm64/include/asm/io.h b/arch/arm64/include/asm/io.h
> index 8cbd1e96fd50..b6d7966e9c19 100644
> --- a/arch/arm64/include/asm/io.h
> +++ b/arch/arm64/include/asm/io.h
> @@ -25,29 +25,37 @@
>  #define __raw_writeb __raw_writeb
>  static __always_inline void __raw_writeb(u8 val, volatile void __iomem *addr)
>  {
> -	volatile u8 __iomem *ptr = addr;
> -	asm volatile("strb %w0, %1" : : "rZ" (val), "Qo" (*ptr));
> +	asm volatile(ALTERNATIVE("strb %w0, [%1]",
> +				 "stlrb %w0, [%1]",
> +				 ARM64_WORKAROUND_DEVICE_STORE_RELEASE)
> +		     : : "rZ" (val), "r" (addr));
>  }
>  

Nitpick:

The change has the side effect of undoing d044d6ba6f02 ("arm64:
io: permit offset addressing"), since stlr* do not support
offset addressing. Unaffected CPUs would continue to use str*,
but would lose the benefit of offset addressing :(

Not sure if this needs to be mentioned in the commit message...

Cheers
Vladimir

>  #define __raw_writew __raw_writew
>  static __always_inline void __raw_writew(u16 val, volatile void __iomem *addr)
>  {
> -	volatile u16 __iomem *ptr = addr;
> -	asm volatile("strh %w0, %1" : : "rZ" (val), "Qo" (*ptr));
> +	asm volatile(ALTERNATIVE("strh %w0, [%1]",
> +				 "stlrh %w0, [%1]",
> +				 ARM64_WORKAROUND_DEVICE_STORE_RELEASE)
> +		     : : "rZ" (val), "r" (addr));
>  }
>  
>  #define __raw_writel __raw_writel
>  static __always_inline void __raw_writel(u32 val, volatile void __iomem *addr)
>  {
> -	volatile u32 __iomem *ptr = addr;
> -	asm volatile("str %w0, %1" : : "rZ" (val), "Qo" (*ptr));
> +	asm volatile(ALTERNATIVE("str %w0, [%1]",
> +				 "stlr %w0, [%1]",
> +				 ARM64_WORKAROUND_DEVICE_STORE_RELEASE)
> +		     : : "rZ" (val), "r" (addr));
>  }
>  
>  #define __raw_writeq __raw_writeq
>  static __always_inline void __raw_writeq(u64 val, volatile void __iomem *addr)
>  {
> -	volatile u64 __iomem *ptr = addr;
> -	asm volatile("str %x0, %1" : : "rZ" (val), "Qo" (*ptr));
> +	asm volatile(ALTERNATIVE("str %x0, [%1]",
> +				 "stlr %x0, [%1]",
> +				 ARM64_WORKAROUND_DEVICE_STORE_RELEASE)
> +		     : : "rZ" (val), "r" (addr));
>  }
>  
>  #define __raw_readb __raw_readb
> diff --git a/arch/arm64/kernel/cpu_errata.c b/arch/arm64/kernel/cpu_errata.c
> index 5377e4c2eba2..958d7f16bfeb 100644
> --- a/arch/arm64/kernel/cpu_errata.c
> +++ b/arch/arm64/kernel/cpu_errata.c
> @@ -809,6 +809,14 @@ const struct arm64_cpu_capabilities arm64_errata[] = {
>  		ERRATA_MIDR_ALL_VERSIONS(MIDR_NVIDIA_CARMEL),
>  	},
>  #endif
> +#ifdef CONFIG_NVIDIA_OLYMPUS_1027_ERRATUM
> +	{
> +		/* NVIDIA Olympus core */
> +		.desc = "NVIDIA Olympus device load/store ordering erratum",
> +		.capability = ARM64_WORKAROUND_DEVICE_STORE_RELEASE,
> +		ERRATA_MIDR_ALL_VERSIONS(MIDR_NVIDIA_OLYMPUS),
> +	},
> +#endif
>  #ifdef CONFIG_ARM64_WORKAROUND_TRBE_OVERWRITE_FILL_MODE
>  	{
>  		/*
> diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
> index 811c2479e82d..d367257bf770 100644
> --- a/arch/arm64/tools/cpucaps
> +++ b/arch/arm64/tools/cpucaps
> @@ -120,6 +120,7 @@ WORKAROUND_CAVIUM_TX2_219_PRFM
>  WORKAROUND_CAVIUM_TX2_219_TVM
>  WORKAROUND_CLEAN_CACHE
>  WORKAROUND_DEVICE_LOAD_ACQUIRE
> +WORKAROUND_DEVICE_STORE_RELEASE
>  WORKAROUND_NVIDIA_CARMEL_CNP
>  WORKAROUND_PMUV3_IMPDEF_TRAPS
>  WORKAROUND_QCOM_FALKOR_E1003
> -- 2.43.0
> 


