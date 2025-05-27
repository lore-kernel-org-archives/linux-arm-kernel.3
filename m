Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D89E4C5B542
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 21:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yo5i6Cfp507HWKu8x8QsupHsb5V8DAsofc1dKd1g6JU=; b=LTpx5eYeuJ2bAhIEV1QvpKL7vP
	FcKI0i9Tw5xb+LJKNgjX+FDb5G9do/2Bh2PzeXLzYubLuXmgKY9+lKurYeG5SyMlmE0V5QFOMzZ6L
	IZZScfbw/cTPdME1J9nvkhG+XhYNUS43ryjpAGJFC7qWlLzCDsmcA15GAD0v1MMSo1Sl1lyJXXqBe
	DXg6RKlVBYP58RosNewoIW0flBxJJUfiGmdjcakBqia9f/uzV1bViz6nlWHzHZEpUTvRdZKAHOk9I
	wdpuyzbJHzDXsLwDKtJfsQrH7uuE3GQGXaK93xCXT6ARgrTJv4FoTOfhHbSz5dpQDG/aTpUuEQqju
	zGO8+Byg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uK2Bx-0000000BeHP-0TBw;
	Tue, 27 May 2025 21:50:37 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uK29n-0000000Be4H-0buo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 May 2025 21:48:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=Yo5i6Cfp507HWKu8x8QsupHsb5V8DAsofc1dKd1g6JU=; b=G8
	8J1JyNZI1h77yRUT+EqGtVaguMkpS9J7EEusMtT2VRNZY8u+RhYP/vtnUNsA1CKnMk7ooz/nriaji
	nCera2wrUOrrpjnS0rXf8vk8P3KxQ0XblNMMvzlOIpwyB9Qm3Nwc8h4FL7a8FUCPS889BGfiVlKJu
	bgfVxfJiLPHa2gU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uK29V-00E70R-Kg; Tue, 27 May 2025 23:48:05 +0200
Date: Tue, 27 May 2025 23:48:05 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: netdev@vger.kernel.org, linux-sunxi@lists.linux.dev,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Russell King <linux@armlinux.org.uk>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Furong Xu <0x1207@gmail.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] net: stmmac: allow drivers to explicitly select
 PHY device
Message-ID: <93bfec74-c679-400f-8ce4-3bc84d6d803f@lunn.ch>
References: <20250527175558.2738342-1-james.hilliard1@gmail.com>
 <631ed4fe-f28a-443b-922b-7f41c20f31f3@lunn.ch>
 <CADvTj4rGdb_kHV_gjKTJNkzYEPMzqLcHY_1xw7wy5r-ryqDfNQ@mail.gmail.com>
 <fe8fb314-de99-45c2-b71e-5cedffe590b0@lunn.ch>
 <CADvTj4qRmjUQJnhamkWNpHGNAtvFyOJnbaQ5RZ6NYYqSNhxshA@mail.gmail.com>
 <014d8d63-bfb1-4911-9ea6-6f4cdabc46e5@lunn.ch>
 <CADvTj4oVj-38ohw7Na9rkXLTGEEFkLv=4S40GPvHM5eZnN7KyA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADvTj4oVj-38ohw7Na9rkXLTGEEFkLv=4S40GPvHM5eZnN7KyA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_144823_179844_69FB49C0 
X-CRM114-Status: GOOD (  15.48  )
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

On Tue, May 27, 2025 at 02:37:03PM -0600, James Hilliard wrote:
> On Tue, May 27, 2025 at 2:30 PM Andrew Lunn <andrew@lunn.ch> wrote:
> >
> > > Sure, that may make sense to do as well, but I still don't see
> > > how that impacts the need to runtime select the PHY which
> > > is configured for the correct MFD.
> >
> > If you know what variant you have, you only include the one PHY you
> > actually have, and phy-handle points to it, just as normal. No runtime
> > selection.
> 
> Oh, so here's the issue, we have both PHY variants, older hardware
> generally has AC200 PHY's while newer ships AC300 PHY's, but
> when I surveyed our deployed hardware using these boards many
> systems of similar age would randomly mix AC200 and AC300 PHY's.

Are they pin compatible?

But i assume none of these boards .dts files are actually in mainline?
So they need to go through review, and are likely to be horribly
broken and need fixing? So you can fix up the PHY node as part of the
cleanup.

	Andrew

