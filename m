Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E3B5C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 21:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=s0+P/N2dcwM9K862a/2Npi1WdB83EWewXGeQV75YbMs=; b=Vu3vq7LP0NwEBD
	6FLkkFWTnJX7ok6XwcEt7OXtv/ZzrxoW1CqnDv0UD/Kepqi5YeKXhMh22Z6MptBr8JaCMcH9Kk0OF
	mkn9Nf0aVIpzV2uImEr/Sb3+60oW7SZr9XA7ZdJ1dp8r//q0L68E7Xtu9Q6vBDKo9LOK3hRNLitCL
	XkScqGHbY5FQYyhA06VYbEa+a7WD6NVoiTAFyasQFObtF57iw2T42NOIbyIw7P8ja8qkK5G6X5Qei
	PPRqPSF17S9zlrbGNodxlQBJ/DJyIaU3I738DxMHXOa0JOwCNLC4CxqhirEx398PJLlRi/Bz1PTPq
	8n5rSx63G8df25WQVYog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsq5d-0000000CWer-2QFc;
	Thu, 13 Mar 2025 21:27:41 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsq3y-0000000CWXj-1wtv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 21:25:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2A2925C5C47;
	Thu, 13 Mar 2025 21:23:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69A88C4CEDD;
	Thu, 13 Mar 2025 21:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741901157;
	bh=qYeT6sg3o0N3LisLXr2XhjHV7IFvBdDp00R762l5BHM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=MnPUcGWQoUM9IkqxucI7SH1sBbRubpnGpPw1lssb/UUk3lwzq4rmlkc0xPyPCj5rd
	 JlMyh/PHDy1W1CuPonbH/Pll68nI+tTwx94KvYM9+7AMUmCGiA93ztgdHm4VZ64E8h
	 AoK1FqzJmulAoLfr78IUWxAbSSzA2HT56EliMAXTMHKtOwUBZp2iTwrQcoP0bZ66x0
	 y3DRfvijKNyhLHSoGbpoyqOd9XhhQ9gX32rUWtf+COpyZhMKi/L8YscXr82JNP2BBM
	 gmAjwny/5OjZEiCi+8y/6R88KqK3zWru5ROzfxer2M5JwoVVuYNBZ4WgSfiCcdj5gk
	 4MCYTN30/B+HQ==
Date: Thu, 13 Mar 2025 16:25:55 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	Niklas Cassel <cassel@kernel.org>
Subject: Re: [PATCH v11 04/11] PCI: dwc: Move devm_pci_alloc_host_bridge() to
 the beginning of dw_pcie_host_init()
Message-ID: <20250313212555.GA755531@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z9ND5vARXpL8g1t/@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_142558_548249_1FE8FD6B 
X-CRM114-Status: GOOD (  20.07  )
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

On Thu, Mar 13, 2025 at 04:45:26PM -0400, Frank Li wrote:
> On Thu, Mar 13, 2025 at 02:22:54PM -0500, Bjorn Helgaas wrote:
> > On Thu, Mar 13, 2025 at 11:38:40AM -0400, Frank Li wrote:
> > > Move devm_pci_alloc_host_bridge() to the beginning of dw_pcie_host_init().
> > > Since devm_pci_alloc_host_bridge() is common code that doesn't depend on
> > > any DWC resource, moving it earlier improves code logic and readability.
> > >
> > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > ---
> > >  drivers/pci/controller/dwc/pcie-designware-host.c | 12 ++++++------
> > >  1 file changed, 6 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
> > > index c57831902686e..52a441662cabe 100644
> > > --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> > > +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> > > @@ -452,6 +452,12 @@ int dw_pcie_host_init(struct dw_pcie_rp *pp)
> > >
> > >  	raw_spin_lock_init(&pp->lock);
> > >
> > > +	bridge = devm_pci_alloc_host_bridge(dev, 0);
> > > +	if (!bridge)
> > > +		return bridge;
> >
> > This returns NULL (0) where it previously returned -ENOMEM.  Callers
> > interpret zero as "success", so I think it should stil return -ENOMEM.
> 
> It should be -ENOMEM. Sorry for that. Strange, not sure what happen when
> I copy/past code.
> 
> Do you need respin it or you can fix it?

I fixed it locally.  But you should fix it, too, in case we do another
spin for other reasons.

> > I tentatively changed it back to -ENOMEM locally, let me know if
> > that's wrong.
> >
> > > +	pp->bridge = bridge;
> > > +

