Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AF4CC0219D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 12:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j/Ut+lTnzn8ZhQPWKdAQr2xtPaLqniWp6CbybqJhVgE=; b=1wpdxkS6yFBVzn5I7mHtqSGAAr
	a0qTnEw3rYl+b9AL7uz/Vo++4KVQ6znymkYe7yeG5PR2Gshw7mSKlY79BRSDhywiWHgwQhcrS2Eu3
	FXn5ml4KBvE7nI3nwxvhW1+W5eewaOZaDo+vfRTeoPju3CQ+1d8bevmZpLbCCHFklgpg+rVqc/gzn
	tBQ1JSGBzYmcqicPFoNijxXYtxGT17CIS9SGceRzZeSLDKPbe9ghwoftn2zagF425n1I/lgzQbPhv
	TTjD2EO8nRO4f27vObSyLST1bBZcieOi0dascSP0V8SXZYdItvIdEsBgnc/HdPhmuXRjDjplOeNKy
	PXXv7q9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thpgb-00000003pXw-0dPV;
	Tue, 11 Feb 2025 12:48:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thorP-00000003f2N-1j4S
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 11:55:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DA14D1424;
	Tue, 11 Feb 2025 03:55:47 -0800 (PST)
Received: from [10.57.81.93] (unknown [10.57.81.93])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 333E43F6A8;
	Tue, 11 Feb 2025 03:55:25 -0800 (PST)
Message-ID: <eef5fba9-da21-4131-a8a3-ae9a735869b1@arm.com>
Date: Tue, 11 Feb 2025 11:55:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v2 PATCH 1/2] arm64: cpufeature: detect FEAT_BBM level 2
Content-Language: en-GB
To: Yang Shi <yang@os.amperecomputing.com>, catalin.marinas@arm.com,
 will@kernel.org
Cc: cl@gentwo.org, scott@os.amperecomputing.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250103011822.1257189-1-yang@os.amperecomputing.com>
 <20250103011822.1257189-2-yang@os.amperecomputing.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20250103011822.1257189-2-yang@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_035527_550298_9ABC992B 
X-CRM114-Status: GOOD (  22.58  )
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

On 03/01/2025 01:17, Yang Shi wrote:
> FEAT_BBM level 2 allow changing block size of a translation with relaxed
> TLB flushing.  But it may incur TLB conflict abort.  We can handle the
> abort in kernel, however it is hard to guarantee the recuesive TLB

nit: recuesive -> recursive ?

> conflct will never happen in the handling itself.
> 
> Some implementations can handle TLB conflict gracefully without fault
> handler in kernel so FEAT_BBM level 2 can be enabled on those
> implementations safely.
> 
> Look up MIDR to filter out those CPUs.  AmpereOne is one of them.
> 
> Suggested-by: Will Deacon <will@kernel.org>
> Signed-off-by: Yang Shi <yang@os.amperecomputing.com>
> ---
>  arch/arm64/include/asm/cpufeature.h | 19 +++++++++++++++++++
>  arch/arm64/kernel/cpufeature.c      | 11 +++++++++++
>  arch/arm64/tools/cpucaps            |  1 +
>  3 files changed, 31 insertions(+)
> 
> diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
> index 8b4e5a3cd24c..33ca9db42741 100644
> --- a/arch/arm64/include/asm/cpufeature.h
> +++ b/arch/arm64/include/asm/cpufeature.h
> @@ -866,6 +866,25 @@ static __always_inline bool system_supports_mpam_hcr(void)
>  	return alternative_has_cap_unlikely(ARM64_MPAM_HCR);
>  }
>  
> +static inline bool system_supports_bbmlv2(void)

nit: Arm language internally is starting to refer to FEAT_BBML1 / FEAT_BBML2 and
I believe this will soon make it's way to the Arm ARM. So probably better to
refer to bbml2 rather than bbmlv2 throughout.

> +{
> +	return cpus_have_final_boot_cap(ARM64_HAS_BBMLV2);
> +}
> +
> +static inline bool bbmlv2_available(void)

This function has no need to be in the header. system_supports_bbmlv2() is what
users should use. Suggest moving to has_bbmlv2() in cpufeature.c.

> +{
> +	static const struct midr_range support_bbmlv2[] = {
> +		MIDR_ALL_VERSIONS(MIDR_AMPERE1),
> +		MIDR_ALL_VERSIONS(MIDR_AMPERE1A),
> +		{}
> +	};
> +
> +	if (is_midr_in_range_list(read_cpuid_id(), support_bbmlv2))
> +		return true;
> +
> +	return false;
> +}
> +
>  int do_emulate_mrs(struct pt_regs *regs, u32 sys_reg, u32 rt);
>  bool try_emulate_mrs(struct pt_regs *regs, u32 isn);
>  
> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> index 6ce71f444ed8..a60d5fa04828 100644
> --- a/arch/arm64/kernel/cpufeature.c
> +++ b/arch/arm64/kernel/cpufeature.c
> @@ -1889,6 +1889,11 @@ static bool has_lpa2(const struct arm64_cpu_capabilities *entry, int scope)
>  }
>  #endif
>  
> +static bool has_bbmlv2(const struct arm64_cpu_capabilities *entry, int scope)
> +{
> +	return bbmlv2_available();
> +}
> +
>  #ifdef CONFIG_UNMAP_KERNEL_AT_EL0
>  #define KPTI_NG_TEMP_VA		(-(1UL << PMD_SHIFT))
>  
> @@ -2990,6 +2995,12 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
>  		ARM64_CPUID_FIELDS(ID_AA64PFR1_EL1, GCS, IMP)
>  	},
>  #endif
> +	{
> +		.desc = "BBM Level 2",
> +		.capability = ARM64_HAS_BBMLV2,
> +		.type = ARM64_CPUCAP_BOOT_CPU_FEATURE,

I'm wondering if this will potentially lead to problems for assymetric
collections of CPUs (e.g. big.LITTLE)? I can imagine that little CPUs might not
support BBML2. In this case if you boot on a big CPU that does have BBML2, you
will require the feature and refuse to online the secondary little CPUs.

Perhaps this really needs to be a system feature, where it is only enabled if
all CPUs in the system support it? I'm guessing that will make painting the
linear map harder; I guess you will need to initially set it up with PTE
mappings, then repaint as block mappings if BBML2 is determined to be supported
if that's not already what you are doing.

Thanks,
Ryan

> +		.matches = has_bbmlv2,
> +	},
>  	{},
>  };
>  
> diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
> index eb17f59e543c..287bdede53f5 100644
> --- a/arch/arm64/tools/cpucaps
> +++ b/arch/arm64/tools/cpucaps
> @@ -14,6 +14,7 @@ HAS_ADDRESS_AUTH_ARCH_QARMA5
>  HAS_ADDRESS_AUTH_IMP_DEF
>  HAS_AMU_EXTN
>  HAS_ARMv8_4_TTL
> +HAS_BBMLV2
>  HAS_CACHE_DIC
>  HAS_CACHE_IDC
>  HAS_CNP


