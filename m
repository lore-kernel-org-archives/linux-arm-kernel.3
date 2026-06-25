Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7DF4CDB479
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 13:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KaLc+quV2pMprMYuRbpfQ+2ZIV/dZbs72AcURaa/OQ0=; b=bR1GjryvJH+misxxWTF23mcNE0
	19abpKqd9ThlAKZHMvTv21ZnMyO9spieUaBVI6A4YHlY4zXLIdXhclV9e0oYFbBZMiCeNwykrB09M
	XdLiXX2e/Yd5VfoDfo2bpsOG7bUZPQ9WhETWQCnf4sa6iaAbpC1bp2TQVGw5YSCG2AoM3FrTwlGaB
	ndBzKA+LM76uc0xYwhPFPoRO+62vdNQNkTiTwS5zBWmrfXRUIDD7uVam7wG+OLBeTvnoR4ObQKrwm
	yRAGxYBw5cEhhiPY21nN8SgIRlCsISe9SKy4XkIDO+7NJiS+8Ago09vioIoIAfKcTdg+kGCfEll+c
	6Ujlekqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wckav-00000009Gll-1Vrc;
	Thu, 25 Jun 2026 13:58:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wckat-00000009Gld-46RB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 13:58:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4ADEF444C3;
	Thu, 25 Jun 2026 13:58:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64D931F00A3A;
	Thu, 25 Jun 2026 13:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782395895;
	bh=KaLc+quV2pMprMYuRbpfQ+2ZIV/dZbs72AcURaa/OQ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hxzCeslCh1paaQ8/HrAjwhqZTAelNUsRIjBPlx5RHMj5LtK3w3RfPFIdBadUna4DE
	 nq1McAB8FAmEl6SanbsC8zX00pnFnB6gdenCE1yK7Mls2mrfPpqdZOZlICMJhSlCHp
	 owurHl9hTH3dFmHUYBNfsXeZ/YfGAJiT09NVgU0XtajdCDy1VixADEppORjAVB+AyL
	 Srwy1bXrdRe68sJOuwDd4A+yc7YovE0g0Us/8eSiN14f8ViGgKT0ZL6emGWChcULD7
	 Dh/5U9EcTyLwdZL405n5v1knnQqGzFwMJGNORvcn0/wvDL+xcomdrFyxBqnGOlVI/m
	 +67YJTWsze+KQ==
Date: Thu, 25 Jun 2026 15:57:54 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Sherry Sun <sherry.sun@nxp.com>
Cc: "Frank Li (OSS)" <frank.li@oss.nxp.com>, 
	"Sherry Sun (OSS)" <sherry.sun@oss.nxp.com>, "robh@kernel.org" <robh@kernel.org>, 
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	Frank Li <frank.li@nxp.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, 
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, 
	Amitkumar Karwar <amitkumar.karwar@nxp.com>, Neeraj Sanjay Kale <neeraj.sanjaykale@nxp.com>, 
	"marcel@holtmann.org" <marcel@holtmann.org>, "luiz.dentz@gmail.com" <luiz.dentz@gmail.com>, 
	Hongxing Zhu <hongxing.zhu@nxp.com>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>, 
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>, "kwilczynski@kernel.org" <kwilczynski@kernel.org>, 
	"bhelgaas@google.com" <bhelgaas@google.com>, "brgl@kernel.org" <brgl@kernel.org>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>
Subject: Re: [PATCH V2 1/8] PCI: imx6: Add skip_pwrctrl_off flag support
Message-ID: <ozh6q3xazym5dfwvp4re7zwaqcaqmms7pbrzwelzsfldxs6lju@bshacga5usqs>
References: <20260623030736.1421537-1-sherry.sun@oss.nxp.com>
 <20260623030736.1421537-2-sherry.sun@oss.nxp.com>
 <ajqZBM6IkbDLiVu2@SMW015318>
 <VI0PR04MB121147C305022511469FB603A92ED2@VI0PR04MB12114.eurprd04.prod.outlook.com>
 <ajwOvZUlOEQzmjsu@SMW015318>
 <VI0PR04MB12114BCBD405505888063284492EC2@VI0PR04MB12114.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <VI0PR04MB12114BCBD405505888063284492EC2@VI0PR04MB12114.eurprd04.prod.outlook.com>
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

