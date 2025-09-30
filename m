Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E743CCAC5B9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 08:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=te/ZoQVF9PRW/Vcak1agQLB+rzLOMt6hZjDiPBIvFPo=; b=4YBLArC+V/+WKz
	iYO4JQe3va5p/NLO2nxCx3uq3/gNC2ZCdtZsiC5fgMU9EklAvFcMv8jNhOVjd7dUds0dyh4x1Dxun
	KQWuoTo+QYLkbYBo9bWxtL7/HCGuSQ32YfbuSEENLsh45ZiU56wEsXxXNrvNUvl3XE5K7Di0PD0qk
	+dyhEzzMFNwIN68JrJ+9J/lVRvmXEUF4tw42fg/AGYmFQFvtaXPjd15X+Q6/8kXRvaM8O7aN3a+iG
	96YVM2imYI8J8WNT9eKnbBSCY2oWOqRkMLHfbkq6UxQZd/y1z1ZXH5m12QY+vlKbFyfJG5+/3rIy7
	M6b+hUu1ho1rhP4dthZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3ViM-00000004dp5-0gW8;
	Tue, 30 Sep 2025 08:28:02 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3ViJ-00000004do7-26SU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 08:28:00 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58U4HPkO020325
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 08:27:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=te/ZoQVF9PRW/Vcak1agQLB+rzLOMt6hZjDiPBIvFPo=; b=GK
	Xn4H+96BGGnzBwd5vTeveqmwm2+ROJlE+usawWAKSsuwebQBlbNMkoDT5ysh/2l4
	j4KztS+NSFkvSI/GoyRcLqKba4lJme06Y1FICjT5MBx7/+CrgdoW3XwpYr7YSidn
	I1nUCog2rCBgFD1rZhjDpcPxcQD2IxHtkg2mzlCbWP9bOWLCXVCAOuXyWTqmjZaX
	DPprIu4mKijgTo3ND894o5PR3Tyf4tq0Vecl3JsrqWd4G76MwlswbzRViTdcWOJ1
	WTG4IvyGi6P7WZE25Hoxm8TqpJsgvKYuw9hR69Nv47O0kBo1PxgimsBuP7cCARq7
	nqi4JQnq21omtIlpzbEQ==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e6x5rcre-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 08:27:58 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-43f697f0315so880247b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 01:27:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759220877; x=1759825677;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=te/ZoQVF9PRW/Vcak1agQLB+rzLOMt6hZjDiPBIvFPo=;
        b=t/0qzExmtLMhW4T04fCZ9+YiJx5qRCYSP5tvCuSxd9aTuXGYIElc6irD43HAZvegMa
         yUKN6EatG4OJXNAmWQYcAzX/4h2n/cGktIcWfKSIIrZYhnQQRGVfSiMQouU3dFsFzkas
         jVri1/xtqTjoGjn74GK/vWSf0gJWwN/DgdT17F4WNMnelrlj49YGa45jhrX+UnvYvoBV
         7jJD5NKyELaXmI5J5DE73M/xqBvVPMLf7uXA+Cg51QYJuwaBZuFHYjP61tMFPMtb0rFv
         8fAU0EA9UKeydtlLbiJPPJlgWVu7mNbtot49rJXxgk3sVieE8y/rlp/mg5dH+gVsTeMo
         tb+g==
X-Forwarded-Encrypted: i=1; AJvYcCWwWw6kPKadEpnpx/OtZDUIalYqAFSyEB8EFMTfuafARo6uXnsqzheF0As9mnxlKCRXjT9r4inruNsRQfCDM6FH@lists.infradead.org
X-Gm-Message-State: AOJu0YwSSBAg1C9EUWd6L9NhjtSaLSkmi71ReJuE6ffyup+B/F4e2ViG
	iRQVgg0iRrBavLNMfo6xa1l1pV07IrpDDmEU5dDCBDVJkg3cmCaMdA7Bf7dfnCHs0y8n7HSBLV2
	W8p5CsyRB8aaLItEISzRoOyTmiMyVH6u02B5vZT+Qu6j1gISbcwWwTyEAi/JkWZambfw0VWROCT
	ECRP2EvX6qjjBcn9XGAXFIWfB8vufwgDEioNiKmBsDoYKMT+CHQoud
