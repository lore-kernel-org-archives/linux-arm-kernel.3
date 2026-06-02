Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFC92CD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 09:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iOndO+2N7Yiw+5dLGk9DJX/TXgsj6y/c95Ng1CFjVJ0=; b=1k2A5khHfC5ogh+LKxsjMklkCD
	i/Sv4iKbccGuY6rVNbsXaCbbb+C8G6l5HL8vpzurbjExv5jx91ARrjv32u0zXCsvnwdudLe8kIK2A
	Yg95OJTDzBtMflUcvqUx3s1CuoF5F7JThUwahzPGwawKQjP3FSyM6u47XaWQIXeWK3ei7iSpsEhJk
	I/2wH2TR3nGUyU4A6rLHea6/JK02frwN1334CzsWHAsjk9c/+1TwGSMUOtBAcUPd5ZWp6Kx62KggC
	ONEGlssEQU5nKRO0tQ4W8o3cFeaUKtgpNVoyzglM8shE9Cm9R8FtMyAgZOuJfIMiXkNNTRlcH7T6/
	4CbycP3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wULLj-0000000CeJ7-13Kb;
	Tue, 02 Jun 2026 09:23:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wULLh-0000000CeI7-00q4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 09:23:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 40382176C;
	Tue,  2 Jun 2026 02:23:41 -0700 (PDT)
Received: from [10.1.25.162] (e121487-lin.cambridge.arm.com [10.1.25.162])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B93343F7D8;
	Tue,  2 Jun 2026 02:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780392226; bh=JYLwjXmYcxH3kk2e5lgXAWOwqnnPFbGyXbkuriopX9A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=rg/247HMSOTY/Xu7/CSwI4ntSc1V00Rbmo8U+L1q4BSnB7HUcfyOz4ovhKeZKj4mM
	 Knfw7QqOTl+ANiq4xJvDxZ4AIolP1pjplnnHkWoP/ngTTAXgn3B68Lbsv1eKPy1IXw
	 eUHSeFIXdYQv+HbmyEnzdN6gGRaQ8usuWSXP1cBU=
Message-ID: <701c88b1-c172-4fee-ba56-18bbe940016f@arm.com>
Date: Tue, 2 Jun 2026 10:23:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] arm64: cpufeature: Add WORKAROUND_DISABLE_CNP
 capability
To: Zeng Heng <zengheng@huaweicloud.com>, xuwei5@huawei.com,
 wangyushan12@huawei.com, yangyicong@hisilicon.com, maz@kernel.org,
 yeoreum.yun@arm.com, miko.lenczewski@arm.com, james.clark@linaro.org,
 corbet@lwn.net, skhan@linuxfoundation.org, kuninori.morimoto.gx@renesas.com,
 lucaswei@google.com, catalin.marinas@arm.com, broonie@kernel.org,
 lpieralisi@kernel.org, thuth@redhat.com, kevin.brodsky@arm.com,
 tongtiangen@huawei.com, oupton@kernel.org, ryan.roberts@arm.com,
 mark.rutland@arm.com, will@kernel.org, Sascha.Bischoff@arm.com
Cc: linux-arm-kernel@lists.infradead.org, wangkefeng.wang@huawei.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260601112000.1145391-1-zengheng@huaweicloud.com>
 <20260601112000.1145391-2-zengheng@huaweicloud.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <20260601112000.1145391-2-zengheng@huaweicloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_022349_277707_C5048D90 
X-CRM114-Status: GOOD (  18.41  )
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

