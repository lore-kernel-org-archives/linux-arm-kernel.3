Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CAC5C44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 06:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9K8UoPjxhDwKy1Cihj192TQjfLirc++Fc10GnOhJ7UE=; b=gUGwGp//Jf4eNhkVhSJrfXFmtk
	jsintid+1kb3WfEapidr1zQodaU2vz1TbtD25AMiX6Kfb6pwoxULuDDPGDyCuOyCM0/+GDVOU7HXM
	3olsaOvk3sl2QFd+Lvfz+8KLT66eotMwY8Jmr7cKtfDNZ+M/YVdm/AzBwhKTv47VrwQraGOxat4K4
	RsJVdPD3vfrzXHK51Emsk+xNrPJczroplc/TL/jqe6indBYm4owm2bZ5fp6J/cYEqiv6If9PEFElo
	0GI7xKq+LerqY2aQK9D0BDo+b+5J1V6ujBQxDOkSjkrsHvKoq0WOYRsvdcFqB+owXeVkT8CgjoYUK
	8H95Mj+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whhyj-000000017Lr-0Bu4;
	Thu, 09 Jul 2026 06:11:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whhyf-000000017L0-44Co
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 06:11:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0E8E524C0;
	Wed,  8 Jul 2026 23:11:12 -0700 (PDT)
Received: from [192.168.20.93] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9E23D3F7B4;
	Wed,  8 Jul 2026 23:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783577476; bh=itxWaBlqVRCmP2fYWMzcg4qz2935JTm2SC8Oi54uD1Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=icQinZeRKNzsPzk3/sSNE8qPqW9LFBFGtTPSElV0lnunbteAnCiDydJ4UBcBmtFa7
	 MSXv/CAhmLYPPJRAjRnQGessemvefVbaO8LLLV72R+KTDg/YQIIoU6o+IaQORCdmXy
	 JNuFaxk4S6O1hX6P+uR2HMPCD8fmbOi9gA6fFSbM=
Message-ID: <fcf60ce5-7e8c-431d-aea9-218da5445fb5@arm.com>
Date: Thu, 9 Jul 2026 01:11:13 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: topology: read CPPC FFH feedback counters
 in one operation
To: Pengjie Zhang <zhangpengjie2@huawei.com>, catalin.marinas@arm.com,
 will@kernel.org, rafael@kernel.org, lenb@kernel.org, saket.dumbre@intel.com,
 beata.michalska@arm.com, zhenglifeng1@huawei.com, sumitg@nvidia.com,
 zhanjie9@hisilicon.com, geert+renesas@glider.be, cuiyunhui@bytedance.com,
 vanshikonda@os.amperecomputing.com, ionela.voinescu@arm.com,
 viresh.kumar@linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
 acpica-devel@lists.linux.dev, linuxarm@huawei.com
Cc: prime.zeng@hisilicon.com, wanghuiqiang@huawei.com, xuwei5@huawei.com,
 lihuisong@huawei.com, yubowen8@huawei.com, wangzhi12@huawei.com
References: <20260708082818.808041-1-zhangpengjie2@huawei.com>
 <20260708082818.808041-3-zhangpengjie2@huawei.com>
Content-Language: en-US
From: Jeremy Linton <jeremy.linton@arm.com>
In-Reply-To: <20260708082818.808041-3-zhangpengjie2@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_231118_105150_E02CD85F 
X-CRM114-Status: GOOD (  22.03  )
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

