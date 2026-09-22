Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46077C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 07:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=io8UjoxhH2lPg3HQUAyI0U/34+pkdRwtw5UyaKVMvYA=; b=Mwr0/gwQrdJIdX9NYKIc+AL94x
	Qf2GDN9b9IVIzG0m0JE7+TDHZDLNMpO/Wq11MkME8N58taaXeERaJYD3dPF2ZEMTZ58H/hSF0xovQ
	YrMb3LETU66S51eIxsHeleapp2jcRruLFHQoASAPt5ZOELjEwvcswkpoe1Z4Zj9Dc0TJ95+mb+knK
	SU5UxxEVaWOxtrXJIMQAei40fyFaU47K/tyKki6BJX+ha/37gCk3P0DRbtaVXQDRguxj1ERochwai
	nOEzPVbNzKDP9E7X2ByoPG5rWgD9aKFTUSSzHRwBUstapS0Pud+v3gd24SzI/mlzWQsVQB5K8+Qk5
	FlhgZ04w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8v84-00000004YPx-0wv9;
	Tue, 22 Sep 2026 07:41:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8v82-00000004YPf-2AdH
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 22 Sep 2026 07:41:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=io8UjoxhH2lPg3HQUAyI0U/34+pkdRwtw5UyaKVMvYA=; b=lO4BXY4+3pEUFCqDcra++5kd17
	sXHv6jkSAnp1tkQiNWVXBqUfeLU5N0iQoQ543ycKjtz4rcKu0iD75km8Cd8jyNNGWKZ2b4/ej+HNT
	MQ3oh5cowqSVHMmhBW2lHjNotMCFAgZKprVfg0yHqczboeSMxE8lOOZr9J5YHQUQx4F2XmXHkYjhJ
	xtiA2mw43T+LKPLQvCP9j1d5vj0SYTLGu/wKaF0Dn6qdK2l80c1xKjodoW9zH7rf3Lg70KB8WYutM
	6wnXUh/aCBjHsXrRtcoE9nXJB3XsYEYkQ6FdBAylzdS+qUuAeGp1p5KJCFhoj97rSgK7icB1sHcym
	XRYcinVg==;
Received: from mail-yx2-x0e.google.com ([2607:f8b0:4864:41::e])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8v7z-0000000DDq8-1Ntx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 07:41:25 +0000
Received: by mail-yx2-x0e.google.com with SMTP id 00721157ae682-89666ee9b3bso25809547b3.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 00:41:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790062881; cv=none;
        d=google.com; s=arc-20260327;
        b=Uqc2nB/ggoU3OkcsXvXx75ARd20vVwUqO5PBlxrfghk1WaDfIVnRWNiV+ZdbUK/efh
         ds2MhxEOIXHc8xpr9kWwvpFx50i2hiTBMtFxbsfOkem70cCZ8eWSRsFmqTgGYsw56Re6
         X/MCvwE1E8iKjqMDGC3JxxLp1l69jQnEj9FLq1duVDjwFirAkY1XclPFNBQ6ikTn2keH
         b3Gh7Y1QSjlL2GeZmIbg5LW6RPaTvru1F3Dsjsck6T+BjT0dPxZvjqAOZQAYnv0WXqt0
         L8PumgTSfwyO8oEqu5g6V8xPX2gJgGReIbtCIg5nfDa4t8O+d/h1xC9vTQya0xwBF0DM
         tENQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=io8UjoxhH2lPg3HQUAyI0U/34+pkdRwtw5UyaKVMvYA=;
        fh=0nmY7iCX+LAaXXa/VvOUJP9XExTqqDM/5GoKwRqtDEE=;
        b=G/6gsQZsq4MxI59+noSDr6gvfpdqfovcxn9cVEZqkJDtNWxOs0sWn/wb8qSPji9GrA
         plnF7yHT9Ay/mCDMd3YRWxg27OLz4C1X4+xxhWWRjsQHBEcFJYMk7QY0rE05b+dzz3jc
         OUw+D6eb1sd+iBEDDwa63aOi8yHdi3oQ0i0iJasXf8QD0MrCfvxPL6+VnpxzfHR4jiet
         e0p0SbI56WgrPzEE03vhOzUih/mocKsxbIYLFFT/HLlunRbncuuwLqQUlarlbdu2s6vt
         RdGZ69PNWei6H5hCdh4TxBNF6NgZB4IEr5bBHC4pgwtr5GbVc5aqmAi3mZSImqapD/k0
         fneA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790062881; x=1790667681; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=io8UjoxhH2lPg3HQUAyI0U/34+pkdRwtw5UyaKVMvYA=;
        b=IMh1vDr8Vk8Rcs/c8hFeQ9t4xxiaDauJZ6S+N4oxLD3TA7qFooPXzYgSNowd5fxkmA
         p/+pol9ykX4NZp/LtLS0oC56LbAc16GG/q3pUvieu4qTG0ajwI8O0wVOiH10b//LFIwa
         Ed021bQAxkNL7h8bkFK/GhIwRdHF31YqgswIVOGZ6nlnmGGwpImnxF/U254Ky+iMGdYZ
         4/zV3jlM7kNVdBpTshPk/NqCTyuh3CYIlFpk7XG8a/Wq8oRQazrurO+ZC37h9qFvcDR1
         eFJE6R++i+IpNoEmBrvf70znjYO2ZMZW2Qw6a6RihyPR7Bgz0Payo2aGA6mRlZfVh+uS
         klAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790062881; x=1790667681;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=io8UjoxhH2lPg3HQUAyI0U/34+pkdRwtw5UyaKVMvYA=;
        b=M2KPYRUpPiyR7EUwpxyska9KMZ87L7U5RBNEEZKDPKZAXfG3i8V6dkHYv6UVpAt0Hz
         SNPUkvWlgJkOHdqUqCvCCQNrJ6hfq5bPtNfkjs3iLnhecD5NY1ktcgAwoVKAb1PPfN6L
         nbc7vrKHj1qC/X8wBlfTsx2XGztbiL1UVGKZ9RMinWGWTQo0bg11JFOj0QY/STB9mXTm
         a3LTeoz8ZS5rtM/7SPwG6c508FtURBASP8oZtqXEcHGPPAyLMtnF3xpM+9+G8uj4xEnE
         2MvPx9FG9KEU7zE0HFxcX50rVDrdFqEnSXorPktIK2DtBDiqnIuklTfH3XUQrcEZED/F
         B1OA==
