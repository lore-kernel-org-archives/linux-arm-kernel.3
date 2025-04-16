Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 326C3C369CA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 21:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9TYUCN/1UNTxn2CDVHf8q4W13nzMO2FOJwS1tEoC09w=; b=rBlQOpgs2AKRZ8DOdVufxFD1np
	CQzx1Vp23qHmSx+VPkQ2jqIH/6YdqwzrpkGXT0TO123DCpcZvsKBQGcEX/2A90qyO2q4DV9RuC0y8
	KXw1lYRZiyPX7KolfA9rkEl8ia8wrDsmxI+dW2lAd8DuxZLtIlHr1YJLK8mt7YmHmRSWf9YHwMRrg
	+E0N0wGyICpcY21Buj1v5MYwQs7Y+zVkDya/7vRQC7DRaYpXx6SOFOfL846goG4wNN2/D6rTqp4jL
	de3YPZ4AwYBq1EKK6HDHNuO2IREOgp/MugbVbD4bg3Mh7fHhfGjNAiqnkA+MlHmNOE5sieN5DbeQi
	lav/e5Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5AnK-0000000AzhG-0vD4;
	Wed, 16 Apr 2025 21:59:46 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5AlS-0000000AzDd-3X9L
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 21:57:51 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-2ff799d99dcso64060a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Apr 2025 14:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744840669; x=1745445469; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9TYUCN/1UNTxn2CDVHf8q4W13nzMO2FOJwS1tEoC09w=;
        b=aYrOQAZahelp8/eKMKi0yUumeCwHm6nQJEVW9DofQ9ZgrTWzgqiX8bxpzkXa98uMNM
         JdENMWSzXgKSm8cEjFfR1BX2tbcbCnGF7LK+IKi0eIKw3cDUR0iKPbVCpeanQHqFX9DP
         xgSova7gXeDH6TJbhHUeOfWI/1/CK5A6wohWAqOw3nUEaOui5rM4Msfip4Ge7uPiDSY3
         IzIaAwx4RQC2bs928WqmDdhb19cbLmLHXj3/ZAQcGyP6Phg6uyU0QqPgJLufH1v8+01J
         p9JnyE9dJf3+yI9dfDxsggkKDu07P8ee17tPcQdWifLYtEbq0uQ+MnVm8HrsKH6wZ2XQ
         4zXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744840669; x=1745445469;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9TYUCN/1UNTxn2CDVHf8q4W13nzMO2FOJwS1tEoC09w=;
        b=XubOK9oW5aFF4K8lzZ7JBsOu85kRhGOVb6RJZ4EV3h1bimbPqEZ0Hgh3A4e2nnNZB3
         qlJcHHAc7q0pmvUJEyRqTp9FNofMYsnXyONeW5R5LgEfz+nVeKYYLCZUerSyui5iJ+Ie
         OepdeScwv7hzBmBftwLHYiw4Y8VYzOG2lRA1DgROCnk2yl3qsTTLwHBzitrxUVM+wOOb
         AOOZNP4f5hOdd2ZxPxCwQ1vw0LRoMFCsksxug5workaVyPQZO2cC0qrR/BI6zKYfGv2T
         KedaAcxKyul/0Jh96SAhTVYbyy3HxicobQLiM4yAK09hPegmDMUAsr9jnqNQ+3iwNRBo
         RRrA==
X-Forwarded-Encrypted: i=1; AJvYcCW10aGaZP954iaanIY1jRsESHNEyFw357tprcwGuhCx25zhRBeFQUNvdrthBRub4V52MlGQimnpB1a52N/W/sOZ@lists.infradead.org
X-Gm-Message-State: AOJu0YwDy2jCzC1AT8GEQCXntJBLquZwoL0+pgw9sMTIe2bewTaE3tta
	xiLa6jwf7WOxwvGEX7FyExUHC8E2/viMUh4vV+Yeo0mDWkNL/oxVxIqidkWM
X-Gm-Gg: ASbGncsTuIE7xLRsvjB2fgYqloaa1JWUBXr3/RYsUzHcO9HU96LLdKCH6pI8lWByLXn
	9vuQg4QmzjPGVYzyDIDAM26Z4PO6IkUdhy66QzvubsBSpUymdoNn6jRvLSLYOlQ0btK3GQ2UV7t
	YPkikMZtu7b5v8aCPiFr5cNU/PCoWu+/dZUY0wy/w3BcJYOc5DNI2yq8HNLq58BMAZFp1eE2ht1
	NIg6p1bsn/ddiG+Y1cdqGqV5ANfiD/pvU6XwbBjdRZqECqIqS1bfZfYUIcfUFa1ACh0ZLCej7XI
	9BWILj2l3TOdddZogaaHyywCSkUK/T13HQYLdteC
