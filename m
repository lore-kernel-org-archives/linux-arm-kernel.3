Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0D63C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 21:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vBj2/kJjZAc0LTczWIyJjP2mbls9GBj8W8skvT1H2Do=; b=J24EEjMxtmZf+Iu4j0Y0wbKHvh
	yN7EskrXtFavFY5VkVsiH5UEvQvelHmnstSqFcve1cAWhQR/en6aZejKw2M2W6iwoCA4pBxqqSzMu
	LNjrMIBwQTEs3btmtzoxus2fUPTQRtndRgMX6ic+nKW0bsJbCccUaOekYW3ResdCNeX2uvsN1m0+6
	nURSSS1wSjFuc7TvYbz3D1wjR0IuqkTQSHQZ/hihB9AcAW7g/b7Lav59UqHt7DUglVFNhPszD6nVq
	DmP+9QX6aiHVF/JSAVbLO3cKFTpKkhGHUwd71vto6zerObiGvKxkoeiORYUZTmKkzP4A6EYtTsLWq
	vujtSPIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Wxg-0000000EP73-38Nl;
	Thu, 17 Apr 2025 21:39:56 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Wvp-0000000EOra-1Ukg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 21:38:02 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-22423adf751so16575465ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Apr 2025 14:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744925880; x=1745530680; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vBj2/kJjZAc0LTczWIyJjP2mbls9GBj8W8skvT1H2Do=;
        b=ShXglKLGOxCuIET6p+quEOMDUF3bMOQYAKILqftIhpYgsL+75Yld+KmLRJAUSUos0p
         ZdPLwZGA2ZrK7zZ+OJZU5uBVfyi64y334EsFOMobeCfz1mhmpanX8r1uakNoXKAqAzyQ
         17IVSZTypcCAIuPYT1JDXo1nfNG4vA7BgJUkP+JAhYRmkjpXvZxdXbmloj+yR8ykyK0v
         vOP40B9GyZNU+qARicnhvv+fCbpHeMttlYVyWMY+00uWXUNtPSyWGZRKS87wOXGI13DN
         irjN9rIF3vtYNNn1RwySO1RHu7RE4O/qgdkmpxOBP2EoqjBtaq6PcZOeqZqrPnmqeQVq
         pH0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744925880; x=1745530680;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vBj2/kJjZAc0LTczWIyJjP2mbls9GBj8W8skvT1H2Do=;
        b=qh29dN65JsVQy54CITTfr62WIQdM3mFW8CsnMTOR27mYl+W13OlJf1lKtVZp3jOFq4
         L0z/QiUMq514wcG+EhvbWWNRP7uro+JgyN8aw3bHYk6PPfg7GcxBz19FezLieXFDOYr4
         IRf7MVN81lqFlqLBFKVEUVD9qbuSIc8oeDcWQ+lQTG17+tT7mENUxLrcFBI+0HKnLbKJ
         cH1YcyGsiRiqTg1Vpj5Tk7dux4/qvnVuXT+hbbZpZkAugyRzVjSZUezRChwvkSMOHE6h
         mpt0snymr90hxaC7aBhT7R22skXTFq4SMzZliCKK7O5JDXO92bhRIiu1ca/9ow0PbEIY
         odyA==
X-Forwarded-Encrypted: i=1; AJvYcCW4WiJTeVNvjzw3PLFIQegbJnGYXs9kIiXWL8OfsC+NELy9gtKiyA7s06GeLlNiWyH2h0RAvvwt09IQws96viEX@lists.infradead.org
X-Gm-Message-State: AOJu0Yxj2SJfuXxKnvDOeM5OgTCQSRarPsapcsNbpOzn2dRuvd90kXmb
	AwBa6Ky7ZKwJT95N4F2DBwBqE+fglwmofKhouYWvDyMoc+f5TI80
X-Gm-Gg: ASbGnctipA0fHPgEIIpO9JQsxqgIGVTkzK+smH/6aNks+bv19yPg8bmPCzK7SQzt/g5
	NcNB/VcE/rj6cs+OCKD88PGbyR0GBzOzdSDSESy1knf0o3aaFqoT/PjwlFdLWC/9H3RUvcf5X5P
	jcNIuDXNeT3/JJCW0mLf+Gby6uDhhHnRB7whLhsBuUt5ro76nXUtsJoH8aw/qx0z8KuqNqwGrEO
	XNjAxBSybtNfMqMOdj4Vg6Q+bFRy3gbOZ1ee3+bPouQyiIG6110gd2xlLL6bdfutcGUY1ZptmQg
	N14VyiT939/wdYso2dMsZleTMB2W4LWKKAb9RSQY
X-Google-Smtp-Source: AGHT+IEj4cKNj6pZzHTBWAFPlLteT9Jrfl++FjZLlHoITXPgnwrKfG3J44foQntdOLt/7QC3M9XG2g==
X-Received: by 2002:a17:903:3c6b:b0:223:fb3a:8631 with SMTP id d9443c01a7336-22c535b45b5mr8403775ad.24.1744925880317;
        Thu, 17 Apr 2025 14:38:00 -0700 (PDT)
