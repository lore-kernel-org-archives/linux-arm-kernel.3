Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FFF2C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 14:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J89r7AvqyeIbrcgrXdArOfzh5yo/o2jaOib37mZOYIs=; b=U3aVT+9sK7/ypD4KrJHhGDEeG5
	ada0XIerR0jDdNfXWaF+VAGa7d4PoCSwOFkTqQCbzK5lV5CcNphiZmNigaaWnyPRSJBHHo/O7R4dU
	hoUZz0d0XJ2TIA6Jjw3I1WP8XJ4VPYhHlzPslUk9bhbnL8SSFxOHo1S1yCougvTU3YztSWkVFK6n3
	fDjxaXx61ol3pCUWs8bdDXZXeqeswBdeSRt8IRoE1q/qw35jdfGQmpfwv7lQ6ohXu/INY7PiYmEkM
	HZuczgwI/HSLRMlI9MP5619amSMx4mFztomTLM+n14SCAkPiL9xHqdNRkDT6+9MlLsmhoajOva4UO
	oK8aOjgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubgVF-00000005LG3-2zOX;
	Tue, 15 Jul 2025 14:19:29 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubfKX-000000059SA-2yAR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 13:04:23 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3a53359dea5so2862491f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Jul 2025 06:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752584660; x=1753189460; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J89r7AvqyeIbrcgrXdArOfzh5yo/o2jaOib37mZOYIs=;
        b=M4lF2+jKrAnLYdYRdaBf55R0QFPrDXsnn/obCChUBJYSPOkxvXZCFGwiMldf0hwKMk
         jCtQXC0xFQwggs2DU4XRoV3NgmQHl4enX1MMKa60HuTOPBq8OUFLCcTChPt+5yiSGjf8
         4srJ+ZuRbpqEeHRyZ3kWfnqNSR1HP2lNUkq8EyfgN46pb4i8Lv+kcYxD+2tZHvlE3buB
         XbtlrM1xLwK6xY3oRDNDKxYBZFqSHwJfrALAF2VEB4GV5wQkX0bboJnqb9LSH20GGRd6
         FO0C7DyyrbPDGXw34TrN3UcDwz2sr4TJ8h9IcEKB+OTZ9Y1HRIz/5VYCj8ZvE29oHZHI
         oeUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752584660; x=1753189460;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J89r7AvqyeIbrcgrXdArOfzh5yo/o2jaOib37mZOYIs=;
        b=qtacVvUTZpo5eKxUo3N0FVHj18cnwnC5YdT9c20VnBoHCLciYQiqRazKRCUc0e3yBa
         gdk43IVE+Q8w21NxG2mosTIusLN4rJ2qw3/yVvqsdfH03090HD2c8j/aKpuIkWpzkGT+
         fl+KbNxejcbN4M59S2xSLPDjf/xFEXMLJdKiksvqQ2MXU788CGXYeGgwOOsb7PyTSoB9
         m4UJ6xRG1xVwSjvlD9EmMCzfDgX6GNOh8Rk1MeoNNtqSMVoznYf1+AY5k2xtUxm0N73b
         HRslUVny9MG8AogvyDi8qu0o680zYRIbik1OhDLJCNddoScHC1u4NxmX1OW2GcLs1ISV
         aX+A==
X-Forwarded-Encrypted: i=1; AJvYcCUFEA4B7i4Cuy+WWvPw6KzgZeYP1y57phszpXu3udbnb+G2F+Lv3VTLKiZFUqzvAq2TI2idS94YOIVizf3DZsJO@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2AJvs8MBjcEcikBPIpP7wt7LhThZQdR5HKXkzp5ZRqPF8C8Sj
	aZp0Lpy0THyRZBPXZojKVm6pVTIJWKi8oajibmgd5EvV2JlCw2aR9yLRwIIXcbtUpWQ=
X-Gm-Gg: ASbGnctfhqODlCtwnryb6ABdseoGqdxpI+G+xSZnqhbe/eYan659CSOuO1mIgcVmdaf
	x8VkKb9ud2eaMVB+XeBBfbLZPXe8pWz2rtE/nSvmSszLgug2dCQg9n1Qf+v8eVa9v/PNfa9OQZ3
	XDpVUrZqDeUJLTeAK0IL6PrpBrXtVRdb1iBGZJSSEyIEfxWLEts/pZlXwaynDtpko3Mg8Ca7KmA
	erLHuO+rtX9pHVBHFhr5G79FJKHpIof6M389c2xAmVF9kUKqdrIlAiSB0Gm8ETmQKl23sR3zanp
	rTgqa+sJjQT1XabcrR3QPbTeKQ8gyIMoqshLTjboiKpBZuHPtzgPiQ26WrEmmj3frisPIETp/W/
	kWsnOZAOsHp8t0M44MqvHLuJNYE0=
