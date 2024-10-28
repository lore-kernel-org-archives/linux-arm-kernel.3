Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 195C1D5B144
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 20:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LWjsQv9mkAzmYHDKdtrDusKRzscSDXSkXMx0whLHWkI=; b=zs6bvK77CkAbWI7cAsN/EbdXt7
	5Z6M35tr+OwT4tdS3LJsXNLZvZitFj8yYGKhUb2YmEKQ0Fw82sQzC/a8/BaLU2ZkqR7aFs20Nygoo
	Ujrh+1fQ2Ik4VHbb8wuRdgk84YzPmm1OgUmKCVpY/lgIDgJGt5bSn7ZoGhiBhE05UusH43P0/k3mM
	ul0fXhLTyntIy5JFy23xtFAZlyEUvzrLCiHUAA52yw950erywpaoWiFnQzK/xfDnEzvyVM/+ipEoW
	mq5VyB2hR12OYL1dq8u7+MHDlzQC/woIZ26J5hwO1/uQR2lSjzsYNgiZH5eJy29gk30UxjRFr8sDV
	kNT/dILw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5W80-0000000C7Ja-0awz;
	Mon, 28 Oct 2024 20:14:16 +0000
Received: from inva020.nxp.com ([92.121.34.13])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5W6O-0000000C7Df-36Jt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 20:12:38 +0000
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 2726D1A02CA;
	Mon, 28 Oct 2024 21:12:33 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 0F99D1A12AE;
	Mon, 28 Oct 2024 21:12:33 +0100 (CET)
Received: from lsv051416.swis.nl-cdc01.nxp.com (lsv051416.swis.nl-cdc01.nxp.com [10.168.48.122])
	by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 498682039A;
	Mon, 28 Oct 2024 21:12:32 +0100 (CET)
Date: Mon, 28 Oct 2024 21:12:32 +0100
From: Jan Petrous <jan.petrous@oss.nxp.com>
To: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v3 04/16] net: phy: Add helper for mapping RGMII link
 speed to clock rate
Message-ID: <Zx/wMO0YjJ+QK7qT@lsv051416.swis.nl-cdc01.nxp.com>
References: <20241013-upstream_s32cc_gmac-v3-0-d84b5a67b930@oss.nxp.com>
 <20241013-upstream_s32cc_gmac-v3-4-d84b5a67b930@oss.nxp.com>
 <4686019c-f6f1-4248-9555-c736813417b7@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4686019c-f6f1-4248-9555-c736813417b7@lunn.ch>
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_131237_066980_977D244E 
X-CRM114-Status: GOOD (  23.84  )
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
Cc: imx@lists.linux.dev, NXP S32 Linux Team <s32@nxp.com>, Emil Renner Berthing <kernel@esmil.dk>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Eric Dumazet <edumazet@google.com>, Iyappan Subramanian <iyappan@os.amperecomputing.com>, Quan Nguyen <quan@os.amperecomputing.com>, Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>, Russell King <linux@armlinux.org.uk>, Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Richard Cochran <richardcochran@gmail.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, Keyur Chudgar <keyur@os.amperecomputing.com>, Minda Chen <minda.chen@starfivetech.com>, "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>, Heiner Kallweit <hkallweit1@gmail.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, Oct 14, 2024 at 03:40:51PM +0200, Andrew Lunn wrote:
> On Sun, Oct 13, 2024 at 11:27:39PM +0200, Jan Petrous via B4 Relay wrote:
> > From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
> > 
> > The helper rgmii_clock() implemented Russel's hint during stmmac
> > glue driver review:
> > 
> >   > We seem to have multiple cases of very similar logic in lots of stmmac
> >   > platform drivers, and I think it's about time we said no more to this.
> >   > So, what I think we should do is as follows:
> >   >
> >   > add the following helper - either in stmmac, or more generically
> >   > (phylib? - in which case its name will need changing.)
> >   >
> >   > static long stmmac_get_rgmii_clock(int speed)
> >   > {
> >   >        switch (speed) {
> >   >        case SPEED_10:
> >   >                return 2500000;
> >   >
> >   >        case SPEED_100:
> >   >                return 25000000;
> >   >
> >   >        case SPEED_1000:
> >   >                return 125000000;
> >   >
> >   >        default:
> >   >                return -ENVAL;
> >   >        }
> >   > }
> >   >
> >   > Then, this can become:
> >   >
> >   >        long tx_clk_rate;
> >   >
> >   >        ...
> >   >
> >   >        tx_clk_rate = stmmac_get_rgmii_clock(speed);
> >   >        if (tx_clk_rate < 0) {
> >   >                dev_err(gmac->dev, "Unsupported/Invalid speed: %d\n", speed);
> >   >                return;
> >   >        }
> >   >
> >   >        ret = clk_set_rate(gmac->tx_clk, tx_clk_rate);
> > 
> > Suggested-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
> 
> But of an unusual commit message, but it does explain the "Why?".

I will reformulate description in v4.

> 
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> 

Thanks.

> >  
> > +/**
> > + * rgmii_clock - map link speed to the clock rate
> > + * @speed: link speed value
> > + *
> > + * Description: maps RGMII supported link speeds
> > + * into the clock rates.
> > + */
> 
> A Returns: line would be nice. 

 will add it in v4.

Thanks
/Jan

