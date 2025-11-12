Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 928EBCCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 11:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fhpeU9U5S/hGeJg9f9bTT5WPcsYN6w1Wj4PWqyqzdyc=; b=GlO7adqEs8WTZlQmJ4gO6FdU61
	lpjVjF7c6z5wgNIC6SKSPKaFxOQw2rrYbxs390BIgqnXcNFwP2jMMNA5kgC9oinKbJLXmK6UCGNTj
	YsIpGAqr15VUOj3pd3lWmJGqiWcswqi5zcjoR8OtCn4x5qLsLonyVq6YBMk8KS27+nOXFi0rpBy7+
	Q8finIYAc5jqLAPKJiCd4sgBA+FLYhejqBRcdOWfAXihB9pFiqT2lrmKgMD12P7uGODLNdb+KUw9S
	2z8v+mXse646AZ2Dc2D3tCSXpiIt8zgEkP96IkKiqjUtiBDm3ykd/sPGRaAJ2N1Y49Q6vNVcYhI5Q
	3ZGQ+gsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ8hb-00000008dsv-0JU6;
	Wed, 12 Nov 2025 11:07:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ8hY-00000008dsF-1NZc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 11:07:49 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AC9X00I1001747
	for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 11:07:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fhpeU9U5S/hGeJg9f9bTT5WPcsYN6w1Wj4PWqyqzdyc=; b=AbFmXmBTta7gKjns
	M54/EkecUo+B6cPlccmI4n5Aj9/wqRd2an+bzFJ+ms700a4OajXZeUEs0gXWQRLc
	etsB8+PdB0dKId8+lOeFMHY7TYoDx1ABopbYg7tBtpG6H6xL3S35HNvLdVM/zgAq
	yfYjYPBDelBKRb0j2yq5sVRydVg/9Wase8IyulhN4dEeUlmoH2zYiu39rd5AJymA
	5IfH9hlH087LSQuSPibn+jT/AI985QAaVn+au/GJ6aMhUMY+rDwa++KEfRyjYwxK
	dXGbWqcERW93lnoYSWvH1QxycRclRX0ECjE89dnAtVJyZcIgPp1aXQ1KNS+XJChv
	rcbN5w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acqq20bj5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 11:07:47 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ed83a05863so2097201cf.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 03:07:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762945666; x=1763550466; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fhpeU9U5S/hGeJg9f9bTT5WPcsYN6w1Wj4PWqyqzdyc=;
        b=HVKMek30QQkpsBxTdjIPWMIt5ehWAs7ofzVws/2YUnpgeZ+lJdXV4mik0ZsaM4cTSY
         OmsnJxKKKC5WBq532M38lqn7je3J65wKO5nnu95xVJZnw6WRU75ej1rDots6viJsf5e6
         TtzyWulALsyxJudeM5S23qB6WTHx4s55HExWc0IL2HzDWO8Mp9ntPf69qfzapFvBDfTo
         z0HDbzASnVNGc4OxSfLdaHt/FdHR3vjkzSncfmbH2HIV5/MtV2p7p3sbmi5G0JJc1n5F
         IUwt87yxIuwzznNbao4yT0IFncgxXiJF2SuiZDtUE2/XEfmpDCtROqSYZLKxX1mwqIzc
         idLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762945666; x=1763550466;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fhpeU9U5S/hGeJg9f9bTT5WPcsYN6w1Wj4PWqyqzdyc=;
        b=DmHGbUIzZ2f31eFhL7anzDZxsf8A/BHdWY7LhVUXJfhQhBAa4auNojPt/lxKMK0TAD
         kR4Ee3UxM975ZXOh/fJ5qN6oGypdSnO0lu6DWAMdqMEQco1ln1yzyOjFGaaNDN0US2bC
         g11mztBH/kPIocIPerjWXf6e6hamzzr5VkW+G5JbJgq1DmfF1fkFkrwTH75+ltgD40XW
         0j8UxrWpnOeIQ9bWX7T3RlzeQ5YLSdkC98NNc4z9wMcwP3cQRwSVgY7lWfwDBLIu7Swe
         mKbIZPKtb5vv8tuk4Us5IsiuRnTuhx7MyJ+FfsV/4hwbDvMEwy94ZQ8UnnIS04vc0c7Q
         yWQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhxidSmpiuZh6XHykjLNK/2RtPto8lj9aEvFqRHi0gJ+Sf2BoqrCokOCsEInhU8oBfw1sXuJUdrz7kkj9o7viB@lists.infradead.org
X-Gm-Message-State: AOJu0YzShscnjkvpkvTObFmHSheqHuuN4B9VNX+ifCbORCpz2UlKhfnw
	5lu15VOzFp9JOW5q29MIwUoYNW+1lJNTklOWJs4n7ifCxDvCXVJywgIf5SXhLjIfK6NGFpnelqt
	xV3dXGv7FjgPn0Vk3AHfe154XJxLLihiRWJoBivIkTGredfqBa2bMLwh1b+ObwgJgm5W9GMLN8D
	Xx/A==
