Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C48BAD11183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 09:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R7s6cE++aqSUFKnBMsR0G5G74lCzGeUp9KJnQeOz+5E=; b=v6EFWW22iZPbJ8QnTTAenctBG0
	d194MuliDMO3DxqcsC3XfaIjmuI/d2yq35GjrI0E3dsOr/QVE9pZaAasvDT5+O4CufXP9y0jBoEEb
	K8x5cDAsrBXg5KCJ5VzipczCNUIQ7cfu7N6xtbmGKeWS/XoMnEJxHicVoZqUvls12jq5lTa2yYugd
	eIjtWDYr9G+zFsQu94Vl6opaE3JbDWsEScYN6X9h7By19tpTf7AUN61pHzDQKN5YrD1cYJlVCrlD5
	xnuPyBk8oPaSQvqirM3Krj5KI0VrMSjrLh+JNhthkfh2OijwP214y29O864SA0dP6PV3Ud9iV+zcV
	ZECee8Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOY7r-0000000GGWv-0hbM;
	Thu, 27 Nov 2025 09:17:19 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOY7o-0000000GGWI-1lHZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 09:17:17 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-42b2e9ac45aso399052f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Nov 2025 01:17:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764235034; x=1764839834; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R7s6cE++aqSUFKnBMsR0G5G74lCzGeUp9KJnQeOz+5E=;
        b=FL6mWwICsAELFkhHCUfds30YTnwDiggLA9X7uFQUbqeInmLvsrY3Xcvs7x2Xm73XvH
         +paZnfJ69xyg2tC+4FfXTXEmTOpJPdSlqkF4I9U/VU8yVqQcFBfqlS6gU+GNgcy3DLk6
         XSR+WXr433WIQiaWIIhDmbJhR6O/s/THATKYV8h15smddHV54ocXTsc+4ig6Ly5sAHKl
         TjNTRlj68NbqMIE+AyF8a51lU4p0oET/JsxTTPks3BGnJiXeS7WaGxFerPIuGwnNlspc
         zpydjSTYvUIIaWN5QOT+sFUSKGSQU9CbJKDnDPYDc/LAgZjbOWbVdnsqz1/JztkBgbsG
         JBPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764235034; x=1764839834;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R7s6cE++aqSUFKnBMsR0G5G74lCzGeUp9KJnQeOz+5E=;
        b=pujuqsfXCGexoNq5AtpsDY8eh3F5BtMdx74+qtk2yG21Q8uhYHv+3XIxpzJb9b218F
         0egnLQLYTtWyBCYzxkraIiWO3ljtTnCRms8k05NJGOHB/YGeZs0n23SqLNoRpGn2MXdq
         rADVCSYNhPpJFabqb3SnJXpS3Np0GRKznBljfUTZMhHf4uW2OwfRlLYtDKMkZnvrmEFC
         eus69uZkGzoUJtXM26Hto4ew5REK1cHAABzLO/tXyc2L2tt5NE5vzl1cqgrlDAiRYpjX
         k2lBsaoqfV49Hhfret2PgE5KRioq3zCPi7KoZYxdKO92KDf2zTlNlr8zIaeBYmJNxXzL
         susA==
X-Forwarded-Encrypted: i=1; AJvYcCVfr5oI315S/Nn7pyzi12gZbSXA+siJ89cipR3ijjLB8llBtRkDu4KtgX+7SEGPxMEo9tX8rW3vz0fFdGoODTN/@lists.infradead.org
X-Gm-Message-State: AOJu0YzmPItn+b5P07Fur46fQmFNfFrQw5FDVGKDNqF3ewHHEs5VNRN/
	R/HNeV5bDIG7Pte7PcfNMaOyy2MsaNGT74dTMdW7rsZXElODYJlLF2dGnYLlxxthd9w=
