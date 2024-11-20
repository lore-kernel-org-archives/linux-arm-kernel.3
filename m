Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09A5BD63930
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 12:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1FVnryMM8lSBpu5IKb6YzzE0+p3MecXFHq+tUNyftqs=; b=Zy9tWZR/36L+TbbQ7lkMg305sF
	54Cy0Et1XPBUGSDbj/Krrdjt9UmpoOfqftLE3U4mILUMe2DJUBoCSCIG1bhHGT1m8DmXeixEdqyT5
	szrir7RVvIZZPsfPLKJ4VuHLut+Q7skKYRUDaHVF3tQ8Ep+AVxxK18G7NtuZJWo9ZWMTjW6scCTVt
	4+Z4lqDed6Mna0bpuoVj3iecJt5B7lHwGZ32ceveR/dczY5SDArITYwEwBe2wBkgJdDuFw1uZ26cW
	5LCRsrxdi2nnuMYIa6i5qt61XWv5XLasaXJMSrxK9nst6cB0qBwF2b9OfSJ/9OPH/aYN+PJhVTQH1
	GucfNOag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDjOG-0000000FFjw-35ly;
	Wed, 20 Nov 2024 12:01:00 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDjNK-0000000FFdI-1zfU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Nov 2024 12:00:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=1FVnryMM8lSBpu5IKb6YzzE0+p3MecXFHq+tUNyftqs=; b=NVsic0aqBY69L9DWCME2+mmF/b
	CE4nxmsQ1kXVHb5JKokNfJizGvCJAxwUeLKHuSgJIUnKSoo5WjR2BBwPXoIzVRaGj9T8Tmto06gZi
	9ZowFFLJBZsKmYLlQAbYxHdwGDEi4ysIKnKKAUTXn7EORLvSaAMzkBBk5BVcd54GMEsw+1hiTHFDS
	QShu4RArI/MXolXw+KA7bvZ0HaQmfBoJfi34jT6Jodsxt65MtJkUQ77rdn3c76W0HU8heSUJjk/3r
	G79IPnI8kDtH4qxtwKDf3DASryoAWElXEYWarb2vhegkObAumfOXuYvZhnTD6K3G3Vn6dVhN6URjH
	3l44bIeQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56694)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tDjMt-0005RK-1U;
	Wed, 20 Nov 2024 11:59:36 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tDjMn-000742-10;
	Wed, 20 Nov 2024 11:59:29 +0000
Date: Wed, 20 Nov 2024 11:59:29 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jan Petrous <jan.petrous@oss.nxp.com>
Subject: Re: [PATCH v5 00/16] Add support for Synopsis DWMAC IP on NXP
 Automotive SoCs S32G2xx/S32G3xx/S32R45
Message-ID: <Zz3PIROyOIvpzlto@shell.armlinux.org.uk>
References: <20241119-upstream_s32cc_gmac-v5-0-7dcc90fcffef@oss.nxp.com>
 <Zzy_enX2VyS0YUl3@shell.armlinux.org.uk>
 <Zz3Oz3JiRLyD1qKx@lsv051416.swis.nl-cdc01.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zz3Oz3JiRLyD1qKx@lsv051416.swis.nl-cdc01.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_040002_515516_56FD0076 
X-CRM114-Status: GOOD (  23.38  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, NXP S32 Linux Team <s32@nxp.com>, Emil Renner Berthing <kernel@esmil.dk>, imx@lists.linux.dev, Alexandre Torgue <alexandre.torgue@foss.st.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Eric Dumazet <edumazet@google.com>, Iyappan Subramanian <iyappan@os.amperecomputing.com>, Quan Nguyen <quan@os.amperecomputing.com>, Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>, Jose Abreu <joabreu@synopsys.com>, Jacob Keller <jacob.e.keller@intel.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Richard Cochran <richardcochran@gmail.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, Keyur Chudgar <keyur@os.amperecomputing.com>, Minda Chen <minda.chen@starfivetech.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>, linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>, Heiner Kallweit <hkallweit1@gmail.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, Nov 20, 2024 at 12:58:07PM +0100, Jan Petrous wrote:
> On Tue, Nov 19, 2024 at 04:40:26PM +0000, Russell King (Oracle) wrote:
> > Hi,
> > 
> > On Tue, Nov 19, 2024 at 04:00:06PM +0100, Jan Petrous via B4 Relay wrote:
> > > The SoC series S32G2xx and S32G3xx feature one DWMAC instance,
> > > the SoC S32R45 has two instances. The devices can use RGMII/RMII/MII
> > > interface over Pinctrl device or the output can be routed
> > > to the embedded SerDes for SGMII connectivity.
> > > 
> > > The provided stmmac glue code implements only basic functionality,
> > > interface support is restricted to RGMII only. More, including
> > > SGMII/SerDes support will come later.
> > > 
> > > This patchset adds stmmac glue driver based on downstream NXP git [0].
> > 
> > A few things for the overall series:
> > 
> > 1. Note that net-next is closed due to the merge window, so patches should
> >    be sent as RFC.
> > 
> > 2. The formatting of the subject line should include the tree to which
> >    you wish the patches to be applied - that being net-next for
> >    development work.
> > 
> > For more information, see:
> > 
> > https://kernel.org/doc/html/v6.12/process/maintainer-netdev.html#netdev-faq
> > 
> 
> Hi Russell,
> 
> thanks for review and hints with series proper targeting. I will
> reformulate series to 'RFC net-next v6 x/y' for v6.

'PATCH RFC net-next v6 x/y' is better.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

