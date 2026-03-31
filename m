Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71CB5FF60EF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 09:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EENVmNw5YtlVJXHsET8w6vHESlMWBJK2b8JGdfCQMgs=; b=osa+Fjs7uU/ktHEJKz9XYV9k8t
	CSikhbrtZjInAmREsYWUzOEQVGThfKG/e/Y6dvQfmVdgbyqbSva3D/w5rVydDZSuGl6yBinivgFAx
	5Zrbb8wnZdt1ZXTisRBxGRzEMoh6tZ/1aLQb8b9lLtd3cDcc9N9+jLoWhZmMqynkOCWxOUYHHxJoP
	QwPG+lbdmv9nN5WXenLhmvCB5yvG2LvBHKbjF/r4rnEUpzpLCnRn3sEOIE+D4Hi/25ZyYJioD4tUh
	3NcPita1DCoF1h4Z6fzZIrBz2HfXKEx5irntMtYuuFEkVgCPpzaA6LEFMchYmC1fVF8ABCx7lG8Wt
	TUbs2Vyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7VeA-0000000Ci5b-30SE;
	Tue, 31 Mar 2026 09:44:30 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Ve8-0000000Ci4k-1LVd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 09:44:29 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-483487335c2so58263135e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 02:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774950266; x=1775555066; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EENVmNw5YtlVJXHsET8w6vHESlMWBJK2b8JGdfCQMgs=;
        b=L4nhLKGCN+K4vaAaEhtlJCFRkRQfEZLorGjNUuh8LV8Xd+esdgc6FaaYmibPp/REhZ
         f1I3Zu2O0PZzLAIoTLXrebEEslRPSDVLhRoDM07SQFhJ04c+rEIsYHtGSiSaK9FfknPm
         7ueb8qqppxwWKLbumwfYiUvefZ5o7RGMQiH9loYZO8+It8mSDc2elEVdkjB9cm8SY2aL
         ISQJQNuc9T7Gky2PG5xfc3oLZUwTS9vS+OaB+1r46+OPSN2y+2Q72CgVyd9zulhIb+/6
         Fdg/x8jZr+1vrJsICFirJg8z8/gD3YVHY5HxVtmJW9gGgGofjo3g5VDSdbJbFasKp1rd
         GoSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774950266; x=1775555066;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EENVmNw5YtlVJXHsET8w6vHESlMWBJK2b8JGdfCQMgs=;
        b=HpGmgIXU6mmlrKrSXCU0grCrvhARPJK2szAW0MSSmkxr9mgaRgV9wB8v5mdbWeQIZm
         RO5ETq6lk50UCHWW8yL6KBQuDtbflFDN3kb/m4aKQ5wPqPyTlVcH1bbefSaysAmciqEE
         qvdfGT105fxU05owWh8xl43O15zHw3+R0xkzpIEoxuXo1sX4/dcuA4hSopWT8UGODJG+
         Iyhh38MxRf3ecWY7dJTVXNtsqKhKFF3AAYtVeeOJYoKOUS5YqfbiBmupwzBXSuFsWhbj
         38LqNcfZwURAzK/zz7o4W8DePZTbnqHgSrhJGPzxmkV70hKtIvLmaVz9R31fI4a/dBxs
         rJyA==
X-Forwarded-Encrypted: i=1; AJvYcCXmtwvP4ycfgsFYcJqda9hhYoiQxIx4vR6jBGu9UpYU8Z23YdPHWXjtmho3ETKGvqbrmehVZL7Jurrr4/FWSySc@lists.infradead.org
X-Gm-Message-State: AOJu0YyMYAU15ojJpIZwzIO/umEASJ4ODLF3wgwi5XMQmCkF+52DTCy7
	D0U3gAZAHL8/GKydaikloIsSz85wpwj77qJKurXvwolnZOOd+4AI80YqZ35Z93V/P0U=
