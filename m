Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70D21CA5FC1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 09:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UEh1z6iFfkfw88Q/QLYxESHyV/trjs0UV60z1XIOOyY=; b=cd68cB8k9PcBiOK2R3AHdUe4Rv
	OynFqIHJYSdCqED3LXw3VxTjNfcUtqvHtC2P8uU5oY2k0mt6B0zRhJjokW6NGBaAjlgdMzXrJhhB/
	n0QIC8GW2B/eO6voqiB7Hk7GQI9X7Dy99xPcsHm2VMGmjEbO33hcnKBbiPVSCJgE76e3bqE2fbvOQ
	AbWzJOIsqpqZb3A857ylObVoMrPq9cY+MjD2NuNx2pjIFVkM/FveAFO4B3fmRBVo3Vs3TKlqmHSHj
	MRaRP86OQ9V/g4IsuXttx7hzCHEaI5McWcd02wCfJyMzk5v8C6GZDihOBrvH+wqGrQcWf4dVtylop
	0i/B4qEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBqVP-00000005XzO-1Ze3;
	Wed, 30 Sep 2026 09:21:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBqVO-00000005XyM-1EMG
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Sep 2026 09:21:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=UEh1z6iFfkfw88Q/QLYxESHyV/trjs0UV60z1XIOOyY=; b=juF2l5Mc/4UIgcR4Ua36l/BU/f
	jyT5SU8YurFrPdwoy9VTNqLcAHgy1+wzcSog65dPYYwbbMSwRektOrUy85TEjrEU+/2ky516qhQkB
	faSvg3vH8FeRC/H3QuEXNaVAV3ge9M+RzwveTxFe7X6xFQs86aRwWQ0yVNc1KzLiTRSZxCcmPeL5g
	DLz2GyDMpj8s799R8BkctTBDfBy1t0nuoIg5KNf7KukA1ZopI7fbcx8JY0hFf2Gsv0sbXoi90bnE8
	sntYmrij0btDhjquYyUCfRXT5tYZZtNZ8uR3zIoZJ21VTbkSmQ1dYJQUjUh6KQTNHHUQBtoLbnscg
	8jDGOkDA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBqVK-00000003Zcp-2i3v
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 09:21:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C3E71497;
	Wed, 30 Sep 2026 02:21:28 -0700 (PDT)
