Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C4AECA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 11:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YWqGiEoMh1Ixg9kMOfn/oNPCFZIKj8izNNs6P0FgqRM=; b=17oHbF7ZBehncjNd5J8yCMTqrC
	DFaxlmmQm2hIcitsGdqLIsnQnp4OGTTdYE3OvmMmNQQFp2ZDKCyA/2/5X6oMLAFg/55R+AqASJDzW
	oNV19Uy2AZq+HcPK4pmAMjBETmnmXKcTIHu7qLTxTZx4iWmTG/l14CjcF+1ewTo42410R6HcfBs/+
	zdLvQQ4fPGFf94iUbf1BTlZhjTtI5NCTFPgWUer9Kyu3KDonbICjHKCCoNRqepyKFMUUcsTeVNYcq
	yUL+UrzeTc/+1oB94LwXCA0rYLxMVfq+qnDT98fB9X7nWgEofh9fEMiQ6l4wQF3MZ+VUuaj4olZHS
	u3H4kEkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urE1g-0000000FCeO-2XQ4;
	Wed, 27 Aug 2025 11:09:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urDHl-0000000F2pF-13xS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 10:21:46 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57R6kOxD031340
	for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Aug 2025 10:21:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YWqGiEoMh1Ixg9kMOfn/oNPCFZIKj8izNNs6P0FgqRM=; b=RmWejYITii3bKMyq
	4QiiPUeUVEBqKm0O0+BcdSZKkNquXIl7bLEFPe4jMN1l1lED2/RCSLCRKumJKzm+
	pYPdT7mBSI3ijTmk56pBeY5kBXEfMpHT/3DGcKzAU63J3sKHcAG4WvPWTZKnOYnA
	6/M27Nu4c9TkEkSNQX11WpOwA1VoynE4gJwRBGfHoAymAao7CPEpECMAZcNAG+k+
	zXfqrdxFPsVKXboOvbi33GqY/p8ducY04BanxDWf3tgR/c58+J/272grNd/X0GfZ
	Xbqhqhn4sd/o8aifX3Aj6ucH67VpDMNqrw71TPAjzfF8cLbJFCuthKoRwvR1xfJ+
	fCr/9w==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q615m7wh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Aug 2025 10:21:42 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-771d7aa1470so2785559b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Aug 2025 03:21:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756290101; x=1756894901;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YWqGiEoMh1Ixg9kMOfn/oNPCFZIKj8izNNs6P0FgqRM=;
        b=EwoM53zn6EwQrDsOBjDs83IVL3Oy2c6FHq4YeDDdK/eyTv58X+zgJ1zW64TpQWa+at
         K3u/chTkhGltQQWTBaJVtHTcmxNsC1FErY85+p0qLZa0wCiWKAoW+b5nP0u8uJhuzq1v
         RkvTbVQ1yPbCS4YYTnUaFhPVigsZnOPJXoqxaieN5Y90Q8XVu3sVOLSpiiiV20hKZkTi
         2zCqNO+cOGaIv1jnqXtrnh7wYWTNGFqAX/bqUszH8Q8fK5RutneBh/DoyFiBPg9OWSHF
         DLOQ3Blsm0CcFYxR+Yj5hLVKA9uOW23I0UKsJd608ZfUI16Tmk27ay+Y2DY/kDlJxwSm
         ns7Q==
X-Forwarded-Encrypted: i=1; AJvYcCX53bPflpwcgth6HmNqPlRjth8pnot1/oJDbF7o25xFTTsoiAee6uc2CtRPh2Co+9ycXXUZX6a+9vdHRPkJATQg@lists.infradead.org
X-Gm-Message-State: AOJu0YwfRINfF2jmFL1NGqvxv71QxegDtxABz6/ng09kcTfhWXEhZfZd
	iiFyfYZGKHcYJ7gn5bER2WeqX8cKwDJo85PVAf25l5P9I02qsZ4yt2U7/l1O3LgmOstgvhVITVN
	qc8vcVuy7PBJq9O0mM8daFRR5qznejez4VJJ112MnBNApFQV7M3XfVVKLzZOnwD7JYT2pYdN+WF
	znew==
