Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC392CA0FF7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 11:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=38PuOyK1CwicT9yvnRLkviMk8ANShrxIjK+M3ztAQcI=; b=GbLbWzd+DQEFXrDdd3D0BhbVwC
	RGJNTS8uDuvh6Ncblv5pV6/0DTslJs2DzGeJ7ub+zj/4bGBlAab8CGTzTIHDLorneN+mseqUpE2Wt
	JfwPs4/7Fb3REXPjoqAQM/mM3L0StSdL3sy2n0hFAsIMlNHl9UIc8VJKo3gku0YBBNNSRBXPswXXa
	AUDZ27oYJn8OKBeKjRe1ySy3ky8uvxkADl+UhmwXwv/+a71lBn3Yld0Ds56orp5sVUUYikmym7hIn
	cuQM3+WQ3UTh1fy9wElx7rEqVlCeTj0w5BaRciHF1DClYI1tFLjpedAb2u8Tq7AgQpSp+jbkj40/v
	iVuNaNTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urE07-0000000FAWy-3GiT;
	Wed, 27 Aug 2025 11:07:35 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urCpG-0000000Evei-2TUm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 09:52:19 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57R6kGuO027480
	for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Aug 2025 09:52:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	38PuOyK1CwicT9yvnRLkviMk8ANShrxIjK+M3ztAQcI=; b=OswuahoZuzn1yWDT
	TGeW5cKDT02DhGYS3D5gxHZHc90lsAxbIhepSgDP2H63PoOIldu9xeC2/DRPta1i
	HCKGwcMo86CO9RDZ5z36YpRwpuRrNk8ze8pB1R44tcyDH6m82sqAFBk+iUc+VRKa
	czkl1saXIupXon4DvmzlIY7kJp5dGP081+wEJoJShJ0mLB+FRfW6SujKu156LaFQ
	FCqJ0gBvkP2pR5gRh3Mi2xNsWiDC4to+0VhAUhN2Aca6T/jsRKKSc8JIdDcK5i5w
	YCdD+vDZ7wMrvnbBxWxVMbBgUxCcCMWi5uoT5W6205bkQqicPzXa5vPA/+H16bgm
	8pP8sA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48se16u8jh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Aug 2025 09:52:17 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-323766e64d5so693255a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Aug 2025 02:52:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756288337; x=1756893137;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=38PuOyK1CwicT9yvnRLkviMk8ANShrxIjK+M3ztAQcI=;
        b=nEYKj7pvHnRNrG96IpTIWKrOI9yP4kOEi5BXSVP8KfWlq6ra3ndHlvUOyaT24k9x91
         SjQDMrgbgZAgt6TiipUhOytE8aCXTtKh+lQy3+UdDc1wUobFAz3z6ow+s7sYnYBC0UGW
         Ch6JnbSn42M9s4tjEOVdDNJldF0dSWzcWxKEw+GwkaFzVeoP3F0KuTbshyS/F0sJ81XM
         2z5Yhj3vk96PpZYJ1MDq3UysmN7SdVuxneEpfnC14u6G/+ioJMbzvvrE2aSW/adVcODm
         m04XBLoOvWL6tXaehr0D/kRZN5ZXqryro/qXH//kQ+ctjbBOr7MwO38hw88dpuQTcxlh
         EMXg==
X-Forwarded-Encrypted: i=1; AJvYcCUbO/S8rdPWX7P0CVjs3QeZGmPEED4lQc1Veif4PiaR5JohdOBA6/mxWrXDAySbig5cfVWOUFqJq25fAFRMmlZG@lists.infradead.org
X-Gm-Message-State: AOJu0YyP/+r58Zyud+QikOxQsKnjII5wMRP2+BMoJCXaI4onEvNK5HTI
	Z+xutyNrhIBD5eJmBYfDXfqP2uQSY8RpJXU9N5ysnTbAF6I3tvf9OGWV82et0WQ/6lREy27sIC+
	0LbKdEg08Dh1BWy1TwxmRDlAtBmOVnDqsZ2BHiRUgQ/dRhn+U5FB/BsLMfKVM8sI4zlad+V1GHS
	gzTOCKjBSrPHea
