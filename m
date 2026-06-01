Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83062CD6E4C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 08:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DuybiQ/g1mzURYqU/R/u++5xvPmxYJh7gPDdhIv90d4=; b=KO0oq+ZHh3Dm7UpQNz/B5RjAzS
	YTbwtTlyWKO9LW2Hg1Y51uf75RQrHcftA/phVlmN2LOTTXziX9C1BMgTT1T5XaBipkXTmoggJSnh2
	dLR4iAicHDYEs7xudZMtmDiiu7OEXP/jSuJNKrRcRD2LNiP+E5G/KCLDpKwWMSJZUKL6WijdbJ1x+
	6ngyjR2yeyDdxsaFXrK8rMVqJJcnrkBBGDynu/1lLNceJie1JCX+mJJClhNbZ8Gx3GdP+a8+ZkROI
	yvtu49fsHWO+Dcr/mL9awUieshR+XooLG5x8jBTgZgdMKpv3lnNMeGSGvUn9z7OO3BjWD8VriRu8F
	PvY/wEzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTyLr-0000000AQZZ-0vYp;
	Mon, 01 Jun 2026 08:50:27 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTyLn-0000000AQXG-0CO3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 08:50:25 +0000
Received: from mail.maildlp.com (unknown [172.19.163.170])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4gTSMn3y26zYQv2d
	for <linux-arm-kernel@lists.infradead.org>; Mon,  1 Jun 2026 16:50:13 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id 7586E4056E
	for <linux-arm-kernel@lists.infradead.org>; Mon,  1 Jun 2026 16:50:16 +0800 (CST)
Received: from [10.174.179.37] (unknown [10.174.179.37])
	by APP1 (Coremail) with SMTP id cCh0CgB3ej_ERx1qVW7kAA--.45078S3;
	Mon, 01 Jun 2026 16:50:14 +0800 (CST)
Message-ID: <58ffd225-c9d0-b2f6-eefe-13c056746faa@huaweicloud.com>
Date: Mon, 1 Jun 2026 16:50:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2] arm64: kernel: Unify CNP disable workaround into
 ARM64_WORKAROUND_DISABLE_CNP
Content-Language: en-US
To: Vladimir Murzin <vladimir.murzin@arm.com>, xuwei5@huawei.com,
 wangyushan12@huawei.com, maz@kernel.org, skhan@linuxfoundation.org,
 miko.lenczewski@arm.com, lucaswei@google.com, broonie@kernel.org,
 thuth@redhat.com, ryan.roberts@arm.com, tongtiangen@huawei.com,
 oupton@kernel.org, kuninori.morimoto.gx@renesas.com, mark.rutland@arm.com,
 will@kernel.org, corbet@lwn.net, catalin.marinas@arm.com,
 kevin.brodsky@arm.com, lpieralisi@kernel.org, yangyicong@hisilicon.com,
 james.clark@linaro.org, yeoreum.yun@arm.com
Cc: linux-doc@vger.kernel.org, wangkefeng.wang@huawei.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260529063132.766491-1-zengheng@huaweicloud.com>
 <1e107eba-e28c-4fbf-80dc-808b8c3f4bb5@arm.com>
From: Zeng Heng <zengheng@huaweicloud.com>
In-Reply-To: <1e107eba-e28c-4fbf-80dc-808b8c3f4bb5@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: cCh0CgB3ej_ERx1qVW7kAA--.45078S3
X-Coremail-Antispam: 1UD129KBjvJXoWfJw4DKFykXFy7KF1UGw1UAwb_yoWDCF45pr
	13Jr43JF1UWF15JryUXw1UJr1Yyan3Gw1Ygr1UK340qr1YyryUAF48X34xZFWvqrykWr48
	JF1qkr15ZF1jyrDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9Ib4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6r1S6rWUM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7Mxk0xIA0c2IE
	e2xFo4CEbIxvr21lc7CjxVAaw2AFwI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4I
	kC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWU
	WwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr
	0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWU
	JVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJb
	IYCTnIWIevJa73UjIFyTuYvjxUIF4iUUUUU
X-CM-SenderInfo: p2hqwxhhqjqx5xdzvxpfor3voofrz/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_015023_457894_5E626ED0 
X-CRM114-Status: GOOD (  26.38  )
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

Hi Vladimir,