On Thu, Jun 25, 2026 at 07:25:46AM +0000, Sherry Sun wrote:
> > Subject: Re: [PATCH V2 1/8] PCI: imx6: Add skip_pwrctrl_off flag support
> > 
> > On Wed, Jun 24, 2026 at 07:09:26AM +0000, Sherry Sun wrote:
> > > > Subject: Re: [PATCH V2 1/8] PCI: imx6: Add skip_pwrctrl_off flag
> > > > support
> > > >
> > > > On Tue, Jun 23, 2026 at 11:07:28AM +0800, Sherry Sun (OSS) wrote:
> > > > > From: Sherry Sun <sherry.sun@nxp.com>
> > > > >
> > > > > Use dw_pcie_rp::skip_pwrctrl_off to avoid powering off devices
> > > > > during suspend to preserve wakeup capability of the devices and
> > > > > also not to power on the devices in the init path.
> > > > > This allows controller power-off to be skipped when some devices(e.g.
> > > > > M.2 cards key E without auxiliary power) required to support PCIe
> > > > > L2 link state and wake-up mechanisms.
> > > > >
> > > > > Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
> > > > > ---
> > > > >  drivers/pci/controller/dwc/pci-imx6.c | 36
> > > > > +++++++++++++++++----------
> > > > >  1 file changed, 23 insertions(+), 13 deletions(-)
> > > > >
> > > > > diff --git a/drivers/pci/controller/dwc/pci-imx6.c
> > > > > b/drivers/pci/controller/dwc/pci-imx6.c
> > > > > index 0fa716d1ed75..ff5a9565dbbf 100644
> > > > > --- a/drivers/pci/controller/dwc/pci-imx6.c
> > > > > +++ b/drivers/pci/controller/dwc/pci-imx6.c
> > > > > @@ -1382,16 +1382,20 @@ static int imx_pcie_host_init(struct
> > > > > dw_pcie_rp
> > > > *pp)
> > > > >  		}
> > > > >  	}
> > > > >
> > > > > -	ret = pci_pwrctrl_create_devices(dev);
> > > > > -	if (ret) {
> > > > > -		dev_err(dev, "failed to create pwrctrl devices\n");
> > > > > -		goto err_reg_disable;
> > > > > +	if (!pci->suspended) {
> > > > > +		ret = pci_pwrctrl_create_devices(dev);
> > > >
> > > > Is possible move pci_pwrctrl_create_devices() of
> > > > pci_pwrctrl_create_devices
> > > >
> > > > and call it direct at probe() function, like other regulator_get function.
> > > >
> > >
> > > Hi Frank,
> > > That makes sense. However, if we move pci_pwrctrl_create_devices () to
> > > probe(), we may need to add the following goto err_pwrctrl_destroy
> > > path in imx_pcie_probe() to properly handle errors from
> > > pci_pwrctrl_power_on_devices(), is that acceptable?
> > 
> > Can you add a API devm_pci_pwrctrl_create_devices() ?
> > 
> 
> Hi Frank, we cannot unconditionally destroy the pwrctrl devices
> when probing fails by using devm API.
> Since we need to check the return value of
> pci_pwrctrl_power_on_devices() for example EPROBE_DEFER to decide
> whether to destroy the pwrctrl devices to avoid the deferred probe loop.
> 
> You can find more related discussion here.
> https://lore.kernel.org/all/tutxwjciedqoje5wxvtin4h637auni5zzpvb7rtfg4uticxoux@yfl6xg7oht7t/
> 

Yes. Ideally we should try to do a blocking wait in the pwrctrl core until all
the pwrctrl drivers are probed, instead of deferring probe. Hopefully, I'll get
to it soon.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