X-Gm-Gg: ASbGnctWYFiK7ZriZaOeb8YUtD/Np70r1AVNNQHtds0nXDqzGBbvmmDugHxNusSfHA2
	zGr6hcPm2hpmImhijyELb5YfZJl0hIyRShtOhFhx+K8XDCmnizbXrud8Tsc/ecMEluEYKa07apL
	LAXZLixXV5fvAqW9GtyZR+aTLK1rZbDKXaIGhyxzdcJQTPITlzEddR7OSIAOu3EkRt3AMbquQSk
	ma1Twuh4erry3fl9sb6gkJiisHX2PqVWZGYxVDf4iIfO338u2RjV9S67EPgX/sm5tcbafKr2GC1
	TODi2LeNjGSi0+wYe9zNmbLyXDXf2HdFmLKFqKvW7jlMp/42JCGOuvj8uQsPDQZ2JTgOHrwfff5
	zxizvnXS0d0TnWJvtGgfZHUJVoxuJy6pKWnn/TYhtCU02uvoKt+SBvGqjQE/WY5Tl07/QZSXV4S
	g7OCxAGPv49hpcmOJm
X-Google-Smtp-Source: AGHT+IHMYZZ56RtTkgImb02ngxPYjvhlBk8TwzkqtoGo5krRVnM2mglutVBFMQNBv9Z7KKR5+lHRAw==
X-Received: by 2002:a5d:588c:0:b0:3ee:3dce:f672 with SMTP id ffacd0b85a97d-42e0f1e3428mr10030410f8f.4.1764235034134;
        Thu, 27 Nov 2025 01:17:14 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1cab9af3sm2315819f8f.41.2025.11.27.01.17.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 01:17:13 -0800 (PST)
Message-ID: <f217cbdc-a350-438e-a1b9-a377e6267337@linaro.org>
Date: Thu, 27 Nov 2025 09:17:12 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: etm3x: Fix buffer overwrite in cntr_val_show()
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: Mike Leach <mike.leach@linaro.org>, suzuki.poulose@arm.com,
 alexander.shishkin@linux.intel.com, pratikp@codeaurora.org,
 mathieu.poirier@linaro.org, gregkh@linuxfoundation.org,
 jserv@ccns.ncku.edu.tw, marscheng@google.com, ericchancf@google.com,
 milesjiang@google.com, nickpan@google.com, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251121002350.1166758-1-visitorckw@gmail.com>
 <172ca2d9-4a6f-4498-bdfd-8aa7428581ce@linaro.org>
 <aSCbJR9aT1vOpz0a@google.com>
 <05babb6d-a588-49f8-a34a-c82d5f58adf5@linaro.org>
 <CAJ9a7VipxW5-2roAQA3y212sQWr1kq2HNbLK1jmLNP1jFseYiQ@mail.gmail.com>
 <68efd5a2-3b65-4f37-9bf0-40c4e5ade480@linaro.org>
 <aSgPhd4u3Oqi3Ymy@google.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <aSgPhd4u3Oqi3Ymy@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_011716_516845_60BF9725 
X-CRM114-Status: GOOD (  49.13  )
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



