Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94DC1FF60EE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 09:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sRqoNu4/T0A4idXwuAeIugLUOXNURLtj6A0/QlJBzQU=; b=giBZq64wgS+4YXz4Mm9Ivk4iFg
	Hj4UHMwuUmxBLrsqKV4DzP+xo140f7PZzDQm9T8nfIuErAEjBR8bf4NiOSLZj8YuTUJXFdwRRXd3x
	evD7Zx+ecEcftRtGjPH9nq5Uv1HpuvCJs+7rb6mQw1XD7T3rppMJQ83xEz3vQ+5CJpnfhkoYh3eSG
	TSr8ktpYaJI0k6NI2Y9fwal/WnY2CZw4FSad7nqYQI7/jFdRa2i06dFpNJ11h++TJn+9cbnAuuVjI
	xlhxf+pmP+T+Nxby+XRcfuVRVPxeoraxl1n5DkYofFqxS0SmDA2GhoeEO2eBpGfXXAfEB3E7dCpjP
	axEH8eUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7VMU-0000000CgmA-49l4;
	Tue, 31 Mar 2026 09:26:15 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7VMS-0000000CglU-18FU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 09:26:13 +0000
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-7d9b21d1461so4738325a34.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 02:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774949171; x=1775553971; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sRqoNu4/T0A4idXwuAeIugLUOXNURLtj6A0/QlJBzQU=;
        b=YpsW9D6dCdIf71pjYyMnna/K/4u4vj1raLzI25qJ+la98C9eBbZ9rLB6hLpqR/O+En
         KJLbJlm0F/Pe8GBBx+87vTtU6ObSvekqgPzFw6yZcnbha1a91vBl2p8LoceGUitdhxRk
         CcZkQv6WJk++niWwOsEhlv4OJS4NV90A9NH2kdTY1IUkQVl1xSpBFeBdEoImnmHnxqq0
         qc4tR9Hg5qkO+ACziyBJTB1yzX+vILFVb/82xUGDeoUaBq+dGqO3fNagGjoLXwH3IDZ9
         hSjV/0Edq6vcwYn4Val2Pq3xQlW3bOrpS8H/WRwL/HPxbfF8mEJvuBTE0yQ1kz/XR4mI
         ePrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774949171; x=1775553971;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sRqoNu4/T0A4idXwuAeIugLUOXNURLtj6A0/QlJBzQU=;
        b=F5DEzCFU84Za2fYur+EnDHI0cZNtZht0GrNoPKQNWioQgOX4/eKLzBC/ucWkZ6Hu66
         gVLOBZWNOdSE2CivZ/zpSbYiSuXqqAXgKshqrnLlxUX2z+QANj4FIQlsA9qoDeMHJT3I
         sEuANakLUXGHJdwC5CONnlY1VJQfFDyd0v61XyGgRgSS+y27NwdpKL8bJi3TA+Y1FW1t
         9MA1n1l7HtxC0l2/aqHLzJ0q6tPA6fIXQUNeGWbiZnsKMNFzAsFaU6nz6IC5HJMCwa/V
         IaEsW7aw9C9kHmJNLk8P58QzZTwx+wG1srzFVu4YvbB7jwOpeXw0PdCKGLC63KjXhrfO
         fOPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwBzzyqXC9qs33qCdl5mFEeMDM4hri8JUO9VdVK71kaSWTGGKMFcd3233OcZnkOvZgYKfIEqWsBTlmLE5gv/t/@lists.infradead.org
X-Gm-Message-State: AOJu0Yxg60ZwZUagqEhgxbOcPXsUbXe7Zrn1XGo6+NyQrtOlRYT64TXK
	IioKLvUD4ep2s5HWqe5gvUMFf10DDke2l50HjuLGBSTbgWeIKoFChzNFIbJm40dsAdY=
X-Gm-Gg: ATEYQzzB6xy1bHUA/eEnlZLuf2UP97lMeLdfdWJslfIjYWiCXhkZGm3cwDvR8+ER2ke
	kBu+msSVmrzFZN0SwTIzGWmRzkmhE2WSCEN7OFiN4+S//AEDvF0QilMIXssBnVKAfT/9umzDs9n
	GZXDBjQTUYiKFmTq2hsC7iKuYmBWJ93j1T8ogtgkKShYLodXvnkEK17kmwKIHLEXxnnIIZnKEXG
	9XWsww5ODoTpPCjfdwPNlBOlrOKi0CTrG3f2bq1/wl41F3IeLsCjBJeT/Ryw86axB65GfgSbYiG
	5o8ufjqXqEgXeyXbilSuE4Kk2rRIRN7e2ZSZYR7BanPPTzIc4VjVMTFXx+JftgVSDAiiu2QWWXJ
	dSE9GIR4JBI0FLNSd1afsjJr5NPCNYT1l9t7zG9PucMsCSiMISXWMXMlpA3ePK9HlBeSIFCGISh
	yI4cL5qFV12M2vGaaBAUE44A/m1L3m
