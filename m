Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DD5DCA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 09:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7PRqUbPyyCeb0D+drQmqPy+hroCqwBFq8MUVQmpsI88=; b=uaNGy3qKBZiTA7AXG3LdD437L9
	EKI5Bnkb1qIS9Zc0liJ0KzFLtAaJNUO+b/njMc0+T24VSWzHOxxdkIfK6Ze3wiL/FJns7/5L21lNc
	EvKf6d9B9JY5rzQr3YD5ylWmaqJuabpec9sFUt9AwpBhxqxQLynPGqxDg/Ect3lRr4Li3KYziQbun
	QBSkbq38dZD7UtO9WdmLXf4VVxAsV5sCCh5t/27VsV2FMqkXnxFf83mviXCGbjvV206ors8sHXLyw
	6LqSUxjAgMlO2y3Eq+KcxPVPYAxG+nghNNf0bkj3ex6racSvXdtlJusdSSQgJggX+/kVk9U+xNCgr
	fIyrLMGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqqFA-0000000BUA7-058f;
	Tue, 26 Aug 2025 09:45:32 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqq3r-0000000BQNI-0oCZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Aug 2025 09:33:52 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57Q8qE4C019674
	for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Aug 2025 09:33:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7PRqUbPyyCeb0D+drQmqPy+hroCqwBFq8MUVQmpsI88=; b=Op29AEhlNe32ev8n
	pP0Xo6Se44beRsXEF6g2AX2RDuWrPBHIybbgvraTAdpH1fMA9mclyNOm97gtnaBm
	+F+ZJ1tTcrwC76TDHeP6L4bjZJwogYr6L0IxRA5U2mLp+sQnWDo349vm+Znbn0UB
	lQU/xLmzWD+8IqWoo2qQpbNy2AncVVNoo4+YjJmj9abdDqdQg04+8QHet14qeKFd
	Bh5WO8ahS5fzfx/Fuq4dY5eO+jLGc0SXfeDzE1KBNwNhQ21ZhIE0a6oRmBeQhrJi
	N0rMqgIpoUjaZ8oPMgJZP/VxTjcUPWq4PxPJglRAT8fvw/Bh7xsCYYhKlr+WIOBQ
	5sKx9w==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5y5g43x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Aug 2025 09:33:50 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-771f28ed113so1129325b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Aug 2025 02:33:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756200829; x=1756805629;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7PRqUbPyyCeb0D+drQmqPy+hroCqwBFq8MUVQmpsI88=;
        b=s+OR+SmhjkiIFAw0vM/KLWovSRIT6U6YK2BT0l02zlpHOEiMOwfsdeCKMCULd6D9oG
         ARb1rFTa6ER6ZPAS25gEzBVc84v5pFhfNNvsAudomTuNBgd1LRU/mXQsZ2wSFdO+UZs3
         w4jiKYqoaBklqJP/NU36WXmQFHJ8s1MPKX4aNPd0bT1LPvxKEyvHpEkxw5vNXOR4bIWQ
         BvfYPr8+OoFXTZwZxXwLrKMkQMuRd/+WDJbHjdhw+2nAp4cGBY1ZFOfkwzMiGENJRq0M
         TmwjwQcqiTED/wW2xl5PXNWaakgow71Fz6fXcwMFi2qOBhxOxEG2e9z4+XhR5yzFHuhG
         Ox9g==
X-Forwarded-Encrypted: i=1; AJvYcCVOKtr5p+PT4al1ILShe/bHvwsR8CLDiXU1UAZahMSJW75sIHUh/2Yw59qR7Kg+4dajeUZuN05B1br349+S11wd@lists.infradead.org
X-Gm-Message-State: AOJu0YxdIMtA5TQQ8xdiZzRbOhAISgOUVWiVvYxRdnk3nC/MJJyXv0kF
	CeOe/xXYK2nIk/CzB4pPB8ysdaY8P5y/y4DcUes3lxRYZ2cTotRusy2DirrIqd9FxW7svNUpFjY
	UkDnFTLAGBI4J/VOmP4jBmVIg1dbU1HaKyPpq9Pj/+d1an0HEA2mBsdpubZ2MzwC9K5s/gaG8Mb
	ePQw==
