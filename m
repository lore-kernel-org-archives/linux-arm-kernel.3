Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27DC0C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 10:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MV4nJ5ccv3/M7r9xysN8i7uyE9/mcP/N7Hy04O9n47g=; b=hkp/LwP2HhRMo2De6X7rAJKF/X
	9xbCR2Fk5UMwLY3/+TFNPqCCk/h+KLprXg3dULo34+OEj96y86AI3tS6in206rlnMzcxAjCFULS2t
	XUe9KJP8O7bAPaRb5RCHKd/jAWZVKJ5ZDBfD5paArCEEYi3ivWmefsoJAb9frDiuiFypaJl4dZeZK
	xtv7wqAzT1fpbFec0Pck5bLzxZlKiJnqpoYRUhl9aslYiwwJPL7UnAZyX2HNlP1/2kdEFPNQwygWO
	lEwLm3MWz62nTxXIW/Vms+UA4X/hW45qTtwVea9R1OfURQA8YvZCPj9o2BCseZ6gwAfhSI0wEGJlp
	Jm+8TDLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMPBT-0000000AhVR-1XOB;
	Tue, 03 Jun 2025 10:47:55 +0000
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMOt6-0000000Afvi-3tHR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 10:28:58 +0000
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-e740a09eb00so4477531276.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Jun 2025 03:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748946535; x=1749551335; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MV4nJ5ccv3/M7r9xysN8i7uyE9/mcP/N7Hy04O9n47g=;
        b=kADhcyRk2yWy2+D9Ey+7k4buWMSejrK7PfBaB8rQMHOF6LzaN4evHm5HMOQD6aHvYE
         VjmhT+qdqgcLyrX54W57ZUAyl+eui4JGiwfqKlHqDHoYL1CxEw+MZAMqFRFXAwylvRcc
         02ZgQqVQUlAGnJouAW9BM7JxLpZCd3D+r1yybGlmwRMptpYbsv2Ev5ub2hgs+7g9Mipe
         IIgRPkCeIwlpy7tFCpBEPTiH3Jf2SK6lafrBQBagWKPTk+AGYq5UmCdb4elT2JX8JZYr
         Nk+01MDVJdpKt1hAZKK6wkfp9G9fS2gA/MYY6TTiivqVsMvoVF4Xb2NsYs0BSgFl8C2u
         +Sig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748946535; x=1749551335;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MV4nJ5ccv3/M7r9xysN8i7uyE9/mcP/N7Hy04O9n47g=;
        b=Yk9UGsPhShVfxarrqWlVd+4ptY6yHnsGnSHQ2US9xi7Z3hXvXa2JpGk4x9kcI3kD8x
         kj3oX6stz1HLVM3MsYw97ogZ9EZjpiAKZJ/mCaFoiJ72HkMI0fGqNo0jBsL0nXr7HU+n
         5FTlsY9qdDoVm0plvVKbw9c9P5GNoYFZ1AAdbPeO6vRkbrEXmB3w+JrsEpQAVNfLyzT1
         lWP2peLk/34X0v+U33p8UarXoNgF+imrHc7d3Nog02KLSmQjTcurgMEZki+wxyPwJoMz
         MX73OueKpgfzHRb679s0OOsC9QJ0ZeWVN5wHX4f/Gc5Tg5kK+cyi3uXJR/Zn07pOidIf
         8yag==
X-Forwarded-Encrypted: i=1; AJvYcCV3ibGFnORXEmg/niWzVgw/iEKLGHgejO2ymabUy0eFTZ8LS8TbD4gnoPBVDD3eRnbSWkmpCNIwxwUeTBJnmp5M@lists.infradead.org
X-Gm-Message-State: AOJu0YxD9k92WnglC/cX4gx6cVePxfbRiL1Hq1UUx62jJJBn5fQiAo3H
	h++tkr5re5pOVnEtnou4E97XthqI2PpbNmONU874GJmJUStCeqhbFmpzKwXvee4y44ugTc/NuBj
	OvROyiofH1V+qb1tJNtie+ONwk6F8BgINOPYIkt6GeA==
X-Gm-Gg: ASbGncvcvV8LhYuHvf00tC7xV0EBJWA6Gzx+ok0NG3NXniMJmxWYbOLqXoAGDfr8wRh
	+rHNnX/Dyu+e9sMeEtoQv6MG0Wj1p0rbQE6Nq4z+seZKdEFIl2pL5laMr5TqFiLCvxCMb4/A/Jf
	6Vzc/WybifnFQsnVEZarQ4g17xXqIhebRX
X-Google-Smtp-Source: AGHT+IH4+xeTkbUpI+FfhiXOCleYefqPHgZgtwzGFOjpb6L8oa9N/SBOOg/sSGsfoxJzPOXu5RhVUjIwT65OkFKLppA=
X-Received: by 2002:a05:6902:2191:b0:e7d:d181:3261 with SMTP id
 3f1490d57ef6-e81289e7aefmr15612598276.12.1748946535281; Tue, 03 Jun 2025
 03:28:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250523134025.75130-1-ulf.hansson@linaro.org>
 <20250523134025.75130-3-ulf.hansson@linaro.org> <CAGETcx-hsKb_BDPLuSM3A_ac0x6Z4NOq2pCmjKKJHTYbYZPwcA@mail.gmail.com>
