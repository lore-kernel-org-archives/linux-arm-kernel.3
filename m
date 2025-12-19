Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A314BD767FF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 13:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u1r5FLJ2l7P+rOCCZhhwhgFsdX/h2QCBnQmP2O7LLYA=; b=3qPT4lQ5dVr1cnuWQl8BS9/SU3
	kbcmA+CZaaAxCETjlapRo6Dcqdwl6VyTxDZEzBZXc/Im5Y5S+IuFcEA5WD5C1Ez3C8uJtnH+KH+dL
	mK7oveEZQen7ppidPt5MuS0owxu3Eu6FgKfPumdd9ztdtoIb6PWcpFf2YcTqkStV/X7PUHtXJXcGj
	lQs5AJcqu4bFJsdM27PkLC58NzHWSlgRF/kRCgl2Jyrwsnh3olt+JLmsGJYcCkuCeRvxebDqtyX/8
	XmpND+0aGvWNvJGfYTjm507OJ6iNvPAM6SQu5twDz/Os4gH97USjyRecTsM6DgngNgliwfDJuAhim
	mbeoVSeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWa5i-0000000AK1v-1aWk;
	Fri, 19 Dec 2025 13:00:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWa5f-0000000AK0p-1Xwf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 13:00:16 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJBbIM91771762
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 13:00:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u1r5FLJ2l7P+rOCCZhhwhgFsdX/h2QCBnQmP2O7LLYA=; b=iabjbzaPg+kZbwhk
	bF/kj0GLjIsp77eQ3I8MW3OOGT5DaqIrdWAFCwA6xIMJjICRHN7MalavQhxUlGY1
	DBv30ZZwJXsPlx6wo1bzYseNUh83jM8AdKAFTwXpSAsF+qRNS8su3wrkqz//3MUB
	FXcp5q8tutcFQt7NNl+eJTd+JMlWHMY4xRPmZgvaAhgVilOTuG9vuCuRdmIf36P5
	ym73i2uUmf3nJSCAlOXSE3g1GYRmiqsjbf2wqI56faV0i6pmD1bW4oKGRaZ7yGd7
	LvnCGiSrag3mBCov4YSJr8OevnrYBxpxHqriCWJiGcg9wC9qOfy3Ti7tomjtkEf6
	tiyd3Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2bjptp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 13:00:14 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34c66cb671fso2729812a91.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 05:00:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766149214; x=1766754014; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=u1r5FLJ2l7P+rOCCZhhwhgFsdX/h2QCBnQmP2O7LLYA=;
        b=SCQIZ1lzdgKEJJrCqse3AetliN+QX4eSMr7k6T+EPi7bosncFvhAdgxewgRQQrI3mE
         OuW9ExtLbeaz+K8gnYG4mv347bfXj0gIZ9hu572Uzlu8p84NpSPuejhQTkUZBceUENNM
         xZw6JWnsT6ajDG04TW+sLaLdY82m48NmdSz2YeQRoaKy8kvatItkGnVn3pZS6IkNff/Z
         AD6ceyCH5FvwtCxZ4JViFHCJYBraK+e1t6x/Df/aiIB3Yi4Zgi1TRMmQAtN2NIlfeL0H
         joSFL6iDz/m1RJjoWfy2IfJix4u+G3BRvwtwwuxWhIEX3nLIZ4FIAUNPhStyWxhinDb3
         nsGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766149214; x=1766754014;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u1r5FLJ2l7P+rOCCZhhwhgFsdX/h2QCBnQmP2O7LLYA=;
        b=e8LU0b9TGnvtJM2upH5bTJahDmyjGEkTMbKXQVzWQjAqYZ75nlR878NjTI5WOIKT1b
         YiWMBcVcyPhKpCXi9/AsI+HFKcx6I1bDcQctaGsjSwUVCQCWFZFL6Zl4Ri3tsfi7EjwG
         pLPCHmbow2sSvwS977PcPqmKeMFxmdsC2CEcZ2GnV/QyB+rXhnLI4MQ3dBsGdaqqD6Ua
         gnxeZKjYlWeaBhS9SxnerO0nb9yRK7k6yEobY4oDCkfO3hy90G3/RH3w93i+JTmsUipD
         +60KzWV3xsrq1qFUdQAaX0Xx/ZjWgFDJ4jLfz6mW4pePrV7VpWJQVhHKLXk3eAMo9AVF
         6RxA==
X-Forwarded-Encrypted: i=1; AJvYcCXhh7fHERRMll//Ji1i4kuMu5L0kOYrEGl5v7+hpZP/UFcr97BZJ4b5JQlXjxQX4TMI1oobcLrFPWZgwEh5rcdS@lists.infradead.org
X-Gm-Message-State: AOJu0YxP8msjWvDgtDtvKB9RugbQYHD1FdPESHQqJ0dO6gs/4W3bc2x1
	rUHdfTbYXEbF1avfLqH3naxEGfskI5rSBye6xLT1PcYATpMdyDKUiTkYakMZ81RoaF9YMSZfZcb
	bXuGEphmQhJoyIyS9EQwoG04ivupHA49YfWGlbmJYtl16uwnCTX0DscoY2G1xxb88/HfuJe+WNW
	fiDw==
