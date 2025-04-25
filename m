Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33806C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 02:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ICF52ZSrljFNaTIWgavSI5WbnW464jwCjST74huipR8=; b=OJigGy6EBd/K3+AaGp5z8+Z+q4
	8PyYWkQ9b8jSmepEvR7lN4uxlIB5iz2/L8z+Ym7vot7tK3kEJf/JF2zV6uLqd0iUlO6dhnM/9S6uw
	13TOYO1zsPaEpILvn0erS4wG34fHcB0Bplnadk7hE/luUk+QdMVQvc7wHyBRJaAoetUX7aSzx/XyC
	iNRRr2D16V927Po97HlbBo3HMdL900OrjwWxI/r9ThJ5is8wabiRn9iJgGxwHHDvpppjpy0nP2VE0
	4GXbmGMFMBylf6uuGwbOK+/sqiLQ9CGalOdQe8RHFxZIl4ufz26Km5y9BvkoWyqkpC/luUiZovP6d
	cR6Lc+WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u88Q5-0000000FkDa-12L4;
	Fri, 25 Apr 2025 02:04:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u88OF-0000000Fk5i-3ydJ
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 25 Apr 2025 02:02:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ICF52ZSrljFNaTIWgavSI5WbnW464jwCjST74huipR8=; b=BjZs9gdPHf3bJyD7ainvn18Ecv
	x6Haj3mJimOqXghnuzzhywoP8rSIHfJPTdEtZse0msu2+Kyi7chZpDD8eTqxBcCtK+Q3i3lmnoSpb
	rnSb/65Cw/ZJQfdZSzQ3cSvXvt9vuPYfSDySbWjZFK4zsRXYXsVjQecsmSx3qBPSXTiWUXI71I3bw
	qDu8sOyOCXxkfON5SvTKp8f0l/+wWK/vMlmGF1k5fHMGcw98OWvq3aTmSehthh0rcblVBEtKOR7GM
	y/FedhchAtb5nDvJXEmURSn2M03FMwGoTEKu5z4U2z1EhKMpUadE1kvTiBBmu+z+hSL3kJSYwAM4i
	oZkSJUdA==;
Received: from vps0.lunn.ch ([156.67.10.101])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u88OA-0000000By5h-2IJa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 02:02:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=ICF52ZSrljFNaTIWgavSI5WbnW464jwCjST74huipR8=; b=mrpwuK5B/JJe+wE22m8iiXPB5s
	KVemoUn5f883G+1qcgAZoJTkUhHQSmUNJP9siqokmXeAGKiU0+o2W3+efjBkzS/bKemfKa0rg7lIj
	tciOhSvPBB1NSm4/KOaLSPYukDt3NswXnwJvpQlk3ditdHmGBPSjBlhvJS3Okb5HvaA8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1u88Ne-00AWyd-Cl; Fri, 25 Apr 2025 04:01:30 +0200
Date: Fri, 25 Apr 2025 04:01:30 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>,
	Yixun Lan <dlan@gentoo.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, clabbe.montjoie@gmail.com
Subject: Re: [PATCH 4/5] arm64: dts: allwinner: a527: add EMAC0 to Radxa A5E
 board
Message-ID: <3681181a-0fbb-4979-9a7e-b8fe5c1b7c3c@lunn.ch>
References: <20250423-01-sun55i-emac0-v1-0-46ee4c855e0a@gentoo.org>
 <4ba3e7b8-e680-40fa-b159-5146a16a9415@lunn.ch>
 <20250424150037.0f09a867@donnerap.manchester.arm.com>
 <4643958.LvFx2qVVIh@jernej-laptop>
 <20250424235658.0c662e67@minigeek.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424235658.0c662e67@minigeek.lan>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_030203_110107_15C5D097 
X-CRM114-Status: GOOD (  14.07  )
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

> Ah, right, I dimly remembered there was some hardware setting, but your
> mentioning of those strap resistors now tickled my memory!
> 
> So according to the Radxa board schematic, RGMII0-RXD0/RXDLY is pulled
> up to VCCIO via 4.7K, while RGMII0-RXD1/TXDLY is pulled to GND (also via
> 4K7). According to the Motorcom YT8531 datasheet this means that RX
> delay is enabled, but TX delay is not.
> The Avaota board uses the same setup, albeit with an RTL8211F-CG PHY,
> but its datasheet confirms it uses the same logic.
> 
> So does this mean we should say rgmii-rxid, so that the MAC adds the TX
> delay? Does the stmmac driver actually support this? I couldn't find
> this part by quickly checking the code.

No. It is what the PCB provides which matters. A very small number of
PCB have extra long clock lines to add the 2ns delay. Those boards
should use 'rgmii'. All other boards should use rgmii-id, meaning the
delays need to be provided somewhere else. Typically it is the PHY
which adds the delays.

The strapping should not matter, the PHY driver will override that. So
'rgmii-id' should result in the PHY doing the basis 2ns in both
directions. The MAC DT properties then add additional delays, which i
consider fine tuning. Most systems don't actually need fine tuning,
but the YT8531 is funky, it often does need it for some reason.

	Andrew