X-Received: by 2002:a05:6830:81f8:b0:7d9:ae73:2ff9 with SMTP id 46e09a7af769-7da37622aa3mr1639926a34.11.1774949170407;
        Tue, 31 Mar 2026 02:26:10 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7da0a7b45basm7968990a34.17.2026.03.31.02.26.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 02:26:10 -0700 (PDT)
Message-ID: <7abe93fa-3748-4077-b75a-d28296862654@linaro.org>
Date: Tue, 31 Mar 2026 10:26:07 +0100
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
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <207b78e5-ed6b-4caf-b9ce-546cf33d6dfd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_022612_351566_AA391659 
X-CRM114-Status: GOOD (  30.93  )
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



On 31/03/2026 4:18 am, Jie Gan wrote:
> Hi James,
> 
> On 3/31/2026 9:29 AM, Jie Gan wrote:
>>
>> Hi James,
>>
>> On 3/30/2026 10:55 PM, James Clark wrote:
>>>
>>>
>>> On 25/03/2026 3:10 am, Jie Gan wrote:
>>>> Save the trace ID in drvdata during TPDM enablement and expose it
>>>> to userspace to support trace data parsing.
>>>>
>>>> The TPDM device’s trace ID corresponds to the trace ID allocated
>>>> to the connected TPDA device.
>>>>
>>>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>>>> ---
>>>> Changes in v3:
>>>> 1. Only allow user to read the traceid while the TPDM device is 
>>>> enabled.
>>>> - Link to v2: https://lore.kernel.org/r/20260316-add-traceid-show- 
>>>> for- tpdm-v2-1-1dec2a67e4ed@oss.qualcomm.com
>>>>
>>>> Changes in V2:
>>>> 1. Use sysfs_emit instead of sprintf.
>>>> Link to V1 - https://lore.kernel.org/all/20260306-add-traceid-show- 
>>>> for-tpdm-v1-1-0658a8edb972@oss.qualcomm.com/
>>>> ---
>>>>   drivers/hwtracing/coresight/coresight-tpdm.c | 34 ++++++++++++++++ 
>>>> + + +++++++++-
>>>>   drivers/hwtracing/coresight/coresight-tpdm.h |  2 ++
>>>>   2 files changed, 35 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/hwtracing/coresight/coresight-tpdm.c b/drivers/ 
>>>> hwtracing/coresight/coresight-tpdm.c
>>>> index da77bdaad0a4..c8339b973bfc 100644
>>>> --- a/drivers/hwtracing/coresight/coresight-tpdm.c
>>>> +++ b/drivers/hwtracing/coresight/coresight-tpdm.c
>>>> @@ -481,7 +481,7 @@ static void __tpdm_enable(struct tpdm_drvdata 
>>>> *drvdata)
>>>>   static int tpdm_enable(struct coresight_device *csdev, struct 
>>>> perf_event *event,
>>>>                  enum cs_mode mode,
>>>> -               __maybe_unused struct coresight_path *path)
>>>> +               struct coresight_path *path)
>>>>   {
>>>>       struct tpdm_drvdata *drvdata = dev_get_drvdata(csdev- 
>>>> >dev.parent);
>>>> @@ -497,6 +497,7 @@ static int tpdm_enable(struct coresight_device 
>>>> *csdev, struct perf_event *event,
>>>>       }
>>>>       __tpdm_enable(drvdata);
>>>> +    drvdata->traceid = path->trace_id;
>>>>       drvdata->enable = true;
>>>>       spin_unlock(&drvdata->spinlock);
>>>> @@ -693,6 +694,29 @@ static struct attribute_group tpdm_attr_grp = {
>>>>       .attrs = tpdm_attrs,
>>>>   };
>>>> +static ssize_t traceid_show(struct device *dev,
>>>> +                struct device_attribute *attr, char *buf)
>>>> +{
>>>> +    unsigned long val;
>>>> +    struct tpdm_drvdata *drvdata = dev_get_drvdata(dev->parent);
>>>> +
>>>> +    if (coresight_get_mode(drvdata->csdev) == CS_MODE_DISABLED)
>>>> +        return -EINVAL;
>>>> +
>>>> +    val = drvdata->traceid;
>>>
>>> You probably need to take the coresight_mutex here otherwise you 
>>> could still return an invalid or stale value despite checking the mode.
>>>
>>
>> Acked. I have missed this potential race condition.
>>
>>> There might also be some value in it returning the last used trace ID 
>>> even if the mode isn't enabled anymore. Because you can still read 
>>> out of the sink after disabling, so it makes more sense for a script 
>>> to read it at that point rather than when it's enabled. Also, you 
>>> probably don't want to be doing other things in your script in the 
>>> point between enabling and disabling.
>>
>> That's making sense. I shouldnt add such restriction for the read 
>> process.
>>
> 
> I missed one point in last message.
> 
> Is that acceptable to export the coresight_mutex from the core module?
> Currently, the coresight_mutex is used within the module only.
> 
> Thanks,
> Jie
> 

If the plan is to only check for non-zero trace ID and not check the 
mode any more then you don't need to lock. Maybe lets see what Suzuki 
thinks about returning the last trace ID though as it was his idea to 
add -EINVAL.

>> Scenarios for reading:
>> 1. device is enabled -> trace ID is valid
>> 2. device is enabled then disabled -> trace ID is valid for the last 
>> trace event
>> 3. device is never enabled -> invalid trace ID (value 0)
>>
>> we only need to check the validation of the trace ID.
>>
>> mutex_lock(&coresight_mutex);
>> val = drvdata->traceid;
>> mutex_unlock(&coresight_mutex);
>>
>> if (!val)
>>      return -EINVAL;
>>
>> return sysfs_emit(buf, "%#lx\n", val);
>>
>> Thanks,
>> Jie
>>
>>>
>>>> +    return sysfs_emit(buf, "%#lx\n", val);
>>>> +}
>>>> +static DEVICE_ATTR_RO(traceid);
>>>> +
>>>> +static struct attribute *traceid_attrs[] = {
>>>> +    &dev_attr_traceid.attr,
>>>> +    NULL,
>>>> +};
>>>> +
>>>> +static struct attribute_group traceid_attr_grp = {
>>>> +    .attrs = traceid_attrs,
>>>> +};
>>>> +
>>>>   static ssize_t dsb_mode_show(struct device *dev,
>>>>                    struct device_attribute *attr,
>>>>                    char *buf)
>>>> @@ -1367,6 +1391,12 @@ static const struct attribute_group 
>>>> *tpdm_attr_grps[] = {
>>>>       &tpdm_cmb_patt_grp,
>>>>       &tpdm_cmb_msr_grp,
>>>>       &tpdm_mcmb_attr_grp,
>>>> +    &traceid_attr_grp,
>>>> +    NULL,
>>>> +};
>>>> +
>>>> +static const struct attribute_group *static_tpdm_attr_grps[] = {
>>>> +    &traceid_attr_grp,
>>>>       NULL,
>>>>   };
>>>> @@ -1425,6 +1455,8 @@ static int tpdm_probe(struct device *dev, 
>>>> struct resource *res)
>>>>       desc.access = CSDEV_ACCESS_IOMEM(base);
>>>>       if (res)
>>>>           desc.groups = tpdm_attr_grps;
>>>> +    else
>>>> +        desc.groups = static_tpdm_attr_grps;
>>>>       drvdata->csdev = coresight_register(&desc);
>>>>       if (IS_ERR(drvdata->csdev))
>>>>           return PTR_ERR(drvdata->csdev);
>>>> diff --git a/drivers/hwtracing/coresight/coresight-tpdm.h b/drivers/ 
>>>> hwtracing/coresight/coresight-tpdm.h
>>>> index 2867f3ab8186..11da64e1ade8 100644
>>>> --- a/drivers/hwtracing/coresight/coresight-tpdm.h
>>>> +++ b/drivers/hwtracing/coresight/coresight-tpdm.h
>>>> @@ -300,6 +300,7 @@ struct cmb_dataset {
>>>>    * @cmb         Specifics associated to TPDM CMB.
>>>>    * @dsb_msr_num Number of MSR supported by DSB TPDM
>>>>    * @cmb_msr_num Number of MSR supported by CMB TPDM
>>>> + * @traceid    Trace ID of the path.
>>>>    */
>>>>   struct tpdm_drvdata {
>>>> @@ -313,6 +314,7 @@ struct tpdm_drvdata {
>>>>       struct cmb_dataset    *cmb;
>>>>       u32            dsb_msr_num;
>>>>       u32            cmb_msr_num;
>>>> +    u8            traceid;
>>>>   };
>>>>   /* Enumerate members of various datasets */
>>>>
>>>> ---
>>>> base-commit: b84a0ebe421ca56995ff78b66307667b62b3a900
>>>> change-id: 20260316-add-traceid-show-for-tpdm-88d040651f00
>>>>
>>>> Best regards,
>>>
>>
> 