On 7/8/26 3:28 AM, Pengjie Zhang wrote:
> arm64 implements CPPC FFH feedback-counter reads using AMU counters.
> Because those counters must be sampled on the target CPU, reading the
> delivered and reference counters separately widens the observation window
> between them.
> 
> Implement the paired FFH feedback-counter read hook on arm64 and sample
> both AMU counters together before decoding the requested CPC register
> values.
> 
> Also factor the FFH bitfield extraction logic into a helper and reuse
> it from the existing single-counter FFH read path.
> 
> Tested-by: Sumit Gupta <sumitg@nvidia.com>
> Reviewed-by: Sumit Gupta <sumitg@nvidia.com>
> Tested-by: Vanshidhar Konda <vanshikonda@os.amperecomputing.com>
> Reviewed-by: Vanshidhar Konda <vanshikonda@os.amperecomputing.com>
> Signed-off-by: Pengjie Zhang <zhangpengjie2@huawei.com>
> ---
>   arch/arm64/kernel/topology.c | 92 ++++++++++++++++++++++++++++++++----
>   1 file changed, 84 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
> index b32f13358fbb..d28438f8b83f 100644
> --- a/arch/arm64/kernel/topology.c
> +++ b/arch/arm64/kernel/topology.c
> @@ -373,6 +373,16 @@ core_initcall(init_amu_fie);
>   #ifdef CONFIG_ACPI_CPPC_LIB
>   #include <acpi/cppc_acpi.h>
>   
> +struct amu_ffh_ctrs {
> +	u64 corecnt;
> +	u64 constcnt;
> +};
> +
> +enum cpc_ffh_ctr_id {
> +	CPC_FFH_CTR_CORE  = 0x0,
> +	CPC_FFH_CTR_CONST = 0x1,
> +};
> +
>   static void cpu_read_corecnt(void *val)
>   {
>   	/*
> @@ -397,7 +407,7 @@ static void cpu_read_constcnt(void *val)
>   }
>   
>   static inline
> -int counters_read_on_cpu(int cpu, smp_call_func_t func, u64 *val)
> +int counters_read_on_cpu(int cpu, smp_call_func_t func, void *val)
>   {
>   	/*
>   	 * Abort call on counterless CPU.
> @@ -447,24 +457,90 @@ bool cpc_ffh_supported(void)
>   	return true;
>   }
>   
> +static void amu_read_core_const_ctrs(void *val)
> +{
> +	struct amu_ffh_ctrs *ctrs = val;
> +
> +	/*
> +	 * cpu_read_constcnt() incurs slight latency due to the
> +	 * ARM64_WORKAROUND_2457168 check. Read it first to minimize
> +	 * the sampling skew between the const and core counters.
> +	 */
> +	cpu_read_constcnt(&ctrs->constcnt);
> +	cpu_read_corecnt(&ctrs->corecnt);
> +}
> +
> +static u64 cpc_ffh_extract_bits(const struct cpc_reg *reg, u64 val)
> +{
> +	val &= GENMASK_ULL(reg->bit_offset + reg->bit_width - 1,
> +			   reg->bit_offset);
> +	val >>= reg->bit_offset;
> +
> +	return val;
> +}
> +
> +static void cpc_ffh_ctr_value(const struct cpc_reg *reg,
> +			      const struct amu_ffh_ctrs *ctrs, u64 *val)
> +{
> +	switch ((u64)reg->address) {
> +	case CPC_FFH_CTR_CORE:
> +		*val = ctrs->corecnt;
> +		break;
> +	case CPC_FFH_CTR_CONST:
> +		*val = ctrs->constcnt;
> +		break;
> +	}
> +
> +	*val = cpc_ffh_extract_bits(reg, *val);
> +}
> +
> +static bool is_amu_ctr_reg(const struct cpc_reg *reg)
> +{
> +	return reg->address == CPC_FFH_CTR_CORE ||
> +		reg->address == CPC_FFH_CTR_CONST;
> +}
> +
> +int cpc_read_ffh_fb_ctrs(int cpu, struct cpc_reg *reg1, u64 *val1,
> +			 struct cpc_reg *reg2, u64 *val2)
> +{
> +	struct amu_ffh_ctrs ctrs;
> +	int ret;
> +
> +	if (!is_amu_ctr_reg(reg1) || !is_amu_ctr_reg(reg2))
> +		return -EINVAL;
> +
> +	ret = counters_read_on_cpu(cpu, amu_read_core_const_ctrs, &ctrs);
> +	if (ret) {
> +		/*
> +		 * If AMU is unsupported (-EOPNOTSUPP), translate the error
> +		 * to -ENODEV. This explicitly tells the generic CPPC layer
> +		 * to abort immediately and avoid falling back to pointless
> +		 * single-counter reads.
> +		 */
> +		return ret == -EOPNOTSUPP ? -ENODEV : ret;
> +	}
> +
> +	cpc_ffh_ctr_value(reg1, &ctrs, val1);
> +	cpc_ffh_ctr_value(reg2, &ctrs, val2);
> +
> +	return 0;
> +}
> +
>   int cpc_read_ffh(int cpu, struct cpc_reg *reg, u64 *val)
>   {
>   	int ret = -EOPNOTSUPP;
>   
>   	switch ((u64)reg->address) {
> -	case 0x0:
> +	case CPC_FFH_CTR_CORE:
>   		ret = counters_read_on_cpu(cpu, cpu_read_corecnt, val);
>   		break;
> -	case 0x1:
> +	case CPC_FFH_CTR_CONST:
>   		ret = counters_read_on_cpu(cpu, cpu_read_constcnt, val);
>   		break;
>   	}
>   
> -	if (!ret) {
> -		*val &= GENMASK_ULL(reg->bit_offset + reg->bit_width - 1,
> -				    reg->bit_offset);
> -		*val >>= reg->bit_offset;
> -	}
> +	if (!ret)
> +		*val = cpc_ffh_extract_bits(reg, *val);
>   
>   	return ret;
>   }


So, more a nitpik that only applies if this set gets respun, but:

I don't think this FFH counter logic belongs in the arm64 topology.c 
file, its not really topology related.






