Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A313FF60F7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 09:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K9EPNg21CLQZn8+DPWUYQncXPT6syGghKRtET7iGnoc=; b=TnGfCi1Y/qAWUK7SoO2CGZfK6r
	+Sq3NHy2E37F54Zu7c3RyO7/U4r4X7Qss//PHypEYxm9UfG3914JUAN80otSBn+P+1TdZAgfWp0/0
	jxiTGrgZPvelmEozgae2FeLjBuZw9f8pihU632TT8UYqkoMOcUY0WUtNDtSAta3JgG2aO3qcOA33g
	gBhDvvC8gu0YOFNR4JBQYX0UGghTzBONojBAlVQpRSJ3V+KEkDh27wXXkX8HHi5xJ5ps4OG09jm4/
	+raRLTDM1eSSxd9t+8/U8l8g0GFFhpGDn57xBzJSFINDHBZY0lB0UEHh37TH3PZzHnKWPrj6z75nF
	q8GHiZTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7VTu-0000000ChJ1-0YBk;
	Tue, 31 Mar 2026 09:33:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7VTs-0000000ChIY-0IQl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 09:33:53 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V6344M1090666
	for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 09:33:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K9EPNg21CLQZn8+DPWUYQncXPT6syGghKRtET7iGnoc=; b=iPJN0bsG0/lycYNi
	KSpwBOUlOUsV4Nmq+qlTOMJ1T+Sxguj5yHBVJ28a9oMXwzPx6SrDmLqn+pskmQGA
	LYYDlHzQIsZNUOfx75HHCf5iQ3o//vWR08fq4c3YTV0csrsV1meSZsf7Lwo7fScr
	wgKcVeOoUxc5WNyqcgZmHxvsdlMpM9BmJClPdt0DPv51E4B7PHVmpf1CJEExvN3Z
	qYBQwQPv3sa0CWhSRonqcZJ3xQ6CRQET3A2aVmGsfq85oA0RVY1rlJmLXvr2o7EC
	MZ4JCqJzN6pRLy4UZoliCYxEBjj+j1LSOMZdqyB4ZtbTGMddwLNqq0mxbcPVWOcV
	/3mQuw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7trd41t9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 09:33:51 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3594620fe97so18475274a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 02:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774949631; x=1775554431; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K9EPNg21CLQZn8+DPWUYQncXPT6syGghKRtET7iGnoc=;
        b=ZWP/m6d64sK8FZi52XOaUb/lho1/m3UcU2l0N/brCuj3YNXJwmQDgyjsyldOP839xc
         S13FM88v+UqUTJiObVOggK4QwOccrvftP0zHqWcafNXQovQZvfelK54FM0BBrpmMN3s6
         qwNd3nFKAfNGwgDmlC+jXTyUCSdJ8OgdX7/c5v9GUTmIinGB0OWz+xAJ+cjA2VpgTdJp
         eVTFDYiw3jsSiz/Iq987UNbkwmTV04CMOT3hkZPUpSLRLWZfeUDASaURatim4AaCnRJ/
         kqmcKyyKx0ptOeFDAvRgRhidSELoKqsXH51HiAMXi9Tk8Fgt5u8T0HHoKKlcJxbSffmR
         0Bew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774949631; x=1775554431;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K9EPNg21CLQZn8+DPWUYQncXPT6syGghKRtET7iGnoc=;
        b=kkukUPc05kSLF2iBebzZ2NjD6qWKpLlgFm1sfb4p+1Cfu2+V76yvYcaw9xAdCdNKvP
         o0Mv9vH7RypAE6AoSIRmlDCgDE3yI4hYKi9DO5NkgeuCh/iHnqW/qoHjiCBOKyiWermw
         dJ/MyRPxRben4YZMwCvhkMslSv+uYOgCYd2ZcwBd0dmZTmpOVFY3yq4b+f1htylKxr0P
         UNYdbquYsWs7fT4EI0w05fq/qSjZM3UyQNwICL0NQT5HX4/C1Y+YBeWC9wyDwccnx9xq
         roNfIlkLte2xdLhDTAWeWNtNJdiwVOVB+CnCoKBtT9qjEkKtsY4lrWxkgRRGfHaSNfqm
         poCA==
