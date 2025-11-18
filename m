Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA9AECEBF97
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 14:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=erEHQ4pvbvg9bgc6g+PKRhvaKSni7/5fNBZmCyyjnTM=; b=reyOeJd54NQfbvPGmmSbevCpVA
	I44W5zfSiMgxs1rtsEqhFx1r1b76FIpqm6b9mtHgGn70QgQT7iAHoot9rgy4zTeFyFGGgzMcdocbN
	n6tAlbWhu6jnCsyii1Si6K7fBHiJdJDOyaiSHJ2MgGzWQJGZL9BoIucJItvIhzrfWcET2qfcKImiX
	ezf1rggMIu28RmCYtL83MJSQ/CEsGpInzP19l+Wp8BO2gIiHwjRiXGgrXbsXwRe4qUusobRql+lYz
	LIeei2Z8dMAuIeE1kIsIQyHgdu+OyJtdbVPPJkFb6AYY1+I9Kb6IQ3t4xzYDDV41XgAcDx5pAet7n
	cmNmeTHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLN8L-00000000aYc-2WwC;
	Tue, 18 Nov 2025 14:56:41 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLN8H-00000000aY8-1M61
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 14:56:39 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4777771ed1aso39053675e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 06:56:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763477795; x=1764082595; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=erEHQ4pvbvg9bgc6g+PKRhvaKSni7/5fNBZmCyyjnTM=;
        b=uMKFl7oaLJeukANT9AIU1v3SAkKa71fjckB9vLNA8V7yhIOn27M/3BIYUaDInFos5o
         6PFMIHr2qA/cr1dSvEtE34d6azfVbHscWKcp4NTyvO/0M1T5oqGvoYX5VvYfpusmsQ90
         SDlPIiisx+FCeuSQeO1JvEN8Hrjo3wGRFuh3wGJczbcZF34TgYV+876sxCxkhMaDQzT5
         vEehjFEEb8L3Ghwlq/1oFCfdA13RS7Pisos1lXLErhyzgkZgKxyTUoPDbSGAGh3/ElWf
         HFbHxWe+wbN1chF9FY9lGL9CUenrwoEp/LicuMnMXD8IRwS3RIzAQRo2kTkticg0XFUc
         j/+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763477795; x=1764082595;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=erEHQ4pvbvg9bgc6g+PKRhvaKSni7/5fNBZmCyyjnTM=;
        b=pCw+A/nB4z+lXxRUO9mHssvfcP6AvdvgsrK64JMemqHii5Q31cJvdPLDUd/SNzZrR4
         3Lijk8bYoI8RkHh0u7L7caUQ3xul88dwovAIB+DHV8YpEzdm2YNdu211gjAcV873X7jG
         bC3+i+mvIneVo4qOa3sRSb8IN7SRAzdMg5Ws+ZoVjCM7GvhPRRdPGYf7RCdQBQTMAikL
         /gODsIxos9vr5mXojDakqWap37eNR9M6XuUciq8QSmHSRhZc4SlFci7yxnaxmFVwuAAS
         MBVnf5a7CqetRD11EaP0jmoDPN2V6/CS7nD+r+YTbaDPJo1HYOq3tS7c06lNjLZBNsoG
         CyOw==
X-Forwarded-Encrypted: i=1; AJvYcCXJc1SawQxwI4Fg41QssQmsNzuT2Ou1CWysbMhE9nj8snzceD2McWK8RN8k3A4bv5vj5mTeTpuwNPr1GdHKm7ln@lists.infradead.org
X-Gm-Message-State: AOJu0YwxwnVwl/O93+PxtbgmO9Tfpg8Q2m4ShYMZkpI9Vf7m2sskKk/h
	SvdQvMiC3FpOqkl5ApxMlNXaZVaw84/dVWcZ/BqZQ5IqQ9jw8CIwGlbkwIKWc0e1gag=
X-Gm-Gg: ASbGncv55u6kSjC4pYsY+RFcwo5S8wPdLbSPRI/1C0WiaO8CSGjHXyHmurswrSz64Mz
	UZlsNjMY/n/G/Pd2rkXbYIeu2W7slnnG9AOiIj/65k35sUj8NyyBQW39+hhdwoDJKu/e2wAGifp
	YEc+59PX+NGcXZ/Rg7vfYOoI19WPr/nhR2XHHRcsY4l/FLBkYALmO2DbobUflbPtZpqgiBnDyig
	4rLPV2MIAxHyolMK332MXqcxIOeYqVpC+zTamvvmBhGejwqw7ZPgKAfJEC7ioWm1i9r8e60efhm
	Fum0H0BelA8R+OIZu+olYOZ7CFgMrg/pLqNesu+/iH1BW/ujFiX0aB5lIu1VL8mxGw7UySMOJwv
	BPzsEn9xVCBZhyL/d/QdwOLPRQELb8AqPufW7/d5IeTlFsPSTcgkxYhXoGT/UWDp+aQifqV64cI
	VR3ykmiXE7zABvRjcy
