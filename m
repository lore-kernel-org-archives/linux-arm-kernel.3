Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B8D2CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 19:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=brS60HbFUtOuWxvnUIY4WzudlEdGwstrPazqVvcT3+g=; b=WskjbKv1xQsKF2xc7fjSADyQ6J
	f47erQPLndIIj8M4F5KqNU7pEVCJtAGmN4TtbHeU7TJjkM3uJ15DBOlruTHBKa/lre2KhXLyhM5CI
	xvgNuTLQf4eqr0l+Whb7BL+kcX01JfiR9Le7cxGOcWF8nYI0MTgrcn5cXm6ma9sKq4cLhr9ZAWdKI
	IEhwkOyZZJR7qywAFqNW5UKxSZynbEN+KaK7Q72dJsGQffCTadLZvo7IDniJfG0KxPOAoEsE/kUif
	c9wRvAYPVRr4mjhyPV8azaW7JJnZmmMfoIsSin6G7spuCD7e7rg86TKfm+Mt5/maCF4XlgzrjQ4K6
	hNoDSa6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v42uc-00000008s0T-2Syd;
	Wed, 01 Oct 2025 19:54:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v42uZ-00000008rzj-3gYR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 19:54:53 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 591IcDnK012562
	for <linux-arm-kernel@lists.infradead.org>; Wed, 1 Oct 2025 19:54:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	brS60HbFUtOuWxvnUIY4WzudlEdGwstrPazqVvcT3+g=; b=ZGd5f1BrVBZ6J0/d
	GYp9HNUCicoqdgxC6Fn4OMf68pMQQnYq5zgVOTJTfA9rCaPc8cIrGVwlCIpNh3qm
	tmm009Me6aoJTVIH91yL/3FWIH5QAyAxwiE44y2kKrxEu58dusLLuIDhjQqhdB64
	i5cZfKsWtyVQqnZq1zrJPnxf+treMgaPlW9mawts3sNw3Ab8hXM/PPxyxat/3h/A
	LQaS8Vo3RTZkoVloD7PfwLYYOHUx6EmaZM/7hyq9apE9NlTeMZvHTV7U5EoilAw1
	7u/rddjgU3YyWt3ydzBg5XvJcv30JWPxbO8m0aTUPMFWvFgFCSw7/Sl2q1Dw13sw
	FCoVwQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e80twwer-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Oct 2025 19:54:50 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7810af03a63so499553b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Oct 2025 12:54:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759348489; x=1759953289;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=brS60HbFUtOuWxvnUIY4WzudlEdGwstrPazqVvcT3+g=;
        b=Xp2t/bbQeMWoKgS6oUwa+w7APdkQkAlHYjJt8O15BLqmCDJXbwIknYyk+dYoOW0ku7
         cQqrviubHMP1skC6H+ZkA54ppcP4Hoicsyh8wzO39TeKrPGaO+vAqQUkSJftaI6W+JJ/
         eGJIIw/CzTuGGhWI8KIw0wYHo9abLFPZaCYR3MOPYw+CdgkF9n4patM2x/fafT4cUIaC
         ifP4SVe8FkS95AI5SEGBmXBbDO6Ekzr5/7i4eBspt+fyr4Ud5m6ku10azzSefYmSceIc
         EAiLRQZuQIitvzM5Nrk7nLfHYWR1KFe5yIo6EvgOP82U34ZqpSaYuwIFSSuhufCB/NG4
         QxqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxOTL/r3ToHJ2Bt3zrr2E5laO4RlbBlCMWpyB3IJSUWw5c/xSAUR4s95pdzPKzBxRvTGJxPjltKKoskp6qqxYR@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8/EzqlM+1gVaeROCQAi/IaQwDSHp4UoHv7BeSP/Tj+wmZKLcd
	CtYE4pdKXOvy4HLpQzxuGxwsM74tXA8/LGYjU5YbkXpmdfyhLUxfsFdayXVYCroV3dSGdu8B5yR
	X66MvLysd57Cugk46ssrw9jQ44M92n//oFnboDJwdOsnK2Os/s9wZb1lD+FL3IfuYZenTfNkijl
	257w==
X-Gm-Gg: ASbGnctNk0VGNTYTJGUbMlB7gQqjEpmQ3bni3jbjtSbGx1vto1FeKI0c5njg09l6JGE
	WKZDQZkeHGctXNI3Om8FtsprFdng4wxN+oWyrXjJwx887DkthfbRd4hvYZxBSXxWymY2K+MEbPs
	LNl8x1ulCJeNxAQegeJluF/RAYMxc/g4HaZwSpoodbnMuIOQTtdmM18dv6JozzqCvfRKVd5ufC/
	xFvhLiuMSYYNAUXToMiy30iSpOXlXi2ZZrAsf19Z7xA9UgMsORCkS3crMzcB/zWYcpWx4VsjELM
	vBDq94D3pPE7upPUc4jSlVJzODsh6eJxdREWOgfnVkteAIeI5Gu1D9ZFafAvBDDovFM=
