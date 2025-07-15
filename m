Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A641FC83F21
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 13:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BxsrGe+jWlI7ei+mJSfCZ9EexVILMiT2YG/yR5weNV8=; b=4DoItbYoWyFupmW0A2kpjeO9eo
	u/u2X316c/Lv5L9D2bKArFt2iHX7lJyumXe1DYZ7pkawhAwoCUh1nVKb0wVJoSrIcZyeBAT6ofKaO
	25dGS/2CgcmY7KpsDoarktXpQSsIzPePOBi809UsQbHC2yg8r3hZW6xJvWZ+3lPHPE6HEQ72VCKLF
	+yzA00WZhZfxtwtAjoaTf3rMFkOEUHUYfsY6MWymq08EKj5jy0rkuMYX+FqukwkeUIKhlw2OBcr3p
	8wSEztsRWznIzs90F8jAM36qKyJCFqucSTpXmLjOicdkk0LhaHnNF3JFxj3yqpRsUy/wxOq4C1lop
	tsrWd78g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubg2P-00000005Gb8-3fWd;
	Tue, 15 Jul 2025 13:49:41 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubew5-000000055oQ-2PGE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 12:39:07 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4537edf2c3cso56297365e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Jul 2025 05:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752583144; x=1753187944; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BxsrGe+jWlI7ei+mJSfCZ9EexVILMiT2YG/yR5weNV8=;
        b=ZOUjWqWZLwyhd+EZlRiGM012wutbMxQLFHA3a+l2H8k0JyiWi7JRm5J/dHj4C8owAL
         YKa8/sM7+vw2b+ikHXejzhck1DBqQU+qIOPzBgd1tZuo3z2IhjOt5Mmx7vtAi6GUzrGd
         aGc9xubYpvtVx1aMkSs46Oe5Pqe7w+IMRVeIdOUDRjSfVnvmGXcqZxGP7OIpHBS9bU4b
         oVWJl3XURdt9Ca8N76+HI222hC/z0sZ4+7tkgWUuVBXpZ2qfJhZti56RTvz7nEHaaV+x
         NopRbD0RyTOo0BTSHri+rlXmc4Pq1W2Xl49Yjib9aoRfazTa8L++0CCR5SLfZmpjQrfj
         cNYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752583144; x=1753187944;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BxsrGe+jWlI7ei+mJSfCZ9EexVILMiT2YG/yR5weNV8=;
        b=AcmD947pwWzAfE5Rl6o+5ZMYcga3sNmyo99J1FWHyDT0CfFKcldCv3wmOZZnZm9Uyw
         t/7jewaCFNRvwWpW/aJ0qITNddixrrbmOX1X59hNmiUnyZtM8b0CDVYngTjstwCUWacn
         PHxc76/hL7BqYSwijsh8zhBLXvbuiRQXWm0+F9VnPkBIMgEj2UlwXhnVBm2hZgfmS5ou
         H43dvTJH+lL8RPS/3PRCwrGpvO0MT4kcOEJqXbwx9tka7VKpK7g93OrGi6sHMdxuklLJ
         ngcMr1uikYW3axBCx02KWHEAUE6hRuuUnzP0YGKpotZ0pwT2V1SLCnB3D7f0HYAO8FaY
         uUrw==
X-Forwarded-Encrypted: i=1; AJvYcCWsZwKnPCtg/GKcpRP6oc7Bs1QKpgQTFcBKt8oyvJN2NCrknPqvagPgnfysggBoMt4zvEtzQ8mU3YcoPKBHnKL6@lists.infradead.org
X-Gm-Message-State: AOJu0YxKNgZx81TYN3PZ0aUdzS2SmIQ5UiAotS7TxlDNz1w/WSXrRbuS
	0Gd4TWSh8JtgmnKypUuc/VGEctkz2ekyd8/CNMNwUCtRYNnYAI2s02DnNLshNn0vFrw=
