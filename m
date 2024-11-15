Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2736BD6DDD5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 06:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FRmXGxdhRU2pRSncn9HF2TgDffUEuLOi1RgGOkT07i8=; b=HrSZLD2FSvptT/7ow/NFJWXwsy
	8ZEJwULoZ0EEugURo8ZICqfrLL/fnKF0iROQbdnTmpG7+IBKkDCC2uDb9rl+bsueK9lUXb/yfB28x
	BaLKLK3g3+f0MOyUWqq+UV326IFXTtfO4NZpTWNfNdsxeqq+hoDsJe/L//eRs5sBY6p1dGdoxnPGR
	OymbHqH4/7w6HXlOk+MKr7dLCukcKRwJDrEqeZIFDczcuU7175WkbbHLanXYp/a0dQRJ9bt7MHnQN
	w+Rva8vLx2qVlpBDNKaHm9k41hnHtPNEBCBqLx9T7WuqKCG6rnsa/b4K4HAds4UBZU2t4gDkov/Rv
	TrDL61+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBpT5-00000001jzz-3kO1;
	Fri, 15 Nov 2024 06:06:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBpS9-00000001jrn-3dPa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Nov 2024 06:05:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 903091476;
	Thu, 14 Nov 2024 22:05:38 -0800 (PST)
Received: from [10.163.45.151] (unknown [10.163.45.151])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7555C3F66E;
	Thu, 14 Nov 2024 22:05:04 -0800 (PST)
Message-ID: <ea124997-8dee-457c-bef1-d5d829c84da3@arm.com>
Date: Fri, 15 Nov 2024 11:35:00 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] arm64/mm: Override PARange for !LPA2 and use it
 consistently
To: Ard Biesheuvel <ardb+git@google.com>, linux-arm-kernel@lists.infradead.org
Cc: Ard Biesheuvel <ardb@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Kees Cook <keescook@chromium.org>,
 stable@vger.kernel.org
References: <20241111083544.1845845-8-ardb+git@google.com>
 <20241111083544.1845845-10-ardb+git@google.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20241111083544.1845845-10-ardb+git@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_220510_008371_24DA0E07 
X-CRM114-Status: GOOD (  25.41  )
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

On 11/11/24 14:05, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> When FEAT_LPA{,2} are not implemented, the ID_AA64MMFR0_EL1.PARange and
> TCR.IPS values corresponding with 52-bit physical addressing are
> reserved.
> 
> Setting the TCR.IPS field to 0b110 (52-bit physical addressing) has side
> effects, such as how the TTBRn_ELx.BADDR fields are interpreted, and so
> it is important that disabling FEAT_LPA2 (by overriding the
> ID_AA64MMFR0.TGran fields) also presents a PARange field consistent with
> that.
> 
> So limit the field to 48 bits unless LPA2 is enabled, and update
> existing references to use the override consistently.
> 
> Fixes: 352b0395b505 ("arm64: Enable 52-bit virtual addressing for 4k and 16k granule configs")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  arch/arm64/include/asm/assembler.h    | 5 +++++
>  arch/arm64/kernel/cpufeature.c        | 2 +-
>  arch/arm64/kernel/pi/idreg-override.c | 9 +++++++++
>  arch/arm64/kernel/pi/map_kernel.c     | 6 ++++++
>  arch/arm64/mm/init.c                  | 2 +-
>  5 files changed, 22 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/assembler.h b/arch/arm64/include/asm/assembler.h
> index 3d8d534a7a77..ad63457a05c5 100644
> --- a/arch/arm64/include/asm/assembler.h
> +++ b/arch/arm64/include/asm/assembler.h
> @@ -343,6 +343,11 @@ alternative_cb_end
>  	// Narrow PARange to fit the PS field in TCR_ELx
>  	ubfx	\tmp0, \tmp0, #ID_AA64MMFR0_EL1_PARANGE_SHIFT, #3
>  	mov	\tmp1, #ID_AA64MMFR0_EL1_PARANGE_MAX
> +#ifdef CONFIG_ARM64_LPA2
> +alternative_if_not ARM64_HAS_VA52
> +	mov	\tmp1, #ID_AA64MMFR0_EL1_PARANGE_48
> +alternative_else_nop_endif
> +#endif

I guess this will only take effect after cpu features have been finalized
but will not be applicable for __cpu_setup() during primary and secondary
cpu bring up during boot.

