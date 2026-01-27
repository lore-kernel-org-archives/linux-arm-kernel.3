Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE733D25920
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 03:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QdW4mzL5aTNRFJ61i5C454TjCOALyCkxZNzJk0cSbXQ=; b=WXTfoejIX8IWn9Lrrg1c8+2Nsg
	rK6eOKrFB9iXadOYCF+/zUL+VQA8g3c8tpo9tS9iZSqLK7jZrH/E0urqYe6q8wwiBOLK0bUe2g+ob
	Pww8aX0Hj3SJv/FyI22QEMiSKFvKPb4dGOYJ4MVzjGRNWXha75v3qXlSsFm83UFcdWp6hw47q6SE7
	UxtJ4XK8OTifinxi06EjvwwbgdnLTpS1BCy84XVq5bTTeecLH+ldOSKFexLvMGjWq+YSTXmKtqfRz
	iDH5kjaAylgrq07xnXB3qVSa67EcKQCY03LYQji21P+gNLw3zNcgLI62IMNwNC4FtggXW9K/T+y41
	0b0Zaawg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkZMh-0000000DY01-3WXy;
	Tue, 27 Jan 2026 03:03:39 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkZMe-0000000DXyv-1j3l
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 03:03:37 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60QKgghP3481603
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 03:03:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QdW4mzL5aTNRFJ61i5C454TjCOALyCkxZNzJk0cSbXQ=; b=a8gc2ohDbTCBWL/y
	fb2amVhZMcgeDXLTtnY0wNOnIg1cBkWk4lwGvXsRi6tglaxj1BY03xKbVKEEdB7+
	4m1jyMzmjtRskH8hpQfyOWHHAQZJWNAPUq/BJyMtDU/uFgjVThnhjqq7DR4lI7wD
	bak8tqIjmDZk2UvM9Sof7A6lMLco+GtDaByVZsVVYweY34UZFwo6AqTNuAbJ3yD/
	UeqQTDZoFDuPg5AFOGRWkZx9y0kXtsvL21+ScGxB3TVJaOJaVmnYhdYbYNjqSOr/
	VT34RUtEgYxIRaBrcx7H+9aYnZzjh+dxgHRPbiaYM/x8EOQZeQrj90Gq62ocusDL
	0M21/A==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bx0v33fb3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 03:03:35 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c5269fcecdeso2715192a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 19:03:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769483015; x=1770087815; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QdW4mzL5aTNRFJ61i5C454TjCOALyCkxZNzJk0cSbXQ=;
        b=AFPmzlK80Al0HcGOrjHxXXIE7ghwWL6S912w1BTJEZxmbngofKYT6btrBqjYQAYOdH
         joBea2bjwJBKzmYDDaseK6Mii3iuawM/LYFKoQoC3lzai9IAKs7OJRYljp/idZb3KGd3
         KPN/gXn+KrdPJ1cneW3Cn/fEeTAkPjUdJl1v5X+6xn0ZFU1WY7+eRe+hW5vbjGff9HuA
         7dKOIE2UfAVeaFP1BkrOXf1gVIpssbTRaCDWMsB+BhIkY0ZIvfVNsiZRKivRFcn/CfqP
         o1YtZaAMCutrfvjhr8RE1qZrO3JBoKRwzraczPr3awZTu2uGE2LtB9vQjaAfnBRy+NKY
         HNWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769483015; x=1770087815;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QdW4mzL5aTNRFJ61i5C454TjCOALyCkxZNzJk0cSbXQ=;
        b=l7LPd+NRlsY6wgAPOOGHf4va8TXNW2iYTJ6X6jrZK8ZIgW47XSF50dEfUM7vZVWM9L
         GEFBMkGsbffNKQ0/hi9C5edfto566nvzWCMhfX12MWCuFCAlZccdFgFVQUpGVAf35tCz
         mSgnZjj5xkg+E603m6vPn0OYZN2JydE4zCw7Dt1gppVpMtGUIvaPEdCntXji9vkZFbga
         UogE3SfzV/zwXjvGfW/05nSEpuygRQw881nzen+unibQycQ86ZaVgOHVmldhfXIjj1qN
         +D7tUtafIFUsUhhrMHJq4KGMIpoJ/UihU7PWykC0I1oG4VyK4ybJ4ZmASKtw5gkz8O1i
         Xtsg==
