Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6EB4E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 21:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nUNHDJ6ILFxdRFiTOkLTRDjyDsyOaooQYqwkxtWBOZs=; b=RPCtcjpWticCxvaeEJTYAjjvjy
	kncY1sptN8aJoc1z+OcmEymkydtiVoizTTX3J0Cg7+7qqNVApUrQ5Pjv8ThtNLEmtdeP0CBUoJiDl
	Pmrg2rQPO5qnr9jpOWTXgNvo21M44wayMjHIaSQUatzw7E346D0xgiuA5GsDNMMc231Q+VJWso9l0
	MhS9mlz8KlgN2uL1r5Kb5dGlBE5cSUwoPRRoeJxkPSu+h+Xz64N7hiXXuOeSdgLKvoQ9JH1JJRxhA
	2ObFFB1vzeAsF6jWZIF/3n6XLgGKhwwcjGGHxWmF6zvjC4CSDj7ALinJI5oFsYelin/Kgg5B5Fe2v
	Fqhq9ErQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKllR-00000009N6L-3Mpy;
	Mon, 09 Dec 2024 21:58:01 +0000
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKlkO-00000009MtE-3JCY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 21:56:58 +0000
Received: by mail-il1-x134.google.com with SMTP id e9e14a558f8ab-3a9cee9d741so12392085ab.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Dec 2024 13:56:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733781416; x=1734386216; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nUNHDJ6ILFxdRFiTOkLTRDjyDsyOaooQYqwkxtWBOZs=;
        b=EFo3S9BP9dfsM7T7WbBX9zPaSyF7wnz2bVFwPaJgIGeERoQuVZAOoXj9U6tOJzvTmb
         6kfbRlptXbmkXVd4+b3eGdsYBbPiU6WJu7C8Jy7FdNSoz3d3byX4FnKRDRTD3xuHAC/K
         ZpsDvVjZCePXi3eIgItECbHuo9907qpJnwafFPDqvyGole9YZb0XCMonj1qc6tn6pkHK
         KL/JBNaFNhOrJgqJokxjNZRHUSoTQbJ3nH9EEbyXAD16JD5MozkClnyPs9YIEXbgxMao
         hl/DadXdRljyAiW+OYY17++hu2oZQCz3x9UX9mqTPSEAz00O4nWKOwNfo0qow05EgYbc
         UGQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733781416; x=1734386216;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nUNHDJ6ILFxdRFiTOkLTRDjyDsyOaooQYqwkxtWBOZs=;
        b=h08+5T/DUkHsIYKuXl6NkCqM0I6RE9+lXUhX8AYe8Zv88QvW5++B/8ZpZqolDWTJTp
         ZcpD5jVL6wUtxO/Qup0hlm9Hph2MPH59VNrLS4Z4Ent6IxANKVAnZ9mCChznxDIl99ac
         GCEbbpb/xsjtwDkHOqGs1Ij9TIf5kgeVjCiYtx5kRE9Lx+7C1nR8g9x3tomdeng1XPO5
         SuLCvNyrLxF4TRs5wu034ugOLA2gEy6A1X8rpGhsoKMAsZgFL8gh13O+aKM6QpJ6Ecji
         ZO4kFnv7+ug96Uw5y/a/HB1iUuQPD2tE5CLwV160iH4eu9ld6Dzl1JwOmfMhkPn+oUOZ
         BdPA==
X-Forwarded-Encrypted: i=1; AJvYcCWvJuyi+nsrIaAuk/Wm9cta/kPWRBEKHs03ZgpidbTkWIvhy+fk7EV/frOit1Ae911g8XTDWhcYBZiOr59XOLS9@lists.infradead.org
X-Gm-Message-State: AOJu0YyScdUq9x5ln5gAOsiVXjdvQuDNdZZpSHxtKWU2XmN1QSIR3dLd
	YPY9TMX/9qdJCCUweYa+S3yuZAguqQgS5uBweCQkQjmt1SNIyJz/cKskBb6fHg+OZRE+E7kogDq
	0MDb7s1BpnbCaoCjJZqwPQTc4HsgSB6Tr
X-Gm-Gg: ASbGncuOYERhKwTkvDN6zlEZdNir+EFzg6GsYNCZfBrQP6NpbAwUjoPCVNqHQ1Qd/cd
	ap5MYcaeJSehKyrlvPxprt4LrpPSG+sJ0Z+jppQOmLcBvAlNS/4N/CUvjurVKFXqx/Q==
X-Google-Smtp-Source: AGHT+IH7i9zLT2/3HS5RsXkA25gYc8CnkPrXffiXodQojiAfgigEq875VdgnrRDYd+CYD90qZDMyy0maoJBm25wbQSE=
X-Received: by 2002:a05:6e02:3707:b0:3a7:9670:7abb with SMTP id
 e9e14a558f8ab-3a811e073a4mr155617215ab.15.1733781415758; Mon, 09 Dec 2024
 13:56:55 -0800 (PST)
