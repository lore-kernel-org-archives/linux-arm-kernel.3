Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7452AC43602
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 12:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S/hf+q9b0Imft89tr7ZBqATJk9FmRe3I1tT3paesQfw=; b=N1344n0/UVmDuOdqTByueXUKnB
	aa4P0TMqcBPuOGbfsArztAHfmSBfhseIC/BDBPrLbSAiQPpdXpF2D6EuI6poDJoL0umBPgqIG6T2L
	qo4R4iDKGMp8/SGCxuLrYlGjE8jogi22B8qDlu0bVdea+Y+q1fC15kJGU1rVWSJgfCeesmapuRc9r
	twS/q/eIMy25wrNFFA/gWrT+6QN1MkCJcp4Qx+g12OqJDSOlZbG4quW8U9qNV4UcxWTOHLrXnEndl
	gkkitNTYP9tlXVJ9qTmmAwVht0/s6q5ar+PX3TzzpFRI3g7VRLJrns1bLL1mTTAWe8zfvq1sCakFI
	eKPQK4aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wetxl-00000001yCV-3u8i;
	Wed, 01 Jul 2026 12:22:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wetxg-00000001xqU-1wc9
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 01 Jul 2026 12:22:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=S/hf+q9b0Imft89tr7ZBqATJk9FmRe3I1tT3paesQfw=; b=hqniTJo9l97WPUSlVzEXFVTp2/
	ELePwGBgW1HmdZUvHJrXhkyFXL/B3VzzUfQLDZWCtc1wvnThSpczAbulna92WRNlbvkadvUzUQhAz
	9QugwyrbcIH5ukacOxwkZWcPL3uQ6rQyhWrm3ubBG5rOs2N2URK8xCknaaDjte8sQr+GWzOGYIB+3
	H4P18PRKDhEdFumiL5Gm7ZnFoONWQ5pi5VMrsWMRasQg+njaV4o7aJ8TMsmOc6m9QoWaIbxDB0+Sc
	TweD8GeLOuWa2DX54BntoAPbktPda3CGs+q8Iwgg8esCOxPcgNl45EwhpdZbdB7M3UjljlypKlDll
	KUlvFm4Q==;
Received: from canpmsgout09.his.huawei.com ([113.46.200.224])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wetxZ-00000002k1j-3fRy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 12:22:39 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=S/hf+q9b0Imft89tr7ZBqATJk9FmRe3I1tT3paesQfw=;
	b=xhhPRLKApC1ymyEUY24zz+xLOawyLVoBkhRJmtUi1b/Em0d7SEFcndducAFvVeRZ32AyKx4MG
	Hr3IwQpojMuZ+5AsbcULwmdjJF3WWkfo/LJRBo4cgLUXUVHuKMoAqzzX0Cv8hJI2/B6LxkidA2m
	RlvwxoIk5TJe+7bltpy+nkk=
Received: from mail.maildlp.com (unknown [172.19.163.214])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4gqzRR0g5Tz1cyT2;
	Wed,  1 Jul 2026 20:12:35 +0800 (CST)
Received: from kwepemr200004.china.huawei.com (unknown [7.202.195.241])
	by mail.maildlp.com (Postfix) with ESMTPS id 68A0440580;
	Wed,  1 Jul 2026 20:21:43 +0800 (CST)
Received: from [10.67.121.62] (10.67.121.62) by kwepemr200004.china.huawei.com
 (7.202.195.241) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 1 Jul
 2026 20:21:42 +0800
Message-ID: <20631d1e-b7a0-4270-a69c-e07c420b1505@huawei.com>
Date: Wed, 1 Jul 2026 20:21:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: topology: read CPPC FFH feedback counters in
 one operation
