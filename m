Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 257F1CA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 08:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3shV/IEEj+NmVizCeUDHMNW1W3PTgtTr4WQ4n8BMHxY=; b=Vb97Y42OunySz8WqaT4obZaWO8
	NuxUVkmvPgj7j5x5erA1DO46Ff6AMvlpTn0hSuwPIrkyOHQVtRn4dTs1GBjG9URweFtw8I58rUh4A
	faZfT1sD0y8r73xV9hiNq3wGYZ1q7ASEWDNOjc0BWa41qWHTfcskcGDQeY7drxaBJAwh1iAZnkGhX
	i6iSTadhVXRdBYRPiz+GcuDSF9E1cyPajaXU8mYcxaCLj+GWvG/eZsSpt1RzaYtm/yG2VJDr5ULr5
	mW9Q8o0UQB8r33U6yHoP7AMbAONK+jaFRuDlE+TDFf/20X3KeoISEXnatYezmCildwElyk2ntOnXy
	gmeO4LvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE0bL-00000000Hqh-1VtM;
	Tue, 06 Oct 2026 08:32:43 +0000
Received: from mail-yx1-xb12b.google.com ([2607:f8b0:4864:20::b12b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE0bI-00000000Hpr-1Phh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 08:32:41 +0000
Received: by mail-yx1-xb12b.google.com with SMTP id 956f58d0204a3-677c1fc082bso2079716d50.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Oct 2026 01:32:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791275553; cv=none;
        d=google.com; s=arc-20260327;
        b=d6UOvulscbVFAC8xWJ23pMLfO31/EDzp8Kf9HB+UYKfRGpgpEo+miVuyrGmHcOj3M9
         SdqfMRouHM0YdyXJbDNiCs/qR74o8TFS9ZN7ffV/DVYaxKuKMPb7zed3pb+BM3Dv2VFr
         bDcP1awMvyFmWn87+84ALPCZQFIVIfhB8U13CgNw42OUdQEO/7HrWrHCuTAicz9g3O1e
         LxEH1ryb04iXkhg2+izzqjwWQhQYh2tlTQv1mq2vCUcewK11w0d0WE/tK4mvX2hXS08R
         tmu7rJy9ScwTrpWMf0lrH+TpRidHycTyOrGm7lTk9VtocUKUUM4FIWMdBWW/E+6G09Z8
         7Iew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3shV/IEEj+NmVizCeUDHMNW1W3PTgtTr4WQ4n8BMHxY=;
        fh=I+PWn6nkdTNcOs9TDWMyepM13RTBgf+uP1o5y/YduaM=;
        b=aPyrJxWWrY8dzhiIjbJ+ZwRw2g4D3V+DBme+ve8KKsTefztsTDuDmKZ58fnmOnjRss
         9h+ir+Fx9LH8Yim2USBMo68PPD+AcaWRoev1f1hZsx8QVtQyuNQRkp1sw/2Uxy/Ex2t2
         76B3Ygzz9EpnSyg7MUJGltHMI3NyZmQ3PE9XUVBG7nCjZKERaItDkqutMN9zrsCuQeZm
         uXDOpPJx3nEB0b2su833FjVWSp2i7Ek2OxfpwkkYE7URxvS3MfJk/q2facNuOPSIvYEO
         lIijdiCJBMQyq/AJ1MnoR+OltldSLMLTI1imCKNhQqf6KoffIW5Dwc1xaOU8NhnG/v9b
         zMpw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791275553; x=1791880353; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3shV/IEEj+NmVizCeUDHMNW1W3PTgtTr4WQ4n8BMHxY=;
        b=DkgJnhcwXV+ZZKYJ1rbV7UU29i13vLjt1lAWTWe5L8Z23tgKwokO3dA0Vl9e+YIjmt
         BserJGi/P+5OZiIqMAGMqW6/kxP+hR2p9wzB0j2nUjbFBnHn8TXQIEM2OAsMwV2gF8Yz
         PibTP02gzqitchfKkmqpCwI0hY13QQV63tWDw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791275553; x=1791880353;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3shV/IEEj+NmVizCeUDHMNW1W3PTgtTr4WQ4n8BMHxY=;
        b=qXUEmhIM+LXFCsXQVBXHeXNijb5spxfE9sNQwc4w7vvMqRmXgYYLaX9aPo7m8hxptz
         qHjMEw1QW74RB7z1mj84WLMFOPzDKFp7TV3x55Uw5IWeHbiBsHI7szXg9MbPX6UCuUOx
         LhjNkxM1vGdKJ4/Cd4BOlTkP76BSWvuOwJ+xHdY5r5L/jtrJ6YnWGNFIuUfnDIWMXNDJ
         q0eXUnqnBfULdIKDka9eftjnT43y8JUi/3HgDyOXVFndocR2FlNtjpQMVyzt4GbkXcZ8
         +XH8k0GkSp+MFw2bWkAux+K/xZGcgZCTIWcaDUzYja2X9853oCzdYOoRAkk3PsQ0vCjt
         hvig==
X-Forwarded-Encrypted: i=1; AKwUvBzG8kuF/bKNJSsKUwlmK1nmxojySRhaEyClIHUvYqJGDRr1cHB4EBx7heoKaV9xvbRpyO6FefAeUuEcJWeVtadd@lists.infradead.org
X-Gm-Message-State: AFq9FYKvE/rrxSd/vDX40xt3jDoa+VLPDNylz7nUI7EpvxYzRtwz2IHP
	NeO4UWZoR3xW499h8gm9hSATH+dMB23dUXqr1CNoHsRabe3SH/nH4jP6XKJn29BmGgYUJAXcOLS
	WiwvbiZ/UEehfn9VO80RmqaHfOPTTSGD8LfQiGJEi
X-Gm-Gg: AYBFou3u+TTXdow2AzxSeiORGlUPBA32vY7EO+zZIxukdVvkKL2CdhMYRtmujWOczmc
	ycE1AmCpQ7bC/KHY7mNMMxgSa+IxibOKo+aE9oRT0SlgOpjFJcwRRwn7reZ54+L1E9okq0hznBC
	9zm3U8AOUbgJTQ+I+V3BQz6o6wdBZBwTfIGUQjbM1w6QOUK5MiorEvWXqxAkU1l9fXwqnpWyWwH
	yCqoiEsixwtdz0qN/x+KwuEAGsARdqPPhMuVHFd6Ns/EJyMnsfH8u5WTpflfUfnYsR+tQ7yp0b1
	q+4uEV/fuMKI6o2bw9806pvystthOOOfPEV52DwZMr/i9XTqyDDSug==
X-Received: by 2002:a53:c0c2:0:b0:671:7b7f:abbb with SMTP id
 956f58d0204a3-677bd39aa4dmr2469021d50.59.1791275553415; Tue, 06 Oct 2026
 01:32:33 -0700 (PDT)
MIME-Version: 1.0
References: <20261006025410.506443-1-nils@buechner.me> <20261006025410.506443-3-nils@buechner.me>
In-Reply-To: <20261006025410.506443-3-nils@buechner.me>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 6 Oct 2026 10:32:21 +0200
X-Gm-Features: AclHuK8Gx2HsVGfCjYPgfM4FA2K14FiDyp_XESIE_p6YvoUuSuzEHEzfn-CxmWQ
Message-ID: <CAGXv+5F-5b+ESeUXBMYfKU=wUF9tAioyWOjWfYXoz09_-P8-bg@mail.gmail.com>
Subject: Re: [PATCH 2/2] soc: mediatek: mtk-svs: Don't fail init01 on a bank
 whose buck is not at vboot yet
To: =?UTF-8?Q?Nils_B=C3=BCchner?= <nils@buechner.me>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_013240_433805_78DBE6D7 
X-CRM114-Status: GOOD (  29.11  )
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

On Tue, Oct 6, 2026 at 4:54=E2=80=AFAM Nils B=C3=BCchner <nils@buechner.me>=
 wrote:
>
> svs_init01() moves every bank to its vboot OPP and then immediately
> requires the bank's buck to read back exactly vboot. For the MT8183 GPU
> banks the buck follows panfrost devfreq, which has not necessarily acted
> on the OPP change yet (an idle GPU stays at its lowest OPP), so the
> check fails and the whole SVS probe aborts with -EPERM, leaving the CPU
> and CCI banks uncalibrated as well:
>
>   SVSB_GPU: buck voltage: 700000uV, expected vboot: 800000uV
>   mtk-svs 1100bc00.svs: error -EPERM: svs start fail
>
> Poll the buck for up to 500ms before giving up. If it still is not at
> vboot, skip only that bank: restore its default OPP voltages, disable it,
> and calibrate the others.
>
> On Acer Chromebook Spin 311 (MT8183) the GPU buck reaches vboot within
> the poll window and all four banks complete init01/init02.

Were both drivers (mtk-svs and panfrost) built-in, or as modules?
This would affect the timing.

> Runtime-tested on an Acer Chromebook Spin 311 (MT8183, juniper) with a
> 7.0-based kernel (the hardware is not set up to boot mainline);
> build-tested on mainline with W=3D1. On the device together with
> the auxadc_thermal per-sensor zone change: all four banks complete
> init01/init02 at boot (CPU little 1.99 GHz 1050 -> 1000 mV), stable
> under 60 s of full load on all cores at maximum frequency.
>
> The change and this changelog were drafted with an AI coding assistant
> during a debugging session on the hardware; they were reviewed and
> tested by the submitter.

This section could be moved after the "---".

> Fixes: 681a02e95000 ("soc: mediatek: SVS: introduce MTK SVS engine")
> Assisted-by: Claude Opus 5.5
> Signed-off-by: Nils B=C3=BCchner <nils@buechner.me>
> ---
>  drivers/soc/mediatek/mtk-svs.c | 34 +++++++++++++++++++++++++++-------
>  1 file changed, 27 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-sv=
s.c
> index 99edecb20..2598a1ccb 100644
> --- a/drivers/soc/mediatek/mtk-svs.c
> +++ b/drivers/soc/mediatek/mtk-svs.c
> @@ -16,6 +16,7 @@
>  #include <linux/device.h>
>  #include <linux/init.h>
>  #include <linux/interrupt.h>
> +#include <linux/iopoll.h>
>  #include <linux/kernel.h>
>  #include <linux/kthread.h>
>  #include <linux/module.h>
> @@ -1439,6 +1440,7 @@ static int svs_init01(struct svs_platform *svsp)
>         bool search_done;
>         int ret =3D 0, r;
>         u32 opp_freq, opp_vboot, buck_volt, idx, i;
> +       unsigned long skipped =3D 0;
>
>         if (!svs_mode_available(svsp, SVSB_MODE_INIT01))
>                 return 0;
> @@ -1542,13 +1544,20 @@ static int svs_init01(struct svs_platform *svsp)
>                                                       bdata->volt_step,
>                                                       bdata->volt_base);
>
> -               buck_volt =3D regulator_get_voltage(svsb->buck);
> -               if (buck_volt !=3D opp_vboot) {
> -                       dev_err(svsb->dev,
> -                               "buck voltage: %uuV, expected vboot: %uuV=
\n",
> -                               buck_volt, opp_vboot);
> -                       ret =3D -EPERM;
> -                       goto svs_init01_finish;
> +               /*
> +                * The consumer's DVFS (e.g. GPU devfreq while the GPU is=
 idle)
> +                * may not have moved to the vboot OPP yet. Give it a mom=
ent,
> +                * then calibrate the remaining banks without this one in=
stead
> +                * of failing the whole SVS probe.
> +                */
> +               if (read_poll_timeout(regulator_get_voltage, buck_volt,
> +                                     buck_volt =3D=3D opp_vboot, 10000, =
500000,
> +                                     false, svsb->buck)) {
> +                       dev_warn(svsb->dev,
> +                                "buck voltage: %uuV, expected vboot: %uu=
V, skipping bank\n",
> +                                buck_volt, opp_vboot);
> +                       __set_bit(idx, &skipped);
> +                       continue;
>                 }
>
>                 spin_lock_irqsave(&svs_lock, flags);
> @@ -1578,6 +1587,14 @@ static int svs_init01(struct svs_platform *svsp)
>                         if (r)
>                                 dev_err(svsb->dev, "opp %uHz enable fail:=
 %d\n",
>                                         svsb->opp_dfreq[i], r);
> +
> +                       /* A skipped bank keeps its default OPP voltages =
*/
> +                       if (test_bit(idx, &skipped))
> +                               dev_pm_opp_adjust_voltage(svsb->opp_dev,
> +                                                         svsb->opp_dfreq=
[i],
> +                                                         svsb->opp_dvolt=
[i],
> +                                                         svsb->opp_dvolt=
[i],
> +                                                         svsb->opp_dvolt=
[i]);
>                 }
>
>                 if (svsb->volt_flags & SVSB_INIT01_PD_REQ) {
> @@ -1599,6 +1616,9 @@ static int svs_init01(struct svs_platform *svsp)
>                 if (r)
>                         dev_err(svsb->dev, "%s disable fail: %d\n",
>                                 bdata->buck_name, r);
> +
> +               if (test_bit(idx, &skipped))
> +                       svsb->mode_support =3D SVSB_MODE_ALL_DISABLE;
>         }
>
>  svs_init01_resume_cpuidle:
> --
> 2.53.0
>
>

