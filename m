Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 527AFCF58C6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 18:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o862kOcvuwQRyFxMDCkRLuG/QYO1ql4833x+8E42oT4=; b=gnRSBuwYfq55JKSGZrXrAF7kx4
	xxyoRH3d5q8zMMcXYDnoPvl3d9mWyq/JsLGVJ3HF8bFmc8qpc4L3u7EQatAx4gXhSPL1AS+k1b/gX
	AMKP5fofbvBC8KLe598hkWYRaWXy+5o4cayAwLRYri7slR2g7rWso8lHKm6f3oU0Ld21hFYpdVPz0
	OBSI0453P9s7Q22dow/A7Kwfdl60reeewJWQTjIoy33XmGLFTl6q46q8+7fe9r9OaUvhovD1/u+9u
	2Fr+fDlYVnMmYF2mRU6VRlhCtJuUGdbKwfidUcoCdZnk/4O/Wizh2rCkYCUCsh18Ktvyz2Lg4rj+J
	XaMUGFhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLmZi-00000004PqZ-0saA;
	Wed, 19 Nov 2025 18:06:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLmZc-00000004PlR-3CYC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 18:06:34 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJGFc5D1970072
	for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 18:06:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o862kOcvuwQRyFxMDCkRLuG/QYO1ql4833x+8E42oT4=; b=Cb1BRReVWlnM5GsS
	+5X7GO65K6sKpwVSFvRRyu4WkBToHqHwaL1Ltr3SuddK4YG9gA4fIWjlht7RrNh0
	At0k1LPjXoCyaaKTs1wiTiMUl39oAwv7oWuruYBnOoscKHZsnwN3Acb/atjfqty7
	XPbPRt+MpNsXGA0pTTiwRo0dxsmlYfwE40ZkYH96zaOxSEBGugC1y20rxfZMNH7d
	aicyvxRCHCPt6crqd7DrZnkAeD+N1QUv/klHNikWo9vH5MTBAa9iBwZWczz+Mtrc
	fKyjNGCYaahQpBGxrS0Zixp6VB18WE3PY0SQeKgzJ/Jko4Foxnk/WzdQxFQgVYJ0
	c6uU/A==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ahh8t0bvs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 18:06:31 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-bc169af24cfso5576186a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 10:06:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763575591; x=1764180391; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o862kOcvuwQRyFxMDCkRLuG/QYO1ql4833x+8E42oT4=;
        b=fjKZ7+PxsJmWvxt+gwlBhkcPrBhfXPAa/BQKy4nYEgb3zH5KwNqOgSECZY5flrFtm1
         rNY/VU7NiHLKQORZM30Gea/er+ZNjpMafRq1ug3A7c9ZF39trrD/Fj3NX2nouDxfXJ5c
         mD0CqYj8n9smDvZknrRBA/N3bhFujAyv3Gzr59DuRaB5Mn8Xzj8up20Ex1b7CmLGXoYP
         YwZ2zgtHKQymSCsCh8DCYeDZdtH4La9lbeZ8HlML9IuzEypEqAZeJlAt6M70YGwpNyb3
         ifzzBtgyvFPGkCbb9/croAxV3Us/bm/qOc7ycoMR1JI2RDOgo4RFmEIDONyps3cVZfZG
         l0+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763575591; x=1764180391;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o862kOcvuwQRyFxMDCkRLuG/QYO1ql4833x+8E42oT4=;
        b=r/rVI+LFAHfaY1XFLeQsTtdJvkDM3QqYeQoEs47iKLfds7VLZvbqtDcES3X4XkKSW8
         KmqtH6QfF3z7neHL+2zZSP3fX6Ixc795WkugfC7hRywuIbY0YHV/TXU13PNnXDZbkPQv
         +W71b9HDUdPYFSA1T6tQIj6FLdDKEg+UJJPoPxIaGNlUPSOOY1mR0HKOJ1wXinGIHUhR
         PFNKZkuocKoutpdDAc/znRSU2xEyL3Z0suZ2ewSDLN4VTebHGztsSida/Xv/4yituWyZ
         wN9pA/KHn7KSP4f8LJ4XhpqMzjGbrcFNSmLEfP6MiRKrc5E5YrB5/yUxTVoz+FvDaplL
         5QCw==
X-Forwarded-Encrypted: i=1; AJvYcCX+SPHmVx2eiRiNTAzjr4xPCM9rcA3uhtMPhmpipTMGmWyMMIrgbIdIhfTWPO9XeAJ8Hufc9Ig5qs5d5yQAZ27M@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+hXIvPiWmMmvM2rOXkwXD2j8rPTvwhNLSwEqBCVXIxlG234tk
	gnzQlrk+yMjsMRUNPxSwsi5e3g8ZlAelWwsNPH1g/jZ/RGKHiLsYzjJCiQdB9pI/nq4UzirqJXC
	ZAU1b7jd7bIB9vpQU88QZtP7HYaNUj2EOIV36gKoSwEgDOU8PPyYl0MJzD/zzX0+kUmqJA1gc4d
	lxJd2NsZygFw==