X-Gm-Gg: AY/fxX609F58/PisgHJhn9quvT/Zxs8nnnylwhSQi+V7MBzzzA+fE5Yhz1eDrM9uMoR
	IJSY8JmtWFYRbg3nXi0FGJ0MR5JRPXUAgBVBbvEDZRKRyEFeNJWutDM9hjHSuzonMFR/9iuTVpf
	kElEUSQu6Zu+y0ofvORShS9P5h29KcCNH/sDfb42772DVAJNCWCHHBwiPI4ZsnxABSHrYIOhS/h
	2voDECgdHxlGFFOmR0/TicGl49hUQoa+qe0ZlF3W1xIWGLRnGTpZ5hjMvnDsMUvS/9/jp/OUKnj
	1muCe4BbCiRdTr+QjExsoLiAwJKxO2YQ1v4IGVVI8H00vY6EAyZyGkFhb+dUp5t7AFtnRJ97wDa
	5ygCvTEgFPey8snzD/6bV+ySIyCg4OKbHtvNMvS5gpjatisiwDOBPxuO0ol1+DuGpNectuhwi+5
	U=
X-Received: by 2002:a17:90b:3d8b:b0:33d:a0fd:257b with SMTP id 98e67ed59e1d1-34e921f0b38mr2016986a91.36.1766149213720;
        Fri, 19 Dec 2025 05:00:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHEumvKlgL4z4nT80FDoF0uxD2kSGaeoprq+N7i8LpYdvtRqWgsyaGXqXuRn3i9Drjzyjsm/A==
X-Received: by 2002:a17:90b:3d8b:b0:33d:a0fd:257b with SMTP id 98e67ed59e1d1-34e921f0b38mr2016937a91.36.1766149212725;
        Fri, 19 Dec 2025 05:00:12 -0800 (PST)
Received: from [10.133.33.111] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e70d676b8sm5247864a91.8.2025.12.19.05.00.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Dec 2025 05:00:12 -0800 (PST)
Message-ID: <9eaf823b-d18e-4067-8843-0c03530485a9@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 21:00:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] coresight: tpda: add logic to configure TPDA_SYNCR
 register
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Tao Zhang <tao.zhang@oss.qualcomm.com>
References: <20251219-add_sysfs_nodes_to_configure_tpda-v5-0-ca93ddfe9d30@oss.qualcomm.com>
 <20251219-add_sysfs_nodes_to_configure_tpda-v5-2-ca93ddfe9d30@oss.qualcomm.com>
 <38dc6948-6233-4b0a-a769-538939abe345@arm.com>
 <fb8084b1-858d-4942-9580-9a5f3016b7c0@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <fb8084b1-858d-4942-9580-9a5f3016b7c0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: upb2MLN8OMWadl4cookt2NVOvrCoJcEI
X-Proofpoint-ORIG-GUID: upb2MLN8OMWadl4cookt2NVOvrCoJcEI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDEwNiBTYWx0ZWRfX4Eiz4mUCR0jW
 u5CHbtYORkeft9UYIP17QeZH1lktM6MDKJGW9UXEw2oFL6GerWb1ybA/Vb1OJcs9SfGyZ0Gz7mt
 29S3mrFd2rtz9gXADgGhree4Ck/upJI66iTicmzWSHYFe2bRvMrruUdtCYCpod11WJzK0cgdloo
 C4EqlHrAAObdZjpp9mUdJfSjNJ8T8B9BjK+x4weMMPd+HdhXTJd9vaKJcsm3eqSCjkWYGOioSwg
 xC0sh+W8Fj4r9PzulUCozkWKJL6y7Ig2wQ7GrEo9Xe3S07TUSiqpLQBxfIRstR9XDMAQwfOYh55
 PdrZStwxlSjVzbLVMii2CK/taM66Se+4+jdVIVOwXKfGbWiUmEaoOvr3B3AJ60yy0RfUeBgGBNK
 jzGe7+1l1wgFjPGqO6oSo98bOqOc5eGz/lzgCaBYAhid6Me2w9xCcBMt7qBNZV8i721aBVnNlOk
 x0il9wtB5oXRdvZjfFw==
X-Authority-Analysis: v=2.4 cv=WYwBqkhX c=1 sm=1 tr=0 ts=69454c5e cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=8heJ_ZlZk143kZje2o0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_04,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512190106
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_050015_422141_BE5991F4 
X-CRM114-Status: GOOD (  26.44  )
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



