Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B701C02182
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 03:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EU/PQ4VJf1HAvGTZSkAiUG1imY6cPU+66kZ1BUgwrQI=; b=uufkGGW615vEM7HqynPENEbO/N
	Oyq8XdBeYs5+ZUGKOv/EIdWjrgQL80SAroiLmiinMeoKUJy9AAXGN5dL4NyxT6YaSXlsoqQHrnQWE
	5LICxQ41aZLyFel8HcgYZoHqejEpkRZQOGdR8EbNpYKgcGUfZZ0EpXp2VX3K/RWxVC4kaAldIRO5s
	tHIOA2rKl+cL0uOHCPkEEjThUTGuMigdBfphiN4CcFHPX6isHbFr8vyeckAB2XyI48cOed1x2RtnC
	5eTg+NM8XskM5/DwJ0Dfo9UYKdXRfogn2vOhrteRqoXZvrisLEmvMma1tJex2e4ryo80zU5ImvUYF
	jWVgakrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbAAR-0000000DmyH-2dl3;
	Fri, 24 Jan 2025 03:15:35 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbA98-0000000Dmog-2VqN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jan 2025 03:14:15 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-54024ecc33dso1686346e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jan 2025 19:14:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1737688451; x=1738293251; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EU/PQ4VJf1HAvGTZSkAiUG1imY6cPU+66kZ1BUgwrQI=;
        b=gG2+u0T8ZC3HoCzd86MMvw+KWvZ3qNhF8UY0vxWJMgD8bHskrn9NcjroPGJB3iXXzc
         iLiQnRkblosJ3rUUruraov2WJGr4aFP6naeAZl6lvGUgJ5k8ynO6egQPxVK09HGkRn7c
         X1c4q8fe9/AhYk1P0jOvsILj2ChRDuJN9Olqo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737688451; x=1738293251;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EU/PQ4VJf1HAvGTZSkAiUG1imY6cPU+66kZ1BUgwrQI=;
        b=wHal26fDHQuieo2VGerlTyAJMJ7tsjlnbF4zrEECMKYHq8PpGewq4J82xVwJbAG6kK
         ybma2T5wFwAcOnLtRlXz2KwUCNYiTGlbREzEr3EIxBQPxvLMMG6NUSwok9j+Sfztkqn5
         mbdlYfpH3DVEcF2D1U2t6AjzD1yKsfevgAJRbQFCj98eBCPvm7GmCa6IYcMaCpQvdVuZ
         5HI4yETpLyhsURbFfqBMbHkHklfvOSxOTsWVAPerfwg1dlJxapnFaq4xI+16lg5bP/dr
         y8O/jazmFx3AdKtdHDl4hR/YPjgp4N9b73BhoOO6srcl7emuqQpJ32FMjUtbwKA0Upzb
         E4Mw==
X-Forwarded-Encrypted: i=1; AJvYcCUlFDV5u2tQPiNiIxQmMOLo3dRJx3fAsmZ3jsPby2UQ7c7J60o3ocxW+RXfsSBd231mD/TZ6quci3Xv2eqmjyam@lists.infradead.org
X-Gm-Message-State: AOJu0YzLtzSr/3h1+90MpQCXyS7ahu+5gna5hNMQaYY27R/4HKZ21lPZ
	ysJ95xwzBMh0Q6tPvc2HI1f9ppgJCnGGhv3Z5QmAV8cdDU+5sEj2XvzVQNaiPg9UfwJyQk+K1vx
	5ADCp
X-Gm-Gg: ASbGncu3U0o3HzwZl9dZpAq6kDEfJtZqvVYpQkxyffyiXieBSV2jg0juvVqkbJoRkHN
	vTEILB/8dzzPN+rut6nrAXUbwL/vgvustf8bCvKX8HX0luPNkKuBdLk6PUQNnlZzHVcWQz4ansK
	bAfzjSjB9UQ9+pM3NvRwhlBgYMoFJUnr2ITYQCiKWu9+ddfj5JUUXPhdJsRL8xt3bLh5gojfUmQ
	eeVebFTGe8BnV/kU0BaPs+5ZmCk8dmyGNBF9NvV9KYm8IkqpgzSQlMgO/54rXPjFoR5hyYS8Bn8
	SZ/Pt5kd/iRSvopPe6G77vlHyjGcBUANprqfpt9npTgFPsbW
