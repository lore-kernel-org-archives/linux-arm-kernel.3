Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C22CC3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 13:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mQHlbMiBxLSmXP52BL1UDUEb0aWb4op30nkibuEcEDI=; b=Em9HgxgUFwPefmh8ItBXjksBQu
	nAbNvk9/Dg9ZuHVusQ+sByIhl7T4agGTK8cznUFaf14/XRplssIxXws0KSWXSVuDfqXvYHtIGN9aM
	WSBj/2UhiML8b56Xgy2M06rpdoxdd0Yx6MpJSHw5oL7O6mwcH4whm6EQ2pWwQA99hicjjH9z0f9q7
	zKGP4xA9+X04BaWEaZ+iGNA8Gz5dqYTiVYQfE4mnPpg8/m97ScH+TQEq1Ng1V9iYySUELmTf39/BN
	MEtJIBpuR1Uzs5DC99rnNy5x5bIWAikLva4ocfUj565W3Lq3p81EGKfKlfTm4VsWF8H4l/S8iWxXJ
	4Mow+MCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHN0V-0000000D0d1-1sNB;
	Tue, 20 May 2025 13:27:47 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHMxG-0000000D0Gx-1S42
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 13:24:27 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-43edb40f357so46591425e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 May 2025 06:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747747465; x=1748352265; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mQHlbMiBxLSmXP52BL1UDUEb0aWb4op30nkibuEcEDI=;
        b=Nzb/bAH5t2Z/1Oa0XWLr7n+K77wAHRbFXxR7JmFbQ0ikz6pc9DSB9dldssRGsc36be
         p44HtS7hC/uAz2/z2WQ5B8b4hnmy1pGgYDOa1kBrLFRxXji/ogNcXK52weNYzy5OfmLp
         fEY6oFs4b1+sIA6sFFXqJ+x+zr+80xbo/lead5Ujusp4gLkWCv3qBCSryxbYTegDbGAZ
         8/xX91DOP6n/3Fwxretr6BmicSTn6PAXr5r9d0KptfzODnzmh50CA5u+Jt2acisbPUyy
         AqbJUxCafmGVt5sQMEUUp5PJPVw5IxKiyzZ1PI1sjJMtBtzAMxAOhBRMr6SoAfppoghR
         zQMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747747465; x=1748352265;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mQHlbMiBxLSmXP52BL1UDUEb0aWb4op30nkibuEcEDI=;
        b=ht8NLGo/PC88AnYkgYJv/o2McdQ2YkrdTPETSMJEHklAcq3tqOf83MesZ8iWNAZnRJ
         1eLMSdJ43aIaserMwit5XzT5XjVMgcwKWaK0SEGRLehxKCq1gQSQ07vd0lcpE6MSRndo
         AFI98ZBhiygFLLU/J3HXd6edQSwUTUM98RoB6uAiUW7demLQTREM+9VN5xKiUYUminMR
         lCiH1EGgoQDZGoTG4Qv6lLbF9dNZ8BvAz8L2ola0bXVoiWN6kC4QGRlfNoNOVQHJLjFu
         MNZuAWhsUZnpwuFmrOh6rzc0IjN98PdnjkGpaE4oe2mQJ1H9fF5ZjKyjLVs/ogZS2P2N
         268g==
X-Forwarded-Encrypted: i=1; AJvYcCU2wVDDohQOYAWANE10Go/+Ths6JGtQykz5THBnyU8onrS/L+8b6RVA9VA9IJ/PlssDStxeCz4g/MY016kLGCec@lists.infradead.org
X-Gm-Message-State: AOJu0Ywjmv0A0ReXNT1Uz1pNM2AaxgFUJMH3lqVDgWycr8d1yS5q60Cs
	2nuPXJEBKByAOEuOWi39NZFRyXX+fGgkWvAysuIzSdVTPe6xOHc0SlcGWpVMXVUDLBw=