X-Forwarded-Encrypted: i=1; AJvYcCU6REUSC6qstOmjSxf1d8q24mtwNootIg2XPIOXQqimb+04lTKrF6SNGhG6AsEHoWOcdhKliUr8xmYmehHPhf2M@lists.infradead.org
X-Gm-Message-State: AOJu0YwOarH7rZ20pSr3MhCDiYPXpG+fqLVu1IYSxTJmhe67ip6zxVzZ
	aV91HbwujgSPDPob/850IkDMecniR19k7F1cJKtZKLfyIt3Uii2Nled59C3dvu2wjVlOgAABqYf
	Q7sFi+pjd7w0iAPm+rC5TPVyYwmttEIZX7ML35g7S3m/kmZG6VdbB0h3YH7sqrr8ZHHPxdQmKOl
	V3GA==
X-Gm-Gg: ATEYQzz0n6pnmHvkCMs3zV/YjyvgNTz77+QoqLFKTvyLEuM0Iwk9nnrC5hbatat8rSe
	5IYLUGSub1rIJC8/Hx23jO57nLqh3feX9Uk1EIyfGBtfckDqih/4kLqUWgyYb3QBOdVkj8xTcty
	gL3v//YSmjVY09FGVzRbHPhRi/T//iErm1b5/CQ9CrgNqJoWrr3I362eHGzPTFX3dA3O1HWsLLI
	lijH5Xa9GFVmpRNvEKBUne4L8I4TuLHKH51LS1R+uKFS1sjeRoW77hH2T3sq5lXKioao+uLxG2Y
	TovKY6NcurQgp6TzhplnxPoWeQTlhMT55MfcohokCkPktme9uUCYvx2+s+3Bx0ZkgCNaqUqma3R
	a5pA109HySxeP22MpMm/rC/1wTsRqUpv+y3rk7X3VR8R3uWe3cBRkfT5D9iejL2u/H3YsyoDSjB
	WBtbQlpL+F3P4=
X-Received: by 2002:a05:6300:6c18:b0:39b:e789:7d0c with SMTP id adf61e73a8af0-39c87b6f82fmr11090322637.48.1774949630827;
        Tue, 31 Mar 2026 02:33:50 -0700 (PDT)
X-Received: by 2002:a05:6300:6c18:b0:39b:e789:7d0c with SMTP id adf61e73a8af0-39c87b6f82fmr11090298637.48.1774949630327;
        Tue, 31 Mar 2026 02:33:50 -0700 (PDT)
Received: from [10.133.33.252] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76ad00a246sm1563954a12.16.2026.03.31.02.33.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 02:33:49 -0700 (PDT)
Message-ID: <f038fd7c-d563-4583-ad6f-666e2816fdb7@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 17:33:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] coresight: tpdm: add traceid_show for checking traceid
To: James Clark <james.clark@linaro.org>,
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
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <7abe93fa-3748-4077-b75a-d28296862654@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: fG_GleLw7ENqJSeaYd1MIsal_b_XdnJM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA5MSBTYWx0ZWRfX1Xe/WVuwA7Oz
 JamiWbo5uTY1Q++pEzHLMaI/cPxeOuXdgP+7K6oFwSetGFBMbcZoxAz05kGcjvnH7kNnPDba5bl
 uggAUGzWZX0gfw+HVQON13XP1daMQtSB8TQVhSi1JPov0e1+0KFVmqpECRTa7Dr1RwfyAFzdZz2
 Q5Uw+G7aUDa5omzNq81l2mZ1I4+Zh6do2liXlNHfrOtFnPPego+D9fJflaE27T7TI9kWrMgLfWO
 /mACbqcCG37Y1EZHwdRA268QPnT4RS2uk4zAlWpPav4AZsGc+6ni6PWxqtFfy5K50v1xjSG9bug
 w4IJ1l/lUOmRrlIOn4Z0NsTg+b6UmhveaQtTnlPsf14RE76BAhBQs3Q1UDtUoZXvwV9dZukV2oF
 d9K3WMV0xMdqi1RgHVI2QbVpVBXB2tMbVZDEjkiUtDvgIlvJXGfZYMRFjlJ1N5bglxX/Rj5vs6X
 tRVD0BKMXOkeP3rq1mg==
X-Proofpoint-ORIG-GUID: fG_GleLw7ENqJSeaYd1MIsal_b_XdnJM
X-Authority-Analysis: v=2.4 cv=H8/WAuYi c=1 sm=1 tr=0 ts=69cb94ff cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=vnwuCBEG_e02qIenT_YA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310091
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_023352_117767_221F710F 
X-CRM114-Status: GOOD (  32.61  )
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



