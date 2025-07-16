Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97A94C83F22
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 20:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kZZgzA7unxaQYTpUKeT3tiFqc0eDBxi7N6aA9SCTkxo=; b=0iNffgN3fQycHJEmPiJ81C/A2F
	5GtLIWQaPAp6eOZHhkz4dnmf9Xy98vl2isslzqvfOElFQNbE142fnuARQBsVcPwPmPO0uAmuqa+Vs
	7dKnWLGYfo8By0QD5DY8LRNGv+5QKoxVXzbm98CYQcK/3aCsPNHKqQxVoa+hoSaTr6xSm9L4Ns6uK
	eQsgIrYxwIYktkL36vgGuaHlJnwS8t6KGE/0xmzNfzJuXnjtEmxYosbOrW7dWM73omUBHXdqR8NMD
	FFDbaSs0d7ZuLcExC7j3VvBfVQM/XV8WI4dGHYt3Nv4ChonPmkFDNkO8UZ+dGCElIFow7XxN2gHvi
	UnHOswqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc9DT-00000008eUc-06Ss;
	Wed, 16 Jul 2025 20:59:03 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc88p-00000008Y4H-0rCv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 19:50:12 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-b31e076f714so997667a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Jul 2025 12:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752695410; x=1753300210; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kZZgzA7unxaQYTpUKeT3tiFqc0eDBxi7N6aA9SCTkxo=;
        b=EKfqs9/Tw1k4KzughzzNyKbZZvwL51vKsEe4LdZ3/koEVPgcM6hkl7/aeRcbrmwdnE
         42Zaf44CpctwNumf8pLLY3W3T6ZpzDZ+iaGfCG4HOlDoUlVZN9/IvtQ84DJ15xw7MxD8
         zLU1nItzs/1kDm+5Em/h6ljGx2EPRerNa+n3tbnncd9YdTcTnsUQZyIY7Suc7qiuNOQg
         mUlY0cLnVdoT4t+dMHIb/n4OPX3qngDMXeq7+qpwDgQmeq2Hvw/gRUUX5Tx52rKYGkvx
         E+nWNaa5to3Fmtung/N7++HIEZztW0N7lYilYhRsAyta/oqViK9833bSsT+9BIguRiWh
         4BRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752695410; x=1753300210;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kZZgzA7unxaQYTpUKeT3tiFqc0eDBxi7N6aA9SCTkxo=;
        b=kVcB9P3iWVKT8L+LnjqJMDLMENrkCZkREKr/RI+K/K44a+KhrZpkfslaOnGxVrc786
         hR4R7yaLkV0yuf9Twxehhsk7DYDLmAv5aiJi1e8VBzFnIUE1/93uns6EZZmJtXpZ/jDE
         O2dqr8X1B36MSE4cc5omzg4qQ16o8N9es16QaisyJw8ojVZuabGWxTmNlkDHXvJ/ZhhM
         O4HlEtDxDD3PudtYBbOON60YKYqLDghxrnFDO5vZOWecL+wHM2FULOYg/m6EhqLenmFx
         fgqfqe6CUD0/fIiyiXXWs6kWzeWy7xjUGlNFxk02JEldAZbOi8sD2OczKGea/xuKPpHF
         02Tg==
X-Forwarded-Encrypted: i=1; AJvYcCW1JtWb+1UFRaY3zZwaPD2/5sXDQvO1zFO8M8icVWWQMqtwiTB4jWUbovXRV2TDpHunAX2p+5AlXv78RdgYNFec@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6N/gzGeEm75CIZ2kCWX04x8J3Jgz1Zh4yNwvMdLOg2ggQtP5q
	fvshrkr1Je9gaFlCHBFTGWJibWfYPRTKisGGdSLGn9LLtVGcAw/tIu1h
X-Gm-Gg: ASbGncsQOCq8djAd0PzZsFtZFV+m6yU/SEMSOXRzvwG9r8KRy8ep5QNf+uKejPL+aK3
	0gH4iTtpxCtFJGNyA9zHLM30zG5HtRmW8HZGzOb0TtU6LnDlY4PrprjzKQ2mI848O9183zEqaL1
	SALpFYkg+IhzFNbQWtGm3mYenDN/4iGOetucNETbiRitPQoJEZjUVGMdsZc5Ienr3uztTQJP8N+
	3Kh0myhVjjaK76Bq0EnrJCAFMMvk1oR2lY/gNb8dU+BF5PRvyiQy31VAdiqWDB+X4fhyEEcqCOA
	q+WMf8wAtIglxVLBvryU7q8aBqE8LtYgxUqfVS+ReJzAxkmCO8hQq8X27FPD/8iYeAwxaaji9mP
	uQ1+wVxmXzySVLZiRVhI=
