Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC6AAD116F1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 19:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4viePypAQHVRCOSoeN4UQ0PIgdkZWO/64PLkACSwE/M=; b=uRc9XXXcs5lhcI85dAXq4PrCUI
	qCGLT/V4R9psFXvz2n1bIdM6gmhCfAfb+XI1x11E4v8I2QgczaIQJUTNuHP+KFefLN6qG9JO+oF3T
	5BI9Vy4LqGZUDzL6iHJtyY7RepUuwGF9xCfb6A22Vd5EHFpkSrhARNF5LsPy4ubr82Klzsajh53ZR
	BWelcpV5xp2BGjHGZKXSm6pnpaoK2uJa42cMx2KDZXPWAYzwg0HGqE6Kalje40yKvQddqzq7vEEQ1
	25tZbcFoEViBn12nNjIqJ0soaOTUDxt6JzXY1MWDdykkAONQqjpVi64KTNiAE5DviQkYRwf8UmVax
	dB82JHaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ9Br-00000004S6b-2wpH;
	Mon, 01 Dec 2025 19:04:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ9Bq-00000004S6A-0ONv;
	Mon, 01 Dec 2025 19:04:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E775D42B8E;
	Mon,  1 Dec 2025 19:04:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2750C113D0;
	Mon,  1 Dec 2025 19:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764615840;
	bh=o+FCanS35An+MiDwhjJ8w/zhkp0tC/kZk0IrIBLdhJA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ZfEFJfVWww3xEELw2OmQMyV36tKdSwDRtdofxmKQfb+ILyEXpPhPrUNkl5MMnvqdk
	 MeHgecGP2EhHmfAgvv4cg3ASh6ilA8h5W5ooFuflZZi0/2Tle/0ibXxbnDItRhMwBf
	 DyiYWSDS+Z74LDiwCXVOZE4rbj4OZxE9c9IQprfUrnef8s0TdGKK+7J61DS0IwlNy/
	 gneE8GMMGdaj/GSHF4HUhsFhpFBITU5tvY/NPYYgqw+RUhepWKj/qtMUshYwc2/avJ
	 z4/v4E+SwVV/7np/kW8g/FiFhIR+l/Qoonk0nHp4I+hBfxNx56o36KwMo5F6mIaYeI
	 NLv4o7cfZK56A==
Date: Mon, 1 Dec 2025 11:03:58 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Vinod Koul <vkoul@kernel.org>
Cc: Vladimir Oltean <vladimir.oltean@nxp.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Daniel Golle <daniel@makrotopia.org>,
 Horatiu Vultur <horatiu.vultur@microchip.com>, Andrew Lunn
 <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Eric Woudstra
 <ericwouds@gmail.com>, Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>, Lee
 Jones <lee@kernel.org>, Patrice Chotard <patrice.chotard@foss.st.com>
Subject: Re: [PATCH net-next 5/9] phy: add phy_get_rx_polarity() and
 phy_get_tx_polarity()
Message-ID: <20251201110358.7618fee2@kernel.org>
In-Reply-To: <aS1T5i3pCHsNVql6@vaman>
References: <20251122193341.332324-1-vladimir.oltean@nxp.com>
	<20251122193341.332324-6-vladimir.oltean@nxp.com>
	<20251124200121.5b82f09e@kernel.org>
	<aS1T5i3pCHsNVql6@vaman>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_110402_183577_2BF7A7C5 
X-CRM114-Status: GOOD (  16.30  )
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

On Mon, 1 Dec 2025 14:07:58 +0530 Vinod Koul wrote:
> > > Push the supported mask of polarities to these helpers, to simplify
> > > drivers such that they don't need to validate what's in the device tree
> > > (or other firmware description).
> > > 
> > > The proposed maintainership model is joint custody between netdev and
> > > linux-phy, because of the fact that these properties can be applied to
> > > Ethernet PCS blocks just as well as Generic PHY devices. I've added as
> > > maintainers those from "ETHERNET PHY LIBRARY", "NETWORKING DRIVERS" and
> > > "GENERIC PHY FRAMEWORK".  
> > 
> > I dunno.. ain't no such thing as "joint custody" maintainership.
> > We have to pick one tree. Given the set of Ms here, I suspect 
> > the best course of action may be to bubble this up to its own tree.
> > Ask Konstantin for a tree in k.org, then you can "co-post" the patches
> > for review + PR link in the cover letter (e.g. how Tony from Intel
> > submits their patches). This way not networking and PHY can pull
> > the shared changes with stable commit IDs.  
> 
> How much is the volume of the changes that we are talking about, we can
> always ack and pull into each other trees..?

We have such ad-hoc situations with multiple subsystems. Letting
Vladimir and co create their own tree is basically shifting the 
work of managing the stable branches from netdev maintainers
downstream. I'd strongly prefer that we lean on git in this way, 
rather than reenact the 3 spiderman meme multiple times in each
release.