X-Gm-Gg: ASbGncvsMTwzksYrcsdVWphiaOb+qJ4mKhJ3Gx8DGHOp/eT4J2kqIbbQEKO2S5oaEPp
	F9dzz6UUwULmqPnX7fj2L4KOV65dGzw4Q5MptPXrPITNu9VtAS0i7Jf0vZ1ah/ud8Ye5AfK8CiW
	gAgEewlJhAetAzRy3kJJBuwd6TlEVnjRPAk11Cz2n9qCtcTuaqaytQ34qw7MsfnYBqha42QKwkU
	y8nKBFizdPSPRtku0FaqKpXsQBHxSGYLLGwgyEfkr57zoynjJho3SkLxTB938Nw3XyCFAmjw/Il
	ISxeYKYS7PrcQ8BB81KCtXqF66a9YS02JmS+40Xk2+FioRjp0Abj1BeM0XUcS6lpQBubo4e9Stn
	LQvezB5OEBBSnOuBvRse3N9Fh7mU9Kw==
X-Received: by 2002:a17:902:d4c4:b0:246:570:d7dc with SMTP id d9443c01a7336-248753a2586mr57319455ad.29.1756288336798;
        Wed, 27 Aug 2025 02:52:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEMqpv1EtUmfVYvvw4NyCrb2c6aBD9PYVzjyLEAVHsHsPqYt3z3ozhkmwEkYUHJOXvpnFt2iQ==
X-Received: by 2002:a17:902:d4c4:b0:246:570:d7dc with SMTP id d9443c01a7336-248753a2586mr57319045ad.29.1756288336077;
        Wed, 27 Aug 2025 02:52:16 -0700 (PDT)
Received: from [10.133.33.155] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32745900a2dsm2019828a91.4.2025.08.27.02.52.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Aug 2025 02:52:15 -0700 (PDT)
Message-ID: <2648f422-6bef-4336-bdda-2d1663bc2807@oss.qualcomm.com>
Date: Wed, 27 Aug 2025 17:52:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] coresight: tpda: add logic to configure TPDA_SYNCR
 register
To: James Clark <james.clark@linaro.org>, Jie Gan <jie.gan@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
References: <20250827042042.6786-1-jie.gan@oss.qualcomm.com>
 <20250827042042.6786-3-jie.gan@oss.qualcomm.com>
 <4ca657cf-1c8e-4d51-aba9-c894c32a23b3@linaro.org>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <4ca657cf-1c8e-4d51-aba9-c894c32a23b3@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 1u43iT2yXhSWELsEeP1Ug64NVKwRALOz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI2MDEyMCBTYWx0ZWRfX2faBj8mbJQVi
 mANwlWGGaMV+VdsiDa126S9BgDI2eMwOzj6ZGv/xxApl5dHVx5Cub06dKHj1pMg4fQV62BgKWS5
 mm9aJJDTURZVdzbx38ouos56kKTJFqMjJj09RYuxEz+NbDtm3j3k8rfRsGme0ZyErqf0h2FzGDe
 tDpHAZz4UjXMjnAbAr0VqrBvo7WkdzzhAbcIE4JR6PboPgC01XyhBqO7FfscSaV04x6z9t/6BHL
 RTSJLq2ch04VqBonYLSvOvQNcyEeC8SFRPHKFwV4XCAUCbfuDKDJl6g3o2x1E4f77yLG17kB/3a
 UezfotJMRwjmAy2LGjkhFFVpdx9UkPk3KgRIyKaKI62wHdJG2cXwQb5QpJhBc7UL2aKVVRsnbSr
 ac9VnKWz
X-Proofpoint-ORIG-GUID: 1u43iT2yXhSWELsEeP1Ug64NVKwRALOz
X-Authority-Analysis: v=2.4 cv=CNYqXQrD c=1 sm=1 tr=0 ts=68aed552 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=fCV0n7f5gNrMv1PFtk0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-27_01,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 adultscore=0 spamscore=0
 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508260120
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_025218_632075_1F9A48AE 
X-CRM114-Status: GOOD (  21.48  )
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



