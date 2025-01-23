Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC946C0218B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 19:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=yEvB1uA43C0B4Vv7cgn3eWUmpN1MvL4hyHINtsEbPs0=; b=sIzeOR8MkHIKnn
	ozUrYvi1J5M3SnSLses0Feh4EpPnGKCOAbQF2xHkzjUFFMomjdulGrJsGQyBkmt8NMLYZaOu0M9MY
	3k1GmMduIpovl4fuDKKcfYaxFQBow3U3067cM1oiDNRHe+CUD6fBAI27e5BIvFLFleIslDTgB5dYD
	EITzu/By101zfQn9RuYl3CMACs7cAdHkhf3evVE1A65CGe+i0ylhG6maFkW3liUuLTpzZZZgVL1Oc
	i4aNAf1fMEZnHlkCsxMwcnpMxniVRaxugG2rB1nuE3NJbZ4SgTHBEyvzQB5wQ60f4I5D5x/QePVmx
	vS8zpGP8p5qM6wsr0fPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tb2WQ-0000000D5RX-2jqp;
	Thu, 23 Jan 2025 19:05:46 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tb2V8-0000000D5Mv-1CxX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jan 2025 19:04:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0CE1FA4102E;
	Thu, 23 Jan 2025 19:02:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4261C4CED3;
	Thu, 23 Jan 2025 19:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737659065;
	bh=hHJYIYvVQNSFfUvSqBc7Seoz8vNYl2K6sccCJXZy6JQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=FRehpicmepTuqm1yVXqleYwTJcp3Foa7lJjXlbM96PUuG7tuSxK7gS56iCJdPvjDq
	 0C2/gPczTRzQ7sDBeT31rwsxA81T514+5sHXrfmJF5pYsubFNAc+6+rmJyIBEQMW8i
	 GPRAtWtVQRcRFlfI8GkXNJOf2SSLrGh55++SiGERF2ZXDqjufdoxG9bSFp8d/H9WwS
	 jzIav7GA5XgptD9oTH2rAoSFqZ3vCQLJ75sX6Hxsxa69Wq4f1eBT3GnjAMOrJOU0Gk
	 2msFwHVBh0YgBlh1i569k8vrz9FvHHJtdhHgh/BvmH3Wg+QSoIgzk67idaYNsS6Ldc
	 FcwCl7bJ7UnPg==
Date: Thu, 23 Jan 2025 13:04:22 -0600
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
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev
Subject: Re: [PATCH v8 2/7] PCI: dwc: Use devicetree 'ranges' property to get
 rid of cpu_addr_fixup() callback
Message-ID: <20250123190422.GA1215672@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z5JegF7i3Ig2pLYB@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_110426_455011_6F876476 
X-CRM114-Status: GOOD (  21.21  )
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

On Thu, Jan 23, 2025 at 10:21:36AM -0500, Frank Li wrote:
> On Fri, Jan 17, 2025 at 10:42:37AM -0500, Frank Li wrote:
> > On Thu, Jan 16, 2025 at 05:29:16PM -0600, Bjorn Helgaas wrote:
> > > On Thu, Jan 16, 2025 at 05:14:00PM -0600, Bjorn Helgaas wrote:
> > > > On Tue, Nov 19, 2024 at 02:44:20PM -0500, Frank Li wrote:
> > > > > parent_bus_addr in struct of_range can indicate address information just
> > > > > ahead of PCIe controller. Most system's bus fabric use 1:1 map between
> > > > > input and output address. but some hardware like i.MX8QXP doesn't use 1:1
> > > > > map.
> ...

> 	I saw you have not picked all of these patches during you rework
> pci git branches.
> 
> 	I know you are busy, do you have chance to pick left patch for 6.14.

This series had a mix of things: several patches related to
.cpu_addr_fixup(), plus several unrelated ones for PHY mode and i.MX8Q
support.  I think I picked up all the unrelated ones.

.cpu_addr_fixup() is a generic problem that affects dwc (dra7xx, imx6,
artpec6, intel-gw, visconti), cadence (cadence-plat), and now
apparently microchip.

I deferred these because I'm hoping we can come up with a more generic
solution that's easier to apply across all these cases.  I don't
really want to merge something that immediately needs to be reworked
for other drivers.

A few of the things I wonder about:

  - dw_pcie_get_parent_addr() has no DWC dependencies, so it doesn't
    make sense to me to have it be DWC-specific and copy and pasted
    to other places that need something similar.

  - It doesn't seem elegant to iterate through for_each_pci_range() in
    devm_of_pci_get_host_bridge_resources(), then again in
    dw_pcie_host_init() for io_bus_addr, then again in
    dw_pcie_iatu_setup() for each window.  Maybe that's the best we
    can do, but maybe there's a way to capture what we need on the
    first time through.

  - The connection between .cpu_addr_fixup() and use_parent_dt_ranges
    is clear in the patches remove a .cpu_addr_fixup(), but not in the
    DWC patches on the other end.

  - Ideally, "use_parent_dt_ranges" would be the default and we
    wouldn't have a flag to indicate that, and drivers would have to
    opt out instead of opt in.  They basically already do that by
    implementing .cpu_addr_fixup(), so maybe we can take advantage of
    that fact.

Bjorn

