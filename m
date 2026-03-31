Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4A8CFF60F9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 09:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+LT4R8ehoNuZhHtNgCHaEc8Dpry90A7nvziF3tMLDZM=; b=mALOof4WV00n8CHoz7tfqv+hkc
	UKOnPkehC/lC0zrcrxEJ+vNc4mRo+W3DEjAozIvTIXGwSNL8z5Sw56XTwU+vdxTMNwh3+D9zqTVEf
	a++y1SaM7zRbUzzPg8GhTlbZ9uO33eS/cWAJQNQSTYJx6fXtwxEBIYF8Se94escAfIQXMncY4esCD
	yTioyDYSDbNtAvSjmEWQ3t3b31OMMLZrCo1ASc0cefE9GcBt2WUsrPgdY7DzoxctZuYRVK63p3kc5
	OVgeyscZUMhtOzuOBouz5yOBp+lNeqWFAEQy0S7n7ADdpfqdIvSY0XKjkupalEIuocMHPntFevUQt
	62DOpSrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7ViA-0000000CiOK-3zet;
	Tue, 31 Mar 2026 09:48:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Vi7-0000000CiNx-2QGP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 09:48:36 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V5qPTu1841221
	for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 09:48:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+LT4R8ehoNuZhHtNgCHaEc8Dpry90A7nvziF3tMLDZM=; b=Yy9RwJZ++LVQ3BAf
	ElXOVnlKF31eLoCa7hYw+F43agLKeFJoSqTtbzh8LWa6+/ytK3HeBg4ptnfMZlYZ
	AoO3bvDeGXZdfAUE0FOxGNNrIVbcs4W+7hg0Otd7thj8adNwB9h0E0GK/Hs7jEVC
	mjapKcqDmR0NNAPmhjc4w6mTHRB86RQoH4L+dGXX51xU2SEq1Afsu0dud6JaTISd
	9cewxM4Pmq7g4Qpf6yk2masFuYIENRgYypiEgB2J0IxqQRdkBz++yi/hloP6UF5Y
	a5juLNYNGMhgu3DgRKKRgb98LtQyfBXMqauLU2r6TixmDXElmnUFPUGgxdzwSVGd
	M+O0Rw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d80rsjf1b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 09:48:34 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35d98c6ab60so3192204a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 02:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774950513; x=1775555313; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+LT4R8ehoNuZhHtNgCHaEc8Dpry90A7nvziF3tMLDZM=;
        b=jRUR+Vo/RicPdcyhLle//gRY9KJAnz2FtuXBfZfuwOd3pCS+A9s/e9Wsfe9OwZj0wr
         XkmMXyRu83KM/84iIfx5HmIE76A0pVhywJQamia0Fg0JhhhO2do619NfkHfvsmNt0RYv
         akZfqZZBdwB4iQnNR2JWbbPsrm9ozKpMNAuONVHQ8mqrBhpPROLDWDRIj0x7XQT4/9qA
         t8MDbEbprLE4Op4KrW7cTHFyd1h5KOTFe2x0FT13qVew95KcDFukoRk3N0edgcI4rkSZ
         IttE0xja7iD55wGnAmHT7ybLOOaDT5iP3ZlO3Xdqiw6ejTVV4ZwCKPr8Lr5jCCp+TXye
         s6Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774950513; x=1775555313;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+LT4R8ehoNuZhHtNgCHaEc8Dpry90A7nvziF3tMLDZM=;
        b=Rimf82nBvtR/d0tjSfQdcg/gD5wyw55ebgh39Oh3K0hr2B2vmFhSG1XGUroVSyzjB1
         FOASnqdvDk+lsjGxnNG+n396X41o1yS33PpduRWppuzLzGEvvcHT/Ymeb1+hgbWgEzjv
         0DvhI2+sbNEwRS00BpD74RP1UfjWOjAIEVVbSu3piL9h+rFnUbdlkhm2nKfDv/1vlLNl
         t9LBEGzbCnrEa59kESLsMNVDRf6piFxzC0VrinSQQ7PGEXyWCey0P6GhJQCk2ZL73CKc
         CVNdWKSU7tJw6siXrX++94AVDdcAmo5m4A2wTPhaB/vsKM8tKnbwekI/cfXLEoUCm4v0
         3Wyw==
X-Forwarded-Encrypted: i=1; AJvYcCVgzh3KI7kcA5zIw7mdP3GLpBQhxtU56d70fzlIliivi1YbbXaV6O5pFRfhE4HxIUyjeVq2RdJ6kLmMy2YKbyAf@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4Vt8z150HVTIg/P8dSpLlxBnsvDqkKATV/O8TWPqp0BBbS2NH
	4kFE1HaazsHfxx3snpOHOHz/tlVln2Ok4FzgC5Nsd2NCQPjRfFAPgPUGMiily2zZBvXUOELX6j0
	62xijPs0+5+f87ixLKLUvP9LwliaSHmAhJc4GuWmiy2QuxNaBFr0LYd+IB13ksIYsYvXc5DCW+c
	7USg==
