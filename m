Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB2DBC5B552
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 09:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N6UY2y9MOEwZlIGv1rKrrngNk7HNQITxylPxlIC9Qrk=; b=mF55KO4U1BxawR92AlrZGGVqR1
	Q3ajCMTkeQk9MCgcro8PZwskoCQ2JpqAFILXXWdx7jNNsO52Ru5ncNgWMUYaKwSOnZqQsJj1Bvb8z
	KzAaL3uoHALmxjomwXJD2LFzWNME8LrBQY0gu20Mn25DOINL+6XaYIvr6R2FOEjrHIsiO0MQwKh71
	YdCcsnB2s6nlDnS08qSRVb6zrs1jdr3fSJY62F2gfgN4rvmBVmXrO6uVDCuhadWzWyIO+7rUTT6aX
	ZWBpxPqaNkEFk+bzBQewdRA4GSxffmF2DNiRf+HuPiUfENtGY16gibExwwTmUytrUJqoH2mWxmUYv
	BqsBU4Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKwMB-00000000D62-31kI;
	Fri, 30 May 2025 09:48:55 +0000
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKwJl-00000000CmV-2jDM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 May 2025 09:46:26 +0000
Received: by mail-yb1-xb2f.google.com with SMTP id 3f1490d57ef6-e803de44790so214835276.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 May 2025 02:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748598384; x=1749203184; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=N6UY2y9MOEwZlIGv1rKrrngNk7HNQITxylPxlIC9Qrk=;
        b=NT3vGuoCTqTHwRb1t3EBXmkby3Bc+oNpRY8gYThRmVmMgWcW9CGagX3W6sVziUHlW4
         dxpi9C/6hjpezQvyLBOQ5CcJmuMxCcKLTj/mD/QtYXLBFST1NDsQyd6S5QbJWDhYaLn8
         NAlkzkYzSeqnccJaZ18tjYusVxfc8FudCxCu4OuN3FDB7Ks5jhpLH9QUgoSB7rX9duIE
         BTBHi0kQhvtKriZWFdhWXoIvyUbqIRJvRR29iDAjyEhpxk9wVt9irJnJGIJ3gE3SYEQF
         rJu5vN4KVFdyRI9jjVk41NB2a2ZZGY7ymWHdbKDET0a8tMrr4jJVZKXtZilyCVk1USHD
         AwDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748598384; x=1749203184;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N6UY2y9MOEwZlIGv1rKrrngNk7HNQITxylPxlIC9Qrk=;
        b=Erw464QIrihOkpXijwEhp5Yv0LPcmy2OlYk1+PfeYsnl05T/GHxyLTyL3DEUBaZqyr
         i20etVclIym6EEBdL3mA5UaZZZJG0OjnQ3P0xlbZsv4XhYregVH8pbt4hC/iRZrzemzj
         CRlHwP8XWcuws1ZpdePeaPQSMvFQjl/q80tM/X0N70Fm5+KkUUr4HTl30fxALBAjwqf7
         C2VICA3ek9b+K1hc6038Clt+iWLjPYTcsCK7rpW5Rq+62IwJdvjmQIL6s5TV1cvC7S/B
         0SoPAp2LdTa2RoU3BM/bA41onRrFPn/cMCwPsZTSI6c6pl1W+1vYQ03KkduXQ+qBoN57
         yPJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFOiGw/DjzyiJrrNUPlJe/ASnACPmnrEfhGDZvO/dIatTxOILmPx2Cprpl4N3AIRc91eoDyy26z5vi0ZjWaQK8@lists.infradead.org
X-Gm-Message-State: AOJu0Yxx/slt3d7HZ+bUw/em8rIZKYDycmVLBHV/yphALvQTAdzdt8Hi
	4yDlvYMzqE8/zzSdWFEn6cO+uVrcM1FJuPT2RLSG+jO09QjBQQq6zIJ10LCykVReXPWEF03PHnd
	7F4jlL888X1Cj7RPry0zoAwXWiNUg3Yh8rnVWvPt/4w==
X-Gm-Gg: ASbGncukKTw8XXS4u12ASmdEVa4TZCL86lx6nYil0t2ECJ8xxynxLb5IFlqeCx3UZoU
	DcxlTUXvUiw9UsMjwsboogz7bwLnwFnRhN3UyMW9J9OtXhiBK4ugm4l0sebOPhSDrDazLWlAQbg
	MEllb8077kq7nmzHVKLq/KCFU9gZ39QKnI0A==
