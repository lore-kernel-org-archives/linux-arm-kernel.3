Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B09DD78769
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 12:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ioW0G0zJ4Gdvp4lZXdiH2R11D9QynBBhy4Ub0b1zw94=; b=Hdr17qsMiqsR7kFOZy06PK/3bG
	44FODykadP+q4lZJybEL8/A7ZAH5VpwgabIooPVcZ2sYuMmUS/r/EVeigfDe3YVX+D1UgKH/K7H8f
	qnrcixJKMdGOXRtCEk05GIhX6sxV/eTHbdgDqom+YzVvmRVrMzYxmiYhr/thstRxqPT19dGKRzyMn
	VLYuJXN+VydtO9Rb3QkcD5EYX9BjZ3ow0eURQDRvuZdeVnRf/qIXdydPf+Npm4DO78Yxp6ZpFsIVe
	H5m9igNYOKa2FsLDkjDRk0ocPYSWP+xFNv7/VIrUho32qk4tewHuP1kJNysgHzOz/vXLa8QYeKdsI
	FC3I4X/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWZdx-0000000AIQu-2Af5;
	Fri, 19 Dec 2025 12:31:37 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWZdt-0000000AIQP-02L8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 12:31:34 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJBXch6091384
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 12:31:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ioW0G0zJ4Gdvp4lZXdiH2R11D9QynBBhy4Ub0b1zw94=; b=Y53PdL6aQDbnwihC
	+ASUVruZXtffu8ooMZ9BM4QpJp0Q5GszS1OBaPdhLMT2MM5+I2bChf+jO0bbNjsA
	bL3Y6ntl3eqBt5dWAR9IRCixNmJGteIET35NMZugjlNB/D2mXLUOynNHv4S389T+
	rB89u9uufj2Vwr2QexI5pgwZlc4c9DE/LRvkb26q9XnkbhbGPJlx7pHK8On8rJGp
	5tASx+V1aHb4+/g+9afPmAUm3ZRDICYI4Er2oHvLWrpaX42y6cSe4A3/tzeE2Nzg
	ovzhYwYX5sd0I2NICvmNbaeUanmALvdODC9pxz1t+nijJeSgZytFF0KSZhkmjlYA
	iQQflA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2eamk0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 12:31:31 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a0f0c7a06eso32798475ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 04:31:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766147491; x=1766752291; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ioW0G0zJ4Gdvp4lZXdiH2R11D9QynBBhy4Ub0b1zw94=;
        b=i2CGgkbprMJ6JuSTNrSr90o4lCmMXudzHHh8EHHflIWysPZiEZHKft+kNaHLx/aD+j
         ZuAEQ5E4wqQsSZ2osS+TV8tNjehdtFX7kfVTd2QK9oMT83KQmW52dwGfiCWRT1DEwk8w
         xBP57rFpI5C7R0ERdUF1GcnDdYY+6YQzFb487jx6Ke8KwbzWTQoEnUEqIftRllXAYZQU
         nvKbW9PdtM9XnDs2yd5J9OkP+IInmVw8llkdli7mgHPhU/ZgGaSOAOxQ3B+XtOvRxTcx
         EqfctpmdmV2y49MN6wR1nMSInmz+MaN9IO1062yDI6mwo1PPG8jdRsIOiSmhsWpycmvk
         bgSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766147491; x=1766752291;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ioW0G0zJ4Gdvp4lZXdiH2R11D9QynBBhy4Ub0b1zw94=;
        b=sVauj3ej9VDa3G+0xnHvZ1FrpHJiaZ0dlarnVput9viX8V1hCR3DB0esr2fRkOrJOD
         ZcXmYP8zRNDaQkRmU1pohJwWvUltgFBmXgixagKfh0aHEoI5VfkTru39hG4Lvgxw2Lvh
         Ve48009VPS/h+32wpvy1yVXkS46Z5FCW+Xyp6rLtSSg9tZNfOqU4Yaqj+6fSvzBheTHb
         VU+yhawYWhKChAL1bIr54JTZo37/vU8oLHRxQ/bFphwefrpv7Ylvmd28Wg/YgwxNO7Tj
         VUQ8XnHbPoDw0x6/z557mea2GyxHuSYqsfMVsgj555kWq5oF5gfK6QoSbLGfxyijPsch
         e0ig==
