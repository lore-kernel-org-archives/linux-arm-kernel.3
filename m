Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8494EC369D3
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Apr 2025 23:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NkBG4q84aKP7XuricBxZ0SqZkCQnMNoFILLSDq32ATA=; b=iKqb/oN0j4O3ul8G1z8Edg5+d5
	JnEn6j++laQCu6rpnnLIP7EPZ0gwVNffX76wIPT6x1dOaGMnQO4AkmRVakOe4sfhHt3lzlEtTcSNg
	voyPZLPeHMCiIcP2P3wH97QvYuGKsxuNze+s3kyWDlESpP3WmN5AYYVQFftUCXNACusLs+a//ooa5
	dMfnTZR6KnR/6ZNQrtXXkIT9g4oq0fsiiN5N+1Z/7hfl+OgStqhYCRw7VUyUy1g9a1Didv0G/WATo
	yV6j6AmbQLI+Sq4YsOx6cZartgkvdw101m2wbrkc7/tRKCI0jjPBgDZBozuD+lnR4gGUh9s+pqWXE
	5niXyKdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8ocX-00000002bt5-2VSt;
	Sat, 26 Apr 2025 23:07:41 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8nNT-00000002Xcs-38FF
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Apr 2025 21:48:05 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-5eb92df4fcbso6640102a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 26 Apr 2025 14:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745704081; x=1746308881; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NkBG4q84aKP7XuricBxZ0SqZkCQnMNoFILLSDq32ATA=;
        b=tgBbnehg2fxUScmV31/VF7aFENbwiY2XhDzuAHmNg6TEy3EhIrQ7mH5JTtS3Etk4Sr
         yKNTsVmET0irpE7AUzwnj+C3vDSR/S7adCZCSzE7Io9+ch4aEmu9BTDqXVq8M0AhkCmR
         AVkBx6Io6ZcM4BtZSrxCUVb3uAiJTtP/VlwannMAhpIhTE+fVuQgmJkLd8mUTa/aEF9b
         zZmMMPyC4cadrsRiDOUJXgkgNgOQh5mHthbfVv0CcM4qvNpeacct6kVDG+MGEKG4U2U5
         fvX5W+gg5mU5I6/STJ5gV56ORWdQDHVWBB5yfDj2117+5lq1aJeMQBmrQc4cTsw5BO93
         lj0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745704081; x=1746308881;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NkBG4q84aKP7XuricBxZ0SqZkCQnMNoFILLSDq32ATA=;
        b=RaXms09B1CBclrU83GTeFZ7wiNVsxHR7RvzGky4w4KQ48BatBaeSTQiQSyAhIPV6w5
         cGHQjTBUO/IvRq0BXlsFvtGH2gFTq23+g8Uf/6ubmk3P2P4pUyDub6lEoQXouDxK32eB
         CJLArfdC6PImVvWv+sWfOOxr31FEo5yApY8eMJPJ9sAGSzFWC/fhmMQA61D0p8V9GxlO
         cUWdMqfKQzUVWRJdxdBJELirOZiQT0ZYxM9voRKDIjXL3LBwpwYO+GcR+ROHjOrZKA7N
         LBGLCW4rOWRxYsIef3MizbztdoHA2+ZHLNoVCfUq2zS1N4I0dGnjkBQ5ArxzN4fCWlpi
         Ho3g==
X-Forwarded-Encrypted: i=1; AJvYcCWnPQxAdiGT7ftdui4zgrxcXqbSLkyq8SjOqqjkAMW+PhWO1AQHB1OLi1E4j1vnpuUadwisOxzsj9S4sgjBI48g@lists.infradead.org
X-Gm-Message-State: AOJu0YzR3eEtnBZKJWPLNad6XWX30s/62hMfzhAGRIXrRzAi7UUOT/yW
	t3ebMIYlOeuneBQYe2+YIK6O92d+mrsMGfFCIWxkKx9UC+p2mVWLPHPRO16v4WWZrXxhChhKvGs
	7arqbncixybMMAMWPQawX9sawXOInS1pmyrDARw==
X-Gm-Gg: ASbGncvObCLxl8WZ5bxR1zS8DK4mB/8gYfW78wYpC6hprbRQ/xhT3gNE2fH21yorzKF
	bvlrKoYvUBbfLGh2uBDxOvazBOKRsfeBhZ40YkxjRsfQS97LEm9L9SZ4xhqB0gvpOxZ+JdiHTe+
	hGDAYVdA450W5HggmPv1nYk6LMNQukjRMk6rc7PYsTUOO8nagfXfAcsn9dLA9HywQPz/c=
X-Google-Smtp-Source: AGHT+IGQG+/iNDNxq2Wojrkp26M1m1o/MKvGupfTVFI6rnZy3H/DlTzVUpcASBLitbwtfzmCUVICXWKVbeUjUf+UKWY=
X-Received: by 2002:a17:907:7ba3:b0:acb:b6c9:90af with SMTP id
 a640c23a62f3a-ace848feea2mr331721366b.16.1745704080990; Sat, 26 Apr 2025
 14:48:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250423155131.101473-1-hiagofranco@gmail.com>
 <aAkf6bxBLjgFjvIZ@p14s> <20250423192156.b44wobzcgwgojzk3@hiago-nb> <20250426134958.GB13806@nxa18884-linux>
