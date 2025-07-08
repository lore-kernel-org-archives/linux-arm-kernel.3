Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA12AC8303C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 07:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JTTMxggvLoDSiOXEFuEOF/iNuu6oRiIoSG8uND7I2NA=; b=cmnWLr8DIbBhzaNOEErPr40Z3d
	cULwf98AaQQDJLoIgD/1DtoAQ3IqD8ufvUtuk07N/jUqAl3X6ms84YpPRzGRGcI9S2Wc9SXonp4Nc
	qzxDslua0w0lZBxKnK2xAhkk3A6vKfw2uEzmJEPxvc+sTdftZ0Xc+M5KbcB8PF6szufBalsNq0o/A
	K/zqNKVI6GlCqSmJPXtyfbto0M2clNxX1PiFXpEJuRcjKcWu3yNojMRs3DceOlTQKzGE59QXwMCoE
	os1zof5FxXorauIgq8HlRqG5QcGrYZpqYO4I0KoG0SIvUkk+GYDUi4GFWfxDzsGGHfNHF6bXHNHZB
	QdUfDevA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ30F-00000004cbm-2URG;
	Tue, 08 Jul 2025 07:44:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ2xu-00000004c77-2QgD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 07:42:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 175155C621F;
	Tue,  8 Jul 2025 07:42:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27334C4CEED;
	Tue,  8 Jul 2025 07:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751960529;
	bh=cu8tPtnIUR3fiQLsu8sRQhSmqshZhYdBxyLo1WB3PBU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QiizzGcu3oRSNRBv2aXILXXI1jg/Hc9yWXALIH5umhNyhCXU4T26Edl4g/GJM58CG
	 ujpBuIVs0g4usaLKSn2uI8/JFIkS9F72TnBwAO4uzliU8HW7+Q+4D1s2rHMDXc1jov
	 SP8z9v8nUn5uZY205/ZM2aSHwc/lkkqpepGaRNVyI7RJdbKlbMYR5W7+YbzndanibP
	 i90De+r0ey0cfLKrt02T2SG6pjMujzQqnB128lrSkEVDiUrR6D0x3yEtPT3ooRh5Ml
	 DJwJINdjIuIQ6syHiFKJMa7OKU8yMupCzT11l2q7f6CejvPGwW3gf5zxama9IeVNPu
	 WC1wzom8PBMIA==
Date: Tue, 8 Jul 2025 13:11:59 +0530
From: "mani@kernel.org" <mani@kernel.org>
To: Hongxing Zhu <hongxing.zhu@nxp.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Frank Li <frank.li@nxp.com>, 
	"l.stach@pengutronix.de" <l.stach@pengutronix.de>, "lpieralisi@kernel.org" <lpieralisi@kernel.org>, 
	"kwilczynski@kernel.org" <kwilczynski@kernel.org>, "robh@kernel.org" <robh@kernel.org>, 
	"bhelgaas@google.com" <bhelgaas@google.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, 
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, 
	"festevam@gmail.com" <festevam@gmail.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] PCI: imx6: Correct the epc_features of i.MX8M chips
Message-ID: <pxxwlm6su6ugfo4m7borpgvvlczfrhdarzcy45fipqwvxaxban@u223udsukdwc>
References: <20250617073441.3228400-1-hongxing.zhu@nxp.com>
 <20250707193415.GA2095765@bhelgaas>
 <AS8PR04MB8676B8D14A5C54E8C32025BD8C4EA@AS8PR04MB8676.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AS8PR04MB8676B8D14A5C54E8C32025BD8C4EA@AS8PR04MB8676.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_004210_703946_91B6ED2A 
X-CRM114-Status: GOOD (  29.81  )
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

