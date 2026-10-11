Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 389B3CA9EC9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Oct 2026 06:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=73hy7ODcHX69tB6dhSusDfRoefayQCMd0jKQ8EH7JzM=; b=L/kHj0iomv9hYgC0bc0WcS7qwh
	FSUt8hDqst/zWHIRgLQMw90nNrspZ4QzoTwZYLStJsKR746BEveVvu3rpU3mzSsr3zbjA0XIcd2cL
	31rM/Tl2AOUG/KRiyeIc5E53NHIv8K0gD+Z/dYR5pgrhJ9w4N5j+oycYyuRUx9B1c6Ul5LMRd5xQX
	GEl9K1zQp3KOOnirEsjGpYQubmCM345NY2hNbTB/foimPS2k7svBEX5CosCYKOX5akCJdCNJWv57C
	leJUONScrlghWgNiUtOQSv1m9qWYquhaz2Nwz8kxh04CcAwq2lF5OreqPjmdmb40G+pfqb1e2D/TP
	b+jHfsIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFmei-00000008kDS-2hGK;
	Sun, 11 Oct 2026 06:03:33 +0000
Received: from inva020.nxp.com ([92.121.34.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFmef-00000008kD0-2JIr;
	Sun, 11 Oct 2026 06:03:30 +0000
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id D45D01A00B4;
	Sun, 11 Oct 2026 08:03:27 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id B25C61A0031;
	Sun, 11 Oct 2026 08:03:27 +0200 (CEST)
Received: from lsv051416.swis.nl-cdc01.nxp.com (lsv051416.swis.nl-cdc01.nxp.com [10.168.48.122])
	by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 29BEC20301;
	Sun, 11 Oct 2026 08:03:27 +0200 (CEST)
Date: Sun, 11 Oct 2026 08:03:27 +0200
From: Jan Petrous <jan.petrous@oss.nxp.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>,
	NXP S32 Linux Team <s32@nxp.com>, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Bogdan Hamciuc <bogdan.hamciuc@nxp.com>,
	Ionut Vicovan <ionut.vicovan@nxp.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Clark Wang <xiaoning.wang@nxp.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	imx@lists.linux.dev, linux-pci@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Vincent Guittot <vincent.guittot@linaro.org>
Subject: Re: [PATCH RFC v3 04/12] net: pcs: add NXP SerDes XPCS shared core
Message-ID: <assmr2PH8064/pJn@lsv051416.swis.nl-cdc01.nxp.com>
References: <20260919-s32g_serdes-v3-0-9d68868c1e89@oss.nxp.com>
 <20260919-s32g_serdes-v3-4-9d68868c1e89@oss.nxp.com>
 <07c5ed86-755a-4094-b45a-6316d10f4515@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <07c5ed86-755a-4094-b45a-6316d10f4515@lunn.ch>
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_230329_877691_D24D1DFE 
X-CRM114-Status: GOOD (  16.76  )
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

On Sun, Sep 20, 2026 at 08:39:26PM +0200, Andrew Lunn wrote:
> On Sat, Sep 19, 2026 at 08:54:32AM +0200, Jan Petrous via B4 Relay wrote:
> > From: Clark Wang <xiaoning.wang@nxp.com>
> > 
> > The SerDes subsystems found on NXP S32G and i.MX SoCs integrate a
> > Synopsys DesignWare Ethernet XPCS and an Ethernet PHY (PMA) with an
> > identical register layout. Only the register transport differs: indirect
> > memory mapped access on S32G, Clause 45 MDIO on i.MX.
> > 
> > Add a transport agnostic phylink PCS core which operates on regmaps
> > provided by the platform glue.
> 
> What is not transport agnostic with the current code.
> 
> Think carefully about that, before you answer.
> 

Ok, got it, pcs-xpcs only reaches the hardware through mdiodev_c45_*(), so
whatever sits behind the mii_bus is the transport. pcs-xpcs-plat already
puts the DW indirect MMIO viewport behind one, sja1105 and txgbe put
their own register access behind one, and on i.MX the XPCS is on plain
Clause 45 MDIO in the first place. The claim in the commit message was
wrong, and with it the justification for a second core.

For the next version I will drop this patch and move S32G onto
pcs-xpcs. The SerDes PHY driver registers a mii_bus per XPCS instance
over the existing indirect accessor and creates the PCS with
xpcs_create_pcs_mdiodev(). The S32G PMA sequence becomes a
dw_xpcs_compat .pma_config keyed on an S32G PMA ID, the same way the
SJA1110 and TXGBE ones are.

That leaves two things S32G needs from pcs-xpcs, neither of which is
about the transport:

 - skipping the generic soft reset. The vendor reset
   (VR_MII_DIG_CTRL1.VR_RST) is part of an ordered bring-up of both
   XPCS instances, which the SerDes PHY driver owns because the PMA is
   shared with the PCIe lane. The PMA ID check that already clears
   need_reset for TXGBE and FBNIC would cover it.

 - no EEE. S32G3 does not implement VR_MII_EEE_MCTRL0/1, so
   pcs_enable_eee/pcs_disable_eee must not touch them.

Both will be separate small patches against pcs-xpcs so they can be
judged on their own.

Thanks,
Jan