X-Google-Smtp-Source: AGHT+IH5rPcLsF1PsanW87LKAAXsro5M9DDqlKkuIu9cobKHCgs8dMk+WcC9kiNwue3QlRTwXXWRBQ==
X-Received: by 2002:a05:600c:1d15:b0:477:aed0:f3fd with SMTP id 5b1f17b1804b1-477aed0fad1mr12311775e9.8.1763477795371;
        Tue, 18 Nov 2025 06:56:35 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4779d722bc5sm192660755e9.2.2025.11.18.06.56.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 06:56:34 -0800 (PST)
Message-ID: <0334300a-ae81-4b55-a3b0-c6137e13be6a@linaro.org>
Date: Tue, 18 Nov 2025 14:56:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/13] coresight: Hide unused ETMv3 format attributes
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20251112-james-cs-syncfreq-v4-0-165ba21401dc@linaro.org>
 <20251112-james-cs-syncfreq-v4-4-165ba21401dc@linaro.org>
 <20251114145521.GD3568724@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20251114145521.GD3568724@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_065638_474487_79FF6846 
X-CRM114-Status: GOOD (  24.18  )
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



On 14/11/2025 2:55 pm, Leo Yan wrote:
> On Wed, Nov 12, 2025 at 03:22:10PM +0000, James Clark wrote:
>> ETMv3 only has a few attributes, and setting unused ones results in an
>> error, so hide them to begin with.
>>
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> ---
>>   drivers/hwtracing/coresight/coresight-etm-perf.c | 19 +++++++++++++++++++
>>   1 file changed, 19 insertions(+)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
>> index 17afa0f4cdee..91132abca244 100644
>> --- a/drivers/hwtracing/coresight/coresight-etm-perf.c
>> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
>> @@ -106,8 +106,27 @@ static struct attribute *etm_config_formats_attr[] = {
>>   	NULL,
>>   };
>>   
>> +static umode_t etm_format_attr_is_visible(struct kobject *kobj,
>> +					  struct attribute *attr, int unused)
>> +{
>> +	/* ETM4 has all attributes */
>> +	if (IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM4X))
>> +		return attr->mode;
>> +
>> +	/* ETM3 only has these attributes */
>> +	if (attr == &format_attr_cycacc.attr ||
>> +	    attr == &format_attr_timestamp.attr ||
>> +	    attr == &format_attr_retstack.attr ||
>> +	    attr == &format_attr_sinkid.attr ||
>> +	    attr == &format_attr_configid.attr)
> 
> Do we support configid for ETM3?
> 

They're "activated" in etm_setup_aux() so this would be for both ETM3 
and 4. But they're only subsequently "enabled" for ETM4. So no, they're 
not supported. I'll hide this attribute too.

I can leave it for a later fix if we want to stop activating them, but I 
don't think it does any harm.

>> +		return attr->mode;
> 
> It is good to give a bit information why only these attributes
> supported, e.g.,
> 
>    /*
>     * ETM3 only support subset attributes (see ETM3X_SUPPORTED_OPTIONS),
>     * keep 'sinkid' attr for specifying sink ID.
>     */
> 
> Two side topics but not issues caused this patch:
> 
> - Since CTXTID/CTXTID2 is only used for ETM4x, we can remove "#if
>    IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM4X)" from the
>    format_attr_contextid_show() function.

Will change to CONFIG_ARM64 as mentioned on the other thread.

> 
> - etm_parse_event_config() does not check attr->config3, thus user
>    sets 'cc_threshold' it will slip without any error report.

Will ignore this comment as mentioned on patch 7, we're not doing any 
errors for unsupported arguments anymore.

> 
> Thanks,
> Leo
> 
>> +
>> +	return 0;
>> +}
>> +
>>   static const struct attribute_group etm_pmu_format_group = {
>>   	.name   = "format",
>> +	.is_visible = etm_format_attr_is_visible,
>>   	.attrs  = etm_config_formats_attr,
>>   };
>>   
>>
>> -- 
>> 2.34.1
>>


