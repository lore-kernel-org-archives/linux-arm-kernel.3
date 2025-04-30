Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C241C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 17:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2nhmZSwtgikjWBSYNUyofWdCpk4ZqQ2gv/cEQTRW/cY=; b=IHbq0t/Wdskbn7izCbKwPCEBjI
	IDQiwSNWsL/Gvq2/+edB+EpuMq3S0dl+LeMNGE5fjejW8zJ22WFrdgdiZkEBLsgMBpCwkXodRoCEK
	n6MvN559esPt1b5OFUpxhmoZEvOjxdCse2ERhsBX/1Csyccjgnx3EmJgECZGfC63AOXJ5h4mS64Hk
	2m2To5E6EyehVbt0803DBKq4Nwit4Ujz6xjWXqKmMRR4rfL/scu0P5JUZD9zzYwdmFBLlyui20Vrm
	xQNXVRkDz7lRqPmOANjm3uMEJZl3NEnYzvUp+FwPvMO8Ir5VCzJrWilU2kYnpLrv7927T0ROxlGDT
	HH84Q04w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uABe0-0000000Dbud-2gw1;
	Wed, 30 Apr 2025 17:54:52 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uABc3-0000000DbaF-3FNP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 17:52:53 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-736a72220edso222489b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Apr 2025 10:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746035570; x=1746640370; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2nhmZSwtgikjWBSYNUyofWdCpk4ZqQ2gv/cEQTRW/cY=;
        b=m4k89iZjjEZUX5od95CUDQKNRg3DCGjMepPzn0qUI20AMtkwVW7xTary0r1orJyedH
         D1Rdx5lFNRSoK//dxuyDhFHx9UoPYoeBiq3WVFmavUZUp0AjcuVa+1ihxlTp5UZ7nr/7
         xrPtLu6cZu9nkmk8Z7nJnO1OUm3/LTd7uxkrH5V10+M0GdGtxFP5DRzpXMl/mDuTf6mV
         EJ1nd6iMNDhgUoN0x55+RrOPJqLH+ZnjkpbfA9TBSMUpMdkEGIeSJLi+CsOMEWDHCC8o
         JFn4QxhJLBUrs15m+N7yPQv4kQUpYm7T6Et5QbtXKzyU1TmTMJ9CU4OJLi9PTJmSsWiE
         ed7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746035570; x=1746640370;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2nhmZSwtgikjWBSYNUyofWdCpk4ZqQ2gv/cEQTRW/cY=;
        b=iI9DZpegl4jCsEkRaNEcmkyfrytERcD+u2+EYn0XQaTWoxllXiNYFEP9TF0cHSNhhV
         wGzVIrt5HIYVHXcFqUb2K+CWZoRo31pT/4I3EeTCw2VQpJdAkMpePQEK42p3VGP8IM65
         Qo22XzDy7eSm2PyN8KvD8n5WdRRU4/Yn4LDSTMivcrrZVklFzxHWewCYb8n8d8w0E7lz
         AyCTIrlurifAFIuHWJgFdFE0yHPxekUdcFsDw7UG1OGaAwParOpLVADZgqOIQ2xWOd8J
         0hs/UWxwZX7TQSPPbk6fMhJYZD2sOlYyAbALaQyITlOp6bofWrLm3gK9z5H9QW3JRnkg
         5+WA==
X-Forwarded-Encrypted: i=1; AJvYcCUS8gNqGY5XXTVqcE9Ia6rz8lQ3VyYHs8jd2tLcGCHe3GABe78eUYITFvKpXkWizE906bvCtYTLwjr43Jm5Vf/O@lists.infradead.org
X-Gm-Message-State: AOJu0Yxo7PaRt5qibrmzJWko+yu099g/9U+GwznOsUMTlBhbhOdXhnDC
	Kxn5CH8GrH/+8UFiCh6xecXFUVHyuHgJONsjNLhHXGAttfHfZa+U
