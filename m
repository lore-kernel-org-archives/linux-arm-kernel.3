Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B02DC44507
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 00:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6IIUCf55mTkgyLIeRHq0yym5Ev9T6C+8eu0Y25cjw/s=; b=D1zfJzRrFh8oLIbn1y3f81jr84
	tF464vv3xG3uMKG8Ohj9umZ++4Zf6WhtxoVHkBzh3rEXJUyT8sR/yOc2uXJe0p/l7XVsw7B9cuUYF
	hgVLJrGnTa9UJb6vhBFzw4KER5Tm06YDWBDyiLIWs0lhxOZk7v8mKKaK6nFFUekO05o4u0Fy4YFkg
	djLMRpfMgItIO0NU+7JtAGWlRw986G6ITHHwJTxlJVqGyhHgJccAyJHI3dCLpTWOIjrVwkOeEvoqS
	9j00axLAvzUTi+idYY6gKVTyt95FR9O27FwqWQ2R6R1QDKMpslbh6eHkp9E0zXD/BJEvWorypv7hh
	o6g+LAgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk9Rb-0000000G64g-15v0;
	Wed, 15 Jul 2026 23:55:15 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk9RW-0000000G646-3KGq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 23:55:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784159708;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6IIUCf55mTkgyLIeRHq0yym5Ev9T6C+8eu0Y25cjw/s=;
	b=I09R3EShL0Ff3HCZpC/tl0GdvWQoCCRLc6y4fFUMl+Kix5VNlgQh4FJXZJJASBh/VrqNSy
	x5ZexIMvEddtWzomPlRkjkhzppxfIKOIqjny7B5jgl1qAaC1q3trIDsFZfTtbl1A3smU8I
	sUlStcZpSW6uzd/j66xTf9JFMw8D8cc=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-144--CYeL2j9M8q3lOVAJFe9Dg-1; Wed, 15 Jul 2026 19:55:07 -0400
X-MC-Unique: -CYeL2j9M8q3lOVAJFe9Dg-1
X-Mimecast-MFC-AGG-ID: -CYeL2j9M8q3lOVAJFe9Dg_1784159706
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c7f385887bso144474895ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 16:55:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784159706; x=1784764506;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6IIUCf55mTkgyLIeRHq0yym5Ev9T6C+8eu0Y25cjw/s=;
        b=UUDSlFD1z8uRnlZfOXM3Dkoq0rbAjW4iF7NolPCrAUQQrNCfdofG4p53lqf2x4cS/G
         /67u2r3rKxCSQ1xPJfTs/amQFcWOG43S1C/d9JWOiw74znCQV6PSZjN0m2ES8k5Byr3Z
         +AgfDgZTvLNAMvbw8gqikawrRMgSInzmNnLVDu4R1LXx3axX7zNpcZN0ShUBRdErKHkw
         UEnPu4/tAAeAlDt/Gp6IGdbkKfmMrkav0VaeUMQK+IBklY4roQrCNUGxlJUnz+5uaMAt
         fLMUCQSK64XPHBo/sJcRrVWd60t3prNyCcex910IB3mhm/CTEARz5ReGyKkTGV9753Mi
         FOdw==
X-Gm-Message-State: AOJu0YzthsZP8Gz9gZw6SG38tL5U7hnF0kQJ7SMZZEbxU23vSAlYJBgU
	6lYJOWzneVhd9LdzCZLXN22u0NYaMLQk30vSIjyS1ElYkZJOYTdi+X+PCs1QdSHs7aDjKf1yDTt
	yLO0EuN5yuwp0WOtS/EvBrpxVGkPdlL0GoYz0rrgRJk7wTcS3uPOohvAJ/azwT6+iOrlRvTAp1A
	LS
