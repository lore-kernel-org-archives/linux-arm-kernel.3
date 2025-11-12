Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7A62CD484C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 22:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d/nTs8LVBJqSn132QZVwYlosV14mCj856uKAHF6W+UI=; b=2/7LRmoj937/O7iZ0Irv+Nr0H2
	NH5yv/HHqa5tB0GallnVtCUjgafRVs7/acOkpmjtJtfJbsckGSbsDxz4ahmQNUJYZV8bP3ts5CwtI
	rcCRUDMiQR7OzegTS5yyaZcYv8l/xMLjzTXc3oF/PL9Fh/2GeM4Ibf2lLZRcEtm+OS2P8fj6oqNqK
	dsaUjzwUM1ap1asqse3AVkNSLiDljE9lW9lEWGmucGJYa4qeCE/8MPmmX6LuHnHr7I7Jpa9dhum7T
	l0IoOhcU8j2omwMdzeuDfeJAeJKF5bEkhKpSjJSZMA62u+0xNE5+2BwwGNPfNGfpQmKG/bYWryEQF
	4dwR2vfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJIvh-00000009Z8h-1slZ;
	Wed, 12 Nov 2025 22:03:05 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJIvf-00000009Z8K-164b
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 22:03:04 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ACFwRjJ1813906
	for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 22:03:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d/nTs8LVBJqSn132QZVwYlosV14mCj856uKAHF6W+UI=; b=cHA0o/fht6HtoqNI
	X2cYYYSs6rD1AE66bCG5GhR0LOm9LtO7Mobjpxoyh3U95AlY29yom5E7WGfeb6kW
	UZhdWXha5de685yIUOUFbiGYTJL1cifGUzOVgzEHA8tMX81I2u1DIhyu3vfXk7gf
	PiNBbBzVjBv5J4JD+tvjbGU+6glXD2zrN+SItouNpSIDY2egKFY2EzgIONn0u2Kv
	bO5ih6SjmiIh8J+TftgLVC8WyCxiZiWrXt6albknM9MMXu8nHASqw5x2mx41WUYB
	H9qA70549eBQUyzq6ZtpLH/hCI98INtheCd15AVSEtGZPZJkZQb/jSRiy0CJ9Fo8
	a31FmQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acwbps2r8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 22:03:01 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7900f597d08so116295b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 14:03:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762984981; x=1763589781; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d/nTs8LVBJqSn132QZVwYlosV14mCj856uKAHF6W+UI=;
        b=ayD6aqHy1i8E/alErBmXzSYmtvB53+UtJEieCot9SWYJlkgN8D+6Q4B8MM8Ff0tFlg
         vfdcuCY7gHQt16o/Q3+alXl+WiOROtRokMLELA46u3FfVCf+myFK2xVAYvGQa+aoPZjI
         TqnrIopgZU6q4E/XneMam9gE0X99/suqfx7GIHzAjxpGrFNmiOXqu/vJy7QO/IQfwtX5
         qiDgQuTLiVYKl0FLVkY1WCmVL4T7kUFb+IUqOcxFmBflco6VEnLLF3MsTapLn4XsFefY
         pVnVUcttQSpsLlLnJcVeemG/wDobofDYGmYsmD/N/PFtOLMlI/GJJx+odwRKMqEreFCP
         o+qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762984981; x=1763589781;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d/nTs8LVBJqSn132QZVwYlosV14mCj856uKAHF6W+UI=;
        b=j6VGwH0heEmTZRdoBkNxBkqm60uvA7n4Fe7tvbQOJ4/N3AWYIwuLMEFdQqCtRU8Ocj
         vU6yL/dv5WnE9xYUC37rl5QD6Csx746nLIAERjjMkgyp1E1Ugr77MVEnSF02sW6mLUWt
         z8N6pDIO5nxnGuwzIGosqsQruqFmPBB8BS0tvm3sO7vN5iGTdal8lrHa5CUEp43MdYWn
         h7Yvy+izqII77TPD6ygjJTar4EJKnaeyEco+9x1T+/Cq+YjEKrScXia+SbW8/sQFmuNv
         LjkAtQw7uSxsRGSRZaevwHVF4mAY/egYW2+mag+Pdnd4wESZvLVIAQXdoE95zJEY9atw
         GkKA==
X-Forwarded-Encrypted: i=1; AJvYcCUrQqOo2szxIutglQp8mEexc0Wrud8FtlO72816G6Cl3y7fBpeKNEj2BltOTlkrvlLv0nHnHgASVSYibKHc3P/9@lists.infradead.org
X-Gm-Message-State: AOJu0Yyy192QS+q4kKgWQmg3IM118Y5hvSlOXgp8+ASkXyoEe5MKdNTB
	l+z6ohL7t9svYgfgaEIuzzC/NXT9k4N+y1MMEUHSHlIYU2s6cqznJOu4gmM2Xi2SwcLTmSMQahA
	xVNDbZxJ24JmoKtEFyfpn8ih1KLlata9Fa9YR2GTtAQeSr29v03qWxCKd+adrTL1+MR5O4oh3wH
	oSzQ==
