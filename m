Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35771CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 10:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yEvEVaysBiDJvqu7zSpO/ven4wuPjiUA9FzLjPjO1Lk=; b=Fv171n8fZau47dVxeLJ99dZljU
	a6T76MiEE/zmVbw05l1frgVZGkrzlJ3AsXGPg5B2fwNdVPNoNzCwhlHrmGuMsaMNEL5zGgBIWPZuM
	UwKhtMtNgDY9BIWFPTNrvnKvzsjSmC2cG+aZtE/Kql3AXpJNnWfGu2MAA+boYJTu6Z9rG7h8BzSQ/
	Oe91+LJzIVZLYcRGiTqf0Fek/WJDHU1cXPgjsE3NCqkZUtX9xOETU7GKv++C59RmKfI5ch2Q39iK/
	4uicpuMTfOMnahRdZ1TwT3xOgD9/vN+2mDR0mKOV9DxSObsA4TYONqXXk/890YPZG2/ghADP5YVeK
	v2BLHxGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ8EK-00000008aq2-49jI;
	Wed, 12 Nov 2025 10:37:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ8EI-00000008apC-04xo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 10:37:35 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AC7CWr43502408
	for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 10:37:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yEvEVaysBiDJvqu7zSpO/ven4wuPjiUA9FzLjPjO1Lk=; b=p0Oz30K3ZkEWwuzp
	iqiim70ICP+vQQno+zYJnXP3FiLNW/NqOujPtIY2anc++sqN5gaDBPycS0NGFyFX
	dpaoAHlUUwgvFGRmEFlte6Q8mA+lKrD9UJkcg1RWWZA4pZpilpZt69WCHX9kZaoz
	3iG3mxKT/mv/TWO1givhucRFRitwKYp92KbL6yeP7RnsGST1HSYK6DeJ8D2z78pf
	fLH8OFRFwugXCRlNnTYSgmUaLMsZMHKuIBbKB7GCEQEYfqshTC+LviPVOOA7SKdX
	CXobtf7q7JlojXQJW4Mn8oAhLcQ+baKjrmDIsLWcCpZC6lJXo78vrDERvDKQ13HS
	/bV64Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acdcc23fm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 10:37:33 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b10c2ea0b5so29414585a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 02:37:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762943852; x=1763548652; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yEvEVaysBiDJvqu7zSpO/ven4wuPjiUA9FzLjPjO1Lk=;
        b=cB+UjUAdGdpn8FlCInK3k+HNFDRkvdAnT7BWZaPwao0orJfTor8QnHwxSL21GJbDl0
         dsrPOMnIItNgIBiK+hhm9Uti6gZt0oKwQFC4HaZp6fnDClxnHicLFZFLzCJ2x0BmQ/cx
         oJt2s8jh9nfY7+wFLkXvdNIXuN+qk/M68B4guHLONfpw98IK8XSqynIOKB1dPCxcUpna
         HrV1LIgh3lpvwiRu8qwz/USLydfJI5tzwfBb+tdQu96eQAZPfIeWej6zibeosFUHm3Ew
         HmZuDIqBKBaPA2PiU/oHMGamJgSNx++O4iBLwbJStg9uV5srFhx4o92C0hByfxRmxMWq
         EEVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762943852; x=1763548652;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yEvEVaysBiDJvqu7zSpO/ven4wuPjiUA9FzLjPjO1Lk=;
        b=HuUC6JEWJH0eMrgLt3hjNfQYmmCQY9ikK1mUnmB/xBGQewK8Vww7PMOm5GCEptVtki
         lAOgisinhejlqlWjvK26ZrsVZNhidzERBn8aAG1XEoPY1illTyUrDk4eUGuW9PD0mrin
         hDQ3/O45m1cVpqy1ONCWAKHtft/s5HeAeLfOQkm2ff6V1calSwCNpXUlDH/Ivcfty8pp
         mmdKRAAQ2OomQ8abM8gMtwIkMnEfGNek272U+BXp1azyZzdy6vj2q1bJQTag+sabUzbA
         PBitPJjBtvAuGVrSe7aIiPu5kQn0Qx4EBRBAA5DhzoPKlFvFHHYrWcXCul4Rvl3JVXe0
         qD1w==