X-Gm-Gg: AfdE7clTM2BQg3qbnRmY0dtsD1xU1vejwXgmxeoJtojjNXaDbp6ieRVeq+XylyoOGqt
	GfvDhRgihXLccIcmDK1IID6gx6hZHB9oF0WoczJiN2phg1zekDkzbyfcOUcIDVUEJp4X6L1sW1D
	qTSDDq6ehPWluqY/+7WyLH7ai4Hwy3f40Z6nRDfU3hhf54GX78Cv63Il9t43fssm1k+I30ALbBi
	qS9D2aIMWkHD4C0v7/26LEDQzY4brdA9CFmjwTcO2HhM1aASBdQbOyBwM+1wNc2uiog1xZF2Bm6
	o4n0+JJjPCBH09zcG8RUetwCAIyYtU5HI68n5qjZhrzviFih+hi4Ly6VYgX0e9mP6ESZJ2sfwK2
	/18Btjs5dQgmTWIpfVizB98Au8bf3nQdv4T1nA/f7CZ4=
X-Received: by 2002:a17:90b:5343:b0:38e:d3b:436f with SMTP id 98e67ed59e1d1-38e2a0c669fmr3962949a91.36.1784159705834;
        Wed, 15 Jul 2026 16:55:05 -0700 (PDT)
X-Received: by 2002:a17:90b:5343:b0:38e:d3b:436f with SMTP id 98e67ed59e1d1-38e2a0c669fmr3962929a91.36.1784159705263;
        Wed, 15 Jul 2026 16:55:05 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3140e6ebe98sm4918779eec.26.2026.07.15.16.55.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 16:55:04 -0700 (PDT)
Message-ID: <b1a3cfc9-5038-4a65-8d15-fcfab21c1a44@redhat.com>
Date: Thu, 16 Jul 2026 09:54:57 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] arm64: cpufeature: Rename BBML2_NOABORT as BBML3
To: Linu Cherian <linu.cherian@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>, Kevin Brodsky <kevin.brodsky@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260715053408.1950475-1-linu.cherian@arm.com>
 <20260715053408.1950475-6-linu.cherian@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260715053408.1950475-6-linu.cherian@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: jGEJl6UsF-D4yzo3X-SCbVdjOIF1mm1wtKMxNvX6twY_1784159706
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_165511_015892_DFB3ED8D 
X-CRM114-Status: GOOD (  47.41  )
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

On 7/15/26 3:34 PM, Linu Cherian wrote:
> - As bbml2_noabort is functionally equivalent to bbml3,
>    rename cpu/system_supports_bbml2_noabort to
>    cpu/system_supports_bbml3.
>    The ARM64 capability name is also renamed accordingly.
> 
> - As BBML2_NOABORT or the equivalent BBML3 is the
>    kernel requirement for setting up linear map with
>    block/contpte mappings and not BBML2, replace all
>    bbml2 references with bbml3.
> 
> FEAT_BBML3, is introduced as part of 2025 Architecture Extensions.
> https://developer.arm.com/documentation/109697/2026_03/2025-Architecture-Extensions
> 
> No functional changes are introduced with this patch.
> 
> Signed-off-by: Linu Cherian <linu.cherian@arm.com>
> ---
>   arch/arm64/include/asm/cpufeature.h |  6 ++--
>   arch/arm64/kernel/cpufeature.c      | 30 +++++------------
>   arch/arm64/mm/contpte.c             | 21 +++++-------
>   arch/arm64/mm/mmu.c                 | 52 ++++++++++++++---------------
>   arch/arm64/mm/proc.S                |  4 +--
>   arch/arm64/tools/cpucaps            |  2 +-
>   6 files changed, 49 insertions(+), 66 deletions(-)
> 

Two nitpicks below, which can be fixed if there will be another respin.
This looks good to me in either day.

Reviewed-by: Gavin Shan <gshan@redhat.com>

> diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
> index a57870fa96db..d90040fb9de6 100644
> --- a/arch/arm64/include/asm/cpufeature.h
> +++ b/arch/arm64/include/asm/cpufeature.h
> @@ -878,11 +878,11 @@ static inline bool system_supports_pmuv3(void)
>   	return cpus_have_final_cap(ARM64_HAS_PMUV3);
>   }
>   
> -bool cpu_supports_bbml2_noabort(void);
> +bool cpu_supports_bbml3(void);
>   
> -static inline bool system_supports_bbml2_noabort(void)
> +static inline bool system_supports_bbml3(void)
>   {
> -	return alternative_has_cap_unlikely(ARM64_HAS_BBML2_NOABORT);
> +	return alternative_has_cap_unlikely(ARM64_HAS_BBML3);
>   }
>   
>   int do_emulate_mrs(struct pt_regs *regs, u32 sys_reg, u32 rt);
> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> index 1b804b6c4fe0..25a705e02618 100644
> --- a/arch/arm64/kernel/cpufeature.c
> +++ b/arch/arm64/kernel/cpufeature.c
> @@ -2131,21 +2131,10 @@ static bool hvhe_possible(const struct arm64_cpu_capabilities *entry,
>   	return arm64_test_sw_feature_override(ARM64_SW_FEATURE_OVERRIDE_HVHE);
>   }
>   
> -bool cpu_supports_bbml2_noabort(void)
> +bool cpu_supports_bbml3(void)
>   {
> -	/*
> -	 * We want to allow usage of BBML2 in as wide a range of kernel contexts
> -	 * as possible. This list is therefore an allow-list of known-good
> -	 * implementations that both support BBML2 and additionally, fulfill the
> -	 * extra constraint of never generating TLB conflict aborts when using
> -	 * the relaxed BBML2 semantics (such aborts make use of BBML2 in certain
> -	 * kernel contexts difficult to prove safe against recursive aborts).
> -	 *
> -	 * Note that implementations can only be considered "known-good" if their
> -	 * implementors attest to the fact that the implementation never raises
> -	 * TLB conflict aborts for BBML2 mapping granularity changes.
> -	 */
> -	static const struct midr_range supports_bbml2_noabort_list[] = {
> +	/* CPUs that support BBML3 but dont advertise through MMFR2 ID */

s/through MMFR2 ID/through ID_AA64MMFR2_EL1

> +	static const struct midr_range supports_bbml3_list[] = {
>   		MIDR_REV_RANGE(MIDR_CORTEX_X4, 0, 3, 0xf),
>   		MIDR_REV_RANGE(MIDR_NEOVERSE_V3, 0, 2, 0xf),
>   		MIDR_REV_RANGE(MIDR_NEOVERSE_V3AE, 0, 2, 0xf),
> @@ -2165,8 +2154,7 @@ bool cpu_supports_bbml2_noabort(void)
>   		{}
>   	};
>   
> -	/* Does our cpu guarantee to never raise TLB conflict aborts? */
> -	if (!is_midr_in_range_list(supports_bbml2_noabort_list))
> +	if (!is_midr_in_range_list(supports_bbml3_list))
>   		return false;
>   
>   	/*
> @@ -2177,9 +2165,9 @@ bool cpu_supports_bbml2_noabort(void)
>   	return true;
>   }
>   
> -static bool has_bbml2_noabort(const struct arm64_cpu_capabilities *caps, int scope)
> +static bool has_bbml3(const struct arm64_cpu_capabilities *caps, int scope)
>   {
> -	return cpu_supports_bbml2_noabort();
> +	return cpu_supports_bbml3();
>   }
>   
>   static void cpu_enable_pan(const struct arm64_cpu_capabilities *__unused)
> @@ -3072,10 +3060,10 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
>   		ARM64_CPUID_FIELDS(ID_AA64MMFR2_EL1, EVT, IMP)
>   	},
>   	{
> -		.desc = "BBM Level 2 without TLB conflict abort",
> -		.capability = ARM64_HAS_BBML2_NOABORT,
> +		.desc = "BBM Level 3",
> +		.capability = ARM64_HAS_BBML3,
>   		.type = ARM64_CPUCAP_EARLY_LOCAL_CPU_FEATURE,
> -		.matches = has_bbml2_noabort,
> +		.matches = has_bbml3,
>   	},
>   	{
>   		.desc = "52-bit Virtual Addressing for KVM (LPA2)",
> diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
> index 2de12656b4d8..0acab179fc1a 100644
> --- a/arch/arm64/mm/contpte.c
> +++ b/arch/arm64/mm/contpte.c
> @@ -89,7 +89,7 @@ static void contpte_convert(struct mm_struct *mm, unsigned long addr,
>   	}
>   
>   	/*
> -	 * On eliding the __tlb_flush_range() under BBML2+noabort:
> +	 * On eliding the __tlb_flush_range() under BBML3:
>   	 *
>   	 * NOTE: Instead of using N=16 as the contiguous block length, we use
>   	 *       N=4 for clarity.
> @@ -135,7 +135,7 @@ static void contpte_convert(struct mm_struct *mm, unsigned long addr,
>   	 * contiguous TLB entry, which is a micro-optimisation opportunity,
>   	 * but does not affect correctness.
>   	 *
> -	 * In the BBML2 case, the change is avoiding the intermediate tlbi+dsb.
> +	 * In the BBML3 case, the change is avoiding the intermediate tlbi+dsb.
>   	 * This means a few things, but notably other PEs will still "see" any
>   	 * stale cached TLB entries. This could lead to a "contiguous bit
>   	 * misprogramming" issue until the final tlbi+dsb of the changed page,
> @@ -158,21 +158,16 @@ static void contpte_convert(struct mm_struct *mm, unsigned long addr,
>   	 *  are present, and a write is made to this address, do we fault or
>   	 *  is the write permitted (via amalgamation)?
>   	 *
> -	 * The relevant Arm ARM DDI 0487L.a requirements are RNGLXZ and RJQQTC,
> -	 * and together state that when BBML1 or BBML2 are implemented, either
> -	 * a TLB conflict abort is raised (which we expressly forbid), or will
> -	 * "produce an OA, access permissions, and memory attributes that are
> -	 * consistent with any of the programmed translation table values".
> -	 *
> -	 * That is to say, will either raise a TLB conflict, or produce one of
> -	 * the cached TLB entries, but never amalgamate.
> +	 * With BBML3 implemented, no TLB conflict abort is raised and the OA,
> +	 * access permissions and memory attributes produced is one of the cached
> +	 * TLB entries, but never amalgamate.
>   	 *
>   	 * Thus, as the page tables are only considered "consistent" after
>   	 * the final tlbi+dsb (which evicts both the single stale (RW,n) TLB
>   	 * entry as well as the new contiguous (RO,c) TLB entry), omitting the
>   	 * initial tlbi+dsb is correct.
>   	 *
> -	 * It is also important to note that at the end of the BBML2 folding
> +	 * It is also important to note that at the end of the BBML3 folding
>   	 * case, we are still left with potentially all N TLB entries still
>   	 * cached (the N-1 non-contiguous ptes, and the single contiguous
>   	 * block). However, over time, natural TLB pressure will cause the
> @@ -214,7 +209,7 @@ static void contpte_convert(struct mm_struct *mm, unsigned long addr,
>   	 *
>   	 *                  |____| <--- tlbi + dsb
>   	 *
> -	 * For BBML2, we again remove the intermediate tlbi+dsb. Here, there
> +	 * For BBML3, we again remove the intermediate tlbi+dsb. Here, there
>   	 * are no issues, as the final tlbi+dsb covering the changed page is
>   	 * guaranteed to remove the original large contiguous (RW,c) TLB entry,
>   	 * as well as the intermediate (RW,n) TLB entry; the next access will
> @@ -224,7 +219,7 @@ static void contpte_convert(struct mm_struct *mm, unsigned long addr,
>   	 * regardless.
>   	 */
>   
> -	if (!system_supports_bbml2_noabort())
> +	if (!system_supports_bbml3())
>   		__flush_tlb_range(&vma, start_addr, addr, PAGE_SIZE, 3,
>   				  TLBF_NOWALKCACHE);
>   
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index a25d8beacc83..7d17b002fb6f 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -779,18 +779,18 @@ static int split_kernel_leaf_mapping_locked(unsigned long addr)
>   
>   static inline bool force_pte_mapping(void)
>   {
> -	const bool bbml2 = system_capabilities_finalized() ?
> -		system_supports_bbml2_noabort() : cpu_supports_bbml2_noabort();
> +	const bool bbml3 = system_capabilities_finalized() ?
> +		system_supports_bbml3() : cpu_supports_bbml3();
>   
>   	if (debug_pagealloc_enabled())
>   		return true;
> -	if (bbml2)
> +	if (bbml3)
>   		return false;
>   	return rodata_full || arm64_kfence_can_set_direct_map() || is_realm_world();
>   }
>   
>   static DEFINE_MUTEX(pgtable_split_lock);
> -static bool linear_map_requires_bbml2;
> +static bool linear_map_requires_bbml3;
>   
>   int split_kernel_leaf_mapping(unsigned long start, unsigned long end)
>   {
> @@ -803,15 +803,15 @@ int split_kernel_leaf_mapping(unsigned long start, unsigned long end)
>   	 * always pte-mapped), we must not go any further because taking the
>   	 * mutex below may sleep. Do not call force_pte_mapping() here because
>   	 * it could return a confusing result if called from a secondary cpu
> -	 * prior to finalizing caps. Instead, linear_map_requires_bbml2 gives us
> +	 * prior to finalizing caps. Instead, linear_map_requires_bbml3 gives us
>   	 * what we need.
>   	 */
> -	if (!linear_map_requires_bbml2 || is_kfence_address((void *)start))
> +	if (!linear_map_requires_bbml3 || is_kfence_address((void *)start))
>   		return 0;
>   
> -	if (!system_supports_bbml2_noabort()) {
> +	if (!system_supports_bbml3()) {
>   		/*
> -		 * !BBML2_NOABORT systems should not be trying to change
> +		 * BBML3 systems should not be trying to change
>   		 * permissions on anything that is not pte-mapped in the first
>   		 * place. Just return early and let the permission change code
>   		 * raise a warning if not already pte-mapped.
> @@ -828,7 +828,7 @@ int split_kernel_leaf_mapping(unsigned long start, unsigned long end)
>   
>   		/*
>   		 * Boot-time: Started secondary cpus but don't know if they
> -		 * support BBML2_NOABORT yet. Can't allow splitting in this
> +		 * support BBML3 yet. Can't allow splitting in this
>   		 * window in case they don't.
>   		 */

The "window" can be moved to the end of the previous line.

		/*
		 *
		 * support BBML3 yet. Can't allow splitting in this window
		 * in case they don't.
		 */

>   		if (WARN_ON(num_online_cpus() > 1))
> @@ -934,11 +934,11 @@ static int range_split_to_ptes(unsigned long start, unsigned long end, gfp_t gfp
>   	return ret;
>   }
>   
> -u32 idmap_kpti_bbml2_flag;
> +u32 idmap_kpti_bbml3_flag;
>   
> -static void __init init_idmap_kpti_bbml2_flag(void)
> +static void __init init_idmap_kpti_bbml3_flag(void)
>   {
> -	WRITE_ONCE(idmap_kpti_bbml2_flag, 1);
> +	WRITE_ONCE(idmap_kpti_bbml3_flag, 1);
>   	/* Must be visible to other CPUs before stop_machine() is called. */
>   	smp_mb();
>   }
> @@ -947,7 +947,7 @@ static int __init linear_map_split_to_ptes(void *__unused)
>   {
>   	/*
>   	 * Repainting the linear map must be done by CPU0 (the boot CPU) because
> -	 * that's the only CPU that we know supports BBML2. The other CPUs will
> +	 * that's the only CPU that we know supports BBML3. The other CPUs will
>   	 * be held in a waiting area with the idmap active.
>   	 */
>   	if (!smp_processor_id()) {
> @@ -960,7 +960,7 @@ static int __init linear_map_split_to_ptes(void *__unused)
>   		/*
>   		 * Wait for all secondary CPUs to be put into the waiting area.
>   		 */
> -		smp_cond_load_acquire(&idmap_kpti_bbml2_flag, VAL == num_online_cpus());
> +		smp_cond_load_acquire(&idmap_kpti_bbml3_flag, VAL == num_online_cpus());
>   
>   		/*
>   		 * Walk all of the linear map [lstart, lend), except the kernel
> @@ -979,7 +979,7 @@ static int __init linear_map_split_to_ptes(void *__unused)
>   		 * Relies on dsb in flush_tlb_kernel_range() to avoid reordering
>   		 * before any page table split operations.
>   		 */
> -		WRITE_ONCE(idmap_kpti_bbml2_flag, 0);
> +		WRITE_ONCE(idmap_kpti_bbml3_flag, 0);
>   	} else {
>   		typedef void (wait_split_fn)(void);
>   		extern wait_split_fn wait_linear_map_split_to_ptes;
> @@ -988,7 +988,7 @@ static int __init linear_map_split_to_ptes(void *__unused)
>   		wait_fn = (void *)__pa_symbol(wait_linear_map_split_to_ptes);
>   
>   		/*
> -		 * At least one secondary CPU doesn't support BBML2 so cannot
> +		 * At least one secondary CPU doesn't support BBML3 so cannot
>   		 * tolerate the size of the live mappings changing. So have the
>   		 * secondary CPUs wait for the boot CPU to make the changes
>   		 * with the idmap active and init_mm inactive.
> @@ -1003,8 +1003,8 @@ static int __init linear_map_split_to_ptes(void *__unused)
>   
>   void __init linear_map_maybe_split_to_ptes(void)
>   {
> -	if (linear_map_requires_bbml2 && !system_supports_bbml2_noabort()) {
> -		init_idmap_kpti_bbml2_flag();
> +	if (linear_map_requires_bbml3 && !system_supports_bbml3()) {
> +		init_idmap_kpti_bbml3_flag();
>   		stop_machine(linear_map_split_to_ptes, NULL, cpu_online_mask);
>   	}
>   }
> @@ -1127,7 +1127,7 @@ bool arch_kfence_init_pool(void)
>   	mutex_unlock(&pgtable_split_lock);
>   
>   	/*
> -	 * Since the system supports bbml2_noabort, tlb invalidation is not
> +	 * Since the system supports bbml3, tlb invalidation is not
>   	 * required here; the pgtable mappings have been split to pte but larger
>   	 * entries may safely linger in the TLB.
>   	 */
> @@ -1166,7 +1166,7 @@ static void __init map_mem(void)
>   
>   	arm64_kfence_map_pool();
>   
> -	linear_map_requires_bbml2 = !force_pte_mapping() && can_set_direct_map();
> +	linear_map_requires_bbml3 = !force_pte_mapping() && can_set_direct_map();
>   
>   	if (force_pte_mapping())
>   		flags |= NO_BLOCK_MAPPINGS | NO_CONT_MAPPINGS;
> @@ -1333,7 +1333,7 @@ void __init kpti_install_ng_mappings(void)
>   	if (arm64_use_ng_mappings)
>   		return;
>   
> -	init_idmap_kpti_bbml2_flag();
> +	init_idmap_kpti_bbml3_flag();
>   	stop_machine(__kpti_install_ng_mappings, NULL, cpu_online_mask);
>   }
>   
> @@ -1394,7 +1394,7 @@ void __pi_map_range(phys_addr_t *pte, u64 start, u64 end, phys_addr_t pa,
>   		    u64 va_offset);
>   
>   static u8 idmap_ptes[IDMAP_LEVELS - 1][PAGE_SIZE] __aligned(PAGE_SIZE) __ro_after_init,
> -	  kpti_bbml2_ptes[IDMAP_LEVELS - 1][PAGE_SIZE] __aligned(PAGE_SIZE) __ro_after_init;
> +	  kpti_bbml3_ptes[IDMAP_LEVELS - 1][PAGE_SIZE] __aligned(PAGE_SIZE) __ro_after_init;
>   
>   static void __init create_idmap(void)
>   {
> @@ -1406,17 +1406,17 @@ static void __init create_idmap(void)
>   		       IDMAP_ROOT_LEVEL, (pte_t *)idmap_pg_dir, false,
>   		       __phys_to_virt(ptep) - ptep);
>   
> -	if (linear_map_requires_bbml2 ||
> +	if (linear_map_requires_bbml3 ||
>   	    (IS_ENABLED(CONFIG_UNMAP_KERNEL_AT_EL0) && !arm64_use_ng_mappings)) {
> -		phys_addr_t pa = __pa_symbol(&idmap_kpti_bbml2_flag);
> +		phys_addr_t pa = __pa_symbol(&idmap_kpti_bbml3_flag);
>   
>   		/*
>   		 * The KPTI G-to-nG conversion code needs a read-write mapping
>   		 * of its synchronization flag in the ID map. This is also used
>   		 * when splitting the linear map to ptes if a secondary CPU
> -		 * doesn't support bbml2.
> +		 * doesn't support bbml3.
>   		 */
> -		ptep = __pa_symbol(kpti_bbml2_ptes);
> +		ptep = __pa_symbol(kpti_bbml3_ptes);
>   		__pi_map_range(&ptep, pa, pa + sizeof(u32), pa, PAGE_KERNEL,
>   			       IDMAP_ROOT_LEVEL, (pte_t *)idmap_pg_dir, false,
>   			       __phys_to_virt(ptep) - ptep);
> diff --git a/arch/arm64/mm/proc.S b/arch/arm64/mm/proc.S
> index 22866b49be37..f4e4e71a0ea8 100644
> --- a/arch/arm64/mm/proc.S
> +++ b/arch/arm64/mm/proc.S
> @@ -287,7 +287,7 @@ SYM_TYPED_FUNC_START(idmap_kpti_install_ng_mappings)
>   
>   	mov	x5, x3				// preserve temp_pte arg
>   	mrs	swapper_ttb, ttbr1_el1
> -	adr_l	flag_ptr, idmap_kpti_bbml2_flag
> +	adr_l	flag_ptr, idmap_kpti_bbml3_flag
>   
>   	cbnz	cpu, __idmap_kpti_secondary
>   
> @@ -445,7 +445,7 @@ SYM_TYPED_FUNC_START(wait_linear_map_split_to_ptes)
>   	flag_ptr	.req	x4
>   
>   	mrs     swapper_ttb, ttbr1_el1
> -	adr_l   flag_ptr, idmap_kpti_bbml2_flag
> +	adr_l   flag_ptr, idmap_kpti_bbml3_flag
>   	__idmap_cpu_set_reserved_ttbr1 x16, x17
>   
>   scondary_cpu_wait:
> diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
> index 9b85a84f6fd4..c05371365d14 100644
> --- a/arch/arm64/tools/cpucaps
> +++ b/arch/arm64/tools/cpucaps
> @@ -14,6 +14,7 @@ HAS_ADDRESS_AUTH_ARCH_QARMA5
>   HAS_ADDRESS_AUTH_IMP_DEF
>   HAS_AMU_EXTN
>   HAS_ARMv8_4_TTL
> +HAS_BBML3
>   HAS_CACHE_DIC
>   HAS_CACHE_IDC
>   HAS_CNP
> @@ -51,7 +52,6 @@ HAS_LS64_V
>   HAS_LSUI
>   HAS_MOPS
>   HAS_NESTED_VIRT
> -HAS_BBML2_NOABORT
>   HAS_PAN
>   HAS_PMUV3
>   HAS_S1PIE

Thanks,
Gavin


