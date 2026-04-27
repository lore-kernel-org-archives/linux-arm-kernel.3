Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C922FF8850
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 02:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FPeIfTmza3TkEQ+5+qK0Mp7F66iEi5NlhgKX+eZpa7k=; b=XH7ajZZMDc5BWXRPJwZw65kHHO
	rAS8sk/NqzViopvfPHxXbkOQRCpGkwUMFxCW1wXJ1B1lLVpI3qtQjVhMe1Cp5c8wtkiUD7yIDJXjX
	WS1pCCNZZx8R1nQdGAXnykD8DTCUnHBkDhcqzgMg5w8Df/Xr7vNnd3ZroJ9KTedanionZcGyGfZWz
	FnWU/VltKNGD1w5VelzSyTnVh06VWSk2TSh6J8BZhSrDLUn2sDklWwmO5JYgk5DNwcCLcHNfnWdyb
	6oQPfzid3CUqomGtauJBgILAKD8ISa09BUC1oBnrJV77AXH+oV+EHS2yijHYrWI7RfYzF+6hMKX89
	/73KFkFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHC0I-0000000G4nv-3d1Z;
	Mon, 27 Apr 2026 02:47:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHC0F-0000000G4nY-3obG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 02:47:21 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63QJ0Hkj1212908
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 02:47:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FPeIfTmza3TkEQ+5+qK0Mp7F66iEi5NlhgKX+eZpa7k=; b=iy6anzSaFEqcA687
	5GPhDkbxq3zlL/kXnzLbqep6zFWnvajtNpfsDE70PFPIkYWxGX77XS8JOh9RGeVG
	HDvAiFR/Xzx1W87LiSAlBlXkvkIfVJAsPc+HA5Lyco4NgaUiMxQLB30ZWp6VtPqS
	xtfh+0HcuZ/TGkSfGKj0fU3VGk1C85xe8A7wqugWpSJVd8iU8kxtoVwaWaaZ8qs7
	rp4r7Em4iihiwT6lMhLEVlDz+G1xKH8TSRpby1Nh3DTa/nWCw7ND2jv36Twyub5R
	bzNMcdW1x8HOomDc06ArqMix5VSAB6Mbb5UhP78HMEqC/j0XHv07uyYTcY0bYIyt
	/SKj2g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnnf4347-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 02:47:18 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b24cd2e2b3so88032555ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Apr 2026 19:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777258037; x=1777862837; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FPeIfTmza3TkEQ+5+qK0Mp7F66iEi5NlhgKX+eZpa7k=;
        b=J0aD45I25z5SqpEsXJ+IdnQX6wAZdSoj7VF3gJi5B5HtK4pmagFHyOfVQ+SZAC4jZC
         jig5aeSw8j0UBh5Cl8w7ENIIgr0QBFEeB8yN+6+fLV7fQnEEX4G1D71vSV424YzdL3nv
         WmVVTiC46YMLDJLvl15RKyInA0sUu74uIcGkTz6Ihc7qqjHL9Dsoka160eVlrNxcb1P1
         3CXPlcU+FsDlbc2e+8DpslVrf1wCqx5dUvZlsdDY0n7E6Ogkh/W0PGWqZE+EwW+lGX7s
         umkgUss13zkmUC9ZHYGkxNQAjsEkcOczqDBiP4a8iJ/baNWjwFs4B8vKOmdBhGbQm2Wa
         Virg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777258037; x=1777862837;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FPeIfTmza3TkEQ+5+qK0Mp7F66iEi5NlhgKX+eZpa7k=;
        b=PHQPdYHaX92lJ6lBSg5jFEQDJ723/aUF2PwUHsPuj9UvgE6ByOkTzDfPblxeUDyjbb
         OlqLKVMtz0obTygM/P1FkQ/7KMkEX5fefO4ArexibQ/7BqejbBh4wharf5jzN5XexL/Q
         rSj5Xa+OYAcR2d853f/Sia2KiYlx4Jj8r7A8yKRLGpzNfzSyJRn/glaedDTAHt+JR8eY
         LAgROnLSZP+kz07UsRy6zTL+i2LLMOtdekGqUTG+s+eQs+BLDJj2fujHW1xbv/9sFt3I
         QI6lbEG05p9SIItAOm0+tVPSOqKs2NuzizOBnrxOnUgXlEZthI5KwhHXbzb9f5fMHq6X
         Y15A==
