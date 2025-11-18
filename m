Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57B06CEE327
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 15:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M5WRdUpA2CUE7aS1AisvjTy+gobCtbtissttVLsKK2w=; b=G7c9CbSI/p8zXRit3Fd/nR4czI
	oRWfMCCFKx/hWNcjpUtmNKrxwVao/NqMNp7LMOgKpMO5If1gFfGtkgFbN+VFH+yBT0Nc08NOiBISj
	pkBa9H+prprbPfbLkkOdURPTUkFi68S8AjKFupZtoKmNHUQDvbyDWXy88QgWfx47Xrq3CkMXx14Ua
	1Qgi+Si2PbuVFiW12EPYPw5nDxTOe++JQm9l+EotW2li+/xPtQegReD4uyz+6Z5QqVzZppgpvKwqQ
	kYLrwLCyLrYsmaL2ZvXvBW/Mdv5L6T1686DuGZ3qJyUXfRJTIbv2lIiLti+pGif+g5+Z82+r5OL73
	lpV6wPIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLO4H-00000000exA-0EFN;
	Tue, 18 Nov 2025 15:56:33 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLO4D-00000000ewj-1EH7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 15:56:30 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-3436b2dbff6so1013187a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 07:56:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763481387; x=1764086187; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M5WRdUpA2CUE7aS1AisvjTy+gobCtbtissttVLsKK2w=;
        b=WIqIElr7Fqhvf0kWMKDT6Qj7YThrSrcJOp7MJjGjAp4IOmYPEzSPBGaS7yZqYZW3u5
         yA4yQM9sZCg3xEqF5NNU5p2Vu/b/J3AgDrMdw5d8rmqzhdX1IH/7tbRC4kzFNC+2q7VZ
         ObO3TtM0IXrlQBYiQ9mzOip8srRW/IGfesOHhjyi8Lr3ZGEDpxuXWDJEHVsqk+lv+fF8
         QM8GdQD2ShwrzNchGplqHOpTXCD4BI0jF/Xv4VE/4ZRckq3x2jX6LslR5Y/vZzaLtojX
         gEsSxm324H8ElhKoElmmgYcRofoV6AV39XJrZ7TO0sAewr+OlUv9uLI85Pv6Pq3VF4RU
         g8fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763481387; x=1764086187;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M5WRdUpA2CUE7aS1AisvjTy+gobCtbtissttVLsKK2w=;
        b=Z6MpnHUi5jTfHJc+j/7zQVbOc5DxNqLecenFLSOCCm1/M8LTOLfHK8y74mpWitY5oX
         VsOOAqTP2kgufkj/XEpkH/daGHwOWHflHMpUvuTOaPJkFTuDNf7ot2/tXOy0X2V7204l
         RZ5N9BdjY8SAGEXIP5N/Tz4I7bUEQzu0860Ex3fpw0MVwRqwqj554Q0hKe80ed8exp4j
         LYxg1uBhRI9yui5jEitrWZLQS6tRFNvMav5RmicPcnQtHcZTIptJpHPASVnSmz0KyKKF
         VdBsLmdKgGZJ/jyTCmwVyXkcEmfGgR0HvrVdOVahnwladntLYxmF9JIfKvklXHdQz0lI
         3fig==
X-Forwarded-Encrypted: i=1; AJvYcCU+ifoKdcaMFhzIPKHZGA0gXK15Yh15qg4eSILyG+TqtjAzrzkHfZM1KtWgRoI/H79F2owfHcYiV1vpXA+k2hm/@lists.infradead.org
X-Gm-Message-State: AOJu0YwDCDxX5tM0KeIRlf0BFHePYLSpJwdpe4WhmN+8kltqAFquwhyC
	jmZGjiERaq01QVCJOwUPPOtf6rg+FkCgIl5KFUskxxOx4uPc2g9gqESVDgu1VEkaA9b9IhRfmkD
	wXPwfCNPRCfH7mYhVnizoMQruUWNATyo=
X-Gm-Gg: ASbGncu+rL0eo8A0vvpZKE+4TKRD6jsBfypVSetdLhy+mTVLid1wrOcG445Wwy7lagP
	u+uG6hnOgKbi/3S7Iuhkn6RZGNmIZuwSpFXxk537J1/tjTFjVfNP8vmkfgiTV80IbRcbhKW7ifE
	TcqQAkAfKMuV7tdJTeo34aKNY9cc8qd0g6Iu1SpSMWTQFDlWdooyra5yYAwJgYReE+KcIhi4ka1
	GEF+hIS3cROILk2NmYWpaIOaFcMUkMMrkODRdBQIsDPcrSg0cm28OeGat9F8IUM3K+np3lUZqZc
	Gy9b3QFhuzzFmlAz
