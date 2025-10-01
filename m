Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29084CAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 21:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tY1kk2Q5hRz9w3+RRK/dSbVzsoNAtpTZ1wIZRGTLaPE=; b=mMaLx80zu7En4Vc8BCHdhWnWXR
	EF4E/mA2DGxQSSA24gwF18x9w80RCO/oYAnU2+MtqrZGSfj1kKelEL/HQBV2Po785FJNyiKCpNVzh
	ZMdVjaJZ+yuGk5f48Bu/YCgZQ3vXTq7RA3phoa7KiMO3QCI3RRW1pi3feOO3SGvYbCOHKqTy2zttf
	u/YOnHKzI2NlG4aTR8oF8gECwUWehjImJlh8SvUS0/66l83fNuKHS0zNno9UYVaDF1LHTuOQdhzxg
	LQ/CP8GkJbxVBjQI8uowCxZBsYgqOr16pXXHkRc58xYAoR2/4LzPcwxeyEyQpHhMOaKM7qllit/Je
	lcXhxsqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v44Hh-000000092cd-3FXX;
	Wed, 01 Oct 2025 21:22:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v44He-000000092cI-33Eo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 21:22:47 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 591IcOH3006105
	for <linux-arm-kernel@lists.infradead.org>; Wed, 1 Oct 2025 21:22:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tY1kk2Q5hRz9w3+RRK/dSbVzsoNAtpTZ1wIZRGTLaPE=; b=AEoBOZbY5dwHsaEu
	nCz2fNZKcAZfaYdo5d5ulPVRFWJ8zMZ7Mi2+jxZ1vA7pKIwX64LOdeMVvEmiD8rr
	sIDuv9xRcIAN69afsfe63q4APcIO2rPZE4ANruDmLiGkhcnlLxQlv0q5guwKKpdT
	8E/5BjiSkPiIHgQSXaWF5esBN9iECy0OktYe35tQKHWp+spFR2VCg2UuIy0DOYHJ
	lg6D0+O5lQ8xw2yAfFk6mov6NbrGiJxdlmEvUy9Vth2d2s8r+3W6cZf4dZndVJuY
	lZdnaPHFWzfCQzJe/5uh48ZM9lA1XK4aWdq70vaLqAlFNBPOF9UaA/2fqIiNCT+p
	+1Hnvg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e851nxae-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Oct 2025 21:22:45 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b54ad69f143so343584a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Oct 2025 14:22:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759353765; x=1759958565;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tY1kk2Q5hRz9w3+RRK/dSbVzsoNAtpTZ1wIZRGTLaPE=;
        b=mocbnRfoVnKlYZOhzqrvss8/oXI8Q+XdUClAOtklSapEPhuEZFn7I+VDptFYk3hw4p
         XmK75NJi+CBW+wvkx5292sVJm8OQ3hhYWb8dVIZfyqaizW+THtEuGRiWDyjdc20A77Yj
         UvtNP9zrxM96TZBvv3UzWsS+XR3U7QQBWww5AL1t2CFiXL/tW5eHsRqYdWU1+iMx6SrI
         S4jO9FRusUajbGjgkwvoGUZoSRPbyeVM2PeQubhWHGBzcnzKtVNEn1z2H8vhYMiOZbIF
         wxb2hHgviZd6+ZOFW07m0mOi2KBsX0/VvTxzf7e5s80FOKCJLleIRn3FXSHLWir0LviM
         79bQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBeAsM/7bvq5yi9Kva+J15iVmLT35oKFTeBQsnqlcn47Wr83+CgG783OBU2Z583JkIyrtf6AlHt6gtUx9DFR5Y@lists.infradead.org
X-Gm-Message-State: AOJu0Yzkx8CxD/+l+HDZFXWS0o6EmfaeiJ1blxEINm8D+q54zVzvw6BU
	N4oYblgt0SKuUiRbBvxvyuXCI1Ypu6CMWyDJ095XrO3+Qj+6fWaqFb/O/8PNJll4uLM1gn75JOi
	sxdREjtOZ/0ZCB2Na/MG/lPJBDC0/UXryTVuhRCBBbwQhl54nJla9KFkMpu5+oA7EF5ZxOFLEAt
	MjeA==
X-Gm-Gg: ASbGncu2ftGXGHfsgkQneIYoxJeZlz+1bhD9GxmOZWsAE8Vh9oYsl53FuCS8k/PYd1D
	+y2+4JfGnEcvF0bUWQbynkipjHe2nBOJcQ95gQHGtP2dFz9JLNB77ACii/Fx62izJy4qnFwlPVG
	il6OOcsTPN2Gw9BhLDbe0US+UEX3twiYhc8f7CY8CRc369OcMVDVBwJ8Zlbhe+58rTAYsP2GY6g
	7jHiXdN46uUdkKjywbPcUfCf+WnlBs9Yqn1vIW3SByeksG/AXpWwXojtKYfn3EV5lq7tSsrKmra
	96UEI4joQfr3Te1empplVJ7lWp3RVaWeS29RfNMhnnBNh4Zqs04YdgnbIPjHChlfoEE=
