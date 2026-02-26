Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62D1AFCE08C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 14:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wmxDJL7qK9NueU1uB+zhPhctO+wgXUQrbU9tvkKi3t8=; b=zBHkkDl61xwnEXx7MEt6jefYBL
	giYMg9tC0HX1UpvrNxr0zOsLdEPFhdi5/bv8BHRJ8sxJ9+swABRpT2cQSoToscR3zqHcoEz2LRlrt
	Z+3l3nX7BCUSkMpYnOO1ES4BmhjeK5T+XqeoXo9r+hEu3mgL+Zj8U4VSgSow6J9PjkejiAfTR/Gbj
	nTkgfhwUOrT6pWJnRmxBYspJ0EEuOPVFbCSeWh3UgQjMq42n4eyqmWOXXk1oGdakawr2t01tM5n3l
	LFKX5IpgS4fe0lLySXRhmTpLiSI/B6t/i0iuIAQ3RPahfUfu+TpW0Rony6fyasaHMt3e+tNZt9men
	qHRAZOYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvc4d-00000006Hzo-0p07;
	Thu, 26 Feb 2026 14:10:39 +0000
Received: from out-188.mta1.migadu.com ([95.215.58.188])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvc4a-00000006HzF-3OyT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 14:10:38 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1772115031;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wmxDJL7qK9NueU1uB+zhPhctO+wgXUQrbU9tvkKi3t8=;
	b=R0xJNFhztYNzYvCaGxImWv7FJWbrKhaXA3gG/3dDXiofF/l2Aqsq753GVna3Ij69ih27v9
	KE2b1zOTW6pKbkk69d8j7WcUH9wvTKOfhGVsgGVRtZPaWLAxmwsWDKBLKVdiLGFtZRbtIj
	zwbQ1IFq+zo3rNI4cHabyooNLpcvT2Q=
From: Usama Arif <usama.arif@linux.dev>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Usama Arif <usama.arif@linux.dev>,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Linu Cherian <linu.cherian@arm.com>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [RFC V1 16/16] arm64/mm: Add initial support for FEAT_D128 page tables
Date: Thu, 26 Feb 2026 06:10:23 -0800
Message-ID: <20260226141024.1869713-1-usama.arif@linux.dev>
In-Reply-To: <20260224051153.3150613-17-anshuman.khandual@arm.com>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_061037_195457_7BF9A28A 
X-CRM114-Status: GOOD (  27.99  )
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

On Tue, 24 Feb 2026 10:41:53 +0530 Anshuman Khandual <anshuman.khandual@arm.com> wrote:

