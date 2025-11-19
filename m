Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CE2CCF31AE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 12:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hjdgFaHq4s478NGT+krUukAjT5h9G3MEsOtOmyXQZrk=; b=ViU5FfNZpNNGR56Rc3lrTbFDXn
	qclmJRppaD6XQMMyv8SNJl1OwcJnfz+Dxryg1Nlb27JHMk6n0hnrP3r84MEOplpNLtlwyG7apJtbv
	38TFqjC7afSoG2ItzB0B8hm1bLegflQ7iKTpPLhrFPlmlpDdrjfjzstvRagaK2z4nteHOtoilPU/B
	pVXbcE3yOFLaqyQj0Wc0+7n4V3eInr9dr3iyccIqxiyLXEEHl+CPWThwT8BWoLvaasgQK1TysK5Pg
	GbN/LClwTCxf4qBJQPBSRfRNjHHV2yUhBd5cjKtqCr4lPlrWU/Xg0jK/Td3tMPjpRfbt5GwocFM2X
	xUD0v/5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLgrU-000000034rR-2amh;
	Wed, 19 Nov 2025 12:00:36 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLgrS-000000034r0-0cV7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 12:00:35 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-640c1fda178so1938119a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 04:00:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763553632; x=1764158432; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hjdgFaHq4s478NGT+krUukAjT5h9G3MEsOtOmyXQZrk=;
        b=f3o9kaIi3ZxFfupWUSqAaP3RnzeYZqXQHcz3ln8rDtObXwzhQW/q4IbemHLLfoOkH8
         R+Kiei3nfQ4S8pl4Cs+dktWgGIZ9aM60Snd20VMxXtD4iY13BOPoaYaduJZ8ZtOgu6Oi
         y1mV0GRBky0uN0+c2VsBkpTTa+q6R0CcAFJf9d8WjNlZ9nOZMGIFHB1v2GBC1xHQN2Tx
         a5ZSdRtYk7d18yVrYZ/Jg5of4eKmKCwHTP84dCP5sZHN4XdHo2u1aIVBZ9SdU3dImGjH
         1mONNwlDLz3XRUSWz136F0LtI4BobPKmyA3VF1yq8FoEjox5Gxy1W1l3na+MFUNEYsrw
         IKGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763553632; x=1764158432;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hjdgFaHq4s478NGT+krUukAjT5h9G3MEsOtOmyXQZrk=;
        b=oVU/ANM8ESaj3hzdUMPmHEEmpZwPhsWhJqQgneWuHX8zhgOx4vY7w46VV22OgWHDqJ
         DGoWh4IMFxnWqmjZclgsK5YbJa6I3tV8xZSUbPp2u48EME30TTWyAR23Vd7er1jZ60bB
         v412RVb07Un6ig0+9P3/RZM6j0n5gHNk023bF6ss3LinffBvLmUF2sNYxXLLIApoI93l
         6s9tUoW8ikya19QLTNDDSI1GtA7ZHH3ElHviVEEda4mxfb/htRX9RfQhiQ4ZFJm/0VH3
         3yhEu+104NSSRgz6Yi18AEPwO2ttmHsHB/kzmmeU5wlUObIPhs6kLl+Dn/MnsW4Okg1h
         dlLw==
X-Forwarded-Encrypted: i=1; AJvYcCVOAnJ8KHcLr+n0t7GQbXn+iHFFtXgJKbuG3dwNKO9XZZiHmGlmmBDhRTh+0G+hJt4kIPlHZIFfZE5k/99a96aP@lists.infradead.org
X-Gm-Message-State: AOJu0Yzi5ABqrfXGy4/HD5CNrRYeJWDvuNj2RcssUFyID7lUi1YEvAru
	1wrUG6nHzr8fiPThf90ko9MChmofsK+45MweE7CJZYX4MbbQQSU8lwR98t8LrDKlgxg=