On 2026/5/29 17:17, Vladimir Murzin wrote:
> Hi,
>
> On 5/29/26 07:31, Zeng Heng wrote:
>> From: Zeng Heng <zengheng4@huawei.com>
>>
>> HiSilicon HIP09 implements TLB entry matching behavior that deviates
>> from the ARM architecture specification when the CnP (Common not Private)
>> bit is set in TTBRx_ELx.
>>
>> When TTBRx.CNP=1, TLB entries may be incorrectly shared between CPU
>> cores, leading to TLB conflicts and stale mappings. This breaks
>> coherency and can result in incorrect translations.
>>
>> Add the hardware erratum workaround (Hisilicon erratum 162100125) to
>> disable CNP on affected HIP09 cores.
>>
>> Merge the existing NVIDIA Carmel and the HiSilicon HIP09 CNP errata
>> workarounds into a single generic capability ARM64_WORKAROUND_DISABLE_CNP.
>>
>> Both NVIDIA Carmel and HiSilicon HIP09 have hardware errata where
>> CNP (Common Not Private) behavior differs from the ARM specification,
>> causing incorrect TLB entry sharing between cores. The existing
>> NVIDIA_CARMEL_CNP_ERRATUM and the newly added HISILICON_ERRATUM_162100125
>> are now both handled by the unified ARM64_WORKAROUND_DISABLE_CNP.
>>
>> Co-developed-by: Tong Tiangen <tongtiangen@huawei.com>
>> Signed-off-by: Tong Tiangen <tongtiangen@huawei.com>
>> Signed-off-by: Zeng Heng <zengheng4@huawei.com>
>> ---
>> v1: https://lore.kernel.org/all/20260526015720.206854-1-zengheng@huaweicloud.com/
>>
>> Changes in v2:
>>    - Unify CNP disable workaround into ARM64_WORKAROUND_DISABLE_CNP
>> ---
>>
>>   Documentation/arch/arm64/silicon-errata.rst |  4 +++-
>>   arch/arm64/Kconfig                          | 17 ++++++++++++-----
>>   arch/arm64/include/asm/cpucaps.h            |  4 ++--
>>   arch/arm64/kernel/cpu_errata.c              | 17 ++++++++++++-----
>>   arch/arm64/kernel/cpufeature.c              |  2 +-
>>   arch/arm64/tools/cpucaps                    |  2 +-
>>   6 files changed, 31 insertions(+), 15 deletions(-)
>>
>> diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
>> index 211119ce7adc..b4565e1a726d 100644
>> --- a/Documentation/arch/arm64/silicon-errata.rst
>> +++ b/Documentation/arch/arm64/silicon-errata.rst
>> @@ -254,7 +254,7 @@ stable kernels.
>>   | Marvell        | ARM-MMU-500     | #582743         | N/A                         |
>>   +----------------+-----------------+-----------------+-----------------------------+
>>   +----------------+-----------------+-----------------+-----------------------------+
>> -| NVIDIA         | Carmel Core     | N/A             | NVIDIA_CARMEL_CNP_ERRATUM   |
>> +| NVIDIA         | Carmel Core     | N/A             | ARM64_WORKAROUND_DISABLE_CNP|
>>   +----------------+-----------------+-----------------+-----------------------------+
>>   | NVIDIA         | T241 GICv3/4.x  | T241-FABRIC-4   | N/A                         |
>>   +----------------+-----------------+-----------------+-----------------------------+
>> @@ -284,6 +284,8 @@ stable kernels.
>>   +----------------+-----------------+-----------------+-----------------------------+
>>   | Hisilicon      | Hip09           | #162100801      | HISILICON_ERRATUM_162100801 |
>>   +----------------+-----------------+-----------------+-----------------------------+
>> +| Hisilicon      | Hip09           | #162100125      | ARM64_WORKAROUND_DISABLE_CNP|
>> ++----------------+-----------------+-----------------+-----------------------------+
>>   +----------------+-----------------+-----------------+-----------------------------+
>>   | Qualcomm Tech. | Kryo/Falkor v1  | E1003           | QCOM_FALKOR_ERRATUM_1003    |
>>   +----------------+-----------------+-----------------+-----------------------------+
>> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
>> index fe60738e5943..dc0bd32ea2d1 100644
>> --- a/arch/arm64/Kconfig
>> +++ b/arch/arm64/Kconfig
>> @@ -1315,13 +1315,20 @@ config QCOM_FALKOR_ERRATUM_E1041
>>
>>   	  If unsure, say Y.
>>
>> -config NVIDIA_CARMEL_CNP_ERRATUM
>> -	bool "NVIDIA Carmel CNP: CNP on Carmel semantically different than ARM cores"
>> +config ARM64_WORKAROUND_DISABLE_CNP
>> +	bool "Disable CNP on affected CPUs"
>>   	default y
>>   	help
>> -	  If CNP is enabled on Carmel cores, non-sharable TLBIs on a core will not
>> -	  invalidate shared TLB entries installed by a different core, as it would
>> -	  on standard ARM cores.
>> +	  This option disables the CNP (Common Not Private) feature on CPUs
>> +	  that have hardware errata affecting CNP behavior.
>> +
>> +	  On NVIDIA Carmel cores, CNP behaves differently than on standard ARM
>> +	  cores: non-shareable TLBIs on a core may not invalidate shared TLB
>> +	  entries installed by a different core.
>> +
>> +	  On Hisilicon HIP09 cores, TLB entries may be incorrectly shared
>> +	  between cores when TTBRx.CNP=1, leading to TLB conflicts and
>> +	  stale mappings.
>>
>>   	  If unsure, say Y.
>>
> I'm afraid we cannot swap one config with another. Instead, we need to follow
> established pattern for sharing workaround, something like
>
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 378e50fef247..68eb2993cfd3 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -1315,9 +1315,13 @@ config QCOM_FALKOR_ERRATUM_E1041
>   
>            If unsure, say Y.
>   
> +config ARM64_WORKAROUND_DISABLE_CNP
> +       bool
> +
>   config NVIDIA_CARMEL_CNP_ERRATUM
>          bool "NVIDIA Carmel CNP: CNP on Carmel semantically different than ARM cores"
>          default y
> +       select ARM64_WORKAROUND_DISABLE_CNP
>          help
>            If CNP is enabled on Carmel cores, non-sharable TLBIs on a core will not
>            invalidate shared TLB entries installed by a different core, as it would
>
>
> and related changes for generalisation of the workaround - that would to be patch 1/2.
>
> Then we can easily wire-up your errata with something like
>
> +config HISILICON_ERRATUM_162100125
> +       bool "Hisilicon erratum 162100125"
> +       default y
> +       select ARM64_WORKAROUND_DISABLE_CNP
> +       help
> +         On HiSilicon HIP09, TLB entry matching behavior when CNP
> +         (TTBRx.CNP=1) is enabled differs from the ARM architecture
> +         specification.
> +
> +         TLB entries may be incorrectly shared between CPUs, potentially
> +         causing TLB conflicts and stale mappings.
> +
> +         Disable CNP support for affected HiSilicon HIP09 cores.
> +
> +         If unsure, say Y.
>
> and related update in documentation and MIDR list - that would be patch 2/2
>
> Thanks
> Vladimir
>   
>> diff --git a/arch/arm64/include/asm/cpucaps.h b/arch/arm64/include/asm/cpucaps.h
>> index d0d3cdd5763c..25c61cda901c 100644
>> --- a/arch/arm64/include/asm/cpucaps.h
>> +++ b/arch/arm64/include/asm/cpucaps.h
>> @@ -58,8 +58,8 @@ cpucap_is_possible(const unsigned int cap)
>>   		return IS_ENABLED(CONFIG_ARM64_ERRATUM_2658417);
>>   	case ARM64_WORKAROUND_CAVIUM_23154:
>>   		return IS_ENABLED(CONFIG_CAVIUM_ERRATUM_23154);
>> -	case ARM64_WORKAROUND_NVIDIA_CARMEL_CNP:
>> -		return IS_ENABLED(CONFIG_NVIDIA_CARMEL_CNP_ERRATUM);
>> +	case ARM64_WORKAROUND_DISABLE_CNP:
>> +		return IS_ENABLED(CONFIG_ARM64_WORKAROUND_DISABLE_CNP);
>>   	case ARM64_WORKAROUND_REPEAT_TLBI:
>>   		return IS_ENABLED(CONFIG_ARM64_WORKAROUND_REPEAT_TLBI);
>>   	case ARM64_WORKAROUND_SPECULATIVE_SSBS:
>> diff --git a/arch/arm64/kernel/cpu_errata.c b/arch/arm64/kernel/cpu_errata.c
>> index 5377e4c2eba2..675cd059165c 100644
>> --- a/arch/arm64/kernel/cpu_errata.c
>> +++ b/arch/arm64/kernel/cpu_errata.c
>> @@ -394,6 +394,14 @@ static const struct arm64_cpu_capabilities qcom_erratum_1003_list[] = {
>>   };
>>   #endif
>>
>> +#ifdef CONFIG_ARM64_WORKAROUND_DISABLE_CNP
>> +static const struct midr_range cnp_erratum_cpus[] = {
>> +	MIDR_ALL_VERSIONS(MIDR_NVIDIA_CARMEL),
>> +	MIDR_ALL_VERSIONS(MIDR_HISI_HIP09),
>> +	{},
>> +};
>> +#endif
>> +
>>   #ifdef CONFIG_ARM64_WORKAROUND_CLEAN_CACHE
>>   static const struct midr_range workaround_clean_cache[] = {
>>   #if	defined(CONFIG_ARM64_ERRATUM_826319) || \
>> @@ -801,12 +809,11 @@ const struct arm64_cpu_capabilities arm64_errata[] = {
>>   				  1, 0),
>>   	},
>>   #endif
>> -#ifdef CONFIG_NVIDIA_CARMEL_CNP_ERRATUM
>> +#ifdef CONFIG_ARM64_WORKAROUND_DISABLE_CNP
>>   	{
>> -		/* NVIDIA Carmel */
>> -		.desc = "NVIDIA Carmel CNP erratum",
>> -		.capability = ARM64_WORKAROUND_NVIDIA_CARMEL_CNP,
>> -		ERRATA_MIDR_ALL_VERSIONS(MIDR_NVIDIA_CARMEL),
>> +		.desc = "NVIDIA Carmel CNP erratum, or Hisilicon erratum 162100125",
>> +		.capability = ARM64_WORKAROUND_DISABLE_CNP,
>> +		ERRATA_MIDR_RANGE_LIST(cnp_erratum_cpus),
>>   	},
>>   #endif
>>   #ifdef CONFIG_ARM64_WORKAROUND_TRBE_OVERWRITE_FILL_MODE
>> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
>> index 6d53bb15cf7b..20c5f24f74a9 100644
>> --- a/arch/arm64/kernel/cpufeature.c
>> +++ b/arch/arm64/kernel/cpufeature.c
>> @@ -1785,7 +1785,7 @@ has_useable_cnp(const struct arm64_cpu_capabilities *entry, int scope)
>>   	if (is_kdump_kernel())
>>   		return false;
>>
>> -	if (cpus_have_cap(ARM64_WORKAROUND_NVIDIA_CARMEL_CNP))
>> +	if (cpus_have_cap(ARM64_WORKAROUND_DISABLE_CNP))