>  	cmp	\tmp0, \tmp1
>  	csel	\tmp0, \tmp1, \tmp0, hi
>  	bfi	\tcr, \tmp0, \pos, #3
> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> index 37e4c02e0272..6f5137040ff6 100644
> --- a/arch/arm64/kernel/cpufeature.c
> +++ b/arch/arm64/kernel/cpufeature.c
> @@ -3399,7 +3399,7 @@ static void verify_hyp_capabilities(void)
>  		return;
>  
>  	safe_mmfr1 = read_sanitised_ftr_reg(SYS_ID_AA64MMFR1_EL1);
> -	mmfr0 = read_cpuid(ID_AA64MMFR0_EL1);
> +	mmfr0 = read_sanitised_ftr_reg(SYS_ID_AA64MMFR0_EL1);

Small nit, should be renamed as safe_mmfr0 to be consistent with safe_mmfr1 ?

>  	mmfr1 = read_cpuid(ID_AA64MMFR1_EL1);
>  
>  	/* Verify VMID bits */
> diff --git a/arch/arm64/kernel/pi/idreg-override.c b/arch/arm64/kernel/pi/idreg-override.c
> index 22159251eb3a..c6b185b885f7 100644
> --- a/arch/arm64/kernel/pi/idreg-override.c
> +++ b/arch/arm64/kernel/pi/idreg-override.c
> @@ -83,6 +83,15 @@ static bool __init mmfr2_varange_filter(u64 val)
>  		id_aa64mmfr0_override.val |=
>  			(ID_AA64MMFR0_EL1_TGRAN_LPA2 - 1) << ID_AA64MMFR0_EL1_TGRAN_SHIFT;
>  		id_aa64mmfr0_override.mask |= 0xfU << ID_AA64MMFR0_EL1_TGRAN_SHIFT;
> +
> +		/*
> +		 * Override PARange to 48 bits - the override will just be
> +		 * ignored if the actual PARange is smaller, but this is
> +		 * unlikely to be the case for LPA2 capable silicon.
> +		 */
> +		id_aa64mmfr0_override.val |=
> +			ID_AA64MMFR0_EL1_PARANGE_48 << ID_AA64MMFR0_EL1_PARANGE_SHIFT;
> +		id_aa64mmfr0_override.mask |= 0xfU << ID_AA64MMFR0_EL1_PARANGE_SHIFT;
Could these be used instead ? 

SYS_FIELD_PREP_ENUM(ID_AA64MMFR0_EL1, PARANGE, 48)
ID_AA64MMFR0_EL1_PARANGE_MASK ?


>  	}
>  #endif
>  	return true;
> diff --git a/arch/arm64/kernel/pi/map_kernel.c b/arch/arm64/kernel/pi/map_kernel.c
> index f374a3e5a5fe..e57b043f324b 100644
> --- a/arch/arm64/kernel/pi/map_kernel.c
> +++ b/arch/arm64/kernel/pi/map_kernel.c
> @@ -136,6 +136,12 @@ static void noinline __section(".idmap.text") set_ttbr0_for_lpa2(u64 ttbr)
>  {
>  	u64 sctlr = read_sysreg(sctlr_el1);
>  	u64 tcr = read_sysreg(tcr_el1) | TCR_DS;
> +	u64 mmfr0 = read_sysreg(id_aa64mmfr0_el1);
> +	u64 parange = cpuid_feature_extract_unsigned_field(mmfr0,
> +							   ID_AA64MMFR0_EL1_PARANGE_SHIFT);
> +
> +	tcr &= ~TCR_IPS_MASK;

Could there be a different IPS value in TCR ? OR is this just a normal
clean up instead.

> +	tcr |= parange << TCR_IPS_SHIFT;

Wondering if FIELD_PREP() could be used here.

>  
>  	asm("	msr	sctlr_el1, %0		;"
>  	    "	isb				;"
> diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
> index d21f67d67cf5..4db9887b2aef 100644
> --- a/arch/arm64/mm/init.c
> +++ b/arch/arm64/mm/init.c
> @@ -280,7 +280,7 @@ void __init arm64_memblock_init(void)
>  
>  	if (IS_ENABLED(CONFIG_RANDOMIZE_BASE)) {
>  		extern u16 memstart_offset_seed;
> -		u64 mmfr0 = read_cpuid(ID_AA64MMFR0_EL1);
> +		u64 mmfr0 = read_sanitised_ftr_reg(SYS_ID_AA64MMFR0_EL1);

Could this have a comment explaining the need for sanitized value ?

>  		int parange = cpuid_feature_extract_unsigned_field(
>  					mmfr0, ID_AA64MMFR0_EL1_PARANGE_SHIFT);
>  		s64 range = linear_region_size -

Otherwise LGTM.