X-Forwarded-Encrypted: i=1; AJvYcCXbFZGE4JkAl4mW4wRcXT0Nel5wo8z+Fu5SggOXIQsZaRk/sJEDTP+cO5ptCK73pGCdu9JEIon9xuGcGVzPIuR8@lists.infradead.org
X-Gm-Message-State: AOJu0YzD3znhFQP9M711qrwSOZzCdZ+qpG5sOOAmvUYrAlZcwQ3KW6C1
	Bcezoqn13t0409BDLcGBLzw91xH0vcQHuitpUG9eTUByixLXOSwG+yIO8oC9RFIPXpcEkVBhl8R
	XCteUCqAyU8U3skjm+Axgu1rbO/66axC/8tXw2LQ+2jHKW7Pd4/Jvs9z67H0kTqF6XDIZcMrJYu
	6Izg==
X-Gm-Gg: AZuq6aIov1SOommc9eCxfA+zCYLtBW4CFoVLHhP+GXb/LVmDhnAJyC5c3xqUDkQIUoh
	6INJL0Aw1qMF1KkwEiptT6zzTcrre7Yil2XTNFL+BbFqmktlZ8Pk8UOvIfTu2cPlVHc8ui+HpvB
	UVY2EUqbB7FfGcfe6RmK8mpYA3ZSNAWvmpSRCZK0EwbVVsf1l2/o9l4W8WfwLXjgEUzoQ1fVoct
	zNMnzj23XlT+4HGSjD7Y0x4BckW4JzJPAQlEUmeGbVLLVr/cxxI+9YoonD0+ohwcfjguA0fBUvn
	4fNIfwjOAfTeTf+cWfCai46BL8f7Ldv5LDXY7olGEYXYXs84/jh4Dr0sJpAUd3oUojIgpjMtVfq
	6W+CuXRD93F9S8k9zTkv7Y9v25tc2WZKID6fwCa0=
X-Received: by 2002:a05:6a21:1507:b0:350:2251:59f with SMTP id adf61e73a8af0-38ec63ea717mr112676637.38.1769483015062;
        Mon, 26 Jan 2026 19:03:35 -0800 (PST)
X-Received: by 2002:a05:6a21:1507:b0:350:2251:59f with SMTP id adf61e73a8af0-38ec63ea717mr112649637.38.1769483014576;
        Mon, 26 Jan 2026 19:03:34 -0800 (PST)
Received: from [10.239.133.242] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c635a425254sm9558200a12.29.2026.01.26.19.03.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 19:03:34 -0800 (PST)
Message-ID: <c142d3bc-5365-4eab-a613-8f2a06ee9788@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 11:02:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 6/7] qcom-tgu: Add timer/counter functionality for TGU
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, andersson@kernel.org,
        alexander.shishkin@linux.intel.com, mike.leach@linaro.org,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org, gregkh@linuxfoundation.org
References: <20260109021141.3778421-1-songwei.chai@oss.qualcomm.com>
 <20260109021141.3778421-7-songwei.chai@oss.qualcomm.com>
 <05637034-19f0-42cd-9352-3daf80ae4a1d@oss.qualcomm.com>
Content-Language: en-US
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
In-Reply-To: <05637034-19f0-42cd-9352-3daf80ae4a1d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDAyNCBTYWx0ZWRfX5LRVr1tUNEWR
 YLOEbgpguCwCKUGyDuk790FxPIyM1a2kc7KQ864Fu5a4BCCqfwDt3sfb/uqR22CBOd4F7QjJEpU
 EbeMZ0s7Hg8NxENbah6wyZI7o8p9RNXnlx0ecNzqTeMFmCWfG+u46alFsRq097IoEh3nBHm1vdE
 FJDMHLPwbOBSuMR4X4B/QXnrsTNzqETZKJ4DxzrrbJG9iVspeR+4VaCovXuOCjR09Jx4JWkNpmS
 sJNj1jzGmS4e7baa5iOxSta+JGMUXskjDJPQhZf17gIlHgeleXsveT+XPboxG0pgkw9UuZJgDOf
 yyf/0Bgopf7VDdFMwGiKIdgEdG/659p3djdxGMiIe5NQI4kvyhpix1LdFd10RpLOy5xIvfXaEfd
 EygudwSou6CUEWWJK2hbWva6xlwdFHtMajOfD7kzV6+eiv0Bdc3xYr2GX8dKsM1HClgdaig7jjR
 X1KKi2UiykvPNbwzAXQ==
X-Proofpoint-GUID: CNE8VqMyZRCqi_mB_P3huIvG-wMGV0py
X-Proofpoint-ORIG-GUID: CNE8VqMyZRCqi_mB_P3huIvG-wMGV0py
X-Authority-Analysis: v=2.4 cv=JYyxbEKV c=1 sm=1 tr=0 ts=69782b07 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=5nTtrOYU0cHVv66wLwoA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_01,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 phishscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270024
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_190336_463133_A3CC8841 
X-CRM114-Status: GOOD (  22.05  )
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