X-Gm-Gg: ASbGncsg5S2W5k9brKG3Iyt3bHRuowfVtWAypi+55y4YEONxVePzKLEYeobPDg+2D69
	84NfJMW5+Lop+9WXM1sHRM3y0Dtv9ADdfPbG2CXPPJqks104QcdMd9CMBoaVS1iPo8FeZfkdsy4
	HrgSUWoF0B5HHGXuPanmLie/wZ2iRxeu11+SHnFKL6dktZdX9hUiw36k4ujX5eme11QardrH5M5
	3ymukEcoTHSjnhk5v8kwrwNVHbvWmDK4mLyggrcfKRFztG1F4HOIeF3gJsY/fqWf3Zxh4WLMGMH
	jOJwOj+/Z3zCgCC7Z9+Ck18N3OF0SsTcRauA5MgSW6JzG3dZatjn5FNtoh2yquJBG7jobeyVPXQ
	tevkGM89fyKl1nTg6XNSGzw7/61w2y9O7HJmLlpk=
X-Received: by 2002:a05:6a20:a123:b0:2d5:264c:e4a1 with SMTP id adf61e73a8af0-3613b4c07f9mr489050637.8.1763575590694;
        Wed, 19 Nov 2025 10:06:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHVhNY72sMTY4z3Z3kCjEqMsjFsvgckuWXFjMVFg++QoqncF79iRA6QYWRJYHUkt7ly3k5jfQ==
X-Received: by 2002:a05:6a20:a123:b0:2d5:264c:e4a1 with SMTP id adf61e73a8af0-3613b4c07f9mr489014637.8.1763575590165;
        Wed, 19 Nov 2025 10:06:30 -0800 (PST)
Received: from [192.168.1.4] ([122.164.69.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bd75def6346sm116417a12.4.2025.11.19.10.06.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 10:06:29 -0800 (PST)
Message-ID: <50bd3be1-63dd-4bf5-915a-02d923fb0376@oss.qualcomm.com>
Date: Wed, 19 Nov 2025 23:36:24 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] iommu/arm-smmu: add actlr settings for mdss on sa8775p
 platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: konrad.dybcio@oss.qualcomm.com, robin.clark@oss.qualcomm.com,
        will@kernel.org, robin.murphy@arm.com, joro@8bytes.org,
        iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251118171822.3539062-1-charan.kalla@oss.qualcomm.com>
 <himyof7napywkc44vre5ncqsatkkaxqnqbhjht6hjt53lakper@4wlwsvxkkamc>
Content-Language: en-US
From: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
In-Reply-To: <himyof7napywkc44vre5ncqsatkkaxqnqbhjht6hjt53lakper@4wlwsvxkkamc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=F59at6hN c=1 sm=1 tr=0 ts=691e0727 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=zTkTFZhCv8P113Yyz2MVww==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=antjIYhOioNipfN5IzYA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: psT6-Gdub-aajGHa2omZyoGEAtKTjoIo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDE0NCBTYWx0ZWRfX+FUA4y0wkkT5
 JYs5yTkt0m0arkNcvlX4Q4vmEsCi4ndbkQC0LjeXrfl+hcJtWMm8NnWrMgLxDmqF8v54YCgnYeL
 2v3XIzkCAJtQcM9hkISyaXM+SjLpYpfcGSS+X4maRfPqLVbCTNuhMSh6omwxm+8hXQeD0urhzol
 ZRL5es19EvqVL3QQMWrUq9903EErUP7xMZ1dFJmdvkPBpH7yOcT+eIvxuz6OXgJclOa/yYtWOEV
 Mhf+QZfBuiIc5UYceyX9IszHxWCy7wk6qg5AdaZwZOBqtuTP0vS6RWLZV0b9VoVf4iLaVUFEQbo
 /2a0kVmSVaEIw3Nmb+OEbFOmR1j6NCuW92hleKQ393hHzwLTrPgsGGLx/P3DcfWm8mvX4RrD4aL
 wIWmChF6WdBA0Ew5ejYgOv5Mo1gTWA==
X-Proofpoint-ORIG-GUID: psT6-Gdub-aajGHa2omZyoGEAtKTjoIo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_05,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 phishscore=0 spamscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511190144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_100632_814847_998F1098 
X-CRM114-Status: GOOD (  19.55  )
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



On 11/18/2025 11:33 PM, Dmitry Baryshkov wrote:
>> Add ACTLR settings for the mdss device on Qualcomm SA8775P platform.
>> This is achieved by adding compatibility string for mdss in the actlr
>> client of match table.
>>
>> Signed-off-by: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
>> ---
>>
>> Changed from V1:
>>   1) Added actlr setting only for MDSS and dropped for fastrpc. -- konrad
>>   2) ACTLR table is updated per alphanumeric order -- konrad 
>>   https://lore.kernel.org/all/20251105075307.1658329-1-
>> charan.kalla@oss.qualcomm.com/
>>
>>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>> index 62874b18f645..0b400e22cb00 100644
>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>> @@ -41,6 +41,8 @@ static const struct of_device_id qcom_smmu_actlr_client_of_match[] = {
>>  			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
>>  	{ .compatible = "qcom,fastrpc",
>>  			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
>> +	{ .compatible = "qcom,sa8775p-mdss",
>> +			.data = (const void *) (PREFETCH_DEFAULT | CMTLB) },
> What's the difference from SC7280? Why don't we need to set CPRE?

Sorry, I'm really not sure If your question imply to talk about the IP
level difference compared to SC7280 for mdss?

Regarding why don't we need CPRE -- these are QoS settings that does
control how well hw behaves i.e., related to performance settings not
the functional ones.  I guess, these settings are derived from factors
like how many masters are sharing a TBU, how crucial are masters using
that TBU(like important ones may be allowed to +7 or +15 and may be
others upto only +1 prefetch).

Thanks,
Charan