X-Gm-Gg: ATEYQzzG/nEi4BHPgPaX347I/pFlCbaQ5YNkry163m+u5vO3fYxdNpXGIOGvn/fCLw8
	q6YOFnQCdiX1iptwC02jLHLeTwz9+33m9jwG35b60HjzYGotK5On2BPMnax8ljRBqxqwZ61XKTT
	H4mcNT84tc1fkH38dooWuJE+WQHyKnfFdQHonKUVOCqpAWC9iyP6TVoG5sjwBwpWb7L9YUCNRp3
	ALjnqWYC2invRhG10o1jYKYD5GS19jvv2ncwvE4k+qrJyyr8VC9s9dWf4ELvPQ5KO/ejpDLFl78
	Z1llD32Qgeq7wejxyq59Cf7iJIJkPYsg8v7jo0aqpiVDqKTB0sj69px4Q2SUhM7c8WIJ35+yBAd
	szRjEJcUrqdvxOLXWP/0FYIQZdrWBPiKVEukvnnN0A4dEwrraHDQKVlOoGhr2zN5GlTCnHWUhTc
	d/HLQZAuYIW6Hi56F5DZ0hTxw91C5w
X-Received: by 2002:a05:600c:1393:b0:485:3c8f:e4d9 with SMTP id 5b1f17b1804b1-487280a09a2mr266634435e9.26.1774950265403;
        Tue, 31 Mar 2026 02:44:25 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887a630901sm20871675e9.0.2026.03.31.02.44.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 02:44:24 -0700 (PDT)
Message-ID: <e56593b9-742d-467f-b65a-ceeefae05b9e@linaro.org>
Date: Tue, 31 Mar 2026 10:44:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] coresight: tpdm: add traceid_show for checking traceid
To: Jie Gan <jie.gan@oss.qualcomm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Mike Leach <mike.leach@arm.com>,
 Leo Yan <leo.yan@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
References: <20260325-add-traceid-show-for-tpdm-v3-1-0eb836d4ec30@oss.qualcomm.com>
 <95610981-ad68-4a31-a776-27894b7bca59@linaro.org>
 <ca1fe6ba-ec56-47a5-99ea-017dcc7a28ed@oss.qualcomm.com>
 <207b78e5-ed6b-4caf-b9ce-546cf33d6dfd@oss.qualcomm.com>
 <7abe93fa-3748-4077-b75a-d28296862654@linaro.org>
 <f038fd7c-d563-4583-ad6f-666e2816fdb7@oss.qualcomm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <f038fd7c-d563-4583-ad6f-666e2816fdb7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_024428_438691_B1C2584C 
X-CRM114-Status: GOOD (  32.36  )
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