X-Google-Smtp-Source: AGHT+IGkORjHEJ3lwLi+FibgkhUKI9Xi/FApJrENFdLLcxtfYU8HO8fS+q0sfAOpe3IeYIpcVRS1Jw==
X-Received: by 2002:a17:90b:3d81:b0:312:e73e:cded with SMTP id 98e67ed59e1d1-31caea21526mr783583a91.16.1752695410205;
        Wed, 16 Jul 2025 12:50:10 -0700 (PDT)
Received: from hiagonb ([2804:1b3:a7c1:459e:e3dd:d2e:b1ee:b9ec])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c9f1e684csm1947200a91.12.2025.07.16.12.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 12:50:09 -0700 (PDT)
Date: Wed, 16 Jul 2025 16:50:03 -0300
From: Hiago De Franco <hiagofranco@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, linux-pm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Hiago De Franco <hiago.franco@toradex.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@oss.nxp.com>, daniel.baluta@nxp.com,
	iuliana.prodan@oss.nxp.com,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v7 3/3] remoteproc: imx_rproc: detect and attach to
 pre-booted remote cores
Message-ID: <20250716195003.5kunymu3nrdsfnz2@hiagonb>
References: <aHZ0nK4ZZShAr6Xz@p14s>
 <CAPDyKFrWng0CY-ayKoEbnS_yanghSqogxfuizxEVbVogJ4DT=g@mail.gmail.com>
 <20250716132552.bra37ucw4fcjwril@hiagonb>
 <aHfYQFvkJcdfq9K_@p14s>
 <20250716172308.lzh3aak24d6mt4cs@hiagonb>
 <CAPDyKFr8eYiyj5s7wGsru8GJ+CS6h-o+a+BOV-nvCdSzWM0bSw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPDyKFr8eYiyj5s7wGsru8GJ+CS6h-o+a+BOV-nvCdSzWM0bSw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_125011_251672_7E0D0A0E 
X-CRM114-Status: GOOD (  60.84  )
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

