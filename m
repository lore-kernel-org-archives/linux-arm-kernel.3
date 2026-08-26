Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63204C61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 13:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oa0Aq5guY6huJ1zY3xDznoDnxIbmq1MF5zKhfMhdViQ=; b=01RwbrfowiJBWNR0ZZzcNt90tU
	/rBjKFNy/P2iILe/v8mwSrH/TgPR+7j1uqn80kY47yu6VWbP70tTIuBGB6/yz5Sb75oENCCuDwloj
	ahGw+V3StG7MyksRbZEk8v/g4hvdetRjos48zFzQMfDAw+To1yeqt09RDDcgbChPm2nLDjLE2dJYL
	kebYgGaWmWUC24EDwaaMOPSPIiDBvRYWXJQ99Bi2BCvfGeuj3WFm2C6iJgiuterZMiGv03f7vC4qz
	y0NZPLua4RG80Ts68af9IZ0bAMG2u+ssuAiZ3P1RcdlnO2YDduT55F+bSgmctcrjhfAiiSxD3Pj+f
	DsevuaXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzDyR-00000002Xn0-1AZw;
	Wed, 26 Aug 2026 13:47:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzDyN-00000002XmP-0egW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 13:47:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C390C165C;
	Wed, 26 Aug 2026 06:47:17 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 342213F66F;
	Wed, 26 Aug 2026 06:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787752041; bh=0MnDj5WVVF2UqScVMHonzHxzntwHpQhPH6FsUHivT6M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tC5bvxIdWvmRxIuRkRf6JLXg+FELB2OCTOgsxM5Q51LLmhDrWY0Dr9VUL5cQGf+Ea
	 LeK7MLeBD3kLs0MS2zzgrPNINKHEr7YtJs/S2+Lr2nSaODBYCdla5qy1jvkMNJzDtg
	 H/+O7uJjLYi/4ZhCvCYI86lWe9UMKxnFvS6gSnUA=
Date: Wed, 26 Aug 2026 14:47:15 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mark Brown <broonie@kernel.org>, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH v4 1/2] arm64: Apply overrides to CPU local capabilities
Message-ID: <ao7uY-dpJocX6ety@arm.com>
References: <20260825164219.3347229-1-fuad.tabba@linux.dev>
 <20260825164219.3347229-2-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260825164219.3347229-2-fuad.tabba@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_064723_644551_6A21BC44 
X-CRM114-Status: GOOD (  20.42  )
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

On Tue, Aug 25, 2026 at 05:42:18PM +0100, Fuad Tabba wrote:
> From: Suzuki K Poulose <suzuki.poulose@arm.com>
> 
> If an override has been applied, make sure we apply that for the
> secondary CPUs too, to limit the features.
> 
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Link: https://lore.kernel.org/all/afc5bd00-28ca-413b-b047-ee53589c285d@arm.com/
> Cc: stable@vger.kernel.org
> [Fuad: whitespace and comment fixes]
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>

For completeness, we should add:

Fixes: b3341ae0efa2  ("arm64: cpufeature: Use IDreg override in __read_sysreg_by_encoding()")

> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> index 9a22df0c5120f..88b15b5ef2f7f 100644
> --- a/arch/arm64/kernel/cpufeature.c
> +++ b/arch/arm64/kernel/cpufeature.c
> @@ -1232,10 +1232,43 @@ void __init init_cpu_features(struct cpuinfo_arm64 *info)
>  		init_cpu_ftr_reg(SYS_GMID_EL1, info->reg_gmid);
>  }
>  
> +/*
> + * Sanitise the register fields to clamp the values to the overrides that
> + * have been applied.
> + */
> +static u64 override_cpu_ftr_reg(struct arm64_ftr_reg *reg, u64 val)
> +{
> +	const struct arm64_ftr_bits *ftrp;
> +
> +	if (!reg || !reg->override->mask)
> +		return val;
> +
> +	for (ftrp = reg->ftr_bits; ftrp->width; ftrp++) {
> +		u64 ftr_mask = arm64_ftr_mask(ftrp);
> +		s64 ftr_val, ftr_ovr, ftr_safe;
> +
> +		/* Skip the fields not overridden */
> +		if ((ftr_mask & reg->override->mask) != ftr_mask)
> +			continue;
> +
> +		ftr_val = arm64_ftr_value(ftrp, val);
> +		ftr_ovr = arm64_ftr_value(ftrp, reg->override->val);
> +		ftr_safe = arm64_ftr_safe_value(ftrp, ftr_ovr, ftr_val);
> +
> +		if (ftr_safe != ftr_val)
> +			val = arm64_ftr_set_value(ftrp, val, ftr_safe);
> +	}
> +
> +	return val;
> +}
> +
>  static void update_cpu_ftr_reg(struct arm64_ftr_reg *reg, u64 new)
>  {
>  	const struct arm64_ftr_bits *ftrp;
>  
> +	/* Apply the overrides */
> +	new = override_cpu_ftr_reg(reg, new);

Not sure we need this. The init value has already been clamped, made
safe, so it won't change the result.

Otherwise:

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

