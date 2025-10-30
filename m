Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 910EDCCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 14:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aQyeMtemgCoOzTzlwykczyRlEpZ0QjYCHYEqGRqhGag=; b=uF2oslDiQ96P8aS3NfEG7+k6LE
	uyU4pdp89jDqWQKJOGNJjbgf47NkotuBVKex+5Eh0sTX5NK4+jeLXp34SMS9JF0Ub9eJwSadG2fKq
	Nbp2lRlmxEx7LwTpR4g4rSl4qgyoVOlqe+lOAv/BKvDeWGOCl0unMCgHw67NARzg+MlgMSNaovmVx
	TRhQj30xtIyElURluf68Ab+5btd0pZy1dlX8PMQNGTQ1cpwDGV2823yd2oJOeqovt6vGTdt058N1D
	P2Pvo8FtNDX4mwQP4HpOCSa2/JuPAy9etJZHnjIYvBmA8Ga1/Vpn9496C7FZrEdiIK2HvfvVgbU6j
	xuQ7BrUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vETGX-00000004Gx2-3bgt;
	Thu, 30 Oct 2025 14:04:37 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vETGV-00000004Gwe-1j2n
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 14:04:36 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59U9MUKB3115499
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Oct 2025 14:04:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aQyeMtemgCoOzTzlwykczyRlEpZ0QjYCHYEqGRqhGag=; b=AWuor9Yxkz6K2wy3
	IiPbM7oYI158WOrYLTN7eMPnu70Uu3AuuCOcn+C2w4weR3T6rH0AVFAd8haAFv/H
	pNOTpocnKQbzDT9i+zu+/tXr0ZhoFM9AL3KPw8cFanSHVtw7MGl/3zpSrFwgl/q2
	0znrD3KNsyRnHMYKTFNSXUOSvUj7qrbSCBsPrJd28y8iFdv9h5hgmwvolEKYfvyW
	KmBmsjWOrA6rN7696+mrUhXbV7d89iJz9P3oZmHddxBMxy08Kh/Pcxii9D+xnwb2
	+Mlze/ikiy/UbwTVNSOmrQ0jJVssydVZuXIblCFlRmYMGdkiJ7zrRwy7oAp1LC8y
	R045iw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a45b40rug-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Oct 2025 14:04:33 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-78117b8e49fso2380540b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Oct 2025 07:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761833072; x=1762437872; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aQyeMtemgCoOzTzlwykczyRlEpZ0QjYCHYEqGRqhGag=;
        b=h0q/w5grVTr0VKQCwXDzJIlzx7AbM4GjwXMDqAvzK8EbFvGJu9I2d2pBDxtI/NWixI
         utjLs200r80kYiLd6GykvXv23qkdE3bdq4dGig22fg8SxH6fF11KC7f9wPJHR2ImBsZI
         DGjpizdtzhRiqUJSMpOmR+bcVJupGXKVAJtgKYMUTwwx1oEheNLWBongOd+s4nptmeOx
         4k5dECa1YGdXZ1kFrNrXte2dK/DBYA8KJrJ7CaGkmiAHlAq+MO90qGIMu1yQ/wwhaQ5n
         zyT1kKB/PHxudvTiK3tBJhkciELESZjdyekBDam+pTcXYo7TbqdJBn4n6S8sBalXjfNs
         d92g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761833072; x=1762437872;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aQyeMtemgCoOzTzlwykczyRlEpZ0QjYCHYEqGRqhGag=;
        b=BewWNHdHfGjW54W4CkdTucOwBeNr+3HQ+TO8VThUdveRBZ0L9gRHneiSoHUPJxGol6
         seX+xQEdBqaVXa3TJjS5gGAWuJZmvuoHVO1XutMMgQtkhfqCS+6GtJvFYBGFvC0BixRc
         hu4L0PZIMwgY5kZdNZ006QIfVYBNLPSf7kL+jSyemSp/1dl5UH2i8tcrFfs1mtmQ/JT2
         zWBNNjUJLZn3pGhVA9VWV44WSb7GCFieMRH1zXVMPNqTbxnutdwaEOjGeUFgSQUMWmv1
         zmX3mg2UdJczuK5ntyRLxzRyLFrrrLOp1FOXB/ibhK7mV0hBinAJpLrHUhqvFaYwZAog
         aCGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUS0ENEJuLUykFMeLS26ApjPnUU77oFKn01HkpIUrc6VG4X1RSkBgLag5HJ9YAAo3glt9xYOTGRTG1oFHp2lfKD@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4PKFJ0np8QLeeqCI8af6iRz97PZaJsU5YT/9cFxnRpHwMrVm/
	xQm2WqN43fPRt7vQZ7d7gNZXre4L4kaKcVRWIP8LF2ebM3bcbrFsyGvfSMxnjmnuE5VwqFEq7U7
	++7av0C8i0CB1AOeAO7fe26VLPkjB/8olBCrScR6A0NtsiuP3LekuXjWJuefT7zK2kLU3vdTuHB
	Jvfw==
