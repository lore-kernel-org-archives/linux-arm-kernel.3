Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 303E4CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 17:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0OEHWe0aEX4CL8pwp76r7di9HP/R/Jl+wwruwqA9LqA=; b=Ipav0mMJ4oaJ09GgWdMg5/wZzN
	enBZCpOSz+DGmqyzOYAXZpOd2kjRPBJ8+y1z1k2vQ4ii6q+MxfdDlMfkTTRdboKEpdwDhKH+AiRb3
	BnKXWWw0n59R+v1Ffx8VjFZJgrxACUysTR2NI9Q1EOgt7TDLNu1R58X9FTeTdKVtl/2+d4JLNH7Zq
	+HCnR0fSwUNJWgqUzUCrSwlWS4nelRRsdIWERzVEkZ4PoWXY48VfhW8K+jLbFiwonCpYVYwYBMC+A
	q8veW4r+w85fX3af5OTthzEIdu+a5YLwRJG0tnLa3PcQahYFs9F8LOIgIO64KsaTmXMhOp8RrZzV0
	pBaipxwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFxx1-0000000ANDi-1sDd;
	Mon, 03 Nov 2025 17:02:39 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFxwy-0000000AND9-3mh6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 17:02:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=0OEHWe0aEX4CL8pwp76r7di9HP/R/Jl+wwruwqA9LqA=; b=D4ikYTJuLxfvbADYfspsJJ1+PR
	G9TIv5Edt/r6/WaJZAMklqrf4uQXnTFghnVtt5e2pEK6hkTK/ovT48QofuyuapGxPChHIdI+l7cAZ
	gPOrF+mElZpbbQ+EvQIPyWkznOrtQKCO+Smfppm2l51XddJEf1qgnAEPWOPhMYtCLXNL0d/3Senen
	UfeLWqnJdFJiV3OCNGv7Gx6uF/nkB58jMALhMUDGIl3CGihzMnKJorDdmXOy7EjSquQEOFZRyzSvO
	7zGAhvP8v5iroVagEKr3iVVtuL68nTw6ENsDAAWUL52866vN9a1vYHVGMNjrUG5zhFBacsisMbZ33
	+AwD+DZQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:37810)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vFxwj-0000000019y-3eQA;
	Mon, 03 Nov 2025 17:02:21 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vFxwf-000000003wv-0J3T;
	Mon, 03 Nov 2025 17:02:17 +0000
Date: Mon, 3 Nov 2025 17:02:16 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Alexis =?iso-8859-1?Q?Lothor=E9?= <alexis.lothore@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Boon Khai Ng <boon.khai.ng@altera.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Furong Xu <0x1207@gmail.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [PATCH net-next 0/3] net: stmmac: phylink PCS conversion part 3
 (dodgy stuff)
Message-ID: <aQjgGBGY4T6xbjWr@shell.armlinux.org.uk>
References: <aQNmM5+cptKllTS8@oss.qualcomm.com>
 <aQOB_yCzCmAVM34V@shell.armlinux.org.uk>
 <aQOCpG_gjJlnm0A1@shell.armlinux.org.uk>
 <aQhusPX0Hw9ZuLNR@oss.qualcomm.com>
 <aQh7Zj10C7QcDoqn@shell.armlinux.org.uk>
 <aQiBjYNtJks2/mrw@oss.qualcomm.com>
 <20251103104820.3fcksk27j34zu6cg@skbuf>
 <aQiP46tKUHGwmiTo@oss.qualcomm.com>
 <aQiVWydDsRaMz8ua@shell.armlinux.org.uk>
 <20251103121353.dbnalfub5mzwad62@skbuf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251103121353.dbnalfub5mzwad62@skbuf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_090236_949911_1766CBDB 
X-CRM114-Status: GOOD (  22.92  )
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

On Mon, Nov 03, 2025 at 02:13:53PM +0200, Vladimir Oltean wrote:
> > stmmac unfortunately doesn't give access to the raw Cisco SGMII
> > in-band control word. However, reading register 0xf8 bits 31:16 for
> > dwmac4, or register 0xd8 bits 15:0 for dwmac1000 will give this
> > information. In that bitfield, bits 2:1 give the speed. 2 = 1G,
> > 1 = 100M, 0 = 10M.
> 
> It might be Linux who is forcing the AQR115C into the nonsensical
> behaviour of advertising 10M in the SGMII control word while
> simultanously forcing the PHY MII to operate at 1G with flow control
> for the 10M media speed.

There's another factor in play here: the dwmac-qcom-ethqos glue driver
forces the configuration of the stmmac integrated PCS irrespective of
what phylink wants (whether or not patch 1 is being used.) That is,
for 1G, 100M and 10M, the SGMII in-band control word must be sent by
the PHY, and it must accurately indicate the symbol replication via
the speed bits. If this is not the case, then the stmmac PCS block will
not behave correctly.

So, if the PHY says in the SGMII configuration word that its operating
at 10M, but is internally rate-adapting to 1G and sending the packet
with no symbol replication, that is outside what the stmmac PCS block
will cope with.

> We don't control the latter, but we do control the former:
> aqr_gen2_config_inband(), if given modes == LINK_INBAND_ENABLE, will
> enable in-band for all media speeds that use PHY_INTERFACE_MODE_SGMII.
> Regardless of how the PHY was provisioned for each media speed, and
> especially regardless of rate matching settings, this function will
> uniformly set the same in-band enabled/disabled setting for all media
> speeds using the same host interface.
> 
> If dwmac_integrated_pcs_inband_caps(), as per Russell's patch 1/3,
> reports LINK_INBAND_ENABLE | LINK_INBAND_DISABLE, and if
> aqr_gen2_inband_caps() also reports LINK_INBAND_ENABLE | LINK_INBAND_DISABLE,
> then we're giving phylink_pcs_neg_mode() all the tools it needs to shoot
> itself in the foot, and select LINK_INBAND_ENABLE.
> 
> The judgement call in the Aquantia PHY driver was mine, as documented in
> commit 5d59109d47c0 ("net: phy: aquantia: report and configure in-band
> autoneg capabilities"). The idea being that the configuration would have
> been unsupportable anyway given the question that the framework asks:
> "does the PHY use in-band for SGMII, or does it not?"

From the kernel messages provided, the PCS is reporting no
capabilities, but as you say, the PHY is reporting
LINK_INBAND_ENABLE | LINK_INBAND_DISABLE. The mode that phylink is
using is "phy/outband/sgmii" - so what _should_ be no in-band
signalling. However, note what I said above - for 1G, 100M and 10M,
qcom-ethqos does this:

	ethqos_pcs_set_inband(priv, true);

in its fix_mac_speed() hook, which translates to:

	stmmac_pcs_ctrl_ane(priv, true, 0);

which eventually gets through to:

	dwmac_ctrl_ane(priv, offset, true, false);

This sets GMAC_AN_CTRL_ANE | GMAC_AN_CTRL_RAN but not
GMAC_AN_CTRL_SGMRAL. This means "autoneg enable" "restart autoneg" and
!SGMRAL means that the SGMII rate adaption block operates according to
the link speed received from the PHY.

At this point, I'm not sure whether I should just rip out the
stmmac_pcs_ctrl_ane() stuff from dwmac-qcom-ethqos.c - I've been
operating on the assumption that this is working code. Maybe that's
a false assumption, and its been broken since a818bd12538c ("net:
stmmac: dwmac-qcom-ethqos: Add support for 2.5G SGMII").

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