X-Forwarded-Encrypted: i=1; AKwUvBzqOzj2NQTyFojFl7y6YsH6/p1IlDXB/Oe/E1mjq0av4sgPDYkSPhZHUUw1OKpHUXRgtVzZg9bdsThI7P4cuKws@lists.infradead.org
X-Gm-Message-State: AFuF++nyalmfvmOSU/x2CBaTVq+G2a2nup0jocEM3zbJ5XLBhg1hYUIh
	NQiwnF/1BxiMsTOFu9n+L3Qa1L42SRm2SwI8wunYEVn9LBp7F8rt2WlRcTutqcTMjfPoXETdcXj
	4YJ8+NsckC3X9zQ5nsP3tc+htr4BLkkk=
X-Gm-Gg: AYBFou3dbur56SC+/JXqqgc1XqbQiNcEoeOXNHcZp8WuaKrIXYk+XIWvdnHS4Tzw1yc
	b0jdg4wZpLNa8RedBjnIZxpNEYa02dMwQCJD7euinTqppzuE/LbDJERBRVWWKFQkfrmWyUvgi5C
	X51Qpg12o7O53dBumMo8bGDryL/hb+m+Z9EV3Nos4QeuKWOXR0KaBtbwLGMcexfBDQrb690IRPq
	/X/dqdt0q3oWmV7hQU0uUrqSUBkhpMaYq2t5WXPygXzf1JkM5FNqZyrjGsvNsqY3Yvf7mZeeXCF
	SXSwV3LDKaabBIdVzFzXsnrDn5DYZFbO1WDflEtIXxGuXZfbUn8yZa0PRQ==
X-Received: by 2002:a05:690e:1913:b0:66d:2cd9:91d with SMTP id
 956f58d0204a3-6717fd6bd3amr4742587d50.50.1790062880773; Tue, 22 Sep 2026
 00:41:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260918031323.3376849-1-lgs201920130244@gmail.com> <aqzqvfbeh653jUce@ashevche-desk.local>
In-Reply-To: <aqzqvfbeh653jUce@ashevche-desk.local>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Tue, 22 Sep 2026 15:41:07 +0800
X-Gm-Features: AcwNN1VuZPbV3cKT7eLyi5Ad-zawrqaD9RbQUP_M-BL5VAYRTq9TxG7WFCvCE54
Message-ID: <CANUHTR9ipEFUGteK4TTpnpN0yUmxjop1v783aOhyq6AE9cwO0A@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: imx: gpc: remove all initialized power domains
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wentao Liang <vulab@iscas.ac.cn>, 
	Miaoqian Lin <linmq006@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
	Lucas Stach <l.stach@pengutronix.de>, Dong Aisheng <aisheng.dong@nxp.com>, linux-pm@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_084123_731352_93C29BC0 
