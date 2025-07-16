Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A04DC83F22
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 19:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5T3sOAWKCWrDJApaHZ5HeOfhtiegcEV08YGf9/b2PFE=; b=pbHVN288rAA+T8NYZNX8w8ysg9
	fdi1Prcn19hwSDk8W+AQ3DuZyv13Gj1PsYRfKiPLe+pg0mT7W8J5E6eaeManA8uNqzkcgaxSTHWbV
	r8ANduvE920/JKZy6VnAqXCRG74Zcqlh7/Vno9GTa/71FtDDFUh4/gK6vsK4RqryFe4txihfTRBQD
	0vlfEyijDwoQlymHwkCCx+10La9OLlPxiyBLB+M0+MEkfxQ8U1SVdZ2ggg9NOoMLN+mcgrDVBHNyP
	LQ1NB4u63Zp8rdsCBRSGXcO8k2jN0I74v/jF4QY5i6TxqlUxk2PLA7jqDpA36VgAKNx2Yr0iRObHC
	jDjTGTTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc7PO-00000008SJb-0BeX;
	Wed, 16 Jul 2025 19:03:14 +0000
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc7Je-00000008RHs-0cpi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 18:57:19 +0000
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-7180bb37846so1010987b3.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Jul 2025 11:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752692237; x=1753297037; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5T3sOAWKCWrDJApaHZ5HeOfhtiegcEV08YGf9/b2PFE=;
        b=p+YRvGY3US1RhnI9OPHiTO9RfykCou7Fg9eESnPytAb0vMia7qMyOp9KhsC3q5xWeI
         L+8i7KiiEi4QeTEzcMaTsmtrHlbx3FDqkrkWCdapAERn8FaOZvUEepjCwG5xTBY1rab6
         ZW0U3CkeTWC5u/w3QiuQe0gJqpLcHcX4LhufSrnBHjmfgQCPi9dTb317JxYLk8423EAP
         8Bi60vJydNuqnHmZwYC115QI4/BMEVUHtwETWs4HZqLQmCxKurLHJWSDUa41MNlOk7UB
         tT8enXIFziMxZ8vym1zwvYK3EnAZoU0UWVJt6Q6Bkc+fwmkYDDgG/0PKwOMIJu3gs/qV
         7kNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752692237; x=1753297037;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5T3sOAWKCWrDJApaHZ5HeOfhtiegcEV08YGf9/b2PFE=;
        b=sDGiVjcZ9yoyZe8SX1xOZfqTGhZf+jp6lcD4PT0EHV7KSFfFKqnsuAtevH1qvxXFNS
         GCIrctOo2vHw6769UFo6SxWQV16nC0Dd7kqa54OEvBZQwZJpH/G3YLhWjhc0BS5/iNtC
         IHdQPvegO+yGplpMYjcEaXKpnowSUk/oZdtuc/SV0qJj7thzp5V+KrlJb+LIPaxKhHEF
         fyKwwZ/07u7olqUxeTlvFVdmZNzpxJdq1azpEqR+0dxSc05p8A2aRC0UoN5MOMkM+/Ir
         0K+gkWbUq0MUtGLShBBbLW44zQLPSDqdxQ5T7fqgGtfrVik1B93cqi+ZmwlzeDFgMk0I
         x9Pg==
X-Forwarded-Encrypted: i=1; AJvYcCUbWRsCncIy8rbqjTsZsuGTV1jKgzr/uqIKgU+IHi/l+bpSJgGOR9/AUGovXMVGKLB7HTFIQqS5uJ5Psd5uzupU@lists.infradead.org
X-Gm-Message-State: AOJu0Yyhr2qL9FmtVQeZcNgCmuD6WCwOhqZerMubLDJg8noQveWWRsUi
	MuvswZt1tShcv5wx5EYhTwUsp+ZJlcNmNq+ozxfz07YBRc/B0OfgwpYPnt2FfJDpEyFYWcwVfRB
	6N3wu39zHC9SuxXNZZgiJjJlGWreJxeCGMTo+PhM7pg==
X-Gm-Gg: ASbGncunMWv9qRocM0D3VQbkosqtWopGdQdEOMG8H+Di3B0REJj5ja6+kEDAo7xIhZD
	Ey3omDCvin6lAB5HZPIAB5dpyPNuIUdt2Qw8uC2IjfaSwGIK5hJxjJfo2h1iGnLqOHOoNHOz/1M
	HjPJ2v0vsBYfzHunhZ1RSmxAans89qAWP3LpyskmlpkETgRs6KZRiLrLUruPegc3wYkTHZfS+Me
	f4q0g8/LRZq5BHqS8I=