X-Gm-Gg: ASbGncujL6/m6iSHCW21eTTsQHy9rXY7NgGhp/OU5oJRHj8MZuaEQAqUf8A60kr3Zdr
	vYMsUlld8tmCgZ+m4ed9nt6O3r7Cda5AsKV3cU07akmaXLtnhnYve0WQYWJxFO84jO8knHRhyiL
	uGqEeH4zsBrpAVBwraapoJZs7Wg0mkizWpvREra2T3u0VGWvvigmug9o4=
X-Received: by 2002:a05:6808:4fde:b0:43d:25a2:e28c with SMTP id 5614622812f47-43f4cf464f3mr7573983b6e.49.1759220877222;
        Tue, 30 Sep 2025 01:27:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH814E7mWrVlAtwKKyT7opGmi1FUZDDSJRR4sEXqt85rC60tExf6mnWRjS+3W0gCgMI5Vtl3QqcYmH2Ktkkf/U=
X-Received: by 2002:a05:6808:4fde:b0:43d:25a2:e28c with SMTP id
 5614622812f47-43f4cf464f3mr7573965b6e.49.1759220876731; Tue, 30 Sep 2025
 01:27:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com> <20250930-kaana-gpu-support-v1-13-73530b0700ed@oss.qualcomm.com>
In-Reply-To: <20250930-kaana-gpu-support-v1-13-73530b0700ed@oss.qualcomm.com>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Tue, 30 Sep 2025 01:27:45 -0700
X-Gm-Features: AS18NWCqmbEpRBm5ANsrhcq-Z8jcjiekBnhyIkewW9_rwgY5GXXogY_b-bdPSxU
Message-ID: <CACSVV01UygpiUj0m_Ppd_LSxvW0MFunz+Lfhg20XHR7vyOBx7w@mail.gmail.com>
Subject: Re: [PATCH 13/17] drm/msm/adreno: Support AQE engine
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: zdU9OI1vQ-6EEno4Jw_xAS33FnLuNS2o
X-Proofpoint-ORIG-GUID: zdU9OI1vQ-6EEno4Jw_xAS33FnLuNS2o
X-Authority-Analysis: v=2.4 cv=ZtPg6t7G c=1 sm=1 tr=0 ts=68db948e cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10
 a=EUspDBNiAAAA:8 a=fhJ7XYdx2Z3gjWMZPJIA:9 a=QEXdDO2ut3YA:10
 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAxOCBTYWx0ZWRfX23MdWj6ElWV6
 OWIUi/CMJYi747+Obh380mH44+CNJzeuuoOThsrOBraUJX0IiVKPSpw/5FM4YCBHPnYsT9dkuye
 fGIl3y1wUU640fQiU0rENL/zIztHqfeqIyyuND6RFX7nEngrvEH0HQ+Iyk9auTAFOHqAOVdbWJR
 RSPAXjAzvHaeaeF0gSAUbXD4pztBqR2LRkVAnRcqaqllKF0thlu6WpWD0ROri1mLphCjmuPEoIE
 3+LnmNufzUqM6tbDgeXS5uLVc0QqTOpgcL/6afKEa/nn+1h8dsoiC+h8cJ+/OCI3cWOmNfT6mVN
 zhZXOmVXJXYhdFEQKbHVuTjcxQNke9RG1THHxgdMeo4C2QkfYwQS/Sg7u/Da1bCkK50ZXi9YwCN
 Zu5Q53AkBTQzAvprnVddPhJ4+zI/6A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_01,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_012759_653835_E1F99D1F 
