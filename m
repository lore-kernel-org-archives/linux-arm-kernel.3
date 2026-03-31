Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79BD01061B28
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 01:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G/nxVg5dwiarQ7E6ZCqFrPUgdhcHJzV8kUyf6IHp4GA=; b=A+Hkkan4E0qD0OUjr5Dw3F8WqI
	C9IqnV152AFIQ2Qw3WHQad6cCA4TAoI5XaF4E45y/sYINIRGrEao8PcU+m4GnoNsHpNcNb53J0K/z
	17afjGbrbbQUGflYBWT1rgtXrh+qLyfLqneBXW3sPXe6Ipq6gkvABcrTFsSdJuM1D0WvjyJZp8Wru
	/7gbWkBIvAtZDA13KbDJ3C/Tg49/FmvvOWxSiGJhhmaKthdFCxIoV13lWJGkikEs52bK4IAfoZ93u
	4UqHKS7oJWyARkS72b8kybl8ccPtulL5DR5W8uocruljWdyrwr7PRyvpFcK0wUnpPE69ZGZCLsxUF
	eTM6Lf2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Nvf-0000000C8K5-202H;
	Tue, 31 Mar 2026 01:30:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Nvc-0000000C8JS-0Gsw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 01:30:01 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UMAFpd2391425
	for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 01:29:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G/nxVg5dwiarQ7E6ZCqFrPUgdhcHJzV8kUyf6IHp4GA=; b=HitN4oEbl89wYZvc
	6k8ck8WGnMxr4+pLBq3n2dmNERo61xPXw23GdPBewbEuf+0rBL+B8UFp8wfcB05D
	/5tULnaW3D0BTVmKzGbcOAFwH4RFD7u5z+0JOJ1Q5oYqRUHlv1FaWkPZn1O9oPu7
	rAa7Pv4PeCyWmOX4j9QRRgUGjMrTwwF4HlE1M0roLbTFrTGtDZlk8QySNTZq5URy
	PHp2nN3OSvFZWN5zX6OR+35ZiyLfVoIftwt6Csqv+av2hpelNjB+kGClPC/t70k9
	BadsGNacqlTgI5BZRAgrX1Ceyr8DQZmMfWyui7R4TPCXkoQVfdi/gEE1Oh8y5VwB
	f6oeOg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7ue7j302-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 01:29:59 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35dacc40f92so1469798a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 18:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774920599; x=1775525399; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G/nxVg5dwiarQ7E6ZCqFrPUgdhcHJzV8kUyf6IHp4GA=;
        b=JNmAzeQZI/LoM3CdxUh493+UV8OuvFjb+Z88a/vcwj4HyXMLLTYjcV6UVlHAftKwGN
         KF8fu9KpUlNyTUN5V4cekFCwffS66QTvtOVgmMVZvVPwtQw+TlXzayXUu1WCN5nCE0+g
         KiPSMmMeVegycjqjV6TdHvOr7epC8pu+2zUuR6Ehsqi+Nxs+tPnB0kPiNiGiBzmHjeFo
         a7Op7jwf16MgeC2/9vfZbzvUb4U+gqJi8cIgeJXaMIDEXBDHFaQ7e0JND3q90EJOIIuW
         i8QUehbOsI3bvS6eaaZGIawwTSEdFRAvjFr39hQG+Fum4v2d7+U9V5emHfHpV35w4pzT
         O70w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774920599; x=1775525399;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G/nxVg5dwiarQ7E6ZCqFrPUgdhcHJzV8kUyf6IHp4GA=;
        b=Ji6ZKbV4BzSpfUhSS+XZANKM94J/q2zqcYHR3u4V8y73vWfIdSsAlHGZWKL5DKJzcc
         jlznowOVFBST5FFIVDVkJuvDt6fs3GCv6FFCeCVAEBYdEvC/RHCrG00OCD1c5yZGSGHp
         U8Yev9vpzLgt4PHIT8pgJOXrMPQun7MO02gnkBtmOkTZ7kFk45ZPz5lY0OkFFGa2cSaX
         Cc+gf2Z2SqbkSoEqfw8efoME6bnF9bVRYCFWbAtgH1Dd+/vN5Nhn4uCjuVX/SnuqeDO4
         A2W/Hf0UMknNMlTmBwuf8PmzBq+QV5/r0EN0kCvPMQXtLq0vZ7gmvrJW8JddSVMsLcvu
         nPIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsAqPlDozYCkWkilogxKSV2tl4dlZ/PTLJ4eOsxc6IgpZtGORjHUEsSnwtbEkV2EtC10a4hDIcCKbkrwMw7oRt@lists.infradead.org
