Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D09BD6CFAC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 01:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+uuLZHwmvu91uXKQ5s1MOyzkT50vhUhhXbA5LIukjvA=; b=x3CMFBTZp0+F/ZLX1cgPKSaMVC
	3jmMVeRl2rF9RSBCbi9z6U2Lnp8dT1AslrciXfw8+r9aH08MniyrvoLRIM1nHQ2Jld8qdOPsIM/0Q
	cSjb+tPFGK89wBqfxWm5fZoc6ZruG35rona0IgLTxnXuUI/L1ENvPUSdrjbTmDhtsB3P8G+Hp9jFf
	SnxeOqwiM5zR6vokX/S7mRy3gGi6rPY/uGM/b2xESGVOQq/yAcqSU/1/MgScUnbsaDZjFVhcHF/QX
	Jsi94bL7WTkHv4D/K2F2NP48efiilDmuTC2MJdSK+aO+nkuM9MYjHPJVJ5tJfR7yPhdk4tGKTt0IX
	TrcXyHTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj62X-00000007yCh-1K0L;
	Fri, 23 Jan 2026 01:32:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj62U-00000007yCC-1U55
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 01:32:43 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60N1CwoZ3648929
	for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Jan 2026 01:32:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+uuLZHwmvu91uXKQ5s1MOyzkT50vhUhhXbA5LIukjvA=; b=IhEKpvZRJx7ithfI
	cdKDNV28wmrVX2HOrkAN4YF+arGTCwgfvPGLEU83FOEl2iCrxBbyDYGjUC7dOffO
	sVCSXxM70BmOar7adko44s9AJ+/4ERjQ8vr00UhkeyoD/OI0Oc64J+dM1nxNyzHJ
	lDg3SUSDrw5yEB6fMRjQqiK8sJ4aDJ0w3ceSqDxBzdeP7VRXOm9Eu48rf59gcADY
	GVfC7Kd35oWxds5SmgZzLK1dv2qtcpr1bEteqqihk4bksMSGKDc4RB2iuKcLqFgE
	Nvnxd4tJypcVSPVJsLpX7QVMEzcrKESgG5khLUmBZofu6nhFZaV4Oe0eVXQo6BwH
	thCoVA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4buy4nr1k6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Jan 2026 01:32:35 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c634b862fcfso768595a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 17:32:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769131952; x=1769736752; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+uuLZHwmvu91uXKQ5s1MOyzkT50vhUhhXbA5LIukjvA=;
        b=b/R5/jo5V3SMRkUvQHkGL1T2OOYcMgNyioCgnGJ5PcqOHZHAuv+xvNTu5uRbmKQmso
         N7SJn8E6by78P72svQJk4Jb0E96TxTEHdtjkwiw0HM2RTflxIwfoZHAvTT5QLsUPsMYN
         AZf06nNAwczU7PYyy8e7IyMab2u31+E2JoMGH3tol5q6kKkSw8TQ02kXJhnTTB3RryVa
         Fgi+gGoEnE9elOWRfUPHadJeNy8BNyERMuqzUDOMPQf1Nu/O+CbU2oPHuHIQ+XsxkEZ6
         Ubqcdz3a5h8UlypNlriqv0zKRIcuses0BmjV5Bub7nRHboPe+v0sshejinTgs2Npf/Q6
         VNxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769131952; x=1769736752;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+uuLZHwmvu91uXKQ5s1MOyzkT50vhUhhXbA5LIukjvA=;
        b=QCQDcgWdzgleiBABbz7O6SN6X8ws7Y7iDft3KT1n0KKABfwBZEqTB04rDQnIaa23+3
         beOle1YuiiThTBWyDnBYNqf0vSPvjIIxUDloH4OoNBe3rNZd6xpESEVeu+w1LRycJpdz
         IeG7K5/DANr8D3FPxG/4T+XN3pULWPX9TkwHtRlYUd1cbt0jmdYGwOM8wZrPzKuGE0Lt
         MHUjGjS228AO4TcpnPIIghOo91cTmOPtc7aX1r45l2YhdottcZAAm6gvFXWR6dJXQeDn
         UprLJ98ULNEdyc01NR++1mxXnA7+GXmvj3sJCVapI3XY865E66KbIsrSSrBEESqTI0Ef
         aPMA==
