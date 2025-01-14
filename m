Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57EAAE77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 20:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8/+p16atLmySpxduQsu62Wnw8bJeS7JrfosUlk3O+CA=; b=F85ARC3V0kXSKiR7nklE0I5zb1
	u0SxHBD6JvEWvNY+CnE80X0dqgwyrk+tzZbjtMe8vDf92uWKBjkzOUD6jq4ruiCB8NHHtmG9IAI1Z
	Ek7mEjRrG6JgqvSay2DnGa9uozQQJ13HDoWY+d+UNfUrdvh0mMxhgPBGwt2gzbwGhzZcuSRWNuKGM
	dbDa88MEZ7IgRsTftR3/6xP6roGOMel7CxXSO1Ill57KQr+6XGpyqaMgJUxM2n+MnONG7yKcNLmim
	2SV1XTjfBWqfUE/EhKVAF2PRVvLYLZyi0A3JCIx78HTqKbHRbJmI7HeaEGqCdfIBw8lt3dAQofJy0
	3ajFPvfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXn9H-00000009cd0-1Mde;
	Tue, 14 Jan 2025 20:04:27 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXn81-00000009cPU-0KPr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 20:03:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=8/+p16atLmySpxduQsu62Wnw8bJeS7JrfosUlk3O+CA=; b=WI1twFnY6p36FUl9y0ukPubMsu
	YGK5qDbWdYT/D91y5+at4hWfw/rei5wIlmsYLys9tK3z9ed8a3pJImdulF7eU4HK2d48cHaW20ohg
	pwtdyDmArsz8GT0fjg+3Qt5fLhZk0siAD7D//0JOHV4VjJxThlxsykRaza6rTvKpdGGynUhQlJpNo
	SdVCdZ70RSlPT/DOGe8wYGnxpAEmuUK/+j5gSm6NDpZw5OetXV6l+oAUBzEI2mp+KmfPEIbj/1RxR
	S2ZMgJivpDA95lcve/H5DhKIcL29thhu8Sl2jnWh2qRnjmnU1LRFFI7Cd5LPdCh1VHDpc48N0gWzk
	BmtQbvSg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:44790)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tXn7r-0000Au-2N;
	Tue, 14 Jan 2025 20:02:59 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tXn7n-0005MB-3C;
	Tue, 14 Jan 2025 20:02:56 +0000
Date: Tue, 14 Jan 2025 20:02:55 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Bryan Whitehead <bryan.whitehead@microchip.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Marcin Wojtas <marcin.s.wojtas@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
	UNGLinuxDriver@microchip.com
Subject: Re: [PATCH RFC net-next 10/10] net: dsa: allow use of phylink
 managed EEE support
Message-ID: <Z4bC77mwoeypDAdH@shell.armlinux.org.uk>
References: <Z4ZtoeeHIXPucjUv@shell.armlinux.org.uk>
 <E1tXhVK-000n18-3C@rmk-PC.armlinux.org.uk>
 <20250114192656.l5xlipbe4fkirkq4@skbuf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250114192656.l5xlipbe4fkirkq4@skbuf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_120309_116669_2524DA59 
X-CRM114-Status: GOOD (  32.84  )
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

On Tue, Jan 14, 2025 at 09:26:56PM +0200, Vladimir Oltean wrote:
> On Tue, Jan 14, 2025 at 02:02:50PM +0000, Russell King (Oracle) wrote:
> > In order to allow DSA drivers to use phylink managed EEE, changes are
> > necessary to the DSA .set_eee() and .get_eee() methods. Where drivers
> > make use of phylink managed EEE, these should just pass the method on
> > to their phylink implementation without calling the DSA specific
> > operations.
> > 
> > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > ---
> 
> What is the reason for including this patch with this set, where
> it is of no use until at least one DSA driver provides the new API
> implementations?

No criticism against you, but I guess you didn't read the cover
message? I tend not to read cover messages. I've been wondering for a
while now whether anyone actually does and thus whether they are worth
the effort of writing anything beyond providing a message ID to tie a
series together and a diffstat for the series.

Here's the relevant bit:

"The remainder of the patches convert mvneta, lan743x and stmmac, add
support for mvneta, and add the basics that will be necessary into the
DSA code for DSA drivers to make use of this.

"I would like to get patches 1 through 9 into net-next before the
merge window, but we're running out of time for that."

So, it's included in this RFC series not because I'm intending it to
be merged, but so that people can see what DSA requires to make it
functional there, and provide review comments if they see fit - which
you have done, thanks.

I'm sure if I'd said "I have patches for DSA" you'd have responded
asking to see them!

Of course, I do have changes that will require this - mt753x - but
that patch is not quite ready because this series I've posted has seen
a few changes recently to remove stuff that was never settled (the
LPI timer questions, whether it should be validated, clamped, should
phylink provide a software timer if the LPI timer is out of range,
etc.) That's more proof that text in cover messages is utterly
useless!

> >  net/dsa/user.c | 25 ++++++++++++++++---------
> >  1 file changed, 16 insertions(+), 9 deletions(-)
> > 
> > diff --git a/net/dsa/user.c b/net/dsa/user.c
> > index c74f2b2b92de..6912d2d57486 100644
> > --- a/net/dsa/user.c
> > +++ b/net/dsa/user.c
> > @@ -1233,16 +1233,23 @@ static int dsa_user_set_eee(struct net_device *dev, struct ethtool_keee *e)
> >  	if (!ds->ops->support_eee || !ds->ops->support_eee(ds, dp->index))
> >  		return -EOPNOTSUPP;
> >  
> > -	/* Port's PHY and MAC both need to be EEE capable */
> > -	if (!dev->phydev)
> > -		return -ENODEV;
> > -
> > -	if (!ds->ops->set_mac_eee)
> > -		return -EOPNOTSUPP;
> > +	/* If the port is using phylink managed EEE, then get_mac_eee is
> 
> set_mac_eee() is what is unnecessary.

Thanks for spotting that.

> > +	 * unnecessary.
> > +	 */
> > +	if (!ds->phylink_mac_ops ||
> > +	    !ds->phylink_mac_ops->mac_disable_tx_lpi ||
> > +	    !ds->phylink_mac_ops->mac_enable_tx_lpi) {
> 
> Does it make sense to export pl->mac_supports_eee_ops wrapped into a
> helper function and call that here? To avoid making DSA too tightly
> coupled with the phylink MAC operation names.

I could wrap the test up in an inline function which would avoid the
duplication. Thanks for the suggestion.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

