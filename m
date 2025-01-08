Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCD21E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 10:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YjY6+zjtyOIX1iyK/8QhOIQrcr0euu2ifQ2NruT64Tw=; b=jggbhtOHFTUSaI6TOnBYzDV2PW
	JbQs0i6c4s5vt99byFhkHq8sZpCGywgF5i2XNXRidzZesyrqXyMnbZ7ujWeem/hjQSnJmEGQgpXJ/
	eNDacubYvLGqkOp5qlklJIhs8ldYhdg4E7FhRP8HX4YQ6ZnQlp4/HpZ0JtmAvRVFwlm9WupVU5Wt+
	wxN41cLouNv/LGT3SE0KPXO0VBMUlseDduJeX2E5OnC7+0uN4ocnQkpHIgXu4aULvbt6WcK7Lq8XO
	Lh2fKNW3W2qic4986UPMN+qLu2RAP7lp5Kv+eY0OM1N4UeffnmVX9PQDV3Dxn+YMvD8G/qnOzTfVD
	OU7fYoZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVT3X-00000007vvh-45xa;
	Wed, 08 Jan 2025 10:12:55 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVSz7-00000007uhJ-0hSY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 10:08:22 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-436a03197b2so65585015e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jan 2025 02:08:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736330899; x=1736935699; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YjY6+zjtyOIX1iyK/8QhOIQrcr0euu2ifQ2NruT64Tw=;
        b=p1zAlrwgV2T7IRgyLD7mH9MdndYK5RjXMWXKoDOq6/ATJTW1Wusnq2FV814qg9srGU
         QMXVTdngEH0DpaWCpk5tQhGx8qYUjIg2DXAZgDdOZ+cXVGV/mudUjpz2DObpIUvgbth4
         zaBCVf6fM39A9liy8QQYliSwfZ00+3onkXmw7SSQ397apL3bvyb8UzcsQaLGBp5U2CAa
         PRLNhjk6rjBGxyTCwUMSMRX8Ilie64oNGqUJw48RrPflD2PkxR8BryvtIhlyhldD2QAl
         7m2hpAdc2ZS0NQyKDMAD3DoiSKCuAMkM3P3bZvi9H6zy5xKIEIAbsWo1Ci3tY9p/yWJs
         BS7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736330899; x=1736935699;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YjY6+zjtyOIX1iyK/8QhOIQrcr0euu2ifQ2NruT64Tw=;
        b=h8+vLfCb9DGoWQb7xFZairZlR2T8GwdyC1Nd6OVB5Vw72/zbE+zhl8QHFs7zOlOHhL
         Sg+pBc4CH9FUYJx7ZJIisl+23TXv0gbThSf0phaU06L+XKuyfS2/57tvBXzrjh7ujL4G
         rgyRgHM2y7dn3FaeRaQZbH2ThIVyGsyeKowxe0XVGlZ0I0011AyFruAb6AoY7G1tF22r
         txV+ry3u+u8Uyh5H3xxFsILKbC9NmNGUAKBJfa66pVcH2gerfmkXJeAGBn53axbVQakw
         EuGFnjBce9vPtlvuaJ2Rofo9BtM3zgp3VKHKcV1Zp6QbUFjUniS7dpu1HmZRwYl3dARx
         fbvA==
X-Gm-Message-State: AOJu0YxrrtNENDicgtR29GQAboS7u/90Gb9NJEWcPHNbLBTyu0oD8C7k
	KzC4S6dlXe98yfN+6Op6F1dDTzFvOqU8zck5FvrVqJo84AU430GQod1dhA0elj3tPOOzb4sVjQ3
	h
X-Gm-Gg: ASbGncvJTu0qf2A1b8o+cjF5EQ/BL5i9beFV0dYDGymjCAdGOlGrttrAaP0nKxC9nbY
	oDRZ4vproUhr0B6fKDXL3zbe/VBdh2SdbdzRLIk2FiA/KU8kPt/toc4m1XLYu4eQD8pEf0/9BJl
	spKDujqqnMZ6cNdFUsbGh3biUTdALu5baR08PscKo8Pn0c2BuVJhP1IdXgl5b8E81bV+L2Q7C2d
	aWat/e9/Hq1i83BPqs9NpXK65e7PUF0/srVXDx/iu1i+XJB6pf8n6LX/F5QdMmO4+M=
X-Google-Smtp-Source: AGHT+IFu99ytHjTbRlZvRSjYKF3KyW4IOwcR6xJDGsiYoktyTX+cpKyAZe0Elx/55d+bPtnX5LCY0A==
X-Received: by 2002:a5d:5f52:0:b0:385:fcfb:8d4f with SMTP id ffacd0b85a97d-38a872deb1amr1964341f8f.21.1736330899266;
        Wed, 08 Jan 2025 02:08:19 -0800 (PST)