X-Google-Smtp-Source: AGHT+IHDOOob+rYy5PewBfFSnwrXwwsdqV4NLiR/14XgYNCnd/4FiuYQbhODXW8eT2YWicTg9hQl3xI77mVLBp8m+Dw=
X-Received: by 2002:a05:6902:26c3:b0:e7d:8875:bfe2 with SMTP id
 3f1490d57ef6-e7f81f15dedmr3191276276.43.1748598384251; Fri, 30 May 2025
 02:46:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250521041840.GB28017@nxa18884-linux> <CAPDyKFpSb+KsfDr1-=uk4TF4Op1dUQ9rDwPP5sSpMfxDRDhnZA@mail.gmail.com>
 <20250523191713.nylhi74jq6z4hqmr@hiago-nb> <CAPDyKFq6HG6iTZRnBSN25vhCU8Zj1c+r_ufGbiBsJ16N+1bJVg@mail.gmail.com>
 <20250527000510.fofehmsdhifcwlys@hiago-nb> <20250527023921.GA14252@nxa18884-linux>
 <CAPDyKFqZkcaGfss=Oi+H9UERFU29jY2t5uTPnGVGQgSAJSeCoA@mail.gmail.com>
 <20250527134525.f7yzs4ww64xxmjmr@hiago-nb> <20250528173813.rxqu6pzqgu4m5joo@hiago-nb>
 <PAXPR04MB845941FFF347274012A0ECA88866A@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <20250529201544.azoqdrgnlqfxi6mb@hiago-nb>
In-Reply-To: <20250529201544.azoqdrgnlqfxi6mb@hiago-nb>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 30 May 2025 11:45:48 +0200
X-Gm-Features: AX0GCFsQvcDOUqaNaQ5cjuiIbQU68DMjg5d50KglTL5dTEGM-jQJUgFg_7R2SME
Message-ID: <CAPDyKFrDvxpFeBU5noRDBZCA1N96iPNYYjM0kqd1R4z_4CUV3w@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] remoteproc: imx_rproc: add power mode check for
 remote core attachment
To: Hiago De Franco <hiagofranco@gmail.com>
Cc: Peng Fan <peng.fan@nxp.com>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, 
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, 
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Bjorn Andersson <andersson@kernel.org>, 
	Hiago De Franco <hiago.franco@toradex.com>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>, 
	"Iuliana Prodan (OSS)" <iuliana.prodan@oss.nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_024625_705274_5FD3FBDF 
X-CRM114-Status: GOOD (  48.23  )
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