On 3/31/2026 5:26 PM, James Clark wrote:
> 
> 
> On 31/03/2026 4:18 am, Jie Gan wrote:
>> Hi James,
>>
>> On 3/31/2026 9:29 AM, Jie Gan wrote:
>>>
>>> Hi James,
>>>
>>> On 3/30/2026 10:55 PM, James Clark wrote:
>>>>
>>>>
>>>> On 25/03/2026 3:10 am, Jie Gan wrote:
>>>>> Save the trace ID in drvdata during TPDM enablement and expose it
>>>>> to userspace to support trace data parsing.
>>>>>
>>>>> The TPDM device’s trace ID corresponds to the trace ID allocated
>>>>> to the connected TPDA device.
>>>>>
>>>>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>>>>> ---
>>>>> Changes in v3:
>>>>> 1. Only allow user to read the traceid while the TPDM device is 
>>>>> enabled.
>>>>> - Link to v2: https://lore.kernel.org/r/20260316-add-traceid-show- 
>>>>> for- tpdm-v2-1-1dec2a67e4ed@oss.qualcomm.com
>>>>>
>>>>> Changes in V2:
>>>>> 1. Use sysfs_emit instead of sprintf.
>>>>> Link to V1 - https://lore.kernel.org/all/20260306-add-traceid-show- 
>>>>> for-tpdm-v1-1-0658a8edb972@oss.qualcomm.com/
>>>>> ---
>>>>>   drivers/hwtracing/coresight/coresight-tpdm.c | 34 +++++++++++++++ 
>>>>> + + + +++++++++-
>>>>>   drivers/hwtracing/coresight/coresight-tpdm.h |  2 ++
>>>>>   2 files changed, 35 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/hwtracing/coresight/coresight-tpdm.c b/ 
>>>>> drivers/ hwtracing/coresight/coresight-tpdm.c
>>>>> index da77bdaad0a4..c8339b973bfc 100644
>>>>> --- a/drivers/hwtracing/coresight/coresight-tpdm.c
>>>>> +++ b/drivers/hwtracing/coresight/coresight-tpdm.c
>>>>> @@ -481,7 +481,7 @@ static void __tpdm_enable(struct tpdm_drvdata 
>>>>> *drvdata)
>>>>>   static int tpdm_enable(struct coresight_device *csdev, struct 
>>>>> perf_event *event,
>>>>>                  enum cs_mode mode,
>>>>> -               __maybe_unused struct coresight_path *path)
>>>>> +               struct coresight_path *path)
>>>>>   {
>>>>>       struct tpdm_drvdata *drvdata = dev_get_drvdata(csdev- 
>>>>> >dev.parent);
>>>>> @@ -497,6 +497,7 @@ static int tpdm_enable(struct coresight_device 
>>>>> *csdev, struct perf_event *event,
>>>>>       }
>>>>>       __tpdm_enable(drvdata);
>>>>> +    drvdata->traceid = path->trace_id;
>>>>>       drvdata->enable = true;
>>>>>       spin_unlock(&drvdata->spinlock);
>>>>> @@ -693,6 +694,29 @@ static struct attribute_group tpdm_attr_grp = {
>>>>>       .attrs = tpdm_attrs,
>>>>>   };
>>>>> +static ssize_t traceid_show(struct device *dev,
>>>>> +                struct device_attribute *attr, char *buf)
>>>>> +{
>>>>> +    unsigned long val;
>>>>> +    struct tpdm_drvdata *drvdata = dev_get_drvdata(dev->parent);
>>>>> +
>>>>> +    if (coresight_get_mode(drvdata->csdev) == CS_MODE_DISABLED)
>>>>> +        return -EINVAL;
>>>>> +
>>>>> +    val = drvdata->traceid;
>>>>
>>>> You probably need to take the coresight_mutex here otherwise you 
>>>> could still return an invalid or stale value despite checking the mode.
>>>>
>>>
>>> Acked. I have missed this potential race condition.
>>>
>>>> There might also be some value in it returning the last used trace 
>>>> ID even if the mode isn't enabled anymore. Because you can still 
>>>> read out of the sink after disabling, so it makes more sense for a 
>>>> script to read it at that point rather than when it's enabled. Also, 
>>>> you probably don't want to be doing other things in your script in 
>>>> the point between enabling and disabling.
>>>
>>> That's making sense. I shouldnt add such restriction for the read 
>>> process.
>>>
>>
>> I missed one point in last message.
>>
>> Is that acceptable to export the coresight_mutex from the core module?
>> Currently, the coresight_mutex is used within the module only.
>>
>> Thanks,
>> Jie
>>
> 
> If the plan is to only check for non-zero trace ID and not check the 
> mode any more then you don't need to lock. Maybe lets see what Suzuki 
> thinks about returning the last trace ID though as it was his idea to 
> add -EINVAL.
> 

Sure. The trace ID is allocated during TPDA device probe and remains 
unchanged for the entire lifetime of the device.

Thanks,
Jie


>>> Scenarios for reading:
>>> 1. device is enabled -> trace ID is valid
>>> 2. device is enabled then disabled -> trace ID is valid for the last 
>>> trace event
>>> 3. device is never enabled -> invalid trace ID (value 0)
>>>
>>> we only need to check the validation of the trace ID.
>>>
>>> mutex_lock(&coresight_mutex);
>>> val = drvdata->traceid;
>>> mutex_unlock(&coresight_mutex);
>>>
>>> if (!val)
>>>      return -EINVAL;
>>>
>>> return sysfs_emit(buf, "%#lx\n", val);
>>>
>>> Thanks,
>>> Jie
>>>
>>>>
>>>>> +    return sysfs_emit(buf, "%#lx\n", val);
>>>>> +}
>>>>> +static DEVICE_ATTR_RO(traceid);
>>>>> +
>>>>> +static struct attribute *traceid_attrs[] = {
>>>>> +    &dev_attr_traceid.attr,
>>>>> +    NULL,
>>>>> +};
>>>>> +
>>>>> +static struct attribute_group traceid_attr_grp = {
>>>>> +    .attrs = traceid_attrs,
>>>>> +};
>>>>> +
>>>>>   static ssize_t dsb_mode_show(struct device *dev,
>>>>>                    struct device_attribute *attr,
>>>>>                    char *buf)
>>>>> @@ -1367,6 +1391,12 @@ static const struct attribute_group 
>>>>> *tpdm_attr_grps[] = {
>>>>>       &tpdm_cmb_patt_grp,
>>>>>       &tpdm_cmb_msr_grp,
>>>>>       &tpdm_mcmb_attr_grp,
>>>>> +    &traceid_attr_grp,
>>>>> +    NULL,
>>>>> +};
>>>>> +
>>>>> +static const struct attribute_group *static_tpdm_attr_grps[] = {
>>>>> +    &traceid_attr_grp,
>>>>>       NULL,
>>>>>   };
>>>>> @@ -1425,6 +1455,8 @@ static int tpdm_probe(struct device *dev, 
>>>>> struct resource *res)
>>>>>       desc.access = CSDEV_ACCESS_IOMEM(base);
>>>>>       if (res)
>>>>>           desc.groups = tpdm_attr_grps;
>>>>> +    else
>>>>> +        desc.groups = static_tpdm_attr_grps;
>>>>>       drvdata->csdev = coresight_register(&desc);
>>>>>       if (IS_ERR(drvdata->csdev))
>>>>>           return PTR_ERR(drvdata->csdev);
>>>>> diff --git a/drivers/hwtracing/coresight/coresight-tpdm.h b/ 
>>>>> drivers/ hwtracing/coresight/coresight-tpdm.h
>>>>> index 2867f3ab8186..11da64e1ade8 100644
>>>>> --- a/drivers/hwtracing/coresight/coresight-tpdm.h
>>>>> +++ b/drivers/hwtracing/coresight/coresight-tpdm.h
>>>>> @@ -300,6 +300,7 @@ struct cmb_dataset {
>>>>>    * @cmb         Specifics associated to TPDM CMB.
>>>>>    * @dsb_msr_num Number of MSR supported by DSB TPDM
>>>>>    * @cmb_msr_num Number of MSR supported by CMB TPDM
>>>>> + * @traceid    Trace ID of the path.
>>>>>    */
>>>>>   struct tpdm_drvdata {
>>>>> @@ -313,6 +314,7 @@ struct tpdm_drvdata {
>>>>>       struct cmb_dataset    *cmb;
>>>>>       u32            dsb_msr_num;
>>>>>       u32            cmb_msr_num;
>>>>> +    u8            traceid;
>>>>>   };
>>>>>   /* Enumerate members of various datasets */
>>>>>
>>>>> ---
>>>>> base-commit: b84a0ebe421ca56995ff78b66307667b62b3a900
>>>>> change-id: 20260316-add-traceid-show-for-tpdm-88d040651f00
>>>>>
>>>>> Best regards,
>>>>
>>>
>>
> 