X-Forwarded-Encrypted: i=1; AJvYcCV252Z8D/0mJTtrNvk5yc/bkUCIT97nWJAzO6hpcDDoXAKHuzuOb8EkF7ULQGFaIJnu7hWbxcXLmAynW2pjlFpz@lists.infradead.org
X-Gm-Message-State: AOJu0Yzyz0S+xQe+TXPyFsCzaBUdaBCZIArSLXAZoE5spIXNQHrz2r8H
	8idyhgf//f120ztM0MSndl9Y18z8vcHHei3IO3SO3UYOIE/dLgpmCb/VnZyty7VoAn3bZ+aWUYT
	ll09TDTsmgZpavrYx4adoiXw7Tu2mZeSsmOnHjaYCiPvb5jXnQXj/ylEsWXOaSmvLKNcQMi0Z95
	rLjA==
X-Gm-Gg: AY/fxX7dpJQUm5zlPNu5cVoKB8vsbaRUUhSe33BEY3a7wrgkKu87v5rvuzLq/WQNJcR
	DbtPMcG5UZPtDhGo3pMUaH4qmpQAgZngOGh6/WSH9vMD1/NahBZcNYzsffiX9B5Zum9J7RZLyqc
	zX4l+c92qVgwXygTwa6vHjB4oAsK7qgF7rLkfzeTGflQpOHNhWoHUMMBJhkrtCwM+5JHMvfEgRb
	nVQWOOA+aNr+VXilI/3qMmKLWRrGjUv6gNzJ66raLZC0gcmu8XNZWr/HQ8eBPNIkXDxhYc6tG7R
	Pha+OX4HxaOeRrv/Q87nubxIe4kAdAJcJMe+kzIyA6+Tr7tvAvQgazssq6AQWxdZCj23PwoOd8K
	moeUfyctAHLM8EbRjaJmCxDaxvO4E4svLbvQa8z8yANafVcX5qwoKYi1QQ6dI++IZPkf8yTm5Ty
	Q=
X-Received: by 2002:a17:903:40cb:b0:29e:facd:7c02 with SMTP id d9443c01a7336-2a2f2830ff4mr25392865ad.28.1766147490861;
        Fri, 19 Dec 2025 04:31:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHM8Jv5Jkofia0A3RPi3up+pQSDHmJf6El7fJWTt+Lsi65z07vLOF5Nh2CNUeO5SHV4wGRs3Q==
X-Received: by 2002:a17:903:40cb:b0:29e:facd:7c02 with SMTP id d9443c01a7336-2a2f2830ff4mr25392555ad.28.1766147490338;
        Fri, 19 Dec 2025 04:31:30 -0800 (PST)
Received: from [10.133.33.111] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4cbe5sm22232245ad.60.2025.12.19.04.31.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Dec 2025 04:31:28 -0800 (PST)
Message-ID: <fb8084b1-858d-4942-9580-9a5f3016b7c0@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 20:31:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] coresight: tpda: add logic to configure TPDA_SYNCR
 register
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
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <38dc6948-6233-4b0a-a769-538939abe345@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDEwNCBTYWx0ZWRfX1ayqHcZz76Jj
 ySmn4vqhhHhwFb8IBKcApeweUwD8yxk3pfHN7oh9JcJNi6Ua/fapm3PUvb8oioPzq/gwnzDtjVh
 HOi4swDs1+MyHUwVh5RaolX4J5t94Oe3Y/AcM4Tfj8BwHrEWT+NLONcfo1K4+ewoaI0+Y+ln65r
 YRzVGWX7RuIKLVD21nmtARN4EpxUY8Uxb87rVce4gvaiAN8fNnxEFF1sfRIzTptWX3zRJAPstN3
 8hZTcrBlqYYN8294mhVRsXhVXTvDo0IUv5EvGd0CKl+SJM6o0ftFyew3jLPr1xeu78FokyV4010
 wwpNn29LYI8VFM96jzYd8EcxLB5yGhAD4IDEO/9Cqq2WoXNRwSroC2LN+8M++tOU3VIGrEatmyS
 gLJTpDzUIKVFGaEjuS7MROLXfxnfEpf3wSixxHSdWpSEEsR2MC8o0ceYAtVJROuGSGY/XAiSpLN
 XbxbymWt50ldzU8ErJA==
