Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D19F0C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 08:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=98OKaYF4tpZApGWukE9uaoalFuC45/rEeEJt/zz+1to=; b=MHq5uABu4mDq5H6Cy6NGSRjFdX
	9HbdWc3SMuDHqrmZYgF/UTN2KaxZxSjRTgaB6+hgBnlyU3oZX3TYb0Fqt9ApO6diJ96HX3gNWy8a0
	OcQVBROwURpKRe+9rEa/op8TTGGfOlCMoBKyStFz6hUBRxFW1hTE0X+iU8s/CIB6JTeujhyBhSwZA
	QJ800U8EwZCaZlCg6nYWmirre2/UQu3e/gWlfxNZUCovS7+QG5CXvUAPS+DcO79p3leRCYeyP0JMD
	YNC9PbJVnhUgH2chxX095jLS7jOuo1yufsHZqZ3Wgjb556MZTliJupcA/VQ4+xHeodIb+R+uIE/od
	giOrb1cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7VsW-00000009pw5-0cdC;
	Wed, 23 Apr 2025 08:54:48 +0000
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7V0H-00000009bZ6-1nmV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 07:58:47 +0000
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-7080dd5f9f1so13153657b3.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 00:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745395124; x=1745999924; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=98OKaYF4tpZApGWukE9uaoalFuC45/rEeEJt/zz+1to=;
        b=bVoeNBH2M7/LbODkL5HQbJMjlfUcQHf4TKilxYA4Y1FkeCchsKAYsmr5J2JjuJSwCD
         Yz19jDe6T1HqGleE95Llh8uUH17uwAwDZyqQJsh7jz3ySH99WdD9If1srkHA4S1K8bVw
         9iGpA/mSsFuxDJ/tJand8pIjICZkHIqZu2XkYXnWX8WtfYF1vCGajk2DdfWusVS1wgTG
         UaCWMJ2hcbsBMX+DrXAabKfkryNeGsFnLDtBrk+Gw41ivBGH5b4Ds/PyeFKX1UWjb8nK
         GLcGGES/rRZtP983ZjOEb+muHFHel5SED3U2EDcX5HLFKr7c0E7dP4OlBm+nKlNZvpxH
         iAEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745395124; x=1745999924;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=98OKaYF4tpZApGWukE9uaoalFuC45/rEeEJt/zz+1to=;
        b=ly0vcFhndVLq2ey1Oj5yTkpwP9P3RLnYV/q7DR/SWvChTNWR+bxKpdLys9JORsr651
         c7Ooi52NZMPGv+GrjZ52jjokMRJMbvCukbOhYKw2EYpnk924BuKnjMfMEEvwlTWygus5
         4E/jeYTdTg+5xrbsO2yMrYL96isBAP4A9vtBVf/X6hQh6APywfRmL2AHFWOVQw/txvwj
         uVDYrS15+pqqNexpROPCb/hsHKVOGn3I0MwoMl+/95SUBIFDChJ7Us+WghPtybFJ0uou
         4r0KhJQD+mfsNrWFPdt+M7XSHoL0KujNRc4GrUmaMv7QDjmSGPYpEkYOe9EhCgz7HDyH
         Vp8g==
X-Forwarded-Encrypted: i=1; AJvYcCU792RYrMu5fJgzle3GJ+MlDAGIIwOvnDnvUP2w25Dcyn3y8uAnYppMAIMIIUbRbELPix777vmMu8XWSLWwzWqP@lists.infradead.org
X-Gm-Message-State: AOJu0YyYfIsEkbjGi7vD8FIGguwzCkdf5TOJdG9Fat5s00CKnQs/rADk
	1KLz694QCR2aCWDhjQ8Tv8qnpwAVnqHnmfemblub3GvQqjq2fysJHhmLyBU1IKSriJhpopdTqEg
	8G2w4canU1E77EK4eGMoMUL2I2GwNmE9t62iCEA==
X-Gm-Gg: ASbGncus4of+uqAnaaJFUM38ydm7ofIaNEU4/b1CcUtC+bm+Cf108AqC1L+VI2E+DVc
	NFbzagV2xD8Mqvp70rnYqE9EhqIsSO7kFnR1ou25e4gXnoGC4UMJwVEXaVwYUBc3TSJL8P2hYGh
	C0vFa9z3QXi/Pi0KsqTChbjg==
X-Google-Smtp-Source: AGHT+IEid6abI3qyjvwJVFhFo6K8MH5FI0X29/TyKFu7qItzM19P/8jYPPedtCkMFzrRPgTlj3DcfgKz+l+YCjA6mJo=
X-Received: by 2002:a05:690c:d07:b0:6f7:5605:c62b with SMTP id
 00721157ae682-706ccdc6cf9mr271103927b3.27.1745395123911; Wed, 23 Apr 2025
 00:58:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250417142513.312939-1-ulf.hansson@linaro.org>
 <20250417142513.312939-9-ulf.hansson@linaro.org> <CAGETcx9rvTWPbDCnTLb+ToVk8BMipTa1Y14vpn=bPBkM=CjoZg@mail.gmail.com>
