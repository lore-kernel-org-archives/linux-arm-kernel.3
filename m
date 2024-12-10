Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC4B0E77180
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 22:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9y1I2I1Lv//kUkxugZdreKtdIGZcLmNy7KGul5oUZkU=; b=g2DVLW0Z7TNaIzxqvzAvqSHAfz
	xo4jCxHtPrGPWJx57P9m82HCqZClbMpNxtudTe1LYH+ct+tlC7fghusMjNk/6UsVjqo0E4MHWLU4w
	cINNBJQQ2Sr8zFKA7KzeOoKw9U/Qz+VT6m74EwZ5gmtLh8Q3lSgar0Wss4pGuUrslo6kTDPIj+GZj
	of44mGoJxpNDbCuPKC8BvWE+OmdjN3v/gU6I2ZiigqBwZdQC1qYiCDeJcN6A4uHZLAT+wszf0IY3M
	jQ6bsLpB4lMj5sGdbTTNco8FH6GMFBnTDetk5pKD4HEO1yn2qJ/YBg/sa9xPASVfDpzGF9r1OdWh1
	xPzpkTtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL98D-0000000D4Me-2PQ5;
	Tue, 10 Dec 2024 22:55:05 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL95r-0000000D3an-3arU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 22:52:41 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-2efdaa02378so206849a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Dec 2024 14:52:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733871158; x=1734475958; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9y1I2I1Lv//kUkxugZdreKtdIGZcLmNy7KGul5oUZkU=;
        b=doiq8mHNPuYYJPBbotrm+W2gy06YxVEsdws4Fe+zBdDfXCOv88JqMDcHlqs5qsBqqA
         xuUx4f8dldF8lUH6K1ZEuFnzNyDbost/Mol5p4WMnl2YpudZwEm4Tms3BWn349XhGm7r
         j3pM8Vir1kSr+A0F/9woZ2PFWf3mfm8tVZ0vkr2rEHppbR0WW3KrRfp+Nn17E9evJigH
         6N247IZHUIbHOE/Hb0cLxg4SczIFeYanaJ4gFriReSJW9+oQMwOFZ91OXi6fTW9ayOwm
         8pCISkqDym7MKC5iWnBZiSc+4B0XLzYoLYXdxqr6aCw8LfMJUkYkm3RZcsWeDG1ZZZMV
         ns1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733871158; x=1734475958;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9y1I2I1Lv//kUkxugZdreKtdIGZcLmNy7KGul5oUZkU=;
        b=Xf3hLb0IvL7NFJk3ga+y8v3GjIh3IECigxb/7Fl2VMgxlhdHKU0Alq6J+KFAZwPYir
         weyLhRnjqwJuuQpaK+grYP8xSYq4DFMBU0rIDXfEAaRFrQynOoNl8dU0Bqk8cjkPH4Da
         Hge6aCCvfQP1TLIB+olLOaBchTUeWMgKJXpS9YPnBO4pERO/F1XAV8JcKpj/jtxaVnV3
         cADv6+lLBEwJvdV/NJI72DH7s5VUcQCO4+Beh8ZeIYWnnu8otirC8ZTDuuu2gbx/o6X1
         6lFJzJtkFAlAEWClgTfFW/vlPMKoemG6koM+MhoBzv/wXUvSumDWhfCLlSEMuwQ9xtqC
         3PGw==
X-Forwarded-Encrypted: i=1; AJvYcCXQfl+Ie/MnkJQ3E92rwLjNjlX7XJqaAcmWahNPSR8TndzQ9LFONHws/h+2xIrsMNgjT2ntYsZ8Q3YXtMHsiFTR@lists.infradead.org
X-Gm-Message-State: AOJu0YwTB9nWPFS5oDFwJ44bXR+iSutvfWgOoF+tY0k/HfrEWkQU8ID4
	j/rOACVEOQLIaGIlWbWN0xU+wveVBylClI8cxBXn/XkqhO/x0Blf64W5H4y/Ne6PkVYdOdXIK75
	t2CUMVqqejXBpjZ2jR8niJUjf8S8=
