Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC797D6A223
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 17:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2tLZgochhxByX0SsTSk8ag2ydSVQVzltSz9opSL6ecc=; b=mKXn84yEWRVMqlFwf4Ri4rww0m
	VrudI6dgoTdTFbJu+TCPgz2PG/rH3Ilcju8HRrLrsOo2ZV+XmZdZMN2Na3GPtILGYAwLdXOgsE9Mw
	L/4zUJR3pcSWXvO3zHmGDKhACOKaxuDeodhM3RCgCv7+KGDW7wcFrHyddNEUkr1FD2njjlYnoO444
	D/GvfngZ9teSpXlHbprnWBZEEDnKhWr0VNw4KcyVeSw9spS1MpzSwag9wPMSvvNsWTSOkHOzZ6i5L
	qsEHxlf+Ww79rnIo/eeHm9BRKWahHA/+dmkooIUaevKVVeKEjgZy3hMq1i8PchGAPbZTQBqo5g9iG
	zw0XlpgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBduN-00000000N62-1Fg8;
	Thu, 14 Nov 2024 17:45:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBcmg-0000000096T-0rqM
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 14 Nov 2024 16:33:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=2tLZgochhxByX0SsTSk8ag2ydSVQVzltSz9opSL6ecc=; b=BphEcoZELyTDAEUlOwZHAIZkUx
	lDYkzgKjXGnF/aVo69hKlyhPMmBznOIzP9JJudPYMDffSb44MSgRLohoAlm4uyCl0FCqLK9nxxbvd
	PZ0c17qmccVGQO7GH8Ybuxn6gZdKgHWHyrShGMEu074K9/SgEP4Lg9MvLEpT2lXCAt9TpVp3gttgf
	BgNfWztLJewUU9iE9U5/zud/PIWnImaU9Gmg8llT32BUUYAIbUUFI7BaU7vPTJCxuYRFj1imbJIHm
	7TAWPgqGfgpepDW3pOYhSrB2haUKFNT8CTSB6HkzGzikdJw1PGCaPW4E5AfIlOoRcZaBGKRdrdBsb
	pCvBIbVQ==;
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBbm4-000000005N8-069x
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 15:28:49 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-aa2099efdc3so167878066b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Nov 2024 07:28:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731598006; x=1732202806; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2tLZgochhxByX0SsTSk8ag2ydSVQVzltSz9opSL6ecc=;
        b=CT+DM1D7Kmofi7PKzC1wkYugxvJRF/r7DZvvgmW+/AN/4NQeEo50VK9aqMEXKSaoNx
         oHvwTisFZoLQDGZVdrqE1voyR1ywUe55PiRd4jCGXx1YqgYgJvQKjaEb2LN2s5Lm5R+y
         ybpYie00qi4fjXAK+uXNnklFB8PKwe12MR/ZTzYJ8GAimS/PV/m0KE1NSk2jIKDPQCGI
         nfIUlvP3aXLkIllNwsr6DB6IvPdi1SKHK8z+KZn2QtTnSOxTErBvXDKKiuFuTl22hTaF
         +Ne+6D7wvZ9gQegHohdeOzC85XRPRyyR3JJNBAtqvBf9RIHQiwp2BbBUiNTNKYFEVpa6
         XJ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731598006; x=1732202806;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2tLZgochhxByX0SsTSk8ag2ydSVQVzltSz9opSL6ecc=;
        b=Ja4/MhoNGJmeXxF/QfoQD7JhQmNUIBDVFAsxfqmVltDa4QfZDWA14frkKc7hiOmo4J
         IrlXCNwN6jLlUX19CzVvITqWmerD07NhS42VS8JoYqVG2NiKUh+oOqorTHmhUneXLj3b
         clmTvYexyWzD8i0rwcIHLufmy0/lckfT8fdNeZ2HVGbX/HEgQOeaHQpLVH5wtdXGK4fD
         pr0cJHtHjMKwzmn6a/kT/9Pe6J6T9udJ/Z4t58mj1079XG3otglg3V3JH0240COphgZA
         rCgd1LSGkDQv8MlemnOrjIJKME7YORB89JSLZk9TKnHeKPYQEeR/l22i2QWdvMHeLDrW
         ZLdg==