MIME-Version: 1.0
References: <20241209-drm-msm-kvm-support-v1-1-1c983a8a8087@quicinc.com>
 <CAF6AEGtKfWOGpd1gMfJ96BjCqwERZzBVmj5GzmjKxw8_vmSrJg@mail.gmail.com> <f4813046-5952-4d16-bae6-37303f22ad1a@quicinc.com>
In-Reply-To: <f4813046-5952-4d16-bae6-37303f22ad1a@quicinc.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 9 Dec 2024 13:56:44 -0800
Message-ID: <CAF6AEGvBU8mB5HHNK4nP5h9ouKfLNhCMFgF+PhrC77ZMfSOTkQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/a6xx: Skip gpu secure fw load in EL2 mode
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Pavan Kondeti <quic_pkondeti@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Elliot Berman <quic_eberman@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_135656_827651_C2AD577C 
X-CRM114-Status: GOOD (  37.57  )
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

On Mon, Dec 9, 2024 at 12:52=E2=80=AFPM Akhil P Oommen <quic_akhilpo@quicin=
c.com> wrote:
>
> On 12/10/2024 1:24 AM, Rob Clark wrote:
> > On Mon, Dec 9, 2024 at 12:20=E2=80=AFAM Akhil P Oommen <quic_akhilpo@qu=
icinc.com> wrote:
> >>
> >> When kernel is booted in EL2, SECVID registers are accessible to the
> >> KMD. So we can use that to switch GPU's secure mode to avoid dependenc=
y
> >> on Zap firmware. Also, we can't load a secure firmware without a
> >> hypervisor that supports it.
> >
> > Shouldn't we do this based on whether zap node is in dtb (and not disab=
led)?
>
> This is better, isn't it? Otherwise, multiple overlays should be
> maintained for each soc/board since EL2 can be toggled from bootloader.
> And this feature is likely going to be more widely available.

I guess the first question is what the dt should look like.  I think
it makes sense to not have a zap node when booting in EL2 (or at least
disabling it) because that describes the hw+fw situation.  And in any
case, so far it seems like we often need unrelated changes[1].  But
maybe others have differing opinions.

And depending on how much cooperation we get from the bootloader, it
could be that our hand is forced.  I figured I should at least point
out how we currently handle this.

A further point, I suppose it is in theory possible that a device
could have no secure playback support, despite booting in EL1?  So
tying this to EL2 seems a bit contrived.

BR,
-R

[1] https://github.com/TravMurav/slbounce/blob/main/dtbo/x1e-el2.dtso