X-Google-Smtp-Source: AGHT+IHq9K7Wcl/DhcNJhfboRS2l6nkJAf0xQOnuof6CfGnVvJNrDeTcf6vv6QjWp+JQLOCoMpPchA==
X-Received: by 2002:ac2:528a:0:b0:540:2549:bd36 with SMTP id 2adb3069b0e04-5439c21f38cmr8323779e87.4.1737688451169;
        Thu, 23 Jan 2025 19:14:11 -0800 (PST)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com. [209.85.208.170])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543c83683e4sm135194e87.144.2025.01.23.19.14.10
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jan 2025 19:14:10 -0800 (PST)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3061513d353so17386691fa.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jan 2025 19:14:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXPB7zSF5ywGI/EpuJz2u4McNb+qfCqo9hDyCPEdXv2L6Gsw45IIDW+1kjcpa+GEQ/dXAzYdiPFi9//YiKZ5KFZ@lists.infradead.org
X-Received: by 2002:a2e:bc1d:0:b0:302:264e:29dd with SMTP id
 38308e7fff4ca-3072cb0d869mr106369041fa.24.1737688449583; Thu, 23 Jan 2025
 19:14:09 -0800 (PST)
MIME-Version: 1.0
References: <20250123100747.1841357-1-damon.ding@rock-chips.com>
 <20250123100747.1841357-8-damon.ding@rock-chips.com> <fw74xd2hgwc7iodhh5wb3ovd26tzlsomgypx4hqlqrxl4k2mdf@pycb5ugojyhr>
In-Reply-To: <fw74xd2hgwc7iodhh5wb3ovd26tzlsomgypx4hqlqrxl4k2mdf@pycb5ugojyhr>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 23 Jan 2025 19:13:57 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Ubi11ejFO8asRF57OYGb3fGEFo0mz_04-5yQ89PPw3_A@mail.gmail.com>
X-Gm-Features: AWEUYZmpYwl-43yyRfoSU5RN5Ja9L4Ubzk8XqMfyXD01azhGO7qYiYCgtmJtrGo
Message-ID: <CAD=FV=Ubi11ejFO8asRF57OYGb3fGEFo0mz_04-5yQ89PPw3_A@mail.gmail.com>
Subject: Re: [PATCH v6 07/14] drm/bridge: analogix_dp: Add support to get
 panel from the DP AUX bus
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Damon Ding <damon.ding@rock-chips.com>, heiko@sntech.de, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, rfoss@kernel.org, vkoul@kernel.org, 
	sebastian.reichel@collabora.com, cristian.ciocaltea@collabora.com, 
	l.stach@pengutronix.de, andy.yan@rock-chips.com, hjc@rock-chips.com, 
	algea.cao@rock-chips.com, kever.yang@rock-chips.com, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_191414_670052_84976B05 
X-CRM114-Status: GOOD (  37.08  )
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

Hi,

On Thu, Jan 23, 2025 at 3:25=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Thu, Jan 23, 2025 at 06:07:40PM +0800, Damon Ding wrote:
> > The main modification is moving the DP AUX initialization from function
> > analogix_dp_bind() to analogix_dp_probe(). In order to get the EDID of
> > eDP panel during probing, it is also needed to advance PM operaions to

nit: s/operaions/operations


> > ensure that eDP controller and phy are prepared for AUX transmission.
>
> This doesn't sound right. Per the documentation of
> drm_dp_aux::transfer(), the device should power itself up if transfer()
> is called when it is powered off. The caller must only ensure that the
> panel is on.
>
> Doug, what's your opinion?

I think maybe the CL description is a bit confusing, but looking at
the patch I think that the general idea is correct. drm_dp_aux_init()
is expected to be called in probe() and not in bind(). ...and in order
for it to work then pm_runtime needs to be enabled at probe and not at
bind. So both of those two things that this patch does are (in my
opinion) correct.


