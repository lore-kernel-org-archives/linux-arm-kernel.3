Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DC93CD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 12:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GjFgISZ1WjOIRfoU8ZABnyN4waAz+1VlS0VreTIPFl0=; b=im8KOFrhZUZfcMrU0XAQypWvRn
	wkuGTn3Y0z0aV7FcQTNP3Z8cOmPQSZSWcExRk0uVJeAds729GGG2HInEllb2Ko+Dy13uP8iuWTHYn
	vdhkpcJ6d7+dNxzdKJqUIyXWAogP5uaUc83BVV2aNbk6iqmLtIRF8Q5fx/JVnBh6NDFrMCHuSNPOs
	DW6/BodP+z3Z43B3S1N2rCvV8wMI0uACfITW2uCThrKI9xdj/4fwDbBwPky6EHb4qBz8RbZXT2pEJ
	c0wfoRn0wosygEh7fsx2wI7bt/9W5wyE4EZqhT27fctG/lJ8R/fOY578GpOZ+UjFTe/BM1BRmb2Ee
	1pml8SDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRqcE-00000001sxw-06qo;
	Tue, 26 May 2026 12:10:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRqcB-00000001sxQ-2gK0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 12:10:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C7AE9169C;
	Tue, 26 May 2026 05:10:23 -0700 (PDT)
Received: from [10.1.28.159] (e121487-lin.cambridge.arm.com [10.1.28.159])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5ACF93F7B4;
	Tue, 26 May 2026 05:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779797428; bh=PX7NDHB2FxC4BlZEAVWkuMN5ig+djh8Bm6MPl/nYDrY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=W+5PiR20FnaW9O6awOHd9A9ukfUevZlrG3yMKTBGK6pHIUJtipn5nFusQe1s0UL3t
	 Sm9wRFPc+Qi7V02YabfKtpXduAzL0u+xiHK4ylfDrdz3tuArkrXghYahFtrgM5EfHV
	 t3Z+kaMLMJlzx43oqGM4djuZsQkmOIqnhOfSyuSg=
Message-ID: <3e7d5472-9c40-456c-876e-c2e71fa0e8fa@arm.com>
Date: Tue, 26 May 2026 13:10:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: kernel: Disable CNP on HiSilicon HIP09
To: Zeng Heng <zengheng@huaweicloud.com>, corbet@lwn.net,
 kuninori.morimoto.gx@renesas.com, maz@kernel.org, oupton@kernel.org,
 catalin.marinas@arm.com, lucaswei@google.com, yeoreum.yun@arm.com,
 skhan@linuxfoundation.org, james.clark@linaro.org, broonie@kernel.org,
 mark.rutland@arm.com, lpieralisi@kernel.org, ryan.roberts@arm.com,
 will@kernel.org, tongtiangen@huawei.com, kevin.brodsky@arm.com,
 yangyicong@hisilicon.com, miko.lenczewski@arm.com
Cc: linux-doc@vger.kernel.org, wangkefeng.wang@huawei.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260526015720.206854-1-zengheng@huaweicloud.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <20260526015720.206854-1-zengheng@huaweicloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_051031_885116_E16B9D1E 
X-CRM114-Status: GOOD (  22.33  )
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

Hi,