X-Gm-Gg: ASbGncsXfdu4/Zod4qzGPya7i12wQyWARTdIELB8iwtmuimeOzHO4vnbnrytHdMEwRV
	dPN2D/AIbeeAjzoBl6qO8G35GaphvRW3buz/PenUlKuIpHxPP9+NYr34Qm3rotN0qp98YkRRxqb
	d03Y1VZbT7hvs1UbLPygso87cF7hH4xLtVnQ6SdkNpEoQr8ZotmFkQiuIbkk6PMFBIjoWCsdSgz
	Ww5u1Hbv6RsQzBv6UwkGxRrpdxcJaUsLwKMsOaNMJkI4Z02xanJDDIiNSmttX6PnE4rIK/7JI+G
	0v+rrj0g0xkHTXcj3MPNwDEdqh3VzfB9ne86+AMm8Z7IAEgUEj003uH0XSjISTwx4pBVllfq1KY
	ctsSrm7ZFL/gxNzzkn6HddZvZ0SE=
X-Google-Smtp-Source: AGHT+IFZyO/97ZoKUOVFH8OyN68wvADyUqzMBItZPtLXzxAkrQ4eexLf8b74z76VvOxoD7DUY+oEPA==
X-Received: by 2002:a05:600c:3b84:b0:442:e9eb:cba2 with SMTP id 5b1f17b1804b1-456270595f5mr29377695e9.0.1752583143968;
        Tue, 15 Jul 2025 05:39:03 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45615a4551bsm72818305e9.37.2025.07.15.05.39.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jul 2025 05:39:03 -0700 (PDT)
Message-ID: <c804f4bf-3257-4e6a-b95b-ce6768854521@linaro.org>
Date: Tue, 15 Jul 2025 13:39:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/10] perf: arm_spe: Add support for FEAT_SPE_EFT
 extended filtering
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
 <20250605-james-perf-feat_spe_eft-v3-3-71b0c9f98093@linaro.org>
 <aHUKKPySsJ4ne-EE@willie-the-truck>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <aHUKKPySsJ4ne-EE@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_053905_624563_D93E6278 
X-CRM114-Status: GOOD (  28.03  )
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