X-Google-Smtp-Source: AGHT+IFboyjGqtZEq5f82RSPNSJDrHYTW3q6drCPtrarFDu2PZ57yVAHJp5U1uDDb/JP+QL0UnyG2hOvxRBeY7szQew=
X-Received: by 2002:a05:690c:6aca:b0:712:e333:d3a6 with SMTP id
 00721157ae682-7183733e627mr44145087b3.19.1752692237085; Wed, 16 Jul 2025
 11:57:17 -0700 (PDT)
MIME-Version: 1.0
References: <aHZ0nK4ZZShAr6Xz@p14s> <CAPDyKFrWng0CY-ayKoEbnS_yanghSqogxfuizxEVbVogJ4DT=g@mail.gmail.com>
 <20250716132552.bra37ucw4fcjwril@hiagonb> <aHfYQFvkJcdfq9K_@p14s> <20250716172308.lzh3aak24d6mt4cs@hiagonb>
In-Reply-To: <20250716172308.lzh3aak24d6mt4cs@hiagonb>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 16 Jul 2025 20:56:37 +0200
X-Gm-Features: Ac12FXyGrszMr34Yekpq1kAdjmt5gaU__KNEwdTbqqWzif98sMQ9MbYF1-XPcj4
Message-ID: <CAPDyKFr8eYiyj5s7wGsru8GJ+CS6h-o+a+BOV-nvCdSzWM0bSw@mail.gmail.com>
Subject: Re: [PATCH v7 3/3] remoteproc: imx_rproc: detect and attach to
 pre-booted remote cores
To: Hiago De Franco <hiagofranco@gmail.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, linux-pm@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Bjorn Andersson <andersson@kernel.org>, 
	Hiago De Franco <hiago.franco@toradex.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Peng Fan <peng.fan@oss.nxp.com>, daniel.baluta@nxp.com, iuliana.prodan@oss.nxp.com, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_115718_210562_5B7CBA17 
X-CRM114-Status: GOOD (  58.06  )
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