X-Gm-Gg: ASbGncs+LZAVbYycUb84JsM/rZ1I+RxC42/cKENtloI4OozogjZQzv31KR44Ff+iVCK
	Eb5GbA7JBR4oKA9lY6QwYo5pB2O6MGM6VcbF9MRFMBq2G0vBUMCOphjvLmqfenPKamRVYOzm+Ss
	ufpbTShcKK0HYdT9ElXBKO3l4l+fGqyn9kStTqCpYYHkVXH/PLYCqKD3ZT5WvxxElRyagrdCLwQ
	6TarOnduBYz4QHEbnp9ur6piZUs7Iq/LHyLq5ia1CkxXQM57v03XPgmCK3OKhSvzzb8OFuFHmnP
	qWLNsed4xj6+Rfr0XDIG2d3Hw4QHxNj7vtUZzIrVSO2c8m/3aTiLABdXjxvSivaAoEJNwisPdwb
	1FGExl/ZJkVHM+OzNN5hP0fKiIGlLlXkZExBMZiOVu0Ed2vS+3Ny1TgobQj9DQE6ZLtoi3CQ1mT
	ItCwmoNdPChlQOYd2YoPtCWLc9fdU=
X-Google-Smtp-Source: AGHT+IGPn4+V4Y0JmuRCvY3D1OCOga4PGonrGR/jtRNGRuCpMaAJovENXI98966DZDBfDN8BRbsfXA==
X-Received: by 2002:a05:6402:5254:b0:640:7690:997e with SMTP id 4fb4d7f45d1cf-64350e03a8bmr18456607a12.3.1763553632151;
        Wed, 19 Nov 2025 04:00:32 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6433a3d8775sm14948916a12.5.2025.11.19.04.00.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 04:00:31 -0800 (PST)
Message-ID: <43a60afe-5170-4801-ae70-9243cf7b45b8@linaro.org>
Date: Wed, 19 Nov 2025 12:00:30 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/13] coresight: Interpret perf config with
 ATTR_CFG_GET_FLD()
To: Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20251118-james-cs-syncfreq-v5-0-82efd7b1a751@linaro.org>
 <20251118-james-cs-syncfreq-v5-8-82efd7b1a751@linaro.org>
 <CAJ9a7VgQH4yc8490CQSv1S6k+=Uc6dEjyEpgRp1EwUQdwdxOHQ@mail.gmail.com>
 <416cf32d-d647-46dd-bcef-acc019490561@linaro.org>
 <CAJ9a7Vg9HsMsTP-zroTgaaKWTPkSXE1u5WMORuqMLKSDDz2HSw@mail.gmail.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <CAJ9a7Vg9HsMsTP-zroTgaaKWTPkSXE1u5WMORuqMLKSDDz2HSw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_040034_240612_A2BC16D2 
X-CRM114-Status: GOOD (  25.40  )
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



