Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A25BDE77180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 21:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7uYlOt8elByKXPK9GORjQgONkmgmYlAjU2y3ruhIiIQ=; b=ITCBD1Bo67Ya4WoYgOA/2FgNCA
	g12e6BOcJOwrrZeQLlc6vXcd+Sj6duPjoJhTkKbhTy+ZmFhkW4x11888Vad5b6YAhocxWqVNXkkMn
	th+nBHBXPGVTo4UPJDLBD19O4wiEIq4bMWEZ8LoqArbnf/Fq/bmglZTmbO74KOqUlkjBi8sr3DrgC
	/Ntt7iXpkKdLpT6YGn1s6djU/BVQYCNv43aA774Ubvzs5TlnAN+/uZ15qQJAEbw/MEkKMUYOdfe+M
	Ec3iCbeUci0vnwYOyfNd5Yh7JB182MUyrT2qQvQsg27zrbSx7yH3iXrHBjJNlETL7CTgWQdjSyjhI
	EWF6e0qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLU1W-0000000G92v-4BdE;
	Wed, 11 Dec 2024 21:13:35 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLTr9-0000000G6x6-3cK5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 21:02:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 929A85C5508;
	Wed, 11 Dec 2024 21:02:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9029FC4CED2;
	Wed, 11 Dec 2024 21:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733950969;
	bh=UuL6Tkk1/zyeCvpCEaNjww627w5GXUASRKbJM/voC/s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sgWLhRqwtYaMdcOGWwKKyWGeq8ACgIw3/x30NSZ/jdF7Yw3u3GL0TqGKaSLlTdVWl
	 qGZjbhDa1lnMmACXqPjcTSn/9IgUj74wxP8/meoBl8bPqpemIYuXMDfP+T8UKItV7I
	 ZZ/VETi3pYoCGZnHXXO9sMFPp990bXpRdbg7mAwRBmFvc5Q/MQ+bscn/drmbiIYojf
	 kSLEAEBNNplgxpdDp22F1Dy6UnHF6TP30sNfFVZluvqFR1uQzgNtE5cz+/2sG0CNmK
	 5Cc53VTpAXU8FziYet1gYfskQcuiFEsHUbbltSx0M671uXwbU3yLaj5hYp5yDWklqe
	 RRCkJ3rL8bcjQ==
Date: Wed, 11 Dec 2024 21:02:44 +0000
From: Will Deacon <will@kernel.org>
To: =?utf-8?Q?Miko=C5=82aj?= Lenczewski <miko.lenczewski@arm.com>
Cc: catalin.marinas@arm.com, corbet@lwn.net, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, linux-arm-kernel@lists.infradead.org,
	liunx-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	kvmarm@vger.kernel.org
Subject: Re: [RFC PATCH v1 2/5] arm64: Add BBM Level 2 cpu feature
Message-ID: <20241211210243.GA17155@willie-the-truck>
References: <20241211154611.40395-1-miko.lenczewski@arm.com>
 <20241211154611.40395-3-miko.lenczewski@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241211154611.40395-3-miko.lenczewski@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_130251_984920_7BC32605 
X-CRM114-Status: GOOD (  33.75  )
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

