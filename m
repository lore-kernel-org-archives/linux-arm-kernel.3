Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC016CA0FE9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 10:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DUhR3N3wo9t0MMX9pMVCs5MuCLAFXYwayYcG32x3UPw=; b=SOopQ6iIAklujV+y3YNncj6SX6
	SHMXKhTDcIbcG1tQDgCfpEOwvJ7OmMUh5UtoF0WF7Nvr6YbInfBY46lzQz3AqhZFlH0JFacDGJj79
	xVZHob3gLa2YZIk2+/EjKbH7qEyKK/TC6VHncau0GdhawDyVwSUlwuf09kfpCbe9G7HJ2alP2V6yU
	rexxiIsPnts4zVPYdFeDae+8KJhIO8cWrN925nw6VE5PdRg2IwTuoirqHrh+yz6Lp1Jbh5eV9Pyto
	yy7MYgkaaJ3ypRGlWt9pIy1SjqQHwKU84CUOrN12dQ2lLZvnz8jJZaz6dk1g3gBg4ycxRy5oBT3Ki
	QBoocOwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqrMJ-0000000BgqI-3clx;
	Tue, 26 Aug 2025 10:56:59 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqqO8-0000000BVmE-0ZqD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Aug 2025 09:54:49 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-45a1b065d59so30154645e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Aug 2025 02:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756202087; x=1756806887; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DUhR3N3wo9t0MMX9pMVCs5MuCLAFXYwayYcG32x3UPw=;
        b=vWncWCyrLW04sba63/uzWOu+YnNcZq/d+ATMGsHV9rUTwxEKbA4UdsCwFsfhzbwpkV
         COVfHe+evBOaHET7/ABQKMciGDZmHq3bfc7GGI36oSMeV/uqj8+m1TQ3ZGCvAmIgzCWd
         xDboebHjVGv41rO87iSChd2UwEXlXZDmABw6c232ckfEXDfsQyfaFhXLrlOGEuKTNuuS
         WP3yh7vwymVG4Ab7pXNQuP2Tzzf1rr2Z5S3Y6/okOXQFXhKGWPpdPIEHpebX3WQJf+ZC
         /Im7GxXuwHeTa6TG42Zv4pL+XU6Fn8GXL+2bAjdU2tdpfDyttG5JnhFurc8hmcFDVXhR
         mTYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756202087; x=1756806887;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DUhR3N3wo9t0MMX9pMVCs5MuCLAFXYwayYcG32x3UPw=;
        b=WvOBO6ZTy1fUesV6o52l2q3tCpaN5SYq3wgPO6C3j7UiatmvhwZq90nKHCsGdn/C5a
         57Lg6x/j8pHRElj94DnSon38/ERiwgTmhoDDhCouZIfsK22P7qVXCGiR1ofZlkyhk6gH
         BFUrA2Gh/BSCrRb1oarW9l1WXDPln3hddQL12x9lWMxljVeZdhsWzzoL5qQh2mMht3sJ
         SGSanAG9Y0urMPWqTQhbs8xQJsbg98oiIer9C6/HDLTb9iv54TIpXld6AbKmgPdy0tIR
         KHTXfiB4ZN0pSIVzl1o5sPecbAP9ULUIs5SiapLDDNb3fNs1++oMf4sUAaFbxhKzQsXk
         RJnw==
X-Forwarded-Encrypted: i=1; AJvYcCVvJ9GcBvOy/7dSLiMG7Rx/plkhS9Qsz8OyYN928WFyDEfhmoYwD1CBJHhFoMoyFkeqdffmzGN0Smq1QykSBZHc@lists.infradead.org
X-Gm-Message-State: AOJu0Yxb9CYQRLRWcaFkL3HpF/q3yggx8y95KY+rfZHirUw/cGv0na7i
	Q5o5KnI2OSAVOOFLvkam6MVX7JrAv2zbNSFJ8nxKZKu2FFpekJvebQvYXSjBJqH0I8I=
X-Gm-Gg: ASbGnctVOqRkrG8kGM/KCf2E87qs5KFvGTMyuK4aSbclYzI7vi3Jny0MOrrNn0pIvti
	k6nX4fmoQqwrBIHRgysjxIeTmDXkMmII1KjiONu9CpdxOpO3DBJ5w/yCNq0PzvGdmbGCRfwJ7Bb
	76aMDx5JCMLVvItAHngSYycF1QMJU7TRyjoWTUBHnaVa7GGC44dXlgOsBgdogosnfj3nWTI/GIR
	ZkVCgZ5ldfvr9zDqIzVLkV58Tqy2f3rt5nmteZjXtQKfHxCkgas2NApACCEDXtw4HefSvnmWfjY
	x9PnaPa9TP/4rP6/KpD6BIfOneQdbckXhstfjbfgAK583jEpnE/kARQnsQ35k4IneylB0toRMy5
	G7bOrb5vitKzwCSlBP2cCqwS8sFM=
X-Google-Smtp-Source: AGHT+IG5d6hpblOKT6s7Wm3ZNawcMOjmqDBLGNn2fTe92R0dESnXpKCTH6m7G2x/JchotdGo9PM5Cw==
X-Received: by 2002:a05:600c:1c0f:b0:45b:6365:7957 with SMTP id 5b1f17b1804b1-45b68bc7a0bmr7707245e9.33.1756202086662;
        Tue, 26 Aug 2025 02:54:46 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b5744a587sm145919205e9.9.2025.08.26.02.54.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Aug 2025 02:54:46 -0700 (PDT)
