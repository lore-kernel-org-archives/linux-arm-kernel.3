Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1F8DC83F07
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 10:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5VfweRdHv9ufprfg1Atwss0HvbCxmH7kEC9W20OMaU4=; b=0g9X6xsFXxD5wFgZKRhCshERCV
	yqMOVh/j4p3bXFKK+8aWQBfRSgIG000RVIvukGfZDEazoCjDxZxTlVjZeI8tXUvdtz/jkp8iTxwde
	HfQE05OXZ3BAPEiYT3+7YlV3E/St2lj5yEMdCKLxx79R0I1HwBcx5/LbRBjYz3s6R1uYbvCmRKTs5
	PZAvUknwN2qeoK0c/rofEPqHOLbA88s+HYDtuh7i2dLlcv1J7JScHnMMnMPha8Vk/ugaM2UQ4CQ9u
	On2tzkRWuoHZ5IF4Fqf0VNtT8Xf1VvayDT+nFQKfhpo4mZ8fhQ0ezKv2vRDxpNat5WNTE0hTSzhtt
	I87AEHow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYijA-000000025d9-41Em;
	Mon, 07 Jul 2025 10:05:36 +0000
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYiHc-000000020J9-1LuJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 09:37:09 +0000
Received: by mail-io1-xd32.google.com with SMTP id ca18e2360f4ac-873501d2ca1so51016539f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Jul 2025 02:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1751881027; x=1752485827; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5VfweRdHv9ufprfg1Atwss0HvbCxmH7kEC9W20OMaU4=;
        b=EIz52Ym142nL2Joi3Ze+z+hVwzhdZa0zngK2bu5fv+qnD3Un60tdMtnlYkzvW24bLX
         DL6ihoa188WceagjEy2XmNWMzPyfei6FI/K8K9400zgoQz9QU3dqDgh8qZcmMiodOypg
         1mtiqb6rirISRaIl9Gp6RKMGxw5tydmMl+jhaqThbnNjXR8Y6ATaQ1EOvkgN9t4IjlJp
         6Rfc0tFv9xkKUbeZj1ZN/6fMD/4BHHFlfHJ93pHKAtKcaGPnNwgVMwTuywtCjFxLWp6/
         fnbT3lF2TyuVTjf6lW3fmH/nalv1XrvJq2xE8IBYdV/ablrjW4xcebIOBzl1hHvDB/hk
         WA2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751881027; x=1752485827;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5VfweRdHv9ufprfg1Atwss0HvbCxmH7kEC9W20OMaU4=;
        b=kq/HLdwwSqVqiSPeBUH0xROSIDi8QDzuLm+oAKEQTmAU38ftXHkzOvvwTRDGEY2Apf
         tWtCYS3pA/mFqGfIp8I0XIQeLgA18qkLYqyqYnh5/KEfSprnngUa7e7JJzjv86GGv5lj
         ETqniqnbInzzuIyzji/pwxLAGnXM2N2dKABAGn8SM5VNFFgznfHxJi5RjG85mkZB2BBr
         E9SipEdP1jAMlzRV6y0wsePVtBrfodvDALG+cvgHBJ5qvpUpEseqkI+NOvcVVrsvFbp4
         4TQpqFuZgpEXoU3GngkzH2UnUjXBRdUACc7MDWxlLdsq4RvzCYBExcAF+80ZaA9xI7Eh
         ARCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVp6uzVWPY2Vk2ZvvgZjAOEDqbXIeaxNC+m9hz1voDppNKh0ZksNM7aRp4DVIPzuTMykHPLTMjTOWeQkE0Fe4F1@lists.infradead.org
X-Gm-Message-State: AOJu0YwSOQrQvVc35u8cKmZAh8tT1JmHR6724uIaenSntxwVhN/54Sbi
	qJj+LX+uBg5/E8P5wVv87oiIIwHSOhENG9a/kR+w/P2fMnB9SKHe4eVUnj80v20WDzr8wD/ojDl
	CflZAnqqDfXmGWUVQnvR1RjXT0zwhNnJmLWxNzowTaA==
X-Gm-Gg: ASbGncvoHc3OD5p9FYQzbkWmXVRRVQNs+kerVbZWZNOo8JoYeBMWizmp6qbOEsP2vMy
	0IURFr7GcohAvkUQSaWc6Ly9pXL11U0OaD/rhe7USccsS2boJpWVKcUIHofCxAECYjTbU01Mbxm
	p05Jz6Ajo2gt70K6g6D/NPaBdSKnjcpoG4jBWsoml5eU8/
