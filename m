Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCF17C282D3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 20:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=XHOVPHpEsuePioRdgfXRlV/LLBk4lF6xaP8SSSk34xI=; b=JNUL/RrsnezRY0
	alaDX/BV8OpZX2sb880trsbbwHrBt/NuiAQnNkslhNujUgS09NB0OfjsXbXrYR5V4GMI6MQKq3XWQ
	12CBTT+BgeweeyBBg/Ofdd2AE6mj2AAQK9cy3JlyPVKUFmcMBt7TrnckDCoaWFeoNnnut47Dr58le
	5jb+WnK013Poq+XKFgAJ4z6AHYyHYreb3jCMilr0iD0v6ZF4m+9Rmo7EY7MXGD5MhpUcxfeZDZgir
	LD11tnGRhtkFIYNEqrP41wtvT0LPzufMsq5an9N3wsaHW9q+sUna3O0m2Q4bUqYF4lnXbc992LkpI
	y2vgPdgOL6OCK9alFBCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpYtf-00000006BlR-2m2k;
	Tue, 04 Mar 2025 20:29:47 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpWPF-00000005iCY-0rVw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 17:50:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A1A3FA45B35;
	Tue,  4 Mar 2025 17:44:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E40C3C4CEE5;
	Tue,  4 Mar 2025 17:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741110612;
	bh=RUs05QEUeWMhEa3TyZUPqxN1hhHry9gVbabsRe4U85o=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=Z7CoSsFnye2QUmquT+Qifh2gocwU2GPjYNg5Tgh6EdKsBGvQ5RQTnQIAchaiVa9dj
	 ClX9B2KV7SqTuvlGUw5XXYBnXhhZz7vVHJDy1pmTewZwQCUa4cEAGu/94MPtoJ56qN
	 0J3uuDxf4fZ/mICYiUitpINUlxPbXpoIuPqErDJJOy6z1nZSrrV50t5eerukfzD6A2
	 wiBck3nT0zFnRrBfc8GT3osydTQpJ5GGL1M4mBLTN4O/gbklcuPV0x0GUKuU6TGn2H
	 +M1QOtI30Q0la1lQeSSJry6DOlV0Q4n+ox9faV5rOyQdLYRzn9c4axUCOARXB19TeD
	 iYUVDhZ0z1rNg==
Date: Tue, 4 Mar 2025 11:50:10 -0600
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
Message-ID: <20250304175010.GA207565@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8YlySM6Xtr0beo1@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_095013_377731_C550EE9E 
X-CRM114-Status: GOOD (  29.94  )
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

On Mon, Mar 03, 2025 at 04:57:29PM -0500, Frank Li wrote:
> On Wed, Feb 26, 2025 at 06:23:26PM -0600, Bjorn Helgaas wrote:
> > On Tue, Jan 28, 2025 at 05:07:36PM -0500, Frank Li wrote:
> > > Introduce `parent_bus_offset` in `resource_entry` and a new API,
> > > `pci_add_resource_parent_bus_offset()`, to provide necessary information
> > > for PCI controllers with address translation units.
> > >
> > > Typical PCI data flow involves:
> > >   CPU (CPU address) -> Bus Fabric (Intermediate address) ->
> > >   PCI Controller (PCI bus address) -> PCI Bus.
> > >
> > > While most bus fabrics preserve address consistency, some modify addresses
> > > to intermediate values. The `parent_bus_offset` enables PCI controllers to
> > > translate these intermediate addresses correctly to PCI bus addresses.
> > >
> > > Pave the road to remove hardcoded cpu_addr_fixup() and similar patterns in
> > > PCI controller drivers.
> > > ...
> >
> > > +++ b/drivers/pci/of.c
> > > @@ -402,7 +402,17 @@ static int devm_of_pci_get_host_bridge_resources(struct device *dev,
> > >  			res->flags &= ~IORESOURCE_MEM_64;
> > >  		}
> > >
> > > -		pci_add_resource_offset(resources, res,	res->start - range.pci_addr);
> > > +		/*
> > > +		 * IORESOURCE_IO res->start is io space start address.
> > > +		 * IORESOURCE_MEM res->start is cpu start address, which is the
> > > +		 * same as range.cpu_addr.
> > > +		 *
> > > +		 * Use (range.cpu_addr - range.parent_bus_addr) to align both
> > > +		 * IO and MEM's parent_bus_offset always offset to cpu address.
> > > +		 */
> > > +
> > > +		pci_add_resource_parent_bus_offset(resources, res, res->start - range.pci_addr,
> > > +						   range.cpu_addr - range.parent_bus_addr);
> >
> > I don't know exactly where it needs to go, but I think we can call
> > .cpu_addr_fixup() once at startup on the base of the region.  This
> > will tell us the offset that applies to the entire region, i.e.,
> > parent_bus_offset.
> >
> > Then we can remove all the .cpu_addr_fixup() calls in
> > cdns_pcie_host_init_address_translation(),
> > cdns_pcie_set_outbound_region(), and dw_pcie_prog_outbound_atu().
> >
> > Until we can get rid of all the .cpu_addr_fixup() implementations,
> > We'll still have that single call at startup (I guess once for cadence
> > and another for designware), but it should simplify the current
> > callers quite a bit.
> 
> I don't think it can simple code. cdns_pcie_set_outbound_region() and
> dw_pcie_prog_outbound_atu() are called by EP functions, which have not use
> "resource" to manage outbound windows. 

Let's ignore cadence for now.  I don't think we need to solve that
until later.

dw_pcie_prog_outbound_atu() is called by:

  - dw_pcie_other_conf_map_bus(): atu.parent_bus_addr = pp->cfg0_base

    I think dw_pcie_host_init() can set pp->cfg0_base with the correct
    intermediate address, either via the the of_property_read_reg() or
    .cpu_addr_fixup().

    If dw_pcie_host_init() does this, then we don't need
    .cpu_addr_fixup() in dw_pcie_prog_outbound_atu().

  - dw_pcie_rd_other_conf(): atu.parent_bus_addr = pp->io_base

    Similarly, dw_pcie_host_init() should be able to set pp->io_base
    to the intermediate address, so we don't need .cpu_addr_fixup() in
    dw_pcie_prog_outbound_atu().

  - dw_pcie_iatu_setup(): atu.parent_bus_addr = entry->res->start

    Here "entry" iterates through bridge->windows, and we should be
    able to set entry->parent_bus_offset at init-time, using
    .cpu_addr_fixup() if necessary, so we can apply that offset
    unconditionally, regardless of use_parent_dt_ranges, and we won't
    need .cpu_addr_fixup() in dw_pcie_prog_outbound_atu().

  - dw_pcie_pme_turn_off:
    atu.parent_bus_addr = pci->pp.msg_res->start - pci->pp.msg_parent_bus_offset

    This should be the same as dw_pcie_iatu_setup() since
    msg_parent_bus_offset comes from the window iteration in
    dw_pcie_host_request_msg_tlp_res().  As long as the windows have
    the correct parent_bus_offset at init-time, we should be all set.

