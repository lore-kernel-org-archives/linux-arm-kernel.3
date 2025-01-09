Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36F98E7719A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 12:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aldVJPdw0EUIAhOcl//mQC1NBVldpSMbv7V7noWQKqk=; b=3h84ZIqZh2GejGkTfA7s4yYI9I
	ylX0nyE2S3fHXv5buOeaJsPTaepyVi7Kh7bC6f0wMWR5P8IQpSWAJcEZGgfFcUovXsSkZzO613D7r
	AT4Pxz3BL2A2BqSx4HngKYfGzwyiMDWyveCz0ThuxP7B4YolmhvU/sggPnHC9vAewO6Kmks7KYdWg
	zXrpIMgFf/bkoOqyP6CuSGUPJExcKNfohWZVLC6OAbhTbVGtx4++/NqIZ9AJqnfDkEQ3NhO6H2STy
	cA2V5V3A529aSW5Lj3iFM0iltVGBLLBibmCNGMLbBHvXB3dL48Pe4SXIvcbiVz+/UXBgPqis1uhAf
	h4nbLKtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVrYh-0000000BqEP-1HT0;
	Thu, 09 Jan 2025 12:22:43 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVrWO-0000000Bpfe-0X46;
	Thu, 09 Jan 2025 12:20:21 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 509CKCjk3159059
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 9 Jan 2025 06:20:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736425212;
	bh=aldVJPdw0EUIAhOcl//mQC1NBVldpSMbv7V7noWQKqk=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=UvSGZZoLZvA7vllP9vpaphtJXUr4U4mp1cM3lCZtAaAO/a69XRabBlIo/j1V6Oxig
	 KCLpvKhkLwJR7Q6FaIqbhbL2Vsx7UiNi72r12aZUhoc48NJ7k3JSgRyuGA081E5CTv
	 tnMqhltsMQYQJSX5nn2veqBkQ1obe3hhNG5//bsM=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 509CKBqo049829
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 9 Jan 2025 06:20:12 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 9
 Jan 2025 06:20:10 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 9 Jan 2025 06:20:10 -0600
Received: from localhost (uda0492258.dhcp.ti.com [10.24.72.104])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 509CK9i6014553;
	Thu, 9 Jan 2025 06:20:10 -0600
Date: Thu, 9 Jan 2025 17:50:09 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
CC: Siddharth Vadapalli <s-vadapalli@ti.com>, <vkoul@kernel.org>,
        <kishon@kernel.org>, <sjakhade@cadence.com>, <rogerq@kernel.org>,
        <thomas.richard@bootlin.com>, <u.kleine-koenig@baylibre.com>,
        <eballetb@redhat.com>, <linux-phy@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>
Subject: Re: [PATCH v2 2/2] phy: cadence-torrent: Add PCIe multilink + USB
 with same SSC register config for 100 MHz refclk
Message-ID: <wgc5npcq3ncwskeab53quxvxle6nivf34lcqjd3gcmtnr6756m@l5pgiqkcxnm6>
References: <20250106131925.263240-1-s-vadapalli@ti.com>
 <20250106131925.263240-3-s-vadapalli@ti.com>
 <24498c4e-c517-46b9-8d0c-ff1e3a308228@wanadoo.fr>
 <wsdjqishkw2mh3xns4okku4vomehp6x3fjqs7e32ye27gankjx@fbbo3td66fk3>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <wsdjqishkw2mh3xns4okku4vomehp6x3fjqs7e32ye27gankjx@fbbo3td66fk3>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_042020_263720_4EC1F81A 
X-CRM114-Status: GOOD (  24.14  )
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

On Tue, Jan 07, 2025 at 10:49:38AM +0530, Siddharth Vadapalli wrote:
> On Mon, Jan 06, 2025 at 11:05:35PM +0100, Christophe JAILLET wrote:
> > Le 06/01/2025 à 14:19, Siddharth Vadapalli a écrit :
> > > From: Swapnil Jakhade <sjakhade@cadence.com>
> > > 
> > > Add register sequences and support for PCIe multilink + USB configuration
> > > for 100MHz reference clock. The same SSC is used for both PCIe and USB.
> > > 
> > > Signed-off-by: Swapnil Jakhade <sjakhade@cadence.com>
> > > Co-developed-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> > > Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> > > ---
> > ...
> > 
> > > @@ -2513,6 +2517,44 @@ int cdns_torrent_phy_configure_multilink(struct cdns_torrent_phy *cdns_phy)
> > >   		phy_t1 = fns(cdns_phy->protocol_bitmask, 0);
> > >   		phy_t2 = fns(cdns_phy->protocol_bitmask, 1);
> > > +
> > > +		/**
> > 
> > Why kernel-doc like start of comment?
> > Only /* ?
> > 
> > > +		 * PCIe Multilink configuration can be supported along with a
> > > +		 * non-PCIe protocol. The existing limitation associated with
> > > +		 * the standalone PCIe Multilink configuration still remains,
> > > +		 * implying that there can be only two links (subnodes) of the
> > > +		 * PHY type PCIe which constitute the PCIe Multilink.
> > > +		 *
> > > +		 * Such configurations are handled by introducing a new protocol
> > > +		 * namely TYPE_PCIE_ML. Both of the PCIe links which have the
> > > +		 * protocol as TYPE_PCIE shall be treated as though the protocol
> > > +		 * corresponding to them is TYPE_PCIE_ML only for the sake of
> > > +		 * configuring the SERDES.
> > > +		 *
> > > +		 * PCIe Multilink configuration can be identified by checking if
> > > +		 * there are exactly two links with phy_type set to TYPE_PCIE.
> > > +		 * phy_t1 and phy_t2 are modified in such cases to support the
> > > +		 * PCIe Multilink configuration with a non-PCIe protocol.
> > > +		 */
> > ...
> > 
> > > @@ -3134,6 +3180,37 @@ static void cdns_torrent_phy_remove(struct platform_device *pdev)
> > >   	cdns_torrent_clk_cleanup(cdns_phy);
> > >   }
> > > +/* Multilink PCIe and USB Same SSC link configuration */
> > > +static struct cdns_reg_pairs ml_pcie_usb_link_cmn_regs[] = {
> > > +	{0x0002, PHY_PLL_CFG},
> > > +	{0x8600, CMN_PDIAG_PLL0_CLK_SEL_M0}
> > > +};
> > 
> > Maybe const could be added here and below?
> > 
> > > +
> > > +static struct cdns_reg_pairs ml_pcie_usb_xcvr_diag_ln_regs[] = {
> > > +	{0x0100, XCVR_DIAG_HSCLK_SEL},
> > > +	{0x0013, XCVR_DIAG_HSCLK_DIV},
> > > +	{0x0812, XCVR_DIAG_PLLDRC_CTRL}
> > > +};
> 
> I will update this patch based on your feedback in the v3 series. Thank
> you for the review.

I have posted the v3 series at:
https://lore.kernel.org/r/20250109121614.754466-1-s-vadapalli@ti.com/

Regards,
Siddharth.

