Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A6B8CA0FE7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 14:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wvsKNDuUjmS0VQPWE4YtuWYyDveTbfCbdSn10meZI/Y=; b=De9JSaO+DoQkrot21Z6Nw3FJgI
	ODgXB+ukdQt7zVYxie9XQzBYgk0DBdepdSC32VRFvdKF20oWQtKDt3aQZeJamZNJvtFRjWl/6WTSf
	LCCZL+y+aaikddD87sxLAoF4H6wITc5xbu9frqVzIfG5LSJvpTtMPkIus37keCfhKuzW24rVvhH+I
	xMUtgfeVFL13OxHTVo8KdGHfEXkX/OHmLQ/fTVwz3U2EohWqPmheTQgUOoXGdMXvx52bOZhDQFoHi
	6Yz706eGYHX//UUXegQN8NvJETipLwvqMi1xj9R6cTLk8GLTOflaQivyf1HcUIx5R119/1xIePwRi
	kUXutijQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uquHg-0000000CBw7-3qJx;
	Tue, 26 Aug 2025 14:04:24 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqtkB-0000000C6YE-2ao5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Aug 2025 13:29:48 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3c73d3ebff0so1187553f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Aug 2025 06:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756214986; x=1756819786; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wvsKNDuUjmS0VQPWE4YtuWYyDveTbfCbdSn10meZI/Y=;
        b=pXc4FY1svy5rb9PwN2toTynIcEexe0txPfCcz7Urzz3pPJVSND3wNxDIiF5PfW1vQ9
         NC3RrVCxJ0FUeAVWS7RY1VFk6GCweNF6JwyVmVsNIbpg8kouxvCDlB65WKCIxY8WQNir
         +rWQQi3eJ2u+2Oa41Vk1Zy+vvDdgGZ+j+gU7X0oInr9g1mEMOtjT4EYsggLJ1FZHgUQd
         LS80of9j0TvDBKZKen6wPQRLNuvwaJWNbt5tm1yRihmvgdSOXoiwDibQEZFovYg6Ru+c
         36YxvQDWYgHHUkPPMsJTWXAwtI5E1wMkNgOSC10iZwyL8fX53FnOGKd2yEmQ2lI0cPFy
         wkgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756214986; x=1756819786;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wvsKNDuUjmS0VQPWE4YtuWYyDveTbfCbdSn10meZI/Y=;
        b=YVSuB+0kowXIVDvQJ9J88GgU/OZudL/skGawXlL0ZGas+gQUW5b/xOcf1Nrjlv2xM3
         xRoiUXaNaBH6MFk4m8G/XXwjm3vPPnKNboUEyylnO1tP0gGUn5nj5Dc6kXpKtbALNOQn
         eJmdnwTlXJyFoDur0EpJBwfBJT4yxDdHgp3cjS7sIpBXso6gjRwwefQl4ySUaVMsfecn
         M3F8UrLdfK54CTAMbJXGpfhkYyPGfLlokjU5RKFmzrhtHL3FELWH8vuECgHtQ+ACnyZV
         3M+c4Hel+ITwGq9vJyzmh8o++gvwngJDpzjOEClL8Kg2JOY3GBcMuYmMtzEjBqzwxVY9
         u8IQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWL9odbNfSUeCaeLRxaKyEmga5qpVkYr/D/zpGbgckHVvBR/5LDtv7S6W4aDkXxTYIuqreCtdScQJ0knLyQUVY@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7cK9bl4djt8kXCoBcYvGON4isFpduVKxju0OqgQgVdOhUmfpu
	bX7huN8Icfl7p4UaQrvfWmfQ7OjzVjYSDHWFDS3QLB/eDgjXsVTCHQy0gDsGXi0EY70=
X-Gm-Gg: ASbGncsWiLa0augI/nRX5UtFuGi9By1bJ3+Lc/8hq0PV7bSogCgvsCFQsGsMR4i9GcL
	UMEVeF8UTMGRwny7fWB+iU4HnX2wteWVz1Sf1pKAWvPviYtuHi7h5BbOR7Ra3fE5Yk4Fm30wYke
	xRpW/DAN+SZsW6KFqghWZxQeH36SrsKZqtCG/ith6hv94t+o7gaO++TotDZ9xRIE5VtiuG0CVFE
	bf1rshSgLRDMFg3rMseMEJe1zfwCTubRiB2846nCPsohpHBSmWNIquKeYvZ3yyxmOZk5Sfvcw9d
	FRgR9obiThGtebiSsRxq8aq9rmvnI4BQs5RB0PCekyyPL7E4AcaZvxihEylJhL1CJL9NMDWG8Ci
	/fdk1yiLioqqlLL38Lxh9kdhKLZUWokASe6OKYg==