X-Forwarded-Encrypted: i=1; AJvYcCVKzDvSqC6QgrcOoNCn7co+beK/4N20ywcZuxJMTc6PhpIXrfHF6kCqEYGhj+5KozBMhONgYXsh8fp7pCKRu0tG@lists.infradead.org
X-Gm-Message-State: AOJu0YzJECUnJmw+4fLNrRvqHd1E6/acygT6VgJpqcno6Vwxy9pjJ59s
	qm2aD2F2YH33vIFVM9rtqnN9MLvqRfUHk/Zf1ZmrUplqsQ8RZT5gmCP9neuUlkOSVp8NMlGdLXH
	5UJwuAmvgDA82VQd7ebgAQqiUaEfft/widultF21/EIVsSxyQnuvfnbs4rSfeghQBdfUMSMhJfK
	DWrw==
X-Gm-Gg: AZuq6aLTmcSacWazy0m/2SVQ6Jl9+mI1iEaWA//bmx3fes6s6VZb4Uv65Nm4jPYZxKs
	+81mO9+nxQVpaDThuStAwBpEbmwQIBuuE/P/V21qQjFEXb2gDqIoyW1FzsjJ3F5jKITGI6r67so
	Fer0GJsAGNYKABGmnzm6ynPhdpbvSAYkJ39xWG73wsNHC3RlDvJWYXw0NtXpyleT1NPK9k/KT3P
	DwYROGZbidzpXrKPfDRcnI7kGgjXJt/rxkDZ2KfuHgKvRPVB6gIomx4xQ3GOECj1+om5dVBYSlO
	xS8vsygI/4Ztdyk9G3pxVtro5V21fXGGaLawOiSp46ZHGVrVw75TWlfQLqhAD9Zp3UL4WfLcxtS
	9agN3Ng6ABv84ugAraWdPKaAz59+VpUg/Y09tHv04qpoKLpXjN7sYUgL+uEoQiy4BnlXCUxUtji
	g=
X-Received: by 2002:a05:6a21:700e:b0:35d:5d40:6d78 with SMTP id adf61e73a8af0-38e6f7d68d3mr1297864637.46.1769131952145;
        Thu, 22 Jan 2026 17:32:32 -0800 (PST)
X-Received: by 2002:a05:6a21:700e:b0:35d:5d40:6d78 with SMTP id adf61e73a8af0-38e6f7d68d3mr1297830637.46.1769131951588;
        Thu, 22 Jan 2026 17:32:31 -0800 (PST)
Received: from [10.133.33.105] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c635a43fc46sm522690a12.36.2026.01.22.17.32.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jan 2026 17:32:31 -0800 (PST)
Message-ID: <2c440398-fc03-4e26-a471-2c1a742b95c0@oss.qualcomm.com>
Date: Fri, 23 Jan 2026 09:32:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 3/8] coresight: tmc: Introduce sysfs_read_ops to wrap
 sysfs read operations
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260122-enable-byte-cntr-for-ctcu-v10-0-22978e3c169f@oss.qualcomm.com>
 <20260122-enable-byte-cntr-for-ctcu-v10-3-22978e3c169f@oss.qualcomm.com>
 <f78f72ec-9b57-4373-a7f0-a9295326832b@arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <f78f72ec-9b57-4373-a7f0-a9295326832b@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: iXzudcwzcCQoVh2Dyunbvie57MEutS2a
X-Authority-Analysis: v=2.4 cv=I5lohdgg c=1 sm=1 tr=0 ts=6972cfb3 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=VFazKpM1ZUkYcEefXmEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: iXzudcwzcCQoVh2Dyunbvie57MEutS2a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDAwOCBTYWx0ZWRfX2lZwcXvLPqwF
 1R+aZWLdDFFEXgqShbUDzYWF6TybjkIy/ExwvQVpjMjeMyhsqV69x62vNJCus3b7Ebai6Wc+TLx
 wwEepJ0jks3kxMSiXA0eVOQ2wMiQYLS69vu83H7QFdegv/zhaSs6TBiqGqJNWwwGeb4H+6tmMi+
 PppF6dN1+nt/xd28DEPmTs0prDjbjlyr+pyLVutL7qnKV/b5rJFi6r3Ex83GkK0bU6zCQ6LjSv7
 Vy3D+1bPXOtdCeM/KU9r1+y7zwkgng5vMt5yVAUe9kft0vHS49kXR4aZjT7HmutkyjNRAfsIAnK
 PjOX9fvxH6vG29CY0PvKWtgN3Ai5GfYbCYqZdSBBQ0NX9R8m134GFTy9MoT3KWPVZI3x3Y6Moiq
 A4PXU4+sk0NZvJSQkQuiMY3yjIw4SfzJwhK7qA0DTvqOUCBtrjBJyvFS7xbd07EzgI9aail24kU
 I8Vp2yHFV+8sIckaJ1g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_06,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601230008
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_173242_513013_847F6B14 
X-CRM114-Status: GOOD (  24.72  )
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