X-Google-Smtp-Source: AGHT+IE8t1o/EHIJG7uVd/X+qmNh/IfoMFCfRZRkp7Xo8e8ghyzgHnHIC3pizFSaKdc3W9ZzA4z9Bd0F68Sq2swtnFU=
X-Received: by 2002:a17:90b:1b01:b0:341:b5a2:3e78 with SMTP id
 98e67ed59e1d1-343fa74f0bfmr9250914a91.3.1763481387271; Tue, 18 Nov 2025
 07:56:27 -0800 (PST)
MIME-Version: 1.0
References: <20251118-kaana-gpu-support-v4-0-86eeb8e93fb6@oss.qualcomm.com> <20251118-kaana-gpu-support-v4-15-86eeb8e93fb6@oss.qualcomm.com>
In-Reply-To: <20251118-kaana-gpu-support-v4-15-86eeb8e93fb6@oss.qualcomm.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 18 Nov 2025 10:56:16 -0500
X-Gm-Features: AWmQ_bmdki1r5-87hufvE1VD2aBWZ9nuG-r_2OiqIAnZ7-v6leUi15c6-xeP3Cc
Message-ID: <CACu1E7HzsnSjz0SiUJT0SMNJ7cFhiNdtUE9jKHpvD3UzG6EegQ@mail.gmail.com>
Subject: Re: [PATCH v4 15/22] drm/msm/adreno: Support AQE engine
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jonathan Marek <jonathan@marek.ca>, 
	Jordan Crouse <jordan@cosmicpenguin.net>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	iommu@lists.linux.dev, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_075629_365556_450EEDA0 
X-CRM114-Status: GOOD (  22.64  )
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

On Tue, Nov 18, 2025 at 3:53=E2=80=AFAM Akhil P Oommen <akhilpo@oss.qualcom=
m.com> wrote:
>
> AQE (Applicaton Qrisc Engine) is a dedicated core inside CP which aides
> in Raytracing related workloads. Add support for loading the AQE firmware
> and initialize the necessary registers.
>
> Since AQE engine has dependency on preemption context records, expose
> Raytracing support to userspace only when preemption is enabled.

I guess the plan is to expose MSM_PARAM_AQE later once preemption
records are in place and for now just load the firmware to ensure that
people have it?

The interrupt error handling is still missing, but I guess that can be
handled later if that's the plan.

Connor

>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 22 ++++++++++++++++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h   |  2 ++
>  drivers/gpu/drm/msm/adreno/a8xx_gpu.c   |  3 +++
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  1 +
>  4 files changed, 28 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/=
adreno/a6xx_gpu.c
> index 810b64b909f5..9a643bcccdcf 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -1118,6 +1118,23 @@ static int a6xx_ucode_load(struct msm_gpu *gpu)
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
> +       }
> +
>         /*
>          * Expanded APRIV and targets that support WHERE_AM_I both need a
>          * privileged buffer to store the RPTR shadow
> @@ -2400,6 +2417,11 @@ static void a6xx_destroy(struct msm_gpu *gpu)
>                 drm_gem_object_put(a6xx_gpu->sqe_bo);
>         }
>
> +       if (a6xx_gpu->aqe_bo) {
> +               msm_gem_unpin_iova(a6xx_gpu->aqe_bo, gpu->vm);
> +               drm_gem_object_put(a6xx_gpu->aqe_bo);
> +       }
> +
>         if (a6xx_gpu->shadow_bo) {
>                 msm_gem_unpin_iova(a6xx_gpu->shadow_bo, gpu->vm);
>                 drm_gem_object_put(a6xx_gpu->shadow_bo);
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/=
adreno/a6xx_gpu.h
> index e6218b0b9732..3a054fcdeb4a 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> @@ -59,6 +59,8 @@ struct a6xx_gpu {
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
> index c9cd7546024a..e011e80ceb50 100644
> --- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> @@ -627,6 +627,9 @@ static int hw_init(struct msm_gpu *gpu)
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
> index c496b63ffd41..0aca222c46bc 100644
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

