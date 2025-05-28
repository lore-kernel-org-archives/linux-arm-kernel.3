Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 812BBC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 13:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eBLT1coqN7DWf9zqS26cnLXO/a+cQ5A8TJyemfvfOhg=; b=uoFYeNNItu3rtBxxxoF59/eQpc
	YO+pDK5MsR5B8WESXuyinbfjc0ny3EXE5bJGcrnyuqfusI1/zcTxR0xZPJ8HxjgllTsnxjTCAGw15
	HEhTeKvQpwoyKdqQPMRXF9yj5UzB31QJU5CEHl5IYPlAP2mHG9aCCydLRYajLyIubb6dF3xAQyrbq
	ohn/is1ZmbwXI6noVS6lWCpKuP/yk9IBNR/RcYM/NAw/ivhTdyMqNNrce7kp5UxXDMRjDfj1dYe/d
	GXlKe60kW+YgY2V/yywaDeZiz9eB1SF1xdcP/ui1AupW1LFsYNzFrIgVMhUdvMWLD7hng/3zazU3v
	hEa4U3ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKGqh-0000000DFAm-2yCd;
	Wed, 28 May 2025 13:29:39 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKGmM-0000000DEeH-1UBq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 13:25:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=eBLT1coqN7DWf9zqS26cnLXO/a+cQ5A8TJyemfvfOhg=; b=Cv
	NTTWZqEWIqlQKLw1iqZfeKB2gycKP4fQnxaOgVhW9sQoXjUgOMqlAPqOY/cEdYB0XM/boQ+lyJ8s+
	kqj5B6BKu2PlJbvkVkPJ277StCNkbUonv85HBREfXR+xowx5Nj4vC0mlLHpG03b0Wk7ggawLr63qs
	WWFpLv9UJKSTCO4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uKGm5-00EB7S-MN; Wed, 28 May 2025 15:24:53 +0200
Date: Wed, 28 May 2025 15:24:53 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>, netdev@vger.kernel.org,
	linux-sunxi@lists.linux.dev, Andrew Lunn <andrew+netdev@lunn.ch>,
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
Message-ID: <f915a0ca-35c9-4a95-8274-8215a9a3e8f5@lunn.ch>
References: <20250527175558.2738342-1-james.hilliard1@gmail.com>
 <631ed4fe-f28a-443b-922b-7f41c20f31f3@lunn.ch>
 <CADvTj4rGdb_kHV_gjKTJNkzYEPMzqLcHY_1xw7wy5r-ryqDfNQ@mail.gmail.com>
 <fe8fb314-de99-45c2-b71e-5cedffe590b0@lunn.ch>
 <CADvTj4qRmjUQJnhamkWNpHGNAtvFyOJnbaQ5RZ6NYYqSNhxshA@mail.gmail.com>
 <014d8d63-bfb1-4911-9ea6-6f4cdabc46e5@lunn.ch>
 <CADvTj4oVj-38ohw7Na9rkXLTGEEFkLv=4S40GPvHM5eZnN7KyA@mail.gmail.com>
 <aDbA5l5iXNntTN6n@shell.armlinux.org.uk>
 <CADvTj4qP_enKCG-xpNG44ddMOJj42c+yiuMjV_N9LPJPMJqyOg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADvTj4qP_enKCG-xpNG44ddMOJj42c+yiuMjV_N9LPJPMJqyOg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_062510_391493_6C7BDC57 
X-CRM114-Status: GOOD (  25.18  )
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

On Wed, May 28, 2025 at 05:57:38AM -0600, James Hilliard wrote:
> On Wed, May 28, 2025 at 1:53 AM Russell King (Oracle)
> <linux@armlinux.org.uk> wrote:
> >
> > On Tue, May 27, 2025 at 02:37:03PM -0600, James Hilliard wrote:
> > > On Tue, May 27, 2025 at 2:30 PM Andrew Lunn <andrew@lunn.ch> wrote:
> > > >
> > > > > Sure, that may make sense to do as well, but I still don't see
> > > > > how that impacts the need to runtime select the PHY which
> > > > > is configured for the correct MFD.
> > > >
> > > > If you know what variant you have, you only include the one PHY you
> > > > actually have, and phy-handle points to it, just as normal. No runtime
> > > > selection.
> > >
> > > Oh, so here's the issue, we have both PHY variants, older hardware
> > > generally has AC200 PHY's while newer ships AC300 PHY's, but
> > > when I surveyed our deployed hardware using these boards many
> > > systems of similar age would randomly mix AC200 and AC300 PHY's.
> > >
> > > It appears there was a fairly long transition period where both variants
> > > were being shipped.
> >
> > Given that DT is supposed to describe the hardware that is being run on,
> > it should _describe_ _the_ _hardware_ that the kernel is being run on.
> >
> > That means not enumerating all possibilities in DT and then having magic
> > in the kernel to select the right variant. That means having a correct
> > description in DT for the kernel to use.
> 
> The approach I'm using is IMO quite similar to say other hardware
> variant runtime detection DT features like this:
> https://github.com/torvalds/linux/commit/157ce8f381efe264933e9366db828d845bade3a1

That is for things link a HAT on a RPi. It is something which is easy
to replace, and is expected to be replaced.

You are talking about some form of chiplet like component within the
SoC package. It is not easy to replace, and not expected to be
replaced.

Different uses cases altogether.

What i think we will end up with is the base SoC .dtsi file, and two
additional .dtsi files describing the two PHY variants.

	Andrew

