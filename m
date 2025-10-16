Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E714CCD195
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 13:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UmCdG/YPwALyDLpBb5siWg/i3BOrWdjDOVrZPQUGrZ8=; b=JKZO9AtscLjolTScNlz5HDwZIj
	sPR9SYaYnR7rKqM1sfPZnv2yXV+tW+lL6C8idVXPq0dbDfGC63hzdIuhnO/XdyecSRmD+S2Shh3HW
	R9ToCNnQQCt5ScTxrCxBemiVLlYOrrG1wFsaIp15H/Y3DzmsWGLaPJ3cWMcaPp6HgH8wBTv1hKbJC
	K1A2zx7CzVWiAgcS2gCUKHsOxWqoMRQqw+8Kw4nf8Mb9DsnoeKpcDhLmt8/VgnyPDMuoqTTCdMmyV
	YCoYSrWJtGqVsV1EmQL4eZoEYGQ9Lz/t9APQewtPPQt2Ro9UrbgaDHp/eJw6w3FNNBJrMzc0K0VFF
	+YoayEvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9OOy-00000004wCA-1xfO;
	Thu, 16 Oct 2025 13:52:20 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9OOw-00000004wBb-1AsL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 13:52:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=UmCdG/YPwALyDLpBb5siWg/i3BOrWdjDOVrZPQUGrZ8=; b=0+dTZXBd5lApnHs2iQaBbz/W/V
	Q7bJFJnGIA2uG8tjS5UsEsS5Zf8UZNrrq2xOtoMqAw1ePzjfdRuqYhMDAbHp9IA6SKikFFdvxfcwL
	dzr4TP20v7Ikpb4eFepO6AgDnISJvNmQnXw09aUuufpFMWhnQxXRnGKqTiGPvjrCQbdma4YuvvwtH
	YVPgtZbE5K1ZsOHDzJG50RAIpAUra2yfNcA0krjXV1cBF/ch9+Buy3F6o2btiNcTXkFL0ICrSNJZY
	pxEOMeHRoS1NJFq8P6hRm8ihzKlijAE+794qKuQIu2Wqr0T2GPcn5xYNKe/fQcEoCLoRgAVrs5uRJ
	eOda1ZYw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:38764)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1v9OON-000000006M1-0eca;
	Thu, 16 Oct 2025 14:51:43 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1v9OO9-000000003K9-3HzO;
	Thu, 16 Oct 2025 14:51:29 +0100
Date: Thu, 16 Oct 2025 14:51:29 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Abhishek Chauhan <quic_abchauha@quicinc.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Alexis Lothore <alexis.lothore@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Boon Khai Ng <boon.khai.ng@altera.com>,
	Choong Yong Liang <yong.liang.choong@linux.intel.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	"David S. Miller" <davem@davemloft.net>,
	Drew Fustini <dfustini@tenstorrent.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Eric Dumazet <edumazet@google.com>,
	Faizal Rahim <faizal.abdul.rahim@linux.intel.com>,
	Furong Xu <0x1207@gmail.com>, Inochi Amaoto <inochiama@gmail.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>,
	Jisheng Zhang <jszhang@kernel.org>, Kees Cook <kees@kernel.org>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Ley Foon Tan <leyfoon.tan@starfivetech.com>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Matthew Gerlach <matthew.gerlach@altera.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Michal Swiatkowski <michal.swiatkowski@linux.intel.com>,
	netdev@vger.kernel.org, Oleksij Rempel <o.rempel@pengutronix.de>,
	Paolo Abeni <pabeni@redhat.com>,
	Rohan G Thomas <rohan.g.thomas@altera.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Simon Horman <horms@kernel.org>,
	Song Yoong Siang <yoong.siang.song@intel.com>,
	Swathi K S <swathi.ks@samsung.com>,
	Tiezhu Yang <yangtiezhu@loongson.cn>, Vinod Koul <vkoul@kernel.org>,
	Vladimir Oltean <olteanv@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [PATCH net-next 11/14] net: stmmac: do not require snps,ps-speed
 for SGMII
Message-ID: <aPD4YRH6ih93jQXH@shell.armlinux.org.uk>
References: <aO-tbQCVu47R3izM@shell.armlinux.org.uk>
 <E1v92N3-0000000AmHQ-4Bm2@rmk-PC.armlinux.org.uk>
 <15ea57e0-d127-4722-b752-4989d5a443c0@lunn.ch>
 <aPAWoDGVgeRFV95b@shell.armlinux.org.uk>
 <6545b453-e99e-4f44-a206-ef14deb7f96a@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6545b453-e99e-4f44-a206-ef14deb7f96a@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_065218_339400_AA7157C8 
X-CRM114-Status: GOOD (  20.77  )
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

On Thu, Oct 16, 2025 at 03:03:34PM +0200, Andrew Lunn wrote:
> > I don't at present, and I'm not sure what the point of updating it
> > would actually be, because this is another thing that's just broken.
> 
> > Hence, I would like this property a slow and painful^h^h^hfree death.
> > Maybe mark the property deprecated, and remove all explanation of it
> > apart from stating that it's obsolete after this patch series has
> > been merged and we've proven that it's never been useful.
> 
> And this is what i was thinking. At least mark it deprecated. If you
> want to remove the documentation late, i'm fine with that as well.

It's rather premature to do this - this series doesn't change anything
in the way that snps,ps-speed behaves.

Setting this still:
1. sets the SGMII rate adapter to take its speed configuration from the
   MAC control register rather than the in-band config.
2. enables the exchange of the SGMII in-band config.

What it doesn't do, and has never done, is to ensure that the in-band
config that is sent contains the speed and duplex information for the
SGMII link partner due to a repeated typo in the individual core sub-
drivers.

I'm not intending removing this until we have a different way to
specify it, e.g. PHY_INTERFACE_MODE_REVSGMII, but that is currently
looking unlikely. However, with PHY_INTERFACE_MODE_REVSGMII, we would
need to make the change (fix the typo bug) to publish the correct
in-band config.

I think a bit more thought is needed before going down that path,
because if we're publishing the config, is it a fixed-link. That's
something that we need to sort out in the PHY_INTERFACE_MODE_REVSGMII
discussions... if we're still going with it.

So, right now what happens here entirely depends on stuff we have
yet to make decisions on, and so marking it deprecated now is too
early.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