X-Forwarded-Encrypted: i=1; AFNElJ9bqO3BDD+EoBEfV4jnlUINu7jxJxY0My+MQZQVE8pVT/g9BPOeTnOYn1ngBq1dVkmpSZfgpth1Y54Jo30vyPDt@lists.infradead.org
X-Gm-Message-State: AOJu0Yxy3T+JOT40fy2PNOWVJGJXoEUXs5ZqmgYDGXKX2v0Qp0XgZGe0
	keoP8o/x0VFGLom+Jva9FaDbgumgHjTalWZYWADPMFlP++ruSKvgUM4dXHfeq1EaOQCJYT3J0Lv
	2BuNrOC98q7dakmZtT5rH+JAKbaKdr8Oy2cFCxIxAZTyaB5ROM1NBjZmZTKzPL7PliSKYIDnY9z
	A4iw==
X-Gm-Gg: AeBDies7uPjpUtuuG+QOzzi2ybCbqDj8vby2RwjBGOU6eCqB/zeSPYjhhVjyRSsyNRe
	m/HbVFKk9ePiBC2QZzDIqTURZSxPH5lDQE/NGUZurSEJl+N5F9/tOOHTzeOKCglkVNrpSEATEnp
	nqEEcNwOb3BvCNn4WkKUejY3Y8BTNCsQrRUnnWVCZLa3qhjrHfGlybyIYARO4TiavrOtEv/HVjB
	blldbNNBWHuxL83AJXO5lvsE/r/9l+Y4FbPPJ8PHgpPRpQ84+6vn+rJ+a2oUxxuBf5coxJu1IOl
	iCyknabL1MpGzKyKZiEhy5SNmuZxwmw9O7KsnBaOmqR5FkDswz4rLuTo7ultQAMGP1BEqXwCDqM
	4v80Hc+XiiBygg287YidO1bT2foRkRSrzE+BwQYJWRfvxCHmqDm40Akm2ui7FjfcRYPIIQ5z0D5
	KgcMm1kEP5RcY4Df16WU4v
X-Received: by 2002:a17:902:bf4a:b0:2b2:4e5c:69a9 with SMTP id d9443c01a7336-2b5f9e79fa8mr309628215ad.5.1777258037420;
        Sun, 26 Apr 2026 19:47:17 -0700 (PDT)
X-Received: by 2002:a17:902:bf4a:b0:2b2:4e5c:69a9 with SMTP id d9443c01a7336-2b5f9e79fa8mr309627945ad.5.1777258036840;
        Sun, 26 Apr 2026 19:47:16 -0700 (PDT)
Received: from [10.133.33.62] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fa9ff98csm289078485ad.3.2026.04.26.19.47.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Apr 2026 19:47:16 -0700 (PDT)
Message-ID: <34022672-c7ed-4ddc-9bde-9e0bf3eb5105@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 10:47:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/4] coresight: cti: Convert trigger usage fields to
 dynamic bitmaps and arrays
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Yingchao Deng <yingchao.deng@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        quic_yingdeng@quicinc.com, Jinlong Mao <jinlong.mao@oss.qualcomm.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
References: <20260426-extended-cti-v8-0-23b900a4902f@oss.qualcomm.com>
 <20260426-extended-cti-v8-1-23b900a4902f@oss.qualcomm.com>
 <1c99a162-475e-4d6c-af85-a16322d31476@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <1c99a162-475e-4d6c-af85-a16322d31476@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: KnD3-aSjoaFM-Xv8NkXpISHgxcLSkkX8
