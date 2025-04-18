Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 379DAC369C9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 08:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AxdkJLhGcvUSmWPi/UwEe1UXm3/QVMd4knaXbpwDxqg=; b=goG27iFdNkRTvOzno1dh5k/5C5
	bdPsZYm+fXpN0H4Wxtq6qkEYFV6l8h30EMOr8fiw47aO+9hx6ZrsQyYiHCtLCSusSKVMYot9OoJ63
	WzWFqXHcQ1ZwCUW5Xb2oTrolVyxfl0elZ1bALME9cKEAT5qfjttBE7lUQCq0l7rdv6SnTOu50ddVj
	vqVStrxUowizkA+8oSt4Ra9cXtBhuCxlL8zw9zQ+RWdN2oju9iVpmIoyxYM6IJyMaOJi4yBHw+I84
	leQHHndMRSzxdXRFSIKGU52IUXpq1m1jvddXA1+xXGZrbEzx5vNO0P0ra2GeQGEKaUG+Xx/RAqcGV
	Ut0ZyzyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5hHZ-0000000FeJQ-2vHP;
	Fri, 18 Apr 2025 08:41:09 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5gqm-0000000FaZn-3jn8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 08:13:30 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-5e677f59438so2343591a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Apr 2025 01:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744964007; x=1745568807; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AxdkJLhGcvUSmWPi/UwEe1UXm3/QVMd4knaXbpwDxqg=;
        b=VRVeiHn7EuFjFc8r/BQ1QhyNb/dJTwgIGd/9XPCJDnZFmqOqPbqC2zUiqLs1mCA8OR
         JcVghYantHo4+/MvNBuRiTUYjeOvOM3cnqjnZ6uTHO8SjcLj7HfLjUfjrj/S4fEc1t6V
         uJl7IuQjqu6jYvjCD6OBVGpMV7SjkX8wb9m5tWed/PjdOeJmpJuskcehjufno+8Ibk5V
         CbnpO74MC3truHuSfjID3jC8lgjI8DRdxT1BlfGSbNzqGHCTkxCjuIPQm0AdKlUSuD+y
         ZZKm3/i3D7iDfkLr+g/vtPux5P7MiOcEh+bp/Qc0+usCCFMynW10GuwSTaNunc+s2jrL
         7cjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744964007; x=1745568807;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AxdkJLhGcvUSmWPi/UwEe1UXm3/QVMd4knaXbpwDxqg=;
        b=EJxSwI3MEbJO+wHRkqBzHVLg7/0Pj6rRcdn2cHfJdQYqC+JH6+eD+xgGUIdoTzDDaZ
         wzGSId/BH2S+yTyyv23mQ877/R0t6JNmMZyoKaS6/3AFI7ZTQXG9KsnZs7k++4LdGioq
         N8X6+qXROLi7BNYydkcq5ZoKWiFTjIChKVEH0o9m1+vaXjE3Ts0+p++XjHeDOmq36cuX
         IZmQ7tvcmAmQYUZpkswxnVAJeflrK1q4wc+6FZPgGu+13mM9IDXP2VeTgewM1E/+8sgr
         Z/pfno5WuKAt201Xg2yPnkUchoyN9flA4oGyNHj+/6B+guUpvGwtM0+mDJdd8r7U9Knr
         rKXg==
X-Forwarded-Encrypted: i=1; AJvYcCU2mdzQU+BeRHvN4sMl+2PUd3zhk+Tte0+0tWcasWArkn64x/9XmvulUksT0Bv149SpaU9UTIF2FegTzog+aKQe@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/83AH59/pc0VPNj4GrpYYtYUcJNiOQwiHr+aQeDWUV0J4pvzB
	r35OjqkBBzA3bxn+ENzGqBeoiG75NI7fdaGP7ba1sLad3Y8XgOWyzunoG8Gjk+NxGLLcvJXmNiu
	tJlVV8cLT924sAbygdSKtlpwWFHkBwvmd3R/jpBXy/ZJKJHaYuA==