On Wed, Jul 16, 2025 at 08:56:37PM +0200, Ulf Hansson wrote:
> On Wed, 16 Jul 2025 at 19:23, Hiago De Franco <hiagofranco@gmail.com> wrote:
> >
> > On Wed, Jul 16, 2025 at 10:50:08AM -0600, Mathieu Poirier wrote:
> > > On Wed, Jul 16, 2025 at 10:25:52AM -0300, Hiago De Franco wrote:
> > > > Hi Mathieu, Ulf,
> > > >
> > > > On Tue, Jul 15, 2025 at 09:32:44AM -0600, Mathieu Poirier wrote:
> > > > > On Sun, Jun 29, 2025 at 02:25:12PM -0300, Hiago De Franco wrote:
> > > > > > From: Hiago De Franco <hiago.franco@toradex.com>
> > > > > >
> > > > > > When the Cortex-M remote core is started and already running before
> > > > > > Linux boots (typically by the Cortex-A bootloader using a command like
> > > > > > bootaux), the current driver is unable to attach to it. This is because
> > > > > > the driver only checks for remote cores running in different SCFW
> > > > > > partitions. However in this case, the M-core is in the same partition as
> > > > > > Linux and is already powered up and running by the bootloader.
> > > > > >
> > > > > > This patch adds a check using dev_pm_genpd_is_on() to verify whether the
> > > > > > M-core's power domains are already on. If all power domain devices are
> > > > > > on, the driver assumes the M-core is running and proceed to attach to
> > > > > > it.
> > > > > >
> > > > > > To accomplish this, we need to avoid passing any attach_data or flags to
> > > > > > dev_pm_domain_attach_list(), allowing the platform device become a
> > > > > > consumer of the power domain provider without changing its current
> > > > > > state.
> > > > > >
> > > > > > During probe, also enable and sync the device runtime PM to make sure
> > > > > > the power domains are correctly managed when the core is controlled by
> > > > > > the kernel.
> > > > > >
> > > > > > Suggested-by: Ulf Hansson <ulf.hansson@linaro.org>
> > > > > > Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> > > > > > Reviewed-by: Peng Fan <peng.fan@nxp.com>
> > > > > > Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> > > > > > ---
> > > > > > v6 -> v7:
> > > > > >  - Added Peng reviewed-by.
> > > > > > v5 -> v6:
> > > > > >  - Commit description improved, as suggested. Added Ulf Hansson reviewed
> > > > > >    by. Comment on imx-rproc.c improved.
> > > > > > v4 -> v5:
> > > > > >  - pm_runtime_get_sync() removed in favor of
> > > > > >    pm_runtime_resume_and_get(). Now it also checks the return value of
> > > > > >    this function.
> > > > > >  - Added pm_runtime_disable() and pm_runtime_put() to imx_rproc_remove()
> > > > > >    function.
> > > > > > v3 -> v4:
> > > > > >  - Changed to use the new dev_pm_genpd_is_on() function instead, as
> > > > > >    suggested by Ulf. This will now get the power status of the two
> > > > > >    remote cores power domains to decided if imx_rpoc needs to attach or
> > > > > >    not. In order to do that, pm_runtime_enable() and
> > > > > >    pm_runtime_get_sync() were introduced and pd_data was removed.
> > > > > > v2 -> v3:
> > > > > >  - Unchanged.
> > > > > > v1 -> v2:
> > > > > >  - Dropped unecessary include. Removed the imx_rproc_is_on function, as
> > > > > >    suggested.
> > > > > > ---
> > > > > >  drivers/remoteproc/imx_rproc.c | 37 +++++++++++++++++++++++++++++-----
> > > > > >  1 file changed, 32 insertions(+), 5 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> > > > > > index 627e57a88db2..24597b60c5b0 100644
> > > > > > --- a/drivers/remoteproc/imx_rproc.c
> > > > > > +++ b/drivers/remoteproc/imx_rproc.c
> > > > > > @@ -18,6 +18,7 @@
> > > > > >  #include <linux/of_reserved_mem.h>
> > > > > >  #include <linux/platform_device.h>
> > > > > >  #include <linux/pm_domain.h>
> > > > > > +#include <linux/pm_runtime.h>
> > > > > >  #include <linux/reboot.h>
> > > > > >  #include <linux/regmap.h>
> > > > > >  #include <linux/remoteproc.h>
> > > > > > @@ -890,10 +891,8 @@ static int imx_rproc_partition_notify(struct notifier_block *nb,
> > > > > >  static int imx_rproc_attach_pd(struct imx_rproc *priv)
> > > > > >  {
> > > > > >         struct device *dev = priv->dev;
> > > > > > -       int ret;
> > > > > > -       struct dev_pm_domain_attach_data pd_data = {
> > > > > > -               .pd_flags = PD_FLAG_DEV_LINK_ON,
> > > > > > -       };
> > > > > > +       int ret, i;
> > > > > > +       bool detached = true;
> > > > > >
> > > > > >         /*
> > > > > >          * If there is only one power-domain entry, the platform driver framework
> > > > > > @@ -902,7 +901,22 @@ static int imx_rproc_attach_pd(struct imx_rproc *priv)
> > > > > >         if (dev->pm_domain)
> > > > > >                 return 0;
> > > > > >
> > > > > > -       ret = dev_pm_domain_attach_list(dev, &pd_data, &priv->pd_list);
> > > > > > +       ret = dev_pm_domain_attach_list(dev, NULL, &priv->pd_list);
> > > > > > +       /*
> > > > > > +        * If all the power domain devices are already turned on, the remote
> > > > > > +        * core is already powered up and running when the kernel booted (e.g.,
> > > > > > +        * started by U-Boot's bootaux command). In this case attach to it.
> > > > > > +        */
> > > > > > +       for (i = 0; i < ret; i++) {
> > > > > > +               if (!dev_pm_genpd_is_on(priv->pd_list->pd_devs[i])) {
> > > > > > +                       detached = false;
> > > > > > +                       break;
> > > > > > +               }
> > > > > > +       }
> > > > >
> > > > > I was doing one final review of this work when I noticed the return code for
> > > > > dev_pm_domain_attach_list() is never checked for error.
> > > >
> > > > As Ulf pointed out, the 'return' a few lines below will return the
> > > > negative value to the caller of 'imx_rproc_attach_pd', which ultimately
> > > > will fail 'imx_rproc_detect_mode' and fail the probe of imx_rproc.
> > > >
> > > > Please notice that even tough 'dev_pm_domain_attach_list' fails, the
> > > > rproc->state will still be set as RPROC_DETACHED because we are starting
> > > > 'detached' as true, but I am not seeing this as an issue because as
> > > > mentioned above the probe will fail anyway. Please let me know if you
> > > > see this as an issue.
> > >
> > > Two things to consider here:
> > >
> > > (1) It is only a matter of time before someone with a cleaver coccinelle script
> > > sends me a patch that adds the missing error check.
> > >
> > > (2) I think that @rproc->state being changed on error conditions is a bug
> > > waiting to happen.  This kind of implicit error handling is difficult to
> > > maintain and even more difficult for people to make enhancements to the driver.
> > >
> > > Adding a simple error check will make sure neither of the above will happen.  It
> > > is a simple change and we are at rc6 - this work can still go in the merge
> > > window.
> >
> > Sure, I can submit a new revision with this error check. Sorry I did not
> > see this before, I only had a close look at this '->state' now that you
> > asked on the previous email.
> 
> Alright. To avoid having you to resend patch1 and patch2 I have
> applied them on my next branch and added Mathieu's ack for patch2.
> 
> Note that my vacation is around the corner, so if you want patch3 for
> v6.17 you better be quick. :-)

Thanks Ulf, as requested I resend only patch 3.

https://lore.kernel.org/all/20250716194638.113115-1-hiagofranco@gmail.com/

Have a nice vacation =)

Best Regards,

Hiago.

> 
> [...]
> 
> Thanks and kind regards
> Uffe

