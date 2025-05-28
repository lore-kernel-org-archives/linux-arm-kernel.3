Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C99A8C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 23:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9A6NOAoXkPb4medfypRE/loheYUcbcMxOqq+Oi8Kdr0=; b=bFBJH3de1XaVeiR5OcnRoDZiJ8
	AI2juXiiU1n5mAPMurUjjGXTPOzRyKOw4A9kUX7P/dtmRZqvVTkNOiU1V2790KsvfwZdY0YPHywdu
	UKVmYCFYm52KNdnSbzISJHNvHD4hneW+qF4T8d8M9YfrsaqNPjutAYJErG9mWayoKNfhmOl128cR5
	mTtgJeR1z531cqcuApXL9CHFtQzxrbGyFiruL2yRn6JOAcT6Q6KpRCSotiJekL5BYtNUkuS6zPznp
	En/13ZnSXLyDwd5fPfkiEOlOz0mrPSveOgfjB71l3AQm9nxSHIMqpRYNmdPG37hHe767RMUFaUroU
	3S/JAD/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKQWm-0000000EPrn-3SJs;
	Wed, 28 May 2025 23:49:44 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKQUd-0000000EPfq-0YZ8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 23:47:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=9A6NOAoXkPb4medfypRE/loheYUcbcMxOqq+Oi8Kdr0=; b=o6hlCw7mvqwNkor+nhEqb5a8iW
	WGypf7rK2YXmDxrWO2N/pFUYHNgiw9AFnEJnMusiQo7Y+NUbi612SxuzM4kgkjdlEXrw2JL0odRHk
	ivMxyEAm0Ujad0H5cs0aX/A4wL6xceHx0gEfSi1J7N2tYdsvl3lmwpRLhqIwaLr38SAE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uKQUF-00EDZZ-M2; Thu, 29 May 2025 01:47:07 +0200
Date: Thu, 29 May 2025 01:47:07 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>, wens@csie.org,
	netdev@vger.kernel.org, linux-sunxi@lists.linux.dev,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Furong Xu <0x1207@gmail.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] net: stmmac: allow drivers to explicitly select
 PHY device
Message-ID: <0c7a1602-61d3-4840-83f2-72a74ffd52b8@lunn.ch>
References: <CAGb2v66PEA4OJxs2rHrYFAxx8bw4zab7TUXQr+DM-+ERBO-UyQ@mail.gmail.com>
 <CADvTj4qyRRCSnvvYHLvTq73P0YOjqZ=Z7kyjPMm206ezMePTpQ@mail.gmail.com>
 <aDdXRPD2NpiZMsfZ@shell.armlinux.org.uk>
 <CADvTj4pKsAYsm6pm0sgZgQ+AxriXH5_DLmF30g8rFd0FewGG6w@mail.gmail.com>
 <8306dac8-3a0e-4e79-938a-10e9ee38e325@lunn.ch>
 <CADvTj4rWvEaFyOm2HdNonASE4y1qoPoNgP_9n_ZbLCqAo1gGYw@mail.gmail.com>
 <1e6e4a44-9d2b-4af4-8635-150ccc410c22@lunn.ch>
 <CADvTj4r1VvjiK4tj3tiHYVJtLDWtMSJ3GFQgYyteTnLGsQQ2Eg@mail.gmail.com>
 <0bf48878-a3d0-455c-9110-5c67d29073c9@lunn.ch>
 <CADvTj4qab272xTpZGRoPnCstufK_3e9CY99Og+2mey2co6u5dg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADvTj4qab272xTpZGRoPnCstufK_3e9CY99Og+2mey2co6u5dg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_164731_170339_AF0E566A 
X-CRM114-Status: GOOD (  28.00  )
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

> > Or, as Russell suggested, you give the bootloader both .dtb blobs, and
> > it can pick the correct one to pass to the kernel. Or the bootloader
> > can patch the .dtb blob to make it fit the hardware.
> 
> This is what I'm really trying to avoid since it requires special
> handling in the bootloader and therefore will result in a lot of broken
> systems since most people doing ports to H616 based boards will only
> ever test against one PHY variant.

Which in some ways is good. They will then issue four letter words at
Allwinner, and go find a better SoC vendor.

> > > > Do you have examples of boards where the SoC variant changed during
> > > > the boards production life?
> > >
> > > Yes, the boards I'm working for example, but this is likely an issue for
> > > other boards as well(vendor BSP auto detects PHY variants):
> > > https://www.zeusbtc.com/ASIC-Miner-Repair/Parts-Tools-Details.asp?ID=1139
> >
> > Mainline generally does not care what vendors do, because they often
> > do horrible things. Which is O.K, it is open source, they can do what
> > they want in their fork of the kernel.
> 
> That's not really true IMO, mainline implements all sorts of workarounds
> for various vendor hardware quicks/weirdness.
> 
> > But for Mainline, we expect a high level of quality, and a uniform way
> > of doing things.
> 
> Sure, and I'm trying to do that here rather than do some super hacky
> unmaintainable bootloader based device tree selector.
> 
> > This can also act as push back on SoC vendors, for doing silly things
> > like changing the PHY within a SoC without changing its name/number.
> 
> It won't here, because Allwinner doesn't care about non-BSP kernels.

It can be indirect pressure. There are some OEMs which care about
Mainline. They will do their due diligence, find that user report
Mainline if flaky on these devices, and go find a different
vendor. There will be some OEM which get burnt by this mess, and when
they come to their second generation device, they will switch vendor
and tell the old vendor why. It could well be Allwinner can support
their bottom line without caring about Mainline, so really don't
care. But Mainline can help point OEMs away from them to those which
are more Mainline friendly.

We also need to think about this as a two way street. What does this
SoC bring to Mainline? Why should Mainline care about it? It has some
major design issues, do we want to say that is O.K? Do we want other
vendors to think we are O.K. with bad designs? Worse still, this is
stmmac, which lots of vendors already abuse in lots of different
ways. Russell has put in a lot of effort recently to clean up some of
that abuse, and we are pushing back hard on new abusers.

If you can hide this mess away in the bootloader, it just looks like a
regular device, we are likely to accept it. If you try to do something
different to the normal for PHYs, we are very likely to reject it.

	Andrew