Received: from [192.168.68.163] ([145.224.90.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a88825167sm787846f8f.78.2025.01.08.02.08.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jan 2025 02:08:18 -0800 (PST)
Message-ID: <ccab556d-5d08-49f9-8039-a8c507a7a0e1@linaro.org>
Date: Wed, 8 Jan 2025 10:08:16 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] perf: arm_spe: Add format option for discard mode
To: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 irogers@google.com, yeoreum.yun@arm.com, mark.rutland@arm.com,
 robh@kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 "Liang, Kan" <kan.liang@linux.intel.com>,
 John Garry <john.g.garry@oracle.com>, Mike Leach <mike.leach@linaro.org>,
 Leo Yan <leo.yan@linux.dev>, Graham Woodward <graham.woodward@arm.com>,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org
References: <20241224104414.179365-1-james.clark@linaro.org>
 <20241224104414.179365-2-james.clark@linaro.org>
 <20250107173950.GA8111@willie-the-truck>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250107173950.GA8111@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_020821_862877_31A1D3D1 
X-CRM114-Status: GOOD (  19.09  )
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



On 07/01/2025 5:39 pm, Will Deacon wrote:
> On Tue, Dec 24, 2024 at 10:44:08AM +0000, James Clark wrote:
>> FEAT_SPEv1p2 (optional from Armv8.6) adds a discard mode that allows all
>> SPE data to be discarded rather than written to memory. Add a format
>> bit for this mode.
>>
>> If the mode isn't supported, the format bit isn't published and attempts
>> to use it will result in -EOPNOTSUPP. Allocating an aux buffer is still
>> allowed even though it won't be written to so that old tools continue to
>> work, but updated tools can choose to skip this step.
>>
>> Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> ---
>>   drivers/perf/arm_spe_pmu.c | 23 +++++++++++++++++++++++
>>   1 file changed, 23 insertions(+)
>>
>> diff --git a/drivers/perf/arm_spe_pmu.c b/drivers/perf/arm_spe_pmu.c
>> index fd5b78732603..9aaf3f98e6f5 100644
>> --- a/drivers/perf/arm_spe_pmu.c
>> +++ b/drivers/perf/arm_spe_pmu.c
>> @@ -193,6 +193,9 @@ static const struct attribute_group arm_spe_pmu_cap_group = {
>>   #define ATTR_CFG_FLD_store_filter_CFG		config	/* PMSFCR_EL1.ST */
>>   #define ATTR_CFG_FLD_store_filter_LO		34
>>   #define ATTR_CFG_FLD_store_filter_HI		34
>> +#define ATTR_CFG_FLD_discard_CFG		config	/* PMBLIMITR_EL1.FM = DISCARD */
>> +#define ATTR_CFG_FLD_discard_LO			35
>> +#define ATTR_CFG_FLD_discard_HI			35
>>   
>>   #define ATTR_CFG_FLD_event_filter_CFG		config1	/* PMSEVFR_EL1 */
>>   #define ATTR_CFG_FLD_event_filter_LO		0
>> @@ -216,6 +219,7 @@ GEN_PMU_FORMAT_ATTR(store_filter);
>>   GEN_PMU_FORMAT_ATTR(event_filter);
>>   GEN_PMU_FORMAT_ATTR(inv_event_filter);
>>   GEN_PMU_FORMAT_ATTR(min_latency);
>> +GEN_PMU_FORMAT_ATTR(discard);
>>   
>>   static struct attribute *arm_spe_pmu_formats_attr[] = {
>>   	&format_attr_ts_enable.attr,
>> @@ -228,9 +232,15 @@ static struct attribute *arm_spe_pmu_formats_attr[] = {
>>   	&format_attr_event_filter.attr,
>>   	&format_attr_inv_event_filter.attr,
>>   	&format_attr_min_latency.attr,
>> +	&format_attr_discard.attr,
>>   	NULL,
>>   };
>>   
>> +static bool discard_unsupported(struct arm_spe_pmu *spe_pmu)
>> +{
>> +	return spe_pmu->pmsver < ID_AA64DFR0_EL1_PMSVer_V1P2;
>> +}
> 
> Why not add a new SPE_PMU_FEAT_* for this and handle it in a similar
> way to other optional hardware features?
> 
> Will

Hmmm good point, I'm not sure why I didn't do it that way. Possibly 
because it's only based off pmsver which is already saved, whereas the 
other feats are based off reading PMSIDR which is thrown away. But I can 
add SPE_PMU_FEAT_DISCARD.

Thanks
James



