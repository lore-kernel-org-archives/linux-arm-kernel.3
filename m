Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF1A6C02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 15:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J3f/BtUt4rfes1Yuu9lxrllgo0vGvTSgAee2lMYuIXM=; b=0vsr3w06HhyJtEm8VqbVelon9K
	+gSiRU0UIf/vfNtStfPN8oypmQ4BHhDtwHrq0sO2irgKJ8GePLljaXOKT85+PdQkdf6Z1VbxWSf5w
	cIfy1gFM66zcjJ1glVDT33r38svjwuxjSxPkYBYr3YEnc9condTKa/chFA5ONi5cN9hYWOk+v2o4C
	7b7Nxb0lmnEHZ93hxg2Bcn6ASbEivz+TCl1OVWzvMqVb3UEZVNrb4N8KfpE999fV198HB7E/M/mso
	4XKUazzWT0DrFt80YyNtS4p3JpomZ9NlSAeCry6oQw4YyoTSSwZbiW4qjEFJyUee20JlhgGDK3dL1
	YBTsoBbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY5ZN-0000000CJWZ-1Ivx;
	Wed, 15 Jan 2025 15:44:37 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY5Y5-0000000CJOY-3K1X
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 15:43:19 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-aa68b513abcso1226058566b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 07:43:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736955795; x=1737560595; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J3f/BtUt4rfes1Yuu9lxrllgo0vGvTSgAee2lMYuIXM=;
        b=o83W0bAtbBrg1uoMP/Lbr3tVzkjor24jEC6kSfXWg83yGC794eB4stJyXj2tWfJeTj
         XACNbu0j/95VUgRni2zTx82Ceu8bLAgQhsBB9Q4ks7FLgWVGFywxXQbXlrwo12RAT70Z
         F87+x5km6VsOKzyZXTFih4qYmFxRmCnWs2tPkTMNGiRJMCVuQ7RNjnI4qlr0TCWEUCrn
         MAU4eFYc0pQLJNRIYOK/FHCVE6D8rjXNwCpryFt76m34fPJUkkGb3mP8L50kxU4H+YaD
         mV7skalKZATC8pk7pn4W5gIykrVvwkThzS0+VlLReeb9mkLz7+nwzA7FVz5oN4e5MbUF
         Jvjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736955795; x=1737560595;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J3f/BtUt4rfes1Yuu9lxrllgo0vGvTSgAee2lMYuIXM=;
        b=Dbe4OKG3hexZH2GFjJ3qWG1FUpeOjORoo0v2wUDpvp3d4ckxonJ4ckr6t8fexz3aU6
         HNqNzpPyMvXvTHdYjvwsua2yqjmT8sGvReVwXOlDqEjP94EujLPjrV8kqsFxqwxc/k/S
         7Cdl8294JNVy6b+HBIJXgf7AKRVZBaYFh2LeR9+vz9FLp9vV3nOZLwoUKqSvDtcY/lUk
         YJ+1ALpEvDON1srvFmlER80zNURcZyJ1vczl8OJGoS0WJ6trIXsJ/gDG7VI3alhhiweG
         2mUSEg2YTCkC6jOIx0woDlVWI2L0EwPlsLUcDHl5wj238Mar6TJ+UV1YhMdXckntY8pG
         DMmg==
X-Forwarded-Encrypted: i=1; AJvYcCVTlu5OZGgjwm3V17jwbIzBHwazes3kFlLk9y2V1bi8L8TQKd2enyGHxnagY1K3+0QXV9+tT7keXh3OOp+YeQYh@lists.infradead.org
X-Gm-Message-State: AOJu0YxK4NiYHduQsyFQryVp4X5AYbGbiNd1Pv8kwlizK6rc4PCnCyKJ
	a3bh3FZ3mQ5gBZe2AZ4ZRm6J1XhNdChVoSNA9e2uiojEAyo7ev1x9ZZJhrWZMYwivGlzXQXymq3
	0cbT2421nt4QPwMsX3CzMat+RgpnvAq45atq35w==
X-Gm-Gg: ASbGnctg8VCuAaNeZoA0qSJhmnvIHtjO6NclQfgJ6uJcQxdi4+N6yZeRzd18s+U72+1
	XcHwtiZvtmXUuQV+oXunHmHODJ6xhhwkcoO1UbwY=
