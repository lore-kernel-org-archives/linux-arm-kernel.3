Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBDBDC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 17:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CkFzAv8qXPjFi2P7Q1pphCrdUbZ9ENBJVGPsYie55Mc=; b=lh3pOOV5Bq41NjsJYtjq5i9wjG
	iD4OPNP4GjRILEODzXt3+l20IN4QplF2zGOtFm1mqVC0g4OAm5l8kim8USL9brRH+xJHaSQC5Qwqh
	WXMu00XvQa7vPfPZU99SweolLj5YsEz2q02dHcXUZPx4DOJDICIe5ldHUzFggsIHhnN6m7z3mLZAH
	2dK230ONo/W0BhubD4HKbtXHoMxlgS77sOm5XZlXb3GFVq6ILzVfb0eDZBX2kdDkrdKNVOOOyFnDU
	SvkQGoE4kurKJvkwk/kRpaHLUGaZiH6wdARr0OaWj8DZrtjwcDAsCHbUrI0EFNIR4+Iv46PVvEIMr
	x7tq6p3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5pel-0000000HHCB-3brj;
	Fri, 18 Apr 2025 17:37:39 +0000
Received: from out-174.mta1.migadu.com ([95.215.58.174])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5pcp-0000000HGcU-01hW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 17:35:40 +0000
Date: Fri, 18 Apr 2025 10:35:19 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744997733;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CkFzAv8qXPjFi2P7Q1pphCrdUbZ9ENBJVGPsYie55Mc=;
	b=fX8qB+YiTns3AbrDG+XxBIzyHou/Afvrwd/MRbC/u9SZiPsHO/eTUPXGR/OWbkhYGYnYl3
	gKqlhUO9i/E1k7ZMc2vxlxmFqJ9jf/tz18I4boC3heecEt3NA9CllWoc09nDTKK+CL5lY1
	IFB4O3/rCwagQlAJVm35/DN+aPeXfSw=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v2] arm64: Rework checks for broken Cavium HW in the PI
 code
Message-ID: <aAKNV8lI7HxPJYW_@linux.dev>
References: <20250418093129.1755739-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250418093129.1755739-1-maz@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_103539_194216_79938E4D 
X-CRM114-Status: GOOD (  34.59  )
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>, kvmarm@lists.linux.dev, Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, Apr 18, 2025 at 10:31:29AM +0100, Marc Zyngier wrote:
> Calling into the MIDR checking framework from the PI code has recently
> become much harder, due to the new fancy "multi-MIDR" support that
> relies on tables being populated at boot time, but not that early that
> they are available to the PI code. There are additional issues with
> this framework, as the code really isn't position independend *at all*.
> 
> This leads to some ugly breakages, as reported by Ada.
> 
> It so appears that the only reason for the PI code to call into the
> MIDR checking code is to cope with The Most Broken ARM64 System Ever,
> aka Cavium ThunderX, which cannot deal with nG attributes that result
> of the combination of KASLR and KPTI as a consequence of Erratum 27456.
> 
> Duplicate the check for the erratum in the PI code, removing the
> dependency on the bulk of the MIDR checking framework. This allows
> dropping that same check from kaslr_requires_kpti(), as the KPTI code
> already relies on the ARM64_WORKAROUND_CAVIUM_27456 cap.
> 
> Fixes: c8c2647e69bed ("arm64: Make  _midr_in_range_list() an exported function")
> Reported-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> Link: https://lore.kernel.org/r/3d97e45a-23cf-419b-9b6f-140b4d88de7b@arm.com
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> Cc: Oliver Upton <oliver.upton@linux.dev>

I think the fastest path to Linus for this patch is through the arm64
tree. Catalin, in the interest of getting this fixed ASAP, could you
pick this up?

I'll gladly take it otherwise.

Reviewed-by: Oliver Upton <oliver.upton@linux.dev>

