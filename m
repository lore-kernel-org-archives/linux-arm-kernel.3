Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C65A1C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 14:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GEvTqKjHd/gxofN54tYASAmooBFL0e/b3JPxl2GoRUQ=; b=rhyOCsfLxNR9zPdAQtvMpU1Hq7
	xBZF4deMOCX8/vwgfdRjDsbPt/ovQsunqymPZtnbLDOvIgx4xcoT3godlvzMkiL5PQG/AA3Zb3egZ
	Kc7EOl1GXCwg8nAvdIWQjvTOSekszRjaRd8qsP+iGkOfp8v2flRbNE+BeJnh33RoKd3OunxG7DPvZ
	xKCFkqePdkkrBIpSEu1xFwGrZMI7JNISt/Ja8BtH3DXZF56SUO7o6AhR9cjx1wEwpJnK/X/mjMd55
	J7G07tlIAbyDhxiPca0jFT/+vpRq9V1+DimnQu0+7kmzxK0bbjOWnlhCs8WlUvN2XZ8nJzH7MGt5K
	gFa4GQ5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9PDo-00000006an9-39HE;
	Mon, 28 Apr 2025 14:12:36 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9PBp-00000006aYh-1x7c
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 14:10:35 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-7396f13b750so5351861b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 07:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745849432; x=1746454232; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GEvTqKjHd/gxofN54tYASAmooBFL0e/b3JPxl2GoRUQ=;
        b=bNaybsUhZYUAi4gsw8ID8AWBIpJyPkhG6EA+hSnpRvizufuuX7avgSeJsO1oZvOt+F
         ershlFIDb+DdRW0MJ0JIR68Z3SyBoTerC8uoRRt7KuQjykraiQausraz7IJeeq2NE8c2
         ugPpYOK7d3QbnDUDk4/OSdrUyg6pb7aEhbbBqjG/La5IXisVQfV8IbN+avjTNcOofgSt
         GD3U9NBl4MKePyvThFjpWsQCU4+BlaRsFWSDMNZ0uPcUcmowOURm6g++5TqcP6LSLzqN
         xoxNfQb7RiS5ie21dkDw8uv7kvZPfqk5zWLd//MpMYXdJ0nL8aI3WpDUMv20I3BpOmct
         wTeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745849432; x=1746454232;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GEvTqKjHd/gxofN54tYASAmooBFL0e/b3JPxl2GoRUQ=;
        b=DLvcaKCwj1z4Ce/IQo3mAcejdSCcDd9GwI6kBfN/6v0X652QY/FVhftuBZxBzv1vTL
         dLeABjOnFb/0wEsFrp5leqFMpEh7ncjI/ZM5FrQpC4rMRnes5pRTFg4R1sBK2RWpsejd
         ZRcMFIzzQsi52wNaDDsBb97CI6tVxvsQQ57QRT8jKt1c+1FccmAoPkqpe1ZWrIh74dv1
         rxbM2N+QXtTvvFAmEbmF3SIgavoqZC2wZr/JheBe+g3L6VmawddXRgQAdpYNq/pTN5St
         gHKoFV5ffehE8IpRMpIJXLkcixe0+P4khOBlHh+/0RWLCp7Vp6FB8dXFsUGFjSbAhEUB
         RAzg==
X-Forwarded-Encrypted: i=1; AJvYcCXGPHO4jx9ff4xTt34xgrWaEAI4M09ebrJTzbOBxgBR2+E/Efm/LeKSAl8piVV73v3q7p/LqzScyjwa4GklwEcC@lists.infradead.org
X-Gm-Message-State: AOJu0YzFkeb6kWIkp0nYZ5ZpurPId/9GztEy7Dkiu+TubrrGYkM/mju0
	ZFvkqogcfzvDdNS1v5fhCPEQklStulsSFC0zIi0j9IhmDc2v3nOFDL3/ZUSs5lU=
X-Gm-Gg: ASbGncvuNwrcHE6fNwkxxzx/EtIn/xyzk1rG+TKSB+c0nrQudBLiyRcO9bOwlQYjyry
	a7y0FqXomH9ogFtIAIzgQZ9LQ09UIBDAbp4HWt83914mEuPQOsQokiLfpZw2hAeL+TsD/Plznvd
	QoMOGD+BcxP+3OAUbPAk9pteJ9vT8R/Lu87YptkIpn1s1hzX+ihB5qmz6hcbKGyA8BlsgOPY/mP
	NIq0946p1QUn7WWd+3bH38KGS36gbRgTRtjDfHdlY9wHeWPvdhHXnK74y6QEiXoxEBj6wKKnhh4
	3Kf72on4YSXMryvoO9ieztNVe6X3hcAkAhwQnwE=
