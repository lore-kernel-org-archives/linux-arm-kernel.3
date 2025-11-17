Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6F40CEBF61
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 14:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A4gh/KiDMiXP6GtsBD0jV44i4prQwi2UZjkTQnAGpfo=; b=C7SG3FIHs2WKw1Vfg0gyUWMRUB
	JQrm43lxLrCrwDm9OpKZ75FcXxiI839OlSk10FeeiiJd/NsCHVzAhAsXAnFRJdeXecJzgIYRcvi7w
	tTJSl+Re99kk0ksHVECDm0EWFb/Ro1NnLHiSWHTJii9yuix7SJ0R+Ndj3uxPm2420XqSkyACUDUlO
	pB5R3M/qFtAlYC/Cnw+Mv9JBUMmsYFZexAY5i9eL8XTky/IRX7Pud7XUjdYpwuV3Jj9y35BBKwUnQ
	5RtLm/mrm0aH9OCtKaPG8csF6rKavo0GmKQMQBM794dpTySBVFnrTzNnx5GRefyc4JEet/nzr1kYD
	95xPa4YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKzp2-0000000GEDN-1sTd;
	Mon, 17 Nov 2025 14:03:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKzoz-0000000GECy-3oHz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 14:03:11 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AHB65OX4107490
	for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 14:03:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A4gh/KiDMiXP6GtsBD0jV44i4prQwi2UZjkTQnAGpfo=; b=fDTM5GSlpZlpE+F/
	Yll2WAWkbz5B8FIvh+LLqnK1wha3+V5evOq5StyQ7/yXVwQT99HwrK/QQ4DYrHib
	YtYZPmUrhDwQm775l1eMYeL7T7GtlcSFk7oBYn7+4zKsHI6uYcAVX9OQxSwoefKf
	GjtudtcbJIo83ojArDZNAUoHitTo40vVyCMMoa7qn+VvQ+tsj/XAetXK1E39DJGe
	347eDqJ2DEZjLYzsHIsLIm15nbZSeUeOoQMsLTF8ZU1pYIgtJZXDewAui6xuE33p
	LG63nW6tGf1brkpBHO8HJtDS6ySSN5V9rFmrd2bcDUCkKiSzLN/dM+qUNgsYgVAp
	t+ki2Q==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag2hp8fan-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 14:03:08 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-55954914f9fso260598e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 06:03:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763388188; x=1763992988; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A4gh/KiDMiXP6GtsBD0jV44i4prQwi2UZjkTQnAGpfo=;
        b=MznythDv+xMXwf+Doufot8okltKZmuXmLGtKb39PW8uzv2ISFK+HqYQyUX8chGR596
         HHO9FIck/nfayJ4K5d84gEqcEWfEobhDMPzQo/M+qFFcc8s8ZS86fQzZX+c3BvGtjD1q
         AKqHQivSDtxPy+vfBopN/KfdLbXKoyimj6fC1u5xPTEyTBm9tO/RrxbSKQRtpyU3tRZR
         jVr0stBrm7goQCk21G10JVywhAULhr5fm5LmORTCmf/69Xh0YmHtiNynU5BA28oCp6w3
         a9XKZas7MMYw4Gn1qydxiTI8XVrWHXsDuLCHZxfOEjedmCEcKSVdpAqkuXEtIf/oYkfB
         Ktgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763388188; x=1763992988;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A4gh/KiDMiXP6GtsBD0jV44i4prQwi2UZjkTQnAGpfo=;
        b=WQnqTDjrJbfEXZr4QENuke11TPygB3yeoZ8MMxV/8doOnJhQYeYWE/T3OVp5SLiAMy
         tdsKEX2RixYIpeG/fqSUCbxaQ+GRjD8yjrXhV3TPh3vBb6TKeQmsYU+pbn0liVjY9VNB
         m0hxpWrM1sam4obKUnY3fv1UpyY7eGmcZkiNmHFfr3BTHY9XuuO/1ufomAbJGIJSjs6T
         sQg2AxMCssn2KYRvSTwbehPlSwA2JYZcG5cq+uxq3VnUCHCsIsGdfzLPM7jzw8JWloQZ
         HAjYeu8uIKoPWhAgsaeNalbHDVyUUKUW4DCPmNvRgCEZh4i9PqRAE4iWDKGjixyuK1yG
         n29Q==
X-Forwarded-Encrypted: i=1; AJvYcCU749KimmTgPFx3wBsB0qrgl3irZ24nuE1M5Pklm6qEn1/PJnI0KIMmrc0RgfkDbS15lyzXLUVhAj4MsLvr+ua0@lists.infradead.org
X-Gm-Message-State: AOJu0Yxd9xR6zyvSV0Zh3Xq4UWWUabMfgJ8J6Do/5U2k64NceX75f7SG
	3scjPn1PfpqdX9AUeXPU0UQprBpJ6bHVi0M+RBJB9VsrPcPKyILhGbjk9y78shZtO5EdOOZ3/ue
	OcmP51nrHZ76lUBCnKZlL7GwLECzUTxVBUykd4pp1rDq/zLdf/1dSI/tTtIWg/d+KQ/jqUYvWKG
	LHcw==