X-Google-Smtp-Source: AGHT+IFtWJR4N1CKamdsyz9XjtkQHpkuQDX/87ZZ/cBBW4+sRrWYHFWFc00klxjEz4K5K+dv4kcPxw==
X-Received: by 2002:a05:6000:4612:b0:3a3:7ba5:960e with SMTP id ffacd0b85a97d-3b5f2e3e99dmr11999857f8f.59.1752584659975;
        Tue, 15 Jul 2025 06:04:19 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8e1e332sm15169687f8f.79.2025.07.15.06.04.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jul 2025 06:04:19 -0700 (PDT)
Message-ID: <7f51d4f9-7e08-49b5-ab43-8bc765bb2ca8@linaro.org>
Date: Tue, 15 Jul 2025 14:04:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/10] perf: arm_spe: Add support for filtering on data
 source
To: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Mark Rutland <mark.rutland@arm.com>, Jonathan Corbet <corbet@lwn.net>,
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Zenghui Yu <yuzenghui@huawei.com>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, leo.yan@arm.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org,
 kvmarm@lists.linux.dev
References: <20250605-james-perf-feat_spe_eft-v3-0-71b0c9f98093@linaro.org>
 <20250605-james-perf-feat_spe_eft-v3-7-71b0c9f98093@linaro.org>
 <aHUOig-kaRo15ZH5@willie-the-truck>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <aHUOig-kaRo15ZH5@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_060421_763880_B3FE2F39 
X-CRM114-Status: GOOD (  26.94  )
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