On Tue, Jul 08, 2025 at 07:34:57AM GMT, Hongxing Zhu wrote:
> > -----Original Message-----
> > From: Bjorn Helgaas <helgaas@kernel.org>
> > Sent: 2025年7月8日 3:34
> > To: Hongxing Zhu <hongxing.zhu@nxp.com>
> > Cc: Frank Li <frank.li@nxp.com>; l.stach@pengutronix.de;
> > lpieralisi@kernel.org; kwilczynski@kernel.org; mani@kernel.org;
> > robh@kernel.org; bhelgaas@google.com; shawnguo@kernel.org;
> > s.hauer@pengutronix.de; kernel@pengutronix.de; festevam@gmail.com;
> > linux-pci@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> > imx@lists.linux.dev; linux-kernel@vger.kernel.org
> > Subject: Re: [PATCH v2] PCI: imx6: Correct the epc_features of i.MX8M chips
> > 
> > On Tue, Jun 17, 2025 at 03:34:41PM +0800, Richard Zhu wrote:
> > > i.MX8MQ PCIes have three 64-bit BAR0/2/4 capable and programmable
> > BARs.
> > > But i.MX8MM and i.MX8MP PCIes only have BAR0/BAR2 64bit
> > programmable
> > > BARs, and one 256 bytes size fixed BAR4.
> > >
> > > Correct the epc_features for i.MX8MM and i.MX8MP PCIes here. i.MX8MQ
> > > is the same as i.MX8QXP, so set i.MX8MQ's epc_features to
> > > imx8q_pcie_epc_features.
> > >
> > > Fixes: 75c2f26da03f ("PCI: imx6: Add i.MX PCIe EP mode support")
> > > Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> > > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > 
> > "Correct the epc_features" doesn't include any specific information, and it's
> > hard to extract the changes for a device from the commit log.
> > 
> > This is really two fixes that should be separated so the commit logs can be
> > specific:
> Yes, it's right.
> Since it's just one line change for i.MX8MQ. So, I combine the changes into
> this commit for i.MX8M chips.
> 
> Hi Mani:
> Since it had been applied, I don't know how to proceed.
> Should I separate this commit into two patches, and re-send them again?
> Thanks.
> 

I've now dropped the patch from controller/imx6. Please resend them. Also, CC
the stable list with relevant Fixes tag.

- Mani

> Best Regards
> Richard Zhu
> > 
> >   - For IMX8MQ_EP, use imx8q_pcie_epc_features (64-bit BARs 0, 2, 4)
> >     instead of imx8m_pcie_epc_features (64-bit BARs 0, 2).
> > 
> >   - For IMX8MM_EP and IMX8MP_EP, add fixed 256-byte BAR 4 in
> >     imx8m_pcie_epc_features.
> > 
> > > ---
> > >  drivers/pci/controller/dwc/pci-imx6.c | 4 +++-
> > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/pci/controller/dwc/pci-imx6.c
> > > b/drivers/pci/controller/dwc/pci-imx6.c
> > > index 5a38cfaf989b..9754cc6e09b9 100644
> > > --- a/drivers/pci/controller/dwc/pci-imx6.c
> > > +++ b/drivers/pci/controller/dwc/pci-imx6.c
> > > @@ -1385,6 +1385,8 @@ static const struct pci_epc_features
> > imx8m_pcie_epc_features = {
> > >  	.msix_capable = false,
> > >  	.bar[BAR_1] = { .type = BAR_RESERVED, },
> > >  	.bar[BAR_3] = { .type = BAR_RESERVED, },
> > > +	.bar[BAR_4] = { .type = BAR_FIXED, .fixed_size = SZ_256, },
> > > +	.bar[BAR_5] = { .type = BAR_RESERVED, },
> > >  	.align = SZ_64K,
> > >  };
> > >
> > > @@ -1912,7 +1914,7 @@ static const struct imx_pcie_drvdata drvdata[] = {
> > >  		.mode_mask[0] = IMX6Q_GPR12_DEVICE_TYPE,
> > >  		.mode_off[1] = IOMUXC_GPR12,
> > >  		.mode_mask[1] = IMX8MQ_GPR12_PCIE2_CTRL_DEVICE_TYPE,
> > > -		.epc_features = &imx8m_pcie_epc_features,
> > > +		.epc_features = &imx8q_pcie_epc_features,
> > >  		.init_phy = imx8mq_pcie_init_phy,
> > >  		.enable_ref_clk = imx8mm_pcie_enable_ref_clk,
> > >  	},
> > > --
> > > 2.37.1
> > >

-- 
மணிவண்ணன் சதாசிவம்