On 6/1/26 12:19, Zeng Heng wrote:
> From: Zeng Heng <zengheng4@huawei.com>
> 
> The NVIDIA Carmel CNP erratum is not the only case requiring CNP to be
> disabled. Abstract this into a common WORKAROUND_DISABLE_CNP capability
> to facilitate adding errata for future chips and reduce duplicate
> checks in has_useable_cnp().
> 
> This serves as a prerequisite for the subsequent Hisilicon erratum
> 162100125.
> 
> Suggested-by: Vladimir Murzin <vladimir.murzin@arm.com>
> Signed-off-by: Zeng Heng <zengheng4@huawei.com>
> ---
>  arch/arm64/Kconfig               | 4 ++++
>  arch/arm64/include/asm/cpucaps.h | 4 ++--
>  arch/arm64/kernel/cpu_errata.c   | 4 ++--
>  arch/arm64/kernel/cpufeature.c   | 2 +-
>  arch/arm64/tools/cpucaps         | 2 +-
>  5 files changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index fe60738e5943..f297517a83b9 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -1315,9 +1315,13 @@ config QCOM_FALKOR_ERRATUM_E1041
> 
>  	  If unsure, say Y.
> 
> +config ARM64_WORKAROUND_DISABLE_CNP
> +	bool
> +
>  config NVIDIA_CARMEL_CNP_ERRATUM
>  	bool "NVIDIA Carmel CNP: CNP on Carmel semantically different than ARM cores"
>  	default y
> +	select ARM64_WORKAROUND_DISABLE_CNP
>  	help
>  	  If CNP is enabled on Carmel cores, non-sharable TLBIs on a core will not
>  	  invalidate shared TLB entries installed by a different core, as it would
> diff --git a/arch/arm64/include/asm/cpucaps.h b/arch/arm64/include/asm/cpucaps.h
> index d0d3cdd5763c..25c61cda901c 100644
> --- a/arch/arm64/include/asm/cpucaps.h
> +++ b/arch/arm64/include/asm/cpucaps.h
> @@ -58,8 +58,8 @@ cpucap_is_possible(const unsigned int cap)
>  		return IS_ENABLED(CONFIG_ARM64_ERRATUM_2658417);
>  	case ARM64_WORKAROUND_CAVIUM_23154:
>  		return IS_ENABLED(CONFIG_CAVIUM_ERRATUM_23154);
> -	case ARM64_WORKAROUND_NVIDIA_CARMEL_CNP:
> -		return IS_ENABLED(CONFIG_NVIDIA_CARMEL_CNP_ERRATUM);
> +	case ARM64_WORKAROUND_DISABLE_CNP:
> +		return IS_ENABLED(CONFIG_ARM64_WORKAROUND_DISABLE_CNP);
>  	case ARM64_WORKAROUND_REPEAT_TLBI:
>  		return IS_ENABLED(CONFIG_ARM64_WORKAROUND_REPEAT_TLBI);
>  	case ARM64_WORKAROUND_SPECULATIVE_SSBS:
> diff --git a/arch/arm64/kernel/cpu_errata.c b/arch/arm64/kernel/cpu_errata.c
> index 5377e4c2eba2..b0db946568b7 100644
> --- a/arch/arm64/kernel/cpu_errata.c
> +++ b/arch/arm64/kernel/cpu_errata.c
> @@ -801,11 +801,11 @@ const struct arm64_cpu_capabilities arm64_errata[] = {
>  				  1, 0),
>  	},
>  #endif
> -#ifdef CONFIG_NVIDIA_CARMEL_CNP_ERRATUM
> +#ifdef CONFIG_ARM64_WORKAROUND_DISABLE_CNP
>  	{
>  		/* NVIDIA Carmel */
>  		.desc = "NVIDIA Carmel CNP erratum",
> -		.capability = ARM64_WORKAROUND_NVIDIA_CARMEL_CNP,
> +		.capability = ARM64_WORKAROUND_DISABLE_CNP,
>  		ERRATA_MIDR_ALL_VERSIONS(MIDR_NVIDIA_CARMEL),
>  	},
>  #endif
> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> index 6d53bb15cf7b..20c5f24f74a9 100644
> --- a/arch/arm64/kernel/cpufeature.c
> +++ b/arch/arm64/kernel/cpufeature.c
> @@ -1785,7 +1785,7 @@ has_useable_cnp(const struct arm64_cpu_capabilities *entry, int scope)
>  	if (is_kdump_kernel())
>  		return false;
> 
> -	if (cpus_have_cap(ARM64_WORKAROUND_NVIDIA_CARMEL_CNP))
> +	if (cpus_have_cap(ARM64_WORKAROUND_DISABLE_CNP))
>  		return false;
> 
>  	return has_cpuid_feature(entry, scope);
> diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
> index 811c2479e82d..9b85a84f6fd4 100644
> --- a/arch/arm64/tools/cpucaps
> +++ b/arch/arm64/tools/cpucaps
> @@ -120,7 +120,7 @@ WORKAROUND_CAVIUM_TX2_219_PRFM
>  WORKAROUND_CAVIUM_TX2_219_TVM
>  WORKAROUND_CLEAN_CACHE
>  WORKAROUND_DEVICE_LOAD_ACQUIRE
> -WORKAROUND_NVIDIA_CARMEL_CNP
> +WORKAROUND_DISABLE_CNP
>  WORKAROUND_PMUV3_IMPDEF_TRAPS
>  WORKAROUND_QCOM_FALKOR_E1003
>  WORKAROUND_QCOM_ORYON_CNTVOFF
> --
> 2.43.0
> 

FWIW,

Reviewed-by: Vladimir Murzin <vladimir.murzin@arm.com>


