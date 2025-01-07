Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88424E77199
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 13:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nirix+6QA8gbIhhX9Sk6j1JM9hBzmzq6gPfEUeL0Ris=; b=nu0cSRDraKMeqsPSJX8/G3rZqq
	rG2aKLQwQMqq5ldEyYqCUmGx6uZQ2mc3I6wIzE6WTt1sW4PO41ILs7A5kHVEPwNVgL+g+4j7Z4YVf
	YNat2W0S2BekSPdCVmFTYLR3VD0cK8n6TT8/PUFVYc3wblARF5BqSZ6ka7OOgQDePpoaCE1hdhC+H
	IfSJ0RMrhyMYw/zoQLdT7J/+fTNboSX9b5K8RhWD8P4OPb8LPTiqw7riJl6kOHnw+pPYuqBfS/Mkx
	uRNQhVRJNrjwTf4KaSGTHy1rX3cswCh/U/YPbuoiZ658qU1v1KNUxbiG2IwE2mIM+TpXOBf8IB/V9
	627VMNHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV9em-000000050P4-38ag;
	Tue, 07 Jan 2025 13:30:04 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV9SN-00000004yHP-2Fjt;
	Tue, 07 Jan 2025 13:17:19 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.98)
	(envelope-from <daniel@makrotopia.org>)
	id 1tV9Rt-000000007Yg-0b83;
	Tue, 07 Jan 2025 13:16:45 +0000
Date: Tue, 7 Jan 2025 13:16:33 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Eric Woudstra <ericwouds@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Frank Wunderlich <frank-w@public-files.de>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org, bridge@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH RFC net-next] net: phylink: always config mac for
 (delayed) phy
Message-ID: <Z30pMSxDn-R3Cy5S@makrotopia.org>
References: <20250107123615.161095-1-ericwouds@gmail.com>
 <Z30iUj6DE9-fRp0n@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z30iUj6DE9-fRp0n@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_051715_577829_38FCE869 
X-CRM114-Status: GOOD (  17.67  )
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

On Tue, Jan 07, 2025 at 12:47:14PM +0000, Russell King (Oracle) wrote:
> Going through the log...
> 
> On Tue, Jan 07, 2025 at 01:36:15PM +0100, Eric Woudstra wrote:
> > Log before this patch is applied:
> > [root@bpir3 ~]# dmesg | grep eth1
> > [    2.515179] mtk_soc_eth 15100000.ethernet eth1: mediatek frame engine at 0xffff800082380000, irq 123
> > [   38.271431] mtk_soc_eth 15100000.ethernet eth1: configuring for inband/2500base-x link mode
> > [   38.279828] mtk_soc_eth 15100000.ethernet eth1: major config, requested inband/2500base-x
> > [   38.288009] mtk_soc_eth 15100000.ethernet eth1: interface 2500base-x inband modes: pcs=01 phy=00
> > [   38.296800] mtk_soc_eth 15100000.ethernet eth1: major config, active inband/inband,an-disabled/2500base-x
> 
> This is indeed without the PHY. We're using inband, although the PCS
> mode is PHYLINK_PCS_NEG_INBAND_DISABLED, meaning inband won't be
> used. As there is no PHY, we can't switch to MLO_AN_PHY.
> 
> > [   38.306362] mtk_soc_eth 15100000.ethernet eth1: phylink_mac_config: mode=inband/2500base-x/none adv=00,00000000,00008000,0000e240 pause=04
> > [   39.220149] mtk_soc_eth 15100000.ethernet eth1:  interface 2 (mii) rate match none supports 0-3,6-7,13-14
> > [   39.229758] mtk_soc_eth 15100000.ethernet eth1:  interface 3 (gmii) rate match none supports 0-3,5-7,13-14
> > [   39.239420] mtk_soc_eth 15100000.ethernet eth1:  interface 4 (sgmii) rate match none supports 0-3,5-7,13-14
> > [   39.249173] mtk_soc_eth 15100000.ethernet eth1:  interface 22 (1000base-x) rate match none supports 5-7,13-14
> > [   39.259080] mtk_soc_eth 15100000.ethernet eth1:  interface 23 (2500base-x) rate match none supports 6-7,13-14,47
> > [   39.594676] mtk_soc_eth 15100000.ethernet eth1: PHY i2c:sfp-1:11 uses interfaces 4,23, validating 4,23
> 
> The PHY comes along...
> 
> > [   39.603992] mtk_soc_eth 15100000.ethernet eth1:  interface 4 (sgmii) rate match none supports 0-3,5-7,13-14
> > [   39.650080] mtk_soc_eth 15100000.ethernet eth1:  interface 23 (2500base-x) rate match none supports 6-7,13-14,47
> > [   39.660266] mtk_soc_eth 15100000.ethernet eth1: PHY [i2c:sfp-1:11] driver [RTL8221B-VB-CG 2.5Gbps PHY (C45)] (irq=POLL)
> > [   39.671037] mtk_soc_eth 15100000.ethernet eth1: phy: 2500base-x setting supported 00,00000000,00008000,000060ef advertising 00,00000000,00008000,000060ef
> > [   39.684761] mtk_soc_eth 15100000.ethernet eth1: requesting link mode inband/2500base-x with support 00,00000000,00008000,000060ef
> 
> We decide to use MLO_AN_INBAND and 2500base-X, which we're already using.
> 
> > [   40.380076] mtk_soc_eth 15100000.ethernet eth1: phy link down 2500base-x/Unknown/Unknown/none/off
> > [   40.397090] brlan: port 5(eth1) entered blocking state
> > [   40.402223] brlan: port 5(eth1) entered disabled state
> > [   40.407437] mtk_soc_eth 15100000.ethernet eth1: entered allmulticast mode
> > [   40.414400] mtk_soc_eth 15100000.ethernet eth1: entered promiscuous mode
> > [   44.500077] mtk_soc_eth 15100000.ethernet eth1: phy link up 2500base-x/2.5Gbps/Full/none/off
> > [   44.508528] mtk_soc_eth 15100000.ethernet eth1: No phy led trigger registered for speed(2500)
> 
> ... but we don't see link-up reported by the PCS after the PHY comes
> up. Why is that - I think that needs investigation before we proceed
> to patch the issue, because that suggests the PCS isn't seeing
> valid 2500base-X from the PHY.

The PCS doesn't support in-band status in 2500Base-X mode, or at least
the implementation isn't compatible with those RealTek PHYs.

In OpenWrt we carry a downstream patch to disable in-band status on the
side of the PHY which fixes the issue:

https://git.openwrt.org/?p=openwrt/openwrt.git;a=blob;f=target/linux/generic/pending-6.6/720-02-net-phy-realtek-disable-SGMII-in-band-AN-for-2-5G-PHYs.patch;h=7e48c16515db8e401495dc1c505319424773ee11;hb=HEAD

