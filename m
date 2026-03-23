Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B3E7F4613E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 22:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=9pqfxe/Bn+ORn/2yalMtBIuQAPevDdfvNV0Z8mA4IGk=; b=tm6MBiP/sWfhnc
	TskAVc4yLm059CMy38d70KDFKXXcU6PKfakU43j0ee3vTOB0RSBOAOMWcyr5XGTluHa7GaUULA4kE
	KivTgLURYwLx8xqZ2FZNE3Sxtw+StASmP4Yr9yKZ64WvkxfW0RnMuOSg8aD9IvBkFDhfPJKCBay+z
	P9Scz9F7F3bEJMWd33N3PHURl7HYLW5w+oPpGnlwEe2ElS5ayntABXmx9VQPcfps4yuq5etuQKXky
	em9+ytXbRapAq2ZUDD6iNnh4jFIx1xhK/qXqNTBOvXkDUw003qXCb8ZXFVI116s1mP2aw1dIkE+OE
	ATCnHyi4ZhPLmzOlUKFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4nSJ-000000003LX-1gCz;
	Mon, 23 Mar 2026 22:09:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4nSG-000000003LB-2p7F
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 22:09:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0346343860;
	Mon, 23 Mar 2026 22:09:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7CD6C4CEF7;
	Mon, 23 Mar 2026 22:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774303739;
	bh=7+YNRg0192JPCv78lvVe/YYOAr1sQyE0YYeqhV3a2LE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=p6c6b7WNpOd2eeBbpZ+9+2Gsn8oNjJpqEk2RkYgUgq1lw+rXj7lyV3xUSS/Fs1CIS
	 EUqx124nJBcjkR3Uu8YXUq3V3WcG29Bxtwo484LJIaQFr9GjafiBnbsFCRaG9LxULg
	 wu5+MF1aIyKWHUL+pOXMNuWfo0nzegfaEcyt/Fj4LeK90B1W7TAs2lzxA28ZLPkKs7
	 U7dkrBFu4aukb5MEnrk3StnwOweJG23d38+yVBRo++3W7W/CyiQjuEGv0tSez4uV4t
	 CON5b+WUJSNCIFl6UfWTmP9KZVHCJc64626ftkv5JWT8AVGPaZ/J45MWlOVXTnBtTG
	 bIOiaGwk4qPzg==
Date: Mon, 23 Mar 2026 17:08:58 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Hongxing Zhu <hongxing.zhu@nxp.com>
Cc: Frank Li <frank.li@nxp.com>,
	"jingoohan1@gmail.com" <jingoohan1@gmail.com>,
	"l.stach@pengutronix.de" <l.stach@pengutronix.de>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	"kwilczynski@kernel.org" <kwilczynski@kernel.org>,
	"mani@kernel.org" <mani@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>,
	"bhelgaas@google.com" <bhelgaas@google.com>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH v1] PCI: imx6: Add force_suspend flag to override L1SS
 suspend skip
Message-ID: <20260323220858.GA1084506@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AS8PR04MB8833061F34B9BEFC9D19764A8C4EA@AS8PR04MB8833.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_150900_757325_4BA84821 
X-CRM114-Status: GOOD (  38.15  )
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

On Wed, Mar 18, 2026 at 02:55:45AM +0000, Hongxing Zhu wrote:
> > -----Original Message-----
> > From: Bjorn Helgaas <helgaas@kernel.org>
> ... [messed up quoting]

> > On Tue, Mar 17, 2026 at 02:12:56PM +0800, Richard Zhu wrote:
> > > Add a force_suspend flag to allow platform drivers to force the PCIe
> > > link into L2 state during suspend, even when L1SS (ASPM L1 Sub-States)
> > > is enabled.
> > >
> > > By default, the DesignWare PCIe host controller skips L2 suspend when
> > > L1SS is supported to meet low resume latency requirements for devices
> > > like NVMe. However, some platforms like i.MX PCIe need to enter L2
> > > state for proper power management regardless of L1SS support.
> > >
> > > Enable force_suspend for i.MX PCIe to ensure the link enters L2 during
> > > system suspend.
> > 
> > I'm a little bit skeptical about this.
> > 
> > What exactly does a "low resume latency requirement" mean?  Is
> > this an actual functional requirement that's special to NVMe, or
> > is it just the desire for low resume latency that everybody has
> > for all devices?
>
> From my understanding, L1SS mode is characterized by lower latency
> when compared to L2 or L3 modes.
>
> It can be used on all devices, avoiding frequent power on/off
> cycles. NVMe can also extend the service life of the equipment.

