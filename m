Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99E62C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 20:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G67EhjQhCo6cu8Kcg5RL64M1kKXW79lnaj18VFl/IXk=; b=1+hjkGqsiBc5cd8orSBjh9YOeT
	wKJ9dQ1Ns8JB6XSkJoLdQ0eSYSTgZZUnbAfrak/umDrNSNIf1KE4e7VREERTZO+u/360F6zFmZc8J
	xW8gQfP0K8ejsQ9URuooSZhLd7gN9HcoPGky9vlb9WXgLVdbCM1o9ZK+V/bDYjI3xnvIfHN/c8bop
	ykrJvl1hwTmcW5HJK4upyQsUWHEsAUfSEMcKkaku1G/t9yA2b6OMpWKt4YSCITY/ifg5tHNNFTGFY
	eLWQWf7yY1ykedHZKXSqS3KnoyumMMnudLhnaMBeSo68XC3PiZhmwvdESQZrECYRkI6n77k7TSaNf
	OvAI7wyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uK0X2-0000000BTnS-1yxN;
	Tue, 27 May 2025 20:04:16 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uK0Uu-0000000BTZq-2HQ5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 May 2025 20:02:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=G67EhjQhCo6cu8Kcg5RL64M1kKXW79lnaj18VFl/IXk=; b=qI
	pw6vAwpdkVXq5357XLKpGLZl9skBIztPQAM/kmaCnqh49jHwfLSizkZyZ1lEy4q4Mogd5x9oubtOt
	DN0haeRWyI0l3POGdVls78aniiNBgadsB7gE4RpxO8LfKmE9C9yvpkudf4amM5l8OmDcjRnyOynNT
	ETwUMYgF6UBShq8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uK0Ue-00E6bZ-Kq; Tue, 27 May 2025 22:01:48 +0200
Date: Tue, 27 May 2025 22:01:48 +0200
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
Message-ID: <fe8fb314-de99-45c2-b71e-5cedffe590b0@lunn.ch>
References: <20250527175558.2738342-1-james.hilliard1@gmail.com>
 <631ed4fe-f28a-443b-922b-7f41c20f31f3@lunn.ch>
 <CADvTj4rGdb_kHV_gjKTJNkzYEPMzqLcHY_1xw7wy5r-ryqDfNQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADvTj4rGdb_kHV_gjKTJNkzYEPMzqLcHY_1xw7wy5r-ryqDfNQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_130204_579131_3F936382 
X-CRM114-Status: GOOD (  19.39  )
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

On Tue, May 27, 2025 at 01:21:21PM -0600, James Hilliard wrote:
> On Tue, May 27, 2025 at 1:14 PM Andrew Lunn <andrew@lunn.ch> wrote:
> >
> > On Tue, May 27, 2025 at 11:55:54AM -0600, James Hilliard wrote:
> > > Some devices like the Allwinner H616 need the ability to select a phy
> > > in cases where multiple PHY's may be present in a device tree due to
> > > needing the ability to support multiple SoC variants with runtime
> > > PHY selection.
> >
> > I'm not convinced about this yet. As far as i see, it is different
> > variants of the H616. They should have different compatibles, since
> > they are not actually compatible, and you should have different DT
> > descriptions. So you don't need runtime PHY selection.
> 
> Different compatibles for what specifically? I mean the PHY compatibles
> are just the generic "ethernet-phy-ieee802.3-c22" compatibles.

You at least have a different MTD devices, exporting different
clocks/PWM/Reset controllers. That should have different compatibles,
since they are not compatible. You then need phandles to these
different clocks/PWM/Reset controllers, and for one of the PHYs you
need a phandle to the I2C bus, so the PHY driver can do the
initialisation. So i think in the end you know what PHY you have on
the board, so there is no need to do runtime detection.

What you might want however is to validate the MTD device compatible
against the fuse and return -ENODEV if the compatible is wrong for the
fuse.

	Andrew