In-Reply-To: <CAGETcx-hsKb_BDPLuSM3A_ac0x6Z4NOq2pCmjKKJHTYbYZPwcA@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 3 Jun 2025 12:28:19 +0200
X-Gm-Features: AX0GCFuqqwX6GW-cR_X_S04Eq-qwU4Rrpef6Z_VwxA6qf8jMfcuSHvvLut1eSeo
Message-ID: <CAPDyKFokW-wDUL6tTQ9WoVS4OJqtfMvxWiiZp6Hhf2hQpP1rWQ@mail.gmail.com>
Subject: Re: [PATCH v2 02/21] pmdomain: core: Add a bus and a driver for genpd providers
To: Saravana Kannan <saravanak@google.com>
Cc: Stephen Boyd <sboyd@kernel.org>, linux-pm@vger.kernel.org, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Michael Grzeschik <m.grzeschik@pengutronix.de>, Bjorn Andersson <andersson@kernel.org>, 
	Abel Vesa <abel.vesa@linaro.org>, Peng Fan <peng.fan@oss.nxp.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Johan Hovold <johan@kernel.org>, 
	Maulik Shah <maulik.shah@oss.qualcomm.com>, Michal Simek <michal.simek@amd.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_032856_992518_B41E9BE3 
X-CRM114-Status: GOOD (  32.71  )
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

On Tue, 3 Jun 2025 at 02:23, Saravana Kannan <saravanak@google.com> wrote:
>
> On Fri, May 23, 2025 at 6:40=E2=80=AFAM Ulf Hansson <ulf.hansson@linaro.o=
rg> wrote:
> >
> > When we create a genpd via pm_genpd_init() we are initializing a
> > corresponding struct device for it, but we don't add the device to any
> > bus_type. It has not really been needed as the device is used as cookie=
 to
> > help us manage OPP tables.
> >
> > However, to prepare to make better use of the device let's add a new ge=
npd
> > provider bus_type and a corresponding genpd provider driver. Subsequent
> > changes will make use of this.
> >
> > Suggested-by: Saravana Kannan <saravanak@google.com>
> > Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
> > Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
> > ---
> >  drivers/pmdomain/core.c | 89 ++++++++++++++++++++++++++++++++++++++++-
> >  1 file changed, 88 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> > index 9a66b728fbbf..da515350c65b 100644
> > --- a/drivers/pmdomain/core.c
> > +++ b/drivers/pmdomain/core.c
> > @@ -27,6 +27,11 @@
> >  /* Provides a unique ID for each genpd device */
> >  static DEFINE_IDA(genpd_ida);
> >
> > +/* The parent for genpd_provider devices. */
> > +static struct device genpd_provider_bus =3D {
> > +       .init_name =3D "genpd_provider",
> > +};
> > +
> >  #define GENPD_RETRY_MAX_MS     250             /* Approximate */
> >
> >  #define GENPD_DEV_CALLBACK(genpd, type, callback, dev)         \
> > @@ -44,6 +49,14 @@ static DEFINE_IDA(genpd_ida);
> >  static LIST_HEAD(gpd_list);
> >  static DEFINE_MUTEX(gpd_list_lock);
> >
> > +#define to_genpd_provider_drv(d) container_of(d, struct genpd_provider=
_drv, drv)
> > +
> > +struct genpd_provider_drv {
> > +       struct device_driver drv;
> > +       int (*probe)(struct device *dev);
> > +       void (*remove)(struct device *dev);
> > +};
> > +
> >  struct genpd_lock_ops {
> >         void (*lock)(struct generic_pm_domain *genpd);
> >         void (*lock_nested)(struct generic_pm_domain *genpd, int depth)=
;
> > @@ -2225,6 +2238,26 @@ static int genpd_set_default_power_state(struct =
generic_pm_domain *genpd)
> >         return 0;
> >  }
> >
> > +static int genpd_provider_bus_probe(struct device *dev)
> > +{
> > +       struct genpd_provider_drv *drv =3D to_genpd_provider_drv(dev->d=
river);
> > +
> > +       return drv->probe(dev);
> > +}
> > +
> > +static void genpd_provider_bus_remove(struct device *dev)
> > +{
> > +       struct genpd_provider_drv *drv =3D to_genpd_provider_drv(dev->d=
river);
> > +
> > +       drv->remove(dev);
> > +}
>
> Not sure if I'm missing some corner case you found out, but you don't
> need these stubs just to call the drv ops. Driver core does it anyway
> if the bus probe/remove functions are missing.

Right, they are probably just leftovers used for debug-prints during
development.

Thanks for spotting this!

>
> > +
> > +static const struct bus_type genpd_provider_bus_type =3D {
> > +       .name           =3D "genpd_provider",
> > +       .probe          =3D genpd_provider_bus_probe,
> > +       .remove         =3D genpd_provider_bus_remove,
> > +};
> > +
> >  static void genpd_provider_release(struct device *dev)
> >  {
> >         /* nothing to be done here */
> > @@ -2262,6 +2295,8 @@ static int genpd_alloc_data(struct generic_pm_dom=
ain *genpd)
> >         genpd->gd =3D gd;
> >         device_initialize(&genpd->dev);
> >         genpd->dev.release =3D genpd_provider_release;
> > +       genpd->dev.bus =3D &genpd_provider_bus_type;
> > +       genpd->dev.parent =3D &genpd_provider_bus;
> >
> >         if (!genpd_is_dev_name_fw(genpd)) {
> >                 dev_set_name(&genpd->dev, "%s", genpd->name);
> > @@ -3355,9 +3390,61 @@ int of_genpd_parse_idle_states(struct device_nod=
e *dn,
> >  }
> >  EXPORT_SYMBOL_GPL(of_genpd_parse_idle_states);
> >
> > +static int genpd_provider_probe(struct device *dev)
> > +{
> > +       return 0;
> > +}
> > +
> > +static void genpd_provider_remove(struct device *dev)
> > +{
> > +}
>
> Same might apply here.

Let me check and see if/what can be dropped.

I think you told me that I needed the ->probe() function to keep
fw_devlink happy, but maybe I got that wrong.

[...]

Kind regards
Uffe