On 31/03/2026 10:33 am, Jie Gan wrote:
> 
> 
> On 3/31/2026 5:26 PM, James Clark wrote:
>>
>>
>> On 31/03/2026 4:18 am, Jie Gan wrote:
>>> Hi James,
>>>
>>> On 3/31/2026 9:29 AM, Jie Gan wrote:
>>>>
>>>> Hi James,
>>>>
>>>> On 3/30/2026 10:55 PM, James Clark wrote:
>>>>>
>>>>>
>>>>> On 25/03/2026 3:10 am, Jie Gan wrote:
>>>>>> Save the trace ID in drvdata during TPDM enablement and expose it
>>>>>> to userspace to support trace data parsing.
>>>>>>
>>>>>> The TPDM device’s trace ID corresponds to the trace ID allocated
>>>>>> to the connected TPDA device.
>>>>>>
>>>>>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>>>>>> ---
>>>>>> Changes in v3:
>>>>>> 1. Only allow user to read the traceid while the TPDM device is 
>>>>>> enabled.
>>>>>> - Link to v2: https://lore.kernel.org/r/20260316-add-traceid-show- 
>>>>>> for- tpdm-v2-1-1dec2a67e4ed@oss.qualcomm.com
>>>>>>
>>>>>> Changes in V2:
>>>>>> 1. Use sysfs_emit instead of sprintf.
>>>>>> Link to V1 - https://lore.kernel.org/all/20260306-add-traceid- 
>>>>>> show- for-tpdm-v1-1-0658a8edb972@oss.qualcomm.com/
>>>>>> ---
>>>>>>   drivers/hwtracing/coresight/coresight-tpdm.c | 34 ++++++++++++++ 
>>>>>> + + + + +++++++++-
>>>>>>   drivers/hwtracing/coresight/coresight-tpdm.h |  2 ++
>>>>>>   2 files changed, 35 insertions(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/drivers/hwtracing/coresight/coresight-tpdm.c b/ 
>>>>>> drivers/ hwtracing/coresight/coresight-tpdm.c
>>>>>> index da77bdaad0a4..c8339b973bfc 100644
>>>>>> --- a/drivers/hwtracing/coresight/coresight-tpdm.c
>>>>>> +++ b/drivers/hwtracing/coresight/coresight-tpdm.c
>>>>>> @@ -481,7 +481,7 @@ static void __tpdm_enable(struct tpdm_drvdata 
>>>>>> *drvdata)
>>>>>>   static int tpdm_enable(struct coresight_device *csdev, struct 
>>>>>> perf_event *event,
>>>>>>                  enum cs_mode mode,
>>>>>> -               __maybe_unused struct coresight_path *path)
>>>>>> +               struct coresight_path *path)
>>>>>>   {
>>>>>>       struct tpdm_drvdata *drvdata = dev_get_drvdata(csdev- 
>>>>>> >dev.parent);
>>>>>> @@ -497,6 +497,7 @@ static int tpdm_enable(struct coresight_device 
>>>>>> *csdev, struct perf_event *event,
>>>>>>       }
>>>>>>       __tpdm_enable(drvdata);
>>>>>> +    drvdata->traceid = path->trace_id;
>>>>>>       drvdata->enable = true;
>>>>>>       spin_unlock(&drvdata->spinlock);
>>>>>> @@ -693,6 +694,29 @@ static struct attribute_group tpdm_attr_grp = {
>>>>>>       .attrs = tpdm_attrs,
>>>>>>   };
>>>>>> +static ssize_t traceid_show(struct device *dev,
>>>>>> +                struct device_attribute *attr, char *buf)
>>>>>> +{
>>>>>> +    unsigned long val;
>>>>>> +    struct tpdm_drvdata *drvdata = dev_get_drvdata(dev->parent);
>>>>>> +
>>>>>> +    if (coresight_get_mode(drvdata->csdev) == CS_MODE_DISABLED)
>>>>>> +        return -EINVAL;
>>>>>> +
>>>>>> +    val = drvdata->traceid;
>>>>>
>>>>> You probably need to take the coresight_mutex here otherwise you 
>>>>> could still return an invalid or stale value despite checking the 
>>>>> mode.
>>>>>
>>>>
>>>> Acked. I have missed this potential race condition.
>>>>
>>>>> There might also be some value in it returning the last used trace 
>>>>> ID even if the mode isn't enabled anymore. Because you can still 
>>>>> read out of the sink after disabling, so it makes more sense for a 
>>>>> script to read it at that point rather than when it's enabled. 
>>>>> Also, you probably don't want to be doing other things in your 
>>>>> script in the point between enabling and disabling.
>>>>
>>>> That's making sense. I shouldnt add such restriction for the read 
>>>> process.
>>>>
>>>
>>> I missed one point in last message.
>>>
>>> Is that acceptable to export the coresight_mutex from the core module?
>>> Currently, the coresight_mutex is used within the module only.
>>>
>>> Thanks,
>>> Jie
>>>
>>
>> If the plan is to only check for non-zero trace ID and not check the 
>> mode any more then you don't need to lock. Maybe lets see what Suzuki 
>> thinks about returning the last trace ID though as it was his idea to 
>> add -EINVAL.
>>
> 
> Sure. The trace ID is allocated during TPDA device probe and remains 
> unchanged for the entire lifetime of the device.
> 
> Thanks,
> Jie
> 
> 

Oh I missed that because it's assigned every time in tpdm_enable(). In 
that case I don't see why it can't be just:

   val = drvdata->traceid;
   if (!val)
      return -EINVAL;

   return sysfs_emit(...)

>>>> Scenarios for reading:
>>>> 1. device is enabled -> trace ID is valid
>>>> 2. device is enabled then disabled -> trace ID is valid for the last 
>>>> trace event
>>>> 3. device is never enabled -> invalid trace ID (value 0)
>>>>
>>>> we only need to check the validation of the trace ID.
>>>>
>>>> mutex_lock(&coresight_mutex);
>>>> val = drvdata->traceid;
>>>> mutex_unlock(&coresight_mutex);
>>>>
>>>> if (!val)
>>>>      return -EINVAL;
>>>>
>>>> return sysfs_emit(buf, "%#lx\n", val);
>>>>
>>>> Thanks,
>>>> Jie
>>>>
>>>>>
>>>>>> +    return sysfs_emit(buf, "%#lx\n", val);
>>>>>> +}
>>>>>> +static DEVICE_ATTR_RO(traceid);
>>>>>> +
>>>>>> +static struct attribute *traceid_attrs[] = {
>>>>>> +    &dev_attr_traceid.attr,
>>>>>> +    NULL,
>>>>>> +};
>>>>>> +
>>>>>> +static struct attribute_group traceid_attr_grp = {
>>>>>> +    .attrs = traceid_attrs,
>>>>>> +};
>>>>>> +
>>>>>>   static ssize_t dsb_mode_show(struct device *dev,
>>>>>>                    struct device_attribute *attr,
>>>>>>                    char *buf)
>>>>>> @@ -1367,6 +1391,12 @@ static const struct attribute_group 
>>>>>> *tpdm_attr_grps[] = {
>>>>>>       &tpdm_cmb_patt_grp,
>>>>>>       &tpdm_cmb_msr_grp,
>>>>>>       &tpdm_mcmb_attr_grp,
>>>>>> +    &traceid_attr_grp,
>>>>>> +    NULL,
>>>>>> +};
>>>>>> +
>>>>>> +static const struct attribute_group *static_tpdm_attr_grps[] = {
>>>>>> +    &traceid_attr_grp,
>>>>>>       NULL,
>>>>>>   };
>>>>>> @@ -1425,6 +1455,8 @@ static int tpdm_probe(struct device *dev, 
>>>>>> struct resource *res)
>>>>>>       desc.access = CSDEV_ACCESS_IOMEM(base);
>>>>>>       if (res)
>>>>>>           desc.groups = tpdm_attr_grps;
>>>>>> +    else
>>>>>> +        desc.groups = static_tpdm_attr_grps;
>>>>>>       drvdata->csdev = coresight_register(&desc);
>>>>>>       if (IS_ERR(drvdata->csdev))
>>>>>>           return PTR_ERR(drvdata->csdev);
>>>>>> diff --git a/drivers/hwtracing/coresight/coresight-tpdm.h b/ 
>>>>>> drivers/ hwtracing/coresight/coresight-tpdm.h
>>>>>> index 2867f3ab8186..11da64e1ade8 100644
>>>>>> --- a/drivers/hwtracing/coresight/coresight-tpdm.h
>>>>>> +++ b/drivers/hwtracing/coresight/coresight-tpdm.h
>>>>>> @@ -300,6 +300,7 @@ struct cmb_dataset {
>>>>>>    * @cmb         Specifics associated to TPDM CMB.
>>>>>>    * @dsb_msr_num Number of MSR supported by DSB TPDM
>>>>>>    * @cmb_msr_num Number of MSR supported by CMB TPDM
>>>>>> + * @traceid    Trace ID of the path.
>>>>>>    */
>>>>>>   struct tpdm_drvdata {
>>>>>> @@ -313,6 +314,7 @@ struct tpdm_drvdata {
>>>>>>       struct cmb_dataset    *cmb;
>>>>>>       u32            dsb_msr_num;
>>>>>>       u32            cmb_msr_num;
>>>>>> +    u8            traceid;
>>>>>>   };
>>>>>>   /* Enumerate members of various datasets */
>>>>>>
>>>>>> ---
>>>>>> base-commit: b84a0ebe421ca56995ff78b66307667b62b3a900
>>>>>> change-id: 20260316-add-traceid-show-for-tpdm-88d040651f00
>>>>>>
>>>>>> Best regards,
>>>>>
>>>>
>>>
>>
> 


