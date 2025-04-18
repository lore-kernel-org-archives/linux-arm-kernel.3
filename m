Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2055CC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 07:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=espvvwCOUsOaiPeW4qBVlqsEGI9VvnOEfzXFD5TrphU=; b=UDMcOhiPQcEl6+DMGH1sjXYLQu
	cTkzRgXfVt4p2aX4vzDgtC+IkftRVNN5kLK5Y99IB5y0d6iOPXfAoENUZLCxbaNctXJdy+MpqzCOl
	WhwWn7lRfl9Du7wQ8ojiiWl7nsd9+ThtTXk+QRd5lGuPbWOpDnhc3fecETs7Cl/dDrlpu9Y80sjDP
	JteFAb3/aQSoBToFusXA7mlVqLFcPYP47ZNFwb3pJEa0mD1ZbMZfAWYbSO21EdED1AYo5ZcAkJ0/8
	Uc1QPkgEbF6RLaq6+UGdoZRJIHGxnhvhy+s3nGsyjGqUw3KfHAmzL7FqS1A+aOkhxNLSYpqT4Cf6h
	KJGEeJNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5gdP-0000000FXl0-41rl;
	Fri, 18 Apr 2025 07:59:39 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5gBX-0000000FTZk-3EjK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 07:30:52 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5f62d3ed994so315635a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Apr 2025 00:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744961450; x=1745566250; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=espvvwCOUsOaiPeW4qBVlqsEGI9VvnOEfzXFD5TrphU=;
        b=3gYVzcLmom6UX5Onb16KePXvoQTvFtiFz00wQRoUCTVEWBJn4uCJe2ttByhJHlKgyM
         37l+2VBQLucAu5FKAV1BF6F54IKeO8rc2AxJJCQmlKK0n7aLDuLW8uPu5f6sCZrmdHlw
         YQ7jH2SnBXPTukPlcEdKJvlrU8ljWturRRHJmPVwV5ogLj93yG/Oh26+9JaIHfHR6g0U
         0qjzV6g44a/DREj1say2yuIXKieAbl0a36e2jhmHMbqLd/ZRosYuiWkkmu/QKKv+uJEa
         8lC6E/W85h9dY8/zHCeDP+lFNOL2pCvJGkLvtoq02/JTHX8kc+dghaNPj4oOxYHxb/Hq
         1rng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744961450; x=1745566250;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=espvvwCOUsOaiPeW4qBVlqsEGI9VvnOEfzXFD5TrphU=;
        b=YsVAvKxtYSE57BEGKKkkHCa6LRzS2UkGbMWSvj+dDwjbL74nOOjyHeJZDrgCKzRHp6
         wSAHCZI6jbyUqzbbLtbS47jahOSOQhVa+KlnTzUVbvG155BqZGO6vlXZMHyTJx5hskT2
         sJZ45LBslN/ouUHk5ZXclGLIocv4tgLUKDhgkAFfwpEOBk3q2bpCCIFNURX3M8yLPNCa
         ZSncwGYJT1T8+97l4nCJw8g4yczlLevlmAEbE7oxh9A2Egv4ab+pfzWUHEjD4JGzM1A4
         NfCOJAcGWXWVfUYY5BupkmIQdhOajcJcW7LJ6jnwGcZ8spr+E5saf7LMX41YaJU5CL90
         7IGg==
X-Forwarded-Encrypted: i=1; AJvYcCVU0Oq9EaCyxlHcQNwD/gTFXFzGFx5oheJLfLsTY/FS5WhprKvuqvUiUA2Cc7a2Zc+jlvPJTtfJEmu/QnPv2c0Z@lists.infradead.org
X-Gm-Message-State: AOJu0YzQiGfKrwPaK7yNAb8IzlCAvb/fbyOiEoQHYZvoJK9cmA9YM1Vz
	MPOvHBjonYirRt16Xeja6ybDX1FrKcs0T+VAokiq5T4aLe+te0KNAERs+zpOEd2p1Ik9Tj+/Aoh
	zA2N6XSyw1ZDlETMBFUTeWJ5hLJbYh75K1sgAA5EkU+49WKXtUA==
X-Gm-Gg: ASbGncspSTlSwtp6uwcP5vEvIYjgUWfGhR9m2SEdy//8ccjO1AL2YRygmphg8l4sY1e
	RX9ZYlagbSvSSSqfw/5BqZ+/vPwHFiFBY1GolEpSwcmKVKuW4ShNrzQMYHKfl5aHdkAzLCSET9t
	SFX1tG7PCkqKCAyVqdC/ntnMUXvtGdHJgUXOCkISwfH0zAZYA=
X-Google-Smtp-Source: AGHT+IE/wqWU+kEJ+uNl1lu0U9l4Nd/hTZwOvDN4HtDxpaQCKOIhack1E/1QtP4XZ5jNQUL4f+oT4lDAZLRZaMBAPC4=
X-Received: by 2002:a2e:bc86:0:b0:30c:40d6:5cdb with SMTP id
 38308e7fff4ca-310904dba7cmr3095251fa.11.1744937483536; Thu, 17 Apr 2025
 17:51:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250417142513.312939-1-ulf.hansson@linaro.org> <20250417142513.312939-12-ulf.hansson@linaro.org>
