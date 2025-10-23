Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D19ACCD1BC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 13:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hgz0MPvCEEIvnpRdxEKizmyGPKxuxFkbXXBpVNZQA2U=; b=W6i2PM7goLIDI0LSaaLdQqMzr9
	IJtLMBDuNlkB67bubc8OTVeLDFds//j3AjJY9YOlqMGNhVcpgDnT4Pw0E2nNhpcoUIoL3/jBoDuvp
	p0KiHWCinSvXnhRyyg1hzDuJObVUCg76Yfu5ccFsyX3JzaKZzN2VhNRk3TqHFHn3e1uQsPvgWe2HZ
	m9CwCxKVAA/eeMNIXZ3ppGPlmZjBlY9Agh67jpk8glKf27VAZDxLYbqbVWk9yfX29qV7UhQ4+JMFY
	no9j2C7SXzS5SsZjwY3Xg9sVUMeu0CON1/YdWVmOnjQVLXHGNrS/1ODu/Nn7/HodDZ8b8El0SnkhF
	VfibBhlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBvfj-00000006Sq8-0HOa;
	Thu, 23 Oct 2025 13:48:07 +0000
Received: from mail-yx1-xb134.google.com ([2607:f8b0:4864:20::b134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBvfA-00000006SnY-12jg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 13:48:05 +0000
Received: by mail-yx1-xb134.google.com with SMTP id 956f58d0204a3-63bcfcb800aso919323d50.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Oct 2025 06:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761227251; x=1761832051; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hgz0MPvCEEIvnpRdxEKizmyGPKxuxFkbXXBpVNZQA2U=;
        b=NQTqwHILUKMjgcGjmH1EBp6Js17iOqMCghXf2iGbiLDli3XDaE/HPmtY66z1lheuwk
         iepSQJ19DfiVHaouU0iXJNt++O1b4yuPy0Ya0/P1HnHCAp/4fDr6ASsljob6Jk6QM3VT
         nCX+y/Mgoaa5zv1ZQQGx2sjaEhpMhOne6kHSb63uttt1ix7LWMwHSq4ZS1NnOmEo0nk/
         68lnTFTNQlx6qpm04BLsJaLFyOhtAYjKjjcRKbxGMt9K+aQVPGmJkMQWPBpLT2/2/qHB
         J6DaMFbJkXz3nvozmnNHsPBssVTH8djQZOaPG0LjICtGBXY7nfjNFaaeISSRDg1lxVnM
         EeBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761227251; x=1761832051;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hgz0MPvCEEIvnpRdxEKizmyGPKxuxFkbXXBpVNZQA2U=;
        b=Q/vf86Y9cX2y9MNs/zMuEF4k7bck2VJwtX2w6Du1+6ZOvOZPe5Z/STeeuJumEowyQP
         QAIqj5skgYwGpbDTLrVf0ZE42bZpQjs3pmZl4StPqb9z+AygQeEDLS9flYJ7MzlVpb7G
         jEO3+11g5DD9qXGEMlTvECPsHXVYUdYD1g3Tk9yqDwkKdXeyc1CyYpDWqwm1aCaA67Oi
         eBPxETcREtu8q26RogyclYrqnlPdEZipTFBpBayXv0mLSOEjr0Zw1gc1NiKJ+A5iydSD
         q93181Lmfm/G16fZfL/7+Zga4dPDXJBOg5ksdiIxTgrJ0Ojy5JxMEQssWpKh0gGRSGB9
         F/kA==
X-Forwarded-Encrypted: i=1; AJvYcCWsj/S0B1ZNIkpuR71+NsyyyjixV2cSd7qo5PbTbsJf4gU5Fnuha1Iqn7p9ot/QHQK/8PUzUt0ORmI/Of2Iocc8@lists.infradead.org
X-Gm-Message-State: AOJu0YzGDMuVkOS7tP/F9WXNcDtWKdSF8Qz/wFf8Nl3D5KsNL+ALG4Iy
	UdSD8kR/zmkIn5ZfCm3vdJ89GVEjopgtIGSBtf95LfKQtafnQ7uKOpxogUkiE1Hl54V5MBU2j0C
	ZhR7xMCHlwfCOe4+YShi2DSTtbkBvzjN73WyN0vZ+eQ==
X-Gm-Gg: ASbGnctapRUwFh6G4uyH7Z0doEXd7vLwqSTPkk2DOZ3yXj90LZjnWakrHDCBy8RbLvp
	ouYaebQdcGlfv0UVYB2xOm/VIwNeItVz0uAhwkxRji7k+VBgVT9w4dW21ncHcR2UDwhxaSPnxJG
	b5ZSp0X7XyRAdKqAp26xPaHky8W/ErF3lN15Asap7Ryjuc6NYuP3vXFGNS/nubcxjLNFmeQ3BhQ
	kHcl/51LeuegCSUg5lNVMVKR+hTv/Cy6OuhMMRw6ClOLIzsmyBcKF0bLW4V5g==
X-Google-Smtp-Source: AGHT+IEDCfqv4pG4v0i8RCV2WYShTzR+pW/qVzfUKwEjCpv3rEpG8LtgRQWNRSjF/bG233OV5m2cMcbi37urgECEqnQ=
X-Received: by 2002:a05:690e:1598:10b0:63c:e90c:a6dc with SMTP id
 956f58d0204a3-63e160d9059mr18376155d50.8.1761227250806; Thu, 23 Oct 2025
 06:47:30 -0700 (PDT)
MIME-Version: 1.0
References: <20251016-gs101-pd-v3-0-7b30797396e7@linaro.org>
 <20251016-gs101-pd-v3-8-7b30797396e7@linaro.org> <CGME20251022110738eucas1p2cee28096ca5c9c6a802e2190d88ccf21@eucas1p2.samsung.com>
 <CAPDyKFq2esPos=D-eVz6w1VXq=4LYi6fx54K4TvsUi4JqUJOaQ@mail.gmail.com>
 <57bacc06-8a5e-4284-a520-c5d2a56545e9@samsung.com> <CAPDyKFrCS1PGwPeZd2ahZ=wKXCqPj93qAJ7V-ELELLA_OwgdSw@mail.gmail.com>
 <cca286f5-bb43-4914-864c-b5e5c73270c8@samsung.com>
In-Reply-To: <cca286f5-bb43-4914-864c-b5e5c73270c8@samsung.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 23 Oct 2025 15:46:54 +0200
X-Gm-Features: AS18NWABfjM36klv5hIIGT-5MwjE_SPbRGTiI4LQB-iSMF8Ct_lzzibZCZxPGQY
Message-ID: <CAPDyKFppte-Rh-xNybEz8dshrD2gfqJHUpiL1bPWzZ6pBig6+g@mail.gmail.com>
Subject: Re: [PATCH v3 08/10] pmdomain: samsung: selectively handle enforced sync_state
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Will McVicker <willmcvicker@google.com>, 
	kernel-team@android.com, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_064732_297928_3583E56E 
X-CRM114-Status: GOOD (  38.83  )
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

On Thu, 23 Oct 2025 at 14:17, Marek Szyprowski <m.szyprowski@samsung.com> w=
rote:
>
> On 23.10.2025 12:02, Ulf Hansson wrote:
> > On Wed, 22 Oct 2025 at 20:39, Marek Szyprowski <m.szyprowski@samsung.co=
m> wrote:
> >> On 22.10.2025 13:06, Ulf Hansson wrote:
> >>> On Thu, 16 Oct 2025 at 17:58, Andr=C3=A9 Draszik <andre.draszik@linar=
o.org> wrote:
> >>>> Unconditionally calling of_genpd_sync_state() causes issues on
> >>>> platforms with child domains as the parent domain will be turned off
> >>>> before the child domain was even registered during boot.
> >>>>
> >>>> This in particular is an issue for the upcoming Google gs101 support=
 -
> >>>> all operations on child domains registered after the parent domain
> >>>> misbehave.
> >>>>
> >>>> Add a flag to the probe data to be able to sync_state conditionally
> >>>> only, and enable that flag on the two platforms currently supported =
by
> >>>> this driver.
> >>>>
> >>>> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> >>>>
> >>>> ---
> >>>> v2:
> >>>> * use bool for need_early_sync_state (Krzysztof)
> >>>> ---
> >>>>    drivers/pmdomain/samsung/exynos-pm-domains.c | 5 ++++-
> >>>>    1 file changed, 4 insertions(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/drivers/pmdomain/samsung/exynos-pm-domains.c b/drivers/=
pmdomain/samsung/exynos-pm-domains.c
> >>>> index 638d286b57f716140b2401092415644a6805870e..15a1582aa92103a07335=
eb681600d9415369fefd 100644
> >>>> --- a/drivers/pmdomain/samsung/exynos-pm-domains.c
> >>>> +++ b/drivers/pmdomain/samsung/exynos-pm-domains.c
> >>>> @@ -20,6 +20,7 @@
> >>>>    struct exynos_pm_domain_config {
> >>>>           /* Value for LOCAL_PWR_CFG and STATUS fields for each doma=
in */
> >>>>           u32 local_pwr_cfg;
> >>>> +       bool need_early_sync_state;
> >>>>    };
> >>>>
> >>>>    /*
> >>>> @@ -69,10 +70,12 @@ static int exynos_pd_power_off(struct generic_pm=
_domain *domain)
> >>>>
> >>>>    static const struct exynos_pm_domain_config exynos4210_cfg =3D {
> >>>>           .local_pwr_cfg          =3D 0x7,
> >>>> +       .need_early_sync_state  =3D true,
> >>>>    };
> >>>>
> >>>>    static const struct exynos_pm_domain_config exynos5433_cfg =3D {
> >>>>           .local_pwr_cfg          =3D 0xf,
> >>>> +       .need_early_sync_state  =3D true,
> >>>>    };
> >>>>
> >>>>    static const struct of_device_id exynos_pm_domain_of_match[] =3D =
{
> >>>> @@ -179,7 +182,7 @@ static int exynos_pd_probe(struct platform_devic=
e *pdev)
> >>>>            * reset during boot. As a temporary hack to manage this, =
let's enforce
> >>>>            * a sync_state.
> >>>>            */
> >>>> -       if (!ret)
> >>>> +       if (pm_domain_cfg->need_early_sync_state && !ret)
> >>>>                   of_genpd_sync_state(np);
> >>> The call to of_genpd_sync_state() was intended as a temporary solutio=
n here.
> >>>
> >>> Potentially, if we would be able to distinguish what PM domain that i=
s
> >>> causing the problem on the Exynos platforms, we could set
> >>> GENPD_FLAG_NO_STAY_ON for that genpd instead.
> >> Well, this of_genpd_sync_state() "workaround" has to be applied only t=
o
> >> the power domain of the display controller device. It can be replaced =
by
> >> the following check on the legacy Exynos systems:
> >>
> >> if (IS_ENABLED(CONFIG_ARM) &&
> >> of_device_is_compatible(np, "samsung,exynos4210-pd") &&
> >> (strstr(pd->pd.name, "LCD") || strstr(pd->pd.name, "DISP")))
> >> pd->pd.flags =3D GENPD_FLAG_NO_STAY_ON;
> > Oh wait, perhaps better to just power-off these PM domains before
> > calling pm_genpd_init(), if that can be done safely?
> >
> > At least that would guarantee the reset to happen before the display
> > driver gets probed. Instead of relying on genpd_power_off_unused()
> > (late_initcall_sync) to do it.
>
> Well, yes, this works too:
>
> if ((of_device_is_compatible(np, "samsung,exynos4210-pd") &&
>      (strstr(pd->pd.name, "LCD") || strstr(pd->pd.name, "DISP"))))
>           exynos_pd_power_off(&pd->pd);

Okay!

Should we (you or me?) send a patch and change the code like this?

>
> >> I assume that this information cannot be coded in device tree to make =
it
> >> somehow generic...
> > Right, in principle we would need a new DT property for a power-domain
> > provider, like "broken-hw-reset", because we don't have a reset-line
> > to pull.
>
> It is not a matter of broken reset at all. It is a matter of software
> configuration and the lack of 'protocol' to pass the information that
> the display controller is configured to display splash screen from the
> system memory at given address and newly instantiated drivers must to be
> aware of that.
>
> Turning display-related power domain off simply resets all that
> configuration, so drivers can start from good known 'unconfigured' state.

Alright, thanks for clarifying! Yeah, a DT property would be wrong for this=
.

In fact, there are some drivers [1] that make use of the genpd on/off
notifiers to manage a reset of its device's PM domain. It works, but
it's a bit messy. Perhaps it could be simplified with some new helper
functions, if more consumers drivers need something similar.

Kind regards
Uffe

[1]
commit c11fa1204fe9 ("drm/msm/a6xx: Use genpd notifier to ensure
cx-gdsc collapse")

