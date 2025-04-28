Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BE90C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 17:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0aWcmtL95uQeYsQHUGFsCmGq4ARE/rjVxbyBKZAibqk=; b=hHHCXPaKk+z61OXq+KSnR+0rey
	28nR11Wrn1sbenTYIPujsIGQ04K5Xg/n24WkK8PyhCyzze/KFhfnZWexBEZGZ5r0A7WWsXk551yLW
	FaEWvkfdpHxmoPkHLWpQhcp3PMLCmXVpAQHwm4TBTG4clx1dG6ZLimTga1VMvfN8toS1kE5g/lqa+
	7AunQ1o2iVBENG+podRNW2YWk+MirX2OWPYUFBL9WW51f0Q0MM0nIU8I2Vgl9G2VFsp4++SGZfCd3
	ixY5cEn5lMlt8lVl7Fw+In9oJVU26x63c28ETH4k1MZN7Fhz/gmrjOdyckvLyaZFn9Il+HigUcOV1
	MCCPQhQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9SMn-000000076Uj-1lXz;
	Mon, 28 Apr 2025 17:34:05 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9S2S-000000073ea-3lX1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 17:13:06 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-30863b48553so5670290a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 10:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745860384; x=1746465184; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0aWcmtL95uQeYsQHUGFsCmGq4ARE/rjVxbyBKZAibqk=;
        b=LO8/E/3kvzT8zcHA45DDX1afbT1vbhr0XdGCUMmFqZm3WhyxSk6c0u1xJ3YYqNNin8
         Pg/DLCNqMyPzc/yBEAuju26TFhqsRID/qQT104mLYnFn/N54TlsAcLiKhV1kd7gecbJt
         gXk3LpMBhcweVQQjAdETmCWMBx+aa7P6EFzH7Lx/hoETt18U+0bCqjAS7hxqWaBWj9GJ
         VyKMMiqu+luj1sJl+MdjebKTnftxkrAk2iulU86WSSukxomSh871EknSg4K2XymK/Nar
         hTYmlcH+xuEZEzVq6tqeX8xUeLcPwVjG44Qau+Ljtn0kZF/dbDXpa7ID2ztn+fbBwzi/
         9UhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745860384; x=1746465184;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0aWcmtL95uQeYsQHUGFsCmGq4ARE/rjVxbyBKZAibqk=;
        b=gdNd8FO+2PjmIF9qcJFBkQw4k6vPXN2Fztd+drDryGExo034NLn+OuFcjpBtBjhowD
         ZNEa5RY5TzeflfV/hCuVPCNh20J6S/j3AlnN8IWw5GrnphP1LYeRv5nh3hszAFKwiKDS
         M8NZuUN0wbrOkhZCDS7f6p8vOIU6/2JLaxA+OlJ6Z6XUGGVedcIRU0DxAiKkmJoDBu1z
         MHlkFFKGz3XyuV+qZC5tXHV/s2iQVpsfoOJ3p+AXAIDzF2ncXkLrKA1ns3tkKSjk9hBY
         7ooyenaa+BdWFtZuy+Btk8yaTRWT3mdarcUpgpQEonGjBjvW9NJUXxn8XYM7e4aEm6qW
         LGkg==
X-Forwarded-Encrypted: i=1; AJvYcCVNeTbDYB2B7TQIOYNrFRNqmZfnnCBXk+xKkTBNZ3uMb9rSzSLF2aj+GBj4YtG7mzYhwDEYd/k6Oa7fWUL8mzGd@lists.infradead.org
X-Gm-Message-State: AOJu0YwKbbbhoBDhX9GftTa89BoqxbdExJn+IPms1Z0vLq00g6s4OTqi
	RoDOg3TwZ4tt8OX95ZCtQRp/ZS4YPsuvjRupbSHob9lEFxPV+Vve
X-Gm-Gg: ASbGncu3dfDqD76gsbWTQ62LEfgXU4z1mOOkpgVd8BsFruUDCTlG891Er2xoZSppgDR
	Ih9VINbzrRXbGwAcXZ5Zy+Pj1LjIaE+sDErkvy9DOZ5RDdrSyuAFWyUiKSk9kiEsZtrbLWj9qkx
	8tInp59r49uL/mKQcfyUP0Cf6jCR0QFzQTAOS+ZRKXiENPbpXHwur0i5U75qByqNLxJD4/LHU99
	tGHFtV323sGERj+IZA278yQobnzAjTCW7woqtO6aQ/DdnHNfBcx8xcXvZXHjdpVDM0WwYeSGV5h
	V1t5peii4kSgBVgj1mI77tu6HwC3ee2HCgqVQ60=
X-Google-Smtp-Source: AGHT+IHWOIDd9y6vr7huqtxupJfN3hpUaBQLaUlNnozyWv6aH7mSCdhg1ZQngv1XQveJdMkPOacF4g==
X-Received: by 2002:a17:90b:2550:b0:308:2945:3842 with SMTP id 98e67ed59e1d1-309f8a24cc1mr19035414a91.15.1745860383598;
        Mon, 28 Apr 2025 10:13:03 -0700 (PDT)