On Wed, Dec 11, 2024 at 03:45:03PM +0000, Mikołaj Lenczewski wrote:
> The Break-Before-Make cpu feature supports multiple levels (levels 0-2),
> and this commit adds a dedicated BBML2 cpufeature to test against
> support for.
> 
> In supporting BBM level 2, we open ourselves up to potential TLB
> Conflict Abort Exceptions during expected execution, instead of only
> in exceptional circumstances. In the case of an abort, it is
> implementation defined at what stage the abort is generated, and
> the minimal set of required invalidations is also implementation
> defined. The maximal set of invalidations is to do a `tlbi vmalle1`
> or `tlbi vmalls12e1`, depending on the stage.
> 
> Such aborts should not occur on Arm hardware, and were not seen in
> benchmarked systems, so unless performance concerns arise, implementing
> the abort handlers with the worst-case invalidations seems like an
> alright hack.
> 
> Signed-off-by: Mikołaj Lenczewski <miko.lenczewski@arm.com>
> ---
>  arch/arm64/include/asm/cpufeature.h | 14 ++++++++++++++
>  arch/arm64/kernel/cpufeature.c      |  7 +++++++
>  arch/arm64/mm/fault.c               | 27 ++++++++++++++++++++++++++-
>  arch/arm64/tools/cpucaps            |  1 +
>  4 files changed, 48 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
> index 8b4e5a3cd24c..a9f2ac335392 100644
> --- a/arch/arm64/include/asm/cpufeature.h
> +++ b/arch/arm64/include/asm/cpufeature.h
> @@ -866,6 +866,20 @@ static __always_inline bool system_supports_mpam_hcr(void)
>  	return alternative_has_cap_unlikely(ARM64_MPAM_HCR);
>  }
>  
> +static inline bool system_supports_bbml2(void)
> +{
> +	/* currently, BBM is only relied on by code touching the userspace page
> +	 * tables, and as such we are guaranteed that caps have been finalised.
> +	 *
> +	 * if later we want to use BBM for kernel mappings, particularly early
> +	 * in the kernel, this may return 0 even if BBML2 is actually supported,
> +	 * which means unnecessary break-before-make sequences, but is still
> +	 * correct
> +	 */
> +
> +	return alternative_has_cap_unlikely(ARM64_HAS_BBML2);
> +}
> +
>  int do_emulate_mrs(struct pt_regs *regs, u32 sys_reg, u32 rt);
>  bool try_emulate_mrs(struct pt_regs *regs, u32 isn);
>  
> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> index 6ce71f444ed8..7cc94bd5da24 100644
> --- a/arch/arm64/kernel/cpufeature.c
> +++ b/arch/arm64/kernel/cpufeature.c
> @@ -2917,6 +2917,13 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
>  		.matches = has_cpuid_feature,
>  		ARM64_CPUID_FIELDS(ID_AA64MMFR2_EL1, EVT, IMP)
>  	},
> +	{
> +		.desc = "BBM Level 2 Support",
> +		.capability = ARM64_HAS_BBML2,
> +		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
> +		.matches = has_cpuid_feature,
> +		ARM64_CPUID_FIELDS(ID_AA64MMFR2_EL1, BBM, 2)
> +	},
>  	{
>  		.desc = "52-bit Virtual Addressing for KVM (LPA2)",
>  		.capability = ARM64_HAS_LPA2,
> diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
> index ef63651099a9..dc119358cbc1 100644
> --- a/arch/arm64/mm/fault.c
> +++ b/arch/arm64/mm/fault.c
> @@ -844,6 +844,31 @@ static int do_tag_check_fault(unsigned long far, unsigned long esr,
>  	return 0;
>  }
>  
> +static int do_conflict_abort(unsigned long far, unsigned long esr,
> +			     struct pt_regs *regs)
> +{
> +	if (!system_supports_bbml2())
> +		return do_bad(far, esr, regs);
> +
> +	/* if we receive a TLB conflict abort, we know that there are multiple
> +	 * TLB entries that translate the same address range. the minimum set
> +	 * of invalidations to clear these entries is implementation defined.
> +	 * the maximum set is defined as either tlbi(vmalls12e1) or tlbi(alle1).
> +	 *
> +	 * if el2 is enabled and stage 2 translation enabled, this may be
> +	 * raised as a stage 2 abort. if el2 is enabled but stage 2 translation
> +	 * disabled, or if el2 is disabled, it will be raised as a stage 1
> +	 * abort.
> +	 *
> +	 * local_flush_tlb_all() does a tlbi(vmalle1), which is enough to
> +	 * handle a stage 1 abort.
> +	 */
> +
> +	local_flush_tlb_all();
> +
> +	return 0;
> +}

Can we actually guarantee that we make it this far without taking another
abort? Given that I'm yet to see one of these things in the wild, I'm
fairly opposed to pretending that we can handle them. We'd be much better
off only violating BBM on CPUs that are known to handle the conflict
gracefully. Judging by your later patch, this is practically keyed off
the MIDR _anyway_...

Will

