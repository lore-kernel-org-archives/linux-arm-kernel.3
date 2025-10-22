Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9DDACCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 12:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R95DGcQ4LYALHG8T4SNxi7BAAXg7er7ggzkRbLh42No=; b=ibK/8N+pbgCKWHhSMr6xESwnmm
	ESpeo7m980Lnn8T0L1qWTSeOegEmhP0moOy7dIfwbQ+w0NgK5lbBBE3cwKj0cKAYiWsVcqB8YJOhw
	JeLRBhxAc0WDJcqwZtfUud24ljjr7HEFx/nuktNx/pxOLsBF4Sdu6d4UANyMdP62viIK8joUfDF1C
	z2EbEpIq9lFU3DceLd/G8RTqWSI6VPXqnJ9+A4jowfCLhqw4ZNTynZ6qnyYxSZQPyJ7TckfQkxRoI
	4Vw/uclu9AGreXpfUbiYJppBjDuB5OU5oN4rg0X30TGR3mwFBHL3F4O17fxV4WaQFZeXVi94GX25n
	ET+x2Nww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBY4K-00000002ori-23Zn;
	Wed, 22 Oct 2025 12:35:56 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBY4H-00000002oqu-2aKb;
	Wed, 22 Oct 2025 12:35:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=R95DGcQ4LYALHG8T4SNxi7BAAXg7er7ggzkRbLh42No=; b=QSk6D6ZIL39KWQjpQVXzyu/daU
	CkHCg8qd7kd0YqSVIzxh2OYFZ1Gtf6Zy1PMvilS2ibzw5vrduZP1N74w4P6Tj1JfPOXck0ka2IkIN
	G3R9KHuq/zrSWxPK36Hjw1+QvspeXZMa8vN0KtQZWpHSk2jPm3N1Cw59r3FE3Ov57v3Y=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vBY3w-00Bkxo-MY; Wed, 22 Oct 2025 14:35:32 +0200
Date: Wed, 22 Oct 2025 14:35:32 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Sjoerd Simons <sjoerd@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
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
Subject: Re: [PATCH 15/15] arm64: dts: mediatek: mt7981b-openwrt-one: Enable
 leds
Message-ID: <9ecffb7f-839c-4e4d-bef1-f59747d020b2@lunn.ch>
References: <20251016-openwrt-one-network-v1-0-de259719b6f2@collabora.com>
 <20251016-openwrt-one-network-v1-15-de259719b6f2@collabora.com>
 <d8077ee4-21c2-43c5-b130-7ff270b09791@lunn.ch>
 <79d4a7379bce245d22b56c677fd7b3a263836239.camel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <79d4a7379bce245d22b56c677fd7b3a263836239.camel@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_053553_653835_19EA5E2D 
X-CRM114-Status: GOOD (  18.82  )
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

On Wed, Oct 22, 2025 at 09:26:11AM +0200, Sjoerd Simons wrote:
> Hey,
> 
> On Fri, 2025-10-17 at 19:35 +0200, Andrew Lunn wrote:
> > On Thu, Oct 16, 2025 at 12:08:51PM +0200, Sjoerd Simons wrote:
> > > The Openwrt One has 3 status leds at the front (red, white, green) as
> > > well as 2 software controlled leds for the LAN jack (amber, green).
> > 
> > A previous patch in this series added 2 PHY LEDs. Are they connected
> > to a LAN jack? Are there multiple RJ45 connectors? Is it clear from
> > /sys/class/leds what LED is what?
> 
> Yeah there are two RJ45 jacks. One referred to as WAN in the openwrt one
> documentation (2.5G), which uses phy integrated leds. One referred to as LAN,
> which for some reason is using software controlled leds rather then the phy's
> led controller, which this patch adds support for.
> 
> When applying this set you'll get:
> ```
> root@openwrt-debian:/sys/class/leds# ls -1                                     
> amber:lan                                                                      
> green:lan                                                                      
> green:status                                                                   
> mdio-bus:0f:amber:wan                                                          
> mdio-bus:0f:green:wan                                                          
> mt76-phy0                                                                      
> mt76-phy1                                                                      
> red:status                                                                     
> white:status                       
> ```
> 
> Which is hopefully clear enough

You can also get to the LEDs associated to a MAC via
/sys/class/net/eth42/leds, or a subdirectory.

Please could you expand the commit message with more details of the
different RJ45 connectors, and how the different LEDs map to them.

Thanks

	Andrew

