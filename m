Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 113FACA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 14:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d1Dw90QlXeLsOzAEqypsdzJHvGAD420d9Q1/z4Sh4TQ=; b=mFwtRgpX23Ct8PGdoNjDhk0xck
	ojcfdZ0KhxguXYJCStSM9yqIjpI72KakK8/xae8nzXQtMjLzNURReSIhFyEz1jLg3Ee1DBtnkUKPM
	d9KhKHj6uAdftzY/QRb258GSxr7NAZ6PvdEaSDF22pZEwiSLIWZZDoeqR7f4DODVwH9Cm/Zl8o0Rw
	FHuyYWAeec4h+9TlrzM/cscV7kPtiRrAMbGDl9shTDHhB3ip6P8u0/h032H9KDKM0P8pExKH46TdB
	YLDzuzGI0RikFnhfqCyXjdgUTABBXiuAmDErGPOI7R0Mef8HED4RuhgcBJcLyxTWCv2usfv+GbhYv
	ObJD3wrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urGpD-0000000Fgov-18VZ;
	Wed, 27 Aug 2025 14:08:31 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urDCG-0000000F1PW-1PEO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 10:16:05 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-45b629c8035so17808595e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Aug 2025 03:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756289762; x=1756894562; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d1Dw90QlXeLsOzAEqypsdzJHvGAD420d9Q1/z4Sh4TQ=;
        b=SZV4sQ9YZ4pIEeuhut66GZCqS2aTK4Gub1tlmykYkQtPwbbN999HKq4hQg1tj1Qsgq
         yDTsNYGcOvKwglyg/R/XHBtW/knLDYztJ6HWck4BYi/uzKObRy3YZF4oE1qOKoTtvJY1
         iYJ3QsO8IuVXVf3OQu6Cq8Vu+pKdBqcbZzRQNvAtKlrmW7HZIjv6jhOkgOKY7CGDuRUv
         KcCKxftvroJYJIkZ1YWidO5eJHcBcnJiHSki4DOM2pAMOzmxIoABhdU0K7p04FZ3XYgh
         xzRknykmaWpYDkIVwSvzE5q0Qdhejvt3j1UeNiaLdeUSa3uUK8bMq05ZhzTZh4pR9HcZ
         YwEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756289762; x=1756894562;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d1Dw90QlXeLsOzAEqypsdzJHvGAD420d9Q1/z4Sh4TQ=;
        b=dPjPWwUbE+C0MaoV1u3vCkLyNRFdW1zMx4wEBZF4qCj9KCqDuqqZZeiS6VZ8aflmRm
         yVLpBfKCjSyjiyYjWKU7X2l2/bATIu9jkR7W+kMpymS/D+ThVi8vXuWBfn8g3kG22tTK
         5TEilljGBn5f/4kv4Lg83UF4apZmKabrMKd3vxfDJh8vLQ7Ly/w0LFPiyS8ZJQ+vWh9v
         RUZU5/cdwEgE4xL6uvOhDlRtZbKyqwu3h+gPR+kwS4I4EC8LzXKsyp/Kb4fXmR/e+LG1
         4QR7ASicSeJTaojVVJmdPi/pMYMrMJ/uI+UTQ5wiIPDjp58/6hM/ICtA1gK/GhF9nhf8
         F2Ow==
X-Forwarded-Encrypted: i=1; AJvYcCVAo2iFa2HzFkTo6zKukvk1JAzna9C3ZMBlOLQjRtirzfEnKZrz5oKpjqiNZpRfuZ7tETh5r98nGUbM/G8p20kY@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0KNEwhj8XDK3BOlvfQulztKc0gl0dFgm9g956Un5ZV48OVuo1
	8cK5G4qff5CVOIWEkYBX7TxKfhLP7khXzfLZcH1AmcDKgxN1wCFfo7poIPjb10V/qOs=
X-Gm-Gg: ASbGncvYuMVYXB/rLlWE3MrbG7N/uBZc9MqH9yZ5UwuRnfV5V4bcqZn/tGFb13rHM+0
	rycAKOfgbMTe4ElQL/VA3JIVqAuX0XjmDaZAWHITF0KKp2qzZt4UbUr+gUKlTvTFmWEmfOAyFqv
	eJZ00ek1oE7nlJDxFfuHMBjnJbW0S6O41qKX9+jVrePma+5sjh+UslUu2VLCe+LzBWVehIx749Y
	7e1Z7M+Scd2Mu96ijQhu9GikLd6fdMUoyG+EiNDA7/Nv07cbHoGm/XqTUMFlFDPayA5xCcE0+U9
	oyZoNX7oIpcVOrsLlHiZSI9eVfaw61m6rwTUVZnQx1B/2IdTyeH+L3ZDQkWFe88byV3vZNKMiSh
	8Sg6dZTO1d0mdHvgkT3WFCeqkaiEj7PUaHis3Xg==