X-Authority-Analysis: v=2.4 cv=Y5rIdBeN c=1 sm=1 tr=0 ts=69eece36 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=A6nXn4D9y4xdd_vbfkIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: KnD3-aSjoaFM-Xv8NkXpISHgxcLSkkX8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDAyNyBTYWx0ZWRfX/FTKDKri6Ums
 e9Zr+Y3bV5uQfJtfNt8MKJ3ypkCMMlIKPqo+a8m8xgIpZHtNPNYiuB3W9y5YOJuJ26ROuVYLAMW
 /47pCh3OUMj9BOVGO9hF57dbwyFVZw/R9KFdCWC5J++LWfXBNPlRkw9sKJANbAWVRMVH7ds7Ol4
 5lw0uZRuQqhPJlUbozgYFLUgZJ40Yns+22pSP/J7o21Suj18Ei1quxznkjhfGvZqNyP60Qwb2rF
 TwEyLdNZeqIVgtltG4QrDzGHnHKwjPgt31gUDnub4bSj4MSpJhRBbmavPEWgBGUqMXspp6ravnY
 MXBhuXDOY3uXLIkDpGySxhMwWy/7tzOMj+ObNqzXTF73lvPaBK1XucroB5LKq72Ux38XXvqneTQ
 EH7Lj5I5+w2kn6qogvxy/SZ0z7nOoPT724jxHs4dcn+oFDdrwLFn3GrMUIF4XWoco3bWUO5pwYS
 RJi1cHRyxLolm01rxKg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-26_07,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260426_194720_082007_3D76FDD3 
X-CRM114-Status: GOOD (  17.84  )
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



