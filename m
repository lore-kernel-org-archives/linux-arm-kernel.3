Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17A47CC6B0E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 14:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NKgWpRn+MUq56NXtW57Ns2zM4AL0i28gQBtCAoCU3/0=; b=m2g5dRirgdQci+ssbaEf9XLRY5
	aKB7AZC7olcSZKboh2b49f0Pbf0WsS9zH5n+mYV6C8AZyT4wpKcspcqAWD6jOWQ5mS9S+qLyywuoV
	xQMqTMO3dhaU848kVVjUas3Og5GAy12PTokqnXuTLgvTNRaTCZeGk/HjTc+qPR32XRcqE4xeBjQVK
	sLOHZXbUeshW5FOQlRkpKkheg1ofr4pwxTskfx0OjmYuFeVYDYt4WHUZYXxZfaeWCOgpS5QYBxkwd
	MpFxLTb2T1c4Jwp/L0vd7ELwoGYnNVXiSMX6CjQ9E2g58UEaIhku+tObFyjJreVbxjrJK+GhZj3c8
	/HivVwxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGdgS-0000000D9OG-41ZQ;
	Tue, 13 Oct 2026 14:40:52 +0000
Received: from inva021.nxp.com ([92.121.34.21])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGdgP-0000000D9My-18Y0;
	Tue, 13 Oct 2026 14:40:50 +0000
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 060232000E5;
	Tue, 13 Oct 2026 16:40:47 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id E2F26200012;
	Tue, 13 Oct 2026 16:40:46 +0200 (CEST)
Received: from lsv051416.swis.nl-cdc01.nxp.com (lsv051416.swis.nl-cdc01.nxp.com [10.168.48.122])
	by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 697B2202DA;
	Tue, 13 Oct 2026 16:40:46 +0200 (CEST)
Date: Tue, 13 Oct 2026 16:40:46 +0200
From: Jan Petrous <jan.petrous@oss.nxp.com>
To: Frank Li <Frank.li@oss.nxp.com>
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
	Ionut Vicovan <ionut.vicovan@nxp.com>, Andrew Lunn <andrew@lunn.ch>,
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
Subject: Re: [PATCH RFC v3 01/12] dt-bindings: phy: Add NXP S32G SerDes
 subsystem
Message-ID: <as5C7o1joORcdesQ@lsv051416.swis.nl-cdc01.nxp.com>
References: <20260919-s32g_serdes-v3-0-9d68868c1e89@oss.nxp.com>
 <20260919-s32g_serdes-v3-1-9d68868c1e89@oss.nxp.com>
 <as0tiQwquNkdlF2i@SMW015318>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <as0tiQwquNkdlF2i@SMW015318>
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_074049_592398_4041E82C 
X-CRM114-Status: GOOD (  32.01  )
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