X-Authority-Analysis: v=2.4 cv=W+c1lBWk c=1 sm=1 tr=0 ts=694545a3 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=8OLJw_hJ6b_DfWCpv44A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 0OqVElLhoWeD9xM2oEYSrQfmWHH0k9uh
X-Proofpoint-GUID: 0OqVElLhoWeD9xM2oEYSrQfmWHH0k9uh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512190104
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_043133_166232_A13FBFED 
X-CRM114-Status: GOOD (  23.07  )
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



On 12/19/2025 6:24 PM, Suzuki K Poulose wrote:
> On 19/12/2025 10:04, Jie Gan wrote:
>> From: Tao Zhang <tao.zhang@oss.qualcomm.com>
>>
>> The TPDA_SYNC counter tracks the number of bytes transferred from the
>> aggregator. When this count reaches the value programmed in the
>> TPDA_SYNCR register, an ASYNC request is triggered, allowing userspace
>> tools to accurately parse each valid packet.
>>
>> Signed-off-by: Tao Zhang <tao.zhang@oss.qualcomm.com>
>> Reviewed-by: James Clark <james.clark@linaro.org>
>> Co-developed-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   drivers/hwtracing/coresight/coresight-tpda.c | 7 +++++++
>>   drivers/hwtracing/coresight/coresight-tpda.h | 5 +++++
>>   2 files changed, 12 insertions(+)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/ 
>> hwtracing/coresight/coresight-tpda.c
>> index d25a8bcfb3d4..d378ff8ad77d 100644
>> --- a/drivers/hwtracing/coresight/coresight-tpda.c
>> +++ b/drivers/hwtracing/coresight/coresight-tpda.c
>> @@ -163,6 +163,13 @@ static void tpda_enable_pre_port(struct 
>> tpda_drvdata *drvdata)
>>        */
>>       if (drvdata->trig_flag_ts)
>>           writel_relaxed(0x0, drvdata->base + TPDA_FPID_CR);
>> +
>> +    val = readl_relaxed(drvdata->base + TPDA_SYNCR);
>> +    /* Reset the mode ctrl */
>> +    val &= ~TPDA_SYNCR_MODE_CTRL;
>> +    /* Program the counter value for TPDA_SYNCR */
>> +    val |= TPDA_SYNCR_COUNTER_MASK;
> 
> Do we plan to change this value via sysfs ? If not whats the point of
> clearing the field. Why not simply set it (as it is all 1s anyways).

We configure the value only once during enablement and do not intend to 
modify it through sysfs. The mode_ctrl is reset to reinitialize the counter.
For example, if the TPDA device has been enabled and then disabled, the 
counter may have already counted some packets. This could result in an 
async packet being triggered with an unexpected data size.

> 
>> +    writel_relaxed(val, drvdata->base + TPDA_SYNCR);
>>   }
>>   static int tpda_enable_port(struct tpda_drvdata *drvdata, int port)
>> diff --git a/drivers/hwtracing/coresight/coresight-tpda.h b/drivers/ 
>> hwtracing/coresight/coresight-tpda.h
>> index 8a075cfbc3cc..97e2729c15c9 100644
>> --- a/drivers/hwtracing/coresight/coresight-tpda.h
>> +++ b/drivers/hwtracing/coresight/coresight-tpda.h
>> @@ -9,6 +9,7 @@
>>   #define TPDA_CR            (0x000)
>>   #define TPDA_Pn_CR(n)        (0x004 + (n * 4))
>>   #define TPDA_FPID_CR        (0x084)
>> +#define TPDA_SYNCR        (0x08C)
>>   /* Cross trigger Global (all ports) flush request bit */
>>   #define TPDA_CR_FLREQ        BIT(0)
>> @@ -38,6 +39,10 @@
>>   #define TPDA_Pn_CR_CMBSIZE        GENMASK(7, 6)
>>   /* Aggregator port DSB data set element size bit */
>>   #define TPDA_Pn_CR_DSBSIZE        BIT(8)
> 
> Newline to separate the defintions of different registers, please.

will fix it.

Thanks,
Jie

> 
>> +/* TPDA_SYNCR mode control bit */
>> +#define TPDA_SYNCR_MODE_CTRL        BIT(12)
>> +/* TPDA_SYNCR counter mask */
>> +#define TPDA_SYNCR_COUNTER_MASK        GENMASK(11, 0)
>>   #define TPDA_MAX_INPORTS    32
> 
> Suzuki
> 
> 
>>
> 