X-Google-Smtp-Source: AGHT+IFPQFBivSHKCoihIOXfE6lIJJ5LhZaUT+yQbp62PbM2nBEezYpi5ZMGrhr3CBfTWdfDJQ3wig==
X-Received: by 2002:a05:6a00:2382:b0:730:99cb:7c2f with SMTP id d2e1a72fcca58-73fd6fdd3aemr14893591b3a.6.1745849431973;
        Mon, 28 Apr 2025 07:10:31 -0700 (PDT)
Received: from hiago-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e2593f621sm8002237b3a.39.2025.04.28.07.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 07:10:31 -0700 (PDT)
Date: Mon, 28 Apr 2025 11:10:26 -0300
From: Hiago De Franco <hiagofranco@gmail.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, daniel.baluta@nxp.com,
	iuliana.prodan@oss.nxp.com, linux-remoteproc@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Hiago De Franco <hiago.franco@toradex.com>
Subject: Re: [PATCH] remoteproc: imx_rproc: replace devm_clk_get() with
 devm_clk_get_optional()
Message-ID: <20250428141026.pvbk5qrgflv4wkak@hiago-nb>
References: <20250423155131.101473-1-hiagofranco@gmail.com>
 <aAkf6bxBLjgFjvIZ@p14s>
 <20250423192156.b44wobzcgwgojzk3@hiago-nb>
 <20250426134958.GB13806@nxa18884-linux>
 <CANLsYkzLZKHpwv+Zz7YqtU4NCy7ZmapuzpgtfxsRfoV=Ve8rVg@mail.gmail.com>
 <20250427020825.GC13806@nxa18884-linux>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250427020825.GC13806@nxa18884-linux>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_071033_508739_F6B4549D 
X-CRM114-Status: GOOD (  55.31  )
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

On Sun, Apr 27, 2025 at 10:08:25AM +0800, Peng Fan wrote:
> On Sat, Apr 26, 2025 at 03:47:50PM -0600, Mathieu Poirier wrote:
> >On Sat, 26 Apr 2025 at 06:41, Peng Fan <peng.fan@oss.nxp.com> wrote:
> >>
> >> On Wed, Apr 23, 2025 at 04:21:56PM -0300, Hiago De Franco wrote:
> >> >Hi Mathieu,
> >> >
> >> >On Wed, Apr 23, 2025 at 11:14:17AM -0600, Mathieu Poirier wrote:
> >> >> Good morning,
> >> >>
> >> >> On Wed, Apr 23, 2025 at 12:51:31PM -0300, Hiago De Franco wrote:
> >> >> > From: Hiago De Franco <hiago.franco@toradex.com>
> >> >> >
> >> >> > The "clocks" device tree property is not mandatory, and if not provided
> >> >> > Linux will shut down the remote processor power domain during boot if it
> >> >> > is not present, even if it is running (e.g. it was started by U-Boot's
> >> >> > bootaux command).
> >> >>
> >> >> If a clock is not present imx_rproc_probe() will fail, the clock will remain
> >> >> unused and Linux will switch it off.  I think that is description of what is
> >> >> happening.
> >> >>
> >> >> >
> >> >> > Use the optional devm_clk_get instead.
> >> >> >
> >> >> > Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> >> >> > ---
> >> >> >  drivers/remoteproc/imx_rproc.c | 2 +-
> >> >> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >> >> >
> >> >> > diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> >> >> > index 74299af1d7f1..45b5b23980ec 100644
> >> >> > --- a/drivers/remoteproc/imx_rproc.c
> >> >> > +++ b/drivers/remoteproc/imx_rproc.c
> >> >> > @@ -1033,7 +1033,7 @@ static int imx_rproc_clk_enable(struct imx_rproc *priv)
> >> >> >    if (dcfg->method == IMX_RPROC_NONE)
> >> >> >            return 0;
> >> >> >
> >> >> > -  priv->clk = devm_clk_get(dev, NULL);
> >> >> > +  priv->clk = devm_clk_get_optional(dev, NULL);
> >> >>
> >> >> If my understanding of the problem is correct (see above), I think the real fix
> >> >> for this is to make the "clocks" property mandatory in the bindings.
> >> >
> >> >Thanks for the information, from my understanding this was coming from
> >> >the power domain, I had a small discussion about this with Peng [1],
> >> >where I was able to bisect the issue into a scu-pd commit. But I see
> >> >your point for this commit, I can update the commit description.
> >> >
> >> >About the change itself, I was not able to find a defined clock to use
> >> >into the device tree node for the i.MX8QXP/DX, maybe I am missing
> >> >something? I saw some downstream device trees from NXP using a dummy
> >> >clock, which I tested and it works, however this would not be the
> >> >correct solution.
> >>
> >> The clock should be "clocks = <&clk IMX_SC_R_M4_0_PID0 IMX_SC_PM_CLK_CPU>;" for
> >> i.MX8QX. This should be added into device tree to reflect the hardware truth.
> >>
> >> But there are several working configurations regarding M4 on i.MX8QM/QX/DX/DXL.
> >>
> >> 1. M4 in a separate SCFW partition, linux has no permission to configure
> >>   anything except building rpmsg connection.
> >> 2. M4 in same SCFW partition with Linux, Linux has permission to start/stop M4
> >>    In this scenario, there are two more items:
> >>    -(2.1) M4 is started by bootloader
> >>    -(2.2) M4 is started by Linux remoteproc.
> >>
> >>
> >> Current imx_rproc.c only supports 1 and 2.2,
> >> Your case is 2.1.
> >
> >Remoteproc operations .attach() and .detach() are implemented in
> >imx_rproc.c and as such, 2.1 _is_ supported.
> 
> For i.MX8QM/QXP/DX/DXL, attach/detach is for case 1.
> 
> To support case 2.1, more code needs to be added in imx_rproc_detect_mode,
> 
> Something as below(no test, no build, just write example):
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 09d02f7d9e42..eeb1cd19314c 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -1019,6 +1019,9 @@ static int imx_rproc_detect_mode(struct imx_rproc *priv)
>                         if (of_property_read_u32(dev->of_node, "fsl,entry-address", &priv->entry))
>                                 return -EINVAL;
> 
> +                       if (imx_sc_cpu_is_started(M4X))
> +                               priv->rproc->state = RPROC_DETACHED;
> +
>                         return imx_rproc_attach_pd(priv);
>                 }
> 
> 
> When we let uboot to start M4(case 1), we(NXP) only wanna to add some test
> code in U-Boot. Not intended to make it for remoteproc
> 
> But if there are users wanna case 1 in their product, we could support it,
> 1. adding cpu state detection in drivers/firmware/imx/
> 2. Use the cpu state API in imx_rproc.c to detect cpu is started by bootloader
>    when the cpu is owned by linux.

