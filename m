Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F96ECA101C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 16:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UYoM3cK9vBeAs2c1rKLSFJjbhLQMxUGOsX7iDRX0aTM=; b=LIxwAyde77cwyB5j2bnNsrTjfx
	MssrDy8T2zuGHuBAL3J3/m8h2nDdr+pv6CknrSWU03PhRSWsxo8IFivOtIdTD2/DYV7EhclyqxMxI
	HsTCsPVpidrn3pC/hKE1iIhZAArG4hkSAJ1pezSNW7f1uUXcrPJ2CVNmv9evdN4O1zXWqLZVQO2vB
	fy5uCodpbIVMiIxtnygMZN2hTSgYu1kbyiiEfPo0mDl4MhDGavPxSYqsWPSBeF1nrbuJ18QhoQvyy
	GEOQ4zfImhg7TJew3JPgR4I8q4eu929rN0KXl4i2/2PgyT27sg+3clxkYEU1TGa8oPsreCkLxfH5j
	xI2qe2RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuClH-0000000CqXH-33Rb;
	Thu, 04 Sep 2025 16:24:35 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu8oW-0000000BTKq-0gkF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 12:11:41 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-45b8b02dd14so6770975e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Sep 2025 05:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756987899; x=1757592699; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UYoM3cK9vBeAs2c1rKLSFJjbhLQMxUGOsX7iDRX0aTM=;
        b=H80d+PTH4w6vYIzWDaonNZasDbZn1K7hdjxPqU9+/P2Zy0pOE2LN0zeoqrTNppXCL9
         HSo0QVf4hJRtqXo3w/YiGcYZr1J3W2Q+KowQoNRvk1y4JQBEa92H/LSHpnz3d+ART/Ae
         5Pf6vyXPSi2aLygI/kabJM+bkzQgOOnJkXtzjHJgLVq4tqKlX+z3n6IgdH1QdkEUIcJ3
         GviehmPVpK26fFDrcC1S0tIx9/aRlv4C8N8wB0TEl/MUC1ld/z1E84rcCB+yfugMeJ7L
         m5I3ZWmm0VbfIh6UogvGAOL15wpJhqSKRqn53OsY8uCoZTeNV8l/a3+bGjJwWwIpoeyg
         ElmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756987899; x=1757592699;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UYoM3cK9vBeAs2c1rKLSFJjbhLQMxUGOsX7iDRX0aTM=;
        b=SKYSIhfeuqMwceFI9r2W4Z/bMQA57XEjILX/LyUK92eiCiPz48jcMt4hP8KpnFO045
         cNaohc85qZ5XhaPq/eZ/BScxUYGkCl8qs5OsybDywGYXy0Q7Vp4Z+yfabycwUwVh+7WR
         yY4t8w+B+fmI8Q9DsN2XwgrUBsD9QEa840n1cqfcesoA5793Wb1Y1hyHb6aQRvUmSeWX
         OrE6ydS/I+pjoG3FRVw3XnEV5H2MsfpwqH08GqMp4EUAzrcPQz8vjzJWndgGWpMvLAAU
         qM1CiYGVUMfG5gOsDu/gbJBzY4z3v52Vw3C7LW95lIgvl0hjrBsZcNen/F03oJEz9Kj9
         hL1g==
X-Forwarded-Encrypted: i=1; AJvYcCVpHGEGWRJsn1stcv7p9cSxIItOY+0ze2vpisr6dUgnTMh+YU4L5bdcmaf2hW2zwueLzf7/NYyaPMZTZuO6sR5I@lists.infradead.org
X-Gm-Message-State: AOJu0YzIz6habXZGuQBcP45H9qk/UMfjwJR01MgDjkxJ0hU48ndpqJDK
	dZQt2zJZnnBItc6qBVP9gF/SjK2ZsK3g36WdlCulf5MQTiArGP6Pj7pjn1M7+05VuJ0=
X-Gm-Gg: ASbGncuapIND5HOmw3t/lprtqHaXA3xXEjq6hamxBiFKGi4to+jjXGAGGcEAiCzBMN8
	37wrI5S4YK/9L9xV04f2iwa+sTVNQ26ZNXDetfU8fp/vKhpqBFLU9DrnlW5BjRvj2DJqDn7MfI8
	dPc6pGmaDSBRYOOWKbBbHOFiknAti8XkYMeQf5zCZXY4d3VX6Xmxonpk4RyTAxw0la09HzlbrnF
	VonN0Y13MK/NIPz4SxmBnRtDBOtVWZ7XYuUfvvU9gG6HopQPjamYrKNwMfKqbsuoaNiNzpaMQ7M
	GDZWUF8CKWrUa7VMQ1+0VJq6gOLWPjCadxzMR0ilTanQ+SUvE3/N8K9rc8QXECSRA4kCp696FKn
	FwUBc2BOgHipXt1mqAHsvmQDmXz5PVcP5InZIDg==