On 8/27/2025 5:21 PM, James Clark wrote:
> 
> 
> On 27/08/2025 5:20 am, Jie Gan wrote:
>> From: Tao Zhang <tao.zhang@oss.qualcomm.com>
>>
>> The TPDA_SYNCR register defines the frequency at which TPDA generates
>> ASYNC packets, enabling userspace tools to accurately parse each valid
>> packet.
>>
>> Signed-off-by: Tao Zhang <tao.zhang@oss.qualcomm.com>
>> Co-developed-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   drivers/hwtracing/coresight/coresight-tpda.c | 7 +++++++
>>   drivers/hwtracing/coresight/coresight-tpda.h | 6 ++++++
>>   2 files changed, 13 insertions(+)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/ 
>> hwtracing/coresight/coresight-tpda.c
>> index 647ab49a98d7..430f76c559f2 100644
>> --- a/drivers/hwtracing/coresight/coresight-tpda.c
>> +++ b/drivers/hwtracing/coresight/coresight-tpda.c
>> @@ -187,6 +187,13 @@ static void tpda_enable_pre_port(struct 
>> tpda_drvdata *drvdata)
>>        */
>>       if (drvdata->trig_flag_ts)
>>           writel_relaxed(0x0, drvdata->base + TPDA_FPID_CR);
>> +
>> +    /* Program the counter value for TPDA_SYNCR */
>> +    val = readl_relaxed(drvdata->base + TPDA_SYNCR);
>> +    /* Clear the mode */
>> +    val &= ~TPDA_SYNCR_MODE_CTRL;
>> +    val |= FIELD_PREP(TPDA_SYNCR_COUNTER_MASK, 
>> TPDA_SYNCR_MAX_COUNTER_VAL);
> 
> Just use the mask directly if you want to set all the bits. This makes 
> it seem like the MAX_COUNTER_VAL is something different.
> 

You are right. will fix it.

> val |= TPDA_SYNCR_COUNTER_MASK
> 
>> +    writel_relaxed(val, drvdata->base + TPDA_SYNCR);
>>   }
>>   static int tpda_enable_port(struct tpda_drvdata *drvdata, int port)
>> diff --git a/drivers/hwtracing/coresight/coresight-tpda.h b/drivers/ 
>> hwtracing/coresight/coresight-tpda.h
>> index 0be625fb52fd..8e1b66115ad1 100644
>> --- a/drivers/hwtracing/coresight/coresight-tpda.h
>> +++ b/drivers/hwtracing/coresight/coresight-tpda.h
>> @@ -9,6 +9,7 @@
>>   #define TPDA_CR            (0x000)
>>   #define TPDA_Pn_CR(n)        (0x004 + (n * 4))
>>   #define TPDA_FPID_CR        (0x084)
>> +#define TPDA_SYNCR        (0x08C)
>>   /* Cross trigger FREQ packets timestamp bit */
>>   #define TPDA_CR_FREQTS        BIT(2)
>> @@ -27,6 +28,11 @@
>>   #define TPDA_Pn_CR_CMBSIZE        GENMASK(7, 6)
>>   /* Aggregator port DSB data set element size bit */
>>   #define TPDA_Pn_CR_DSBSIZE        BIT(8)
>> +/* TPDA_SYNCR mode control bit */
>> +#define TPDA_SYNCR_MODE_CTRL        BIT(12)
>> +/* TPDA_SYNCR counter mask */
>> +#define TPDA_SYNCR_COUNTER_MASK        GENMASK(11, 0)
>> +#define TPDA_SYNCR_MAX_COUNTER_VAL    (0xFFF)
> 
> No need to define a numeric value that's the same as the mask. It also 
> opens the possibility of making a mistake.
> 

will remove.

Thanks,
Jie

>>   #define TPDA_MAX_INPORTS    32
> 
> 


