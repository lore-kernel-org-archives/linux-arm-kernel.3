Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8B59CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 22:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=AJiePwXqeITdV2XYFqOrHSUIoMccrvFf6mv6limCIQI=; b=Asd+MzBBsWh6LD
	R0Qfzuz/ZdvymYiulSO8ZzmoW4RKXNXYXiUjBuFnxuc+gCHuAk7LJFPa470ae9fEz4hBJNYdKddwc
	tvJuebmiDa2stT3OI1SZq48+wAv1daXsQh6ZuNBCL8hXOnLG07QV6A7/8kQL7ZjIZ5Fscd5z6q96h
	LWOkM12jt5fni+FscNctpkZrm8Dvm+EIPBWaekiF4VCKrQ1511IFl5MkaCKk+l1NGMek/wkCyG2G/
	zp7q5v9yKrupt3QPu42Y3/Bf5CR5w/lfygbFyKWJz43tn9DDu7Jmbpb6SaQvGTgWjcZc0fvAMV18w
	kXfL30Z61LKQrfD+jWAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoV1k-0000000BkZ8-1DsX;
	Tue, 19 Aug 2025 22:42:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoS5U-0000000BR6G-3xzt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 19:33:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 588C6613EF;
	Tue, 19 Aug 2025 19:33:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AC91C4CEF1;
	Tue, 19 Aug 2025 19:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755632017;
	bh=AHSmGNb1muH/++bYQyHtCOXRefIvHL5FtP/WnzUyhyI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=rY5G6YqMNHBJ7g1+ElR0XGhrZUvig859ScN/e8vVUOQM22d4lWMcUNr4LTFo1yrEG
	 OL21YfyTG1UOyK5ZYVAiBpIpkE1vVI0cm9nigxVjY/CfUBovzp8twUUx0EG5nNysoK
	 6w2uiyobZ94hkUdfuy7FisKTg88JkZWIQ8D6BscREKg9ECJbnGRKDAC8fs0Yj9yx1e
	 /tWHRCw+e324DCI6q5PbKgkPQ7BvUWlEbmrZx8sr6miFJIi9LHTt4uCYWJNpuQo09y
	 eGqHeVgzMZKZR7eROhDJnybc4baDZ/T3srjub3K1LUJrveDVgvg7BDwcrSyFR2Vv/v
	 s9WAl4aKwAEGg==
Date: Tue, 19 Aug 2025 14:33:36 -0500
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
	"shawnguo@kernel.org" <shawnguo@kernel.org>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [RESEND v3 1/5] PCI: dwc: Don't poll L2 if QUIRK_NOL2POLL_IN_PM
 is existing in suspend
Message-ID: <20250819193336.GA588734@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AS8PR04MB88338A64A256C92CE64A02018C30A@AS8PR04MB8833.eurprd04.prod.outlook.com>
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

On Tue, Aug 19, 2025 at 05:51:41AM +0000, Hongxing Zhu wrote:
> > From: Bjorn Helgaas <helgaas@kernel.org>
> > On Mon, Aug 18, 2025 at 03:32:01PM +0800, Richard Zhu wrote:
> > > Refer to PCIe r6.0, sec 5.2, fig 5-1 Link Power Management State Flow
> > > Diagram. Both L0 and L2/L3 Ready can be transferred to LDn directly.
> ...

> > > +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> > > @@ -1007,7 +1007,7 @@ int dw_pcie_suspend_noirq(struct dw_pcie *pci)
> > > {
> > >  	u8 offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
> > >  	u32 val;
> > > -	int ret;
> > > +	int ret = 0;
> > >
> > >       /*
> > >        * If L1SS is supported, then do not put the link into L2 as
> > > some
> >          * devices such as NVMe expect low resume latency.
> >          */
> >          if (dw_pcie_readw_dbi(pci, offset + PCI_EXP_LNKCTL) &
> > PCI_EXP_LNKCTL_ASPM_L1)
> >                 return 0;
> > 
> > You didn't change it in this patch (the L1SS test was added by
> > 4774faf854f5 ("PCI: dwc: Implement generic suspend/resume
> > functionality")), but this L1SS check is an encapsulation problem.
> > The ASPM configuration shouldn't leak out here in such an ad hoc
> > way.

> Should I created another commit to get ride of the L1SS check codes?

If we remove that check, I guess we would put the link into L2 when
ASPM L1 is enabled (not when "L1SS is supported" as the comment
claims).

Obviously this check was added for a reason, so I assume something bad
would happen if we removed it.  But at the same time, AFAICS this
check only applies to imx6 and layerscape because none of the other
drivers use dw_pcie_suspend_noirq().

So yes, I do think it should be removed because it's only a partial
band-aid for whatever the problem is.  It would probably break
something, but it looks to me like it's already broken on most
platforms, and we need to figure out a real solution that fixes
everybody.

> > *All* drivers, not just NVMe, would prefer low resume latency.
> > 
> > How do we deal with this in other host controller drivers?  If any
> > other driver puts links in L2, I suppose they would have the same
> > issue?  Maybe DWC is the only one that puts the link in L2?
> > 
> > What happens when we add a new driver that puts links in L2?  I
> > guess we'll be debugging some NVMe issue again?
>
> Up to now, this is the first one routine to do the L1SS check in L2
> entry.

