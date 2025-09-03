Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77E51CA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 10:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m8WRXDLSRnC8XRPAbQ2iesTlZT33OnNC5zDDlBuSNGI=; b=ID80nvhcsBAggpUT7X/uBItVV4
	lPYqbAGlShZLyoke/55s0pU9zbO0bO9dC2A5YkY9PpuUQerC9jfkuWoDXDQ8ng3qZTJbIUjc7Wpv7
	112Y6D2VViPiS4A+/Icgp+BNlm3B2NLhBfdTRQhAZkgNS8Nhy8/GXW+1Jx3M71ZC2xDjZxKmV7bOW
	DJBLQd0DNdNhft3/d8ipbL4lnNV9RoR1XRtaoXsEyKHrreBBm+9sRzIvNe8QLQV6i15+mlwZeNuCA
	4fHHUpMN9ekw/dBmzLXsBP3Hg5hmPToBRThcIBPcOxoLKnxBd/kATjpkLlRCCwofrdkaVCsNawbqo
	XXjqARVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utkvr-000000067iG-3SWN;
	Wed, 03 Sep 2025 10:41:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utk3B-00000005yAP-1Wte
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 09:45:10 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5839bDap026033
	for <linux-arm-kernel@lists.infradead.org>; Wed, 3 Sep 2025 09:45:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m8WRXDLSRnC8XRPAbQ2iesTlZT33OnNC5zDDlBuSNGI=; b=PjbaNc07VLQWPeew
	KfcHi80Y+0EX57nMpBmXgS9/I2NIN0F8iRzvE4GD89CBguJys9SeHUOmTD6n9Xn7
	wgTeGrw/6pyGiSQ71Xb8udoE4PwTzERaBXhAmCSNCQrYD6vrwfmk0dsw5UcPGwbr
	P7xV34myPe0FLGnk1wlydipkRJl55SHSdr2P8U0kC2Pg1nEDjutyTnF+w+txpis3
	zbl3IkXeXUr9jHLnh5x4G2nelojxg5C4z6euavCvgZFKQNhcg5koP8lCxTHcXUYW
	nNWCgtYw9fzla2JX8mXgSsPw83zlES0D0aTsAhmHjmR3vMWvvlm6CW39VMKGhpfd
	BWL+sA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uscv368t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Sep 2025 09:45:07 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b4d48818a04so4005747a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Sep 2025 02:45:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756892706; x=1757497506;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m8WRXDLSRnC8XRPAbQ2iesTlZT33OnNC5zDDlBuSNGI=;
        b=R9qRHaV+gcjj2v4jYdhPhvWxIIAM5pvgM/Kq16/BIwsQYpWDLiSd07Yd6M1dcw7XeF
         t+9T3ttazjoGP8sHIiZIZKAjpXj/4L8FWo1zl4s0CpdCTpcdtjtfMmsl2q4YOFywru+J
         3fQYTefmMPCjHPGnEF+29qbC19lY7XC+2fdD/DbL+YxY6+CKJ+YQJyTScwTIau7VuMH5
         Tj93IbfYyStpMMVrxo05PSz9karGktRdlUbycuoAQUfDscgkAO7Axn4GaHYSLvYydiPW
         ueArgGQmPERcGWArD8/MVWHOHd2z1A1B9IKszJjdKOJ0yJu/asNXIdwD2Ur6jyEvJ0ew
         VsIA==
X-Forwarded-Encrypted: i=1; AJvYcCVDOeNF3b6R0bBbXmlnDGM04QLxhlzXK0NHlCCNqj1a7lg7Ec7n67MrFB31gigg5KUpVhpdvkkqifb26IZJqDTl@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9JHLSZEc9LDMBw80T8CauuzsUvKcjk/pEyNebTbfU8BOAJWCI
	JeFM8w7E3JPGZu4JaIAt2RmNfl4VKwPpEiSN1ZzZEyK+Jfq/Ixw7Opi0JR66xqD5vYt359BrLba
	Gc9aJyrIRst3W7cSLvuU9kanLbcm/Qs+UNxes5MXGgYAqFgD038wqOM2rO+9hJuLPRlFoCEMWzG
	0Fbg==
X-Gm-Gg: ASbGncu71+h5g6DmYajlso5ajXUzsLlCT4UF9cGeVs+PdB3MADzYMM9iUmNFWEDbkrx
	Xf7c0fMfSNvfQkMokGzAzyuiEYySTINg0+f5ymS6KcaM+lDy5lj0WkhODvDJ/5V2bgb3WlYaWIQ
	z1vlZO74M2XaIW5exZ+o6wnpMLfZF/WAIGnpmCEGzryy+BaToHB4alSVXHzoyBfSla7mynHMkCM
	79ueY2fjhOFo7Fn4St1Y1JCSwRrHPaGdwsaG8YC1FSemuUEDd9L6Cefd5ZBIA/VSGY3+usUZaO2
	7YXkbRaVBAW75he/0OnMH5s6OVVaZqgM32rqXRA8lsg1eDsgP4WDty1+8RWVQOykvtkvBAuJETt
	0bQ91gcZDr3KQalMANaJfeO2L/yC4
X-Received: by 2002:a05:6a20:b925:b0:245:fdeb:d26b with SMTP id adf61e73a8af0-245fdebd5dfmr5431186637.15.1756892706123;
        Wed, 03 Sep 2025 02:45:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGhlCR8GZ69GjRWnu7qYDF0wGBonOzAihcPkBljNIdZqZmqvkKzLdcmu02p66LMVveec+jfhQ==
