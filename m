Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72431C83029
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 13:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x6AggRvfqBPUM7xSqjPZuM2RvyKgPoiX7/6ImLDs6xk=; b=sipHXA5QPPMJGcZw77ilxOZC7H
	Wyv3RWtq5rP67C+wuzw6YTpowgBVj2MDeNUcuvWxYXve0wZkEaqwBfyJV9I7oQjSOTOF4/mRwapzE
	Ap2yiSn6fhOIZRB6LVYKrK79D+M+Cja5gruIo079xhWgl6P47wLswSDEsKlHx91NjYvmDAF6XiWz6
	pNlEllMpxaamybinI9PWcrhQJWF+TVpgc75y88mXgpEUTIw3ePICE3EzcQSeIe8ge+R/lOZyWZOPK
	9N2p6qaVjMdU+nDkFm2q56nWnB/8SXsTi9VOieHo/jZ9gnaAr2gpHCKNCi85EUoaA+G5zQhPHR+Gx
	sV79kikg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWEyM-00000002SHO-1k55;
	Mon, 30 Jun 2025 13:55:02 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWEpg-00000002QMk-36v6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Jun 2025 13:46:06 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3a575a988f9so2904561f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Jun 2025 06:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751291163; x=1751895963; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x6AggRvfqBPUM7xSqjPZuM2RvyKgPoiX7/6ImLDs6xk=;
        b=M0o5CpJcq+u4YkMC09kD/8CTmaT0+E8E8zPH0wU8wXafirHOCI3Xh9YbORzYuzsXO6
         jkyQoQSparN/9QpNEZC7WNsogQ8MVv2J59gEWyJQ3y5fN4L2W1a586AZKAOCgtBwd45m
         MJiI++K+vQO63PfiZDW5caqpkZT/9RsQkfJAxLYV2U2plkubvQFBhhCKbvNdue8qHCxb
         hUxizqYIwFGzPWnVDRoEQIEwpFfffDvluNPAPzStNgY280Mp5bQholQQskQet9OfObHC
         xLlrHKMJXYVDXTUyBYM16snFOH95QQyP3ZF/lXKl62mZ1bD6+etvDffNRdwNqhjmr5m+
         rFSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751291163; x=1751895963;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x6AggRvfqBPUM7xSqjPZuM2RvyKgPoiX7/6ImLDs6xk=;
        b=mV3mlHp6HWTXxIoaiEgdTfl31BPhFCl03erKdiQ5IbIFQI0TuA/Pw/IzmvY3BYScwg
         hvzf58tmGs1W9kEHuB4XBeGQOFvvUopJaj5pefXPZ1cNJMPAiy9Tgl7XC/IbR+7X2X77
         Nu9TNaYuFif+D6ZVJs6WCnUPh8Q8mMpN5UxMGQ9JHFg17RERozKooXb/wNFBCrti1EOp
         mmDDIhZrkY7mBgxrBTTnW+0xDvsdwa5/6lk9OCeMHjdP9zCg+pD4SJbaCdrdneU+Sk+b
         4iGinIdNInXwWox6zpRkeM61yLjnCV+VzTfKkmS6GzUDtdlaIZukfi7J8+637vR/BUYI
         MCHw==
X-Forwarded-Encrypted: i=1; AJvYcCWpfBBTamRWt5jF2qjyswGMAEZToBPOgnXoEbKVilOL2nBa+A6W/eQtPUyWy3UoCZ83fpYrNmKrhgc2tijK4rLQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yxov348rUhs4Nyln4ZzgL3b/6PjMfImCTvx8Y7AkE4ZnjXT+EWm
	Q+AbqS65TnI9qBvfrUTVa5lsvocAwY6hBRW7uoVmncWvb4lUf7sozV0mObrK4BtSa1A=
X-Gm-Gg: ASbGnct72cVZXHe8C3HMJ6Ok9EFY/SFKWj0aEmEfENUzeDmqCngoQzQlrUtTun8RJWI
	8INWbCsAbaSGZSli+XKdy6aAM9hVt0HoV6m/VvFPexCjd7Hp2ERNA0Co/8rWI4RxpaZMd1Dgdqo
	UobD+L5OJkRM8NRWau21Kk4MEDGFI1NUc4kcFOiZFNUV4v3GfnWFX86r06Q8CKAL4HIU3g8XAf5
	ShwYP7fN12kyY8A8x5DbRhJrmW6lp5tfSGSZez/DUJ0/k1qLy13wh32kZeUhSUIXoLq6po0UYFW
	FxqR4kAtd+1nOTiG97J62XmO8K3zZTQYyvzl8OPPElPVRcMB8J9ivAahojGzvO01rOs=