X-Gm-Gg: ASbGncv9o8KQlHEqBps378bO/K28+b1XzqE7bX2o5YEPR14tm+NZFQjWNAXb6ifoN6B
	8qToSczRHHIUuI4vHsOUjHv9eL5lrGYPzExM=
X-Google-Smtp-Source: AGHT+IHEJTNOho7BUDDopkeda9yA5Z701i8CutzK0zfqoByGzrIBsEAW6Mu56ec7j9m/mz9A92VEqVBhwSBZplche6I=
X-Received: by 2002:a17:90b:1a92:b0:2ee:35a1:c291 with SMTP id
 98e67ed59e1d1-2f127fbeba0mr408351a91.3.1733871158318; Tue, 10 Dec 2024
 14:52:38 -0800 (PST)
MIME-Version: 1.0
References: <20241209-drm-msm-kvm-support-v1-1-1c983a8a8087@quicinc.com>
In-Reply-To: <20241209-drm-msm-kvm-support-v1-1-1c983a8a8087@quicinc.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 10 Dec 2024 17:52:27 -0500
Message-ID: <CACu1E7H0-zzEPv8ytmx_9XRe1t-RCc7enshgwk2r9-0gWK44hw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/a6xx: Skip gpu secure fw load in EL2 mode
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Elliot Berman <quic_eberman@quicinc.com>, 
	Pavan Kondeti <quic_pkondeti@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_145239_893907_4BF6EA66 
X-CRM114-Status: GOOD (  30.28  )
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

On Mon, Dec 9, 2024 at 3:20=E2=80=AFAM Akhil P Oommen <quic_akhilpo@quicinc=
.com> wrote:
>
> When kernel is booted in EL2, SECVID registers are accessible to the
> KMD. So we can use that to switch GPU's secure mode to avoid dependency
> on Zap firmware. Also, we can't load a secure firmware without a
> hypervisor that supports it.
>
> Tested following configurations on sa8775p chipset (Adreno 663 gpu):
>
> 1. Gunyah (No KVM) - Loads zap shader based on DT
> 2. KVM in VHE - Skips zap shader load and programs SECVID register
> 3. KVM in nVHE - Loads zap shader based on DT
> 4. Kernel in EL2 with CONFIG_KVM=3Dn - Skips zap shader load and
>         programs SECVID register
>
> For (1) and (3) configuration, this patch doesn't have any impact.
> Driver loads secure firmware based on other existing hints.
>
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>

For initializing CX_MISC_SW_FUSE_VALUE in a7xx_cx_mem_init(), we used
!qcom_scm_is_available() to assume that the register is writable
instead - can you just do that?

Connor

