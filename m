Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A31EC3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 20:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/pc5D2wBbh6n4AHAVGKAJlI6vZAzUWJsMh1/Yq1dDS0=; b=dJ7/C89G/HGqSpMFrGfPnegrEG
	bG6C2kmrnu1XnugiY5vp/Twi7JmBm4GbKekSvp8obh8Cqa4IUpPeAqBn5KQjWQXZuLT8v6Ivuc2/I
	rdskKyM1TULD5C+dJwTFKpT+yyzj4UopFAegXtN+OFLn4fAiEol+oifB7UVCamcfOoKK8SFBK6ys+
	2d8fZ+hxiqjOH6+p5EOvzHkQu+jTeO94SYrDqQ6nKuTZ1HnBgnb/mpeHKC3fVVGinnca2CeaFjWyB
	3sFPUUzi22xCDUqLjSTkd7yKg7SZuuLKFEk/P3vpuEJxsF5JeM6Yn5WY5A0tsBtolupvFtLjhy3RR
	nhprjBYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD7t6-00000001lPT-2bYh;
	Thu, 08 May 2025 20:30:36 +0000
Received: from mail-vk1-xa36.google.com ([2607:f8b0:4864:20::a36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD7r9-00000001lFv-0VSH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 20:28:36 +0000
Received: by mail-vk1-xa36.google.com with SMTP id 71dfb90a1353d-5241abb9761so481006e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 May 2025 13:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746736113; x=1747340913; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/pc5D2wBbh6n4AHAVGKAJlI6vZAzUWJsMh1/Yq1dDS0=;
        b=Kn2NDp6FZxE8PlonCeiv0sjduQxNUnKB1PgyKxFjuH6sd+OyDYnILk2yrbhtR5BNKH
         6ebbkf/54t/F21N7bGWE12ZbTLlLdNNzSAswBFsT0l2QFgtmuPaSeIvBUIpbBuftxb+Z
         cw5/5Pe2cW0kvpaGGa4cm3FPtfgu7s+SA0iMDEhmW6T7tWBwsQNsioWL/tFot+dc2GQn
         o4+UMWYlN4VYiaG1rDuG/LpTmVMbgpix8i6hFfXO/GnzBiYA0zl5EVVvo+G8ft9OBWKd
         q9yfDJIzjvyyiW/uQRLMrM31OsCl0QHY62XptmVbRGDhpfsUFuFPACYGABxzqtAbEwac
         JqPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746736113; x=1747340913;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/pc5D2wBbh6n4AHAVGKAJlI6vZAzUWJsMh1/Yq1dDS0=;
        b=tdf0zb1T32YbLFuDlLDKjmAlMvkl5eg+U7z/f6Q9VNRP+oDXlDV61MP5qffM1aGaJO
         AZNmn1VOrI7ZNVRFoK4Zrj36Po0IMVGKwT+6TyZYtAHTTsW3YVcZW1vCy4bijD6uARmg
         C1daidg+GKqhCcPJ4R7DZ3bnNhZuxR0MnrUD77SrMNf6lT+b8zFo2znVjU4Vh1GpNGmS
         Z3jNhuXw7a9aiX/WhlWqzJ1JDF4rZGx/bbYUU2SI/1WxxM8ocq3sxnheVGnBiEBrDUiz
         kJCWCI6HVoODup6ynr3tJyF4leUanyVooiySyzC186sLIjXC9hUyQKTFFzD+bQO0iXkG
         BS7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXIrtl8Ex/6gwehZd2VXDr/KhnsvyDt7tP2djAUiX3sL43WFrDeEKcgQXXoKXNCvPtLYxLPppDXZ+QNoW++6W+W@lists.infradead.org
X-Gm-Message-State: AOJu0YyGmIy8W4VaUEntgzin/9rRGNnPYMcG83yqEByh5Or7ZWrGPfDV
	b+/un8/AwhGeFgD4VLZCNFfEOUOb9t43uKGeU507KnJL01vwMzvxYS4rnU81
X-Gm-Gg: ASbGnct9EVwu6i6fW4CKar4mM5HjHlSnyvgCdu47xZAfT1OUjKpYvyzkq5S4E666P1W
	XFPvWPG2Pa9aBM+S7dxYLZoyyXcR5uz94fvvl8FprOtRdO4XxRZXOv6aKWmFS6fngzAjwh2F5nI
	XhmFb7t/4eBLsHLhpcfuCoPYG36kY8emDOs0xrRmxrd+iFe/CChgPck1f9LVSa5RP7smCDEwJjy
	6vOuGNvnF12HocCT3YjI14fkLrOZXamXV/qgINEfMyM7Q75UYLNsvTaesCx0hFOCOU00y2ixoNS
	FCsSUEVyHPui25kQ+GstAzqOfZCNn5fIk6MTSIr2
X-Google-Smtp-Source: AGHT+IHH8Hb44S2pUrzpBoAuMzG/VFUuedek3qnL1aKjilRrz2XuP3PUIZdV2EDPHQ1l0mwZVNw7hQ==
X-Received: by 2002:a05:6122:828d:b0:523:9ee7:7f8e with SMTP id 71dfb90a1353d-52c53c68f4amr1351138e0c.4.1746736113471;
        Thu, 08 May 2025 13:28:33 -0700 (PDT)
Received: from hiago-nb ([2804:1b3:a7c0:6030:ff91:5999:3ab5:5caf])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52c5375bcdcsm217781e0c.25.2025.05.08.13.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 13:28:32 -0700 (PDT)
Date: Thu, 8 May 2025 17:28:26 -0300
From: Hiago De Franco <hiagofranco@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, linux-pm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Hiago De Franco <hiago.franco@toradex.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@oss.nxp.com>, daniel.baluta@nxp.com,
	iuliana.prodan@oss.nxp.com, Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v2 3/3] remoteproc: imx_rproc: add power mode check for
 remote core attachment
Message-ID: <20250508202826.33bke6atcvqdkfa4@hiago-nb>
References: <20250507160056.11876-1-hiagofranco@gmail.com>
 <20250507160056.11876-4-hiagofranco@gmail.com>
 <CAPDyKFrHD1hVCfOK-JV5FJM+Cd9DoKKZGKcC94fxx6_9Bsri1g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPDyKFrHD1hVCfOK-JV5FJM+Cd9DoKKZGKcC94fxx6_9Bsri1g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_132835_162322_31B834D5 
X-CRM114-Status: GOOD (  34.25  )
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

Hello,

On Thu, May 08, 2025 at 12:03:33PM +0200, Ulf Hansson wrote:
> On Wed, 7 May 2025 at 18:02, Hiago De Franco <hiagofranco@gmail.com> wrote:
> >
> > From: Hiago De Franco <hiago.franco@toradex.com>
> >
> > When the remote core is started before Linux boots (e.g., by the
> > bootloader), the driver currently is not able to attach because it only
> > checks for cores running in different partitions. If the core was kicked
> > by the bootloader, it is in the same partition as Linux and it is
> > already up and running.
> >
> > This adds power mode verification through the SCU interface, enabling
> > the driver to detect when the remote core is already running and
> > properly attach to it.
> >
> > Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> > Suggested-by: Peng Fan <peng.fan@nxp.com>
> > ---
> > v2: Dropped unecessary include. Removed the imx_rproc_is_on function, as
> > suggested.
> > ---
> >  drivers/remoteproc/imx_rproc.c | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> >
> > diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> > index 627e57a88db2..9b6e9e41b7fc 100644
> > --- a/drivers/remoteproc/imx_rproc.c
> > +++ b/drivers/remoteproc/imx_rproc.c
> > @@ -949,6 +949,19 @@ static int imx_rproc_detect_mode(struct imx_rproc *priv)
> >                         if (of_property_read_u32(dev->of_node, "fsl,entry-address", &priv->entry))
> >                                 return -EINVAL;
> >
> > +                       /*
> > +                        * If remote core is already running (e.g. kicked by
> > +                        * the bootloader), attach to it.
> > +                        */
> > +                       ret = imx_sc_pm_get_resource_power_mode(priv->ipc_handle,
> > +                                                               priv->rsrc_id);
> > +                       if (ret < 0)
> > +                               dev_err(dev, "failed to get power resource %d mode, ret %d\n",
> > +                                       priv->rsrc_id, ret);
> > +
> > +                       if (ret == IMX_SC_PM_PW_MODE_ON)
> > +                               priv->rproc->state = RPROC_DETACHED;
> > +
> >                         return imx_rproc_attach_pd(priv);
> 
> Why is it important to potentially set "priv->rproc->state =
> RPROC_DETACHED" before calling imx_rproc_attach_pd()?
> 
> Would it be possible to do it the other way around? First calling
> imx_rproc_attach_pd() then get the power-mode to know if
> RPROC_DETACHED should be set or not?
> 
> The main reason why I ask, is because of how we handle the single PM
> domain case. In that case, the PM domain has already been attached
> (and powered-on) before we reach this point.

I am not sure if I understood correcly, let me know if I missed
something. From my understanding in this case it does not matter, since
the RPROC_DETACHED will only be a flag to trigger the attach callback
from rproc_validate(), when rproc_add() is called inside
remoteproc_core.c.

With that we can correcly attach to the remote core running, which was
not possible before, where the function returns at "return
imx_rproc_attach_pd(priv);" with the RPROC_OFFLINE state to
rproc_validate().

> 
> >                 }
> >
> > --
> > 2.39.5
> >
> 
> Kind regards
> Uffe

Best Regards,
Hiago.

