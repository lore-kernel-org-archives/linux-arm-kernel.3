Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D54DCA0FF7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 11:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+HdTnP5QHwQGCOtYD2hb1Prc2QDYDtKqL2msgNtal+s=; b=mFwyiQXGUr63LKjUiYazsI4W9W
	e+zOwaHedj66LJ+VXQXV2rS2iWZUfsXdPcf45auJFlKc5kMXqUJXpbtogv3Vt0n90bowZ/Tq6sqVM
	XlKZgujfoJoBrw717utdQaYqS1O7FG2koGlKUAvxuQf8ZQrDM8oyRbMTZOcK45PbVzAgkte1a9Muk
	j9JiD4TCXoZN9Bup7AsTv2MpDEWC83kv9KDdfyD4skqZqSopKXGZgn+NYbZgN3eAENnmgmzONI8hg
	6pMRiNfGxi8/PvijHd0TY4nFB0jqe+I7Fru7zJ3oco/gtpJCM5sBYyl8czYYNQNX7M9+qof6oKCOh
	8eqBz7rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urE04-0000000FARf-3mbq;
	Wed, 27 Aug 2025 11:07:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urClp-0000000EulM-1s73
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 09:48:46 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57R6kJ3A029188
	for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Aug 2025 09:48:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+HdTnP5QHwQGCOtYD2hb1Prc2QDYDtKqL2msgNtal+s=; b=gp6Gog+sVWMDkmwu
	bXT9zIDGoaehq+DQOlI6ElG1Ny6cu5HwsHSolaqpsS29nqRo/KTJDIdd20f3AfFH
	nT3lesr629vYxdVUl2kvMBhqIvXJBlDUvy4arpk0P+kxij19s4kb4QuA0uuC2JnW
	hzvVHI1XvsKjQyIs5djn/hB1QNEOg5SSwVoEan7O6o6wRgjEZtFHnVftHdJgNY5x
	B6c5UgJXbvFrmjCynLjkgFQYUUvhJTuZAsmny5uJ8utS514Ndp50R4/tiDKkSrAS
	Hcigk0BW05A/caTbSnQgJjiCVdJOzdS7ThydWgpb3VQxN6V35w5ZLd0B/5FDVsdu
	DG3iSA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5umcbbk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Aug 2025 09:48:43 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2464dc09769so112672895ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Aug 2025 02:48:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756288123; x=1756892923;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+HdTnP5QHwQGCOtYD2hb1Prc2QDYDtKqL2msgNtal+s=;
        b=EAiH1xaWgMRPRfqVfaWYtUcPlnd2wRnyJyCeVH/x0TCRIDaemP15w/4LbdpD/qAn8E
         K/oyW/u68706M2SuewMCZWuaXT8n84fDJT0TDXa7q/iwqcY3+d0efGNv2snROR8Y5vfa
         6yAzMM9F929vetGNQ7GUmvPOuki6eaVuMJAV8hERDMajCenm3Kbm5u+ptMH10TCL4srA
         j2DiPFB9xvnbxXxfsXeHEqanQN00ClZwq4wYSD8sx5s8DfkL7owkEYYx129q/2jCXj1h
         nsPdEmbFa/WjU+XTLJmVzdDqm5qgQpvMDI/R9OvJbUdGEv7nF+cP5uNHNZm0K33qT209
         LJXg==
X-Forwarded-Encrypted: i=1; AJvYcCXj6SOmnc89OPaVYy4FBNtXWA9gS7in2Pnc3K0zUxY6FIMGFDh0icm8vvjo07dXF7PbqyLpLXYMXUeZ/pY6dLlN@lists.infradead.org
X-Gm-Message-State: AOJu0YwZ1TLmDXL+YNRVhQ2XJ/7rdazugWRSvG7NakB22KPu8HOnIQxs
	DIk0L11ROGsq9NlY2Q/8iuHMGVnfV+CVGwPJzSRHX/gQXZIz2iYb0ynQhI24Q/37leIsTDq162d
	MrVrNvGK1GQaRmLO9QKTReSYlCc0SgqM+/QkWP7YiGB4A1vcDNY+cL+engFGxcL3nUDoGFc9BIt
	dcgw==
X-Gm-Gg: ASbGncvc4vTUTwbDNjk8LgIVfssfVSstl1P+9QVytUbGmamaQ4ql1zcBnTYdRcl7jrz
	HGA9U0JsN1HGrIw1G+wW1a/0sbTs0jRVYsYHZHR0tCDp/58CqSMBHR27k9nOYlpl/cP5mWffoC8
	fNTS+2ss430eSPpwJv7lIsQ8pXwkL6M1C9JRpXTsCvTfZogN7vlm/14bPGODSavIE8FKbR/Wl1y
	fyaTDH0D0skKDn7ftLfBZYQDaNRFfesZ1GdLMKYpVw6rSu3z33eRble5TTHcGC7LgwoybepAh5v
	Vi4tIVfYIb7mbK48s7dO3059S8vrjnDjfrAIWO6Mh+dRJ70LEl/HBUzc+4bAB8wTwkzUh156PcZ
	bfbAfj1vV3+TRLWXSFHLaR3csysMBvA==
