Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 109E3CF856E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 15:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wv/fhPM3MT+L6rV/U5j/do1a1F9zhuG4j4m3P/1JBJY=; b=PFdHOmkD2yYFDugT7IyNPiBx55
	J49rYvOqCzjNmWbH7MKg/GS1WiZAbSJTiz/UcScLQ5NQkfsyQ5HhDCuD7pc/VDnueloh5jhjlzvgb
	In0bjfvWr9FyK4okHKFPCSeVSYT/YKhvYVAsXwPsfi/rQfYuIh03ZvftObMH6lj42t8XAoAuoYbf3
	exUTvGZK08Q70QmdmRVDb0Bhpvsf61/9vJhtvPl19N7aFuEoSv5gw/j9nBtsEl494Mj//axWuIoUq
	tcF9wAcp3vG82ey4/rV/yWHBO+w59EDiYTHj+aKVvKNkzSkw2KAGgh9TvpDmbb3dGzCAJy/7j2a+T
	t13W0+2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM6qF-00000006wUr-0iHd;
	Thu, 20 Nov 2025 15:45:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM6qC-00000006wU3-3Nfg;
	Thu, 20 Nov 2025 15:45:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 54F1040191;
	Thu, 20 Nov 2025 15:45:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D90FC4CEF1;
	Thu, 20 Nov 2025 15:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763653500;
	bh=3LqOxODjnWoAP85raLtIKnv5cNa5InqYMD4HtPn0Jyk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=LKY+ap4NYFE5J1G3Sy7gfSDDID+FtmQ7psQdU05gg25PHaQWWaA+KmwaNu0UUCqk3
	 RWQVdK/BTkOv7omtykdjw8g1kjb2FnXcqvBzi84P13BLVL/Dz/2CGJ8X/yGvPDCAJr
	 g2sIZslOqXkQ0ix0413DAJWjG3ZXo4P5uSCajXUmzI/SHLKgnC+ivm11nZ70iPv6Fi
	 uuBM6FpnqCmPeGxYRjn9TtvQCw1kCylery5WZeV2WpyqeyrQmUCBReJjZIeH98X/TP
	 sw2EvTHsIEquigEPX91TxuLN2Sy9ncO3wZXs7QQp+nbA9JnAwKlZ/1OOdVjiY6BqrE
	 jmS7kRCJS5ZFw==
Date: Thu, 20 Nov 2025 07:44:57 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Lee Jones <lee@kernel.org>, Konstantin Ryabitsev
 <konstantin@linuxfoundation.org>
Cc: patchwork-bot+netdevbpf@kernel.org, Sjoerd Simons
 <sjoerd@collabora.com>, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, ryder.lee@mediatek.com,
 jianjun.wang@mediatek.com, bhelgaas@google.com, lpieralisi@kernel.org,
 kwilczynski@kernel.org, mani@kernel.org, chunfeng.yun@mediatek.com,
 vkoul@kernel.org, kishon@kernel.org, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 lorenzo@kernel.org, nbd@nbd.name, kernel@collabora.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-pci@vger.kernel.org, linux-phy@lists.infradead.org,
 netdev@vger.kernel.org, daniel@makrotopia.org, bryan@bryanhinton.com,
 conor.dooley@microchip.com
Subject: Re: [PATCH v4 00/11] arm64: dts: mediatek: Add Openwrt One AP
 functionality
Message-ID: <20251120074457.5aa06d89@kernel.org>
In-Reply-To: <20251120154012.GJ661940@google.com>
References: <20251115-openwrt-one-network-v4-0-48cbda2969ac@collabora.com>
	<176360700676.1051457.11874224265724256534.git-patchwork-notify@kernel.org>
	<20251120152829.GH661940@google.com>
	<20251120073639.3fd7cc7c@kernel.org>
	<20251120154012.GJ661940@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_074500_870553_EC58B53D 
X-CRM114-Status: GOOD (  11.17  )
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

On Thu, 20 Nov 2025 15:40:12 +0000 Lee Jones wrote:
> > > >   - [v4,02/11] dt-bindings: PCI: mediatek-gen3: Add MT7981 PCIe compatible
> > > >     (no matching commit)
> > > >   - [v4,03/11] dt-bindings: phy: mediatek,tphy: Add support for MT7981
> > > >     (no matching commit)
> > > >   - [v4,04/11] arm64: dts: mediatek: mt7981b: Add PCIe and USB support
> > > >     (no matching commit)
> > > >   - [v4,05/11] arm64: dts: mediatek: mt7981b-openwrt-one: Enable PCIe and USB
> > > >     (no matching commit)
> > > >   - [v4,06/11] dt-bindings: net: mediatek,net: Correct bindings for MT7981
> > > >     https://git.kernel.org/netdev/net-next/c/bc41fbbf6faa
> > > >   - [v4,07/11] arm64: dts: mediatek: mt7981b: Add Ethernet and WiFi offload support
> > > >     (no matching commit)
> > > >   - [v4,08/11] arm64: dts: mediatek: mt7981b-openwrt-one: Enable Ethernet
> > > >     (no matching commit)
> > > >   - [v4,09/11] arm64: dts: mediatek: mt7981b: Disable wifi by default
> > > >     (no matching commit)
> > > >   - [v4,10/11] arm64: dts: mediatek: mt7981b: Add wifi memory region
> > > >     (no matching commit)
> > > >   - [v4,11/11] arm64: dts: mediatek: mt7981b-openwrt-one: Enable wifi
> > > >     (no matching commit)  
> 
> This is a very odd way of presenting that one patch from the set was merged.
> 
> Not sure I've seen this before.  Is it new?
> 
> It's very confusing.  Is it a core PW thing and / or can it be configured?

It's k.org infra bot. Konstantin, would it be possible to highlight
more that a series is partially applied?