X-Gm-Gg: ASbGncu36veuPyFKtnqV0bRFrH5c0S9dme9oD4OrIxC3lzjIWAeb6IPOqXG4N1I4cw9
	gtT2Xm4p+jJ62X2y5bwrr4nyudQzy7cyqP5jMJemXyJa78avLa9qCr70qv75dqkflr75IEXOtP5
	M2wgFpPTOaB7ZThKIB0YDmF/5+4Q4J/Gnmkj5DZf2VuNlmW6g=
X-Google-Smtp-Source: AGHT+IHbH8IHfW1jco323IJ3I8ek87dCWx6djDQi1gr/CrsHWGERJ1m1etCKkq3catleN2NzR1ZFUNRCRNXLMeqhzx0=
X-Received: by 2002:a05:6512:3b93:b0:54d:6dd3:614c with SMTP id
 2adb3069b0e04-54d6e62a372mr244799e87.14.1744935843910; Thu, 17 Apr 2025
 17:24:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250417142513.312939-1-ulf.hansson@linaro.org> <20250417142513.312939-9-ulf.hansson@linaro.org>
In-Reply-To: <20250417142513.312939-9-ulf.hansson@linaro.org>
From: Saravana Kannan <saravanak@google.com>
Date: Thu, 17 Apr 2025 17:23:27 -0700
X-Gm-Features: ATxdqUG-wMFcs_RvfIR7wkSnVzQWMhX9qiYF5MQ0YXxTofWgLSd9q6dkFbXM67w
Message-ID: <CAGETcx9rvTWPbDCnTLb+ToVk8BMipTa1Y14vpn=bPBkM=CjoZg@mail.gmail.com>
Subject: Re: [PATCH 08/11] pmdomain: core: Add internal ->sync_state() support
 for genpd providers
To: Ulf Hansson <ulf.hansson@linaro.org>
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
X-CRM114-CacheID: sfid-20250418_011328_933665_8D2465AB 
X-CRM114-Status: GOOD (  26.88  )
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