Message-ID: <939eb45c-f48e-40ce-86e8-710afa2b5c9b@linaro.org>
Date: Tue, 26 Aug 2025 10:54:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] coresight: tpda: add sysfs node to flush specific
 port
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
References: <20250826070150.5603-1-jie.gan@oss.qualcomm.com>
 <20250826070150.5603-4-jie.gan@oss.qualcomm.com>
 <3ac2954e-5663-4ea0-bc1d-a09e1992af5b@linaro.org>
 <a6be4d7b-d163-47df-9ab3-ca410f703555@oss.qualcomm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <a6be4d7b-d163-47df-9ab3-ca410f703555@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_025448_209474_93CF408C 
X-CRM114-Status: GOOD (  21.57  )
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



On 26/08/2025 10:39 am, Jie Gan wrote:
> 
> 
> On 8/26/2025 5:27 PM, James Clark wrote:
>>
>>
>> On 26/08/2025 8:01 am, Jie Gan wrote:
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
>>>   .../testing/sysfs-bus-coresight-devices-tpda  |  7 +++
>>>   drivers/hwtracing/coresight/coresight-tpda.c  | 45 +++++++++++++++++++
>>>   drivers/hwtracing/coresight/coresight-tpda.h  |  1 +
>>>   3 files changed, 53 insertions(+)
>>>
>>> diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices- 
>>> tpda b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
>>> index e827396a0fa1..8803158ba42f 100644
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
>>> index 9e623732d1e7..c5f169facc51 100644
>>> --- a/drivers/hwtracing/coresight/coresight-tpda.c
>>> +++ b/drivers/hwtracing/coresight/coresight-tpda.c
>>> @@ -509,6 +509,50 @@ static ssize_t cmbchan_mode_store(struct device 
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
>>> +    guard(spinlock)(&drvdata->spinlock);
>>> +    if (!drvdata->csdev->refcnt)
>>> +        return -EPERM;
>>> +
>>> +    val = readl_relaxed(drvdata->base + TPDA_FLUSH_CR);
>>> +    return sysfs_emit(buf, "%lx\n", val);
>>
>> Decimal would be better for a port number that goes from 0 - 127. If 
>> you really want to use hex then don't you need to prefix it with 0x? 
>> Otherwise you can't tell the difference between decimal 10 and hex 10, 
>> and it's not documented that it's hex either.
>>
> 
> Got it. I will fix the code here, and update the description in document.
> 
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
>>> +    /* The valid value ranges from 0 to 127 */
>>> +    if (val > 127)
>>> +        return -EINVAL;
>>> +
>>> +    guard(spinlock)(&drvdata->spinlock);
>>> +    if (!drvdata->csdev->refcnt)
>>> +        return -EPERM;
>>> +
>>> +    if (val) {
>>
>> If 0 - 127 are valid don't you want to write 0 too?
> 
> It's 1-127 here. 0 may leads to an unexpected issue here.
> 
> Thanks,
> Jie
> 

Then can't the above be this:

   /* The valid value ranges from 1 to 127 */
   if (val < 1 || val > 127)
     return -EINVAL;

But I'm wondering how you flush port 0?

Isn't the default value 0? So if you never write to port_flush_req then 
you'd flush port 0, but why can't you change it back to 0 after writing 
a different value?

>>
>>> +        CS_UNLOCK(drvdata->base);
>>> +        writel_relaxed(val, drvdata->base + TPDA_FLUSH_CR);
>>> +        CS_LOCK(drvdata->base);
>>> +    }
>>> +
>>> +    return size;
>>> +}
>>> +static DEVICE_ATTR_RW(port_flush_req);
>>> +
>>>   static struct attribute *tpda_attrs[] = {
>>>       &dev_attr_trig_async_enable.attr,
>>>       &dev_attr_trig_flag_ts_enable.attr,
>>> @@ -516,6 +560,7 @@ static struct attribute *tpda_attrs[] = {
>>>       &dev_attr_freq_ts_enable.attr,
>>>       &dev_attr_global_flush_req.attr,
>>>       &dev_attr_cmbchan_mode.attr,
>>> +    &dev_attr_port_flush_req.attr,
>>>       NULL,
>>>   };
>>> diff --git a/drivers/hwtracing/coresight/coresight-tpda.h b/drivers/ 
>>> hwtracing/coresight/coresight-tpda.h
>>> index 00d146960d81..55a18d718357 100644
>>> --- a/drivers/hwtracing/coresight/coresight-tpda.h
>>> +++ b/drivers/hwtracing/coresight/coresight-tpda.h
>>> @@ -10,6 +10,7 @@
>>>   #define TPDA_Pn_CR(n)        (0x004 + (n * 4))
>>>   #define TPDA_FPID_CR        (0x084)
>>>   #define TPDA_SYNCR        (0x08C)
>>> +#define TPDA_FLUSH_CR        (0x090)
>>>   /* Cross trigger FREQ packets timestamp bit */
>>>   #define TPDA_CR_FREQTS        BIT(2)
>>
>>
> 