X-Google-Smtp-Source: AGHT+IHDoi+mGYLGebHeWkmmNu9kuOD8jns2z/VYjko7Tnbt+R1MkhbZJ+/4XcPAdBtCZQ/TdWXJyEXsB5J2CJpGKLI=
X-Received: by 2002:a17:907:2cc5:b0:aaf:c326:f2d8 with SMTP id
 a640c23a62f3a-ab2abdc0257mr3047455066b.57.1736955795506; Wed, 15 Jan 2025
 07:43:15 -0800 (PST)
MIME-Version: 1.0
References: <20250103163805.1775705-1-claudiu.beznea.uj@bp.renesas.com>
 <20250103163805.1775705-3-claudiu.beznea.uj@bp.renesas.com> <46c8e8ff-ea39-4dbd-a26c-67fcabf4b589@linaro.org>
In-Reply-To: <46c8e8ff-ea39-4dbd-a26c-67fcabf4b589@linaro.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 15 Jan 2025 16:42:37 +0100
X-Gm-Features: AbW1kvbeNqMmLKjkvJqDQCdSbnPp1um89aAtf_bRTZINBqlSnyOdq4a4Fmix_nI
Message-ID: <CAPDyKFq40KB6jKapnm0mOkFGB9-7VEGiBhNrVn_2fzrcziq0=Q@mail.gmail.com>
Subject: Re: [PATCH 2/6] thermal: of: Export non-devres helper to
 register/unregister thermal zone
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Claudiu <claudiu.beznea@tuxon.dev>, rafael@kernel.org, rui.zhang@intel.com, 
	lukasz.luba@arm.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	geert+renesas@glider.be, magnus.damm@gmail.com, mturquette@baylibre.com, 
	sboyd@kernel.org, p.zabel@pengutronix.de, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_074317_840090_F8412782 
X-CRM114-Status: GOOD (  33.73  )
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

On Thu, 9 Jan 2025 at 18:34, Daniel Lezcano <daniel.lezcano@linaro.org> wro=
te:
>
>
> Ulf,
>
> can you have a look at this particular patch please ?
>
> Perhaps this scenario already happened in the past and there is an
> alternative to fix it instead of this proposed change

I think the patch makes sense.

If there is a PM domain that is attached to the device that is
managing the clocks for the thermal zone, the detach procedure
certainly needs to be well controlled/synchronized.

>
>
> On 03/01/2025 17:38, Claudiu wrote:
> > From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> >
> > On the Renesas RZ/G3S (and other Renesas SoCs, e.g., RZ/G2{L, LC, UL}),
> > clocks are managed through PM domains. These PM domains, registered on
> > behalf of the clock controller driver, are configured with
> > GENPD_FLAG_PM_CLK. In most of the Renesas drivers used by RZ SoCs, the
> > clocks are enabled/disabled using runtime PM APIs.
> >
> > During probe, devices are attached to the PM domain controlling their
> > clocks. Similarly, during removal, devices are detached from the PM dom=
ain.
> >
> > The detachment call stack is as follows:
> >
> > device_driver_detach() ->
> >    device_release_driver_internal() ->
> >      __device_release_driver() ->
> >        device_remove() ->
> >          platform_remove() ->
> >         dev_pm_domain_detach()
> >
> > In the upcoming Renesas RZ/G3S thermal driver, the
> > struct thermal_zone_device_ops::change_mode API is implemented to
> > start/stop the thermal sensor unit. Register settings are updated withi=
n
> > the change_mode API.
> >
> > In case devres helpers are used for thermal zone register/unregister th=
e
> > struct thermal_zone_device_ops::change_mode API is invoked when the
> > driver is unbound. The identified call stack is as follows:
> >
> > device_driver_detach() ->
> >    device_release_driver_internal() ->
> >      device_unbind_cleanup() ->
> >        devres_release_all() ->
> >          devm_thermal_of_zone_release() ->
> >         thermal_zone_device_disable() ->
> >           thermal_zone_device_set_mode() ->
> >             rzg3s_thermal_change_mode()
> >
> > The device_unbind_cleanup() function is called after the thermal device=
 is
> > detached from the PM domain (via dev_pm_domain_detach()).
> >
> > The rzg3s_thermal_change_mode() implementation calls
> > pm_runtime_resume_and_get()/pm_runtime_put_autosuspend() before/after
> > accessing the registers. However, during the unbind scenario, the
> > devm_thermal_of_zone_release() is invoked after dev_pm_domain_detach().
> > Consequently, the clocks are not enabled, as the device is removed from
> > the PM domain at this time, leading to an Asynchronous SError Interrupt=
.
> > The system cannot be used after this.
> >
> > Add thermal_of_zone_register()/thermal_of_zone_unregister(). These will
> > be used in the upcomming RZ/G3S thermal driver.
> >
> > Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe

> > ---
> >   drivers/thermal/thermal_of.c |  8 +++++---
> >   include/linux/thermal.h      | 14 ++++++++++++++
> >   2 files changed, 19 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/thermal/thermal_of.c b/drivers/thermal/thermal_of.=
c
> > index fab11b98ca49..8fc35d20db60 100644
> > --- a/drivers/thermal/thermal_of.c
> > +++ b/drivers/thermal/thermal_of.c
> > @@ -329,11 +329,12 @@ static bool thermal_of_should_bind(struct thermal=
_zone_device *tz,
> >    *
> >    * @tz: a pointer to the thermal zone structure
> >    */
> > -static void thermal_of_zone_unregister(struct thermal_zone_device *tz)
> > +void thermal_of_zone_unregister(struct thermal_zone_device *tz)
> >   {
> >       thermal_zone_device_disable(tz);
> >       thermal_zone_device_unregister(tz);
> >   }
> > +EXPORT_SYMBOL_GPL(thermal_of_zone_unregister);
> >
> >   /**
> >    * thermal_of_zone_register - Register a thermal zone with device nod=
e
> > @@ -355,8 +356,8 @@ static void thermal_of_zone_unregister(struct therm=
al_zone_device *tz)
> >    *  - ENOMEM: if one structure can not be allocated
> >    *  - Other negative errors are returned by the underlying called fun=
ctions
> >    */
> > -static struct thermal_zone_device *thermal_of_zone_register(struct dev=
ice_node *sensor, int id, void *data,
> > -                                                         const struct =
thermal_zone_device_ops *ops)
> > +struct thermal_zone_device *thermal_of_zone_register(struct device_nod=
e *sensor, int id, void *data,
> > +                                                  const struct thermal=
_zone_device_ops *ops)
> >   {
> >       struct thermal_zone_device_ops of_ops =3D *ops;
> >       struct thermal_zone_device *tz;
> > @@ -429,6 +430,7 @@ static struct thermal_zone_device *thermal_of_zone_=
register(struct device_node *
> >
> >       return ERR_PTR(ret);
> >   }
> > +EXPORT_SYMBOL_GPL(thermal_of_zone_register);
> >
> >   static void devm_thermal_of_zone_release(struct device *dev, void *re=
s)
> >   {
> > diff --git a/include/linux/thermal.h b/include/linux/thermal.h
> > index 69f9bedd0ee8..adbb4092a064 100644
> > --- a/include/linux/thermal.h
> > +++ b/include/linux/thermal.h
> > @@ -195,13 +195,23 @@ struct thermal_zone_params {
> >
> >   /* Function declarations */
> >   #ifdef CONFIG_THERMAL_OF
> > +struct thermal_zone_device *thermal_of_zone_register(struct device_nod=
e *sensor, int id, void *data,
> > +                                                  const struct thermal=
_zone_device_ops *ops);
> >   struct thermal_zone_device *devm_thermal_of_zone_register(struct devi=
ce *dev, int id, void *data,
> >                                                         const struct th=
ermal_zone_device_ops *ops);
> >
> > +void thermal_of_zone_unregister(struct thermal_zone_device *tz);
> >   void devm_thermal_of_zone_unregister(struct device *dev, struct therm=
al_zone_device *tz);
> >
> >   #else
> >
> > +static inline
> > +struct thermal_zone_device *thermal_of_zone_register(struct device_nod=
e *sensor, int id, void *data,
> > +                                                  const struct thermal=
_zone_device_ops *ops)
> > +{
> > +     return ERR_PTR(-ENOTSUPP);
> > +}
> > +
> >   static inline
> >   struct thermal_zone_device *devm_thermal_of_zone_register(struct devi=
ce *dev, int id, void *data,
> >                                                         const struct th=
ermal_zone_device_ops *ops)
> > @@ -209,6 +219,10 @@ struct thermal_zone_device *devm_thermal_of_zone_r=
egister(struct device *dev, in
> >       return ERR_PTR(-ENOTSUPP);
> >   }
> >
> > +static inline void thermal_of_zone_unregister(struct thermal_zone_devi=
ce *tz)
> > +{
> > +}
> > +
> >   static inline void devm_thermal_of_zone_unregister(struct device *dev=
,
> >                                                  struct thermal_zone_de=
vice *tz)
> >   {
>
>
> --
> <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for AR=
M SoCs
>
> Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
> <http://twitter.com/#!/linaroorg> Twitter |
> <http://www.linaro.org/linaro-blog/> Blog

