Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97D2AE77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 08:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bR6G+K9Dutyc+IwAr+/OpGU5fx+TprPG1rZR3NvO4/8=; b=HLAImge9HyTISdad4bKFNIYU+d
	/t7Qc8fsF03lMGMSoqFjew3Ebmy9N7t3NMaxeCmXAFQqoKK46qb69XknBvlYqOf0fdiUGa7Qa1J/8
	pGrBnnQcV1cdZrQFtupQ9UuvpSwIgnE368BoI6Tsur3GE8bNaBB9A2sKVMW0dzYWn+9N6VFl9J+VS
	Kq3xyINFbap1cFwhYoDWu8TKpZ4n3K1FzRBeVdby05Dx3IBsixd/spVf7UDP2u98XaGeliFoGMQRp
	QbRD9wYcccahRmHavbpLoVoqbgdlmbc5vJX5wLnd8SJgbhSaenFGLBdJJYHqvp0Zm536DLprIeijy
	bHUG1g8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVRYx-00000007aip-0HZ9;
	Wed, 08 Jan 2025 08:37:15 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVQRH-00000007QI9-11DS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 07:25:16 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 344E71C0008;
	Wed,  8 Jan 2025 07:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736321110;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bR6G+K9Dutyc+IwAr+/OpGU5fx+TprPG1rZR3NvO4/8=;
	b=g59C+m/5OZoTSO6OJG3AkWUmnTY2aQONEWYLtTjP42JjbAM4v0ccqMpfvsDTcIX9sYhUfr
	mVtVuXIgBTv9l0vlVAmaDI8OvAEFy4CNsELSMPEj2/4YBu0OLzOr8iNdRynfTZvTDioV9+
	ct6MHCGW50DdU7vij3buGA5j2Q9gKlK7LgQto/xSrPiPCQESnnA9sRqPmcFmrZyubbTlI0
	Iwb7+CycqSbB/uE4Qd3reacU8tTnmF4NlEqLM9nDNtzdk1RloyzrdApGQRxvJ/aaqDzvo4
	SZXVThSzadr3dzxk8dX3lXyQt5O4gIl3/hMgJWvBDlXkUOK+e4qHAXQg6WLL8Q==
Date: Wed, 8 Jan 2025 08:25:07 +0100
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Andrew Lunn <andrew@lunn.ch>, "Russell King (Oracle)"
 <linux@armlinux.org.uk>, Kory Maincent <kory.maincent@bootlin.com>,
 davem@davemloft.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 thomas.petazzoni@bootlin.com, Jakub Kicinski <kuba@kernel.org>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 linux-arm-kernel@lists.infradead.org, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Herve Codina <herve.codina@bootlin.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit
 <hkallweit1@gmail.com>, Vladimir Oltean <vladimir.oltean@nxp.com>, Marek
 =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>, =?UTF-8?B?Tmljb2zDsg==?= Veronese
 <nicveronese@gmail.com>, Simon Horman <horms@kernel.org>,
 mwojtas@chromium.org, Antoine Tenart <atenart@kernel.org>
Subject: Re: [PATCH net-next RFC 0/5] net: phy: Introduce a port
 representation
Message-ID: <20250108082507.0402f158@fedora.home>
In-Reply-To: <Z31ZOjLcE34CNj0S@pengutronix.de>
References: <20241220201506.2791940-1-maxime.chevallier@bootlin.com>
	<Z2g3b_t3KwMFozR8@pengutronix.de>
	<Z2hgbdeTXjqWKa14@pengutronix.de>
	<Z3Zu5ZofHqy4vGoG@shell.armlinux.org.uk>
	<Z3bG-B0E2l47znkE@pengutronix.de>
	<20250107142605.6c605eaf@kmaincent-XPS-13-7390>
	<Z31EVPD-3CGGXxnq@shell.armlinux.org.uk>
	<20250107171507.06908d71@fedora.home>
	<601067b3-2f8a-4080-9141-84a069db276e@lunn.ch>
	<Z31ZOjLcE34CNj0S@pengutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_232515_682328_30307CDF 
X-CRM114-Status: GOOD (  19.27  )
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

On Tue, 7 Jan 2025 17:41:30 +0100
Oleksij Rempel <o.rempel@pengutronix.de> wrote:

> On Tue, Jan 07, 2025 at 05:22:51PM +0100, Andrew Lunn wrote:
> > >   I have however seen devices that have a 1G PHY connected to a RJ45
> > > port with 2 lanes only, thus limiting the max achievable speed to 100M.
> > > Here, we would explicietly describe the port has having 2 lanes.   
> 
> I can confirm existence of this kind of designs. One industrial real life
> example: a SoC connected to 3 port Gigabit KSZ switch. One port is
> typical RJ45 connector. Other port is RJ11 connector.
> 
> The speed can be reduced by using max-speed property. But i can't
> provide any user usable diagnostic information just by saying pair A or
> B is broken.
> 
> This is one of the reasons why i propose detailed description.

While I get the point, I'm wondering if it's relevant to expose this
diag information for the user. As this is a HW design feature we're
representing, and it's described in devicetree, the information that the
HW design is wrong or uncommon is already known. So, exposing this to
the user ends-up being a pretty way to display plain devicetree data,
without much added value from the PHY stack ? Or am I missing the point
?

I would see some value if we could detect that pairs are miswired or
disconnected at runtime, then report this to user. Here the information
is useful.

The minimal information needed by software is in that case "how many
working pairs are connected between the PHY and the connector", and
possibly "are they swapped ?" but I think we already have a DT property
for that ?

Maxime

