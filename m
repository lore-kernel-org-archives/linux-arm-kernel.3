Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F15FDCD5BAB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 09:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dk2V+f97R7FIH+RWhnR8qR74s5z0Cna6ABS6uSkhx9Y=; b=hs9URdGeXT6ptLkoLJWvrdrVLF
	ZxxsvAD0Ovrt8yavEzzswOkUV3CBpWUtLEyIXImSLKLPFMdpfNvZpC1tKRpTOB0cgasE16oWZslaV
	otUvQw+4wiBFBBmCyvxhVZAKOjM4T3q8kL09YYa45gH0S+OaKyETHUawKtSts2K0lbjyAxbW+pxB4
	MgmvPWoryBGTOec66aVsr3JHmcbvmSNkDALfmOBVFZo5RpMrZBQkQMEixrHNQthJx7dcKQJDzH+h3
	A1Q7TrPmKfaoK2kmxGXtOPBNQHz+AWNwM0rep6ErQG2QaOljMWTSp+UwMLvrJU/+tv9bohipkBThk
	2IOIqgwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJTdk-0000000ABzW-1VFF;
	Thu, 13 Nov 2025 09:29:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJTdi-0000000AByz-1U6c
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 09:29:15 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AD9F14X3120385
	for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 09:29:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dk2V+f97R7FIH+RWhnR8qR74s5z0Cna6ABS6uSkhx9Y=; b=pTwEa0O01ggQkmZ+
	aheH+/m17sgjioEGYcDKKAHqaOCVf9Ch/1rOlFiqgbN8wMlMEssOojpkhNjULEA3
	bmifele/wxUqi/ey7vdSZTQ+OWlIFhL32vvnyzt0SVXs2F63ljSbPcaEJ85OG5Zz
	vNnUQa0Pyj3BkfD4FoQx3nnB9Dih/8AGkiZIHqlitAfWYroWhJvMagRXnaVglk64
	QaA1Ywc8LWOb2r7zDljj5Yxq2VdZyMJWSeVNZTNDIjNKqv3bmDD5++hxbp7H69+g
	CCcJjvk/IIqNDt94IWpVbfYjDlcoZuIONdBk1PG5k9ihEPhCbcBkFK2wAQ+eU+Ue
	Y5HoGw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ad5pusagr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 09:29:13 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4edace8bc76so2263241cf.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 01:29:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763026153; x=1763630953; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dk2V+f97R7FIH+RWhnR8qR74s5z0Cna6ABS6uSkhx9Y=;
        b=Ax/FUvWhmcxxzmTBh2jGTBUo7TwC3b1a7aY/NPd06prCnL/10Itzs9oDnr1RyjO7hI
         MoJ85BaTiIy46k0mDGCwXY0ftaorEW5teRrckTOfz5OHKkSPOdl1PA9EewnfkomPajyk
         tsAfaSiEjI9/1uqZPt3RCm22Xor0TTniF9Aw/pdsBrqYVDiCG0qG+1UdU5bmpuv0UfKF
         k+7zhoHLTTNELjCL+umVeNzHoQBvbH+8deMOZltHs2oAZ1RDhbMBD3MLctkRfAH/eTwY
         VI7E61cRV1GUFatVc+vWPcqL92RRyGpsmst0Fb7CsblQaSaaAkt5JWHDZMZEcLlDVkt8
         oJPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763026153; x=1763630953;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dk2V+f97R7FIH+RWhnR8qR74s5z0Cna6ABS6uSkhx9Y=;
        b=OTW0HInBF/P1kGu/L8hzH1M0TC6SdsxjsxF31EooNAXc5AxvCLnNgdI7ONBf8UjTDI
         k9g29JV3fTMfWjRYAnXQs+xxbj2Tfo8imkgPYFZ4iIwUmhcmzeuBPRKqz+7uj/SH4GXs
         JK5L5pxUHaaO3C7ExY4NePOy7HGZTdOo3YHzLKuJ3rnwbomXzEgWZsxhEuE3xzLtEtz4
         yHhUo6jsPACvSlnt/grLNusWhejZDm5JGPYjQa01cf/BlQTBmMT+PtRVqYejsgSRh3eF
         lXH07C8nnPXj49Xh3xRJQB0lzhRJnRHNxgW6RYwZcxh39ImIWBiWuC2qVqesZ6DNLYFC
         HYZw==
X-Forwarded-Encrypted: i=1; AJvYcCUGcQRA7Oid/XBGR0zXEna/D+HSdN2ab1K5iLbkYhhDaG1CZS1Bc5DR3tDQg7iJwACUz/7gv68pOvmHK93f/oiT@lists.infradead.org
X-Gm-Message-State: AOJu0YzaRqBetAMnF0Hi+eWJ18epCdoTSzqTQfspPNzxHbUCjmzLmNji
	3WT2hZZlADGUfZvmFVZ9f2ugFzHnj8LDoTIgUnDFzUBqAx6zem2TeezAVR/Pt+lMYk6CHEr7ZdA
	TlMJwvM3G/wj3nc05KlAdV40CWP9mukU3K4Xdni1GpVM/qsgX3IsA3FBozGSpb/RiyGZbGdO6yw
	mGDA==