On Thu, Apr 17, 2025 at 7:25=E2=80=AFAM Ulf Hansson <ulf.hansson@linaro.org=
> wrote:
>
> If the genpd provider's fwnode doesn't have an associated struct device
> with it, we can make use of the generic genpd->dev and it corresponding
> driver internally in genpd to manage ->sync_state().
>
> More precisely, while adding a genpd OF provider let's check if the fwnod=
e
> has a device and if not, make the preparation to handle ->sync_state()
> internally through the genpd_provider_driver and the genpd_provider_bus.
>
> Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
> ---
>  drivers/pmdomain/core.c   | 36 ++++++++++++++++++++++++++++++++++++
>  include/linux/pm_domain.h |  7 +++++++
>  2 files changed, 43 insertions(+)
>
> diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> index 512f89e6d302..9c5a77bf59d2 100644
> --- a/drivers/pmdomain/core.c
> +++ b/drivers/pmdomain/core.c
> @@ -2374,6 +2374,7 @@ int pm_genpd_init(struct generic_pm_domain *genpd,
>         INIT_WORK(&genpd->power_off_work, genpd_power_off_work_fn);
>         atomic_set(&genpd->sd_count, 0);
>         genpd->status =3D is_off ? GENPD_STATE_OFF : GENPD_STATE_ON;
> +       genpd->sync_state =3D GENPD_SYNC_STATE_OFF;
>         genpd->device_count =3D 0;
>         genpd->provider =3D NULL;
>         genpd->device_id =3D -ENXIO;
> @@ -2656,6 +2657,7 @@ int of_genpd_add_provider_simple(struct device_node=
 *np,
>                                  struct generic_pm_domain *genpd)
>  {
>         struct fwnode_handle *fwnode;
> +       struct device *dev;
>         int ret;
>
>         if (!np || !genpd)
> @@ -2665,6 +2667,10 @@ int of_genpd_add_provider_simple(struct device_nod=
e *np,
>                 return -EINVAL;
>
>         fwnode =3D &np->fwnode;
> +       dev =3D fwnode->dev;
> +
> +       if (!dev)
> +               genpd->sync_state =3D GENPD_SYNC_STATE_SIMPLE;

I don't want people directly poking into fwnode.

Use get_device_from_fwnode() that's in drivers/base/core.c? Might need
to move it to a header. Make sure to put_device() it back.

Or ideally, figure it out using some other means like looking for
#power-domain-cells number? (if that'll always give the right answer).
Point being, the framework should know which type it's registering
even if there was no fwnode/fw_devlink.

>
>         device_set_node(&genpd->dev, fwnode);
>
> @@ -2718,8 +2724,10 @@ int of_genpd_add_provider_onecell(struct device_no=
de *np,
>  {
>         struct generic_pm_domain *genpd;
>         struct fwnode_handle *fwnode;
> +       struct device *dev;
>         unsigned int i;
>         int ret =3D -EINVAL;
> +       bool sync_state =3D false;
>
>         if (!np || !data)
>                 return -EINVAL;
> @@ -2728,6 +2736,10 @@ int of_genpd_add_provider_onecell(struct device_no=
de *np,
>                 data->xlate =3D genpd_xlate_onecell;
>
>         fwnode =3D &np->fwnode;
> +       dev =3D fwnode->dev;

Can you do this some other way please? I really don't like this look up.

-Saravana

> +
> +       if (!dev)
> +               sync_state =3D true;
>
>         for (i =3D 0; i < data->num_domains; i++) {
>                 genpd =3D data->domains[i];
> @@ -2737,6 +2749,11 @@ int of_genpd_add_provider_onecell(struct device_no=
de *np,
>                 if (!genpd_present(genpd))
>                         goto error;
>
> +               if (sync_state) {
> +                       genpd->sync_state =3D GENPD_SYNC_STATE_ONECELL;
> +                       sync_state =3D false;
> +               }
> +
>                 device_set_node(&genpd->dev, fwnode);
>
>                 ret =3D device_add(&genpd->dev);
> @@ -3453,6 +3470,25 @@ static void genpd_provider_remove(struct device *d=
ev)
>
>  static void genpd_provider_sync_state(struct device *dev)
>  {
> +       struct generic_pm_domain *genpd =3D container_of(dev, struct gene=
ric_pm_domain, dev);
> +
> +       switch (genpd->sync_state) {
> +       case GENPD_SYNC_STATE_OFF:
> +               break;
> +
> +       case GENPD_SYNC_STATE_ONECELL:
> +               of_genpd_sync_state(dev);
> +               break;
> +
> +       case GENPD_SYNC_STATE_SIMPLE:
> +               genpd_lock(genpd);
> +               genpd_power_off(genpd, false, 0);
> +               genpd_unlock(genpd);
> +               break;
> +
> +       default:
> +               break;
> +       }
>  }
>
>  static struct genpd_provider_drv genpd_provider_drv =3D {
> diff --git a/include/linux/pm_domain.h b/include/linux/pm_domain.h
> index e9a1f8975c4f..2185ee9e4f7c 100644
> --- a/include/linux/pm_domain.h
> +++ b/include/linux/pm_domain.h
> @@ -127,6 +127,12 @@ enum genpd_notication {
>         GENPD_NOTIFY_ON,
>  };
>
> +enum genpd_sync_state {
> +       GENPD_SYNC_STATE_OFF =3D 0,
> +       GENPD_SYNC_STATE_SIMPLE,
> +       GENPD_SYNC_STATE_ONECELL,
> +};
> +
>  struct dev_power_governor {
>         bool (*power_down_ok)(struct dev_pm_domain *domain);
>         bool (*suspend_ok)(struct device *dev);
> @@ -187,6 +193,7 @@ struct generic_pm_domain {
>         unsigned int performance_state; /* Aggregated max performance sta=
te */
>         cpumask_var_t cpus;             /* A cpumask of the attached CPUs=
 */
>         bool synced_poweroff;           /* A consumer needs a synced powe=
roff */
> +       enum genpd_sync_state sync_state; /* How sync_state is managed. *=
/
>         int (*power_off)(struct generic_pm_domain *domain);
>         int (*power_on)(struct generic_pm_domain *domain);
>         struct raw_notifier_head power_notifiers; /* Power on/off notifie=
rs */
> --
> 2.43.0
>