X-Gm-Gg: ASbGncu+zWl6KXpWb3n56yIoBKWGdhREsfXD5Ofs6NPeW40yhQyT55pWRsgHIzy8+SA
	jHuf1bFMUNguVm3o10BJ21Xmxm/7kDw8/BVBNpok0M2FYW3BAA/A/TLcZ5HLigVtRd2aMvgWN0f
	pzEvLtFcrV4DYs7MtCxiQaeZWXkQA//yvwaKYPxfy6F+qRx/5UuhXTeTR63c1+AbswnIMrUZMGZ
	6uYluqUlnDMORmY4vAr865YcjRQQoN9F3zqUbal7SMxwCq4dlWHa2joyBNuFrQLcivRNTLxRO8h
	PP3AY3grmu2Ndm0cl4E40uYCLmbAuBiTc/ZNlTPfu6Mf7PHl+CziwUUeO0IWJY1lX25iGAxls3+
	bvk/++ofrcA0UX+S06t+oLO9bDd96qnObvo/d4A/7nxxW4F3Or0A2HnPp
X-Received: by 2002:a05:622a:1a9a:b0:4e8:a001:226d with SMTP id d75a77b69052e-4eddbcc8ccbmr21834711cf.7.1762945666363;
        Wed, 12 Nov 2025 03:07:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEsThee/kJ9PQlX1eMjNVcf3pwMggayYjNqOtdauF4RKz6aTdQHNiSCZ2A6kK70/XwvxAErjQ==
X-Received: by 2002:a05:622a:1a9a:b0:4e8:a001:226d with SMTP id d75a77b69052e-4eddbcc8ccbmr21834301cf.7.1762945665887;
        Wed, 12 Nov 2025 03:07:45 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64165b2aa03sm10031978a12.6.2025.11.12.03.07.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Nov 2025 03:07:45 -0800 (PST)
Message-ID: <1202b66c-6d4f-4909-a010-7e5e3ec7f0c7@oss.qualcomm.com>
Date: Wed, 12 Nov 2025 12:07:41 +0100
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251110-kaana-gpu-support-v2-14-bef18acd5e94@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EbHFgfmC c=1 sm=1 tr=0 ts=69146a83 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=XSWwlsXGtsdNaMXbhvkA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: UltyoUsAXB9E-XM-nLAVnSPYKuIEZc90
X-Proofpoint-GUID: UltyoUsAXB9E-XM-nLAVnSPYKuIEZc90
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDA4OSBTYWx0ZWRfX+oawc0MwhBs2
 aLL77CnjjvLCjAOhBH5DAWHc6o7aWSbfoMmsz9oRLI4CnEF+3HGeMJSLue8osnwHb27hU9SZhod
 800yAuSVAapMd1aPOJ4igsGa9WlDWe98txX188EXWwxrMDVrt5v3kjKU0pZZ/KmL0NLqPTpooPa
 L2R0NfrVr/1ls9JAkzcgNixFWA+Tdc70HOybn3ngAaF+h7UND/WBl1fmxnN/Pb7r+0fJ2Gb3Hm0
 BXexXkztrjvX2agvbyG1ZVUiOUfsU7mMGM7M0almYp4i97Lm6+0IItWkbM6r6uzLbAtpP/JewBv
 eSvdAxvafQuT+M4/4oRd6EE6CECyi4h5GwKr9l10yC01sPIX4DU2Fv5O0OV/2fF7b3iIMzbBOhF
 Mtf891Ir+I0dztHVSYPhQ18YTnQe/g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_03,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511120089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_030748_501255_ECAE829A 
X-CRM114-Status: GOOD (  20.42  )
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
> AQE (Applicaton Qrisc Engine) is a dedicated core inside CP which aides
> in Raytracing related workloads. Add support for loading the AQE firmware
> and initialize the necessary registers.
> 
> Since AQE engine has dependency on preemption context records, expose
> Raytracing support to userspace only when preemption is enabled.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Side question: is the AQE fully functional on any gen7 targets?
A750?

[...]

> -		adreno_gpu->has_ray_tracing =
> -			!!(fuse_val & A7XX_CX_MISC_SW_FUSE_VALUE_RAYTRACING);
> +		/*
> +		 * AQE requires preemption records, so disable raytracing
> +		 * if preemption is not supported
> +		 */
> +		if (gpu->nr_rings == 1)

"nr_rings > 1"?

> +			adreno_gpu->has_ray_tracing =
> +				!!(fuse_val & A7XX_CX_MISC_SW_FUSE_VALUE_RAYTRACING);
>  	} else if (adreno_is_a740(adreno_gpu)) {
>  		/* Raytracing is always enabled on a740 */
>  		adreno_gpu->has_ray_tracing = true;
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> index b507ff4e1756..7921b4a68937 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> @@ -58,6 +58,8 @@ struct a6xx_gpu {
>  
>  	struct drm_gem_object *sqe_bo;
>  	uint64_t sqe_iova;
> +	struct drm_gem_object *aqe_bo;
> +	uint64_t aqe_iova;
>  
>  	struct msm_ringbuffer *cur_ring;
>  	struct msm_ringbuffer *next_ring;
> diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> index 78dcb9bc3377..2ef69161f1d0 100644
> --- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> @@ -616,6 +616,9 @@ static int hw_init(struct msm_gpu *gpu)
>  		goto out;
>  
>  	gpu_write64(gpu, REG_A8XX_CP_SQE_INSTR_BASE, a6xx_gpu->sqe_iova);
> +	if (a6xx_gpu->aqe_iova)
> +		gpu_write64(gpu, REG_A8XX_CP_AQE_INSTR_BASE_0, a6xx_gpu->aqe_iova);

I believe you should also set CP_AQE_APRIV_CNTL per-pipe

Should we also enable AQE1 while at it, to reduce potential backwards
compatibility issues? Would that require solving the iommu woes?

Konrad

