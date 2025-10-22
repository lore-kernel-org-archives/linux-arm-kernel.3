Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB843CCD195
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 09:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L2q2OfszUqpeadKayMdXndWnS6PaM7t8jQzEItp97vM=; b=tUiy6ZjPQvL+aUlejXYnd53laV
	m+H7FU1XkXvVaqk+OE+dqKx+7wblBcxTpyOltzFUzuwJO1vCMeNtyh5wWNUuG0vWjZV2TI1itcyRq
	3ioN3JNFMuXPm1baApSJ9L8LIsYg7G2mOYGF/DKTnBQUroaRIFPrDJbzO2soOgrThncdOull4fXFm
	e6ZXti9e6cqxtsHW/Q7QqECnIhyYOALDMl98egM3T/bNdLmRbcBIbS6T+z5EfzYh9fxlU6mW3FJT+
	ub1gENz5YYusebe7vhIJiYhTM1TQGLq0VKftfLxvzqjLwDZUuMXWHjpcDllGeAfMu4sQlk3+BtaBW
	sYUhTiZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBVOE-00000002J2t-1UaP;
	Wed, 22 Oct 2025 09:44:18 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBVO8-00000002Iz6-3yQe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 09:44:14 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-47117e75258so33036245e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Oct 2025 02:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761126251; x=1761731051; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L2q2OfszUqpeadKayMdXndWnS6PaM7t8jQzEItp97vM=;
        b=nmXoa9WlKzPGoLRiTjg+Bu5JHMNITkW5Y5+n2/wHdE3XBvRSmzyWO6svgBVX5LK1aJ
         VW0RnhilLf72R8710nPXfwRmxvuixwOMWwZ+fGVL48PvdvcUD62KQcYUu0HCr5aiHxDq
         QJwNXKOhkfqxML5wOuwD6jMEdH2xLYeL3NHnR3cIX7CBCHYEI9bF2o3XWsRKRozuATPf
         PpFCwXzafWynSizBlDNqd/I2QxOnj7A5lRTobJ1MD/PIsiUbmicELCP3f2Fzmnp8AaB0
         h5ytZoJI5/vCWYXw5VcTG9zEJj7oi2o3OfX+PS8RapVUoMDBHty1eAz1CMMqyPfmrYea
         bVuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761126251; x=1761731051;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L2q2OfszUqpeadKayMdXndWnS6PaM7t8jQzEItp97vM=;
        b=CMmx4YFVY/WkF+Gxh6lDP3fUtysS7wKF85CwDALk9jAnbV7KbAsokz/K9kjSvYJ9DL
         NMiQCSlQtjn3BEpoWcfD/cKRFnPTlWbL5JoaHTExU9fs/MqKxqOHqgio90NWH8V+sPkn
         GY48ZiHWekBU48mjSfGusD76yDaHbVml6Z5JolHyJrzwOr/TV8fhBlHDbBCBoe2jSjT0
         /LOOs560jEtnN5yvmhSt9QyPPc5/O3AF+Wycsj/sQd8CEQAjpoeCwtoiCpNvZNErhZVl
         PeuWH2n+v+lIj0KqYxfBSxlHiafoRvmEvnWWrXaN/UGzs+jD9iMHsKOQ4uZNpBRCoeYC
         GuaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXAVCGf1PCtGddJgU0TiZNnX1G0wxiua5tYIaDacEQlbBaqTFMneoP1cuczwj7mN4VNlyzRToyPVOxgXT+gC3qe@lists.infradead.org
X-Gm-Message-State: AOJu0Yw58+xInAJUaxVkiPpaIBjRaNt+2w7Cc/UaFkzkSIanlrKOIbmx
	LyXBFdrw4SEpkygC6kpvEujFEl+FbtNwo9dlIFqXKj+/03GXcmqf9fhydpDh2+2gHGo=
