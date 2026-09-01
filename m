Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CD7AC624D2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 12:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+0OfScGfVNxdaLgqeCIO9xxQE676Gfne+cxN+29Fig8=; b=WCmrJkN2VkvhvgRt5jSnh4WRSk
	yji3MDJQ8pujRRpDQZtiThJB3N/3IUkpNA6vJSwzqUK9GuMk/Yxbf34bAVRqucoTWdzORUP4ffK+k
	ZHh56/I4Q7VRjTWF7Slem7J6ryUuaRW0d43rLkHupac+QGUK1A4n1ZN7iZ73E1jCAxXhMsKlOfuC5
	34fgCn/GnKFiLOnKRPxjBMeVghm/FI9cuX6nWOL6/xq+BUqBSzvqI80hlPkj8X95mqrTWvGmbAt3H
	jNgNqsL6zsEh0tUPVwzT3eQq9isXlN+YSsxRqJUb4Xj2f7VhF4263YaoV9YK3xGJdSCsQk3vQS1cv
	haeGPIew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Nkr-0000000C7r0-0LKd;
	Tue, 01 Sep 2026 12:38:21 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Nkp-0000000C7qf-0O3Y
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 12:38:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=+0OfScGfVNxdaLgqeCIO9xxQE676Gfne+cxN+29Fig8=; b=3z6MQ7zHSYBiydDAWot2oJhVD/
	GDe7TK+lnmOY85Sqt+n/sBofwbKjgHyS3dTAKQVTb824OD9zbjeyOfl2jNZ+f+fQ+i9jnDcajNEZt
	EMDdlqCd+n9TNqgAvxrAQR8gzup/rBm59gXvTDuUeQyo9ams3GKout1DxVcfNYb3grFs=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1x1Nkc-002M2c-CY; Tue, 01 Sep 2026 14:38:06 +0200
Date: Tue, 1 Sep 2026 14:38:06 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Nicolai Buchwitz <nb@tipi-net.de>, Andrew Lunn <andrew+netdev@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Russell King <linux@armlinux.org.uk>, thomas.petazzoni@bootlin.com,
	Alexis =?iso-8859-1?Q?Lothor=E9?= <alexis.lothore@bootlin.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH net-next 1/2] net: stmmac: dwmac4: Read the UC filter
 size from hardware capabilities
Message-ID: <96eae005-8be7-4d65-9461-8a8475e38089@lunn.ch>
References: <20260831070121.349778-1-maxime.chevallier@bootlin.com>
 <20260831070121.349778-2-maxime.chevallier@bootlin.com>
 <2631c832d5aebc56e152628132494545@tipi-net.de>
 <480f15e2-e045-46b7-89af-1fbcefd3c4eb@bootlin.com>
 <b2fbcec7-90ee-4a6f-bd15-32e4e1ff1a47@lunn.ch>
 <b677535a-5395-4703-aa08-a71a6b26ccb6@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b677535a-5395-4703-aa08-a71a6b26ccb6@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_053819_134695_213BEA84 
X-CRM114-Status: GOOD (  31.01  )
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

On Tue, Sep 01, 2026 at 09:04:28AM +0200, Maxime Chevallier wrote:
> 
> 
> On 9/1/26 02:26, Andrew Lunn wrote:
> >> Yeah but dwmac4 has a hash filter, but same as the UC filter it's just not plumbed
> >> in :/
> >>
> >> Let's leave this flag here, hash filter addition for MC filtering is coming-up, so let's not
> >> drop it now only to re-enable it after, one of the other wonderful discoveries found by
> >> running the selftests...
> > 
> > I assume you can put a MC address in a perfect match filter? You can
> > perfectly match a multicast address just as well as a unicast address.
> > 
> > The hash filter is less accurate, but again can be used to match a
> > unicast or multicast address, and then you need additional filtering
> > in software, which Linux will do.
> > 
> > So it seems to me, you should use a perfect match filters if you have
> > one available, independent of unicast or multicast, and only use a
> > hash filter if you have run out of perfect match filters.
> 
> That's an interesting point. The HW supports that, we have 3 control knobs
> for that in the MAC_PACKET_FILTER register :
> 
>  - HPF (bit 10) : Use Hash or Perfect Match for filtering.
>                   0 : Match UC and MC against hash filter
>                   1 : Match UC and MC according to HMC and HUC
> 
>  - HMC (bit 2) : Use Hash or Perfect Match for MC filtering
>                  0 : Match MC against perfect filter
>                  1 : Match MC against Hash table
> 
>  - HUC (bit 1) : Use Hash of PF for UC filtering
>                  0 : Match UC against PF
>                  1 : Match UC against Hash table
> 
> I don't know though how this all interacts with the primary MAC address. We
> always have one entry in PF for the device's own MAC address, we should
> probably always perfect match that one.

Yes, i agree, the primary should be a perfect match.

> But as the UC Perfect Filter toggle is global for All UC addresses it means
> we're stuck with perfect filter for all UC then ?

> For MC, this is a good point, but I'm worried about the complexity vs gain.
> 
> If we consider the 4 dwmac boards I have (may not be a very representative sample),
> we have :
> 
>  - imx8mp   : 64 PF (Perfect Fitler) entries
>  - jh7110   : 9 PF entries
>  - stm32mp1 : 4 PF entries
>  - yt6801   : 1 PF entry

I assume the imx8mp is using bank 1 and back 2? The designers of this
device seem to think the use cases for the device include lots of UC
and MC addresses.

Maybe, reserve bank 0 for UC, but allow both UC and MC in bank 1 and
2? That would allow imx8mp to make use of its hardware in an efficient
way, but it also keeps things simple and efficient for the more
restricted devices like the yt6801 and stm32mp1.

This discussion should however not effect this patchset. This sort of
optimisations can come later.

	Andrew

