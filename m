Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFB2BC83013
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 12:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H//zs/SGlHTwFgjneb586KPEfZCC73lRKW26G4B/bNw=; b=qPfWDdPtod0g71q72HfqgLr4so
	0CU+5k4jAKz9RJJMvDviyLcEtHKFJ/58fFf0SVkTA7G+OzQ4VLYxT7g1mAJ0UVdxTy16ZedRFSiS1
	KO7kaTlhH77LI7eDFW/IyZPbVP3aJZRCxR67h7bm5iJLy3Yl9a3ZbVgNVbYtyFSVwSwD+MA5AuzyS
	MIEUk9XGiBtuIdY8OPHSWvfmk1YLjwtdRaoKKaFPgv6W9pHYnmcHhjOC8SRJhajp2L056QBs0/R2o
	CWGoJq6H/fMU4vLWgml4lTBMh7Ba4NWO7VLNTvenFX7VAhyNfuWqbbNemP4jJWk6pzhUkdVOcoVyS
	xJRVGIAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWwqN-00000008LXE-47yV;
	Wed, 02 Jul 2025 12:45:43 +0000
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWwEu-00000008Fcn-1AuO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 12:07:01 +0000
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-70e5e6ab7b8so62696587b3.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Jul 2025 05:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751458019; x=1752062819; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=H//zs/SGlHTwFgjneb586KPEfZCC73lRKW26G4B/bNw=;
        b=Egn4ci7PxI3z6JffViMD9r3vubDkYnrTsSrWR+9nOeJnXbIhr2YfqanFpNnkI/ZBkQ
         sp7NLMd2GEKrO4OLRCcPPTYFInVW/gWQtE8aL3v+a6ecsMfkQk6edYRf1epMeXIQNmBo
         bREjucRL0WEbV8g0QfOJXveELGHMDWtegkyCcKrlfPbNRTxlpaylgeU1XOjHfTwq8dae
         giZdhDnz69WW5mmmyUMz/Ztwrv5RmykT2ZjMmdEWqrshGwWqtKap5Sorv0kjQ/bo2CUx
         1kpBqKaYqtWupJ9bUFcIEBMnAT1uQ0ZYQenigKH96cQHAcjvrO06+FGppIS4kIn4cWaI
         GlnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751458019; x=1752062819;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H//zs/SGlHTwFgjneb586KPEfZCC73lRKW26G4B/bNw=;
        b=UxAzU+IgtbtGkTeoaUtori5Xfg5Ku4QIFhHWPV1GbhdtLQXhjL/yF7/WV4vpMOQ499
         qhY5BcG08LSZs1h/eEYI31pZfcysImopwswn3GHuki/zxqh9kW08ZzgCS8mQqOwLiZ9/
         LL/Grb4zQfa9aYosuHEE1fV5vhwLcFL8dmWmnQBa+tjjHOE2mplGHIU0Fseu6bQ+9SxB
         JZpn90IPHQOmGsmsq7HPBPmDHPSRtwMJoZ71pyG2TqAXbmzoMNemQEqC1FaKjfpf3OQd
         tvSvF0AAPUht+XeGtkjv/6MjiVsFsmPHIVbI2eFZ8wph9txGw7asIh7dkE4mLoeQeWBb
         QG7A==
X-Forwarded-Encrypted: i=1; AJvYcCXS7pNnx+OlF54ygZbkikNoWNSXl+4fG465bx6R+3TkjSIGcc4DDKL6fvxMI7LV/Wa7MyRiALPaX4YjSYoUITGw@lists.infradead.org
X-Gm-Message-State: AOJu0YzpeH0nBE6dJo4K2VhtjtWMYtLF6QD2ae+7SPvcPj6hZdkxu8Bh
	jL2oHV4qEfgyvijwiB1BxMbmNqhyM1thIr7sOW2jsFwohoymzoXaBLTKR+sUedoJi4eNp4esSxi
	QIwkpOARjVU+4FFupXCKKfvP07uZ5yUtLQZzFoKKVVg==
X-Gm-Gg: ASbGncsgIEdRKs1WktdStzWvfBqaOF48AGNv/q+LeG44210O8in909MVk+1B1UlVaOX
	layI6oMcLY3svjnIHcnC/hpUCpF+cS2bIkGwSbuZ3wrf1PUaWj7CgpGYox+nCWoSs4ChGsSZqWU
	dB3V4Rtij4RyZd/sSsYBBNqziVt1sU5tcNQi2UaW8i7q5L
X-Google-Smtp-Source: AGHT+IHvy4ot4cVEUqJ9OPaKV3B11/w9tqUUihTLRsxteLbI5hVPVLYtxESKS56YJ2QmEc+ggte5xRAak7cDxYT6glw=
X-Received: by 2002:a05:690c:6305:b0:70e:7638:a3a9 with SMTP id
 00721157ae682-7164d54935amr34553827b3.18.1751458018380; Wed, 02 Jul 2025
 05:06:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250627204821.1150459-1-k-willis@ti.com> <20250627204821.1150459-3-k-willis@ti.com>
In-Reply-To: <20250627204821.1150459-3-k-willis@ti.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 2 Jul 2025 14:06:22 +0200
X-Gm-Features: Ac12FXwakGRpH39p6UXOySAygWsMTsisIa17xEeHOgmtuD9NMJOQScXlVEjSnu0
Message-ID: <CAPDyKForKeb=uTkOXWcJea-P9c+7wQ3ZRWFYpTXk=xLoQPsQaw@mail.gmail.com>
Subject: Re: [PATCH 2/2] pmdomain: ti_sci: Add LPM abort sequence to suspend path
To: Kendall Willis <k-willis@ti.com>
Cc: nm@ti.com, kristo@kernel.org, ssantosh@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, d-gole@ti.com, vishalm@ti.com, sebin.francis@ti.com, 
	msp@baylibre.com, khilman@baylibre.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_050700_319412_18033B63 