X-Gm-Gg: ASbGnctxIIUtNRkBVcC4TuGI8XZexiM447NFPpxX4WnkZ+BOb4rbb1q8nCqK0nFllpH
	zim81z4j9u3DMjIz8D5qcYdi/S4mPcy44oua/0MYW79AAy6mIY+UpgM5e0uA0iw+mDwd+WAAkzM
	/lG6/99LJFybOXa57sPgzhO9lROh6SBW2ec5XxmA7L5NPFG9BT2Ndtlu0/3xl2di5BSIw6d/0PY
	6bJq/5Yojl2fw1MfubIG5yfhfemrKJ2gdcgo4cG0ueUkMYRGRBm7mZU4ikpS83AB4ZeJDcHgBXU
	8n5kKLrO3E9D6t8cFuZy1e3pU7Ma61Ek7YPplscNFc8d5mxLwFCi2cY0QtujpV2BnlopTt0Bofy
	+LAsVWN0run0WUkN9Ig==
X-Received: by 2002:a05:6a00:1953:b0:771:e4b0:4641 with SMTP id d2e1a72fcca58-771e4b04bbdmr7079025b3a.1.1756200828958;
        Tue, 26 Aug 2025 02:33:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEsBgxQWCd0jMdTxGmaxKcluUUwbnejxoC4///CnAcNcxNaawFjaqarQErR5g1XYtLdTugzLg==
X-Received: by 2002:a05:6a00:1953:b0:771:e4b0:4641 with SMTP id d2e1a72fcca58-771e4b04bbdmr7078981b3a.1.1756200828432;
        Tue, 26 Aug 2025 02:33:48 -0700 (PDT)
Received: from [10.133.33.155] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-771ee83092dsm3325259b3a.100.2025.08.26.02.33.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Aug 2025 02:33:48 -0700 (PDT)
Message-ID: <c78a157f-d8d8-4647-8a2b-4409489633db@oss.qualcomm.com>
Date: Tue, 26 Aug 2025 17:33:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] coresight: tpda: add function to configure
 TPDA_SYNCR register
To: James Clark <james.clark@linaro.org>, Jie Gan <jie.gan@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
References: <20250826070150.5603-1-jie.gan@oss.qualcomm.com>
 <20250826070150.5603-3-jie.gan@oss.qualcomm.com>
 <66cfff9c-e0ec-4171-b62d-80d6139c42f3@linaro.org>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <66cfff9c-e0ec-4171-b62d-80d6139c42f3@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX5+nrFXQY7q1c
 XmJ6ydl8KxsA7C3lBQilEHmTly1pqWDkyiwtIeAbaP4YQxkfFY6IMWCVgjKk8qHhL1dDXcFSG2T
 TMFdirki3aQ4dGCn2iDQKuWTHTIPfr2c7fr20sZXO86v/zJMiUVI1iWu72yNZ2q3CjajxKtZbCq
 OWmIZtEV3m8ieTToENde3xljKOA1gslElbURS4Uz1RCI/rsxgJVBfNi+ZJxfHYYGqscOeFgCLFh
 ceknYpoFtsymiIhfhQyiDp3j3+8xpc6mYEIhXfHDoNwCPxgLBq//ZNcyo0ThLWDOchbQZGyrQp/
 0RzU7CAGFdQwwsC0mMGg0A/0BhVWTs2zSf4o3DZWuIfHrJhvZkO9bjpdFfll/U30/RWUaSQSZYU
 QUCB/kOc
X-Authority-Analysis: v=2.4 cv=Lco86ifi c=1 sm=1 tr=0 ts=68ad7f7e cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=PWyc2w4wzOwSXG3kJUsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: YRElqobwrwZhj2XoEUzv1Yw4QfMhAKFz
X-Proofpoint-ORIG-GUID: YRElqobwrwZhj2XoEUzv1Yw4QfMhAKFz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0 spamscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_023351_358072_B3B26576 
X-CRM114-Status: GOOD (  28.24  )
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