Received: from hiago-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309ef1475c1sm9321785a91.45.2025.04.28.10.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 10:13:02 -0700 (PDT)
Date: Mon, 28 Apr 2025 14:12:57 -0300
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
Message-ID: <20250428171257.276bqhaupe4ksu5l@hiago-nb>
References: <20250423155131.101473-1-hiagofranco@gmail.com>
 <aAkf6bxBLjgFjvIZ@p14s>
 <20250423192156.b44wobzcgwgojzk3@hiago-nb>
 <20250426134958.GB13806@nxa18884-linux>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250426134958.GB13806@nxa18884-linux>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_101304_945578_79F0AF9A 
X-CRM114-Status: GOOD (  50.62  )
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

On Sat, Apr 26, 2025 at 09:49:58PM +0800, Peng Fan wrote:
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
> >> >  	if (dcfg->method == IMX_RPROC_NONE)
> >> >  		return 0;
> >> >  
> >> > -	priv->clk = devm_clk_get(dev, NULL);
> >> > +	priv->clk = devm_clk_get_optional(dev, NULL);
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

Is this correct? I added this clock entry and also updated the clk
drivers to handle this option:

diff --git a/drivers/clk/imx/clk-imx8qxp-rsrc.c b/drivers/clk/imx/clk-imx8qxp-rsrc.c
index 585c425524a4..69c6f1711667 100644
--- a/drivers/clk/imx/clk-imx8qxp-rsrc.c
+++ b/drivers/clk/imx/clk-imx8qxp-rsrc.c
@@ -58,6 +58,7 @@ static const u32 imx8qxp_clk_scu_rsrc_table[] = {
        IMX_SC_R_NAND,
        IMX_SC_R_LVDS_0,
        IMX_SC_R_LVDS_1,
+       IMX_SC_R_M4_0_PID0,
        IMX_SC_R_M4_0_UART,
        IMX_SC_R_M4_0_I2C,
        IMX_SC_R_ELCDIF_PLL,
diff --git a/drivers/clk/imx/clk-imx8qxp.c b/drivers/clk/imx/clk-imx8qxp.c
index 3ae162625bb1..be6dfe0a5b97 100644
--- a/drivers/clk/imx/clk-imx8qxp.c
+++ b/drivers/clk/imx/clk-imx8qxp.c
@@ -142,6 +142,7 @@ static int imx8qxp_clk_probe(struct platform_device *pdev)
        imx_clk_scu("a35_clk", IMX_SC_R_A35, IMX_SC_PM_CLK_CPU);
        imx_clk_scu("a53_clk", IMX_SC_R_A53, IMX_SC_PM_CLK_CPU);
        imx_clk_scu("a72_clk", IMX_SC_R_A72, IMX_SC_PM_CLK_CPU);
+       imx_clk_scu("cm40_clk", IMX_SC_R_M4_0_PID0, IMX_SC_PM_CLK_CPU);

        /* LSIO SS */
        imx_clk_scu("pwm0_clk", IMX_SC_R_PWM_0, IMX_SC_PM_CLK_PER);


However I am seeing a permission denied (-13) from the imx_rproc:

root@colibri-imx8x-07308754:~# dmesg | grep rproc
[    0.489113] imx-rproc imx8x-cm4: Failed to enable clock
[    0.489644] imx-rproc imx8x-cm4: probe with driver imx-rproc failed with error -13
[    0.489708] remoteproc remoteproc0: releasing imx-rproc

	imx8x-cm4 {
		compatible = "fsl,imx8qxp-cm4";
		clocks = <&clk IMX_SC_R_M4_0_PID0 IMX_SC_PM_CLK_CPU>;
		mbox-names = "tx", "rx", "rxdb";
		mboxes = <&lsio_mu5 0 1
			  &lsio_mu5 1 1
			  &lsio_mu5 3 1>;
		memory-region = <&vdev0buffer>, <&vdev0vring0>, <&vdev0vring1>,
				<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>;
		power-domains = <&pd IMX_SC_R_M4_0_PID0>,
				<&pd IMX_SC_R_M4_0_MU_1A>;
		fsl,entry-address = <0x34fe0000>;
		fsl,resource-id = <IMX_SC_R_M4_0_PID0>;
	};

Am I missing something?

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
> 
> There is a clk_prepare_enable which not work for case 1 if adding a real
> clock entry.
> 
> So need move clk_prepare_enable to imx_rproc_start, not leaving it in probe?
> But for case 2.1, without clk_prepare_enable, kernel clk disable unused will
> turn off the clk and hang M4. But even leaving clk_prepare_enable in probe,
> if imx_rproc.c is built as module, clk_disable_unused will still turn
> off the clk and hang M4.
> 
> So for case 2.1, there is no good way to keep M4 clk not being turned off,
> unless pass "clk_ignore_unused" in bootargs.
> 
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
> >> >  	if (IS_ERR(priv->clk)) {
> >> >  		dev_err(dev, "Failed to get clock\n");
> >> >  		return PTR_ERR(priv->clk);
> >> > -- 
> >> > 2.39.5
> >> > 