Here, ARM64_WORKAROUND_DISABLE_CNP comes from arch/arm64/tools/cpucaps,
not from arch/arm64/Kconfig. Therefore, if we do not replace WORKAROUND_NVIDIA_CARMEL_CNP
in arch/arm64/tools/cpucaps, we will have to continue adding a redundant
WORKAROUND_DISABLE_CNP along with its corresponding redundant logic.

I prefer to keep CONFIG_ARM64_WORKAROUND_NVIDIA_CARMEL_CNP in arch/arm64/Kconfig
and replace WORKAROUND_NVIDIA_CARMEL_CNP in arch/arm64/tools/cpucaps.

I would like to confirm whether the above aligns with your expectations.


Best regards,
Zeng Heng


>>   		return false;
>>
>>   	return has_cpuid_feature(entry, scope);
>> diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
>> index 811c2479e82d..9b85a84f6fd4 100644
>> --- a/arch/arm64/tools/cpucaps
>> +++ b/arch/arm64/tools/cpucaps
>> @@ -120,7 +120,7 @@ WORKAROUND_CAVIUM_TX2_219_PRFM
>>   WORKAROUND_CAVIUM_TX2_219_TVM
>>   WORKAROUND_CLEAN_CACHE
>>   WORKAROUND_DEVICE_LOAD_ACQUIRE
>> -WORKAROUND_NVIDIA_CARMEL_CNP
>> +WORKAROUND_DISABLE_CNP
>>   WORKAROUND_PMUV3_IMPDEF_TRAPS
>>   WORKAROUND_QCOM_FALKOR_E1003
>>   WORKAROUND_QCOM_ORYON_CNTVOFF
>> --
>> 2.43.0
>>