X-Gm-Gg: ASbGnctwn4lZZUk4bKTzCd3FeN08oDY53QqIE19dF0pa2oDlqMlMUBHV5rLRQNT93ZC
	Q7vBQbY8tV7excASawxJEpJOeanyJP8h4c3bQWtoM2UF+gQhXRklbPXhDX+00PRFUbYsWrwOF7c
	1msKQ5MGUL/Gcgw+AQztizwlQnrDz4XioeID0CuLNvU4+bZ+7hc9Z1M8HWgicKuHAi+Ff6UPv8p
	Qf7Baqa3ykHVHokFbPKF9WCCT7++biowNTMkDAxf0FqD5/PkOp4tqC527yZvq7XUIwfeSlin2aa
	MABQQXOkg0aoixzOw+ziTb5Qz/y+nWYbLOdYMwc=
X-Google-Smtp-Source: AGHT+IHSsmjIHujeop0GPrFKZEE8a20ERgK4zOqvjWbsrPxVz4likdeGOhNqZUGu8tAYNJ9jJV6fcQ==
X-Received: by 2002:a05:6a00:4b06:b0:736:eb7e:df39 with SMTP id d2e1a72fcca58-74038ac9bd3mr7160058b3a.24.1746035570279;
        Wed, 30 Apr 2025 10:52:50 -0700 (PDT)
Received: from hiago-nb ([2804:1b3:a7c0:d901:78f8:210a:bdd7:104])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74039a60081sm2008732b3a.139.2025.04.30.10.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 10:52:49 -0700 (PDT)
Date: Wed, 30 Apr 2025 14:52:43 -0300
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
Message-ID: <20250430175243.mszwmrd4iefjjs67@hiago-nb>
References: <20250423155131.101473-1-hiagofranco@gmail.com>
 <aAkf6bxBLjgFjvIZ@p14s>
 <20250423192156.b44wobzcgwgojzk3@hiago-nb>
 <20250426134958.GB13806@nxa18884-linux>
 <20250428171257.276bqhaupe4ksu5l@hiago-nb>
 <20250430060835.GA31028@nxa18884-linux>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430060835.GA31028@nxa18884-linux>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_105251_818069_18C7FD6B 
X-CRM114-Status: GOOD (  55.90  )
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