To: Beata Michalska <beata.michalska@arm.com>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <rafael@kernel.org>,
	<lenb@kernel.org>, <robert.moore@intel.com>, <zhenglifeng1@huawei.com>,
	<zhanjie9@hisilicon.com>, <sumitg@nvidia.com>, <cuiyunhui@bytedance.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-acpi@vger.kernel.org>, <acpica-devel@lists.linux.dev>,
	<linuxarm@huawei.com>, <jonathan.cameron@huawei.com>,
	<prime.zeng@hisilicon.com>, <wanghuiqiang@huawei.com>, <xuwei5@huawei.com>,
	<lihuisong@huawei.com>, <yubowen8@huawei.com>, <wangzhi12@huawei.com>
References: <20260410094145.4132082-1-zhangpengjie2@huawei.com>
 <20260410094145.4132082-3-zhangpengjie2@huawei.com>
 <akNxo5HzHARnrCT1@arm.com>
From: Pengjie Zhang <zhangpengjie2@huawei.com>
In-Reply-To: <akNxo5HzHARnrCT1@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.121.62]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemr200004.china.huawei.com (7.202.195.241)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_132236_234669_1FD0CBB5 
X-CRM114-Status: GOOD (  23.37  )
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


On 6/30/2026 3:34 PM, Beata Michalska wrote:
> On Fri, Apr 10, 2026 at 05:41:45PM +0800, Pengjie Zhang wrote:
>> arm64 implements CPPC FFH feedback-counter reads using AMU counters.
>> Because those counters must be sampled on the target CPU, reading the
>> delivered and reference counters separately widens the observation window
>> between them.
>>
>> Implement the paired FFH feedback-counter read hook on arm64 and sample
>> both AMU counters together before decoding the requested CPC register
>> values.
>>
>> Also factor the FFH bitfield extraction logic into a helper and reuse
>> it from the existing single-counter FFH read path.
>>
>> Signed-off-by: Pengjie Zhang <zhangpengjie2@huawei.com>
>> ---
>>   arch/arm64/kernel/topology.c | 75 ++++++++++++++++++++++++++++++++----
>>   1 file changed, 67 insertions(+), 8 deletions(-)
>>
>> diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
>> index b32f13358fbb..b90a767b2a1f 100644
>> --- a/arch/arm64/kernel/topology.c
>> +++ b/arch/arm64/kernel/topology.c
>> @@ -50,6 +50,16 @@ struct amu_cntr_sample {
>>   	unsigned long	last_scale_update;
>>   };
>>   
>> +struct amu_ffh_ctrs {
>> +	u64 corecnt;
>> +	u64 constcnt;
>> +};
>> +
>> +enum cpc_ffh_ctr_id {
>> +	CPC_FFH_CTR_CORE  = 0x0,
>> +	CPC_FFH_CTR_CONST = 0x1,
>> +};
>> +
> Those should probably go under the #ifdef CONFIG_ACPI_CPPC_LIB section.

yes

