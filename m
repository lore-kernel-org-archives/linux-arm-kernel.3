Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83AF8CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Oct 2025 12:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YUe30woE5xEimZOnT9raXvhiVzii7F5/lJXV/+rQmpU=; b=rm6bysKI/OveCwkcbjXHwRC03x
	j13KhtY+n7/SUdn0Xmb50BXhTh7Xs6iaA7nK/X3jI7fcWkEE5NKKlvGBblTMH3WIxZjd2skrl++xY
	NmytZ10T4EFaIDO3O2MApYyumx7RFfqrTIdSmq5LBCLHN7qZQXpZObuTBelQyAx7dMtuxsnDELBMZ
	BdDIjRc+AlQ8W1QwbYrG6hbUZ0hZaf7h7qpt0It4D61uuvvZL8E34iwQTUQYDQxti377iiUTp0cAP
	NsE0JrYndi4NjMvbATjoSS49i1cpWqPbbaNI8e1LxMZHxp1jpUKxvOpwcNft87ohPRebLdVjI7kWC
	iQAuxLGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6Sr4-00000003mAz-3LgX;
	Wed, 08 Oct 2025 12:01:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6Sr2-00000003mAQ-1rOE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Oct 2025 12:01:14 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59890PoP028795
	for <linux-arm-kernel@lists.infradead.org>; Wed, 8 Oct 2025 12:01:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YUe30woE5xEimZOnT9raXvhiVzii7F5/lJXV/+rQmpU=; b=eIMRSor3s8f0HqdA
	pkeP+CNNNqq715YMCOKDIEvIXhzK21rEAyE8AKxeGV11sFtZfcRSEWqiWYOV6l31
	CLFJOgcKqXCKvLzgnXLH0MLaL1IiJjrT58mDzQvQZWYfiOmU1MSSdWVsnCF/0GmF
	24SSvVe5dkZRObBoMxoeoc6XnfDZJoTq5N5OC7hOgDuV2LrGeLjqslpcpdvtsSBv
	PaXMMVUSqf8eH7v6YNIhQ2uNOdysGj8ioXnzOt1TGs6jNoNQNQnjGVfPLyCMnGdk
	V1EDZok9m9WVpHqCc8TtZuOo+U/kvJtxr0J1HRlQ2GVaXM6DoXflM1gj63gLWR/X
	j5vGwg==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jtwgtbaa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Oct 2025 12:01:11 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-92ed79d6ea0so97588241.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Oct 2025 05:01:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759924870; x=1760529670;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YUe30woE5xEimZOnT9raXvhiVzii7F5/lJXV/+rQmpU=;
        b=vHug7kgzA6B4DH4gxN5zMFPuqvpasT6BmRAXpyFofWK+GLnDvIKLgHUiQ24GU3mLOv
         VzFgoPJAXBKP58m+sfqGWqz51SpFdXV9PieZK8L4/UHKm0eFuBQVYLmKGZjR9HJLn006
         5rFw23r5IFjKXdHpbHgxDyge/kJwCxgJ2VDeuxvB1reQI6nReD/MkVP+uWc0Iip3SOw9
         pWl/Zb7Ny1FX9UvHF62aBRICgP9ThBZ8lBz0YAjOWUVRqLguNYcj+TXXoYqFM1etzS/R
         azIIjWlqrjLv1S8RfZdtosK7WEEjebhexWNmcFFcpoUY7ldfns2GhW9mCXU0L7grlVPt
         YltQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfX14cwRqt0uLjhOAzaU69XOsJYID5k/9EZdQJnQ+NACo9WcbDyRGd2Ff9QDJ6Bfhp3cquuYOlo1MPN0xP6Paz@lists.infradead.org
X-Gm-Message-State: AOJu0YyQ7YCh+7Br0NRlXk+fwnQoqXSjTeKuY5Jp/ADNO6wXAoh1x4ya
	fwLJBTI4q663C7oQ7nmH+zwxrrYCppfsUYMMLs/Dp8332XonaogYu6xFKcnj5y0BCybZrDQ7huZ
	h1I+v+WDWTErDzhic50UkHBxVj4YQS367z4yaJ4DITZ4F3ZPpF5qSi7c/eVPB2cVaCy0fLwD26C
	MPsw==
X-Gm-Gg: ASbGncv6LUBfRippfILi/Xrc/cjagFel7NDpKCwmLssDC5ZudzL0zMXNE0/N/i11a/T
	3x1lmRp7cWJ0npXy4xP9is5L6wStlo32nY2SEwv77/Dfe0UgqCaT3tWqqmTjn1gq5+17Et4hyBn
	Pcv7UWNTOR10p3p0uXdqk/eXlJdjEV0OZcYwIXcM4/VVCezbDettr+BxTpvrW0TcQ10dKy0D1oA
	unjw1BI+GYfsKS621VNLDRzu/5+r8gT1K0eTyFKKVE7LmxJ4DprdG+aYvTUHylmxr532ICaURu+
	vwGHj6sTJ3Gz/xU6MKbc7SO/oEzJjhL9casLcg2X3jCp564GDdFrR/MHfIDKbr9sfl3Ks2A5hNI
	hrpfI0qtiCJRq9eS+kLtiDZeVJAc=