X-Google-Smtp-Source: AGHT+IHeFrgYzvolcRtmLtJYy34iMTe1Y9dhFNFAshuXgx77OGVRADxm1VTMFgvhCLlij4fo6kuyHw==
X-Received: by 2002:a17:90b:520a:b0:2ff:7b28:a51c with SMTP id 98e67ed59e1d1-30864178e74mr4413005a91.34.1744840669544;
        Wed, 16 Apr 2025 14:57:49 -0700 (PDT)
Received: from hiago-nb ([2804:1b3:a7c3:a964:41c8:a4c9:4211:d618])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3085458154esm2640914a91.1.2025.04.16.14.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 14:57:48 -0700 (PDT)
Date: Wed, 16 Apr 2025 18:57:44 -0300
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
Message-ID: <20250416215744.6c57a3oqgt6zkeew@hiago-nb>
References: <20250404141713.ac2ntcsjsf7epdfa@hiago-nb>
 <20250411125024.i2pib4hyeq4g6ffw@hiago-nb>
 <PAXPR04MB8459ED6CE869173D4051257088B62@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <20250411162328.y2kchvdb4v4xi2lj@hiago-nb>
 <PAXPR04MB8459ED33238AA790252E730988B32@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <20250414224452.gk4ccniqtumfbjth@hiago-nb>
 <PAXPR04MB84591C4D560C0D3D64F927FC88B22@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <20250415184009.2fvtn7tbe6uzwiyg@hiago-nb>
 <PAXPR04MB84596E1E47CDE57ADCE9B40F88BD2@PAXPR04MB8459.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB84596E1E47CDE57ADCE9B40F88BD2@PAXPR04MB8459.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_145750_884801_F22E118D 
X-CRM114-Status: GOOD (  30.61  )
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

On Wed, Apr 16, 2025 at 08:19:27AM +0000, Peng Fan wrote:
> > Got it, I was able to make it work with the downstream pingpong
> > driver and the MCUXpresso demo. I can launch the firmware using the
> > remoteproc and exchange data between the two cores.
> >
> > There is something I noticed, when I start the pingpong demo with U-
> > Boot, it does not work. I run the pingpong modprobe on Linux but the
> > name service is never annouced. It only works if I start with the
> > remoteproc on Linux, not U-Boot. Is this because of Linux not being
> > able to control the M4?
>
> No. In you case, you could start using remoteproc, that means
> Linux could control M4.
>
> >
> > If I start the binary using U-Boot, the "state" always report as "offline"
> > by the remoteproc driver.
>
> In drivers/remoteproc/imx_rproc.c,  imx_rproc_detect_mode
> case IMX_RPROC_SCU_API is used for detect mode of M4 for i.MX8Q/X
> platform. Please give a look where it returns.
>
> For U-Boot start m4, linux should remote state: "attached"

Ok, in this case looks its does not work. I start the firmware with
U-Boot and state is always "offline". Inside the IMX_RPROC_SCU_API case,
the function returns at this point:

		...
		/*
		 * If Mcore resource is not owned by Acore partition, It is kicked by ROM,
		 * and Linux could only do IPC with Mcore and nothing else.
		 */
		if (imx_sc_rm_is_resource_owned(priv->ipc_handle, priv->rsrc_id)) {
			if (of_property_read_u32(dev->of_node, "fsl,entry-address", &priv->entry))
				return -EINVAL;

			return imx_rproc_attach_pd(priv); // <-- Returns here
		...

And this function, imx_rproc_attach_pd, returns 0 at the end:

	...
	return 0; // <-- Returns here at the end

detach_pd:
	while (--i >= 0) {
	...

So looks like in this case the partition is *not* owned by the A core,
it is still being owned by the Mcore and I can not attach.

For debugging purposes, I did the following patch, inverting the logic:

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 592a34cfa75e..2fcc9086e916 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -1072,7 +1072,7 @@ static int imx_rproc_detect_mode(struct imx_rproc *priv)
                 * If Mcore resource is not owned by Acore partition, It is kicked by ROM,
                 * and Linux could only do IPC with Mcore and nothing else.
                 */
-               if (imx_sc_rm_is_resource_owned(priv->ipc_handle, priv->rsrc_id)) {
+               if (!imx_sc_rm_is_resource_owned(priv->ipc_handle, priv->rsrc_id)) {
                        if (of_property_read_u32(dev->of_node, "fsl,entry-address", &priv->entry))
                                return -EINVAL;

And now the remoteproc driver attaches to the MCore succesfully, which
is exactly what I want. However less than one second later the kernel
reboot with the "SCFW fault reset" again.

Do you know what could be the issue in this case? Maybe the partitions are
not yet correct?

>
> Regards,
> Peng.

Cheers,
Hiago.