>>   static DEFINE_PER_CPU_SHARED_ALIGNED(struct amu_cntr_sample, cpu_amu_samples);
>>   
>>   void update_freq_counters_refs(void)
>> @@ -397,7 +407,7 @@ static void cpu_read_constcnt(void *val)
>>   }
>>   
>>   static inline
>> -int counters_read_on_cpu(int cpu, smp_call_func_t func, u64 *val)
>> +int counters_read_on_cpu(int cpu, smp_call_func_t func, void *val)
>>   {
>>   	/*
>>   	 * Abort call on counterless CPU.
>> @@ -447,24 +457,73 @@ bool cpc_ffh_supported(void)
>>   	return true;
>>   }
>>   
>> +static void amu_read_core_const_ctrs(void *val)
>> +{
>> +	struct amu_ffh_ctrs *ctrs = val;
>> +
>> +	cpu_read_constcnt(&ctrs->constcnt);
>> +	cpu_read_corecnt(&ctrs->corecnt);
>> +}
>> +
>> +static u64 cpc_ffh_extract_bits(const struct cpc_reg *reg, u64 val)
>> +{
>> +	val &= GENMASK_ULL(reg->bit_offset + reg->bit_width - 1,
>> +			   reg->bit_offset);
>> +	val >>= reg->bit_offset;
>> +
>> +	return val;
>> +}
>> +
>> +static bool cpc_ffh_ctr_value(const struct cpc_reg *reg,
>> +			      const struct amu_ffh_ctrs *ctrs, u64 *val)
>> +{
>> +	switch ((u64)reg->address) {
>> +	case CPC_FFH_CTR_CORE:
>> +		*val = ctrs->corecnt;
>> +		break;
>> +	case CPC_FFH_CTR_CONST:
>> +		*val = ctrs->constcnt;
>> +		break;
>> +	default:
>> +		return false;
>> +	}
>> +
>> +	*val = cpc_ffh_extract_bits(reg, *val);
>> +	return true;
>> +}
>> +
>> +int cpc_read_ffh_fb_ctrs(int cpu, struct cpc_reg *reg1, u64 *val1,
>> +			 struct cpc_reg *reg2, u64 *val2)
>> +{
>> +	struct amu_ffh_ctrs ctrs;
>> +	int ret;
>> +
>> +	ret = counters_read_on_cpu(cpu, amu_read_core_const_ctrs, &ctrs);
>> +	if (ret)
>> +		return ret;
>> +
>> +	if (!cpc_ffh_ctr_value(reg1, &ctrs, val1) ||
>> +	    !cpc_ffh_ctr_value(reg2, &ctrs, val2))
>> +		return -EOPNOTSUPP;
> Right, so there might be an issues with that:
> If you return EOPNOTSUPP here, that would trigger reading the registers again,
> this time one by one. Is that intentional ?
> Also counters_read_on_cpu might also return EOPNOTSUPP, in which case trying
> again to read the counters is pointless.
>
> I'm not entirely sure I understand the condition itself though.
> This will fail if either of the requested registers in not really expected.
> And that should probably be verified upfront ?
>
>
> ---
> BR
> Beata

Right. The following code may be more appropriate.

static bool is_valid_cpc_ffh_reg(const struct cpc_reg *reg)
{
     return reg->address == CPC_FFH_CTR_CORE ||
         reg->address == CPC_FFH_CTR_CONST;
}

int cpc_read_ffh_fb_ctrs(int cpu, struct cpc_reg *reg1, u64 *val1,
              struct cpc_reg *reg2, u64 *val2)
{
     struct amu_ffh_ctrs ctrs;
     int ret;

     if (!is_valid_cpc_ffh_reg(reg1) || !is_valid_cpc_ffh_reg(reg2))
         return -EINVAL;

     ret = counters_read_on_cpu(cpu, amu_read_core_const_ctrs, &ctrs);
     if (ret)
         return ret == -EOPNOTSUPP ? -ENODEV : ret;

     cpc_ffh_ctr_value(reg1, &ctrs, val1);
     cpc_ffh_ctr_value(reg2, &ctrs, val2);

     return 0;
}

thanks,

    Pengjie

>> +
>> +	return 0;
>> +}
>> +
>>   int cpc_read_ffh(int cpu, struct cpc_reg *reg, u64 *val)
>>   {
>>   	int ret = -EOPNOTSUPP;
>>   
>>   	switch ((u64)reg->address) {
>> -	case 0x0:
>> +	case CPC_FFH_CTR_CORE:
>>   		ret = counters_read_on_cpu(cpu, cpu_read_corecnt, val);
>>   		break;
>> -	case 0x1:
>> +	case CPC_FFH_CTR_CONST:
>>   		ret = counters_read_on_cpu(cpu, cpu_read_constcnt, val);
>>   		break;
>>   	}
>>   
>> -	if (!ret) {
>> -		*val &= GENMASK_ULL(reg->bit_offset + reg->bit_width - 1,
>> -				    reg->bit_offset);
>> -		*val >>= reg->bit_offset;
>> -	}
>> +	if (!ret)
>> +		*val = cpc_ffh_extract_bits(reg, *val);
>>   
>>   	return ret;
>>   }
>> -- 
>> 2.33.0
>>