X-Received: by 2002:a17:903:1b43:b0:242:cf0b:66cd with SMTP id d9443c01a7336-2462ef409a0mr239136595ad.34.1756288122742;
        Wed, 27 Aug 2025 02:48:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEdYfLujcpHIuYuPpdbaf+LeMGQ3BjzTtQgLFI4UMOmo6EcN71ZQccOEPzQ+NRJaIY2fr/phw==
X-Received: by 2002:a17:903:1b43:b0:242:cf0b:66cd with SMTP id d9443c01a7336-2462ef409a0mr239136295ad.34.1756288122123;
        Wed, 27 Aug 2025 02:48:42 -0700 (PDT)
Received: from [10.133.33.155] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2488bc5b32esm22486785ad.82.2025.08.27.02.48.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Aug 2025 02:48:41 -0700 (PDT)
Message-ID: <78d2ab99-f304-4fab-bc7b-859c8aa781d6@oss.qualcomm.com>
Date: Wed, 27 Aug 2025 17:48:33 +0800
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
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <b1f79a26-97e1-40f4-b076-51d5c2abe736@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=VtIjA/2n c=1 sm=1 tr=0 ts=68aed47b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=DHl-jJOTjm6sWMnFDpYA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMiBTYWx0ZWRfX3/+1zIhR4xPv
 PRmXghnviL+RuFHz4UCrF5f6etn87alZ83bYULGlztjf4OzkWyr37+h7DH2gjekjGHdxU8A5ofj
 IULw12wT2Mboix2bRicnuYDaoMVn+W4RYrpR8k+JQ3fec/vbqVSHUnEpBvijOKGv+A19/c55uBH
 ziq7o5QUWywLwJmCtfDyAN0jPCZtZOKJvuhN+OqmF0z9Of8hHyXi/jFzPNfAqEwLnv6YNxr78DF
 F0+7yzPirW0bFkogFWR3Tqf8nYQP2suYO6cSfi2Hc/MkZDH0x00tSQIDFZ4OEkrZViF6UwkViEm
 daUBHFoCB5jOZeNNWciuBUwrREWSspy87ZD9ziGFbkcWTvjq1OQ31lT3qbzIX5nMygvA8XAPWBn
 /SE8VmpE
X-Proofpoint-GUID: wdo07jEeSss6sLixkST6TP4QqawuIsuq
X-Proofpoint-ORIG-GUID: wdo07jEeSss6sLixkST6TP4QqawuIsuq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-27_01,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_024845_489812_9623CB1A 
X-CRM114-Status: GOOD (  27.17  )
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