Received: from hiago-nb ([2804:1b3:a7c3:a964:24cf:3c01:baa2:fe97])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3087bb53b4esm189024a91.17.2025.04.17.14.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 14:37:59 -0700 (PDT)
Date: Thu, 17 Apr 2025 18:37:55 -0300
From: Hiago De Franco <hiagofranco@gmail.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>,
	Hiago De Franco <hiago.franco@toradex.com>
Subject: Re: [REGRESSION] Kernel reboots unexpectdely on i.MX8X when
 Cortex-M4 is running and it was started by U-Boot bootaux
Message-ID: <20250417213755.zqimyf7sqsypydpz@hiago-nb>
References: <20250411125024.i2pib4hyeq4g6ffw@hiago-nb>
 <PAXPR04MB8459ED6CE869173D4051257088B62@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <20250411162328.y2kchvdb4v4xi2lj@hiago-nb>
 <PAXPR04MB8459ED33238AA790252E730988B32@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <20250414224452.gk4ccniqtumfbjth@hiago-nb>
 <PAXPR04MB84591C4D560C0D3D64F927FC88B22@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <20250415184009.2fvtn7tbe6uzwiyg@hiago-nb>
 <PAXPR04MB84596E1E47CDE57ADCE9B40F88BD2@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <20250416215744.6c57a3oqgt6zkeew@hiago-nb>
 <PAXPR04MB8459C8C64D90F1224C1C189088BC2@PAXPR04MB8459.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB8459C8C64D90F1224C1C189088BC2@PAXPR04MB8459.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_143801_403061_8E7001BD 
X-CRM114-Status: GOOD (  55.27  )
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

Hi Peng,