On 14/07/2025 2:46 pm, Will Deacon wrote:
> On Thu, Jun 05, 2025 at 11:49:01AM +0100, James Clark wrote:
>> FEAT_SPE_EFT (optional from Armv9.4) adds mask bits for the existing
>> load, store and branch filters. It also adds two new filter bits for
>> SIMD and floating point with their own associated mask bits. The current
>> filters only allow OR filtering on samples that are load OR store etc,
>> and the new mask bits allow setting part of the filter to an AND, for
>> example filtering samples that are store AND SIMD. With mask bits set to
>> 0, the OR behavior is preserved, so the unless any masks are explicitly
>> set old filters will behave the same.
>>
>> Add them all and make them behave the same way as existing format bits,
>> hidden and return EOPNOTSUPP if set when the feature doesn't exist.
>>
>> Reviewed-by: Leo Yan <leo.yan@arm.com>
>> Tested-by: Leo Yan <leo.yan@arm.com>
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> ---
>>   drivers/perf/arm_spe_pmu.c | 64 ++++++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 64 insertions(+)
>>
>> diff --git a/drivers/perf/arm_spe_pmu.c b/drivers/perf/arm_spe_pmu.c
>> index d9f6d229dce8..9309b846f642 100644
>> --- a/drivers/perf/arm_spe_pmu.c
>> +++ b/drivers/perf/arm_spe_pmu.c
>> @@ -86,6 +86,7 @@ struct arm_spe_pmu {
>>   #define SPE_PMU_FEAT_ERND			(1UL << 5)
>>   #define SPE_PMU_FEAT_INV_FILT_EVT		(1UL << 6)
>>   #define SPE_PMU_FEAT_DISCARD			(1UL << 7)
>> +#define SPE_PMU_FEAT_EFT			(1UL << 8)
>>   #define SPE_PMU_FEAT_DEV_PROBED			(1UL << 63)
>>   	u64					features;
>>   
>> @@ -197,6 +198,27 @@ static const struct attribute_group arm_spe_pmu_cap_group = {
>>   #define ATTR_CFG_FLD_discard_CFG		config	/* PMBLIMITR_EL1.FM = DISCARD */
>>   #define ATTR_CFG_FLD_discard_LO			35
>>   #define ATTR_CFG_FLD_discard_HI			35
>> +#define ATTR_CFG_FLD_branch_filter_mask_CFG	config	/* PMSFCR_EL1.Bm */
>> +#define ATTR_CFG_FLD_branch_filter_mask_LO	36
>> +#define ATTR_CFG_FLD_branch_filter_mask_HI	36
>> +#define ATTR_CFG_FLD_load_filter_mask_CFG	config	/* PMSFCR_EL1.LDm */
>> +#define ATTR_CFG_FLD_load_filter_mask_LO	37
>> +#define ATTR_CFG_FLD_load_filter_mask_HI	37
>> +#define ATTR_CFG_FLD_store_filter_mask_CFG	config	/* PMSFCR_EL1.STm */
>> +#define ATTR_CFG_FLD_store_filter_mask_LO	38
>> +#define ATTR_CFG_FLD_store_filter_mask_HI	38
>> +#define ATTR_CFG_FLD_simd_filter_CFG		config	/* PMSFCR_EL1.SIMD */
>> +#define ATTR_CFG_FLD_simd_filter_LO		39
>> +#define ATTR_CFG_FLD_simd_filter_HI		39
>> +#define ATTR_CFG_FLD_simd_filter_mask_CFG	config	/* PMSFCR_EL1.SIMDm */
>> +#define ATTR_CFG_FLD_simd_filter_mask_LO	40
>> +#define ATTR_CFG_FLD_simd_filter_mask_HI	40
>> +#define ATTR_CFG_FLD_float_filter_CFG		config	/* PMSFCR_EL1.FP */
>> +#define ATTR_CFG_FLD_float_filter_LO		41
>> +#define ATTR_CFG_FLD_float_filter_HI		41
>> +#define ATTR_CFG_FLD_float_filter_mask_CFG	config	/* PMSFCR_EL1.FPm */
>> +#define ATTR_CFG_FLD_float_filter_mask_LO	42
>> +#define ATTR_CFG_FLD_float_filter_mask_HI	42
>>   
>>   #define ATTR_CFG_FLD_event_filter_CFG		config1	/* PMSEVFR_EL1 */
>>   #define ATTR_CFG_FLD_event_filter_LO		0
>> @@ -215,8 +237,15 @@ GEN_PMU_FORMAT_ATTR(pa_enable);
>>   GEN_PMU_FORMAT_ATTR(pct_enable);
>>   GEN_PMU_FORMAT_ATTR(jitter);
>>   GEN_PMU_FORMAT_ATTR(branch_filter);
>> +GEN_PMU_FORMAT_ATTR(branch_filter_mask);
>>   GEN_PMU_FORMAT_ATTR(load_filter);
>> +GEN_PMU_FORMAT_ATTR(load_filter_mask);
>>   GEN_PMU_FORMAT_ATTR(store_filter);
>> +GEN_PMU_FORMAT_ATTR(store_filter_mask);
>> +GEN_PMU_FORMAT_ATTR(simd_filter);
>> +GEN_PMU_FORMAT_ATTR(simd_filter_mask);
>> +GEN_PMU_FORMAT_ATTR(float_filter);
>> +GEN_PMU_FORMAT_ATTR(float_filter_mask);
>>   GEN_PMU_FORMAT_ATTR(event_filter);
>>   GEN_PMU_FORMAT_ATTR(inv_event_filter);
>>   GEN_PMU_FORMAT_ATTR(min_latency);
>> @@ -228,8 +257,15 @@ static struct attribute *arm_spe_pmu_formats_attr[] = {
>>   	&format_attr_pct_enable.attr,
>>   	&format_attr_jitter.attr,
>>   	&format_attr_branch_filter.attr,
>> +	&format_attr_branch_filter_mask.attr,
>>   	&format_attr_load_filter.attr,
>> +	&format_attr_load_filter_mask.attr,
>>   	&format_attr_store_filter.attr,
>> +	&format_attr_store_filter_mask.attr,
>> +	&format_attr_simd_filter.attr,
>> +	&format_attr_simd_filter_mask.attr,
>> +	&format_attr_float_filter.attr,
>> +	&format_attr_float_filter_mask.attr,
>>   	&format_attr_event_filter.attr,
>>   	&format_attr_inv_event_filter.attr,
>>   	&format_attr_min_latency.attr,
>> @@ -250,6 +286,16 @@ static umode_t arm_spe_pmu_format_attr_is_visible(struct kobject *kobj,
>>   	if (attr == &format_attr_inv_event_filter.attr && !(spe_pmu->features & SPE_PMU_FEAT_INV_FILT_EVT))
>>   		return 0;
>>   
>> +	if ((attr == &format_attr_branch_filter_mask.attr ||
>> +	     attr == &format_attr_load_filter_mask.attr ||
>> +	     attr == &format_attr_store_filter_mask.attr ||
>> +	     attr == &format_attr_simd_filter.attr ||
>> +	     attr == &format_attr_simd_filter_mask.attr ||
>> +	     attr == &format_attr_float_filter.attr ||
>> +	     attr == &format_attr_float_filter_mask.attr) &&
>> +	     !(spe_pmu->features & SPE_PMU_FEAT_EFT))
>> +		return 0;
>> +
>>   	return attr->mode;
>>   }
>>   
>> @@ -341,8 +387,15 @@ static u64 arm_spe_event_to_pmsfcr(struct perf_event *event)
>>   	u64 reg = 0;
>>   
>>   	reg |= FIELD_PREP(PMSFCR_EL1_LD, ATTR_CFG_GET_FLD(attr, load_filter));
>> +	reg |= FIELD_PREP(PMSFCR_EL1_LDm, ATTR_CFG_GET_FLD(attr, load_filter_mask));
>>   	reg |= FIELD_PREP(PMSFCR_EL1_ST, ATTR_CFG_GET_FLD(attr, store_filter));
>> +	reg |= FIELD_PREP(PMSFCR_EL1_STm, ATTR_CFG_GET_FLD(attr, store_filter_mask));
>>   	reg |= FIELD_PREP(PMSFCR_EL1_B, ATTR_CFG_GET_FLD(attr, branch_filter));
>> +	reg |= FIELD_PREP(PMSFCR_EL1_Bm, ATTR_CFG_GET_FLD(attr, branch_filter_mask));
>> +	reg |= FIELD_PREP(PMSFCR_EL1_SIMD, ATTR_CFG_GET_FLD(attr, simd_filter));
>> +	reg |= FIELD_PREP(PMSFCR_EL1_SIMDm, ATTR_CFG_GET_FLD(attr, simd_filter_mask));
>> +	reg |= FIELD_PREP(PMSFCR_EL1_FP, ATTR_CFG_GET_FLD(attr, float_filter));
>> +	reg |= FIELD_PREP(PMSFCR_EL1_FPm, ATTR_CFG_GET_FLD(attr, float_filter_mask));
>>   
>>   	if (reg)
>>   		reg |= PMSFCR_EL1_FT;
>> @@ -716,6 +769,10 @@ static int arm_spe_pmu_event_init(struct perf_event *event)
>>   	u64 reg;
>>   	struct perf_event_attr *attr = &event->attr;
>>   	struct arm_spe_pmu *spe_pmu = to_spe_pmu(event->pmu);
>> +	const u64 feat_spe_eft_bits = PMSFCR_EL1_LDm | PMSFCR_EL1_STm |
>> +				      PMSFCR_EL1_Bm | PMSFCR_EL1_SIMD |
>> +				      PMSFCR_EL1_SIMDm | PMSFCR_EL1_FP |
>> +				      PMSFCR_EL1_FPm;
> 
> I'm not sure this constant is adding much, especially as its defined
> quite a long way from its single user.
> 
>>   
>>   	/* This is, of course, deeply driver-specific */
>>   	if (attr->type != event->pmu->type)
>> @@ -761,6 +818,10 @@ static int arm_spe_pmu_event_init(struct perf_event *event)
>>   	    !(spe_pmu->features & SPE_PMU_FEAT_FILT_LAT))
>>   		return -EOPNOTSUPP;
>>   
>> +	if ((reg & feat_spe_eft_bits) &&
>> +	    !(spe_pmu->features & SPE_PMU_FEAT_EFT))
>> +		return -EOPNOTSUPP;
> 
> You could probably just spell out the entire thing tbh. It's verbose,
> but it's also pretty clear and it means we have everything in one place:
> 
> 	if ((FIELD_GET(PMSFCR_EL1_LDm, reg) ||
> 	     FIELD_GET(PMSFCR_EL1_STm, reg) ||
> 	     FIELD_GET(PMSFCR_EL1_Bm, reg) ||
> 	     FIELD_GET(PMSFCR_EL1_SIMD, reg) ||
> 	     FIELD_GET(PMSFCR_EL1_SIMDm, reg) ||
> 	     FIELD_GET(PMSFCR_EL1_FP, reg) ||
> 	     FIELD_GET(PMSFCR_EL1_FPm, reg)) &&
>             !(spe_pmu->features & SPE_PMU_FEAT_EFT))
> 		return -EOPNOTSUPP;
> 
> Will

Ack