On 8/27/2025 5:17 PM, James Clark wrote:
> 
> 
> On 27/08/2025 5:20 am, Jie Gan wrote:
>> From: Tao Zhang <tao.zhang@oss.qualcomm.com>
>>
>> Setting bit i in the TPDA_FLUSH_CR register initiates a flush request
>> for port i, forcing the data to synchronize and be transmitted to the
>> sink device.
>>
>> Signed-off-by: Tao Zhang <tao.zhang@oss.qualcomm.com>
>> Co-developed-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   .../testing/sysfs-bus-coresight-devices-tpda  |  7 ++++
>>   drivers/hwtracing/coresight/coresight-tpda.c  | 42 +++++++++++++++++++
>>   drivers/hwtracing/coresight/coresight-tpda.h  |  2 +
>>   3 files changed, 51 insertions(+)
>>
>> diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices- 
>> tpda b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
>> index fb651aebeb31..2cf2dcfc13c8 100644
>> --- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
>> +++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
>> @@ -41,3 +41,10 @@ Contact:    Jinlong Mao 
>> <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qu
>>   Description:
>>           (RW) Configure the CMB/MCMB channel mode for all enabled ports.
>>           Value 0 means raw channel mapping mode. Value 1 means 
>> channel pair marking mode.
>> +
>> +What:        /sys/bus/coresight/devices/<tpda-name>/port_flush_req
>> +Date:        August 2025
>> +KernelVersion:    6.17
>> +Contact:    Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang 
>> <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
>> +Description:
>> +        (RW) Configure the bit i to requests a flush operation of 
>> port i on the TPDA.
>> diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/ 
>> hwtracing/coresight/coresight-tpda.c
>> index 430f76c559f2..8b1fe128881d 100644
>> --- a/drivers/hwtracing/coresight/coresight-tpda.c
>> +++ b/drivers/hwtracing/coresight/coresight-tpda.c
>> @@ -487,6 +487,47 @@ static ssize_t cmbchan_mode_store(struct device 
>> *dev,
>>   }
>>   static DEVICE_ATTR_RW(cmbchan_mode);
>> +static ssize_t port_flush_req_show(struct device *dev,
>> +                   struct device_attribute *attr,
>> +                   char *buf)
>> +{
>> +    struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
>> +    unsigned long val;
>> +
>> +    if (!drvdata->csdev->refcnt)
>> +        return -EINVAL;
>> +
>> +    guard(spinlock)(&drvdata->spinlock);
>> +    CS_UNLOCK(drvdata->base);
>> +    val = readl_relaxed(drvdata->base + TPDA_FLUSH_CR);
>> +    CS_LOCK(drvdata->base);
>> +    return sysfs_emit(buf, "%lx\n", val);
> 
> Still missing the 0x prefix

Will re-check rest of the codes and add prefix. Sorry I missed it during 
the review process.

> 
>> +}
>> +
>> +static ssize_t port_flush_req_store(struct device *dev,
>> +                    struct device_attribute *attr,
>> +                    const char *buf,
>> +                    size_t size)
>> +{
>> +    struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
>> +    unsigned long val;
>> +
>> +    if (kstrtoul(buf, 0, &val))
>> +        return -EINVAL;
>> +
>> +    if (!drvdata->csdev->refcnt || !val)
>> +        return -EINVAL;
>> +
>> +    val |= FIELD_PREP(TPDA_MAX_INPORTS_MASK, val);
> 
> Using FIELD_PREP() now that it's the full width of the register makes 
> less sense. Especially when there is no corresponding FIELD_FIT() check, 
>   which is fine because everything always fits. But if you didn't know 
> the mask was the full width you'd wonder if the check is missing.
> 
> I would just write val directly to TPDA_FLUSH_CR so it's simpler.
> 
> It should also have been val = FIELD_PREP(...)

Yeah, it should have been val = FIELD_PREP(...) here... sorry for the 
mistake here..

I was thinking the unsigned long here could be 64 or 32 bits and we only 
need the value of the lower 32 bits. So that's why I am using val = 
FIELD_PREP(...) here. We shouldn't write a value greater than UINT32_MAX 
to the register.

Thanks,
Jie

> 
>> +    guard(spinlock)(&drvdata->spinlock);
>> +    CS_UNLOCK(drvdata->base);
>> +    writel_relaxed(val, drvdata->base + TPDA_FLUSH_CR);
>> +    CS_LOCK(drvdata->base);
>> +
>> +    return size;
>> +}
>> +static DEVICE_ATTR_RW(port_flush_req);
>> +
>>   static struct attribute *tpda_attrs[] = {
>>       &dev_attr_trig_async_enable.attr,
>>       &dev_attr_trig_flag_ts_enable.attr,
>> @@ -494,6 +535,7 @@ static struct attribute *tpda_attrs[] = {
>>       &dev_attr_freq_ts_enable.attr,
>>       &dev_attr_global_flush_req.attr,
>>       &dev_attr_cmbchan_mode.attr,
>> +    &dev_attr_port_flush_req.attr,
>>       NULL,
>>   };
>> diff --git a/drivers/hwtracing/coresight/coresight-tpda.h b/drivers/ 
>> hwtracing/coresight/coresight-tpda.h
>> index 8e1b66115ad1..56d3ad293e46 100644
>> --- a/drivers/hwtracing/coresight/coresight-tpda.h
>> +++ b/drivers/hwtracing/coresight/coresight-tpda.h
>> @@ -10,6 +10,7 @@
>>   #define TPDA_Pn_CR(n)        (0x004 + (n * 4))
>>   #define TPDA_FPID_CR        (0x084)
>>   #define TPDA_SYNCR        (0x08C)
>> +#define TPDA_FLUSH_CR        (0x090)
>>   /* Cross trigger FREQ packets timestamp bit */
>>   #define TPDA_CR_FREQTS        BIT(2)
>> @@ -35,6 +36,7 @@
>>   #define TPDA_SYNCR_MAX_COUNTER_VAL    (0xFFF)
>>   #define TPDA_MAX_INPORTS    32
>> +#define TPDA_MAX_INPORTS_MASK    GENMASK(31, 0)
>>   /* Bits 6 ~ 12 is for atid value */
>>   #define TPDA_CR_ATID        GENMASK(12, 6)
> 
> 