In-Reply-To: <CAGETcx9rvTWPbDCnTLb+ToVk8BMipTa1Y14vpn=bPBkM=CjoZg@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 23 Apr 2025 09:58:08 +0200
X-Gm-Features: ATxdqUF5401xpyLBZD02333wpwgBQly_TMiuPAqVbNXp07uH7DpC68Wtyaxt4dM
Message-ID: <CAPDyKFoxggSnRZxQ7QBbF2-akoj8TTMGawxeH_0ZnPQ7CBCnUA@mail.gmail.com>
Subject: Re: [PATCH 08/11] pmdomain: core: Add internal ->sync_state() support
 for genpd providers
To: Saravana Kannan <saravanak@google.com>
Cc: Stephen Boyd <sboyd@kernel.org>, linux-pm@vger.kernel.org, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Michael Grzeschik <m.grzeschik@pengutronix.de>, Bjorn Andersson <andersson@kernel.org>, 
	Abel Vesa <abel.vesa@linaro.org>, Devarsh Thakkar <devarsht@lewv0571a.ent.ti.com>, 
	Peng Fan <peng.fan@oss.nxp.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Johan Hovold <johan@kernel.org>, Maulik Shah <maulik.shah@oss.qualcomm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_005845_468977_D46E3508 
X-CRM114-Status: GOOD (  26.65  )
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

On Fri, 18 Apr 2025 at 02:24, Saravana Kannan <saravanak@google.com> wrote:
>
> On Thu, Apr 17, 2025 at 7:25=E2=80=AFAM Ulf Hansson <ulf.hansson@linaro.o=
rg> wrote:
> >
> > If the genpd provider's fwnode doesn't have an associated struct device
> > with it, we can make use of the generic genpd->dev and it corresponding
> > driver internally in genpd to manage ->sync_state().
> >
> > More precisely, while adding a genpd OF provider let's check if the fwn=
ode
> > has a device and if not, make the preparation to handle ->sync_state()
> > internally through the genpd_provider_driver and the genpd_provider_bus=
.
> >
> > Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
> > ---
> >  drivers/pmdomain/core.c   | 36 ++++++++++++++++++++++++++++++++++++
> >  include/linux/pm_domain.h |  7 +++++++
> >  2 files changed, 43 insertions(+)
> >
> > diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> > index 512f89e6d302..9c5a77bf59d2 100644
> > --- a/drivers/pmdomain/core.c
> > +++ b/drivers/pmdomain/core.c
> > @@ -2374,6 +2374,7 @@ int pm_genpd_init(struct generic_pm_domain *genpd=
,
> >         INIT_WORK(&genpd->power_off_work, genpd_power_off_work_fn);
> >         atomic_set(&genpd->sd_count, 0);
> >         genpd->status =3D is_off ? GENPD_STATE_OFF : GENPD_STATE_ON;
> > +       genpd->sync_state =3D GENPD_SYNC_STATE_OFF;
> >         genpd->device_count =3D 0;
> >         genpd->provider =3D NULL;
> >         genpd->device_id =3D -ENXIO;
> > @@ -2656,6 +2657,7 @@ int of_genpd_add_provider_simple(struct device_no=
de *np,
> >                                  struct generic_pm_domain *genpd)
> >  {
> >         struct fwnode_handle *fwnode;
> > +       struct device *dev;
> >         int ret;
> >
> >         if (!np || !genpd)
> > @@ -2665,6 +2667,10 @@ int of_genpd_add_provider_simple(struct device_n=
ode *np,
> >                 return -EINVAL;
> >
> >         fwnode =3D &np->fwnode;
> > +       dev =3D fwnode->dev;
> > +
> > +       if (!dev)
> > +               genpd->sync_state =3D GENPD_SYNC_STATE_SIMPLE;
>
> I don't want people directly poking into fwnode.

There are already other subsystems doing it like this. Like
drivers/gpio/gpiolib.c for example. I didn't think it was a big deal,
my bad!

>
> Use get_device_from_fwnode() that's in drivers/base/core.c? Might need
> to move it to a header. Make sure to put_device() it back.

Sure, I can certainly do that!

>
> Or ideally, figure it out using some other means like looking for
> #power-domain-cells number? (if that'll always give the right answer).
> Point being, the framework should know which type it's registering
> even if there was no fwnode/fw_devlink.

When adding the genpd-of-provider we are only passing a device node.
Looking for "#power-domain-cells" can't tell us whether the node will
have a device or not.

>
> >
> >         device_set_node(&genpd->dev, fwnode);
> >
> > @@ -2718,8 +2724,10 @@ int of_genpd_add_provider_onecell(struct device_=
node *np,
> >  {
> >         struct generic_pm_domain *genpd;
> >         struct fwnode_handle *fwnode;
> > +       struct device *dev;
> >         unsigned int i;
> >         int ret =3D -EINVAL;
> > +       bool sync_state =3D false;
> >
> >         if (!np || !data)
> >                 return -EINVAL;
> > @@ -2728,6 +2736,10 @@ int of_genpd_add_provider_onecell(struct device_=
node *np,
> >                 data->xlate =3D genpd_xlate_onecell;
> >
> >         fwnode =3D &np->fwnode;
> > +       dev =3D fwnode->dev;
>
> Can you do this some other way please? I really don't like this look up.

Okay, I will use get_device_from_fwnode().

Thanks again for reviewing!

[...]

Kind regards
Uffe

