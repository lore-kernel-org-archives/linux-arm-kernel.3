Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70FA3FD3760
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 14:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0xqA8pTldtX3xiOzXSYu5Y/y3HiXW1LSmB3BwyYVado=; b=xSnnrHNgwtMB6GObgV77lss867
	3rTbLpZCBNtyn2qpxxTDUhTSx2jDg7AbLzyxS6vsTlM6lWJYrob6itR4nQEzjh0z3EEhV4Bd4D3E8
	6XZFmGXx+keYxZORfFr89ugBX2bAiYT5DorCQQ+1ZfEFG8WVn+Xh2bljtdb9/wWo2WMFC/sLZoSf4
	WU3w3wYJ6GUZvlDljQF2HO2+KQEyqDcxgiaKk41SIgC4ZtYyuDx+tmapfcyq7701v9Dt9c1X6MCnt
	ozt2+Av2Iy4ZRM5OaFohgvjvy8OakCQfyVtJiChjSiLtom3SK1Z7wZZOLNVHQ4hBCM7uU6i0mG+Ux
	K0WeJwtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvGJg-00000004EUe-0eLJ;
	Wed, 25 Feb 2026 14:56:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvGJe-00000004EUY-3q39
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 14:56:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 068EE600AD;
	Wed, 25 Feb 2026 14:56:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B96BDC116D0;
	Wed, 25 Feb 2026 14:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772031401;
	bh=/ekAI3FxEdBx7sDxmd8e8+qIb8tpNERvcll8LbBLE/k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=axqu1wIaL2/ctIDTLk86l1FqIjBKZEVDSINEXFudV+MBsskAR9rsTAyDwpUrI5JJm
	 mtErxFDeN3PzpCOH8msfSvguy4/7cuC7jJFRHAvw4FGXzJGRN7Mjys/gHkLVAnVedy
	 Ol4p16uTOJN3Mg3RiHELnqFagmyA2m3ip7J7UfQCWZsfJaU1RqjlTgI8L2XqZm8Yy+
	 YV67o2Gli0kR7+BKwXrmJs0YkwkStO2tk7bjc6UM3QL9u6HeAguiRleO3v+oJtavi9
	 9qaAWTTpi084DL0GDHmDXmuL8hPts3cHccNHu7DUeuOq14571C13WjhU5kf2qzVu8F
	 Z52b7DeQ1R31A==
Date: Wed, 25 Feb 2026 15:56:34 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Cc: Frank Li <Frank.li@nxp.com>, Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Marek Vasut <marek.vasut+renesas@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Koichiro Den <den@valinux.co.jp>,
	Damien Le Moal <dlemoal@kernel.org>, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 5/9] PCI: dwc: Replace BAR_RESERVED with BAR_DISABLED in
 glue drivers
Message-ID: <aZ8Nom0TJKnYdIiJ@ryzen>
References: <20260217212707.2450423-11-cassel@kernel.org>
 <20260217212707.2450423-16-cassel@kernel.org>
 <aZToh35w7GYrOmgc@lizhi-Precision-Tower-5810>
 <bc3e8be5-8ffa-47f3-91e2-b3c0e9f8a28b@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bc3e8be5-8ffa-47f3-91e2-b3c0e9f8a28b@nvidia.com>
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

On Mon, Feb 23, 2026 at 10:16:51AM +0530, Manikanta Maddireddy wrote:
> 
> On 18/02/26 3:45 am, Frank Li wrote:
> > On Tue, Feb 17, 2026 at 10:27:11PM +0100, Niklas Cassel wrote:
> > > Most DWC based EPC glue drivers that have BARs marked as BAR_RESERVED in
> > > epc_features also call dw_pcie_ep_reset_bar() for these reserved BARs in
> > > ep->ops->init().
> > > 
> > > An EPF driver will be able to get/enable BARs that have been disabled/reset
> > > unless they are marked as BAR_RESERVED (see pci_epc_get_next_free_bar()).
> > > 
> > > Thus all EPC drivers that have a BAR marked as BAR_RESERVED in epc_features
> > > AND call dw_pcie_ep_reset_bar() should really be marked as BAR_DISABLED.
> > > 
> > > BARs that are marked as BAR_RESERVED in epc_features but for which
> > > dw_pcie_ep_reset_bar() is not called in ep->ops->init() are still kept as
> > > BAR_RESERVED.
> > combine the same condition together to make easy to read. like
> > 
> > "For BAR_RESERVED bars, change to BAR_DISABLED if call dw_pcie_ep_reset_bar().
> > and keep as BAR_RESERVED if not dw_pcie_ep_reset_bar() in ep-ops-init()"
> > 
> > Frank
> > 
> > > No EPC drivers outside drivers/pci/controllers/dwc mark their BARs as
> > > BAR_RESERVED, so there is nothing to do in non-DWC based EPC drivers.
> > > 
> > > Signed-off-by: Niklas Cassel <cassel@kernel.org>

Note: the proper tag is Tested-by.
(I noticed that b4 did not pick up your tags.)

> Tested by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
> > > ---
> > >   drivers/pci/controller/dwc/pci-imx6.c         | 12 ++++++------
> > >   drivers/pci/controller/dwc/pcie-rcar-gen4.c   |  6 +++---
> > >   drivers/pci/controller/dwc/pcie-tegra194.c    |  8 ++++----
> > >   drivers/pci/controller/dwc/pcie-uniphier-ep.c |  4 ++--

> I see BAR_RESERVED in pci-keystone.c driver in linux-next branch.
> Do you have any patch which changed BAR_RESERVED to different type
> in pci-keystone.c driver?

No, I did not change keystone, because that is the only DWC base glue driver
that has never disabled these BARs by default.

I will add a TODO to the keystone driver:

diff --git a/drivers/pci/controller/dwc/pci-keystone.c b/drivers/pci/controller/dwc/pci-keystone.c
index 20fa4dadb82a..576a78a9f6e5 100644
--- a/drivers/pci/controller/dwc/pci-keystone.c
+++ b/drivers/pci/controller/dwc/pci-keystone.c
@@ -933,6 +933,11 @@ static const struct pci_epc_features ks_pcie_am654_epc_features = {
        DWC_EPC_COMMON_FEATURES,
        .msi_capable = true,
        .msix_capable = true,
+       /*
+        * TODO: BAR_RESERVED should either be replaced with BAR_DISABLED or,
+        * if the should continue to be enabled, then the driver should define
+        * what is behind the reserved BARs, see struct pci_epc_bar_rsvd_region.
+        */
        .bar[BAR_0] = { .type = BAR_RESERVED, },
        .bar[BAR_1] = { .type = BAR_RESERVED, },
        .bar[BAR_2] = { .type = BAR_RESIZABLE, },

