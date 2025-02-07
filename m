Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9597C0219C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 15:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lIvRVDhUAojUHbrCWzuM16eBFe9BZTzTrRg0NCgYhfw=; b=x6s6PQ5+USK7EQhnEBnkx6BqGb
	bct4qrQS7J1q/BJgpCijkioufFf+Y2gCnfAhRGFYAbAE5ZIiTzN69cQAGWyp9R8uwd7Nww+dpNUcE
	7S6tb33N0FIJW1b3BqE7kbkb4vwdaIzXkEVVnUrnPKTCklGiDIqhZZpV5kB6+C+CTeWusv6blayBZ
	hPWtHbVRTviG+dQkpo6FN8nlt8gmLNWB+t4SaGYvy6HTDZrYHkkOqo8jWUv3IrMLlZdBuN8nLeNCt
	/gSDWsnJJyQRP1tRivjqxupseKrixyJ06cJ0H/f2Y7iXr+krUxwPKytdLqy4BTxjnlSFAaNJiuLUL
	d2JMtz5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgQd2-0000000AA1J-3NFE;
	Fri, 07 Feb 2025 15:50:52 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgQOo-0000000A60B-0g8x;
	Fri, 07 Feb 2025 15:36:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=lIvRVDhUAojUHbrCWzuM16eBFe9BZTzTrRg0NCgYhfw=; b=QXJn9+pIYGKd03PucI01BeMp8Y
	5trHss2ZdbBc3MQKAMPhqcoHCp+wJjozpeWlHkvJZJ5XFbCIils23LS3gU+n24HqCkhbfGGYeL8IN
	TIGwsyHhqyiOBU4YyPWfS19Zz4ZF3DMWez5Saro+smM5hZ6Yr2yqWJ6Y4V0orqCBPlCumiZkqCfdy
	uaLGSHQeWcdIBRfzAVDISDxzqwu8BNguF19exj8Kh5VUEF+7hTUxDtWy5OPwNIzp6hYRQmUwA9lp4
	Cte5hU9GaMVnsY/gxp3+TFMdBnAfmRo7cxT6Z/6Sn2WRgib+jCRwRVHjy0SvHmBu/vx+0XOWGzSir
	FEsQGZKg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:58702)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tgQMb-00065K-0Z;
	Fri, 07 Feb 2025 15:33:53 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tgQMU-0004YF-1T;
	Fri, 07 Feb 2025 15:33:46 +0000
Date: Fri, 7 Feb 2025 15:33:46 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	"David S. Miller" <davem@davemloft.net>,
	DENG Qingfang <dqfext@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Sean Wang <sean.wang@mediatek.com>,
	Simon Horman <horms@kernel.org>
Subject: Re: [PATCH net-next v2 2/3] net: dsa: allow use of phylink managed
 EEE support
Message-ID: <Z6Yn2jTVmbEmhPf9@shell.armlinux.org.uk>
References: <Z6YF4o0ED0KLqYS9@shell.armlinux.org.uk>
 <E1tgO70-003ilF-1x@rmk-PC.armlinux.org.uk>
 <20250207151959.jab2c36oejmdhf3k@skbuf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207151959.jab2c36oejmdhf3k@skbuf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_073610_199569_0905C365 
X-CRM114-Status: GOOD (  22.01  )
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

On Fri, Feb 07, 2025 at 05:19:59PM +0200, Vladimir Oltean wrote:
> On Fri, Feb 07, 2025 at 01:09:38PM +0000, Russell King (Oracle) wrote:
> > In order to allow DSA drivers to use phylink managed EEE, changes are
> > necessary to the DSA .set_eee() and .get_eee() methods. Where drivers
> > make use of phylink managed EEE, these should just pass the method on
> > to their phylink implementation without calling the DSA specific
> > operations.
> > 
> > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > ---
> >  net/dsa/user.c | 21 +++++++++++++--------
> >  1 file changed, 13 insertions(+), 8 deletions(-)
> > 
> > diff --git a/net/dsa/user.c b/net/dsa/user.c
> > index 291ab1b4acc4..2e0a51c1b750 100644
> > --- a/net/dsa/user.c
> > +++ b/net/dsa/user.c
> > @@ -1243,16 +1243,21 @@ static int dsa_user_set_eee(struct net_device *dev, struct ethtool_keee *e)
> >  	if (!ds->ops->support_eee || !ds->ops->support_eee(ds, dp->index))
> >  		return -EOPNOTSUPP;
> >  
> > -	/* Port's PHY and MAC both need to be EEE capable */
> > -	if (!dev->phydev)
> > -		return -ENODEV;
> > +	/* If the port is using phylink managed EEE, then get_mac_eee is
> > +	 * unnecessary.
> 
> You thanked me for spotting that this should have been set_mac_eee() in
> the comment, but you didn't update it.
> https://lore.kernel.org/netdev/Z4bC77mwoeypDAdH@shell.armlinux.org.uk/

Bah - actually I _did_ update the patch, but in a different tree:

http://git.armlinux.org.uk/cgit/linux-arm.git/commit/?h=net-queue&id=2ee2b1d5f0f8cee7dd748cfae9c20af429d5a4c2

I'm now looking at this wondering what updates were made in each tree
and therefore what I need to pass across between the two trees...

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