On 8/26/2025 5:20 PM, James Clark wrote:
> 
> 
> On 26/08/2025 8:01 am, Jie Gan wrote:
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
>>   drivers/hwtracing/coresight/coresight-tpda.c | 15 +++++++++++++++
>>   drivers/hwtracing/coresight/coresight-tpda.h |  1 +
>>   2 files changed, 16 insertions(+)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/ 
>> hwtracing/coresight/coresight-tpda.c
>> index cc254d53b8ec..9e623732d1e7 100644
>> --- a/drivers/hwtracing/coresight/coresight-tpda.c
>> +++ b/drivers/hwtracing/coresight/coresight-tpda.c
>> @@ -189,6 +189,18 @@ static void tpda_enable_pre_port(struct 
>> tpda_drvdata *drvdata)
>>           writel_relaxed(0x0, drvdata->base + TPDA_FPID_CR);
>>   }
>> +static void tpda_enable_post_port(struct tpda_drvdata *drvdata)
>> +{
>> +    uint32_t val;
> 
> Minor nit: this is inconsistent with u32 used elsewhere in this file.

Will fix it in next version.

> 
>> +
>> +    val = readl_relaxed(drvdata->base + TPDA_SYNCR);
>> +    /* Clear the mode */
>> +    val = val & ~TPDA_MODE_CTRL;
> 
> &=

Will fix.

> 
>> +    /* Program the counter value */
>> +    val = val | 0xFFF;
> 
> |=

Will fix.

> 
> Defining a field would be a bit nicer here. Like:
> 
> val |= FIELD_PREP(TPDA_SYNCR_COUNTER, UINT32_MAX);

That's better, forgot to use the proper Macro. I will re-check all codes 
again to update all possible fixes.

> 
> Assuming you wanted to set all bits, and 0xFFF isn't some specific value.

Yes, this field has 12 bits and we prefer the max value to prevent to 
generate too many ASYNC packets. This field indicates a count value for 
number of bytes. Once the the count reaches the number, a ASYNC packet 
will be generated.

> 
>> +    writel_relaxed(val, drvdata->base + TPDA_SYNCR);
>> +}
>> +
>>   static int tpda_enable_port(struct tpda_drvdata *drvdata, int port)
>>   {
>>       u32 val;
>> @@ -227,6 +239,9 @@ static int __tpda_enable(struct tpda_drvdata 
>> *drvdata, int port)
>>           tpda_enable_pre_port(drvdata);
>>       ret = tpda_enable_port(drvdata, port);
>> +    if (!drvdata->csdev->refcnt)
>> +        tpda_enable_post_port(drvdata);
> 
> Any reason this can't be done on tpda_enable_pre_port()? It has the same 
> logic where it's only done once for the first port.
> 
> If it can't be done there you should add a comment saying why it must be 
> done after enabling the first port.

This register only affect the port which already be enabled. That's why 
we add it to enable_post_port. But as you mentioned, we can put the 
logic into enable_pre_port without side effect.

I think it's ok to move the logic to enable_pre_port to simply codes here.

Thanks,
Jie

> 
>> +
>>       CS_LOCK(drvdata->base);
>>       return ret;
>> diff --git a/drivers/hwtracing/coresight/coresight-tpda.h b/drivers/ 
>> hwtracing/coresight/coresight-tpda.h
>> index b651372d4c88..00d146960d81 100644
>> --- a/drivers/hwtracing/coresight/coresight-tpda.h
>> +++ b/drivers/hwtracing/coresight/coresight-tpda.h
>> @@ -9,6 +9,7 @@
>>   #define TPDA_CR            (0x000)
>>   #define TPDA_Pn_CR(n)        (0x004 + (n * 4))
>>   #define TPDA_FPID_CR        (0x084)
>> +#define TPDA_SYNCR        (0x08C)
>>   /* Cross trigger FREQ packets timestamp bit */
>>   #define TPDA_CR_FREQTS        BIT(2)
> 
> 


