Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81B9DC3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 15:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YEtrnnDuAmJYKZeSMvf5c7nmLNzlk/l+Iae0vySJelU=; b=tnkuuPB/B7XHsPuQasJ1s0ihm4
	Mh4zPV3OlQr1vQ/7W6lzhkqJXDdcXCrWHVvjLMISjknb4xveuoFNaJMZs0TVOU+MebCZHCIYfz1Vt
	/MwIFntYiKmJkKqkjdpUJMJYTDQrEfNvlauHz4GAI8mDy3WrASbZJ8OEBPuECAgn+kp3JWcdKRjoM
	rOsp05GWX7vABwvjBK2PAMjboTiBeqRPCfKdgMf312QV5UhVJM6lg6tQ7PLB5Vs+O9xzAKpeFiAGA
	PG5kkhSxNSU8tEhKeFkpv+SCpTWos/3qnz4ciAbwEzcfYjN2FgL238s/0oILlK/MzswIw5ewejdEU
	1h2m9ttg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHOYx-0000000DH6c-3VNH;
	Tue, 20 May 2025 15:07:27 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHOSl-0000000DFxK-0iIY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 15:01:07 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-441c99459e9so37282395e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 May 2025 08:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747753261; x=1748358061; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YEtrnnDuAmJYKZeSMvf5c7nmLNzlk/l+Iae0vySJelU=;
        b=g0Hl4X/6GNx5sKag7usj4rXfdpBAZyO6SdVnvTFl7tJv9zEhIqM68O3LAE0phXrfjp
         Z1G5amaysKfhmy/9sgNjkHtMigXxje3VQOsRXGOQnXouojmruaoeg2TRtRV4Og/jvIMX
         hYASngSfe7tWXzlcQUeKzNRqgamLDYFqLjBkyQFPiWhJ90/nXmJ6ejrHrh3L+wf/TnPE
         IkMoD8PWK+v4uRnNMuTCmXoEkB87A9NV+FEGGZvj6LovT157bKjwM4xf1rU0+AcU7MJy
         rCT5KzvNb0RdVTaotczAUg94bFnaZGbDY+A/pye/fn5o/Y3AFfHiVvOHLUsAAhnvzbD/
         +E6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747753261; x=1748358061;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YEtrnnDuAmJYKZeSMvf5c7nmLNzlk/l+Iae0vySJelU=;
        b=M58CXH+crKINlX5j6oULNrRnyPoEld+LQU9aaK6I6SxoohQvFTYm0U/2Xr3+4BdVe7
         A9jDv278kgaSckht5976Xsdp4hp1//0tjrBba+JCkYxaAirZ+6u1qhVx6LBhLZgFI98y
         EJ5xsU88CEN0PZSzNvn9dKhfPGuX2sg9rCmUdOp8+hLOdaf20nKNmbWCmJ68eUXY/5ps
         vQppeBSltBkHeoGmZWqjcluVu+uNACCweMxTE3Myr6s4S9SqsDAz5/9CLqmRnkt7X9ai
         8/mSv8ZcVYPk+Ov0YtjmDBz6pSDQffARTH3UNabW4GlTqMNCY0EHdUJT7GmIKraoF2kn
         fAkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzpWLRsw9WDG9v3ioAGScUIt7nDY9mMu/XhNkPjUad1bS2vVJT4u6DIbJWMhXpfb+NLDhTWKo//JsRRzoz2sww@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+NNnCkz2aGEi9AdUduxvqFAe2rlsUgDKSieplN+mRVA8fnP2T
	LLDgFD+9lO+mnWWEoAHv9oKLoLT/889f5JwERkoJCwP/RcQLhQQQFPQ+zNqG43t02vo=
X-Gm-Gg: ASbGncvLrzu0p84FSr2A6URNVWEni1ppLhUEJXvZHDmgK3IBEuFuaGntfTGsrJ2myOH
	s6xXCiULPZzlb5S89JCLXffZhGyY374dXR5wL/dX0lyynVzKSPfKuRsPZqh0LQSiPknH5zv3x8g
	JQ7V2zCDJLczqd+rYm9JrJ73LaLInaVnBmqsS3AA/TuT+cR6HYl0z0MhgJEyzakhVORoa2Y1YJB
	5jzxDkPGgqdUEVOXNurCKKib/Z0G3Ay/1DEkBhu88QfUe0SCpkc5V8NVPSjXzfOCBS52AWWoN+e
	lj6PU8tkZsG9AWGYY1DX1LHefmIvk8/QeY99ERjhcP0TyPNQCI/X5Zg5
X-Google-Smtp-Source: AGHT+IH24Rob6qzsp/B6a4YvVXoqQFWt4twT0lUoObQ25VvZu+ofvWuRa8S+DtGe5tHJROxKWkMZ3Q==
X-Received: by 2002:a05:600c:a418:b0:445:1984:2479 with SMTP id 5b1f17b1804b1-445198425a6mr87579185e9.5.1747753261270;
        Tue, 20 May 2025 08:01:01 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f6b295fdsm35699865e9.5.2025.05.20.08.00.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 08:01:00 -0700 (PDT)
Message-ID: <443141db-6950-4a15-83be-ad9e9c0e03a0@linaro.org>
Date: Tue, 20 May 2025 16:00:59 +0100
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
 <20250520134632.GR412060@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250520134632.GR412060@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_080103_244716_5FBF6B29 
X-CRM114-Status: GOOD (  33.28  )
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



On 20/05/2025 2:46 pm, Leo Yan wrote:
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
> 
> As Arm ARM says:
> 
>    0b0 : If PMSFCR_EL1.FDS is 1, do not record load operations that have
>          bits [5:0] of the Data Source packet set to <m>.
>    0b1 : Load operations with Data Source <m> are unaffected by
>          PMSFCR_EL1.FDS.
> 
> We need extra handling for this configuration (0b0 means filtering,
> 0b1 means no affaction):
> 
> - By default, the driver should set all bits in the 'data_src_filter'
>    field.
> 
> - The perf tool needs an extra patch in userspace to initialize all
>    bits in config4 unless user specify other values.
> 
> Thanks,
> Leo
> 

Did you take into account PMSFCR_EL1.FDS being set automatically? I 
think the wording is slightly confusing but I tested it on the model and 
it works.

If PMSFCR_EL1.FDS == 0 then PMSDSFR_EL1 does nothing, and if the data 
source filter isn't set by the user then FDS isn't set so there's no 
need to set all the bits in the filter to 1. Once the user asks for any 
filter then we set FDS, at which point it's whatever filter they asked 
for. They can set all the bits if they want, or just one.

This is same way PMSFCR_EL1.FT already works. If the user asks for any 
filter then it's set automatically, but we don't allow the user to ask 
for "no filters" but with FT set.

So the only thing we can't do is filter out samples with _any_ data 
source. Which would be PMSFCR_EL1.FDS == 1 and PMSDSFR_EL1 == 0. But I 
don't think that's useful, and there are other filters to get you all or 
most of the way there.

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


