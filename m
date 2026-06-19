Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 084B8CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 12:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bIeF4o+oA+QhvxgydThWOk8fYvHRjOwSBeoChr1ofj0=; b=2O9vdTnhZvUWYo35ZtR7t6P826
	3s9E7btku0Uz+bBESmYciVCX96mdTXQA5Qs5SaU9X3xdCH/fF/tFHsFSpB3RvlaqiI0OtA/q5KWri
	RDSHJBViaH9QhiXiVNbAbrC99sl9f7LlyMhgKRz6B6t9VmgUBfMRtA2B3wZySC02wIp9poZr2ggum
	gOTDOnY44UVU7h+xdAIMnVXtYrM1yFy20CfHByCy2XnkEtG1hO3FDOgtPZfp2TD7grN0q/LaAO54d
	x/7iBWdgKmsWdRf4qCs2iOw2slN0LBeTC3hNZ4mObi3f5FP6CGpIN1uUoIMvxOiSl7ElpNKayawmE
	DMU74U4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waY2S-00000002N9c-19LM;
	Fri, 19 Jun 2026 12:09:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waY2P-00000002N9H-0TW2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 12:09:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 769B43541;
	Fri, 19 Jun 2026 05:09:26 -0700 (PDT)
Received: from [10.57.95.87] (unknown [10.57.95.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F0D863F62B;
	Fri, 19 Jun 2026 05:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781870971; bh=CbvyzZMEqP1i/XApNRquWzgwjAyHus7dVHSaqyWp4bk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ag2I8MaZkwum7i4EHVhEwH48PbsBZo253L7NHnIqhmZ4lxMHgo2ziLEGuxVL/0kGE
	 uomZ83C+vrC+QPKfU5VHK+3ps78o0ZD7f/3qoAsQM7XmsK+536oAp48IKm1KqprHw3
	 U8pLutdMMFihL80+1nxiriPkxyS9IsyP+OQCeKJo=
Message-ID: <ff82a5b0-fe52-4b33-852c-10f3923999d5@arm.com>
Date: Fri, 19 Jun 2026 13:09:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 5/6] arm64: execmem: enable EXECMEM_ROX_CACHE on
 supported CPUs
Content-Language: en-GB
To: =?UTF-8?Q?Adrian_Barna=C5=9B?= <abarnas@google.com>,
 linux-arm-kernel@lists.infradead.org
Cc: linux-mm@kvack.org, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, David Hildenbrand <david@kernel.org>,
 "Mike Rapoport (Microsoft)" <rppt@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, Christoph Lameter <cl@gentwo.org>,
 Yang Shi <yang@os.amperecomputing.com>, Brendan Jackman <jackmanb@google.com>
References: <20260611130144.1385343-1-abarnas@google.com>
 <20260611130144.1385343-6-abarnas@google.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20260611130144.1385343-6-abarnas@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_050933_352687_840B26D6 
X-CRM114-Status: GOOD (  21.27  )
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

On 11/06/2026 14:01, Adrian Barnaś wrote:
> Enable EXECMEM_ROX_CACHE support for ARM64 systems that implement
> the bbml2_no_abort CPU feature.
> 
> Using the ROX cache brings a performance boost by reducing linear region
> fragmentation caused by strict memory permissions (e.g., W^X enforcement).
> Grouping executable code (which is read-only in the linear region alias)
> into PMD-sized block mappings reduces TLB pressure and page table size.

Do you have any data on fragmentation reduction and/or performance improvement
in practice due to this change?

> 
> This is only enabled on systems with bbml2_no_abort, as splitting
> these large blocks to make pages writable during module loading would
> otherwise risk triggering TLB Conflict Aborts.
> > Signed-off-by: Adrian Barnaś <abarnas@google.com>
> ---
>  arch/arm64/Kconfig   |  1 +
>  arch/arm64/mm/init.c | 22 +++++++++++++++++++++-
>  2 files changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 38dba5f7e4d2..79c347ab841e 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -285,6 +285,7 @@ config ARM64
>  	select USER_STACKTRACE_SUPPORT
>  	select VDSO_GETRANDOM
>  	select VMAP_STACK
> +	select ARCH_HAS_EXECMEM_ROX

nit: This list is sorted in alphabetical order; please maintain that ordering.

>  	help
>  	  ARM 64-bit (AArch64) Linux support.
>  
> diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
> index 71aa745e0bef..8269d7747b84 100644
> --- a/arch/arm64/mm/init.c
> +++ b/arch/arm64/mm/init.c
> @@ -420,6 +420,12 @@ void execmem_fill_trapping_insns(void *ptr, size_t size)
>  
>  	flush_icache_range((unsigned long)ptr, (unsigned long)ptr + size);
>  }
> +
> +#define MODULE_TEXT_FLAG	EXECMEM_ROX_CACHE
> +#define MODULE_TEXT_PGPROT	PAGE_KERNEL_ROX
> +#else
> +#define MODULE_TEXT_FLAG	(0)
> +#define MODULE_TEXT_PGPROT	PAGE_KERNEL
>  #endif
>  
>  static u64 module_direct_base __ro_after_init = 0;
> @@ -511,6 +517,8 @@ struct execmem_info __init *execmem_arch_setup(void)
>  {
>  	unsigned long fallback_start = 0, fallback_end = 0;
>  	unsigned long start = 0, end = 0;
> +	enum execmem_range_flags module_text_flags = 0;
> +	pgprot_t module_text_pgprot = PAGE_KERNEL;
>  
>  	module_init_limits();
>  
> @@ -531,12 +539,24 @@ struct execmem_info __init *execmem_arch_setup(void)
>  		end = module_plt_base + SZ_2G;
>  	}
>  
> +	/*
> +	 * The ROX Cache requires bbml2_no_abort because it uses large block
> +	 * mappings. On systems without this guarantee, splitting these blocks
> +	 * to make pages writable for module loading can trigger TLB Conflict
> +	 * Aborts.
> +	 */
> +	if (system_supports_bbml2_noabort()) {
> +		module_text_flags = MODULE_TEXT_FLAG;
> +		module_text_pgprot = MODULE_TEXT_PGPROT;
> +	}

Perhaps this is a bit clearer? Then you don't need the MODULE_TEXT_* macros:

	if (IS_ENABLED(CONFIG_ARCH_HAS_EXECMEM_ROX) &&
	    system_supports_bbml2_noabort()) {
		module_text_flags = EXECMEM_ROX_CACHE;
		module_text_pgprot = PAGE_KERNEL_ROX;
	}

Thanks,
Ryan

> +
>  	execmem_info = (struct execmem_info){
>  		.ranges = {
>  			[EXECMEM_MODULE_TEXT] = {
>  				.start	= start,
>  				.end	= end,
> -				.pgprot	= PAGE_KERNEL,
> +				.flags = module_text_flags,
> +				.pgprot	= module_text_pgprot,
>  				.alignment = 1,
>  				.fallback_start	= fallback_start,
>  				.fallback_end	= fallback_end,