> ---
> 
> Notes:
>     * From v1 [1]:
>     
>       - Preserved KASLR functionnality by duplicating the MIDR checks
>         in the PI code. While this is a bit ugly, it keeps everything
>         working for another day, and removes a duplicate check in the
>         KPTI code.
>     
>       - Tested in a VM to check that KASLR was still up and running. Yay!
>     
>     [1] https://lore.kernel.org/r/20250416123534.1108220-1-maz@kernel.org
> 
>  arch/arm64/include/asm/mmu.h      | 11 -----------
>  arch/arm64/kernel/cpu_errata.c    |  2 +-
>  arch/arm64/kernel/image-vars.h    |  4 ----
>  arch/arm64/kernel/pi/map_kernel.c | 25 ++++++++++++++++++++++++-
>  4 files changed, 25 insertions(+), 17 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/mmu.h b/arch/arm64/include/asm/mmu.h
> index 30a29e88994ba..6e8aa8e726015 100644
> --- a/arch/arm64/include/asm/mmu.h
> +++ b/arch/arm64/include/asm/mmu.h
> @@ -94,17 +94,6 @@ static inline bool kaslr_requires_kpti(void)
>  			return false;
>  	}
>  
> -	/*
> -	 * Systems affected by Cavium erratum 24756 are incompatible
> -	 * with KPTI.
> -	 */
> -	if (IS_ENABLED(CONFIG_CAVIUM_ERRATUM_27456)) {
> -		extern const struct midr_range cavium_erratum_27456_cpus[];
> -
> -		if (is_midr_in_range_list(cavium_erratum_27456_cpus))
> -			return false;
> -	}
> -
>  	return true;
>  }
>  
> diff --git a/arch/arm64/kernel/cpu_errata.c b/arch/arm64/kernel/cpu_errata.c
> index b55f5f7057502..6b0ad5070d3e0 100644
> --- a/arch/arm64/kernel/cpu_errata.c
> +++ b/arch/arm64/kernel/cpu_errata.c
> @@ -335,7 +335,7 @@ static const struct midr_range cavium_erratum_23154_cpus[] = {
>  #endif
>  
>  #ifdef CONFIG_CAVIUM_ERRATUM_27456
> -const struct midr_range cavium_erratum_27456_cpus[] = {
> +static const struct midr_range cavium_erratum_27456_cpus[] = {
>  	/* Cavium ThunderX, T88 pass 1.x - 2.1 */
>  	MIDR_RANGE(MIDR_THUNDERX, 0, 0, 1, 1),
>  	/* Cavium ThunderX, T81 pass 1.0 */
> diff --git a/arch/arm64/kernel/image-vars.h b/arch/arm64/kernel/image-vars.h
> index 5e3c4b58f2790..2004b4f41ade6 100644
> --- a/arch/arm64/kernel/image-vars.h
> +++ b/arch/arm64/kernel/image-vars.h
> @@ -47,10 +47,6 @@ PROVIDE(__pi_id_aa64smfr0_override	= id_aa64smfr0_override);
>  PROVIDE(__pi_id_aa64zfr0_override	= id_aa64zfr0_override);
>  PROVIDE(__pi_arm64_sw_feature_override	= arm64_sw_feature_override);
>  PROVIDE(__pi_arm64_use_ng_mappings	= arm64_use_ng_mappings);
> -#ifdef CONFIG_CAVIUM_ERRATUM_27456
> -PROVIDE(__pi_cavium_erratum_27456_cpus	= cavium_erratum_27456_cpus);
> -PROVIDE(__pi_is_midr_in_range_list	= is_midr_in_range_list);
> -#endif
>  PROVIDE(__pi__ctype			= _ctype);
>  PROVIDE(__pi_memstart_offset_seed	= memstart_offset_seed);
>  
> diff --git a/arch/arm64/kernel/pi/map_kernel.c b/arch/arm64/kernel/pi/map_kernel.c
> index e57b043f324b5..c6650cfe706c3 100644
> --- a/arch/arm64/kernel/pi/map_kernel.c
> +++ b/arch/arm64/kernel/pi/map_kernel.c
> @@ -207,6 +207,29 @@ static void __init map_fdt(u64 fdt)
>  	dsb(ishst);
>  }
>  
> +/*
> + * PI version of the Cavium Eratum 27456 detection, which makes it
> + * impossible to use non-global mappings.
> + */
> +static bool __init ng_mappings_allowed(void)
> +{
> +	static const struct midr_range cavium_erratum_27456_cpus[] __initconst = {
> +		/* Cavium ThunderX, T88 pass 1.x - 2.1 */
> +		MIDR_RANGE(MIDR_THUNDERX, 0, 0, 1, 1),
> +		/* Cavium ThunderX, T81 pass 1.0 */
> +		MIDR_REV(MIDR_THUNDERX_81XX, 0, 0),
> +		{},
> +	};
> +
> +	for (const struct midr_range *r = cavium_erratum_27456_cpus; r->model; r++) {
> +		if (midr_is_cpu_model_range(read_cpuid_id(), r->model,
> +					    r->rv_min, r->rv_max))
> +			return false;
> +	}
> +
> +	return true;
> +}
> +
>  asmlinkage void __init early_map_kernel(u64 boot_status, void *fdt)
>  {
>  	static char const chosen_str[] __initconst = "/chosen";
> @@ -246,7 +269,7 @@ asmlinkage void __init early_map_kernel(u64 boot_status, void *fdt)
>  		u64 kaslr_seed = kaslr_early_init(fdt, chosen);
>  
>  		if (kaslr_seed && kaslr_requires_kpti())
> -			arm64_use_ng_mappings = true;
> +			arm64_use_ng_mappings = ng_mappings_allowed();
>  
>  		kaslr_offset |= kaslr_seed & ~(MIN_KIMG_ALIGN - 1);
>  	}
> -- 
> 2.39.2
> 