Thanks for the information Peng. I think the way forward is clear now, I
will prepare the patches to address the 2.1 use case (bootaux).

> 
> >
> >>
> >> There is a clk_prepare_enable which not work for case 1 if adding a real
> >> clock entry.
> >>
> >> So need move clk_prepare_enable to imx_rproc_start, not leaving it in probe?`
> >> But for case 2.1, without clk_prepare_enable, kernel clk disable unused will
> >> turn off the clk and hang M4. But even leaving clk_prepare_enable in probe,
> >> if imx_rproc.c is built as module, clk_disable_unused will still turn
> >> off the clk and hang M4.
> >>
> >> So for case 2.1, there is no good way to keep M4 clk not being turned off,
> >> unless pass "clk_ignore_unused" in bootargs.
> >>
> >
> >Isn't there something like an "always on" property for clocks?
> 
> There is CLK_IS_CRITICAL flag that could be added in clk driver, but this
> is harcoded in clk driver. Using this flag means for case 2.2, there is no
> chance to disable the clock when stop M4.
> 
> There is no device tree property to indicate a clk is always on as I know.
> 
> Regards,
> Peng
> >
> >>
> >> For case 2.2, you could use the clock entry to enable the clock, but actually
> >> SCFW will handle the clock automatically when power on M4.
> >>
> >> If you have concern on the clk here, you may considering the various cases
> >> and choose which to touch the clk, which to ignore the clk, but not
> >> "clk get and clk prepare" for all cases in current imx_rproc.c implementation.
> >>
> >> Regards,
> >> Peng
> >>
> >>
> >> >
> >> >[1] https://lore.kernel.org/lkml/20250404141713.ac2ntcsjsf7epdfa@hiago-nb/
> >> >
> >> >Cheers,
> >> >Hiago.
> >> >
> >> >>
> >> >> Daniel and Iuliana, I'd like to have your opinions on this.
> >> >>
> >> >> Thanks,
> >> >> Mathieu
> >> >>
> >> >> >    if (IS_ERR(priv->clk)) {
> >> >> >            dev_err(dev, "Failed to get clock\n");
> >> >> >            return PTR_ERR(priv->clk);
> >> >> > --
> >> >> > 2.39.5
> >> >> >

Cheers,
Hiago.