X-Gm-Message-State: AOJu0YyG72OX6LNom+puJEb3b/LG+LaxCfxsqXGYIypDRZAdpfGkPUlj
	/G+iMLiyIaJnmXaBwoDVhRU9uDO0fVRvabwjCgeX8Rm6A5ka8K8NqDtLCjoz3Wr1c9JxCn07nwq
	SqPelXrX0wi/WY3zODSlm5Tz/mhsiYIZWNjpAGecFNj8aMbmVac6FYkRqPbz4lsgfzS9MKgUI0Z
	g7FQ==
X-Gm-Gg: ATEYQzyPLI2ldL40lLYpQIX+b3NWUubgCUDnRtf+5HHgb1y/6K/mOmnZ5nhk8tFjmH4
	ifS7tlxwt+spsxuY5LYXaeiM8XU1UF/3J7Y7M+tmMLa5n7e5EFebNQoJzo+coKPepzOdpdw0HdR
	otlfNH45t9ZTCUJwOPjrHqzheBoO5SD2o81uf8D+PgQp+IAP4U++NnECBAHl5iTsI2yAI4JnqUA
	v3LE3BjLsRkmGbJi5VcETPAU/MzADNYQSHPyBz5z/9WD8o9UG3+KI12DFPrOaIZU2Xw+omn/wgF
	X+FtZuENwGtw2HjH4euqaiWuLhmqS6S9lpCcMdJ+H1KAhHy3VWapiPKZoqkSVgvO+6x01fPI+8H
	BBlM1RtuMXcOic9OA2+gHlILEZWIUQSO3lFvpS9S9HDA/2YRpzUzvD7swhDBvHsRZiropZndUg7
	UWHVOTGdrjl+Q=
X-Received: by 2002:a17:90a:d403:b0:35d:a3b4:2f0d with SMTP id 98e67ed59e1d1-35da3b43086mr5900767a91.6.1774920598627;
        Mon, 30 Mar 2026 18:29:58 -0700 (PDT)
X-Received: by 2002:a17:90a:d403:b0:35d:a3b4:2f0d with SMTP id 98e67ed59e1d1-35da3b43086mr5900742a91.6.1774920597946;
        Mon, 30 Mar 2026 18:29:57 -0700 (PDT)
Received: from [10.133.33.252] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35d9507d505sm8078482a91.10.2026.03.30.18.29.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 18:29:57 -0700 (PDT)
Message-ID: <ca1fe6ba-ec56-47a5-99ea-017dcc7a28ed@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 09:29:52 +0800
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
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <95610981-ad68-4a31-a776-27894b7bca59@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDAxMSBTYWx0ZWRfX0XaSUBn1an1t
 s8LcpY9BJrbmleeJz7fLKtsDn6udYm2DbNidpn0yESQtAUlgxd2t4oJKjHVIlQL4NK6d1zrNOnh
 JaAEB5+PMyTq7tOhXpoCUkkiwOCxoyLBaodY/qNW2kn+ad4fgY4PpnjokZA6WMkWI6kz3Fu5AMX
 C7diBa4HMVkh9U/bBOekutv5TlgMixwef3RzVy6Wq4pB9OAHtv9tx7iYBRqCfbXRtPGszpfi7Gx
 VjsUxZg0NrPhaiFEM+DpmzQS5fVQDdGtjbMZN1Vl6vG0inZSsLy9P+nYWlInCGS6jhuIqr2U4O+
 ROeQPO1ETKAKGsLwA6aDzJB9ATLQCIs9HFHPr1d/4CJrA8ktDeCwmcFnIbu0NqRMYXary//SWt5
 FMlRW0SWx0dtVG6+xHIOMChDvcIN7DmzDPSJ/8nlFWg/0/tR+CkOqIC8j4/SusYzYM2PgythvSr
 kT9itL/yWat+siYXlEw==