On Wed, Apr 30, 2025 at 02:08:35PM +0800, Peng Fan wrote:
> On Mon, Apr 28, 2025 at 02:12:57PM -0300, Hiago De Franco wrote:
> >On Sat, Apr 26, 2025 at 09:49:58PM +0800, Peng Fan wrote:
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
> >> >> >  	if (dcfg->method == IMX_RPROC_NONE)
> >> >> >  		return 0;
> >> >> >  
> >> >> > -	priv->clk = devm_clk_get(dev, NULL);
> >> >> > +	priv->clk = devm_clk_get_optional(dev, NULL);
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
> >
> >Is this correct? I added this clock entry and also updated the clk
> >drivers to handle this option:
> >
> >diff --git a/drivers/clk/imx/clk-imx8qxp-rsrc.c b/drivers/clk/imx/clk-imx8qxp-rsrc.c
> >index 585c425524a4..69c6f1711667 100644
> >--- a/drivers/clk/imx/clk-imx8qxp-rsrc.c
> >+++ b/drivers/clk/imx/clk-imx8qxp-rsrc.c
> >@@ -58,6 +58,7 @@ static const u32 imx8qxp_clk_scu_rsrc_table[] = {
> >        IMX_SC_R_NAND,
> >        IMX_SC_R_LVDS_0,
> >        IMX_SC_R_LVDS_1,
> >+       IMX_SC_R_M4_0_PID0,
> >        IMX_SC_R_M4_0_UART,
> >        IMX_SC_R_M4_0_I2C,
> >        IMX_SC_R_ELCDIF_PLL,
> >diff --git a/drivers/clk/imx/clk-imx8qxp.c b/drivers/clk/imx/clk-imx8qxp.c
> >index 3ae162625bb1..be6dfe0a5b97 100644
> >--- a/drivers/clk/imx/clk-imx8qxp.c
> >+++ b/drivers/clk/imx/clk-imx8qxp.c
> >@@ -142,6 +142,7 @@ static int imx8qxp_clk_probe(struct platform_device *pdev)
> >        imx_clk_scu("a35_clk", IMX_SC_R_A35, IMX_SC_PM_CLK_CPU);
> >        imx_clk_scu("a53_clk", IMX_SC_R_A53, IMX_SC_PM_CLK_CPU);
> >        imx_clk_scu("a72_clk", IMX_SC_R_A72, IMX_SC_PM_CLK_CPU);
> >+       imx_clk_scu("cm40_clk", IMX_SC_R_M4_0_PID0, IMX_SC_PM_CLK_CPU);
> >
> >        /* LSIO SS */
> >        imx_clk_scu("pwm0_clk", IMX_SC_R_PWM_0, IMX_SC_PM_CLK_PER);
> >
> >
> >However I am seeing a permission denied (-13) from the imx_rproc:
> >
> >root@colibri-imx8x-07308754:~# dmesg | grep rproc
> >[    0.489113] imx-rproc imx8x-cm4: Failed to enable clock
> >[    0.489644] imx-rproc imx8x-cm4: probe with driver imx-rproc failed with error -13
> >[    0.489708] remoteproc remoteproc0: releasing imx-rproc
> >
> >	imx8x-cm4 {
> >		compatible = "fsl,imx8qxp-cm4";
> >		clocks = <&clk IMX_SC_R_M4_0_PID0 IMX_SC_PM_CLK_CPU>;
> 
> From hardware perspective, this is correct. But i.MX8QXP has
> SCFW which manages the system resources. For this clock, when
> M4_0_PID0 is powered up, SCFW will not allow clk_prepare_enable to
> enable the clock, the error return will be LOCKED if user continue
> to send the enable request. When SCFW powers up M4, it will automatically
> configure the clock as I said before.
> 
> Set rate is still allowed by SCFW, even enable API return failure, but I think
> there is no such requirement.
> 
> So,
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 74299af1d7f1..627e57a88db2 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -1029,8 +1029,8 @@ static int imx_rproc_clk_enable(struct imx_rproc *priv)
>         struct device *dev = priv->dev;
>         int ret;
> 
> -       /* Remote core is not under control of Linux */
> -       if (dcfg->method == IMX_RPROC_NONE)
> +       /* Remote core is not under control of Linux or it is managed by SCU API */
> +       if (dcfg->method == IMX_RPROC_NONE || dcfg->method == IMX_RPROC_SCU_API)
>                 return 0;
> 
>         priv->clk = devm_clk_get(dev, NULL);

Got it, thanks for the information. I will prepare the V2 with this
change.

> 
> 
> 
> Regards,
> Peng
> 
> >		mbox-names = "tx", "rx", "rxdb";
> >		mboxes = <&lsio_mu5 0 1
> >			  &lsio_mu5 1 1
> >			  &lsio_mu5 3 1>;
> >		memory-region = <&vdev0buffer>, <&vdev0vring0>, <&vdev0vring1>,
> >				<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>;
> >		power-domains = <&pd IMX_SC_R_M4_0_PID0>,
> >				<&pd IMX_SC_R_M4_0_MU_1A>;
> >		fsl,entry-address = <0x34fe0000>;
> >		fsl,resource-id = <IMX_SC_R_M4_0_PID0>;
> >	};
> >
> >Am I missing something?
> >
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
> >> 
> >> There is a clk_prepare_enable which not work for case 1 if adding a real
> >> clock entry.
> >> 
> >> So need move clk_prepare_enable to imx_rproc_start, not leaving it in probe?
> >> But for case 2.1, without clk_prepare_enable, kernel clk disable unused will
> >> turn off the clk and hang M4. But even leaving clk_prepare_enable in probe,
> >> if imx_rproc.c is built as module, clk_disable_unused will still turn
> >> off the clk and hang M4.
> >> 
> >> So for case 2.1, there is no good way to keep M4 clk not being turned off,
> >> unless pass "clk_ignore_unused" in bootargs.
> >> 
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
> >> >> >  	if (IS_ERR(priv->clk)) {
> >> >> >  		dev_err(dev, "Failed to get clock\n");
> >> >> >  		return PTR_ERR(priv->clk);
> >> >> > -- 
> >> >> > 2.39.5
> >> >> > 

Cheers,
Hiago.