X-Gm-Gg: ASbGncuLILUTOIWUUryUd8wT7EGcwxfnqDOzFJ0VQMDC7kB5FXAjeTOIyfB+AJjMGw4
	PUfY5+UQdDiAdj8aYJZbh28U4/lFotL8xfnnnXCeYCLkeUbFouvnT5a514PSbr3ua4pn7Jbsab0
	TU7gxzujE9qzKPC0NeeJj3XFzR83OkLZHEKxVs+ZR+xFYMbzu/YNojx0ZEAg0A/LYE3MHGWcO+6
	0lCMlAZKaDuxHjJIrwy4Hob1FJphkSI85PD78/e/djRuEqSMJAQbbaAeIEWrqnpSthDhWV9hMyn
	CoLzzV5lVcV8zJcAxfLHnNzrblbhTg/tjBvnKVOXSOft0uJCrKlst/g1s+Uk6nPRPsgOFydqxzT
	wUV7oWiDx1B1Tp1E8XlxGlODmiBcZVuqEELub8OaApyi3ez9tKzSsha3tH6mtE7nQdgH8RIKiOL
	BrZrk5jMoEzlTJYoFo
X-Google-Smtp-Source: AGHT+IHyKNaFr6+KT+wcGuk5QcgPZ2E1s+s6FjRqi/hA/8rUpJL4cF8k2yXbn4dNu2GHhIteFm2DEA==
X-Received: by 2002:a05:600c:4e93:b0:471:9da:524c with SMTP id 5b1f17b1804b1-4711789e39emr140864945e9.12.1761126250776;
        Wed, 22 Oct 2025 02:44:10 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47496d26affsm32511685e9.12.2025.10.22.02.44.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 02:44:10 -0700 (PDT)
Message-ID: <3c6b723c-d3d4-4be7-9333-9ab46d270194@linaro.org>
Date: Wed, 22 Oct 2025 10:44:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] coresight: Add format attribute for setting the
 timestamp interval
To: Leo Yan <leo.yan@arm.com>
Cc: Mike Leach <mike.leach@linaro.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20251002-james-cs-syncfreq-v3-0-fe5df2bf91d1@linaro.org>
 <20251002-james-cs-syncfreq-v3-4-fe5df2bf91d1@linaro.org>
 <CAJ9a7Vj1NnikoJyabXnad+=3SDULKCyqoZiNb_S66SkG+HD+dw@mail.gmail.com>
 <bfce6b68-783f-4aa1-b9db-d905230be609@linaro.org>
 <20251021172224.GO281971@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20251021172224.GO281971@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_024413_062604_889A05EE 
X-CRM114-Status: GOOD (  43.72  )
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



