Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16704C0218D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jan 2025 10:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nHvi+TUFwCMArANw34vqFR+vN/XpIRiOJfvOqlG7VxM=; b=kgET+8Xi1fNYlRkfAU2K0L56LW
	fU9DZ5s32r8YCZP6fL2mv9aXizPN+3czZai+ejMfQKK6HHXuWUt5uOPhooBx1HSbg6W0RuXlvdX9K
	msypDzcsbiNWjyxgAeuUacPhgpkcoRz6qzbJ24HBM+mnQUlu8AAE5hGxjw84lhH3TNe3ae0uv6Xat
	5gVRqLAKTrQAtgPNTW74PJF6UgtqDmqajmg7V+Nf5563GbhO1CTQfQ7+CLImZQtF9zxHGuls2PWqA
	5BoABQbe7mD0typ1dAmU6GJ6IlqgMbLefTSFtOImgC5BTHCs+h6cX9MNA4QzaDdHm83tgQv7GkQqs
	EdaDJi/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdojB-0000000ARzP-1gcx;
	Fri, 31 Jan 2025 10:58:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdohq-0000000ARn9-2aWr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jan 2025 10:57:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8EEE1497;
	Fri, 31 Jan 2025 02:57:26 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B79BC3F63F;
	Fri, 31 Jan 2025 02:56:58 -0800 (PST)
Date: Fri, 31 Jan 2025 10:56:56 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Oliver Upton <oliver.upton@linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Mark Brown <broonie@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>, James Morse <james.morse@arm.com>,
	stable@vger.kernel.org, Moritz Fischer <moritzf@google.com>,
	Pedro Martelletto <martelletto@google.com>,
	Jon Masters <jonmasters@google.com>
Subject: Re: [PATCH] arm64: Move storage of idreg overrides into mmuoff
 section
Message-ID: <Z5yseC1kCyTcwlMy@J2N7QTR9R3>
References: <20250130204614.64621-1-oliver.upton@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250130204614.64621-1-oliver.upton@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_025702_742194_21BC8B45 
X-CRM114-Status: GOOD (  23.99  )
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

Hi Oliver,

On Thu, Jan 30, 2025 at 12:46:15PM -0800, Oliver Upton wrote:
> There are a few places where the idreg overrides are read w/ the MMU
> off, for example the VHE and hVHE checks in __finalise_el2. And while
> the infrastructure gets this _mostly_ right (i.e. does the appropriate
> cache maintenance), the placement of the data itself is problematic and
> could share a cache line with something else.
> 
> Depending on how unforgiving an implementation's handling of mismatched
> attributes is, this could lead to data corruption. In one observed case,
> the system_cpucaps shared a line with arm64_sw_feature_override and the
> cpucaps got nuked after entering the hyp stub...

This doesn't sound right. Non-cacheable/Device reads should not lead to
corruption of a cached copy regardless of whether that cached copy is
clean or dirty.

The corruption suggests that either we're performing a *write* with
mismatched attributes (in which case the use of .mmuoff.data.read below
isn't quite right), or we have a plan invalidate somewhere without a
clean (and e.g. something else might need to be moved into
.mmuoff.data.write).

Seconding Ard's point, I think we need to understand this scenario
better.

To be clear, I think moving all the overrides into .mmuoff.data.read
makes sense, but it doesn't explain the problem above, and it seems like
there must be a latent issue (which this might only mask rather than
solve).

Mark.

> Even though only a few overrides are read without the MMU on, just throw
> the whole lot into the mmuoff section and be done with it.
> 
> Cc: stable@vger.kernel.org # v5.15+
> Tested-by: Moritz Fischer <moritzf@google.com>
> Tested-by: Pedro Martelletto <martelletto@google.com>
> Reported-by: Jon Masters <jonmasters@google.com>
> Signed-off-by: Oliver Upton <oliver.upton@linux.dev>
> ---
>  arch/arm64/kernel/cpufeature.c | 25 ++++++++++++++-----------
>  1 file changed, 14 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> index d41128e37701..92506d9f90db 100644
> --- a/arch/arm64/kernel/cpufeature.c
> +++ b/arch/arm64/kernel/cpufeature.c
> @@ -755,17 +755,20 @@ static const struct arm64_ftr_bits ftr_raz[] = {
>  #define ARM64_FTR_REG(id, table)		\
>  	__ARM64_FTR_REG_OVERRIDE(#id, id, table, &no_override)
>  
> -struct arm64_ftr_override id_aa64mmfr0_override;
> -struct arm64_ftr_override id_aa64mmfr1_override;
> -struct arm64_ftr_override id_aa64mmfr2_override;
> -struct arm64_ftr_override id_aa64pfr0_override;
> -struct arm64_ftr_override id_aa64pfr1_override;
> -struct arm64_ftr_override id_aa64zfr0_override;
> -struct arm64_ftr_override id_aa64smfr0_override;
> -struct arm64_ftr_override id_aa64isar1_override;
> -struct arm64_ftr_override id_aa64isar2_override;
> -
> -struct arm64_ftr_override arm64_sw_feature_override;
> +#define DEFINE_FTR_OVERRIDE(name)					\
> +	struct arm64_ftr_override __section(".mmuoff.data.read") name
> +
> +DEFINE_FTR_OVERRIDE(id_aa64mmfr0_override);
> +DEFINE_FTR_OVERRIDE(id_aa64mmfr1_override);
> +DEFINE_FTR_OVERRIDE(id_aa64mmfr2_override);
> +DEFINE_FTR_OVERRIDE(id_aa64pfr0_override);
> +DEFINE_FTR_OVERRIDE(id_aa64pfr1_override);
> +DEFINE_FTR_OVERRIDE(id_aa64zfr0_override);
> +DEFINE_FTR_OVERRIDE(id_aa64smfr0_override);
> +DEFINE_FTR_OVERRIDE(id_aa64isar1_override);
> +DEFINE_FTR_OVERRIDE(id_aa64isar2_override);
> +
> +DEFINE_FTR_OVERRIDE(arm64_sw_feature_override);
>  
>  static const struct __ftr_reg_entry {
>  	u32			sys_id;
> 
> base-commit: 1dd3393696efba1598aa7692939bba99d0cffae3
> -- 
> 2.39.5
> 
> 

