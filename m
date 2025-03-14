Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9758AC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 19:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g9UiPlgUHg/BOEsx5e3OD0q6bWRlSXKycrwmYgrT/Zs=; b=yqh3o1g4mbMJPoCUOXcwkhDCZ8
	F4OviMKfubK7oETeM8wKsY5O4MEkzhXcs/gs5NlnRPoETjYM+GpbcrWnMHy00z6eOzXfBQ0iAUMUj
	1qDDdBrRRqyB4yp+KRId5iWAsVgukrSsRuWWLhvYrod0IDRMC7jv6X36sGiZbeLIgWL6kgOyz6cgr
	BC7hw7WWgpvzD1HkZP1g6iwrUsf+3DTd/iIMOhVVs5weJoW5SHawoWbtd9jAkcFsXhA8lMBeEmiKb
	+ispRZQrGeSt8YgoD7zJYOehXhjdrjMSA1rVbhEZZ7lqYsztwhwNiwehQcur9jF+i01LlgTZpRor9
	x10cArzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttB0r-0000000F9XY-2W7Z;
	Fri, 14 Mar 2025 19:48:09 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttAoI-0000000F8Pn-0GbY;
	Fri, 14 Mar 2025 19:35:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=g9UiPlgUHg/BOEsx5e3OD0q6bWRlSXKycrwmYgrT/Zs=; b=pQoRp/7P+Sr7BTNSui6T0CDG8p
	jN222Pv7h5IjEgKbvugzirzqLvVNQUI9zxKCuJIeyOnNOM4SE0lQy1k1Zc8iKo83nf1vgblKfhqrR
	96eHsQOxH+/mIY+dWa/H8z+bNST8C3BjfhE2kQhKlbB4jiUFe6KMtd9B3Kh7wvibDh68=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1ttAo6-005O1r-Na; Fri, 14 Mar 2025 20:34:58 +0100
Date: Fri, 14 Mar 2025 20:34:58 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Lee Jones <lee@kernel.org>
Cc: Christian Marangi <ansuelsmth@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	upstream@airoha.com
Subject: Re: [net-next PATCH v12 09/13] mfd: an8855: Add support for Airoha
 AN8855 Switch MFD
Message-ID: <49d2cfed-cb31-438d-9736-6d8e0bb24041@lunn.ch>
References: <20250309172717.9067-1-ansuelsmth@gmail.com>
 <20250309172717.9067-10-ansuelsmth@gmail.com>
 <20250314113551.GK3890718@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250314113551.GK3890718@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_123510_100127_430FCC6B 
X-CRM114-Status: GOOD (  17.75  )
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

> > +static int an8855_mii_set_page(struct an8855_mfd_priv *priv, u8 phy_id,
> > +			       u8 page) __must_hold(&priv->bus->mdio_lock)
> > +{
> > +	struct mii_bus *bus = priv->bus;
> > +	int ret;
> > +
> > +	ret = __mdiobus_write(bus, phy_id, AN8855_PHY_SELECT_PAGE, page);
> 
> Calling functions with '__' is a red flag.

In this case, it is correct. It was probably a bad decision to call
this __mdiobus_write() in the first place, but we were not expecting
it to be used in real driver code, just in core code, where calls to
it are wrapped with a mutex lock/unlock.

But drivers started to need to perform multiple read/write operations
in an atomic sequence, so they started doing there own taking of the
lock, and using these unlocked low level helpers.

We should probably rename __mdiobus_write() to _mdiobus_write() to
avoid compiler namespace issues.

> > +	if (ret < 0)
> > +		dev_err_ratelimited(&bus->dev,
> > +				    "failed to set an8855 mii page\n");
> 
> Use 100-chars if it avoids these kind of line breaks.

I _guess_ the code is following networking coding style, even though
it is outside of normal networking directories. netdev keeps with the
old 80 limit.

> > +static int an8855_regmap_read(void *ctx, uint32_t reg, uint32_t *val)
> > +{
> > +	struct an8855_mfd_priv *priv = ctx;
> > +	struct mii_bus *bus = priv->bus;
> > +	u16 addr = priv->switch_addr;
> > +	int ret;
> > +
> > +	mutex_lock_nested(&bus->mdio_lock, MDIO_MUTEX_NESTED);
> 
> guard()?

netdev people consider guard() too magical. scoped_guard() is however
O.K.

> > +	return ret < 0 ? ret : 0;
> 
> Doesn't the caller already expect possible >0 results?

It should not happen. Networking has a very small number of functions
which do return 1 on a different sort of success. Such functions are
generally called foo_changed(), e.g. mdiobus_modify_changed(). This
will do a read/modify/write. If it did not need to modify anything,
because of the current value, it will return 0. If something did
actually change, it returns 1. If something did actually change, you
sometimes need to take further actions. But many callers don't care,
so we have wrappers e.g. mdiobus_modify() calls
mdiobus_modify_changed() and then converts 0 or 1 to just 0. I'm
guessing this code copied such a helper when it should not of done.

	Andrew