On Thu, Apr 17, 2025 at 02:46:46AM +0000, Peng Fan wrote:
> > Subject: Re: [REGRESSION] Kernel reboots unexpectdely on i.MX8X
> > when Cortex-M4 is running and it was started by U-Boot bootaux
> >
> > Hi Peng,
> >
> > On Wed, Apr 16, 2025 at 08:19:27AM +0000, Peng Fan wrote:
> > > > Got it, I was able to make it work with the downstream pingpong
> > > > driver and the MCUXpresso demo. I can launch the firmware using
> > the
> > > > remoteproc and exchange data between the two cores.
> > > >
> > > > There is something I noticed, when I start the pingpong demo with
> > U-
> > > > Boot, it does not work. I run the pingpong modprobe on Linux but
> > the
> > > > name service is never annouced. It only works if I start with the
> > > > remoteproc on Linux, not U-Boot. Is this because of Linux not being
> > > > able to control the M4?
> > >
> > > No. In you case, you could start using remoteproc, that means Linux
> > > could control M4.
> > >
> > > >
> > > > If I start the binary using U-Boot, the "state" always report as
> > "offline"
> > > > by the remoteproc driver.
> > >
> > > In drivers/remoteproc/imx_rproc.c,  imx_rproc_detect_mode case
> > > IMX_RPROC_SCU_API is used for detect mode of M4 for i.MX8Q/X
> > platform.
> > > Please give a look where it returns.
> > >
> > > For U-Boot start m4, linux should remote state: "attached"
> >
> > Ok, in this case looks its does not work. I start the firmware with U-
> > Boot and state is always "offline". Inside the IMX_RPROC_SCU_API case,
> > the function returns at this point:
> >
> > 		...
> > 		/*
> > 		 * If Mcore resource is not owned by Acore partition, It
> > is kicked by ROM,
> > 		 * and Linux could only do IPC with Mcore and
> > nothing else.
> > 		 */
> > 		if (imx_sc_rm_is_resource_owned(priv->ipc_handle,
> > priv->rsrc_id)) {
> > 			if (of_property_read_u32(dev->of_node,
> > "fsl,entry-address", &priv->entry))
> > 				return -EINVAL;
> >
> > 			return imx_rproc_attach_pd(priv); // <--
> > Returns here
> > 		...
> >
> > And this function, imx_rproc_attach_pd, returns 0 at the end:
> >
> > 	...
> > 	return 0; // <-- Returns here at the end
>
>         ret = dev_pm_domain_attach_list(dev, &pd_data, &priv->pd_list);
>         return ret < 0 ? ret : 0;
>
> It should return with ret as 0.
> Because you mentioned you added two entries.
> 		power-domains = <&pd IMX_SC_R_M4_0_PID0>,
> 				<&pd IMX_SC_R_M4_0_MU_1A>;
>
> https://lore.kernel.org/all/20250411162328.y2kchvdb4v4xi2lj@hiago-nb/
>
>
> >
> > detach_pd:
> > 	while (--i >= 0) {
> > 	...
>
> It should not runs into detach_pd, where it fails?
>
> >
> > So looks like in this case the partition is *not* owned by the A core, it
> > is still being owned by the Mcore and I can not attach.
>
> No. It is owned, because imx_sc_rm_is_resource_owned returns
> true from what you said above.
>
> >
> > For debugging purposes, I did the following patch, inverting the logic:
> >
> > diff --git a/drivers/remoteproc/imx_rproc.c
> > b/drivers/remoteproc/imx_rproc.c index 592a34cfa75e..2fcc9086e916
> > 100644
> > --- a/drivers/remoteproc/imx_rproc.c
> > +++ b/drivers/remoteproc/imx_rproc.c
> > @@ -1072,7 +1072,7 @@ static int imx_rproc_detect_mode(struct
> > imx_rproc *priv)
> >                  * If Mcore resource is not owned by Acore partition, It is
> > kicked by ROM,
> >                  * and Linux could only do IPC with Mcore and nothing else.
> >                  */
> > -               if (imx_sc_rm_is_resource_owned(priv->ipc_handle, priv-
> > >rsrc_id)) {
> > +               if (!imx_sc_rm_is_resource_owned(priv->ipc_handle,
> > + priv->rsrc_id)) {
> >                         if (of_property_read_u32(dev->of_node, "fsl,entry-
> > address", &priv->entry))
> >                                 return -EINVAL;
>
> Please no.
>
> >
> > And now the remoteproc driver attaches to the MCore succesfully,
> > which is exactly what I want. However less than one second later the
> > kernel reboot with the "SCFW fault reset" again.
>
> The resources used by M4 are unexpectedly shutdown by Linux,
> as I understand.
>
> Please check imx_rproc_attach_pd, it should return success
> with dev_pm_domain_attach_list return 0.

I was able to debug this issue further. The issue is not with the power
domains and the clock, these were solved by using the correct device
tree and by using the optional clk api:

@@ -1033,7 +1034,7 @@ static int imx_rproc_clk_enable(struct imx_rproc *priv)
        if (dcfg->method == IMX_RPROC_NONE)
                return 0;

-       priv->clk = devm_clk_get(dev, NULL);
+       priv->clk = devm_clk_get_optional(dev, NULL);
        if (IS_ERR(priv->clk)) {
                dev_err(dev, "Failed to get clock\n");
                return PTR_ERR(priv->clk);

And the device tree node:

	imx8x-cm4 {
		compatible = "fsl,imx8qxp-cm4";
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

The issue is: the .attach callback is never called when then code was
started by U-Boot bootaux. It should be called inside rproc_validate()
function from remoteproc_core.c. However, the rproc->state when we reach
this function is RPROC_OFFLINE, which causes the state to be always
(obviously) offline.

In imx_rproc.c driver, imx_rproc_detect_mode() returns at

		/*
		 * If Mcore resource is not owned by Acore partition, It is kicked by ROM,
		 * and Linux could only do IPC with Mcore and nothing else.
		 */
		if (imx_sc_rm_is_resource_owned(priv->ipc_handle, priv->rsrc_id)) {
			if (of_property_read_u32(dev->of_node, "fsl,entry-address", &priv->entry))
				return -EINVAL;

			return imx_rproc_attach_pd(priv);
		}

imx_sc_rm_is_resource_owned() returns 1, as M4 is owned by Linux, and
imx_rproc_attach_pd() returns 0, as both power domains are set. This
happens _before_ "priv->rproc->state = RPROC_DETACHED" is set one line
below, which causes the state to be always offline and the .attach
callback not called. For debugging, this patch solves this issue:

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 74299af1d7f1..b5af44a5d542 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -949,6 +949,7 @@ static int imx_rproc_detect_mode(struct imx_rproc *priv)
                        if (of_property_read_u32(dev->of_node, "fsl,entry-address", &priv->entry))
                                return -EINVAL;

+                       priv->rproc->state = RPROC_DETACHED;
                        return imx_rproc_attach_pd(priv);
                }

With that, the running M4 is attached succesfully:

root@colibri-imx8x-07308754:~# dmesg | grep remote
[    0.481561] remoteproc remoteproc0: imx-rproc is available
[    0.481656] remoteproc remoteproc0: attaching to imx-rproc
[    0.481743] remoteproc remoteproc0: remote processor imx-rproc is now attached

But as you know, this is not the correct solution, because this will
also attach when the M4 is _not_ running, since it will be owned by
Linux without any code running, which I think is wrong... I think this
"if" statement is not fully correct, there must be a way to attach to
the running M4. Any ideas or suggestions to fix this part?

>
> Regards,
> Peng
>
> >
> > Do you know what could be the issue in this case? Maybe the
> > partitions are not yet correct?
> >
> > >
> > > Regards,
> > > Peng.
> >
> > Cheers,
> > Hiago.

Cheers,
Hiago.