On 27/11/2025 8:44 am, Kuan-Wei Chiu wrote:
> On Wed, Nov 26, 2025 at 10:57:23AM +0000, James Clark wrote:
>>
>>
>> On 26/11/2025 10:49 am, Mike Leach wrote:
>>> Hi,
>>>
>>> On Mon, 24 Nov 2025 at 16:12, James Clark <james.clark@linaro.org> wrote:
>>>>
>>>>
>>>>
>>>> On 21/11/2025 5:02 pm, Kuan-Wei Chiu wrote:
>>>>> Hi James,
>>>>>
>>>>> On Fri, Nov 21, 2025 at 09:50:03AM +0000, James Clark wrote:
>>>>>>
>>>>>>
>>>>>> On 21/11/2025 12:23 am, Kuan-Wei Chiu wrote:
>>>>>>> The cntr_val_show() function is meant to display the values of all
>>>>>>> available counters. However, the sprintf() call inside the loop was
>>>>>>> always writing to the beginning of the buffer, causing the output of
>>>>>>> previous iterations to be overwritten. As a result, only the value of
>>>>>>> the last counter was actually returned to the user.
>>>>>>>
>>>>>>> Fix this by using the return value of sprintf() to calculate the
>>>>>>> correct offset into the buffer for the next write, ensuring that all
>>>>>>> counter values are appended sequentially.
>>>>>>>
>>>>>>> Fixes: a939fc5a71ad ("coresight-etm: add CoreSight ETM/PTM driver")
>>>>>>> Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
>>>>>>> ---
>>>>>>> Build tested only. I do not have the hardware to run the etm3x driver,
>>>>>>> so I would be grateful if someone could verify this on actual hardware.
>>>>>>>
>>>>>>> I noticed this issue while browsing the coresight code after attending
>>>>>>> a technical talk on the subject. This code dates back to the initial
>>>>>>> driver submission over 10 years ago, so I was surprised it hadn't been
>>>>>>> caught earlier. Although I cannot perform runtime testing, the logic
>>>>>>> error seems obvious to me, so I still decided to submit this patch.
>>>>>>
>>>>>> Nice find. I think the point that it wasn't caught changes how we fix it.
>>>>>> Either nobody used it ever - so we can just delete it. Or someone was using
>>>>>> it and they expect it to always return a single entry with the value of the
>>>>>> last counter and this is a potentially breaking change. So maybe instead of
>>>>>> fixing this we should add a new cntr_vals_show() which works correctly. But
>>>>>> then again if nobody is using it we shouldn't do that either.
>>>>>
>>>>> Thanks for your feedback.
>>>>>
>>>>> I agree that if any tool relies on the current behavior, this patch
>>>>> would break the ABI and violate the hard rule that we must never break
>>>>> userspace.
>>>>>
>>>>> However, I am not sure how to determine if any userspace tools are
>>>>> actually using this sysfs interface. Is there a recommended way to
>>>>> verify this, or a standard procedure/convention to follow in this
>>>>> situation?
>>>>>
>>>>> Regards,
>>>>> Kuan-Wei
>>>>>
>>>>
>>>> There's no way of knowing apart from deducing that there are 0 users of
>>>> the 'correct' version of the API because it never existed. This isn't
>>>> even a regression, it was broken from the beginning.
>>>>
>>>> I suppose it does work when hardware only has one counter, but I don't
>>>> know how likely that is?
>>>>
>>>> Looking at cntr_val_store() I think I was wrong before when I said it
>>>> should be a separate file for each counter. Writing to it already writes
>>>> to the counter currently selected by cntr_idx and splitting it out to
>>>> separate files would have to break that too. So we can fix the display
>>>> bug by making show operate on the currently selected counter in the same
>>>> way as store. Then it makes a bit more sense and we can delete the
>>>> "counter %d: " prefix.
>>>>
>>>> ETM4 already does it this way too.
>>>>
>>> I agree with this.
>>>
>>> The difficulty in having a file per counter is that different
>>> implementations have different numbers of counters. Rather than
>>> complicate the driver by dynamically generating the sysfs files, the
>>
>> It wouldn't be that hard because there is a maximum number of counters.
>> You'd generate them all and then use the is_visible() thing to hide ones
>> that didn't exist on that device.
>>
>> But it looks like we don't want to do it that way for other reasons anyway.
>>
> 
> I don't feel it is my place to say whether the etm3x driver should be
> removed entirely.
> 
> However, if we decide to keep it, I agree that aligning cntr_val_show
> with the cntr_val_store behavior (using cntr_idx) makes more sense.
> 
> Here is my plan for v2:
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
> index 762109307b86..77578885e8f3 100644
> --- a/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
> +++ b/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
> @@ -717,26 +717,19 @@ static DEVICE_ATTR_RW(cntr_rld_event);
>   static ssize_t cntr_val_show(struct device *dev,
>   			     struct device_attribute *attr, char *buf)
>   {
> -	int i, ret = 0;
>   	u32 val;
>   	struct etm_drvdata *drvdata = dev_get_drvdata(dev->parent);
>   	struct etm_config *config = &drvdata->config;
>   
>   	if (!coresight_get_mode(drvdata->csdev)) {
>   		spin_lock(&drvdata->spinlock);
> -		for (i = 0; i < drvdata->nr_cntr; i++)
> -			ret += sprintf(buf, "counter %d: %x\n",
> -				       i, config->cntr_val[i]);
> +		val = config->cntr_val[config->cntr_idx];
>   		spin_unlock(&drvdata->spinlock);
> -		return ret;
> -	}
> -
> -	for (i = 0; i < drvdata->nr_cntr; i++) {
> -		val = etm_readl(drvdata, ETMCNTVRn(i));
> -		ret += sprintf(buf, "counter %d: %x\n", i, val);
> +		return sprintf(buf, "%x\n", val);
>   	}
>   
> -	return ret;
> +	val = etm_readl(drvdata, ETMCNTVRn(config->cntr_idx));
> +	return sprintf(buf, "%x\n", val);
>   }
>   
>   static ssize_t cntr_val_store(struct device *dev,
> 
> 
> Given the upcoming merge window, I plan to submit this v2 after -rc1
> is released.
> 
> Alternatively, if the consensus is to drop the driver, I am happy to
> submit a patch for that instead.
> 
> Regards,
> Kuan-Wei
> 
> 

The change looks good. I wouldn't wait for rc1, nobody else is touching 
these files so nothing will change, so makes sense to send it now.

>>> single file + selector paradigm makes things easier. The index is
>>> validated against the actual number of counters for this instance, and
>>> read/write occurs for the selected one.
>>>
>>> Regards
>>>
>>> Mike
>>>
>>>>>>
>>>>>> The interface isn't even that great, it should be a separate file per
>>>>>> counter. You don't want to be parsing strings and colons to try to read a
>>>>>> single value, especially in C. Separate files allows you to read it directly
>>>>>> without any hassle.
>>>>>>
>>>>>>>
>>>>>>>      drivers/hwtracing/coresight/coresight-etm3x-sysfs.c | 4 ++--
>>>>>>>      1 file changed, 2 insertions(+), 2 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
>>>>>>> index 762109307b86..312033e74b7a 100644
>>>>>>> --- a/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
>>>>>>> +++ b/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
>>>>>>> @@ -725,7 +725,7 @@ static ssize_t cntr_val_show(struct device *dev,
>>>>>>>       if (!coresight_get_mode(drvdata->csdev)) {
>>>>>>>               spin_lock(&drvdata->spinlock);
>>>>>>>               for (i = 0; i < drvdata->nr_cntr; i++)
>>>>>>> -                   ret += sprintf(buf, "counter %d: %x\n",
>>>>>>> +                   ret += sprintf(buf + ret, "counter %d: %x\n",
>>>>>>>                                      i, config->cntr_val[i]);
>>>>>>>               spin_unlock(&drvdata->spinlock);
>>>>>>>               return ret;
>>>>>>> @@ -733,7 +733,7 @@ static ssize_t cntr_val_show(struct device *dev,
>>>>>>>       for (i = 0; i < drvdata->nr_cntr; i++) {
>>>>>>>               val = etm_readl(drvdata, ETMCNTVRn(i));
>>>>>>> -           ret += sprintf(buf, "counter %d: %x\n", i, val);
>>>>>>> +           ret += sprintf(buf + ret, "counter %d: %x\n", i, val);
>>>>>>>       }
>>>>>>>       return ret;
>>>>>>
>>>>
>>>
>>>
>>


