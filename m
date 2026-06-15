Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 435A8CD98CF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 15:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HBe8cdlNCQqE12/zwJ/SLpsSNBRhiW1M+TmkACCkxcU=; b=rCd7MqKJaKCSmlnWG5wiI1FCcl
	0n4FqyIQ7+T1pkDwMR92mSg2yT2kfNJDDc5UrJ44jbWeVoE6wOuDH++XK2GywGpk/FMbbJhhPbHcm
	SWQp0n5QdZ/f1rWzURuusHu8ynz6sE7sAZW57jAJL5PNgL9owAFxwH4zmD3y+ZBYCK5SMJOZl7wOV
	tmABGKxRP4hUaHM9GO88/dwGDXRh265IaaF5gROwuHT++cU1qtVRve+lltLCdNIJvHVMdTAEdSxKv
	2wv9o6DfxqCfUECrRJeUYXXthz3l8M7+e2rjxzupZQIUOOcnd2pX2mpIOsCPrcy4AscDjnmH79Z2b
	HF5uB7Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ8pQ-0000000ET9l-04PN;
	Mon, 15 Jun 2026 15:02:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ8pO-0000000ET9S-2zAC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 15:02:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5EF80438F1;
	Mon, 15 Jun 2026 15:02:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED9DA1F000E9;
	Mon, 15 Jun 2026 15:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781535738;
	bh=HBe8cdlNCQqE12/zwJ/SLpsSNBRhiW1M+TmkACCkxcU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ArXWELXE4E6mYCPjMmrjKGLAA5h04Oihe8B4PZppjjkdYhIuzvnxAPkRyIV0qg2x0
	 4MadnEhwbdmqRWXWp046osKAwe/M0ouBydLr05eQ5/W6D+ihGbIT9IuzjBdAzQjtpp
	 tDC4NDDxiIjzD5Pia3MQR4pRdBOWb0EOa9pGqr7aFdU+56RBk0Sv7Me9Ss/36vsweB
	 me/NyWzBpK8+dh3uH218sxEqjt3mk76y6M/d6WlXYTnF+TIZR6CTLG+VNs02NY/Avw
	 x7fP45seuBnQgIZy/8f3S/IRX9Hke6zWGQ/Ew6zuO2dIyjiDrwEwsW9Pfao9copDYq
	 k4Kc/c0rIHclA==
Date: Mon, 15 Jun 2026 16:02:13 +0100
From: Will Deacon <will@kernel.org>
To: Yureka Lilian <yureka@cyberchaos.dev>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev, Sasha Finkelstein <k@chaosmail.tech>
Subject: Re: [PATCH v2] arm64: errata: Handle Apple WFI State Loss
Message-ID: <ajAT9fWgOd9HY7ei@willie-the-truck>
References: <20260615-wfi-erratum-v2-1-59a73467f70d@cyberchaos.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260615-wfi-erratum-v2-1-59a73467f70d@cyberchaos.dev>
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

On Mon, Jun 15, 2026 at 02:21:36PM +0200, Yureka Lilian wrote:
> Apple Silicon CPUs can lose register state in WFI, leading to crashes
> in the idle loop early in the boot process.
> This applies to any previous Apple Silicon CPUs too, but is worked
> around by configuring the WFI mode in SYS_IMP_APL_CYC_OVRD sysreg
> during m1n1's chickens setup.
> This workaround no longer exists since M4.
> 
> Add a workaround capability for replacing wfi and wfit with nop, and
> an erratum to enable it on the affected CPUs if the workaround using the
> sysreg is not already applied. Leave the decision whether the sysreg
> workaround can be used up to the earlier parts of the boot chain which
> already configure the Apple Silicon chicken bits.
> 
> This alternative has to be applied in early boot, since otherwise some
> cores might enter the idle loop before apply_alternatives_all() is run.
> 
> Reviewed-by: Sasha Finkelstein <k@chaosmail.tech>
> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
> ---
> Changes since v1:
> Restricted the erratum to EL2 only, since in EL1 we'd expect the
> hypervisor to trap WFI and handle the erratum.
> 
> Tested on M4 and M4 Pro (which now sometimes nondeterministically
> crash later during boot).
> Successfully booted on M3 Max with the SYS_IMP_APL_CYC_OVRD
> workaround disabled in the bootloader, as well as A18 Pro (which,
> like M4 / M4 Pro, doesn't have SYS_IMP_APL_CYC_OVRD).
> 
> There is probably a better place for the SYS_IMP_APL_CYC_OVRD
> defines, which I currently put in the middle of cpu_errata.c, but I
> wouldn't know where.
> ---
>  arch/arm64/Kconfig               | 12 ++++++++++++
>  arch/arm64/include/asm/barrier.h | 19 ++++++++++++++++---
>  arch/arm64/kernel/cpu_errata.c   | 21 +++++++++++++++++++++
>  arch/arm64/tools/cpucaps         |  1 +
>  4 files changed, 50 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index b3afe0688919..8c8ff069856f 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -453,6 +453,18 @@ config AMPERE_ERRATUM_AC04_CPU_23
>  
>  	  If unsure, say Y.
>  
> +config APPLE_ERRATUM_WFI_STATE
> +	bool "Apple Silicon: WFI loses state"
> +	default y
> +	help
> +	  This option adds an alternative code sequence to work around some
> +	  Apple Silicon CPUs losing register state during wfi and wfit
> +	  instructions.
> +
> +	  As a workaround, the wfi and wfit instructions are replaced with nop
> +	  operations via the alternative framework if an affected CPU is
> +	  detected.
> +
>  config ARM64_WORKAROUND_CLEAN_CACHE
>  	bool
>  
> diff --git a/arch/arm64/include/asm/barrier.h b/arch/arm64/include/asm/barrier.h
> index 9495c4441a46..f72eddc7c434 100644
> --- a/arch/arm64/include/asm/barrier.h
> +++ b/arch/arm64/include/asm/barrier.h
> @@ -20,9 +20,22 @@
>  #define wfe()		asm volatile("wfe" : : : "memory")
>  #define wfet(val)	asm volatile("msr s0_3_c1_c0_0, %0"	\
>  				     : : "r" (val) : "memory")
> -#define wfi()		asm volatile("wfi" : : : "memory")
> -#define wfit(val)	asm volatile("msr s0_3_c1_c0_1, %0"	\
> -				     : : "r" (val) : "memory")
> +#define wfi()							\
> +	do {							\
> +		asm volatile(					\
> +		ALTERNATIVE("wfi",				\
> +			    "nop",				\
> +			    ARM64_WORKAROUND_WFI_STATE)		\
> +		: : : "memory");				\
> +	} while (0)
> +#define wfit(val)						\
> +	do {							\
> +		asm volatile(					\
> +		ALTERNATIVE("msr s0_3_c1_c0_1, %0",		\
> +			    "nop",				\
> +			    ARM64_WORKAROUND_WFI_STATE)		\
> +		: : "r" (val) : "memory");			\
> +	} while (0)

How can you guarantee that we don't run one of these prior to patching?

I wonder if we're better off doing something like x86 and having an "idle="
cmdline option. which could choose between e.g. nop, wfe, wfi and yield, for
example? In fact, would wfe be a better choice than nop for you?

Will