X-Forwarded-Encrypted: i=1; AJvYcCVyQMdqHw+1/4l1ZDS97Ka/6ApcK2FLFL2Wv1iuUrBZedvb8HNDzs2WPqTBCJ0L2AqgoahelFlF3h3M6xHBs19/@lists.infradead.org
X-Gm-Message-State: AOJu0Yyz+NW1bSdtpoT48Hba8EUlvvP2Lfa/iIsXqxY12wKw6vH9ZmcD
	+GpZg8rOr+UsxNagYh+6ME0+SkIvRTHvFVp6L8rcnw3pv7iCFodI0EeYurcnqxk=
X-Google-Smtp-Source: AGHT+IEvsrXzBxSIOw1ZGA4Zprqz34mCq4r61SEVfsPFEFRjSOjMBpJm1nH0y5by2VBMiXWjNMkq4A==
X-Received: by 2002:a17:907:d24:b0:a9a:eeb:b26a with SMTP id a640c23a62f3a-aa207681194mr371909766b.1.1731598005834;
        Thu, 14 Nov 2024 07:26:45 -0800 (PST)
Received: from [192.168.68.163] ([145.224.90.214])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa20e043316sm73588566b.135.2024.11.14.07.26.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Nov 2024 07:26:45 -0800 (PST)
Message-ID: <658fec30-af5e-4a90-bf5a-426aedb55e50@linaro.org>
Date: Thu, 14 Nov 2024 15:26:44 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] coresight: tmc: Don't change the buffer size if it's
 in use
To: Yicong Yang <yangyicong@huawei.com>, suzuki.poulose@arm.com,
 mike.leach@linaro.org, coresight@lists.linaro.org
Cc: yangyicong@hisilicon.com, jonathan.cameron@huawei.com,
 prime.zeng@hisilicon.com, hejunhao3@huawei.com, linuxarm@huawei.com,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
References: <20241114081653.24328-1-yangyicong@huawei.com>
 <9a637e74-d81d-405c-bad0-c97ec1aa4b77@linaro.org>
 <0cfbd546-ee9a-da6e-904a-c1da4e59e286@huawei.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <0cfbd546-ee9a-da6e-904a-c1da4e59e286@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_152848_203922_49C1C97F 
X-CRM114-Status: GOOD (  29.65  )
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