X-Received: by 2002:a05:6a20:258f:b0:2b1:c9dc:6da0 with SMTP id adf61e73a8af0-321dfc7f1b3mr6835314637.46.1759348488862;
        Wed, 01 Oct 2025 12:54:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHsIg+XF+b3CzfwLXlkZJJwTtOF3hWxO1NYUBnIl48kRjZPlbxjVEtrqF7B3r6dPLdbru/a4w==
X-Received: by 2002:a05:6a20:258f:b0:2b1:c9dc:6da0 with SMTP id adf61e73a8af0-321dfc7f1b3mr6835273637.46.1759348488399;
        Wed, 01 Oct 2025 12:54:48 -0700 (PDT)
Received: from [192.168.1.9] ([117.211.42.17])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6099f729c3sm297566a12.46.2025.10.01.12.54.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Oct 2025 12:54:48 -0700 (PDT)
Message-ID: <82cd8782-b2ee-46ce-9964-e564ab6a0199@oss.qualcomm.com>
Date: Thu, 2 Oct 2025 01:24:36 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/17] drm/msm/adreno: Move adreno_gpu_func to catalogue
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
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
 <20250930-kaana-gpu-support-v1-6-73530b0700ed@oss.qualcomm.com>
 <cp7djnezyp4whhfqcnsfpes5kxfbyvqvc2ceimdrnrl7s7agyk@z7ozx6oihezd>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <cp7djnezyp4whhfqcnsfpes5kxfbyvqvc2ceimdrnrl7s7agyk@z7ozx6oihezd>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAyOSBTYWx0ZWRfX1GZBKdH0iwtl
 fk6NmETCRn/DhCVrkP5FL94bPAabV699NhK0igFKklpk2UbnADZOHxKbDwf2UK1V/POzBjkzx02
 wBHqBC/bIuhdZBlQMfXg4oZRW8aiL4I6mi9GyX+tWrhswoE0A1skZyQICPdJExjDZ1ZNghKam3g
 0ri7v6rmCs+vL8QhY+iG50xFNCONSyLm5VaGWr6qwEZJhax5b1U5EF42FEYzAJRbSnZsXCPE21s
 JIAS2tcdyY8U9KgFlyc5g9rz/Bccwau6nZyBzrfTNLs3yhjNFXpJHsN04/+xWUYcniP4F56EOkH
 GNEcsKk3tac14CAMZ7pMrgPAueqy3I9Io38eAz1F9Tq+2nEQeaB4Bz0CUQ+fLP2BBHHvCHRs3z5
 QyFAVXDqXkANDKlaDm3CFdsrXnKczg==
X-Proofpoint-GUID: AIP_3UraWqpK_e3crfJbjxsMeh2uHZge
X-Authority-Analysis: v=2.4 cv=OMkqHCaB c=1 sm=1 tr=0 ts=68dd870a cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=paYLq2NZIH8GVbL4gQAG2g==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=Qop4gD_cnJnpb7o7aosA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: AIP_3UraWqpK_e3crfJbjxsMeh2uHZge
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_06,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270029
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_125452_037695_899734A4 
X-CRM114-Status: GOOD (  17.28  )
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

On 9/30/2025 12:39 PM, Dmitry Baryshkov wrote:
> On Tue, Sep 30, 2025 at 11:18:11AM +0530, Akhil P Oommen wrote:
>> In A6x family (which is a pretty big one), there are separate
>> adreno_func definitions for each sub-generations. To streamline the
>> identification of the correct struct for a gpu, move it to the
>> catalogue and move the gpu_init routine to struct adreno_gpu_funcs.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>  drivers/gpu/drm/msm/adreno/a2xx_catalog.c  |   8 +-
>>  drivers/gpu/drm/msm/adreno/a2xx_gpu.c      |  50 +++----
>>  drivers/gpu/drm/msm/adreno/a3xx_catalog.c  |  14 +-
>>  drivers/gpu/drm/msm/adreno/a3xx_gpu.c      |  52 +++----
>>  drivers/gpu/drm/msm/adreno/a4xx_catalog.c  |   8 +-
>>  drivers/gpu/drm/msm/adreno/a4xx_gpu.c      |  54 ++++----
>>  drivers/gpu/drm/msm/adreno/a5xx_catalog.c  |  18 +--
>>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c      |  61 ++++-----
>>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c  |  50 +++----
>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 209 ++++++++++++++---------------
>>  drivers/gpu/drm/msm/adreno/adreno_device.c |   2 +-
>>  drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  11 +-
>>  12 files changed, 275 insertions(+), 262 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a2xx_catalog.c b/drivers/gpu/drm/msm/adreno/a2xx_catalog.c
>> index 5ddd015f930d9a7dd04e2d2035daa0b2f5ff3f27..af3e4cceadd11d4e0ec4ba75f75e405af276cb7e 100644
>> --- a/drivers/gpu/drm/msm/adreno/a2xx_catalog.c
>> +++ b/drivers/gpu/drm/msm/adreno/a2xx_catalog.c
>> @@ -8,6 +8,8 @@
>>  
>>  #include "adreno_gpu.h"
>>  
>> +extern const struct adreno_gpu_funcs a2xx_gpu_funcs;
> 
> Please move these definitions to aNxx_gpu.h (a2xx_gpu.h, etc). LGTM
> otherwise.

This is a special case. These symbols needs to be visible only here.

-Akhil

> 