X-Forwarded-Encrypted: i=1; AJvYcCV+WA0JAzWmk7dZiJJOf9QTVtMWDEMFKEZh0IheD3xSQfJbrKNtkUPjl4nGqz2ugVpWRdlv7i4KDrOREcr9qMK5@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6SpQw2Ezakz5dx+1bam3CcZTC5vMubtWOra2K0v45Fdw0PNQc
	lDrB6tfWPeXzW6ioWMgJs/m4CmMh54fXzUJDSXif1NsEm3CWTYH9UaBjrw+JqzcHbfJfsiNUhUq
	+QSOKwGpsMtQLUgDjJ8H/z1OdEBTC8C6QeerOKSIdbiFEoMwzYMvkkbBoZdB1s5tem5aYF84MF2
	fnvQ==
X-Gm-Gg: ASbGncuI48tmgPD3SYjvgkFsACSr04S5cZk9vKEaXlhYCEBP27om7keNvjv4a9ksNLl
	yb4WgXaIM7KfHWAGgSjjMT+0n2xRF/IViuqvXPZ0XWOH5QVtr4DLr5Mj1zZSxtazlmx0e8kTZ01
	mQs+B5kFQcKwRtAMifJjONEH4KDi1qyf3/60ksaPgQTKT3GU/8C9IQlGon6umAlwSMfgImZcehP
	QhJltDK/P1WSgljKVhoPnLHYQt+YXsRNV75HO8swpYsxnQPlNtw6lK6EYScXgeHaqJ5aFIkS9oU
	rc7OEQbhuH96oeou1blXSkykNayryz+uLq1O1jiwSj7kv/PtlYNty+tH+GmW4oez73ghMY0JzOh
	f8t46HLA8l3XHdKuoG5YQtrSQZkfHTYUeV0GoW15Aq7S6rfpoMJ7sqpAG
X-Received: by 2002:a05:620a:c44:b0:8a2:eb35:8df9 with SMTP id af79cd13be357-8b29b96bfacmr174329685a.11.1762943852374;
        Wed, 12 Nov 2025 02:37:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHnodYPH8G4uSHNNb8nQWE1cE1kx1PmZfPb6CE/gBIDzIV9Um7jRFbvxAfRziignE7KgxTdXA==
X-Received: by 2002:a05:620a:c44:b0:8a2:eb35:8df9 with SMTP id af79cd13be357-8b29b96bfacmr174327385a.11.1762943851866;
        Wed, 12 Nov 2025 02:37:31 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bfa0f37csm1559184066b.64.2025.11.12.02.37.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Nov 2025 02:37:31 -0800 (PST)
Message-ID: <ae21a963-696a-48f3-af91-ee72aef4b60d@oss.qualcomm.com>
Date: Wed, 12 Nov 2025 11:37:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 16/21] drm/msm/adreno: Do CX GBIF config before GMU
 start
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
 <20251110-kaana-gpu-support-v2-16-bef18acd5e94@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251110-kaana-gpu-support-v2-16-bef18acd5e94@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: sT_48yXcY-Y4jat_Q-bgweOsoGglZcM5
X-Proofpoint-ORIG-GUID: sT_48yXcY-Y4jat_Q-bgweOsoGglZcM5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDA4NSBTYWx0ZWRfXzwAYa87A5Mp0
 Obsl0kI/UVlIQgQi5Y36kC/qv6IomxL8mQz9ZTHEB8YeNxt/KLOLMnDpEqKxgP9W5KJYAfmzjRv
 JstDOdmRk34elWc+GKzwzdWv7lJ0nk8q6EhHtlIrimPxy4lwde0a1OenNTf7SMRq4brG1D9x28L
 SxB27DrBCduwVYp8Lk83escV6uLEc6ULRnJMc+3XHZSv702Kd8+EBbqCiBCO0B0uXl7YbpiQJaC
 1XiwO4QGkVL2FMsi6/Ez+fP5qPCqSbKj8kXl/DAzdidAx2ViENTTA2UZA1JxdbI5h5NdxaV3KVs
 pxlc53xmrctjqsAMgRtkQDRD2rcLsSxlm3ED7UuX7+STpcIy/XvKuKnbw8DbR67wg+myjNMd2OK
 7xHVzsbJ6fk098cjyPHJGbwJomKAYQ==
X-Authority-Analysis: v=2.4 cv=L/0QguT8 c=1 sm=1 tr=0 ts=6914636d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=XltbfQAJAwjtl7jyp1EA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_03,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 suspectscore=0 spamscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511120085
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_023734_070282_F05A8C24 
X-CRM114-Status: GOOD (  24.90  )
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
> GMU lies on the CX domain and accesses CX GBIF. So do CX GBIF
> configurations before GMU wakes up. This was not a problem so far, but
> A840 GPU is very sensitive to this requirement. Also, move these
> registers to the catalog.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

