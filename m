Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94C0ED10F23
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 11:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n7wL86qO0oKaO/DjZXseg3w5mkQK3ruQ3+V4DE+9KOg=; b=AmPa/Cvp4Eo134QH/Lm3VcVUoR
	xh6Y5sFSyl1IeJqHuioRtV35lDsJ0S1AtslXEVz3ziml2Q9zziqSDULa0F8RrkSqZPbeSoKMUbtXw
	aKgVfjXbT0ybJcX66s9lPMKRXTWQnXLOS4r+zRCL1YPlID6SSuT19WaS96stcneyy8UCPjcVo8zS1
	hear32WjFzhjlgFEmH12Cte8j7woayVbGo/TMMf3upNfivEn3KeYuy+eNOie0ei8tQ/UB6N+VBywr
	L4eJg3PioWCBoAdBOjZICQXovB/Fph/zjtMlrsn5fVEF4NXcBH1wUnVXAM9KqI+tNHWI2awPEjGeQ
	wHP+0IZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vODpa-0000000Ev83-1l2H;
	Wed, 26 Nov 2025 11:37:06 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vODpX-0000000Ev7h-2KXr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 11:37:04 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQBNXJ21849221
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 11:37:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n7wL86qO0oKaO/DjZXseg3w5mkQK3ruQ3+V4DE+9KOg=; b=Z3t49/jMrsKcJdlm
	Htc7/UAbA3Icdtkgo2A5+gdO7IFEpaUxkuOsAfjgIwis8MOd5DMNlvUwcmPG+VLz
	qFxe4Xyi9gHbYRtordCxbeSawPZN/8O63qTvg9EbpsP8wpNK+6cgU+tpdf4TgBG3
	XiPcgQML8hqllTl4tbm6SY+tFEgZp/U8Qt4aU9S3sJy2ukKDhtyK+eGgGPxh3Lru
	LVmSAvy8fGjggl+AkSgOWfAXyxh7iYMLf2HT6SeDFcZiBVL0DKGWTdGJ2R5cQfY+
	BcsiMErlygjjDUUJFDUVj/MHh6MfBPDxKr/LWFAeDcbtew6AMm0HihV5EtWUiAuh
	03sBcw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ap0msr0yd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 11:37:01 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-297fbfb4e53so104044735ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 03:37:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764157021; x=1764761821; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n7wL86qO0oKaO/DjZXseg3w5mkQK3ruQ3+V4DE+9KOg=;
        b=jhvHrkb7KPOIccPu6vetXxmovYML6FhN9tJyT5QHP8H89ltTdcw7WS8GS7mB34kafB
         /eIhXuutca0riGt8Q1dHVszuZC29KSRywSvU3CINRqBmJAi2wxK66MJSWJz3ZThe9wHK
         5M5UaTyuTjBhjb1XNZfp/09hJO7/wS+K+2UJcfAf9QiDSnS4H60XYG6TkORvpQ9kuinK
         bIevXjPmJ8+JXSv9a+Z17AxfusPTpVvU1blpLHPBgylhua0eD6cqnBo0byysIGxglIaE
         cQrmeuaR1eiZWjJzfwEwZN3dDXXerO6z/DEw7DdtHr9E8nLh0cXKfxkB5jYvjjOMYCAg
         T86w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764157021; x=1764761821;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n7wL86qO0oKaO/DjZXseg3w5mkQK3ruQ3+V4DE+9KOg=;
        b=TPMzLFdL63W/oOjVJ6nlJkAUELWuuhY8v8Aji/cK+cTXm7bE6Jkd66ltjm98YVnOWb
         Yaid8MHijL7ftD1YARaEpgh69x8qz+HKOC9GhfN3qPUzOGP4kshMApZQIyaDVmyak05C
         qXSD3s0bpaprxPmZVz7nzOXb8hRIT/M3rJnctf1SOMal+dm7vxPQkpv+5Yirfv2OEFT5
         Q2ghqlwrJClxnxbd2WSoZCdPbxfvsl7dA/K5xYWyvOa9XtwaeKSjTcZJmBY/4Y1v2Y98
         +35CYAN3OLa39ajwjmv0ofiP6ISeQKwCWhi3IvKFGf+3r5T3r/kyNyJgE7ZNBR5PaAZQ
         Rp3A==
X-Forwarded-Encrypted: i=1; AJvYcCX5ZR8UEv0HmKyQpZ3+X2Vh5hwunwwhY7WFw84HCJyEnpjSb81s/oMN/dyakHU4Qi0KRD8UvMLsi/WebPD/jp2E@lists.infradead.org
X-Gm-Message-State: AOJu0Yxx4TQny4HVytn8fyi88KHueAtOAspM66zLho3ru43QwPtqMz2E
	KcLg/eYpzg+BG4JiXbUQOL2YO8H0pqqOGqRVTAwGQ3wUTMxXT2VUKg1y+6b0twGxrejR154LDC3
	9Yb+PY3v1INDbiHkTi9Pow2mIwSsyC8sqbG2xewoRr0t5eMLWLvjzoy4CSlUn93BKVZEAxyDsvs
	n/Zw==