> Add build time support for FEAT_D128 page tables with a new Kconfig option
> i.e CONFIG_ARM64_D128. When selected, PTE types become 128 bits wide and
> PTE bits are mapped to their new locations. Besides the basic page table
> geometry is also updated since each table page now holds half the number
> of entries (aka PTRS_PER_PXX) as it did previously.
> 
> Since FEAT_D128 exclusively supports the permission indirection style for
> page table entry permission management, given kernel compiled for FEAT_D128
> requires both FEAT_S1PIE and FEAT_D128. If these architecture features are
> not present at boot, the kernel panics just like it does when there is a
> granule size mismatch.
> 
> TTBR0/1_EL1 and PAR_EL1 registers become 128 bit wide when D128 is enabled,
> thus requiring MSRR/MRRS instructions for their updates. Because PA_BITS is
> still capped at 52 bits, MRS/MSR instructions are currently sufficient for
> the register accesses that basically operate on the lower 64 bits. Although
> entire 128 bits for these registers get cleared during boot via MSRR.
> 
> Add support for TLBIP instruction for TLB flush macros with level hint and
> address range operations. Although existing TLBI based TLB flush would have
> been sufficient given PA_BITS is still capped at 52, but then it would have
> lacked both level hint and range support.
> 
> This enables support for all granule size, VA_BITS and PA_BITS combination.
> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
>  arch/arm64/Kconfig                     |  39 ++++++-
>  arch/arm64/Makefile                    |   4 +
>  arch/arm64/include/asm/assembler.h     |   4 +-
>  arch/arm64/include/asm/el2_setup.h     |   9 ++
>  arch/arm64/include/asm/pgtable-hwdef.h | 137 +++++++++++++++++++++++++
>  arch/arm64/include/asm/pgtable-prot.h  |  18 +++-
>  arch/arm64/include/asm/pgtable-types.h |   9 ++
>  arch/arm64/include/asm/pgtable.h       |  56 +++++++++-
>  arch/arm64/include/asm/smp.h           |   1 +
>  arch/arm64/include/asm/tlbflush.h      |  65 ++++++++++++
>  arch/arm64/kernel/head.S               |  12 +++
>  arch/arm64/mm/proc.S                   |  25 ++++-
>  12 files changed, 372 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 38dba5f7e4d2..aaf910295c39 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -309,6 +309,10 @@ config GCC_SUPPORTS_DYNAMIC_FTRACE_WITH_ARGS
>  	def_bool CC_IS_GCC
>  	depends on $(cc-option,-fpatchable-function-entry=2)
>  
> +config CC_SUPPORTS_LSE128
> +	def_bool CC_IS_GCC
> +	depends on $(cc-option, -march=armv8.1-a+lse128)
> +
>  config 64BIT
>  	def_bool y
>  
> @@ -395,6 +399,16 @@ config FIX_EARLYCON_MEM
>  
>  config PGTABLE_LEVELS
>  	int
> +	default 4 if ARM64_D128 && ARM64_4K_PAGES && ARM64_VA_BITS_39
> +	default 5 if ARM64_D128 && ARM64_4K_PAGES && ARM64_VA_BITS_48
> +	default 5 if ARM64_D128 && ARM64_4K_PAGES && ARM64_VA_BITS_52
> +	default 3 if ARM64_D128 && ARM64_16K_PAGES && ARM64_VA_BITS_36
> +	default 4 if ARM64_D128 && ARM64_16K_PAGES && ARM64_VA_BITS_47
> +	default 4 if ARM64_D128 && ARM64_16K_PAGES && ARM64_VA_BITS_48
> +	default 4 if ARM64_D128 && ARM64_16K_PAGES && ARM64_VA_BITS_52
> +	default 3 if ARM64_D128 && ARM64_64K_PAGES && ARM64_VA_BITS_42
> +	default 3 if ARM64_D128 && ARM64_64K_PAGES && ARM64_VA_BITS_48
> +	default 3 if ARM64_D128 && ARM64_64K_PAGES && ARM64_VA_BITS_52
>  	default 2 if ARM64_16K_PAGES && ARM64_VA_BITS_36
>  	default 2 if ARM64_64K_PAGES && ARM64_VA_BITS_42
>  	default 3 if ARM64_64K_PAGES && (ARM64_VA_BITS_48 || ARM64_VA_BITS_52)
> @@ -1504,7 +1518,7 @@ config ARM64_PA_BITS
>  
>  config ARM64_LPA2
>  	def_bool y
> -	depends on ARM64_PA_BITS_52 && !ARM64_64K_PAGES
> +	depends on ARM64_PA_BITS_52 && !ARM64_64K_PAGES && !ARM64_D128
>  
>  choice
>  	prompt "Endianness"
> @@ -2195,6 +2209,29 @@ config ARM64_HAFT
>  
>  endmenu # "ARMv8.9 architectural features"
>  
> +menu "ARMv9.3 architectural features"
> +
> +config AS_HAS_ARMV9_3
> +	def_bool $(cc-option,-Wa$(comma)-march=armv9.3-a)
> +
> +config ARM64_D128
> +	bool "Enable support for 128 bit page table (FEAT_D128)"
> +	depends on ARCH_SUPPORTS_INT128
> +	depends on CC_SUPPORTS_LSE128
> +	depends on AS_HAS_ARMV9_3
> +	depends on EXPERT
> +	depends on !VIRTUALIZATION
> +	depends on !KASAN
> +	depends on !UNMAP_KERNEL_AT_EL0
> +	default n
> +	help
> +	  ARMv9.3 introduces FEAT_D128, which provides a 128 bit page
> +	  table format, along with related instructions.
> +
> +	  If unsure, say Y.
> +