On 21/10/2025 6:22 pm, Leo Yan wrote:
> On Wed, Oct 15, 2025 at 04:19:04PM +0100, James Clark wrote:
> 
> [...]
> 
>>>> -static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata)
>>>> +static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata,
>>>> +                                      struct perf_event_attr *attr)
>>>>    {
>>>>           int ctridx;
>>>>           int rselector;
>>>>           struct etmv4_config *config = &drvdata->config;
>>>> +       u8 ts_level = ATTR_CFG_GET_FLD(attr, ts_level);
>>>> +
>>>> +       /* Disable when ts_level == MAX */
>>>> +       if (ts_level == FIELD_GET(ATTR_CFG_FLD_ts_level_MASK, UINT_MAX))
>>>> +               return 0;
>>>>
>>>
>>> Returning 0 from this function _enables_ the timestamps
>>>
>>
>> Returning 0 just means that etm4_parse_event_config() doesn't exit with an
>> error. For ts_level == MAX we want to disable timestamps generated by the
>> counter, but we still want the minimum periodic timestamps.
>>
>> To disable all timestamps you'd need to have attr->config & BIT(ETM_OPT_TS)
>> == false. This is set by the "timestamp" format flag which I tried to
>> explain that in the docs change.
>>
>> I could also change the comment to say "/* Disable counter generated
>> timestamps with ts_level == MAX */"
>>
>> It's unfortunate that there are now two format options for timestamps. Maybe
>> instead of adding a second option we can change "timestamp" from a 1 bit
>> field to 4 bits, with the following meanings:
>>
>>   0:     No counter timestamps or SYNC timestamps
>>   1-14:  Counter timestamps = 2 ^ x. Plus SYNC timestamps
>>   15:    Only SYNC timestamps
> 
> I am just wandering how can extend "timestamp" from 1 bit to 4 bits.
> 
>    #define ETM_OPT_TS              28
>    #define ETM_OPT_RETSTK          29
> 
>    PMU_FORMAT_ATTR(timestamp,      "config:" __stringify(ETM_OPT_TS));
>    PMU_FORMAT_ATTR(retstack,       "config:" __stringify(ETM_OPT_RETSTK));
> 
> "retstack" has occupied a higher bit, we cannot naturelly extend
> "timestamp" field?

Easy, just put it wherever there is a hole. I think there's one in 
"config:4-7", but it could be put in config3 or config4:

  /* Old enable timestamp bit for backwards compatibility */
  #define ETM_OPT_TS_old              28
  PMU_FORMAT_ATTR(timestamp,      "config:4-7");

The position of the timestamp field is published and tools read it, so 
as long as we don't change the name of it it works fine.

We only keep the old bit 28 because we know old Perf was buggy and 
didn't read the bit position, but if it wasn't we wouldn't even need to 
do that.

> 
> Even we can extend "timestamp" format to 4 bits, it will be mess when
> run the updated perf on old kernels.  Let's see an example:
> 
>    perf record -e cs_etm/timestamp=0/ -- test
>    perf record -e cs_etm/timestamp=2/ -- test
> 
> Because the lowest bit is cleared for both timestamp=0 and timestamp=2,
> the old kernel support only one bit always treats these two setting as
> timestamp disabled, or the perf tool needs to do extra checking for
> old kernel.

It won't be. Old kernels report a 1 bit field and Perf errors out if you 
try to put a 2 into 1 bit. Very old Perfs just set bit 28 which new and 
old kernels will respect.

> 
>> Now we basically have the same meanings except you also have to set the
>> timestamp bit. Seems a bit pointless.
> 
>> Previous versions of Perf were hard coding the timestamp format bit rather
>> than reading it out of
>> "/sys/bus/event_source/devices/cs_etm/format/timestamp" though:
>>
>> -       /* All good, let the kernel know */
>> -       evsel->core.attr.config |= (1 << ETM_OPT_TS);
>>
>> For that reason we'd have to leave that one where it is for backwards
>> compatibility. If it's set it would be equivalent to the new wider timestamp
>> field == 1.
> 
> Are you suggesting the timestamp field to be extended to two
> non-consecutive fields?

No, just a new 4 bit field in a new position.

> 
> For me, this is even worse than current two discrete formats. The reason
> is it is complex in implementation, and it is not directive for usage

I really don't think the implementation is complex. We just extend the 
field to 4 bits and make 0 off, max is the lowest rate possible, and 
every other value in between is in between.

> (users need to digest the field for three different semantics: on/off,
> counter, and SYNC mode only).
> 

That's like any enum, it has multiple meanings for each value. I'd argue 
that two fields for the same thing is more complicated because now this 
won't work out of the box, and it would work if we did 1 field:

   perf record -e cs_etm/ts_level=2/ -- test

There will be no warning, but no timestamps either. You have to specify 
both manually. And the only reason for that awkwardness in the API is 
that we added a new field instead of extending the existing one:

   perf record -e cs_etm/ts_level=2,timestamp/ -- test

> Thanks,
> Leo
> 
>> I don't know if there's any precedent for changing the bitfield that backs a
>> format field, but presumably that's the point of publishing them in files
>> rather than a header.
> 
> 
>>
>>>>           /* No point in trying if we don't have at least one counter */
>>>>           if (!drvdata->nr_cntr)
>>>> @@ -667,12 +674,8 @@ static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata)
>>>>                   return -ENOSPC;
>>>>           }
>>>>
>>>> -       /*
>>>> -        * Initialise original and reload counter value to the smallest
>>>> -        * possible value in order to get as much precision as we can.
>>>> -        */
>>>> -       config->cntr_val[ctridx] = 1;
>>>> -       config->cntrldvr[ctridx] = 1;
>>>> +       /* Initialise original and reload counter value. */
>>>> +       config->cntr_val[ctridx] = config->cntrldvr[ctridx] = 1 << ts_level;
>>>>
>>>>           /*
>>>>            * Trace Counter Control Register TRCCNTCTLRn
>>>> @@ -762,7 +765,7 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
>>>>                    * order to correlate instructions executed on different CPUs
>>>>                    * (CPU-wide trace scenarios).
>>>>                    */
>>>> -               ret = etm4_config_timestamp_event(drvdata);
>>>> +               ret = etm4_config_timestamp_event(drvdata, attr);
>>>>
>>>>                   /*
>>>>                    * No need to go further if timestamp intervals can't
>>>>
>>>> --
>>>> 2.34.1
>>>>
>>>
>>> Regards
>>>
>>>
>>> Mike
>>>
>>> --
>>> Mike Leach
>>> Principal Engineer, ARM Ltd.
>>> Manchester Design Centre. UK
>>