X-Gm-Gg: ASbGnctEHxMOS0vTwQFP1BaGkPHGr2thhEQCEs7FcvPzaheDjbOJoT6zlwKcGkeLHDj
	qZdsVH1BFvVLjQF2QM1D1AVJpRsBxrJyxffwS7qTbiyEXKuLkR/b7tmJxQdV60/0YJFGc7ZME5b
	gukrkEhZISO5rPsyUl1UXTFQLUKlVI6cStEqZJOE0yyHJuhPmmnYWcNOgQkSAqQOWFS4dRL/nEf
	ghGhicAlLzoRn/XlO9COLO2R09QXIAh91D7tCaoD4puEq5a05N9/jAegeyYTyCmW6saPm/mBMfJ
	DSUxlUpFUNktTN+V6d2KOd9C7fnS76mJBIf1Eo7fOsa0m2s2ilGRL2z4p4PgPHmYKACVN4pPCo/
	189RMCN/5bh0/ASKs0w==
X-Received: by 2002:a05:6a20:914f:b0:243:755:58b1 with SMTP id adf61e73a8af0-24340d4476dmr30221832637.50.1756290101213;
        Wed, 27 Aug 2025 03:21:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE20Ixn8/Rp7/u1DnA2k88RHtjNUK6RsfUauJ/MGItqwZiSd6g1xgmpqv58urRl32gT6x4ReA==
X-Received: by 2002:a05:6a20:914f:b0:243:755:58b1 with SMTP id adf61e73a8af0-24340d4476dmr30221793637.50.1756290100603;
        Wed, 27 Aug 2025 03:21:40 -0700 (PDT)
Received: from [10.133.33.155] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276fce1f30sm1667244a91.23.2025.08.27.03.21.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Aug 2025 03:21:40 -0700 (PDT)
Message-ID: <bfed7735-0f82-40d2-9a85-b99ec39fcf4d@oss.qualcomm.com>
Date: Wed, 27 Aug 2025 18:21:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] coresight: tpda: add sysfs node to flush specific
 port
To: James Clark <james.clark@linaro.org>, Jie Gan <jie.gan@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
References: <20250827042042.6786-1-jie.gan@oss.qualcomm.com>
 <20250827042042.6786-4-jie.gan@oss.qualcomm.com>
 <b1f79a26-97e1-40f4-b076-51d5c2abe736@linaro.org>
 <78d2ab99-f304-4fab-bc7b-859c8aa781d6@oss.qualcomm.com>
 <bc337e7c-42e7-4e2d-8b2d-c39174d1ddd5@linaro.org>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <bc337e7c-42e7-4e2d-8b2d-c39174d1ddd5@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzNCBTYWx0ZWRfXx+JTQGRErTTq
 2F5kt/2PS331S2WhMreva3lYkGmDG6WTLjriz95aBYcfzArUwCQJPTR26PysNm+M0eKaqY83Owg
 x5IaO2Vdk5nc2BDKpjZAf/x/IEJKGXdRMihbZbL6YcTwjEXBZYciA3UI2gs0tfPQZvKkEWBwRia
 BHL7y4XUamk/1Ad5rxE7xKh2gl2NU8jgrKObFh9GJ8puVYCRNi0CARfpp/8qCwNG29DeRxnFOo7
 ZJg/Yg8skptcHwqBdYLIWaxy6Ax/7X3r9CN0fppxiBY//RQq+M98S+GBerck1LLFCCiDaYrZbkS
 FwUULRQ4Y0lD/cO5I4U5EUHfVwSGUucBB4fOMaA6XH0bsKoZMd0jO2i0bRt142lfB3zIUB0JzaD
 7ZEY9EcD
X-Proofpoint-GUID: gSQzNwen6kogH9RCxEhr9B0nKXoTc_Ul
X-Authority-Analysis: v=2.4 cv=K+AiHzWI c=1 sm=1 tr=0 ts=68aedc36 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=W2FtnCjKMyXqdGChcqkA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: gSQzNwen6kogH9RCxEhr9B0nKXoTc_Ul
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-27_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_032145_418322_C7A39186 
X-CRM114-Status: GOOD (  27.24  )
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



