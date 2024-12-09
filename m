Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD504E77180
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 19:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IFjXl1XiaruT75EaeRKmg8rjvdRqedIGSRaEJR+tE8Q=; b=Jj+uymIYEg/Rvvt9zcbszuHFUP
	i/GOH1w0m+NGHnFgbso2NjzpI5JyeLRMdRUeLcHnwTd3vXEuy+Jn4sSfRMc29szcHCfTYUIbscYUD
	l0IeaSo55NDFzHCj1PeNJDwjWBm92xLyeKcDVKP6hZLLA3osK54I9BZx4oWA2MJFZ3gwrlCGlPy6e
	uF6era8TXniqriiu8yN1odu4z9co8JcC6f49mtXqr7qeUP82/cvAc3z277/H6VUbo62+B4BT1qP6U
	8L7LXCT8peYmhDqgZYd/csttaYW+W22yf/WHhhp/b7vLU1M8qNR7HkxPZ6t4Y4AE5PtJLal6W43g6
	9KUSiAdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKjrU-000000096Od-0M65;
	Mon, 09 Dec 2024 19:56:08 +0000
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKjqS-000000096GC-13mq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 19:55:05 +0000
Received: by mail-il1-x12e.google.com with SMTP id e9e14a558f8ab-3a815ed5acfso12075695ab.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Dec 2024 11:55:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733774102; x=1734378902; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IFjXl1XiaruT75EaeRKmg8rjvdRqedIGSRaEJR+tE8Q=;
        b=PdsOOTn5JUO7oKG923w25bXAVlJPItFJHA2s4Nu6YB6akKqpLS6SzHr9vLzZ6H3unc
         f9UpN9KM72Qmn7Tn5zpx7YgotKNW4F4/NOvj5cEj429VY0x01YVNu+t7PQ9V0gzcwwUJ
         Y2acWlL6DU2K8x8mAfwqlMOlj/+olyhZ3nJU6GdDxZQjQvGJoQM6U1CGrsXYpcPrpPl1
         r8oO0G9Qtii2wGGc4HOMLtLXktR1pifFbZViEkl+ONHZo7cL0H83zoiZtT5jQqLt2JUC
         qOqTBK+p2cz8cWtsf60roQKVeYpPLoJATxvzyfMWFL0oRgtVYWW+nc9lVX5X2IlMJ7E2
         ngdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733774102; x=1734378902;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IFjXl1XiaruT75EaeRKmg8rjvdRqedIGSRaEJR+tE8Q=;
        b=ui/JNblXwV5ZmvjJuvNPAiYRvCn3HxUtSM8sDJRB7aRvJBmsUHVN5SKS6nIT5ZFk6P
         G8sl1tEnBIKGPW9fW/w7XzJwgnFnfrAYfUHkKvkXbYwv1I5olnwzXC5t9vMGTwF9Xka5
         irz2tHi6PSSyxJGH96OTyvPt6JJRuaeaZx5dJ/GyloeN1OuuI3TtF1Z1qQoRwxFaZXjj
         A6NPWJXuwwNIIRZFpkYFUhRKKgEeObSHm5tFKbrH27jUDqGfzsS3bT/4TSBvKkrh92iT
         CZNLtWC655LMaVyUAxmE6nnBdayMyhHPV1wkEEMKhKCdKd3pOZxp7SG9za50er3nKfYK
         1VmQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYKghIKizVBv+6bP75YKVh6cRtM6Xq7h0TZPcQNCCUegvJ65HN72P1pLTKsK21L/SgpgiVdbfhTCnypa3s1J5g@lists.infradead.org
X-Gm-Message-State: AOJu0YzQpbDXjFAipshjPEnT7I9Xq/6OHVXjHS4WMoRxTTBJyKR9I2ID
	S040LbPE9MjNT6cOdDWj+wi8YWZmKkWJrO6MoB1QcLjvKVBt3uk4XfldzUIJvvYdBACPbf2Rl77
	a3jvhqohH/vOcBhvltqT1njtlXJU=
X-Gm-Gg: ASbGncsBEvEo3UJqj0CEKkKyFSmWPrMwXQho6OYAVCtSKT36L7jM8A0rfvOOUc2Woa5
	ZabHE/yIMZ7JKbmAqBlN14Jc3V2Wm3hoNXqO8V92Vv6AT8WrzjIzUp/UxxPPIGA==
X-Google-Smtp-Source: AGHT+IF7/HFOaU7S7x2Uzem9wGp/+d/CGemDqVj17q17h9PETabVi9yFbXlT1iEBPQSdt5F4c+sIpjJZM+ndKUOMHVQ=
X-Received: by 2002:a05:6e02:12ec:b0:3a7:d84c:f2a0 with SMTP id
 e9e14a558f8ab-3a9dbabfdb8mr16291535ab.7.1733774102376; Mon, 09 Dec 2024
 11:55:02 -0800 (PST)
MIME-Version: 1.0
References: <20241209-drm-msm-kvm-support-v1-1-1c983a8a8087@quicinc.com>
In-Reply-To: <20241209-drm-msm-kvm-support-v1-1-1c983a8a8087@quicinc.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 9 Dec 2024 11:54:50 -0800
Message-ID: <CAF6AEGtKfWOGpd1gMfJ96BjCqwERZzBVmj5GzmjKxw8_vmSrJg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/a6xx: Skip gpu secure fw load in EL2 mode
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Elliot Berman <quic_eberman@quicinc.com>, 
	Pavan Kondeti <quic_pkondeti@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_115504_295208_44C4A9BF 
X-CRM114-Status: GOOD (  30.88  )
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

On Mon, Dec 9, 2024 at 12:20=E2=80=AFAM Akhil P Oommen <quic_akhilpo@quicin=
c.com> wrote:
>
> When kernel is booted in EL2, SECVID registers are accessible to the
> KMD. So we can use that to switch GPU's secure mode to avoid dependency
> on Zap firmware. Also, we can't load a secure firmware without a
> hypervisor that supports it.

Shouldn't we do this based on whether zap node is in dtb (and not disabled)=
?

slbounce applies some dtb overlays to disable the zap node when
booting in EL2 (and make some other changes due to kernel being in
control of the pci smmuv3, or something along those lines).

BR,
-R

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