X-Gm-Gg: ASbGncvYIAiP7nXbDeTDofENGPlmWV69RmAfuZM49gGu40ZJruhLQrfrExfEMxKL+FG
	pBx1BLK8MQwccAhxOOXYBujJyc8L+hKJNiaOADstEAm8XKsFQf3PcNU3cZLSe4PJ7BgMkeR8BEY
	HXlCOkEwlq5v9cNULAtf1SoCek3hDR0spjb66aBNTRXbDIU7suFevFAO2rvDlJesbkelwp4KEF8
	yPADMYN71k4n2hHXkFrOEV+OXP1PR+XFu+jDeOB4dZHifQ4nhdPj0I5mMPpNHvAJJ33cqaDnfQ7
	AYe1CU02zO5f/oUaNGhFdLtTz8hE28AL/gJu/mL5UC2Ime0sKiDzC5woOu1WOwkTIxKioS4WxqG
	a2k3gf3jR5LgmNfSZH+hGJcdLKPPYMw8UikYGs9dZ8SM/Kwrc+XGxqxg5
X-Received: by 2002:ac5:c5ad:0:b0:55b:1668:8a76 with SMTP id 71dfb90a1353d-55b1ebefba4mr1296465e0c.2.1763388188138;
        Mon, 17 Nov 2025 06:03:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEZZTHOOdfEqa9ER8hemxiu6HJtbROxsxg4EQg/rySnc9YSfY+WhVEbc35EghFcBXcleB9lbg==
X-Received: by 2002:ac5:c5ad:0:b0:55b:1668:8a76 with SMTP id 71dfb90a1353d-55b1ebefba4mr1296341e0c.2.1763388186109;
        Mon, 17 Nov 2025 06:03:06 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6433a3f961bsm10428680a12.14.2025.11.17.06.03.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 06:03:04 -0800 (PST)
Message-ID: <922abf06-c75f-45b6-9653-492a00d414bd@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 15:03:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 14/20] drm/msm/adreno: Support AQE engine
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
References: <20251114-kaana-gpu-support-v3-0-92300c7ec8ff@oss.qualcomm.com>
 <20251114-kaana-gpu-support-v3-14-92300c7ec8ff@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251114-kaana-gpu-support-v3-14-92300c7ec8ff@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 6UdqsV11to-nrOkb66bLWLlK1yJl0Vz7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDExOSBTYWx0ZWRfX0KBNanEGXgAs
 iPZrk1ONRkTGPjCQXmSZkWDB4YHx2DFIowZU7yaZXDhJF+1BUIef9BfCOdyT48/p3C61wEmE0Lw
 5nxQvf58DuUBRuGyZRPZnK2MEOYm8UktTGSmQ5bKhRghZ939kmii/i9NXebW/aF90G096kbyaK0
 aKh/kOT2jSwkt7srYEtmkNyQtABoNPLJX9uW138fzjJ8MST9baKVet8MWsLs9oBQzO4noMi07Hv
 k1QP8RjUJZTKVVaXnqtqaI+gL8hGIokpfrshnrP03hOpkPshYJnPHcIrWvxbTByIgWv2UdzJTw9
 Jye0SUDUGwMVLYEp9qVxvosf+j37v4VbBEtTYDcwJ+Bf+LnUTUp8/f7bDrWSxYazgX7rsTZV9nx
 bsEV0LVVKYw7ZzeFBiw2IGRquh7CoQ==
X-Proofpoint-ORIG-GUID: 6UdqsV11to-nrOkb66bLWLlK1yJl0Vz7
X-Authority-Analysis: v=2.4 cv=Y5L1cxeN c=1 sm=1 tr=0 ts=691b2b1c cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Vi7wF31NLlcTFLqBoF4A:9
 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170119
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_060310_071036_D84CE1EC 
X-CRM114-Status: GOOD (  19.34  )
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

On 11/14/25 12:29 AM, Akhil P Oommen wrote:
> AQE (Applicaton Qrisc Engine) is a dedicated core inside CP which aides
> in Raytracing related workloads. Add support for loading the AQE firmware
> and initialize the necessary registers.
> 
> Since AQE engine has dependency on preemption context records, expose
> Raytracing support to userspace only when preemption is enabled.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 17 +++++++++++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h   |  2 ++
>  drivers/gpu/drm/msm/adreno/a8xx_gpu.c   |  3 +++
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  1 +
>  4 files changed, 23 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 20dbdad6e2e8..ef79f4cfb80b 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -1104,6 +1104,23 @@ static int a6xx_ucode_load(struct msm_gpu *gpu)
>  		}
>  	}
>  
> +	if (!a6xx_gpu->aqe_bo && adreno_gpu->fw[ADRENO_FW_AQE]) {
> +		a6xx_gpu->aqe_bo = adreno_fw_create_bo(gpu,
> +			adreno_gpu->fw[ADRENO_FW_AQE], &a6xx_gpu->aqe_iova);
> +
> +		if (IS_ERR(a6xx_gpu->aqe_bo)) {
> +			int ret = PTR_ERR(a6xx_gpu->aqe_bo);
> +
> +			a6xx_gpu->aqe_bo = NULL;
> +			DRM_DEV_ERROR(&gpu->pdev->dev,
> +				"Could not allocate AQE ucode: %d\n", ret);
> +
> +			return ret;
> +		}
> +
> +		msm_gem_object_set_name(a6xx_gpu->aqe_bo, "aqefw");

You need to unpin and _put this in a6xx_destroy()

Konrad