On 5/26/26 02:57, Zeng Heng wrote:
> From: Tong Tiangen <tongtiangen@huawei.com>
> 
> HiSilicon HIP09 implements TLB entry matching behavior that deviates
> from the ARM architecture specification when the CNP (Common not Private)
> bit is set in TTBRx_ELx.
> 
> When TTBRx.CNP=1, TLB entries may be incorrectly shared between CPU
> cores, leading to TLB conflicts and stale mappings. This affects
> coherency and can result in incorrect translations.
> 
> Add the hardware erratum workaround (Hisilicon erratum 162100125) to
> disable CNP on affected HIP09 cores.
> 
> Signed-off-by: Tong Tiangen <tongtiangen@huawei.com>
> Signed-off-by: Zeng Heng <zengheng4@huawei.com>
> ---
>  Documentation/arch/arm64/silicon-errata.rst |  2 ++
>  arch/arm64/Kconfig                          | 15 +++++++++++++++
>  arch/arm64/kernel/cpu_errata.c              |  7 +++++++
>  arch/arm64/kernel/cpufeature.c              |  3 ++-
>  arch/arm64/tools/cpucaps                    |  1 +
>  5 files changed, 27 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
> index 211119ce7adc..cd50059edb85 100644
> --- a/Documentation/arch/arm64/silicon-errata.rst
> +++ b/Documentation/arch/arm64/silicon-errata.rst
> @@ -284,6 +284,8 @@ stable kernels.
>  +----------------+-----------------+-----------------+-----------------------------+
>  | Hisilicon      | Hip09           | #162100801      | HISILICON_ERRATUM_162100801 |
>  +----------------+-----------------+-----------------+-----------------------------+
> +| Hisilicon      | Hip09           | #162100125      | HISILICON_ERRATUM_162100125 |
> ++----------------+-----------------+-----------------+-----------------------------+
>  +----------------+-----------------+-----------------+-----------------------------+
>  | Qualcomm Tech. | Kryo/Falkor v1  | E1003           | QCOM_FALKOR_ERRATUM_1003    |
>  +----------------+-----------------+-----------------+-----------------------------+
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index fe60738e5943..ed6207c75b54 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -1273,6 +1273,21 @@ config HISILICON_ERRATUM_162100801
>  
>  	  If unsure, say Y.
>  
> +config HISILICON_ERRATUM_162100125
> +	bool "Hisilicon erratum 162100125"
> +	default y
> +	help
> +	  On HiSilicon HIP09, TLB entry matching behavior when CNP
> +	  (TTBRx.CNP=1) is enabled differs from the ARM architecture
> +	  specification.
> +
> +	  TLB entries may be incorrectly shared between CPUs, potentially
> +	  causing TLB conflicts and stale mappings.
> +
> +	  Disable CNP support for affected HiSilicon HIP09 cores.
> +
> +	  If unsure, say Y.
> +
>  config QCOM_FALKOR_ERRATUM_1003
>  	bool "Falkor E1003: Incorrect translation due to ASID change"
>  	default y
> diff --git a/arch/arm64/kernel/cpu_errata.c b/arch/arm64/kernel/cpu_errata.c
> index 5377e4c2eba2..26d9677a20fc 100644
> --- a/arch/arm64/kernel/cpu_errata.c
> +++ b/arch/arm64/kernel/cpu_errata.c
> @@ -968,6 +968,13 @@ const struct arm64_cpu_capabilities arm64_errata[] = {
>  		.matches = has_impdef_pmuv3,
>  		.cpu_enable = cpu_enable_impdef_pmuv3_traps,
>  	},
> +#ifdef CONFIG_HISILICON_ERRATUM_162100125
> +	{
> +		.desc = "Hisilicon erratum 162100125",
> +		.capability = ARM64_WORKAROUND_HISILICON_ERRATUM_162100125,
> +		ERRATA_MIDR_ALL_VERSIONS(MIDR_HISI_HIP09),
> +	},
> +#endif
>  	{
>  	}
>  };
> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> index 6d53bb15cf7b..c4b0db77a58a 100644
> --- a/arch/arm64/kernel/cpufeature.c
> +++ b/arch/arm64/kernel/cpufeature.c
> @@ -1785,7 +1785,8 @@ has_useable_cnp(const struct arm64_cpu_capabilities *entry, int scope)
>  	if (is_kdump_kernel())
>  		return false;
>  
> -	if (cpus_have_cap(ARM64_WORKAROUND_NVIDIA_CARMEL_CNP))
> +	if (cpus_have_cap(ARM64_WORKAROUND_NVIDIA_CARMEL_CNP) ||
> +	    cpus_have_cap(ARM64_WORKAROUND_HISILICON_ERRATUM_162100125))
>  		return false;

Since we now have a second user for this workaround, would it
make sense to:
1. factor out the existing ARM64_WORKAROUND_NVIDIA_CARMEL_CNP into a common capability,
   for example ARM64_WORKAROUND_DISABLE_CNP
2. wire up erratum 162100125 to use the common ARM64_WORKAROUND_DISABLE_CNP capability?

Cheers
Vladimir

>  
>  	return has_cpuid_feature(entry, scope);
> diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
> index 811c2479e82d..b797d4893adc 100644
> --- a/arch/arm64/tools/cpucaps
> +++ b/arch/arm64/tools/cpucaps
> @@ -128,3 +128,4 @@ WORKAROUND_REPEAT_TLBI
>  WORKAROUND_SPECULATIVE_AT
>  WORKAROUND_SPECULATIVE_SSBS
>  WORKAROUND_SPECULATIVE_UNPRIV_LOAD
> +WORKAROUND_HISILICON_ERRATUM_162100125
> -- 2.43.0
> 


