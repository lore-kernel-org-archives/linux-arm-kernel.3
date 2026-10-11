Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CFFACA9EC9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Oct 2026 05:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gWVdBJIQI0lJzBMlclOTCAA3gFzpUNMuq1m9MPUCwPg=; b=34svZoJur9gb0R9X0Vmpp0EHRm
	fFSpKRWOK+25BzYVk2EconUIxoUMdVsPyUQWN3OCqY+3x7tVyC1FtzaU9QG3kM8gLVCoyz/pR9XwH
	2VYggBG7U16+nELTUMjpPzLzN2lx59dySrcdqnljL4aB7XSGpWCvs0747mlyE7bnuI6RuDJ3vAtpa
	MHao3xZTuAkJ4m1ZCkUNBrH0307aLkbkFTc7E8ZXZ3wDLUEFXWHMY17uN1552TQoX7sg/7duynqwo
	xK9OHS7RUYu13Iftbw7pkzualJZj+anqknKEW5eWhLhwbu7EDXnL+4tYFNzo2MUesLvdE4KsRiYAd
	BcXIm8RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFmYD-00000008jxH-3QuD;
	Sun, 11 Oct 2026 05:56:49 +0000
Received: from inva020.nxp.com ([92.121.34.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFmYB-00000008jwq-1aci;
	Sun, 11 Oct 2026 05:56:48 +0000
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 3B95F1A00BA;
	Sun, 11 Oct 2026 07:56:45 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 1926F1A00B4;
	Sun, 11 Oct 2026 07:56:45 +0200 (CEST)
Received: from lsv051416.swis.nl-cdc01.nxp.com (lsv051416.swis.nl-cdc01.nxp.com [10.168.48.122])
	by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 7B39720301;
	Sun, 11 Oct 2026 07:56:44 +0200 (CEST)
Date: Sun, 11 Oct 2026 07:56:45 +0200
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
	Vincent Guittot <vincent.guittot@linaro.org>,
	Alexandru-Catalin Ionita <alexandru-catalin.ionita@nxp.com>,
	Bogdan Roman <bogdan-gabriel.roman@nxp.com>
Subject: Re: [PATCH RFC v3 05/12] net: pcs: Add NXP S32G XPCS driver
Message-ID: <asslHXK2nfOii3nQ@lsv051416.swis.nl-cdc01.nxp.com>
References: <20260919-s32g_serdes-v3-0-9d68868c1e89@oss.nxp.com>
 <20260919-s32g_serdes-v3-5-9d68868c1e89@oss.nxp.com>
 <c2c4dbc4-e6b4-47a0-9852-d116c6d21f89@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c2c4dbc4-e6b4-47a0-9852-d116c6d21f89@lunn.ch>
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_225647_694860_CBA2185D 
X-CRM114-Status: GOOD (  11.92  )
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

On Sun, Sep 20, 2026 at 07:07:23PM +0200, Andrew Lunn wrote:
> > +#define SR_MII_CTRL				0x1f0000
> 
> This is 0x1f0000 + MII_BMCR
> 
> > +#define   SS13					BIT(13)
> 
> #define BMCR_SPEED100           0x2000  /* Select 100Mbps              */
> 
> > +#define   AN_ENABLE				BIT(12)
> 
> #define BMCR_ANENABLE           0x1000  /* Enable auto negotiation     */
> 
> > +#define   RESTART_AN				BIT(9)
> 
> #define BMCR_ANRESTART          0x0200  /* Auto negotiation restart    */
> 
> > +#define   DUPLEX_MODE				BIT(8)
> 
> #define BMCR_FULLDPLX           0x0100  /* Full duplex                 */
> 
> > +#define   SS6					BIT(6)
> 
> #define BMCR_SPEED1000          0x0040  /* MSB of Speed (1000)         */
> 
> > +#define SR_MII_STS				0x1f0001
> 
> This is 0x1f0000 + MII_BMSR
> 
> > +#define   LINK_STS				BIT(2)
> 
> #define BMSR_LSTATUS            0x0004  /* Link status                 */
> 
> Please go through all these register definitions and throw out all the
> ones which follow 801.3 and use the values from include/uapi/linux/mii.h
> 
>     Andrew
> 

Done for the next version. SR_MII_CTRL and SR_MII_STS and their bit
definitions are gone; the driver uses MII_BMCR, MII_BMSR and the BMCR_*
and BMSR_* bits from mii.h, addressed in MDIO_MMD_VEND2 rather than
through the flat 0x1fxxxx offsets.

Most of that code goes away anyway: with the move to pcs-xpcs (see the
patch 4 thread), the SGMII configuration and link state handling are
done by pcs-xpcs, which already uses mii.h. What stays in the S32G
driver is the PMA/PLL bring-up, and the definitions left there are the
Synopsys vendor registers at 0x8000 and above in MMD 31, which have no
mii.h equivalent. VR_MII_DIG_CTRL1, the one of them pcs-xpcs already
defines, is taken from pcs-xpcs.h.

Thanks,
Jan


