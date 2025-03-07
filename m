Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B41D2C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 23:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=S26nGZUqhYnZXfs8TT3IHAdsuzyiabQw2uaNu8pk+JQ=; b=0CRztVgktnnxnI
	0oMVE3IP0FyzXg2DoMwUZ8V8DC+zZEPFCY0FyJXglVHqC9zmmLbvEEL59CBaniNGuQ9x1kmv4yhs3
	W81zA1MPzBOMv2Xb2OJEk97iYwv6HGfdqc7Tyf48karTejWtBqJdIzZr8XIl+U25V4tCugdJeMoRZ
	9P0M25vDR55qtGq5jq8TfXmLb7O9Qx+BJVojCIFPXcVQ1O2S5CSV/8brtHQ80jmDVLm3z+OztRERh
	kKxy0nYS+6ujwhgpdizjXcQBp8BzhASS/OywqePBqPsRJ8Ba0rVMUS1XMvID1aJHvZq58AAhmq4iy
	mKGbXAZpUXT1Xktnap/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqhTO-0000000FrDH-2ivX;
	Fri, 07 Mar 2025 23:51:22 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqhJu-0000000FqDn-0N4d
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 23:41:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9D2C05C4A80;
	Fri,  7 Mar 2025 23:39:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEE84C4CED1;
	Fri,  7 Mar 2025 23:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741390893;
	bh=yyE7KOWWH/DThx7lyaD0ORCMpjEmY7tHAL2lQSTtrxA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=Udfo0dUo1NqX33GUbGYVRCfE2XukS0+19Lq8BUfwh5a2MSfyFC0FzoFb+JV12kTeB
	 N4VIx3dpaVde/6VorEOKIcGmoej71DV/NyP/+9MitDa7Ih1tlnSnI7yhFK503YOAZZ
	 Nto95q0f4z+O+vPziWEJswiMg4zMIj/PGdjeqlFnNvFKPv/rUILi05vjTQ2d6XyliB
	 TDfAL1SdOjRUbvF7FkV+O7VnEE6hROtjKiATZWC5xSxk0l15uzGP6xdeonUhFwOqTn
	 /agcd7Po8MoZzLUptFMYStBJ7uBuzgc8KBHB8zKUiYUJ7k/ACW+cW1khknah3fly8d
	 BXAI1/rbZExhA==
Date: Fri, 7 Mar 2025 17:41:31 -0600
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
Subject: Re: [PATCH v9 3/7] PCI: Add parent_bus_offset to resource_entry
Message-ID: <20250307234131.GA440690@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8sRl1c//SZXKhB+@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_154134_215092_923FCE63 
X-CRM114-Status: GOOD (  35.04  )
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

On Fri, Mar 07, 2025 at 10:32:39AM -0500, Frank Li wrote:
> On Tue, Mar 04, 2025 at 05:25:45PM -0500, Frank Li wrote:
> > On Tue, Mar 04, 2025 at 05:11:54PM -0500, Frank Li wrote:
> > > On Tue, Mar 04, 2025 at 11:50:10AM -0600, Bjorn Helgaas wrote:
> > > > On Mon, Mar 03, 2025 at 04:57:29PM -0500, Frank Li wrote:
> > > > > On Wed, Feb 26, 2025 at 06:23:26PM -0600, Bjorn Helgaas wrote:
> > > > > > On Tue, Jan 28, 2025 at 05:07:36PM -0500, Frank Li wrote:
> > > > > > > Introduce `parent_bus_offset` in `resource_entry` and a new API,
> > > > > > > `pci_add_resource_parent_bus_offset()`, to provide necessary information
> > > > > > > for PCI controllers with address translation units.
> > > > > > >
> > > > > > > Typical PCI data flow involves:
> > > > > > >   CPU (CPU address) -> Bus Fabric (Intermediate address) ->
> > > > > > >   PCI Controller (PCI bus address) -> PCI Bus.
> > > > > > >
> > > > > > > While most bus fabrics preserve address consistency, some modify addresses
> > > > > > > to intermediate values. The `parent_bus_offset` enables PCI controllers to
> > > > > > > translate these intermediate addresses correctly to PCI bus addresses.
> > > > > > >
> > > > > > > Pave the road to remove hardcoded cpu_addr_fixup() and similar patterns in
> > > > > > > PCI controller drivers.
> > > > > > > ...
> > > > > >
> > > > > > > +++ b/drivers/pci/of.c
> > > > > > > @@ -402,7 +402,17 @@ static int devm_of_pci_get_host_bridge_resources(struct device *dev,
> > > > > > >  			res->flags &= ~IORESOURCE_MEM_64;
> > > > > > >  		}
> > > > > > >
> > > > > > > -		pci_add_resource_offset(resources, res,	res->start - range.pci_addr);
> > > > > > > +		/*
> > > > > > > +		 * IORESOURCE_IO res->start is io space start address.
> > > > > > > +		 * IORESOURCE_MEM res->start is cpu start address, which is the
> > > > > > > +		 * same as range.cpu_addr.
> > > > > > > +		 *
> > > > > > > +		 * Use (range.cpu_addr - range.parent_bus_addr) to align both
> > > > > > > +		 * IO and MEM's parent_bus_offset always offset to cpu address.
> > > > > > > +		 */
> > > > > > > +
> > > > > > > +		pci_add_resource_parent_bus_offset(resources, res, res->start - range.pci_addr,
> > > > > > > +						   range.cpu_addr - range.parent_bus_addr);
> > > > > >
> > > > > > I don't know exactly where it needs to go, but I think we can call
> > > > > > .cpu_addr_fixup() once at startup on the base of the region.  This
> > > > > > will tell us the offset that applies to the entire region, i.e.,
> > > > > > parent_bus_offset.
> > > > > >
> > > > > > Then we can remove all the .cpu_addr_fixup() calls in
> > > > > > cdns_pcie_host_init_address_translation(),
> > > > > > cdns_pcie_set_outbound_region(), and dw_pcie_prog_outbound_atu().
> > > > > >
> > > > > > Until we can get rid of all the .cpu_addr_fixup() implementations,
> > > > > > We'll still have that single call at startup (I guess once for cadence
> > > > > > and another for designware), but it should simplify the current
> > > > > > callers quite a bit.
> > > > >
> > > > > I don't think it can simple code. cdns_pcie_set_outbound_region() and
> > > > > dw_pcie_prog_outbound_atu() are called by EP functions, which have not use
> > > > > "resource" to manage outbound windows.
> > > >
> > > > Let's ignore cadence for now.  I don't think we need to solve that
> > > > until later.
> > > >
> > > > dw_pcie_prog_outbound_atu() is called by:
> > > >
> > > >   - dw_pcie_other_conf_map_bus(): atu.parent_bus_addr = pp->cfg0_base
> > > >
> > > >     I think dw_pcie_host_init() can set pp->cfg0_base with the correct
> > > >     intermediate address, either via the the of_property_read_reg() or
> > > >     .cpu_addr_fixup().
> >
> > And chicken and egg problem here for artpec6_pcie_cpu_addr_fixup(), which
> > need cfg0_base. But try to use .cpu_addr_fixup() to get cfg0_base's
> > intermediate address.
> 
> Bjorn:
> 	Do you have chance to check my reply? some dwc platform driver
> .cpu_addr_fixup() implement have dependence with old initilize sequency.

Yes, I tried to sketch out what I was thinking to make it more
concrete.  I posted it and sent to you, but just for other readers of
this thread, it's at:

https://lore.kernel.org/linux-pci/20250307233744.440476-1-helgaas@kernel.org/T/#t

Bjorn