In-Reply-To: <20250417142513.312939-12-ulf.hansson@linaro.org>
From: Saravana Kannan <saravanak@google.com>
Date: Thu, 17 Apr 2025 17:50:45 -0700
X-Gm-Features: ATxdqUG3nsZ8r4b4j3azqOjFpPct1ZcFhXbrqEnzX0WXjS0gXoFni5vfKcox8w4
Message-ID: <CAGETcx_hQRr1hRQD0vyAN9bhZRx+763zfHUG0oBi0sqFUi85pA@mail.gmail.com>
Subject: Re: [PATCH 11/11] pmdomain: core: Leave powered-on genpds on until ->sync_state()
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
X-CRM114-CacheID: sfid-20250418_003051_810849_35170EC9 
X-CRM114-Status: GOOD (  23.53  )
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
> Powering-off a genpd that was on during boot, before all of its consumer
> devices have been probed, is certainly prone to problems.
>
> Let's fix these problems by preventing these genpds from being powered-of=
f
> until ->sync_state(). Note that, this only works for OF based platform as
> ->sync_state() are relying on fw_devlink.

For non-OF platforms, this will still wait until late_initcall(). So,
there's at least SOME protection. We could potentially even move that
to happen after deferred probe timeout expires.

-Saravana

>
> Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
> ---
>  drivers/pmdomain/core.c   | 12 +++++++++++-
>  include/linux/pm_domain.h |  1 +
>  2 files changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> index 695d7d9e5582..a8c56f7a7ba0 100644
> --- a/drivers/pmdomain/core.c
> +++ b/drivers/pmdomain/core.c
> @@ -212,6 +212,12 @@ static inline bool irq_safe_dev_in_sleep_domain(stru=
ct device *dev,
>         return ret;
>  }
>
> +#ifdef CONFIG_PM_GENERIC_DOMAINS_OF
> +static bool genpd_may_stay_on(bool on) { return on; }
> +#else
> +static bool genpd_may_stay_on(bool on) { return false; }
> +#endif
> +
>  static int genpd_runtime_suspend(struct device *dev);
>
>  /*
> @@ -933,11 +939,12 @@ static void genpd_power_off(struct generic_pm_domai=
n *genpd, bool one_dev_on,
>          * The domain is already in the "power off" state.
>          * System suspend is in progress.
>          * The domain is configured as always on.
> +        * The domain was on at boot and still need to stay on.
>          * The domain has a subdomain being powered on.
>          */
>         if (!genpd_status_on(genpd) || genpd->prepared_count > 0 ||
>             genpd_is_always_on(genpd) || genpd_is_rpm_always_on(genpd) ||
> -           atomic_read(&genpd->sd_count) > 0)
> +           genpd->stay_on || atomic_read(&genpd->sd_count) > 0)
>                 return;
>
>         /*
> @@ -2374,6 +2381,7 @@ int pm_genpd_init(struct generic_pm_domain *genpd,
>         INIT_WORK(&genpd->power_off_work, genpd_power_off_work_fn);
>         atomic_set(&genpd->sd_count, 0);
>         genpd->status =3D is_off ? GENPD_STATE_OFF : GENPD_STATE_ON;
> +       genpd->stay_on =3D genpd_may_stay_on(!is_off);
>         genpd->sync_state =3D GENPD_SYNC_STATE_OFF;
>         genpd->device_count =3D 0;
>         genpd->provider =3D NULL;
> @@ -2640,6 +2648,7 @@ void of_genpd_sync_state(struct device *dev)
>         list_for_each_entry(genpd, &gpd_list, gpd_list_node) {
>                 if (genpd->provider =3D=3D &np->fwnode) {
>                         genpd_lock(genpd);
> +                       genpd->stay_on =3D false;
>                         genpd_power_off(genpd, false, 0);
>                         genpd_unlock(genpd);
>                 }
> @@ -3486,6 +3495,7 @@ static void genpd_provider_sync_state(struct device=
 *dev)
>
>         case GENPD_SYNC_STATE_SIMPLE:
>                 genpd_lock(genpd);
> +               genpd->stay_on =3D false;
>                 genpd_power_off(genpd, false, 0);
>                 genpd_unlock(genpd);
>                 break;
> diff --git a/include/linux/pm_domain.h b/include/linux/pm_domain.h
> index 2185ee9e4f7c..c5358cccacad 100644
> --- a/include/linux/pm_domain.h
> +++ b/include/linux/pm_domain.h
> @@ -193,6 +193,7 @@ struct generic_pm_domain {
>         unsigned int performance_state; /* Aggregated max performance sta=
te */
>         cpumask_var_t cpus;             /* A cpumask of the attached CPUs=
 */
>         bool synced_poweroff;           /* A consumer needs a synced powe=
roff */
> +       bool stay_on;                   /* Stay powered-on during boot. *=
/
>         enum genpd_sync_state sync_state; /* How sync_state is managed. *=
/
>         int (*power_off)(struct generic_pm_domain *domain);
>         int (*power_on)(struct generic_pm_domain *domain);
> --
> 2.43.0
>

