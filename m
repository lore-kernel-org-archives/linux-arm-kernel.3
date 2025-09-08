Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAE1FCA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 06:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w1EwyTie/h44Yv/fBjzwXChmTw4VRBobXct3dwrWQS4=; b=jClTH3vaVjohVWPCy+E6ACogby
	nKBlVg5S1J6tep0UsBfMILmsxo7XlcJCliPXYpZ4O8sba7OG+ILWsXTJE65XN++LExfUHFhmhLjVP
	blYvTMRUDknGpodFyD4VMdfOhvQE6ktmHcnhW7V+hr6Xv2vjDfR7zmGR6eM0oEkJ4Xq70mjmODHGP
	KXBxrGjwgt4Po+5bfe+SUPoVPxnWJ6Md+3Z4pneT9N4m5T4dnqu4QdS3fqqHSlAQCruKbHsKDxbCc
	AMBBLwcXEp9GIFo0FzUVR34UEAIDteMwJktR7NGEGADP9Lx7pylDGZcuP1Us9rdu4AyRCTYgse4yt
	ikYYGwHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsBj-00000004p5I-2HU2;
	Tue, 09 Sep 2025 06:50:47 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvi9M-000000025SE-1qGK;
	Mon, 08 Sep 2025 20:07:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=w1EwyTie/h44Yv/fBjzwXChmTw4VRBobXct3dwrWQS4=; b=BHl1k5w/fsuK6Mj33b29YF4MIw
	eA1CdklxrPNPohLDsJNrwVCyvYiOGdUefvcSJaltG3XQdjFwwLrye4/96faDnNb+OvaQncNEehOXE
	ffqq3hE9ySuCYsdNheSOwmCJ3V0O04HYoBIw4O86rpReEGHhVUlBJI3xmtrcRfXESDvQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uvi9E-007iQO-Dl; Mon, 08 Sep 2025 22:07:32 +0200
Date: Mon, 8 Sep 2025 22:07:32 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] pinctrl: airoha: fix wrong MDIO function bitmaks
Message-ID: <f271a9bf-e6c2-45ca-afc7-7f6ac683572a@lunn.ch>
References: <20250908113723.31559-1-ansuelsmth@gmail.com>
 <583981f9-b2ed-45fe-a327-4fd8218dc23e@lunn.ch>
 <68bf16e5.df0a0220.2e182c.b822@mx.google.com>
 <d1bc3887-5b88-4fb9-8f89-4b520427ccdc@lunn.ch>
 <68bf2b2d.050a0220.7d5a6.b11c@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <68bf2b2d.050a0220.7d5a6.b11c@mx.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_130740_476373_15764D49 
X-CRM114-Status: GOOD (  23.28  )
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

On Mon, Sep 08, 2025 at 09:14:49PM +0200, Christian Marangi wrote:
> On Mon, Sep 08, 2025 at 09:06:03PM +0200, Andrew Lunn wrote:
> > On Mon, Sep 08, 2025 at 07:48:17PM +0200, Christian Marangi wrote:
> > > On Mon, Sep 08, 2025 at 06:54:15PM +0200, Andrew Lunn wrote:
> > > > On Mon, Sep 08, 2025 at 01:37:19PM +0200, Christian Marangi wrote:
> > > > > With further testing with an attached Aeonsemi it was discovered that
> > > > > the pinctrl MDIO function applied the wrong bitmask. The error was
> > > > > probably caused by the confusing documentation related to these bits.
> > > > > 
> > > > > Inspecting what the bootloader actually configure, the SGMII_MDIO_MODE
> > > > > is never actually set but instead it's set force enable to the 2 GPIO
> > > > > (gpio 1-2) for MDC and MDIO pin.
> > > > 
> > > > Is the MDIO bus implemented using the GPIO bitbanging driver?
> > > > 
> > > 
> > > No it does use the MDIO bus integrated in the MT7530 Switch. It's just
> > > that the MDIO pin can be muxed as GPIO usage.
> > 
> > Then i do not understand this patch. Why configure the pinmux for GPIO
> > when you want it connected to the MDIO bus device?
> >
> 
> The usage of GPIO might be confusing but this is just to instruct the
> SoC to not mess with those 2 PIN and as Benjamin reported it's also an
> Errata of 7581. The FORCE_GPIO_EN doesn't set them as GPIO function
> (that is configured by a different register) but it's really to actually
> ""enable"" those lines.

So please extent the commit message: FORCE_GPIO_EN does not actually
force the pin to GPIO, but really means....

The commit message is the correct place to try to explain why the
patch makes no sense, because FORCE_GPIO_EN is wrongly named.

	 Andrew