On 12/19/2025 8:31 PM, Jie Gan wrote:
> 
> 
> On 12/19/2025 6:24 PM, Suzuki K Poulose wrote:
>> On 19/12/2025 10:04, Jie Gan wrote:
>>> From: Tao Zhang <tao.zhang@oss.qualcomm.com>
>>>
>>> The TPDA_SYNC counter tracks the number of bytes transferred from the
>>> aggregator. When this count reaches the value programmed in the
>>> TPDA_SYNCR register, an ASYNC request is triggered, allowing userspace
>>> tools to accurately parse each valid packet.
>>>
>>> Signed-off-by: Tao Zhang <tao.zhang@oss.qualcomm.com>
>>> Reviewed-by: James Clark <james.clark@linaro.org>
>>> Co-developed-by: Jie Gan <jie.gan@oss.qualcomm.com>
>>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>>> ---
>>>   drivers/hwtracing/coresight/coresight-tpda.c | 7 +++++++
>>>   drivers/hwtracing/coresight/coresight-tpda.h | 5 +++++
>>>   2 files changed, 12 insertions(+)
>>>
>>> diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/ 
>>> hwtracing/coresight/coresight-tpda.c
>>> index d25a8bcfb3d4..d378ff8ad77d 100644
>>> --- a/drivers/hwtracing/coresight/coresight-tpda.c
>>> +++ b/drivers/hwtracing/coresight/coresight-tpda.c
>>> @@ -163,6 +163,13 @@ static void tpda_enable_pre_port(struct 
>>> tpda_drvdata *drvdata)
>>>        */
>>>       if (drvdata->trig_flag_ts)
>>>           writel_relaxed(0x0, drvdata->base + TPDA_FPID_CR);
>>> +
>>> +    val = readl_relaxed(drvdata->base + TPDA_SYNCR);
>>> +    /* Reset the mode ctrl */
>>> +    val &= ~TPDA_SYNCR_MODE_CTRL;
>>> +    /* Program the counter value for TPDA_SYNCR */
>>> +    val |= TPDA_SYNCR_COUNTER_MASK;
>>
>> Do we plan to change this value via sysfs ? If not whats the point of
>> clearing the field. Why not simply set it (as it is all 1s anyways).
> 
> We configure the value only once during enablement and do not intend to 
> modify it through sysfs. The mode_ctrl is reset to reinitialize the 
> counter.
> For example, if the TPDA device has been enabled and then disabled, the 
> counter may have already counted some packets. This could result in an 
> async packet being triggered with an unexpected data size.
> 

Missed for explaining the mode_ctrl bit. Set value 0 to the mode_ctrl 
means reset the counter and set the mode to 0.

We have two modes:

mode = 0:
COUNT[11:0] value represents the approximate number of bytes moved 
between two ASYNC packet requests

mode = 1:
the bits COUNT[11:7] are used as a power of 2. for example, we could 
insert an async packet every 8K data by writing a value 13 to the 
COUNT[11:7] field.

Thanks,
Jie

>>
>>> +    writel_relaxed(val, drvdata->base + TPDA_SYNCR);
>>>   }
>>>   static int tpda_enable_port(struct tpda_drvdata *drvdata, int port)
>>> diff --git a/drivers/hwtracing/coresight/coresight-tpda.h b/drivers/ 
>>> hwtracing/coresight/coresight-tpda.h
>>> index 8a075cfbc3cc..97e2729c15c9 100644
>>> --- a/drivers/hwtracing/coresight/coresight-tpda.h
>>> +++ b/drivers/hwtracing/coresight/coresight-tpda.h
>>> @@ -9,6 +9,7 @@
>>>   #define TPDA_CR            (0x000)
>>>   #define TPDA_Pn_CR(n)        (0x004 + (n * 4))
>>>   #define TPDA_FPID_CR        (0x084)
>>> +#define TPDA_SYNCR        (0x08C)
>>>   /* Cross trigger Global (all ports) flush request bit */
>>>   #define TPDA_CR_FLREQ        BIT(0)
>>> @@ -38,6 +39,10 @@
>>>   #define TPDA_Pn_CR_CMBSIZE        GENMASK(7, 6)
>>>   /* Aggregator port DSB data set element size bit */
>>>   #define TPDA_Pn_CR_DSBSIZE        BIT(8)
>>
>> Newline to separate the defintions of different registers, please.
> 
> will fix it.
> 
> Thanks,
> Jie
> 
>>
>>> +/* TPDA_SYNCR mode control bit */
>>> +#define TPDA_SYNCR_MODE_CTRL        BIT(12)
>>> +/* TPDA_SYNCR counter mask */
>>> +#define TPDA_SYNCR_COUNTER_MASK        GENMASK(11, 0)
>>>   #define TPDA_MAX_INPORTS    32
>>
>> Suzuki
>>
>>
>>>
>>
> 