X-Received: by 2002:a17:90b:3143:b0:338:26e3:ffb6 with SMTP id 98e67ed59e1d1-339a6f5329fmr5484047a91.26.1759353764862;
        Wed, 01 Oct 2025 14:22:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE3J5m7IdAEVQ8YgjK8xPIMo/mwc0iZ4ZB/L76eAW/owdYw7sgKWjOIFg1cMlAzuYnR+gwPtg==
X-Received: by 2002:a17:90b:3143:b0:338:26e3:ffb6 with SMTP id 98e67ed59e1d1-339a6f5329fmr5484006a91.26.1759353764421;
        Wed, 01 Oct 2025 14:22:44 -0700 (PDT)
Received: from [192.168.1.9] ([117.244.71.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-339b4f3caf9sm623334a91.13.2025.10.01.14.22.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Oct 2025 14:22:44 -0700 (PDT)
Message-ID: <edb8b0dd-126b-4ed6-8603-119f1fd52baf@oss.qualcomm.com>
Date: Thu, 2 Oct 2025 02:52:35 +0530
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH 10/17] drm/msm/a6xx: Rebase GMU register offsets
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
 <20250930-kaana-gpu-support-v1-10-73530b0700ed@oss.qualcomm.com>
 <s4no2wy3yskk6l6igtx7h4vopaupc3wkmu7nhpnocv3bbs4hqi@uhie6j7xr2pt>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <s4no2wy3yskk6l6igtx7h4vopaupc3wkmu7nhpnocv3bbs4hqi@uhie6j7xr2pt>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OJoqHCaB c=1 sm=1 tr=0 ts=68dd9ba5 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=2kejHg7nZSoTgEpwAwsXNQ==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=DsFpUOTLdg6Fp_xZM74A:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzMiBTYWx0ZWRfX3e9/3C+yDX03
 JRax4kjskluChH52p2ESc0xPcWjZdGmINerYDhhoWbjsUCSG2uRI7+SvHJMgO5xDchZrt2iyZ3t
 xHsfBdOdb1ytnFYeKD0jLy48PKrqDp4EROkhEvGqpd1+emFd/QarlreqmwPG9/SumpneFOAKh8F
 O5cyF8PFyz2iMbiNT0nSu89L9x7m+dpWwtaBq2gtnbL0SvpQegb6dGmVrxQiXAorTuZVPLR4hge
 Vf/yZURTN6YyIkicanZHDuphtCbT+xWDtrPSpKe7fvkLB5/QTTWhgzHfILj+Vnv0mpA2KmqoEn2
 ZeDU4rkLozozOVJkGXFhnlhp1Cm2Ac1i2NCy9EvjFCsoduQSu6OR3SnpBK9e/HRsDLtCOHD0F0c
 WYEjQFCk+1npDNxprBpvDarj+GcibQ==
X-Proofpoint-ORIG-GUID: 9tFpwvdrS41cumFwKiEqKEFHWlZz9SZq
X-Proofpoint-GUID: 9tFpwvdrS41cumFwKiEqKEFHWlZz9SZq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_06,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_142246_805344_41FA341E 
X-CRM114-Status: GOOD (  23.91  )
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



On 9/30/2025 12:53 PM, Dmitry Baryshkov wrote:
> On Tue, Sep 30, 2025 at 11:18:15AM +0530, Akhil P Oommen wrote:
>> GMU registers are always at a fixed offset from the GPU base address,
>> a consistency maintained at least within a given architecture generation.
>> In A8x family, the base address of the GMU has changed, but the offsets
>> of the gmu registers remain largely the same. To enable reuse of the gmu
> 
> I understand the code, but I think I'd very much prefer to see it in the
> catalog file (with the note on how to calculate it). Reading resources
> for two different devices sounds too strange to be nice. This way you
> can keep the offsets for a6xx / a7xx untouched and just add the non-zero
> offset for a8xx.

It is not clear to me whether the concern is about the calculation part 
or the xml update part.

If it is about the former,I think it is okay as we have confidence on 
the layout of both devices. They are not random platform devices. Also, 
we may have to do something similar for other gpu/gmu reg ranges too to 
conveniently collect a full coredump.

-Akhil

> 
>> code for A8x chipsets, update the gmu register offsets to be relative
>> to the GPU's base address instead of GMU's.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/adreno/a6xx_gmu.c             |  44 +++-
>>   drivers/gpu/drm/msm/adreno/a6xx_gmu.h             |  20 +-
>>   drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml | 248 +++++++++++-----------
>>   3 files changed, 172 insertions(+), 140 deletions(-)
> 