X-Received: by 2002:a05:6122:6c01:b0:544:6d56:eef1 with SMTP id 71dfb90a1353d-554b8b9dafcmr382785e0c.2.1759924869680;
        Wed, 08 Oct 2025 05:01:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFT9kYombhVn9vLwV8HVqDP5rHDdMKek8m1Ph8xI5IlH4fvXAiDJcCahZY6sxIbEptqVVlYDA==
X-Received: by 2002:a05:6122:6c01:b0:544:6d56:eef1 with SMTP id 71dfb90a1353d-554b8b9dafcmr382725e0c.2.1759924868891;
        Wed, 08 Oct 2025 05:01:08 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b48652aa040sm1634050866b.20.2025.10.08.05.01.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 05:01:08 -0700 (PDT)
Message-ID: <f7f2189b-b182-4616-bba3-ad1a0af3e4da@oss.qualcomm.com>
Date: Wed, 8 Oct 2025 14:01:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/17] drm/msm/adreno: Introduce A8x GPU Support
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
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
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org
References: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
 <20250930-kaana-gpu-support-v1-12-73530b0700ed@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250930-kaana-gpu-support-v1-12-73530b0700ed@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAxOSBTYWx0ZWRfXw/uKDu1DU5Gz
 T79vf7vZ6tQkNV0JQ8IxfCXMOSFnck/WSyfkYVsWbCYOU6bdkVoQTN37b4ndP7/wTwdVGy1kPvM
 h2SwgZ6ejdzuFgf5SaV7zj2lNXUugfqI6xK6b5fGcVnH5srxC3ip1XGwZ97zlJvIGFhLhpTLWY1
 2+YaqXXtITLPoub0937U42kWWOln0G/0sEbRJIbGfRPhUaOZHUFdXFmcMK38HrHn2QftFyrWGX+
 XhzoQkFVLdqfAAOd3mxZWpmJ6nbtyflJB2nbVVoPBdcgV4rI1ajVrYTfmHEt385x/HinrYEmaFz
 P42K5BuX+1Ev1NhRkYGhlWfT4McRD2db+RkKy5pPa0wemfPrOcN4vTP5N61ttsMAvZ4TNetAhRw
 etjqhYrGXy/6/I3HxR1sUgRY+j8mAA==
X-Authority-Analysis: v=2.4 cv=B6O0EetM c=1 sm=1 tr=0 ts=68e65287 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=C_0j-PAzlxBuy3Ei6pAA:9
 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-GUID: kh3xtk14v0bWp5Fudm0XKpxV3nVdzBlm
X-Proofpoint-ORIG-GUID: kh3xtk14v0bWp5Fudm0XKpxV3nVdzBlm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 adultscore=0
 impostorscore=0 spamscore=0 bulkscore=0 phishscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2510040019
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_050112_608320_AA47D73D 
X-CRM114-Status: GOOD (  22.95  )
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

On 9/30/25 7:48 AM, Akhil P Oommen wrote:
> A8x is the next generation of Adreno GPUs, featuring a significant
> hardware design change. A major update to the design is the introduction
> of Slice architecture. Slices are sort of mini-GPUs within the GPU which
> are more independent in processing Graphics and compute workloads. Also,
> in addition to the BV and BR pipe we saw in A7x, CP has more concurrency
> with additional pipes.
> 
> From a software interface perspective, these changes have a significant
> impact on the KMD side. First, the GPU register space has been extensively
> reorganized. Second, to avoid  a register space explosion caused by the
> new slice architecture and additional pipes, many registers are now
> virtualized, instead of duplicated as in A7x. KMD must configure an
> aperture register with the appropriate slice and pipe ID before accessing
> these virtualized registers.
> 
> This patch adds only a skeleton support for the A8x family. An A8x GPU
> support will be added in an upcoming patch.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

[...]

> +static void a8xx_aperture_slice_set(struct msm_gpu *gpu, enum adreno_pipe pipe, u32 slice)
> +{
> +	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> +	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> +	u32 val;
> +
> +	val = A8XX_CP_APERTURE_CNTL_HOST_PIPEID(pipe) | A8XX_CP_APERTURE_CNTL_HOST_SLICEID(slice);
> +
> +	if (a6xx_gpu->cached_aperture == val)
> +		return;
> +
> +	gpu_write(gpu, REG_A8XX_CP_APERTURE_CNTL_HOST, val);

unless the effect is instantenous, this needs a readback

[...]

> +static u32 a8xx_get_first_slice(struct a6xx_gpu *a6xx_gpu)
> +{
> +	return ffs(a6xx_gpu->slice_mask) - 1;
> +}

#define instead?

Perhaps also move it closer to the user


> +static void a8xx_set_ubwc_config(struct msm_gpu *gpu)

You modified a6xx_calc_ubwc_config() earlier in the patch

is one of them unnecessary?

[...]

> +static int a8xx_zap_shader_init(struct msm_gpu *gpu)

You can borrow this from a6xx_gpu

Perhaps moving such common functions to a separate file would be
even better, I glanced over the change and there is probably some
potential to commonize

Konrad