X-CRM114-Status: GOOD (  24.30  )
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
Reply-To: rob.clark@oss.qualcomm.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, Sep 29, 2025 at 10:51=E2=80=AFPM Akhil P Oommen
<akhilpo@oss.qualcomm.com> wrote:
>
> AQE (Applicaton Qrisc Engine) is a dedicated core inside CP which aides
> in Raytracing related workloads. Add support for loading the AQE firmware
> and initialize the necessary registers.
>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 24 ++++++++++++++++++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h   |  2 ++
>  drivers/gpu/drm/msm/adreno/a8xx_gpu.c   |  3 +++
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  1 +
>  4 files changed, 30 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/=
adreno/a6xx_gpu.c
> index 4aeeaceb1fb30a9d68ac636c14249e3853ef73ac..07ac5be9d0bccf4d2345eb76b=
08851a94187e861 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -1093,6 +1093,30 @@ static int a6xx_ucode_load(struct msm_gpu *gpu)
>                 }
>         }
>
> +       if (!a6xx_gpu->aqe_bo && adreno_gpu->fw[ADRENO_FW_AQE]) {
> +               a6xx_gpu->aqe_bo =3D adreno_fw_create_bo(gpu,
> +                       adreno_gpu->fw[ADRENO_FW_AQE], &a6xx_gpu->aqe_iov=
a);
> +
> +               if (IS_ERR(a6xx_gpu->aqe_bo)) {
> +                       int ret =3D PTR_ERR(a6xx_gpu->aqe_bo);
> +
> +                       a6xx_gpu->aqe_bo =3D NULL;
> +                       DRM_DEV_ERROR(&gpu->pdev->dev,
> +                               "Could not allocate AQE ucode: %d\n", ret=
);
> +
> +                       return ret;
> +               }
> +
> +               msm_gem_object_set_name(a6xx_gpu->aqe_bo, "aqefw");
> +               if (!a6xx_ucode_check_version(a6xx_gpu, a6xx_gpu->aqe_bo)=
) {

a6xx_ucode_check_version() doesn't do anything for aqe fw (but also
a6xx_ucode_check_version() should probably bail early for a8xx at this
point?)

OTOH if over time we keep growing the version checks, we might need to
re-think how a6xx_ucode_check_version() works.  But that is not a now
problem.

BR,
-R

> +                       msm_gem_unpin_iova(a6xx_gpu->aqe_bo, gpu->vm);
> +                       drm_gem_object_put(a6xx_gpu->aqe_bo);
> +
> +                       a6xx_gpu->aqe_bo =3D NULL;
> +                       return -EPERM;
> +               }
> +       }
> +
>         /*
>          * Expanded APRIV and targets that support WHERE_AM_I both need a
>          * privileged buffer to store the RPTR shadow
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/=
adreno/a6xx_gpu.h
> index 18300b12bf2a8bcd5601797df0fcc7afa8943863..a6ef8381abe5dd3eb202a645b=
b87a3bc352df047 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> @@ -58,6 +58,8 @@ struct a6xx_gpu {
>
>         struct drm_gem_object *sqe_bo;
>         uint64_t sqe_iova;
> +       struct drm_gem_object *aqe_bo;
> +       uint64_t aqe_iova;
>
>         struct msm_ringbuffer *cur_ring;
>         struct msm_ringbuffer *next_ring;
> diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/=
adreno/a8xx_gpu.c
> index 6a64b1f96d730a46301545c52a83d62dddc6c2ff..9a09ce37687aba2f720637ec3=
845a25d72d2fff7 100644
> --- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> @@ -599,6 +599,9 @@ static int hw_init(struct msm_gpu *gpu)
>                 goto out;
>
>         gpu_write64(gpu, REG_A8XX_CP_SQE_INSTR_BASE, a6xx_gpu->sqe_iova);
> +       if (a6xx_gpu->aqe_iova)
> +               gpu_write64(gpu, REG_A8XX_CP_AQE_INSTR_BASE_0, a6xx_gpu->=
aqe_iova);
> +
>         /* Set the ringbuffer address */
>         gpu_write64(gpu, REG_A6XX_CP_RB_BASE, gpu->rb[0]->iova);
>         gpu_write(gpu, REG_A6XX_CP_RB_CNTL, MSM_GPU_RB_CNTL_DEFAULT);
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/ms=
m/adreno/adreno_gpu.h
> index 6a2157f31122ba0c2f2a7005c98e3e4f1ada6acc..3de3a2cda7a1b9e6d4c32075a=
faadc6604e74b15 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -27,6 +27,7 @@ enum {
>         ADRENO_FW_PFP =3D 1,
>         ADRENO_FW_GMU =3D 1, /* a6xx */
>         ADRENO_FW_GPMU =3D 2,
> +       ADRENO_FW_AQE =3D 3,
>         ADRENO_FW_MAX,
>  };
>
>
> --
> 2.51.0
>