All the above applies to all platforms, so it's not an argument for
i.MX-specific code here.

> > Is there something special about i.MX here?  Why do we want i.MX
> > to be different from other host controllers?
>
> i.MX PCIe loses power supply during Deep Sleep Mode (DSM), requiring
> full reinitialization after system wake-up.

I don't know what DSM means in PCIe or how it would help justify this
change.

> Removing the L1SS check allows the suspend process to complete
> successfully and ensures the pci->suspended flag is set to true,
> which triggers the proper resume sequence during system wake-up for
> i.MX PCIes.

> > > Cc: stable@vger.kernel.org
> > > Fixes: 4774faf854f5 ("PCI: dwc: Implement generic suspend/resume
> > > functionality")
> > > Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> > > ---
> > >  drivers/pci/controller/dwc/pci-imx6.c             | 1 +
> > >  drivers/pci/controller/dwc/pcie-designware-host.c | 4 +++-
> > >  drivers/pci/controller/dwc/pcie-designware.h      | 1 +
> > >  3 files changed, 5 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/pci/controller/dwc/pci-imx6.c
> > > b/drivers/pci/controller/dwc/pci-imx6.c
> > > index 81a7093494c8..7902d39185a5 100644
> > > --- a/drivers/pci/controller/dwc/pci-imx6.c
> > > +++ b/drivers/pci/controller/dwc/pci-imx6.c
> > > @@ -1831,6 +1831,7 @@ static int imx_pcie_probe(struct platform_device
> > *pdev)
> > >  		if (imx_check_flag(imx_pcie, IMX_PCIE_FLAG_SKIP_L23_READY))
> > >  			pci->pp.skip_l23_ready = true;
> > >  		pci->pp.use_atu_msg = true;
> > > +		pci->pp.force_l2_suspend = true;
> > >  		ret = dw_pcie_host_init(&pci->pp);
> > >  		if (ret < 0)
> > >  			return ret;
> > > diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c
> > > b/drivers/pci/controller/dwc/pcie-designware-host.c
> > > index a74339982c24..720154fd4ff0 100644
> > > --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> > > +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> > > @@ -1229,7 +1229,9 @@ int dw_pcie_suspend_noirq(struct dw_pcie *pci)
> > >  	 * If L1SS is supported, then do not put the link into L2 as some
> > >  	 * devices such as NVMe expect low resume latency.
> > >  	 */
> > > -	if (dw_pcie_readw_dbi(pci, offset + PCI_EXP_LNKCTL) &
> > PCI_EXP_LNKCTL_ASPM_L1)
> > > +	if (!pci->pp.force_l2_suspend &&
> > > +	    (dw_pcie_readw_dbi(pci, offset + PCI_EXP_LNKCTL) &
> > > +	     PCI_EXP_LNKCTL_ASPM_L1))
> > >  		return 0;
> > >
> > >  	if (pci->pp.ops->pme_turn_off) {
> > > diff --git a/drivers/pci/controller/dwc/pcie-designware.h
> > > b/drivers/pci/controller/dwc/pcie-designware.h
> > > index ae6389dd9caa..5261036bbe6e 100644
> > > --- a/drivers/pci/controller/dwc/pcie-designware.h
> > > +++ b/drivers/pci/controller/dwc/pcie-designware.h
> > > @@ -447,6 +447,7 @@ struct dw_pcie_rp {
> > >  	bool			ecam_enabled;
> > >  	bool			native_ecam;
> > >  	bool                    skip_l23_ready;
> > > +	bool                    force_l2_suspend;
> > >  };
> > >
> > >  struct dw_pcie_ep_ops {
> > > --
> > > 2.37.1
> > >