On Thu, 29 May 2025 at 22:15, Hiago De Franco <hiagofranco@gmail.com> wrote:
>
> On Thu, May 29, 2025 at 03:54:47AM +0000, Peng Fan wrote:
>
> [...]
>
> > > We are making progress ;-)
> > >
> > > With the patches you shared Ulf (I added them on top of the current
> > > master branch), it works as expected, dev_pm_genpd_is_on() returns 0
> > > when I boot the kernel without M4 running and it returns 1 when I
> > > boot the kernel with M4 running with a hello-world demo.
> > >
> > > However now I tried to, if dev_pm_genpd_is_on() returns 1, put the
> > > DETACHED state, something as
> > >
> > > if (dev_pm_genpd_is_on(priv->pd_list->pd_devs[0]))
> > >     priv->rproc->state = RPROC_DETACHED;
> > >
> > > In this case I used 0 because I understand this is the
> > > IMX_SC_R_M4_0_PID0 defined in my device tree overlay:
> > >
> > >             power-domains = <&pd IMX_SC_R_M4_0_PID0>,
> > >                             <&pd IMX_SC_R_M4_0_MU_1A>;
> > >
> > > But in this case, the kernel does not boot anymore, I see the "Starting
> > > kernel..." and nothing else.
> >
> > Please add "earlycon" in bootargs to see where it hangs.
>
> Thanks Peng! I was able to catch the kernel panic yesterday, however I
> must say that today I was doing the tests again and the issue is gone.
> Sorry, I might have done something wrong yesterday with the tests.
> Anyway, here is the log:
>
> [    1.271163] remoteproc remoteproc0: imx-rproc is available
> [    1.280296] remoteproc remoteproc0: attaching to imx-rproc
> [    1.285756] Unable to handle kernel paging request at virtual address ffff80005ae3dd79
> [    1.293624] Mem abort info:
> [    1.294655] mmc0: SDHCI controller on 5b010000.mmc [5b010000.mmc] using ADMA
> [    1.296386]   ESR = 0x0000000096000005
> [    1.307194]   EC = 0x25: DABT (current EL), IL = 32 bits
> [    1.312473]   SET = 0, FnV = 0
> [    1.315566]   EA = 0, S1PTW = 0
> [    1.318649]   FSC = 0x05: level 1 translation fault
> [    1.323510] Data abort info:
> [    1.326370]   ISV = 0, ISS = 0x00000005, ISS2 = 0x00000000
> [    1.331846]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
> [    1.336882]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
> [    1.342182] swapper pgtable: 4k pages, 48-bit VAs, pgdp=0000000096bc1000
> [    1.348870] [ffff80005ae3dd79] pgd=0000000000000000, p4d=1000000097054003, pud=0000000000000000
> [    1.357565] Internal error: Oops: 0000000096000005 [#1]  SMP
> [    1.363198] Modules linked in:
> [    1.366236] CPU: 2 UID: 0 PID: 47 Comm: kworker/u16:3 Not tainted 6.15.0-03667-g3f5f09105c40-dirty #826 PREEMPT
> [    1.376405] Hardware name: Toradex Colibri iMX8QXP on Colibri Evaluation Board V3 (DT)
> [    1.384313] Workqueue: events_unbound deferred_probe_work_func
> [    1.390128] pstate: 00000005 (nzcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [    1.397076] pc : rproc_handle_resources.constprop.0+0x78/0x1d0
> [    1.402896] lr : rproc_boot+0x368/0x56c
> [    1.406717] sp : ffff8000819c3990
> [    1.410017] x29: ffff8000819c3990 x28: ffff80005ae3dd7d x27: 0000000000000000
> [    1.417145] x26: 0000000000000000 x25: ffff0000015ec038 x24: ffff800080f0c0a8
> [    1.424268] x23: ffff8000813a6110 x22: 00000000d999ad79 x21: ffff0000015ec000
> [    1.431392] x20: 0000000026665683 x19: ffff80005ae3dd79 x18: 0000000000000006
> [    1.438516] x17: ffff000001799400 x16: ffff000001798e00 x15: 4addd15cca11c529
> [    1.445639] x14: 53ebce6d5564d787 x13: 4addd15cca11c529 x12: 53ebce6d5564d787
> [    1.452763] x11: 95a1e33b6b190674 x10: 9e3c9abdb41ca345 x9 : ab17b4eaffd6fd1c
> [    1.459887] x8 : d5da055de4cfbb87 x7 : dfd7fa31596acbbc x6 : 9946d97107d0dcca
> [    1.467011] x5 : ffff0000010c7800 x4 : 00000000000003fc x3 : ffff0000010c7780
> [    1.474134] x2 : fffffffffffffff0 x1 : ffff8000814a3000 x0 : ffff8000814a3000
> [    1.481261] Call trace:
> [    1.483690]  rproc_handle_resources.constprop.0+0x78/0x1d0 (P)
> [    1.487705] mmc0: new HS400 MMC card at address 0001
> [    1.489502]  rproc_boot+0x368/0x56c
> [    1.495349] mmcblk0: mmc0:0001 Q2J55L 7.09 GiB
> [    1.497929]  rproc_add+0x184/0x190
> [    1.504356]  mmcblk0: p1 p2
> [    1.505747]  imx_rproc_probe+0x458/0x528
> [    1.509238] mmcblk0boot0: mmc0:0001 Q2J55L 16.0 MiB
> [    1.512437]  platform_probe+0x68/0xc0
> [    1.512452]  really_probe+0xc0/0x38c
> [    1.520584] mmcblk0boot1: mmc0:0001 Q2J55L 16.0 MiB
> [    1.520951]  __driver_probe_device+0x7c/0x15c
> [    1.527522] mmcblk0rpmb: mmc0:0001 Q2J55L 4.00 MiB, chardev (242:0)
> [    1.529377]  driver_probe_device+0x3c/0x10c
> [    1.544263]  __device_attach_driver+0xbc/0x158
> [    1.548586]  bus_for_each_drv+0x84/0xe0
> [    1.552407]  __device_attach+0x9c/0x1ac
> [    1.556231]  device_initial_probe+0x14/0x20
> [    1.560401]  bus_probe_device+0xac/0xb0
> [    1.564221]  deferred_probe_work_func+0x9c/0xec
> [    1.568741]  process_one_work+0x14c/0x28c
> [    1.572735]  worker_thread+0x2cc/0x3d4
> [    1.576473]  kthread+0x12c/0x208
> [    1.579687]  ret_from_fork+0x10/0x20
> [    1.583253] Code: 8b36c033 9100127c 54000924 d503201f (b9400261)
> [    1.589337] ---[ end trace 0000000000000000 ]---
>
> But again, the issue is not happening anymore ;-) I will keep testing to
> see if the issue happens again, but for now is working fine, I can now
> attach to the remote processor.
>
> This is the git diff on top of Ulf patches I have been testing:
>
> diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> index 6da25e2c81d2..661a6aad40a8 100644
> --- a/drivers/pmdomain/core.c
> +++ b/drivers/pmdomain/core.c
> @@ -599,6 +599,23 @@ int dev_pm_genpd_set_performance_state(struct device *dev, unsigned int state)
>  }
>  EXPORT_SYMBOL_GPL(dev_pm_genpd_set_performance_state);
>
> +bool dev_pm_genpd_is_on(struct device *dev)
> +{
> +        struct generic_pm_domain *genpd;
> +        bool is_on;
> +
> +        genpd = dev_to_genpd_safe(dev);
> +        if (!genpd)
> +                return false;
> +
> +        genpd_lock(genpd);
> +        is_on = genpd_status_on(genpd);
> +        genpd_unlock(genpd);
> +
> +        return is_on;
> +}
> +EXPORT_SYMBOL_GPL(dev_pm_genpd_is_on);
> +
>  /**
>   * dev_pm_genpd_set_next_wakeup - Notify PM framework of an impending wakeup.
>   *
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 627e57a88db2..9688370f9bb5 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -18,6 +18,7 @@
>  #include <linux/of_reserved_mem.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_domain.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/reboot.h>
>  #include <linux/regmap.h>
>  #include <linux/remoteproc.h>
> @@ -891,9 +892,7 @@ static int imx_rproc_attach_pd(struct imx_rproc *priv)
>  {
>         struct device *dev = priv->dev;
>         int ret;
> -       struct dev_pm_domain_attach_data pd_data = {
> -               .pd_flags = PD_FLAG_DEV_LINK_ON,
> -       };
> +       bool test;
>
>         /*
>          * If there is only one power-domain entry, the platform driver framework
> @@ -902,7 +901,16 @@ static int imx_rproc_attach_pd(struct imx_rproc *priv)
>         if (dev->pm_domain)
>                 return 0;
>
> -       ret = dev_pm_domain_attach_list(dev, &pd_data, &priv->pd_list);
> +       ret = dev_pm_domain_attach_list(dev, NULL, &priv->pd_list);
> +       printk("hfranco: returned pd devs is %d", ret);
> +       for (int i = 0; i < ret; i++) {
> +               test = dev_pm_genpd_is_on(priv->pd_list->pd_devs[i]);
> +               printk("hfranco: returned value is %d", test);
> +               if (test) {
> +                       priv->rproc->state = RPROC_DETACHED;
> +                       break;
> +               }
> +       }
>         return ret < 0 ? ret : 0;
>  }
>
> @@ -1146,6 +1154,9 @@ static int imx_rproc_probe(struct platform_device *pdev)
>                 }
>         }
>
> +       pm_runtime_enable(dev);
> +       pm_runtime_get_sync(dev);
> +
>         ret = rproc_add(rproc);
>         if (ret) {
>                 dev_err(dev, "rproc_add failed\n");
> diff --git a/include/linux/pm_runtime.h b/include/linux/pm_runtime.h
> index 756b842dcd30..16d1fca2a8c5 100644
> --- a/include/linux/pm_runtime.h
> +++ b/include/linux/pm_runtime.h
> @@ -95,6 +95,7 @@ extern void pm_runtime_put_suppliers(struct device *dev);
>  extern void pm_runtime_new_link(struct device *dev);
>  extern void pm_runtime_drop_link(struct device_link *link);
>  extern void pm_runtime_release_supplier(struct device_link *link);
> +bool dev_pm_genpd_is_on(struct device *dev);
>
>  int devm_pm_runtime_set_active_enabled(struct device *dev);
>  extern int devm_pm_runtime_enable(struct device *dev);
>
> This is the rproc output when bootaux is used:
>
> root@colibri-imx8x-07308754:~# dmesg | grep hfranco
> [    0.478475] hfranco: returned pd devs is 2
> [    0.478496] hfranco: returned value is 1
> root@colibri-imx8x-07308754:~# dmesg | grep rproc
> [    0.478797] remoteproc remoteproc0: imx-rproc is available
> [    0.478878] remoteproc remoteproc0: attaching to imx-rproc
> [    0.478961] remoteproc remoteproc0: remote processor imx-rproc is now attached
>
> I will cleanup everything and try to come up with a patch. Ulf, in this
> case, as your patches have not yet been merged, should I wait for them?

I think you can state in the cover-letter that your series depends on
mine, so please go ahead and submit them.

>
> Thanks for all the help guys.
>
> >
> > >
> > > I am using the pm_runtime functions before rproc_add():
> > >
> > > @@ -1146,6 +1154,9 @@ static int imx_rproc_probe(struct
> > > platform_device *pdev)
> > >                 }
> > >         }
> > >
> > > +       pm_runtime_enable(dev);
> > > +       pm_runtime_get_sync(dev);
> >
> > I think only make this apply for i.MX8QX/8QM/DX, then no
> > impact to other patforms.

In general I think we should avoid such quirks in drivers, unless it's
really needed. Just wanted to share my opinion, but it's totally up to
you.

[...]

Kind regards
Uffe

