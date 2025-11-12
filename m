Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB17CCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 10:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5tMUAPHj3MTUC9Ymia6xtrQkXoeMohe0oVZfqEDumFs=; b=uugbS2BAqPuVHD2FaVSwGnsrLN
	fKu+gawVB9OeOvYW6Uai6B2Ya+MSI+mJv5AsAVjyUxACUynVoFy7xEmZo6X2J+uCKc2aQOFvMbKyR
	k+Z+s7HLfJr41Jvksp01ecFQz2YzpsM+qbL64REWA3NyeXXp+WmVFaEzot/BADzYn7afM/h1fQfyX
	gVhLyy66ZC4ugJDXPvXK6A56F3pys+YoYaJDj/0az0/XtfX5mskms6XOQN1SEaAAAUYE/94NB8F4Y
	NHGsnCM5uBadKLOXr53mH6RoNQpgcthRLdbor779voiWQKo2Mf4WfK/E+llYv3x32Gqo48Z+phA9x
	sHFVTfrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ7lZ-00000008Wqa-06Lt;
	Wed, 12 Nov 2025 10:07:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ7lW-00000008Wpl-2j8d
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 10:07:52 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AC9gjri1109210
	for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 10:07:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5tMUAPHj3MTUC9Ymia6xtrQkXoeMohe0oVZfqEDumFs=; b=kAGdreiMYqZZcG2C
	a0uUG51Xyaex5zm8dEzDifgrYM5roPuhPx6kulk58BS+3W4TQOgTjoDq/LETD+5v
	toGP7tnj8cm8v2VOP+Lz/IpXCakCM90iM38mvClvDOeFEsYdpaWGBXd1aHjxLjpp
	AG2iXmEwEz9WwP5KH0yLT47UkP4ZycamLGgCsOVpOXREEsSXGEPofqjIuh1/A6cl
	8LeM5ogKJJzUCQJLJcS3TvjBK/3S3BtpOkBOzEhYPUkaFk6OcMno02VIYZ06WDsx
	ptIuEYHOCgcE0bzK3p9fTf3uJs5R1wFxbW1ukttPz3Fs2uSqO/F6CPSlVCgrZfQs
	ttvkZA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acqum03bu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 10:07:49 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4edaeb11630so1755261cf.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 02:07:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762942069; x=1763546869; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5tMUAPHj3MTUC9Ymia6xtrQkXoeMohe0oVZfqEDumFs=;
        b=CrfhGhKM+D+9nQ5ki6uCwfHl3pK0AXualXgs+HKZ8BjY7gl1f7qHEUDnk6ErfpMysq
         Sdll3k6fQUdZVp8USU+gJXSdOW1gv9WEtybLx+EWoZIXt1ipkSkPjNs4Cech7byF1bnI
         xRJdhK2Z7WEjZtJ52YcJTgxU7eKai15o8Wq0Pm3krTre40ipVkrIMvbPKgdXn/Mpu8hN
         tRUuRkjqgtCj5O69B1jyM7XBpSL5F2i4B7RxqitLztw+vqMPi6J6Dk1yun8FiW1fltjQ
         ERGdJCuTCLUFSS5f982e4E4J04zK2ieHH0HY2n8zP1aFQDmNHoZtHoFMvSkJ40bdWNP4
         +dYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762942069; x=1763546869;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5tMUAPHj3MTUC9Ymia6xtrQkXoeMohe0oVZfqEDumFs=;
        b=GlrMyKNAnuZDrg7Mkz2m6pbXd+/6/G4hs0EbZfeWXSPljWcjdiYv1OBoZxuXtlo/w9
         XJuMuXH71tDNn46dluMknSpaZbftds1ZtSvAOe8khy8e8lYne9P5ZS2Ze5f1Yc+zjrpW
         l7cEpqXxB6UCBnqu6rqevWVvcVkmWye8nwgAnqL4QQUtANka9Soyknz7B+JedpDZwbjz
         XkUmU54qhEQTZpZSHkL0tISSSWjEhAHTabc76GLqS+FJu2u6zorSgS+FSom1d8Vfk1WF
         FTJSWlq+VQqjA1QYlsNDAXDr5cNVo14WWud6WOEll9H4plJpRCK0guuZibjRd5OPDcLL
         HFUw==
X-Forwarded-Encrypted: i=1; AJvYcCV34HnT1RiQS8QWMq5m3ssgO4iLbRMDrZeeYsEPhb9Je/uQ8nYbuZ5Ghzs60Be6wWv8tFCR+5sHLgjh5eFdJChc@lists.infradead.org
X-Gm-Message-State: AOJu0YyA3ULJZYnX4MqGQs9sLN1DL0xSGWpIwmZEdQxXSoFGk18kd5OM
	vxmOKCpHhERYXHaHoAp67r+FvkdneNsDH6AwBw741cA/YgRAkK3RAtZJalO2Z5EcGwWgDo0Yfg0
	m05sU+B0mYxj8zLlNznSR3b3KXii7dXjxI7oBioa5WgE/qsm6Ry3S+C2HVc/+RwaqGRj8WmDx5S
	YrgQ==