On Mon, Oct 12, 2026 at 01:57:13PM -0500, Frank Li wrote:
> On Sat, Sep 19, 2026 at 08:54:29AM +0200, Jan Petrous via B4 Relay wrote:
> > [You don't often get email from devnull+jan.petrous.oss.nxp.com@kernel.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> >
> > From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
> >
> > The S32G SerDes subsystem multiplexes two lanes between a PCIe PHY and
> > two DesignWare XPCS instances. Describe it with one node per SerDes and
> > one child node per lane.
> >
> > Compared to the previous revision, the vendor nxp,sys-mode property is
> > removed: the SS_RW_REG_0[SUBSYS_MODE] value is fully derivable from the
> > child-node lane mux and the XPCS instance routing (nxp,xpcs-instance).
> > Each working mode described here has a unique lane mux, so the mode is
> > a pure function of the child nodes. The reference-clock rate is
> > validated against the derived mode; it is not used to select it.
> >
> > The 3.125 Gbit/s working modes are deliberately not described yet.
> > Distinguishing them from the 1.25 Gbit/s dual-XPCS mode requires a
> > per-lane 2500BASE-X capability that this binding does not express, and
> > the reference clock does not distinguish them either - both accept 100
> > or 125 MHz. They are added by the 2500BASE-X follow-up.
> >
> > Only the PCIe lane child gets '#phy-cells'. An XPCS lane is not a
> > generic PHY provider; the Ethernet controller references it through the
> > standard pcs-handle property instead.
> 
> Is it possible Ether controller use standard phy interface? of use standard
> pcs-handle to phy convertion
> 
> pcs-handle = <&pcs>
> 
> pcs: pcs = {
> 	compatible = "pcs-to-phy";
> 	phys = <&phy ...>;
> }
> 

The MAC needs a phylink_pcs, not a PHY: the XPCS does the C37 autoneg
and link state. pcs-handle is the standard property for that, and in
v4 the XPCS is driven by pcs-xpcs. The lane mux is fixed before the
SerDes reset is released, so the MAC has nothing to set on a generic
PHY, and a "pcs-to-phy" node would describe a block the SoC does not
have.

> >
> > S32G2 and S32G3 use distinct compatibles without fallback because the
> > full reference-manual mode tables differ per SoC and per SerDes
> > instance.
> >
> > Co-developed-by: Vincent Guittot <vincent.guittot@linaro.org>
> > Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> > Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
> > ---
> >  .../devicetree/bindings/phy/nxp,s32g-serdes.yaml   | 258 +++++++++++++++++++++
> >  1 file changed, 258 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/phy/nxp,s32g-serdes.yaml b/Documentation/devicetree/bindings/phy/nxp,s32g-serdes.yaml
> > new file mode 100644
> > index 000000000000..6343d01bfde4
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/phy/nxp,s32g-serdes.yaml
> > @@ -0,0 +1,258 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/phy/nxp,s32g-serdes.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: NXP S32G2xxx/S32G3xxx SerDes PHY subsystem
> > +
> > +maintainers:
> > +  - Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
> > +  - Jan Petrous <jan.petrous@oss.nxp.com>
> > +
> > +description: |
> > +  The SerDes subsystem multiplexes two SerDes lanes between one PCIe
> > +  controller PHY and two Synopsys DesignWare XPCS (Ethernet PCS) instances,
> > +  behind a shared 2-lane combo PHY. The active routing is selected by the
> > +  SS_RW_REG_0[SUBSYS_MODE] field.
> > +
> > +  Reference-manual working modes described by this binding:
> > +
> > +  Mode  Lane0   Lane1   PHY refclk (MHz)  Description
> > +  ------------------------------------------------------------
> > +  0     PCIe    PCIe    100               PCIe x2
> > +  1     PCIe    XPCS0   100               PCIe x1 + SGMII
> > +  2     PCIe    XPCS1   100               PCIe x1 + SGMII
> > +  3     XPCS0   XPCS1   100 or 125        dual SGMII, 1.25 Gbit/s
> > +
> > +  Which Ethernet MAC an XPCS instance feeds is fixed by the SoC integration
> > +  and differs per SoC and per SerDes instance - on S32G3 SerDes_0, XPCS0
> > +  feeds GMAC0 and XPCS1 feeds PFE_MAC2, while on SerDes_1 the same two
> > +  instances feed PFE_MAC0 and PFE_MAC1. That mapping is a property of the
> > +  SoC, not of this binding, and is resolved by the driver.
> 
> Roughly look like use argument is little bit better
> 
> <&phys PHY_MODE instance(0/1)>;
> 

Rob suggested that in v2 [1]. Child nodes stayed because:

- SUBSYS_MODE is written before the reset is released, so the SerDes
  driver needs the whole lane mux at its own probe. With cells it would
  have to walk the tree for its consumers, including disabled ones, and
  an unconnected lane has no consumer to carry a cell.

- The MAC uses pcs-handle, which has no argument cells, so the XPCS
  instance has nowhere else to go.

- A type cell duplicates phy_set_mode_ext(PHY_MODE_PCIE) from the PCIe
  driver.

- In mode 0 there is one x2 PHY, not two lane PHYs.

I will put this in the v4 commit message. If you or Rob still prefer
cells, let me know.

[1] https://lore.kernel.org/all/CAL_Jsq+SswpTjQShfkdhVwL_k8gJ_5+NrecPCUiFR52UB5zNMA@mail.gmail.com/

BR.
/Jan