> > In addtion, add a new function analogix_dp_remove() to ensure symmetry
> > for PM operations.
> >
> > Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> >
> > ---
> >
> > Changes in v4:
> > - Use done_probing() to call drm_of_find_panel_or_bridge() and
> >   component_add() when getting panel from the DP AUX bus
> >
> > Changes in v5:
> > - Advance PM operations to make eDP AUX work well
> >
> > Changes in v6:
> > - Use devm_pm_runtime_enable() instead of devm_add_action_or_reset()
> > - Add a new function analogix_dp_remove() to ensure symmetry for PM
> >   operations
> > ---
> >  .../drm/bridge/analogix/analogix_dp_core.c    | 57 ++++++++++---------
> >  .../gpu/drm/rockchip/analogix_dp-rockchip.c   |  4 ++
> >  include/drm/bridge/analogix_dp.h              |  1 +
> >  3 files changed, 34 insertions(+), 28 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drive=
rs/gpu/drm/bridge/analogix/analogix_dp_core.c
> > index 8251adfce2f9..30da8a14361e 100644
> > --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> > +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> > @@ -1658,14 +1658,42 @@ analogix_dp_probe(struct device *dev, struct an=
alogix_dp_plat_data *plat_data)
> >       }
> >       disable_irq(dp->irq);

not related to your patch, but probably needs to be a prerequisite of
your patch: instead of calling disable_irq() here, you should OR in
"IRQF_NO_AUTOEN" to the "irq_flags" of devm_request_threaded_irq().
That not only closes a potential race condition but also makes all the
error handling much more robust.


> > +     dp->aux.name =3D "DP-AUX";
> > +     dp->aux.transfer =3D analogix_dpaux_transfer;
> > +     dp->aux.dev =3D dp->dev;
> > +     drm_dp_aux_init(&dp->aux);

FWIW: I would highly encourage you to (in a separate patch) add
wait_hpd_asserted() support here. It is deprecated to not implement
wait_hpd_asserted(). See the definition of "wait_hpd_asserted" in
"struct drm_dp_aux" if you're going to support eDP panels.


> > +     if (IS_ENABLED(CONFIG_PM)) {

Do we really truly need this? Is there anyone actually using this
driver without "CONFIG_PM", or can we just assume CONFIG_PM. For the
most part drivers I've interacted with just assume CONFIG_PM and
they're a lot simpler because of it. If there's truly a need then we
can keep this complexity, but I'd rather wait until there is a user.
Maybe you could add this as a dependency in the Kconfig if needed.


> > +             pm_runtime_use_autosuspend(dp->dev);
> > +             pm_runtime_set_autosuspend_delay(dp->dev, 100);
> > +             ret =3D devm_pm_runtime_enable(dp->dev);
> > +             if (ret)
> > +                     goto err_disable_pm_runtime;
> > +     } else {
> > +             ret =3D analogix_dp_resume(dp);
> > +             if (ret)
> > +                     goto err_disable_clk;

IMO: if analogix_dp_resume() succeeds, use devm_add_action_or_reset()
to have a function call analogix_dp_suspend(). Then you can keep using
"devm" for everything and totally get rid of the need for the
analogix_dp_remove() function.


> > +     }
> > +
> >       return dp;
> >
> > +err_disable_pm_runtime:
> > +     pm_runtime_dont_use_autosuspend(dp->dev);

You don't need to call pm_runtime_dont_use_autosuspend(). If you
enabled pm_runtime with devm_pm_runtime_enable() then it's documented
to handle calling pm_runtime_dont_use_autosuspend() for you. See the
kernel doc comment for devm_pm_runtime_enable(). So you can get rid of
this.


> >  err_disable_clk:
> >       clk_disable_unprepare(dp->clock);
> >       return ERR_PTR(ret);

Huh? Why would you call "err_disable_clk" here? The only thing that
enables the clock is analogix_dp_resume(), right? There's something
fishy here and it predates your patch. I suspect there were problems
in commit f37952339cc2 ("drm/bridge: analogix_dp: handle clock via
runtime PM"). You should fix that in a separate patch before yours.


> > +void analogix_dp_remove(struct analogix_dp_device *dp)
> > +{
> > +     if (IS_ENABLED(CONFIG_PM))
> > +             pm_runtime_dont_use_autosuspend(dp->dev);
> > +     else
> > +             analogix_dp_suspend(dp);
> > +}
> > +EXPORT_SYMBOL_GPL(analogix_dp_remove);

See above. Proper use of "devm" should mean you don't need a remove() funct=
ion.