X-Gm-Gg: ASbGncu13k5WdMIUKNwfIF6INNxyuwoxivzHhvMOnZhkxpv4bt97nWH42goOTH00Crz
	TwewKbhMtD2/ioMweNcNuPrtP9QAmhbiya5R4vQuzV365K3ucD0Z9tSP6A1bGwq4g/UwYPHka9P
	db6ajCTTfT1LGKh/pr2yvtlJxtLnTTmDJ6Mc8vsr+BnMm05Fohmuxtk/SJudl+vxX7Y0Mw+SKZT
	Ru9YM9bDgxij0LsdMcdBrqNvNefz+0n9znz6s0YRFnIUIR0+Vq6tekHdDIwb2jzUhGyvWk9GV86
	6jFePLCbGNWfC8WvOZ4KQWRHe4X0fzZXRerWyfszm206/Xlyb1nHesf++ZesqMPsHLwF+NOLdKP
	bBJUzhRwhD5/VzcKupDAZz5PKbADGG+3SY49xIuzX6rtd+lrBT4gEebjz
X-Received: by 2002:a05:622a:18a2:b0:4e8:90f4:c3aa with SMTP id d75a77b69052e-4eddbdad648mr18859671cf.8.1762942068446;
        Wed, 12 Nov 2025 02:07:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGd6taWWH3kgb8r8uxKAXxyDkXj9rB9AL10HGL6oyqqdNWof71H5ltc/gx7kawJfP1MWxxJCw==
X-Received: by 2002:a05:622a:18a2:b0:4e8:90f4:c3aa with SMTP id d75a77b69052e-4eddbdad648mr18859471cf.8.1762942067993;
        Wed, 12 Nov 2025 02:07:47 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72d3baf872sm1427413366b.27.2025.11.12.02.07.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Nov 2025 02:07:47 -0800 (PST)
Message-ID: <da9e9d31-7745-4eb6-ac24-50905dc2a133@oss.qualcomm.com>
Date: Wed, 12 Nov 2025 11:07:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/21] drm/msm/a6xx: Flush LRZ cache before PT switch
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
 <20251110-kaana-gpu-support-v2-1-bef18acd5e94@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251110-kaana-gpu-support-v2-1-bef18acd5e94@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDA4MSBTYWx0ZWRfX7dRyjht0EGe6
 F2bTjCE/luyX8Lk5So3mqKd1tegMYZHRmqXdumr/sd60zk80Q9mYadPoJ/tio422DTRUQTaOGl/
 br7OZH9dn77sUJ3Pc2k2cKM9sbj65C9PbPy+BGvkfeycBRPMCG3nbiGvEi8ihUq7VCEc83tePf6
 lbjBkmhxa43CO7lhIzgSW1Z33Ph5pLnKRM14M+2RIRs3Z6PBmxw58TQl6nQ7ShWuY/I3oB0/2M4
 3fKyuSGnDWPKA86kp4fa42/+VX4cPMoCgcDrBLL64sXj1NdrtdN1JnehKX76drr92ZrkdnEgY8B
 NdadSOZSjcY+huYqle6MzO4y8sTJNqGokcEyns/WJGITZsWYWOaInqcpUzjVArch7ePFXcr47bS
 pLvOYA0TvSUZv45JCdD687OQcVZ9Zw==
X-Proofpoint-GUID: sRrTSyc3ASM-tjefwFwTWZBAFL9rrHPA
X-Proofpoint-ORIG-GUID: sRrTSyc3ASM-tjefwFwTWZBAFL9rrHPA
X-Authority-Analysis: v=2.4 cv=KeTfcAYD c=1 sm=1 tr=0 ts=69145c75 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=FVkm2KtGXHSZZ5XTrLgA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_03,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511120081
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_020750_813066_ED207355 
X-CRM114-Status: GOOD (  18.50  )
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

On 11/10/25 5:37 PM, Akhil P Oommen wrote:
> As per the recommendation, A7x and newer GPUs should flush the LRZ cache
> before switching the pagetable. Update a6xx_set_pagetable() to do this.
> While we are at it, sync both BV and BR before issuing  a
> CP_RESET_CONTEXT_STATE command, to match the downstream sequence.
> 
> Fixes: af66706accdf ("drm/msm/a6xx: Add skeleton A7xx support")
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index b8f8ae940b55..6f7ed07670b1 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -224,7 +224,7 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
>  		OUT_RING(ring, submit->seqno - 1);
>  
>  		OUT_PKT7(ring, CP_THREAD_CONTROL, 1);
> -		OUT_RING(ring, CP_SET_THREAD_BOTH);
> +		OUT_RING(ring, CP_THREAD_CONTROL_0_SYNC_THREADS | CP_SET_THREAD_BOTH);
>  
>  		/* Reset state used to synchronize BR and BV */
>  		OUT_PKT7(ring, CP_RESET_CONTEXT_STATE, 1);
> @@ -235,7 +235,13 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
>  			 CP_RESET_CONTEXT_STATE_0_RESET_GLOBAL_LOCAL_TS);
>  
>  		OUT_PKT7(ring, CP_THREAD_CONTROL, 1);
> -		OUT_RING(ring, CP_SET_THREAD_BR);
> +		OUT_RING(ring, CP_THREAD_CONTROL_0_SYNC_THREADS | CP_SET_THREAD_BOTH);

IIUC downstream doesn't sync here since there's a sync after the LRZ
flush, but I don't think that's a meaningful difference.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

