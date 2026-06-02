Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B576ACD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 09:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Iuu1Z6lWzhKiUJpXTyC7Fvs2sexhgmfYnXKlxVE25As=; b=vhEnsPi3SBNpgep8JuGroqeWNo
	CNoq1iYXZ3kpgqvDv1zVj3m+ESHR9/KK2ON52QUEKubJqpBYdbqv9fr8QZDmXMT6xlLP5wG6tT+xU
	hcyDC7Euc/0U9BWP7yN5/o8c4bduNcw0i7ltVA49SOClF4H3y0Q+Uqrd0i8X6kR3psmUJnU+PlXOs
	PgyGFfLBldojwUPOHP9PHQKNww0b7gaaKdRn78aegp6F2bj0oQQOiGiHmt8ddniA/36rV1oEJBOzS
	F1PldPa1w27S29lddfYirFkmqhKSCTpN27QslAAyD6rAbRBKVYzOJ5wkflBgE0gu+AeHaT5tnxPE6
	XMP9ImHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wULM5-0000000CeMN-1le9;
	Tue, 02 Jun 2026 09:24:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wULM3-0000000CeLx-0tRE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 09:24:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 34B80176C;
	Tue,  2 Jun 2026 02:24:05 -0700 (PDT)
Received: from [10.1.25.162] (e121487-lin.cambridge.arm.com [10.1.25.162])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2A82D3F7D8;
	Tue,  2 Jun 2026 02:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780392250; bh=kURsakSarcl//H2lXUzaloTxQoTNSvHm76NHoueoSPA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UgQP5zO7KBi6zVGpIAGZ1VsGduXv8Mu5uoHno/xmOJn2v8gh1qYsu1ECLNUhHrATt
	 BZsiNBQEtc/CN54Pxd1hACgHSB8jaE2VcuN/mCtI5+bGMjZ1tdwka+taPxXpBGUttH
	 EzhSzh8WYnXyxvpv5RaT8z7SFnbvAPPt1pPRV7UU=
Message-ID: <0b4cae62-bb4a-4b2c-af4e-0f9d7077961a@arm.com>
Date: Tue, 2 Jun 2026 10:24:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: kernel: Disable CNP on HiSilicon HIP09
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
 <20260601112000.1145391-3-zengheng@huaweicloud.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <20260601112000.1145391-3-zengheng@huaweicloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_022411_339554_B75C3EB8 
X-CRM114-Status: GOOD (  19.96  )
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

On 6/1/26 12:20, Zeng Heng wrote:
> From: Zeng Heng <zengheng4@huawei.com>
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
> Co-developed-by: Tong Tiangen <tongtiangen@huawei.com>
> Signed-off-by: Tong Tiangen <tongtiangen@huawei.com>
> Signed-off-by: Zeng Heng <zengheng4@huawei.com>
> ---
>  Documentation/arch/arm64/silicon-errata.rst |  2 ++
>  arch/arm64/Kconfig                          | 16 ++++++++++++++++
>  arch/arm64/kernel/cpu_errata.c              | 13 ++++++++++---
>  3 files changed, 28 insertions(+), 3 deletions(-)
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
> index f297517a83b9..75638e37883d 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -1273,6 +1273,22 @@ config HISILICON_ERRATUM_162100801
> 
>  	  If unsure, say Y.
> 
> +config HISILICON_ERRATUM_162100125
> +	bool "Hisilicon erratum 162100125"
> +	default y
> +	select ARM64_WORKAROUND_DISABLE_CNP
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
> index b0db946568b7..02e0ee5c948c 100644
> --- a/arch/arm64/kernel/cpu_errata.c
> +++ b/arch/arm64/kernel/cpu_errata.c
> @@ -608,6 +608,14 @@ static const struct midr_range erratum_ac04_cpu_23_list[] = {
>  };
>  #endif
> 
> +#ifdef CONFIG_ARM64_WORKAROUND_DISABLE_CNP
> +static const struct midr_range cnp_erratum_cpus[] = {
> +	MIDR_ALL_VERSIONS(MIDR_NVIDIA_CARMEL),
> +	MIDR_ALL_VERSIONS(MIDR_HISI_HIP09),
> +	{},
> +};
> +#endif
> +
>  const struct arm64_cpu_capabilities arm64_errata[] = {
>  #ifdef CONFIG_ARM64_WORKAROUND_CLEAN_CACHE
>  	{
> @@ -803,10 +811,9 @@ const struct arm64_cpu_capabilities arm64_errata[] = {
>  #endif
>  #ifdef CONFIG_ARM64_WORKAROUND_DISABLE_CNP
>  	{
> -		/* NVIDIA Carmel */
> -		.desc = "NVIDIA Carmel CNP erratum",
> +		.desc = "NVIDIA Carmel CNP erratum, or Hisilicon erratum 162100125",
>  		.capability = ARM64_WORKAROUND_DISABLE_CNP,
> -		ERRATA_MIDR_ALL_VERSIONS(MIDR_NVIDIA_CARMEL),
> +		ERRATA_MIDR_RANGE_LIST(cnp_erratum_cpus),
>  	},
>  #endif
>  #ifdef CONFIG_ARM64_WORKAROUND_TRBE_OVERWRITE_FILL_MODE
> --
> 2.43.0
> 

FWIW,

Reviewed-by: Vladimir Murzin <vladimir.murzin@arm.com>


