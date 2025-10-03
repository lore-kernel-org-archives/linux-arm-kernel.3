Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83E2ECCA471
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 10:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bl+nsZOt5aiIzjCcGRgHJ9DX3mVLsTj7Vc42JWggEtI=; b=b5Gxyx399CbFiGkngg0Dm2moS4
	cqp3KAKTLck7x8dISdgNufIfSZmmpQZYT6WGz17tfCXN3s2x2aityWwii0HbUEb1ktHa+rjqx/74W
	qsriO/zTY9SSU8njOpBwb7XXYWXYGYmx21C0TO8907t9v4qX9IQgWmpQlcLCChAUI979Ze+xrgH1k
	yEkWoKbeHreq2TwrVKe1py+YcMB8/zeyLW7S0JxA448vWCmMbIUiOdBbEB3r4B1vpyUeK1IBFQNxh
	PXtLkEn1zIdIQ1ohAqF0bz+Dky0wUuTu7MEA+q1mCMXEyg69XnVjyXsvA594ZFYlVnRxclihQQhP1
	RcUm2new==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4coy-0000000C1RX-0cCg;
	Fri, 03 Oct 2025 10:15:28 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4cov-0000000C1Q4-17FF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Oct 2025 10:15:26 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-46e52279279so13532065e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Oct 2025 03:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759486523; x=1760091323; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bl+nsZOt5aiIzjCcGRgHJ9DX3mVLsTj7Vc42JWggEtI=;
        b=rNNj9dd5Kzt8i+JbZtYTgLQMf+WLWmSTrcCYI45axvdk5jq8ZO5IKgoN7nstrNmhQ8
         P8PZ7A+UPHr0VFO/0o7w8/QgjHUmwIf0J/9lCemq4kmw6xyWiSHxvM+ytjf7cir8PD7o
         xsopbGOZA5ikJOcc9stjCcxEawLVQFo6M0idvzsNNc2qJj1xDKQY4G7HyFbY0Ps4SqTt
         C1MDKfKklzhso9l0SkpmLEViGfr/TliJwH+EWKUlf2lJKMu3O7UXQYl1bddJDKCb+eug
         7hYvkt4JDTTpIDK9ecSKYPwm16cnKn0VK/AzEjsSxkczz9zD00ParmxAaxr8szHRO3AK
         GSdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759486523; x=1760091323;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bl+nsZOt5aiIzjCcGRgHJ9DX3mVLsTj7Vc42JWggEtI=;
        b=BsbfTG0fjtVkIWLdOCY4w9MEdM1Ix6lRoo5nfmyo6MeqKyEohl2hVAKuhbw5qB7heP
         kxlhPgjjgfkB6LOWAfYNMLwlHx6FXAsnEnPqEMua3Yliu8ZHFxaMAJrDC/RIvY+M8gPA
         /h9i6fOLXxBL3NMPIyx86ZCmVWxZMMyM468ecKErQgwdnWvufzElr418XaRE31XWzrBc
         y0Uzhqq2QIk9Apfkrqiyg1KY+p0ezEv/rS/RDMXPjul5q7H14V5hsUNPW4gnME+sor7l
         dpoygfT9m8VozaqMy/AJbnqYn/mzjJuTl3RGzxGPXThPwIXBgl+YGNZZRO8hG1WF/1IF
         2j0A==
X-Forwarded-Encrypted: i=1; AJvYcCVOtMziPdVAFCCs1wb3fZZ463eOJ6AkaqLLxsCmRoQswKwEmka9VTn6w9Vp6uu/9K3hKvx8sEY1skBGjsFUFVXG@lists.infradead.org
X-Gm-Message-State: AOJu0YwFpJybqnbgxKK7M4Kb79Qpl8qVz9yhswffaN2Y5y/h0Y3sXdjo
	uo/eXsDngUCbzH7kNWjIFPu+mS/Bdp5DLbbkOhGpcNY7EGXOc9oRtxggdi1jQ75+6ck=
X-Gm-Gg: ASbGnctUwD6ql4MacrDnJ2gpQgJcW568kfSJOwZJx47Bsod+Q3N4oHDdY4C6NOS/GSG
	Ft9EXqfXA2a4PyFd4LafoAE7YSXZhQ1aAiqIgqzUXJZiWKMSDv2XbNfszFc6FXYX35wIdH96aVg
	E9ZOW7hJfgcJEC79nu+XJMS8ouAXuFz6tetQ3IEHDPfgDZoXff/SH/pL3I7Vaj6H1U63pfI9k7D
	wiaAw5aUzbiJxGW2yq5k56ZdQi0jdv0NCtu4he+QnYc7iCi/btFggaqDbsA2VJirNmDYB0amPLQ
	dY/YuuvmmvxBCGxhzfl5r6jbAXDaiyHmiY1Rvj3XbJlYtfHPyjaegweUJgUJTF3swozVIjuH2vM
	IzZcb8AMW841MEDSCtkIh3tPdijV/uV3jfCM9+lBogWhEJl9KhdkGmbUb
X-Google-Smtp-Source: AGHT+IEq7wGTmRez8IGGA43fO8BKaJyFFTge0agGY0xU9katUvNW8EoF+c/cOK1zhkAHE4PNdBd3Yw==
X-Received: by 2002:a05:600c:154a:b0:46e:1c97:e214 with SMTP id 5b1f17b1804b1-46e71140b06mr14531195e9.19.1759486523173;
        Fri, 03 Oct 2025 03:15:23 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e723431d0sm26860755e9.5.2025.10.03.03.15.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Oct 2025 03:15:22 -0700 (PDT)