X-Google-Smtp-Source: AGHT+IHZw5qo7ZkrFE6ipOaPB5kCsXwJmt/AoFiz9rbjLSUFLi406xeDw2ABOa9CC2jfbdPGNmOfxA==
X-Received: by 2002:a05:6000:22c2:b0:3a5:1c71:432a with SMTP id ffacd0b85a97d-3a8fe1deba9mr10003038f8f.14.1751291162821;
        Mon, 30 Jun 2025 06:46:02 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7e7518sm10335232f8f.2.2025.06.30.06.46.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 06:46:02 -0700 (PDT)
Message-ID: <be3e8397-53d6-447a-97ba-4b54c7762f54@linaro.org>
Date: Mon, 30 Jun 2025 14:46:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight-tmc: Add configurable timeout for flush and
 tmcready
To: Yuanfang Zhang <quic_yuanfang@quicinc.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>, Leo Yan <leo.yan@arm.com>
Cc: kernel@oss.qualcomm.com, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
References: <20250627-flush_timeout-v1-1-2f46a8e9f842@quicinc.com>
 <78f2179d-26c2-47f0-bc19-b72e5e51ad29@linaro.org>
 <416f8284-ad98-4922-96d8-7ec873f7b9b8@quicinc.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <416f8284-ad98-4922-96d8-7ec873f7b9b8@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_064604_787278_02D0BBBD 
X-CRM114-Status: GOOD (  27.56  )
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



On 30/06/2025 11:03 am, Yuanfang Zhang wrote:
> 
> 
> On 6/27/2025 7:23 PM, James Clark wrote:
>>
>>
>> On 27/06/2025 12:10 pm, Yuanfang Zhang wrote:
>>> The current implementation uses a fixed timeout via
>>> coresight_timeout(), which may be insufficient when multiple
>>> sources are enabled or under heavy load, leading to TMC
>>> readiness or flush completion timeout.
>>>
>>> This patch introduces a configurable timeout mechanism for
>>> flush and tmcready.
>>>
>>
>> What kind of values are you using? Is there a reason to not increase the global one?
> 1000, Because only TMC FLUSH will face timeout situations.

How long was the flush taking exactly? You should be able to log the 
time it took to get past the flush. Because if it's 101us then we can 
increase the global timeout to 150us or 200us without too much thought.

I don't think we can justify why 100us was picked over any other value 
anyway. And we've seen a couple of timeouts in our own CI.