X-CRM114-Status: GOOD (  27.99  )
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

  Hi Andy,

 Thanks for the review.

On Fri, 18 Sept 2026 at 15:39, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Fri, Sep 18, 2026 at 11:13:22AM +0800, Guangshuo Li wrote:
> > imx_gpc_old_dt_init() initializes all power domains described by
> > of_id_data->num_domains. Its probe failure path removes all of these
> > domains, but imx_gpc_remove() only removes the PU and ARM domains.
> >
> > On SoCs with more than two domains, such as i.MX6SL and i.MX6SX, the
> > additional DISPLAY and PCI generic power domains can remain registered
> > after the GPC driver is removed.
> >
> > Remove all initialized power domains in reverse order. Keep releasing
> > the PU clocks immediately after the PU domain has been successfully
> > removed.
> >
> > This issue was found by manual code inspection.
>
> ...
>
> >  static void imx_gpc_remove(struct platform_device *pdev)
> >  {
> > +     const struct imx_gpc_dt_data *of_id_data =
> > +             device_get_match_data(&pdev->dev);
>
> No...
>
> >       struct device_node *pgc_node;
> > -     int ret;
> > +     int i, ret;
>
> ...and no.
>
> The result of the device_get_match_data() better to be checked, in some cases
> it might lead to NULL dereference.
>
> It's better to split semantically different variables, also naming 'i' is not
> good, num_domains is better. Besides that, why is it signed?
>
> ...
>
> > +             for (i = of_id_data->num_domains - 1; i >= 0; i--) {
>
> What you are doing here can be written in a shorter form
>
>                 num_domains = of_id_data->num_domains;
>                 while (num_domains--) {
>
> > +                     ret = pm_genpd_remove(&imx_gpc_domains[i].base);
> > +                     if (ret) {
> > +                             dev_err(&pdev->dev,
> > +                                     "Failed to remove %s power domain (%pe)\n",
> > +                                     imx_gpc_domains[i].base.name,
> > +                                     ERR_PTR(ret));
> > +                             return;
> > +                     }
> >
> > +                     if (i == GPC_PGC_DOMAIN_PU)
> > +                             imx_pgc_put_clocks(&imx_gpc_domains[i]);
> >               }
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
How about this:

 static void imx_gpc_remove(struct platform_device *pdev)
 {
+       const struct imx_gpc_dt_data *of_id_data;
        struct device_node *pgc_node;
-       int ret;
+       unsigned int num_domains;
+       int ret;

        pgc_node = of_get_child_by_name(pdev->dev.of_node, "pgc");

        ...

        if (!pgc_node) {
                of_genpd_del_provider(pdev->dev.of_node);

-               ret = pm_genpd_remove(&imx_gpc_domains[GPC_PGC_DOMAIN_PU].base);
-               if (ret) {
-                       dev_err(&pdev->dev, "Failed to remove PU power
domain (%pe)\n",
-                               ERR_PTR(ret));
-                       return;
-               }
-               imx_pgc_put_clocks(&imx_gpc_domains[GPC_PGC_DOMAIN_PU]);
+               of_id_data = device_get_match_data(&pdev->dev);
+               if (!of_id_data)
+                       return;

-               ret =
pm_genpd_remove(&imx_gpc_domains[GPC_PGC_DOMAIN_ARM].base);
-               if (ret) {
-                       dev_err(&pdev->dev, "Failed to remove ARM
power domain (%pe)\n",
-                               ERR_PTR(ret));
-                       return;
+               num_domains = of_id_data->num_domains;
+               while (num_domains--) {
+                       ret =
pm_genpd_remove(&imx_gpc_domains[num_domains].base);
+                       if (ret) {
+                               dev_err(&pdev->dev,
+                                       "Failed to remove %s power
domain (%pe)\n",
+                                       imx_gpc_domains[num_domains].base.name,
+                                       ERR_PTR(ret));
+                               return;
+                       }
+
+                       if (num_domains == GPC_PGC_DOMAIN_PU)
+
imx_pgc_put_clocks(&imx_gpc_domains[num_domains]);
                }
        }

Does this look OK to you? If so, I'll send a v2.

Thanks,
Guangshuo