Message-ID: <24600e6c-8f99-4e4d-ae68-a7927bce88bb@linaro.org>
Date: Fri, 3 Oct 2025 11:15:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/31] coresight: Change device mode to atomic type
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 Mike Leach <mike.leach@linaro.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>,
 Yuanfang Zhang <quic_yuanfang@quicinc.com>
References: <20250915-arm_coresight_power_management_fix-v3-0-ea49e91124ec@arm.com>
 <20250915-arm_coresight_power_management_fix-v3-1-ea49e91124ec@arm.com>
 <422560ee-50e8-4298-80c8-de46c521117a@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <422560ee-50e8-4298-80c8-de46c521117a@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251003_031525_346261_256C5877 
X-CRM114-Status: GOOD (  26.66  )
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



On 02/10/2025 1:51 pm, Suzuki K Poulose wrote:
> On 15/09/2025 11:33, Leo Yan wrote:
>> The device mode is defined as local type. This type cannot promise
>> SMP-safe access.
>>
>> Change to atomic type and impose relax ordering, which ensures the
>> SMP-safe synchronisation and the ordering between the mode setting and
>> relevant operations.
>>
>> Fixes: 22fd532eaa0c ("coresight: etm3x: adding operation mode for 
>> etm_enable()")
> 
> 
> Do we really have an issue here ? I thought we modify the mode under
> spinlock. Also the fixes commit looks odd. The mode was added to the 
> coresight device only recently. Prior to that, it was part of drvdata 
> and was serialized by the respective spinlocks. So I don't see how this
> was an issue.
> 
> Suzuki
> 
> 
> 

Mode changes for sources are/were always done outside of any locking 
using the compare and swap, even before it was moved to coresight 
device. The reason was probably to do a quick early fail in the case of 
contention between sysfs and Perf.

I think mode changes for other device types may already be within in 
their spinlocks.

Unrelated to this change, I think the complexity isn't unnecessary and 
taking the spinlock could be the very first operation for any action. 
That would do away with the atomics. We don't need to optimise for any 
contention cases, because it never happens outside of artificial stress 
tests.


>> Signed-off-by: Leo Yan <leo.yan@arm.com>
>> ---
>>   include/linux/coresight.h | 25 +++++++++++--------------
>>   1 file changed, 11 insertions(+), 14 deletions(-)
>>
>> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
>> index 
>> 6de59ce8ef8ca45c29e2f09c1b979eb7686b685f..3e5e5acd0c7fcde7d312d440da4355faaf682c7b 100644
>> --- a/include/linux/coresight.h
>> +++ b/include/linux/coresight.h
>> @@ -251,15 +251,11 @@ struct coresight_trace_id_map {
>>    *        by @coresight_ops.
>>    * @access:    Device i/o access abstraction for this device.
>>    * @dev:    The device entity associated to this component.
>> - * @mode:    This tracer's mode, i.e sysFS, Perf or disabled. This is
>> - *        actually an 'enum cs_mode', but is stored in an atomic type.
>> - *        This is always accessed through local_read() and local_set(),
>> - *        but wherever it's done from within the Coresight device's 
>> lock,
>> - *        a non-atomic read would also work. This is the main point of
>> - *        synchronisation between code happening inside the sysfs mode's
>> - *        coresight_mutex and outside when running in Perf mode. A 
>> compare
>> - *        and exchange swap is done to atomically claim one mode or the
>> - *        other.
>> + * @mode:    The device mode, i.e sysFS, Perf or disabled. This is 
>> actually
>> + *        an 'enum cs_mode' but stored in an atomic type. Access is 
>> always
>> + *        through atomic APIs, ensuring SMP-safe synchronisation between
>> + *        racing from sysFS and Perf mode. A compare-and-exchange
>> + *        operation is done to atomically claim one mode or the other.
>>    * @refcnt:    keep track of what is in use. Only access this 
>> outside of the
>>    *        device's spinlock when the coresight_mutex held and mode ==
>>    *        CS_MODE_SYSFS. Otherwise it must be accessed from inside the
>> @@ -288,7 +284,7 @@ struct coresight_device {
>>       const struct coresight_ops *ops;
>>       struct csdev_access access;
>>       struct device dev;
>> -    local_t    mode;
>> +    atomic_t mode;
>>       int refcnt;
>>       bool orphan;
>>       /* sink specific fields */
>> @@ -621,13 +617,14 @@ static inline bool 
>> coresight_is_percpu_sink(struct coresight_device *csdev)
>>   static inline bool coresight_take_mode(struct coresight_device *csdev,
>>                          enum cs_mode new_mode)
>>   {
>> -    return local_cmpxchg(&csdev->mode, CS_MODE_DISABLED, new_mode) ==
>> -           CS_MODE_DISABLED;
>> +    int curr = CS_MODE_DISABLED;
>> +
>> +    return atomic_try_cmpxchg_acquire(&csdev->mode, &curr, new_mode);
>>   }
>>   static inline enum cs_mode coresight_get_mode(struct 
>> coresight_device *csdev)
>>   {
>> -    return local_read(&csdev->mode);
>> +    return atomic_read_acquire(&csdev->mode);
>>   }
>>   static inline void coresight_set_mode(struct coresight_device *csdev,
>> @@ -643,7 +640,7 @@ static inline void coresight_set_mode(struct 
>> coresight_device *csdev,
>>       WARN(new_mode != CS_MODE_DISABLED && current_mode != 
>> CS_MODE_DISABLED &&
>>            current_mode != new_mode, "Device already in use\n");
>> -    local_set(&csdev->mode, new_mode);
>> +    atomic_set_release(&csdev->mode, new_mode);
>>   }
>>   struct coresight_device *coresight_register(struct coresight_desc 
>> *desc);
>>
> 