>>
>> I don't think it's important what value we choose because it's only to stop hangs and make it terminate eventually. As far as I can see it wouldn't matter if we set it to a huge value like 1 second. That would only cause a big delay when something has actually gone wrong. Under normal circumstances the timeout won't be hit so it doesn't really need to be configurable.
> 
> But in some cases, TMC doesn't hang up, it just requires a longer waiting time.
>>
>>> Signed-off-by: Yuanfang Zhang <quic_yuanfang@quicinc.com>
>>> ---
>>>    drivers/hwtracing/coresight/coresight-tmc-core.c | 43 ++++++++++++++++++++++--
>>>    1 file changed, 41 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
>>> index 88afb16bb6bec395ba535155228d176250f38625..286d56ce88fe80fbfa022946dc798f0f4e72f961 100644
>>> --- a/drivers/hwtracing/coresight/coresight-tmc-core.c
>>> +++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
>>> @@ -8,6 +8,7 @@
>>>    #include <linux/kernel.h>
>>>    #include <linux/init.h>
>>>    #include <linux/types.h>
>>> +#include <linux/delay.h>
>>>    #include <linux/device.h>
>>>    #include <linux/idr.h>
>>>    #include <linux/io.h>
>>> @@ -35,13 +36,31 @@ DEFINE_CORESIGHT_DEVLIST(etb_devs, "tmc_etb");
>>>    DEFINE_CORESIGHT_DEVLIST(etf_devs, "tmc_etf");
>>>    DEFINE_CORESIGHT_DEVLIST(etr_devs, "tmc_etr");
>>>    +static u32 tmc_timeout;
>>> +
>>> +static void tmc_extend_timeout(struct csdev_access *csa, u32 offset, int pos, int val)
>>> +{
>>> +    int i;
>>> +
>>> +    for (i = tmc_timeout; i > 0; i--) {
>>> +        if (i - 1)
>>
>> I didn't get what the if is for here? Removing it does basically the same thing, but if you do want to keep it maybe if (i > 1) is more explanatory.
> sure.
>>
>>> +            udelay(1);
>>
>> Can you not do udelay(tmc_timeout)?
> sure.
>>
>>> +    }
>>> +}
>>> +
>>> +static int tmc_wait_status(struct csdev_access *csa, u32 offset, int pos, int val)
>>> +{
>>> +    return coresight_timeout_action(csa, offset, pos, val,
>>> +            tmc_extend_timeout);
>>> +}
>>> +
>>>    int tmc_wait_for_tmcready(struct tmc_drvdata *drvdata)
>>>    {
>>>        struct coresight_device *csdev = drvdata->csdev;
>>>        struct csdev_access *csa = &csdev->access;
>>>          /* Ensure formatter, unformatter and hardware fifo are empty */
>>> -    if (coresight_timeout(csa, TMC_STS, TMC_STS_TMCREADY_BIT, 1)) {
>>> +    if (tmc_wait_status(csa, TMC_STS, TMC_STS_TMCREADY_BIT, 1)) {
>>>            dev_err(&csdev->dev,
>>>                "timeout while waiting for TMC to be Ready\n");
>>>            return -EBUSY;
>>> @@ -61,7 +80,7 @@ void tmc_flush_and_stop(struct tmc_drvdata *drvdata)
>>>        ffcr |= BIT(TMC_FFCR_FLUSHMAN_BIT);
>>>        writel_relaxed(ffcr, drvdata->base + TMC_FFCR);
>>>        /* Ensure flush completes */
>>> -    if (coresight_timeout(csa, TMC_FFCR, TMC_FFCR_FLUSHMAN_BIT, 0)) {
>>> +    if (tmc_wait_status(csa, TMC_FFCR, TMC_FFCR_FLUSHMAN_BIT, 0)) {
>>>            dev_err(&csdev->dev,
>>>            "timeout while waiting for completion of Manual Flush\n");
>>>        }
>>> @@ -561,11 +580,31 @@ static ssize_t stop_on_flush_store(struct device *dev,
>>>      static DEVICE_ATTR_RW(stop_on_flush);
>>>    +static ssize_t timeout_cfg_show(struct device *dev,
>>> +                struct device_attribute *attr, char *buf)
>>> +{
>>> +    return scnprintf(buf, PAGE_SIZE, "%d\n", tmc_timeout);
>>> +}
>>> +
>>> +static ssize_t timeout_cfg_store(struct device *dev,
>>> +                 struct device_attribute *attr,
>>> +                 const char *buf, size_t size)
>>> +{
>>> +    unsigned long val;
>>> +
>>> +    if (kstrtoul(buf, 0, &val))
>>> +        return -EINVAL;
>>> +    tmc_timeout = val;
>>> +
>>> +    return size;
>>> +}
>>> +static DEVICE_ATTR_RW(timeout_cfg);
>>>    
>>
>> Seeing as the existing timeout is global for all devices, if we do want a configurable one shouldn't we make the global one configurable rather than per-device? That seems too fine grained to me.
> sure.
>>
>>>    static struct attribute *coresight_tmc_attrs[] = {
>>>        &dev_attr_trigger_cntr.attr,
>>>        &dev_attr_buffer_size.attr,
>>>        &dev_attr_stop_on_flush.attr,
>>> +    &dev_attr_timeout_cfg.attr,
>>>        NULL,
>>>    };
>>>   
>>> ---
>>> base-commit: 408c97c4a5e0b634dcd15bf8b8808b382e888164
>>> change-id: 20250627-flush_timeout-a598b4c0ce7b
>>>
>>> Best regards,
>>
> 