> -Akhil.
>
> >
> > slbounce applies some dtb overlays to disable the zap node when
> > booting in EL2 (and make some other changes due to kernel being in
> > control of the pci smmuv3, or something along those lines).
> >
> > BR,
> > -R
> >
> >>
> >> Tested following configurations on sa8775p chipset (Adreno 663 gpu):
> >>
> >> 1. Gunyah (No KVM) - Loads zap shader based on DT
> >> 2. KVM in VHE - Skips zap shader load and programs SECVID register
> >> 3. KVM in nVHE - Loads zap shader based on DT
> >> 4. Kernel in EL2 with CONFIG_KVM=3Dn - Skips zap shader load and
> >>         programs SECVID register
> >>
> >> For (1) and (3) configuration, this patch doesn't have any impact.
> >> Driver loads secure firmware based on other existing hints.
> >>
> >> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> >> ---
> >> ---
> >>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 82 +++++++++++++++++++++++---=
---------
> >>  1 file changed, 54 insertions(+), 28 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/m=
sm/adreno/a6xx_gpu.c
> >> index 019610341df1..9dcaa8472430 100644
> >> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >> @@ -14,6 +14,10 @@
> >>  #include <linux/pm_domain.h>
> >>  #include <linux/soc/qcom/llcc-qcom.h>
> >>
> >> +#ifdef CONFIG_ARM64
> >> +#include <asm/virt.h>
> >> +#endif
> >> +
> >>  #define GPU_PAS_ID 13
> >>
> >>  static inline bool _a6xx_check_idle(struct msm_gpu *gpu)
> >> @@ -998,6 +1002,54 @@ static int a6xx_zap_shader_init(struct msm_gpu *=
gpu)
> >>         return ret;
> >>  }
> >>
> >> +static int a6xx_switch_secure_mode(struct msm_gpu *gpu)
> >> +{
> >> +       int ret;
> >> +
> >> +#ifdef CONFIG_ARM64
> >> +       /*
> >> +        * We can access SECVID_TRUST_CNTL register when kernel is boo=
ted in EL2 mode. So, use it
> >> +        * to switch the secure mode to avoid the dependency on zap sh=
ader.
> >> +        */
> >> +       if (is_kernel_in_hyp_mode())
> >> +               goto direct_switch;
> >> +#endif
> >> +
> >> +       /*
> >> +        * Try to load a zap shader into the secure world. If successf=
ul
> >> +        * we can use the CP to switch out of secure mode. If not then=
 we
> >> +        * have no resource but to try to switch ourselves out manuall=
y. If we
> >> +        * guessed wrong then access to the RBBM_SECVID_TRUST_CNTL reg=
ister will
> >> +        * be blocked and a permissions violation will soon follow.
> >> +        */
> >> +       ret =3D a6xx_zap_shader_init(gpu);
> >> +       if (ret =3D=3D -ENODEV) {
> >> +               /*
> >> +                * This device does not use zap shader (but print a wa=
rning
> >> +                * just in case someone got their dt wrong.. hopefully=
 they
> >> +                * have a debug UART to realize the error of their way=
s...
> >> +                * if you mess this up you are about to crash horribly=
)
> >> +                */
> >> +               dev_warn_once(gpu->dev->dev,
> >> +                       "Zap shader not enabled - using SECVID_TRUST_C=
NTL instead\n");
> >> +               goto direct_switch;
> >> +       } else if (ret)
> >> +               return ret;
> >> +
> >> +       OUT_PKT7(gpu->rb[0], CP_SET_SECURE_MODE, 1);
> >> +       OUT_RING(gpu->rb[0], 0x00000000);
> >> +
> >> +       a6xx_flush(gpu, gpu->rb[0]);
> >> +       if (!a6xx_idle(gpu, gpu->rb[0]))
> >> +               return -EINVAL;
> >> +
> >> +       return 0;
> >> +
> >> +direct_switch:
> >> +       gpu_write(gpu, REG_A6XX_RBBM_SECVID_TRUST_CNTL, 0x0);
> >> +       return 0;
> >> +}
> >> +
> >>  #define A6XX_INT_MASK (A6XX_RBBM_INT_0_MASK_CP_AHB_ERROR | \
> >>                        A6XX_RBBM_INT_0_MASK_RBBM_ATB_ASYNCFIFO_OVERFLO=
W | \
> >>                        A6XX_RBBM_INT_0_MASK_CP_HW_ERROR | \
> >> @@ -1341,35 +1393,9 @@ static int hw_init(struct msm_gpu *gpu)
> >>         if (ret)
> >>                 goto out;
> >>
> >> -       /*
> >> -        * Try to load a zap shader into the secure world. If successf=
ul
> >> -        * we can use the CP to switch out of secure mode. If not then=
 we
> >> -        * have no resource but to try to switch ourselves out manuall=
y. If we
> >> -        * guessed wrong then access to the RBBM_SECVID_TRUST_CNTL reg=
ister will
> >> -        * be blocked and a permissions violation will soon follow.
> >> -        */
> >> -       ret =3D a6xx_zap_shader_init(gpu);
> >> -       if (!ret) {
> >> -               OUT_PKT7(gpu->rb[0], CP_SET_SECURE_MODE, 1);
> >> -               OUT_RING(gpu->rb[0], 0x00000000);
> >> -
> >> -               a6xx_flush(gpu, gpu->rb[0]);
> >> -               if (!a6xx_idle(gpu, gpu->rb[0]))
> >> -                       return -EINVAL;
> >> -       } else if (ret =3D=3D -ENODEV) {
> >> -               /*
> >> -                * This device does not use zap shader (but print a wa=
rning
> >> -                * just in case someone got their dt wrong.. hopefully=
 they
> >> -                * have a debug UART to realize the error of their way=
s...
> >> -                * if you mess this up you are about to crash horribly=
)
> >> -                */
> >> -               dev_warn_once(gpu->dev->dev,
> >> -                       "Zap shader not enabled - using SECVID_TRUST_C=
NTL instead\n");
> >> -               gpu_write(gpu, REG_A6XX_RBBM_SECVID_TRUST_CNTL, 0x0);
> >> -               ret =3D 0;
> >> -       } else {
> >> +       ret =3D a6xx_switch_secure_mode(gpu);
> >> +       if (!ret)
> >>                 return ret;
> >> -       }
> >>
> >>  out:
> >>         if (adreno_has_gmu_wrapper(adreno_gpu))
> >>
> >> ---
> >> base-commit: f4a867a46862c1743501bbe8c813238456ec8699
> >> change-id: 20241120-drm-msm-kvm-support-cd6e6744ced6
> >>
> >> Best regards,
> >> --
> >> Akhil P Oommen <quic_akhilpo@quicinc.com>
> >>
>