On Wed, 16 Jul 2025 at 19:23, Hiago De Franco <hiagofranco@gmail.com> wrote:
>
> On Wed, Jul 16, 2025 at 10:50:08AM -0600, Mathieu Poirier wrote:
> > On Wed, Jul 16, 2025 at 10:25:52AM -0300, Hiago De Franco wrote:
> > > Hi Mathieu, Ulf,
> > >
> > > On Tue, Jul 15, 2025 at 09:32:44AM -0600, Mathieu Poirier wrote:
> > > > On Sun, Jun 29, 2025 at 02:25:12PM -0300, Hiago De Franco wrote:
> > > > > From: Hiago De Franco <hiago.franco@toradex.com>
> > > > >
> > > > > When the Cortex-M remote core is started and already running before
> > > > > Linux boots (typically by the Cortex-A bootloader using a command like
> > > > > bootaux), the current driver is unable to attach to it. This is because
> > > > > the driver only checks for remote cores running in different SCFW
> > > > > partitions. However in this case, the M-core is in the same partition as
> > > > > Linux and is already powered up and running by the bootloader.
> > > > >
> > > > > This patch adds a check using dev_pm_genpd_is_on() to verify whether the
> > > > > M-core's power domains are already on. If all power domain devices are
> > > > > on, the driver assumes the M-core is running and proceed to attach to
> > > > > it.
> > > > >
> > > > > To accomplish this, we need to avoid passing any attach_data or flags to
> > > > > dev_pm_domain_attach_list(), allowing the platform device become a
> > > > > consumer of the power domain provider without changing its current
> > > > > state.
> > > > >
> > > > > During probe, also enable and sync the device runtime PM to make sure
> > > > > the power domains are correctly managed when the core is controlled by
> > > > > the kernel.
> > > > >
> > > > > Suggested-by: Ulf Hansson <ulf.hansson@linaro.org>
> > > > > Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> > > > > Reviewed-by: Peng Fan <peng.fan@nxp.com>
> > > > > Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> > > > > ---
> > > > > v6 -> v7:
> > > > >  - Added Peng reviewed-by.
> > > > > v5 -> v6:
> > > > >  - Commit description improved, as suggested. Added Ulf Hansson reviewed
> > > > >    by. Comment on imx-rproc.c improved.
> > > > > v4 -> v5:
> > > > >  - pm_runtime_get_sync() removed in favor of
> > > > >    pm_runtime_resume_and_get(). Now it also checks the return value of
> > > > >    this function.
> > > > >  - Added pm_runtime_disable() and pm_runtime_put() to imx_rproc_remove()
> > > > >    function.
> > > > > v3 -> v4:
> > > > >  - Changed to use the new dev_pm_genpd_is_on() function instead, as
> > > > >    suggested by Ulf. This will now get the power status of the two
> > > > >    remote cores power domains to decided if imx_rpoc needs to attach or
> > > > >    not. In order to do that, pm_runtime_enable() and
> > > > >    pm_runtime_get_sync() were introduced and pd_data was removed.
> > > > > v2 -> v3:
> > > > >  - Unchanged.
> > > > > v1 -> v2:
> > > > >  - Dropped unecessary include. Removed the imx_rproc_is_on function, as
> > > > >    suggested.
> > > > > ---
> > > > >  drivers/remoteproc/imx_rproc.c | 37 +++++++++++++++++++++++++++++-----
> > > > >  1 file changed, 32 insertions(+), 5 deletions(-)
> > > > >
> > > > > diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> > > > > index 627e57a88db2..24597b60c5b0 100644
> > > > > --- a/drivers/remoteproc/imx_rproc.c
> > > > > +++ b/drivers/remoteproc/imx_rproc.c
> > > > > @@ -18,6 +18,7 @@
> > > > >  #include <linux/of_reserved_mem.h>
> > > > >  #include <linux/platform_device.h>
> > > > >  #include <linux/pm_domain.h>
> > > > > +#include <linux/pm_runtime.h>
> > > > >  #include <linux/reboot.h>
> > > > >  #include <linux/regmap.h>
> > > > >  #include <linux/remoteproc.h>
> > > > > @@ -890,10 +891,8 @@ static int imx_rproc_partition_notify(struct notifier_block *nb,
> > > > >  static int imx_rproc_attach_pd(struct imx_rproc *priv)
> > > > >  {
> > > > >         struct device *dev = priv->dev;
> > > > > -       int ret;
> > > > > -       struct dev_pm_domain_attach_data pd_data = {
> > > > > -               .pd_flags = PD_FLAG_DEV_LINK_ON,
> > > > > -       };
> > > > > +       int ret, i;
> > > > > +       bool detached = true;
> > > > >
> > > > >         /*
> > > > >          * If there is only one power-domain entry, the platform driver framework
> > > > > @@ -902,7 +901,22 @@ static int imx_rproc_attach_pd(struct imx_rproc *priv)
> > > > >         if (dev->pm_domain)
> > > > >                 return 0;
> > > > >
> > > > > -       ret = dev_pm_domain_attach_list(dev, &pd_data, &priv->pd_list);
> > > > > +       ret = dev_pm_domain_attach_list(dev, NULL, &priv->pd_list);
> > > > > +       /*
> > > > > +        * If all the power domain devices are already turned on, the remote
> > > > > +        * core is already powered up and running when the kernel booted (e.g.,
> > > > > +        * started by U-Boot's bootaux command). In this case attach to it.
> > > > > +        */
> > > > > +       for (i = 0; i < ret; i++) {
> > > > > +               if (!dev_pm_genpd_is_on(priv->pd_list->pd_devs[i])) {
> > > > > +                       detached = false;
> > > > > +                       break;
> > > > > +               }
> > > > > +       }
> > > >
> > > > I was doing one final review of this work when I noticed the return code for
> > > > dev_pm_domain_attach_list() is never checked for error.
> > >
> > > As Ulf pointed out, the 'return' a few lines below will return the
> > > negative value to the caller of 'imx_rproc_attach_pd', which ultimately
> > > will fail 'imx_rproc_detect_mode' and fail the probe of imx_rproc.
> > >
> > > Please notice that even tough 'dev_pm_domain_attach_list' fails, the
> > > rproc->state will still be set as RPROC_DETACHED because we are starting
> > > 'detached' as true, but I am not seeing this as an issue because as
> > > mentioned above the probe will fail anyway. Please let me know if you
> > > see this as an issue.
> >
> > Two things to consider here:
> >
> > (1) It is only a matter of time before someone with a cleaver coccinelle script
> > sends me a patch that adds the missing error check.
> >
> > (2) I think that @rproc->state being changed on error conditions is a bug
> > waiting to happen.  This kind of implicit error handling is difficult to
> > maintain and even more difficult for people to make enhancements to the driver.
> >
> > Adding a simple error check will make sure neither of the above will happen.  It
> > is a simple change and we are at rc6 - this work can still go in the merge
> > window.
>
> Sure, I can submit a new revision with this error check. Sorry I did not
> see this before, I only had a close look at this '->state' now that you
> asked on the previous email.

Alright. To avoid having you to resend patch1 and patch2 I have
applied them on my next branch and added Mathieu's ack for patch2.

Note that my vacation is around the corner, so if you want patch3 for
v6.17 you better be quick. :-)

[...]

Thanks and kind regards
Uffe