On 4/27/2026 9:48 AM, Jie Gan wrote:
> 
> 
> On 4/26/2026 5:44 PM, Yingchao Deng wrote:
>> Replace the fixed-size u32 fields in the cti_config and cti_trig_grp
>> structure with dynamically allocated bitmaps and arrays. This allows
>> memory to be allocated based on the actual number of triggers during 
>> probe
>> time, reducing memory footprint and improving scalability for platforms
>> with varying trigger counts.
>>
>> Signed-off-by: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
>> ---
>>   drivers/hwtracing/coresight/coresight-cti-core.c   | 59 ++++++++++++ 
>> +++++-----
>>   .../hwtracing/coresight/coresight-cti-platform.c   | 26 +++++++---
>>   drivers/hwtracing/coresight/coresight-cti-sysfs.c  | 14 ++---
>>   drivers/hwtracing/coresight/coresight-cti.h        | 12 ++---
>>   4 files changed, 76 insertions(+), 35 deletions(-)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-cti-core.c b/ 
>> drivers/hwtracing/coresight/coresight-cti-core.c
>> index 2f4c9362709a..4e7d12bd2d3e 100644
>> --- a/drivers/hwtracing/coresight/coresight-cti-core.c
>> +++ b/drivers/hwtracing/coresight/coresight-cti-core.c
>> @@ -161,8 +161,8 @@ void cti_write_intack(struct device *dev, u32 ackval)
>>   /* DEVID[19:16] - number of CTM channels */
>>   #define CTI_DEVID_CTMCHANNELS(devid_val) ((int) BMVAL(devid_val, 16, 
>> 19))
>> -static void cti_set_default_config(struct device *dev,
>> -                   struct cti_drvdata *drvdata)
>> +static int cti_set_default_config(struct device *dev,
>> +                  struct cti_drvdata *drvdata)
>>   {
>>       struct cti_config *config = &drvdata->config;
>>       u32 devid;
>> @@ -181,6 +181,26 @@ static void cti_set_default_config(struct device 
>> *dev,
>>           config->nr_trig_max = CTIINOUTEN_MAX;
>>       }
>> +    config->trig_in_use = devm_bitmap_zalloc(dev, config- 
>> >nr_trig_max, GFP_KERNEL);
>> +    if (!config->trig_in_use)
>> +        return -ENOMEM;
>> +
>> +    config->trig_out_use = devm_bitmap_zalloc(dev, config- 
>> >nr_trig_max, GFP_KERNEL);
>> +    if (!config->trig_out_use)
>> +        return -ENOMEM;
>> +
>> +    config->trig_out_filter = devm_bitmap_zalloc(dev, config- 
>> >nr_trig_max, GFP_KERNEL);
>> +    if (!config->trig_out_filter)
>> +        return -ENOMEM;
>> +
>> +    config->ctiinen = devm_kcalloc(dev, config->nr_trig_max, 
>> sizeof(u32), GFP_KERNEL);
>> +    if (!config->ctiinen)
>> +        return -ENOMEM;
>> +
>> +    config->ctiouten = devm_kcalloc(dev, config->nr_trig_max, 
>> sizeof(u32), GFP_KERNEL);
>> +    if (!config->ctiouten)
>> +        return -ENOMEM;
>> +
>>       config->nr_ctm_channels = CTI_DEVID_CTMCHANNELS(devid);
>>       /* Most regs default to 0 as zalloc'ed except...*/
>> @@ -189,6 +209,7 @@ static void cti_set_default_config(struct device 
>> *dev,
>>       config->enable_req_count = 0;
>>       config->asicctl_impl = !!FIELD_GET(GENMASK(4, 0), devid);
>> +    return 0;
>>   }
>>   /*
>> @@ -219,8 +240,10 @@ int cti_add_connection_entry(struct device *dev, 
>> struct cti_drvdata *drvdata,
>>       cti_dev->nr_trig_con++;
>>       /* add connection usage bit info to overall info */
>> -    drvdata->config.trig_in_use |= tc->con_in->used_mask;
>> -    drvdata->config.trig_out_use |= tc->con_out->used_mask;
>> +    bitmap_or(drvdata->config.trig_in_use, drvdata->config.trig_in_use,
>> +          tc->con_in->used_mask, drvdata->config.nr_trig_max);
>> +    bitmap_or(drvdata->config.trig_out_use, drvdata- 
>> >config.trig_out_use,
>> +          tc->con_out->used_mask, drvdata->config.nr_trig_max);
>>       return 0;
>>   }
>> @@ -231,6 +254,8 @@ struct cti_trig_con *cti_allocate_trig_con(struct 
>> device *dev, int in_sigs,
>>   {
>>       struct cti_trig_con *tc = NULL;
>>       struct cti_trig_grp *in = NULL, *out = NULL;
>> +    struct cti_drvdata *drvdata = dev_get_drvdata(dev);
>> +    int n_trigs = drvdata->config.nr_trig_max;
>>       tc = devm_kzalloc(dev, sizeof(struct cti_trig_con), GFP_KERNEL);
>>       if (!tc)
>> @@ -242,12 +267,20 @@ struct cti_trig_con 
>> *cti_allocate_trig_con(struct device *dev, int in_sigs,
>>       if (!in)
>>           return NULL;
>> +    in->used_mask = devm_bitmap_zalloc(dev, n_trigs, GFP_KERNEL);
>> +    if (!in->used_mask)
>> +        return NULL;
>> +
>>       out = devm_kzalloc(dev,
>>                  offsetof(struct cti_trig_grp, sig_types[out_sigs]),
>>                  GFP_KERNEL);
>>       if (!out)
>>           return NULL;
>> +    out->used_mask = devm_bitmap_zalloc(dev, n_trigs, GFP_KERNEL);
>> +    if (!out->used_mask)
>> +        return NULL;
>> +
>>       tc->con_in = in;
>>       tc->con_out = out;
>>       tc->con_in->nr_sigs = in_sigs;
>> @@ -263,7 +296,6 @@ int cti_add_default_connection(struct device *dev, 
>> struct cti_drvdata *drvdata)
>>   {
>>       int ret = 0;
>>       int n_trigs = drvdata->config.nr_trig_max;
>> -    u32 n_trig_mask = GENMASK(n_trigs - 1, 0);
>>       struct cti_trig_con *tc = NULL;
>>       /*
>> @@ -274,8 +306,8 @@ int cti_add_default_connection(struct device *dev, 
>> struct cti_drvdata *drvdata)
>>       if (!tc)
>>           return -ENOMEM;
>> -    tc->con_in->used_mask = n_trig_mask;
>> -    tc->con_out->used_mask = n_trig_mask;
>> +    bitmap_fill(tc->con_in->used_mask, n_trigs);
>> +    bitmap_fill(tc->con_out->used_mask, n_trigs);
>>       ret = cti_add_connection_entry(dev, drvdata, tc, NULL, "default");
>>       return ret;
>>   }
>> @@ -288,7 +320,6 @@ int cti_channel_trig_op(struct device *dev, enum 
>> cti_chan_op op,
>>   {
>>       struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
>>       struct cti_config *config = &drvdata->config;
>> -    u32 trig_bitmask;
>>       u32 chan_bitmask;
>>       u32 reg_value;
>>       int reg_offset;
>> @@ -298,18 +329,16 @@ int cti_channel_trig_op(struct device *dev, enum 
>> cti_chan_op op,
>>          (trigger_idx >= config->nr_trig_max))
>>           return -EINVAL;
>> -    trig_bitmask = BIT(trigger_idx);
>> -
>>       /* ensure registered triggers and not out filtered */
>>       if (direction == CTI_TRIG_IN)    {
>> -        if (!(trig_bitmask & config->trig_in_use))
>> +        if (!(test_bit(trigger_idx, config->trig_in_use)))
>>               return -EINVAL;
>>       } else {
>> -        if (!(trig_bitmask & config->trig_out_use))
>> +        if (!(test_bit(trigger_idx, config->trig_out_use)))
>>               return -EINVAL;
>>           if ((config->trig_filter_enable) &&
>> -            (config->trig_out_filter & trig_bitmask))
>> +            test_bit(trigger_idx, config->trig_out_filter))
>>               return -EINVAL;
>>       }
>> @@ -687,7 +716,9 @@ static int cti_probe(struct amba_device *adev, 
>> const struct amba_id *id)
>>       raw_spin_lock_init(&drvdata->spinlock);
>>       /* initialise CTI driver config values */
>> -    cti_set_default_config(dev, drvdata);
>> +    ret = cti_set_default_config(dev, drvdata);
>> +    if (ret)
>> +        return ret;
>>       pdata = coresight_cti_get_platform_data(dev);
>>       if (IS_ERR(pdata)) {
>> diff --git a/drivers/hwtracing/coresight/coresight-cti-platform.c b/ 
>> drivers/hwtracing/coresight/coresight-cti-platform.c
>> index 4eff96f48594..557debbc8ca4 100644
>> --- a/drivers/hwtracing/coresight/coresight-cti-platform.c
>> +++ b/drivers/hwtracing/coresight/coresight-cti-platform.c
>> @@ -136,8 +136,8 @@ static int 
>> cti_plat_create_v8_etm_connection(struct device *dev,
>>           goto create_v8_etm_out;
>>       /* build connection data */
>> -    tc->con_in->used_mask = 0xF0; /* sigs <4,5,6,7> */
>> -    tc->con_out->used_mask = 0xF0; /* sigs <4,5,6,7> */
>> +    bitmap_set(tc->con_in->used_mask, 4, 4); /* sigs <4,5,6,7> */
>> +    bitmap_set(tc->con_out->used_mask, 4, 4); /* sigs <4,5,6,7> */
>>       /*
>>        * The EXTOUT type signals from the ETM are connected to a set 
>> of input
>> @@ -194,10 +194,10 @@ static int cti_plat_create_v8_connections(struct 
>> device *dev,
>>           goto of_create_v8_out;
>>       /* Set the v8 PE CTI connection data */
>> -    tc->con_in->used_mask = 0x3; /* sigs <0 1> */
>> +    bitmap_set(tc->con_in->used_mask, 0, 2); /* sigs <0 1> */
>>       tc->con_in->sig_types[0] = PE_DBGTRIGGER;
>>       tc->con_in->sig_types[1] = PE_PMUIRQ;
>> -    tc->con_out->used_mask = 0x7; /* sigs <0 1 2 > */
>> +    bitmap_set(tc->con_out->used_mask, 0, 3); /* sigs <0 1 2 > */
>>       tc->con_out->sig_types[0] = PE_EDBGREQ;
>>       tc->con_out->sig_types[1] = PE_DBGRESTART;
>>       tc->con_out->sig_types[2] = PE_CTIIRQ;
>> @@ -213,7 +213,7 @@ static int cti_plat_create_v8_connections(struct 
>> device *dev,
>>           goto of_create_v8_out;
>>       /* filter pe_edbgreq - PE trigout sig <0> */
>> -    drvdata->config.trig_out_filter |= 0x1;
>> +    set_bit(0, drvdata->config.trig_out_filter);
>>   of_create_v8_out:
>>       return ret;
>> @@ -257,7 +257,7 @@ static int cti_plat_read_trig_group(struct 
>> cti_trig_grp *tgrp,
>>       if (!err) {
>>           /* set the signal usage mask */
>>           for (idx = 0; idx < tgrp->nr_sigs; idx++)
>> -            tgrp->used_mask |= BIT(values[idx]);
>> +            set_bit(values[idx], tgrp->used_mask);
>>       }
>>       kfree(values);
>> @@ -316,23 +316,33 @@ static int cti_plat_process_filter_sigs(struct 
>> cti_drvdata *drvdata,
>>   {
>>       struct cti_trig_grp *tg = NULL;
>>       int err = 0, nr_filter_sigs;
>> +    int nr_trigs = drvdata->config.nr_trig_max;
>>       nr_filter_sigs = cti_plat_count_sig_elements(fwnode,
>>                                CTI_DT_FILTER_OUT_SIGS);
>>       if (nr_filter_sigs == 0)
>>           return 0;
>> -    if (nr_filter_sigs > drvdata->config.nr_trig_max)
>> +    if (nr_filter_sigs > nr_trigs)
>>           return -EINVAL;
>>       tg = kzalloc_obj(*tg);
>>       if (!tg)
>>           return -ENOMEM;
>> +    tg->used_mask = bitmap_zalloc(nr_trigs, GFP_KERNEL);
>> +    if (!tg->used_mask) {
>> +        kfree(tg);
>> +        return -ENOMEM;
>> +    }
>> +
>>       err = cti_plat_read_trig_group(tg, fwnode, CTI_DT_FILTER_OUT_SIGS);
>>       if (!err)
>> -        drvdata->config.trig_out_filter |= tg->used_mask;
>> +        bitmap_or(drvdata->config.trig_out_filter,
>> +              drvdata->config.trig_out_filter,
>> +              tg->used_mask, nr_trigs);
> 
> The error may be silently ignored when a memory allocation error 
> occured. I think it's better to add a log print to tell user what happened.

My fault here, please ignore this comment.
This error will be handled by probe fail process.

Thanks,
Jie


> 
> Thanks,
> Jie
> 
>> +    bitmap_free(tg->used_mask);
>>       kfree(tg);
>>       return err;
>>   }
>> diff --git a/drivers/hwtracing/coresight/coresight-cti-sysfs.c b/ 
>> drivers/hwtracing/coresight/coresight-cti-sysfs.c
>> index 3fe2c916d228..2bbfa405cb6b 100644
>> --- a/drivers/hwtracing/coresight/coresight-cti-sysfs.c
>> +++ b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
>> @@ -719,12 +719,12 @@ static ssize_t trigout_filtered_show(struct 
>> device *dev,
>>       struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
>>       struct cti_config *cfg = &drvdata->config;
>>       int nr_trig_max = cfg->nr_trig_max;
>> -    unsigned long mask = cfg->trig_out_filter;
>> +    unsigned long *mask = cfg->trig_out_filter;
>> -    if (mask == 0)
>> +    if (bitmap_empty(mask, nr_trig_max))
>>           return 0;
>> -    return sysfs_emit(buf, "%*pbl\n", nr_trig_max, &mask);
>> +    return sysfs_emit(buf, "%*pbl\n", nr_trig_max, mask);
>>   }
>>   static DEVICE_ATTR_RO(trigout_filtered);
>> @@ -931,9 +931,9 @@ static ssize_t trigin_sig_show(struct device *dev,
>>       struct cti_trig_con *con = (struct cti_trig_con *)ext_attr->var;
>>       struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
>>       struct cti_config *cfg = &drvdata->config;
>> -    unsigned long mask = con->con_in->used_mask;
>> +    unsigned long *mask = con->con_in->used_mask;
>> -    return sysfs_emit(buf, "%*pbl\n", cfg->nr_trig_max, &mask);
>> +    return sysfs_emit(buf, "%*pbl\n", cfg->nr_trig_max, mask);
>>   }
>>   static ssize_t trigout_sig_show(struct device *dev,
>> @@ -945,9 +945,9 @@ static ssize_t trigout_sig_show(struct device *dev,
>>       struct cti_trig_con *con = (struct cti_trig_con *)ext_attr->var;
>>       struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
>>       struct cti_config *cfg = &drvdata->config;
>> -    unsigned long mask = con->con_out->used_mask;
>> +    unsigned long *mask = con->con_out->used_mask;
>> -    return sysfs_emit(buf, "%*pbl\n", cfg->nr_trig_max, &mask);
>> +    return sysfs_emit(buf, "%*pbl\n", cfg->nr_trig_max, mask);
>>   }
>>   /* convert a sig type id to a name */
>> diff --git a/drivers/hwtracing/coresight/coresight-cti.h b/drivers/ 
>> hwtracing/coresight/coresight-cti.h
>> index c5f9e79fabc6..ef079fc18b72 100644
>> --- a/drivers/hwtracing/coresight/coresight-cti.h
>> +++ b/drivers/hwtracing/coresight/coresight-cti.h
>> @@ -68,7 +68,7 @@ struct fwnode_handle;
>>    */
>>   struct cti_trig_grp {
>>       int nr_sigs;
>> -    u32 used_mask;
>> +    unsigned long *used_mask;
>>       int sig_types[];
>>   };
>> @@ -145,17 +145,17 @@ struct cti_config {
>>       int enable_req_count;
>>       /* registered triggers and filtering */
>> -    u32 trig_in_use;
>> -    u32 trig_out_use;
>> -    u32 trig_out_filter;
>> +    unsigned long *trig_in_use;
>> +    unsigned long *trig_out_use;
>> +    unsigned long *trig_out_filter;
>>       bool trig_filter_enable;
>>       u8 xtrig_rchan_sel;
>>       /* cti cross trig programmable regs */
>>       u32 ctiappset;
>>       u8 ctiinout_sel;
>> -    u32 ctiinen[CTIINOUTEN_MAX];
>> -    u32 ctiouten[CTIINOUTEN_MAX];
>> +    u32 *ctiinen;
>> +    u32 *ctiouten;
>>       u32 ctigate;
>>       u32 asicctl;
>>   };
>>
> 