X-Proofpoint-GUID: W6V9rZEzBGduUteRw1fZAASAY2hbGU1W
X-Authority-Analysis: v=2.4 cv=G7sR0tk5 c=1 sm=1 tr=0 ts=69cb2397 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pfTpB1fsnbrxJmBpuLMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: W6V9rZEzBGduUteRw1fZAASAY2hbGU1W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-30_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310011
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_183000_128244_F62AA106 
X-CRM114-Status: GOOD (  32.40  )
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


Hi James,

On 3/30/2026 10:55 PM, James Clark wrote:
> 
> 
> On 25/03/2026 3:10 am, Jie Gan wrote:
>> Save the trace ID in drvdata during TPDM enablement and expose it
>> to userspace to support trace data parsing.
>>
>> The TPDM device’s trace ID corresponds to the trace ID allocated
>> to the connected TPDA device.
>>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>> Changes in v3:
>> 1. Only allow user to read the traceid while the TPDM device is enabled.
>> - Link to v2: https://lore.kernel.org/r/20260316-add-traceid-show-for- 
>> tpdm-v2-1-1dec2a67e4ed@oss.qualcomm.com
>>
>> Changes in V2:
>> 1. Use sysfs_emit instead of sprintf.
>> Link to V1 - https://lore.kernel.org/all/20260306-add-traceid-show- 
>> for-tpdm-v1-1-0658a8edb972@oss.qualcomm.com/
>> ---
>>   drivers/hwtracing/coresight/coresight-tpdm.c | 34 ++++++++++++++++++ 
>> +++++++++-
>>   drivers/hwtracing/coresight/coresight-tpdm.h |  2 ++
>>   2 files changed, 35 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-tpdm.c b/drivers/ 
>> hwtracing/coresight/coresight-tpdm.c
>> index da77bdaad0a4..c8339b973bfc 100644
>> --- a/drivers/hwtracing/coresight/coresight-tpdm.c
>> +++ b/drivers/hwtracing/coresight/coresight-tpdm.c
>> @@ -481,7 +481,7 @@ static void __tpdm_enable(struct tpdm_drvdata 
>> *drvdata)
>>   static int tpdm_enable(struct coresight_device *csdev, struct 
>> perf_event *event,
>>                  enum cs_mode mode,
>> -               __maybe_unused struct coresight_path *path)
>> +               struct coresight_path *path)
>>   {
>>       struct tpdm_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
>> @@ -497,6 +497,7 @@ static int tpdm_enable(struct coresight_device 
>> *csdev, struct perf_event *event,
>>       }
>>       __tpdm_enable(drvdata);
>> +    drvdata->traceid = path->trace_id;
>>       drvdata->enable = true;
>>       spin_unlock(&drvdata->spinlock);
>> @@ -693,6 +694,29 @@ static struct attribute_group tpdm_attr_grp = {
>>       .attrs = tpdm_attrs,
>>   };
>> +static ssize_t traceid_show(struct device *dev,
>> +                struct device_attribute *attr, char *buf)
>> +{
>> +    unsigned long val;
>> +    struct tpdm_drvdata *drvdata = dev_get_drvdata(dev->parent);
>> +
>> +    if (coresight_get_mode(drvdata->csdev) == CS_MODE_DISABLED)
>> +        return -EINVAL;
>> +
>> +    val = drvdata->traceid;
> 
> You probably need to take the coresight_mutex here otherwise you could 
> still return an invalid or stale value despite checking the mode.
> 

Acked. I have missed this potential race condition.

> There might also be some value in it returning the last used trace ID 
> even if the mode isn't enabled anymore. Because you can still read out 
> of the sink after disabling, so it makes more sense for a script to read 
> it at that point rather than when it's enabled. Also, you probably don't 
> want to be doing other things in your script in the point between 
> enabling and disabling.

That's making sense. I shouldnt add such restriction for the read process.

Scenarios for reading:
1. device is enabled -> trace ID is valid
2. device is enabled then disabled -> trace ID is valid for the last 
trace event
3. device is never enabled -> invalid trace ID (value 0)

we only need to check the validation of the trace ID.

mutex_lock(&coresight_mutex);
val = drvdata->traceid;
mutex_unlock(&coresight_mutex);

if (!val)
     return -EINVAL;

return sysfs_emit(buf, "%#lx\n", val);

Thanks,
Jie

> 
>> +    return sysfs_emit(buf, "%#lx\n", val);
>> +}
>> +static DEVICE_ATTR_RO(traceid);
>> +
>> +static struct attribute *traceid_attrs[] = {
>> +    &dev_attr_traceid.attr,
>> +    NULL,
>> +};
>> +
>> +static struct attribute_group traceid_attr_grp = {
>> +    .attrs = traceid_attrs,
>> +};
>> +
>>   static ssize_t dsb_mode_show(struct device *dev,
>>                    struct device_attribute *attr,
>>                    char *buf)
>> @@ -1367,6 +1391,12 @@ static const struct attribute_group 
>> *tpdm_attr_grps[] = {
>>       &tpdm_cmb_patt_grp,
>>       &tpdm_cmb_msr_grp,
>>       &tpdm_mcmb_attr_grp,
>> +    &traceid_attr_grp,
>> +    NULL,
>> +};
>> +
>> +static const struct attribute_group *static_tpdm_attr_grps[] = {
>> +    &traceid_attr_grp,
>>       NULL,
>>   };
>> @@ -1425,6 +1455,8 @@ static int tpdm_probe(struct device *dev, struct 
>> resource *res)
>>       desc.access = CSDEV_ACCESS_IOMEM(base);
>>       if (res)
>>           desc.groups = tpdm_attr_grps;
>> +    else
>> +        desc.groups = static_tpdm_attr_grps;
>>       drvdata->csdev = coresight_register(&desc);
>>       if (IS_ERR(drvdata->csdev))
>>           return PTR_ERR(drvdata->csdev);
>> diff --git a/drivers/hwtracing/coresight/coresight-tpdm.h b/drivers/ 
>> hwtracing/coresight/coresight-tpdm.h
>> index 2867f3ab8186..11da64e1ade8 100644
>> --- a/drivers/hwtracing/coresight/coresight-tpdm.h
>> +++ b/drivers/hwtracing/coresight/coresight-tpdm.h
>> @@ -300,6 +300,7 @@ struct cmb_dataset {
>>    * @cmb         Specifics associated to TPDM CMB.
>>    * @dsb_msr_num Number of MSR supported by DSB TPDM
>>    * @cmb_msr_num Number of MSR supported by CMB TPDM
>> + * @traceid    Trace ID of the path.
>>    */
>>   struct tpdm_drvdata {
>> @@ -313,6 +314,7 @@ struct tpdm_drvdata {
>>       struct cmb_dataset    *cmb;
>>       u32            dsb_msr_num;
>>       u32            cmb_msr_num;
>> +    u8            traceid;
>>   };
>>   /* Enumerate members of various datasets */
>>
>> ---
>> base-commit: b84a0ebe421ca56995ff78b66307667b62b3a900
>> change-id: 20260316-add-traceid-show-for-tpdm-88d040651f00
>>
>> Best regards,
> 