[...]

> +	/* For A7x and newer, do the CX GBIF configurations before GMU wake up */
> +	for (int i = 0; (gbif_cx && gbif_cx[i].offset); i++)
> +		gpu_write(gpu, gbif_cx[i].offset, gbif_cx[i].value);

We haven't been doing this a lot in the GPU driver, but adding a
.num_entries-like field is both more memory efficient and less error-prone

> +
> +	/* For A7x and newer, do the CX GBIF configurations before GMU wake up */

duplicate comment

> +	if (adreno_is_a8xx(adreno_gpu)) {
> +		gpu_write(gpu, REG_A8XX_GBIF_CX_CONFIG, 0x20023000);
> +		gmu_write(gmu, REG_A6XX_GMU_MRC_GBIF_QOS_CTRL, 0x33);

Either set this prio value here, or in a8xx_gpu.c

> +	}
> +
>  	/* Set up the lowest idle level on the GMU */
>  	a6xx_gmu_power_config(gmu);
>  
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 029f7bd25baf..66771958edb2 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -1265,17 +1265,20 @@ static int hw_init(struct msm_gpu *gpu)
>  	/* enable hardware clockgating */
>  	a6xx_set_hwcg(gpu, true);
>  
> -	/* VBIF/GBIF start*/
> -	if (adreno_is_a610_family(adreno_gpu) ||
> -	    adreno_is_a640_family(adreno_gpu) ||
> -	    adreno_is_a650_family(adreno_gpu) ||
> -	    adreno_is_a7xx(adreno_gpu)) {
> +	/* For gmuwrapper implementations, do the VBIF/GBIF CX configuration here */
> +	if (adreno_is_a610_family(adreno_gpu)) {
>  		gpu_write(gpu, REG_A6XX_GBIF_QSB_SIDE0, 0x00071620);

a640/650 family GPUs didn't receive a .gbif_cx addition in the catalog to match

>  		gpu_write(gpu, REG_A6XX_GBIF_QSB_SIDE1, 0x00071620);
>  		gpu_write(gpu, REG_A6XX_GBIF_QSB_SIDE2, 0x00071620);
>  		gpu_write(gpu, REG_A6XX_GBIF_QSB_SIDE3, 0x00071620);
> -		gpu_write(gpu, REG_A6XX_RBBM_GBIF_CLIENT_QOS_CNTL,
> -			  adreno_is_a7xx(adreno_gpu) ? 0x2120212 : 0x3);
> +	}
> +
> +	if (adreno_is_a610_family(adreno_gpu) ||
> +	    adreno_is_a640_family(adreno_gpu) ||
> +	    adreno_is_a650_family(adreno_gpu)) {
> +		gpu_write(gpu, REG_A6XX_RBBM_GBIF_CLIENT_QOS_CNTL, 0x3);
> +	} else if (adreno_is_a7xx(adreno_gpu)) {
> +		gpu_write(gpu, REG_A6XX_RBBM_GBIF_CLIENT_QOS_CNTL, 0x2120212);
>  	} else {
>  		gpu_write(gpu, REG_A6XX_RBBM_VBIF_CLIENT_QOS_CNTL, 0x3);

Downstream seems to set QOS_CNTL at the same time as QSB_SIDEn for
these targets


>  	}
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> index 031ca0e4b689..cf700f7de09b 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> @@ -46,6 +46,7 @@ struct a6xx_info {
>  	const struct adreno_protect *protect;
>  	const struct adreno_reglist_list *pwrup_reglist;
>  	const struct adreno_reglist_list *ifpc_reglist;
> +	const struct adreno_reglist *gbif_cx;
>  	const struct adreno_reglist_pipe *nonctxt_reglist;
>  	u32 gmu_chipid;
>  	u32 gmu_cgc_mode;
> diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> index 2ef69161f1d0..ad140b0d641d 100644
> --- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> @@ -500,6 +500,9 @@ static int hw_init(struct msm_gpu *gpu)
>  
>  	gpu_write(gpu, REG_A6XX_RBBM_SECVID_TSB_CNTL, 0);
>  
> +	/* Increase priority of GMU traffic over GPU traffic */
> +	gmu_write(gmu, REG_A6XX_GMU_MRC_GBIF_QOS_CTRL, 0x33);

Kgsl (later) added this for A740 too - would it be beneficial to enable
unconditionally on gen7+?

Konrad