Received: from [10.0.153.43] (e121487-lin.cambridge.arm.com [10.0.153.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5616B3F86F;
	Wed, 30 Sep 2026 02:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790760092; bh=d6yTqXDZhOEz9we6cNXyP24VemZKfMv7POyGBNQlwcU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=h+8QFzM4w9gi3u5t96OSpY/61lM5sCrDK/0CqPPDpsloZD1GtWO3wWQqUXQy6GZ5r
	 AAABp5Dyd8JeAVyNAfiBU+2CRKL0Gg8f+yygzdQZu8lVwQ6TQMMlLmo4VSQ605dGVk
	 Ii2Pte+7c23bDahQcInPeIbJ3JkxB7LKj6BTzC/M=
Message-ID: <0dc8a173-2d8f-4a05-9624-6d95c2fdb622@arm.com>
Date: Wed, 30 Sep 2026 10:21:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] arm64: errata: Factor out broken AMU const counter
 cap
To: Beata Michalska <beata.michalska@arm.com>,
 linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com, will@kernel.org, suzuki.poulose@arm.com,
 James.Morse@arm.com, xuewen.yan94@gmail.com, seanwang1@lenovo.com,
 linux-kernel@vger.kernel.org
References: <20260929154325.3416271-1-beata.michalska@arm.com>
 <20260929154325.3416271-2-beata.michalska@arm.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <20260929154325.3416271-2-beata.michalska@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_102135_222935_2A1F34C9 
X-CRM114-Status: GOOD (  24.48  )
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

Hi Beata,

On 9/29/26 16:42, Beata Michalska wrote:
> Move the workaround from the erratum 2457168-specific cpucap to a generic
> broken AMU constant-counter one. This keeps the existing Cortex-A510
> handling unchanged while allowing other errata with similar AMU constant
> counter issue to share the capability bit and call sites.
> 
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Beata Michalska <beata.michalska@arm.com>
> ---
>  arch/arm64/Kconfig             |  8 ++++++++
>  arch/arm64/kernel/cpu_errata.c | 23 +++++++++++++++++------
>  arch/arm64/kernel/cpufeature.c |  2 +-
>  arch/arm64/kernel/topology.c   |  7 ++++---
>  arch/arm64/tools/cpucaps       |  2 +-
>  5 files changed, 31 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index b5a51b0ef9440..3b6c052d46a18 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -1040,9 +1040,17 @@ config ARM64_ERRATUM_1902691
>  
>  	  If unsure, say Y.
>  
> +config ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT
> +	bool
> +	# Targeting errata affecting AMEVCNTR01, the AMU constant counter.
> +	# On affected CPUs the counter may not increment at the expected rate,
> +	# making it unreliable. As a result, AMU users should treat it as
> +	# unavailable rather than relying on misleading counter values.
> +
>  config ARM64_ERRATUM_2457168
>  	bool "Cortex-A510: 2457168: workaround for AMEVCNTR01 incrementing incorrectly"
>  	depends on ARM64_AMU_EXTN
> +	select ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT
>  	default y
>  	help
>  	  This option adds the workaround for ARM Cortex-A510 erratum 2457168.
> diff --git a/arch/arm64/kernel/cpu_errata.c b/arch/arm64/kernel/cpu_errata.c
> index 5db8f0619e4bc..f18683e56184b 100644
> --- a/arch/arm64/kernel/cpu_errata.c
> +++ b/arch/arm64/kernel/cpu_errata.c
> @@ -381,6 +381,18 @@ static const struct arm64_cpu_capabilities arm64_repeat_tlbi_list[] = {
>  };
>  #endif
>  
> +#ifdef CONFIG_ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT
> +static const struct arm64_cpu_capabilities arm64_repeat_amu_constcnt_list[] = {
                                                    ^^^^^^
                                           There is nothing to repeat :)

> +#ifdef CONFIG_ARM64_ERRATUM_2457168
> +	{
> +		/* Cortex-A510 r0p0-r1p1 */
> +		CAP_MIDR_RANGE(MIDR_CORTEX_A510, 0, 0, 1, 1)
> +	},
> +#endif
> +	{}
> +};
> +#endif /* CONFIG_ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT */
> +
>  #ifdef CONFIG_CAVIUM_ERRATUM_23154
>  static const struct midr_range cavium_erratum_23154_cpus[] = {
>  	MIDR_ALL_VERSIONS(MIDR_THUNDERX),
> @@ -916,14 +928,13 @@ const struct arm64_cpu_capabilities arm64_errata[] = {
>  		ERRATA_MIDR_REV_RANGE(MIDR_CORTEX_A510, 0, 0, 2)
>  	},
>  #endif
> -#ifdef CONFIG_ARM64_ERRATUM_2457168
> +#ifdef CONFIG_ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT
>  	{
> -		.desc = "ARM erratum 2457168",
> -		.capability = ARM64_WORKAROUND_2457168,
> +		.desc = "Broken AMU AMEVCNTR01 (const counter)",
> +		.capability = ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT,
>  		.type = ARM64_CPUCAP_WEAK_LOCAL_CPU_FEATURE,
> -
> -		/* Cortex-A510 r0p0-r1p1 */
> -		CAP_MIDR_RANGE(MIDR_CORTEX_A510, 0, 0, 1, 1)

I think it should be

                CAP_MIDR_RANGE_LIST(amu_broken_constcnt_cpus)

where amu_broken_constcnt_cpus is

static const struct midr_range amu_broken_constcnt_cpus[] = {
#ifdef CONFIG_ARM64_ERRATUM_2457168
       /* Cortex-A510 r0p0-r1p1 */
       MIDR_RANGE(MIDR_CORTEX_A510, 0, 0, 1, 1),
#endif
       {}
};

so in the next patch you would add new entry

#ifdef CONFIG_ARM64_ERRATUM_3821522
       /* Cortex-A725 r0p0 - r0p2 */
       MIDR_RANGE(MIDR_CORTEX_A725, 0, 0, 0, 2),
#endif


Cheers
Vladimir