> ---
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 82 +++++++++++++++++++++++------=
------
>  1 file changed, 54 insertions(+), 28 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/=
adreno/a6xx_gpu.c
> index 019610341df1..9dcaa8472430 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -14,6 +14,10 @@
>  #include <linux/pm_domain.h>
>  #include <linux/soc/qcom/llcc-qcom.h>
>
> +#ifdef CONFIG_ARM64
> +#include <asm/virt.h>
> +#endif
> +
>  #define GPU_PAS_ID 13
>
>  static inline bool _a6xx_check_idle(struct msm_gpu *gpu)
> @@ -998,6 +1002,54 @@ static int a6xx_zap_shader_init(struct msm_gpu *gpu=
)
>         return ret;
>  }
>
> +static int a6xx_switch_secure_mode(struct msm_gpu *gpu)
> +{
> +       int ret;
> +
> +#ifdef CONFIG_ARM64
> +       /*
> +        * We can access SECVID_TRUST_CNTL register when kernel is booted=
 in EL2 mode. So, use it
> +        * to switch the secure mode to avoid the dependency on zap shade=
r.
> +        */
> +       if (is_kernel_in_hyp_mode())
> +               goto direct_switch;
> +#endif
> +
> +       /*
> +        * Try to load a zap shader into the secure world. If successful
> +        * we can use the CP to switch out of secure mode. If not then we
> +        * have no resource but to try to switch ourselves out manually. =
If we
> +        * guessed wrong then access to the RBBM_SECVID_TRUST_CNTL regist=
er will
> +        * be blocked and a permissions violation will soon follow.
> +        */
> +       ret =3D a6xx_zap_shader_init(gpu);
> +       if (ret =3D=3D -ENODEV) {
> +               /*
> +                * This device does not use zap shader (but print a warni=
ng
> +                * just in case someone got their dt wrong.. hopefully th=
ey
> +                * have a debug UART to realize the error of their ways..=
.
> +                * if you mess this up you are about to crash horribly)
> +                */
> +               dev_warn_once(gpu->dev->dev,
> +                       "Zap shader not enabled - using SECVID_TRUST_CNTL=
 instead\n");
> +               goto direct_switch;
> +       } else if (ret)
> +               return ret;
> +
> +       OUT_PKT7(gpu->rb[0], CP_SET_SECURE_MODE, 1);
> +       OUT_RING(gpu->rb[0], 0x00000000);
> +
> +       a6xx_flush(gpu, gpu->rb[0]);
> +       if (!a6xx_idle(gpu, gpu->rb[0]))
> +               return -EINVAL;
> +
> +       return 0;
> +
> +direct_switch:
> +       gpu_write(gpu, REG_A6XX_RBBM_SECVID_TRUST_CNTL, 0x0);
> +       return 0;
> +}
> +
>  #define A6XX_INT_MASK (A6XX_RBBM_INT_0_MASK_CP_AHB_ERROR | \
>                        A6XX_RBBM_INT_0_MASK_RBBM_ATB_ASYNCFIFO_OVERFLOW |=
 \
>                        A6XX_RBBM_INT_0_MASK_CP_HW_ERROR | \
> @@ -1341,35 +1393,9 @@ static int hw_init(struct msm_gpu *gpu)
>         if (ret)
>                 goto out;
>
> -       /*
> -        * Try to load a zap shader into the secure world. If successful
> -        * we can use the CP to switch out of secure mode. If not then we
> -        * have no resource but to try to switch ourselves out manually. =
If we
> -        * guessed wrong then access to the RBBM_SECVID_TRUST_CNTL regist=
er will
> -        * be blocked and a permissions violation will soon follow.
> -        */
> -       ret =3D a6xx_zap_shader_init(gpu);
> -       if (!ret) {
> -               OUT_PKT7(gpu->rb[0], CP_SET_SECURE_MODE, 1);
> -               OUT_RING(gpu->rb[0], 0x00000000);
> -
> -               a6xx_flush(gpu, gpu->rb[0]);
> -               if (!a6xx_idle(gpu, gpu->rb[0]))
> -                       return -EINVAL;
> -       } else if (ret =3D=3D -ENODEV) {
> -               /*
> -                * This device does not use zap shader (but print a warni=
ng
> -                * just in case someone got their dt wrong.. hopefully th=
ey
> -                * have a debug UART to realize the error of their ways..=
.
> -                * if you mess this up you are about to crash horribly)
> -                */
> -               dev_warn_once(gpu->dev->dev,
> -                       "Zap shader not enabled - using SECVID_TRUST_CNTL=
 instead\n");
> -               gpu_write(gpu, REG_A6XX_RBBM_SECVID_TRUST_CNTL, 0x0);
> -               ret =3D 0;
> -       } else {
> +       ret =3D a6xx_switch_secure_mode(gpu);
> +       if (!ret)
>                 return ret;
> -       }
>
>  out:
>         if (adreno_has_gmu_wrapper(adreno_gpu))
>
> ---
> base-commit: f4a867a46862c1743501bbe8c813238456ec8699
> change-id: 20241120-drm-msm-kvm-support-cd6e6744ced6
>
> Best regards,
> --
> Akhil P Oommen <quic_akhilpo@quicinc.com>
>