On 14/07/2025 3:04 pm, Will Deacon wrote:
> On Thu, Jun 05, 2025 at 11:49:05AM +0100, James Clark wrote:
>> SPE_FEAT_FDS adds the ability to filter on the data source of packets.
>> Like the other existing filters, enable filtering with PMSFCR_EL1.FDS
>> when any of the filter bits are set.
>>
>> Each bit maps to data sources 0-63 described by bits[0:5] in the data
>> source packet (although the full range of data source is 16 bits so
>> higher value data sources can't be filtered on). The filter is an OR of
>> all the bits, so for example setting bits 0 and 3 filters packets from
>> data sources 0 OR 3.
>>
>> Reviewed-by: Leo Yan <leo.yan@arm.com>
>> Tested-by: Leo Yan <leo.yan@arm.com>
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> ---
>>   drivers/perf/arm_spe_pmu.c | 31 +++++++++++++++++++++++++++++++
>>   1 file changed, 31 insertions(+)
>>
>> diff --git a/drivers/perf/arm_spe_pmu.c b/drivers/perf/arm_spe_pmu.c
>> index 9309b846f642..d04318411f77 100644
>> --- a/drivers/perf/arm_spe_pmu.c
>> +++ b/drivers/perf/arm_spe_pmu.c
>> @@ -87,6 +87,7 @@ struct arm_spe_pmu {
>>   #define SPE_PMU_FEAT_INV_FILT_EVT		(1UL << 6)
>>   #define SPE_PMU_FEAT_DISCARD			(1UL << 7)
>>   #define SPE_PMU_FEAT_EFT			(1UL << 8)
>> +#define SPE_PMU_FEAT_FDS			(1UL << 9)
>>   #define SPE_PMU_FEAT_DEV_PROBED			(1UL << 63)
>>   	u64					features;
>>   
>> @@ -232,6 +233,10 @@ static const struct attribute_group arm_spe_pmu_cap_group = {
>>   #define ATTR_CFG_FLD_inv_event_filter_LO	0
>>   #define ATTR_CFG_FLD_inv_event_filter_HI	63
>>   
>> +#define ATTR_CFG_FLD_data_src_filter_CFG	config4	/* PMSDSFR_EL1 */
>> +#define ATTR_CFG_FLD_data_src_filter_LO	0
>> +#define ATTR_CFG_FLD_data_src_filter_HI	63
>> +
>>   GEN_PMU_FORMAT_ATTR(ts_enable);
>>   GEN_PMU_FORMAT_ATTR(pa_enable);
>>   GEN_PMU_FORMAT_ATTR(pct_enable);
>> @@ -248,6 +253,7 @@ GEN_PMU_FORMAT_ATTR(float_filter);
>>   GEN_PMU_FORMAT_ATTR(float_filter_mask);
>>   GEN_PMU_FORMAT_ATTR(event_filter);
>>   GEN_PMU_FORMAT_ATTR(inv_event_filter);
>> +GEN_PMU_FORMAT_ATTR(data_src_filter);
>>   GEN_PMU_FORMAT_ATTR(min_latency);
>>   GEN_PMU_FORMAT_ATTR(discard);
>>   
>> @@ -268,6 +274,7 @@ static struct attribute *arm_spe_pmu_formats_attr[] = {
>>   	&format_attr_float_filter_mask.attr,
>>   	&format_attr_event_filter.attr,
>>   	&format_attr_inv_event_filter.attr,
>> +	&format_attr_data_src_filter.attr,
>>   	&format_attr_min_latency.attr,
>>   	&format_attr_discard.attr,
>>   	NULL,
>> @@ -286,6 +293,9 @@ static umode_t arm_spe_pmu_format_attr_is_visible(struct kobject *kobj,
>>   	if (attr == &format_attr_inv_event_filter.attr && !(spe_pmu->features & SPE_PMU_FEAT_INV_FILT_EVT))
>>   		return 0;
>>   
>> +	if (attr == &format_attr_data_src_filter.attr && !(spe_pmu->features & SPE_PMU_FEAT_FDS))
>> +		return 0;
>> +
>>   	if ((attr == &format_attr_branch_filter_mask.attr ||
>>   	     attr == &format_attr_load_filter_mask.attr ||
>>   	     attr == &format_attr_store_filter_mask.attr ||
>> @@ -406,6 +416,9 @@ static u64 arm_spe_event_to_pmsfcr(struct perf_event *event)
>>   	if (ATTR_CFG_GET_FLD(attr, inv_event_filter))
>>   		reg |= PMSFCR_EL1_FnE;
>>   
>> +	if (ATTR_CFG_GET_FLD(attr, data_src_filter))
>> +		reg |= PMSFCR_EL1_FDS;
> 
> Is the polarity correct here? The description of PMSDSFR_EL1.S<m> suggests
> that setting bits to 1 _excludes_ the FDS filtering.
> 

Setting filter bits to 1 means that samples matching are included. 
Setting bits to 0 means that they are excluded. And PMSFCR_EL1.FDS 
enables filtering as a whole, so if the user sets any filter bit to 1 we 
want to enable filtering:

   PMSDSFR_EL1.S<m>

   0b0  If PMSFCR_EL1.FDS is 1, do not record load operations that have
        bits [5:0] of the Data Source packet set to <m>.

   0b1  Load operations with Data Source <m> are unaffected by
        PMSFCR_EL1.FDS.

I think it's all the right way around and it ends up being the same as 
the other filters in SPE. Because we're using any bit being set to 
enable the filtering, the only thing you can't do is enable filtering 
with a 0 filter, but I didn't think that was useful. See the previous 
discussion on this here: 
https://lore.kernel.org/all/5752f039-51c1-4452-b5df-03ff06da7be3@linaro.org/

Reading the "Data source filtering" section in the docs change at the 
end might help too.

>>   	if (ATTR_CFG_GET_FLD(attr, min_latency))
>>   		reg |= PMSFCR_EL1_FL;
>>   
>> @@ -430,6 +443,12 @@ static u64 arm_spe_event_to_pmslatfr(struct perf_event *event)
>>   	return FIELD_PREP(PMSLATFR_EL1_MINLAT, ATTR_CFG_GET_FLD(attr, min_latency));
>>   }
>>   
>> +static u64 arm_spe_event_to_pmsdsfr(struct perf_event *event)
>> +{
>> +	struct perf_event_attr *attr = &event->attr;
>> +	return ATTR_CFG_GET_FLD(attr, data_src_filter);
>> +}
>> +
>>   static void arm_spe_pmu_pad_buf(struct perf_output_handle *handle, int len)
>>   {
>>   	struct arm_spe_pmu_buf *buf = perf_get_aux(handle);
>> @@ -788,6 +807,10 @@ static int arm_spe_pmu_event_init(struct perf_event *event)
>>   	if (arm_spe_event_to_pmsnevfr(event) & arm_spe_pmsevfr_res0(spe_pmu->pmsver))
>>   		return -EOPNOTSUPP;
>>   
>> +	if (arm_spe_event_to_pmsdsfr(event) &&
>> +	    !(spe_pmu->features & SPE_PMU_FEAT_FDS))
>> +		return -EOPNOTSUPP;
> 
> Same question here.
> 
> Will