On 1/22/2026 6:07 PM, Suzuki K Poulose wrote:
> On 22/01/2026 02:08, Jie Gan wrote:
>> Introduce sysfs_read_ops as a wrapper, wrap sysfs read operations, for 
>> reading
>> trace data from the TMC buffer.
>>
>> Reviewed-by: Mike Leach <mike.leach@linaro.org>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   drivers/hwtracing/coresight/coresight-tmc-core.c | 50 ++++++++++ 
>> +-------------
>>   drivers/hwtracing/coresight/coresight-tmc.h      | 17 ++++++++
>>   2 files changed, 40 insertions(+), 27 deletions(-)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/ 
>> drivers/hwtracing/coresight/coresight-tmc-core.c
>> index 1ea255ffa67c..8b0397a77e57 100644
>> --- a/drivers/hwtracing/coresight/coresight-tmc-core.c
>> +++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
>> @@ -232,17 +232,10 @@ static int tmc_read_prepare(struct tmc_drvdata 
>> *drvdata)
>>   {
>>       int ret = 0;
>> -    switch (drvdata->config_type) {
>> -    case TMC_CONFIG_TYPE_ETB:
>> -    case TMC_CONFIG_TYPE_ETF:
>> -        ret = tmc_read_prepare_etb(drvdata);
>> -        break;
>> -    case TMC_CONFIG_TYPE_ETR:
>> -        ret = tmc_read_prepare_etr(drvdata);
>> -        break;
>> -    default:
>> +    if (drvdata->sysfs_ops)
>> +        ret = drvdata->sysfs_ops->read_prepare(drvdata);
>> +    else
>>           ret = -EINVAL;
>> -    }
>>       if (!ret)
>>           dev_dbg(&drvdata->csdev->dev, "TMC read start\n");
>> @@ -254,17 +247,10 @@ static int tmc_read_unprepare(struct tmc_drvdata 
>> *drvdata)
>>   {
>>       int ret = 0;
>> -    switch (drvdata->config_type) {
>> -    case TMC_CONFIG_TYPE_ETB:
>> -    case TMC_CONFIG_TYPE_ETF:
>> -        ret = tmc_read_unprepare_etb(drvdata);
>> -        break;
>> -    case TMC_CONFIG_TYPE_ETR:
>> -        ret = tmc_read_unprepare_etr(drvdata);
>> -        break;
>> -    default:
>> +    if (drvdata->sysfs_ops)
>> +        ret = drvdata->sysfs_ops->read_unprepare(drvdata);
>> +    else
>>           ret = -EINVAL;
>> -    }
>>       if (!ret)
>>           dev_dbg(&drvdata->csdev->dev, "TMC read end\n");
>> @@ -291,13 +277,8 @@ static int tmc_open(struct inode *inode, struct 
>> file *file)
>>   static ssize_t tmc_get_sysfs_trace(struct tmc_drvdata *drvdata, 
>> loff_t pos, size_t len,
>>                      char **bufpp)
>>   {
>> -    switch (drvdata->config_type) {
>> -    case TMC_CONFIG_TYPE_ETB:
>> -    case TMC_CONFIG_TYPE_ETF:
>> -        return tmc_etb_get_sysfs_trace(drvdata, pos, len, bufpp);
>> -    case TMC_CONFIG_TYPE_ETR:
>> -        return tmc_etr_get_sysfs_trace(drvdata, pos, len, bufpp);
>> -    }
>> +    if (drvdata->sysfs_ops)
>> +        return drvdata->sysfs_ops->get_trace_data(drvdata, pos, len, 
>> bufpp);
> 
> minor nit: Please could we bail out in tmc_open() if the drvdata- 
>  >sysfs_ops is not set. That way, we don't have to sprinkle it 
> everywhere. And also, we don't expect to see this case anyways.
> 

In tmc_open, we already have checked the validation of the 
drvdata->sysfs_ops, we dont need check it again here. I will fix it in 
next version.

>>       return -EINVAL;
>>   }
>> @@ -769,6 +750,18 @@ static void register_crash_dev_interface(struct 
>> tmc_drvdata *drvdata,
>>               "Valid crash tracedata found\n");
>>   }
>> +static const struct sysfs_read_ops tmc_etb_sysfs_read_ops = {
> 
> minor nit: please could we rename the struct type to :
> 
> struct tmc_sysfs_ops
> 
> and then use
> 
> etb_sysfs_ops = {}
> etr_sysfs_ops = {}
> 
> 
> Rest looks fine to me
> 

Well noted. Will fix it in next version.

Thanks,
Jie


> Suzuki
> 
>> +    .read_prepare    = tmc_read_prepare_etb,
>> +    .read_unprepare    = tmc_read_unprepare_etb,
>> +    .get_trace_data    = tmc_etb_get_sysfs_trace,
>> +};
>> +
>> +static const struct sysfs_read_ops tmc_etr_sysfs_read_ops = {
>> +    .read_prepare    = tmc_read_prepare_etr,
>> +    .read_unprepare    = tmc_read_unprepare_etr,
>> +    .get_trace_data    = tmc_etr_get_sysfs_trace,
>> +};
>> +
>>   static int __tmc_probe(struct device *dev, struct resource *res)
>>   {
>>       int ret = 0;
>> @@ -828,6 +821,7 @@ static int __tmc_probe(struct device *dev, struct 
>> resource *res)
>>           desc.subtype.sink_subtype = CORESIGHT_DEV_SUBTYPE_SINK_BUFFER;
>>           desc.ops = &tmc_etb_cs_ops;
>>           dev_list = &etb_devs;
>> +        drvdata->sysfs_ops = &tmc_etb_sysfs_read_ops;
>>           break;
>>       case TMC_CONFIG_TYPE_ETR:
>>           desc.groups = coresight_etr_groups;
>> @@ -841,6 +835,7 @@ static int __tmc_probe(struct device *dev, struct 
>> resource *res)
>>           mutex_init(&drvdata->idr_mutex);
>>           dev_list = &etr_devs;
>>           INIT_LIST_HEAD(&drvdata->etr_buf_list);
>> +        drvdata->sysfs_ops = &tmc_etr_sysfs_read_ops;
>>           break;
>>       case TMC_CONFIG_TYPE_ETF:
>>           desc.groups = coresight_etf_groups;
>> @@ -849,6 +844,7 @@ static int __tmc_probe(struct device *dev, struct 
>> resource *res)
>>           desc.subtype.link_subtype = CORESIGHT_DEV_SUBTYPE_LINK_FIFO;
>>           desc.ops = &tmc_etf_cs_ops;
>>           dev_list = &etf_devs;
>> +        drvdata->sysfs_ops = &tmc_etb_sysfs_read_ops;
>>           break;
>>       default:
>>           pr_err("%s: Unsupported TMC config\n", desc.name);
>> diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/ 
>> hwtracing/coresight/coresight-tmc.h
>> index 9b3c4e6f0a5e..c9a82ff6cd00 100644
>> --- a/drivers/hwtracing/coresight/coresight-tmc.h
>> +++ b/drivers/hwtracing/coresight/coresight-tmc.h
>> @@ -221,6 +221,8 @@ struct etr_buf_node {
>>       struct list_head    node;
>>   };
>> +struct sysfs_read_ops;
>> +
>>   /**
>>    * struct tmc_drvdata - specifics associated to an TMC component
>>    * @atclk:    optional clock for the core parts of the TMC.
>> @@ -258,6 +260,7 @@ struct etr_buf_node {
>>    *         Used by ETR/ETF.
>>    * @etr_buf_list: List that is used to manage allocated etr_buf.
>>    * @reading_node: Available buffer_node for byte-cntr reading.
>> + * @sysfs_ops:    Read operations for sysfs mode.
>>    */
>>   struct tmc_drvdata {
>>       struct clk        *atclk;
>> @@ -290,6 +293,20 @@ struct tmc_drvdata {
>>       struct tmc_resrv_buf    crash_mdata;
>>       struct list_head        etr_buf_list;
>>       struct etr_buf_node     *reading_node;
>> +    const struct sysfs_read_ops    *sysfs_ops;
>> +};
>> +
>> +/**
>> + * struct sysfs_read_ops - read operations for TMC and its helper 
>> devices
>> + * @read_prepare:    prepare operation.
>> + * @read_unprepare:    unprepare operation.
>> + * @get_trace_data:    read operation.
>> + */
>> +struct sysfs_read_ops {
>> +    int (*read_prepare)(struct tmc_drvdata *drvdata);
>> +    int (*read_unprepare)(struct tmc_drvdata *drvdata);
>> +    ssize_t (*get_trace_data)(struct tmc_drvdata *drvdata, loff_t pos,
>> +                  size_t len, char **bufpp);
>>   };
>>   struct etr_buf_operations {
>>
> 


