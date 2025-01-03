Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CFF3E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 17:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FOM/e6XevjRG3dPMRbzkqNGbkCx1yG3QmcD8rMKrLkg=; b=zDWDZMiRr0qHirmaj4AlJ7kv59
	CHVvZ1qD5Oyckf/N8dN6+hd46kMGSPzYywE6dk6GVmNJKh1G5XEN7xGDVIYvyDrtINcnvR/EHWjs2
	NzZQe8K6kzurTS7HCos+VxoGA3biLlrSwzH5q2oe+tylJg5WODoU3yNKqXA3jk1OC5fiHIZHH86SJ
	tZl1RBr8UbkxRRa8Ovo9oOndsBJZHAvTsIYdt4D7c7A94VxddDeHn9zlJkaAo8gb+DejXRfySA+Iu
	jGKEPzyUZLQlwFoLRQmOryhZW9NMBZ4OFFfIglHlY5e887UO9kXeY42T29i9juc9nXHzLu7FsUkpQ
	2PvFvFcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTlQD-0000000DYf4-44mc;
	Fri, 03 Jan 2025 17:25:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTlLF-0000000DXxA-0uMC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jan 2025 17:20:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 72ECC5C63FD;
	Fri,  3 Jan 2025 17:19:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52A9BC4CECE;
	Fri,  3 Jan 2025 17:20:07 +0000 (UTC)
Date: Fri, 3 Jan 2025 17:20:05 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>, stable@vger.kernel.org
Subject: Re: [PATCH] arm64: Filter out SVE hwcaps when FEAT_SVE isn't
 implemented
Message-ID: <Z3gcRczN67LsMVST@arm.com>
References: <20250103142635.1759674-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250103142635.1759674-1-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_092009_295718_22A1A923 
X-CRM114-Status: GOOD (  22.79  )
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

On Fri, Jan 03, 2025 at 02:26:35PM +0000, Marc Zyngier wrote:
> The hwcaps code that exposes SVE features to userspace only
> considers ID_AA64ZFR0_EL1, while this is only valid when
> ID_AA64PFR0_EL1.SVE advertises that SVE is actually supported.
> 
> The expectations are that when ID_AA64PFR0_EL1.SVE is 0, the
> ID_AA64ZFR0_EL1 register is also 0. So far, so good.
> 
> Things become a bit more interesting if the HW implements SME.
> In this case, a few ID_AA64ZFR0_EL1 fields indicate *SME*
> features. And these fields overlap with their SVE interpretations.
> But the architecture says that the SME and SVE feature sets must
> match, so we're still hunky-dory.
> 
> This goes wrong if the HW implements SME, but not SVE. In this
> case, we end-up advertising some SVE features to userspace, even
> if the HW has none. That's because we never consider whether SVE
> is actually implemented. Oh well.
> 
> Fix it by restricting all SVE capabilities to ID_AA64PFR0_EL1.SVE
> being non-zero.
> 
> Reported-by: Catalin Marinas <catalin.marinas@arm.com>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> Cc: Will Deacon <will@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: stable@vger.kernel.org

I'd add:

Fixes: 06a916feca2b ("arm64: Expose SVE2 features for userspace")

While at the time the code was correct, the architecture messed up our
assumptions with the introduction of SME.

> @@ -3022,6 +3027,13 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
>  		.matches = match,						\
>  	}
>  
> +#define HWCAP_CAP_MATCH_ID(match, reg, field, min_value, cap_type, cap)		\
> +	{									\
> +		__HWCAP_CAP(#cap, cap_type, cap)				\
> +		HWCAP_CPUID_MATCH(reg, field, min_value) 			\
> +		.matches = match,						\
> +	}

Do we actually need this macro?

> +
>  #ifdef CONFIG_ARM64_PTR_AUTH
>  static const struct arm64_cpu_capabilities ptr_auth_hwcap_addr_matches[] = {
>  	{
> @@ -3050,6 +3062,18 @@ static const struct arm64_cpu_capabilities ptr_auth_hwcap_gen_matches[] = {
>  };
>  #endif
>  
> +#ifdef CONFIG_ARM64_SVE
> +static bool has_sve(const struct arm64_cpu_capabilities *cap, int scope)
> +{
> +	u64 aa64pfr0 = __read_scoped_sysreg(SYS_ID_AA64PFR0_EL1, scope);
> +
> +	if (FIELD_GET(ID_AA64PFR0_EL1_SVE, aa64pfr0) < ID_AA64PFR0_EL1_SVE_IMP)
> +		return false;
> +
> +	return has_user_cpuid_feature(cap, scope);
> +}
> +#endif

We can name this has_sve_feature() and use it with the existing
HWCAP_CAP_MATCH() macro. I think it would look identical.

We might even be able to use system_supports_sve() directly and avoid
changing read_scoped_sysreg(). setup_user_features() is called in
smp_cpus_done() after setup_system_features(), so using
system_supports_sve() directly should be fine here.

-- 
Catalin