X-Google-Smtp-Source: AGHT+IHQdXm8jC8e/msUJOyKC0lFFG5gg0CFfpvTp2PimVT6WH5aqg4j0JgEmA/4HZ8s1gbZTUkx4Q==
X-Received: by 2002:a05:600c:4e44:b0:45b:80e4:4e1a with SMTP id 5b1f17b1804b1-45b855fe92bmr149416845e9.26.1756987898546;
        Thu, 04 Sep 2025 05:11:38 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7e7d1319sm312836545e9.5.2025.09.04.05.11.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 05:11:38 -0700 (PDT)
Message-ID: <20cec516-1589-4fc5-ac07-06029f2dc143@linaro.org>
Date: Thu, 4 Sep 2025 13:11:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: perf: Fix pointer check with IS_ERR_OR_NULL()
From: James Clark <james.clark@linaro.org>
To: Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Tamas Zsoldos <tamas.zsoldos@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
References: <20250904-cs_etm_auxsetup_fix_error_handling-v1-1-ecc5edf282a5@arm.com>
 <5f24d286-629c-404f-8e0f-aa01e27bcb80@linaro.org>
Content-Language: en-US
In-Reply-To: <5f24d286-629c-404f-8e0f-aa01e27bcb80@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_051140_212732_287D7C02 
X-CRM114-Status: GOOD (  21.49  )
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



On 04/09/2025 1:00 pm, James Clark wrote:
> 
> 
> On 04/09/2025 11:53 am, Leo Yan wrote:
>> The returned pointer from .alloc_buffer() callback can be an error, if
>> only checking NULL pointer the driver cannot capture errors. The driver
>> will proceed even after failure and cause kernel panic.
>>
>> Change to use IS_ERR_OR_NULL() check for capture error cases.
>>
>> Fixes: 0bcbf2e30ff2 ("coresight: etm-perf: new PMU driver for ETM 
>> tracers")
>> Reported-by: Tamas Zsoldos <tamas.zsoldos@arm.com>
>> Signed-off-by: Leo Yan <leo.yan@arm.com>
>> ---
>>   drivers/hwtracing/coresight/coresight-etm-perf.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/ 
>> drivers/hwtracing/coresight/coresight-etm-perf.c
>> index 
>> f677c08233ba1a28b277674662c6e6db904873dd..440d967f5d0962df187a81b0dd69a7d82a8b62ba 100644
>> --- a/drivers/hwtracing/coresight/coresight-etm-perf.c
>> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
>> @@ -198,7 +198,7 @@ static void free_sink_buffer(struct etm_event_data 
>> *event_data)
>>       cpumask_t *mask = &event_data->mask;
>>       struct coresight_device *sink;
>> -    if (!event_data->snk_config)
>> +    if (IS_ERR_OR_NULL(event_data->snk_config))
>>           return;
>>       if (WARN_ON(cpumask_empty(mask)))
>> @@ -450,7 +450,7 @@ static void *etm_setup_aux(struct perf_event 
>> *event, void **pages,
>>       event_data->snk_config =
>>               sink_ops(sink)->alloc_buffer(sink, event, pages,
>>                                nr_pages, overwrite);
>> -    if (!event_data->snk_config)
>> +    if (IS_ERR_OR_NULL(event_data->snk_config))
>>           goto err;
> 
> I think the bug is in TRBE. It's the only one that returns an error 
> pointer, but only for -ENOMEM which would normally be NULL for alloc 
> type functions anyway.
> 
> Also it's assigned to event_data->snk_config which is later NULL checked 
> rather than IS_ERR_OR_NULL in free_sink_buffer(). Maybe that path 
> doesn't happen, but all instances should be updated anyway.

Oh sorry I was only looking at the update to etm_setup_aux() so both 
functions are covered. But the other points still apply.

> 
> It's much easier to keep it as NULL and make the fix in TRBE. It also 
> wouldn't need to be backported as far.
> 
>>   out:
>>
>> ---
>> base-commit: fa71e9cb4cfa59abb196229667ec84929bdc18fe
>> change-id: 20250904-cs_etm_auxsetup_fix_error_handling-cb7e07ed9adf
>>
>> Best regards,
> 