On 1/13/2026 7:19 PM, Konrad Dybcio wrote:
> On 1/9/26 3:11 AM, Songwei Chai wrote:
>> Add counter and timer node for each step which could be
>> programed if they are to be utilized in trigger event/sequence.
>>
>> Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +static void tgu_set_timer_counter(struct tgu_drvdata *drvdata)
>> +{
>> +	int num_timers, num_counters;
>> +	u32 devid2;
>> +
>> +	devid2 = readl(drvdata->base + CORESIGHT_DEVID2);
>> +
>> +	if (TGU_DEVID2_TIMER0(devid2) && TGU_DEVID2_TIMER1(devid2))
>> +		num_timers = 2;
>> +	else if (TGU_DEVID2_TIMER0(devid2) || TGU_DEVID2_TIMER1(devid2))
>> +		num_timers = 1;
>> +	else
>> +		num_timers = 0;
>> +
>> +	if (TGU_DEVID2_COUNTER0(devid2) && TGU_DEVID2_COUNTER1(devid2))
>> +		num_counters = 2;
>> +	else if (TGU_DEVID2_COUNTER0(devid2) || TGU_DEVID2_COUNTER1(devid2))
>> +		num_counters = 1;
>> +	else
>> +		num_counters = 0;
>> +
>> +	drvdata->max_timer = num_timers;
>> +	drvdata->max_counter = num_counters;
> 
> int num_timers = 0, num_counters = 0
> 
> if (TGU_DEVID2_TIMER0(devid2))
> 	num_timers++
> 
> if (TGU_DEVID2_TIMER1(devid2))
> 	num_timers++
> 
> etc.
> 
> unless you want to guard against a case where TIMER0 reports as absent
> and TIMER1 as present and you consider that invalid (I don't know)

Based on the current documentation and the hardware we have encountered
so far, this case - "TIMER1 present, TIMER0 absent" does not occur.

> 
> [...]
> 
>> +	timer_size = drvdata->max_step * drvdata->max_timer *
>> +		     sizeof(*(drvdata->value_table->timer));
>> +
>> +	timer = devm_kzalloc(dev, timer_size, GFP_KERNEL);
>> +
>> +	if (!timer)
> 
> stray \n
sure.
> 
>> +		return -ENOMEM;
>> +
>> +	drvdata->value_table->timer = timer;
>> +
>> +	counter_size = drvdata->max_step * drvdata->max_counter *
>> +		       sizeof(*(drvdata->value_table->counter));
>> +
>> +	counter = devm_kzalloc(dev, counter_size, GFP_KERNEL);
> 
> devm_kcalloc, perhaps?
Agreed. Using devm_kcalloc() makes the intent clearer and safer here
> 
>> +
>> +	if (!counter)
> 
> stray \n
sure.
> 
>> +		return -ENOMEM;
>> +
>> +	drvdata->value_table->counter = counter;
>> +
>>   	drvdata->enable = false;
>>   
>>   	pm_runtime_put(&adev->dev);
>> diff --git a/drivers/hwtracing/qcom/tgu.h b/drivers/hwtracing/qcom/tgu.h
>> index 8c92e88d7e2c..94708750b02d 100644
>> --- a/drivers/hwtracing/qcom/tgu.h
>> +++ b/drivers/hwtracing/qcom/tgu.h
>> @@ -11,11 +11,17 @@
>>   #define TGU_LAR		0xfb0
>>   #define TGU_UNLOCK_OFFSET	0xc5acce55
>>   #define TGU_DEVID	0xfc8
>> +#define CORESIGHT_DEVID2       0xfc0
>>   
>>   #define BMVAL(val, lsb, msb)	((val & GENMASK(msb, lsb)) >> lsb)
> 
> This is NIH FIELD_GET()
> 
ok, will try to use "FIELD_GET".
> [...]
> 
>>   static inline void TGU_LOCK(void __iomem *addr)
>> @@ -197,6 +247,8 @@ static inline void TGU_UNLOCK(void __iomem *addr)
>>    * @max_step: Maximum step size
>>    * @max_condition_decode: Maximum number of condition_decode
>>    * @max_condition_select: Maximum number of condition_select
>> + * @max_timer: Maximum number of timers
>> + * @max_counter: Maximum number of counters
>>    *
>>    * This structure defines the data associated with a TGU device,
>>    * including its base address, device pointers, clock, spinlock for
>> @@ -213,6 +265,8 @@ struct tgu_drvdata {
>>   	int max_step;
>>   	int max_condition_decode;
>>   	int max_condition_select;
>> +	int max_timer;
>> +	int max_counter;
> 
> num_timers, num_counters definitely fits better here
> 
uhh.. yeah.
> Konrad