X-Google-Smtp-Source: AGHT+IGsDBxLcBzPHHU2PS5TGpLgmGzal6Fc/PpQk1ENqWTdXvkIRY9ehvzlf+vR27NlOBpNheomEw==
X-Received: by 2002:a05:600c:3149:b0:456:28f4:a576 with SMTP id 5b1f17b1804b1-45b517dd9a3mr143701635e9.27.1756289762374;
        Wed, 27 Aug 2025 03:16:02 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b6f4aa8a0sm24318175e9.12.2025.08.27.03.16.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Aug 2025 03:16:01 -0700 (PDT)
Message-ID: <bc337e7c-42e7-4e2d-8b2d-c39174d1ddd5@linaro.org>
Date: Wed, 27 Aug 2025 11:16:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] coresight: tpda: add sysfs node to flush specific
 port
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
References: <20250827042042.6786-1-jie.gan@oss.qualcomm.com>
 <20250827042042.6786-4-jie.gan@oss.qualcomm.com>
 <b1f79a26-97e1-40f4-b076-51d5c2abe736@linaro.org>
 <78d2ab99-f304-4fab-bc7b-859c8aa781d6@oss.qualcomm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <78d2ab99-f304-4fab-bc7b-859c8aa781d6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_031604_385486_077EB7DD 
X-CRM114-Status: GOOD (  25.83  )
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