X-Gm-Gg: ASbGnctBlTmE2hqmo0XISgJwmwKg6n3DURTDHYjbA2KDhVNyDufGTn0RoNO2KpezY9o
	mJ80o8+HxtF/bs8hALJv+hEFhUDw/jxxdgEXFyi8xxFm0ymrPE5wnwKNINZwLRwEfgiAuoJu2ca
	7Ea1MjAp7a+g+QbKpawm09xY2cRk6wX6HGmEHZ6tq+aXI+q8d4jZvt8+Z8fwrjxXcrdKUv7pXLQ
	Jv+LFS8+SIu71uKbPzX0ItgciEm9kvP22GGshy/cRbFw0kuvbaYMWqBR1eVhgAZV7arZw8pQaQF
	oCOcGN0Px9P+tZYhiViNke+lL/GtAZrfSLY4pzLY//R/hT0IRnoB3s+6JKtQX03dUcS24Wq+wZA
	ELpJ5j5qvI2VVkZX0hobd1ExE/Z8fN19yyfKq+uzJalwhxdWnm2Z0T40v
X-Received: by 2002:a05:622a:16:b0:4ed:6e12:f576 with SMTP id d75a77b69052e-4eddbd65318mr52613401cf.8.1763026152895;
        Thu, 13 Nov 2025 01:29:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEBKglDPCuRYE0ZGVzuJPGPVwQT3YRBKzTtOU5WmAoz7l8pjecUcIWj985OWak6SKf5r+bgQw==
X-Received: by 2002:a05:622a:16:b0:4ed:6e12:f576 with SMTP id d75a77b69052e-4eddbd65318mr52613171cf.8.1763026152358;
        Thu, 13 Nov 2025 01:29:12 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6433a2d746bsm1057796a12.0.2025.11.13.01.29.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Nov 2025 01:29:11 -0800 (PST)
Message-ID: <f76b51e0-43de-40c6-8be9-cad2bd2613ce@oss.qualcomm.com>
Date: Thu, 13 Nov 2025 10:29:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/21] drm/msm/adreno: Support AQE engine
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse
 <jordan@cosmicpenguin.net>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Connor Abbott <cwabbott0@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org
References: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
 <20251110-kaana-gpu-support-v2-14-bef18acd5e94@oss.qualcomm.com>
 <1202b66c-6d4f-4909-a010-7e5e3ec7f0c7@oss.qualcomm.com>
 <cc4ff1c7-3158-402d-b746-5aa57b4a855f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <cc4ff1c7-3158-402d-b746-5aa57b4a855f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=E6/AZKdl c=1 sm=1 tr=0 ts=6915a4e9 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=CPo_bn1fJaELX20lIFIA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDA2OCBTYWx0ZWRfXwhXeWShIs7Hk
 i6gN7vFkHlYBRiqDYwU7X8gS/Vlwloyk6TV6cN6iDpmHhGqjAmU6AQojwJu4ErUWKfyLGCsIr5T
 mEypUAU/QNHLdiwxoClWEOewQiUK4Q1CxSSH2JOwZk3DlNm/qIU33n9P03BoHyNvgtR4iUa+YsD
 lbbjCpUw29JxUz3rpibOXIYUzQNqIEWxG5jkR658YGgVu9tcwhv5CUaU5eS1IqJN2w7gEzIp4ID
 kqIrMrv9jpb9LiDlPSngAVY6gnZOY7/2yfKFRQBLP/+Bcj93TXh+nIAf2IhQ8pizxXNwdGTt2Tz
 uhLMa4a1Ps7GqqV5R/HMD9q74ZWuj4dmRIN5LG94dSn4QRcgD4FhkbvPt+nnqqs37uo0duCra07
 luiclqmT3g6RC2jf+acWEVPlRG8Bjw==
X-Proofpoint-GUID: yCJwTVCsos8Sb40zI_3zFxnSYqRuN6lK
X-Proofpoint-ORIG-GUID: yCJwTVCsos8Sb40zI_3zFxnSYqRuN6lK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_01,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0
 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130068
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_012914_399957_D84F798B 
X-CRM114-Status: GOOD (  14.60  )
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

On 11/12/25 10:16 PM, Akhil P Oommen wrote:
> On 11/12/2025 4:37 PM, Konrad Dybcio wrote:
>> On 11/10/25 5:37 PM, Akhil P Oommen wrote:
>>> AQE (Applicaton Qrisc Engine) is a dedicated core inside CP which aides
>>> in Raytracing related workloads. Add support for loading the AQE firmware
>>> and initialize the necessary registers.
>>>
>>> Since AQE engine has dependency on preemption context records, expose
>>> Raytracing support to userspace only when preemption is enabled.
>>>
>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>> ---

[...]

>>> --- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
>>> +++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
>>> @@ -616,6 +616,9 @@ static int hw_init(struct msm_gpu *gpu)
>>>  		goto out;
>>>  
>>>  	gpu_write64(gpu, REG_A8XX_CP_SQE_INSTR_BASE, a6xx_gpu->sqe_iova);
>>> +	if (a6xx_gpu->aqe_iova)
>>> +		gpu_write64(gpu, REG_A8XX_CP_AQE_INSTR_BASE_0, a6xx_gpu->aqe_iova);
>>
>> I believe you should also set CP_AQE_APRIV_CNTL per-pipe
> 
> We already configure CP_APRIV_CNTL_PIPE for this.

Aaaah right the register I mentioned is separate on gen7

>> Should we also enable AQE1 while at it, to reduce potential backwards
>> compatibility issues? Would that require solving the iommu woes?
> Yeah, AQE1 is strictly for LPAC workloads. So lets wait for LPAC support
> first.

Sounds good, thanks

Konrad