On 14/11/2024 2:51 pm, Yicong Yang wrote:
> On 2024/11/14 18:30, James Clark wrote:
>>
>>
>> On 14/11/2024 8:16 am, Yicong Yang wrote:
>>> From: Yicong Yang <yangyicong@hisilicon.com>
>>>
>>> Enable the trace in below steps will crash the kernel by NULL pointer
>>> dereferencing:
>>> echo 1 > /sys/bus/coresight/devices/tmc_etr0/enable_sink
>>> echo 1 > /sys/bus/coresight/devices/etm0/enable_source
>>> echo 0x400000 > /sys/bus/coresight/devices/tmc_etr0/buffer_size
>>> echo 1 > /sys/bus/coresight/devices/etm2/enable_source
>>> dd if=/dev/tmc_etr0 of=test_etm_sysfs_etr_030.data
>>>
>>> The call trace will be like:
>>>    WARNING: CPU: 39 PID: 8586 at drivers/hwtracing/coresight/coresight-tmc-etr.c:1123 __tmc_etr_disable_hw+0x108/0x140 [coresight_tmc]
>>>    [...]
>>>    Call trace:
>>>     __tmc_etr_disable_hw+0x108/0x140 [coresight_tmc]
>>>     tmc_read_prepare_etr+0xc0/0xd0 [coresight_tmc]
>>>     tmc_open+0x60/0xa0 [coresight_tmc]
>>>     misc_open+0x11c/0x170
>>>     chrdev_open+0xcc/0x2b0
>>>     do_dentry_open+0x140/0x4e0
>>>     vfs_open+0x34/0xf8
>>>     path_openat+0x2b0/0xf58
>>>     do_filp_open+0x8c/0x148
>>>     do_sys_openat2+0xb8/0xe8
>>>     __arm64_sys_openat+0x70/0xc0
>>>     el0_svc_common.constprop.0+0x64/0x148
>>>     do_el0_svc+0x24/0x38
>>>     el0_svc+0x40/0x140
>>>     el0t_64_sync_handler+0xc0/0xc8
>>>     el0t_64_sync+0x1a4/0x1a8
>>>    ---[ end trace 0000000000000000 ]---
>>>    Unable to handle kernel NULL pointer dereference at virtual address 0000000000000028
>>>    [...]
>>>    Call trace:
>>>     tmc_etr_get_sysfs_trace+0x10/0x80 [coresight_tmc]
>>>     vfs_read+0xcc/0x310
>>>     ksys_read+0x74/0x108
>>>     __arm64_sys_read+0x24/0x38
>>>     el0_svc_common.constprop.0+0x64/0x148
>>>     do_el0_svc+0x24/0x38
>>>     el0_svc+0x40/0x140
>>>
>>> Due to the buffer size changed, the buffer will be reallocated in
>>> tmc_etr_get_sysfs_buffer() when the second source enabled. At trace
>>> end tmc_etr_sync_sysfs_buf() will reset the drvdata->sysfs_buf and
>>> trigger the later NULL pointer dereference when reading out the
>>> data.
>>>
>>> But it doesn't make sense to change the buffer size when it's
>>> already in use. So block such behavior.
>>>
>>> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
>>> ---
>>>    drivers/hwtracing/coresight/coresight-tmc-core.c | 5 +++++
>>>    1 file changed, 5 insertions(+)
>>>
>>> diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
>>> index 475fa4bb6813..9660af63e9bc 100644
>>> --- a/drivers/hwtracing/coresight/coresight-tmc-core.c
>>> +++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
>>> @@ -319,6 +319,11 @@ static ssize_t buffer_size_store(struct device *dev,
>>>        if (drvdata->config_type != TMC_CONFIG_TYPE_ETR)
>>>            return -EPERM;
>>>    +    /* Don't change the buffer size if it's in use */
>>> +    guard(spinlock)(&drvdata->spinlock);
>>> +    if (coresight_get_mode(drvdata->csdev) != CS_MODE_DISABLED)
>>
>> Size isn't used in perf mode is it? So it can be -EBUSY only when mode == CS_MODE_SYSFS.
>>
> 
> alloc_etr_buf() on the perf path will read drvdata->size, not sure it matters if user
> change it through sysfs in the meanwhile. Will test and have a check if there are any
> other places using size on the perf path.
> 

Hmmm I assumed that Perf mode completely ignored anything from sysfs 
mode. I see that alloc_etr_buf() does sometimes use the sysfs value. I 
don't really see why that's necessary because that means it sometimes 
ignores the buffer size from the perf command line depending on what's 
in sysfs, but the modes should be mutually exclusive.

Unless we fix that then I think you do need to use the device spinlock. 
But I think we should tidy up alloc_etr_buf() to only try to allocate 
from the Perf size down to TMC_ETR_PERF_MIN_BUF_SIZE, ignoring 
drvdata->size. Then the behavior is less surprising to users and also 
anyone reading the code. And rename it to alloc_etr_buf_perf().

Unless Suzuki knows of a reason it was done that way to begin with? I 
checked the commit message but it just says that it was like that but 
not why.

>>> +        return -EBUSY;
>>> +
>>>        ret = kstrtoul(buf, 0, &val);
>>>        if (ret)
>>>            return ret;
>>
>> Looks ok to me. Although for consistency it might be worth changing to guard(mutex)(&coresight_mutex) because this is about sysfs mode only and other usages of mode and comments point to coresight_mutex. Using the device's spinlock will technically work but it did make me go and double check the code. And there are other cases of reading the mode like this:
>>
> 
> ok, I thought to also serialize the use of drvdata->size. But as you mentioned
> use coresight_mutex is enough and will be consistenct with other places.
> 
>> static ssize_t enable_source_show(struct device *dev,
>>                    struct device_attribute *attr,
>>                    char *buf)
>> {
>>      struct coresight_device *csdev = to_coresight_device(dev);
>>
>>      guard(mutex)(&coresight_mutex);
>>      return scnprintf(buf, PAGE_SIZE, "%u\n",
>>               coresight_get_mode(csdev) == CS_MODE_SYSFS);
>> }
>>
>> Mode can change to CS_MODE_PERF while inside coresight_mutex but the device would end up not being enabled for sysfs, so it's still ok to update the sysfs size value in that case.
>>
>> With that change:
>>
>> Reviewed-by: James Clark <james.clark@linaro.org>
> 
> Thanks.
> 