X-Gm-Gg: ATEYQzxuoqtAGAnIMViotefORpLWOdeptUq3VtsjVnXMqOW8b6NIVMSCtu2a8wyCn9U
	6OmCP/BUwtTQE/0y52sorS1TbPsUaACxK780mA9D3q7nHK6kRdHRKV143PWmmEO0bXk6+3Q3YMq
	kHHcXThfuzZgzfHyb4lDOaDfSLWm1wlBWg2W/uRPObm0GCkgFKZVxfK46FofDH4eyG2RM+eUtGx
	6f4EpWEy0PKuwwJmET1PA1SGqr5ylYfK77szPzrfXFAgh169x19xJIrzXkH9NT5IoXZqmBirS3p
	w8xmx2utc6ccAlBL2TpEjejmuyP3F7Jxr/OrpE1p2GYNKxVigOZ8NLB0OVQIjtyaoHrPCh0R24o
	2gLtHwKQdxGwCYdZaWqLhn7z/r7KfBR2SiXetgZA0i082fmlzvXusfXCnhrVrMqDe3DYWrGcHGZ
	ag/aQ7BUt5rso=
X-Received: by 2002:a17:90b:51c4:b0:35b:939c:e859 with SMTP id 98e67ed59e1d1-35db8f376c8mr2712619a91.12.1774950513245;
        Tue, 31 Mar 2026 02:48:33 -0700 (PDT)
X-Received: by 2002:a17:90b:51c4:b0:35b:939c:e859 with SMTP id 98e67ed59e1d1-35db8f376c8mr2712588a91.12.1774950512679;
        Tue, 31 Mar 2026 02:48:32 -0700 (PDT)
Received: from [10.133.33.252] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dbb8c6f70sm657261a91.6.2026.03.31.02.48.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 02:48:32 -0700 (PDT)
Message-ID: <6c8dec81-10f3-4ef9-a66e-3a86cfb058ba@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 17:48:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] coresight: tpdm: add traceid_show for checking traceid
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        James Clark <james.clark@linaro.org>
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
 <04214197-f521-47d6-88a1-94be1a8b1981@arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <04214197-f521-47d6-88a1-94be1a8b1981@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: hbEkreIdxdqfqza3Vz4z5pSGx3GB_hFM
X-Authority-Analysis: v=2.4 cv=VInQXtPX c=1 sm=1 tr=0 ts=69cb9872 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=MRA6D28t3Z0tp2SgcUwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: hbEkreIdxdqfqza3Vz4z5pSGx3GB_hFM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA5MyBTYWx0ZWRfX+jSNMmE0Z1Fy
 EoeXwzTN2xvKFkKieyz5FBUg1qfmzEUyIgA2mqrSyApCuNlikdqmK1wHT1SWa4lmBwC2Jp6tCVo
 FZN+q8WwTQuGkqe9AjcIdnXpRIyQr6RpqpcS59ISgu65/7YMtIejLjJluj14QMmJVhCfi95RD1G
 E2FgGSS8CpTJO5wZ2YsF0M/+82hY0xCgmPBVfi5sGIsMFYJ/hgTREVfZQUa9ZRtfX6xpJuVJ3ns
 HM0xpaFyUi1RSwSkzoVU4jfiZ6yAOdDFSiO7m6FxXbq9vCXbv6XT/3BODYWI1T56ApgrIGciB8W
 3qtrhhx1OWx8cTlp3ipO541IGipXiSFipFgV88p7bAUeL/nUkiMJKHu2yhEsAO/Fccrx1S3a+t/
 gjES3ezElET/f8b2PUZfIN+b48wRqdROFRvzDm0mXI2Gae2QtLviLkTa6RoNM5fh10Kc4UqpLqn
 ytMY54XKgS7R9ayni/A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310093
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_024835_740772_C3052D2F 
X-CRM114-Status: GOOD (  36.81  )
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



On 3/31/2026 5:42 PM, Suzuki K Poulose wrote:
> On 31/03/2026 10:26, James Clark wrote:
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
> I think there is value in reading out the traceid that was used. Also,
> I assume TPDM is always connected to a TPDA port and the traceID
> wouldn't change, ever ?
> 

Yes.

> I am happy with the proposal
> 

James also agrees this proposal in other thread. I will submit a new 
patch to address it.

ABI document missed in this patch also, I will add it in the new patch.

Thanks,
Jie

> Suzuki
> 
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