X-Gm-Gg: ASbGncs7m/NNWzVDVmY6SeNZNZHcUy5MhxM0lYJdfDOL/XM10hHSIzxUKRaxGPaPKdt
	yMTpvpUh3w31ThT3MiqtevluxsKuYsjB9aQsBrf9qWq85wXl3zY2GyiHZw5uRhT/OVu6GJOO7tS
	pZq7EWlHP1oHCmmbd6QagBVb4aZWAqYf32los7GTBD20sr9p4COF/JrT74RixsIGEClr6yPx0XY
	yufh1IUhe6kn7gLb3E17IOYKX9EkBu8H6Lc8vqjOiB7RwAWcNXXBNwOsFbSu1aVT8e5/hFK772j
	umZVH19nAKWwVCJisBLs65ZvlFtMrtMGMHRHSlCUoG49T89RA4E4BzLXXcCln1ypu7Mh/+2yGcX
	VHKhdcsSEoeCp3hnX9FJPbQ==
X-Received: by 2002:a05:6a20:a110:b0:306:2a14:d0d4 with SMTP id adf61e73a8af0-3590b514a27mr5686002637.43.1762984980830;
        Wed, 12 Nov 2025 14:03:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHn1u1Nzkjc6Q6wIjoT4YUJ/liTOuUsOAfbNf14qAseJxfRuSew1Z6BWUptugvCHiHCrtJQpg==
X-Received: by 2002:a05:6a20:a110:b0:306:2a14:d0d4 with SMTP id adf61e73a8af0-3590b514a27mr5685964637.43.1762984980255;
        Wed, 12 Nov 2025 14:03:00 -0800 (PST)
Received: from [192.168.1.5] ([106.222.234.47])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b9250d28c2sm54557b3a.26.2025.11.12.14.02.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Nov 2025 14:02:59 -0800 (PST)
Message-ID: <12e6f588-e422-4803-ae14-56e5297e564d@oss.qualcomm.com>
Date: Thu, 13 Nov 2025 03:32:51 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/21] drm/msm/adreno: Move adreno_gpu_func to
 catalogue
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
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
        Connor Abbott <cwabbott0@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org
References: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
 <20251110-kaana-gpu-support-v2-5-bef18acd5e94@oss.qualcomm.com>
 <28d62905-c191-4c3a-995e-a4146ffce619@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <28d62905-c191-4c3a-995e-a4146ffce619@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=NvjcssdJ c=1 sm=1 tr=0 ts=69150415 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=2IP1oaZ8+KUWsYovLW0HHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=6-R1E5pqECOcxGsB_ukA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: BiOso1tFE0zMq3KeYnltzWOY0NZVlRJg
X-Proofpoint-ORIG-GUID: BiOso1tFE0zMq3KeYnltzWOY0NZVlRJg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDE3NyBTYWx0ZWRfX4vT8o4VtuIFc
 JZqw5bqG4rMdTVzZkwRxgQ2Tf7Ncr/sVxk9Z+ClxDktiMT0PG+4jO/ietPrYWd+YPHE7VkA8qlT
 dfDCLxQicTqh6sezInWbmU8FPzOigVvU26pCMN2HlxZiYXMZZc5a2kzmxJVwLV8XygUWQq1YrIl
 XtafDqf0WxgpfsBvMtjuEFV2aExp3wEliiDc8CgFEk5Z9UUE8WWZ8Qf0zdlq6JOKfuHiePQy27a
 hB5pFsWED9zmchRdrzBcUAyGw1HKxo+ka+d4o0mKFaj2XWp3T1xY4eN1YTVt2MK+TtGetXDoLw5
 oWxCzDdJerVD4Anm9WwlMB25aUBoulUrc+4m/8bs+7mg7Fc2tk6F1vjtzPI3YWNcCoYI1mMh8zU
 HQ9PvZlrnmGAk4lEEyjDWVuzQLVjfA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_06,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511120177
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_140303_427368_D71319FD 
X-CRM114-Status: GOOD (  14.72  )
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

On 11/12/2025 3:52 PM, Konrad Dybcio wrote:
> On 11/10/25 5:37 PM, Akhil P Oommen wrote:
>> In A6x family (which is a pretty big one), there are separate
>> adreno_func definitions for each sub-generations. To streamline the
>> identification of the correct struct for a gpu, move it to the
>> catalogue and move the gpu_init routine to struct adreno_gpu_funcs.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
> 
> [...]
> 
> 
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> index 44df6410bce1..9007a0e82a59 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> @@ -683,7 +683,7 @@ static const struct adreno_info a6xx_gpus[] = {
> 
> Somewhere among this diff, a619_holi needs to have gmu_wrapper funcs

Could you point me to the holi's devicetree? Currently I see only a610
(sm6115) and a702 (qcm2290) uses gmu_wrapper.

In the driver, adreno_is_a619_holi() checks for both 619 rev id and the
gmu_wrapper.

-Akhil

> instead
> 
> Konrad