On 27/08/2025 10:48 am, Jie Gan wrote:
> 
> 
> On 8/27/2025 5:17 PM, James Clark wrote:
>>
>>
>> On 27/08/2025 5:20 am, Jie Gan wrote:
>>> From: Tao Zhang <tao.zhang@oss.qualcomm.com>
>>>
>>> Setting bit i in the TPDA_FLUSH_CR register initiates a flush request
>>> for port i, forcing the data to synchronize and be transmitted to the
>>> sink device.
>>>
>>> Signed-off-by: Tao Zhang <tao.zhang@oss.qualcomm.com>
>>> Co-developed-by: Jie Gan <jie.gan@oss.qualcomm.com>
>>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>>> ---
>>>   .../testing/sysfs-bus-coresight-devices-tpda  |  7 ++++
>>>   drivers/hwtracing/coresight/coresight-tpda.c  | 42 +++++++++++++++++++
>>>   drivers/hwtracing/coresight/coresight-tpda.h  |  2 +
>>>   3 files changed, 51 insertions(+)
>>>
>>> diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices- 
>>> tpda b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
>>> index fb651aebeb31..2cf2dcfc13c8 100644
>>> --- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
>>> +++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
>>> @@ -41,3 +41,10 @@ Contact:    Jinlong Mao 
>>> <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qu
>>>   Description:
>>>           (RW) Configure the CMB/MCMB channel mode for all enabled 
>>> ports.
>>>           Value 0 means raw channel mapping mode. Value 1 means 
>>> channel pair marking mode.
>>> +
>>> +What:        /sys/bus/coresight/devices/<tpda-name>/port_flush_req
>>> +Date:        August 2025
>>> +KernelVersion:    6.17
>>> +Contact:    Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang 
>>> <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
>>> +Description:
>>> +        (RW) Configure the bit i to requests a flush operation of 
>>> port i on the TPDA.
>>> diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/ 
>>> hwtracing/coresight/coresight-tpda.c
>>> index 430f76c559f2..8b1fe128881d 100644
>>> --- a/drivers/hwtracing/coresight/coresight-tpda.c
>>> +++ b/drivers/hwtracing/coresight/coresight-tpda.c
>>> @@ -487,6 +487,47 @@ static ssize_t cmbchan_mode_store(struct device 
>>> *dev,
>>>   }
>>>   static DEVICE_ATTR_RW(cmbchan_mode);
>>> +static ssize_t port_flush_req_show(struct device *dev,
>>> +                   struct device_attribute *attr,
>>> +                   char *buf)
>>> +{
>>> +    struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
>>> +    unsigned long val;
>>> +
>>> +    if (!drvdata->csdev->refcnt)
>>> +        return -EINVAL;
>>> +
>>> +    guard(spinlock)(&drvdata->spinlock);
>>> +    CS_UNLOCK(drvdata->base);
>>> +    val = readl_relaxed(drvdata->base + TPDA_FLUSH_CR);
>>> +    CS_LOCK(drvdata->base);
>>> +    return sysfs_emit(buf, "%lx\n", val);
>>
>> Still missing the 0x prefix
> 
> Will re-check rest of the codes and add prefix. Sorry I missed it during 
> the review process.
> 
>>
>>> +}
>>> +
>>> +static ssize_t port_flush_req_store(struct device *dev,
>>> +                    struct device_attribute *attr,
>>> +                    const char *buf,
>>> +                    size_t size)
>>> +{
>>> +    struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
>>> +    unsigned long val;
>>> +
>>> +    if (kstrtoul(buf, 0, &val))
>>> +        return -EINVAL;
>>> +
>>> +    if (!drvdata->csdev->refcnt || !val)
>>> +        return -EINVAL;
>>> +
>>> +    val |= FIELD_PREP(TPDA_MAX_INPORTS_MASK, val);
>>
>> Using FIELD_PREP() now that it's the full width of the register makes 
>> less sense. Especially when there is no corresponding FIELD_FIT() 
>> check,   which is fine because everything always fits. But if you 
>> didn't know the mask was the full width you'd wonder if the check is 
>> missing.
>>
>> I would just write val directly to TPDA_FLUSH_CR so it's simpler.
>>
>> It should also have been val = FIELD_PREP(...)
> 
> Yeah, it should have been val = FIELD_PREP(...) here... sorry for the 
> mistake here..
> 
> I was thinking the unsigned long here could be 64 or 32 bits and we only 
> need the value of the lower 32 bits. So that's why I am using val = 
> FIELD_PREP(...) here. We shouldn't write a value greater than UINT32_MAX 
> to the register.
> 
> Thanks,
> Jie
> 

writel_relaxed() is always 32 bits though so it is a bit confusing if 
you truncate the user value without an error. Also a reason to use u32 
instead of unsigned long types.

Are you trying to support arm and arm64 with tpda? Or just arm64? For it 
to be consistent you can use kstrtou32(), or use kstrtoull() and then 
FIELD_FIT() to error on truncation. kstrtou32() is probably the cleanest.

>>
>>> +    guard(spinlock)(&drvdata->spinlock);
>>> +    CS_UNLOCK(drvdata->base);
>>> +    writel_relaxed(val, drvdata->base + TPDA_FLUSH_CR);
>>> +    CS_LOCK(drvdata->base);
>>> +
>>> +    return size;
>>> +}
>>> +static DEVICE_ATTR_RW(port_flush_req);
>>> +
>>>   static struct attribute *tpda_attrs[] = {
>>>       &dev_attr_trig_async_enable.attr,
>>>       &dev_attr_trig_flag_ts_enable.attr,
>>> @@ -494,6 +535,7 @@ static struct attribute *tpda_attrs[] = {
>>>       &dev_attr_freq_ts_enable.attr,
>>>       &dev_attr_global_flush_req.attr,
>>>       &dev_attr_cmbchan_mode.attr,
>>> +    &dev_attr_port_flush_req.attr,
>>>       NULL,
>>>   };
>>> diff --git a/drivers/hwtracing/coresight/coresight-tpda.h b/drivers/ 
>>> hwtracing/coresight/coresight-tpda.h
>>> index 8e1b66115ad1..56d3ad293e46 100644
>>> --- a/drivers/hwtracing/coresight/coresight-tpda.h
>>> +++ b/drivers/hwtracing/coresight/coresight-tpda.h
>>> @@ -10,6 +10,7 @@
>>>   #define TPDA_Pn_CR(n)        (0x004 + (n * 4))
>>>   #define TPDA_FPID_CR        (0x084)
>>>   #define TPDA_SYNCR        (0x08C)
>>> +#define TPDA_FLUSH_CR        (0x090)
>>>   /* Cross trigger FREQ packets timestamp bit */
>>>   #define TPDA_CR_FREQTS        BIT(2)
>>> @@ -35,6 +36,7 @@
>>>   #define TPDA_SYNCR_MAX_COUNTER_VAL    (0xFFF)
>>>   #define TPDA_MAX_INPORTS    32
>>> +#define TPDA_MAX_INPORTS_MASK    GENMASK(31, 0)
>>>   /* Bits 6 ~ 12 is for atid value */
>>>   #define TPDA_CR_ATID        GENMASK(12, 6)
>>
>>
> 