X-Gm-Gg: ASbGncubWXJJPv/jPURM5Lwj3oqKdXblJqzbraAnmS1v0RKcWt/CkV3HHuCjOfEoOk8
	WMN72yk/Pdl7p/+KuV5ICaQXGPIA28HXHRJMXmyTf0a7JzrCKXpatje22KWG83ajK2hNAHDtS/c
	7f0NKuFB1p+xdHRPPQWmflF4LCmEKZPYpbYQGcnnHgoEgkLv/oYV5XmCJk20CtPb1OpNLrl9Fxi
	thYBCAeoIjG5UmLfz1D0QqTpuv71akQh8geMmmgSSxh+Pm87PdI+jPCxfpOJWVnihF46W2t0j4z
	T3fsRV0KjmVwP9ZhJ/jAfTrEWfuyHb7ZlaXYkVL6C6UrFcTo2xUy/3z28k0+hYjAcKUdTnCSnxo
	AyaGwifikh5uAbHE8wia7OA==
X-Received: by 2002:a05:6a00:1786:b0:7a2:8649:5ab7 with SMTP id d2e1a72fcca58-7a4e2fe7764mr9513750b3a.14.1761833071963;
        Thu, 30 Oct 2025 07:04:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOsm+Sq4JNvFojnAbXxBbvyUiQ9n1HBmXRQ7fcHIwRyOXUnsy9UNUn/WOnPgjzpqXGKHxy5w==
X-Received: by 2002:a05:6a00:1786:b0:7a2:8649:5ab7 with SMTP id d2e1a72fcca58-7a4e2fe7764mr9512694b3a.14.1761833062850;
        Thu, 30 Oct 2025 07:04:22 -0700 (PDT)
Received: from [10.204.104.20] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a41409c703sm18826520b3a.70.2025.10.30.07.04.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 07:04:22 -0700 (PDT)
Message-ID: <4b41cb16-858b-4fc2-8ee1-3a7171712808@oss.qualcomm.com>
Date: Thu, 30 Oct 2025 19:34:13 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/17] drm/msm/adreno: Introduce A8x GPU Support
To: rob.clark@oss.qualcomm.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
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
        Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org
References: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
 <20250930-kaana-gpu-support-v1-12-73530b0700ed@oss.qualcomm.com>
 <CACSVV03HaKAvfDa5A5LqRZM4_o8g-haVU3A6GgWqfTO0QNcK2w@mail.gmail.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <CACSVV03HaKAvfDa5A5LqRZM4_o8g-haVU3A6GgWqfTO0QNcK2w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDExNCBTYWx0ZWRfX50Z0lfukq7gy
 ct4Fjsif/AT7EAmaA2x6TvBbudPUAHK1fZhx3nJKTQ2TuJ/uwKLYzCpnNtDDeNaTBKXIcORUpuI
 oj676qxreLeGtrVCgiR7hN2NdusUAR7dUQfaCuIFstnCWQvKxa/agy2cY/HZwQHSFw8ftnSV8E+
 60bu5+4JERVshm96YlkS6SALcjT+tnR2qc5WU4+r9xXQqZ20bOUJUPrDzZ4j+J9UyR2D31HjgMv
 sAzDeVUG4ovyEWWipc+GHAo9y8LPgNLBglVrouyf2dJmRjZnClWSoSpY54FGGNaxVZE1FVopYIy
 8mZo1M+VS8vZjwo1aNxqxEzZ9CWCaGP54tiHteZVRGE+wrJEXZ+2mTbyfVbAJiyVTbOSfKy5Ljx
 ZH0TacdWf7ySz+v74PInK7ThqWX1Aw==
X-Authority-Analysis: v=2.4 cv=KePfcAYD c=1 sm=1 tr=0 ts=69037071 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=ktRuAwBfdPNgXckAlmEA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: uzxueApCL9s1jmoz6_FmdHiyMfRf_9qS
X-Proofpoint-GUID: uzxueApCL9s1jmoz6_FmdHiyMfRf_9qS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_04,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510300114
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_070435_591789_A21F9822 
X-CRM114-Status: GOOD (  15.00  )
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

<< snip >>

>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
>> index 0b17d36c36a9567e6afa4269ae7783ed3578e40e..18300b12bf2a8bcd5601797df0fcc7afa8943863 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
>> @@ -46,6 +46,7 @@ struct a6xx_info {
>>         const struct adreno_protect *protect;
>>         const struct adreno_reglist_list *pwrup_reglist;
>>         const struct adreno_reglist_list *ifpc_reglist;
>> +       const struct adreno_reglist_pipe *nonctxt_reglist;
>>         u32 gmu_chipid;
>>         u32 gmu_cgc_mode;
>>         u32 prim_fifo_threshold;
>> @@ -101,6 +102,11 @@ struct a6xx_gpu {
>>         void *htw_llc_slice;
>>         bool have_mmu500;
>>         bool hung;
>> +
>> +       u32 cached_aperture;
>> +       spinlock_t aperture_lock;
> 
> I don't see aperture_lock used.. but seems like maybe a good idea if
> a8xx_aperture_slice_set() acquired the lock and we had an
> corresponding _release() which dropped the lock, so that we couldn't
> have race conditions between the users of the aperture.
> 

Yeah, I guess we should add a lock because the pagefault-coredump path
and gpu irq are not serialized. And both of them are users of aperture.
The other users are serialized already with gpu lock.

-Akhil

> BR,
> -R
> 