Should this say, If unsure, say N?

> +endmenu # "ARMv9.3 architectural features"
> +

[...]

> diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
> index 9c93ffbcc1e0..a221a1a9b87e 100644
> --- a/arch/arm64/include/asm/tlbflush.h
> +++ b/arch/arm64/include/asm/tlbflush.h
> @@ -49,6 +49,19 @@
>  
>  #define __tlbi(op, ...)		__TLBI_N(op, ##__VA_ARGS__, 1, 0)
>  
> +#ifdef CONFIG_ARM64_D128
> +#define __tlbip(op, arg1, arg2) do {	\
> +	u128 value = 0;			\
> +	value |= (u128)arg2 << 64;	\
> +	value |= (u128)arg1;		\
> +					\
> +	asm (ARM64_ASM_PREAMBLE		\
> +	".arch_extension d128\n\t"	\
> +	"tlbip " #op ", %0, %H0\n"	\
> +	: : "r" (value));		\
> +} while (0)
> +#endif
> +
>  #define __tlbi_user(op, arg) do {						\
>  	if (arm64_kernel_unmapped_at_el0())					\
>  		__tlbi(op, (arg) | USER_ASID_FLAG);				\
> @@ -128,6 +141,46 @@ static inline unsigned long get_trans_granule(void)
>  		__tlbi_level(op, (arg | USER_ASID_FLAG), level);	\
>  } while (0)
>  
> +#ifdef CONFIG_ARM64_D128
> +/*
> + *
> + * TLBIP Encoding
> + *
> + * +------------+-----------------+-------+-------+------------------+
> + * |     RES0   |     BADDR       |  ASID |  TTL  |      RES0        |
> + * +------------------------------+-------+-------+------------------+
> + * |127      108|107            64|63   48|47   44|43               0|
> + */
> +
> +#define __tlbip_user(op, arg, addr) do {					\
> +	if (arm64_kernel_unmapped_at_el0())					\
> +		__tlbip(op, (arg) | USER_ASID_FLAG, addr);			\
> +} while (0)
> +/*
> + * FEAT_TTL being mandatory from armv8.4 and FEAT_D128 is available
> + * only from armv9.4, we dont need the capability check for TTL.
> + */
> +#define __TLBIP_ARGS(asid, level)						\
> +	({									\
> +		u64 arg = 0;							\
> +										\
> +		arg |= FIELD_PREP(TLBI_ASID_MASK, (asid));			\
> +		if ((level) >= 0 && (level) <= 3) {				\
> +			arg |= FIELD_PREP(TLBI_TG_MASK, get_trans_granule());	\
> +			arg |= FIELD_PREP(TLBI_LVL_MASK, (level));		\
> +		}								\
> +		arg;								\
> +	})									\
> +
> +#define __tlb_asid_level(op, addr, asid, level, tlb_user) do {		\
> +	u64 arg1 = __TLBIP_ARGS(asid, level);				\
> +	u64 arg2 = (addr) >> 12;					\

Does 12 over here represent PAGE_SHIFT? If so, would it break 16K and 64K PAGE_SIZE?

> +									\
> +	__tlbip(op, arg1, arg2);					\
> +	if (tlb_user)							\
> +		__tlbip_user(op, arg1, arg2);				\
> +} while (0)
> +#else
>  #define __tlb_asid_level(op, addr, asid, level, tlb_user) do {		\
>  	u64 arg1;							\
>  									\









































































































