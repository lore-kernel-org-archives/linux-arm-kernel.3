Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7057D1BDD5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 17:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lQZdW935A8AeGz2IQQ31IOufIeX3/wqCPJWamZ6asUI=; b=wNOmKG+6hTdWLOTiG4xj+Ed903
	Ee8FAe3QQ4N7ZKiJqUZpb4mt0Zdxa4CDBOm2BA+JpFqUyrrZJOEjdgSbNStznmDiT8+r/OYlpeAKq
	DuBjaDu8vlMWY23bDttMCK4u1izLIDWBEyBd3Yg43G3VIQ1SaHEVY+rjMWjdbxM6dK3ZuxHd8uBFp
	HrhraLAoe3U1dBAoht07RiunAHHD86wz6XtCvPYUSIKcTg0FAWWC9urlW6JZ2fLh7JJsqaEkVUD6j
	r/Lg2W5X+qfciw12x0bL+KciQvqBR2CQ5aDN5+ayrRUUnQIvOQN9lD1kiiF62hmcZO4npT9Dw+k0k
	k6RWZgFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t81IK-0000000Ec2o-29eJ;
	Mon, 04 Nov 2024 17:55:16 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t80so-0000000EX0u-0zoP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 17:28:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 34F675C2759;
	Mon,  4 Nov 2024 17:28:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23E52C4CED1;
	Mon,  4 Nov 2024 17:28:49 +0000 (UTC)
Date: Mon, 4 Nov 2024 17:28:48 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Yicong Yang <yangyicong@huawei.com>
Cc: will@kernel.org, maz@kernel.org, mark.rutland@arm.com,
	broonie@kernel.org, linux-arm-kernel@lists.infradead.org,
	oliver.upton@linux.dev, ryan.roberts@arm.com, linuxarm@huawei.com,
	jonathan.cameron@huawei.com, shameerali.kolothum.thodi@huawei.com,
	prime.zeng@hisilicon.com, xuwei5@huawei.com,
	wangkefeng.wang@huawei.com, yangyicong@hisilicon.com
Subject: Re: [PATCH v4 3/5] arm64: Add support for FEAT_HAFT
Message-ID: <ZykEUGdkyYClM8Zi@arm.com>
References: <20241102104235.62560-1-yangyicong@huawei.com>
 <20241102104235.62560-4-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241102104235.62560-4-yangyicong@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_092854_342888_FA1D620D 
X-CRM114-Status: GOOD (  14.90  )
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

On Sat, Nov 02, 2024 at 06:42:33PM +0800, Yicong Yang wrote:
> diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
> index 3d261cc123c1..ed8c784ca082 100644
> --- a/arch/arm64/include/asm/cpufeature.h
> +++ b/arch/arm64/include/asm/cpufeature.h
> @@ -838,6 +838,12 @@ static inline bool system_supports_poe(void)
>  		alternative_has_cap_unlikely(ARM64_HAS_S1POE);
>  }
>  
> +static inline bool system_supports_haft(void)
> +{
> +	return IS_ENABLED(CONFIG_ARM64_HAFT) &&
> +		cpus_have_final_cap(ARM64_HAFT);
> +}

I'm fine with this approach. If we ever get hardware with mismatched
FEAT_HAFT and some secondary CPUs don't come up, we can revisit.

> diff --git a/arch/arm64/mm/proc.S b/arch/arm64/mm/proc.S
> index ccbae4525891..0bc88df7cb35 100644
> --- a/arch/arm64/mm/proc.S
> +++ b/arch/arm64/mm/proc.S
> @@ -498,6 +498,10 @@ alternative_else_nop_endif
>  	and	x9, x9, ID_AA64MMFR1_EL1_HAFDBS_MASK
>  	cbz	x9, 1f
>  	orr	tcr, tcr, #TCR_HA		// hardware Access flag update
> +
> +#ifdef CONFIG_ARM64_HAFT
> +	orr	tcr2, tcr2, TCR2_EL1x_HAFT
> +#endif /* CONFIG_ARM64_HAFT */
>  1:
>  #endif	/* CONFIG_ARM64_HW_AFDBM */
>  	msr	mair_el1, mair

If you still want #ifdefs, I'd have left it outside the HW_AFDBM. We
already have a dependency in the Kconfig. Anyway, I can fix this up.

I think as an additional patch we can also remove the ID checks for the
tcr bit in tge HW_AFDBM case. But that's unrelated to this series.

-- 
Catalin