X-Gm-Gg: ASbGncu0EYkLs1KKnjPIqqO+0leD4ClNDF/dQmWvuUT2qniJPTlyN0EDsAeElAjixCw
	Bvu+uF+8uzaJJNOo4PG+uF1F8/uAGofJrPz3WlWIS9OZp7P8Jr96TR6NByrVPHRBUlfRGjih4qo
	g3oiTZZbHQXHUoG/f9dO31wvKqo3wZrefglZhkPAGPuOe8/vldfFeXtSIZD2bmmvLlnSTH/m9Zs
	7gA9idtIGNZYtaasRJl8vF76sXEic4xj42XnXAJkS+jLxTbg35ZVSjZZtD0Xshw6ZFWEM88Gy57
	dL2SJ5wo8fFnAgXqUAOziNrIob+42ksKNSmf7oMcST7bORdGXLmbqqPqJFEMUUIjrqtvwKrQf0p
	Jre9NaudB0vOmdIDxP6wfxfNMgnkXmM3rbbZtBQ==
X-Received: by 2002:a17:903:298e:b0:297:f8d9:aad7 with SMTP id d9443c01a7336-29bab1c4637mr65576695ad.50.1764157021070;
        Wed, 26 Nov 2025 03:37:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEQXyiz49GT5zKYdi/kZ0uOjBr42OLzEjIX7mTPnUd1lYdVYntNAehTvWuyqVwPOqP1KTldPw==
X-Received: by 2002:a17:903:298e:b0:297:f8d9:aad7 with SMTP id d9443c01a7336-29bab1c4637mr65576285ad.50.1764157020606;
        Wed, 26 Nov 2025 03:37:00 -0800 (PST)
Received: from [10.219.56.14] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b12f988sm192632605ad.27.2025.11.26.03.36.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Nov 2025 03:37:00 -0800 (PST)
Message-ID: <81cdefa8-9bc9-4fb3-ac7f-afb34f70e8de@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 17:06:54 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3] iommu/arm-smmu: add actlr settings for mdss on
 Qualcomm platforms
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: konrad.dybcio@oss.qualcomm.com, robin.clark@oss.qualcomm.com,
        will@kernel.org, robin.murphy@arm.com, joro@8bytes.org,
        iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251124171030.323989-1-charan.kalla@oss.qualcomm.com>
 <6zyysrrq6mt447s6rg5sk5vy5w7ulzub4u5m24xw3xo7edguwu@73vtynhdp7nx>
Content-Language: en-US
From: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
In-Reply-To: <6zyysrrq6mt447s6rg5sk5vy5w7ulzub4u5m24xw3xo7edguwu@73vtynhdp7nx>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: tilzdrWPuHBiyXKzTg5dAZkb8wK4xGF9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDA5NSBTYWx0ZWRfX9EDqfyzu3D3s
 dRalnjRIC7xMjVzhIRySDmMtd1v3vZqCz2CNbfpvtbOYne3C13fYPAp5kEkSNkqDCprPn0LL9of
 xEwFhhOzcE8qpVt5I2npn1BmxD8MsOgbGBjMg4GMSXX5bEqcTCmVVXPtE/7PeLFz9lne46vqsGH
 p5GOYUYd6a3q1BV+Kjo5j095lNhBWpiLM7RWDlVxgnayxT75v5aoYtebouSpY8KJYjwENF4FIEo
 eNOnlPYPEdz3viOiHDFn4L6hejnTdGX8zk4R6xjDWJSJgwmDpoaqWzDwOxky8UXNnzn4n3BsOxO
 PV7Uny+Q2tbadAGEmRXDnlT2zL6qLWecdx+yrRk4/sylBp4bKuf5yYFicHjyti1beUjREiJ0X5f
 Fvb9dK4ur0CLoK7ris5Dw3KigZH4fQ==
X-Authority-Analysis: v=2.4 cv=N5Qk1m9B c=1 sm=1 tr=0 ts=6926e65d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=YkchOtpOlfnu4Q9Yy4sA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: tilzdrWPuHBiyXKzTg5dAZkb8wK4xGF9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511260095
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_033703_653191_9660AB83 
X-CRM114-Status: GOOD (  12.80  )
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



On 11/26/2025 7:21 AM, Dmitry Baryshkov wrote:
>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>> index c21a401c71eb..ead1a59d40ae 100644
>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>> @@ -41,12 +41,34 @@ static const struct of_device_id qcom_smmu_actlr_client_of_match[] = {
>>  			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
>>  	{ .compatible = "qcom,fastrpc",
>>  			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
>> +	{ .compatible = "qcom,qcm2290-mdss",
>> +			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
>>  	{ .compatible = "qcom,sc7280-mdss",
>>  			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
>>  	{ .compatible = "qcom,sc7280-venus",
>>  			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
>> +	{ .compatible = "qcom,sc8180x-mdss",
>> +			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
> sc8280xp? sm6115?  sdm845? sdm660, msm8998?
8280 and 6115 is slipped....will update in next revision.

This Prefetch feature is not implemented for all the platforms, I
captured only to those that are implemented(to the best of my knowledge)
-- I will put this in commit message.

Thanks,
Charan