In-Reply-To: <20250426134958.GB13806@nxa18884-linux>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Sat, 26 Apr 2025 15:47:50 -0600
X-Gm-Features: ATxdqUEjP3yZ0cE-UqcG-bjotjV4NxJHuMem2scnUTZE4sa3KXJBizNJEQMu5o8
Message-ID: <CANLsYkzLZKHpwv+Zz7YqtU4NCy7ZmapuzpgtfxsRfoV=Ve8rVg@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: imx_rproc: replace devm_clk_get() with devm_clk_get_optional()
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Hiago De Franco <hiagofranco@gmail.com>, daniel.baluta@nxp.com, 
	iuliana.prodan@oss.nxp.com, linux-remoteproc@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Hiago De Franco <hiago.franco@toradex.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250426_144803_799565_12E488E8 
X-CRM114-Status: GOOD (  45.95  )
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

On Sat, 26 Apr 2025 at 06:41, Peng Fan <peng.fan@oss.nxp.com> wrote:
>
> On Wed, Apr 23, 2025 at 04:21:56PM -0300, Hiago De Franco wrote:
> >Hi Mathieu,
> >
> >On Wed, Apr 23, 2025 at 11:14:17AM -0600, Mathieu Poirier wrote:
> >> Good morning,
> >>
> >> On Wed, Apr 23, 2025 at 12:51:31PM -0300, Hiago De Franco wrote:
> >> > From: Hiago De Franco <hiago.franco@toradex.com>
> >> >
> >> > The "clocks" device tree property is not mandatory, and if not provided
> >> > Linux will shut down the remote processor power domain during boot if it
> >> > is not present, even if it is running (e.g. it was started by U-Boot's
> >> > bootaux command).
> >>
> >> If a clock is not present imx_rproc_probe() will fail, the clock will remain
> >> unused and Linux will switch it off.  I think that is description of what is
> >> happening.
> >>
> >> >
> >> > Use the optional devm_clk_get instead.
> >> >
> >> > Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> >> > ---
> >> >  drivers/remoteproc/imx_rproc.c | 2 +-
> >> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >> >
> >> > diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> >> > index 74299af1d7f1..45b5b23980ec 100644
> >> > --- a/drivers/remoteproc/imx_rproc.c
> >> > +++ b/drivers/remoteproc/imx_rproc.c
> >> > @@ -1033,7 +1033,7 @@ static int imx_rproc_clk_enable(struct imx_rproc *priv)
> >> >    if (dcfg->method == IMX_RPROC_NONE)
> >> >            return 0;
> >> >
> >> > -  priv->clk = devm_clk_get(dev, NULL);
> >> > +  priv->clk = devm_clk_get_optional(dev, NULL);
> >>
> >> If my understanding of the problem is correct (see above), I think the real fix
> >> for this is to make the "clocks" property mandatory in the bindings.
> >
> >Thanks for the information, from my understanding this was coming from
> >the power domain, I had a small discussion about this with Peng [1],
> >where I was able to bisect the issue into a scu-pd commit. But I see
> >your point for this commit, I can update the commit description.
> >
> >About the change itself, I was not able to find a defined clock to use
> >into the device tree node for the i.MX8QXP/DX, maybe I am missing
> >something? I saw some downstream device trees from NXP using a dummy
> >clock, which I tested and it works, however this would not be the
> >correct solution.
>
> The clock should be "clocks = <&clk IMX_SC_R_M4_0_PID0 IMX_SC_PM_CLK_CPU>;" for
> i.MX8QX. This should be added into device tree to reflect the hardware truth.
>
> But there are several working configurations regarding M4 on i.MX8QM/QX/DX/DXL.
>
> 1. M4 in a separate SCFW partition, linux has no permission to configure
>   anything except building rpmsg connection.
> 2. M4 in same SCFW partition with Linux, Linux has permission to start/stop M4
>    In this scenario, there are two more items:
>    -(2.1) M4 is started by bootloader
>    -(2.2) M4 is started by Linux remoteproc.
>
>
> Current imx_rproc.c only supports 1 and 2.2,
> Your case is 2.1.

Remoteproc operations .attach() and .detach() are implemented in
imx_rproc.c and as such, 2.1 _is_ supported.

>
> There is a clk_prepare_enable which not work for case 1 if adding a real
> clock entry.
>
> So need move clk_prepare_enable to imx_rproc_start, not leaving it in probe?`
> But for case 2.1, without clk_prepare_enable, kernel clk disable unused will
> turn off the clk and hang M4. But even leaving clk_prepare_enable in probe,
> if imx_rproc.c is built as module, clk_disable_unused will still turn
> off the clk and hang M4.
>
> So for case 2.1, there is no good way to keep M4 clk not being turned off,
> unless pass "clk_ignore_unused" in bootargs.
>

Isn't there something like an "always on" property for clocks?

>
> For case 2.2, you could use the clock entry to enable the clock, but actually
> SCFW will handle the clock automatically when power on M4.
>
> If you have concern on the clk here, you may considering the various cases
> and choose which to touch the clk, which to ignore the clk, but not
> "clk get and clk prepare" for all cases in current imx_rproc.c implementation.
>
> Regards,
> Peng
>
>
> >
> >[1] https://lore.kernel.org/lkml/20250404141713.ac2ntcsjsf7epdfa@hiago-nb/
> >
> >Cheers,
> >Hiago.
> >
> >>
> >> Daniel and Iuliana, I'd like to have your opinions on this.
> >>
> >> Thanks,
> >> Mathieu
> >>
> >> >    if (IS_ERR(priv->clk)) {
> >> >            dev_err(dev, "Failed to get clock\n");
> >> >            return PTR_ERR(priv->clk);
> >> > --
> >> > 2.39.5
> >> >