On 19/11/2025 11:45 am, Mike Leach wrote:
> Hi James
> 
> On Wed, 19 Nov 2025 at 11:26, James Clark <james.clark@linaro.org> wrote:
>>
>>
>>
>> On 19/11/2025 9:32 am, Mike Leach wrote:
>>> Hi James
>>>
>>> On Tue, 18 Nov 2025 at 16:28, James Clark <james.clark@linaro.org> wrote:
>>>>
>>>> The "config:" string construction in format_attr_contextid_show() can be
>>>> removed because it either showed the existing context1 or context2
>>>> formats which have already been generated, so can be called themselves.
>>>>
>>>> The other conversions are straightforward replacements.
>>>>
>>>> Signed-off-by: James Clark <james.clark@linaro.org>
>>>> ---
>>>>    drivers/hwtracing/coresight/coresight-etm-perf.c | 26 +++++++++++++++---------
>>>>    1 file changed, 16 insertions(+), 10 deletions(-)
>>>>
>>>> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
>>>> index 28f1bfc4579f..1b9ae832a576 100644
>>>> --- a/drivers/hwtracing/coresight/coresight-etm-perf.c
>>>> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
>>>> @@ -80,12 +80,19 @@ static ssize_t format_attr_contextid_show(struct device *dev,
>>>>                                             struct device_attribute *attr,
>>>>                                             char *page)
>>>>    {
>>>> -       int pid_fmt = ETM_OPT_CTXTID;
>>>> +       /*
>>>> +        * is_kernel_in_hyp_mode() isn't defined in arm32 so avoid calling it
>>>> +        * even though is_visible() prevents this function from being called.
>>>> +        */
>>>> +#if IS_ENABLED(CONFIG_ARM64)
>>>> +       if (is_kernel_in_hyp_mode())
>>>> +               return contextid2_show(dev, attr, page);
>>>>
>>>> -#if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM4X)
>>>> -       pid_fmt = is_kernel_in_hyp_mode() ? ETM_OPT_CTXTID2 : ETM_OPT_CTXTID;
>>>> +       return contextid1_show(dev, attr, page);
>>>> +#else
>>>> +       WARN_ONCE(1, "ETM contextid not supported on arm32\n");
>>>> +       return 0;
>>>
>>> Context ID is supported in aarch32 - and traced in etmv3 / ptm and etmv4.
>>>
>>> Mike
>>>
>>
>> Not in Perf mode unless I'm missing something:
>>
>> #define ETM3X_SUPPORTED_OPTIONS (ETMCR_CYC_ACC | \
>>                                   ETMCR_TIMESTAMP_EN | \
>>                                   ETMCR_RETURN_STACK)
>>
>> Only these options are currently accepted. I suppose the comment is
>> describing what the current behavior is, whether that is what we want is
>> another thing.
>>
>> But if we do start supporting context ID in ETMv3 we can update that
>> comment.
>>
> 
> Unlikely - but the comment seems to conflate core architecture and etm
> architecture.
> A core with aarch32 can be traced in etm4 - i.e etm4 supports A64, A32
> and T32 instruction sets.
> If this set gets another version it might be worth saying "not
> ETMv3/PTM" rather than not A32.
> 
> Mike
> 
> 

Oh I see what you mean, yes that would be slightly better. But then to 
make the code match the warning it might also make sense to change 
CONFIG_ARM64 back to CONFIG_CORESIGHT_SOURCE_ETM4X, which Leo suggested 
to change. Maybe I can just delete the warning text, practically this 
warning can never be hit.

It would have been nicer to avoid any conditional compilation or 
warnings and comments, because we're hiding contextid on ETMv3 anyway. 
It's unfortunate that the compiler doesn't allow us to ignore 
is_kernel_in_hyp_mode() being undefined even with short circuit evaluation.

>>>>    #endif
>>>> -       return sprintf(page, "config:%d\n", pid_fmt);
>>>>    }
>>>>
>>>>    static struct device_attribute format_attr_contextid =
>>>> @@ -337,7 +344,7 @@ static bool sinks_compatible(struct coresight_device *a,
>>>>    static void *etm_setup_aux(struct perf_event *event, void **pages,
>>>>                              int nr_pages, bool overwrite)
>>>>    {
>>>> -       u32 id, cfg_hash;
>>>> +       u32 sink_hash, cfg_hash;
>>>>           int cpu = event->cpu;
>>>>           cpumask_t *mask;
>>>>           struct coresight_device *sink = NULL;
>>>> @@ -350,13 +357,12 @@ static void *etm_setup_aux(struct perf_event *event, void **pages,
>>>>           INIT_WORK(&event_data->work, free_event_data);
>>>>
>>>>           /* First get the selected sink from user space. */
>>>> -       if (event->attr.config2 & GENMASK_ULL(31, 0)) {
>>>> -               id = (u32)event->attr.config2;
>>>> -               sink = user_sink = coresight_get_sink_by_id(id);
>>>> -       }
>>>> +       sink_hash = ATTR_CFG_GET_FLD(&event->attr, sinkid);
>>>> +       if (sink_hash)
>>>> +               sink = user_sink = coresight_get_sink_by_id(sink_hash);
>>>>
>>>>           /* check if user wants a coresight configuration selected */
>>>> -       cfg_hash = (u32)((event->attr.config2 & GENMASK_ULL(63, 32)) >> 32);
>>>> +       cfg_hash = ATTR_CFG_GET_FLD(&event->attr, configid);
>>>>           if (cfg_hash) {
>>>>                   if (cscfg_activate_config(cfg_hash))
>>>>                           goto err;
>>>>
>>>> --
>>>> 2.34.1
>>>>
>>>
>>>
>>
> 
> 