X-Google-Smtp-Source: AGHT+IH+SePIS0aSzniflQp0S8Iw7JaUsbC6szdrpRvO5SkC/AQGSEVL3nboJR1AEhxiDDNFmQa8kIbvcXwwHXpVOK4=
X-Received: by 2002:a05:6e02:380d:b0:3df:2f47:dc21 with SMTP id
 e9e14a558f8ab-3e137204107mr107268135ab.22.1751881026965; Mon, 07 Jul 2025
 02:37:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250701114733.636510-1-ulf.hansson@linaro.org> <20250701114733.636510-12-ulf.hansson@linaro.org>
In-Reply-To: <20250701114733.636510-12-ulf.hansson@linaro.org>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 7 Jul 2025 15:06:55 +0530
X-Gm-Features: Ac12FXxpaKMFAHlr5TcRHSgcV-Hs57tR_KopRD8ZRlv3-fvgnPWZ2ytZglu0vVg
Message-ID: <CAAhSdy1V_hGt8CG4CBVTAeYk07Nbd7aT3WtJrgXhnsj7rUpQvg@mail.gmail.com>
Subject: Re: [PATCH v3 11/24] cpuidle: riscv-sbi: Opt-out from genpd's common
 ->sync_state() support
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Saravana Kannan <saravanak@google.com>, Stephen Boyd <sboyd@kernel.org>, linux-pm@vger.kernel.org, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Michael Grzeschik <m.grzeschik@pengutronix.de>, Bjorn Andersson <andersson@kernel.org>, 
	Abel Vesa <abel.vesa@linaro.org>, Peng Fan <peng.fan@oss.nxp.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Johan Hovold <johan@kernel.org>, 
	Maulik Shah <maulik.shah@oss.qualcomm.com>, Michal Simek <michal.simek@amd.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Hiago De Franco <hiago.franco@toradex.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_023708_600122_E4B42914 
X-CRM114-Status: GOOD (  19.19  )
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

On Tue, Jul 1, 2025 at 5:17=E2=80=AFPM Ulf Hansson <ulf.hansson@linaro.org>=
 wrote:
>
> The riscv-sbi-domain implements its own specific ->sync_state() callback.
> Let's set the GENPD_FLAG_NO_SYNC_STATE to inform genpd about it.
>
> Moreover, let's call of_genpd_sync_state() to make sure genpd tries to
> power off unused PM domains.
>
> Cc: Anup Patel <anup@brainfault.org>
> Cc: linux-riscv@lists.infradead.org
> Tested-by: Hiago De Franco <hiago.franco@toradex.com> # Colibri iMX8X
> Tested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> # TI AM62A,Xi=
linx ZynqMP ZCU106
> Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  drivers/cpuidle/cpuidle-riscv-sbi.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/cpuidle/cpuidle-riscv-sbi.c b/drivers/cpuidle/cpuidl=
e-riscv-sbi.c
> index 0fe1ece9fbdc..83d58d00872f 100644
> --- a/drivers/cpuidle/cpuidle-riscv-sbi.c
> +++ b/drivers/cpuidle/cpuidle-riscv-sbi.c
> @@ -347,11 +347,16 @@ static int sbi_cpuidle_init_cpu(struct device *dev,=
 int cpu)
>
>  static void sbi_cpuidle_domain_sync_state(struct device *dev)
>  {
> +       struct sbi_pd_provider *pd_provider;
> +
>         /*
>          * All devices have now been attached/probed to the PM domain
>          * topology, hence it's fine to allow domain states to be picked.
>          */
>         sbi_cpuidle_pd_allow_domain_state =3D true;
> +
> +       list_for_each_entry(pd_provider, &sbi_pd_providers, link)
> +               of_genpd_sync_state(pd_provider->node);
>  }
>
>  #ifdef CONFIG_DT_IDLE_GENPD
> @@ -396,7 +401,8 @@ static int sbi_pd_init(struct device_node *np)
>         if (!pd_provider)
>                 goto free_pd;
>
> -       pd->flags |=3D GENPD_FLAG_IRQ_SAFE | GENPD_FLAG_CPU_DOMAIN;
> +       pd->flags |=3D GENPD_FLAG_IRQ_SAFE | GENPD_FLAG_CPU_DOMAIN |
> +                    GENPD_FLAG_NO_SYNC_STATE;
>
>         /* Allow power off when OSI is available. */
>         if (sbi_cpuidle_use_osi)
> --
> 2.43.0
>