X-CRM114-Status: GOOD (  28.83  )
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

On Fri, 27 Jun 2025 at 22:49, Kendall Willis <k-willis@ti.com> wrote:
>
> Create ->suspend_late() and ->suspend_noirq() hooks to add abort sequence
> to any driver within the PM domain with either of those hooks. If a driver
> fails to suspend with those hooks, add a call to the DM to abort entering
> the LPM. The suspend hooks of the PM domains driver inserts itself into
> the suspend path of all devices connected to the TI SCI PM domain. So if
> any device in the PM domain with either a ->suspend_late() or
> ->suspend_noirq hook fails to suspend, the PM domain drivers suspend hook
> will send the abort call to the DM.
>
> Adding an abort call in the ->suspend() hook is not necessary. TI SCI
> suspend sends the message to the DM to prepare to enter a low power mode.
> TI SCI suspend ALWAYS occurs after the ->suspend() hook for all TI SCI
> devices has been called.
>
> Signed-off-by: Kendall Willis <k-willis@ti.com>
> ---
>  drivers/pmdomain/ti/ti_sci_pm_domains.c | 46 ++++++++++++++++++++++++-
>  1 file changed, 45 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/pmdomain/ti/ti_sci_pm_domains.c b/drivers/pmdomain/ti/ti_sci_pm_domains.c
> index 82df7e44250bb..975defc16271d 100644
> --- a/drivers/pmdomain/ti/ti_sci_pm_domains.c
> +++ b/drivers/pmdomain/ti/ti_sci_pm_domains.c
> @@ -2,7 +2,7 @@
>  /*
>   * TI SCI Generic Power Domain Driver
>   *
> - * Copyright (C) 2015-2017 Texas Instruments Incorporated - http://www.ti.com/
> + * Copyright (C) 2015-2025 Texas Instruments Incorporated - http://www.ti.com/
>   *     J Keerthy <j-keerthy@ti.com>
>   *     Dave Gerlach <d-gerlach@ti.com>
>   */
> @@ -149,8 +149,47 @@ static int ti_sci_pd_suspend(struct device *dev)
>
>         return 0;
>  }
> +
> +static int ti_sci_pd_suspend_late(struct device *dev)
> +{
> +       struct generic_pm_domain *genpd = pd_to_genpd(dev->pm_domain);
> +       struct ti_sci_pm_domain *pd = genpd_to_ti_sci_pd(genpd);
> +       const struct ti_sci_handle *ti_sci = pd->parent->ti_sci;
> +       int ret;
> +
> +       ret = pm_generic_suspend_late(dev);
> +       if (ret) {
> +               dev_err(dev, "%s: Failed to suspend. Abort entering low power mode.\n", __func__);
> +               if (ti_sci->ops.pm_ops.lpm_abort(ti_sci))
> +                       dev_err(dev, "%s: Failed to abort.\n", __func__);
> +               return ret;
> +       }
> +
> +       return 0;
> +}
> +
> +static int ti_sci_pd_suspend_noirq(struct device *dev)
> +{
> +       struct generic_pm_domain *genpd = pd_to_genpd(dev->pm_domain);
> +       struct ti_sci_pm_domain *pd = genpd_to_ti_sci_pd(genpd);
> +       const struct ti_sci_handle *ti_sci = pd->parent->ti_sci;
> +       int ret;
> +
> +       ret = pm_generic_suspend_noirq(dev);
> +       if (ret) {
> +               dev_err(dev, "%s: Failed to suspend. Abort entering low power mode.\n", __func__);
> +               if (ti_sci->ops.pm_ops.lpm_abort(ti_sci))
> +                       dev_err(dev, "%s: Failed to abort.\n", __func__);
> +               return ret;
> +       }
> +
> +       return 0;
> +}
> +
>  #else
>  #define ti_sci_pd_suspend              NULL
> +#define ti_sci_pd_suspend_late         NULL
> +#define ti_sci_pd_suspend_noirq                NULL
>  #endif
>
>  /*
> @@ -264,6 +303,11 @@ static int ti_sci_pm_domain_probe(struct platform_device *pdev)
>                                     pd_provider->ti_sci->ops.pm_ops.set_latency_constraint)
>                                         pd->pd.domain.ops.suspend = ti_sci_pd_suspend;
>
> +                               if (pd_provider->ti_sci->ops.pm_ops.lpm_abort) {
> +                                       pd->pd.domain.ops.suspend_late = ti_sci_pd_suspend_late;
> +                                       pd->pd.domain.ops.suspend_noirq = ti_sci_pd_suspend_noirq;

This doesn't work as pm_genpd_init() is assigning the
->suspend_noirq() callback, hence overriding the callback.

Moreover I am not sure this is the correct thing to do, as having your
own ->suspend_noirq() callback would mean that you will be by-passing
genpd's internal reference counting to understand when it's fine to
power-off the PM domain, vi a the ->power_off() callback.

Can the LPM abort be handled from a ->complete() callback instead?

> +                               }
> +
>                                 pm_genpd_init(&pd->pd, NULL, true);
>
>                                 list_add(&pd->node, &pd_provider->pd_list);
> --
> 2.34.1
>

Kind regards
Uffe