On 8/27/2025 6:16 PM, James Clark wrote:
> 
> 
> On 27/08/2025 10:48 am, Jie Gan wrote:
>>
>>
>> On 8/27/2025 5:17 PM, James Clark wrote:
>>>
>>>
>>> On 27/08/2025 5:20 am, Jie Gan wrote:
>>>> From: Tao Zhang <tao.zhang@oss.qualcomm.com>
>>>>
>>>> Setting bit i in the TPDA_FLUSH_CR register initiates a flush request
>>>> for port i, forcing the data to synchronize and be transmitted to the
>>>> sink device.
>>>>
>>>> Signed-off-by: Tao Zhang <tao.zhang@oss.qualcomm.com>
>>>> Co-developed-by: Jie Gan <jie.gan@oss.qualcomm.com>
>>>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>>>> ---
>>>>   .../testing/sysfs-bus-coresight-devices-tpda  |  7 ++++
>>>>   drivers/hwtracing/coresight/coresight-tpda.c  | 42 +++++++++++++++ 
>>>> ++++
>>>>   drivers/hwtracing/coresight/coresight-tpda.h  |  2 +
>>>>   3 files changed, 51 insertions(+)
>>>>
>>>> diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices- 
>>>> tpda b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
>>>> index fb651aebeb31..2cf2dcfc13c8 100644
>>>> --- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
>>>> +++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
>>>> @@ -41,3 +41,10 @@ Contact:    Jinlong Mao 
>>>> <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qu
>>>>   Description:
>>>>           (RW) Configure the CMB/MCMB channel mode for all enabled 
>>>> ports.
>>>>           Value 0 means raw channel mapping mode. Value 1 means 
>>>> channel pair marking mode.
>>>> +
>>>> +What:        /sys/bus/coresight/devices/<tpda-name>/port_flush_req
>>>> +Date:        August 2025
>>>> +KernelVersion:    6.17
>>>> +Contact:    Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang 
>>>> <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
>>>> +Description:
>>>> +        (RW) Configure the bit i to requests a flush operation of 
>>>> port i on the TPDA.
>>>> diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/ 
>>>> hwtracing/coresight/coresight-tpda.c
>>>> index 430f76c559f2..8b1fe128881d 100644
>>>> --- a/drivers/hwtracing/coresight/coresight-tpda.c
>>>> +++ b/drivers/hwtracing/coresight/coresight-tpda.c
>>>> @@ -487,6 +487,47 @@ static ssize_t cmbchan_mode_store(struct device 
>>>> *dev,
>>>>   }
>>>>   static DEVICE_ATTR_RW(cmbchan_mode);
>>>> +static ssize_t port_flush_req_show(struct device *dev,
>>>> +                   struct device_attribute *attr,
>>>> +                   char *buf)
>>>> +{
>>>> +    struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
>>>> +    unsigned long val;
>>>> +
>>>> +    if (!drvdata->csdev->refcnt)
>>>> +        return -EINVAL;
>>>> +
>>>> +    guard(spinlock)(&drvdata->spinlock);
>>>> +    CS_UNLOCK(drvdata->base);
>>>> +    val = readl_relaxed(drvdata->base + TPDA_FLUSH_CR);
>>>> +    CS_LOCK(drvdata->base);
>>>> +    return sysfs_emit(buf, "%lx\n", val);
>>>
>>> Still missing the 0x prefix
>>
>> Will re-check rest of the codes and add prefix. Sorry I missed it 
>> during the review process.
>>
>>>
>>>> +}
>>>> +
>>>> +static ssize_t port_flush_req_store(struct device *dev,
>>>> +                    struct device_attribute *attr,
>>>> +                    const char *buf,
>>>> +                    size_t size)
>>>> +{
>>>> +    struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
>>>> +    unsigned long val;
>>>> +
>>>> +    if (kstrtoul(buf, 0, &val))
>>>> +        return -EINVAL;
>>>> +
>>>> +    if (!drvdata->csdev->refcnt || !val)
>>>> +        return -EINVAL;
>>>> +
>>>> +    val |= FIELD_PREP(TPDA_MAX_INPORTS_MASK, val);
>>>
>>> Using FIELD_PREP() now that it's the full width of the register makes 
>>> less sense. Especially when there is no corresponding FIELD_FIT() 
>>> check,   which is fine because everything always fits. But if you 
>>> didn't know the mask was the full width you'd wonder if the check is 
>>> missing.
>>>
>>> I would just write val directly to TPDA_FLUSH_CR so it's simpler.
>>>
>>> It should also have been val = FIELD_PREP(...)
>>
>> Yeah, it should have been val = FIELD_PREP(...) here... sorry for the 
>> mistake here..
>>
>> I was thinking the unsigned long here could be 64 or 32 bits and we 
>> only need the value of the lower 32 bits. So that's why I am using val 
>> = FIELD_PREP(...) here. We shouldn't write a value greater than 
>> UINT32_MAX to the register.
>>
>> Thanks,
>> Jie
>>
> 
> writel_relaxed() is always 32 bits though so it is a bit confusing if 
> you truncate the user value without an error. Also a reason to use u32 
> instead of unsigned long types.
> 
> Are you trying to support arm and arm64 with tpda? Or just arm64? For it 
> to be consistent you can use kstrtou32(), or use kstrtoull() and then 
> FIELD_FIT() to error on truncation. kstrtou32() is probably the cleanest.

Only arm64. Will try kstrtou32() with u32.

Thanks,
Jie

> 
>>>
>>>> +    guard(spinlock)(&drvdata->spinlock);
>>>> +    CS_UNLOCK(drvdata->base);
>>>> +    writel_relaxed(val, drvdata->base + TPDA_FLUSH_CR);
>>>> +    CS_LOCK(drvdata->base);
>>>> +
>>>> +    return size;
>>>> +}
>>>> +static DEVICE_ATTR_RW(port_flush_req);
>>>> +
>>>>   static struct attribute *tpda_attrs[] = {
>>>>       &dev_attr_trig_async_enable.attr,
>>>>       &dev_attr_trig_flag_ts_enable.attr,
>>>> @@ -494,6 +535,7 @@ static struct attribute *tpda_attrs[] = {
>>>>       &dev_attr_freq_ts_enable.attr,
>>>>       &dev_attr_global_flush_req.attr,
>>>>       &dev_attr_cmbchan_mode.attr,
>>>> +    &dev_attr_port_flush_req.attr,
>>>>       NULL,
>>>>   };
>>>> diff --git a/drivers/hwtracing/coresight/coresight-tpda.h b/drivers/ 
>>>> hwtracing/coresight/coresight-tpda.h
>>>> index 8e1b66115ad1..56d3ad293e46 100644
>>>> --- a/drivers/hwtracing/coresight/coresight-tpda.h
>>>> +++ b/drivers/hwtracing/coresight/coresight-tpda.h
>>>> @@ -10,6 +10,7 @@
>>>>   #define TPDA_Pn_CR(n)        (0x004 + (n * 4))
>>>>   #define TPDA_FPID_CR        (0x084)
>>>>   #define TPDA_SYNCR        (0x08C)
>>>> +#define TPDA_FLUSH_CR        (0x090)
>>>>   /* Cross trigger FREQ packets timestamp bit */
>>>>   #define TPDA_CR_FREQTS        BIT(2)
>>>> @@ -35,6 +36,7 @@
>>>>   #define TPDA_SYNCR_MAX_COUNTER_VAL    (0xFFF)
>>>>   #define TPDA_MAX_INPORTS    32
>>>> +#define TPDA_MAX_INPORTS_MASK    GENMASK(31, 0)
>>>>   /* Bits 6 ~ 12 is for atid value */
>>>>   #define TPDA_CR_ATID        GENMASK(12, 6)
>>>
>>>
>>
> 
> 