X-Gm-Gg: ASbGncvGwHevLPPhB3gf+7+RGUJL3/UnJkPWXetw9Ug3Pkb2AdhASsGLegE3IFJP+Mr
	Fc1a0vYs1CbOmM1Zb6fMdpPIx8DC8T9WoIk6ANSP3wFbSMnpg0jV0ye/6hjGdOxou/ccW3oQYnG
	8zJiDY43IB4+aWaqD7/GiGi/+tp0yiNi6Q3hs/JgyfQD3nPNRaOr0X5xssVmo5U7b+Z/4EuFMIx
	85Rxyv9tzJPRjCBMoXy7JHfipcu4oRAg59UCzujTndyAL/JcyaovKCqmbMc0HBePSS55a6afY5c
	RL3S1bfQBjhNwdxr5ZiEKxujf1Sq1WTLhwvyDtCA33LPS3bZe21vcQzW
X-Google-Smtp-Source: AGHT+IE3zELuhSN3TwYO27umiBhhWtesQN6BNGvzjaw7PU+Jb1bNssmWf19VcuZ1nvC7Yd9VZCvZug==
X-Received: by 2002:a05:600c:4f42:b0:442:dc75:5625 with SMTP id 5b1f17b1804b1-442fd60cb7bmr151310375e9.5.1747747464942;
        Tue, 20 May 2025 06:24:24 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca88735sm16788347f8f.69.2025.05.20.06.24.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 06:24:24 -0700 (PDT)
Message-ID: <25d64842-79c7-4d70-a5d7-08cd60208681@linaro.org>
Date: Tue, 20 May 2025 14:24:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/10] perf: arm_spe: Add support for filtering on data
 source
To: Leo Yan <leo.yan@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Zenghui Yu <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 linux-doc@vger.kernel.org, kvmarm@lists.linux.dev
References: <20250506-james-perf-feat_spe_eft-v1-0-dd480e8e4851@linaro.org>
 <20250506-james-perf-feat_spe_eft-v1-7-dd480e8e4851@linaro.org>
 <20250520114309.GO412060@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250520114309.GO412060@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_062426_396642_EA7F7E88 
X-CRM114-Status: GOOD (  28.01  )
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



On 20/05/2025 12:43 pm, Leo Yan wrote:
> On Tue, May 06, 2025 at 12:41:39PM +0100, James Clark wrote:
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
>> +
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
> 
> Seems to me, arm_spe_event_to_pmsdsfr() is not needed as it does not do
> any conversion from event config to register value.  So simply read the
> field value in opened code would be fine.
> 
> I am fine to keep it and would leave SPE driver maintainers to decide
> which is preferring.  Otherwise, LGTM:
> 
> Reviewed-by: Leo Yan <leo.yan@arm.com>
> 

It's purely for consistency with the existing code. See 
arm_spe_event_to_pmsevfr() etc.

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
>> +
>>   	if (attr->exclude_idle)
>>   		return -EOPNOTSUPP;
>>   
>> @@ -857,6 +880,11 @@ static void arm_spe_pmu_start(struct perf_event *event, int flags)
>>   		write_sysreg_s(reg, SYS_PMSNEVFR_EL1);
>>   	}
>>   
>> +	if (spe_pmu->features & SPE_PMU_FEAT_FDS) {
>> +		reg = arm_spe_event_to_pmsdsfr(event);
>> +		write_sysreg_s(reg, SYS_PMSDSFR_EL1);
>> +	}
>> +
>>   	reg = arm_spe_event_to_pmslatfr(event);
>>   	write_sysreg_s(reg, SYS_PMSLATFR_EL1);
>>   
>> @@ -1116,6 +1144,9 @@ static void __arm_spe_pmu_dev_probe(void *info)
>>   	if (FIELD_GET(PMSIDR_EL1_EFT, reg))
>>   		spe_pmu->features |= SPE_PMU_FEAT_EFT;
>>   
>> +	if (FIELD_GET(PMSIDR_EL1_FDS, reg))
>> +		spe_pmu->features |= SPE_PMU_FEAT_FDS;
>> +
>>   	/* This field has a spaced out encoding, so just use a look-up */
>>   	fld = FIELD_GET(PMSIDR_EL1_INTERVAL, reg);
>>   	switch (fld) {
>>
>> -- 
>> 2.34.1
>>
> 


