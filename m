Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8E30C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 11:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R6E+2pvvTIb73Uwr6MgrmLgzU4tqvOEmNLZReDscqxk=; b=Fe2QhBvePIcGNB/UIowmwL6PQe
	P8PPaN9zRjrdT868DYi7f0YP3WsT0hAqOO4uPymEkd0m45XJjsuLErBYAmj4C1pp77iSdj//HGUvM
	qa+f48B/Qx/u4IRgBZK1c9JwDp23+cOtgjaSChpi+4AQSGWPmk7AMHNo6KKWwdIDbDrrvOUhaW/QV
	vWhDuXZBJfTZ+6pUBzFxkSVA7f9dG2sbR8CvqOhP1Hv5XzU2mTRQgGAD6VfOQl1diDacdGAUg71qN
	06ynO17xqdMbqzGVr4VN06YzDC+Ar6s/1dn2drFUNz99G9vW4yJzsi5WIKhLuhN9rvyCUT5BGPPl0
	UhZy5DlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSDev-0000000CvWL-01YC;
	Thu, 19 Jun 2025 11:42:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSD4y-0000000CoLI-2DtE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 11:05:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E97A8629D1;
	Thu, 19 Jun 2025 11:05:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF159C4CEEA;
	Thu, 19 Jun 2025 11:05:07 +0000 (UTC)
Date: Thu, 19 Jun 2025 12:05:05 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: =?utf-8?Q?Miko=C5=82aj?= Lenczewski <miko.lenczewski@arm.com>
Cc: ryan.roberts@arm.com, yang@os.amperecomputing.com, will@kernel.org,
	jean-philippe@linaro.org, robin.murphy@arm.com, joro@8bytes.org,
	maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	james.morse@arm.com, broonie@kernel.org, ardb@kernel.org,
	baohua@kernel.org, suzuki.poulose@arm.com, david@redhat.com,
	jgg@ziepe.ca, nicolinc@nvidia.com, jsnitsel@redhat.com,
	mshavit@google.com, kevin.tian@intel.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev
Subject: Re: [PATCH v7 2/4] arm64: Add BBM Level 2 cpu feature
Message-ID: <aFPu4SorUGlFt-2p@arm.com>
References: <20250617095104.6772-1-miko.lenczewski@arm.com>
 <20250617095104.6772-3-miko.lenczewski@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250617095104.6772-3-miko.lenczewski@arm.com>
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

On Tue, Jun 17, 2025 at 09:51:02AM +0000, Mikołaj Lenczewski wrote:
> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> index f9c947166322..2e80ff237b96 100644
> --- a/arch/arm64/kernel/cpufeature.c
> +++ b/arch/arm64/kernel/cpufeature.c
> @@ -2213,6 +2213,41 @@ static bool hvhe_possible(const struct arm64_cpu_capabilities *entry,
>  	return arm64_test_sw_feature_override(ARM64_SW_FEATURE_OVERRIDE_HVHE);
>  }
>  
> +static bool has_bbml2_noabort(const struct arm64_cpu_capabilities *caps, int scope)
> +{
> +	/*
> +	 * We want to allow usage of BBML2 in as wide a range of kernel contexts
> +	 * as possible. This list is therefore an allow-list of known-good
> +	 * implementations that both support BBML2 and additionally, fulfill the
> +	 * extra constraint of never generating TLB conflict aborts when using
> +	 * the relaxed BBML2 semantics (such aborts make use of BBML2 in certain
> +	 * kernel contexts difficult to prove safe against recursive aborts).
> +	 *
> +	 * Note that implementations can only be considered "known-good" if their
> +	 * implementors attest to the fact that the implementation never raises
> +	 * TLBI conflict aborts for BBML2 mapping granularity changes.

s/TLBI/TLB/

> +	 */
> +	static const struct midr_range supports_bbml2_noabort_list[] = {
> +		MIDR_REV_RANGE(MIDR_CORTEX_X4, 0, 3, 0xf),
> +		MIDR_REV_RANGE(MIDR_NEOVERSE_V3, 0, 2, 0xf),
> +		{}
> +	};
> +
> +	/* Does our cpu guarantee to never raise TLB conflict aborts? */
> +	if (!is_midr_in_range_list(supports_bbml2_noabort_list))
> +		return false;
> +
> +	/*
> +	 * We currently ignore the AA64_ID_MMFR2 register, and only care about

s/AA64_ID_MMFR2/ID_AA64MMFR2_EL1/

> +	 * whether the MIDR check passes. This is because we specifically
> +	 * care only about a stricter form of BBML2 (one guaranteeing noabort),
> +	 * and so the MMFR2 check is pointless (all implementations passing the
> +	 * MIDR check should also pass the MMFR2 check).

I think there's at least one implementation that behaves as
BBML2-noabort but does not have the ID field advertising BBML2.

> +	 */
> +
> +	return true;
> +}
> +
>  #ifdef CONFIG_ARM64_PAN
>  static void cpu_enable_pan(const struct arm64_cpu_capabilities *__unused)
>  {
> @@ -2980,6 +3015,11 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
>  		.matches = has_cpuid_feature,
>  		ARM64_CPUID_FIELDS(ID_AA64MMFR2_EL1, EVT, IMP)
>  	},
> +	{
> +		.capability = ARM64_HAS_BBML2_NOABORT,
> +		.type = ARM64_CPUCAP_EARLY_LOCAL_CPU_FEATURE,
> +		.matches = has_bbml2_noabort,
> +	},
>  	{
>  		.desc = "52-bit Virtual Addressing for KVM (LPA2)",
>  		.capability = ARM64_HAS_LPA2,
> diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
> index 10effd4cff6b..2bd2bfaeddcd 100644
> --- a/arch/arm64/tools/cpucaps
> +++ b/arch/arm64/tools/cpucaps
> @@ -45,6 +45,7 @@ HAS_LPA2
>  HAS_LSE_ATOMICS
>  HAS_MOPS
>  HAS_NESTED_VIRT
> +HAS_BBML2_NOABORT
>  HAS_PAN
>  HAS_PMUV3
>  HAS_S1PIE

Otherwise it looks fine.

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