X-Received: by 2002:a05:6a20:b925:b0:245:fdeb:d26b with SMTP id adf61e73a8af0-245fdebd5dfmr5431151637.15.1756892705626;
        Wed, 03 Sep 2025 02:45:05 -0700 (PDT)
Received: from [10.133.33.16] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7723f4858e6sm12597072b3a.4.2025.09.03.02.45.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 02:45:05 -0700 (PDT)
Message-ID: <a4382db3-115a-4d79-924a-08507e6e7b3e@oss.qualcomm.com>
Date: Wed, 3 Sep 2025 17:45:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] coresight: tpda: fix the logic to setup the element
 size
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>, Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tao Zhang <quic_taozha@quicinc.com>,
        Mao Jinlong <quic_jinlmao@quicinc.com>
Cc: tingwei.zhang@oss.qualcomm.com, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20250806080931.14322-1-jie.gan@oss.qualcomm.com>
 <2f243b22-d8d3-4352-b226-aaf9ccfe825b@arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <2f243b22-d8d3-4352-b226-aaf9ccfe825b@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMSBTYWx0ZWRfX05yfDl69eank
 raFFB2htueEXLt6aanGutKsQGOnunDjDGI8kNjVWrcKK/fnk5iLIhwwrkLpV7BxH2w1lcvSy38h
 +tR7nyLl4pTxW8Y+DI99cXxYifEIbpnd6N/96zwcD92FG/XWTLQtV8VMbC+6SArMTvjUs8U/pWe
 rupYz3ZAW8U9yLP+NmWAvk3lUo5YSxjXwQpeTojNdEv3D+HtYZ+0Lslf8DA/KqdjR6te+XVXvFQ
 PSCOOF9er0BEsBGbXdcM8OYX2XI6ow5AQ9udwZzQE2sLecciQ/JGEFkVl2SbZgPYcZJoeZ36aQx
 SEjdCL2BCiv6e2EOv8zV7FTHPyS9DeSYh7th1MbJfxOz5zqCDFyYsuI5SvGfUKEPOzvt7+Xojw/
 EygAL7g8
X-Authority-Analysis: v=2.4 cv=A8xsP7WG c=1 sm=1 tr=0 ts=68b80e23 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=pGLniPwaoQ1pyRlj9UEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: mVUxhnccl_lLLO37QH_sRf5gH_zpX96E
X-Proofpoint-GUID: mVUxhnccl_lLLO37QH_sRf5gH_zpX96E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_05,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_024509_528095_107B424C 
X-CRM114-Status: GOOD (  25.20  )
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



On 9/3/2025 4:57 PM, Suzuki K Poulose wrote:
> On 06/08/2025 09:09, Jie Gan wrote:
>> Some TPDM devices support both CMB and DSB datasets, requiring
>> the system to enable the port with both corresponding element sizes.
>>
>> Currently, the logic treats tpdm_read_element_size as successful if
>> the CMB element size is retrieved correctly, regardless of whether
>> the DSB element size is obtained. This behavior causes issues
>> when parsing data from TPDM devices that depend on both element sizes.
>>
>> To address this, the function should explicitly fail if the DSB
>> element size cannot be read correctly.
> 
> But what is the device only has CMB ? Back when this was originally 

We have CMB TPDM, DSB TPDM and CMB&&DSB TPDM.

> merged, we raised this question and the answer was, "Only one is 
> supported, not both." But this sounds like that is wrong.

I think we may not answer the previous question clearly. But it 
definitely has issue here.

> Could we defer the "Warning" to the caller. i.e., Let the caller
> figure out the if the DSB size is found and predicate that on the
> DSB support on the TPDM.

Understood, below codes will be added in the caller to check the error:
if ((tpdm_data->dsb && !drvdata->dsb_esize) ||
     (tpdm_data->cmb && !drvdata->cmb_esize))
	goto err;

Thanks,
Jie

> 
> Suzuki
> 
>>
>> Fixes: e6d7f5252f73 ("coresight-tpda: Add support to configure CMB 
>> element")
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   drivers/hwtracing/coresight/coresight-tpda.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/ 
>> hwtracing/coresight/coresight-tpda.c
>> index 0633f04beb24..333b3cb23685 100644
>> --- a/drivers/hwtracing/coresight/coresight-tpda.c
>> +++ b/drivers/hwtracing/coresight/coresight-tpda.c
>> @@ -71,6 +71,8 @@ static int tpdm_read_element_size(struct 
>> tpda_drvdata *drvdata,
>>       if (tpdm_data->dsb) {
>>           rc = fwnode_property_read_u32(dev_fwnode(csdev->dev.parent),
>>                   "qcom,dsb-element-bits", &drvdata->dsb_esize);
>> +        if (rc)
>> +            goto out;
>>       }
>>       if (tpdm_data->cmb) {
>> @@ -78,6 +80,7 @@ static int tpdm_read_element_size(struct 
>> tpda_drvdata *drvdata,
>>                   "qcom,cmb-element-bits", &drvdata->cmb_esize);
>>       }
>> +out:
>>       if (rc)
>>           dev_warn_once(&csdev->dev,
>>               "Failed to read TPDM Element size: %d\n", rc);
> 
> 


