Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01DFACCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 09:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PvNexhYHF8t9kM9PS58J6ZTCIJkGmPVdlS96wnNm7q4=; b=VbEntYbs9QpAbb2rVcKpPUv7+m
	X2wX+sqDIj2W3ZXzCS5lniLIX1OTV7fRN7JwmoVVeli9SBOX9eZLt+f6VDosPa/s+61Fxtc5DWSfh
	ooJxJbchJuzxsHmqgox3SlZACnu1FDuOYyMTdaP6cEMgbAqpa5GJ+6zQDyJGmH3QObwT+JuX+EgCW
	ohW+d2uQb69r3CN1rlz/gxDHUI8Cdg1Y/jVNkN6qwF94C+t4tWID65YgyUd6PiaYzNHxex3CJ4aTS
	TqIHJ8hxoBaJ93C3TOf5ayPWllVbTmiHXhUrR37YSJUIFoJY70Oj1NsspwxV0KDgsOpdeclEoHjMq
	l8TvUXag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBUtM-00000002DEC-3ERE;
	Wed, 22 Oct 2025 09:12:24 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBUtB-00000002D6F-0AHm;
	Wed, 22 Oct 2025 09:12:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=PvNexhYHF8t9kM9PS58J6ZTCIJkGmPVdlS96wnNm7q4=; b=uTG6nb3zXuEOsXo6ZmuLPLDUKk
	dhgep2PIJuJua+ZTxby9RvVTWscr+0EvAL9sJs7iPIiL5ibw08Yx0Sp9LE6LmUpAzJAaQIe4dZ5sX
	wnWKrBIIPSicO2EoGVt0S0X5M6A8bV3cNLu/kr6Utx1WLoeS7Rt1zxEdQDyl5wb4XA3w=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vBJ9a-00BfqE-Lg; Tue, 21 Oct 2025 22:40:22 +0200
Date: Tue, 21 Oct 2025 22:40:22 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Sjoerd Simons <sjoerd@collabora.com>
Cc: Eric Woudstra <ericwouds@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Lee Jones <lee@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>,
	kernel@collabora.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-pci@vger.kernel.org,
	linux-phy@lists.infradead.org, netdev@vger.kernel.org,
	Daniel Golle <daniel@makrotopia.org>,
	Bryan Hinton <bryan@bryanhinton.com>
Subject: Re: [PATCH 12/15] arm64: dts: mediatek: mt7981b-openwrt-one: Enable
 Ethernet
Message-ID: <fd52be11-ccff-4f34-b86b-9c2f9f485756@lunn.ch>
References: <20251016-openwrt-one-network-v1-0-de259719b6f2@collabora.com>
 <20251016-openwrt-one-network-v1-12-de259719b6f2@collabora.com>
 <4f82aa17-1bf8-4d72-bc1f-b32f364e1cf6@lunn.ch>
 <8f5335a703905dea9d8d0c1840862a3478da1ca7.camel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8f5335a703905dea9d8d0c1840862a3478da1ca7.camel@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_021213_130463_007F8F5D 
X-CRM114-Status: GOOD (  11.50  )
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

On Tue, Oct 21, 2025 at 10:21:31PM +0200, Sjoerd Simons wrote:
> On Fri, 2025-10-17 at 19:31 +0200, Andrew Lunn wrote:
> > > +&mdio_bus {
> > > +	phy15: ethernet-phy@f {
> > > +		compatible = "ethernet-phy-id03a2.a411";
> > > +		reg = <0xf>;
> > > +		interrupt-parent = <&pio>;
> > > +		interrupts = <38 IRQ_TYPE_EDGE_FALLING>;
> > 
> > This is probably wrong. PHY interrupts are generally level, not edge.
> 
> Sadly i can't find a datasheet for the PHY, so can't really validate that easily.

What PHY is it? Look at the .handle_interrupt function in the
driver. If the hardware supports a single interrupt bit, it could in
theory support edge. However, as soon as you have multiple bits, you
need level, to avoid races where an interrupt happens while you are
clearing other interrupts.

	 Andrew

