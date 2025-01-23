Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA28AC0218B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 10:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z57cSE1YbxqFMvNXpCY9G1ml/Qmrt4h2lF0Z1wJAZeg=; b=AbP+s5BHJNOOMqSUIX36ExQF3N
	XVhFEhJx4MQTokT8outcE5HijhyVZq6NQoElo13QFmiEZGHnndmtHVlZoUutbwbOG7M6sos6EwyS0
	2/rb6s1sCbB4GNmtGwjfgGDnkuJBzZWtxVDC0/kHVyTzF+aPcFDYmGNuqBDLoXPPNTLAGgPZHy0S9
	3S/LhpsNtiyu4BEOrJv+8dqYKowEpxqb54MZjA+sL9SpMzt5owpH7E+tQkQcY6fRl+NTdvF5dTEda
	Lq/0TwyQl+NpkAe/twRwV67f1Zl4yQqp/RDYTIigg0T/wWV1cp6VG6yHCqL3vsrVZyOUP9Inxvzp4
	McrRbZQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taulF-0000000CFqR-3Uy2;
	Thu, 23 Jan 2025 10:48:33 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taujx-0000000CFin-090V
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jan 2025 10:47:14 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 33211E000C;
	Thu, 23 Jan 2025 10:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1737629228;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z57cSE1YbxqFMvNXpCY9G1ml/Qmrt4h2lF0Z1wJAZeg=;
	b=DUuzo9eHub7/9PHurqPsH7DVY2E29qZysu/JXIZMuv4LVRmHZ/6ECt7tt2VnNLXJ8aNBEH
	R78LqtD/c5I3LNz2jM/92soLfSDNIPPM5ibHpyBjO1fdyWXFT9gJRk60J18pmwOuoXYaqC
	JarofkUBD6J08p72p8SEVzURzJPyLC27BqGGutcCUADiDKWxPe7CZ3QqOXFcyvOWPsmRW8
	pSdoP8nSBStB+hrABkz+8Ib9Yzxqr1x0j89/qHoNet9qPbWjnd4GlI2fwcte6KT6/bxL0/
	7gKbf//tehBgA1qPdBCApsdvuWANLeTEO1C1EfEavc02x7DPVFb68LvC60LkBA==
Date: Thu, 23 Jan 2025 11:47:02 +0100
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: davem@davemloft.net, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 thomas.petazzoni@bootlin.com, Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski
 <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, linux-arm-kernel@lists.infradead.org, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Herve Codina <herve.codina@bootlin.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit
 <hkallweit1@gmail.com>, Vladimir Oltean <vladimir.oltean@nxp.com>,
 =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>, Marek
 =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>, Oleksij Rempel
 <o.rempel@pengutronix.de>, =?UTF-8?B?Tmljb2zDsg==?= Veronese
 <nicveronese@gmail.com>, Simon Horman <horms@kernel.org>,
 mwojtas@chromium.org, Antoine Tenart <atenart@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>
Subject: Re: [PATCH net-next RFC v2 1/6] net: ethtool: common: Make BaseT a
 4-lanes mode
Message-ID: <20250123114702.2c69f49f@fedora.home>
In-Reply-To: <Z5E_FUxSZJWRWVAq@shell.armlinux.org.uk>
References: <20250122174252.82730-1-maxime.chevallier@bootlin.com>
	<20250122174252.82730-2-maxime.chevallier@bootlin.com>
	<Z5E_FUxSZJWRWVAq@shell.armlinux.org.uk>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_024713_336723_958417EA 
X-CRM114-Status: GOOD (  19.33  )
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

Hello Russell,

On Wed, 22 Jan 2025 18:55:17 +0000
"Russell King (Oracle)" <linux@armlinux.org.uk> wrote:

> On Wed, Jan 22, 2025 at 06:42:46PM +0100, Maxime Chevallier wrote:
> > When referring to BaseT ethernet, we are most of the time thinking of
> > BaseT4 ethernet on Cat5/6/7 cables. This is therefore BaseT4, although
> > BaseT4 is also possible for 100BaseTX. This is even more true now that
> > we have a special __LINK_MODE_LANES_T1 mode especially for Single Pair
> > ethernet.
> > 
> > Mark BaseT as being a 4-lanes mode.  
> 
> This is a problem:
> 
> 1.4.50 10BASE-T: IEEE 802.3 Physical Layer specification for a 10 Mb/s
> CSMA/CD local area network over two pairs of twisted-pair telephone
> wire. (See IEEE Std 802.3, Clause 14.)
> 
> Then we have the 100BASE-T* family, which can be T1, T2, T4 or TX.
> T1 is over a single balanced twisted pair. T2 is over two pairs of
> Cat 3 or better. T4 is over four pairs of Cat3/4/5.
> 
> The common 100BASE-T* type is TX, which is over two pairs of Cat5.
> This is sadly what the ethtool 100baseT link modes are used to refer
> to.
> 
> We do have a separate link mode for 100baseT1, but not 100baseT4.
> 
> So, these ethtool modes that are of the form baseT so far are
> describing generally two pairs, one pair in each direction. (T1 is
> a single pair that is bidirectional.)
> 
> It's only once we get to 1000BASE-T (1000baseT) that we get to an
> ethtool link mode that has four lanes in a bidirectional fashion.
> 
> So, simply redefining this ends up changing 10baseT and 100baseT from
> a single lane in each direction to four lanes (and is a "lane" here
> defined as the total number of pairs used for communication in both
> directions, or the total number of lanes used in either direction.
> 
> Hence, I'm not sure this makes sense.
> 

I'm fine with your justification, so let's simplify and drop that
patch then. That should also avoid the lanes/pairs confusion as well.

Thanks for the feedback !

Maxime