X-Google-Smtp-Source: AGHT+IFWuW9FaUNkD9tIPp6wuI6vkMWmS0zI4RdhCAvwYdRqkj87/TiU6ljHYOFki7P8Tlb1PHy0Gw==
X-Received: by 2002:a05:6000:2006:b0:3b7:885d:d2ec with SMTP id ffacd0b85a97d-3cbb15ca4c0mr1295584f8f.18.1756214985928;
        Tue, 26 Aug 2025 06:29:45 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c7117d5b10sm16175319f8f.47.2025.08.26.06.29.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Aug 2025 06:29:45 -0700 (PDT)
Message-ID: <8f3a1f75-3476-47e9-a8d6-f396939b3240@linaro.org>
Date: Tue, 26 Aug 2025 14:29:44 +0100
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
 <939eb45c-f48e-40ce-86e8-710afa2b5c9b@linaro.org>
 <5df27be9-0347-49d1-ba1e-21d6a2172314@oss.qualcomm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <5df27be9-0347-49d1-ba1e-21d6a2172314@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_062947_678959_9F91613E 
X-CRM114-Status: GOOD (  30.08  )
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



On 26/08/2025 1:11 pm, Jie Gan wrote:
> 
> 
> On 8/26/2025 5:54 PM, James Clark wrote:
>>
>>
>> On 26/08/2025 10:39 am, Jie Gan wrote:
>>>
>>>
>>> On 8/26/2025 5:27 PM, James Clark wrote:
>>>>
>>>>
>>>> On 26/08/2025 8:01 am, Jie Gan wrote:
>>>>> From: Tao Zhang <tao.zhang@oss.qualcomm.com>
>>>>>
>>>>> Setting bit i in the TPDA_FLUSH_CR register initiates a flush request
>>>>> for port i, forcing the data to synchronize and be transmitted to the
>>>>> sink device.
>>>>>
>>>>> Signed-off-by: Tao Zhang <tao.zhang@oss.qualcomm.com>
>>>>> Co-developed-by: Jie Gan <jie.gan@oss.qualcomm.com>
>>>>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>>>>> ---
>>>>>   .../testing/sysfs-bus-coresight-devices-tpda  |  7 +++
>>>>>   drivers/hwtracing/coresight/coresight-tpda.c  | 45 ++++++++++++++ 
>>>>> + ++++
>>>>>   drivers/hwtracing/coresight/coresight-tpda.h  |  1 +
>>>>>   3 files changed, 53 insertions(+)
>>>>>
>>>>> diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices- 
>>>>> tpda b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
>>>>> index e827396a0fa1..8803158ba42f 100644
>>>>> --- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
>>>>> +++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
>>>>> @@ -41,3 +41,10 @@ Contact:    Jinlong Mao 
>>>>> <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qu
>>>>>   Description:
>>>>>           (RW) Configure the CMB/MCMB channel mode for all enabled 
>>>>> ports.
>>>>>           Value 0 means raw channel mapping mode. Value 1 means 
>>>>> channel pair marking mode.
>>>>> +
>>>>> +What:        /sys/bus/coresight/devices/<tpda-name>/port_flush_req
>>>>> +Date:        August 2025
>>>>> +KernelVersion:    6.17
>>>>> +Contact:    Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang 
>>>>> <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
>>>>> +Description:
>>>>> +        (RW) Configure the bit i to requests a flush operation of 
>>>>> port i on the TPDA.
>>>>> diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/ 
>>>>> drivers/ hwtracing/coresight/coresight-tpda.c
>>>>> index 9e623732d1e7..c5f169facc51 100644
>>>>> --- a/drivers/hwtracing/coresight/coresight-tpda.c
>>>>> +++ b/drivers/hwtracing/coresight/coresight-tpda.c
>>>>> @@ -509,6 +509,50 @@ static ssize_t cmbchan_mode_store(struct 
>>>>> device *dev,
>>>>>   }
>>>>>   static DEVICE_ATTR_RW(cmbchan_mode);
>>>>> +static ssize_t port_flush_req_show(struct device *dev,
>>>>> +                   struct device_attribute *attr,
>>>>> +                   char *buf)
>>>>> +{
>>>>> +    struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
>>>>> +    unsigned long val;
>>>>> +
>>>>> +    guard(spinlock)(&drvdata->spinlock);
>>>>> +    if (!drvdata->csdev->refcnt)
>>>>> +        return -EPERM;
>>>>> +
>>>>> +    val = readl_relaxed(drvdata->base + TPDA_FLUSH_CR);
>>>>> +    return sysfs_emit(buf, "%lx\n", val);
>>>>
>>>> Decimal would be better for a port number that goes from 0 - 127. If 
>>>> you really want to use hex then don't you need to prefix it with 0x? 
>>>> Otherwise you can't tell the difference between decimal 10 and hex 
>>>> 10, and it's not documented that it's hex either.
>>>>
>>>
>>> Got it. I will fix the code here, and update the description in 
>>> document.
>>>
>>>>> +}
>>>>> +
>>>>> +static ssize_t port_flush_req_store(struct device *dev,
>>>>> +                    struct device_attribute *attr,
>>>>> +                    const char *buf,
>>>>> +                    size_t size)
>>>>> +{
>>>>> +    struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
>>>>> +    unsigned long val;
>>>>> +
>>>>> +    if (kstrtoul(buf, 0, &val))
>>>>> +        return -EINVAL;
>>>>> +
>>>>> +    /* The valid value ranges from 0 to 127 */
>>>>> +    if (val > 127)
>>>>> +        return -EINVAL;
>>>>> +
>>>>> +    guard(spinlock)(&drvdata->spinlock);
>>>>> +    if (!drvdata->csdev->refcnt)
>>>>> +        return -EPERM;
>>>>> +
>>>>> +    if (val) {
>>>>
>>>> If 0 - 127 are valid don't you want to write 0 too?
>>>
>>> It's 1-127 here. 0 may leads to an unexpected issue here.
>>>
>>> Thanks,
>>> Jie
>>>
>>
>> Then can't the above be this:
>>
>>    /* The valid value ranges from 1 to 127 */
>>    if (val < 1 || val > 127)
>>      return -EINVAL;
>>
>> But I'm wondering how you flush port 0?
>>
> 
> BIT(0) represents port 0 with value 1 and the default value 0 means 
> nothing will be triggered here.
> 
>> Isn't the default value 0? So if you never write to port_flush_req 
>> then you'd flush port 0, but why can't you change it back to 0 after 
>> writing a different value?
> 
> We can change the value back to 0 but I think we shouldn't do this 
> although I haven't suffer issue after I changed it back to 0(for bit).
> Because the document mentioned: "Once set, the bit remains set until the 
> flush operation on port i completes and the bit then clears to 0". So I 
> think we should let the flush operation finish as expected and clear the 
> bit by itself? Or may suffer unexpected error when try to interrupt the 
> flush operation?
> 
> Thanks,
> Jie

Oh I see, I thought this was a port number, not a bit for each port. 
That changes this and my other comment about changing the output to be 
decimal then. Hex is probably better but it needs the 0x prefix.

I would also treat 0 as EINVAL. It doesn't do anything different to any 
other out of range request so it should be treated the same way.

Then comparing to 127 isn't that obvious either. Something like 
FIELD_FITS() more clearly states that values have to fit into a bitfield 
rather than be less than some value:

   if (!val || !FIELD_FIT(TPDA_FLUSH_CR_PORTNUM, val))
	return -EINVAL;


>   >>>
>>>>> +        CS_UNLOCK(drvdata->base);
>>>>> +        writel_relaxed(val, drvdata->base + TPDA_FLUSH_CR);
>>>>> +        CS_LOCK(drvdata->base);
>>>>> +    }
>>>>> +
>>>>> +    return size;
>>>>> +}
>>>>> +static DEVICE_ATTR_RW(port_flush_req);
>>>>> +
>>>>>   static struct attribute *tpda_attrs[] = {
>>>>>       &dev_attr_trig_async_enable.attr,
>>>>>       &dev_attr_trig_flag_ts_enable.attr,
>>>>> @@ -516,6 +560,7 @@ static struct attribute *tpda_attrs[] = {
>>>>>       &dev_attr_freq_ts_enable.attr,
>>>>>       &dev_attr_global_flush_req.attr,
>>>>>       &dev_attr_cmbchan_mode.attr,
>>>>> +    &dev_attr_port_flush_req.attr,
>>>>>       NULL,
>>>>>   };
>>>>> diff --git a/drivers/hwtracing/coresight/coresight-tpda.h b/ 
>>>>> drivers/ hwtracing/coresight/coresight-tpda.h
>>>>> index 00d146960d81..55a18d718357 100644
>>>>> --- a/drivers/hwtracing/coresight/coresight-tpda.h
>>>>> +++ b/drivers/hwtracing/coresight/coresight-tpda.h
>>>>> @@ -10,6 +10,7 @@
>>>>>   #define TPDA_Pn_CR(n)        (0x004 + (n * 4))
>>>>>   #define TPDA_FPID_CR        (0x084)
>>>>>   #define TPDA_SYNCR        (0x08C)
>>>>> +#define TPDA_FLUSH_CR        (0x090)
>>>>>   /* Cross trigger FREQ packets timestamp bit */
>>>>>   #define TPDA_CR_FREQTS        BIT(2)
>>>>
>>>>
>>>
>>
>>
> 


